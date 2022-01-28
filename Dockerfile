FROM python:3.7
COPY . /tmp
RUN pip3 install Flask
EXPOSE 5000
CMD ["python3", "/tmp/main.py"]