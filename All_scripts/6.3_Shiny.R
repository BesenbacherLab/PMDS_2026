########
#
# Shiny Apps
#
########

################################################################################
#### SECTION 1: Install Shiny ####
################################################################################

# WHAT IS SHINY?
# Shiny is an R package that makes it easy to build interactive web applications
# (apps) straight from R. This lesson will get you started building Shiny apps
# right away.

# Run the following line to install the Shiny package:
install.packages("shiny")

################################################################################
#### SECTION 2: Run Example ####
################################################################################


# The Shiny package has eleven built-in examples that each demonstrate how Shiny
# works. Each example is a self-contained Shiny app.

# The Hello Shiny example plots a histogram of R’s faithful dataset with a
# configurable number of bins. Users can change the number of bins with a slider
# bar, and the app will immediately respond to their input. You’ll use Hello
# Shiny to explore the structure of a Shiny app and to create your first app.

# To run Hello Shiny, type:

library(shiny)
runExample("01_hello")

# This should open a pop-up with the app.

################################################################################
#### SECTION 3: Structure of a Shiny App ####
################################################################################

# Shiny apps are contained in a single script called app.R. The script app.R
# lives in a directory (for example, ShinyTest/) and the app can be run with
# runApp("ShinyTest").

# app.R has three components:
# - a user interface object
# - a server function
# - a call to the shinyApp function

# The user interface (ui) object controls the layout and appearance of your app.
# The server function contains the instructions that your computer needs to
# build your app. Finally the shinyApp function creates Shiny app objects from
# an explicit UI/server pair.

################################################################################
#### SECTION 4: EXAMPLE UI OBJECT ####
################################################################################

# Here is the ui object for the Hello Shiny example:

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  title = "Hello Shiny!",
  sidebar = sidebar(
    sliderInput(
      inputId = "bins",
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    )
  ),
  plotOutput(outputId = "distPlot")
)

################################################################################
#### SECTION 5: EXAMPLE SERVER FUNCTION ####
################################################################################

# Here is a ggplot version of the server function for the Hello Shiny example.

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    faithful |>
      ggplot(aes(x=waiting)) +
      geom_histogram(bins=input$bins) +
      xlab("Waiting time to next eruption (in mins)") +
      theme_bw()
  })
}

# At one level, the Hello Shiny server function is very simple. The script does
# some calculations and then plots a histogram with the requested number of
# bins.

# However, you’ll also notice that most of the script is wrapped in a call to
# renderPlot. The comment above the function explains a bit about this, but if
# you find it confusing, don’t worry. We’ll cover this concept in much more
# detail soon.

################################################################################
#### SECTION 6: MAKE YOUR OWN  ####
################################################################################

# In the ShinyTest directory there is an app.R file with a template for a
# Shiny app. But the description of the UI object and server function needs to
# be filled out.

# EXERCISE A:
# Fill in the UI object and server function in ShinyTest/app.R by copy pasting
# the code from the examples above and then try to run it by clicking the
# "Run App" button.

# Your R session will be busy while the Hello Shiny app is active, so you will
# not be able to run any R commands. R is monitoring the app and executing the
# app’s reactions. To get your R session back, close the app or click the stop
# sign icon (found in the upper right corner of the RStudio console panel).

# EXERCISE B:
# Change the title from "Hello Shiny!" to "Hello World!".

# After you have made the changes you can test if it worked by running the app
# again.

# EXERCISE C:
# Set the minimum value of the slider bar to 5.

# EXERCISE D:
# Change color of the histogram by setting fill to "red" and color to "black"

################################################################################
#### SECTION 7: MORE EXAMPLES  ####
################################################################################

# You can create Shiny apps by copying and modifying existing Shiny apps. The
# Shiny gallery provides some good examples:
# https://shiny.posit.co/r/gallery/
# Or use the eleven pre-built Shiny examples listed below:

runExample("01_hello")      # a histogram
runExample("02_text")       # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg")        # global variables
runExample("05_sliders")    # slider bars
runExample("06_tabsets")    # tabbed panels
runExample("07_widgets")    # help text and submit buttons
runExample("08_html")       # Shiny app built from HTML
runExample("09_upload")     # file upload wizard
runExample("10_download")   # file download wizard
runExample("11_timer")      # an automated timer
