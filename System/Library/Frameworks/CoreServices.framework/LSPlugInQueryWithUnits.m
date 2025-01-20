@interface LSPlugInQueryWithUnits
+ (BOOL)supportsSecureCoding;
- (LSPlugInQueryWithUnits)initWithCoder:(id)a3;
- (LSPlugInQueryWithUnits)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryWithUnits

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInQueryWithUnits)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithUnits;
  v8 = -[LSPlugInQuery _init](&v12, sel__init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    pluginUnits = v8->_pluginUnits;
    v8->_pluginUnits = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dbUUID, a4);
  }

  return v8;
}

- (LSPlugInQueryWithUnits)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithUnits;
  v5 = -[LSPlugInQuery initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"pluginUnits");
    pluginUnits = v5->_pluginUnits;
    v5->_pluginUnits = (NSArray *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dbUUID");
    dbUUID = v5->_dbUUID;
    v5->_dbUUID = (NSUUID *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pluginUnits = self->_pluginUnits;
  id v5 = a3;
  [v5 encodeObject:pluginUnits forKey:@"pluginUnits"];
  [v5 encodeObject:self->_dbUUID forKey:@"dbUUID"];
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v31[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  id v26 = 0LL;
  v27 = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)&v27, (uint64_t)&v26);
  id v9 = v26;
  if (inited)
  {
    _LSDatabaseGetCacheGUID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = [v10 isEqual:self->_dbUUID];

    if (v11)
    {
      [MEMORY[0x189604010] setWithArray:self->_pluginUnits];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
      id v14 = v12;
      id v15 = v13;
      _CSStoreEnumerateUnits();
      if ([v15 isEqual:v14])
      {
        if ([v15 count]) {
          -[LSPlugInQuery sort:pluginIDs:andYield:context:]( self,  "sort:pluginIDs:andYield:context:",  0LL,  v14,  v7,  &v27);
        }
      }

      else
      {
        v16 = (void *)[v14 mutableCopy];
        [v16 minusSet:v15];
        _LSDefaultLog();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:].cold.1( (uint64_t)v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23);
        }

        uint64_t v30 = *MEMORY[0x189607490];
        v31[0] = @"specified plugin units were not available";
        [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  114LL,  (uint64_t)"-[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:]",  141LL,  v24);

        v7[2](v7, 0LL, v25);
        id v9 = (id)v25;
      }
    }

    else
    {
      uint64_t v28 = *MEMORY[0x189607490];
      v29 = @"DB UUID mismatch";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  114LL,  (uint64_t)"-[LSPlugInQueryWithUnits _enumerateWithXPCConnection:block:]",  147LL,  v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0LL, (uint64_t)v15);
    }

    _LSContextDestroy(&v27);
  }

  else
  {
    v7[2](v7, 0LL, (uint64_t)v9);
  }
}

void __60__LSPlugInQueryWithUnits__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithUnsignedInt:a2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = [v4 containsObject:v5];

  if ((_DWORD)v4)
  {
    id v6 = *(void **)(a1 + 40);
    [MEMORY[0x189607968] numberWithUnsignedInt:a2];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];
  }

- (void).cxx_destruct
{
}

- (void)_enumerateWithXPCConnection:(uint64_t)a3 block:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end