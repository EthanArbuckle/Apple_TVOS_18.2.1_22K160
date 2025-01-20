@interface _LSDReadClient
- (void)getAllUserActivityTypesAndDomainNamesWithCompletionHandler:(id)a3;
- (void)getBundleProxyForCurrentProcessWithCompletionHandler:(id)a3;
- (void)getBundleRecordForCoreTypesWithCompletionHandler:(id)a3;
- (void)getBundleRecordForCurrentProcessWithCompletionHandler:(id)a3;
- (void)getDiskUsage:(id)a3 completionHandler:(id)a4;
- (void)getExtensionPointRecordForCurrentProcessWithCompletionHandler:(id)a3;
- (void)getExtensionPointRecordWithIdentifier:(id)a3 platform:(unsigned int)a4 completionHandler:(id)a5;
- (void)getKernelPackageExtensionsWithCompletionHandler:(id)a3;
- (void)getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:(id)a3;
- (void)getPreferencesWithCompletionHandler:(id)a3;
- (void)getPreferredAppMarketplacesWithCompletion:(id)a3;
- (void)getRedactedAppexRecordForSystemAppexWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 completionHandler:(id)a7;
- (void)getRelatedTypesOfTypeWithIdentifier:(id)a3 maximumDegreeOfSeparation:(int64_t)a4 completionHandler:(id)a5;
- (void)getResourceValuesForKeys:(id)a3 mimic:(id)a4 preferredLocalizations:(id)a5 completionHandler:(id)a6;
- (void)getServerStatusWithCompletionHandler:(id)a3;
- (void)getServerStoreNonBlockingWithCompletionHandler:(id)a3;
- (void)getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:(id)a3;
- (void)getSettingsStoreConfigurationWithCompletionHandler:(id)a3;
- (void)getSystemContentStoreWithCompletionHandler:(id)a3;
- (void)getTypeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4 completionHandler:(id)a5;
- (void)getTypeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4 completionHandler:(id)a5;
- (void)getTypeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6;
- (void)getTypeRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getTypeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6;
- (void)getWhetherTypeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4;
- (void)mapBundleIdentifiers:(id)a3 orMachOUUIDs:(id)a4 completionHandler:(id)a5;
- (void)mapPlugInBundleIdentifiersToContainingBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)resolveQueries:(id)a3 legacySPI:(BOOL)a4 completionHandler:(id)a5;
- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4;
@end

@implementation _LSDReadClient

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSDReadClient;
  -[_LSDClient willHandleInvocation:isReply:](&v7, sel_willHandleInvocation_isReply_, v6, v4);
  if (!v4
    && (char *)[v6 selector] != sel_getServerStatusWithCompletionHandler_
    && (char *)[v6 selector] != sel_getServerStoreNonBlockingWithCompletionHandler_)
  {
    __LAUNCH_SERVICES_IS_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__();
  }
}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
  id v5 = a3;
  id v7 = v5;
  if (a4)
  {
    objc_msgSend(v5, "invoke", v5);
  }

  else
  {
    _LSServer_DatabaseExecutionContext();
    id v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __50___LSDReadClient_invokeServiceInvocation_isReply___block_invoke;
    v8[3] = &unk_189D75590;
    id v9 = v7;
    -[LSDBExecutionContext syncRead:](v6, v8);
  }
}

- (void)getServerStatusWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getServerStatusWithCompletionHandler:]");
  uint64_t SessionStatus = _LSDatabaseGetSessionStatus();
  v4[2](v4, SessionStatus);
}

- (void)getServerStoreNonBlockingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned int SessionStatus = _LSDatabaseGetSessionStatus();
  if ((SessionStatus & 0x80) != 0)
  {
    +[LSDatabaseBlockingFetchServer sharedInstance](&OBJC_CLASS___LSDatabaseBlockingFetchServer, "sharedInstance");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (SessionStatus >> 10) & 1;
    [v7 setBlockingIsForManualRebuild:v8];

    +[LSDatabaseBlockingFetchServer sharedInstance](&OBJC_CLASS___LSDatabaseBlockingFetchServer, "sharedInstance");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 getEndpoint];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *, uint64_t, void))v4 + 2))(v4, 0LL, 0LL, v10, v8, 0LL);
  }

  else
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __65___LSDReadClient_getServerStoreNonBlockingWithCompletionHandler___block_invoke;
    v11[3] = &unk_189D756F0;
    id v12 = v4;
    _LSServer_GetServerStoreForConnectionWithCompletionHandler(v6, v11);
  }
}

- (void)getKernelPackageExtensionsWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, const void *, void))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getKernelPackageExtensionsWithCompletionHandler:]");
  v3 = _LSCopyKernelPackageExtensionsAsLSD();
  id v4 = v3;
  if (v3 && CFArrayGetCount(v3) >= 1)
  {
    v6[2](v6, v4, 0LL);
LABEL_5:
    CFRelease(v4);
    goto LABEL_6;
  }

  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10817LL,  (uint64_t)"-[_LSDReadClient getKernelPackageExtensionsWithCompletionHandler:]",  394LL,  0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, const void *, void *))v6)[2](v6, 0LL, v5);

  if (v4) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)getDiskUsage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getDiskUsage:completionHandler:]");
  MEMORY[0x186E2AFD4]();
  +[_LSDiskUsage _serverQueue](&OBJC_CLASS____LSDiskUsage, "_serverQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49___LSDReadClient_getDiskUsage_completionHandler___block_invoke;
  block[3] = &unk_189D72970;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:]");
  +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  id v13 = 0LL;
  [v5 getKnowledgeUUID:&v13 andSequenceNumber:&v12];
  id v6 = v13;
  id v7 = v12;

  -[_LSDClient XPCConnection](self, "XPCConnection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 _xpcConnection];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v9);

  if (!MayMapDatabase)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x189607AB8], "_LS_nullUUID");

    id v6 = (id)v11;
  }

  v4[2](v4, v6, v7);
}

- (void)resolveQueries:(id)a3 legacySPI:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]");
  id v10 = (void *)objc_opt_class();
  if (!_LSIsSetWithValuesOfClass(v8, v10))
  {
    uint64_t v28 = *MEMORY[0x189607490];
    v29 = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]",  492LL,  v11);
    goto LABEL_14;
  }

  +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 _xpcConnection];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v14 = _LSIsXPCConnectionPlatformBinary(v13);

    if (v14)
    {
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v15 = v8;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        do
        {
          uint64_t v18 = 0LL;
          do
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * v18++) setLegacy:1];
          }

          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }

        while (v16);
      }

      goto LABEL_12;
    }

    uint64_t v22 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]",  468LL,  0LL);
LABEL_14:
    id v21 = (id)v22;
    v20 = 0LL;
    goto LABEL_15;
  }

- (void)getBundleRecordForCurrentProcessWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void *, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleRecordForCurrentProcessWithCompletionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }

  else
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
  }

  v20[0] = v21;
  v20[1] = v22;
  id v19 = 0LL;
  +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v20,  &v19);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v7 applicationExtensionRecords];
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "_resolveAllProperties", (void)v15);
          [v13 extensionPointRecord];
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 _resolveAllProperties];
        }

        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }

      while (v10);
    }
  }

  v4[2](v4, v7, v8);
}

- (void)getBundleProxyForCurrentProcessWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleProxyForCurrentProcessWithCompletionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }

  else
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
  }

  v12[0] = v13;
  v12[1] = v14;
  id v11 = 0LL;
  +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v12,  &v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v11;
  if (v7)
  {
    [v7 compatibilityObject];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      uint64_t v10 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10810LL,  (uint64_t)"-[_LSDReadClient getBundleProxyForCurrentProcessWithCompletionHandler:]",  531LL,  0LL);

      id v9 = 0LL;
      id v8 = (id)v10;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  v4[2](v4, v9, v8);
}

- (void)getBundleRecordForCoreTypesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleRecordForCoreTypesWithCompletionHandler:]");
  v3 = +[LSBundleRecord coreTypesBundleRecord](&OBJC_CLASS___LSBundleRecord, "coreTypesBundleRecord");
  [v3 _realRecord];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v4);
}

- (void)getExtensionPointRecordWithIdentifier:(id)a3 platform:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = (void (**)(id, LSExtensionPointRecord *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getExtensionPointRecordWithIdentifier:platform:completionHandler:]");
  id v11 = 0LL;
  id v9 = -[LSExtensionPointRecord initWithIdentifier:platform:error:]( objc_alloc(&OBJC_CLASS___LSExtensionPointRecord),  "initWithIdentifier:platform:error:",  v7,  v6,  &v11);
  id v10 = v11;
  v8[2](v8, v9, v10);
}

- (void)getExtensionPointRecordForCurrentProcessWithCompletionHandler:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getExtensionPointRecordForCurrentProcessWithCompletionHandler:]");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __80___LSDReadClient_getExtensionPointRecordForCurrentProcessWithCompletionHandler___block_invoke;
  v6[3] = &unk_189D76818;
  id v5 = v4;
  id v7 = v5;
  -[_LSDReadClient getBundleRecordForCurrentProcessWithCompletionHandler:]( self,  "getBundleRecordForCurrentProcessWithCompletionHandler:",  v6);
}

- (void)getTypeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v7 = (void (**)(id, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordWithIdentifier:allowUndeclared:completionHandler:]");
  if (v9)
  {
    if (v6) {
      +[UTTypeRecord typeRecordWithPotentiallyUndeclaredIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "typeRecordWithPotentiallyUndeclaredIdentifier:");
    }
    else {
      +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:");
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  v7[2](v7, v8);
}

- (void)getTypeRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void *))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordsWithIdentifiers:completionHandler:]");
  if (v8 && (BOOL v6 = (void *)objc_opt_class(), _LSIsSetWithValuesOfClass(v8, v6)))
  {
    +[UTTypeRecord typeRecordsWithIdentifiers:](&OBJC_CLASS___UTTypeRecord, "typeRecordsWithIdentifiers:", v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = 0LL;
  }

  v5[2](v5, v7);
}

- (void)getTypeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordWithTag:ofClass:conformingToIdentifier:completionHandler:]");
  id v12 = 0LL;
  if (v13 && v9)
  {
    +[UTTypeRecord typeRecordWithTag:ofClass:conformingToIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "typeRecordWithTag:ofClass:conformingToIdentifier:",  v13,  v9,  v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11[2](v11, v12);
}

- (void)getTypeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordsWithTag:ofClass:conformingToIdentifier:completionHandler:]");
  id v12 = 0LL;
  if (v13 && v9)
  {
    +[UTTypeRecord typeRecordsWithTag:ofClass:conformingToIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "typeRecordsWithTag:ofClass:conformingToIdentifier:",  v13,  v9,  v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11[2](v11, v12);
}

- (void)getTypeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordForImportedTypeWithIdentifier:conformingToIdentifier:c"
                                    "ompletionHandler:]");
  if (v10)
  {
    +[UTTypeRecord typeRecordForImportedTypeWithIdentifier:conformingToIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "typeRecordForImportedTypeWithIdentifier:conformingToIdentifier:",  v10,  v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
  }

  v8[2](v8, v9);
}

- (void)getRelatedTypesOfTypeWithIdentifier:(id)a3 maximumDegreeOfSeparation:(int64_t)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v7 = (void (**)(id, id, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getRelatedTypesOfTypeWithIdentifier:maximumDegreeOfSeparation:completionHandler:]");
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", v13);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __98___LSDReadClient_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler___block_invoke;
    v14[3] = &unk_189D76840;
    id v11 = v9;
    id v15 = v11;
    id v12 = v10;
    id v16 = v12;
    [v8 _enumerateRelatedTypesWithMaximumDegreeOfSeparation:a4 block:v14];
    v7[2](v7, v11, v12);
  }

  else
  {
    v7[2](v7, 0LL, 0LL);
  }
}

- (void)getWhetherTypeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, BOOL))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getWhetherTypeIdentifier:conformsToTypeIdentifier:completionHandler:]");
  BOOL v9 = 0LL;
  if (v10 && v7) {
    BOOL v9 = +[UTTypeRecord _typeIdentifier:conformsToTypeIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "_typeIdentifier:conformsToTypeIdentifier:",  v10,  v7);
  }
  v8[2](v8, v9);
}

- (void)getAllUserActivityTypesAndDomainNamesWithCompletionHandler:(id)a3
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _xpcConnection];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    CFTypeRef cf = 0LL;
    CFTypeRef v15 = 0LL;
    int v8 = _LSCopyClaimedActivityIdentifiersAndDomains(&v15, &cf);
    if (v8)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v8,  (uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]",  718LL,  0LL);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0LL, 0LL, v9);
    }

    else
    {
      CFTypeRef v12 = cf;
      id v13 = (void (*)(id, void *, CFTypeRef, void))*((void *)v4 + 2);
      BOOL v9 = (id)v15;
      v13(v4, v9, v12, 0LL);
    }

    if (cf) {
      CFRelease(cf);
    }
    if (v15) {
      CFRelease(v15);
    }
  }

  else
  {
    uint64_t v16 = *MEMORY[0x189607490];
    v17[0] = @"process may not map database";
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]",  722LL,  v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0LL, 0LL, v11);
  }
}

- (void)getResourceValuesForKeys:(id)a3 mimic:(id)a4 preferredLocalizations:(id)a5 completionHandler:(id)a6
{
  v38[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  CFTypeRef v12 = (void (**)(id, void *, void *, id))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getResourceValuesForKeys:mimic:preferredLocalizations:completionHandler:]");
  if (!v9) {
    goto LABEL_13;
  }
  _LSURLPropertyProviderAllKeys();
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v9 isSubsetOfSet:v13] ^ 1;
  if (!v10) {
    LOBYTE(v14) = 1;
  }
  if ((v14 & 1) != 0 || ([v10 URL], (CFTypeRef v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_13;
  }

  [v10 URL];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v17 = [v16 isFileURL];

  if (!v17)
  {
LABEL_13:
    uint64_t v37 = *MEMORY[0x189607490];
    v38[0] = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDReadClient getResourceValuesForKeys:mimic:preferredLocalizations:completionHandler:]",  769LL,  v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v25 = 0LL;
    __int128 v26 = 0LL;
    goto LABEL_14;
  }

  __int128 v18 = (void *)objc_opt_class();
  int v19 = _LSIsSetWithValuesOfClass(v9, v18);
  char v20 = v19 ^ 1;
  if (!v11) {
    char v20 = 1;
  }
  if ((v20 & 1) == 0)
  {
    [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    char v22 = _LSIsArrayWithValuesOfClasses(v11, v21);

    if ((v22 & 1) != 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }

  if (!v19) {
    goto LABEL_13;
  }
LABEL_17:
  id v36 = 0LL;
  _LSResolveRemoteURLPropertiesWithMimic(v10, v11, v9, (uint64_t)&v36);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = v36;
  if (!v27)
  {
    __int128 v25 = 0LL;
    __int128 v26 = 0LL;
    goto LABEL_15;
  }

  uint64_t v28 = (void *)[v9 mutableCopy];
  v29 = (void *)MEMORY[0x189604010];
  [v27 allKeys];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setWithArray:v30];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 minusSet:v31];

  id v23 = v28;
  if (_LSURLPropertiesNeedReplacement(v27))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v27, "count"));
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __90___LSDReadClient_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler___block_invoke;
    v34[3] = &unk_189D74918;
    id v33 = v32;
    id v35 = v33;
    [v27 enumerateKeysAndObjectsUsingBlock:v34];
    __int128 v25 = (void *)[v33 copy];
  }

  else
  {
    __int128 v25 = v27;
  }

  __int128 v26 = v23;
LABEL_14:

LABEL_15:
  v12[2](v12, v25, v26, v24);
}

- (void)mapBundleIdentifiers:(id)a3 orMachOUUIDs:(id)a4 completionHandler:(id)a5
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v37 = a3;
  id v36 = a4;
  id v35 = (void (**)(id, void *, void *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 _xpcConnection];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = _LSCheckEntitlementForXPCConnection(v9, @"com.apple.private.coreservices.canmapbundleidtouuid");

  if (!(_DWORD)a5)
  {
    uint64_t v64 = *MEMORY[0x189607490];
    v65 = @"Caller is not allowed to map bundleIDs/UUIDs, required entitlement missing";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]",  870LL,  v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
    __int128 v26 = 0LL;
    __int128 v27 = 0LL;
    goto LABEL_32;
  }

  if (v37)
  {
    id v10 = (void *)objc_opt_class();
    int v11 = _LSIsSetWithValuesOfClass(v37, v10);
  }

  else
  {
    int v11 = 1;
  }

  if (v36 && v11)
  {
    int v14 = (void *)objc_opt_class();
    int v11 = _LSIsSetWithValuesOfClass(v36, v14);
  }

  if (!v11)
  {
    uint64_t v66 = *MEMORY[0x189607490];
    v67 = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]",  866LL,  v25);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }

  id v63 = 0LL;
  id v61 = 0LL;
  v60 = 0LL;
  char v62 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  CFTypeRef v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v60, v15, 0LL);

  if (v16)
  {
    [MEMORY[0x189603FA8] array];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FA8] array];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1895F87A8];
    v55[1] = 3221225472LL;
    v55[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke;
    v55[3] = &unk_189D76868;
    v59 = v16;
    id v56 = v36;
    id v34 = v17;
    id v57 = v34;
    id v33 = v18;
    id v58 = v33;
    int v19 = (void *)MEMORY[0x186E2A7B8](v55);
    v52[0] = MEMORY[0x1895F87A8];
    v52[1] = 3221225472LL;
    v52[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_2;
    v52[3] = &unk_189D768B8;
    v54 = v16;
    id v20 = v19;
    id v53 = v20;
    v39 = (void *)MEMORY[0x186E2A7B8](v52);
    v49[0] = MEMORY[0x1895F87A8];
    v49[1] = 3221225472LL;
    v49[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_4;
    v49[3] = &unk_189D768E0;
    v51 = v16;
    id v32 = v20;
    id v50 = v32;
    v40 = (void *)MEMORY[0x186E2A7B8](v49);
    if (v37)
    {
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v21 = v37;
      id obj = v21;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v68 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v46;
        do
        {
          for (uint64_t i = 0LL; i != v22; ++i)
          {
            if (*(void *)v46 != v23) {
              objc_enumerationMutation(obj);
            }
            _LSDatabaseGetStringForCFString(*v16, *(const __CFString **)(*((void *)&v45 + 1) + 8 * i), 0);
            id v44 = v40;
            _LSDatabaseEnumeratingBindingMap();
            id v43 = v39;
            _LSDatabaseEnumeratingBindingMap();
          }

          id v21 = obj;
          uint64_t v22 = [obj countByEnumeratingWithState:&v45 objects:v68 count:16];
        }

        while (v22);
      }
    }

    else
    {
      id v42 = v40;
      _CSStoreEnumerateUnits();
      id v41 = v39;
      _CSStoreEnumerateUnits();

      id v21 = v42;
    }

    id v13 = 0LL;
  }

  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v28 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v60, v28, 0LL);

    if (v29) {
      id v13 = 0LL;
    }
    else {
      id v13 = v63;
    }
    id v33 = 0LL;
    id v34 = 0LL;
  }

  if (v60 && v62) {
    _LSContextDestroy(v60);
  }
  id v30 = v61;
  id v61 = 0LL;
  v60 = 0LL;

  char v62 = 0;
  id v31 = v63;
  id v63 = 0LL;

  __int128 v26 = v33;
  __int128 v27 = v34;
LABEL_32:
  v35[2](v35, v27, v26, v13);
}

- (void)mapPlugInBundleIdentifiersToContainingBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v22 = a3;
  uint64_t v23 = (void (**)(id, void *, id))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 _xpcConnection];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = _LSCheckEntitlementForXPCConnection(v7, @"com.apple.private.coreservices.canmapbundleidtouuid");

  if (!(_DWORD)self)
  {
    uint64_t v35 = *MEMORY[0x189607490];
    id v36 = @"Caller is not allowed to map pluginIDs/bundleIDs, required entitlement missing";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    CFTypeRef v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]",  923LL,  v15);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    int v17 = 0LL;
    goto LABEL_23;
  }

  int v8 = (void *)objc_opt_class();
  if (!_LSIsSetWithValuesOfClass(v22, v8))
  {
    uint64_t v37 = *MEMORY[0x189607490];
    v38 = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]",  919LL,  v16);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }

  id v34 = 0LL;
  id v31 = 0LL;
  id v32 = 0LL;
  char v33 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v10 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v9, 0LL);

  if (v10)
  {
    [MEMORY[0x189603FC8] dictionary];
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id obj = v22;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          _LSDatabaseGetStringForCFString(*v10, *(const __CFString **)(*((void *)&v27 + 1) + 8 * i), 0);
          id v26 = v25;
          _LSDatabaseEnumeratingBindingMap();
        }

        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
      }

      while (v11);
    }

    id v14 = 0LL;
  }

  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    __int128 v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v18, 0LL);

    if (v19) {
      id v14 = 0LL;
    }
    else {
      id v14 = v34;
    }
    __int128 v25 = 0LL;
  }

  if (v31 && v33) {
    _LSContextDestroy(v31);
  }
  id v20 = v32;
  id v31 = 0LL;
  id v32 = 0LL;

  char v33 = 0;
  id v21 = v34;
  id v34 = 0LL;

  int v17 = v25;
LABEL_23:
  v23[2](v23, v17, v14);
}

- (void)getPreferencesWithCompletionHandler:(id)a3
{
  int v8 = (LaunchServices::PrefsStorage *)a3;
  Shared = (LaunchServices::PrefsStorage *)LaunchServices::PrefsStorage::GetShared(v8);
  uint64_t v4 = LaunchServices::PrefsStorage::getAllPreferences(Shared);
  id v5 = (void *)v4;
  BOOL v6 = (void *)MEMORY[0x189604A60];
  if (v4) {
    BOOL v6 = (void *)v4;
  }
  id v7 = v6;

  (*((void (**)(LaunchServices::PrefsStorage *, id, void))v8 + 2))(v8, v7, 0LL);
}

- (void)getSettingsStoreConfigurationWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  [MEMORY[0x189607B30] currentConnection];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    [v4 auditToken];
  }

  else
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
  }

  +[LSSettingsStore sharedInstance](&OBJC_CLASS___LSSettingsStore, "sharedInstance");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v10;
  v9[1] = v11;
  [v6 settingsStoreConfigurationForProcessWithAuditToken:v9];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v3[2](v3, v7, 0LL);
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDReadClient getSettingsStoreConfigurationWithCompletionHandler:]",  944LL,  0LL);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v3)[2](v3, 0LL, v8);
  }
}

- (void)getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, void *, void *))a3;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _xpcConnection];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    int v8 = 0LL;
    [(id)__LSDefaultsGetSharedInstance() preferredLocalizations];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v11 = *MEMORY[0x189607490];
    v12[0] = @"process is not entitled to get language list";
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDReadClient getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:]",  970LL,  v10);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();

    id v9 = 0LL;
  }

  v4[2](v4, v9, v8);
}

- (void)getSystemContentStoreWithCompletionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, uint64_t, void *, void))a3;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _xpcConnection];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  int MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    id v15 = 0LL;
    int v8 = _LSDatabaseCreateSystemContentDatabaseFromPersistentStore(&v15);
    id v9 = v15;
    if (v8)
    {
      uint64_t v10 = v8[1];
      _LSDatabaseGetNode((uint64_t)v8);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10, v11, 0LL);
    }

    else
    {
      _LSDefaultLog();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = [v13 processIdentifier];
        *(_DWORD *)buf = 67109378;
        int v19 = v14;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_error_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_ERROR,  "could not fetch system content store for %d: %@",  buf,  0x12u);
      }

      ((void (**)(id, uint64_t, void *, id))v4)[2](v4, 0LL, 0LL, v9);
    }
  }

  else
  {
    uint64_t v16 = *MEMORY[0x189607490];
    int v17 = @"process may not map database";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSDReadClient getSystemContentStoreWithCompletionHandler:]",  996LL,  v9);
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *, void *))v4)[2](v4, 0LL, 0LL, v8);
  }
}

- (void)getRedactedAppexRecordForSystemAppexWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  int v14 = (void (**)(id, id, id))a7;
  id v33 = 0LL;
  __int128 v30 = 0LL;
  id v31 = 0LL;
  char v32 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v15, 0LL);

  if (v16)
  {
    id v29 = 0LL;
    LOBYTE(v28) = 0;
    id v17 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:]( objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord),  "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:",  v11,  v12,  v13,  v8,  v16,  1LL,  v28,  &v29);
    id v18 = v29;
    if ([v17 eligibleForRedaction])
    {
      id v19 = v17;
      [v19 extensionPointRecord];
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 _resolveAllProperties];

      [v19 containingBundleRecord];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 _resolveAllProperties];

      [v19 containingBundleRecord];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 redact];

      [v19 containingBundleRecord];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 detach];

      [v19 _resolveAllProperties];
      [v19 redact];
      [v19 detach];
    }

    else
    {
      uint64_t v25 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[_LSDReadClient getRedactedAppexRecordForSystemAppexWithUUID:node:bundleIdentifier:platform:completionHandler:]",  1027LL,  0LL);

      id v19 = 0LL;
      id v18 = (id)v25;
    }
  }

  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    id v19 = (id)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v24, 0LL);

    if (v19)
    {
      id v18 = 0LL;
      id v19 = 0LL;
    }

    else
    {
      id v18 = v33;
    }
  }

  v14[2](v14, v19, v18);
  if (v30 && v32) {
    _LSContextDestroy(v30);
  }
  id v26 = v31;
  __int128 v30 = 0LL;
  id v31 = 0LL;

  char v32 = 0;
  id v27 = v33;
  id v33 = 0LL;
}

- (void)getPreferredAppMarketplacesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[_LSDReadClient getPreferredAppMarketplacesWithCompletion:]",  1075LL,  0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0LL, v3);
}

@end