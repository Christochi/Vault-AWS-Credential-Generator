/*
	Test Case: check if the subnet is a public subnet
	Test Type: Unit Test
*/

package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestAWSEC2(t *testing.T) {

	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	// terraform.Options is a struct
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../../modules/aws-ec2",
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variable
	subnetID := terraform.Output(t, terraformOptions, "subnet-data")

	/*
		function checks if subnet is public in the provided region

		last args ("") in the function, represents the region. 
		Since the the region is already configured in cat ~/.aws/config,
		there is no point putting the region unless you want to override it
	*/
	isPublic := aws.IsPublicSubnet(t, subnetID, "")

	assert.True(t, true, isPublic)
	
}
