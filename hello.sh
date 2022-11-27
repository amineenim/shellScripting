#! /usr/bin/bash
# this file checks the existence of params 


if [[ $1 == "" ]] || [[ $1 == " " ]]
then 
        sh ./myscript.sh
else
case $1 in
        --help)
                echo "here u will get all details on how to run the script" 
                ;;
        add_image)
                # check for the second parameter
                if [[ $2 == "" ]] || [[ $2 == " " ]]
                then
                        echo "please add the image after the command in the form imageName.imageExstension or absolute/path/to/image "
                else 
                        sub='/'
                        # check if the given parameter contains / to know if it's a path or an imagename
                        if [[ "$2" == *"$sub"* ]]
                        then 
                                pathToImage=$2
                                # grab the name of directory and check if it exists
                                dir="${pathToImage%/*}" 
                                if [ -d "$dir" ]
                                then 
                                        # we grab the last part of the path wich corresponds to the name of the image to add
                                        lastPartOfPath=$(sed 's#.*/##' <<< "$2")
                                        # now that we have the last part of path, we verify the file extension
                                        image_name=${lastPartOfPath%%.*} 
                                        image_extension=${lastPartOfPath#*.}
                                        . ./test.sh 
                                        in_array $image_extension
                                        if [[ $? -eq 1 ]]
                                        then 
                                                # verify if the file exists 
                                                if [ -f $pathToImage  ]
                                                then 

                                                        echo "the image $image_name with exstension $image_extension will be added"
                                                        fileName=$image_name.$image_extension
                                                        echo $fileName
                                                        cd ..
                                                        cp $pathToImage ./images 
                                                        echo "image added successefully"
                                                        sh ./hello.sh 
                                                else 
                                                        echo "the given image $filename doesn't exist in your $dir, check the extension !"
                                                fi 
                                        else 
                                                echo "the file extension is not allowed, only jpg, png and jpeg"
                                        fi

                                else 
                                        echo "directory not found, give the absolute path like abolute/path/to/file"
                                fi 
                        else 
                                # now that the parameter doesn't contain / we deal with it as a file name 
                                imageFromUser=$2
                                # get file name and extension
                                image_name=${imageFromUser%%.*} 
                                image_extension=${imageFromUser#*.}
                                # check if the image has the required extension
                                . ./test.sh 
                                in_array $image_extension
                                if [[ $? -eq 1 ]] 
                                then 
                                        echo "the image $image_name with extension $image_extension will be added "
                                        fileName=$image_name.$image_extension
                                        echo $fileName
                                        cd ..
                                        cp $fileName ./images
                                        sh ./hello.sh

                                else 
                                         echo "the image extension is not allowed, only jpeg, png and jpg"
                                fi
                        fi 

                fi
                ;;
        *)
                echo "unkown option, type --help to check all possible commands"
esac
fi 



