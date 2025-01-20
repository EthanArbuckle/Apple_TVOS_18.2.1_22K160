@interface PBSceneSnapshotDataProvider
- (FBSceneSnapshot)snapshot;
- (PBSceneSnapshotDataProvider)init;
- (PBSceneSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4;
- (UIImage)cachedImage;
- (XBSnapshotDataProviderContext)context;
- (double)scaleFactor;
- (id)fetchImage;
- (void)invalidateImage;
@end

@implementation PBSceneSnapshotDataProvider

- (PBSceneSnapshotDataProvider)init
{
  return 0LL;
}

- (PBSceneSnapshotDataProvider)initWithSceneSnapshot:(id)a3 scaleFactor:(double)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBSceneSnapshotDataProvider;
  v8 = -[PBSceneSnapshotDataProvider init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    v8->_scaleFactor = a4;
    objc_storeStrong((id *)&v8->_snapshot, a3);
    v10 = objc_alloc_init(&OBJC_CLASS___PBSceneSnapshotDataProviderContext);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sceneID]);
    -[PBSceneSnapshotDataProviderContext setSceneID:](v10, "setSceneID:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
    [v13 scale];
    -[PBSceneSnapshotDataProviderContext setScale:](v10, "setScale:");

    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
    -[PBSceneSnapshotDataProviderContext setOpaque:](v10, "setOpaque:", [v14 isOpaque]);

    context = v9->_context;
    v9->_context = (XBSnapshotDataProviderContext *)v10;
  }

  return v9;
}

- (id)fetchImage
{
  v2 = self;
  objc_sync_enter(v2);
  cachedImage = v2->_cachedImage;
  if (!cachedImage)
  {
    v4 = (__IOSurface *)-[FBSceneSnapshot IOSurface](v2->_snapshot, "IOSurface");
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneSnapshot context](v2->_snapshot, "context"));
      v6 = sub_100203228(v4, (BOOL)[v5 isOpaque], v2->_scaleFactor);
      uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = v2->_cachedImage;
      v2->_cachedImage = (UIImage *)v7;
    }

    else
    {
      id v13 = -[FBSceneSnapshot CGImage](v2->_snapshot, "CGImage");
      -[XBSnapshotDataProviderContext scale](v2->_context, "scale");
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[UIImage imageWithCGImage:scale:orientation:]( &OBJC_CLASS___UIImage,  "imageWithCGImage:scale:orientation:",  v13,  0LL));
      v15 = v2->_cachedImage;
      v2->_cachedImage = (UIImage *)v14;

      v16 = v2->_cachedImage;
      if (!v16) {
        goto LABEL_5;
      }
      double scaleFactor = v2->_scaleFactor;
      if (scaleFactor == 1.0) {
        goto LABEL_5;
      }
      CGAffineTransformMakeScale(&v39, scaleFactor, v2->_scaleFactor);
      -[UIImage size](v16, "size");
      CGFloat v19 = v18;
      -[UIImage size](v2->_cachedImage, "size");
      v40.size.double height = v20;
      CGAffineTransform v38 = v39;
      v40.origin.double x = 0.0;
      v40.origin.double y = 0.0;
      v40.size.double width = v19;
      CGRect v41 = CGRectApplyAffineTransform(v40, &v38);
      double x = v41.origin.x;
      double y = v41.origin.y;
      double width = v41.size.width;
      double height = v41.size.height;
      id v25 = -[XBSnapshotDataProviderContext scale](v2->_context, "scale");
      double v27 = UIRectIntegralWithScale(v25, x, y, width, height, v26);
      uint64_t v29 = v28;
      double v31 = v30;
      double v33 = v32;
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIGraphicsImageRendererFormat preferredFormat]( &OBJC_CLASS___UIGraphicsImageRendererFormat,  "preferredFormat"));
      objc_msgSend(v5, "setOpaque:", -[XBSnapshotDataProviderContext isOpaque](v2->_context, "isOpaque"));
      -[XBSnapshotDataProviderContext scale](v2->_context, "scale");
      objc_msgSend(v5, "setScale:");
      v34 = -[UIGraphicsImageRenderer initWithSize:format:]( objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer),  "initWithSize:format:",  v5,  v31,  v33);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10011A974;
      v37[3] = &unk_1003D8250;
      v37[4] = v2;
      *(double *)&v37[5] = v27;
      v37[6] = v29;
      *(double *)&v37[7] = v31;
      *(double *)&v37[8] = v33;
      uint64_t v35 = objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v34, "imageWithActions:", v37));
      v36 = v2->_cachedImage;
      v2->_cachedImage = (UIImage *)v35;
    }

LABEL_5:
    snapshot = v2->_snapshot;
    v2->_snapshot = 0LL;

    context = v2->_context;
    v2->_context = 0LL;

    cachedImage = v2->_cachedImage;
  }

  v11 = cachedImage;
  objc_sync_exit(v2);

  return v11;
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

- (FBSceneSnapshot)snapshot
{
  return self->_snapshot;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void).cxx_destruct
{
}

@end