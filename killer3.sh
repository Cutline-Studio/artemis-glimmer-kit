#!/bin/bash
END=1793006989
while [ $(date +%s) -lt $END ]; do sleep 20; [ -f /workspace/glimmer-kit/STOP_KILLER ] && exit 0; done
echo "$(date) hard-kill firing" >> /workspace/glimmer-kit/killer3.log
for i in 1 2 3 4 5; do /workspace/vast-venv/bin/vastai destroy instance 57759536 -y --api-key "$VAST_API_KEY" >> /workspace/glimmer-kit/killer3.log 2>&1 && break; sleep 15; done
/workspace/vast-venv/bin/vastai show instance 57759536 --raw --api-key "$VAST_API_KEY" >> /workspace/glimmer-kit/killer3.log 2>&1
