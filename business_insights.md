# Netflix SQL Analysis — Business Insights Summary

## Business Goal

Analyze the Netflix content catalog using SQL to understand content type, ratings, countries, genres, directors, and release-year trends. The analysis is intended to support better understanding of catalog composition and content trends.

## Data Cleaning Insights

- Duplicate checks help identify repeated Netflix records and improve data quality.
- NULL and blank-value checks identify incomplete metadata.
- Standardizing values such as `Movie` and `TV Show` makes categorical analysis more reliable.
- Missing ratings and directors can be handled carefully depending on the analytical requirement.
- Release-year validation helps identify potentially incorrect records.
- Duration consistency checks can identify records where Movie/TV Show information does not match the duration format.

## Basic EDA Insights

### 1. Content Type
The Movies vs TV Shows distribution shows the overall composition of the Netflix catalog.

**Business use:** Helps understand whether the catalog is more movie-oriented or TV-show-oriented.

### 2. Content by Country
Counting titles by country identifies countries contributing the most content.

**Business use:** Helps identify major content-producing markets and geographic concentration.

### 3. Content by Rating
Counting titles by rating shows which audience/content-rating categories dominate the catalog.

**Business use:** Helps understand the target audience and content maturity distribution.

### 4. Content by Release Year
Grouping titles by release year shows how the catalog is distributed across production years.

**Business use:** Helps identify periods with high content representation and understand catalog recency.

### 5. Content by Genre
Grouping by `listed_in` identifies the most represented content categories.

**Business use:** Helps identify popular or heavily represented content categories in the catalog.

### 6. Directors
Counting titles by director identifies directors with multiple contributions.

**Business use:** Helps identify recurring content creators and potentially important creative partnerships.

## Intermediate EDA Insights

### 1. Titles by Country
Country-level title counts allow comparison of catalog size across markets.

**Business use:** Supports geographic content strategy analysis.

### 2. Rating by Content Type
Combining `rating` and `type` shows how Movies and TV Shows differ across rating categories.

**Business use:** Helps understand whether particular ratings are more concentrated in Movies or TV Shows.

### 3. Directors with More Than Two Titles
Filtering directors using `HAVING COUNT(*) > 2` identifies recurring directors.

**Business use:** These creators may represent valuable or frequently used content relationships.

### 4. Genre by Content Type
Combining genre and type shows which categories are more associated with Movies or TV Shows.

**Business use:** Helps compare catalog structure across content formats.

## Advanced EDA Insights

### 1. Movie vs TV Show Percentage
Calculating the percentage contribution of each content type provides a normalized view of the catalog.

**Business use:** Makes it easier to compare the relative importance of Movies and TV Shows.

### 2. Release-Year Percentage
Calculating each year's percentage of the total catalog shows the contribution of different release years.

**Business use:** Helps identify whether the catalog is concentrated in recent or older content.

### 3. Country Ranking
Using `RANK()` to rank countries by title count identifies leading content-producing countries.

**Business use:** Supports geographic market and content-production comparisons.

### 4. Director Ranking
Using `RANK()` to rank directors by title count identifies the most frequently represented directors.

**Business use:** Highlights recurring creators in the catalog.

### 5. Countries with More Than Five Titles
Using `HAVING COUNT(*) > 5` focuses analysis on countries with meaningful catalog representation.

**Business use:** Removes very small groups from the comparison and makes country-level analysis more useful.

## One-Hot Encoding Insight

The `rating` column is categorical, so it cannot be meaningfully aggregated using `SUM()` or `AVG()` directly.

One-hot encoding converts each rating into a binary indicator such as:

- `rating_TV_MA`
- `rating_TV_14`
- `rating_PG_13`
- `rating_R`
- `rating_PG`
- `rating_G`

**Business/Analytical use:** Converts categorical ratings into numeric features that can be used in statistical analysis, machine learning, or further SQL-based analysis.

## Key Business Questions Answered

1. How many Movies and TV Shows are in the catalog?
2. Which countries contribute the most titles?
3. Which ratings are most common?
4. Which genres are most represented?
5. Which directors have contributed multiple titles?
6. How is content distributed across release years?
7. How do ratings differ between Movies and TV Shows?
8. What percentage of the catalog is represented by each content type?
9. Which countries and directors rank highest by number of titles?
10. How can the rating column be converted into numerical features?

## Overall Conclusion

The Netflix SQL analysis provides a structured view of the platform's content catalog. Data cleaning improves data quality, Basic EDA establishes catalog patterns, Intermediate EDA compares important categories, and Advanced EDA uses percentages, filtering, ranking, and aggregation to generate deeper insights.

The project demonstrates an end-to-end SQL analytics workflow:

**Data → Cleaning → Basic EDA → Intermediate EDA → Advanced EDA → Feature Encoding → Business Insights**
