set username=Administrator
set password=manage
set url=http://localhost:5566
#set apiID=dda7a194-dced-4c2f-912f-4bd85a3ba965
set apiID=c7595f02-b8cd-457a-8f62-e7a7da6c6678
set file=.\assets\Microgateway\Customer.zip

curl -u %username%:%password% %url%/rest/apigateway/archive?apis=%apiID% --output %file%
