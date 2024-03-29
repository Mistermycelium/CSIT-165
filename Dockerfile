FROM rocker/rstudio:4

# Set working directory
WORKDIR /home/rstudio/workingdir

# Change ownership of the working directory to the rstudio user
RUN chown -R root:root /home/rstudio/workingdir

# Set permissions for the working directory
RUN chmod -R  777 /home/rstudio/workingdir
