variable "connection_profiles" {
  description = <<EOT
Map of connection_profiles, attributes below
Required:
    - name
Optional:
    - connection_name_prefix_template
    - enabled_features
    - connection_config (block):
    - cross_app_access_resource_app (block):
        - status (required, block):
            - allowed_values (optional)
            - default_value (required)
    - organization (block):
        - assign_membership_on_login (optional)
        - show_as_button (optional)
    - strategy_overrides (block):
        - ad (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
        - adfs (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
        - google_apps (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
        - oidc (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
        - okta (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
        - pingfederate (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
        - samlp (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
        - waad (optional, block):
            - connection_config (optional, block):
            - enabled_features (optional)
EOT

  type = map(object({
    name                            = string
    connection_name_prefix_template = optional(string)
    enabled_features                = optional(list(string))
    connection_config = optional(object({
    }))
    cross_app_access_resource_app = optional(object({
      status = object({
        allowed_values = optional(list(string))
        default_value  = string
      })
    }))
    organization = optional(object({
      assign_membership_on_login = optional(string)
      show_as_button             = optional(string)
    }))
    strategy_overrides = optional(object({
      ad = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
      adfs = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
      google_apps = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
      oidc = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
      okta = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
      pingfederate = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
      samlp = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
      waad = optional(object({
        connection_config = optional(object({
        }))
        enabled_features = optional(list(string))
      }))
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

