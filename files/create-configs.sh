# Node properties
cat > $PRESTO_DIR/etc/node.properties <<EOF
node.environment=production
node.id=`uuidgen`
node.data-dir=$PRESTO_DATA_DIR
EOF
# JVM config
cat > $PRESTO_DIR/etc/jvm.config <<EOF
-server
-Xmx16G
-XX:+UseG1GC
-XX:G1HeapRegionSize=32M
-XX:+UseGCOverheadLimit
-XX:+ExplicitGCInvokesConcurrent
-XX:+HeapDumpOnOutOfMemoryError
-XX:+ExitOnOutOfMemoryError
EOF
cat > $PRESTO_DIR/etc/config.properties <<EOF
coordinator=true
node-scheduler.include-coordinator=true
http-server.http.port=8089
query.max-memory=5GB
query.max-memory-per-node=1GB
discovery-server.enabled=true
discovery.uri=http://localhost:8089
EOF
# Log properties
cat > $PRESTO_DIR/etc/log.properties <<EOF
com.facebook.presto=INFO
EOF
# Connector properties
cat > $PRESTO_DIR/etc/catalog/hive.properties <<EOF
connector.name=hive-hadoop2
hive.metastore.uri=[ENTER METASTORE URI HERE]
hive.config.resources=${PRESTO_DIR}/etc/catalog/adls-wasb-site.xml
EOF
cat > $PRESTO_DIR/etc/catalog/tpch.properties <<EOF
connector.name=tpch
EOF