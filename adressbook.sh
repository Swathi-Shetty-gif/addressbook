#!/bin/bash -x
echo "welcome to adress book"
declare -A address
echo "maximum slots is 10"
for ((i=0;i<10;i++))
do
address[$i,0]=" "
done
function Address(){

        read -p "Enter First name:" Firstname
        address[$1,0]=$Firstname
         read -p "Enter Last name:" Lastname
        address[$1,1]=$Lastname
         read -p "Enter mob number:" Mobnum
        address[$1,2]=$Mobnum
        read -p "Enter City:" city
        address[$1,3]=$city
         read -p "Enter State:" state
        address[$1,4]=$state
         read -p "Enter pin:" pin
        address[$1,5]=$pin
}
function display()
{
count=1
for ((i=0;i<=5;i++))
do
echo "Slot:$count"
	((count++))
	for ((j=0;j<=6;j++)) do
        echo  ${address[$i,$j]}
    done
done

}
function insert()
{

count=0
stop=$1
empty=" "
for ((i=0;i<=10;i++))
do
if [[ " ${address[$i,0]} " =~ " $empty " ]]
then
        Address $i
        ((count++))
        echo "next"
else
        continue
fi
if [ $count -eq $stop ]
then
        break
fi
done
}
#existing Address
address[0,0]=Swathi 
address[0,1]=shetty
address[0,2]=1234567894
address[0,3]=udupi
address[0,4]=karnataka
address[0,5]=574102
address[1,0]=shruthi
address[1,1]=shetty
address[1,2]=9611855690
address[1,3]=bailure
address[1,4]=karnataka
address[1,5]=575024

function edit()
{
position=$(($1-1))
echo "1.First name 2.last name 3.mobile number 4.city 5.state 6.pin"
read -p "select number from the above fields to edit" field
case $field in
        1)read -p "ReEnter Firstname:" edit
        address[$position,0]=$edit;;
        2)read -p "ReEnter Lastname:" edit
        address[$position,1]=$edit;;
        3)read -p "ReEnter Mobile number:" edit
        address[$pos,2]=$edit;;
        4)read -p "ReEnter city:" edit
        address[$position,3]=$edit;;
        5)read -p "ReEnter state:" edit
        address[$position,4]=$edit;;
        6)read -p "ReEnter pin:" edit
        address[$position,5]=$edit;;
        *);;
esac
}
function delete()
{

read -p "enter slot number to delete" pos
pos=$(($pos-1))
echo "deleted Adress"
for((i=0;i<6;i++))
do
	echo {$address[$pos,$i]}

done
for ((i=0;i<6;i++));do 
address[$pos,$i]=' ';done
}







while [ true ]
do
echo "1.display the address 2.insert 3.edit 4.delete 5.exit"
read -p  "enter your choices" choice
case $choice in
	1)display;;
	2)read -p "how many adress will u add:" num
		insert $num;;
	3)read -p  "enter the adreess slot number  to edit :" e
		edit $e;;
	4)delete;;
	5)exit;;
	*)echo "enter your correct choice";;
		
esac

done