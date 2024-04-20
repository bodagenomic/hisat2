FROM python:3.9-alpine3.18

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

WORKDIR /tmp

RUN apk update && apk upgrade && \
	apk add make curl wget zlib tar && \
	curl -o hisat2-2.2.1-Linux_x86_64.zip https://cloud.biohpc.swmed.edu/index.php/s/oTtGWbWjaxsQ2Ho/download && \
	unzip hisat2-2.2.1-Linux_x86_64.zip && \
	mv hisat2-2.2.1 /opt/

ADD https://github.com/samtools/samtools/releases/download/1.20/samtools-1.20.tar.bz2 ./
RUN chmod 755 samtools-1.20.tar.bz2 && \
	ls -la . && \
	tar -jxvf samtools-1.20.tar.bz2 && \
	cd samtools-1.20 && \
	./configure --prefix=/opt/samtools/ && \
	make && \
	make install

RUN echo "export PATH=/opt/hisat2-2.2.1:/opt/samtools:$PATH" >~/.bashrc && \
	ls -l /opt/samtools && \
	pip install click && \
	pip install HTSeq && \
	pip install pysam

