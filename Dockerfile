FROM rocker/rstudio

# Set working directory
WORKDIR /home/rstudio/workingdir

# Change ownership of the working directory to the rstudio user
RUN chown -R rstudio:rstudio /home/rstudio/workingdir

# Set permissions for the working directory
RUN chmod -R  755 /home/rstudio/workingdir