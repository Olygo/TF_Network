## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

## Variables
	  ### Main variables

    variable "region" {
      description = "Region where you want to deploy the resources defined by this stack"
    }
    variable "compartment_ocid" {
      description = "Compartment where you want to deploy the resources defined by this stack"
    }
    ##variable "fingerprint" {}
    ##variable "user_ocid" {}
    ##variable "tenancy_ocid" {}
    ##variable "private_key_path" {}
    ##variable "availablity_domain_name" {}

    #variable "release" {
    #  description = "Reference Architecture Release"
    # default     = "1.0"
    #}

# ==============================================

  // On-premises CIDR blocks

    variable "on-premise_01_cidr_block" {
      default = "10.160.0.0/16"
      description = "On-premises Cidr block N_XXXX_HOLDING"
    }

    variable "on-premise_02_cidr_block" {
      default = "172.28.66.80/28"
      description = "On-premises Cidr block N_XXXX_ALTERYX"
    }

    variable "on-premise_03_cidr_block" {
      default = "172.28.11.0/24"
      description = "On-premises Cidr block N_XXXX_PIE"
    }

    variable "on-premise_04_cidr_block" {
      default = "10.0.0.0/8"
      description = "On-premises Cidr block N_XXXX_LAN_Global"
    }

    variable "on-premise_05_cidr_block" {
      default = "172.28.32.0/19"
      description = "On-premises Cidr block N_XXXX_Pool_VPN_SSL1"
    }

    variable "on-premise_06_cidr_block" {
      default = "172.26.0.0/19"
      description = "On-premises Cidr block N_XXXX_Pool_VPN_SSL2"
    }

    variable "argus_cidr_block" {
      default = "0.0.0.0/0"
      description = "Argus Cidr block"
    }
# ==============================================

	  // VCN

    variable "vcn_01_display_name" {
      default = "vcn_01"
      description = "Display name of your Virtual Cloud Network"
    }
    variable "vcn_01_cidr_block" {
      default = "172.19.0.0/24"
      description = "Cidr block for your VCN"
    }
    variable "vcn_01_dns_label" {
      default = "vcn01"
      description = "Dns label for resources in your VCN"
    }
   
# ==============================================

	  // SUBNETS

# -----------------------------------------------
    variable "private_subnet_06_display_name" {
      default = "saas-dev_subnet_private"
      description = "Private Subnet #6 Display name"
    }
    variable "private_subnet_06_cidr_block" {
      default = "172.19.0.80/28"
      description = "Private Subnet #6 Cidr block"
    }
    variable "private_subnet_06_dns_label" {
      default = "saasdev"
      description = "DNS label for resources in this Subnet"
    }
# -----------------------------------------------
    variable "private_subnet_05_display_name" {
      default = "saas-rect_subnet_private"
      description = "Private Subnet #5 Display name"
    }
    variable "private_subnet_05_cidr_block" {
      default = "172.19.0.64/28"
      description = "Private Subnet #5 Cidr block"
    }
    variable "private_subnet_05_dns_label" {
      default = "saasrect"
      description = "DNS label for resources in this Subnet"
    }
# -----------------------------------------------
    variable "private_subnet_04_display_name" {
      default = "saas-prod_subnet_private"
      description = "Private Subnet #4 Display name"
    }
    variable "private_subnet_04_cidr_block" {
      default = "172.19.0.48/28"
      description = "Private Subnet #4 Cidr block"
    }
    variable "private_subnet_04_dns_label" {
      default = "saasprod"
      description = "DNS label for resources in this Subnet"
    }
# -----------------------------------------------
    variable "private_subnet_03_display_name" {
      default = "multi-dev_subnet_private"
      description = "Private Subnet #3 Display name"
    }
    variable "private_subnet_03_cidr_block" {
      default = "172.19.0.40/29"
      description = "Private Subnet #3 Cidr block"
    }
    variable "private_subnet_03_dns_label" {
      default = "mulltidev"
      description = "DNS label for resources in this Subnet"
    }
# -----------------------------------------------
    variable "private_subnet_02_display_name" {
      default = "multi-rect_subnet_private"
      description = "Private Subnet #2 Display name"
    }
    variable "private_subnet_02_cidr_block" {
      default = "172.19.0.32/29"
      description = "Private Subnet #2 Cidr block"
    }
    variable "private_subnet_02_dns_label" {
      default = "mulltirect"
      description = "DNS label for resources in this Subnet"
    }
# -----------------------------------------------
    variable "private_subnet_01_display_name" {
      default = "multi-prod_subnet_private"
      description = "Private Subnet #1 Display name"
    }
    variable "private_subnet_01_cidr_block" {
      default = "172.19.0.24/29"
      description = "Private Subnet #1 Cidr block"
          }
    variable "private_subnet_01_dns_label" {
      default = "mulltiprod"
      description = "DNS label for resources in this Subnet"
    }
# -----------------------------------------------
    variable "public_subnet_01_display_name" {
      default = "interco_subnet_public"
      description = "DMZ Public Subnet Display name"
    }
    variable "public_subnet_01_cidr_block" {
      default = "172.19.0.0/28"
      description = "DMZ Cidr block"
    }
    variable "public_subnet_01_dns_label" {
      default = "interco"
      description = "DNS label for resources in this Subnet"
    }
# -----------------------------------------------
    #GW
    variable "igw_01_display_name" {
      default = "igw_01"
      description = "Internet Gateway display name"
    }
    variable "ngw_01_display_name" {
      default = "ngw_01"
      description = "Nat Gateway display name"
    }	
    variable "sgw_01_display_name" {
      default = "sgw_01"
      description = "Service Gateway display name"    
    }

# ==============================================

    #DGR Vpn Connect
    variable "drg_01_display_name" {
      default = "drg_01"
      description = "Dynamic Routing Gateway display name"
    }
    variable "drg_attachment_01_display_name" {
      default = "drg_attachment_01"
    }
    variable "cpe_01_display_name" {
      default = "cpe_01"
    }
    variable "cpe_01_ip_address" {
      default = "100.100.100.100"
      description = "IP Address of your on-premise VPN gateway" 
    }
    variable "my_ipsec_display_name" {
      default = "MyIPSecConnection"
    }
  variable "display_name_tunnel1" {
      default = "Tunnel1"
    }    
  variable "routing_method1" {
      default = "POLICY"
    }    
  variable "sharedSecret1" {
      default = "UiXcLcx2RFKndBwaJpM4fdhGLu2B8WxrgDm83X3nTpwjJ3GHoLJ6BaZyyrvZrUwZgcZVsDShGUxPbTZoh4SwD69cnMdRGjUM888"
    }
  variable "ike_version1" {
      default = "V2"
    }  
  variable "display_name_tunnel2" {
      default = "Tunnel2"
    }    
  variable "routing_method2" {
      default = "POLICY"
    }    
  variable "sharedSecret2" {
      default = "UiXcLcx2RFKndBwaJpM4fdhGLu2B8WxrgDm83X3nTpwjJ3GHoLJ6BaZyyrvZrUwZgcZVsDShGUxPbTZoh4SwD69cnMdRGjUM8777"
    }
  variable "ike_version2" {
      default = "V2"
    }

# ==============================================

    #Route Tables
    variable "public_route_table_display_name" {
      default = "public_route_table"
    }
    variable "private_route_table_display_name" {
      default = "private_route_table"
    }

# ==============================================

    #Security Lists
    variable "sl_00_display_name" {
      default = "interco_SL"
    }
    variable "sl_01_display_name" {
      default = "multi_prod_SL"
    }
    variable "sl_02_display_name" {
      default = "multi_rect_SL"
    }
    variable "sl_03_display_name" {
      default = "multi_dev_SL"
    }
    variable "sl_04_display_name" {
      default = "saas_prod_SL"
    }
    variable "sl_05_display_name" {
      default = "saas_rect_SL"
    }
    variable "sl_06_display_name" {
      default = "saas_dev_SL"
    }

# ==============================================

        #NSGs
    variable "nsg_01_display_name" {
      default = "nsg_atp"
    }