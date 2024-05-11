#!/usr/bin/bash   
# add -x on the top of the file if you want to see script and output: -x

###################### check if the file exist ########################
FILE=file.txt
if [ -f "$FILE" ]
then 
	echo "$FILE exists"
else
	echo "$FILE doesn't exist"
fi

######################CHECK THE SIZE OF THE FILE #######################
echo "---------------------------------"
if [ -s "$FILE" ]
then 
	echo "file is not zero size "
else
	echo "$FILE is of zero size"
fi
#######################CHECK IF IT4S IS DIRECTORY OR FILE########################
echo "---------------------------------"
PATH=dir
if [ -d $PATH ]
then 
	echo "$PATH is a directory and note file"
elif [ -f $PATH ]
then 
	echo "$PATH is a file and not a directory"
else
	echo "$PATH not find"
fi
########################CHECK THE PERMESSION OF FILE########################
echo "---------------------------------"
FILE=file.txt 
if [ -r $FILE ] # same with -x for excute and -w for write
then
	echo "$FILE has read permission"
else 
	echo "$FILE has not read permession"
fi
########################CASE STATEMENT WITH NUMBER########################
echo "---------------------------------"
VAR=10
case $VAR in 
	10)
		echo "it's 10"
		;;
	20)
		echo "it's 20"
		;;
	30)
		echo "it's 30"
		;;
	*)
		echo "seems like another  number"
		;;
esac

CAR="BMW"
case $CAR in
	TOYOTA)
		echo "it's toyota"
		;;
	MERCEDES)
		echo "it's mercides"
		;;
	BMW)
		echo "it's BMW"
		;;
	*)
		echo "it's another car"
		;;
esac
##################### for loops #############################
echo "---------------------------------"
for i in {1..10}; do
	if (( $i<5 )); then
		echo $i;
	else
		break;
	fi
done
################## while loop ###############################
echo "---------------------------------"
i=0
while (( ++i <= 5 )); do 

	echo "counter of while loop is at $i"
done
################## array #################################
echo "---------------------------------"
car=( 'mercedes', 'honda', 'renault' )
for i in ${car[@]};do
	echo $i;
done
################# associative array acess by index #######
echo "---------------------------------"
declare -A  bic

bic[honda]=crf
bic[yamaha]=yzf
bic[kawazaki]=kxf

echo "${bic[honda]}"
################ acces to array by index ###############
echo "-----------------------------------"
declare -a  bic

bic[0]=crf
bic[1]=yzf
bic[2]=kxf

for i in ${bic[@]}; do echo $i; done
################# read file from script ##################
echo "---------------------------------"
file='read_this.txt'
n=1
while read line; do
  echo "line-$n : $line"
  n=$((n+1))
if ((n>5)); then
  break;
fi
done < $file
############### read  array from user ####################
echo "---------------------------------"
echo "Give input to enter into array: "
read -a arrayVar

echo " The given input array member are as follows:"
for i in ${arrayVar[@]}; do 
	echo $i
done
############## read commande with delimiter ############
echo "----------------------------------"

echo "enter the car and the model: "
IFS='|' read car model <<< 'BMW | i8 '
echo "Gello, car is $car and model is $model"
############# read commande with timeout ##############
echo "-----------------------------------"

date
read -t 14 -p "Press Enter key or wait for 14 seconds "  
date
############ select option with commande ##############
PS3='please choose a car company: '

cars=("bmw" "toyota" "honda" "Quit")

select car in "${cars[@]}"
do 
   case $car in
       "bmw") 
          echo "You choose BMW"
          ;;
       "toyota")
          echo  "You choose toyota"
          ;;
       "honda")
          echo "You choose honda"
          ;;
       "Quit")
          break 
          ;;
        *)
          echo "invalid option $REPLY"
    esac
done
######### menu option whit select command ##########
PS3='Select any of the programtion language: '
menu_from_array(){
  select item; do 
    if [[ 1 -le "$REPLY" && "$REPLY" -le $# ]]; then 
      echo "The selected programtion language is $item"
      break;
    else
      echo "Wrong selection: Selct any naumber from 1 - $#"
    fi
  done

}
languages=( "Python" "C" "JAVA" "PHP" "MOJO" )

menu_from_array "${languages[@]}"
