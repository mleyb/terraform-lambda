zip-func:
	zip func.zip ./src/func.js

create-bucket:
	aws s3 mb s3://mleyb-lambda-bucket

delete-bucket:
	aws s3 rb s3://mleyb-lambda-bucket

upload-v1-func:
	aws s3 cp func.zip s3://mleyb-lambda-bucket/v1.0.0/func.zip

delete-v1-func:
	aws s3 rm s3://mleyb-lambda-bucket/v1.0.0/func.zip

invoke-func:
	aws lambda invoke --region=eu-west-1 --function-name=Func output.txt

tf-apply:
	terraform apply

tf-destroy:
	terraform destroy

