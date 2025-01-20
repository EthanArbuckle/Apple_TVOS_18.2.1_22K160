@interface RPVideoEditorExtensionViewController
- (BOOL)isInternalTestMode;
- (NSString)appName;
- (NSString)bundleIdentifier;
- (NSString)overrideShareMessage;
- (NSURL)fileAttachmentURL;
- (NSURL)movieURL;
- (OS_dispatch_queue)replyQueue;
- (RPVideoEditorViewController)videoEditorViewController;
- (UIColor)overrideTintColor;
- (int64_t)mode;
- (void)doAction:(id)a3;
- (void)inputItemsFromClientWithCompletionHandler:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFileAttachmentURL:(id)a3;
- (void)setIsInternalTestMode:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setMovieURL:(id)a3;
- (void)setOverrideShareMessage:(id)a3;
- (void)setOverrideTintColor:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setVideoEditorViewController:(id)a3;
- (void)setupChildViewControllers;
- (void)setupVideoEditorController;
- (void)tearDownChildViewControllers;
- (void)videoEditor:(id)a3 didFinishWithActivityTypes:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RPVideoEditorExtensionViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPVideoEditorExtensionViewController;
  -[RPVideoEditorExtensionViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ReplayKit.RPVideoEditorExtension.replyQueue", 0LL);
  replyQueue = self->_replyQueue;
  self->_replyQueue = v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPVideoEditorExtensionViewController;
  -[RPVideoEditorExtensionViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPVideoEditorExtensionViewController;
  -[RPVideoEditorExtensionViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = -[RPVideoEditorExtensionViewControllerFocusView initWithFrame:]( objc_alloc(&OBJC_CLASS___RPVideoEditorExtensionViewControllerFocusView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorExtensionViewController view](self, "view"));
  [v5 addSubview:v4];

  -[RPVideoEditorExtensionViewControllerFocusView becomeFirstResponder](v4, "becomeFirstResponder");
  -[RPVideoEditorExtensionViewController setupChildViewControllers](self, "setupChildViewControllers");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPVideoEditorExtensionViewController;
  -[RPVideoEditorExtensionViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPVideoEditorExtensionViewController -viewDidDisappear:",  v4,  2u);
  }

  -[RPVideoEditorExtensionViewController tearDownChildViewControllers](self, "tearDownChildViewControllers");
}

- (void)setupChildViewControllers
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPVideoEditorExtensionViewController -setupChildViewControllers",  buf,  2u);
  }

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100005918;
  v3[3] = &unk_10000C488;
  v3[4] = self;
  -[RPVideoEditorExtensionViewController inputItemsFromClientWithCompletionHandler:]( self,  "inputItemsFromClientWithCompletionHandler:",  v3);
}

- (void)setupVideoEditorController
{
  objc_super v3 = -[RPVideoEditorViewController initWithBundleIdentifier:URL:applicationName:]( objc_alloc(&OBJC_CLASS___RPVideoEditorViewController),  "initWithBundleIdentifier:URL:applicationName:",  self->_bundleIdentifier,  self->_movieURL,  self->_appName);
  -[RPVideoEditorExtensionViewController setVideoEditorViewController:](self, "setVideoEditorViewController:", v3);

  -[RPVideoEditorViewController setFileAttachmentURL:]( self->_videoEditorViewController,  "setFileAttachmentURL:",  self->_fileAttachmentURL);
  -[RPVideoEditorViewController setOverrideShareMessage:]( self->_videoEditorViewController,  "setOverrideShareMessage:",  self->_overrideShareMessage);
  -[RPVideoEditorViewController setDelegate:](self->_videoEditorViewController, "setDelegate:", self);
  -[RPVideoEditorExtensionViewController addChildViewController:]( self,  "addChildViewController:",  self->_videoEditorViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorExtensionViewController view](self, "view"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorViewController view](self->_videoEditorViewController, "view"));
  [v4 addSubview:v5];

  -[RPVideoEditorViewController didMoveToParentViewController:]( self->_videoEditorViewController,  "didMoveToParentViewController:",  self);
}

- (void)tearDownChildViewControllers
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorViewController view](self->_videoEditorViewController, "view"));
  [v3 removeFromSuperview];

  -[RPVideoEditorViewController removeFromParentViewController]( self->_videoEditorViewController,  "removeFromParentViewController");
  -[RPVideoEditorExtensionViewController setVideoEditorViewController:](self, "setVideoEditorViewController:", 0LL);
}

- (void)inputItemsFromClientWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPVideoEditorExtensionViewController -inputItemsFromClientWithCompletionHandler:",  buf,  2u);
  }

  objc_super v5 = (id)kUTTypeData;
  *(void *)buf = 0LL;
  v41 = buf;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_100006288;
  v44 = sub_100006298;
  id v45 = 0LL;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x3032000000LL;
  v38[3] = sub_100006288;
  v38[4] = sub_100006298;
  id v39 = 0LL;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x3032000000LL;
  v36[3] = sub_100006288;
  v36[4] = sub_100006298;
  id v37 = 0LL;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = sub_100006288;
  v34[4] = sub_100006298;
  id v35 = 0LL;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_100006288;
  v32[4] = sub_100006298;
  id v33 = 0LL;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x3032000000LL;
  v30[3] = sub_100006288;
  v30[4] = sub_100006298;
  id v31 = 0LL;
  dispatch_group_t v6 = dispatch_group_create();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorExtensionViewController extensionContext](self, "extensionContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 inputItems]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000062A0;
  v21[3] = &unk_10000C4D8;
  v9 = v5;
  v22 = v9;
  v10 = v6;
  v23 = v10;
  v24 = buf;
  v25 = v38;
  v26 = v36;
  v27 = v34;
  v28 = v32;
  v29 = v30;
  [v8 enumerateObjectsUsingBlock:v21];

  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorExtensionViewController replyQueue](self, "replyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006614;
  block[3] = &unk_10000C500;
  id v14 = v4;
  v15 = v36;
  v16 = buf;
  v17 = v38;
  v18 = v34;
  v19 = v32;
  v20 = v30;
  id v12 = v4;
  dispatch_group_notify(v10, v11, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(buf, 8);
}

- (void)videoEditor:(id)a3 didFinishWithActivityTypes:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPVideoEditorExtensionViewController -videoEditorViewDidFinishWithActivityTypes:",  v8,  2u);
  }

  dispatch_group_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorExtensionViewController extensionContext](self, "extensionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 extensionObjectProxy]);
  [v7 extensionDidFinishWithActivityTypes:v5];
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)doAction:(id)a3
{
  id v4 = (NSString *)a3;
  if (-[RPVideoEditorExtensionViewController isInternalTestMode](self, "isInternalTestMode"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      dispatch_group_t v6 = "-[RPVideoEditorExtensionViewController doAction:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s",  (uint8_t *)&v5,  0xCu);
    }

    -[RPVideoEditorViewController performSelector:]( self->_videoEditorViewController,  "performSelector:",  NSSelectorFromString(v4));
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (RPVideoEditorViewController)videoEditorViewController
{
  return self->_videoEditorViewController;
}

- (void)setVideoEditorViewController:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (void)setMovieURL:(id)a3
{
}

- (NSURL)fileAttachmentURL
{
  return self->_fileAttachmentURL;
}

- (void)setFileAttachmentURL:(id)a3
{
}

- (NSString)overrideShareMessage
{
  return self->_overrideShareMessage;
}

- (void)setOverrideShareMessage:(id)a3
{
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (void)setOverrideTintColor:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (BOOL)isInternalTestMode
{
  return self->_isInternalTestMode;
}

- (void)setIsInternalTestMode:(BOOL)a3
{
  self->_isInternalTestMode = a3;
}

- (void).cxx_destruct
{
}

@end