resource "oci_core_cpe" "my_cpe" {
  compartment_id      = var.compartment_ocid
  display_name        = var.cpe_01_display_name
  ip_address          = var.cpe_01_ip_address
  
  # FortinetFortigate 6+
  cpe_device_shape_id = "15addf76-6ecd-4a76-a1e7-527edd848471"

  # Cisco/ASA
  #cpe_device_shape_id = "a2be6b04-4ef2-4fa4-8789-56cfc1f022ce"

  # use "terraform show" after "terraform apply" using "cpe_device_shape_id = data.oci_core_cpe_device_shape.my_cpe_device_shape.id" to get all Device IDs
}

resource "oci_core_drg" "drg_01" {
  compartment_id = var.compartment_ocid
  display_name   = var.drg_01_display_name
}

#DRG Attachment
resource "oci_core_drg_attachment" "drg_attachment_01" {
    drg_id = oci_core_drg.drg_01.id
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.drg_attachment_01_display_name
#    route_table_id = oci_core_route_table.public_route_table.id

  // Use this advanced feature only if you're setting up transit routing.
  // Important: If you associate a route table, the gateway must then always have a route table associated with it. 
  // You can replace the route table with another or delete the rules.

}


# IPSEC & TUNNEL SETUP


resource "oci_core_ipsec" "my_ipsec_connection" {
  #Required
  compartment_id = var.compartment_ocid
  cpe_id = oci_core_cpe.my_cpe.id
  drg_id = oci_core_drg.drg_01.id
  static_routes  = [var.on-premise_01_cidr_block,var.on-premise_02_cidr_block,var.on-premise_03_cidr_block,var.on-premise_04_cidr_block,var.on-premise_05_cidr_block,var.on-premise_06_cidr_block]

  #Optional
  cpe_local_identifier      = var.cpe_01_ip_address
  cpe_local_identifier_type = "IP_ADDRESS"
  display_name = var.my_ipsec_display_name
}

#IPSEC Tunnels
data "oci_core_ipsec_connections" "my_ipsec_connection" {
  compartment_id = var.compartment_ocid

  cpe_id = oci_core_cpe.my_cpe.id
  drg_id = oci_core_drg.drg_01.id
}

data "oci_core_ipsec_connection_tunnels" "my_ip_sec_connection_tunnels" {
  ipsec_id = oci_core_ipsec.my_ipsec_connection.id
}


// Tunnel_#1

resource "oci_core_ipsec_connection_tunnel_management" "my_ipsec_connection_tunnel_management" {
  ipsec_id  = oci_core_ipsec.my_ipsec_connection.id
  tunnel_id = data.oci_core_ipsec_connection_tunnels.my_ip_sec_connection_tunnels.ip_sec_connection_tunnels[0].id

  encryption_domain_config {
    cpe_traffic_selector      = [var.on-premise_02_cidr_block,var.on-premise_03_cidr_block,var.on-premise_04_cidr_block,var.on-premise_05_cidr_block,var.on-premise_06_cidr_block]
    oracle_traffic_selector   = [var.vcn_01_cidr_block]


  }

  display_name  = var.display_name_tunnel1
  routing       = var.routing_method1
  shared_secret = var.sharedSecret1
  ike_version   = var.ike_version1
}

// Tunnel_#2

resource "oci_core_ipsec_connection_tunnel_management" "my_ipsec_connection_tunnel_management2" {
  depends_on = [oci_core_ipsec_connection_tunnel_management.my_ipsec_connection_tunnel_management]
  ipsec_id  = oci_core_ipsec.my_ipsec_connection.id
  tunnel_id = data.oci_core_ipsec_connection_tunnels.my_ip_sec_connection_tunnels.ip_sec_connection_tunnels[1].id

  encryption_domain_config {
    cpe_traffic_selector      = [var.on-premise_02_cidr_block,var.on-premise_03_cidr_block,var.on-premise_04_cidr_block,var.on-premise_05_cidr_block,var.on-premise_06_cidr_block]
    oracle_traffic_selector   = [var.vcn_01_cidr_block]  

  }

  display_name  = var.display_name_tunnel2
  routing       = var.routing_method2
  shared_secret = var.sharedSecret2
  ike_version   = var.ike_version2
}