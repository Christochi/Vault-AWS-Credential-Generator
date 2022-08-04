/*
	Test Case:
		- check if the vault aws secret backend exists
		- login using the generated credentials
	Test Type: Unit Test
*/

package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestVaultAWS(t *testing.T) {

	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	// terraform.Options is a struct
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../../modules/vault-aws",
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of the IAM Role
	// iamRole := terraform.OutputMap(t, terraformOptions, "secret-backend-data")

	// fmt.Printf("Aws role %s\n", iamRole)

}

//
func TestVaultAWSSecretBackendExist(t *testing.T) {

}
