@interface IXOwnedDataPromiseSeed
+ (BOOL)supportsSecureCoding;
- (IXOwnedDataPromiseSeed)initWithCoder:(id)a3;
- (NSString)sandboxExtensionToken;
- (NSURL)stagingBaseDir;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setStagingBaseDir:(id)a3;
@end

@implementation IXOwnedDataPromiseSeed

- (IXOwnedDataPromiseSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IXOwnedDataPromiseSeed;
  v5 = -[IXDataPromiseSeed initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"stagingBaseDir"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    stagingBaseDir = v5->_stagingBaseDir;
    v5->_stagingBaseDir = (NSURL *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"sandboxExtensionToken"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    sandboxExtensionToken = v5->_sandboxExtensionToken;
    v5->_sandboxExtensionToken = (NSString *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXOwnedDataPromiseSeed;
  id v4 = a3;
  -[IXDataPromiseSeed encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXOwnedDataPromiseSeed stagingBaseDir](self, "stagingBaseDir", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"stagingBaseDir"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXOwnedDataPromiseSeed sandboxExtensionToken](self, "sandboxExtensionToken"));
  [v4 encodeObject:v6 forKey:@"sandboxExtensionToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXOwnedDataPromiseSeed;
  id v4 = -[IXDataPromiseSeed copyWithZone:](&v8, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXOwnedDataPromiseSeed stagingBaseDir](self, "stagingBaseDir"));
  [v4 setStagingBaseDir:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXOwnedDataPromiseSeed sandboxExtensionToken](self, "sandboxExtensionToken"));
  [v4 setSandboxExtensionToken:v6];

  return v4;
}

- (NSURL)stagingBaseDir
{
  return self->_stagingBaseDir;
}

- (void)setStagingBaseDir:(id)a3
{
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end