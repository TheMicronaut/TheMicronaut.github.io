echo START
#echo STARTING grund
#call grunt
echo STARTING jekyll serve
call jekyll serve --watch
explorer  http://127.0.0.1:4000/
echo END