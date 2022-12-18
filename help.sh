#! /bin/bash

echo "--main script is running with --help parameter" >> executionHistory.txt
echo -e  "
        add_image : allows you to add an image either by directly defining the imageName and exstension \n\t\t\t or defining an absolute path to your image\n
        build/(path/to/dir) : allows you to build your project in a specific firectory either by defining \n\t\t\t an absolute path or relative path to working directory\n
        --auth : allows you to either authenticate to the app or register\n
        --help : displays a listing of all available options for the script and their structres\n
        --debug : descript the script execution
        --states : show how much users acounts are created on the web site and the number of visits on the website "