FROM python:3.7
COPY . /tmp
COPY requirements.txt flask-app/requirements.txt 
RUN pip install --upgrade pip && pip install -r flask-app/requirements.txt 
EXPOSE 5000
CMD ["python3", "flask-app/app.py"]