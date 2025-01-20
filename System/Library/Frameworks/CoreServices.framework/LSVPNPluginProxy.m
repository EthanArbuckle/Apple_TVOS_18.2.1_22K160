@interface LSVPNPluginProxy
+ (BOOL)supportsSecureCoding;
+ (id)VPNPluginProxyForIdentifier:(id)a3;
+ (id)VPNPluginProxyForIdentifier:(id)a3 withContext:(LSContext *)a4;
- (LSVPNPluginProxy)initWithCoder:(id)a3;
- (id)_initWithBundleIdentifier:(id)a3 withContext:(LSContext *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSVPNPluginProxy

- (id)_initWithBundleIdentifier:(id)a3 withContext:(LSContext *)a4
{
  id v6 = a3;
  uint64_t v7 = _LSFindBundleWithInfo(a4, 5uLL, v6, 0, 0LL, 0LL, 0LL);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LSVPNPluginProxy;
  id v8 = -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:]( &v10,  sel__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version_,  v7,  a4,  5LL,  v6,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);

  return v8;
}

+ (id)VPNPluginProxyForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  if (_LSContextInit(&v7))
  {
    v5 = 0LL;
  }

  else
  {
    [a1 VPNPluginProxyForIdentifier:v4 withContext:&v7];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LSContextDestroy(&v7);
  }

  return v5;
}

+ (id)VPNPluginProxyForIdentifier:(id)a3 withContext:(LSContext *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) _initWithBundleIdentifier:v6 withContext:a4];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSVPNPluginProxy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LSVPNPluginProxy;
  return -[LSBundleProxy initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSVPNPluginProxy;
  -[LSBundleProxy encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end