#! /bin/bash
# since the user can input either the absolute path or relative path from working directory
# i will generate a firstpath which corresponds to the absolute path and second path wich
# corresponds to the path relative to working directory when bash script is located
echo $1 > file1.txt
sed -i 's.build..' file1.txt 
myFirstPath=$( cat file1.txt )
# get the pwd in a second file and concatenate with first file
pwd > file2.txt
currentDir=$(while IFS= read -r line; 
do
        printf '%s\n' "$line"
done < file2.txt)
concatResult=$( cat file2.txt file1.txt )
# get rid of space in the concatResult
echo $concatResult > file3.txt 
sed -i 's/ //' file3.txt
# read from file3.txt and pass that to a variable which holds the secondpath
mySecondPath=$(
        while IFS= read -r line
        do 
                printf '%s\n' "$line"
        done < file3.txt 
)
rm file1.txt file2.txt file3.txt 
# verify if directories exist 
if [ -d $myFirstPath ]
then    
        echo "----build.sh: target directory found" >> executionHistory.txt
        echo "----build.sh: building the project in the target directory " >> executionHistory.txt
        # build project in target directory 
        cp -r $currentDir/* $myFirstPath
        echo "$myFirstPath exists"
        cd $myFirstPath
        echo "----build.sh: running myscript.sh" >> executionHistory.txt
        chmod u+x  myscript.sh 
        ./myscript.sh 
elif [ -d $mySecondPath ]
then 
        echo "----build.sh: target directory found" >> executionHistory.txt
        echo "----build.sh: building the project in the target directory " >> executionHistory.txt
        cp -r $currentDir/* $mySecondPath
        echo " $mySeondPath existing "
        cd $mysecondPath
        chmod u+x myscript.sh
        echo "----main: running myscript.sh" >> executionHistory.txt
        ./myscript.sh 
else 
        echo "----build.sh: target directory not found" >> executionHistory.txt
        echo "not such directory found !"
fi