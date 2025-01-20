@interface _LSBundleProvider
- (BOOL)usingCachedItem;
- (_LSBundleProvider)initWithCFBundle:(__CFBundle *)a3;
- (_LSBundleProvider)initWithURL:(id)a3 useCacheIfPossible:(BOOL)a4;
- (__CFBundle)cfBundleRef;
- (__CFBundle)cfBundleRef:(BOOL)a3 reason:(id)a4;
- (id)bundle;
- (id)bundle:(BOOL)a3 reason:(id)a4;
- (id)bundleIdentifier;
- (id)bundlePath;
- (id)bundleURL;
- (id)infoDictionary;
- (void)dealloc;
- (void)provider;
@end

@implementation _LSBundleProvider

- (void)provider
{
  return self->_provider;
}

- (id)bundleURL
{
  return *(id *)-[_LSBundleProvider provider](self, "provider");
}

- (id)bundlePath
{
  return (id)(id)CFURLCopyFileSystemPath( *(CFURLRef *)-[_LSBundleProvider provider](self, "provider"),  kCFURLPOSIXPathStyle);
}

- (id)bundleIdentifier
{
  return LSBundleProvider::bundleIdentifier((LSBundleProvider *)-[_LSBundleProvider provider](self, "provider"));
}

- (id)infoDictionary
{
  return LSBundleProvider::infoDictionary((LSBundleProvider *)-[_LSBundleProvider provider](self, "provider"));
}

- (BOOL)usingCachedItem
{
  return 0;
}

- (_LSBundleProvider)initWithCFBundle:(__CFBundle *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSBundleProvider;
  v4 = -[_LSBundleProvider init](&v7, sel_init);
  if (v4)
  {
    v5 = (LSBundleProvider *)operator new(0x18uLL);
    LSBundleProvider::LSBundleProvider(v5, a3);
    v4->_provider = v5;
  }

  return v4;
}

- (_LSBundleProvider)initWithURL:(id)a3 useCacheIfPossible:(BOOL)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSBundleProvider;
  v6 = -[_LSBundleProvider init](&v9, sel_init);
  if (v6)
  {
    objc_super v7 = (LSBundleProvider *)operator new(0x18uLL);
    LSBundleProvider::LSBundleProvider(v7, v5);
    v6->_provider = v7;
  }

  return v6;
}

- (__CFBundle)cfBundleRef
{
  return -[_LSBundleProvider cfBundleRef:reason:](self, "cfBundleRef:reason:", 1LL, @"cfBundleRef property");
}

- (__CFBundle)cfBundleRef:(BOOL)a3 reason:(id)a4
{
  id v5 = a4;
  v6 = -[_LSBundleProvider provider](self, "provider");
  if (v5) {
    [v5 cStringUsingEncoding:4];
  }
  objc_super v7 = (__CFBundle *)v6[1];

  return v7;
}

- (id)bundle
{
  return -[_LSBundleProvider bundle:reason:](self, "bundle:reason:", 1LL, 0LL);
}

- (id)bundle:(BOOL)a3 reason:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  provider = (LSBundleProvider *)self->_provider;
  if (provider)
  {
    LSBundleProvider::~LSBundleProvider(provider);
    operator delete(v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSBundleProvider;
  -[_LSBundleProvider dealloc](&v5, sel_dealloc);
}

@end