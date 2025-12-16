library(shiny)
library(ggplot2)
library(dplyr)

# UI Definition
ui <- fluidPage(
  
  # App Title
  titlePanel("Sample Size Determination: Stratified Sampling Design"),
  
  sidebarLayout(
    sidebarPanel(
      h4("1. Experiment Parameters"),
      numericInput("num_subgroups", "Number of Subgroups (Strata):", value = 4, min = 1),
      numericInput("pop_std_dev", "Est. Standard Deviation within Subgroups:", value = 15),
      
      h4("2. Constraints & Targets"),
      numericInput("bias", "Acceptable Sampling Bias (Margin of Error):", value = 2.0, step = 0.1),
      selectInput("conf_level", "Confidence Level:", 
                  choices = c("90%" = 1.645, "95%" = 1.96, "99%" = 2.576), 
                  selected = 1.96),
      
      h4("3. Resource Estimates (Per Unit)"),
      numericInput("cost_per_unit", "Expected Cost per Unit ($):", value = 10),
      numericInput("time_per_unit", "Expected Time per Unit (mins):", value = 5),
      
      hr(),
      helpText("Note: This calculator assumes Neyman/Optimal allocation logic where subgroup variances are roughly equal.")
    ),
    
    mainPanel(
      # Top Row: Key Metrics
      fluidRow(
        column(4, 
               wellPanel(
                 h3(textOutput("total_n")),
                 p("Required Sample Size")
               )
        ),
        column(4, 
               wellPanel(
                 h3(textOutput("total_cost")),
                 p("Total Expected Cost")
               )
        ),
        column(4, 
               wellPanel(
                 h3(textOutput("total_time")),
                 p("Total Expected Time")
               )
        )
      ),
      
      # Middle Row: Design Plot
      h4("Design of Experiment: Sensitivity Analysis"),
      p("The curve below shows how increasing sample size reduces sampling bias."),
      plotOutput("design_plot"),
      
      # Bottom Row: Subgroup Allocation
      br(),
      h4("Subgroup Allocation Plan"),
      tableOutput("allocation_table")
    )
  )
)

# Server Logic
server <- function(input, output) {
  
  # Reactive calculation for Sample Size (n)
  # Formula: n = (Z * sigma / E)^2
  # We apply a design effect factor (deff) of 1 for simple stratification
  calculated_values <- reactive({
    z_score <- as.numeric(input$conf_level)
    sigma <- input$pop_std_dev
    E <- input$bias
    
    # Calculate total required n
    n_required <- ceiling((z_score * sigma / E)^2)
    
    # Calculate resources
    total_cost <- n_required * input$cost_per_unit
    total_time <- n_required * input$time_per_unit
    
    list(n = n_required, cost = total_cost, time = total_time)
  })
  
  # Output: Text Metrics
  output$total_n <- renderText({ paste(calculated_values()$n) })
  output$total_cost <- renderText({ paste0("$", format(calculated_values()$cost, big.mark=",")) })
  output$total_time <- renderText({ 
    mins <- calculated_values()$time
    paste(round(mins/60, 1), "Hours") 
  })
  
  # Output: Design Plot (Bias vs Sample Size trade-off)
  output$design_plot <- renderPlot({
    vals <- calculated_values()
    z_score <- as.numeric(input$conf_level)
    sigma <- input$pop_std_dev
    
    # Generate data for the curve
    possible_n <- seq(from = 10, to = vals$n * 2, length.out = 100)
    possible_error <- (z_score * sigma) / sqrt(possible_n)
    
    df_plot <- data.frame(n = possible_n, error = possible_error)
    
    ggplot(df_plot, aes(x = n, y = error)) +
      geom_line(color = "#2c3e50", size = 1.2) +
      geom_point(aes(x = vals$n, y = input$bias), color = "red", size = 4) +
      geom_vline(xintercept = vals$n, linetype = "dashed", color = "red") +
      geom_hline(yintercept = input$bias, linetype = "dashed", color = "red") +
      labs(x = "Sample Size (n)", y = "Sampling Bias (Margin of Error)",
           title = "Cost-Benefit Analysis: Error vs. Sample Size") +
      theme_minimal() +
      annotate("text", x = vals$n, y = input$bias, 
               label = paste(" Current Design\n n =", vals$n), 
               vjust = -1, hjust = -0.1, color = "red")
  })
  
  # Output: Allocation Table
  output$allocation_table <- renderTable({
    vals <- calculated_values()
    k <- input$num_subgroups
    
    # Equal allocation for demonstration (can be changed to proportional if population sizes known)
    n_per_group <- floor(vals$n / k)
    remainder <- vals$n %% k
    
    # Create table
    df <- data.frame(
      Subgroup_ID = 1:k,
      Allocation_n = n_per_group,
      Est_Cost = n_per_group * input$cost_per_unit,
      Est_Time_Mins = n_per_group * input$time_per_unit
    )
    
    # Distribute remainder to first few groups
    if(remainder > 0) {
      df$Allocation_n[1:remainder] <- df$Allocation_n[1:remainder] + 1
    }
    
    df
  })
}

# Run the App
shinyApp(ui = ui, server = server)