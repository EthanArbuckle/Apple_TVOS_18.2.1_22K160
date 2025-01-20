@interface TVSettingsOSRestoreViewController
- (BOOL)cancelOnExit;
- (PBSAssetDownloadPriorityAssertion)downloadPriorityAssertion;
- (TVSUIOSUpdateView)progressView;
- (TVSettingsOSRestoreViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITapGestureRecognizer)menuRecognizer;
- (void)_menuButtonAction:(id)a3;
- (void)dealloc;
- (void)osUpdateServiceDidFinishApplyWithData:(id)a3;
- (void)osUpdateServiceDidFinishCheckWithData:(id)a3;
- (void)osUpdateServiceDidFinishDownloadWithData:(id)a3;
- (void)osUpdateServiceDidStartApplyWithData:(id)a3;
- (void)osUpdateServiceDidStartCheckWithData:(id)a3;
- (void)osUpdateServiceDidStartDownloadWithData:(id)a3;
- (void)osUpdateServiceDidUpdateDownloadProgressWithData:(id)a3;
- (void)setCancelOnExit:(BOOL)a3;
- (void)setDownloadPriorityAssertion:(id)a3;
- (void)setMenuRecognizer:(id)a3;
- (void)setProgressView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsOSRestoreViewController

- (TVSettingsOSRestoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSettingsOSRestoreViewController;
  v4 = -[TVSettingsOSRestoreViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "_menuButtonAction:");
    menuRecognizer = v4->_menuRecognizer;
    v4->_menuRecognizer = v5;

    -[UITapGestureRecognizer setAllowedPressTypes:](v4->_menuRecognizer, "setAllowedPressTypes:", &off_1001AEBA8);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v4->_menuRecognizer, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[UITapGestureRecognizer setCancelsTouchesInView:](v4->_menuRecognizer, "setCancelsTouchesInView:", 1LL);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVSUIOSUpdateView viewForDownloadStep](&OBJC_CLASS___TVSUIOSUpdateView, "viewForDownloadStep"));
    progressView = v4->_progressView;
    v4->_progressView = (TVSUIOSUpdateView *)v7;

    -[TVSUIOSUpdateView setOpaque:](v4->_progressView, "setOpaque:", 1LL);
    v9 = v4->_progressView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[TVSUIOSUpdateView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[TVSUIOSUpdateView setContentMode:](v4->_progressView, "setContentMode:", 3LL);
    -[TVSettingsOSRestoreViewController setView:](v4, "setView:", v4->_progressView);
    v4->_cancelOnExit = 1;
    v11 = objc_alloc(&OBJC_CLASS___PBSAssetDownloadPriorityAssertion);
    v12 = (objc_class *)objc_opt_class(v4);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[PBSAssetDownloadPriorityAssertion initWithIdentifier:](v11, "initWithIdentifier:", v14);
    downloadPriorityAssertion = v4->_downloadPriorityAssertion;
    v4->_downloadPriorityAssertion = v15;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsOSRestoreViewController;
  -[TVSettingsOSRestoreViewController dealloc](&v3, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsOSRestoreViewController;
  -[TVSettingsOSRestoreViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSRestoreViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSRestoreViewController menuRecognizer](self, "menuRecognizer"));
  [v4 addGestureRecognizer:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
  [v6 setDelegate:self];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSRestoreViewController downloadPriorityAssertion](self, "downloadPriorityAssertion"));
  [v7 acquire];

  +[TVCSMetrics reportAction:](&OBJC_CLASS___TVCSMetrics, "reportAction:", 5LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 osUpdateServiceProxy]);
  [v9 restore];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsOSRestoreViewController;
  -[TVSettingsOSRestoreViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  if (-[TVSettingsOSRestoreViewController cancelOnExit](self, "cancelOnExit"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 osUpdateServiceProxy]);
    [v5 cancelUpdate];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
  [v6 setDelegate:0];
}

- (void)osUpdateServiceDidStartCheckWithData:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100032724;
  v3[3] = &unk_10018E440;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (void)osUpdateServiceDidFinishCheckWithData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000327CC;
  v5[3] = &unk_10018E468;
  id v6 = a3;
  objc_super v7 = self;
  id v4 = v6;
  TVSPerformBlockOnMainThread(v5);
}

- (void)osUpdateServiceDidStartDownloadWithData:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000328A8;
  v3[3] = &unk_10018E440;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (void)osUpdateServiceDidUpdateDownloadProgressWithData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100032950;
  v5[3] = &unk_10018E468;
  id v6 = a3;
  objc_super v7 = self;
  id v4 = v6;
  TVSPerformBlockOnMainThread(v5);
}

- (void)osUpdateServiceDidFinishDownloadWithData:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100032A64;
  v4[3] = &unk_10018E468;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  TVSPerformBlockOnMainThread(v4);
}

- (void)osUpdateServiceDidStartApplyWithData:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100032B44;
  v3[3] = &unk_10018E440;
  v3[4] = self;
  TVSPerformBlockOnMainThread(v3);
}

- (void)osUpdateServiceDidFinishApplyWithData:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100032C08;
  v5[3] = &unk_10018E468;
  id v6 = a3;
  objc_super v7 = self;
  id v4 = v6;
  TVSPerformBlockOnMainThread(v5);
}

- (void)_menuButtonAction:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsOSRestoreViewController menuRecognizer](self, "menuRecognizer"));

  if (v5 == v4)
  {
    objc_initWeak(&location, self);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"OSUpdateRestoreCancelText" value:&stru_100195DD8 table:0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v7,  1LL));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"OSUpdateRestoreCancelMenuItemContinue" value:&stru_100195DD8 table:0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  1LL,  0LL));

    [v8 addAction:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"OSUpdateRestoreCancelMenuItemCancel" value:&stru_100195DD8 table:0]);
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    objc_super v18 = sub_100032ECC;
    v19 = &unk_10018F4E8;
    objc_copyWeak(&v20, &location);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  &v16));

    objc_msgSend(v8, "addAction:", v14, v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSRestoreViewController navigationController](self, "navigationController"));
    [v15 presentViewController:v8 animated:1 completion:0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (TVSUIOSUpdateView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (BOOL)cancelOnExit
{
  return self->_cancelOnExit;
}

- (void)setCancelOnExit:(BOOL)a3
{
  self->_cancelOnExit = a3;
}

- (UITapGestureRecognizer)menuRecognizer
{
  return self->_menuRecognizer;
}

- (void)setMenuRecognizer:(id)a3
{
}

- (PBSAssetDownloadPriorityAssertion)downloadPriorityAssertion
{
  return self->_downloadPriorityAssertion;
}

- (void)setDownloadPriorityAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end