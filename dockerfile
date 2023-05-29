# Use a base image that contains Python and Jupyter Notebook
FROM jupyter/base-notebook

# Install Python dependencies
RUN pip3 install pandas requests

# Create a directory called "notes"
RUN mkdir /home/jovyan/notes

# Download files from GitHub and store them in the /home/jovyan/notes directory
RUN wget -O /home/jovyan/notes/ThousandEyesAPI.ipynb https://raw.githubusercontent.com/Jancsg/ChallangeTS/main/ThousandEyesAPI.ipynb \
    && wget -O /home/jovyan/notes/maxresdefault.jpg https://raw.githubusercontent.com/Jancsg/ChallangeTS/main/maxresdefault.jpg

# Expose port 8888 to access Jupyter Notebook from the host
EXPOSE 8888

# Set the working directory in the container
WORKDIR /home/jovyan/notes

# Command to start Jupyter Notebook when the container is launched
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
