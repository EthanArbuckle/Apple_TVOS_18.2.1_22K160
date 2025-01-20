@interface _LSLocalizedStringRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
+ (id)sanitizeString:(id)a3;
- (NSArray)_missingBundleLocs;
- (NSDictionary)_allUnsanitizedStringValues;
- (NSDictionary)allStringValues;
- (NSString)defaultStringValue;
- (NSString)stringValue;
- (id)_allUnsanitizedStringValuesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6;
- (id)_initWithContext:(LSContext *)a3 unitID:(unsigned int)a4;
- (id)_missingBundleLocsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6;
- (id)debugDescription;
- (id)stringValueWithPreferredLocalizations:(id)a3;
- (void)_LSRecord_resolve__allUnsanitizedStringValues;
- (void)_LSRecord_resolve__missingBundleLocs;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation _LSLocalizedStringRecord

- (id)_initWithContext:(LSContext *)a3 unitID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (LaunchServices::LocalizedString::Get((LaunchServices::LocalizedString *)a3->db, *(_LSDatabase **)&a4))
  {
    uint64_t localizedStringTable = a3->db->schema.localizedStringTable;
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS____LSLocalizedStringRecord;
    return -[LSRecord _initWithContext:tableID:unitID:]( &v9,  sel__initWithContext_tableID_unitID_,  a3,  localizedStringTable,  v4);
  }

  else
  {

    return 0LL;
  }

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  -[_LSLocalizedStringRecord _allUnsanitizedStringValues](self, "_allUnsanitizedStringValues");

  -[_LSLocalizedStringRecord _missingBundleLocs](self, "_missingBundleLocs");
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____LSLocalizedStringRecord;
  -[LSRecord _detachFromContext:tableID:unitID:unitBytes:]( &v11,  sel__detachFromContext_tableID_unitID_unitBytes_,  a3,  v8,  v7,  a6);
}

- (NSDictionary)_allUnsanitizedStringValues
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__allUnsanitizedStringValuesWithContext_tableID_unitID_unitBytes_);
}

- (id)_allUnsanitizedStringValuesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6
{
  return LaunchServices::LocalizedString::getAllUnsafeLocalizations( (LaunchServices::LocalizedString *)a6,  a3->db,  0LL,  0LL,  0LL);
}

- (NSArray)_missingBundleLocs
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>( self,  (LSRecord *)a2,  sel__missingBundleLocsWithContext_tableID_unitID_unitBytes_);
}

- (id)_missingBundleLocsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  LaunchServices::LocalizedString::getBundleLocs((LaunchServices::LocalizedString *)a6, a3->db);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = objc_alloc(MEMORY[0x189603FE0]);
  if (v7) {
    objc_super v9 = v7;
  }
  else {
    objc_super v9 = (void *)MEMORY[0x189604A58];
  }
  v10 = (void *)[v8 initWithArray:v9];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  -[_LSLocalizedStringRecord _allUnsanitizedStringValues](self, "_allUnsanitizedStringValues", 0LL);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 allKeys];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        [v10 removeObject:*(void *)(*((void *)&v18 + 1) + 8 * v15++)];
      }

      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v13);
  }

  [v10 allObjects];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)stringValue
{
  return (NSString *)-[_LSLocalizedStringRecord stringValueWithPreferredLocalizations:]( self,  "stringValueWithPreferredLocalizations:",  0LL);
}

- (id)stringValueWithPreferredLocalizations:(id)a3
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy__26;
  v17 = __Block_byref_object_dispose__26;
  id v18 = 0LL;
  v6 = (void *)MEMORY[0x186E2A59C]();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke;
  v12[3] = &unk_189D77418;
  v12[4] = a3;
  v12[5] = &v13;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2;
  v11[3] = &unk_189D77440;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v13;
  v11[7] = a2;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v12, v11);
  if (v14[5])
  {
    uint64_t v7 = [(id)objc_opt_class() sanitizeString:v14[5]];
    id v8 = (void *)v14[5];
    v14[5] = v7;
  }

  objc_autoreleasePoolPop(v6);
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

+ (id)sanitizeString:(id)a3
{
  id v3 = a3;
  _LSBalanceBiDiControlCharacters();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  _LSReplaceForbiddenCharacters(v4, 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_LSRecord_resolve__allUnsanitizedStringValues
{
  id v2 = -[_LSLocalizedStringRecord _allUnsanitizedStringValues](self, "_allUnsanitizedStringValues");
}

- (void)_LSRecord_resolve__missingBundleLocs
{
  id v2 = -[_LSLocalizedStringRecord _missingBundleLocs](self, "_missingBundleLocs");
}

- (NSDictionary)allStringValues
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v3];
    uint64_t v5 = objc_opt_class();
    uint64_t v11 = MEMORY[0x1895F87A8];
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = __43___LSLocalizedStringRecord_allStringValues__block_invoke;
    uint64_t v14 = &unk_189D77468;
    uint64_t v16 = v5;
    id v6 = v4;
    id v15 = v6;
    [v2 enumerateKeysAndObjectsUsingBlock:&v11];
    uint64_t v7 = (void *)objc_msgSend(v6, "copy", v11, v12, v13, v14);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (void *)MEMORY[0x189604A60];
  }
  id v9 = v8;

  return v9;
}

- (NSString)defaultStringValue
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = __Block_byref_object_copy__26;
  uint64_t v14 = __Block_byref_object_dispose__26;
  id v15 = 0LL;
  uint64_t v3 = (void *)MEMORY[0x186E2A59C](self, a2);
  v8[5] = &v10;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __46___LSLocalizedStringRecord_defaultStringValue__block_invoke;
  v9[3] = &unk_189D77490;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __46___LSLocalizedStringRecord_defaultStringValue__block_invoke_2;
  v8[3] = &unk_189D729C0;
  v8[4] = self;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v9, v8);
  if (v11[5])
  {
    uint64_t v4 = [(id)objc_opt_class() sanitizeString:v11[5]];
    uint64_t v5 = (void *)v11[5];
    v11[5] = v4;
  }

  objc_autoreleasePoolPop(v3);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSString *)v6;
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = objc_opt_class();
  -[_LSLocalizedStringRecord stringValue](self, "stringValue");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v3 initWithFormat:@"<%@ %p> \"%@\"", v4, self, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_propertyClasses
{
  return (id)MEMORY[0x189604A58];
}

@end