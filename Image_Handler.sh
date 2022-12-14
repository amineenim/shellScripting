#! /bin/bash
# open the file and display it's content


# fonction qui vérifie la bonne extension des images 
function in_array ()
{
    allowed_extensions=("jpeg" "png" "jpg")
    for extension in ${allowed_extensions[@]}
    do
       if [[ $extension == $1  ]]
       then
           exists=1
           break
        else 
           exists=0
        fi
    done
    return $exists
}



echo "----Image_Handler.sh : start!" >> executionHistory.txt
if [ -d images ]
then 
    chmod u+wrx images
    if [ "( ls -A images )" ]
    echo "----Image_Handler.sh : images exist!" >> executionHistory.txt
    then
        cd images/
        for file in `ls . `
        do
           # vérifier l'extension du fichier 
           extension_file=${file#*.}
           name_file=${file%%.*}
           in_array "$extension_file"
           if [ $? -eq 1 ]
           then 
               # tout est bon, on crée une balise qui affiche cette image
               source=$name_file.$extension_file
               uniqueImage="<p><img class='pic' alt='$name_file' src='images/$source'></p>"
               cd ..
               echo $uniqueImage >> index.html
               cd images/
               echo "----Image_Handler.sh : added ${file%%.*} to index.html!" >> ../executionHistory.txt
            else
               echo "----Image_Handler.sh : ${file%%.*} could not be added to index.html!" >> ../executionHistory.txt
               echo "le fichier ${file%%.*} n'a pas un extension permise, il ne peut pas etre affiché"
            fi
        done
        

    else
        echo "----Image_Handler.sh : images is empty!" >> ../executionHistory.txt
        echo "le dossier images existe mais il est vide, pas d'images à afficher "
    fi 
else 
    echo "----Image_Handler.sh : images does not exist!" >> ../executionHistory.txt
    mkdir images 
    echo "----Image_Handler.sh : images directory created!" >> ../executionHistory.txt
fi 
echo "----Image_Handler.sh : end!" >> ../executionHistory.txt



