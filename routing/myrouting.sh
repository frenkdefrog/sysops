#!/usr/bin/env bash
#!/usr/bin/env bash


function networkup {
        reachable=$1
        while [ $reachable -ne 0 ]; do
                # Ping the host
                ping -q -c 1 -W 1 "$2" > /dev/null 2>&1

                if [ $? -eq 0 ]; then
                  echo 0
                        return
                fi
                let reachable-=1
                sleep 3
        done
  echo 1
}

if [ $(networkup 60 172.16.61.1) -eq 0 ]; then
	ip route add 10.10.10.2/32 via 172.16.61.6
fi
