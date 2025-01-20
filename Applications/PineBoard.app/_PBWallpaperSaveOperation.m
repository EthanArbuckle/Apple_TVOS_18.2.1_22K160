@interface _PBWallpaperSaveOperation
- (_PBWallpaperSaveOperation)initWithVariant:(int64_t)a3 userInterfaceStyle:(int64_t)a4 imageProvider:(id)a5;
- (id)imageProvider;
- (id)saveCompletion;
- (int64_t)variant;
- (void)cancel;
- (void)main;
- (void)setSaveCompletion:(id)a3;
@end

@implementation _PBWallpaperSaveOperation

- (_PBWallpaperSaveOperation)initWithVariant:(int64_t)a3 userInterfaceStyle:(int64_t)a4 imageProvider:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____PBWallpaperSaveOperation;
  v9 = -[_PBWallpaperSaveOperation init](&v15, "init");
  if (v9)
  {
    id v10 = [v8 copy];
    targetUserInterfaceStyle = (void *)v9->super._targetUserInterfaceStyle;
    v9->super._targetUserInterfaceStyle = (int64_t)v10;

    v9->_imageProvider = (id)a3;
    v9->super.super._private = (id)a4;
    if (a3 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 traitCollection]);
      LOBYTE(v9->super.super._private1) = [v13 userInterfaceStyle] == (id)a4;
    }

    else
    {
      LOBYTE(v9->super.super._private1) = 0;
    }
  }

  return v9;
}

- (void)main
{
  id v3 = sub_100083F78();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);

  id v6 = sub_100083F78();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  unint64_t v9 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "SaveWallpaper",  "",  buf,  2u);
  }

  id v10 = sub_100083F78();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id imageProvider = self->_imageProvider;
    id v13 = self->super.super._private;
    *(_DWORD *)buf = 134218240;
    id v43 = imageProvider;
    __int16 v44 = 2048;
    id v45 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SaveWallpaper: Begin with variant:%lu style:%lu",  buf,  0x16u);
  }

  if ((-[_PBWallpaperSaveOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    id v14 = sub_100083F78();
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SaveWallpaper: Cancelled", buf, 2u);
    }

    id v16 = sub_100083F78();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  v5,  "SaveWallpaper.cancelled",  "",  buf,  2u);
    }

    goto LABEL_20;
  }

  uint64_t v19 = (*(uint64_t (**)(void))(self->super._targetUserInterfaceStyle + 16))();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper _wallpaperPathForVariant:userInterfaceStyle:]( &OBJC_CLASS___TVSUIWallpaper,  "_wallpaperPathForVariant:userInterfaceStyle:",  self->_imageProvider,  self->super.super._private));
  if (self->_imageProvider)
  {
    v38[0] = kCGImagePropertyASTCBlockSize;
    v38[1] = kCGImagePropertyEncoder;
    v39[0] = &off_1003FDAA0;
    v39[1] = kCGImagePropertyASTCEncoder;
    v38[2] = kCGImagePropertyASTCUseLZFSE;
    v38[3] = kCGImagePropertyASTCPreTwiddle;
    v39[2] = &__kCFBooleanFalse;
    v39[3] = &__kCFBooleanTrue;
    v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  4LL));
    Mutable = CFDataCreateMutable(0LL, 0LL);
    v24 = CGImageDestinationCreateWithData(Mutable, @"org.khronos.ktx", 1uLL, 0LL);
LABEL_16:
    CGImageDestinationAddImage(v24, (CGImageRef)[v20 CGImage], v22);
    CGImageDestinationFinalize(v24);
    CFRelease(v24);
    goto LABEL_17;
  }

  v40[0] = kCGImageDestinationLossyCompressionQuality;
  v40[1] = kCGImageDestinationUseHardwareAcceleration;
  v41[0] = &off_1003FEAE0;
  v41[1] = &__kCFBooleanTrue;
  v40[2] = kCGImageDestinationImageMaxPixelSize;
  v41[2] = &off_1003FEAF0;
  v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  3LL));
  Mutable = CFDataCreateMutable(0LL, 0LL);
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue([UTTypeJPEG identifier]);
  v24 = CGImageDestinationCreateWithData(Mutable, v25, 1uLL, 0LL);

  if (v24) {
    goto LABEL_16;
  }
LABEL_17:

  v26 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByDeletingLastPathComponent]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v27 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];

  -[__CFData writeToFile:atomically:](Mutable, "writeToFile:atomically:", v21, 1LL);
  id v28 = sub_100083F78();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v21;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SaveWallpaper: Written to path %@", buf, 0xCu);
  }

LABEL_20:
  targetUserInterfaceStyle = (void *)self->super._targetUserInterfaceStyle;
  self->super._targetUserInterfaceStyle = 0LL;

  CABackingStoreCollectBlocking();
  id v31 = sub_100083F78();
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "SaveWallpaper: End", buf, 2u);
  }

  id v33 = sub_100083F78();
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_END,  v5,  "SaveWallpaper",  "",  buf,  2u);
  }

  uint64_t v36 = *(void *)&self->super._shouldPerformASAP;
  if (v36)
  {
    (*(void (**)(uint64_t, void))(v36 + 16))(v36, 0LL);
    v37 = *(void **)&self->super._shouldPerformASAP;
    *(void *)&self->super._shouldPerformASAP = 0LL;
  }

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBWallpaperSaveOperation;
  -[_PBWallpaperSaveOperation cancel](&v6, "cancel");
  targetUserInterfaceStyle = (void *)self->super._targetUserInterfaceStyle;
  self->super._targetUserInterfaceStyle = 0LL;

  uint64_t v4 = *(void *)&self->super._shouldPerformASAP;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1LL);
    os_signpost_id_t v5 = *(void **)&self->super._shouldPerformASAP;
    *(void *)&self->super._shouldPerformASAP = 0LL;
  }

- (id)imageProvider
{
  return (id)self->super._targetUserInterfaceStyle;
}

- (id)saveCompletion
{
  return *(id *)&self->super._shouldPerformASAP;
}

- (void)setSaveCompletion:(id)a3
{
}

- (int64_t)variant
{
  return (int64_t)self->_imageProvider;
}

- (void).cxx_destruct
{
}

@end