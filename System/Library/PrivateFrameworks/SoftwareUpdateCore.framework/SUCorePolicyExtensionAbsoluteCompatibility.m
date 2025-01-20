@interface SUCorePolicyExtensionAbsoluteCompatibility
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)compatibilityVersion;
- (SUCorePolicyExtensionAbsoluteCompatibility)init;
- (SUCorePolicyExtensionAbsoluteCompatibility)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)extendSoftwareUpdateMAAssetQuery:(id)a3;
- (void)setCompatibilityVersion:(id)a3;
@end

@implementation SUCorePolicyExtensionAbsoluteCompatibility

- (SUCorePolicyExtensionAbsoluteCompatibility)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionAbsoluteCompatibility;
  v2 = -[SUCorePolicyExtension init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    compatibilityVersion = v2->_compatibilityVersion;
    v2->_compatibilityVersion = 0LL;
  }

  return v3;
}

- (void)extendSoftwareUpdateMAAssetQuery:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  if (v5)
  {
    -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringValue];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addKeyValuePair:@"_CompatibilityVersion" with:v7];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
    int v11 = 138543618;
    v12 = self;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ querying SU metadata: compatibilityVersion=%{public}@",  (uint8_t *)&v11,  0x16u);
  }
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  return a3;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (SUCorePolicyExtensionAbsoluteCompatibility)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyExtensionAbsoluteCompatibility;
  v5 = -[SUCorePolicyExtension init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_CompatibilityVersion"];
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"_CompatibilityVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionAbsoluteCompatibility *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = (void *)MEMORY[0x189612760];
      -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](v4, "compatibilityVersion");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
      char v8 = [v5 numberIsEqual:v6 to:v7];
    }

    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionAbsoluteCompatibility";
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc(NSString);
    -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)[v4 initWithFormat:@"|compatibilityVersion=%@", v5];
    [&stru_18A0F22B0 stringByAppendingString:v6];
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v7 = &stru_18A0F22B0;
  }

  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", &stru_18A0F22B0) & 1) == 0)
  {
    uint64_t v8 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", @"|");

    v7 = (__CFString *)v8;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[SUCorePolicyExtensionAbsoluteCompatibility extensionName](self, "extensionName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v3 initWithFormat:@"%@(compatibilityVersion:%@)", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SUCorePolicyExtensionAbsoluteCompatibility);
  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionAbsoluteCompatibility setCompatibilityVersion:](v4, "setCompatibilityVersion:", v5);

  return v4;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end