#!/bin/bash

# author "shavendra Ekanayake"
# purpose "create sass base 7-1 architecture folder and file system"
mkdir -p css sass css/image
touch css/style.css index.html

echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Document</title>
</head>
<body>
    <h1>working</h1>
</body>
</html>" > index.html

echo "create npm init [+]"
npm init 
npm install node-sass --save-dev


echo "creating sass architecture"



cd sass
mkdir  abstract vendors base layout component pages themes 
touch main.scss abstract/{_variables.scss,_mixins.scss}   vendors/_bootstrap.scss base/{_reset.scss,_typography.scss} layout/{_navigation.scss,_grid.scss,_header.scss,_footer.scss,_sidebar.scss,_forms.scss} component/{_button.scss,_carousel.scss,_cover.scss,_dropdown.scss} pages/{_home.scss,_contact.scss} themes/{_thems.scss,_admin.scss}
echo "@import 'abstract/variables';
@import 'abstract/mixins';
@import 'base/typography';
@import 'base/typography';
@import 'themes/admin';
@import 'themes/thems';
@import 'component/button';
@import 'component/carousel';
@import 'component/cover';
@import 'component/dropdown';
@import 'layout/footer';
@import 'layout/forms';
@import 'layout/grid';
@import 'layout/header';
@import 'layout/navigation';
@import 'layout/sidebar';
@import 'pages/contact';
@import 'pages/home';
@import 'vendors/bootstrap';" > main.scss
echo "import success"



echo "[++++++++++++++++++++++++] layout float layout creating [++++++++++++++++++++++++++++++++++++++++++]"
echo ".row{
    max-width : \$grid-width;
    margin:0 auto; // block element inside of  the another block element 
    &:not(:last-child){
        margin-bottom: \$gutter-vertical;
    }

    @include clearfix;


    [class^='col-']{
        float:left;
        background-color: orange;
        &:not(:last-child){
            margin-right: \$gutter-horizontal;
        }    
    }

    .col-1-of-2{
        width: calc((100% - #{\$gutter-horizontal})/2);        
        // display: inline-block; // cant because you think it 
      
    }

    .col-1-of-3{
        width: calc((100% - 2 * #{\$gutter-horizontal})/3);            
     
    }

    .col-2-of-3{
        width: calc(((100% - 2 * #{\$gutter-horizontal})/3)*2 + #{\$gutter-horizontal});   
    }

    .col-1-of-4{
        width: calc((100% - 3 * #{\$gutter-horizontal})/4); 
    }

    .col-2-of-4{
        width: calc(((100% - 3 * #{\$gutter-horizontal})/4)*2 + #{\$gutter-horizontal}); 
    }

    .col-3-of-4{
        width: calc(((100% - 3 * #{\$gutter-horizontal})/4)*3 + #{\$gutter-horizontal}*2); 
    }

    
   
}" > layout/_grid.scss 

echo "
// grid width 
\$grid-width : 114rem;
\$gutter-vertical : 8rem;
\$gutter-horizontal : 6rem;" >   abstract/_variables.scss

echo "@mixin clearfix {
   &::after{
       content: "";
       display: table;
       clear: both;
   }
}" > abstract/_mixins.scss

cd ../
touch grid.html 
echo "
    <section class="grid-test">
        <div class="row">
            <div class="col-1-of-2">col-1-of-2</div>
            <div class="col-1-of-2">col-1-of-2</div>
        </div>


        <div class="row">
            <div class="col-1-of-3">col-1-of-3</div>
            <div class="col-1-of-3">col-1-of-3</div>
            <div class="col-1-of-3">col-1-of-3</div>
        </div>


        <div class="row">
            <div class="col-1-of-3">col-1-of-3</div>
            <div class="col-2-of-3">col-2-of-3</div>           
        </div>


        <div class="row">
            <div class="col-1-of-4">col-1-of-4</div>
            <div class="col-1-of-4">col-1-of-4</div>   
            <div class="col-1-of-4">col-1-of-4</div>
            <div class="col-1-of-4">col-1-of-4</div>           
        </div>


        <div class="row">
            <div class="col-1-of-4">col-1-of-4</div>
            <div class="col-1-of-4">col-1-of-4</div>   
            <div class="col-2-of-4">col-2-of-4</div>                     
        </div>
        

        <div class="row">
            <div class="col-1-of-4">col-1-of-4</div>            
            <div class="col-3-of-4">col-3-of-4</div>                     
        </div>


    </section>" > grid.html

git init
live-server


# END