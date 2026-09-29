## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----install, eval=FALSE------------------------------------------------------
# # Install the released version from CRAN
# install.packages("maidr")
# 
# # Or the development version from GitHub:
# # install.packages("devtools")
# devtools::install_github("xability/r-maidr")

## ----ggplot2-example----------------------------------------------------------
# library(maidr)
# library(ggplot2)
# 
# # Create sample data
# sales_data <- data.frame(
#   Product = c("A", "B", "C", "D"),
#   Sales = c(150, 230, 180, 290)
# )
# 
# # Create a bar chart
# p <- ggplot(sales_data, aes(x = Product, y = Sales)) +
#   geom_bar(stat = "identity", fill = "steelblue") +
#   labs(
#     title = "Product Sales by Category",
#     x = "Product",
#     y = "Sales Amount"
#   ) +
#   theme_minimal()
# 
# # Display interactively
# show(p)
# 
# # Or save as HTML file
# save_html(p, "sales_chart.html")

## ----base-r-example-----------------------------------------------------------
# library(maidr)
# 
# # Create a simple barplot
# categories <- c("A", "B", "C", "D")
# values <- c(150, 230, 180, 290)
# 
# barplot(
#   values,
#   names.arg = categories,
#   col = "steelblue",
#   main = "Product Sales by Category",
#   xlab = "Product",
#   ylab = "Sales Amount"
# )
# 
# # Note: For Base R plots, call show() with NO arguments
# # after creating the plot
# show()

## ----htmlwidget-examples------------------------------------------------------
# library(maidr)
# 
# # plotly, including ggplotly()
# plotly::plot_ly(mtcars, x = ~wt, y = ~mpg, type = "scatter", mode = "markers") |>
#   maidr_htmlwidget()
# 
# # highcharter
# highcharter::hchart(mtcars, "scatter", highcharter::hcaes(wt, mpg)) |>
#   maidr_htmlwidget()
# 
# # echarts4r
# mtcars |>
#   echarts4r::e_charts(wt) |>
#   echarts4r::e_scatter(mpg) |>
#   maidr_htmlwidget()
# 
# # In Shiny, wrap the widget inside its own render function
# # output$chart <- plotly::renderPlotly(maidr_htmlwidget(plotly::plot_ly(...)))

## ----use-cdn-example----------------------------------------------------------
# library(maidr)
# library(ggplot2)
# 
# p <- ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
#   geom_bar(stat = "identity")
# 
# # Default - bundled files, works offline
# show(p)
# 
# # Force CDN (requires internet when viewing; loads the latest MAIDR.js)
# show(p, use_cdn = TRUE)
# 
# # Force bundled/local files (works offline)
# show(p, use_cdn = FALSE)

## ----save-html-cdn------------------------------------------------------------
# # One self-contained file; needs internet whenever it is viewed
# save_html(p, "plot_cdn.html", use_cdn = TRUE)
# 
# # The file plus a lib/ folder beside it; works offline
# save_html(p, "plot_offline.html", use_cdn = FALSE)

## ----cdn-version--------------------------------------------------------------
# # The version bundled with this package
# options(maidr.cdn_version = "bundled")
# 
# # A particular release
# options(maidr.cdn_version = "4.9.0")
# 
# # Back to the latest
# options(maidr.cdn_version = NULL)

## ----dotpad-sdk, eval = FALSE-------------------------------------------------
# options(
#   maidr.dotpad_sdk_url = "https://intranet.example/dotpad/DotPadSDK-3.0.3.js",
#   # Only if the braille engine (liblouis) is not in lib/ beside the module
#   maidr.dotpad_asset_base_url = "https://intranet.example/dotpad/lib/"
# )
# 
# save_html(p, "plot_offline.html", use_cdn = FALSE)

## ----histogram-example--------------------------------------------------------
# library(maidr)
# library(ggplot2)
# 
# # Normal distribution
# hist_data <- data.frame(values = rnorm(1000, mean = 100, sd = 15))
# 
# p <- ggplot(hist_data, aes(x = values)) +
#   geom_histogram(bins = 30, fill = "skyblue", color = "black") +
#   labs(
#     title = "Distribution of Test Scores",
#     x = "Score",
#     y = "Frequency"
#   ) +
#   theme_minimal()
# 
# show(p)

## ----scatter-example----------------------------------------------------------
# library(maidr)
# library(ggplot2)
# 
# # Create sample data
# scatter_data <- data.frame(
#   height = rnorm(50, 170, 10),
#   weight = rnorm(50, 70, 8),
#   gender = sample(c("Male", "Female"), 50, replace = TRUE)
# )
# 
# p <- ggplot(scatter_data, aes(x = height, y = weight, color = gender)) +
#   geom_point(size = 3, alpha = 0.7) +
#   labs(
#     title = "Height vs Weight",
#     x = "Height (cm)",
#     y = "Weight (kg)"
#   ) +
#   theme_minimal()
# 
# show(p)

## ----line-example-------------------------------------------------------------
# library(maidr)
# library(ggplot2)
# 
# # Time series data
# months <- month.abb[1:12]
# temperature <- c(5, 7, 12, 18, 22, 26, 28, 27, 23, 17, 11, 6)
# 
# temp_data <- data.frame(
#   Month = factor(months, levels = months),
#   Temperature = temperature
# )
# 
# p <- ggplot(temp_data, aes(x = Month, y = Temperature, group = 1)) +
#   geom_line(color = "red", linewidth = 1.5) +
#   geom_point(color = "darkred", size = 3) +
#   labs(
#     title = "Average Monthly Temperature",
#     x = "Month",
#     y = "Temperature (°C)"
#   ) +
#   theme_minimal()
# 
# show(p)

