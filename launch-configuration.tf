resource "aws_launch_configuration" "as_conf" {
  name              = var.dc_webservers_name
  image_id          = var.ami_id
  instance_type     = var.dc_webserver_instance_type
  key_name          = var.ssh_public_key_name
  security_groups   = [aws_security_group.trusted.id]
  user_data_base64  = "eXVtIGluc3RhbGwgLXkgbmdpbngNCnN5c3RlbWN0bCBlbmFibGUgbmdpbnguc2VydmljZQ0KZWNobyAiPGgxPkhvbGEgREMtU29sdXRpb25zPC9oMT4iID4gL3Vzci9zaGFyZS9uZ2lueC9odG1sL2luZGV4Lmh0bWwNCmVjaG8gIjxoMz5Fc3RhIGVzIHVuYSBkZW1vc3RyYWNpb24gZGUgY29tbyBmdW5jaW9uYSBUZXJyYWZvcm08L2gzIiA+PiAvdXNyL3NoYXJlL25naW54L2h0bWwvaW5kZXguaHRtbA0KZXhpdCAw"
}
