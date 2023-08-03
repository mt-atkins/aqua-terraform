
# resource "aquasec_role" "roles" {
#     for_each = local.config.ROLES
#     depends_on = [ aquasec_permissions_sets.permissionSet, aquasec_application_scope.scopes ]
    
#     role_name = each.key
#     description = each.value.description
#     permission =  each.value.permissions
#     scopes =  each.value.scopes
  
# }

resource "aquasec_permissions_sets" "permissionSet" {
  
  is_super    = false # Ask your Aqua Admin for Super User access

  name        = var.permission_set.name
  description = var.permission_set.description
  ui_access   = var.permission_set.ui_access
  actions     = try(var.permission_set.actions,{})
}


# resource "aquasec_application_scope" "scopes" {
#     for_each = { for scope in local.config.SCOPES : scope.name => scope }

#     name        = each.value.name
#     description = each.value.description
#     categories {
      
#     dynamic "artifacts" {
#       for_each = each.value.artifacts != null ? each.value.artifacts : []
#       content {
#         dynamic "image" {
#           for_each = artifacts.value.image != null ? artifacts.value.image : []
#           content {
#             expression = image.value.expression
#             dynamic "variables" {
#               for_each = image.value.variables
#               content {
#                 attribute = variables.value.attribute
#                 value     = variables.value.value
#               }
#             }
#           }
#         }
#       }
#     }

#     dynamic "workloads" {
#       for_each = each.value.workloads != null ? each.value.workloads : []
#       content {
#         dynamic "kubernetes" {
#           for_each = workloads.value.kubernetes != null ? workloads.value.kubernetes : []
#           content {
#             expression = kubernetes.value.expression
#             dynamic "variables" {
#               for_each = kubernetes.value.variables
#               content {
#                 attribute = variables.value.attribute
#                 value     = variables.value.value
#               }
#             }
#           }
#         }
#       }
#     }

#     dynamic "infrastructure" {
#       for_each = each.value.infrastructure != null ? each.value.infrastructure : []
#       content {
#         dynamic "kubernetes" {
#           for_each = infrastructure.value.kubernetes != null ? infrastructure.value.kubernetes : []
#           content {
#             expression = kubernetes.value.expression
#             dynamic "variables" {
#               for_each = kubernetes.value.variables
#               content {
#                 attribute = variables.value.attribute
#                 value     = variables.value.value
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }