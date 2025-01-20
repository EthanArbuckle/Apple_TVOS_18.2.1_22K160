@interface PBDefaultLaunchImageDataProvider
- (BOOL)imageNotFound;
- (PBDefaultLaunchImageDataProvider)init;
- (PBDefaultLaunchImageDataProvider)initWithBundleIdentifier:(id)a3 scaleFactor:(double)a4;
- (UIImage)cachedImage;
- (XBSnapshotDataProviderContext)context;
- (id)fetchImage;
- (void)invalidateImage;
@end

@implementation PBDefaultLaunchImageDataProvider

- (PBDefaultLaunchImageDataProvider)init
{
  return 0LL;
}

- (PBDefaultLaunchImageDataProvider)initWithBundleIdentifier:(id)a3 scaleFactor:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBDefaultLaunchImageDataProvider;
  v7 = -[PBDefaultLaunchImageDataProvider init](&v11, "init");
  if (v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___PBDefaultLaunchImageDataProviderContext);
    -[PBDefaultLaunchImageDataProviderContext setBundleIdentifier:](v8, "setBundleIdentifier:", v6);
    -[PBDefaultLaunchImageDataProviderContext setScale:](v8, "setScale:", a4);
    -[PBDefaultLaunchImageDataProviderContext setOpaque:](v8, "setOpaque:", 0LL);
    context = v7->_context;
    v7->_context = (XBSnapshotDataProviderContext *)v8;
  }

  return v7;
}

- (id)fetchImage
{
  v2 = self;
  objc_sync_enter(v2);
  cachedImage = v2->_cachedImage;
  if (!cachedImage)
  {
    if (v2->_imageNotFound)
    {
      cachedImage = 0LL;
    }

    else
    {
      context = objc_autoreleasePoolPush();
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDefaultLaunchImageDataProvider context](v2, "context"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 installedApplicationWithBundleIdentifier:v6]);

      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 launchImageName]);
      if ([v8 length])
      {
        id v9 = objc_alloc(&OBJC_CLASS____UIAssetManager);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleURL]);
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:@"Assets.car"]);
        id v30 = [v9 initWithURL:v11 idiom:2 error:0];

        -[XBSnapshotDataProviderContext scale](v2->_context, "scale");
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithDisplayScale:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithDisplayScale:"));
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceIdiom:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceIdiom:",  2LL));
        v34[0] = v29;
        v34[1] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithTraitsFromCollections:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithTraitsFromCollections:",  v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue([v30 imageNamed:v8 withTrait:v14]);
        v16 = v15;
        if (v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v15 imageRendererFormat]);
          objc_msgSend(v17, "setOpaque:", -[XBSnapshotDataProviderContext isOpaque](v2->_context, "isOpaque"));
          -[XBSnapshotDataProviderContext scale](v2->_context, "scale");
          objc_msgSend(v17, "setScale:");
          v18 = objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer);
          [v16 size];
          v19 = -[UIGraphicsImageRenderer initWithSize:format:](v18, "initWithSize:format:", v17);
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472LL;
          v32[2] = sub_1001380FC;
          v32[3] = &unk_1003D8798;
          id v20 = v16;
          id v33 = v20;
          uint64_t v21 = objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v19, "imageWithActions:", v32));
          v22 = v2->_cachedImage;
          v2->_cachedImage = (UIImage *)v21;

          if ([v7 isLegacyContentPartnerApp])
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
            uint64_t v24 = objc_claimAutoreleasedReturnValue([v20 _flatImageWithColor:v23]);
            v25 = v2->_cachedImage;
            v2->_cachedImage = (UIImage *)v24;
          }
        }
      }

      v26 = v2->_context;
      v2->_imageNotFound = v2->_cachedImage == 0LL;
      v2->_context = 0LL;

      objc_autoreleasePoolPop(context);
      cachedImage = v2->_cachedImage;
    }
  }

  v27 = cachedImage;
  objc_sync_exit(v2);

  return v27;
}

- (void)invalidateImage
{
  v2 = self;
  objc_sync_enter(v2);
  cachedImage = v2->_cachedImage;
  v2->_cachedImage = 0LL;

  objc_sync_exit(v2);
}

- (XBSnapshotDataProviderContext)context
{
  return self->_context;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (BOOL)imageNotFound
{
  return self->_imageNotFound;
}

- (void).cxx_destruct
{
}

@end