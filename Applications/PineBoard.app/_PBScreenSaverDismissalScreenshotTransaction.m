@interface _PBScreenSaverDismissalScreenshotTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)shouldUpdateWallpaper;
- (FBSceneSnapshot)sceneSnapshot;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (_PBScreenSaverDismissalScreenshotTransaction)initWithScreenSaverViewController:(id)a3 sceneSnapshot:(id)a4 shouldUpdateWallpaper:(BOOL)a5;
- (void)_begin;
- (void)_didFinishWork;
- (void)dealloc;
@end

@implementation _PBScreenSaverDismissalScreenshotTransaction

- (_PBScreenSaverDismissalScreenshotTransaction)initWithScreenSaverViewController:(id)a3 sceneSnapshot:(id)a4 shouldUpdateWallpaper:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PBScreenSaverDismissalScreenshotTransaction;
  v11 = -[_PBScreenSaverDismissalScreenshotTransaction init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_screenSaverViewController, a3);
    objc_storeStrong((id *)&v12->_sceneSnapshot, a4);
    v12->_shouldUpdateWallpaper = a5;
  }

  return v12;
}

- (void)dealloc
{
  if (_BSIsInternalInstall("-[_PBScreenSaverDismissalScreenshotTransaction dealloc]", a2))
  {
    v3 = self->_snapshotPanicWatchdog;
    if (v3)
    {
      id v4 = sub_1001287C0();
      v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100128804;
      block[3] = &unk_1003CFF08;
      v8 = v3;
      dispatch_async(v5, block);
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBScreenSaverDismissalScreenshotTransaction;
  -[_PBScreenSaverDismissalScreenshotTransaction dealloc](&v6, "dealloc");
}

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (void)_begin
{
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS____PBScreenSaverDismissalScreenshotTransaction;
  -[_PBScreenSaverDismissalScreenshotTransaction _begin](&v53, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 windowForLayoutLevel:6]);

  id v5 = sub_100083D98();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

  id v8 = sub_100083D98();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  unint64_t v11 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "ScreenSaverSnapshot",  "",  buf,  2u);
  }

  if (_BSIsInternalInstall("-[_PBScreenSaverDismissalScreenshotTransaction _begin]", v12))
  {
    v13 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    id v14 = sub_1001287C0();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = -[BSWatchdog initWithTimeout:queue:completion:]( v13,  "initWithTimeout:queue:completion:",  v15,  &stru_1003D8770,  30.0);
    snapshotPanicWatchdog = self->_snapshotPanicWatchdog;
    self->_snapshotPanicWatchdog = v16;

    -[BSWatchdog start](self->_snapshotPanicWatchdog, "start");
  }

  id v18 = -[FBSceneSnapshot CGImage](self->_sceneSnapshot, "CGImage");
  if (!v18) {
    goto LABEL_11;
  }
  id v19 = v18;
  IOSurfaceID ID = IOSurfaceGetID((IOSurfaceRef)-[FBSceneSnapshot IOSurface](self->_sceneSnapshot, "IOSurface"));
  id v21 = sub_100083D98();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 67109120;
    IOSurfaceID v57 = ID;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_EVENT,  v7,  "ScreenSaverSnapshot.FBScene",  "surfaceID=0x%x",  buf,  8u);
  }

  v25 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](&OBJC_CLASS___UIImage, "imageWithCGImage:", v19));
  if (!v25)
  {
LABEL_11:
    v26 = (__IOSurface *)[v4 createIOSurface];
    if (v26)
    {
      v27 = v26;
      IOSurfaceID v28 = IOSurfaceGetID(v26);
      id v29 = sub_100083D98();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      v31 = v30;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 67109120;
        IOSurfaceID v57 = v28;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_EVENT,  v7,  "ScreenSaverSnapshot.UIWindow",  "surfaceID=0x%x",  buf,  8u);
      }

      uint64_t v54 = kCGImageComponentTypeRequest;
      v55 = &off_1003FDBC0;
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
      v33 = (CGImage *)CGImageCreateFromIOSurface(v27, v32);
      id v34 = sub_100083D98();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      v36 = v35;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_EVENT,  v7,  "ScreenSaverSnapshot.CGImageCreate",  "",  buf,  2u);
      }

      if (v33)
      {
        v37 = objc_alloc(&OBJC_CLASS___UIImage);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
        [v38 scale];
        v25 = -[UIImage initWithCGImage:scale:orientation:](v37, "initWithCGImage:scale:orientation:", v33, 0LL);

        CGImageRelease(v33);
      }

      else
      {
        v25 = 0LL;
      }

      CFRelease(v27);
    }

    else
    {
      v25 = 0LL;
    }
  }

  if (_BSIsInternalInstall("-[_PBScreenSaverDismissalScreenshotTransaction _begin]", v24))
  {
    v39 = self->_snapshotPanicWatchdog;
    if (v39)
    {
      id v40 = sub_1001287C0();
      v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v40);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100128E78;
      block[3] = &unk_1003CFF08;
      v52 = v39;
      dispatch_sync(v41, block);
    }

    v42 = self->_snapshotPanicWatchdog;
    self->_snapshotPanicWatchdog = 0LL;
  }

  if (!v25)
  {
    v43 = objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer);
    [v4 bounds];
    v44 = -[UIGraphicsImageRenderer initWithBounds:](v43, "initWithBounds:");
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_100128E90;
    v49[3] = &unk_1003D8798;
    id v50 = v4;
    v25 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v44, "imageWithActions:", v49));
  }

  id v45 = sub_100083D98();
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  v47 = v46;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v7,  "ScreenSaverSnapshot",  "",  buf,  2u);
  }

  if (self->_shouldUpdateWallpaper)
  {
    -[PBScreenSaverContentPresentingViewController screenSaverTransitionShowSnapshotImage:]( self->_screenSaverViewController,  "screenSaverTransitionShowSnapshotImage:",  v25);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[PBSnapshotService sharedInstance](&OBJC_CLASS___PBSnapshotService, "sharedInstance"));
    [v48 saveWallpaperForSnapshotImage:v25 completion:&stru_1003D87B8];
  }
}

- (void)_didFinishWork
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PBScreenSaverDismissalScreenshotTransaction;
  -[_PBScreenSaverDismissalScreenshotTransaction _didFinishWork](&v4, "_didFinishWork");
  sceneSnapshot = self->_sceneSnapshot;
  self->_sceneSnapshot = 0LL;
}

- (PBScreenSaverContentPresentingViewController)screenSaverViewController
{
  return self->_screenSaverViewController;
}

- (FBSceneSnapshot)sceneSnapshot
{
  return self->_sceneSnapshot;
}

- (BOOL)shouldUpdateWallpaper
{
  return self->_shouldUpdateWallpaper;
}

- (void).cxx_destruct
{
}

@end