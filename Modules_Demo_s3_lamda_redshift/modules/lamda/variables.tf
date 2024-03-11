variable "local_package" {
  description = "The absolute path to an existing zip-file to use"
  type        = string
  default     = null
}

variable "function_name" {
  description = "A unique name for your Lambda Function"
  type        = string
  default     = ""
}

variable "description" {
  description = "Description of your Lambda Function (or Layer)"
  type        = string
  default     = ""
}

variable "handler" {
  description = "Lambda Function entrypoint in your code"
  type        = string
  default     = ""
}


variable "runtime" {
  description = "Lambda Function runtime"
  type        = string
  default     = ""

#    validation {
#      condition     = can(var.create && contains(["nodejs10.x", "nodejs12.x", "java8", "java11", "python2.7", " python3.6", "python3.7", "python3.8", "dotnetcore2.1", "dotnetcore3.1", "go1.x", "ruby2.5", "ruby2.7", "provided"], var.runtime))
#      error_message = "The runtime value must be one of supported by AWS Lambda."
#   }
}


variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 100 
}

variable "filename" {
}

variable "source_code_hash" {
}
