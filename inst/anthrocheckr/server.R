################################################################################
#
#
#
# This is a Shiny web application to support the implementation of health and
# nutrition coverage surveys in Liberia.
#
# This code is for the server logic function of the Shiny web aplication.
#
#
################################################################################


################################################################################
#
# Server logic for web application
#
################################################################################
#
# Define server logic for application
#
server <- function(input, output, session) {
  ## Create ui for slider inputs
  output$weightSlider <- renderUI({
    req("weight" %in% input$anthroChoices)
    sliderInput(inputId = "nWeight",
      label = "No. of children measured for weight",
      min = 5,
      max = 20,
      value = 10,
      step = 1
    )
  })
  ## Create ui for slider inputs (height)
  output$heightSlider <- renderUI({
    req("height" %in% input$anthroChoices)
    sliderInput(inputId = "nHeight",
      label = "No. of children measured for height",
      min = 5,
      max = 20,
      value = 10,
      step = 1
    )
  })
  ## Create ui for slider inputs (MUAC)
  output$muacSlider <- renderUI({
    req("muac" %in% input$anthroChoices)
    sliderInput(inputId = "nMUAC",
      label = "No. of children measured for MUAC",
      min = 5,
      max = 20,
      value = 10,
      step = 1
    )
  })
  ## Read uploaded data for standardisation measurements
  dataStd <- reactive({
    x <- input$stdData
    if(is.null(x)) return(NULL)
    sheet1 <- read_excel(path = x$datapath, sheet = 1)
    sheet2 <- read_excel(path = x$datapath, sheet = 2)

    sheet1 <- sheet1[ , 1:6]
    sheet2 <- sheet2[ , 1:6]
    dataStd <- merge(sheet1, sheet2, by = c("eid", "cid"))
  })
  ## Read uploaded data for standardisation measurements - long format
  dataStdLong <- reactive({
    x <- input$stdData
    if(is.null(x)) return(NULL)
    sheet1 <- read_excel(path = x$datapath, sheet = 1)
    sheet2 <- read_excel(path = x$datapath, sheet = 2)

    xx <- gather(sheet1, key = "measure_type", value = "measure_value", weight:muac)
    yy <- gather(sheet2, key = "measure_type", value = "measure_value", weight:muac)

    dataStdLong <- data.frame(rbind(xx, yy))
  })
  ## Action button to analyse data
  output$analyseDataButton <- renderUI({
    req(input$stdData)
    actionButton(inputId = "analyseData",
      label = "Analyse",
      class = "btn-primary",
      icon = icon(name = "line-chart",
                  class = "fa-lg")
    )
  })
  ## Calculate TEM
  temDF <- eventReactive(input$analyseData, {

    weightTEM <- rep(NA, input$nEnumerators)

    if("weight" %in% input$anthroChoices) {
      weightTEM <- calculate_tem_cohort(
        m1 = dataStd()$weight.x,
        m2 = dataStd()$weight.y,
        index = dataStd()[ , "eid"],
        n = input$nWeight)
    }

    heightTEM <- rep(NA, input$nEnumerators)

    if("height" %in% input$anthroChoices) {
      heightTEM <- calculate_tem_cohort(
        m1 = dataStd()$height.x,
        m2 = dataStd()$height.y,
        index = dataStd()[ , "eid"],
        n = input$nHeight)
    }

    muacTEM <- rep(NA, input$nEnumerators)

    if("muac" %in% input$anthroChoices) {
      muacTEM <- calculate_tem_cohort(
        m1 = dataStd()$muac.x,
        m2 = dataStd()$muac.y,
        index = dataStd()[ , "eid"],
        n = input$nMUAC)
    }

    resultsDF <- data.frame(weightTEM, heightTEM, muacTEM)

    height_class_value <- c("Good", "Acceptable", "Poor", "Reject")
    height_class <- height_class_value[findInterval(x = resultsDF$height,
                                                    vec = c(0, 0.4, 0.6, 1),
                                                    rightmost.closed = FALSE)]

    weight_class_value <- c("Good", "Acceptable", "Poor", "Reject")
    weight_class <- weight_class_value[findInterval(x = resultsDF$weight,
                                                    vec = c(0, 0.04, 0.1, 0.21),
                                                    rightmost.closed = FALSE)]

    muac_class_value <- c("Good", "Acceptable", "Poor", "Reject")
    muac_class <- muac_class_value[findInterval(x = resultsDF$muac,
                                                vec = c(0, 2, 2.7, 3.3),
                                                rightmost.closed = FALSE)]

    resultsClassDF <- data.frame("height_tem" = resultsDF$height,
                                 height_class,
                                 "weight_tem" = resultsDF$weight,
                                 weight_class,
                                 "muac_tem" = resultsDF$muac,
                                 muac_class)
  })
  output$temTable <- DT::renderDataTable(
    expr = temDF(),
    options = list(scrollX = TRUE, pageLength = input$nEnumerators)
  )
  ## Create UI action button for saving data - TEM
  output$saveButtonTEM <- renderUI({
    req(input$analyseData)
    downloadButton(outputId = "saveDataTEM",
      label = "Save TEM results",
      class = "btn btn-inverse btn-primary",
      icon = icon(name = "download",
                  lib = "font-awesome",
                  class = "fa-lg")
    )
  })
  ## Download data
  output$saveDataTEM <- downloadHandler(
    filename = function() {
        paste("tem-", Sys.Date(), ".xlsx", sep = "")
    },
    content = function(file) {
        openxlsx::write.xlsx(x = temDF(), file = file)
    }
  )
  ##
  accuracyDF <- eventReactive(input$analyseData, {
    mean_measure_height <- summary_measure(df = dataStdLong()[dataStdLong()$measure_type == "height", ],
                                           measures = "measure_value",
                                           index = c("eid", "cid"))

    mean_height <- summary_measure(df = dataStdLong()[dataStdLong()$measure_type == "height", ],
                                   measures = "measure_value",
                                   index = "cid")

    biasHeight <- estimate_bias(msur = mean_measure_height,
                                msur = NA, mall = mean_height)$bias_med

    mean_measure_weight <- summary_measure(df = dataStdLong()[dataStdLong()$measure_type == "weight", ],
                                           measures = "measure_value",
                                           index = c("eid", "cid"))

    mean_weight <- summary_measure(df = dataStdLong()[dataStdLong()$measure_type == "weight", ],
                                   measures = "measure_value",
                                   index = "cid")

    biasWeight <- estimate_bias(msur = mean_measure_weight,
                                msur = NA, mall = mean_weight)$bias_med

    mean_measure_muac <- summary_measure(df = dataStdLong()[dataStdLong()$measure_type == "muac", ],
                                         measures = "measure_value",
                                         index = c("eid", "cid"))

    mean_muac <- summary_measure(df = dataStdLong()[dataStdLong()$measure_type == "muac", ],
                                 measures = "measure_value",
                                 index = "cid")

    biasMUAC <- estimate_bias(msur = mean_measure_muac,
                              msur = NA, mall = mean_muac)$bias_med

    biasDF <- data.frame("eid" = 1:input$nEnumerators,
                         "height" = rowMeans(biasHeight, na.rm = TRUE),
                         "muac" = rowMeans(biasMUAC, na.rm = TRUE),
                         "weight" = rowMeans(biasWeight, na.rm = TRUE))

    height_class_value <- c("Good", "Acceptable", "Poor", "Reject")
    height_class <- height_class_value[findInterval(x = biasDF$height,
                                                    vec = c(0, 0.4, 0.6, 1.4),
                                                    rightmost.closed = FALSE)]

    weight_class_value <- c("Good", "Acceptable", "Poor", "Reject")
    weight_class <- weight_class_value[findInterval(x = biasDF$weight,
                                                    vec = c(0, 0.04, 0.1, 0.21),
                                                    rightmost.closed = FALSE)]

    muac_class_value <- c("Good", "Acceptable", "Poor", "Reject")
    muac_class <- muac_class_value[findInterval(x = biasDF$muac,
                                                vec = c(0, 1, 2, 3),
                                                rightmost.closed = FALSE)]

    biasClassDF <- data.frame("ID" = 1:input$nEnumerators,
                              "height_bias" = biasDF$height,
                              height_class,
                              "weight_bias" = biasDF$weight,
                              weight_class,
                              "muac_bias" = biasDF$muac,
                              muac_class)
  })
  output$accuracyTable <- DT::renderDataTable(
    expr = accuracyDF(),
    options = list(scrollX = TRUE, pageLength = input$nEnumerators)
  )
  ## Create UI action button for saving data
  output$saveButtonAccuracy <- renderUI({
    req(input$analyseData)
    downloadButton(outputId = "saveDataAccuracy",
      label = "Save accuracy results",
      class = "btn btn-inverse btn-primary",
      icon = icon(name = "download",
                  lib = "font-awesome",
                  class = "fa-lg")
    )
  })
  ## Download data - Accuracy
  output$saveDataAccuracy <- downloadHandler(
    filename = function() {
      paste("accuracy-", Sys.Date(), ".xlsx", sep = "")
    },
    content = function(file) {
      openxlsx::write.xlsx(x = accuracyDF(), file = file)
    }
  )
}
