## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----basic-app----------------------------------------------------------------
# library(shiny)
# library(ggplot2)
# library(maidr)
# 
# # Define UI
# ui <- fluidPage(
#   titlePanel("MAIDR in Shiny - Basic Example"),
#   sidebarLayout(
#     sidebarPanel(
#       selectInput("plot_type",
#         "Choose Plot Type:",
#         choices = c("Bar Chart", "Histogram", "Scatter")
#       ),
#       br(),
#       p("The plot on the right is fully accessible with keyboard navigation and screen reader support.")
#     ),
#     mainPanel(
#       h3("Interactive Accessible Plot"),
#       maidr_output("accessible_plot", height = "500px")
#     )
#   )
# )
# 
# # Define Server
# server <- function(input, output) {
#   output$accessible_plot <- render_maidr({
#     if (input$plot_type == "Bar Chart") {
#       # Bar chart
#       bar_data <- data.frame(
#         Category = c("A", "B", "C", "D"),
#         Value = c(25, 40, 30, 35)
#       )
#       ggplot(bar_data, aes(x = Category, y = Value)) +
#         geom_bar(stat = "identity", fill = "steelblue") +
#         labs(title = "Sample Bar Chart") +
#         theme_minimal()
#     } else if (input$plot_type == "Histogram") {
#       # Histogram
#       hist_data <- data.frame(values = rnorm(500, mean = 100, sd = 15))
#       ggplot(hist_data, aes(x = values)) +
#         geom_histogram(bins = 30, fill = "coral", color = "black") +
#         labs(title = "Sample Histogram", x = "Values", y = "Frequency") +
#         theme_minimal()
#     } else {
#       # Scatter plot
#       scatter_data <- data.frame(
#         x = rnorm(50),
#         y = rnorm(50),
#         group = sample(c("Group A", "Group B"), 50, replace = TRUE)
#       )
#       ggplot(scatter_data, aes(x = x, y = y, color = group)) +
#         geom_point(size = 3, alpha = 0.7) +
#         labs(title = "Sample Scatter Plot") +
#         theme_minimal()
#     }
#   })
# }
# 
# # Run the app
# shinyApp(ui = ui, server = server)

## ----dashboard-app------------------------------------------------------------
# library(shiny)
# library(shinydashboard)
# library(ggplot2)
# library(maidr)
# 
# # Define UI
# ui <- dashboardPage(
#   dashboardHeader(title = "MAIDR Dashboard"),
#   dashboardSidebar(
#     sidebarMenu(
#       menuItem("Bar Charts", tabName = "bar", icon = icon("chart-bar")),
#       menuItem("Statistical Plots", tabName = "stats", icon = icon("chart-line")),
#       menuItem("Scatter Plots", tabName = "scatter", icon = icon("circle"))
#     )
#   ),
#   dashboardBody(
#     tabItems(
#       # Bar charts tab
#       tabItem(
#         tabName = "bar",
#         fluidRow(
#           box(
#             title = "Product Sales",
#             status = "primary",
#             solidHeader = TRUE,
#             width = 6,
#             maidr_output("bar_plot", height = "400px")
#           ),
#           box(
#             title = "Regional Comparison",
#             status = "primary",
#             solidHeader = TRUE,
#             width = 6,
#             maidr_output("dodged_bar_plot", height = "400px")
#           )
#         )
#       ),
# 
#       # Statistical plots tab
#       tabItem(
#         tabName = "stats",
#         fluidRow(
#           box(
#             title = "Distribution",
#             status = "primary",
#             solidHeader = TRUE,
#             width = 6,
#             maidr_output("histogram_plot", height = "400px")
#           ),
#           box(
#             title = "Box Plot Comparison",
#             status = "primary",
#             solidHeader = TRUE,
#             width = 6,
#             maidr_output("boxplot_plot", height = "400px")
#           )
#         )
#       ),
# 
#       # Scatter plots tab
#       tabItem(
#         tabName = "scatter",
#         fluidRow(
#           box(
#             title = "Correlation Analysis",
#             status = "primary",
#             solidHeader = TRUE,
#             width = 12,
#             maidr_output("scatter_plot", height = "500px")
#           )
#         )
#       )
#     )
#   )
# )
# 
# # Define Server
# server <- function(input, output) {
#   # Bar plot
#   output$bar_plot <- render_maidr({
#     sales_data <- data.frame(
#       Product = c("A", "B", "C", "D", "E"),
#       Sales = c(150, 230, 180, 290, 210)
#     )
# 
#     ggplot(sales_data, aes(x = Product, y = Sales)) +
#       geom_bar(stat = "identity", fill = "steelblue") +
#       labs(title = "Product Sales", x = "Product", y = "Sales Amount") +
#       theme_minimal()
#   })
# 
#   # Dodged bar plot
#   output$dodged_bar_plot <- render_maidr({
#     regional_data <- data.frame(
#       Region = rep(c("North", "South", "East"), each = 2),
#       Quarter = rep(c("Q1", "Q2"), 3),
#       Sales = c(100, 120, 150, 180, 90, 110)
#     )
# 
#     ggplot(regional_data, aes(x = Region, y = Sales, fill = Quarter)) +
#       geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
#       labs(title = "Regional Sales Comparison") +
#       theme_minimal()
#   })
# 
#   # Histogram
#   output$histogram_plot <- render_maidr({
#     hist_data <- data.frame(values = rnorm(1000, mean = 100, sd = 15))
# 
#     ggplot(hist_data, aes(x = values)) +
#       geom_histogram(bins = 30, fill = "coral", color = "black") +
#       labs(title = "Score Distribution", x = "Score", y = "Frequency") +
#       theme_minimal()
#   })
# 
#   # Boxplot
#   output$boxplot_plot <- render_maidr({
#     ggplot(iris, aes(x = Species, y = Petal.Length)) +
#       geom_boxplot(fill = "lightblue", alpha = 0.7) +
#       labs(title = "Petal Length by Species") +
#       theme_minimal()
#   })
# 
#   # Scatter plot
#   output$scatter_plot <- render_maidr({
#     scatter_data <- data.frame(
#       height = rnorm(100, 170, 10),
#       weight = rnorm(100, 70, 8),
#       gender = sample(c("Male", "Female"), 100, replace = TRUE)
#     )
# 
#     ggplot(scatter_data, aes(x = height, y = weight, color = gender)) +
#       geom_point(size = 3, alpha = 0.7) +
#       labs(
#         title = "Height vs Weight Analysis",
#         x = "Height (cm)",
#         y = "Weight (kg)"
#       ) +
#       theme_minimal()
#   })
# }
# 
# # Run the app
# shinyApp(ui = ui, server = server)

## ----reactive-app-------------------------------------------------------------
# library(shiny)
# library(ggplot2)
# library(maidr)
# 
# ui <- fluidPage(
#   titlePanel("Reactive MAIDR Plot"),
#   sidebarLayout(
#     sidebarPanel(
#       sliderInput("n_points",
#         "Number of Points:",
#         min = 10,
#         max = 200,
#         value = 50
#       ),
#       selectInput("distribution",
#         "Distribution:",
#         choices = c("Normal", "Uniform", "Exponential")
#       )
#     ),
#     mainPanel(
#       maidr_output("reactive_plot", height = "500px")
#     )
#   )
# )
# 
# server <- function(input, output) {
#   # Reactive data generation
#   plot_data <- reactive({
#     set.seed(123) # For reproducibility
# 
#     if (input$distribution == "Normal") {
#       data.frame(x = rnorm(input$n_points))
#     } else if (input$distribution == "Uniform") {
#       data.frame(x = runif(input$n_points, -3, 3))
#     } else {
#       data.frame(x = rexp(input$n_points, rate = 1) - 1)
#     }
#   })
# 
#   # Render plot
#   output$reactive_plot <- render_maidr({
#     ggplot(plot_data(), aes(x = x)) +
#       geom_histogram(bins = 30, fill = "skyblue", color = "black") +
#       labs(
#         title = paste(input$distribution, "Distribution"),
#         subtitle = paste("n =", input$n_points),
#         x = "Value",
#         y = "Frequency"
#       ) +
#       theme_minimal()
#   })
# }
# 
# shinyApp(ui = ui, server = server)

## ----height-example-----------------------------------------------------------
# # Good: Explicit height
# maidr_output("plot1", height = "500px")
# 
# # Also good: Responsive height
# maidr_output("plot2", height = "auto")

## ----context-example----------------------------------------------------------
# fluidRow(
#   box(
#     title = "Sales Trend Analysis",
#     status = "primary",
#     maidr_output("sales_plot"),
#     hr(),
#     p("This plot shows monthly sales trends. Use arrow keys to navigate through months.")
#   )
# )

## ----alt-text-example---------------------------------------------------------
# output$my_plot <- render_maidr({
#   p <- ggplot(data, aes(x, y)) +
#     geom_bar(stat = "identity") +
#     labs(
#       title = "Clear, Descriptive Title",
#       subtitle = "Additional context about the data",
#       x = "X-axis label with units",
#       y = "Y-axis label with units"
#     )
#   p
# })

## ----example-path, eval=FALSE-------------------------------------------------
# system.file("examples", "maidr_dashboard.R", package = "maidr")

