@interface SHMediaLibraryPresenter
- (NSString)bundleIdentifier;
- (SHMediaLibraryInfoFetcher)libraryInfoFetcher;
- (SHMediaLibraryPresenter)initWithBundleIdentifier:(id)a3;
- (void)setLibraryInfoFetcher:(id)a3;
@end

@implementation SHMediaLibraryPresenter

- (SHMediaLibraryPresenter)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHMediaLibraryPresenter;
  v6 = -[SHMediaLibraryPresenter init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___SHMediaLibraryInfoFetcher);
    libraryInfoFetcher = v7->_libraryInfoFetcher;
    v7->_libraryInfoFetcher = v8;
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (SHMediaLibraryInfoFetcher)libraryInfoFetcher
{
  return self->_libraryInfoFetcher;
}

- (void)setLibraryInfoFetcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end