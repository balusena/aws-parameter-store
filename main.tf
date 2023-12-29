resource "aws_ssm_parameter" "params" {
  count = length(var.params)
  name  = var.params[count.index].name
  type  = var.params[count.index].type
  value = var.params[count.index].value
}

variable "params" {
  default  = [
    { name = "demo1", value = "demo1", type = "String" },
    { name = "demo2", value = "demo2", type = "String" }
  ]
}
