COMPUTER=30

read -p "Enter number: " NUMBER

if [ $NUMBER = $COMPUTER ]
then
    echo "You won!"
elif [ $NUMBER -gt $COMPUTER ] 
then
    echo "Your number is too high"
else
    echo "Your number is too low"
fi