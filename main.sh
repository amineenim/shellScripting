#! /bin/bash
# this file checks the existence of params 
touch executionHistory.txt


if [[ $1 == "" ]] || [[ $1 == " " ]]
then 
        echo "--main script is running without parameter" >> executionHistory.txt
        chmod +x myscript.sh
        echo "--main: running myscript.sh" >> executionHistory.txt
        ./myscript.sh 
else
case $1 in
        --help) 
                chmod u+x help.sh
                echo "--main: running help.sh" >> executionHistory.txt
                ./help.sh 
                ;;
        add_image)
                echo "--main script is running with add_image parameter" >> executionHistory.txt
                chmod u+x add_image.sh
                echo "--main: running add_image.sh" >> executionHistory.txt
                ./add_image.sh $@
                ;;
        build/*) 
                echo "--main script is running with build parameter" >> executionHistory.txt
                chmod u+x build.sh
                echo "--main: running build.sh" >> executionHistory.txt
                ./build.sh $@
                
                ;;
        --auth)
                echo "--main script is running with --auth parameter" >> executionHistory.txt
                chmod u+x auth.sh
                echo "--main: running auth.sh" >> executionHistory.txt
                ./auth.sh 
                
        ;;
        --debug)
                echo "-DEBUG MODE ON : " > executionHistory.txt
                shift
                . ./main.sh $@
                cat executionHistory.txt
        ;;
        *)
                echo "unkown option, type --help to check all possible commands"
        ;;
esac
fi 
echo "--fin execution main script " >> executionHistory.txt



