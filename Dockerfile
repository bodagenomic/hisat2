FROM python:3.9-alpine3.18

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

WORKDIR /tmp

RUN apk update && apk upgrade && \
	apk add make wget git zlib && \
	wget https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download && \
	ls -l && \
	unzip hisat2-2.2.1-Linux_x86_64.zip[.zip] && \
	mv hisat2-2.2.1 /opt/ && \
	echo "export PATH=/opt/hisat2-2.2.1:$PATH" >~/.bashrc && \
	pip install click && pip install pysam && \
	git clone https://github.com/samtools/samtools.git && \
	cd samtools && \
	./configure && \
    make && \
    make install

