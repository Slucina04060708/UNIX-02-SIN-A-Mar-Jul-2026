#!/bin/bash
top #Spawns an interactive process layer that hijacks stdin/stdout. The shell suspends subsequent command parsing until the process exits.
top& #Instructs the kernel to spawn the process asynchronously. The shell returns an immediate job ID and PID, leaving the terminal prompt available for continuous command ingestion.