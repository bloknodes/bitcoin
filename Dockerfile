FROM bloknodes/base-nodes:bitcoin-0.21.2 

ENV NETWORK=testnet

COPY bin/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

COPY configs/bitcoin-mainnet.conf /etc/bitcoin/bitcoin-mainnet.conf
COPY configs/bitcoin-testnet.conf /etc/bitcoin/bitcoin-testnet.conf

CMD ["/usr/bin/run.sh"]
