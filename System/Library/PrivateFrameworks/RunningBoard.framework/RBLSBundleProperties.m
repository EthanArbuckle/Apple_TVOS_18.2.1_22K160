@interface RBLSBundleProperties
- (BOOL)continuousBackgroundMode;
- (BOOL)hasPreferredJetsamBand;
- (BOOL)isExtension;
- (BOOL)supportsBackgroundAudio;
- (BOOL)supportsBackgroundContentFetching;
- (BOOL)supportsBackgroundNetworkAuthentication;
- (BOOL)supportsUnboundedTaskCompletion;
- (BOOL)usesSocketMonitoring;
- (NSDictionary)environmentVariables;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)containerOverrideIdentifier;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSURL)dataContainerURL;
- (id)bundleInfoValuesForKeys:(id)a3;
- (id)proxy;
- (int)platform;
- (int)preferredJetsamBand;
- (uint64_t)initWithApplicationProxy:(uint64_t)a1;
- (uint64_t)initWithBundleProxy:(uint64_t)a1;
- (void)proxy;
@end

@implementation RBLSBundleProperties

- (uint64_t)initWithBundleProxy:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      uint64_t v4 = [v3 bundleIdentifier];
      v5 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v4;

      [v3 bundleURL];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 path];
      v8 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v7;

      uint64_t v9 = [v3 canonicalExecutablePath];
      v10 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v9;

      uint64_t v11 = [v3 dataContainerURL];
      v12 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v11;

      uint64_t v13 = [v3 environmentVariables];
      v14 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v13;

      uint64_t v15 = objc_msgSend(v3, "_rb_extensionPointIdentifier");
      v16 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v15;

      uint64_t v17 = *(void *)(a1 + 48);
      *(_BYTE *)(a1 + 15) = v17 != 0;
      if (v17)
      {
        uint64_t v18 = [v3 entitlementValueForKey:@"com.apple.private.security.container-required" ofClass:objc_opt_class()];
        v19 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v18;
      }
    }
  }

  return a1;
}

- (uint64_t)initWithApplicationProxy:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    a1 = -[RBLSBundleProperties initWithBundleProxy:](a1, v3);
    if (a1)
    {
      [v3 UIBackgroundModes];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v4 containsObject:@"fetch"]) {
        char v5 = 1;
      }
      else {
        char v5 = [v4 containsObject:@"remote-notification"];
      }
      *(_BYTE *)(a1 + 9) = v5;
      if ([v4 containsObject:@"voip"]) {
        char v6 = 1;
      }
      else {
        char v6 = [v4 containsObject:@"push-to-talk"];
      }
      *(_BYTE *)(a1 + 13) = v6;
      *(_BYTE *)(a1 + 12) = [v4 containsObject:@"unboundedTaskCompletion"];
      *(_BYTE *)(a1 + 10) = [v4 containsObject:@"network-authentication"];
      *(_BYTE *)(a1 + 11) = [v4 containsObject:@"audio"];
      *(_BYTE *)(a1 + 14) = [v4 containsObject:@"continuous"];
      objc_msgSend(MEMORY[0x189604010], "setWithObjects:", @"SBPreferredPriorityBand", 0);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 objectsForInfoDictionaryKeys:v7];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 stringForKey:@"SBPreferredPriorityBand"];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v9 isEqualToString:@"PriorityBandSuspended"])
      {
        *(_DWORD *)(a1 + 16) = 0;
      }

      else
      {
        if (![v9 isEqualToString:@"PriorityBandMail"])
        {
          char v10 = 0;
          *(_DWORD *)(a1 + 16) = -1;
          goto LABEL_15;
        }

        *(_DWORD *)(a1 + 16) = 40;
      }

      char v10 = 1;
LABEL_15:
      *(_BYTE *)(a1 + 8) = v10;
    }
  }

  return a1;
}

- (id)proxy
{
  if (!a1) {
    return 0LL;
  }
  v1 = (void *)MEMORY[0x189605758];
  v2 = (void *)(a1 + 32);
  [MEMORY[0x189604030] URLWithString:*(void *)(a1 + 32)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = 0LL;
  [v1 bundleProxyForURL:v3 error:&v8];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v8;

  if (!v4)
  {
    rbs_general_log();
    char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[RBLSBundleProperties proxy].cold.1(v2, (uint64_t)v5, v6);
    }
  }

  return v4;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    -[RBLSBundleProperties proxy]((uint64_t)self);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604010] setWithArray:v4];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectsForInfoDictionaryKeys:v6];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v7 rawValues];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_identifier;
}

- (NSString)bundlePath
{
  return self->_path;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSString)containerOverrideIdentifier
{
  return self->_containerOverrideIdentifier;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (BOOL)hasPreferredJetsamBand
{
  return self->_hasPreferredJetsamBand;
}

- (int)preferredJetsamBand
{
  return self->_preferredJetsamBand;
}

- (BOOL)supportsBackgroundContentFetching
{
  return self->_supportsBackgroundContentFetching;
}

- (BOOL)supportsBackgroundNetworkAuthentication
{
  return self->_supportsBackgroundNetworkAuthentication;
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (BOOL)supportsUnboundedTaskCompletion
{
  return self->_supportsUnboundedTaskCompletion;
}

- (BOOL)usesSocketMonitoring
{
  return self->_usesSocketMonitoring;
}

- (BOOL)continuousBackgroundMode
{
  return self->_continuousBackgroundMode;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (int)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
}

- (void)proxy
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189604030] URLWithString:*a1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_fault_impl( &dword_188634000,  a3,  OS_LOG_TYPE_FAULT,  "LSBundleProxy lookup for %{public}@, failed with %{public}@",  (uint8_t *)&v6,  0x16u);
}

@end