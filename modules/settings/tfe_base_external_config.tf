# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

locals {
  pg_configs = {
    enable_active_active = {
      value = var.enable_active_active != null ? var.enable_active_active ? "1" : "0" : null
    }

    pg_dbname = {
      value = var.pg_dbname
    }

    pg_netloc = {
      value = var.pg_netloc
    }

    pg_password = {
      value = var.pg_password
    }

    pg_user = {
      value = var.pg_user
    }

    log_forwarding_config = {
      value = var.log_forwarding_config
    }

    log_forwarding_cloud_config = {
      value = var.log_forwarding_cloud_config
    }

    log_forwarding_enabled = {
      value = var.log_forwarding_enabled != null ? var.log_forwarding_enabled ? "1" : "0" : null
    }

  }

  pg_optional_configs = {
    pg_extra_params = {
      value = var.pg_extra_params
    }
  }

  base_external_configs = local.pg_optional_configs != null && (var.enable_active_active || var.production_type == "external") ? (merge(local.pg_configs, local.pg_optional_configs)) : (merge(local.pg_configs, {
    pg_extra_params = {
      value = null
    }
  }))
}
