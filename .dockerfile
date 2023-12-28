# Start from a base image with Python 3 support
FROM python:3

# Install Jupyter Lab and any required Python libraries
RUN pip install jupyter-core notebook jupyterlab


# Install R and the necessary components for the R kernel in Jupyter
RUN apt-get update && apt-get install -y \
    r-base \
    libcurl4-openssl-dev libssl-dev libxml2-dev

# Install IRkernel for R in Jupyter
RUN R -e "install.packages(c('IRkernel', 'IRdisplay'))"
RUN R -e "IRkernel::installspec(user = FALSE)"

# Expose the Jupyter Lab port
EXPOSE 8888



#  From attempts using gcode notebook file
# Set up the working directory and start Jupyter Lab
# WORKDIR /app
# CMD ["jupyter", "lab", "--ip='0.0.0.0'", "--port=8888", "--no-# browser"]

# new attempt  - bare code w/ R kernel notebook
# Runs Jupyter notebook when the container launches
# CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", # "--NotebookApp.token=''", "--NotebookApp.password=''"]
# Previous steps...

# new run code
# Runs Jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
