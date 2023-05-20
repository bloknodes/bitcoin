FROM busybox as builder

ENV SW_VERSION=0.21.2
ENV NETWORK=testnet

WORKDIR /src
RUN wget https://bitcoincore.org/bin/bitcoin-core-${SW_VERSION}/bitcoin-${SW_VERSION}-x86_64-linux-gnu.tar.gz && \
    tar -xf bitcoin-${SW_VERSION}-x86_64-linux-gnu.tar.gz && \
    mv bitcoin-${SW_VERSION}/bin/bitcoind /src/bitcoind

FROM debian:bullseye-slim

COPY --from=builder /src/bitcoind /usr/bin/bitcoind
COPY bin/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh
COPY configs/bitcoin-mainnet.conf /etc/bitcoin/bitcoin-mainnet.conf
COPY configs/bitcoin-testnet.conf /etc/bitcoin/bitcoin-testnet.conf

CMD ["/usr/bin/run.sh"]
