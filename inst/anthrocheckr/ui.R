################################################################################
#
#
# This is a Shiny web application to support the implementation of health and
# nutrition coverage surveys in Liberia.
#
# This is the code for the user interface (UI) of the Shiny web application.
#
#
################################################################################


################################################################################
#
# UI for web application
#
################################################################################
#
# Define UI for application
#
ui <- dashboardPage(
  skin = "red",
  ## Header
  dashboardHeader(
    title = "anthrocheckr",
    titleWidth = 300),
  ## Sidebar
  dashboardSidebar(
    width = 300,
    #sidebarSearchForm(
    #  textId = "searchText",
    #  buttonId = "searchButton"
    #),
    ## Sidebar menu
    sidebarMenu(
      id = "tabs",
      #menuItem(text = "Instructions",
      #         tabName = "instructions",
      #         icon = icon(name = "pencil",
      #                     lib = "font-awesome",
      #                     class = "fa-lg")),
      menuItem(text = "Input",
               tabName = "input",
               icon = icon(name = "tablet",
                           lib = "font-awesome",
                           class = "fa-lg")),
      menuItem(text = "Results",
               tabName = "results",
               icon = icon(name = "line-chart",
                           lib = "font-awesome",
                           class = "fa-lg"))
    )
  ),
  ## Body
  dashboardBody(
    ## Specify a custom.css
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    ## Body outputs for every menu item on sidebar
    tabItems(
      ## Body output when 'instructions' menu is selected
      #tabItem(tabName = "instructions",
      #        fluidRow(
      #        )
      #),
      ## Body output when 'collect' menu is selected
      tabItem(tabName = "input",
        fluidRow(
          box(title = "Test parameters",
            solidHeader = TRUE,
            status = "primary",
            width = 4,
            checkboxGroupInput(inputId = "anthroChoices",
              label = "Choose measurements to check",
              choices = c("Weight" = "weight",
                          "Height" = "height",
                          "MUAC" = "muac"),
              selected = c("height", "weight", "muac"),
              inline = TRUE
            ),
            uiOutput("weightSlider"),
            uiOutput("heightSlider"),
            uiOutput("muacSlider"),
            sliderInput(inputId = "nEnumerators",
              label = "No. of enumerators who took test",
              min = 10,
              max = 50,
              value = 10,
              step = 1
            )
          ),
          box(title = "Input data",
            solidHeader = TRUE,
            status = "primary",
            width = 4,
            fileInput(inputId = "stdData",
              label = "Input file for standardisation test data",
              accept = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            ),
            uiOutput("analyseDataButton")
          )
        )
      ),
      ## Body output when 'results' menu is selected
      tabItem(tabName = "results",
        fluidRow(
          box(title = "Technical Error of Measurement (TEM)",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            DT::dataTableOutput("temTable"),
            uiOutput("saveButtonTEM")
          ),
          box(title = "Accuracy",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            DT::dataTableOutput("accuracyTable"),
            uiOutput("saveButtonAccuracy")
          )
        )
      )
    )
  )
)
