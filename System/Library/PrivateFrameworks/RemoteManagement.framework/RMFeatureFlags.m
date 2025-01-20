@interface RMFeatureFlags
+ (BOOL)isAllowedDeclarationType:(id)a3;
+ (BOOL)isAllowedStatusItem:(id)a3;
+ (BOOL)isAllowedXPCServiceName:(id)a3;
@end

@implementation RMFeatureFlags

+ (BOOL)isAllowedXPCServiceName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DiskManagementSubscriber"])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isDiskManagementSubscriberEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isDiskManagementSubscriberEnabled");
  }

  else if ([v3 isEqualToString:@"ManagedAppsSubscriber"])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isManagedAppsEnabled](&OBJC_CLASS___RMFeatureFlags, "isManagedAppsEnabled");
  }

  else if ([v3 isEqualToString:@"NetworkEAPSubscriber"])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isNetworkEAPConfigurationEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isNetworkEAPConfigurationEnabled");
  }

  else
  {
    if (![v3 isEqualToString:@"NetworkWiFiSubscriber"])
    {
      BOOL v5 = 1;
      goto LABEL_10;
    }

    unsigned __int8 v4 = +[RMFeatureFlags isNetworkWiFiConfigurationEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isNetworkWiFiConfigurationEnabled");
  }

  BOOL v5 = v4;
LABEL_10:

  return v5;
}

+ (BOOL)isAllowedDeclarationType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAppManagedDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAppManagedDeclaration,  "registeredIdentifier"));
  unsigned int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    unsigned __int8 v6 = +[RMFeatureFlags isManagedAppsEnabled](&OBJC_CLASS___RMFeatureFlags, "isManagedAppsEnabled");
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAppMarketplaceDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelAppMarketplaceDeclaration,  "registeredIdentifier"));
    unsigned int v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      unsigned __int8 v6 = +[RMFeatureFlags isAppDistributionPVEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isAppDistributionPVEnabled");
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelNetworkEAPDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelNetworkEAPDeclaration,  "registeredIdentifier"));
      unsigned int v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        unsigned __int8 v6 = +[RMFeatureFlags isNetworkEAPConfigurationEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isNetworkEAPConfigurationEnabled");
      }

      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelNetworkWiFiDeclaration registeredIdentifier]( &OBJC_CLASS___RMModelNetworkWiFiDeclaration,  "registeredIdentifier"));
        unsigned int v12 = [v3 isEqualToString:v11];

        if (!v12)
        {
          BOOL v13 = 1;
          goto LABEL_10;
        }

        unsigned __int8 v6 = +[RMFeatureFlags isNetworkWiFiConfigurationEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isNetworkWiFiConfigurationEnabled");
      }
    }
  }

  BOOL v13 = v6;
LABEL_10:

  return v13;
}

+ (BOOL)isAllowedStatusItem:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:RMModelStatusItemAppManagedList])
  {
    unsigned __int8 v4 = +[RMFeatureFlags isManagedAppsEnabled](&OBJC_CLASS___RMFeatureFlags, "isManagedAppsEnabled");
  }

  else
  {
    if (![v3 isEqualToString:RMModelStatusItemDiskManagementFileVaultEnabled])
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }

    unsigned __int8 v4 = +[RMFeatureFlags isDiskManagementSubscriberEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isDiskManagementSubscriberEnabled");
  }

  BOOL v5 = v4;
LABEL_7:

  return v5;
}

@end