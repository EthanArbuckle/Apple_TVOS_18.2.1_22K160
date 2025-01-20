@interface CDAuthInfoInstalledApplication
- (CDAuthInfoInstalledApplication)initWithApplicationRecord:(id)a3;
- (id)applicationIdentifier;
- (id)bundleIdentifier;
- (id)localizedName;
- (id)teamIdentifier;
- (id)websiteDomain;
@end

@implementation CDAuthInfoInstalledApplication

- (CDAuthInfoInstalledApplication)initWithApplicationRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CDAuthInfoInstalledApplication;
  v6 = -[CDAuthInfoInstalledApplication init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationRecord, a3);
  }

  return v7;
}

- (id)bundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier"));
  id v3 = [v2 copy];

  return v3;
}

- (id)applicationIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord applicationIdentifier](self->_applicationRecord, "applicationIdentifier"));
  id v3 = [v2 copy];

  return v3;
}

- (id)teamIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord teamIdentifier](self->_applicationRecord, "teamIdentifier"));
  id v3 = [v2 copy];

  return v3;
}

- (id)localizedName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](self->_applicationRecord, "localizedName"));
  id v3 = [v2 copy];

  return v3;
}

- (id)websiteDomain
{
  return 0LL;
}

- (void).cxx_destruct
{
}

@end