# info201Final
INFO 201 Au 2023 Final Project

# Story Pitch:
A case study looking at affordable housing for minorities in the surrounding urban areas of Seattle, Washington.

<br>

It is well-known that gentrification and red lining have a deep-rooted history in Seattle, specifically in Central District. Using [ACS Data](https://data.census.gov/table?q=dp05&g=040XX00US53,53$1400000) and [Affordable Housing Data](https://data-wa-geoservices.opendata.arcgis.com/datasets/WADOH::unaffordable-housing-current-version/about), this project aims to take a closer look at Seattle's differences in affordable housing by census tract. Revealing the effects of discriminatory housing and financial practices can help shape public policy to create a more equitable future for Seattle residents. Following the results of this research project, there may also be implications of the racial wealth gap because homeownership is one of the leading drivers of wealth for most American citizens. While overall homeownership rates rose to 65.5% in 2021, Black Americans have a homeownership rate of only 44%, rising only 0.4% in 10 years. White American homeownership rates have reached nearly 72.7%, which is nearly 29 percentage points ahead of the Black American homeownership rates. It must also be mentioned that the American housing market is extremely unpredictable as housing prices, especially in urban areas, continue to rise for a variety of factors including the pandemic, inflation, etc. The National Foundation for Credit Counseling in the United States follows the "30% Rule" which recommends that households should not spend more than 30% of their income on housing as it would generally limit finances for emergency funds, savings/investment, etc. The [Affordable Housing Dataset](https://data-wa-geoservices.opendata.arcgis.com/datasets/WADOH::unaffordable-housing-current-version/about) calculates the percentage of households that spend MORE than 30% of their income on housing expenses using Survey Data. The [ACS Data](https://data.census.gov/table?q=dp05&g=040XX00US53,53$1400000) provides the demographic data collected from the American Community Survey (an annual demographics survey program conducted by the U.S. Census Bureau). The methodology for conducting this research is to look at census tracts with high percentages of minoriies and the percentage of people paying above the 30% Rule threshold to compare them to census tracts with lower percentages of minorities.

<br>

# Finding Data:
First Data Source: [ACS Data](https://data.census.gov/table?q=dp05&g=040XX00US53,53$1400000)
1)  Data was downloaded at: https://data.census.gov/table?q=dp05&g=040XX00US53,53$1400000
2)  This data was collected by the American Community Survey that is conducted annually by the U.S. Census Bureau. 1 in 38 households receive the ACS every year (or about 3.5 million households). The dataset contains information about sex, age, income, race, etc.
3)  There are 1,461 observations (one for each census tract in Washington State, plus a few extra annotation rows)
4)  Technically, there are roughly 300-400 features/columns in the dataset including the annotations and margin of error columns. Not including those columns would equal about 100 columns of data with pure estimate numbers alone.

<br>

Second Data Source: [Affordable Housing Data](https://data-wa-geoservices.opendata.arcgis.com/datasets/WADOH::unaffordable-housing-current-version/about)
1)  Data was downloaded at: https://data-wa-geoservices.opendata.arcgis.com/datasets/WADOH::unaffordable-housing-current-version/about
2)  This data was collected by using survey housing characteristics data looking at three categories of households including mortgages. no mortgages, and rentals. The metadata states that "Percentages are presented for households spending great than 30 percent of their income on housing costs".
3)  There are 1,458 observations (one for each census tract in Washington State, there a 3 rows with no data which will be handled before data analysis)
4)  There are 12 features/columns in this dataset.

<br>

# Background Research/Inspiration
1. [Black Home Initiative](https://www.blackhomeinitiative.org/the-work)
    <br>
        * My project aims to visualize the data to help more people understand the severity of the problem which aligns with this organization's initiative.
    <br>
        * While I won't be getting into the specific solutions for the issue like the BHI does, I will highlight specific areas of Seattle that may be of interest in order to put the plan into action.
    <br>
    
2. [Challenge Seattle](https://challengeseattle.com/affordable-housing#:~:text=In%202019%2C%20Challenge%20Seattle%20hired,were%20burdened%20by%20housing%20costs.)
    <br>
        *  Challenge Seattle is an initiative that looks at the affordable housing crisis and makes use of different visualizations to convey their data, much like I plan to do with my project.
    <br>
        * One way my project will differ will be through a more specific look at Seattle's census tracts as the map of Challenge Seattle looks at broader, state-wide county data.
    <br>
    
3. [Daily UW](https://www.dailyuw.com/opinion/a-portrait-of-seattle-s-affordable-housing-crisis/article_614476ca-f2e6-11ed-a992-e7ce3f1a9368.html)
    <br>
        * The Daily UW wrote this amazing article on insane rent costs in Seattle that inspired me for this project. Much like this article, I plan to address the public interest of the issue.
    <br>
        * I intend to look at this topic one step further by looking at census tracts with a high percentage of minority residents to see how they are affected by the affordable housing crisis.
    <br>
    
4. [Gentrification Displacement in Seattle](https://storymaps.arcgis.com/stories/2f0792826dc14e0b99d04fc4c0142a3c)
    <br>
        * This story map on ArcGIS provides great inspiration for a public-facing application that can help guide me for the final project as it deals with similar data and topics.
    <br>
        * I will be focusing less on change over time like this map and looking at the current state of affordable housing and home ownership.
    <br>
    
5. [Multi-Family Housing](https://www.sightline.org/2017/08/30/map-where-multi-family-homes-make-seattle-neighborhoods-more-affordable/)
    <br>
        * This article and interactive map also provide inspiration for how I can format my project and make it more interactive.
    <br>
        * I will not be diving into this specific of a topic and will most likely refrain from using proportional dot symbols for my visualizations.
    <br>
   
