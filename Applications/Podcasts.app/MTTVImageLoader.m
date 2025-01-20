@interface MTTVImageLoader
- (BOOL)isEqual:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7;
- (unint64_t)hash;
- (void)_performLoadImageForKey:(id)a3 scaleToSize:(CGSize)a4 completionHandler:(id)a5;
@end

@implementation MTTVImageLoader

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 podcastUuid]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 podcastUuid]);
    unsigned int v7 = [v5 hasItemForKey:v6];

    if (v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v3 podcastUuid]);
LABEL_7:
      v11 = v8;
      goto LABEL_8;
    }

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a7;
  id v13 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 podcastUuid]);

  if (v14)
  {
    id v15 = kMTLibraryDefaultImageKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 podcastUuid]);
    unsigned int v18 = [v16 hasItemForKey:v17];

    if (v18)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v13 podcastUuid]);

      id v15 = (id)v19;
    }
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkUrl]);

    if (!v20)
    {
      -[MTTVImageLoader _performLoadImageForKey:scaleToSize:completionHandler:]( self,  "_performLoadImageForKey:scaleToSize:completionHandler:",  kMTLibraryDefaultImageKey,  v12,  width,  height);
      goto LABEL_8;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkUrl]);
    id v15 = (id)objc_claimAutoreleasedReturnValue([v21 absoluteString]);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    unsigned int v23 = [v22 hasItemForKey:v15];

    if (!v23)
    {
      BOOL v25 = [v13 episodeStoreId] == 0;
      id v26 = objc_alloc(&OBJC_CLASS____TtC18PodcastsFoundation22DownloadableURLOptions);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkUrl]);
      id v28 = [v26 initWithUrl:v27 nonAppInitiated:v25];

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageDownloader sharedInstance](&OBJC_CLASS___MTImageDownloader, "sharedInstance"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10003E988;
      v30[3] = &unk_100241838;
      id v31 = v15;
      v32 = self;
      double v34 = width;
      double v35 = height;
      id v33 = v12;
      [v29 downloadImageUrl:v28 cacheKey:v31 userInitiated:1 callback:v30];

      goto LABEL_7;
    }
  }

  -[MTTVImageLoader _performLoadImageForKey:scaleToSize:completionHandler:]( self,  "_performLoadImageForKey:scaleToSize:completionHandler:",  v15,  v12,  width,  height);
LABEL_7:

LABEL_8:
  return 0LL;
}

- (void)_performLoadImageForKey:(id)a3 scaleToSize:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v19 = a3;
  id v8 = a5;
  BOOL v9 = width > 0.0 && height > 0.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
  id v11 = v10;
  if (v9) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageForKey:size:", v19, width, height));
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 imageForKey:v19]);
  }
  id v13 = (void *)v12;

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 imageForKey:kMTLibraryDefaultImageKey]);
  }

  id v15 = objc_alloc(&OBJC_CLASS___TVImage);
  id v16 = v13;
  id v17 = objc_msgSend(v15, "initWithCGImageRef:preserveAlpha:", objc_msgSend(v16, "CGImage"), 1);
  if (v9) {
    uint64_t v18 = 2LL;
  }
  else {
    uint64_t v18 = 0LL;
  }
  (*((void (**)(id, id, void, void, uint64_t, void))v8 + 2))(v8, v17, 0LL, 0LL, v18, 0LL);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  LOBYTE(self) = objc_opt_isKindOfClass(v4, v6);

  return self & 1;
}

- (unint64_t)hash
{
  return (unint64_t)[(id)objc_opt_class(self) hash];
}

@end