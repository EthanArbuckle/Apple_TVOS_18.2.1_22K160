@interface LSPlugInQueryWithQueryDictionary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPlugin:(unsigned int)a3 pluginData:(const LSPluginData *)a4 withDatabase:(id)a5;
- (LSPlugInQueryWithQueryDictionary)initWithCoder:(id)a3;
- (id)_initWithQueryDictionary:(id)a3 applyFilter:(id)a4;
- (id)_queryDictionary;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryWithQueryDictionary

- (id)_initWithQueryDictionary:(id)a3 applyFilter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithQueryDictionary;
  v8 = -[LSPlugInQuery _init](&v22, sel__init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[2];
    v8[2] = v9;

    objc_msgSend(v6, "ls_parseQueryForIdentifiers:", @"NSExtensionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 copy];
    v13 = (void *)v8[3];
    v8[3] = v12;

    objc_msgSend(v6, "ls_parseQueryForIdentifiers:", @"NSExtensionPointName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 copy];
    v16 = (void *)v8[4];
    v8[4] = v15;

    uint64_t v17 = [v7 copy];
    v18 = (void *)v8[5];
    v8[5] = v17;

    [v6 objectForKey:@"LSShouldORIdentifiers"];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)v8[2];
      v8[2] = 0LL;
    }
  }

  return v8;
}

- (id)_queryDictionary
{
  return self->_queryDict;
}

- (BOOL)matchesPlugin:(unsigned int)a3 pluginData:(const LSPluginData *)a4 withDatabase:(id)a5
{
  id v8 = a5;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x2020000000LL;
  char v56 = 0;
  uint64_t active_platform = dyld_get_active_platform();
  if (_LSPluginIsValid(v8, a3, (uint64_t)a4, self->_filterBlock, 0, 0LL))
  {
    uint64_t v49 = 0LL;
    v50 = &v49;
    uint64_t v51 = 0x2020000000LL;
    char v52 = 0;
    else {
      unsigned int v10 = 0;
    }
    queryDict = self->_queryDict;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = -[NSDictionary objectForKey:](queryDict, "objectForKey:", @"LS:IncludeUnsupportedCodeSignatures");
    v14 = (void *)v13;
    if (v12 && v13 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v14 = 0LL;
    }

    int v15 = [v14 BOOLValue];

    if (a4->var0.signatureVersion >= v10) {
      int v16 = 1;
    }
    else {
      int v16 = v15;
    }
    uint64_t v17 = MEMORY[0x1895F87A8];
    v48[0] = MEMORY[0x1895F87A8];
    v48[1] = 3221225472LL;
    v48[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke;
    v48[3] = &unk_189D744F0;
    v48[4] = &v49;
    _LSEnumerateSliceMask(a4->var0._sliceMask, v48);
    v46[0] = 0LL;
    v46[1] = v46;
    v46[2] = 0x3032000000LL;
    v46[3] = __Block_byref_object_copy__31;
    v46[4] = __Block_byref_object_dispose__31;
    id v47 = 0LL;
    v42[0] = v17;
    v42[1] = 3221225472LL;
    v42[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_44;
    v42[3] = &unk_189D77D18;
    v44 = v46;
    id v18 = v8;
    id v43 = v18;
    v45 = a4;
    v19 = (void *)MEMORY[0x186E2A7B8](v42);
    v20 = self->_queryDict;
    if (!v20
      && (*((_BYTE *)v50 + 24) ? (int v21 = v16) : (int v21 = 0), v21 == 1 && a4->var0.platform == (_DWORD)active_platform))
    {
      *((_BYTE *)v54 + 24) = 1;
    }

    else if ((v16 & 1) != 0)
    {
      v35 = -[NSDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", @"LS:ExtensionPlatforms");
      uint64_t v22 = [v35 count];
      v23 = (void *)MEMORY[0x189604010];
      if (v22)
      {
        [MEMORY[0x189604010] setWithArray:v35];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:active_platform];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 setWithObject:v25];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v26 = self->_queryDict;
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = -[NSDictionary objectForKey:](v26, "objectForKey:", @"LS:IncludeRestricted");
      v29 = (void *)v28;
      if (v27 && v28 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        v29 = 0LL;
      }

      [v29 BOOLValue];

      [MEMORY[0x189607968] numberWithUnsignedInt:a4->var0.platform];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      int v31 = [v24 containsObject:v30];

      if (v31)
      {
        v32 = self->_queryDict;
        v36[0] = v17;
        v36[1] = 3221225472LL;
        v36[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_2;
        v36[3] = &unk_189D77D68;
        v39 = &v53;
        v41 = a4;
        id v37 = v18;
        id v38 = v19;
        v40 = v46;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v32, "enumerateKeysAndObjectsUsingBlock:", v36);
      }
    }

    else
    {
      *((_BYTE *)v54 + 24) = 0;
    }

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(&v49, 8);
  }

  char v33 = *((_BYTE *)v54 + 24);
  _Block_object_dispose(&v53, 8);

  return v33;
}

BOOL __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  BOOL result = _LSIsCPUTypeSubtypeRunnable(a2, SHIDWORD(a2));
  if (result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_44( uint64_t a1,  uint64_t a2,  _LSPlistHint *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    _LSPlistGetDictionary(*(_LSDatabase **)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 48) + 128LL), a3);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_LSDatabase **)(a1 + 32);
    unsigned int SDKDictionaryDataUnit = _LSPluginGetSDKDictionaryDataUnit(v4, 0, *(void *)(a1 + 48));
    _LSPlistGetDictionary(v4, SDKDictionaryDataUnit, v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ls_resolvePlugInKitInfoPlistWithDictionary:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v10 = a2;
  id v7 = a3;
  if (([v10 hasPrefix:@"ENTITLEMENT:"] & 1) != 0
    || ([v10 hasPrefix:@"NSUserElection"] & 1) != 0
    || _NSIsNSString() && ([v7 hasPrefix:@"?CODEREQUIREMENT"] & 1) != 0
    || (_NSIsNSDictionary() & 1) != 0
    || ([v10 isEqualToString:@"LS:ExtensionPlatforms"] & 1) != 0
    || ([v10 isEqualToString:@"LS:IncludeUnsupportedArchitectures"] & 1) != 0
    || [v10 isEqualToString:@"LS:IncludeRestricted"])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    goto LABEL_10;
  }

  getValueForKeyFromPlugin((NSString *)v10, *(const LSPluginData **)(a1 + 64), *(_LSDatabase **)(a1 + 32));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    getValueForKeyFromPlist((NSString *)v10, *(NSDictionary **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ([v7 isEqual:MEMORY[0x189604A80]])
  {
    if (v8) {
      char v9 = [v8 isEqual:MEMORY[0x189604A80]];
    }
    else {
      char v9 = 1;
    }
    goto LABEL_24;
  }

  if (!v8)
  {
LABEL_27:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    goto LABEL_28;
  }

  if (![v7 isEqual:MEMORY[0x189604A88]])
  {
    if (_NSIsNSString())
    {
      char v9 = objc_msgSend(v8, "ls_matchesForPluginQuery:", v7);
LABEL_24:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v9;
      goto LABEL_28;
    }

    if (_NSIsNSArray())
    {
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_3;
      v11[3] = &unk_189D77D40;
      uint64_t v13 = *(void *)(a1 + 48);
      id v12 = v7;
      [v8 enumerateObjectsUsingBlock:v11];

      goto LABEL_28;
    }

    goto LABEL_27;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 isEqual:MEMORY[0x189604A80]] ^ 1;
LABEL_28:

LABEL_10:
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    *a4 = 1;
  }
}

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v6 = a2;
  if (_NSIsNSString()) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend( v6,  "ls_matchesForPluginQuery:",  *(void *)(a1 + 32));
  }
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    *a4 = 1;
  }
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (v6)
  {
    _LSDefaultLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LSPlugInQueryWithQueryDictionary _enumerateWithXPCConnection:block:].cold.1( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
    }
  }

  id v42 = 0LL;
  id v43 = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)&v43, (uint64_t)&v42);
  id v17 = v42;
  if (inited)
  {
    [MEMORY[0x189603FE0] set];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_extensionIdentifiers, "count")
      || -[NSArray count](self->_extensionPointIdentifiers, "count"))
    {
      v38[0] = MEMORY[0x1895F87A8];
      v38[1] = 3321888768LL;
      v38[2] = __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke;
      v38[3] = &unk_189D77D90;
      id v39 = v18;
      v40 = self;
      id v41 = v43;
      v19 = (void *)MEMORY[0x186E2A7B8](v38);
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v35 = 0u;
      __int128 v34 = 0u;
      v20 = self->_extensionIdentifiers;
      uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v34,  v45,  16LL);
      if (v21)
      {
        uint64_t v22 = *(void *)v35;
        do
        {
          for (uint64_t i = 0LL; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v20);
            }
            _LSDatabaseGetStringForCFString(v43, *(const __CFString **)(*((void *)&v34 + 1) + 8 * i), 0);
            _LSDatabaseEnumeratingBindingMap();
          }

          uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v34,  v45,  16LL);
        }

        while (v21);
      }

      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      v24 = self->_extensionPointIdentifiers;
      uint64_t v25 = -[NSArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v30,  v44,  16LL);
      if (v25)
      {
        uint64_t v26 = *(void *)v31;
        do
        {
          for (uint64_t j = 0LL; j != v25; ++j)
          {
            if (*(void *)v31 != v26) {
              objc_enumerationMutation(v24);
            }
            _LSDatabaseGetStringForCFString(v43, *(const __CFString **)(*((void *)&v30 + 1) + 8 * j), 0);
            _LSDatabaseEnumeratingBindingMap();
          }

          uint64_t v25 = -[NSArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v30,  v44,  16LL);
        }

        while (v25);
      }
    }

    else
    {
      v29 = v43;
      id v28 = v18;
      _CSStoreEnumerateUnits();
    }

    -[LSPlugInQuery sort:pluginIDs:andYield:context:](self, "sort:pluginIDs:andYield:context:", 1LL, v18, v7, &v43);
    _LSContextDestroy(&v43);
  }

  else
  {
    v7[2](v7, 0LL, v17);
  }
}

void __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:");

  if ((v5 & 1) == 0)
  {
    if (objc_msgSend( *(id *)(a1 + 40),  "matchesPlugin:pluginData:withDatabase:",  a3,  _LSGetPlugin(*(void *)(a1 + 48), a3),  *(void *)(a1 + 48)))
    {
      id v6 = *(void **)(a1 + 32);
      [MEMORY[0x189607968] numberWithUnsignedInt:a3];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:");
    }
  }

void __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke_59( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a3)
  {
    if ([*(id *)(a1 + 32) matchesPlugin:a2 pluginData:a3 withDatabase:*(void *)(a1 + 48)])
    {
      v5 = *(void **)(a1 + 40);
      [MEMORY[0x189607968] numberWithUnsignedInt:a2];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:");
    }
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithQueryDictionary;
  if (!-[LSPlugInQuery isEqual:](&v12, sel_isEqual_, v4) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v10 = 0;
    goto LABEL_9;
  }

  id v5 = v4;
  id v6 = v5;
  queryDict = self->_queryDict;
  if (!queryDict)
  {
    [v5 _queryDictionary];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      char v10 = 1;
      goto LABEL_7;
    }

    queryDict = self->_queryDict;
  }

  [v6 _queryDictionary];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = -[NSDictionary isEqual:](queryDict, "isEqual:", v9);

LABEL_7:
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NSDictionary ls_hashQuery](self->_queryDict, "ls_hashQuery");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithQueryDictionary;
  return -[LSPlugInQuery hash](&v5, sel_hash) ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LSPlugInQueryWithQueryDictionary)initWithCoder:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v5 = -[LSPlugInQueryWithQueryDictionary _initWithQueryDictionary:applyFilter:]( self,  "_initWithQueryDictionary:applyFilter:",  v4,  0LL);

  return v5;
}

- (void).cxx_destruct
{
}

- (void)_enumerateWithXPCConnection:(uint64_t)a3 block:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end