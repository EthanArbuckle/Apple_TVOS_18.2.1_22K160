@interface _LSApplicationProxyForIdentifierQuery
+ (BOOL)supportsSecureCoding;
+ (NSSet)alwaysAllowedBundleIdentifiers;
+ (id)queryWithIdentifier:(id)a3;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (_LSApplicationProxyForIdentifierQuery)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSApplicationProxyForIdentifierQuery

+ (id)queryWithIdentifier:(id)a3
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

+ (NSSet)alwaysAllowedBundleIdentifiers
{
  if (+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::once != -1) {
    dispatch_once( &+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::once,  &__block_literal_global_14);
  }
  return (NSSet *)(id)+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
  if (v8)
  {
    id v22 = 0LL;
    v19 = 0LL;
    id v20 = 0LL;
    char v21 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v9, 0LL);

    if (v10)
    {
      -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = +[LSApplicationProxy applicationProxyForIdentifier:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:withContext:",  v11,  v10);
      v7[2](v7, v12, 0LL);
    }

    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v15, 0LL);

      if (v16) {
        id v11 = 0LL;
      }
      else {
        id v11 = v22;
      }
      ((void (**)(id, void *, id))v7)[2](v7, 0LL, v11);
    }

    if (v19 && v21) {
      _LSContextDestroy(v19);
    }
    id v17 = v20;
    v19 = 0LL;
    id v20 = 0LL;

    char v21 = 0;
    id v18 = v22;
    id v22 = 0LL;
  }

  else
  {
    uint64_t v23 = *MEMORY[0x189607490];
    v24[0] = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSApplicationProxyForIdentifierQuery _enumerateWithXPCConnection:block:]",  582LL,  v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0LL, v14);
  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    [(id)objc_opt_class() alwaysAllowedBundleIdentifiers];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
    int v6 = [v4 containsObject:v5] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____LSApplicationProxyForIdentifierQuery;
  if (-[_LSQuery isEqual:](&v12, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    [v5 identifier];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
      if (v7)
      {
        [v5 identifier];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
        char v10 = [v8 isEqual:v9];
      }

      else
      {
        char v10 = 0;
      }
    }

    else
    {
      char v10 = 0;
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSApplicationProxyForIdentifierQuery;
  unint64_t v5 = -[_LSQuery hash](&v7, sel_hash) ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____LSApplicationProxyForIdentifierQuery;
  -[_LSQuery encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (_LSApplicationProxyForIdentifierQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSApplicationProxyForIdentifierQuery;
  unint64_t v5 = -[_LSQuery initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end