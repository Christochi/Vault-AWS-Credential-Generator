variable "mount-path" {
    type = string
    description = "where aws secret engine will be mounted"
    default = "tochi-myaws"
}

variable "role-name" {
    type = string
    description = "identifier for the aws role"
    default = "tochi-myrole" 
}