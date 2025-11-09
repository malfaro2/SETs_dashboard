# Multi-Course Data Loading Script
# This script loads and cleans one or more course evaluation CSV files

library(janitor)
library(dplyr)

# ==============================================================================
# STEP 1: LIST YOUR COURSE FILES HERE
# ==============================================================================
# Format: "Display Name in Dashboard" = "path/to/your/file.csv"
# 
# To add more courses, just add more lines following the same pattern.
# Make sure each line except the last one ends with a comma!

course_files <- list(
  "ECE 103 - Fall 2024" = "raw_data/Fa24ECE_103_01_12071.csv",
  "ECE 103L - Fall 2024" = "raw_data/Fa24ECE_103L_01_11104.csv",
  "ECE 180J - Spring 2025" = "raw_data/Sp25ECE_180J_01_51466.csv",
  "ECE 279 - Winter 2025" = "raw_data/Wi25ECE_279_01_30068.csv"
  
  # Uncomment and modify these examples to add more courses:
  # "STAT 17 - Fall 2024" = "raw_data/Fa24STAT_17_01.csv",
  # "STAT 7 - Fall 2024" = "raw_data/Fa24STAT_7_01.csv"
)

# ==============================================================================
# STEP 2: DATA CLEANING (YOU DON'T NEED TO MODIFY ANYTHING BELOW)
# ==============================================================================

# Function to load and clean a single course file
clean_course_data <- function(filepath) {
  # Load the CSV
  data <- read.csv(filepath)
  
  # Clean column names
  data_clean <- data %>%
    clean_names()
  
  # Rename columns to match your survey
  data_renamed <- data_clean %>%
    rename(
      subject_id = subject_id,
      secondary_id = secondary_subject_id,
      enrollment = enrollment_type,
      class_standing = starts_with("q1_"),
      why_taking = starts_with("q2_"),
      attendance_pct = starts_with("q3_"),
      hours_per_week = starts_with("q5_"),
      time_effective = starts_with("q7_"),
      explained_concepts = starts_with("q8_"),
      useful_feedback = starts_with("q9_"),
      grading_clear = starts_with("q11_"),
      felt_engaged = starts_with("q16_"),
      engagement_explain = starts_with("q18_"),
      understood_goals = starts_with("q20_"),
      lectures_structured = starts_with("q21_"),
      activities_structured = starts_with("q22_"),
      homework_helpful = starts_with("q25_"),
      reading_useful = starts_with("q28_"),
      teaching_practices = starts_with("q32_"),
      improvement_suggestions = starts_with("q35_"),
      additional_comments = starts_with("q38_"),
      felt_prepared = starts_with("q41_"),
      preparation_explain = starts_with("q44_"),
      ta_name = starts_with("q48_")
    )
  
  return(data_renamed)
}

# Load all courses
courses <- list()
for(course_name in names(course_files)) {
  filepath <- course_files[[course_name]]
  courses[[course_name]] <- clean_course_data(filepath)
}

# For backward compatibility: create 'data' variable with first course
data <- courses[[1]]