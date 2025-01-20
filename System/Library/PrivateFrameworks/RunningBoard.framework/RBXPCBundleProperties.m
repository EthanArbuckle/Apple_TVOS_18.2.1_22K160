@interface RBXPCBundleProperties
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
- (RBXPCBundleProperties)initWithPID:(int)a3;
- (id)bundleInfoValuesForKeys:(id)a3;
- (int)platform;
- (int)preferredJetsamBand;
- (uint64_t)_bundleMatchesProcessWithExecutablePath:(void *)a3 bundleExecutablePath:;
@end

@implementation RBXPCBundleProperties

- (uint64_t)_bundleMatchesProcessWithExecutablePath:(void *)a3 bundleExecutablePath:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v4 = a3;
  [a2 stringByStandardizingPath];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByStandardizingPath];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 isEqual:v6])
  {
    uint64_t v7 = 1LL;
  }

  else
  {
    uint64_t v7 = (uint64_t)realpath_DARWIN_EXTSN((const char *)[v6 UTF8String], 0);
    if (v7)
    {
      [NSString stringWithUTF8String:v7];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      free((void *)v7);
      rbs_general_log();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        v12 = v5;
        __int16 v13 = 2114;
        v14 = v8;
        _os_log_impl( &dword_188634000,  v9,  OS_LOG_TYPE_DEFAULT,  "_bundleMatchesProcessWithExecutablePath using realpath and comparing %{public}@ and %{public}@",  (uint8_t *)&v11,  0x16u);
      }

      if (v5 == v8)
      {
        uint64_t v7 = 1LL;
      }

      else
      {
        uint64_t v7 = 0LL;
        if (v5 && v8) {
          uint64_t v7 = [v5 isEqualToString:v8];
        }
      }
    }
  }

  return v7;
}

- (RBXPCBundleProperties)initWithPID:(int)a3
{
  id v4 = -[RBXPCBundleProperties init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    uint64_t v6 = RBSExecutablePathForPID();
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v6;

    v8 = v5->_executablePath;
    if (v8)
    {
      -[NSString UTF8String](v8, "UTF8String");
      v9 = (void *)xpc_bundle_create();
      executable_path = (void *)xpc_bundle_get_executable_path();
      if (executable_path) {
        executable_path = (void *)[objc_alloc(NSString) initWithUTF8String:executable_path];
      }
      if (v9
        && -[RBXPCBundleProperties _bundleMatchesProcessWithExecutablePath:bundleExecutablePath:]( (uint64_t)v5,  v5->_executablePath,  executable_path))
      {
        v5->_canFetchBundle = 1;
        xpc_bundle_get_info_dictionary();
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          string = xpc_dictionary_get_string( v11, (const char *)[(id) *MEMORY[0x189604E00] UTF8String]);
          if (string)
          {
            uint64_t v14 = [objc_alloc(NSString) initWithUTF8String:string];
            identifier = v5->_identifier;
            v5->_identifier = (NSString *)v14;
          }
        }

        else
        {
          v12 = 0LL;
        }

        uint64_t property = xpc_bundle_get_property();
        if (property)
        {
          uint64_t v20 = [objc_alloc(NSString) initWithUTF8String:property];
          path = v5->_path;
          v5->_path = (NSString *)v20;
        }

        uint64_t v22 = RBSExtensionPointFromBundleDict();
        extensionPointIdentifier = v5->_extensionPointIdentifier;
        v5->_extensionPointIdentifier = (NSString *)v22;

        v5->_isExtension = v5->_extensionPointIdentifier != 0LL;
        [v12 objectForKeyedSubscript:@"UIBackgroundModes"];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v25 = v24;
          if ([v25 containsObject:@"fetch"]) {
            char v26 = 1;
          }
          else {
            char v26 = [v25 containsObject:@"remote-notification"];
          }
          v5->_supportsBackgroundContentFetching = v26;
          if ([v25 containsObject:@"voip"]) {
            char v27 = 1;
          }
          else {
            char v27 = [v25 containsObject:@"push-to-talk"];
          }
          v5->_usesSocketMonitoring = v27;
          v5->_supportsUnboundedTaskCompletion = [v25 containsObject:@"unboundedTaskCompletion"];
          v5->_supportsBackgroundNetworkAuthentication = [v25 containsObject:@"network-authentication"];
          v5->_supportsBackgroundAudio = [v25 containsObject:@"audio"];
          v5->_continuousBackgroundMode = [v25 containsObject:@"continuous"];
        }

        [v12 objectForKeyedSubscript:@"SBPreferredPriorityBand"];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v28 isEqualToString:@"PriorityBandSuspended"])
        {
          v5->_preferredJetsamBand = 0;
        }

        else
        {
          if (![v28 isEqualToString:@"PriorityBandMail"])
          {
            char v29 = 0;
            v5->_preferredJetsamBand = -1;
            goto LABEL_31;
          }

          v5->_preferredJetsamBand = 40;
        }

        char v29 = 1;
LABEL_31:
        v5->_hasPreferredJetsamBand = v29;

        goto LABEL_12;
      }
    }

    else
    {
      v9 = 0LL;
      executable_path = 0LL;
    }

    v5->_canFetchBundle = 0;
    uint64_t v16 = RBSBundleIDForPID();
    v17 = v5->_identifier;
    v5->_identifier = (NSString *)v16;

    v5->_preferredJetsamBand = -1;
LABEL_12:
  }

  return v5;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v31 = a3;
  if ([v31 count])
  {
    if (self->_canFetchBundle)
    {
      id v4 = self;
      objc_sync_enter(v4);
      if (!v4->_plistValues)
      {
        v5 = (NSCache *)objc_alloc_init(MEMORY[0x189603F30]);
        plistValues = v4->_plistValues;
        v4->_plistValues = v5;

        -[NSCache setCountLimit:](v4->_plistValues, "setCountLimit:", 20LL);
      }

      id v34 = objc_alloc_init(MEMORY[0x189603FC8]);
      [MEMORY[0x189604010] setWithArray:v31];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)[v7 mutableCopy];
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      obuint64_t j = v7;
      uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v40;
        do
        {
          for (uint64_t i = 0LL; i != v8; ++i)
          {
            if (*(void *)v40 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            v12 = -[NSCache objectForKey:](v4->_plistValues, "objectForKey:", v11);
            if (v12)
            {
              [MEMORY[0x189603FE8] null];
              __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v14 = v12 == v13;

              if (!v14) {
                [v34 setObject:v12 forKey:v11];
              }
              [v33 removeObject:v11];
            }
          }

          uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        }

        while (v8);
      }

      if ([v33 count])
      {
        RBSExecutablePathForPID();
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        id v30 = v15;
        if (v15 && ([v15 UTF8String], (uint64_t v16 = xpc_bundle_create()) != 0))
        {
          char v29 = (void *)v16;
          xpc_bundle_get_info_dictionary();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            v18 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          }
          else {
            v18 = 0LL;
          }
        }

        else
        {
          char v29 = 0LL;
          v18 = 0LL;
        }

        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v20 = v33;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v36;
          do
          {
            for (uint64_t j = 0LL; j != v21; ++j)
            {
              if (*(void *)v36 != v22) {
                objc_enumerationMutation(v20);
              }
              uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * j);
              objc_msgSend(v18, "objectForKey:", v24, v29, v30);
              id v25 = (void *)objc_claimAutoreleasedReturnValue();
              char v26 = v4->_plistValues;
              if (v25)
              {
                -[NSCache setObject:forKey:](v4->_plistValues, "setObject:forKey:", v25, v24);
                [v34 setObject:v25 forKey:v24];
              }

              else
              {
                [MEMORY[0x189603FE8] null];
                char v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSCache setObject:forKey:](v26, "setObject:forKey:", v27, v24);
              }
            }

            uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }

          while (v21);
        }
      }

      objc_sync_exit(v4);
    }

    else
    {
      rbs_general_log();
      id v4 = (RBXPCBundleProperties *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
      {
        int pid = self->_pid;
        *(_DWORD *)buf = 67109120;
        int v46 = pid;
        _os_log_impl( &dword_188634000,  (os_log_t)v4,  OS_LOG_TYPE_INFO,  "Bundle info cannot be fetched for process %d",  buf,  8u);
      }

      id v34 = 0LL;
    }
  }

  else
  {
    id v34 = 0LL;
  }

  return v34;
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

@end