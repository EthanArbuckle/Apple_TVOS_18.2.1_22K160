@interface _UTDeclaredTypeRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
- (BOOL)conformsToTypeIdentifier:(id)a3;
- (BOOL)isActive;
- (BOOL)isCoreType;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isExported;
- (BOOL)isImported;
- (BOOL)isInPublicDomain;
- (BOOL)isWildcard;
- (LSBundleRecord)_declaringBundleRecord;
- (id)_declaringBundleBookmark;
- (id)_declaringBundleBookmarkWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_declaringBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_delegatePath;
- (id)_delegatePathWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_localizedDescription;
- (id)_localizedDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)childTypeIdentifiers;
- (id)childTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)declaration;
- (id)declarationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)declaringBundleRecord;
- (id)identifier;
- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)parentTypeIdentifiers;
- (id)parentTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)pedigree;
- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)referenceURL;
- (id)referenceURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)tagSpecification;
- (id)tagSpecificationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)version;
- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (unsigned)_rawFlags;
- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (void)_LSRecord_resolve__declaringBundleBookmark;
- (void)_LSRecord_resolve__declaringBundleRecord;
- (void)_LSRecord_resolve__delegatePath;
- (void)_LSRecord_resolve__localizedDescription;
- (void)_LSRecord_resolve_childTypeIdentifiers;
- (void)_LSRecord_resolve_declaration;
- (void)_LSRecord_resolve_identifier;
- (void)_LSRecord_resolve_parentTypeIdentifiers;
- (void)_LSRecord_resolve_pedigree;
- (void)_LSRecord_resolve_referenceURL;
- (void)_LSRecord_resolve_tagSpecification;
- (void)_LSRecord_resolve_version;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)_enumerateRelatedTypeStructuresWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6;
- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6;
@end

@implementation _UTDeclaredTypeRecord

- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var2;
}

- (unsigned)_rawFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__rawFlagsWithContext_tableID_unitID_unitBytes_);
}

- (id)_declaringBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);

  if (WeakRetained)
  {
LABEL_2:
    v10 = 0LL;
    return v10;
  }

  db = a3->db;
  unsigned int var5 = a6->var5;
  if ((a6->var2 & 0x2000) == 0)
  {
    v10 = (_DWORD *)_LSBundleGet(db, var5);
    if (!v10) {
      return v10;
    }
    v14 = v10;
    int v15 = v10[40];
    switch(v15)
    {
      case 11:
        +[LSBundleRecord coreTypesBundleRecord](&OBJC_CLASS___LSBundleRecord, "coreTypesBundleRecord");
        v10 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        return v10;
      case 8:
        v10 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]( objc_alloc(&OBJC_CLASS___LSBundleRecord),  "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:",  0LL,  0LL,  a3,  *(unsigned int *)(-[_LSDatabase schema]((uint64_t)a3->db) + 4),  a6->var5,  v10,  0LL);
        return v10;
      case 2:
        v10 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:bundleID:bundleData:error:",  a3,  a6->var5,  v10,  0LL);
        return v10;
    }

    _LSRecordLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v14[40];
      v18 = -[_UTDeclaredTypeRecord identifier](self, "identifier");
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = v17;
      __int16 v21 = 2114;
      v22 = v18;
      _os_log_impl( &dword_183E58000,  v16,  OS_LOG_TYPE_ERROR,  "Unexpected bundle class %lu declaring type %{public}@",  buf,  0x16u);
    }

    goto LABEL_2;
  }

  v10 = (_DWORD *)_LSGetPlugin((uint64_t)db, var5);
  if (v10) {
    v10 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord),  "_initWithContext:pluginID:pluginData:error:",  a3,  a6->var5,  v10,  0LL);
  }
  return v10;
}

- (LSBundleRecord)_declaringBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__declaringBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__declaringBundleRecord
{
  id v2 = -[_UTDeclaredTypeRecord _declaringBundleRecord](self, "_declaringBundleRecord");
}

- (void)_enumerateRelatedTypeStructuresWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  if (a5 < 1)
  {
    if (a5 < 0)
    {
      if (a5 == 0x8000000000000000LL) {
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v7 = -a5;
      }
      db = a3->db;
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke_2;
      v9[3] = &unk_189D79D40;
      v9[4] = a6;
      v9[5] = a3;
      _UTTypeSearchConformingTypesWithBlock(db, a4, v7, 0LL, (uint64_t)v9);
    }
  }

  else
  {
    v6 = a3->db;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
    v10[3] = &unk_189D79D40;
    v10[4] = a6;
    v10[5] = a3;
    _UTTypeSearchConformsToTypesWithBlock((uint64_t)v6, a4, a5, 0LL, (uint64_t)v10);
  }

- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)identifier
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_identifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_identifier
{
  id v2 = -[_UTDeclaredTypeRecord identifier](self, "identifier");
}

- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if ((a6->var2 & 0x100) == 0) {
    return 0LL;
  }
  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", a6->var4, *(void *)&a4, *(void *)&a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)version
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_versionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_version
{
  id v2 = -[_UTDeclaredTypeRecord version](self, "version");
}

- (BOOL)isDynamic
{
  return 0;
}

- (BOOL)isDeclared
{
  return 1;
}

- (BOOL)isWildcard
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 9) & 1;
}

- (BOOL)isInPublicDomain
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 1) & 1;
}

- (BOOL)isExported
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 4) & 1;
}

- (BOOL)isImported
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") & 0x10) == 0;
}

- (BOOL)isActive
{
  return -[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") & 1;
}

- (BOOL)isCoreType
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 5) & 1;
}

- (id)declaringBundleRecord
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);
  if (!WeakRetained)
  {
    -[_UTDeclaredTypeRecord _declaringBundleRecord](self, "_declaringBundleRecord");
    id WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }

  return WeakRetained;
}

- (id)declarationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  v10 = -[_UTDeclaredTypeRecord identifier](self, "identifier");
  [v9 setObject:v10 forKeyedSubscript:@"UTTypeIdentifier"];
  v11 = -[_UTDeclaredTypeRecord version](self, "version");
  [v9 setObject:v11 forKeyedSubscript:@"UTTypeVersion"];
  v12 = -[_UTDeclaredTypeRecord _localizedDescription](self, "_localizedDescription");
  [v12 defaultStringValue];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v13 forKeyedSubscript:@"UTTypeDescription"];

  v14 = (void *)_CSStringCopyCFString();
  [v9 setObject:v14 forKeyedSubscript:@"UTKEXTIdentifier"];

  -[_UTDeclaredTypeRecord tagSpecification](self, "tagSpecification");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 _expensiveDictionaryRepresentation];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v16 forKeyedSubscript:@"UTTypeTagSpecification"];

  uint64_t var14 = a6->var14;
  if ((_DWORD)var14)
  {
    EntryWithClass = _LSBindingListGetEntryWithClass(a3->db, var14, a3->db->schema.bindingMaps[0].bindingClass);
    if (EntryWithClass && (uint64_t v19 = *((unsigned int *)EntryWithClass + 1), (_DWORD)v19))
    {
      id v20 = 0LL;
      __int16 v21 = EntryWithClass + 8;
      do
      {
        v21 += 4;
        v22 = (void *)_CSStringCopyCFString();
        uint64_t v23 = v22;
        if (v22 && [v22 length])
        {
          if (!v20) {
            id v20 = objc_alloc_init(MEMORY[0x189603FA8]);
          }
          [v20 addObject:v23];
        }

        --v19;
      }

      while (v19);
    }

    else
    {
      id v20 = 0LL;
    }

    [v9 setObject:v20 forKeyedSubscript:@"UTTypeConformsTo"];
  }
  v24 = -[_UTDeclaredTypeRecord referenceURL](self, "referenceURL");
  [v24 absoluteString];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v25 forKeyedSubscript:@"UTTypeReferenceURL"];

  if (-[_UTDeclaredTypeRecord isWildcard](self, "isWildcard")) {
    [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"UTTypeIsWildcard"];
  }
  v26 = +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)&OBJC_CLASS____LSLazyPropertyList, v9);
  return v26;
}

- (id)declaration
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_declarationWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_declaration
{
  id v2 = -[_UTDeclaredTypeRecord declaration](self, "declaration");
}

- (id)tagSpecificationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if (!a6->var13) {
    goto LABEL_21;
  }
  id v22 = objc_alloc_init(MEMORY[0x189603FC8]);
  unsigned int EntryCount = _LSBindingListGetEntryCount();
  id v9 = v22;
  if (EntryCount)
  {
    for (unsigned int i = 0; i != EntryCount; ++i)
    {
      EntryAtIndex = _LSBindingListGetEntryAtIndex(a3->db, a6->var13, i);
      if (EntryAtIndex)
      {
        v12 = (void *)_CSStringCopyCFString();
        if (v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
          uint64_t v14 = EntryAtIndex[1];
          if ((_DWORD)v14)
          {
            int v15 = EntryAtIndex + 2;
            do
            {
              ++v15;
              v16 = (void *)_CSStringCopyCFString();
              if (v16) {
                [v13 addObject:v16];
              }

              --v14;
            }

            while (v14);
          }

          id v9 = v22;
          if ([v13 count])
          {
            [v22 objectForKeyedSubscript:v12];
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              [v17 arrayByAddingObjectsFromArray:v13];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v19 = (void *)[v13 copy];
            }

            [v22 setObject:v19 forKeyedSubscript:v12];
          }
        }
      }
    }
  }

  if (v9)
  {
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)&OBJC_CLASS____LSLazyPropertyList, v9);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_21:
    _LSLazyPropertyListGetSharedEmptyPropertyList();
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)tagSpecification
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_tagSpecificationWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_tagSpecification
{
  id v2 = -[_UTDeclaredTypeRecord tagSpecification](self, "tagSpecification");
}

- (id)referenceURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  v6 = (void *)_CSStringCopyCFString();
  if (v6) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v6];
  }
  else {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)referenceURL
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_referenceURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_referenceURL
{
  id v2 = -[_UTDeclaredTypeRecord referenceURL](self, "referenceURL");
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v5[6] = &v7;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke;
  v6[3] = &unk_189D79D68;
  v6[4] = a3;
  v6[5] = &v7;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke_2;
  v5[3] = &unk_189D79D90;
  v5[4] = self;
  v5[5] = a3;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v6, v5);
  char v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  PedigreeInternal = (void *)_UTTypeGetPedigreeInternal((uint64_t *)a3, a5);
  uint64_t v7 = PedigreeInternal;
  if (PedigreeInternal)
  {
    id v8 = PedigreeInternal;
  }

  else
  {
    [MEMORY[0x189604010] set];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v9 = v8;

  return v9;
}

- (id)pedigree
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_pedigreeWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_pedigree
{
  id v2 = -[_UTDeclaredTypeRecord pedigree](self, "pedigree");
}

- (id)parentTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x189603FD0]);
  db = a3->db;
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  int v15 = __83___UTDeclaredTypeRecord_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v16 = &unk_189D79A50;
  v18 = a3;
  id v10 = v8;
  id v17 = v10;
  _UTTypeSearchConformsToTypesWithBlock((uint64_t)db, a5, 1LL, 0LL, (uint64_t)&v13);
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)parentTypeIdentifiers
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_parentTypeIdentifiers
{
  id v2 = -[_UTDeclaredTypeRecord parentTypeIdentifiers](self, "parentTypeIdentifiers");
}

- (id)childTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
  db = a3->db;
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  int v15 = __82___UTDeclaredTypeRecord_childTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v16 = &unk_189D79A50;
  v18 = a3;
  id v10 = v8;
  id v17 = v10;
  _UTTypeSearchConformingTypesWithBlock(db, a5, 1LL, 0LL, (uint64_t)&v13);
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)childTypeIdentifiers
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_childTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_childTypeIdentifiers
{
  id v2 = -[_UTDeclaredTypeRecord childTypeIdentifiers](self, "childTypeIdentifiers");
}

- (id)_localizedDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return  -[_LSLocalizedStringRecord _initWithContext:unitID:]( objc_alloc(&OBJC_CLASS____LSLocalizedStringRecord),  "_initWithContext:unitID:",  a3,  _UTGetLocalizedDescription(a3->db, a5));
}

- (id)_localizedDescription
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__localizedDescriptionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedDescription
{
  id v2 = -[_UTDeclaredTypeRecord _localizedDescription](self, "_localizedDescription");
}

- (id)_declaringBundleBookmarkWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  BundleBaseData = (int *)_UTTypeGetBundleBaseData(a3->db, (uint64_t)a6);
  if (BundleBaseData)
  {
    _LSAliasGet(a3->db, *BundleBaseData);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)[v8 copy];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)_declaringBundleBookmark
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__declaringBundleBookmarkWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__declaringBundleBookmark
{
  id v2 = -[_UTDeclaredTypeRecord _declaringBundleBookmark](self, "_declaringBundleBookmark");
}

- (id)_delegatePathWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if ((a6->var2 & 0x2000) != 0)
  {
    id v11 = 0LL;
  }

  else
  {
    id v8 = (void *)_CSStringCopyCFString();
    if (v8)
    {
      if (_LSBundleGet(a3->db, a6->var5) && (uint64_t v9 = (void *)_CSStringCopyCFString(), (v10 = v9) != 0LL))
      {
        [v9 stringByAppendingPathComponent:v8];
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v11 = v8;
      }
    }

    else
    {
      id v11 = 0LL;
    }
  }

  return v11;
}

- (id)_delegatePath
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__delegatePathWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__delegatePath
{
  id v2 = -[_UTDeclaredTypeRecord _delegatePath](self, "_delegatePath");
}

- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __114___UTDeclaredTypeRecord__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
  v6[3] = &unk_189D79DB8;
  v6[4] = a6;
  -[_UTDeclaredTypeRecord _enumerateRelatedTypeStructuresWithContext:unitID:maximumDegreeOfSeparation:block:]( self,  "_enumerateRelatedTypeStructuresWithContext:unitID:maximumDegreeOfSeparation:block:",  a3,  *(void *)&a4,  a5,  v6);
}

+ (id)_propertyClasses
{
  v3[7] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v3 count:7];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____UTDeclaredTypeRecord;
  -[UTTypeRecord _detachFromContext:tableID:unitID:unitBytes:]( &v11,  sel__detachFromContext_tableID_unitID_unitBytes_,  a3,  *(void *)&a4,  *(void *)&a5,  a6);
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__declaringBundleRecord);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7) {
    [v7 detach];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedDescription);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9) {
    [v9 detach];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____UTDeclaredTypeRecord;
  v4 = -[LSRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);
    objc_storeWeak(v4 + 4, WeakRetained);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end