echo START
#echo STARTING grund
call grunt
echo STARTING jekyll serve
explorer  http://127.0.0.1:4000/
call jekyll serve --no-watch
echo END