variable "os_config_patch_deployments" {
  description = <<EOT
Map of os_config_patch_deployments, attributes below
Required:
    - patch_deployment_id
    - instance_filter (block):
        - all (optional)
        - group_labels (optional, block):
            - labels (required)
        - instance_name_prefixes (optional)
        - instances (optional)
        - zones (optional)
Optional:
    - deletion_policy
    - description
    - duration
    - project
    - one_time_schedule (block):
        - execute_time (required)
    - patch_config (block):
        - apt (optional, block):
            - excludes (optional)
            - exclusive_packages (optional)
            - type (optional)
        - goo (optional, block):
            - enabled (required)
        - mig_instances_allowed (optional)
        - post_step (optional, block):
            - linux_exec_step_config (optional, block):
                - allowed_success_codes (optional)
                - gcs_object (optional, block):
                    - bucket (required)
                    - generation_number (required)
                    - object (required)
                - interpreter (optional)
                - local_path (optional)
            - windows_exec_step_config (optional, block):
                - allowed_success_codes (optional)
                - gcs_object (optional, block):
                    - bucket (required)
                    - generation_number (required)
                    - object (required)
                - interpreter (optional)
                - local_path (optional)
        - pre_step (optional, block):
            - linux_exec_step_config (optional, block):
                - allowed_success_codes (optional)
                - gcs_object (optional, block):
                    - bucket (required)
                    - generation_number (required)
                    - object (required)
                - interpreter (optional)
                - local_path (optional)
            - windows_exec_step_config (optional, block):
                - allowed_success_codes (optional)
                - gcs_object (optional, block):
                    - bucket (required)
                    - generation_number (required)
                    - object (required)
                - interpreter (optional)
                - local_path (optional)
        - reboot_config (optional)
        - skip_unpatchable_vms (optional)
        - windows_update (optional, block):
            - classifications (optional)
            - excludes (optional)
            - exclusive_patches (optional)
        - yum (optional, block):
            - excludes (optional)
            - exclusive_packages (optional)
            - minimal (optional)
            - security (optional)
        - zypper (optional, block):
            - categories (optional)
            - excludes (optional)
            - exclusive_patches (optional)
            - severities (optional)
            - with_optional (optional)
            - with_update (optional)
    - recurring_schedule (block):
        - end_time (optional)
        - monthly (optional, block):
            - month_day (optional)
            - week_day_of_month (optional, block):
                - day_of_week (required)
                - day_offset (optional)
                - week_ordinal (required)
        - start_time (optional)
        - time_of_day (required, block):
            - hours (optional)
            - minutes (optional)
            - nanos (optional)
            - seconds (optional)
        - time_zone (required, block):
            - id (required)
            - version (optional)
        - weekly (optional, block):
            - day_of_week (required)
    - rollout (block):
        - disruption_budget (required, block):
            - fixed (optional)
            - percentage (optional)
        - mode (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    patch_deployment_id = string
    deletion_policy     = optional(string)
    description         = optional(string)
    duration            = optional(string)
    project             = optional(string)
    instance_filter = object({
      all = optional(bool)
      group_labels = optional(list(object({
        labels = map(string)
      })))
      instance_name_prefixes = optional(list(string))
      instances              = optional(list(string))
      zones                  = optional(list(string))
    })
    one_time_schedule = optional(object({
      execute_time = string
    }))
    patch_config = optional(object({
      apt = optional(object({
        excludes           = optional(list(string))
        exclusive_packages = optional(list(string))
        type               = optional(string)
      }))
      goo = optional(object({
        enabled = bool
      }))
      mig_instances_allowed = optional(bool)
      post_step = optional(object({
        linux_exec_step_config = optional(object({
          allowed_success_codes = optional(list(number))
          gcs_object = optional(object({
            bucket            = string
            generation_number = string
            object            = string
          }))
          interpreter = optional(string)
          local_path  = optional(string)
        }))
        windows_exec_step_config = optional(object({
          allowed_success_codes = optional(list(number))
          gcs_object = optional(object({
            bucket            = string
            generation_number = string
            object            = string
          }))
          interpreter = optional(string)
          local_path  = optional(string)
        }))
      }))
      pre_step = optional(object({
        linux_exec_step_config = optional(object({
          allowed_success_codes = optional(list(number))
          gcs_object = optional(object({
            bucket            = string
            generation_number = string
            object            = string
          }))
          interpreter = optional(string)
          local_path  = optional(string)
        }))
        windows_exec_step_config = optional(object({
          allowed_success_codes = optional(list(number))
          gcs_object = optional(object({
            bucket            = string
            generation_number = string
            object            = string
          }))
          interpreter = optional(string)
          local_path  = optional(string)
        }))
      }))
      reboot_config        = optional(string)
      skip_unpatchable_vms = optional(bool)
      windows_update = optional(object({
        classifications   = optional(list(string))
        excludes          = optional(list(string))
        exclusive_patches = optional(list(string))
      }))
      yum = optional(object({
        excludes           = optional(list(string))
        exclusive_packages = optional(list(string))
        minimal            = optional(bool)
        security           = optional(bool)
      }))
      zypper = optional(object({
        categories        = optional(list(string))
        excludes          = optional(list(string))
        exclusive_patches = optional(list(string))
        severities        = optional(list(string))
        with_optional     = optional(bool)
        with_update       = optional(bool)
      }))
    }))
    recurring_schedule = optional(object({
      end_time = optional(string)
      monthly = optional(object({
        month_day = optional(number)
        week_day_of_month = optional(object({
          day_of_week  = string
          day_offset   = optional(number)
          week_ordinal = number
        }))
      }))
      start_time = optional(string)
      time_of_day = object({
        hours   = optional(number)
        minutes = optional(number)
        nanos   = optional(number)
        seconds = optional(number)
      })
      time_zone = object({
        id      = string
        version = optional(string)
      })
      weekly = optional(object({
        day_of_week = string
      }))
    }))
    rollout = optional(object({
      disruption_budget = object({
        fixed      = optional(number)
        percentage = optional(number)
      })
      mode = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.recurring_schedule == null || (v.recurring_schedule.time_of_day.hours == null || (v.recurring_schedule.time_of_day.hours >= 0 && v.recurring_schedule.time_of_day.hours <= 23))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.recurring_schedule == null || (v.recurring_schedule.time_of_day.minutes == null || (v.recurring_schedule.time_of_day.minutes >= 0 && v.recurring_schedule.time_of_day.minutes <= 59))
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.recurring_schedule == null || (v.recurring_schedule.time_of_day.nanos == null || (v.recurring_schedule.time_of_day.nanos >= 0 && v.recurring_schedule.time_of_day.nanos <= 999999999))
      )
    ])
    error_message = "must be between 0 and 999999999"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.recurring_schedule == null || (v.recurring_schedule.time_of_day.seconds == null || (v.recurring_schedule.time_of_day.seconds >= 0 && v.recurring_schedule.time_of_day.seconds <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.recurring_schedule == null || (v.recurring_schedule.monthly == null || (v.recurring_schedule.monthly.month_day == null || (v.recurring_schedule.monthly.month_day >= -1 && v.recurring_schedule.monthly.month_day <= 31)))
      )
    ])
    error_message = "must be between -1 and 31"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.recurring_schedule == null || (v.recurring_schedule.monthly == null || (v.recurring_schedule.monthly.week_day_of_month == null || (v.recurring_schedule.monthly.week_day_of_month.week_ordinal >= -1 && v.recurring_schedule.monthly.week_day_of_month.week_ordinal <= 4)))
      )
    ])
    error_message = "must be between -1 and 4"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.recurring_schedule == null || (v.recurring_schedule.monthly == null || (v.recurring_schedule.monthly.week_day_of_month == null || (v.recurring_schedule.monthly.week_day_of_month.day_offset == null || (v.recurring_schedule.monthly.week_day_of_month.day_offset >= -30 && v.recurring_schedule.monthly.week_day_of_month.day_offset <= 30))))
      )
    ])
    error_message = "must be between -30 and 30"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.rollout == null || (v.rollout.disruption_budget.fixed == null || (v.rollout.disruption_budget.fixed >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.os_config_patch_deployments : (
        v.rollout == null || (v.rollout.disruption_budget.percentage == null || (v.rollout.disruption_budget.percentage >= 0 && v.rollout.disruption_budget.percentage <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

