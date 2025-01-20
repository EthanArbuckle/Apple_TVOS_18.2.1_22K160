@interface AppMetadataLoader
+ (id)_loaderForApplicationRecord:(id)a3 error:(id *)a4;
+ (id)loadMetadataFromApplicationRecord:(id)a3 withError:(id *)a4;
+ (id)loadMetadataFromBundleContainerURL:(id)a3 withError:(id *)a4;
- (id)_initWithTargetURL:(id)a3 isContainer:(BOOL)a4;
- (id)_loadMetadataFromBundleContainerURLWithError:(id *)a3;
- (id)_loadMetadataFromExtendedAttributeWithError:(id *)a3;
- (id)_loadMetadataWithError:(id *)a3;
@end

@implementation AppMetadataLoader

+ (id)_loaderForApplicationRecord:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___AppMetadataLoader);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleContainerURL]);

  id v7 = -[AppMetadataLoader _initWithTargetURL:isContainer:](v5, "_initWithTargetURL:isContainer:", v6, 1LL);
  return v7;
}

- (id)_initWithTargetURL:(id)a3 isContainer:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AppMetadataLoader;
  v8 = -[AppMetadataLoader init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_targetIsContainer = a4;
    objc_storeStrong((id *)&v8->_targetURL, a3);
  }

  return v9;
}

+ (id)loadMetadataFromApplicationRecord:(id)a3 withError:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AppMetadataLoader _loaderForApplicationRecord:error:]( &OBJC_CLASS___AppMetadataLoader,  "_loaderForApplicationRecord:error:",  a3));
  v6 = v5;
  if (v5) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _loadMetadataWithError:a4]);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)loadMetadataFromBundleContainerURL:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = -[AppMetadataLoader _initWithTargetURL:isContainer:]( objc_alloc(&OBJC_CLASS___AppMetadataLoader),  "_initWithTargetURL:isContainer:",  v5,  1LL);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _loadMetadataWithError:a4]);
  return v7;
}

- (id)_loadMetadataFromBundleContainerURLWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_targetURL,  "URLByAppendingPathComponent:",  @"iTunesMetadata"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathExtension:@"plist"]);

  if (v6)
  {
    id v11 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MIStoreMetadata metadataFromPlistAtURL:error:]( &OBJC_CLASS___MIStoreMetadata,  "metadataFromPlistAtURL:error:",  v6,  &v11));
    id v8 = v11;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    id v7 = 0LL;
    id v8 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v7)
  {
    id v9 = sub_100006B78(self->_targetURL, v8, @"Loading failed");
    *a3 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

- (id)_loadMetadataFromExtendedAttributeWithError:(id *)a3
{
  if (a3)
  {
    id v4 = sub_100006B78(self->_targetURL, 0LL, @"Extended attribute is not available on this platform");
    *a3 = (id)objc_claimAutoreleasedReturnValue(v4);
  }

  return 0LL;
}

- (id)_loadMetadataWithError:(id *)a3
{
  if (self->_targetIsContainer) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[AppMetadataLoader _loadMetadataFromBundleContainerURLWithError:]( self,  "_loadMetadataFromBundleContainerURLWithError:",  a3));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[AppMetadataLoader _loadMetadataFromExtendedAttributeWithError:]( self,  "_loadMetadataFromExtendedAttributeWithError:",  a3));
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end