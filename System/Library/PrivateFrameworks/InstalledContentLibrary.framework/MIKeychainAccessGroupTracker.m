@interface MIKeychainAccessGroupTracker
+ (id)sharedTracker;
- (BOOL)_onQueue_addReferencesForBundle:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_removeReferencesForBundle:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_updateReferencesWithOldBundle:(id)a3 newBundle:(id)a4 error:(id *)a5;
- (BOOL)_removeGroupsWithError:(id)a3 error:(id *)a4;
- (BOOL)addReferencesForBundle:(id)a3 error:(id *)a4;
- (BOOL)removeReferencesForBundle:(id)a3 error:(id *)a4;
- (BOOL)updateReferencesWithOldBundle:(id)a3 newBundle:(id)a4 error:(id *)a5;
- (MIKeychainAccessGroupTracker)init;
- (NSCountedSet)refs;
- (OS_dispatch_queue)q;
- (id)_keychainAccessGroupsForApp:(id)a3 error:(id *)a4;
- (id)_keychainAccessGroupsForBundle:(id)a3 error:(id *)a4;
- (void)_onQueue_discoverReferences;
- (void)setRefs:(id)a3;
@end

@implementation MIKeychainAccessGroupTracker

+ (id)sharedTracker
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__MIKeychainAccessGroupTracker_sharedTracker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTracker_onceToken != -1) {
    dispatch_once(&sharedTracker_onceToken, block);
  }
  return (id)sharedTracker_sharedInstance;
}

void __45__MIKeychainAccessGroupTracker_sharedTracker__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedTracker_sharedInstance;
  sharedTracker_sharedInstance = (uint64_t)v0;
}

- (MIKeychainAccessGroupTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MIKeychainAccessGroupTracker;
  v2 = -[MIKeychainAccessGroupTracker init](&v8, sel_init);
  if (v2
    && (dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(),
        dispatch_queue_t v4 = dispatch_queue_create("com.apple.installd.MIKeychainAccessGroupTracker", v3),
        q = v2->_q,
        v2->_q = (OS_dispatch_queue *)v4,
        q,
        v3,
        !v2->_q))
  {
    v6 = 0LL;
  }

  else
  {
    v6 = v2;
  }

  return v6;
}

- (void)_onQueue_discoverReferences
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  -[MIKeychainAccessGroupTracker q](self, "q");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  mach_absolute_time();
  dispatch_queue_t v4 = (void *)objc_opt_new();
  v5 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  [v5 systemAppBundleIDToInfoMap];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    [v4 addObject:v6];
  }
  v7 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  [v7 internalAppBundleIDToInfoMap];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    [v4 addObject:v8];
  }
  v9 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  [v9 coreServicesAppBundleIDToInfoMap];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    [v4 addObject:v10];
  }
  v11 = (void *)objc_opt_new();
  -[MIKeychainAccessGroupTracker setRefs:](self, "setRefs:", v11);

  id v44 = 0LL;
  v12 = +[MIBundleContainer allAppBundleContainersWithError:]( &OBJC_CLASS___MIBundleContainer,  "allAppBundleContainersWithError:",  &v44);
  id v13 = v44;
  if (v12)
  {
    v31 = v12;
    v33 = v4;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v41 = 0u;
    __int128 v40 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
    v32 = v10;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          objc_msgSend(v19, "bundle", v30);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            id v39 = v13;
            BOOL v21 = -[MIKeychainAccessGroupTracker _onQueue_addReferencesForBundle:error:]( self,  "_onQueue_addReferencesForBundle:error:",  v20,  &v39);
            id v22 = v39;

            if (!v21 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              v30 = v20;
              MOLogWrite();
            }

            id v13 = v22;
          }

          else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v30 = v19;
            MOLogWrite();
          }
        }

        uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }

      while (v16);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v23 = v33;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      uint64_t v27 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t j = 0LL; j != v25; ++j)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          v29 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          v34[0] = v27;
          v34[1] = 3221225472LL;
          v34[2] = __59__MIKeychainAccessGroupTracker__onQueue_discoverReferences__block_invoke;
          v34[3] = &unk_189D48A98;
          v34[4] = self;
          objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34, v30);
        }

        uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }

      while (v25);
    }

    mach_absolute_time();
    v10 = v32;
    dispatch_queue_t v4 = v33;
    v12 = v31;
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
}

void __59__MIKeychainAccessGroupTracker__onQueue_discoverReferences__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v14 = 0LL;
    v7 = +[MIBundle bundleForURL:error:](&OBJC_CLASS___MIExecutableBundle, "bundleForURL:error:", v6, &v14);
    id v8 = v14;
    if (v7)
    {
      v9 = *(void **)(a1 + 32);
      id v13 = v8;
      char v10 = objc_msgSend(v9, "_onQueue_addReferencesForBundle:error:", v7, &v13);
      id v11 = v13;

      id v8 = v11;
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v6 path];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (BOOL)_onQueue_addReferencesForBundle:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MIKeychainAccessGroupTracker q](self, "q");
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MIKeychainAccessGroupTracker refs](self, "refs");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    -[MIKeychainAccessGroupTracker _onQueue_discoverReferences](self, "_onQueue_discoverReferences");
  }
  id v24 = 0LL;
  v9 = -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:]( self,  "_keychainAccessGroupsForApp:error:",  v6,  &v24);
  id v10 = v24;
  if (v9)
  {
    if (![v9 count]) {
      goto LABEL_19;
    }
    v19 = a4;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
          -[MIKeychainAccessGroupTracker refs](self, "refs");
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 addObject:v16];

          ++v15;
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v13);
    }

    a4 = v19;
  }

  else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    MOLogWrite();
  }

  if (a4 && !v9) {
    *a4 = v10;
  }
LABEL_19:

  return v9 != 0LL;
}

- (BOOL)addReferencesForBundle:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_onQueue_updateReferencesWithOldBundle:(id)a3 newBundle:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v41 = a4;
  -[MIKeychainAccessGroupTracker q](self, "q");
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_opt_new();
  -[MIKeychainAccessGroupTracker refs](self, "refs");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11) {
    -[MIKeychainAccessGroupTracker _onQueue_discoverReferences](self, "_onQueue_discoverReferences");
  }
  id v52 = 0LL;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:]( self,  "_keychainAccessGroupsForApp:error:",  v8,  &v52);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v52;
  id v14 = v13;
  if (!v12)
  {
    id v15 = 0LL;
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }

  id v51 = v13;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:]( self,  "_keychainAccessGroupsForApp:error:",  v41,  &v51);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v51;

  if (!v15)
  {
    id v15 = 0LL;
    id v14 = v16;
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }

  if (([v12 isEqualToSet:v15] & 1) == 0)
  {
    __int128 v37 = a5;
    __int128 v38 = v16;
    __int128 v40 = v10;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v39 = v12;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        for (uint64_t i = 0LL; i != v21; ++i)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          if (([v15 containsObject:v24] & 1) == 0)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              [v41 identifier];
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v36 = v24;
              MOLogWrite();
            }

            -[MIKeychainAccessGroupTracker refs](self, "refs", v35, v36);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v25 removeObject:v24];

            -[MIKeychainAccessGroupTracker refs](self, "refs");
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v27 = [v26 countForObject:v24];

            if (!v27) {
              [v40 addObject:v24];
            }
          }
        }

        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v54 count:16];
      }

      while (v21);
    }

    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v15 = v15;
    uint64_t v28 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v44;
      do
      {
        for (uint64_t j = 0LL; j != v29; ++j)
        {
          if (*(void *)v44 != v30) {
            objc_enumerationMutation(v15);
          }
          uint64_t v32 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          if (([v19 containsObject:v32] & 1) == 0)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              [v41 identifier];
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v36 = v32;
              MOLogWrite();
            }
            v33 = -[MIKeychainAccessGroupTracker refs](self, "refs", v35, v36);
            [v33 addObject:v32];
          }
        }

        uint64_t v29 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }

      while (v29);
    }

    id v10 = v40;
    if (![v40 count])
    {
      BOOL v17 = 1;
      uint64_t v12 = v39;
      id v16 = v38;
      goto LABEL_18;
    }

    id v42 = v38;
    BOOL v34 = -[MIKeychainAccessGroupTracker _removeGroupsWithError:error:]( self,  "_removeGroupsWithError:error:",  v40,  &v42);
    id v14 = v42;

    uint64_t v12 = v39;
    if (v34)
    {
      BOOL v17 = 1;
      goto LABEL_17;
    }

    a5 = v37;
    if (!v37)
    {
LABEL_16:
      BOOL v17 = 0;
LABEL_17:
      id v16 = v14;
      goto LABEL_18;
    }

- (BOOL)updateReferencesWithOldBundle:(id)a3 newBundle:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)_onQueue_removeReferencesForBundle:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MIKeychainAccessGroupTracker q](self, "q");
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_opt_new();
  v9 = -[MIKeychainAccessGroupTracker refs](self, "refs");
  if (!v9) {
    -[MIKeychainAccessGroupTracker _onQueue_discoverReferences](self, "_onQueue_discoverReferences");
  }
  id v35 = 0LL;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:]( self,  "_keychainAccessGroupsForApp:error:",  v6,  &v35);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v35;
  id v12 = v11;
  if (!v10)
  {
    if (!a4) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }

  uint64_t v27 = a4;
  uint64_t v28 = v11;
  uint64_t v29 = v10;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          [v6 identifier];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = v18;
          MOLogWrite();
        }

        -[MIKeychainAccessGroupTracker refs](self, "refs", v25, v26);
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 removeObject:v18];

        -[MIKeychainAccessGroupTracker refs](self, "refs");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v20 countForObject:v18];

        if (!v21) {
          [v8 addObject:v18];
        }
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }

    while (v15);
  }

  if (![v8 count])
  {
    BOOL v23 = 1;
    id v12 = v28;
    id v10 = v29;
    goto LABEL_27;
  }

  id v30 = v28;
  BOOL v22 = -[MIKeychainAccessGroupTracker _removeGroupsWithError:error:](self, "_removeGroupsWithError:error:", v8, &v30);
  id v12 = v30;

  if (!v22)
  {
    a4 = v27;
    id v10 = v29;
    if (!v27)
    {
LABEL_26:
      BOOL v23 = 0;
      goto LABEL_27;
    }

- (BOOL)removeReferencesForBundle:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_removeGroupsWithError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v7 = SecItemDeleteAllWithAccessGroups();
  if ((v7 & 1) != 0)
  {
    id v8 = 0LL;
  }

  else
  {
    _CreateAndLogError( (uint64_t)"-[MIKeychainAccessGroupTracker _removeGroupsWithError:error:]",  373LL,  @"MIInstallerErrorDomain",  125LL,  0LL,  0LL,  @"Failed to remove keychain items %@",  v6,  (uint64_t)v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
  }

  return v7;
}

- (id)_keychainAccessGroupsForBundle:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v17 = 0LL;
  [v5 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApp licable:0 skippingProfileIDValidation:0 error:&v17];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v17;
  if (v6)
  {
    id v8 = (void *)objc_opt_new();
    [v6 entitlements];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MICopyKeychainAccessGroupEntitlement(v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      [v8 addObjectsFromArray:v10];
    }
    [v6 entitlements];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    MICopyApplicationGroupEntitlement(v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12) {
      [v8 addObjectsFromArray:v12];
    }
    [v6 entitlements];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    MICopyApplicationIdentifierEntitlement(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14) {
      [v8 addObject:v14];
    }
    uint64_t v15 = (void *)[v8 copy];
  }

  else
  {
    uint64_t v15 = 0LL;
    if (a4) {
      *a4 = v7;
    }
  }

  return v15;
}

- (id)_keychainAccessGroupsForApp:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void *)objc_opt_new();
  id v49 = 0LL;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForBundle:error:]( self,  "_keychainAccessGroupsForBundle:error:",  v6,  &v49);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v49;
  if (!v8)
  {
    id v22 = 0LL;
    id v12 = 0LL;
    id v30 = 0LL;
    id v11 = v9;
    if (!a4) {
      goto LABEL_38;
    }
LABEL_36:
    if (!v30) {
      *a4 = v11;
    }
    goto LABEL_38;
  }

  [v7 unionSet:v8];
  id v48 = v9;
  [v6 appExtensionBundlesWithError:&v48];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v48;

  if (!v10)
  {
    id v22 = 0LL;
    id v12 = 0LL;
    id v30 = 0LL;
    if (!a4) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }

  __int128 v34 = v8;
  id v35 = a4;
  uint64_t v36 = v7;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    while (2)
    {
      uint64_t v16 = 0LL;
      id v17 = v11;
      do
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * v16);
        id v43 = v17;
        -[MIKeychainAccessGroupTracker _keychainAccessGroupsForBundle:error:]( self,  "_keychainAccessGroupsForBundle:error:",  v18,  &v43);
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        id v11 = v43;

        if (!v19)
        {
          id v7 = v36;

          id v22 = 0LL;
          id v30 = 0LL;
          goto LABEL_30;
        }

        [v36 unionSet:v19];

        ++v16;
        id v17 = v11;
      }

      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  uint64_t v20 = v11;

  id v42 = v11;
  [v6 xpcServiceBundlesWithError:&v42];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v42;

  if (!v21)
  {
    id v7 = v36;
    id v8 = v34;
    id v22 = 0LL;
    id v30 = 0LL;
    a4 = v35;
    if (!v35) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }

  id v33 = v6;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v39;
    while (2)
    {
      uint64_t v26 = 0LL;
      uint64_t v27 = v11;
      do
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8 * v26);
        id v37 = v27;
        -[MIKeychainAccessGroupTracker _keychainAccessGroupsForBundle:error:]( self,  "_keychainAccessGroupsForBundle:error:",  v28,  &v37);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        id v11 = v37;

        if (!v29)
        {

          id v30 = 0LL;
          id v6 = v33;
          id v7 = v36;
          goto LABEL_30;
        }

        [v36 unionSet:v29];

        ++v26;
        uint64_t v27 = v11;
      }

      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }

  id v7 = v36;
  id v30 = (void *)[v36 copy];
  id v6 = v33;
LABEL_30:
  id v8 = v34;
  a4 = v35;
  if (v35) {
    goto LABEL_36;
  }
LABEL_38:
  id v31 = v30;

  return v31;
}

- (NSCountedSet)refs
{
  return self->_refs;
}

- (void)setRefs:(id)a3
{
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
}

@end