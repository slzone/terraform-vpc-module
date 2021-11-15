terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.35.0"
    }
    template = {
      source = "hashicorp/template"
      version = "2.2.0"
    }
  }
}
