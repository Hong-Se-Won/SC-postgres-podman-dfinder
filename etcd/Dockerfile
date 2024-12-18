FROM rockylinux:8.9

# 필요한 패키지 설치
RUN dnf install -y epel-release && \
    dnf install -y curl tar && \
    dnf clean all

# etcd 바이너리 다운로드 및 설치
ENV ETCD_VERSION=v3.5.7
ENV DOWNLOAD_URL=https://github.com/etcd-io/etcd/releases/download

RUN curl -L ${DOWNLOAD_URL}/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -o etcd-${ETCD_VERSION}-linux-amd64.tar.gz && \
    tar xzvf etcd-${ETCD_VERSION}-linux-amd64.tar.gz --no-same-owner && \
    mv etcd-${ETCD_VERSION}-linux-amd64/etcd* /usr/local/bin/ && \
    rm -rf etcd-${ETCD_VERSION}-linux-amd64.tar.gz etcd-${ETCD_VERSION}-linux-amd64
# etcd 데이터 디렉토리 생성
RUN mkdir -p /var/lib/etcd

# 환경 변수 설정
ENV ETCD_NAME=dfinder_etcd1
ENV ETCD_INITIAL_ADVERTISE_PEER_URLS=http://dfinder_etcd1:12380
ENV ETCD_LISTEN_PEER_URLS=http://0.0.0.0:12380
ENV ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:12379
ENV ETCD_ADVERTISE_CLIENT_URLS=http://dfinder_etcd1:12379
ENV ETCD_INITIAL_CLUSTER=dfinder_etcd1=http://dfinder_etcd1:12380,dfinder_etcd2=http://dfinder_etcd2:12380,dfinder_etcd3=http://dfinder_etcd3:12380
ENV ETCD_INITIAL_CLUSTER_TOKEN=etcd-cluster-1
ENV ETCD_INITIAL_CLUSTER_STATE=new

# etcd 포트 노출
EXPOSE 12379 12380

# etcd 실행 명령
CMD ["etcd"]