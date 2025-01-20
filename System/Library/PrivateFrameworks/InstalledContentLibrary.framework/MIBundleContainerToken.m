@interface MIBundleContainerToken
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIdentifiedBundle;
- (MIBundleContainerToken)initWithCoder:(id)a3;
- (MIBundleContainerToken)initWithContainer:(id)a3;
- (NSURL)bundleURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MIBundleContainerToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIBundleContainerToken)initWithContainer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MIBundleContainerToken;
  v5 = -[MIContainerToken initWithContainer:](&v12, sel_initWithContainer_, v4);
  if (v5)
  {
    [v4 rawContainer];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      [v4 bundle];
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7) {
        v5->_hasIdentifiedBundle = 1;
      }
    }

    else
    {
      v5->_hasIdentifiedBundle = 1;
      [v4 bundle];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 bundleURL];
      bundleURL = v5->_bundleURL;
      v5->_bundleURL = (NSURL *)v9;
    }
  }

  return v5;
}

- (MIBundleContainerToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIBundleContainerToken;
  v5 = -[MIContainerToken initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_hasIdentifiedBundle = [v4 decodeBoolForKey:@"hasIdentifiedBundle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v6;
    v8 = -[MIContainerToken containerURL](v5, "containerURL");
    uint64_t v9 = v8;
    if (v8 && !v5->_bundleURL)
    {
      [v8 path];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIBundleContainerToken initWithCoder:]",  52LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Serialized container did not encode bundleURL for bundle in container %@",  v13,  (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 failWithError:v14];
      v10 = 0LL;
      goto LABEL_6;
    }
  }

  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MIBundleContainerToken;
  id v4 = a3;
  -[MIContainerToken encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIBundleContainerToken hasIdentifiedBundle](self, "hasIdentifiedBundle", v6.receiver, v6.super_class),  @"hasIdentifiedBundle");
  v5 = -[MIBundleContainerToken bundleURL](self, "bundleURL");
  [v4 encodeObject:v5 forKey:@"bundleURL"];
}

- (BOOL)hasIdentifiedBundle
{
  return self->_hasIdentifiedBundle;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
}

@end