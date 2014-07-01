ECHO Create datetime subdirectory
for /f "tokens=2-4 delims=/- " %%a in ('date /t') do (set mydate=%%c%%b%%a)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)

git checkout master
git reset --hard origin/master

git checkout -b %mydate%_%mytime% 

ECHO Install tools locally
call npm install yo
call npm install generator-polymer

node_modules\.bin\yo polymer:app < polymer-start.yo
