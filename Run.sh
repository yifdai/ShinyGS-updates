#!/bin/bash

function stop_container() {
      echo "Stopping genoselect container..."
      docker stop $container_id
      echo "Genoselect container stopped."
}

# Run the ShinyGS container and get its ID
echo "Starting genoselect container..."
container_id=$(docker run -itd --memory=16g -p 4040:4040 -v "$(pwd)":/mount yfd2/ags:1.1.6 /bin/bash)
echo "Genoselect container started with ID $container_id"

docker exec $container_id Rscript opt/app/run.R &

# Print the Docker container logs
docker logs -f $container_id &

# Trap the SIGINT signal (ctrl+c) and call the stop_container function
trap stop_container SIGINT
sleep 2

# Open a new browser window and navigate to localhost:4040
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS environment
    open http://localhost:4040
elif [ -n "$WSL_DISTRO_NAME" ]; then
    # WSL environment
    cmd.exe /c start http://localhost:4040
else
    # Standard Linux environment
    xdg-open http://localhost:4040
fi

# Listen for the session ended message
docker logs -f $container_id | while read line ; do
    if echo $line | grep -q "Session ended" ; then
        stop_container
        break
    fi
done

# To ensure the script exits after stopping the container
exit 0
                      
