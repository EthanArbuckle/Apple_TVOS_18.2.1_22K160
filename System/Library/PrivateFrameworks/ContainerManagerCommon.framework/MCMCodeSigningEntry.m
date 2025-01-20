@interface MCMCodeSigningEntry
- (BOOL)isAdvanceCopy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalid;
- (BOOL)isPlaceholder;
- (BOOL)isRegisteredByCaller;
- (BOOL)isRegisteredByKernel;
- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3;
- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3 andDataContainerClass:(unint64_t)a4;
- (MCMCodeSigningEntry)initWithSerializedDictionary:(id)a3;
- (NSArray)childBundleIdentifiers;
- (NSDictionary)codeSigningInfo;
- (id)description;
- (id)serialize;
- (unint64_t)dataContainerClass;
- (unint64_t)hash;
- (void)setAdvanceCopy:(BOOL)a3;
- (void)setChildBundleIdentifiers:(id)a3;
- (void)setCodeSigningInfo:(id)a3;
- (void)setDataContainerClass:(unint64_t)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setRegisteredByCaller:(BOOL)a3;
- (void)setRegisteredByKernel:(BOOL)a3;
@end

@implementation MCMCodeSigningEntry

- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3 andDataContainerClass:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMCodeSigningEntry;
  v8 = -[MCMCodeSigningEntry init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_codeSigningInfo, a3);
    childBundleIdentifiers = v9->_childBundleIdentifiers;
    v9->_childBundleIdentifiers = 0LL;

    v9->_registeredByKernel = 0;
    *(_DWORD *)&v9->_invalid = 0;
    v9->_dataContainerClass = a4;
  }

  return v9;
}

- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3
{
  return -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:]( self,  "initWithCodeSigningInfo:andDataContainerClass:",  a3,  0LL);
}

- (MCMCodeSigningEntry)initWithSerializedDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMCodeSigningEntry;
  v5 = -[MCMCodeSigningEntry init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"CodeSigningInfo"];
    codeSigningInfo = v5->_codeSigningInfo;
    v5->_codeSigningInfo = (NSDictionary *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ChildBundleIds"];
    childBundleIdentifiers = v5->_childBundleIdentifiers;
    v5->_childBundleIdentifiers = (NSArray *)v8;

    [v4 objectForKeyedSubscript:@"Invalid"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_invalid = [v10 BOOLValue];

    [v4 objectForKeyedSubscript:@"Placeholder"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholder = [v11 BOOLValue];

    [v4 objectForKeyedSubscript:@"AdvanceCopy"];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_advanceCopy = [v12 BOOLValue];

    [v4 objectForKeyedSubscript:@"RegisteredByCaller"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_registeredByCaller = [v13 BOOLValue];

    [v4 objectForKeyedSubscript:@"RegisteredByKernel"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_registeredByKernel = [v14 BOOLValue];

    [v4 objectForKeyedSubscript:@"DataContainerClass"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataContainerClass = [v15 unsignedLongLongValue];
  }

  return v5;
}

- (id)serialize
{
  v3 = (void *)objc_opt_new();
  -[MCMCodeSigningEntry codeSigningInfo](self, "codeSigningInfo");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"CodeSigningInfo"];
  v5 = -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
  [v3 setObject:v5 forKeyedSubscript:@"ChildBundleIds"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MCMCodeSigningEntry isInvalid](self, "isInvalid"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKeyedSubscript:@"Invalid"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MCMCodeSigningEntry isPlaceholder](self, "isPlaceholder"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKeyedSubscript:@"Placeholder"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[MCMCodeSigningEntry isAdvanceCopy](self, "isAdvanceCopy"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKeyedSubscript:@"AdvanceCopy"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MCMCodeSigningEntry isRegisteredByCaller](self, "isRegisteredByCaller"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v9 forKeyedSubscript:@"RegisteredByCaller"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MCMCodeSigningEntry isRegisteredByKernel](self, "isRegisteredByKernel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKeyedSubscript:@"RegisteredByKernel"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[MCMCodeSigningEntry dataContainerClass](self, "dataContainerClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v11 forKeyedSubscript:@"DataContainerClass"];

  objc_super v12 = (void *)[v3 copy];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (MCMCodeSigningEntry *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v6 = v5;
      -[MCMCodeSigningEntry codeSigningInfo](self, "codeSigningInfo");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[MCMCodeSigningEntry codeSigningInfo](v6, "codeSigningInfo"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
      {
        -[MCMCodeSigningEntry codeSigningInfo](self, "codeSigningInfo");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[MCMCodeSigningEntry codeSigningInfo](v6, "codeSigningInfo");
        int v10 = [v8 isEqualToDictionary:v9];

        if (v7)
        {

          if (!v10) {
            goto LABEL_22;
          }
        }

        else
        {

          if ((v10 & 1) == 0) {
            goto LABEL_22;
          }
        }
      }

      -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[MCMCodeSigningEntry childBundleIdentifiers](v6, "childBundleIdentifiers"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
      {
        -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[MCMCodeSigningEntry childBundleIdentifiers](v6, "childBundleIdentifiers");
        int v15 = [v13 isEqualToArray:v14];

        if (v12)
        {

          if (!v15) {
            goto LABEL_22;
          }
        }

        else
        {

          if ((v15 & 1) == 0) {
            goto LABEL_22;
          }
        }
      }

      BOOL v16 = -[MCMCodeSigningEntry isInvalid](self, "isInvalid");
      if (v16 == -[MCMCodeSigningEntry isInvalid](v6, "isInvalid"))
      {
        BOOL v17 = -[MCMCodeSigningEntry isPlaceholder](self, "isPlaceholder");
        if (v17 == -[MCMCodeSigningEntry isPlaceholder](v6, "isPlaceholder"))
        {
          BOOL v18 = -[MCMCodeSigningEntry isAdvanceCopy](self, "isAdvanceCopy");
          if (v18 == -[MCMCodeSigningEntry isAdvanceCopy](v6, "isAdvanceCopy"))
          {
            BOOL v19 = -[MCMCodeSigningEntry isRegisteredByCaller](self, "isRegisteredByCaller");
            if (v19 == -[MCMCodeSigningEntry isRegisteredByCaller](v6, "isRegisteredByCaller"))
            {
              BOOL v20 = -[MCMCodeSigningEntry isRegisteredByKernel](self, "isRegisteredByKernel");
              if (v20 == -[MCMCodeSigningEntry isRegisteredByKernel](v6, "isRegisteredByKernel"))
              {
                unint64_t v22 = -[MCMCodeSigningEntry dataContainerClass](self, "dataContainerClass");
                BOOL v11 = v22 == -[MCMCodeSigningEntry dataContainerClass](v6, "dataContainerClass");
                goto LABEL_23;
              }
            }
          }
        }
      }

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
  uint64_t v6 = [v5 hash];
  if (-[MCMCodeSigningEntry isInvalid](self, "isInvalid")) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (-[MCMCodeSigningEntry isPlaceholder](self, "isPlaceholder")) {
    uint64_t v8 = 4LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  if (-[MCMCodeSigningEntry isRegisteredByCaller](self, "isRegisteredByCaller")) {
    uint64_t v9 = 8LL;
  }
  else {
    uint64_t v9 = 0LL;
  }
  BOOL v10 = -[MCMCodeSigningEntry dataContainerClass](self, "dataContainerClass") != 0;
  if (-[MCMCodeSigningEntry isAdvanceCopy](self, "isAdvanceCopy")) {
    uint64_t v11 = 32LL;
  }
  else {
    uint64_t v11 = 0LL;
  }
  if (-[MCMCodeSigningEntry isRegisteredByKernel](self, "isRegisteredByKernel")) {
    uint64_t v12 = 64LL;
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v7 + (v6 ^ v4) + v8 + v9 + 16LL * v10 + v11 + v12;
}

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __34__MCMCodeSigningEntry_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSDictionary)codeSigningInfo
{
  return self->_codeSigningInfo;
}

- (void)setCodeSigningInfo:(id)a3
{
}

- (NSArray)childBundleIdentifiers
{
  return self->_childBundleIdentifiers;
}

- (void)setChildBundleIdentifiers:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isAdvanceCopy
{
  return self->_advanceCopy;
}

- (void)setAdvanceCopy:(BOOL)a3
{
  self->_advanceCopy = a3;
}

- (BOOL)isRegisteredByCaller
{
  return self->_registeredByCaller;
}

- (void)setRegisteredByCaller:(BOOL)a3
{
  self->_registeredByCaller = a3;
}

- (BOOL)isRegisteredByKernel
{
  return self->_registeredByKernel;
}

- (void)setRegisteredByKernel:(BOOL)a3
{
  self->_registeredByKernel = a3;
}

- (unint64_t)dataContainerClass
{
  return self->_dataContainerClass;
}

- (void)setDataContainerClass:(unint64_t)a3
{
  self->_dataContainerClass = a3;
}

- (void).cxx_destruct
{
}

id __34__MCMCodeSigningEntry_description__block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = (void *)NSString;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v7 = 78LL;
  }
  uint64_t v22 = v7;
  else {
    uint64_t v8 = 78LL;
  }
  else {
    uint64_t v9 = 78LL;
  }
  else {
    uint64_t v10 = 78LL;
  }
  else {
    uint64_t v11 = 78LL;
  }
  uint64_t v12 = [*(id *)(a1 + 32) dataContainerClass];
  [*(id *)(a1 + 32) childBundleIdentifiers];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((a2 & 1) != 0)
  {
    [v13 redactedDescription];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) codeSigningInfo];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 redactedDescription];
    BOOL v18 = v4;
    BOOL v19 = (void *)v17;
    [v18 stringWithFormat:@"<%@ invalid: %c, placeholder: %c, advanceCopy: %c, regByCaller: %c, regByKernel: %c, dataClass: %llu, childBundles: %@, CSinfo: %@>", v6, v22, v8, v9, v10, v11, v12, v15, v17];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [*(id *)(a1 + 32) codeSigningInfo];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"<%@ invalid: %c, placeholder: %c, advanceCopy: %c, regByCaller: %c, regByKernel: %c, dataClass: %llu, childBundles: %@, CSinfo: %@>", v6, v22, v8, v9, v10, v11, v12, v14, v15];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

@end