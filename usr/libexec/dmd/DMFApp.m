@interface DMFApp
- (BOOL)_proxyIsValidated:(id)a3;
- (DMFApp)initWithBundleIdentifier:(id)a3 propertyKeys:(id)a4;
- (DMFApp)initWithJob:(id)a3 hasUpdateAvailable:(BOOL)a4 propertyKeys:(id)a5;
- (id)initWithApplicationRecord:(id)a3 hasUpdateAvailable:(BOOL)a4 propertyKeys:(id)a5;
@end

@implementation DMFApp

- (DMFApp)initWithJob:(id)a3 hasUpdateAvailable:(BOOL)a4 propertyKeys:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  v11 = -[DMFApp initWithBundleIdentifier:propertyKeys:](self, "initWithBundleIdentifier:propertyKeys:", v10, v9);

  if (v11)
  {
    if ([v9 containsObject:@"storeItemIdentifier"])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 storeItemID]));
      -[DMFApp setStoreItemIdentifier:](v11, "setStoreItemIdentifier:", v12);
    }
  }

  return v11;
}

- (DMFApp)initWithBundleIdentifier:(id)a3 propertyKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = &OBJC_CLASS___DMFApp;
  id v8 = -[DMFApp init](&v27, "init");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    if ([v7 containsObject:@"installationState"])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[DMDAppLifeCycle lifeCycleForBundleIdentifier:]( &OBJC_CLASS___DMDAppLifeCycle,  "lifeCycleForBundleIdentifier:",  v6));
      -[DMFApp setInstallationState:](v8, "setInstallationState:", [v10 currentState]);
    }

    if ([v7 containsObject:@"VPNUUIDString"])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 VPNUUIDStringForBundleIdentifier:v6]);
      -[DMFApp setVPNUUIDString:](v8, "setVPNUUIDString:", v11);
    }

    if ([v7 containsObject:@"cellularSliceUUIDString"])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 cellularSliceUUIDStringForBundleIdentifier:v6]);
      -[DMFApp setCellularSliceUUIDString:](v8, "setCellularSliceUUIDString:", v12);
    }

    if ([v7 containsObject:@"contentFilterUUIDString"])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 contentFilterUUIDStringForBundleIdentifier:v6]);
      -[DMFApp setContentFilterUUIDString:](v8, "setContentFilterUUIDString:", v13);
    }

    if ([v7 containsObject:@"DNSProxyUUIDString"])
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 DNSProxyUUIDStringForBundleIdentifier:v6]);
      -[DMFApp setDNSProxyUUIDString:](v8, "setDNSProxyUUIDString:", v14);
    }

    if ([v7 containsObject:@"relayUUIDString"])
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 relayUUIDStringForBundleIdentifier:v6]);
      -[DMFApp setRelayUUIDString:](v8, "setRelayUUIDString:", v15);
    }

    if ([v7 containsObject:@"associatedDomains"])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedDomainsForBundleIdentifier:v6]);
      -[DMFApp setAssociatedDomains:](v8, "setAssociatedDomains:", v16);
    }

    if ([v7 containsObject:@"associatedDomainsEnableDirectDownloads"])
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 associatedDomainsEnableDirectDownloadsForBundleIdentifier:v6]);
      -[DMFApp setAssociatedDomainsEnableDirectDownloads:](v8, "setAssociatedDomainsEnableDirectDownloads:", v17);
    }

    if ([v7 containsObject:@"removable"])
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 removabilityForBundleIdentifier:v6]);
      -[DMFApp setRemovable:](v8, "setRemovable:", v18);
    }

    if ([v7 containsObject:@"tapToPayScreenLock"])
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 tapToPayScreenLockForBundleIdentifier:v6]);
      -[DMFApp setTapToPayScreenLock:](v8, "setTapToPayScreenLock:", v19);
    }

    if ([v7 containsObject:@"allowUserToHide"])
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 allowUserToHideForBundleIdentifier:v6]);
      -[DMFApp setAllowUserToHide:](v8, "setAllowUserToHide:", v20);
    }

    if ([v7 containsObject:@"allowUserToLock"])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v9 allowUserToLockForBundleIdentifier:v6]);
      -[DMFApp setAllowUserToLock:](v8, "setAllowUserToLock:", v21);
    }

    if ([v7 containsObject:@"configuration"])
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 configurationForBundleIdentifier:v6]);
      -[DMFApp setConfiguration:](v8, "setConfiguration:", v22);
    }

    if ([v7 containsObject:@"feedback"])
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v9 feedbackForBundleIdentifier:v6]);
      -[DMFApp setFeedback:](v8, "setFeedback:", v23);
    }

    if ([v7 containsObject:@"sourceIdentifier"])
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 sourceIdentifierForBundleIdentifier:v6]);
      -[DMFApp setSourceIdentifier:](v8, "setSourceIdentifier:", v24);
    }

    if ([v7 containsObject:@"managementInformation"])
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v9 managementInformationForBundleIdentifier:v6]);
      -[DMFApp setManagementInformation:](v8, "setManagementInformation:", v25);
    }
  }

  return v8;
}

- (id)initWithApplicationRecord:(id)a3 hasUpdateAvailable:(BOOL)a4 propertyKeys:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  v11 = -[DMFApp initWithBundleIdentifier:propertyKeys:](self, "initWithBundleIdentifier:propertyKeys:", v10, v9);
  if (!v11) {
    goto LABEL_65;
  }
  BOOL v47 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 compatibilityObject]);
  if ([v9 containsObject:@"type"])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationType]);
    if ([v13 isEqualToString:LSSystemApplicationType])
    {
      uint64_t v14 = 1LL;
    }

    else if ([v13 isEqualToString:LSUserApplicationType])
    {
      uint64_t v14 = 2LL;
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    -[DMFApp setType:](v11, "setType:", v14);
  }

  if ([v9 containsObject:@"displayName"])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedName]);
    if (v15)
    {
      -[DMFApp setDisplayName:](v11, "setDisplayName:", v15);
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v12 itemName]);
      -[DMFApp setDisplayName:](v11, "setDisplayName:", v16);
    }
  }

  if ([v9 containsObject:@"storeItemIdentifier"])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 itemID]);
    -[DMFApp setStoreItemIdentifier:](v11, "setStoreItemIdentifier:", v17);
  }

  if ([v9 containsObject:@"externalVersionIdentifier"])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v12 externalVersionIdentifier]);
    -[DMFApp setExternalVersionIdentifier:](v11, "setExternalVersionIdentifier:", v18);
  }

  if ([v9 containsObject:@"distributorIdentifier"])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v8 iTunesMetadata]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 distributorInfo]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 distributorID]);
    -[DMFApp setDistributorIdentifier:](v11, "setDistributorIdentifier:", v21);
  }

  if ([v9 containsObject:@"version"])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleVersion]);
    -[DMFApp setVersion:](v11, "setVersion:", v22);
  }

  if ([v9 containsObject:@"shortVersion"])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v12 shortVersionString]);
    -[DMFApp setShortVersion:](v11, "setShortVersion:", v23);
  }

  unsigned int v24 = [v9 containsObject:@"staticUsage"];
  unsigned int v25 = [v9 containsObject:@"dynamicUsage"];
  unsigned int v26 = [v9 containsObject:@"onDemandResourcesUsage"];
  unsigned int v27 = [v9 containsObject:@"sharedUsage"];
  unsigned int v28 = v27;
  if ((v24 & 1) != 0 || (v25 & 1) != 0 || (v26 & 1) != 0 || v27)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v12 diskUsage]);
    v30 = v29;
    if (v24)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v29 staticUsage]);
      -[DMFApp setStaticUsage:](v11, "setStaticUsage:", v44);

      if (!v25)
      {
LABEL_30:
        if (!v26) {
          goto LABEL_31;
        }
        goto LABEL_68;
      }
    }

    else if (!v25)
    {
      goto LABEL_30;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue([v30 dynamicUsage]);
    -[DMFApp setDynamicUsage:](v11, "setDynamicUsage:", v45);

    if (!v26)
    {
LABEL_31:
      if (!v28)
      {
LABEL_33:

        goto LABEL_34;
      }

- (BOOL)_proxyIsValidated:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  if (v4)
  {
    uint64_t v5 = MISAppApprovalState(v4, 0LL);
    if (v5) {
      BOOL v6 = v5 == 3;
    }
    else {
      BOOL v6 = 1;
    }
    BOOL v7 = v6;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end