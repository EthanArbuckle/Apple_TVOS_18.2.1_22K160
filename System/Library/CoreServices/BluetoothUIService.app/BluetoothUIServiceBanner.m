@interface BluetoothUIServiceBanner
+ (id)_bundleID;
- (BOOL)checkifVideoAssetExists;
- (BOOL)providesHostedContent;
- (BUISAgentXPCConnection)xpcCon;
- (BluetoothUIServiceBanner)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (id)removedAccessoryColorCode:(id)a3;
- (int)pid;
- (void)activateWithActionHandler:(id)a3;
- (void)createCustomAVPlayerLayerView;
- (void)createCustomStaticImageView;
- (void)dismissBanner;
- (void)handleBannerActionEvent:(int64_t)a3;
- (void)invalidate;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setBannerTimer;
- (void)setPid:(int)a3;
- (void)setXpcCon:(id)a3;
- (void)viewDidLoad;
@end

@implementation BluetoothUIServiceBanner

- (BluetoothUIServiceBanner)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___BluetoothUIServiceBanner;
  v7 = -[BluetoothUIServiceBanner initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  if (v7)
  {
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
    {
      if (CUXPCDecodeDouble(v6, "BUISKeyBannerTimeout", &v7->_bannerTimeoutInSeconds, a4)
        && CUXPCDecodeNSString(v6, "BUISKeyCCItemsIcon", &v7->_ccItemsIcon, a4)
        && CUXPCDecodeNSString(v6, "BUISKeyCCItemsText", &v7->_ccItemsText, a4)
        && CUXPCDecodeNSString(v6, "BUISKeyCCText", &v7->_ccText, a4)
        && CUXPCDecodeNSString(v6, "BUISKeyIdentifier", &v7->_identifier, a4)
        && CUXPCDecodeNSString(v6, "BUISKeyLAImageName", &v7->_leadingAccessoryIconName, a4))
      {
        uint64_t v13 = 0LL;
        int v8 = CUXPCDecodeUInt64RangedEx(v6, "BUISKeyLAProductID", 0LL, 0xFFFFFFFFLL, &v13, a4);
        if (v8 == 6)
        {
          v7->_productID = v13;
          goto LABEL_12;
        }

        if (v8 != 5)
        {
LABEL_12:
          if (dword_100011568 <= 50
            && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 50LL)))
          {
            LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner initWithXPCObject:error:]",  50LL,  "Post Banner: ccText: %@, ccItemsText: %@",  v7->_ccText,  v7->_ccItemsText);
          }

          if (-[BluetoothUIServiceBanner checkifVideoAssetExists](v7, "checkifVideoAssetExists")) {
            -[BluetoothUIServiceBanner createCustomAVPlayerLayerView](v7, "createCustomAVPlayerLayerView");
          }
          else {
            -[BluetoothUIServiceBanner createCustomStaticImageView](v7, "createCustomStaticImageView");
          }
          goto LABEL_19;
        }
      }
    }

    else if (a4)
    {
      uint64_t v11 = NSErrorF(NSOSStatusErrorDomain, 4294960540LL, "XPC non-dict");
      v9 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_20;
    }

    v9 = 0LL;
    goto LABEL_20;
  }

- (void)activateWithActionHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id actionHandler = self->_actionHandler;
  self->_id actionHandler = v4;

  id v6 = (OS_os_transaction *)os_transaction_create("BluetoothUIService");
  bannerTransaction = self->_bannerTransaction;
  self->_bannerTransaction = v6;

  v9 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___BluetoothUIServiceBanner, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:]( &OBJC_CLASS___BNBannerSource,  "bannerSourceForDestination:forRequesterIdentifier:",  0LL,  v11));

  id v13 = off_1000115D8();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v28[0] = v14;
  v29[0] = &off_10000C878;
  id v15 = off_1000115E0();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v28[1] = v16;
  v29[1] = &off_10000C890;
  id v17 = off_1000115E8();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v28[2] = v18;
  v29[2] = &__kCFBooleanTrue;
  id v19 = off_1000115F0();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v28[3] = v20;
  v29[3] = &__kCFBooleanTrue;
  id v21 = off_1000115F8();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v28[4] = v22;
  v29[4] = &off_10000C8A8;
  id v23 = off_100011600();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v28[5] = v24;
  v29[5] = &__kCFBooleanTrue;
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  6LL));

  id v27 = 0LL;
  [v12 postPresentable:self options:0 userInfo:v25 error:&v27];
  id v26 = v27;
  if (v26)
  {
    if (dword_100011568 <= 90
      && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 90LL)))
    {
      LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner activateWithActionHandler:]",  90LL,  "Failed to post banner with error %@",  v26);
    }
  }

  else
  {
    self->_bannerActive = 1;
  }
}

- (void)invalidate
{
  if (self->_bannerActive) {
    -[BluetoothUIServiceBanner dismissBanner](self, "dismissBanner");
  }
  bannerTimer = self->_bannerTimer;
  if (bannerTimer)
  {
    id v4 = bannerTimer;
    dispatch_source_cancel(v4);
    v5 = self->_bannerTimer;
    self->_bannerTimer = 0LL;
  }

  id actionHandler = self->_actionHandler;
  self->_id actionHandler = 0LL;

  self->_bannerActive = 0;
  self->_bannerTimeoutInSeconds = 0.0;
  ccText = self->_ccText;
  self->_ccText = 0LL;

  ccItemsIcon = self->_ccItemsIcon;
  self->_ccItemsIcon = 0LL;

  ccItemsText = self->_ccItemsText;
  self->_ccItemsText = 0LL;

  identifier = self->_identifier;
  self->_identifier = 0LL;

  self->_productID = 0;
  -[BTMediaPlayerView stop](self->_mediaPlayerView, "stop");
  mediaPlayerView = self->_mediaPlayerView;
  self->_mediaPlayerView = 0LL;
}

- (void)createCustomAVPlayerLayerView
{
  obj = objc_alloc_init(&OBJC_CLASS___BTMediaPlayerView);
  v3 = objc_alloc_init(&OBJC_CLASS___AVPlayer);
  -[AVPlayer setAllowsExternalPlayback:](v3, "setAllowsExternalPlayback:", 0LL);
  -[AVPlayer setPreventsDisplaySleepDuringVideoPlayback:](v3, "setPreventsDisplaySleepDuringVideoPlayback:", 0LL);
  -[AVPlayer _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:](v3, "_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:", 1LL);
  -[BTMediaPlayerView setAvPlayer:](obj, "setAvPlayer:", v3);
  objc_storeStrong((id *)&self->_mediaPlayerView, obj);
  -[BTMediaPlayerView setBackgroundColor:](self->_mediaPlayerView, "setBackgroundColor:", 0LL);
  if (-[BluetoothUIServiceBanner checkifVideoAssetExists](self, "checkifVideoAssetExists"))
  {
    id v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@",  self->_leadingAccessoryIconName);
    v5 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@-Loop", v4);
    id v6 = objc_alloc(&OBJC_CLASS___NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothUIServiceBanner removedAccessoryColorCode:]( self,  "removedAccessoryColorCode:",  self->_leadingAccessoryIconName));
    uint64_t v8 = -[NSString initWithFormat:](v6, "initWithFormat:", @"%@-mov", v7);

    v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathForResource:v5 ofType:@"mov" inDirectory:v8]);

    if (!v12)
    {
      v20 = v5;
      id v21 = v4;
      if (dword_100011568 <= 115
        && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 115LL)))
      {
        LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner createCustomAVPlayerLayerView]",  115LL,  "No movie path for accessory icon name: %@",  self->_leadingAccessoryIconName);
      }

      leadingAccessoryIconName = self->_leadingAccessoryIconName;
      self->_leadingAccessoryIconName = (NSString *)@"Banner-PID-8206";

      v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@",  self->_leadingAccessoryIconName);
      id v15 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@-Loop", v14);
      v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-mov",  self->_leadingAccessoryIconName);
      v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v17));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v19 pathForResource:v15 ofType:@"mov" inDirectory:v16]);

      v5 = v20;
      id v4 = v21;
    }

    -[BTMediaPlayerView loadMovieLoopWithPath:bannerInstance:]( self->_mediaPlayerView,  "loadMovieLoopWithPath:bannerInstance:",  v12,  self);
  }
}

- (void)createCustomStaticImageView
{
  v3 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  -[UIImageView setBackgroundColor:](v3, "setBackgroundColor:", 0LL);
  imageView = self->_imageView;
  self->_imageView = v3;
  v5 = v3;

  v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@",  self->_leadingAccessoryIconName);
  id v6 = objc_alloc(&OBJC_CLASS___NSString);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[BluetoothUIServiceBanner removedAccessoryColorCode:]( self,  "removedAccessoryColorCode:",  self->_leadingAccessoryIconName));
  uint64_t v8 = -[NSString initWithFormat:](v6, "initWithFormat:", @"%@", v7);

  v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathForResource:v14 ofType:@"png" inDirectory:v8]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](&OBJC_CLASS___UIImage, "imageWithContentsOfFile:", v12));
  -[UIImageView setImage:](self->_imageView, "setImage:", v13);
}

- (id)removedAccessoryColorCode:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"-"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  if ((unint64_t)[v7 length] <= 3)
  {
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    unsigned int v9 = [v8 containsString:@"default"];

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
      if ([v10 containsString:@"Case"])
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", (char *)objc_msgSend( v6,  "count") - 2));
        id v12 = [v11 length];

        if ((unint64_t)v12 <= 2)
        {
          objc_msgSend(v6, "removeObjectAtIndex:", (char *)objc_msgSend(v6, "count") - 2);
          id v13 = (id)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@"-"]);

          if (dword_100011568 <= 30
            && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 30LL)))
          {
            LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner removedAccessoryColorCode:]",  30LL,  "accessoryNameWithoutColorCode for Case: %@",  v13);
          }

          goto LABEL_17;
        }
      }

      else
      {
      }

      id v13 = v3;

      goto LABEL_17;
    }
  }

  [v6 removeLastObject];
  id v13 = (id)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@"-"]);

  if (dword_100011568 <= 30 && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 30LL))) {
    LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner removedAccessoryColorCode:]",  30LL,  "accessoryNameWithoutColorCode: %@",  v13);
  }
LABEL_17:

  return v13;
}

- (BOOL)checkifVideoAssetExists
{
  leadingAccessoryIconName = self->_leadingAccessoryIconName;
  if (leadingAccessoryIconName) {
    LOBYTE(leadingAccessoryIconName) = !-[NSString containsString:]( leadingAccessoryIconName,  "containsString:",  @"8197")
  }
                                    && !-[NSString containsString:]( self->_leadingAccessoryIconName,  "containsString:",  @"8205")
                                    && !-[NSString containsString:]( self->_leadingAccessoryIconName,  "containsString:",  @"8208")
                                    && !-[NSString containsString:]( self->_leadingAccessoryIconName,  "containsString:",  @"8218")
                                    && !-[NSString containsString:]( self->_leadingAccessoryIconName,  "containsString:",  @"8195");
  return (char)leadingAccessoryIconName;
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___BluetoothUIServiceBanner;
  -[BluetoothUIServiceBanner viewDidLoad](&v33, "viewDidLoad");
  id v3 = objc_alloc_init(off_100011608());
  off_100011858(56.0, 56.0, CGSizeZero.width, CGSizeZero.height);
  objc_msgSend(v3, "setLeadingViewSizes:");
  off_100011860(12.0, 12.0, 0.0, 0.0);
  objc_msgSend(v3, "setLeadingViewEdgeInsets:");
  off_100011860(0.0, 40.0, 0.0, 40.0);
  objc_msgSend(v3, "setCenterContentEdgeInsets:");
  id v4 = objc_alloc(off_100011610());
  mediaPlayerView = self->_mediaPlayerView;
  if (!mediaPlayerView) {
    mediaPlayerView = self->_imageView;
  }
  v32 = v3;
  id v6 = [v4 initWithConfiguration:v3 leadingView:mediaPlayerView trailingView:0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setTitle:self->_ccText];
  v7 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:self->_ccItemsText value:&stru_10000C7B8 table:0]);
  v31 = -[NSAttributedString initWithString:](v7, "initWithString:", v9);

  id v10 = off_100011868(v31);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v6 setAttributedSubtitle:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothUIServiceBanner view](self, "view"));
  [v12 addSubview:v6];

  [v6 layoutIfNeeded];
  [v6 frame];
  -[BluetoothUIServiceBanner setPreferredContentSize:](self, "setPreferredContentSize:", v13, 80.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v6 leadingAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothUIServiceBanner view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v30 leadingAnchor]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v28]);
  v34[0] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 trailingAnchor]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothUIServiceBanner view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v26 trailingAnchor]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v24]);
  v34[1] = v23;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 topAnchor]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothUIServiceBanner view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 topAnchor]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16]);
  v34[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 bottomAnchor]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothUIServiceBanner view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bottomAnchor]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v20]);
  v34[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v22);
}

- (void)dismissBanner
{
  if (self->_bannerActive)
  {
    id v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:]( &OBJC_CLASS___BNBannerSource,  "bannerSourceForDestination:forRequesterIdentifier:",  0LL,  v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothUIServiceBanner requestIdentifier](self, "requestIdentifier"));
    v20 = @"Key";
    unsigned int v9 = (objc_class *)objc_opt_class(self, v8);
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v21 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v19 = 0LL;
    [v6 revokePresentableWithRequestIdentifier:v7 animated:1 reason:@"_BUISScheduledTimeout" userInfo:v12 error:&v19];
    id v13 = v19;

    if (v13)
    {
      if (dword_100011568 <= 90
        && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 90LL)))
      {
        LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner dismissBanner]",  90LL,  "Error attempting to revoke request: %@",  v13);
      }
    }

    else
    {
      if (dword_100011568 <= 50
        && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 50LL)))
      {
        LogPrintF(&dword_100011568, "-[BluetoothUIServiceBanner dismissBanner]", 50LL, "Successfully dismissed banner");
      }

      self->_bannerActive = 0;
      bannerTransaction = self->_bannerTransaction;
      self->_bannerTransaction = 0LL;

      id actionHandler = self->_actionHandler;
      if (actionHandler)
      {
        id v16 = objc_retainBlock(actionHandler);
        uint64_t v17 = v16;
        if (v16) {
          (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 6LL, 0LL);
        }

        id v18 = self->_actionHandler;
        self->_id actionHandler = 0LL;
      }
    }
  }

- (void)setBannerTimer
{
  bannerTimer = self->_bannerTimer;
  if (bannerTimer)
  {
    id v4 = bannerTimer;
    dispatch_source_cancel(v4);
    v5 = self->_bannerTimer;
    self->_bannerTimer = 0LL;
  }

  id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  v7 = self->_bannerTimer;
  self->_bannerTimer = v6;
  uint64_t v8 = v6;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000078F8;
  handler[3] = &unk_10000C4D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet(self->_bannerTimer, 20.0, -1.0, -10.0);
  dispatch_activate((dispatch_object_t)self->_bannerTimer);
}

+ (id)_bundleID
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007A2C;
  block[3] = &unk_10000C4F0;
  block[4] = a1;
  if (qword_100011878 != -1) {
    dispatch_once(&qword_100011878, block);
  }
  return (id)qword_100011870;
}

- (NSString)requesterIdentifier
{
  v2 = (void *)objc_opt_class(self, a2);
  return (NSString *)[v2 _bundleID];
}

- (NSString)requestIdentifier
{
  if (!self->_requestIdentifier)
  {
    identifier = self->_identifier;
    if (identifier)
    {
      id v4 = identifier;
      requestIdentifier = self->_requestIdentifier;
      self->_requestIdentifier = v4;
    }

    else
    {
      requestIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString UUIDString](requestIdentifier, "UUIDString"));
      v7 = self->_requestIdentifier;
      self->_requestIdentifier = v6;
    }
  }

  if (dword_100011568 <= 50 && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 50LL))) {
    LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner requestIdentifier]",  50LL,  "_requestIdentifier %@",  self->_requestIdentifier);
  }
  return self->_requestIdentifier;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v5 = objc_retainBlock(self->_actionHandler);
  id v6 = v5;
  if (v5) {
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 2LL, 0LL);
  }

  bannerTransaction = self->_bannerTransaction;
  self->_bannerTransaction = 0LL;

  id actionHandler = self->_actionHandler;
  self->_id actionHandler = 0LL;

  self->_bannerActive = 0;
}

- (void)handleBannerActionEvent:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = objc_retainBlock(self->_actionHandler);
    id v5 = v4;
    if (v4) {
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1LL, 0LL);
    }

    bannerTransaction = self->_bannerTransaction;
    self->_bannerTransaction = 0LL;

    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0LL;

    self->_bannerActive = 0;
  }

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BUISAgentXPCConnection)xpcCon
{
  return self->_xpcCon;
}

- (void)setXpcCon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end