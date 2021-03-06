FROM kbase/kbase:sdkbase.latest
MAINTAINER KBase Developer
# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

# RUN apt-get update

# -----------------------------------------


RUN mkdir -p /kb/module && cd /kb/module && git clone https://github.com/kbase/data_api && \
    mkdir lib/ && cp -a data_api/lib/doekbase lib/

RUN pip install -r //kb/module/data_api/requirements.txt


COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod 777 /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

EXPOSE 5000

CMD [ ]
