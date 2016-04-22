FROM jupyter/notebook:latest

# Create Users
RUN groupadd sas --gid 1001
RUN useradd sas --gid 1001 --uid 1001
#RUN echo -e "Orion123" | /usr/bin/passwd --stdin sas

RUN mkdir -p /usr/local/SASHome
RUN chown sas /usr/local/SASHome
RUN chgrp sas /usr/local/SASHome


# Install sas_kernel
RUN pip install sas_kernel

# add SAS executable Link

COPY start-notebook.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-notebook.sh

EXPOSE 8888

ENTRYPOINT ["tini", "--"]
CMD ["jupyter", "notebook", "--no-browser" ]
#CMD ["sh", "start-notebook.sh"]

