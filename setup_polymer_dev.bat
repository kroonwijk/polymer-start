ECHO Create datetime subdirectory
for /f "tokens=2-4 delims=/- " %%a in ('date /t') do (set mydate=%%c%%b%%a)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
mkdir "polymer_%mydate%_%mytime%" 
cd "polymer_%mydate%_%mytime%"

ECHO Install tools locally
call npm install git
call npm install yo
call npm install generator-polymer

ECHO Get back to where we came from
cd .. 