@interface PKNSBundleProxy
- (BOOL)loadAndReturnError:(id *)a3;
- (Class)principalClass;
- (NSBundle)_underlyingNSBundle;
- (NSDictionary)infoDictionary;
- (NSDictionary)localizedInfoDictionary;
- (NSString)bundleIdentifier;
- (NSURL)builtInPlugInsURL;
- (NSURL)bundleURL;
- (PKNSBundleProxy)initWithNSBundle:(id)a3;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
@end

@implementation PKNSBundleProxy

- (PKNSBundleProxy)initWithNSBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PKNSBundleProxy;
  v6 = -[PKNSBundleProxy init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__underlyingNSBundle, a3);
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

- (NSURL)builtInPlugInsURL
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_builtInPlugInsURL(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v10;
}

- (NSDictionary)infoDictionary
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_infoDictionary(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (NSDictionary)localizedInfoDictionary
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedInfoDictionary(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (Class)principalClass
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_principalClass(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v10;
}

- (BOOL)loadAndReturnError:(id *)a3
{
  id v5 = a3;
  objc_msgSend__underlyingNSBundle(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend_loadAndReturnError_(v6, v7, (uint64_t)v5, v8, v9);

  return (char)v5;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend__underlyingNSBundle(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v15, v16, (uint64_t)v10, (uint64_t)v9, (uint64_t)v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSBundle)_underlyingNSBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end