@interface PBServiceProviderRegistryKeyPair
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)providerType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setProviderType:(id)a3;
@end

@implementation PBServiceProviderRegistryKeyPair

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new(&OBJC_CLASS___PBServiceProviderRegistryKeyPair);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair identifier](self, "identifier"));
  -[PBServiceProviderRegistryKeyPair setIdentifier:](v4, "setIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair providerType](self, "providerType"));
  -[PBServiceProviderRegistryKeyPair setProviderType:](v4, "setProviderType:", v6);

  return v4;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair providerType](self, "providerType"));
  id v4 = [v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair identifier](self, "identifier"));
  unint64_t v6 = (unint64_t)v4 + 17 * (void)[v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBServiceProviderRegistryKeyPair *)a3;
  unint64_t v6 = v4;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }

  else if (v4 {
         && (uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBServiceProviderRegistryKeyPair, v5),
  }
             v8 = (void *)objc_claimAutoreleasedReturnValue(v7),
             char isKindOfClass = objc_opt_isKindOfClass(v6, v8),
             v8,
             (isKindOfClass & 1) != 0))
  {
    v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair identifier](self, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair identifier](v10, "identifier"));
    if ([v11 isEqualToString:v12])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair providerType](self, "providerType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair providerType](v10, "providerType"));
      unsigned __int8 v15 = [v13 isEqualToString:v14];
    }

    else
    {
      unsigned __int8 v15 = 0;
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBServiceProviderRegistryKeyPair;
  id v3 = -[PBServiceProviderRegistryKeyPair description](&v9, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair identifier](self, "identifier"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBServiceProviderRegistryKeyPair providerType](self, "providerType"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@{identifier : %@; providerType : %@}",
                   v4,
                   v5,
                   v6));

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)providerType
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProviderType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end