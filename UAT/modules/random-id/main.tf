resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = var.diagsarg_name
    }
    
    byte_length = 8
}
