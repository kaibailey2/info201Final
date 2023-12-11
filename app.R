# Kai Bailey & Zhi Chen
# kaiba@uw.edu
# INFO 201 Au 2023 Section BB
# Final Project -- Final Deliverable
library(shiny)
library(leaflet)
library(sf)
library(shinyWidgets)
library(ggplot2)
library(plotly)


# Load your data
df <- readRDS("data.rds")
df$Ranking <- as.numeric(as.character(df$Ranking))
summary <- readRDS("summary.rds")

# Define UI
ui <- fluidPage(
  navbarPage(
    "Project Overview",
    tabPanel("Intro",
             fluidPage(
               # Sidebar on the right with the information paragraph and data sources
                 mainPanel(
                   # Add your introductory content, images, and links here
                   h1("Unveiling Seattle's Affordable Housing Landscape"),
                   
                   # Two spots for links at the bottom
                   fluidRow(
                     column(width = 4,
                            # Use HTML tags to create a hyperlink
                            p(HTML("Data Source 1: <a href='https://data.census.gov/table?q=dp05&g=040XX00US53,53$1400000'>ACS Data</a>"))
                     ),
                     column(width = 4,
                            # Use HTML tags to create a hyperlink
                            p(HTML("Data Source 2: <a href='https://data-wa-geoservices.opendata.arcgis.com/datasets/WADOH::unaffordable-housing-current-version/about'>Affordable Housing Data</a>"))
                     )
                   ),
                   
                   # New fluid row for the image, using the entire sixth column
                   fluidRow(
                     column(width = 6, 
                            p(style = "font-size: 16px; text-align: justify;",
                                      "Seattle has a rich history, marked by the complexities of gentrification and redlining, especially in the Central District. This project utilizes ACS Data and Affordable Housing Data to scrutinize affordable housing disparities across census tracts. The goal is to expose the repercussions of discriminatory housing and financial practices, shaping more equitable public policies for Seattle residents. Anticipated outcomes include insights into the racial wealth gap, as homeownership, a key wealth driver, exhibits stark disparities. While overall homeownership rates reached 65.5% in 2021, Black Americans lag at 44%, rising by a mere 0.4% in a decade. In contrast, White Americans boast a 29-point gap with a homeownership rate of nearly 72.7%. The American housing market's unpredictability, driven by factors like the pandemic and inflation, adds a layer of complexity. Understanding these dynamics is crucial as they impact affordability and housing accessibility. The National Foundation for Credit Counseling advocates the '30% Rule' for housing expenses, advising households not to spend more than 30% of their income on housing. However, this threshold is frequently breached, limiting finances for emergency funds, savings, and investments.")
                     ),
                     # Shiny limits the columns that you can push since it has a locked 6,6 or 4,8 grid layout. I do not want to use Shiny layout templates because they don't fit with my project.
                     column(width = 6, push = 2,
                            imageOutput("spaceNeedleImage", height = "90vh", width = "100%")
                     )
                   )
                 ),
               )
    ),
    tabPanel("Maps",
             fluidPage(
               fluidRow(
                 # Sidebar on the left
                 column(width = 3,
                        sliderTextInput("mapSlider", "Select Map:",
                                        choices = c("Black Population Percentage", "30% Rule"),
                                        selected = "Black Population Percentage",
                                        width = "100%"),
                        textOutput("mapExplanation"),  # Add a text box for map explanation
                        HTML("<div>
                             <h2>Black Population Percentage Map</h2>
                             <ul>
                               <p>This map shows the Black Population Percentage for</p>
                               <p>every census tract in Seattle. You can <span style='color: red;'>hover</span></p>
                               <p>over a census tract to reveal it's exact percentage.</p>
                               <p>Take a look and explore the map and use the <span style='color: green;'>slider</span></p>
                               <p>at the top of the page to change the map.</p>
                             </ul>
                           </div>"
                        ),
                        HTML("<div>
                            <h2>30% Rule Map</h2>
                            <ul>
                               <p>This map shows the percentage of people spending</p>
                               <p>more than 30% of their income on housing, more on
                               that on the next tab.</p>
                               <p><span style='color: red;'>Hover</span> over a census tract to reveal</p>
                               <p>this metric. Notice how the UW census tract</p>
                               <p>is extremely high because college students</p>
                               <p>don't have a very stable income most of the time.</p>
                             </ul>
                           </div>"
                        )
                        
                 ),
                 # Map on the right
                 column(width = 9,
                        leafletOutput("map", height = "90vh")  # Set map height to fill the entire screen
                        # Add your interactive map content here
                 )
               )
             )
    ),
    tabPanel("Rankings",
             fluidPage(
               splitLayout(
                 # Plot taking up the entire left side
                 plotlyOutput("rankingPlot", height = "90vh"),
                 # Sidebar on the right
                 column(width = 3,
                        # Add content for the sidebar here
                        HTML("<h2>Notes:</h2>
                          <ul>
                            <p>There were some major complications with the interactive legend for this plot.</p>
                            <p>The colored legend entries are meant to be the ranks (ignore the ,1).</p>
                            <p>The green-dashed line was meant to be titled Mean Black Population Percentage in Seattle.</p>
                            <p>The conversion from <strong>ggplot2 to plotly</strong> has issues when converting the formatting of the legend.</p>
                          </ul>"
                        ),
                        HTML("<h2>Methodology:</h2>
                          <ul>
                            <p>The <span style='color: blue;'>30%</span> rule, popularized in 1981 when the government found that people who spent more than 30% of</p>
                            <p>their income on rent were “cost-burdened”. Banks across America such as Chase, Truist, and financial</p>
                            <p>institutions swear by the <span style='color: blue;'>30%</span> rule. The affordable housing data provides the percentage of people who</p>
                            <p>breach this threshold and spend more than <span style='color: blue;'>30%</span> of their income on housing.</p>
                            <p>Using this metric, we created 5 tiers of severity, classified with a <strong>quantile method</strong>. </p>
                            <p>This means that there are an equal number of census tracts in every single “bucket” or tier.</p>
                            <p>This helps us get a better idea of which census tracts are struggling financially. </p>
                            <p>The next step to plot this information was to grab the mean black population percentage</p>
                            <p>of every bucket. We averaged the black population percentage of every census tract for each bucket and </p>
                            <p>plotted that on the y-axis.</p>
                          </ul>"
                        ),
                        HTML("<h2>How to Use the Interactive Plot:</h2>
                          <ul>
                            <p>If you would like to see the mean black population percentage for each tier, simply <span style='color: red;'>hover</span> over the</p>
                            <p>bar that corresponds to your desired tier.</p>
                            <p>If you would like to toggle off certain elements, simply <span style='color: green;'>click</span> the element in the legend on the </p>
                            <p>right hand-side of the plot. Apologies for the poor formatting.</p>
                            <p>You can also zoom in and out if necessary.</p>
                          </ul>"
                        )
                 )
               )
               # Add other content for the Rankings tab as needed
             )
    ),
    tabPanel("Rankings Map",
             fluidPage(
               splitLayout(
                 cellWidths = c("75%", "25%"),
                 # Map on the left
                 leafletOutput("rankingMap", height = "90vh"),
                 # Sidebar on the right
                 column(
                   width = 3,
                   # Add content for the sidebar here
                   HTML("<div><h2>Rankings Map</h2>
                          <ul>
                            <p>This is a test to see how far out I can type</p>
                            <p>The Rankings Map uses the same color palette</p>
                            <p>from the previous tab to help visualize</p>
                            <p>how these rankings are spread out across</p>
                            <p>Seattle. If there is a <span style='color: #FFD700;'>yellow-dashed</span> outline</p>
                            <p>around a census tract, it means that the</p>
                            <p>census tract has a black population percentage</p>
                            <p>above the mean in Seattle.</p>
                            <p>This corresponds to the Ranking Plot's</p>
                            <p>dashed green line.</p>
                            <p><strong>INTERACTIVE TIPS:</strong></p>
                            <p><span style='color: red;'>Hover</span> over a census tract to reveal</p>
                            <p> its ranking.</p>
                          </ul></div")
                 ),
                 HTML("<div><h2>The Findings</h2>
                 <ul>
                            <p>Notice the rankings of the census tracts</p>
                            <p>that have a <span style='color: #FFD700;'>yellow outline</span> are</p>
                            <p>mainly of ranks 3-5 (high severity).</p>
                            <p>This suggests that census tracts (or areas)</p>
                            <p>that have a higher percentage of black</p>
                            <p>residents are often breaching the 30%</p>
                            <p>threshold. This project identifies</p>
                            <p>many areas that are affected </p>
                            <p>by the compounding racial wealth gap</p>
                            <p>that persists in Seattle.</p>
                          </ul></div>"
                      )
               )
             )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  output$spaceNeedleImage <- renderImage({
    list(src = "spaceNeedle.png", height = 700, width = 500)  # Adjust the dimensions as needed
  }, deleteFile = FALSE)
  
  ranking_palette <- c("1" = "#6690ffff", "2" = "#526aadff", "3" = "#42383bff", "4" = "#a22343ff", "5" = "#ff0040ff")
  
  output$map <- renderLeaflet({
    selected_column <- if (input$mapSlider == "Black Population Percentage") "Percentage_Black" else "Percentage"
    
    leaflet() %>%
      addProviderTiles("OpenStreetMap.Mapnik") %>%
      addPolygons(data = df, 
                  fillColor = ~colorQuantile("YlGn", df[[selected_column]])(df[[selected_column]]),
                  fillOpacity = 0.7, color = "white", weight = 1,
                  label = ~paste("Percentage: ", round(df[[selected_column]], 2), "%"),
                  highlight = highlightOptions(
                    weight = 5,
                    color = "green",
                    bringToFront = TRUE
                  )
      )
  })
  
  # Update the map explanation text based on the selected map
  output$mapExplanation <- renderText({
    if (input$mapSlider == "Black Population Percentage") {
      "This map displays the Black Population Percentage."
    } else {
      "This map displays the Percentage."
    }
  })
  
  mean_black_percentage <- mean(df$Percentage_Black)
  
  output$rankingMap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("OpenStreetMap.Mapnik") %>%
      addPolygons(data = df, 
                  fillColor = ~factor(df$Ranking, levels = c("1", "2", "3", "4", "5"), labels = ranking_palette),
                  fillOpacity = 0.7, color = "white", weight = 1,
                  label = ~paste("Ranking: ", df$Ranking),
                  highlight = highlightOptions(
                    weight = 5,
                    color = "green",
                    bringToFront = TRUE
                  ),
                  popup = ~paste("Census Tract: ", df$Census_Tract, "<br>Ranking: ", df$Ranking)
      ) %>%
      addPolylines(data = subset(df, Percentage_Black > mean_black_percentage),
                   color = "yellow", weight = 2, opacity = 1, dashArray = "5, 5",
                   label = ~paste("Above Mean in Seattle"))
  })
  
  
  output$rankingPlot <- renderPlotly({
    p <- ggplot(summary_table, aes(x = as.factor(Ranking), y = Mean_Percentage_Black, fill = as.factor(Ranking))) +
      geom_bar(stat = "identity", color = "black") +
      geom_hline(aes(yintercept = mean_black_percentage, linetype = "Mean Percentage in Seattle"), color = "green", size = 1) +
      labs(title = "Mean Black Population Percentage by Severity Ranking",
           x = "Ranking (1 = low severity, 5 = high severity)",
           y = "Mean Black Population Percentage (by Census Tract)",
           caption = "Data source: Affordable Housing Data, ACS Census") +
      scale_fill_manual(values = c("1" = "#6690ffff", "2" = "#526aadff", "3" = "#42383bff", "4" = "#a22343ff", "5" = "#ff0040ff"), name = "Ranking") +
      scale_linetype_manual(values = c("Mean Percentage in Seattle" = "dotted"), name = "Mean Black Population Percentage") +
      theme_minimal() +
      theme(legend.position = "bottom")
    
    # Convert ggplot to plotly
    p <- ggplotly(p) %>%
      layout(legend = list(traceorder = "normal", font = list(size = 10), orientation = "v", x = 1.02))  # Change orientation to "v" (vertical) and adjust x to position the legend
    
  })
  
}

# Run the application
shinyApp(ui, server)