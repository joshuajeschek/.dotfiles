#!/bin/bash
echo https://gist.github.com/joshuajeschek/27ca79e458aa0986009c2e0339e2a0fd
last_command=$(history | tail -n 1 | cut -b 8-)
echo "Saving \033[0;32m$last_command\033[0m"
echo "Enter description:\r"
read description
dt=$(date '+%Y-%m-%d_%H-%M-%S')

# write into file until EOF
cat << EOF > ./$dt.sh
#!/bin/bash
# ${description}
${last_command}
EOF

gh gist edit 27ca79e458aa0986009c2e0339e2a0fd -a ./$dt.sh
rm ./$dt.sh
