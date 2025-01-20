@interface SHMediaItemPresenter
- (NSString)bundleIdentifier;
- (SHMediaItemPresenter)initWithRemoteConfiguration:(id)a3 bundleIdentifier:(id)a4;
- (SHRemoteConfiguration)remoteConfiguration;
- (id)initBundleIdentifier:(id)a3;
@end

@implementation SHMediaItemPresenter

- (id)initBundleIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SHMediaItemPresenter;
  v6 = -[SHMediaItemPresenter init](&v10, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
    remoteConfiguration = v6->_remoteConfiguration;
    v6->_remoteConfiguration = (SHRemoteConfiguration *)v7;

    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v6;
}

- (SHMediaItemPresenter)initWithRemoteConfiguration:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[SHMediaItemPresenter initBundleIdentifier:](self, "initBundleIdentifier:", v8);
  objc_super v10 = (SHMediaItemPresenter *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

- (SHRemoteConfiguration)remoteConfiguration
{
  return self->_remoteConfiguration;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end