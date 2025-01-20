@interface TVPhotosTopShelfViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (PHPhotoLibrary)photoLibrary;
- (TVPhotosTopShelfViewServiceViewController)init;
- (UIView)colorOverlayView;
- (UIViewController)movieViewController;
- (id)preferredFocusEnvironments;
- (void)_dismissWithResult:(id)a3;
- (void)_menuPressed:(id)a3;
- (void)dismissStoryViewController:(id)a3;
- (void)setColorOverlayView:(id)a3;
- (void)setMovieViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVPhotosTopShelfViewServiceViewController

- (TVPhotosTopShelfViewServiceViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVPhotosTopShelfViewServiceViewController;
  v2 = -[TVPhotosTopShelfViewServiceViewController init](&v8, "init");
  if (v2)
  {
    v3 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "sharedPhotoLibrary"));
    id v7 = 0LL;
    -[PHPhotoLibrary openAndWaitWithUpgrade:error:](v3, "openAndWaitWithUpgrade:error:", 0LL, &v7);
    id v4 = v7;
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = v3;
  }

  return v2;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVPhotosTopShelfViewServiceViewController;
  id v3 = -[TVPhotosTopShelfViewServiceViewController viewDidLoad](&v13, "viewDidLoad");
  uint64_t v4 = PLUIGetLog(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[TVPhotosTopShelfViewServiceViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[TVPhotosTopShelfViewService] %s", buf, 0xCu);
  }

  v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &off_1000D1C90);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController view](self, "view"));
  [v7 addGestureRecognizer:v6];

  objc_super v8 = objc_alloc(&OBJC_CLASS___UIView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController view](self, "view"));
  [v9 bounds];
  v10 = -[UIView initWithFrame:](v8, "initWithFrame:");
  colorOverlayView = self->_colorOverlayView;
  self->_colorOverlayView = v10;

  -[UIView setAutoresizingMask:](self->_colorOverlayView, "setAutoresizingMask:", 18LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->_colorOverlayView, "setBackgroundColor:", v12);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 delegate]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);
  [v7 setAccessibilityElementsHidden:1];

  uint64_t v9 = PLUIGetLog(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[TVPhotosTopShelfViewServiceViewController viewServiceBeginPresentationWithOptions:]";
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[TVPhotosTopShelfViewService] %s: %@",  buf,  0x16u);
  }

  v11 = (char *)objc_claimAutoreleasedReturnValue([v4 objectForKey:TVTopShelfPresentationOptionKeyItemIdentifier]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController photoLibrary](self, "photoLibrary"));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 librarySpecificFetchOptions]);

    [v13 setIncludePendingMemories:1];
    v37 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:localIdentifiers:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:localIdentifiers:options:",  4LL,  v14,  v13));

    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
  }

  else
  {
    v16 = 0LL;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController photoLibrary](self, "photoLibrary"));

  if (!v17)
  {
    uint64_t v28 = PLUIGetLog(v18);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v11;
      v30 = "[TVPhotosTopShelfViewService] did receive nil photoLibrary for memory request with identifier: %@";
      v31 = v29;
      os_log_type_t v32 = OS_LOG_TYPE_FAULT;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, buf, 0xCu);
    }

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 window]);
  [v8 setAccessibilityElementsHidden:0];

  uint64_t v10 = PLUIGetLog(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[TVPhotosTopShelfViewServiceViewController viewServiceEndPresentationWithOptions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[TVPhotosTopShelfViewService] %s", buf, 0xCu);
  }

  -[UIView setAlpha:](self->_colorOverlayView, "setAlpha:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController view](self, "view"));
  [v12 addSubview:self->_colorOverlayView];

  -[UIViewController willMoveToParentViewController:]( self->_movieViewController,  "willMoveToParentViewController:",  0LL);
  id v15 = v5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100065D14;
  v16[3] = &unk_1000C9528;
  v16[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100065D2C;
  v14[3] = &unk_1000CC2C0;
  v14[4] = self;
  id v13 = v5;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v16,  v14,  0.5);
}

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  uint64_t v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v6,  v8,  objc_opt_class(&OBJC_CLASS___NSString, v9),  0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v2 setClasses:v11 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v11 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (void)dismissStoryViewController:(id)a3
{
}

- (void)_menuPressed:(id)a3
{
  uint64_t v4 = PLUIGetLog(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[TVPhotosTopShelfViewServiceViewController _menuPressed:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[TVPhotosTopShelfViewService] %s",  (uint8_t *)&v6,  0xCu);
  }

  -[TVPhotosTopShelfViewServiceViewController _dismissWithResult:](self, "_dismissWithResult:", 0LL);
}

- (void)_dismissWithResult:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( -[TVPhotosTopShelfViewServiceViewController _remoteViewControllerProxy]( self,  "_remoteViewControllerProxy",  a3));
  [v3 dismissWithResult:0];
}

- (id)preferredFocusEnvironments
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController movieViewController](self, "movieViewController"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfViewServiceViewController movieViewController](self, "movieViewController"));
    uint64_t v9 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVPhotosTopShelfViewServiceViewController;
    id v6 = -[TVPhotosTopShelfViewServiceViewController preferredFocusEnvironments](&v8, "preferredFocusEnvironments");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v5;
}

- (UIViewController)movieViewController
{
  return self->_movieViewController;
}

- (void)setMovieViewController:(id)a3
{
}

- (UIView)colorOverlayView
{
  return self->_colorOverlayView;
}

- (void)setColorOverlayView:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
}

@end