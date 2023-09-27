# Une app shiny aidant à la visualisation d'une série de graphiques exportés.
# 
# Exemple : 
#
# 3 graphiques chart1, chart2, chart3 sur une série de villes
# Fichiers dans le répertoire: 
#   - paris_chart1.png, paris_chart3.png, paris_chart3.png
#   - lyon_chart1.png, lyon_chart3.png, lyon_chart3.png
#

library(shiny)

############################################
#### A RENSEIGNER AVANT DE LANCER L'APP ####
location = '..'
#regex = "(?<group>[A-Z0-9 \\.]{5,5}-[0-9]{3,3})_(?<chart>[A-Z_]*).png"
regex = "(?<chart>balance)_(?<group>[A-Z0-9\\-_ \\.]*).png"
############################################
############################################

shiny::addResourcePath('charts', location)

ui <- fluidPage(

  div(
    style="margin: 30px;",
    fluidRow(
      column(6, textInput("regex", "Expression régulière", value = regex, width = "100%")),
      column(6, sliderInput("width", "Taille images", 100, 1000, 400, 50, width = "100%"))),
    fluidRow(
      selectInput('groups', "Groupes", choices = c(), width = "100%")),
    fluidRow(
      selectInput('charts', "Graphiques", choices = c(), width = "100%", multiple = TRUE)),
    hr(style="margin-bottom: 60px;"),
    fluidRow(
      uiOutput('charts')))
  
)


server <- function(input, output, session) {

  charts <- reactiveVal(NULL)
  
  observe({
    files = list.files(location)
    # charts = stringr::str_match(files, regex)
    parsed = stringr::str_match(files, input$regex)
    charts(parsed)
    
    groups = as.character(na.omit(unique(parsed[, "group"])))
    if(length(groups) == 0){
      showModal(modalDialog(
        title = "Problème de regex ?",
        "Aucune instance de graphique trouvé !"))
    } else {
      updateSelectInput(
        session=session, inputId='groups',
        choices=groups)  
    }
    
    chartnames = as.character(na.omit(unique(parsed[, "chart"])))
    if(length(chartnames) == 0){
      showModal(modalDialog(
        title = "Problème de regex ?",
        "Aucun type de graphique trouvé !"))
    } else {
      updateSelectInput(
        session=session, inputId='charts', 
        choices=chartnames, selected = chartnames)
    }
  })

  output$charts <- renderUI({
    if(nchar(input$groups) == 0) return(NULL)
    
    sel = (charts()[, 'group'] == input$groups) & (charts()[, 'chart'] %in% input$charts)
    
    sel_fname = charts()[sel, 1]
    sel_cname = charts()[sel, 'chart']
    
    sel = as.character(na.omit(sel_fname))
    names(sel) = sel_cname
    sel = unname(sel[input$charts])
    sel = paste0('charts/', sel)
    
    imgs = lapply(sel, function(x) tags$img(src=x, width=input$width))
    return(do.call(fluidRow, imgs))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
