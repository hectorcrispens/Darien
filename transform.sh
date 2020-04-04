#!/bin/bash
touch transformed.sh

input="install.sh"
while IFS= read -r line
	do
	echo "echo \"$line\" >> darien" >>transformed.sh
done < "$input" 
