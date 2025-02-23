@interface NIMLModelResourceFileHandler
- (NIMLModelResourceFileHandler)initWithResourceBundleDirectory:(id)a3 bundleName:(id)a4;
- (NSString)bundleName;
- (NSString)resourceBundleDir;
- (void)setBundleName:(id)a3;
- (void)setResourceBundleDir:(id)a3;
@end

@implementation NIMLModelResourceFileHandler

- (NIMLModelResourceFileHandler)initWithResourceBundleDirectory:(id)a3 bundleName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIMLModelResourceFileHandler;
  v9 = -[NIMLModelResourceFileHandler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceBundleDir, a3);
    objc_storeStrong((id *)&v10->_bundleName, a4);
  }

  return v10;
}

- (NSString)resourceBundleDir
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setResourceBundleDir:(id)a3
{
}

- (NSString)bundleName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBundleName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end