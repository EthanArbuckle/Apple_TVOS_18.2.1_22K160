@interface MASecureMobileAssetTypes
+ (id)sharedInstance;
- (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5;
- (BOOL)supportsDarwin:(id)a3;
- (MASecureMobileAssetTypes)init;
- (NSDictionary)types;
- (id)_loadTypes;
- (void)setTypes:(id)a3;
@end

@implementation MASecureMobileAssetTypes

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  return (id)sharedInstance_instance;
}

void __42__MASecureMobileAssetTypes_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___MASecureMobileAssetTypes);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

- (MASecureMobileAssetTypes)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MASecureMobileAssetTypes;
  v2 = -[MASecureMobileAssetTypes init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = -[MASecureMobileAssetTypes _loadTypes](v2, "_loadTypes");
    types = v3->_types;
    v3->_types = (NSDictionary *)v4;
  }

  return v3;
}

- (BOOL)supportsDarwin:(id)a3
{
  id v4 = a3;
  v5 = -[MASecureMobileAssetTypes types](self, "types");
  [v5 objectForKeyedSubscript:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v6 objectForKeyedSubscript:@"SupportsDarwin"];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 BOOLValue];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = -[MASecureMobileAssetTypes types](self, "types");
  [v10 objectForKeyedSubscript:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v11 objectForKeyedSubscript:@"FSTags"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v12 objectForKeyedSubscript:v8];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      char v15 = isKindOfClass;
      if (a3 && (isKindOfClass & 1) != 0) {
        *a3 = [v13 unsignedIntValue];
      }
    }

    else
    {
      char v15 = 0;
    }
  }

  else
  {
    char v15 = 0;
  }

  return v15 & 1;
}

- (id)_loadTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v7 = v2;
  if (v2)
  {
    [v2 pathForResource:@"SecureMobileAssetTypes" ofType:@"plist"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v12];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v13;
      if (v13) {
        id v19 = v13;
      }
      else {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]",  @"Failed to load SecureMobileAssetTypes.plist",  v14,  v15,  v16,  v17,  v21);
      }
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]",  @"Failed to find SecureMobileAssetTypes.plist",  v8,  v9,  v10,  v11,  v21);
      v18 = 0LL;
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]",  @"Failed to load MobileAsset.framework bundle",  v3,  v4,  v5,  v6,  v21);
    v18 = 0LL;
  }

  return v18;
}

- (NSDictionary)types
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end