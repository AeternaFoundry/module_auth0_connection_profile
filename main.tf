resource "auth0_connection_profile" "connection_profiles" {
  for_each = var.connection_profiles

  name                            = each.value.name
  connection_name_prefix_template = each.value.connection_name_prefix_template
  enabled_features                = each.value.enabled_features

  dynamic "connection_config" {
    for_each = each.value.connection_config != null ? [each.value.connection_config] : []
    content {
    }
  }

  dynamic "cross_app_access_resource_app" {
    for_each = each.value.cross_app_access_resource_app != null ? [each.value.cross_app_access_resource_app] : []
    content {
      status {
        allowed_values = cross_app_access_resource_app.value.status.allowed_values
        default_value  = cross_app_access_resource_app.value.status.default_value
      }
    }
  }

  dynamic "organization" {
    for_each = each.value.organization != null ? [each.value.organization] : []
    content {
      assign_membership_on_login = organization.value.assign_membership_on_login
      show_as_button             = organization.value.show_as_button
    }
  }

  dynamic "strategy_overrides" {
    for_each = each.value.strategy_overrides != null ? [each.value.strategy_overrides] : []
    content {
      dynamic "ad" {
        for_each = strategy_overrides.value.ad != null ? [strategy_overrides.value.ad] : []
        content {
          dynamic "connection_config" {
            for_each = ad.value.connection_config != null ? [ad.value.connection_config] : []
            content {
            }
          }
          enabled_features = ad.value.enabled_features
        }
      }
      dynamic "adfs" {
        for_each = strategy_overrides.value.adfs != null ? [strategy_overrides.value.adfs] : []
        content {
          dynamic "connection_config" {
            for_each = adfs.value.connection_config != null ? [adfs.value.connection_config] : []
            content {
            }
          }
          enabled_features = adfs.value.enabled_features
        }
      }
      dynamic "google_apps" {
        for_each = strategy_overrides.value.google_apps != null ? [strategy_overrides.value.google_apps] : []
        content {
          dynamic "connection_config" {
            for_each = google_apps.value.connection_config != null ? [google_apps.value.connection_config] : []
            content {
            }
          }
          enabled_features = google_apps.value.enabled_features
        }
      }
      dynamic "oidc" {
        for_each = strategy_overrides.value.oidc != null ? [strategy_overrides.value.oidc] : []
        content {
          dynamic "connection_config" {
            for_each = oidc.value.connection_config != null ? [oidc.value.connection_config] : []
            content {
            }
          }
          enabled_features = oidc.value.enabled_features
        }
      }
      dynamic "okta" {
        for_each = strategy_overrides.value.okta != null ? [strategy_overrides.value.okta] : []
        content {
          dynamic "connection_config" {
            for_each = okta.value.connection_config != null ? [okta.value.connection_config] : []
            content {
            }
          }
          enabled_features = okta.value.enabled_features
        }
      }
      dynamic "pingfederate" {
        for_each = strategy_overrides.value.pingfederate != null ? [strategy_overrides.value.pingfederate] : []
        content {
          dynamic "connection_config" {
            for_each = pingfederate.value.connection_config != null ? [pingfederate.value.connection_config] : []
            content {
            }
          }
          enabled_features = pingfederate.value.enabled_features
        }
      }
      dynamic "samlp" {
        for_each = strategy_overrides.value.samlp != null ? [strategy_overrides.value.samlp] : []
        content {
          dynamic "connection_config" {
            for_each = samlp.value.connection_config != null ? [samlp.value.connection_config] : []
            content {
            }
          }
          enabled_features = samlp.value.enabled_features
        }
      }
      dynamic "waad" {
        for_each = strategy_overrides.value.waad != null ? [strategy_overrides.value.waad] : []
        content {
          dynamic "connection_config" {
            for_each = waad.value.connection_config != null ? [waad.value.connection_config] : []
            content {
            }
          }
          enabled_features = waad.value.enabled_features
        }
      }
    }
  }
}

