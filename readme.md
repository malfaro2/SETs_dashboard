## Instructions for Running the Course Evaluation Dashboard

This guide will walk you through installing the necessary software and running the Quarto dashboard for course evaluations.

### Prerequisites

1. Install R

* Go to https://cran.r-project.org/
* Select your operating system (Windows, Mac, or Linux)
* Download the latest version of R (4.0.0 or higher recommended)
* Run the installer and follow the installation prompts
* Accept all default settings

2. Install RStudio (Recommended)
While not strictly required, RStudio makes working with R much easier:

Go to https://posit.co/download/rstudio-desktop/
Download RStudio Desktop (free version)
Install RStudio after R is installed
Launch RStudio

3. Install Quarto

Go to https://quarto.org/docs/get-started/
Download Quarto for your operating system
Run the installer
Verify installation by opening a terminal/command prompt and typing:
   quarto --version

### Setting Up Your Project

1. Create Project Directory Structure
Create a folder for your project with the following structure:
my_dashboard_project/
├── dashboard_SETs.qmd
├── read_data_save.R
└── raw_data/
    └── Su25CSE_13S_01_70640.csv
2. Add Your Files

* Place dashboard_SETs.qmd in the main project folder
* Place read_data_save.R in the main project folder
* Create a subfolder called raw_data
* Place your CSV data file in the raw_data folder

Important: Make sure your CSV filename matches what's specified in read_data_save.R. If your file has a different name, update this line in read_data_save.R:
rdata<-read.csv("raw_data/YOUR_FILENAME_HERE.csv")

### Installing Required R Packages

* Option 1: Install Packages Individually
Open RStudio and run these commands in the Console (one at a time):
rinstall.packages("shiny")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("wordcloud")
install.packages("tm")
install.packages("RColorBrewer")
install.packages("plotly")
install.packages("DT")
install.packages("janitor")
Wait for each package to install completely before moving to the next one.

* Option 2: Install All Packages at Once
Copy and paste this entire block into the RStudio Console:
rpackages <- c("shiny", "ggplot2", "dplyr", "tidyr", "wordcloud", 
              "tm", "RColorBrewer", "plotly", "DT", "janitor")

install.packages(packages)
Note: Installation may take 5-10 minutes depending on your internet connection and computer speed.

### Running the Dashboard

Method 1: Using RStudio (Easiest)

* Open RStudio
* Go to File → Open File
* Select dashboard_SETs.qmd
* Look for a "Run Document" button at the top of the editor (it looks like a green play button)
* Click "Run Document"
The dashboard will open in a new window or in the Viewer pane

Method 2: Using Terminal/Command Line

* Open Terminal (Mac/Linux) or Command Prompt (Windows)
* Navigate to your project directory:
   cd path/to/my_dashboard_project
* Run the command:
   quarto preview dashboard_SETs.qmd
The dashboard will open in your default web browser

Using the Dashboard
* Once running, you'll see multiple pages:

Overview: Summary statistics and distributions
* Use filters on the left to narrow down responses
* View class standing and attendance distributions
Ratings: Detailed rating visualizations
* Instructor effectiveness metrics
* Engagement and learning ratings
* Course structure ratings
* Comparative radar chart
Crosstabs: Cross-tabulation analysis
* Select different rating and student variables to explore relationships
* View tables and visualizations
Raw Data: Complete dataset view
* Browse all responses
* Sort and filter columns

### Troubleshooting

* Package Installation Issues
If you encounter errors during package installation:
r# Try installing from a different CRAN mirror
install.packages("package_name", repos = "https://cloud.r-project.org/")

* Dashboard Won't Load
Check that your CSV file is in the correct location (raw_data/ folder)
Verify the filename in read_data_save.R matches your actual file
Make sure all packages installed successfully
Try restarting RStudio

* Error: "Could not find function..."
This means a package wasn't loaded properly. Try:
rlibrary(shiny)
library(ggplot2)
library(dplyr)
etc. for all packages

* CSV Reading Errors
If you get errors reading the CSV:
Ensure your CSV uses commas as separators
Check that column names match what the script expects (the script uses clean_names() to handle this)
Verify the file encoding (should be UTF-8)

### Customizing for Your Data
If you have a different CSV file with different column names:
Open read_data_save.R
Update the filename on line 9
Adjust the column renaming section to match your CSV's column names (lines starting with rename()

### Additional Notes

The dashboard runs locally on your computer and doesn't upload data anywhere
You can keep the dashboard running while you work with filters and views
To stop the dashboard, press Escape in RStudio or close the browser window and press Ctrl+C in the terminal
Each time you modify the .qmd file, you'll need to re-run the document to see changes

### Getting Help

R Documentation: https://www.r-project.org/help.html
Quarto Documentation: https://quarto.org/docs/guide/
RStudio Community: https://community.rstudio.com/