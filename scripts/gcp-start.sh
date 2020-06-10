#!/bin/bash

systemctl stop systemd-resolved

if [ ! -d /etc/dnsseeder ]; then
    mkdir -p /etc/dnsseeder
fi

cat <<EOF > /etc/dnsseeder/Corefile
mainnet.seeder.zfnd.org {
    dnsseed {
        network mainnet
        bootstrap_peers mainnet.z.cash:8233
        crawl_interval 30m
        record_ttl 600
    }
}

testnet.seeder.zfnd.org {
    dnsseed {
        network testnet
        bootstrap_peers testnet.z.cash:18233
        crawl_interval 15m
        record_ttl 300
    }
}
EOF
