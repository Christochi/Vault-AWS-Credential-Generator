## pass variables to terraform using -var option in Vars: map[string]interface{}{} block
~~~
terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../../modules/aws-ec2",

		// variables are passed to terraform using -var option
		Vars: map[string]interface{}{

			"subnet-tag": "tochi-subnet",
		},
})
~~~

## configure dependencies

#### Example
- `cd test/aws-ec2`
- `go mod init test`
- `go mod tidy`

## run test

#### Example
`go test`

***unit test for vault-aws is in progress***