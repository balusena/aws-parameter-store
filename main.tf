resource "aws_ssm_parameter" "params" {
  count  = length(var.params)
  name   = var.params[count.index].name
  type   = var.params[count.index].type
  value  = var.params[count.index].value
  key_id = "62bb771a-341f-4c82-b8d9-473959a4a166"
}

variable "params" {
  default  = [
    { name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.robobal.store/", type = "String" },
    { name = "roboshop.dev.frontend.user_url", value = "http://user-dev.robobal.store/", type = "String" },
    { name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.robobal.store/", type = "String" },
    { name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.robobal.store/", type = "String" },
    { name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.robobal.store/", type = "String" },

    { name = "roboshop.dev.cart.redis_host", value = "redis-dev.robobal.store", type = "String"},
    { name = "roboshop.dev.cart.catalogue_host", value = "catalogue-dev.robobal.store", type = "String"},
    { name = "roboshop.dev.cart.catalogue_port", value = "8080", type = "String"},

    { name = "roboshop.dev.catalogue.mongo", value = "true", type = "String"},

    { name = "roboshop.dev.payment.cart_host", value = "cart-dev.robobal.store", type = "String"},
    { name = "roboshop.dev.payment.cart_port", value = "8080", type = "String"},
    { name = "roboshop.dev.payment.user_host", value = "user-dev.robobal.store", type = "String"},
    { name = "roboshop.dev.payment.user_port", value = "8080", type = "String"},
    { name = "roboshop.dev.payment.amqp_host", value = "rabbitmq-dev.robobal.store", type = "String"},
    { name = "roboshop.dev.payment.amqp_user", value = "roboshop", type = "String"},

    { name = "roboshop.dev.shipping.cart_endpoint", value = "cart-dev.robobal.store:8080", type = "String"},
    { name = "roboshop.dev.shipping.db_host", value = "mysql-dev.robobal.store", type = "String"},

    { name = "roboshop.dev.user.mongo", value = "true", type = "String"},
    { name = "roboshop.dev.user.redis_host", value = "redis-dev.robobal.store", type = "String"},
    { name = "roboshop.dev.user.mongo_url", value = "mongodb://mongodb-dev.robobal.store:27017/users", type = "String"},

    { name = "roboshop.dev.rabbitmq.amqp_user", value = "roboshop", type = "String"},

    { name = "roboshop.dev.mysql.username", value = "roboshop", type = "String"},

    { name = "roboshop.dev.docdb.username", value = "roboshop", type = "String"},


    ### Passwords will never be stored in git repos, usually in organizations we create them manually whom ever have access will provision them
    ### these secrets in aws parameter store.
    { name = "roboshop.dev.payment.amqp_pass", value = "roboshop123", type = "SecureString"},

    { name = "roboshop.dev.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString"},

    { name = "roboshop.dev.mysql.password", value = "roboshop123", type = "SecureString"},

    { name = "roboshop.dev.docdb.password", value = "roboshop123", type = "SecureString"},

    { name = "roboshop.dev.catalogue.mongo_url",
      value = "mongodb://roboshop:roboshop123@docdb-dev.cluster-cfo8mcqcknol.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false",
      type = "SecureString" },

    { name = "roboshop.dev.catalogue.docdb_endpoint", value = "docdb-dev.cluster-cfo8mcqcknol.us-east-1.docdb.amazonaws.com", type = "String" },
  ]
}
