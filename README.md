# shinyGroupedPlotViewer

A Shiny application for visualizing series of exported plots.

## Example

Suppose you have three plots (chart1, chart2, chart3) for a series of cities.

### File structure in the directory:

```
paris_chart1.png
paris_chart2.png
paris_chart3.png
lyon_chart1.png
lyon_chart2.png
lyon_chart3.png
rennes_chart1.png
rennes_chart2.png
rennes_chart3.png
```

### Functionality

Using a regular expression (REGEX), the application provides a selection field to choose the individual (e.g., city, person, country, cluster, etc.) to display. Once the individual is selected, the application displays the `chart1`, `chart2`, and `chart3` plots only for the selected individual.

## Usage

1. **File Preparation**: Ensure that your plot files follow a consistent naming convention or that differences in naming conventions can be captured using a regular expression (REGEX). For example, files can follow the naming convention `individual_chartX.png`, where `individual` is the name of the individual and `X` is the plot number.

2. **Configuration**:
   - **Path to Plots**: You can configure the path to the directory containing the plots.
   - **Regular Expression (REGEX)**: You can configure the regular expression used to extract information from the file names.

3. **Launch the Application**: Start the Shiny application.

4. **Select the Individual**: Use the selection field to choose the individual whose plots you want to visualize.

5. **Visualization**: The plots corresponding to the selected individual will be displayed.

## Installation

To use `shinyGroupedPlotViewer`, you need to have R and the Shiny package installed. You can install Shiny using the following command:

```R
install.packages("shiny")
```

Then, clone this repository and launch the Shiny application by running the `app.R` file or using the following command in R:

```R
shiny::runApp("path/to/shinyGroupedPlotViewer")
```

## Contribution

Contributions are welcome! If you have suggestions, improvements, or corrections, please feel free to open an issue or submit a pull request.

## License

This project is free of rights. You can use, modify, and distribute it freely without any restrictions.
