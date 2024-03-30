# nolint: line_length_linter.
library(later)
library(fs)
library(rmarkdown)

file_mod_times_list <- list()

# Function to repeatedly check for changes in a specific .Rmd file
watch_file <- function(file_name, interval) {
  # Function to check and knit if the file has changed
  check_and_knit <- function(file_name) {
    function() {
      # Find the file object that has a file_path that matches the file_name
      file <- NULL
      for (i in seq_along(file_mod_times_list)) {
        if (file_mod_times_list[[i]]$file_path == file_name) {
          file <- file_mod_times_list[[i]]
          break
        }
      }

      if (!is.null(file)) {
        file_path <- file$file_path
        last_modified_time <- file$modification_time
        current_modified_time <- file_info(file_path)$modification_time
        if (current_modified_time > last_modified_time) {
          rmarkdown::render(file_path)
          file_mod_times_list[[i]]$modification_time <<- current_modified_time # nolint: line_length_linter.
        }
      } else {
        print(paste("File not found in file_mod_times_list: ", file_name))
      }
    }
  }
  check_and_knit(file_name)
  # Schedule the check function to run at intervals
  task <- later::later(function() check_and_knit(file_name)(), delay = interval)

  # Return the handle to allow stopping the watcher if necessary
  invisible(task)
}

main <- function(dir_path) {
  # Get a vector of file paths
  files <- list.files(path = dir_path, pattern = "\\.Rmd$", recursive = TRUE, full.names = TRUE) # nolint: line_length_linter.

  # Use lapply to create a list of file modification times
  file_mod_times_list <<- lapply(files, function(file) {
    # Get file info
    info <- file_info(file)

    # Return a named list with the modification_time
    list(modification_time = info$modification_time, file_path = file)
  })

  for (i in seq_along(files)) {
    print(paste("Watching", files[i], "for changes"))
  }
  # Loop until all tasks are executed
  while (TRUE) {
    tasks <- lapply(files, watch_file, interval = 1)
    # Start the tasks
    invisible(tasks)
    later::run_now() # Run tasks that are ready
    Sys.sleep(1) # Sleep briefly to yield control back to the system
  }
}

main("/home/rstudio/workingdir")
