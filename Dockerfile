# Choose your desired base image
FROM jupyter/minimal-notebook:latest 

RUN CONFIRM_CODE=`wget --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1XrmkevxgSc-jtsBXszavKvPfrPTx2iv0' -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p'` && \
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM_CODE&id=1XrmkevxgSc-jtsBXszavKvPfrPTx2iv0" -O /tmp/corpus.txt.zip && \
    unzip /tmp/corpus.txt.zip -d /tmp && \
    rm /tmp/corpus.txt.zip

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

EXPOSE 9999