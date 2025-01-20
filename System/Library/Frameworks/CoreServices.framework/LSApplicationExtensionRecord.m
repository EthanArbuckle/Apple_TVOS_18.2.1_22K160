@interface LSApplicationExtensionRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
+ (id)appexRecordsForUnitIDsWithContext:(LSContext *)a3 unitIDs:(const void *)a4;
+ (id)applicationExtensionRecordsForUUIDs:(id)a3 outContainingBundleRecords:(id *)a4 error:(id *)a5;
+ (id)enumeratorWithExtensionPointRecord:(id)a3 options:(unint64_t)a4;
+ (id)enumeratorWithOptions:(unint64_t)a3;
+ (id)redactedAppexRecordWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 error:(id *)a7;
- (BOOL)_containerized;
- (BOOL)_usesSystemPersona;
- (BOOL)appProtectionHidden;
- (BOOL)appProtectionLocked;
- (BOOL)optsOutOfAppProtectionShield;
- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 error:(id *)a4;
- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 error:(id *)a5;
- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 platform:(unsigned int)a5 error:(id *)a6;
- (LSApplicationExtensionRecord)initWithURL:(id)a3 error:(id *)a4;
- (LSApplicationExtensionRecord)initWithURL:(id)a3 requireValid:(BOOL)a4 error:(id *)a5;
- (LSApplicationExtensionRecord)initWithUUID:(id)a3 error:(id *)a4;
- (LSApplicationExtensionRecord)initWithUUID:(id)a3 requireValid:(BOOL)a4 error:(id *)a5;
- (LSBundleRecord)_containingBundleRecord;
- (LSBundleRecord)containingBundleRecord;
- (LSExtensionPointRecord)extensionPointRecord;
- (NSDictionary)iconDictionary;
- (NSString)appProtectionEffectiveContainer;
- (NSString)effectiveBundleIdentifier;
- (NSUUID)uniqueIdentifier;
- (char)developerType;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_containingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 error:(id *)a6;
- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 extensionPointRecord:(id)a6 error:(id *)a7;
- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 context:(LSContext *)a6 requireValid:(BOOL)a7 error:(id *)a8;
- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 context:(LSContext *)CurrentContext requireValid:(BOOL)a8 allowRedacted:(BOOL)a9 error:(id *)a10;
- (id)_intentsArrayForKey:(id)a3;
- (id)_personasWithAttributes;
- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5;
- (id)associatedPersonas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectiveBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)extensionPointRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)intentsRestrictedWhileLocked;
- (id)intentsRestrictedWhileProtectedDataUnavailable;
- (id)managedPersonas;
- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4;
- (id)supportedIntentMediaCategories;
- (id)supportedIntents;
- (id)uniqueIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (unint64_t)_containerClass;
- (unint64_t)compatibilityState;
- (unsigned)pluginFlags;
- (unsigned)pluginFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (void)_LSRecord_resolve__containingBundleRecord;
- (void)_LSRecord_resolve_effectiveBundleIdentifier;
- (void)_LSRecord_resolve_extensionPointRecord;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_uniqueIdentifier;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation LSApplicationExtensionRecord

- (LSApplicationExtensionRecord)initWithUUID:(id)a3 error:(id *)a4
{
  return -[LSApplicationExtensionRecord initWithUUID:requireValid:error:]( self,  "initWithUUID:requireValid:error:",  a3,  0LL,  a4);
}

- (LSApplicationExtensionRecord)initWithUUID:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  return (LSApplicationExtensionRecord *)-[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:context:requireValid:error:]( self,  "_initWithUUID:node:bundleIdentifier:context:requireValid:error:",  a3,  0LL,  0LL,  0LL,  a4,  a5);
}

- (LSApplicationExtensionRecord)initWithURL:(id)a3 error:(id *)a4
{
  return -[LSApplicationExtensionRecord initWithURL:requireValid:error:]( self,  "initWithURL:requireValid:error:",  a3,  0LL,  a4);
}

- (LSApplicationExtensionRecord)initWithURL:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v8 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", a3, 32LL, 0LL);
  v9 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:context:requireValid:error:]( self,  "_initWithUUID:node:bundleIdentifier:context:requireValid:error:",  0LL,  v8,  0LL,  0LL,  v6,  a5);

  return v9;
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[LSApplicationExtensionRecord initWithBundleIdentifier:requireValid:platform:error:]( self,  "initWithBundleIdentifier:requireValid:platform:error:",  a3,  0LL,  0LL,  a4);
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  return -[LSApplicationExtensionRecord initWithBundleIdentifier:requireValid:platform:error:]( self,  "initWithBundleIdentifier:requireValid:platform:error:",  a3,  a4,  0LL,  a5);
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 platform:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  LOBYTE(v12) = _LSCurrentProcessMayMapDatabase() == 0;
  return (LSApplicationExtensionRecord *)-[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:]( self,  "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:",  0LL,  0LL,  a3,  v7,  0LL,  v8,  v12,  a6);
}

- (id)effectiveBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  BOOL v6 = (void *)_CSStringCopyCFString();
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)_CSStringCopyCFString();
  }
  v9 = v8;

  return v9;
}

- (NSString)effectiveBundleIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_effectiveBundleIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_effectiveBundleIdentifier
{
  id v2 = -[LSApplicationExtensionRecord effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
}

- (id)uniqueIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  BOOL v6 = (void *)_CSStringCopyCFString();
  if (v6) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v6];
  }
  else {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_uniqueIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_uniqueIdentifier
{
  id v2 = -[LSApplicationExtensionRecord uniqueIdentifier](self, "uniqueIdentifier");
}

- (LSBundleRecord)containingBundleRecord
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);
  if (!WeakRetained)
  {
    WeakRetained = -[LSApplicationExtensionRecord _containingBundleRecord](self, "_containingBundleRecord");
  }

  return (LSBundleRecord *)WeakRetained;
}

- (id)extensionPointRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  unsigned int v12 = 0;
  uint64_t v11 = 0LL;
  int v7 = _LSExtensionPointFindWithStringID(a3->db, a6->var4, a6->var0.platform, 0LL, &v12, &v11);
  id v8 = 0LL;
  if (!v7)
  {
    v9 = objc_alloc(&OBJC_CLASS___LSExtensionPointRecord);
    id v8 = -[LSRecord _initWithContext:tableID:unitID:]( v9,  "_initWithContext:tableID:unitID:",  a3,  a3->db->schema.extensionPointTable,  v12);
  }

  return v8;
}

- (LSExtensionPointRecord)extensionPointRecord
{
  return (LSExtensionPointRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_extensionPointRecordWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_extensionPointRecord
{
  id v2 = -[LSApplicationExtensionRecord extensionPointRecord](self, "extensionPointRecord");
}

- (BOOL)appProtectionHidden
{
  return 0;
}

- (BOOL)appProtectionLocked
{
  return 0;
}

- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 context:(LSContext *)a6 requireValid:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  LOBYTE(v16) = _LSCurrentProcessMayMapDatabase() == 0;
  return -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:]( self,  "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:",  a3,  a4,  a5,  0LL,  a6,  v9,  v16,  a8);
}

- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 context:(LSContext *)CurrentContext requireValid:(BOOL)a8 allowRedacted:(BOOL)a9 error:(id *)a10
{
  BOOL v10 = a8;
  uint64_t v12 = *(void *)&a6;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!(_DWORD)MayMapDatabase && a9)
  {
    uint64_t v18 = +[LSApplicationExtensionRecord redactedAppexRecordWithUUID:node:bundleIdentifier:platform:error:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "redactedAppexRecordWithUUID:node:bundleIdentifier:platform:error:",  a3,  a4,  a5,  v12,  a10);

    id v19 = (id)v18;
    if (!a3) {
      return v19;
    }
    goto LABEL_20;
  }

  if (!CurrentContext) {
    CurrentContext = (LSContext *)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  }
  v29 = CurrentContext;
  id v30 = 0LL;
  char v31 = 0;
  id v32 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v20, 0LL);

  if (!v21)
  {
    if (a10)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v22 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v22, 0LL);

      if (v23) {
        id v24 = 0LL;
      }
      else {
        id v24 = v32;
      }
      *a10 = v24;
    }

    goto LABEL_15;
  }

  int v28 = 0;
  findPluginDataInContext(v21, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v10, v12, (uint64_t)&v28, a10);
  if (!v28)
  {
LABEL_15:

    id v19 = 0LL;
    goto LABEL_16;
  }

  id v19 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( self,  "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:",  a4,  a5,  v21,  *(unsigned int *)(*(void *)v21 + 1604LL),  a10);
LABEL_16:
  if (v29 && v31) {
    _LSContextDestroy((void **)&v29->db);
  }
  id v25 = v30;
  v29 = 0LL;
  id v30 = 0LL;

  char v31 = 0;
  id v26 = v32;
  id v32 = 0LL;

  if (a3)
  {
LABEL_20:
    if (v19) {
      [v19 _setResolvedPropertyValue:a3 forGetter:sel_uniqueIdentifier];
    }
  }

  return v19;
}

- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 extensionPointRecord:(id)a6 error:(id *)a7
{
  id v8 =  -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]( self,  "_initWithContext:pluginID:pluginData:error:",  a3,  *(void *)&a4,  a5,  a7);
  [v8 _setResolvedPropertyValue:a6 forGetter:sel_extensionPointRecord];

  return v8;
}

- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 error:(id *)a6
{
  uint64_t v7 = (uint64_t)a5;
  uint64_t v8 = *(void *)&a4;
  v14[1] = *MEMORY[0x1895F89C0];
  if (a5 || (uint64_t v7 = _LSGetPlugin((uint64_t)a3->db, a4)) != 0)
  {
    if (self) {
      return -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( self,  "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:",  0LL,  0LL,  a3,  a3->db->schema.pluginTable,  v8,  v7,  a6);
    }
  }

  else
  {
    if (a6)
    {
      uint64_t v13 = *MEMORY[0x189607490];
      v14[0] = @"Unable to find this application extension record in the Launch Services database.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]",  243LL,  v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return 0LL;
}

+ (id)applicationExtensionRecordsForUUIDs:(id)a3 outContainingBundleRecords:(id *)a4 error:(id *)a5
{
  uint64_t v110 = *MEMORY[0x1895F89C0];
  id v100 = 0LL;
  v97 = 0LL;
  id v98 = 0LL;
  char v99 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v97, v6, 0LL);

  if (v7)
  {
    v94 = 0LL;
    v95 = 0LL;
    v96 = 0LL;
    context = (void *)MEMORY[0x186E2A59C]();
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    id v8 = a3;
    id v9 = 0LL;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v90 objects:v109 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v91;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v91 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          *(_DWORD *)buf = 0;
          id v89 = v9;
          uint64_t PluginDataInContext = findPluginDataInContext((uint64_t)v7, (uint64_t)v13, 0LL, 0LL, 0, 0, (uint64_t)buf, &v89);
          id v15 = v89;

          id v9 = v15;
          int v16 = *(_DWORD *)buf;
          if (PluginDataInContext) {
            BOOL v17 = *(_DWORD *)buf == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            id v18 = v13;
            id v19 = v18;
            v20 = v95;
            if (v95 >= v96)
            {
              uint64_t v22 = (v95 - v94) >> 4;
              unint64_t v23 = v22 + 1;
              uint64_t v24 = v96 - v94;
              if ((v96 - v94) >> 3 > v23) {
                unint64_t v23 = v24 >> 3;
              }
              else {
                unint64_t v25 = v23;
              }
              v103 = &v96;
              id v26 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>( (uint64_t)&v96,  v25);
              int v28 = &v26[16 * v22];
              *(_DWORD *)int v28 = v16;
              *((void *)v28 + 1) = v19;
              id v30 = v94;
              v29 = v95;
              if (v95 == v94)
              {
                id v32 = &v26[16 * v22];
              }

              else
              {
                char v31 = v95;
                id v32 = &v26[16 * v22];
                do
                {
                  int v33 = *((_DWORD *)v31 - 4);
                  v31 -= 16;
                  *((_DWORD *)v32 - 4) = v33;
                  v32 -= 16;
                  uint64_t v34 = *((void *)v31 + 1);
                  *((void *)v31 + 1) = 0LL;
                  *((void *)v32 + 1) = v34;
                }

                while (v31 != v30);
              }

              uint64_t v21 = v28 + 16;
              v94 = v32;
              v95 = v28 + 16;
              v35 = v96;
              v96 = &v26[16 * v27];
              *(void *)&__int128 v102 = v29;
              *((void *)&v102 + 1) = v35;
              *(void *)&__int128 v101 = v30;
              *((void *)&v101 + 1) = v30;
              std::__split_buffer<std::pair<unsigned int,NSUUID * {__strong}>>::~__split_buffer((uint64_t)&v101);
            }

            else
            {
              *(_DWORD *)v95 = v16;
              *((void *)v20 + 1) = v18;
              uint64_t v21 = v20 + 16;
            }

            v95 = v21;
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v90 objects:v109 count:16];
      }

      while (v10);
    }

    objc_autoreleasePoolPop(context);
    id v76 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    LODWORD(v103) = 1065353216;
    v36 = (int *)v94;
    v79 = (unsigned int *)v95;
    if (v94 != v95)
    {
      v74 = (void *)*MEMORY[0x189607670];
      uint64_t v75 = *MEMORY[0x189607490];
      do
      {
        unint64_t contexta = *v36;
        uint64_t v37 = _LSGetPlugin(*v7, *v36);
        uint64_t v38 = v37;
        if (v37)
        {
          unsigned int v88 = *(_DWORD *)(v37 + 216);
          if (v88)
          {
            uint64_t v77 = v37;
            v39 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>( &v101,  &v88);
            if (v39)
            {
              id v40 = (id)v39[3];
              if (!v40)
              {
                [MEMORY[0x1896077D8] currentHandler];
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                [v41 handleFailureInMethod:a2 object:a1 file:@"LSApplicationExtensionRecord.mm" lineNumber:315 description:@"why don't we have a container in the map?"];

                id v40 = 0LL;
              }
            }

            else
            {
              v47 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
              id v87 = v9;
              id v48 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( v47,  "_initWithContext:bundleID:bundleData:error:",  v7,  v88,  0LL,  &v87);
              id v49 = v87;

              if (v48)
              {
                *(_DWORD *)buf = v88;
                id v50 = v48;
                *(void *)&v108[4] = v50;
                std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,LSApplicationRecord * {__strong}>>( (uint64_t)&v101,  (unsigned int *)buf,  (uint64_t)buf);

                id v9 = v49;
                id v40 = v50;
              }

              else
              {
                id v40 = 0LL;
                id v9 = v49;
              }
            }

            __int128 v85 = 0u;
            __int128 v86 = 0u;
            __int128 v83 = 0u;
            __int128 v84 = 0u;
            v78 = v40;
            [v40 applicationExtensionRecords];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v52 = [v51 countByEnumeratingWithState:&v83 objects:v106 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v84;
LABEL_43:
              uint64_t v54 = 0LL;
              while (1)
              {
                if (*(void *)v84 != v53) {
                  objc_enumerationMutation(v51);
                }
                v55 = *(void **)(*((void *)&v83 + 1) + 8 * v54);
                [v55 uniqueIdentifier];
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                char v57 = [v56 isEqual:*((void *)v36 + 1)];

                if ((v57 & 1) != 0) {
                  break;
                }
                if (v52 == ++v54)
                {
                  uint64_t v52 = [v51 countByEnumeratingWithState:&v83 objects:v106 count:16];
                  if (v52) {
                    goto LABEL_43;
                  }
                  goto LABEL_49;
                }
              }

              id v46 = v55;

              uint64_t v38 = v77;
              if (v46) {
                goto LABEL_52;
              }
            }

            else
            {
LABEL_49:

              uint64_t v38 = v77;
            }
          }

          v58 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
          id v82 = v9;
          id v46 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]( v58,  "_initWithContext:pluginID:pluginData:error:",  v7,  contexta,  v38,  &v82);
          id v59 = v82;

          id v9 = v59;
          if (v46) {
LABEL_52:
          }
            [v76 addObject:v46];
        }

        else
        {
          _LSDefaultLog();
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v108 = contexta;
            _os_log_error_impl( &dword_183E58000,  v42,  OS_LOG_TYPE_ERROR,  "unexpected error finding plugin with unit %lu",  buf,  0xCu);
          }

          uint64_t v104 = v75;
          objc_msgSend(NSString, "stringWithFormat:", @"Could not find plugin for unit %lu", contexta);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v43;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v45 = _LSMakeNSErrorImpl( v74,  -10810LL,  (uint64_t)"+[LSApplicationExtensionRecord applicationExtensionRecordsForUUIDs:outContainingBundleRecords:error:]",  340LL,  v44);

          id v46 = 0LL;
          id v9 = (id)v45;
        }

        v36 += 4;
      }

      while (v36 != (int *)v79);
    }

    if ([v76 count])
    {
      id v60 = v76;
      if (a4)
      {
        id v61 = objc_alloc_init(MEMORY[0x189603FA8]);
        for (j = (void *)v102; j; j = (void *)*j)
          [v61 addObject:j[3]];
        id v63 = *a4;
        *a4 = v61;
      }
    }

    else
    {
      id v60 = 0LL;
    }

    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)&v101);

    *(void *)&__int128 v101 = &v94;
    std::vector<std::pair<unsigned int,NSUUID * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v101);
  }

  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v64 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v65 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v97, v64, 0LL);

    if (v65) {
      id v9 = 0LL;
    }
    else {
      id v9 = v100;
    }
    id v60 = 0LL;
  }

  if (a5 && !v60) {
    *a5 = v9;
  }
  id v66 = v60;
  if (v97 && v99) {
    _LSContextDestroy(v97);
  }
  id v67 = v98;
  v97 = 0LL;
  id v98 = 0LL;

  char v99 = 0;
  id v68 = v100;
  id v100 = 0LL;

  return v66;
}

- (id)_containingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);

  if (!WeakRetained)
  {
    id v9 = (_DWORD *)_LSBundleGet(a3->db, a6->var8);
    if (!v9) {
      return v9;
    }
    if (v9[40] == 2)
    {
      id v9 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:bundleID:bundleData:error:",  a3,  a6->var8,  v9,  0LL);
      return v9;
    }
  }

  id v9 = 0LL;
  return v9;
}

- (LSBundleRecord)_containingBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__containingBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__containingBundleRecord
{
  id v2 = -[LSApplicationExtensionRecord _containingBundleRecord](self, "_containingBundleRecord");
}

- (unsigned)pluginFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  return a6->var1;
}

- (unsigned)pluginFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_pluginFlagsWithContext_tableID_unitID_unitBytes_);
}

- (char)developerType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 developerType];
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___LSApplicationExtensionRecord;
    unsigned __int8 v5 = -[LSBundleRecord developerType](&v8, sel_developerType);
  }

  char v6 = v5;

  return v6;
}

- (unint64_t)compatibilityState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 compatibilityState];
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___LSApplicationExtensionRecord;
    id v5 = -[LSBundleRecord compatibilityState](&v8, sel_compatibilityState);
  }

  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (id)managedPersonas
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 managedPersonas];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)associatedPersonas
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 associatedPersonas];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_personasWithAttributes
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 _personasWithAttributes];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_usesSystemPersona
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 _usesSystemPersona];

  return v3;
}

- (BOOL)_containerized
{
  return 1;
}

- (unint64_t)_containerClass
{
  return 4LL;
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:applicationExtensionRecord:resolveAndDetach:]( &OBJC_CLASS___LSPlugInKitProxy,  "plugInKitProxyForPlugin:withContext:applicationExtensionRecord:resolveAndDetach:",  *(void *)&a5,  a3,  self,  0LL);
}

+ (id)_propertyClasses
{
  v3[3] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:3];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  if (a4->var3 != a3->db->schema.pluginTable)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"LSApplicationExtensionRecord.mm", 479, @"Invalid parameter not satisfying: %@", @"pi->tableID == ctx->db->schema.pluginTable" object file lineNumber description];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSApplicationExtensionRecord;
  return -[LSBundleRecord _initWithContext:persistentIdentifierData:length:]( &v12,  sel__initWithContext_persistentIdentifierData_length_,  a3,  a4,  a5);
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  -[LSApplicationExtensionRecord uniqueIdentifier](self, "uniqueIdentifier");

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LSApplicationExtensionRecord;
  -[LSBundleRecord _detachFromContext:tableID:unitID:unitBytes:]( &v15,  sel__detachFromContext_tableID_unitID_unitBytes_,  a3,  v8,  v7,  a6);
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__containingBundleRecord);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v12 = v11;
  if (v11) {
    [v11 detach];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_extensionPointRecord);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13) {
    [v13 detach];
  }
}

- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5
{
  if (sel__containingBundleRecord == a4)
  {
    id v5 = a3;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___LSApplicationExtensionRecord;
    -[LSRecord _replacementObjectForResolvedPropertyValue:forGetter:encoder:]( &v7,  sel__replacementObjectForResolvedPropertyValue_forGetter_encoder_,  a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LSApplicationExtensionRecord;
  v4 = -[LSBundleRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);
    objc_storeWeak(v4 + 10, WeakRetained);
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  uint64_t infoDictionary = a6->var0.infoDictionary;
  if ((_DWORD)infoDictionary)
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  infoDictionary,  *(void *)&a5);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v7 = 0LL;
  }

  [MEMORY[0x189603FC8] dictionaryWithCapacity:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKey:@"CFBundleIcons" ofClass:objc_opt_class()];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  [v9 objectForKey:@"CFBundlePrimaryIcon"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v12 = 0LL;
  }
  [v10 objectForKey:@"ISGraphicIconConfiguration"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v8 addEntriesFromDictionary:v12];
  }

  else
  {
LABEL_12:
    [v7 objectForKey:@"CFBundleIconFile" ofClass:objc_opt_class()];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14) {
      [v8 setObject:v14 forKeyedSubscript:@"CFBundleIconFile"];
    }
    [v7 objectForKey:@"CFBundleIconName" ofClass:objc_opt_class()];
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15) {
      [v8 setObject:v15 forKeyedSubscript:@"CFBundleIconName"];
    }

    id v12 = 0LL;
  }

  int v16 = (void *)[v8 copy];

  return v16;
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = -[LSApplicationExtensionRecord iconDictionary](self, "iconDictionary");
}

- (id)_intentsArrayForKey:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:@"NSExtension" ofClass:objc_opt_class()];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v5 objectForKey:@"NSExtensionAttributes"];
    uint64_t v8 = (void *)v7;
    if (v6 && v7)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = v8;
        uint64_t v8 = 0LL;
LABEL_10:

        goto LABEL_11;
      }
    }

    else if (!v7)
    {
      goto LABEL_11;
    }

    [v8 objectForKeyedSubscript:a3];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      uint64_t v10 = (void *)objc_opt_class();
      if ((_LSIsArrayWithValuesOfClass(v9, v10) & 1) != 0)
      {
LABEL_12:

        return v9;
      }

      goto LABEL_10;
    }

- (id)supportedIntents
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:](self, "_intentsArrayForKey:", @"IntentsSupported");
}

- (id)intentsRestrictedWhileLocked
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:]( self,  "_intentsArrayForKey:",  @"IntentsRestrictedWhileLocked");
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:]( self,  "_intentsArrayForKey:",  @"IntentsRestrictedWhileProtectedDataUnavailable");
}

- (id)supportedIntentMediaCategories
{
  return -[LSApplicationExtensionRecord _intentsArrayForKey:]( self,  "_intentsArrayForKey:",  @"SupportedMediaCategories");
}

+ (id)redactedAppexRecordWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  int v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__0;
  unint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0LL;
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v18[1] = (void (*)(void, void))3221225472LL;
  v18[2] = (void (*)(void, void))__108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke;
  v18[3] = (void (*)(void, void))&unk_189D72338;
  v18[4] = (void (*)(void, void))&v25;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v18);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472LL;
  v17[2] = __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke_2;
  v17[3] = &unk_189D72360;
  v17[4] = &v19;
  v17[5] = &v25;
  [v13 getRedactedAppexRecordForSystemAppexWithUUID:a3 node:a4 bundleIdentifier:a5 platform:v8 completionHandler:v17];

  v14 = (void *)v20[5];
  if (a7 && !v14)
  {
    *a7 = (id) v26[5];
    v14 = (void *)v20[5];
  }

  id v15 = v14;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke( uint64_t a1,  void *a2)
{
}

void __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
  uint64_t v7 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
  -[LSBundleRecord _node](self, "_node");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleRecord bundleIdentifier](self, "bundleIdentifier");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  id v10 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:]( v7,  "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:",  0LL,  v8,  v9,  -[LSBundleRecord platform](self, "platform"),  a3,  1LL,  v12,  a4);

  return v10;
}

- (NSString)appProtectionEffectiveContainer
{
  return 0LL;
}

- (BOOL)optsOutOfAppProtectionShield
{
  return 0;
}

+ (id)appexRecordsForUnitIDsWithContext:(LSContext *)a3 unitIDs:(const void *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (*((void *)a4 + 1) == *(void *)a4) {
    return MEMORY[0x189604A58];
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:(uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 2];
  uint64_t v8 = *(unsigned int **)a4;
  id v9 = (unsigned int *)*((void *)a4 + 1);
  if (*(unsigned int **)a4 != v9)
  {
    *(void *)&__int128 v7 = 134218242LL;
    __int128 v17 = v7;
    do
    {
      uint64_t v10 = *v8;
      uint64_t v11 = objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord);
      id v18 = 0LL;
      id v12 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]( v11,  "_initWithContext:pluginID:pluginData:error:",  a3,  v10,  0LL,  &v18);
      id v13 = v18;
      if (v12)
      {
        [v6 addObject:v12];
      }

      else
      {
        _LSDefaultLog();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v17;
          uint64_t v20 = v10;
          __int16 v21 = 2112;
          id v22 = v13;
          _os_log_error_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_ERROR,  "Unable to create appex record for unit ID 0x%llx: %@",  buf,  0x16u);
        }
      }

      ++v8;
    }

    while (v8 != v9);
  }

  id v15 = (void *)objc_msgSend(v6, "copy", v17);

  return v15;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  return  -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:]( objc_alloc(&OBJC_CLASS____LSApplicationExtensionRecordEnumerator),  "initWithExtensionPointIdentifier:options:",  0LL,  a3);
}

+ (id)enumeratorWithExtensionPointRecord:(id)a3 options:(unint64_t)a4
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"LSRecord+Enumeration.mm", 266, @"Invalid parameter not satisfying: %@", @"extensionPointRecord != nil" object file lineNumber description];
  }

  return  -[_LSApplicationExtensionRecordEnumerator initWithExtensionPoint:options:]( objc_alloc(&OBJC_CLASS____LSApplicationExtensionRecordEnumerator),  "initWithExtensionPoint:options:",  a3,  a4);
}

@end