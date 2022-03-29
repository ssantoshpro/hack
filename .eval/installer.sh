#!/bin/bash

created=0
[ -d $1 ] && created=1 || mkdir $1
[ -d $1/$2 ] && created=2 || mkdir $1/$2
if [ $created -lt 2 ]
then
  cd $1/$2
  git init --bare > /dev/null 2>&1
  cd ../..
fi
cd $3
if [ ! -d $4 ]
then
    git init > /dev/null 2>&1
    echo "a = 10">>linked_list.cpp
    echo "b = 20">>linked_list.cpp
    echo "#perform logical AND">>linked_list.cpp
    echo "c = a < 5 &&  b < 10">>linked_list.cpp
    git add . 
    git commit -m "Perform logical AND" > /dev/null 2>&1
    echo "#perform logical OR">>linked_list.cpp
    echo "d = a < 5 || b < 4">>linked_list.cpp
    git add . 
    git commit -m "Perform logical OR" > /dev/null 2>&1
    echo "#perform logical NOT">>linked_list.cpp
    echo "e = !(a < 5 && b < 10)">>linked_list.cpp
    git add . 
    git commit -m "Perform logical NOT" > /dev/null 2>&1
    echo "#perform modulus of a and b">>linked_list.cpp
    echo "f = a%b">>linked_list.cpp
    git add . 
    git commit -m "Perform modulus" > /dev/null 2>&1
    sed -i '2s/.*/b = 40/' linked_list.cpp
    git add . 
    git commit -m "Perform calculation" > /dev/null 2>&1
    echo "print 'The logical AND of a and b is: ',c" >> linked_list.cpp
    git add . 
    git commit -m "Print logical AND result" > /dev/null 2>&1
    echo "print 'The logical OR of a and b is: ',d" >> linked_list.cpp
    echo "print 'The logical NOT of a and b is: ',e" >> linked_list.cpp
    git add . 
    git commit -m "Print logical AND and OR result" > /dev/null 2>&1
    echo "print 'The modulus of a and b is: ',f" >>linked_list.cpp
    git add . 
    git commit -m "Print modulus result" > /dev/null 2>&1
fi
cd ..