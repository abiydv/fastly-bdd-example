  
terraform {
  required_version = ">= 0.12"
}

provider "fastly" {
    version = "~> 0.9"
}

resource "fastly_service_v1" "test" {
  name = "service-test"

  domain {
      name = "fastly-bdd-example.com"
  }
    
  backend {
      name    = "httpbin.org"
      address = "httpbin.org"
      port    = 443
  }

  dynamic "snippet" {
    for_each = [ for s in ["recv","error"] : { name = s }]
    content {
      name = snippet.value.name
      type = snippet.value.name
      content = file("${path.module}/../vcl/${snippet.value.name}.vcl")
    }
  }

  dictionary {
      name = "block"
  }

  force_destroy = true
}

resource "fastly_service_dictionary_items_v1" "block" {
  service_id    = fastly_service_v1.test.id
  dictionary_id = {for s in fastly_service_v1.test.dictionary : s.name => s.dictionary_id}["block"]
    items = {
        "/block-path1": "block"
        "/block-path2": "block"
    }
}

output "service_name" {
    value = fastly_service_v1.test.name
}
output "service_id" {
    value = fastly_service_v1.test.id
}

output "service_active_version" {
    value = fastly_service_v1.test.active_version
}

output "block_dictionary_id" {
    value = {for s in fastly_service_v1.test.dictionary : s.name => s.dictionary_id}["block"]
}
