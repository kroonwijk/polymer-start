ECHO Create datetime branch
for /f "tokens=2-4 delims=/- " %%a in ('date /t') do (set mydate=%%c%%b%%a)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

git checkout master
git reset --hard origin/master

git checkout -b %mydate%_%mytime% 

ECHO Install tools locally
call npm install bower
call npm install yo
call npm install generator-polymer

IF exist app ( GOTO :exists )
ECHO Create app folder
mkdir app
cd app

SET PATH=%PATH%;..\node_modules\.bin
call yo polymer:app < ..\polymer-start.yo
cd ..

:exists

"%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" --disable-web-security file:///%CD%/app/index.html

