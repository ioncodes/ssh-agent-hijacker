rm -rf /tmp/*

while true; do
    if find "/tmp/" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
        echo "Found agent"
        directory=$(ls "/tmp/" | sort -n | head -1)
        agent=$(ls "/tmp/$directory/" | sort -n | head -1)
        export SSH_AUTH_SOCK="/tmp/$directory/$agent"
        ssh $1@$2 -p $3

        exit 1
    else
        echo "Not found.. Waiting.."
        sleep 0.5
    fi
done
