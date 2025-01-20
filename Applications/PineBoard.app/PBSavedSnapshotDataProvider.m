@interface PBSavedSnapshotDataProvider
- (NSString)bundleIdentifier;
- (NSString)sceneID;
- (PBSavedSnapshotDataProvider)init;
- (PBSavedSnapshotDataProvider)initWithSnapshotPredicate:(id)a3 sceneID:(id)a4 bundleIdentifier:(id)a5 scaleFactor:(double)a6;
- (UIImage)cachedImage;
- (XBApplicationSnapshot)snapshot;
- (XBApplicationSnapshotPredicate)predicate;
- (XBSnapshotDataProviderContext)context;
- (double)scaleFactor;
- (id)fetchImage;
- (void)invalidateImage;
@end

@implementation PBSavedSnapshotDataProvider

- (PBSavedSnapshotDataProvider)init
{
  return 0LL;
}

- (PBSavedSnapshotDataProvider)initWithSnapshotPredicate:(id)a3 sceneID:(id)a4 bundleIdentifier:(id)a5 scaleFactor:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBSavedSnapshotDataProvider;
  v14 = -[PBSavedSnapshotDataProvider init](&v23, "init");
  if (v14)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___XBSnapshotDataProviderContext);
    [v11 imageScale];
    -[XBSnapshotDataProviderContext setScale:](v15, "setScale:");
    -[XBSnapshotDataProviderContext setOpaque:](v15, "setOpaque:", 0LL);
    context = v14->_context;
    v14->_context = v15;
    v17 = v15;

    v18 = (NSString *)[v12 copy];
    sceneID = v14->_sceneID;
    v14->_sceneID = v18;

    v20 = (NSString *)[v13 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = v20;

    objc_storeStrong((id *)&v14->_predicate, a3);
    v14->_scaleFactor = a6;
  }

  return v14;
}

- (id)fetchImage
{
  v2 = self;
  objc_sync_enter(v2);
  cachedImage = v2->_cachedImage;
  if (cachedImage)
  {
LABEL_21:
    v41 = cachedImage;
    goto LABEL_22;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 installedApplicationWithBundleIdentifier:v2->_bundleIdentifier]);

  if (v5)
  {
    v6 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]( objc_alloc(&OBJC_CLASS___XBApplicationSnapshotManifest),  "initWithApplicationInfo:",  v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[XBApplicationSnapshotManifest snapshotsForGroupID:matchingPredicate:]( v6,  "snapshotsForGroupID:matchingPredicate:",  v2->_sceneID,  v2->_predicate));
    id v8 = sub_100083F78();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v7 count];
      CGFloat v12 = *(double *)&v2->_predicate;
      sceneID = v2->_sceneID;
      LODWORD(buf.a) = 134218754;
      *(void *)((char *)&buf.a + 4) = v10;
      WORD2(buf.b) = 2114;
      *(void *)((char *)&buf.b + 6) = sceneID;
      HIWORD(buf.c) = 2114;
      buf.d = v12;
      LOWORD(buf.tx) = 2112;
      *(void *)((char *)&buf.tx + 2) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Found %ld snapshots for sceneID: %{public}@ predicate: %{public}@ - %@",  (uint8_t *)&buf,  0x2Au);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    v14 = v13;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
      if ([v15 length]
        && (v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15))) != 0LL)
      {
        v53[0] = kCGImageComponentTypeRequest;
        v53[1] = kCGImageSourceShouldCache;
        v54[0] = &off_1003FE058;
        v54[1] = &__kCFBooleanFalse;
        v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  2LL));
        cf = CGImageSourceCreateWithURL(v16, v17);
        if (cf)
        {
          CGAffineTransformMakeScale(&buf, v2->_scaleFactor, v2->_scaleFactor);
          [v14 contentFrame];
          CGAffineTransform v49 = buf;
          CGRect v56 = CGRectApplyAffineTransform(v55, &v49);
          double x = v56.origin.x;
          double y = v56.origin.y;
          double width = v56.size.width;
          double height = v56.size.height;
          id v22 = [0 scale];
          double v24 = UIRectIntegralWithScale(v22, x, y, width, height, v23);
          double v26 = v25;
          double v28 = v27;
          v50[0] = kCGImageSourceThumbnailMaxPixelSize;
          objc_msgSend(v14, "imageScale", v24);
          if (v26 >= v28) {
            double v30 = v26;
          }
          else {
            double v30 = v28;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v30 * v29));
          v50[1] = kCGImageSourceCreateThumbnailFromImageAlways;
          v51[0] = v31;
          v51[1] = &__kCFBooleanTrue;
          v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  2LL));

          ThumbnailAtIndedouble x = CGImageSourceCreateThumbnailAtIndex(cf, 0LL, v47);
          v33 = objc_alloc(&OBJC_CLASS___UIImage);
          -[XBSnapshotDataProviderContext scale](v2->_context, "scale");
          v34 = -[UIImage initWithCGImage:scale:orientation:]( v33,  "initWithCGImage:scale:orientation:",  ThumbnailAtIndex,  0LL);
          v35 = v2->_cachedImage;
          v2->_cachedImage = v34;

          CGImageRelease(ThumbnailAtIndex);
          CFRelease(cf);
        }
      }

      else
      {
        id v42 = sub_100083F78();
        v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v43 = v2->_sceneID;
          LODWORD(buf.a) = 138543874;
          *(void *)((char *)&buf.a + 4) = v15;
          WORD2(buf.b) = 2114;
          *(void *)((char *)&buf.b + 6) = v43;
          HIWORD(buf.c) = 2112;
          *(void *)&buf.d = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "No URL for snapshot with path: %{public}@ sceneID: %{public}@ snapshot: %@",  (uint8_t *)&buf,  0x20u);
        }

        v16 = 0LL;
      }

      snapshot = v2->_snapshot;
      v2->_snapshot = 0LL;

      context = v2->_context;
      v2->_context = 0LL;
    }

    cachedImage = v2->_cachedImage;
    goto LABEL_21;
  }

  id v36 = sub_100083F78();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = v2->_bundleIdentifier;
    LODWORD(buf.a) = 136315394;
    *(void *)((char *)&buf.a + 4) = "-[PBSavedSnapshotDataProvider fetchImage]";
    WORD2(buf.b) = 2112;
    *(void *)((char *)&buf.b + 6) = bundleIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%s skip snapshot creation for uninstalled %@",  (uint8_t *)&buf,  0x16u);
  }

  v39 = v2->_snapshot;
  v2->_snapshot = 0LL;

  v40 = v2->_context;
  v2->_context = 0LL;

  v41 = 0LL;
LABEL_22:
  objc_sync_exit(v2);

  return v41;
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

- (XBApplicationSnapshot)snapshot
{
  return self->_snapshot;
}

- (XBApplicationSnapshotPredicate)predicate
{
  return self->_predicate;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void).cxx_destruct
{
}

@end