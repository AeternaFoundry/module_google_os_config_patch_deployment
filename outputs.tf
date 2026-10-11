output "os_config_patch_deployments_id" {
  description = "Map of id values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no id are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "os_config_patch_deployments_create_time" {
  description = "Map of create_time values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no create_time are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "os_config_patch_deployments_deletion_policy" {
  description = "Map of deletion_policy values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no deletion_policy are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "os_config_patch_deployments_description" {
  description = "Map of description values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no description are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.description if v.description != null && length(v.description) > 0 }
}
output "os_config_patch_deployments_duration" {
  description = "Map of duration values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no duration are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.duration if v.duration != null && length(v.duration) > 0 }
}
output "os_config_patch_deployments_instance_filter" {
  description = "Map of instance_filter values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no instance_filter are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => one(v.instance_filter) if v.instance_filter != null && length(v.instance_filter) > 0 }
}
output "os_config_patch_deployments_last_execute_time" {
  description = "Map of last_execute_time values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no last_execute_time are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.last_execute_time if v.last_execute_time != null && length(v.last_execute_time) > 0 }
}
output "os_config_patch_deployments_name" {
  description = "Map of name values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no name are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.name if v.name != null && length(v.name) > 0 }
}
output "os_config_patch_deployments_one_time_schedule" {
  description = "Map of one_time_schedule values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no one_time_schedule are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => one(v.one_time_schedule) if v.one_time_schedule != null && length(v.one_time_schedule) > 0 }
}
output "os_config_patch_deployments_patch_config" {
  description = "Map of patch_config values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no patch_config are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => one(v.patch_config) if v.patch_config != null && length(v.patch_config) > 0 }
}
output "os_config_patch_deployments_patch_deployment_id" {
  description = "Map of patch_deployment_id values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no patch_deployment_id are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.patch_deployment_id if v.patch_deployment_id != null && length(v.patch_deployment_id) > 0 }
}
output "os_config_patch_deployments_project" {
  description = "Map of project values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no project are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.project if v.project != null && length(v.project) > 0 }
}
output "os_config_patch_deployments_recurring_schedule" {
  description = "Map of recurring_schedule values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no recurring_schedule are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => one(v.recurring_schedule) if v.recurring_schedule != null && length(v.recurring_schedule) > 0 }
}
output "os_config_patch_deployments_rollout" {
  description = "Map of rollout values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no rollout are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => one(v.rollout) if v.rollout != null && length(v.rollout) > 0 }
}
output "os_config_patch_deployments_update_time" {
  description = "Map of update_time values across all os_config_patch_deployments, keyed the same as var.os_config_patch_deployments except keys with no update_time are omitted"
  value       = { for k, v in google_os_config_patch_deployment.os_config_patch_deployments : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

