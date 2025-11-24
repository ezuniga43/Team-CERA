#!/usr/bin/env bash
charc="c";charC="C";charf="f";charF="F";chark="k";charK="K"

read -p "Enter the unit of temperature (C, F, K) : " tempType

while [[ $tempType != $charc && $tempType != $charC && $tempType != $charf && $tempType != $charF && $tempType != $chark && $tempType != $charK ]]; do
    echo "Wrong input. Enter C, F, or K"
    read -p "Enter the unit of temperature (C, F, K): " tempType
done

if [[ $tempType == $charc || $tempType == $charC ]]
then
    read -p "Enter Celsius: " celsiusNum

    while [[ $celsiusNum =~ ^[A-Za-z]+$ ]]; do
        echo "Wrong input. Enter a whole number"
        read -p "Enter Celsius: " celsiusNum
    done
    celtoF=$(echo "scale=2; $celsiusNum * (9/5) + 32"|bc)
    celtoK=$(echo "scale=2; $celsiusNum + 273.15"|bc)
    echo "Farenheit: $celtoF"
    echo "Kelvin: $celtoK"
   
elif [[ $tempType == $charf || $tempType == $charF ]]
then
    read -p "Enter Farenheit: " farenNum

    while [[ $farenNum =~ ^[A-Za-z]+$ ]]; do
        echo "Wrong input. Enter a whole number"
        read -p "Enter Farenheit: " farenNum
    done
    farentoC=$(echo "scale=2; ($farenNum - 32) * 5/9"|bc)
    farentoK=$(echo "scale=2; ($farenNum - 32) * 5/9 + 273.15"|bc)
    echo "Celsius: $farentoC"
    echo "Kelvin: $farentoK"
    

elif [[ $tempType == $chark || $tempType == $charK ]]
then
    read -p "Enter Kelvin: " kelvinNum

    while [[ $kelvinNum =~ ^[A-Za-z]+$ ]]; do
        echo "Wrong input. Enter a whole number"
        read -p "Enter Kelvin: " kelvinNum
    done
    keltoC=$(echo "scale=2; $kelvinNum - 273.15"|bc) 
    keltoF=$(echo "scale=2; ($kelvinNum - 273.15) * 9/5 + 32"|bc)
    echo "Celsius: $keltoC"
    echo "Farenheit: $keltoF"
    
fi