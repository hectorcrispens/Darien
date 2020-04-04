while [ -n "$1" ]; do # while loop starts

			case "$1" in
			basic)
			
				break
				;;

			make)
				
				break
				;;

			
			--)
				shift

				break
				;;

			*) echo "Option $1 not recognized" ;;

			esac

			shift

done

for variable in 1 2 3 4
do
done