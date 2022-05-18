FROM python:3.7
RUN whoami
COPY . /tmp
RUN ls -lhtr /tmp
#RUN useradd -ms /bin/bash flask_user
#USER flask_user
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt
RUN pip install Flask
EXPOSE 5000
#USER root
CMD ["python3", "/tmp/flask-app/app.py"]