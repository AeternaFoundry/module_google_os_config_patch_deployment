resource "google_os_config_patch_deployment" "os_config_patch_deployments" {
  for_each = var.os_config_patch_deployments

  patch_deployment_id = each.value.patch_deployment_id
  deletion_policy     = each.value.deletion_policy
  description         = each.value.description
  duration            = each.value.duration
  project             = each.value.project

  instance_filter {
    all = each.value.instance_filter.all
    dynamic "group_labels" {
      for_each = each.value.instance_filter.group_labels != null ? each.value.instance_filter.group_labels : []
      content {
        labels = group_labels.value.labels
      }
    }
    instance_name_prefixes = each.value.instance_filter.instance_name_prefixes
    instances              = each.value.instance_filter.instances
    zones                  = each.value.instance_filter.zones
  }

  dynamic "one_time_schedule" {
    for_each = each.value.one_time_schedule != null ? [each.value.one_time_schedule] : []
    content {
      execute_time = one_time_schedule.value.execute_time
    }
  }

  dynamic "patch_config" {
    for_each = each.value.patch_config != null ? [each.value.patch_config] : []
    content {
      dynamic "apt" {
        for_each = patch_config.value.apt != null ? [patch_config.value.apt] : []
        content {
          excludes           = apt.value.excludes
          exclusive_packages = apt.value.exclusive_packages
          type               = apt.value.type
        }
      }
      dynamic "goo" {
        for_each = patch_config.value.goo != null ? [patch_config.value.goo] : []
        content {
          enabled = goo.value.enabled
        }
      }
      mig_instances_allowed = patch_config.value.mig_instances_allowed
      dynamic "post_step" {
        for_each = patch_config.value.post_step != null ? [patch_config.value.post_step] : []
        content {
          dynamic "linux_exec_step_config" {
            for_each = post_step.value.linux_exec_step_config != null ? [post_step.value.linux_exec_step_config] : []
            content {
              allowed_success_codes = linux_exec_step_config.value.allowed_success_codes
              dynamic "gcs_object" {
                for_each = linux_exec_step_config.value.gcs_object != null ? [linux_exec_step_config.value.gcs_object] : []
                content {
                  bucket            = gcs_object.value.bucket
                  generation_number = gcs_object.value.generation_number
                  object            = gcs_object.value.object
                }
              }
              interpreter = linux_exec_step_config.value.interpreter
              local_path  = linux_exec_step_config.value.local_path
            }
          }
          dynamic "windows_exec_step_config" {
            for_each = post_step.value.windows_exec_step_config != null ? [post_step.value.windows_exec_step_config] : []
            content {
              allowed_success_codes = windows_exec_step_config.value.allowed_success_codes
              dynamic "gcs_object" {
                for_each = windows_exec_step_config.value.gcs_object != null ? [windows_exec_step_config.value.gcs_object] : []
                content {
                  bucket            = gcs_object.value.bucket
                  generation_number = gcs_object.value.generation_number
                  object            = gcs_object.value.object
                }
              }
              interpreter = windows_exec_step_config.value.interpreter
              local_path  = windows_exec_step_config.value.local_path
            }
          }
        }
      }
      dynamic "pre_step" {
        for_each = patch_config.value.pre_step != null ? [patch_config.value.pre_step] : []
        content {
          dynamic "linux_exec_step_config" {
            for_each = pre_step.value.linux_exec_step_config != null ? [pre_step.value.linux_exec_step_config] : []
            content {
              allowed_success_codes = linux_exec_step_config.value.allowed_success_codes
              dynamic "gcs_object" {
                for_each = linux_exec_step_config.value.gcs_object != null ? [linux_exec_step_config.value.gcs_object] : []
                content {
                  bucket            = gcs_object.value.bucket
                  generation_number = gcs_object.value.generation_number
                  object            = gcs_object.value.object
                }
              }
              interpreter = linux_exec_step_config.value.interpreter
              local_path  = linux_exec_step_config.value.local_path
            }
          }
          dynamic "windows_exec_step_config" {
            for_each = pre_step.value.windows_exec_step_config != null ? [pre_step.value.windows_exec_step_config] : []
            content {
              allowed_success_codes = windows_exec_step_config.value.allowed_success_codes
              dynamic "gcs_object" {
                for_each = windows_exec_step_config.value.gcs_object != null ? [windows_exec_step_config.value.gcs_object] : []
                content {
                  bucket            = gcs_object.value.bucket
                  generation_number = gcs_object.value.generation_number
                  object            = gcs_object.value.object
                }
              }
              interpreter = windows_exec_step_config.value.interpreter
              local_path  = windows_exec_step_config.value.local_path
            }
          }
        }
      }
      reboot_config        = patch_config.value.reboot_config
      skip_unpatchable_vms = patch_config.value.skip_unpatchable_vms
      dynamic "windows_update" {
        for_each = patch_config.value.windows_update != null ? [patch_config.value.windows_update] : []
        content {
          classifications   = windows_update.value.classifications
          excludes          = windows_update.value.excludes
          exclusive_patches = windows_update.value.exclusive_patches
        }
      }
      dynamic "yum" {
        for_each = patch_config.value.yum != null ? [patch_config.value.yum] : []
        content {
          excludes           = yum.value.excludes
          exclusive_packages = yum.value.exclusive_packages
          minimal            = yum.value.minimal
          security           = yum.value.security
        }
      }
      dynamic "zypper" {
        for_each = patch_config.value.zypper != null ? [patch_config.value.zypper] : []
        content {
          categories        = zypper.value.categories
          excludes          = zypper.value.excludes
          exclusive_patches = zypper.value.exclusive_patches
          severities        = zypper.value.severities
          with_optional     = zypper.value.with_optional
          with_update       = zypper.value.with_update
        }
      }
    }
  }

  dynamic "recurring_schedule" {
    for_each = each.value.recurring_schedule != null ? [each.value.recurring_schedule] : []
    content {
      end_time = recurring_schedule.value.end_time
      dynamic "monthly" {
        for_each = recurring_schedule.value.monthly != null ? [recurring_schedule.value.monthly] : []
        content {
          month_day = monthly.value.month_day
          dynamic "week_day_of_month" {
            for_each = monthly.value.week_day_of_month != null ? [monthly.value.week_day_of_month] : []
            content {
              day_of_week  = week_day_of_month.value.day_of_week
              day_offset   = week_day_of_month.value.day_offset
              week_ordinal = week_day_of_month.value.week_ordinal
            }
          }
        }
      }
      start_time = recurring_schedule.value.start_time
      time_of_day {
        hours   = recurring_schedule.value.time_of_day.hours
        minutes = recurring_schedule.value.time_of_day.minutes
        nanos   = recurring_schedule.value.time_of_day.nanos
        seconds = recurring_schedule.value.time_of_day.seconds
      }
      time_zone {
        id      = recurring_schedule.value.time_zone.id
        version = recurring_schedule.value.time_zone.version
      }
      dynamic "weekly" {
        for_each = recurring_schedule.value.weekly != null ? [recurring_schedule.value.weekly] : []
        content {
          day_of_week = weekly.value.day_of_week
        }
      }
    }
  }

  dynamic "rollout" {
    for_each = each.value.rollout != null ? [each.value.rollout] : []
    content {
      disruption_budget {
        fixed      = rollout.value.disruption_budget.fixed
        percentage = rollout.value.disruption_budget.percentage
      }
      mode = rollout.value.mode
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

