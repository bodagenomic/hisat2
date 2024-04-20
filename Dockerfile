FROM python:3.9-alpine3.18

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

WORKDIR /tmp

RUN apk update && apk upgrade && \
	apk add make curl git zlib && \
	curl -o hisat2-2.2.1-Linux_x86_64.zip https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download && \
	unzip hisat2-2.2.1-Linux_x86_64.zip && \
	mv hisat2-2.2.1 /opt/ && \
	echo "export PATH=/opt/hisat2-2.2.1:$PATH" >~/.bashrc && \
	git clone https://github.com/samtools/samtools.git && \
	cd samtools && \
	./configure && \
	make && \
	make install && \
	pip install click && \
	pip install HTSeq && \
	pip install pysam

