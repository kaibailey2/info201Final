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
