@interface SHUIService
+ (id)machServiceName;
- (NSString)bundleIdentifier;
- (SHMediaItemPresenter)mediaItemPresenter;
- (SHMediaLibraryPresenter)mediaLibraryPresenter;
- (SHServiceDelegate)serviceDelegate;
- (id)initBundleIdentifier:(id)a3;
- (void)setServiceDelegate:(id)a3;
@end

@implementation SHUIService

- (id)initBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHUIService;
  v6 = -[SHUIService init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (SHMediaItemPresenter)mediaItemPresenter
{
  mediaItemPresenter = self->_mediaItemPresenter;
  if (!mediaItemPresenter)
  {
    v4 = objc_alloc(&OBJC_CLASS___SHMediaItemPresenter);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHUIService bundleIdentifier](self, "bundleIdentifier"));
    v6 = -[SHMediaItemPresenter initBundleIdentifier:](v4, "initBundleIdentifier:", v5);
    v7 = self->_mediaItemPresenter;
    self->_mediaItemPresenter = v6;

    mediaItemPresenter = self->_mediaItemPresenter;
  }

  return mediaItemPresenter;
}

- (SHMediaLibraryPresenter)mediaLibraryPresenter
{
  mediaLibraryPresenter = self->_mediaLibraryPresenter;
  if (!mediaLibraryPresenter)
  {
    v4 = objc_alloc(&OBJC_CLASS___SHMediaLibraryPresenter);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHUIService bundleIdentifier](self, "bundleIdentifier"));
    v6 = -[SHMediaLibraryPresenter initWithBundleIdentifier:](v4, "initWithBundleIdentifier:", v5);
    v7 = self->_mediaLibraryPresenter;
    self->_mediaLibraryPresenter = v6;

    mediaLibraryPresenter = self->_mediaLibraryPresenter;
  }

  return mediaLibraryPresenter;
}

+ (id)machServiceName
{
  return SHShazamKitUIServiceName;
}

- (SHServiceDelegate)serviceDelegate
{
  return (SHServiceDelegate *)objc_loadWeakRetained((id *)&self->_serviceDelegate);
}

- (void)setServiceDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end