@interface SUCorePolicyExtensionCompanionCompatibility
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)maxCompatibility;
- (NSNumber)minCompatibility;
- (SUCorePolicyExtensionCompanionCompatibility)init;
- (SUCorePolicyExtensionCompanionCompatibility)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxCompatibility:(id)a3;
- (void)setMinCompatibility:(id)a3;
@end

@implementation SUCorePolicyExtensionCompanionCompatibility

- (SUCorePolicyExtensionCompanionCompatibility)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionCompanionCompatibility;
  v2 = -[SUCorePolicyExtension init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    minCompatibility = v2->_minCompatibility;
    v2->_minCompatibility = 0LL;

    maxCompatibility = v3->_maxCompatibility;
    v3->_maxCompatibility = 0LL;
  }

  return v3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  v6 = v4;
  if (v5)
  {
    objc_super v7 = (void *)v5;
    v8 = -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
    v6 = v4;
    if (v8)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 oslog];
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = [v4 count];
        _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ starting compatibility version filtering, starting with %lu assets",  buf,  0x16u);
      }

      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __78__SUCorePolicyExtensionCompanionCompatibility_filterSoftwareUpdateAssetArray___block_invoke;
      v20[3] = &unk_18A0EF9C0;
      v20[4] = self;
      [MEMORY[0x1896079C8] predicateWithBlock:v20];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 filteredArrayUsingPredicate:v11];
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896127A0] sharedLogger];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 oslog];
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v6 count];
        v15 = -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
        uint64_t v16 = [v15 unsignedLongValue];
        v17 = -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
        uint64_t v18 = [v17 unsignedLongValue];
        *(_DWORD *)buf = 138544130;
        v22 = self;
        __int16 v23 = 2048;
        uint64_t v24 = v14;
        __int16 v25 = 2048;
        uint64_t v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = v18;
        _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ found %lu assets that meet the compatibility requirement of %lu:%lu",  buf,  0x2Au);
      }
    }
  }

  return v6;
}

BOOL __78__SUCorePolicyExtensionCompanionCompatibility_filterSoftwareUpdateAssetArray___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:@"CompatibilityVersion"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [*(id *)(a1 + 32) minCompatibility];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 compare:v5] == -1)
    {
      BOOL v7 = 0LL;
    }

    else
    {
      [*(id *)(a1 + 32) maxCompatibility];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v7 = [v4 compare:v6] != 1;
    }
  }

  else
  {
    BOOL v7 = 0LL;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v4 unsignedLongValue];
    v12 = @"NO";
    int v14 = 138543874;
    uint64_t v15 = v10;
    if (v7) {
      v12 = @"YES";
    }
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ assetCompatibilityVersion=%lu, compatible=%{public}@",  (uint8_t *)&v14,  0x20u);
  }

  return v7;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (SUCorePolicyExtensionCompanionCompatibility)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionCompanionCompatibility;
  uint64_t v5 = -[SUCorePolicyExtension init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinCompatibility"];
    minCompatibility = v5->_minCompatibility;
    v5->_minCompatibility = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MaxCompatibility"];
    maxCompatibility = v5->_maxCompatibility;
    v5->_maxCompatibility = (NSNumber *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"MinCompatibility"];

  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"MaxCompatibility"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionCompanionCompatibility *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v5 = v4;
      id v6 = (void *)MEMORY[0x189612760];
      -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](v5, "minCompatibility");
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 numberIsEqual:v7 to:v8])
      {
        v9 = (void *)MEMORY[0x189612760];
        -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](v5, "maxCompatibility");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v9 numberIsEqual:v10 to:v11];
      }

      else
      {
        char v12 = 0;
      }
    }

    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionCompanionCompatibility";
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc(NSString);
    -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = (void *)[v4 initWithFormat:@"|minCompatibility=%@", v5];
    [&stru_18A0F22B0 stringByAppendingString:v6];
    BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v7 = &stru_18A0F22B0;
  }

  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    id v9 = objc_alloc(NSString);
    -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v11 = (void *)[v9 initWithFormat:@"|maxCompatibility=%@", v10];
    uint64_t v12 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v11);

    BOOL v7 = (__CFString *)v12;
  }

  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", &stru_18A0F22B0) & 1) == 0)
  {
    uint64_t v13 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", @"|");

    BOOL v7 = (__CFString *)v13;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[SUCorePolicyExtensionCompanionCompatibility extensionName](self, "extensionName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = (void *)[v3 initWithFormat:@"%@(minCompatibility:%@|maxCompatibility:%@)", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyExtensionCompanionCompatibility);
  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility setMinCompatibility:](v4, "setMinCompatibility:", v5);

  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility setMaxCompatibility:](v4, "setMaxCompatibility:", v6);

  return v4;
}

- (NSNumber)minCompatibility
{
  return self->_minCompatibility;
}

- (void)setMinCompatibility:(id)a3
{
}

- (NSNumber)maxCompatibility
{
  return self->_maxCompatibility;
}

- (void)setMaxCompatibility:(id)a3
{
}

- (void).cxx_destruct
{
}

@end