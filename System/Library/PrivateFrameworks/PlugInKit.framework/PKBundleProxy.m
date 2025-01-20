@interface PKBundleProxy
- (LSBundleProxy)lsObject;
- (NSDictionary)entitlements;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSURL)bundleURL;
- (NSURL)dataContainerURL;
- (PKBundleProxy)initWithLSBundleProxy:(id)a3;
@end

@implementation PKBundleProxy

- (PKBundleProxy)initWithLSBundleProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PKBundleProxy;
  v6 = -[PKBundleProxy init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lsObject, a3);
  }

  return v7;
}

- (NSURL)bundleURL
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleURL(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v10;
}

- (NSString)bundleIdentifier
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)localizedName
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedName(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSDictionary)entitlements
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (NSURL)dataContainerURL
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataContainerURL(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v10;
}

- (NSString)bundleVersion
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleVersion(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (LSBundleProxy)lsObject
{
  return self->_lsObject;
}

- (void).cxx_destruct
{
}

@end