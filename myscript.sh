#! /usr/bin/bash 


# on commence par générer un fichier index.html vide pour le peupler de balises
# et un autre style.css qui contiendra les styles des différents eléments
touch index.html
touch style.css 


startEntete="
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    "

linkToStyle="<link href='style.css' rel='stylesheet'>"

endEntete='
</head>
'
# ajout de l'entete de la page html 
echo $startEntete $linkToStyle $endEntete > index.html 

bodyOpeningTag="<body>"

# ajout de la section de la page avec sa balise de style
section="
<section>
  <span>Welcome to our Galery Blog</span>
</section>
"
sectionStyle='
section {
  height: 80vh;
  background: coral;
  margin-bottom : 20px;
}
'
bodyStyle='
body {
    display :flex;
    flex-direction :column;
}

'
sectionSpanStyle='
section span {
  margin: 0;
  font-size: 400%;
  text-align: center;
  line-height: 1;
  padding-top: calc(50vh - 20pt);
  display: block;
  font-weight: 700;
}'

echo $bodyOpeningTag $section >> index.html 
echo $bodystyle $sectionStyle $sectionSpanStyle > style.css
# ajout de la balise de style appliquée a toutes les balises de la page

commonStyle='
\* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-kerning: auto;
}
html {
  font-size: 10pt;
  line-height: 1.4;
  font-weight: 400;
  font-family: Roboto, 'HelveticaNeue-Light', Tahoma, Geneva, Arial, sans-serif;
  -webkit-text-size-adjust: 100%;
}'

echo $commonStyle >> style.css 


# ajout de la balise ouvrante de la partie articles et son style

articleOpeningTag='
<article>
'
echo $articleOpeningTag >> index.html 


# call the other script which handles interacting with images folder
sh ./test.sh 

articleStyle='
article {
  display : flex;
  flex-direction: column;
  align-items :center;
  padding: 1em;
  font-size: 140%;
  background: white;
  box-shadow: rgba(0,0,0,.05) 0 3px 15px;
  
}
'
articleParagraphStyle='
article p {
  margin: 0;
  color: #333;
}'

imageStyle='
img {
    width : 500px;
    max-width : 600px;
    height : 500px;
    border : black solid 1px;
    border-radius :10px;
}

'

articleClosingTag='</article>'
echo $articleStyle $articleParagraphStyle $imageStyle >> style.css 
echo $articleClosingTag >> index.html 

start ./index.html 