@interface _LSApplicationIsInstalledQuery
+ (BOOL)supportsSecureCoding;
+ (id)queryWithBundleIdentifier:(id)a3;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (NSString)bundleIdentifier;
- (_LSApplicationIsInstalledQuery)initWithCoder:(id)a3;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationIsInstalledQuery

+ (id)queryWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[2];
    v5[2] = v6;
  }

  return v5;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = -[_LSApplicationIsInstalledQuery bundleIdentifier](self, "bundleIdentifier");
  if (!v8)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSApplicationIsInstalledQuery _enumerateWithXPCConnection:block:]",  60LL,  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v14);

    goto LABEL_17;
  }

  id v28 = 0LL;
  v25 = 0LL;
  id v26 = 0LL;
  char v27 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v10 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v9, 0LL);

  if (v10)
  {
    int v24 = 0;
    uint64_t v23 = 0LL;
    v11 = -[_LSApplicationIsInstalledQuery bundleIdentifier](self, "bundleIdentifier");
    memset(v30, 0, sizeof(v30));
    if (_LSBundleFindWithInfo(v10, 0LL, v11, 0, v30, 2, 0, &v24, &v23))
    {
      v12 = -[_LSApplicationIsInstalledQuery bundleIdentifier](self, "bundleIdentifier");
      memset(v29, 0, sizeof(v29));
      BOOL v13 = _LSBundleFindWithInfo(v10, 0LL, v12, 0, v29, 2, 1024, &v24, &v23) == 0;

      if (!v13) {
        goto LABEL_13;
      }
    }

    else
    {
    }

    v18 = objc_alloc(&OBJC_CLASS____LSQueryResultWithPropertyList);
    [MEMORY[0x189607968] numberWithBool:v23 != 0];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_LSQueryResultWithPropertyList initWithPropertyList:](v18, "initWithPropertyList:", v19);

    ((void (**)(id, _LSQueryResultWithPropertyList *, void *))v7)[2](v7, v20, 0LL);
  }

  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v15, 0LL);

    if (v16) {
      id v17 = 0LL;
    }
    else {
      id v17 = v28;
    }
    v7[2](v7, 0LL, v17);
  }

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSApplicationIsInstalledQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
}

- (_LSApplicationIsInstalledQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSApplicationIsInstalledQuery;
  objc_super v5 = -[_LSQuery initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end