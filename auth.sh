#! /bin/bash
echo " here u can authenticate or register on the app !"
echo "is this your first visit ? still not having an account (y/n)"
read response 
if [[  $response == "y" ]]
then    
        echo "----auth.sh: sign up" >> executionHistory.txt
        echo "you don't have an account, u can register here !"
        echo "please enter a username"
        read username 
        while [[ $username == "" ]] || [[ $username == " " ]]
        do
                read username
        done 
            # the username is the only identifier for a user so it must be unique
        # verify if the file exists because it's only created when needed  
        
        if [ -f myBase.csv ]
        then 
        j=0
        while grep -q $username myBase.csv 
        do
                if [[ $j -eq 0 ]]
                then 
                        echo "username already taken, choose another one"
                        read username   
                else 
                        read username
                        j=$((j+1))
                fi 
        done    
        fi
        echo "please enter a password, ',' not allowed : "
        read -s password 
        # verify and validate password 
        while [[ $password == "" ]] || [[ $password == " " ]]
        do 
                read password 
        done 
        sub=','
        if [[ "$password" == *"$sub"* ]]
        then
                echo "comma not allowed in password, enter password again "
                while [[ "$password" == *"$sub"* ]]
                do 
                        read -s password
                done 
        fi 
        # add data to file.csv
        #nbrVisite = 1
        echo $username,$password >> myBase.csv
        echo "registration done successefully, now u can authenticate !"
        echo "----auth.sh: sign up done successefully" >> executionHistory.txt
        echo "----auth.sh: running myscript.sh" >> executionHistory.txt
        if [ -f state.txt ]
        then 
                echo "$username sign up successefully">> state.txt;
        else 
                touch state.txt
                chmod u+xwr state.txt
                echo "$username sign up successefully"> state.txt;
        fi
        ./myscript.sh 

elif [[  $response == "n" ]]
then
        echo "----auth.sh: log in " >> executionHistory.txt
        echo "okey, you have an account so provide ur crendetials !"
        echo "username : "
        read username 
        while [[ $username == "" ]] || [[ $username == " " ]]
        do
                read username
        done 
        if grep -q $username myBase.csv ;
        then 
        echo -n "password : "
        read -s password 
        while [[ $password == "" ]] || [[ $password == " " ]]
        do 
                read password 
        done 
        # here we have the user input we should only look for a matching in file.csv
        grep $username myBase.csv | awk -F ',' '{print $2}' > file.txt 
        while read line ;
        do 
                if [[ $line == $password ]]
                then    
                        echo " Nice to see you again Mr. $username "
                        if [ -f state.txt ]
                        then 
                                echo "$username log in successefully">> state.txt
                        else 
                                touch state.txt
                                chmod u+xwr state.txt
                                echo "$username log in successefully"> state.txt;
                        fi
                        echo "----auth.sh: log in done successefully" >> executionHistory.txt
                        chmod u+x myscript.sh
                        echo "----auth.sh: running myscript.sh" >> executionHistory.txt

                        ./myscript.sh 
                else 
                        echo "----auth.sh: password not matching, can't log in " >> executionHistory.txt
                        echo " password not matching, please retry again and verify your credentials !"
                fi
                done < file.txt 
                rm file.txt 
                
        else 
                echo "----auth.sh: no corresponding username found, can't log in " >> executionHistory.txt
                echo "no corresponding username found !"
        fi 
else 
        echo "please choose either y or n to respond !"
fi 