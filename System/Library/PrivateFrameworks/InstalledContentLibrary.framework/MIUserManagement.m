@interface MIUserManagement
+ (id)sharedInstance;
- (BOOL)_onQueue_refreshPersonaInformationWithError:(id *)a3;
- (BOOL)isKnownPersonaUniqueString:(id)a3 error:(id *)a4;
- (BOOL)setBundleIdentifiers:(id)a3 forPersonaUniqueString:(id)a4 error:(id *)a5;
- (MIUserManagement)init;
- (NSDictionary)personaAttributesMap;
- (NSString)enterprisePersonaUniqueString;
- (NSString)primaryPersonaUniqueString;
- (NSString)systemPersonaUniqueString;
- (OS_dispatch_queue)internalQueue;
- (id)bundleIDsAssociatedWithPersonaUniqueString:(id)a3 error:(id *)a4;
- (id)multiPersonaSADAppBundleIDsWithError:(id *)a3;
- (id)personaForBundleID:(id)a3 error:(id *)a4;
- (unint64_t)personaGenerationIdentifier;
- (unint64_t)personaTypeForPersonaUniqueString:(id)a3;
- (void)setEnterprisePersonaUniqueString:(id)a3;
- (void)setPersonaAttributesMap:(id)a3;
- (void)setPersonaGenerationIdentifier:(unint64_t)a3;
- (void)setPrimaryPersonaUniqueString:(id)a3;
- (void)setSystemPersonaUniqueString:(id)a3;
@end

@implementation MIUserManagement

- (MIUserManagement)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MIUserManagement;
  v2 = -[MIUserManagement init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.installd.umAccessQueue", 0LL);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__MIUserManagement_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  return (id)sharedInstance_defaultInstance;
}

void __34__MIUserManagement_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_defaultInstance;
  sharedInstance_defaultInstance = (uint64_t)v0;
}

- (BOOL)_onQueue_refreshPersonaInformationWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  -[MIUserManagement internalQueue](self, "internalQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v41 = (void *)objc_opt_new();
  [getUMUserManagerClass() sharedManager];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v47 = 0LL;
  uint64_t v7 = [v6 personaGenerationIdentifierWithError:&v47];
  id v8 = v47;

  if (!v7)
  {
    _CreateAndLogError( (uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]",  67LL,  @"MIInstallerErrorDomain",  4LL,  v8,  0LL,  @"Failed to read UM's persona generation identifier when resolving persona",  v9,  v34);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }

  uint64_t v10 = -[MIUserManagement personaAttributesMap](self, "personaAttributesMap");
  if (v10)
  {
    v11 = (void *)v10;
    unint64_t v12 = -[MIUserManagement personaGenerationIdentifier](self, "personaGenerationIdentifier");

    if (v7 == v12)
    {
      BOOL v13 = 1;
      id v14 = v8;
      goto LABEL_29;
    }
  }

  [getUMUserManagerClass() sharedManager];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v46 = v8;
  [v15 listAllPersonaAttributesWithError:&v46];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v46;

  if (!v16)
  {
    _CreateAndLogError( (uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]",  79LL,  @"MIInstallerErrorDomain",  4LL,  v17,  0LL,  @"Failed to read persona attributes from UM",  v18,  v34);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v17;
LABEL_26:

    if (a3)
    {
      id v14 = v14;
      BOOL v13 = 0;
      *a3 = v14;
    }

    else
    {
      BOOL v13 = 0;
    }

    goto LABEL_29;
  }

  id v35 = v17;
  unint64_t v36 = v7;
  v37 = self;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v19 = v16;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    p_enterprisePersonaUniqueString = (id *)&self->_enterprisePersonaUniqueString;
    location = (id *)&self->_systemPersonaUniqueString;
    uint64_t v22 = *(void *)v43;
    p_primaryPersonaUniqueString = (id *)&self->_primaryPersonaUniqueString;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v24 userPersonaUniqueString];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          [v24 userPersonaBundleIDList];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26) {
            v26 = (void *)objc_opt_new();
          }
          v27 = objc_alloc(&OBJC_CLASS___MIPersonaAttributes);
          uint64_t v28 = [v24 userPersonaType];
          [MEMORY[0x189604010] setWithArray:v26];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[MIPersonaAttributes initWithPersonaString:personaType:associatedBundleIDs:]( v27,  "initWithPersonaString:personaType:associatedBundleIDs:",  v25,  v28,  v29);
          [v41 setObject:v30 forKeyedSubscript:v25];
        }
      }

      uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }

    while (v21);
  }

  uint64_t v31 = [v41 copy];
  personaAttributesMap = v37->_personaAttributesMap;
  v37->_personaAttributesMap = (NSDictionary *)v31;

  v37->_personaGenerationIdentifier = v36;
  BOOL v13 = 1;
  id v14 = v35;
LABEL_29:

  return v13;
}

- (NSString)primaryPersonaUniqueString
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__MIUserManagement_primaryPersonaUniqueString__block_invoke;
  block[3] = &unk_189D48658;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_primaryPersonaUniqueString;
}

void __46__MIUserManagement_primaryPersonaUniqueString__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = 0LL;
  char v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  id v3 = v4;
}

- (NSString)enterprisePersonaUniqueString
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__MIUserManagement_enterprisePersonaUniqueString__block_invoke;
  block[3] = &unk_189D48658;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_enterprisePersonaUniqueString;
}

void __49__MIUserManagement_enterprisePersonaUniqueString__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = 0LL;
  char v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  id v3 = v4;
}

- (NSString)systemPersonaUniqueString
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__MIUserManagement_systemPersonaUniqueString__block_invoke;
  block[3] = &unk_189D48658;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_systemPersonaUniqueString;
}

void __45__MIUserManagement_systemPersonaUniqueString__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = 0LL;
  char v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  id v3 = v4;
}

- (BOOL)isKnownPersonaUniqueString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0LL;
  if (([v6 isEqualToString:@"Invalid"] & 1) != 0
    || ([v6 isEqualToString:@"PersonalPersonaPlaceholderString"] & 1) != 0)
  {
    BOOL v7 = 1;
  }

  else
  {
    -[MIUserManagement internalQueue](self, "internalQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __53__MIUserManagement_isKnownPersonaUniqueString_error___block_invoke;
    v11[3] = &unk_189D48680;
    v11[4] = self;
    BOOL v13 = &v15;
    id v12 = v6;
    id v14 = &v21;
    dispatch_sync(v8, v11);

    int v9 = *((unsigned __int8 *)v22 + 24);
    if (a4 && !*((_BYTE *)v22 + 24))
    {
      *a4 = (id) v16[5];
      int v9 = *((unsigned __int8 *)v22 + 24);
    }

    BOOL v7 = v9 != 0;
  }

  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v7;
}

void __53__MIUserManagement_isKnownPersonaUniqueString_error___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v3 + 40);
  int v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    [*(id *)(a1 + 32) personaAttributesMap];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

    else
    {
      uint64_t v8 = _CreateAndLogError( (uint64_t)"-[MIUserManagement isKnownPersonaUniqueString:error:]_block_invoke",  173LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Client provided persona %@ is not among available personas on the system",  v7,  *(void *)(a1 + 40));
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }

- (id)multiPersonaSADAppBundleIDsWithError:(id *)a3
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0LL;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  BOOL v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0LL;
  -[MIUserManagement internalQueue](self, "internalQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__MIUserManagement_multiPersonaSADAppBundleIDsWithError___block_invoke;
  block[3] = &unk_189D486A8;
  block[4] = self;
  void block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  id v6 = (void *)v17[5];
  if (a3 && !v6)
  {
    *a3 = (id) v11[5];
    id v6 = (void *)v17[5];
  }

  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __57__MIUserManagement_multiPersonaSADAppBundleIDsWithError___block_invoke(void *a1)
{
  char v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v3 + 40);
  int v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (void *)a1[4];
    id v6 = (void *)v5[3];
    if (v6)
    {
      id v7 = v6;
      [v5 personaAttributesMap];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      [v8 objectForKeyedSubscript:v7];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 bundleIDs];
      uint64_t v11 = *(void *)(a1[6] + 8LL);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }

    else
    {
      id v8 = 0LL;
      uint64_t v13 = objc_opt_new();
      uint64_t v14 = *(void *)(a1[6] + 8LL);
      uint64_t v9 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

- (id)personaForBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = __Block_byref_object_copy_;
  id v35 = __Block_byref_object_dispose_;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    id v15 = v6;
    MOLogWrite();
  }

  -[MIUserManagement internalQueue](self, "internalQueue", v15);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__MIUserManagement_personaForBundleID_error___block_invoke;
  block[3] = &unk_189D486F8;
  uint64_t v18 = &v21;
  block[4] = self;
  id v19 = &v25;
  id v8 = v6;
  id v17 = v8;
  id v20 = &v31;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v22 + 24))
  {
    if (v32[5]) {
      goto LABEL_11;
    }
    +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 primaryPersonaString];
    uint64_t v11 = (void *)v32[5];
    v32[5] = v10;

    BOOL v12 = *((_BYTE *)v22 + 24) == 0;
    if (!a4) {
      goto LABEL_11;
    }
  }

  else
  {
    BOOL v12 = 1;
    if (!a4) {
      goto LABEL_11;
    }
  }

  if (v12) {
    *a4 = (id) v26[5];
  }
LABEL_11:
  id v13 = (id)v32[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v13;
}

void __45__MIUserManagement_personaForBundleID_error___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v11 = *(id *)(v3 + 40);
  char v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &v11);
  objc_storeStrong((id *)(v3 + 40), v11);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 32) personaAttributesMap];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __45__MIUserManagement_personaForBundleID_error___block_invoke_2;
    v8[3] = &unk_189D486D0;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    id v9 = v6;
    uint64_t v10 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }

void __45__MIUserManagement_personaForBundleID_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v10 = a2;
  id v8 = a3;
  if (([v8 personaType] & 0xFFFFFFFFFFFFFFFBLL) == 2)
  {
    [v8 bundleIDs];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 containsObject:*(void *)(a1 + 32)])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
      *a4 = 1;
    }
  }
}

- (unint64_t)personaTypeForPersonaUniqueString:(id)a3
{
  id v4 = a3;
  v5 = -[MIUserManagement personaAttributesMap](self, "personaAttributesMap");
  [v5 objectForKeyedSubscript:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MIUserManagement personaAttributesMap](self, "personaAttributesMap");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v4];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = [v8 personaType];
  }

  else
  {
    unint64_t v9 = 1000LL;
  }

  return v9;
}

- (BOOL)setBundleIdentifiers:(id)a3 forPersonaUniqueString:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  [getUMUserManagerClass() sharedManager];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  char v10 = [v9 setBundleIdentifiers:v7 forPersonaWithPersonaUniqueString:v8 withError:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0)
  {
    _CreateAndLogError( (uint64_t)"-[MIUserManagement setBundleIdentifiers:forPersonaUniqueString:error:]",  268LL,  @"MIInstallerErrorDomain",  4LL,  v11,  0LL,  @"Failed to associate apps with persona %@ : %@",  v12,  (uint64_t)v7);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v11 = v13;
      *a5 = v11;
    }

    else
    {
      id v11 = v13;
    }
  }

  return v10;
}

- (id)bundleIDsAssociatedWithPersonaUniqueString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0LL;
  -[MIUserManagement internalQueue](self, "internalQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __69__MIUserManagement_bundleIDsAssociatedWithPersonaUniqueString_error___block_invoke;
  v12[3] = &unk_189D48680;
  v12[4] = self;
  uint64_t v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  unint64_t v9 = (void *)v17[5];
  if (a4 && !v9)
  {
    *a4 = (id) v23[5];
    unint64_t v9 = (void *)v17[5];
  }

  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __69__MIUserManagement_bundleIDsAssociatedWithPersonaUniqueString_error___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v3 + 40);
  int v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    [*(id *)(a1 + 32) personaAttributesMap];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      [v6 bundleIDs];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 copy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }

    else
    {
      uint64_t v12 = _CreateAndLogError( (uint64_t)"-[MIUserManagement bundleIDsAssociatedWithPersonaUniqueString:error:]_block_invoke",  294LL,  @"MIInstallerErrorDomain",  4LL,  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  0LL,  @"Failed to find persona %@ when checking associated bundleIDs for it",  v7,  *(void *)(a1 + 40));
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v8 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }

- (void)setPrimaryPersonaUniqueString:(id)a3
{
}

- (void)setEnterprisePersonaUniqueString:(id)a3
{
}

- (void)setSystemPersonaUniqueString:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (unint64_t)personaGenerationIdentifier
{
  return self->_personaGenerationIdentifier;
}

- (void)setPersonaGenerationIdentifier:(unint64_t)a3
{
  self->_personaGenerationIdentifier = a3;
}

- (NSDictionary)personaAttributesMap
{
  return self->_personaAttributesMap;
}

- (void)setPersonaAttributesMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end