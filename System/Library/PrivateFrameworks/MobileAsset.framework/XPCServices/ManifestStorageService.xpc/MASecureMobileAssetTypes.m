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
  if (qword_10000CCF8 != -1) {
    dispatch_once(&qword_10000CCF8, &stru_1000082C0);
  }
  return (id)qword_10000CD00;
}

- (MASecureMobileAssetTypes)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MASecureMobileAssetTypes;
  v2 = -[MASecureMobileAssetTypes init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MASecureMobileAssetTypes _loadTypes](v2, "_loadTypes"));
    types = v3->_types;
    v3->_types = (NSDictionary *)v4;
  }

  return v3;
}

- (BOOL)supportsDarwin:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MASecureMobileAssetTypes types](self, "types"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SupportsDarwin"]);
    unsigned __int8 v9 = [v8 BOOLValue];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MASecureMobileAssetTypes types](self, "types"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"FSTags"]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v8]);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
      char isKindOfClass = objc_opt_isKindOfClass(v15, v16);
      char v18 = isKindOfClass;
      if (a3 && (isKindOfClass & 1) != 0) {
        *a3 = [v15 unsignedIntValue];
      }
    }

    else
    {
      char v18 = 0;
    }
  }

  else
  {
    char v18 = 0;
  }

  return v18 & 1;
}

- (id)_loadTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/MobileAsset.framework"));
  uint64_t v7 = v2;
  if (v2)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v2 pathForResource:@"SecureMobileAssetTypes" ofType:@"plist"]);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v12));
      char v18 = v13;
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
      char v18 = 0LL;
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]",  @"Failed to load MobileAsset.framework bundle",  v3,  v4,  v5,  v6,  v21);
    char v18 = 0LL;
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