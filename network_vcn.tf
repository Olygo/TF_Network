## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

#VCN
resource "oci_core_vcn" "vcn_01" {
  cidr_block     = var.vcn_01_cidr_block
  dns_label      = var.vcn_01_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_01_display_name
}