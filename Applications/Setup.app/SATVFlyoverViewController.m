@interface SATVFlyoverViewController
- (TVPVideoView)flyoverPreviewVideoView;
- (id)completionHandler;
- (id)consentButtonTextForConsentViewController:(id)a3;
- (id)dissentButtonTextForConsentViewController:(id)a3;
- (id)footnoteTextForConsentViewController:(id)a3;
- (id)subtitleTextForConsentViewController:(id)a3;
- (id)titleTextForConsentViewController:(id)a3;
- (void)_callCompletionWithEnableFlyover:(BOOL)a3;
- (void)_configureFlyoverVideo;
- (void)consentViewControllerDidSelectConsent:(id)a3;
- (void)consentViewControllerDidSelectDissent:(id)a3;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
- (void)setFlyoverPreviewVideoView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVFlyoverViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVFlyoverViewController;
  -[SATVFlyoverViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___SATVConsentViewController);
  -[SATVConsentViewController setDelegate:](v3, "setDelegate:", self);
  -[SATVConsentViewController setDataSource:](v3, "setDataSource:", self);
  -[SATVFlyoverViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVConsentViewController view](v3, "view"));
  [v4 addSubview:v5];

  -[SATVConsentViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
  -[SATVFlyoverViewController _configureFlyoverVideo](self, "_configureFlyoverVideo");
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVFlyoverViewController;
  -[SATVFlyoverViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVideoView player](self->_flyoverPreviewVideoView, "player"));
  [v4 play];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVFlyoverViewController;
  -[SATVFlyoverViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVideoView player](self->_flyoverPreviewVideoView, "player"));
  [v4 pause];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVideoView player](self->_flyoverPreviewVideoView, "player"));
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVFlyoverViewController;
  -[SATVFlyoverViewController dealloc](&v4, "dealloc");
}

- (id)titleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"FLYOVER_TITLE", @"Localizable");
}

- (id)subtitleTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"FLYOVER_SUBTITLE", @"Localizable");
}

- (id)consentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"FLYOVER_AGREE", @"Localizable");
}

- (id)dissentButtonTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"FLYOVER_DISAGREE", @"Localizable");
}

- (id)footnoteTextForConsentViewController:(id)a3
{
  return sub_10000D7CC(@"FLYOVER_FOOTNOTE", @"Localizable");
}

- (void)consentViewControllerDidSelectConsent:(id)a3
{
  id v4 = sub_10002AF94();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User wants to enable flyover", v6, 2u);
  }

  -[SATVFlyoverViewController _callCompletionWithEnableFlyover:](self, "_callCompletionWithEnableFlyover:", 1LL);
}

- (void)consentViewControllerDidSelectDissent:(id)a3
{
  id v4 = sub_10002AF94();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User does not want to enable flyover", v6, 2u);
  }

  -[SATVFlyoverViewController _callCompletionWithEnableFlyover:](self, "_callCompletionWithEnableFlyover:", 0LL);
}

- (void)_callCompletionWithEnableFlyover:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverViewController completionHandler](self, "completionHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue(-[SATVFlyoverViewController completionHandler](self, "completionHandler"));
    v6[2](v6, v3);
  }

- (void)_configureFlyoverVideo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverViewController flyoverPreviewVideoView](self, "flyoverPreviewVideoView"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ISUIResources defaultAerialURLWithOptions:]( &OBJC_CLASS___ISUIResources,  "defaultAerialURLWithOptions:",  2LL));
    if (v4)
    {
      id v23 = [[TVPURLMediaItem alloc] initWithURL:v4 traits:0];
      id v5 = objc_alloc_init(&OBJC_CLASS___TVPPlayer);
      [v5 setCurrentMediaItem:v23];
      [v5 setPreventsSleepDuringVideoPlayback:0];
      [v5 setUpdatesMediaRemoteInfoAutomatically:0];
      [v5 setPausesOnHDCPProtectionDown:0];
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);
      [v6 setRepeatMode:2];

      [v5 pause];
      v7 = objc_alloc_init(&OBJC_CLASS___TVPVideoView);
      v24 = v4;
      flyoverPreviewVideoView = self->_flyoverPreviewVideoView;
      self->_flyoverPreviewVideoView = v7;

      -[TVPVideoView setPlayer:](self->_flyoverPreviewVideoView, "setPlayer:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverViewController view](self, "view"));
      [v9 addSubview:self->_flyoverPreviewVideoView];

      -[TVPVideoView setTranslatesAutoresizingMaskIntoConstraints:]( self->_flyoverPreviewVideoView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVideoView widthAnchor](self->_flyoverPreviewVideoView, "widthAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToConstant:650.0]);
      v25[0] = v21;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVideoView heightAnchor](self->_flyoverPreviewVideoView, "heightAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToConstant:365.0]);
      v25[1] = v19;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVideoView centerYAnchor](self->_flyoverPreviewVideoView, "centerYAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 centerYAnchor]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v12]);
      v25[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPVideoView trailingAnchor](self->_flyoverPreviewVideoView, "trailingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlyoverViewController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 trailingAnchor]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16 constant:-150.0]);
      v25[3] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 4LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);

      id v4 = v24;
    }
  }

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (TVPVideoView)flyoverPreviewVideoView
{
  return self->_flyoverPreviewVideoView;
}

- (void)setFlyoverPreviewVideoView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end