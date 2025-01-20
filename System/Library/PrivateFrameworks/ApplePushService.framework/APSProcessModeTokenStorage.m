@interface APSProcessModeTokenStorage
- (APSProcessModeTokenStorage)initWithUser:(id)a3;
- (APSUser)user;
- (NSMutableDictionary)tokenStoreByEnvironmentDomain;
- (id)_tokenStoreForEnvironment:(id)a3;
- (id)tokenForEnvironment:(id)a3;
- (void)setToken:(id)a3 forEnvironment:(id)a4;
- (void)setTokenStoreByEnvironmentDomain:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation APSProcessModeTokenStorage

- (APSProcessModeTokenStorage)initWithUser:(id)a3
{
  v4 = (APSUser *)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSProcessModeTokenStorage;
  v5 = -[APSProcessModeTokenStorage init](&v9, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    tokenStoreByEnvironmentDomain = v5->_tokenStoreByEnvironmentDomain;
    v5->_tokenStoreByEnvironmentDomain = v6;

    v5->_user = v4;
  }

  return v5;
}

- (id)_tokenStoreForEnvironment:(id)a3
{
  id v4 = a3;
  tokenStoreByEnvironmentDomain = self->_tokenStoreByEnvironmentDomain;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  v7 = (APSTokenStore *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](tokenStoreByEnvironmentDomain, "objectForKey:", v6));

  if (!v7)
  {
    v7 = -[APSTokenStore initWithEnvironment:allowInMemoryCache:]( objc_alloc(&OBJC_CLASS___APSTokenStore),  "initWithEnvironment:allowInMemoryCache:",  v4,  0LL);
    v8 = self->_tokenStoreByEnvironmentDomain;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v9);
  }

  return v7;
}

- (id)tokenForEnvironment:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSProcessModeTokenStorage _tokenStoreForEnvironment:](self, "_tokenStoreForEnvironment:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 systemTokenForUser:self->_user]);

  return v5;
}

- (void)setToken:(id)a3 forEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[APSProcessModeTokenStorage _tokenStoreForEnvironment:](self, "_tokenStoreForEnvironment:", a4));
  [v7 setSystemToken:v6 forUser:self->_user];
}

- (NSMutableDictionary)tokenStoreByEnvironmentDomain
{
  return self->_tokenStoreByEnvironmentDomain;
}

- (void)setTokenStoreByEnvironmentDomain:(id)a3
{
}

- (APSUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  self->_user = (APSUser *)a3;
}

- (void).cxx_destruct
{
}

@end