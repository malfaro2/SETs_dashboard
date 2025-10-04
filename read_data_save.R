# Clean Column Names Script
# Uses janitor package for automatic column name cleaning

library(janitor)
library(dplyr)

# Load your data ## change the name of your file here, please note that spaces and "-" are problematic
data<-read.csv("raw_data/Su25CSE_102_01_70635.csv")

# Clean column names automatically
data_clean <- data %>%
  clean_names()

# If you want even shorter custom names for the survey questions
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

#source(file="read_data_save.R")
data <- data_renamed