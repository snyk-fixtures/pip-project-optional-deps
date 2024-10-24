FROM python:3-alpine
WORKDIR /service
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . ./
RUN pip greeze > results.txt

ENTRYPOINT [ "/entrypoint.sh" ]
