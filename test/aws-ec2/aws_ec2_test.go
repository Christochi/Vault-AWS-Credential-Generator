/*
	Test Case:
	- Asserts the correctness of the subnet tag
	- check if the subnet is a public subnet

	Test Type: Unit Test
*/
package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAWSEC2(t *testing.T) {

	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	// terraform.Options is a struct
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../modules/aws-ec2",

		// variables are passed to terraform using a map
		Vars: map[string]interface{}{
			//put something

		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variable
	subnetID := terraform.Output(t, terraformOptions, "subnet-data")

	// print output value
	fmt.Printf("The subnet-id is %s\n", subnetID)

}
