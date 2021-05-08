FROM python:3.8
RUN apt-get install vim
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
WORKDIR /var/www/
CMD ["bash"]
