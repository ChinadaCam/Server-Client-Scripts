#!/bin/bash

apt-get install apache2

cd /var/www/html

wget https://wallpapercave.com/wp/wp2754860.jpg
wget https://www.html.am/templates/downloads/bryantsmith/notepad/footer.png
wget https://www.html.am/templates/downloads/bryantsmith/notepad/icon.png
wget https://www.html.am/templates/downloads/bryantsmith/notepad/menu.png
wget https://www.html.am/templates/downloads/bryantsmith/notepad/notepad_back.png
wget https://www.html.am/templates/downloads/bryantsmith/notepad/titlebar.png

touch index.html
touch style.css

cat > index.html << EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />

<title>Projeto Final CISEG0919</title>
</head>

<body>
    <div id="page">

        <div id="titlebar">

                <h1>ProjetoFinal - Notepad</h1>
      </div>
        <div id="bar">
            <ul>
                <li><a href="#">File</a></li>
                <li><a href="#">Edit</a></li>
                <li><a href="#">Format</a></li>
                <li><a href="#">View</a></li>
                <li><a href="#">Help</a></li>
            </ul>
      </div>
        <div id="main">
        <h1>PABLO NERUDA, “NOTHING BUT DEATH”</h1>

        <p></p>

        <p>There are cemeteries that are lonely,</p>

        <p>graves full of bones that do not make a sound,</p>

        <p>the heart moving through a tunnel,</p>

        <p>in it darkness, darkness, darkness,</p>

        <p>like a shipwreck we die going into ourselves,</p>

        <p>as though we were drowning inside our hearts,</p>

        <p> as though we lived falling out of the skin into the soul.</p>

        </div>
        <div id="footer"></div>
        </div>
</body>
</html>
EOF

cat > style.css << EOF
html, body {
text-align: center;
}
p {text-align: left;}

body {
	margin: 0;
	padding: 0;
	background: #697281;
	font-family:  Arial, Helvetica, sans-serif;
	font-size: 13px;
	color: #F1F5F8;
	background-image:url(wp2754860.jpg;
	background-repeat:no-repeat;
}	
*
{
  margin: 0 auto 0 auto;
 text-align:left;}

#page
{
  margin: 0 auto 0 auto; 
  margin-top:25px;
  display: block; 
  height:auto;
  position: relative; 
  overflow: hidden; 
  width: 614px;
}

#titlebar
{
background-image:url(titlebar.png);
background-repeat:no-repeat;
height:30px;
width:614px;
overflow:hidden;
}




#titlebar h1
{
padding-left:21px;
margin-top:8px;
margin-left:5px;
width:510px;
position:relative;
color:#FFFFFF;
text-align:left;
font-size:14px;
font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
background-image:url(icon.png);
background-repeat:no-repeat;
overflow:hidden;
}




#bar
{
background-image:url(menu.png);
background-repeat:no-repeat;
height:39px;
width:610px;

padding-left:4px;
text-align:left;
font-family:Tahoma, "Tahoma", "Trebuchet MS", Arial;
font-size:11px;
}

#bar ul {
	padding: 0px;
	list-style-type: none;
	height:21px;
	text-align:left;
}
#bar ul li , #bar ul li a, #bar ul li a:visited{
	height:21px;
	margin: 0px;
	padding: 5px;
	padding-left:2px;
	padding-right:2px;
	height: 21px;
	overflow: hidden;
	display: inline;
	text-align:center;
	line-height:18px;
	color:#000000;

	text-decoration:none;
}


#bar ul li a:hover
{
color:#FFFFFF;
}

#bar ul li:hover
{
height:21px;
background:#316AC5;
}

#main
{

  width: 579px;
  padding-top:0px;
  padding-left:7px;
  padding-right:28px;
  font-family: "Lucida Console", Lucida Console, "Tahoma", "Trebuchet MS", Arial;
  background-image:url(notepad_back.png);
  background-repeat:repeat-y;
  color:#000000;
}


#footer
{
padding-top:6px;
background-image:url(footer.png);
background-repeat:no-repeat;
height:39px;
width:614px;
overflow:hidden;
text-align:center;
font-size:9px;
color:#E2E2E0;
}
#footer a, #footer a:visited, #footer a:hover
{
font-size:9px;
color:#E2E2E0;
}


#footer a:hover
{
color:#BCBCBC;
}



html, body {
text-align: center;
}
p {
padding-top:0px;
padding-bottom:15px;
text-align: left;
text-align:justify;
}

#main a
{
text-decoration:underline;
color:#373737;
}

#main a:hover
{
text-decoration:none;
color:#999999;
}

#main h1
{
  font-family: "Lucida Console", Lucida Console, "Tahoma", "Trebuchet MS", Arial;
  font-size:13px;
}
EOF

systemctl restart apache2
systemctl status apache2
