@interface VSSPProductPageApplicationViewController
- (BOOL)playTrailer;
- (BOOL)userDriven;
- (UIViewController)productPageAppDocumentViewController;
- (VSSPContentItem)contentItem;
- (VSSPProductPageApplicationViewController)init;
- (VSSPProductPageApplicationViewController)initWithCoder:(id)a3;
- (VSSPProductPageApplicationViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5;
- (VSSPProductPageApplicationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSSPProductPageApplicationViewControllerDelegate)delegate;
- (id)_initialViewControllerWithAppContext:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlayTrailer:(BOOL)a3;
- (void)setProductPageAppDocumentViewController:(id)a3;
- (void)setUserDriven:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VSSPProductPageApplicationViewController

- (VSSPProductPageApplicationViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (VSSPProductPageApplicationViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (VSSPProductPageApplicationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (VSSPProductPageApplicationViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VSSPProductPageApplicationViewController;
  v10 = -[VSSPProductPageApplicationViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0LL, 0LL);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_contentItem, a3);
    v11->_userDriven = a4;
    v11->_playTrailer = a5;
  }

  return v11;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSPProductPageApplicationViewController;
  -[VSSPProductPageApplicationViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VUISettingsManager sharedInstance](&OBJC_CLASS___VUISettingsManager, "sharedInstance"));
  [v3 checkAndUpdateSettings];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageApplicationViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForVariant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForVariant:",  1LL));
  [v5 setAutoresizingMask:18];
  [v4 insertSubview:v5 atIndex:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VSSPProductPageApplicationViewController;
  -[VSSPProductPageApplicationViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance"));
  [v3 flushMetrics];
}

- (id)_initialViewControllerWithAppContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageApplicationViewController contentItem](self, "contentItem"));
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_5B6C;
  v37 = sub_5B7C;
  id v38 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageApplicationViewController contentItem](self, "contentItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tvAppURL]);

  if (v8)
  {
    id v9 = sub_6210();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
      *(_DWORD *)buf = 138412290;
      v40 = v11;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "VSSPProductPageApplicationViewController: Parsing URL %@",  buf,  0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[VUIInterfaceFactory sharedInstance](&OBJC_CLASS___VUIInterfaceFactory, "sharedInstance"));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 openURLHandler]);
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    v29 = sub_5B84;
    v30 = &unk_10620;
    v32 = &v33;
    v31 = v6;
    [v13 parseURL:v8 appContext:v4 completion:&v27];
  }

  else
  {
    dispatch_semaphore_signal(v6);
  }

  dispatch_time_t v14 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[VSSPProductPageApplicationViewController playTrailer](self, "playTrailer")) {
    [v15 setObject:VUIDocumentPrefetchDataSiriUIPluginName forKey:VUIDocumentPrefetchDataAppTypeName];
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchTerm", v27, v28, v29, v30));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 searchTerm]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 absoluteString]);

    [v15 setObject:v18 forKey:VUIDocumentPrefetchDataSearchTerm];
  }

  id v19 = sub_6210();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v15;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "PREFETCHED DATA:%@", buf, 0xCu);
  }

  if (v15)
  {
    v21 = (void *)v34[5];
    id v22 = [[VUIDocumentPreFetchedData alloc] initWithDictionary:v15];
    [v21 setPrefetchData:v22];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[VideosUISwiftExternal viewControllerWith:appContext:documentOptions:]( &OBJC_CLASS___VideosUISwiftExternal,  "viewControllerWith:appContext:documentOptions:",  v34[5],  v4,  0LL));
  if (!v23)
  {
    id v24 = sub_6210();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_B1D4(v25);
    }
  }

  -[VSSPProductPageApplicationViewController setProductPageAppDocumentViewController:]( self,  "setProductPageAppDocumentViewController:",  v23);

  _Block_object_dispose(&v33, 8);
  return v23;
}

- (VSSPProductPageApplicationViewControllerDelegate)delegate
{
  return (VSSPProductPageApplicationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)productPageAppDocumentViewController
{
  return self->_productPageAppDocumentViewController;
}

- (void)setProductPageAppDocumentViewController:(id)a3
{
}

- (VSSPContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
}

- (BOOL)userDriven
{
  return self->_userDriven;
}

- (void)setUserDriven:(BOOL)a3
{
  self->_userDriven = a3;
}

- (BOOL)playTrailer
{
  return self->_playTrailer;
}

- (void)setPlayTrailer:(BOOL)a3
{
  self->_playTrailer = a3;
}

- (void).cxx_destruct
{
}

@end