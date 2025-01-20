@interface DMDSetAppExtensionUUIDsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppExtensionUUIDsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetAppExtensionUUIDsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A54C0;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 VPNUUIDString]);
  id v31 = 0LL;
  unsigned __int8 v10 = [v8 setVPNUUIDString:v9 forBundleIdentifier:v7 error:&v31];
  id v11 = v31;
  if ((v10 & 1) == 0)
  {

    id v15 = v11;
LABEL_13:
    -[DMDSetAppExtensionUUIDsOperation endOperationWithError:](self, "endOperationWithError:", v11);
    goto LABEL_14;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 cellularSliceUUIDString]);
  id v30 = v11;
  unsigned int v14 = [v12 setCellularSliceUUIDString:v13 forBundleIdentifier:v7 error:&v30];
  id v15 = v30;

  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    v29[2] = v15;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 contentFilterUUIDString]);
    v28 = v16;
    unsigned int v17 = objc_msgSend(v16, "setContentFilterUUIDString:forBundleIdentifier:error:");
    id v18 = v15;

    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
      v29[1] = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v6 DNSProxyUUIDString]);
      v26 = v19;
      unsigned int v17 = objc_msgSend(v19, "setDNSProxyUUIDString:forBundleIdentifier:error:");
      id v20 = v18;

      if (v17)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v6 relayUUIDString]);
        v29[0] = v20;
        unsigned int v17 = [v24 setRelayUUIDString:v21 forBundleIdentifier:v7 error:v29];
        id v23 = v29[0];

        id v20 = v23;
      }

      id v18 = v20;
    }

    id v15 = v18;
  }

  else
  {
    unsigned int v17 = 0;
  }

  if (!v17)
  {
    id v11 = v15;
    goto LABEL_13;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  [v22 sendManagedAppsChangedNotification];

  -[DMDSetAppExtensionUUIDsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
LABEL_14:
}

@end