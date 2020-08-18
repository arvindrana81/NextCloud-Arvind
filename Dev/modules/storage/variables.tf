variable "sa_name" {
  description = "provide the storage account name with the random id"
}

variable "sarg_name" {
  description = "provide the storage account rg name"
}

variable "sa_location" {
  description = "provide the storage account location"
}

variable "sarepl_type" {
  description = "provide the storage account replication type, lrs, grs"
}

variable "sa_acctype" {
  description = "provide the storage account tier type, standard or premium"
}

variable "sa_tags" {
  description = "provide the storage account tags"
}
