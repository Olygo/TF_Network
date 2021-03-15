## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Get list of availability domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.compartment_ocid
}

data "oci_core_services" "OCIServices" {
	filter {
		name = "name"
		values = ["All*"]
		regex = true
	  }
	}
  
data "oci_core_services" "OCIStorageServices" {
	filter {
		name = "name"
		values = [".*Object.*Storage"]
		regex = true
	  }
	}