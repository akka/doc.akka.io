#!/bin/bash

f=$1
TMP1=`echo $f|sed 's/^0\.[^\/]*\///'`
TMP=`echo $TMP1|sed "s=\/=\\\\\\/=g"`
echo $TMP
sed -i -e "s/<meta name=\"description\" content='akka-stream-kafka-docs'\/>/<meta name=\"description\" content=\"Alpakka is a Reactive Enterprise Integration library for Java and Scala, based on Reactive Streams and Akka.\"\/><link rel=\"canonical\" href=\"https:\/\/doc.akka.io\/docs\/alpakka-kafka\/current\/$TMP\"\/>/g" $f
