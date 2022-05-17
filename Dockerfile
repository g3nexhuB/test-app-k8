FROM python:3.7
COPY . /tmp
RUN pip install -r flask-app/requirements.txt 
EXPOSE 5000
CMD ["python3", "flask-app/app.py"]