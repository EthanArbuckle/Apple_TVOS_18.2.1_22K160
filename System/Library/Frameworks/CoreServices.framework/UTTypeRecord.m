@interface UTTypeRecord
+ (BOOL)_typeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4;
+ (UTTypeRecord)typeRecordWithIdentifier:(id)a3;
+ (UTTypeRecord)typeRecordWithPotentiallyUndeclaredIdentifier:(id)a3;
+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4;
+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5;
+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5;
+ (id)_propertyClasses;
+ (id)_typeRecordWithContext:(LSContext *)a3 identifier:(id)a4 allowUndeclared:(BOOL)a5;
+ (id)_typeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4;
+ (id)enumerator;
+ (id)typeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4;
+ (id)typeRecordForPromiseAtURL:(id)a3 error:(id *)a4;
+ (id)typeRecordsWithIdentifiers:(id)a3;
+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4;
+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5;
+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5;
- (BOOL)conformsToTypeIdentifier:(id)a3;
- (BOOL)conformsToTypeRecord:(id)a3;
- (BOOL)isActive;
- (BOOL)isChildOfTypeIdentifier:(id)a3;
- (BOOL)isCoreType;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExported;
- (BOOL)isImported;
- (BOOL)isInPublicDomain;
- (BOOL)isWildcard;
- (LSBundleRecord)declaringBundleRecord;
- (LSPropertyList)declaration;
- (NSData)_declaringBundleBookmark;
- (NSDictionary)iconDictionary;
- (NSDictionary)localizedDescriptionDictionary;
- (NSNumber)version;
- (NSOrderedSet)parentTypeIdentifiers;
- (NSSet)childTypeIdentifiers;
- (NSSet)pedigree;
- (NSString)_delegatePath;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSURL)iconResourceBundleURL;
- (NSURL)referenceURL;
- (_LSLocalizedStringRecord)_localizedDescription;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)debugDescription;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)localizedDescriptionWithPreferredLocalizations:(id)a3;
- (id)preferredTagOfClass:(id)a3;
- (unint64_t)hash;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_iconResourceBundleURL;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)_enumerateRelatedTypesWithMaximumDegreeOfSeparation:(int64_t)a3 block:(id)a4;
- (void)enumerateChildTypesWithBlock:(id)a3;
- (void)enumerateDescendantsWithBlock:(id)a3;
- (void)enumerateParentTypesWithBlock:(id)a3;
- (void)enumeratePedigreeWithBlock:(id)a3;
@end

@implementation UTTypeRecord

+ (id)enumerator
{
  return -[_LSDBEnumerator _initWithContext:](objc_alloc(&OBJC_CLASS____LSTypeEnumerator), "_initWithContext:", 0LL);
}

+ (id)_typeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__46;
  v26 = __Block_byref_object_dispose__46;
  id v27 = 0LL;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v19 = 0LL;
    char v20 = 0;
    id v21 = 0LL;
    +[_LSDServiceDomain defaultServiceDomain]();
    v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0LL);

    if (v9)
    {
      uint64_t v10 = [a1 _typeRecordWithContext:v9 identifier:a3 allowUndeclared:v4];
      v11 = (void *)v23[5];
      v23[5] = v10;
    }

    if (CurrentContext && v20) {
      _LSContextDestroy(CurrentContext);
    }
    id v12 = v19;
    CurrentContext = 0LL;
    id v19 = 0LL;

    char v20 = 0;
    id v13 = v21;
    id v21 = 0LL;
  }

  else if (_UTTypeIdentifierIsValid((CFStringRef)a3))
  {
    v14 = +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_74);
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __58__UTTypeRecord__typeRecordWithIdentifier_allowUndeclared___block_invoke_2;
    v17[3] = &unk_189D79B40;
    v17[4] = &v22;
    [v14 getTypeRecordWithIdentifier:a3 allowUndeclared:v4 completionHandler:v17];
  }

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __58__UTTypeRecord__typeRecordWithIdentifier_allowUndeclared___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (UTTypeRecord)typeRecordWithIdentifier:(id)a3
{
  return (UTTypeRecord *)[a1 _typeRecordWithIdentifier:a3 allowUndeclared:0];
}

+ (UTTypeRecord)typeRecordWithPotentiallyUndeclaredIdentifier:(id)a3
{
  return (UTTypeRecord *)[a1 _typeRecordWithIdentifier:a3 allowUndeclared:1];
}

+ (id)typeRecordsWithIdentifiers:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy__46;
  v36 = __Block_byref_object_dispose__46;
  id v37 = 0LL;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v29 = 0LL;
    char v30 = 0;
    id v31 = 0LL;
    +[_LSDServiceDomain defaultServiceDomain]();
    v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v6, 0LL);

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(a3, "count"));
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v9 = a3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v25;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            [a1 _typeRecordWithContext:v7 identifier:v13 allowUndeclared:0];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14) {
              [v8 setObject:v14 forKeyedSubscript:v13];
            }
          }

          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v38 count:16];
        }

        while (v10);
      }

      uint64_t v15 = [v8 copy];
      v16 = (void *)v33[5];
      v33[5] = v15;
    }

    if (CurrentContext && v30) {
      _LSContextDestroy(CurrentContext);
    }
    id v17 = v29;
    CurrentContext = 0LL;
    id v29 = 0LL;

    char v30 = 0;
    id v18 = v31;
    id v31 = 0LL;
  }

  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_3_0);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __43__UTTypeRecord_typeRecordsWithIdentifiers___block_invoke_2;
    v23[3] = &unk_189D79B88;
    v23[4] = &v32;
    [v19 getTypeRecordsWithIdentifiers:a3 completionHandler:v23];
  }

  char v20 = (void *)v33[5];
  if (!v20)
  {
    v33[5] = MEMORY[0x189604A60];

    char v20 = (void *)v33[5];
  }

  id v21 = v20;
  _Block_object_dispose(&v32, 8);

  return v21;
}

void __43__UTTypeRecord_typeRecordsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5
{
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 typeRecordWithTag:a3 ofClass:a4 conformingToIdentifier:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UTTypeRecord *)v9;
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5
{
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 typeRecordsWithTag:a3 ofClass:a4 conformingToIdentifier:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5
{
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  char v30 = __Block_byref_object_copy__46;
  id v31 = __Block_byref_object_dispose__46;
  id v32 = 0LL;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!(_DWORD)MayMapDatabase)
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_6);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __65__UTTypeRecord_typeRecordWithTag_ofClass_conformingToIdentifier___block_invoke_2;
    v20[3] = &unk_189D79B40;
    v20[4] = &v27;
    [v12 getTypeRecordWithTag:a3 ofClass:a4 conformingToIdentifier:a5 completionHandler:v20];

    goto LABEL_16;
  }

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  id v24 = 0LL;
  char v25 = 0;
  id v26 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (LSContext *)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&CurrentContext,  v9,  0LL);

  if (v10)
  {
    int v22 = 0;
    if (a5)
    {
      if (!_UTGetActiveTypeForCFStringIdentifier(v10->db, (const __CFString *)a5, &v22)) {
        goto LABEL_10;
      }
      int v11 = v22;
    }

    else
    {
      int v11 = 0;
    }

    unsigned int v21 = 0;
    if (_UTTypeGetActiveIdentifierForTag(v10->db, (const __CFString *)a4, (const __CFString *)a3, v11, (uint64_t)&v21))
    {
      uint64_t v13 = objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord);
      uint64_t v14 = -[LSRecord _initWithContext:tableID:unitID:]( v13,  "_initWithContext:tableID:unitID:",  v10,  v10->db->schema.utypeTable,  v21);
LABEL_11:
      uint64_t v15 = (void *)v28[5];
      v28[5] = v14;

      goto LABEL_12;
    }

void __65__UTTypeRecord_typeRecordWithTag_ofClass_conformingToIdentifier___block_invoke_2( uint64_t a1,  void *a2)
{
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5
{
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy__46;
  v36 = __Block_byref_object_dispose__46;
  id v37 = 0LL;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if ((_DWORD)MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v29 = 0LL;
    char v30 = 0;
    id v31 = 0LL;
    +[_LSDServiceDomain defaultServiceDomain]();
    id v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (LSContext *)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&CurrentContext,  v9,  0LL);

    if (v10)
    {
      int v27 = 0;
      if (!a5 || _UTGetActiveTypeForCFStringIdentifier(v10->db, (const __CFString *)a5, &v27))
      {
        id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
        db = v10->db;
        v23[0] = MEMORY[0x1895F87A8];
        v23[1] = 3221225472LL;
        v23[2] = __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke;
        v23[3] = &unk_189D79BD0;
        int v26 = v27;
        char v25 = v10;
        id v13 = v11;
        id v24 = v13;
        _UTEnumerateTypesForTag(db, (const __CFString *)a4, (const __CFString *)a3, v23);
        if (![v13 count])
        {
          fallbackDynamicOrBaseTypeRecord(v10, (const __CFString *)a3, (__CFString *)a4, (__CFString *)a5);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14) {
            [v13 addObject:v14];
          }
        }

        uint64_t v15 = [v13 copy];
        id v16 = (void *)v33[5];
        v33[5] = v15;
      }
    }

    if (CurrentContext && v30) {
      _LSContextDestroy(CurrentContext);
    }
    id v17 = v29;
    CurrentContext = 0LL;
    id v29 = 0LL;

    char v30 = 0;
    id v18 = v31;
    id v31 = 0LL;
  }

  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_9_2);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke_3;
    v22[3] = &unk_189D79C18;
    v22[4] = &v32;
    [v19 getTypeRecordsWithTag:a3 ofClass:a4 conformingToIdentifier:a5 completionHandler:v22];
  }

  id v20 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v20;
}

void __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke( uint64_t a1,  uint64_t a2,  int a3,  uint64_t a4)
{
  if ((*(_BYTE *)(a4 + 8) & 1) != 0)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 48);
    if (!v6 || _UTTypeConformsTo(**(void ***)(a1 + 40), a3, v6))
    {
      id v7 = -[LSRecord _initWithContext:tableID:unitID:]( objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord),  "_initWithContext:tableID:unitID:");
      if (v7)
      {
        id v8 = v7;
        [*(id *)(a1 + 32) addObject:v7];
        id v7 = v8;
      }
    }
  }

void __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke_3( uint64_t a1,  void *a2)
{
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4
{
  return (UTTypeRecord *)[a1 typeRecordWithTag:a3 ofClass:a4 conformingToIdentifier:0];
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4
{
  return (id)[a1 typeRecordsWithTag:a3 ofClass:a4 conformingToIdentifier:0];
}

+ (id)typeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4
{
  v5 = (__CFString *)a4;
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  uint64_t v39 = __Block_byref_object_copy__46;
  v40 = __Block_byref_object_dispose__46;
  id v41 = 0LL;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!(_DWORD)MayMapDatabase)
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __79__UTTypeRecord_typeRecordForImportedTypeWithIdentifier_conformingToIdentifier___block_invoke_2;
    v28[3] = &unk_189D79B40;
    v28[4] = &v36;
    [v12 getTypeRecordForImportedTypeWithIdentifier:a3 conformingToIdentifier:v5 completionHandler:v28];

    goto LABEL_25;
  }

  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  id v33 = 0LL;
  char v34 = 0;
  id v35 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v7, 0LL);

  if (v8)
  {
    unsigned int v31 = 0;
    uint64_t active = _UTGetActiveTypeForCFStringIdentifier(*v8, (const __CFString *)a3, &v31);
    if (!active
      || (EntryWithClass = _LSBindingListGetEntryWithClass(*v8, *(unsigned int *)(active + 80), *((_DWORD *)*v8 + 84))) == 0LL
      || !*((_DWORD *)EntryWithClass + 1)
      || !*((_DWORD *)EntryWithClass + 2))
    {
LABEL_19:
      if (v31)
      {
        unsigned int v21 = objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord);
        uint64_t v22 = -[LSRecord _initWithContext:tableID:unitID:]( v21,  "_initWithContext:tableID:unitID:",  v8,  *((unsigned int *)*v8 + 8),  v31);
        v23 = (void *)v37[5];
        v37[5] = v22;
      }

      goto LABEL_21;
    }

    int v30 = 0;
    id v11 = *v8;
    if (v5)
    {
      _UTGetActiveTypeForCFStringIdentifier(*v8, v5, &v30);
      goto LABEL_15;
    }

    int v13 = v31;
    unsigned int TypeData = _UTTypeGetTypeData((_LSDatabase *)*v8);
    int v15 = _UTTypeConformsTo(v11, v13, TypeData);
    id v16 = *v8;
    if (v15)
    {
      int v17 = _UTTypeGetTypeData((_LSDatabase *)*v8);
    }

    else
    {
      int v18 = v31;
      unsigned int TypePackage = _UTTypeGetTypePackage((_LSDatabase *)*v8);
      int v17 = _UTTypeGetTypePackage((_LSDatabase *)*v8);
    }

    int v30 = v17;
LABEL_15:
    id v20 = (__CFString *)_CSStringCopyCFString();
    if (v20)
    {
      unsigned int v29 = 0;
    }

    goto LABEL_19;
  }

void __79__UTTypeRecord_typeRecordForImportedTypeWithIdentifier_conformingToIdentifier___block_invoke_2( uint64_t a1,  void *a2)
{
}

+ (id)typeRecordForPromiseAtURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"+[UTTypeRecord typeRecordForPromiseAtURL:error:]",  392LL,  0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (NSString)identifier
{
  return (NSString *)&stru_189D7B4C8;
}

- (NSNumber)version
{
  return 0LL;
}

- (BOOL)isDynamic
{
  return 0;
}

- (BOOL)isDeclared
{
  return 0;
}

- (BOOL)isWildcard
{
  return 0;
}

- (BOOL)isInPublicDomain
{
  return 0;
}

- (BOOL)isExported
{
  return 0;
}

- (BOOL)isImported
{
  return 0;
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isCoreType
{
  return 0;
}

- (LSBundleRecord)declaringBundleRecord
{
  return 0LL;
}

- (LSPropertyList)declaration
{
  return (LSPropertyList *)MEMORY[0x189604A60];
}

- (id)preferredTagOfClass:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  [v4 objectForKey:a3 ofClass:v5 valuesOfClass:objc_opt_class()];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 firstObject];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)referenceURL
{
  return 0LL;
}

- (BOOL)conformsToTypeRecord:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UTTypeRecord conformsToTypeIdentifier:](self, "conformsToTypeIdentifier:", v4);

  return (char)self;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  return 0;
}

- (NSSet)pedigree
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v4 count:1];

  return (NSSet *)v2;
}

- (NSOrderedSet)parentTypeIdentifiers
{
  return (NSOrderedSet *)objc_alloc_init(MEMORY[0x189603FF0]);
}

- (NSSet)childTypeIdentifiers
{
  return (NSSet *)objc_alloc_init(MEMORY[0x189603FF0]);
}

- (BOOL)isChildOfTypeIdentifier:(id)a3
{
  id v4 = a3;
  [v4 lowercaseString];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UTTypeRecord parentTypeIdentifiers](self, "parentTypeIdentifiers");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = [v6 containsObject:v5];

  return (char)v4;
}

- (void)enumeratePedigreeWithBlock:(id)a3
{
}

- (void)enumerateDescendantsWithBlock:(id)a3
{
}

- (void)enumerateParentTypesWithBlock:(id)a3
{
}

- (void)enumerateChildTypesWithBlock:(id)a3
{
}

- (NSString)localizedDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringValue];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)localizedDescriptionWithPreferredLocalizations:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringValueWithPreferredLocalizations:a3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)localizedDescriptionDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allStringValues];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x189604A60];
  }
  uint64_t v5 = v3;

  return v5;
}

+ (id)_typeRecordWithContext:(LSContext *)a3 identifier:(id)a4 allowUndeclared:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v10 = 0;
  if (_UTTypeIdentifierIsDynamic((const __CFString *)a4)) {
    return  -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]( objc_alloc(&OBJC_CLASS____UTDynamicTypeRecord),  "_initWithContext:dynamicUTI:",  a3,  a4);
  }
  if (_UTGetActiveTypeForCFStringIdentifier(a3->db, (const __CFString *)a4, &v10))
  {
    id v9 = objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord);
    return  -[LSRecord _initWithContext:tableID:unitID:]( v9,  "_initWithContext:tableID:unitID:",  a3,  a3->db->schema.utypeTable,  v10);
  }

  else if (v5)
  {
    return  -[_UTUndeclaredTypeRecord _initWithContext:identifier:]( objc_alloc(&OBJC_CLASS____UTUndeclaredTypeRecord),  "_initWithContext:identifier:",  a3,  a4);
  }

  else
  {
    return 0LL;
  }

- (_LSLocalizedStringRecord)_localizedDescription
{
  return 0LL;
}

- (NSData)_declaringBundleBookmark
{
  return 0LL;
}

- (NSString)_delegatePath
{
  return 0LL;
}

- (void)_enumerateRelatedTypesWithMaximumDegreeOfSeparation:(int64_t)a3 block:(id)a4
{
  uint64_t v28 = 0LL;
  unsigned int v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  unsigned int v31 = __Block_byref_object_copy__46;
  uint64_t v32 = __Block_byref_object_dispose__46;
  id v33 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x4812000000LL;
  id v24 = __Block_byref_object_copy__19;
  id v25 = __Block_byref_object_dispose__20;
  id v26 = "";
  memset(v27, 0, sizeof(v27));
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke;
  v20[3] = &unk_189D79C88;
  v20[4] = self;
  void v20[5] = &v28;
  v20[6] = &v21;
  v20[7] = a3;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_3;
  v19[3] = &unk_189D73E00;
  v19[5] = a4;
  v19[6] = a3;
  v19[4] = self;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v20, v19);
  BOOL v5 = (void *)v29[5];
  if (!v5) {
    goto LABEL_16;
  }
  unsigned int v6 = v5;
  v34[0] = v6;
  unsigned __int8 v18 = 0;
  uint64_t v7 = v22[6];
  uint64_t v8 = v22[7];
  if (v7 == v8) {
    goto LABEL_15;
  }
  uint64_t v9 = v7 + 24;
  do
  {
    unsigned int v10 = (void *)MEMORY[0x186E2A59C]();
    if (*(_BYTE *)(v9 - 4))
    {
      uint64_t v11 = *(unsigned int *)(v9 - 8);
      id v12 = objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord);
      uint64_t v13 = -[LSRecord _initWithContext:tableID:unitID:]( v12,  "_initWithContext:tableID:unitID:",  v34,  *((unsigned int *)v34[0] + 8),  v11);
      uint64_t v14 = (void *)v13;
      if (*(_BYTE *)(v9 - 4))
      {
        if (!v13) {
          goto LABEL_11;
        }
LABEL_10:
        (*((void (**)(id, void *, void, unsigned __int8 *))a4 + 2))(a4, v14, *(void *)(v9 - 16), &v18);
        goto LABEL_11;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    id v15 = -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]( objc_alloc(&OBJC_CLASS____UTDynamicTypeRecord),  "_initWithContext:dynamicUTI:",  v34,  *(void *)(v9 - 24));

    uint64_t v14 = v15;
    if (v15) {
      goto LABEL_10;
    }
LABEL_11:
    int v16 = v18;

    objc_autoreleasePoolPop(v10);
    if (v16) {
      break;
    }
    BOOL v17 = v9 == v8;
    v9 += 24LL;
  }

  while (!v17);
  unsigned int v6 = v34[0];
LABEL_15:

LABEL_16:
  _Block_object_dispose(&v21, 8);
  v34[0] = (void **)v27;
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100](v34);
  _Block_object_dispose(&v28, 8);
}

uint64_t __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke( void *a1,  id *a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v7 = (void *)a1[4];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_2;
  v10[3] = &unk_189D79C60;
  uint64_t v8 = a1[7];
  v10[4] = a1[6];
  return [v7 _enumerateRelatedTypeUnitsOrDynamicIdsWithContext:a2 unitID:a4 maximumDegreeOfSeparation:v8 block:v10];
}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_2( uint64_t a1,  id *a2)
{
}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_3( uint64_t a1)
{
  if (_LSCurrentProcessMayMapDatabase())
  {
    v2 = objc_alloc(&OBJC_CLASS___UTTypeRecord);
    [*(id *)(a1 + 32) persistentIdentifier];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[LSRecord initWithPersistentIdentifier:](v2, "initWithPersistentIdentifier:", v3);

    if (v9)
    {
      -[UTTypeRecord _enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:]( v9,  "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:",  *(void *)(a1 + 48),  *(void *)(a1 + 40));
    }

    else
    {
      [*(id *)(a1 + 32) identifier];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", v7);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8) {
        [v8 _enumerateRelatedTypesWithMaximumDegreeOfSeparation:*(void *)(a1 + 48) block:*(void *)(a1 + 40)];
      }
    }
  }

  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_24);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) identifier];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_5;
    v10[3] = &unk_189D79CD0;
    uint64_t v6 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    [v4 getRelatedTypesOfTypeWithIdentifier:v5 maximumDegreeOfSeparation:v6 completionHandler:v10];
  }

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_5( uint64_t a1,  void *a2,  void *a3)
{
  unint64_t v6 = [a2 count];
  unint64_t v7 = [a3 count];
  if (v7 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v7;
  }
  char v13 = 0;
  if (v8)
  {
    unint64_t v9 = 1LL;
    do
    {
      uint64_t v10 = *(void *)(a1 + 32);
      [a2 objectAtIndexedSubscript:v9 - 1];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [a3 objectAtIndexedSubscript:v9 - 1];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, char *))(v10 + 16))( v10,  v11,  [v12 integerValue],  &v13);

      if (v9 >= v8) {
        break;
      }
      ++v9;
    }

    while (!v13);
  }

+ (BOOL)_typeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  unint64_t v6 = (void *)MEMORY[0x186E2A59C](a1, a2);
  if (_LSCurrentProcessMayMapDatabase())
  {
    +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a3);
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = v7;
    if (v7)
    {
      char v9 = [v7 conformsToTypeIdentifier:a4];
      *((_BYTE *)v14 + 24) = v9;
    }
  }

  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_27_0);
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __57__UTTypeRecord__typeIdentifier_conformsToTypeIdentifier___block_invoke_2;
    v12[3] = &unk_189D79D18;
    v12[4] = &v13;
    [v8 getWhetherTypeIdentifier:a3 conformsToTypeIdentifier:a4 completionHandler:v12];
  }

  objc_autoreleasePoolPop(v6);
  char v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __57__UTTypeRecord__typeIdentifier_conformsToTypeIdentifier___block_invoke_2( uint64_t result,  char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

+ (id)_propertyClasses
{
  return (id)MEMORY[0x189604A58];
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (a4->var3 != a3->db->schema.utypeTable)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, self, @"UTTypeRecord.mm", 846, @"Invalid parameter not satisfying: %@", @"pi->tableID == ctx->db->schema.utypeTable" object file lineNumber description];
  }

  if (a5 < 0x1D)
  {
    if (_UTTypeGet())
    {
      id v12 = -[LSRecord _initWithContext:tableID:unitID:]( objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord),  "_initWithContext:tableID:unitID:",  a3,  a4->var3,  a4->var2);
    }

    else
    {
      _LSRecordLog();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v14;
        _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEBUG,  "Failed to initialize type record with persistent identifier %@ because the type could not be found.",  buf,  0xCu);
      }

      return 0LL;
    }
  }

  else
  {
    char v9 = (const __CFString *)[objc_alloc(NSString) initWithBytesNoCopy:a4->var5 length:a5 - 28 encoding:4 freeWhenDone:0];
    char v10 = (__CFString *)v9;
    if (v9)
    {
      if (UTTypeIsDynamic(v9)) {
        id v11 = -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]( objc_alloc(&OBJC_CLASS____UTDynamicTypeRecord),  "_initWithContext:dynamicUTI:",  a3,  v10);
      }
      else {
        id v11 = -[_UTUndeclaredTypeRecord _initWithContext:identifier:]( objc_alloc(&OBJC_CLASS____UTUndeclaredTypeRecord),  "_initWithContext:identifier:",  a3,  v10);
      }
      id v12 = v11;
    }

    else
    {
      _LSRecordLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        char v16 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v16;
        _os_log_impl( &dword_183E58000,  v15,  OS_LOG_TYPE_DEBUG,  "Failed to initialize type record with persistent identifier %@ because the stored type was not valid UTF-8.",  buf,  0xCu);
      }

      id v12 = 0LL;
    }
  }

  return v12;
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedDescription);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [v7 detach];
  }
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = objc_opt_class();
  -[UTTypeRecord identifier](self, "identifier");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %p> { identifier: %@ }", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  -[UTTypeRecord identifier](self, "identifier");
  BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = UTTypeEqual(v5, (CFStringRef)[a3 identifier]) != 0;

  return v6;
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if (a6)
  {
    uint64_t var10 = a6->var10;
    if ((_DWORD)var10)
    {
      +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a3,  var10,  *(void *)&a5);
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 _expensiveDictionaryRepresentation];

      id v11 = (void *)v10;
    }

    else
    {
      id v11 = 0LL;
    }

    id v12 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:2];
    _UTTypeGetIconName(a3->db, (uint64_t)a6);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13) {
      [v12 setObject:v13 forKeyedSubscript:@"UTTypeIconName"];
    }
    _UTTypeGetIconNames(a3->db, (uint64_t)a6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v14 count]) {
      [v12 setObject:v14 forKeyedSubscript:@"UTTypeIconFiles"];
    }
    _UTTypeGetGlyphName(a3->db, (uint64_t)a6);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15) {
      [v12 setObject:v15 forKeyedSubscript:@"UTTypeGlyphName"];
    }
    if ([v12 count])
    {
      [v12 addEntriesFromDictionary:v11];
      uint64_t v16 = [v12 copy];

      id v11 = (void *)v16;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = -[UTTypeRecord iconDictionary](self, "iconDictionary");
}

- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if (a6)
  {
    -[UTTypeRecord declaringBundleRecord](self, "declaringBundleRecord", a3, *(void *)&a4, *(void *)&a5);
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 URL];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a6->var2 & 0x2000) != 0 || !a6->var11)
    {
      id v17 = v10;
      id v11 = 0LL;
      uint64_t v15 = 0LL;
      goto LABEL_19;
    }

    id v11 = (void *)_CSStringCopyCFString();
    uint64_t v12 = _LSBundleGet(a3->db, a6->var5);
    uint64_t v13 = v12;
    if (v12 && *(_DWORD *)(v12 + 444))
    {
      uint64_t v14 = (void *)_CSStringCopyCFString();
      if (v14)
      {
        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v14 isDirectory:1 relativeToURL:v10];

        if (v15) {
          BOOL v16 = v11 == 0LL;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          [v15 URLByAppendingPathComponent:v11 isDirectory:1];
          id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

          return v17;
        }

- (NSURL)iconResourceBundleURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_iconResourceBundleURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconResourceBundleURL
{
  id v2 = -[UTTypeRecord iconResourceBundleURL](self, "iconResourceBundleURL");
}

@end