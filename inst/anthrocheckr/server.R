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
  output$descriptionImam <- renderUI({
    if("sam" %in% input$designIndicators) {
      withMathJax(
        HTML("
          <h4>SAM treatment coverage</h4>
          <p>SAM treatment coverage usually pertains to coverage of SAM treatment. SAM treatment coverage has two indicators:</p>
          <ul>
            <li>Case-finding effectiveness</li>
            $$\\begin{aligned}
            \\text{Case-finding effectiveness} & ~ = ~ \\frac{C_{in}}{C_{in} ~ + ~ C_{out}} \\\\
            \\\\
            where: & \\\\
            \\\\
            C_{in} & ~ = ~ \\text{current SAM cases in the programme} \\\\
            C_{out} & ~ = ~ \\text{current SAM cases out of the programme}
            \\end{aligned}$$
            <br/>
            <li>Treatment coverage</li>
            $$\\begin{aligned}
            \\text{Treatment coverage} & ~ = ~ \\frac{C_{in} ~ + ~ R_{in}}{C_{in} ~ + ~ R_{in} ~ + ~ C_{out} ~ + ~ R_{out}} \\\\
            \\\\
            where: & \\\\
            \\\\
            R_{in} & ~ = ~ \\text{Recovering SAM cases in the programme} \\\\
            R_{out} & ~ = ~ \\text{Recovering SAM cases not in the programme}
            \\end{aligned}$$
          </ul>
          <br/>
        ")
      )
    }
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

    weightTEM <- calculate_tem_cohort(
      m1 = dataStdLong()$measure_value[dataStdLong()$round == 1 & dataStdLong()$measure_type == "weight" & !is.na(dataStdLong()$measure_value)],
      m2 = dataStdLong()$measure_value[dataStdLong()$round == 2 & dataStdLong()$measure_type == "weight" & !is.na(dataStdLong()$measure_value)],
      index = dataStdLong()[dataStdLong()$round == 1 & dataStdLong()$measure_type == "weight" & !is.na(dataStdLong()$measure_value),
                            c("eid", "measure_type")],
      n = input$nWeight
    )

    heightTEM <- calculate_tem_cohort(
      m1 = dataStdLong()$measure_value[dataStdLong()$round == 1 & dataStdLong()$measure_type == "height" & !is.na(dataStdLong()$measure_value)],
      m2 = dataStdLong()$measure_value[dataStdLong()$round == 2 & dataStdLong()$measure_type == "height" & !is.na(dataStdLong()$measure_value)],
      index = dataStdLong()[dataStdLong()$round == 1 & dataStdLong()$measure_type == "height" & !is.na(dataStdLong()$measure_value),
                            c("eid", "measure_type")],
      n = input$nHeight
    )

    muacTEM <- calculate_tem_cohort(
      m1 = dataStdLong()$measure_value[dataStdLong()$round == 1 & dataStdLong()$measure_type == "muac" & !is.na(dataStdLong()$measure_value)],
      m2 = dataStdLong()$measure_value[dataStdLong()$round == 2 & dataStdLong()$measure_type == "muac" & !is.na(dataStdLong()$measure_value)],
      index = dataStdLong()[dataStdLong()$round == 1 & dataStdLong()$measure_type == "muac" & !is.na(dataStdLong()$measure_value),
                            c("eid", "measure_type")],
      n = input$nMUAC
    )

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
    options = list(scrollX = TRUE)
  )
  ##
  accuracyDF <- eventReactive(input$analyseData, {
    mean_measure <- summary_measure(x = dataStdLong()$measure_value,
                                    index = dataStdLong()[ , c("eid", "measure_type")])

    median_height <- median(dataStdLong()$measure_value[dataStdLong()$measure_type == "height"])
    median_muac <- median(dataStdLong()$measure_value[dataStdLong()$measure_type == "muac"])
    median_weight <- median(dataStdLong()$measure_value[dataStdLong()$measure_type == "weight"], na.rm = TRUE)

    biasDF <- data.frame("eid" = 1:31,
                         "height" = mean_measure[[1]]$height / median_height,
                         "muac" = mean_measure[[2]]$muac / median_muac,
                         "weight" = mean_measure[[3]]$weight / median_weight)

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

    biasClassDF <- data.frame("ID" = 1:31,
                              "height_bias" = biasDF$height,
                              height_class,
                              "weight_bias" = biasDF$weight,
                              weight_class,
                              "muac_bias" = biasDF$muac,
                              muac_class)
  })
  output$accuracyTable <- DT::renderDataTable(
    expr = accuracyDF(),
    options = list(scrollX = TRUE)
  )
}
