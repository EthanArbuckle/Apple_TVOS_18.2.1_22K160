@interface LSClaimRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
- (BOOL)defaultShareModeCollaboration;
- (LSBundleRecord)_claimingBundleRecord;
- (LSBundleRecord)claimingBundleRecord;
- (NSArray)URLSchemes;
- (NSArray)typeIdentifiers;
- (NSDictionary)iconDictionary;
- (NSString)handlerRank;
- (NSString)localizedName;
- (NSURL)iconResourceBundleURL;
- (_LSLocalizedStringRecord)_localizedName;
- (id)URLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_claimingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handlerRankWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)localizedNameWithPreferredLocalizations:(id)a3;
- (id)typeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (unsigned)_rawFlags;
- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (unsigned)role;
- (unsigned)roleWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (void)_LSRecord_resolve_URLSchemes;
- (void)_LSRecord_resolve__claimingBundleRecord;
- (void)_LSRecord_resolve__localizedName;
- (void)_LSRecord_resolve_handlerRank;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_iconResourceBundleURL;
- (void)_LSRecord_resolve_typeIdentifiers;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation LSClaimRecord

- (NSString)localizedName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringValue];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringValueWithPreferredLocalizations:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)typeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __69__LSClaimRecord_typeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v12[3] = &unk_189D74D58;
  id v9 = v8;
  id v13 = v9;
  _LSEnumerateClaimedTypes((uint64_t)a3, (uint64_t)a6, v12);
  v10 = (void *)[v9 copy];

  return v10;
}

uint64_t __69__LSClaimRecord_typeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSArray)typeIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_typeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_typeIdentifiers
{
  id v2 = -[LSClaimRecord typeIdentifiers](self, "typeIdentifiers");
}

- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var2;
}

- (unsigned)_rawFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__rawFlagsWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)defaultShareModeCollaboration
{
  return (-[LSClaimRecord _rawFlags](self, "_rawFlags") >> 11) & 1;
}

- (id)URLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __64__LSClaimRecord_URLSchemesWithContext_tableID_unitID_unitBytes___block_invoke;
  v12[3] = &unk_189D74D58;
  id v9 = v8;
  id v13 = v9;
  _LSEnumerateClaimedSchemes((uint64_t)a3, (uint64_t)a6, v12);
  v10 = (void *)[v9 copy];

  return v10;
}

uint64_t __64__LSClaimRecord_URLSchemesWithContext_tableID_unitID_unitBytes___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSArray)URLSchemes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_URLSchemesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_URLSchemes
{
  id v2 = -[LSClaimRecord URLSchemes](self, "URLSchemes");
}

- (id)handlerRankWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return _LSCopyHandlerRankStringFromNumericHandlerRank(a6->var3);
}

- (NSString)handlerRank
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_handlerRankWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_handlerRank
{
  id v2 = -[LSClaimRecord handlerRank](self, "handlerRank");
}

- (unsigned)roleWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var4;
}

- (unsigned)role
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_roleWithContext_tableID_unitID_unitBytes_);
}

- (LSBundleRecord)claimingBundleRecord
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);
  if (!WeakRetained)
  {
    WeakRetained = -[LSClaimRecord _claimingBundleRecord](self, "_claimingBundleRecord");
  }

  return (LSBundleRecord *)WeakRetained;
}

- (id)_claimingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);

  if (WeakRetained)
  {
    id v9 = 0LL;
  }

  else
  {
    id v9 = (_DWORD *)_LSBundleGet(a3->db, a6->var5);
    if (v9)
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class();
      if (v10[40] == 2) {
        v11 = (objc_class *)objc_opt_class();
      }
      id v9 = (_DWORD *)[[v11 alloc] _initWithNode:0 bundleIdentifier:0 context:a3 tableID:a3->db->schema.bundleTable unitID:a6->var5 bundleBaseData:v10 error:0];
    }
  }

  return v9;
}

- (LSBundleRecord)_claimingBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__claimingBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__claimingBundleRecord
{
  id v2 = -[LSClaimRecord _claimingBundleRecord](self, "_claimingBundleRecord");
}

- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return  -[_LSLocalizedStringRecord _initWithContext:unitID:]( objc_alloc(&OBJC_CLASS____LSLocalizedStringRecord),  "_initWithContext:unitID:",  a3,  a6->var6);
}

- (_LSLocalizedStringRecord)_localizedName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__localizedNameWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedName
{
  id v2 = -[LSClaimRecord _localizedName](self, "_localizedName");
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

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7) {
    [v7 detach];
  }

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedName);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8) {
    [v8 detach];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LSClaimRecord;
  v4 = -[LSRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);
    objc_storeWeak(v4 + 4, WeakRetained);
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  unsigned int var9 = a6->var9;
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", 2, *(void *)&a4, *(void *)&a5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (var9)
  {
    id v9 = (void *)_CSStringCopyCFString();
    if (v9) {
      [v8 setObject:v9 forKeyedSubscript:@"CFBundleIconName"];
    }
  }

  else
  {
    id v9 = 0LL;
  }

  [MEMORY[0x189603FA8] arrayWithCapacity:8];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = 0LL;
  var8 = a6->var8;
  do
  {
    if (!var8[v11]) {
      break;
    }
    id v13 = (void *)_CSStringCopyCFString();
    if (v13) {
      [v10 addObject:v13];
    }
    ++v11;
  }

  while (v11 != 8);
  if ([v10 count]) {
    [v8 setObject:v9 forKeyedSubscript:@"CFBundleIconFiles"];
  }

  return v8;
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = -[LSClaimRecord iconDictionary](self, "iconDictionary");
}

- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if (!a6->var9 && !a6->var8[0] || !a6->var10) {
    goto LABEL_9;
  }
  objc_super v7 = (void *)_CSStringCopyCFString();
  -[LSClaimRecord claimingBundleRecord](self, "claimingBundleRecord");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 URL];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !v7)
  {

LABEL_9:
    -[LSClaimRecord claimingBundleRecord](self, "claimingBundleRecord", a3, *(void *)&a4, *(void *)&a5);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 URL];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }

  [v9 URLByAppendingPathComponent:v7];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10) {
    goto LABEL_9;
  }
  return v10;
}

- (NSURL)iconResourceBundleURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel_iconResourceBundleURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconResourceBundleURL
{
  id v2 = -[LSClaimRecord iconResourceBundleURL](self, "iconResourceBundleURL");
}

@end