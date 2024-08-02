variable "tf_state_bucket" {
  description = "tfstate bucket"
  default     = "devops-ud-mark-tfstate"
}

variable "tf_state_lock_table" {
  description = "Dynamo state lok id"
  default     = "devops-ud-mark-lock"
}

variable "project" {
  description = "Project name for tagging resources"
  default     = "devops-ud-mark-project"
}

variable "contact" {
  description = "contact name for tagging resources"
  default     = "atakanbekova@google.com"
}
