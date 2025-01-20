@interface PBHeadphoneBannerViewController
- (BOOL)providesHostedContent;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (PBHeadphoneBannerViewController)initWithRequest:(id)a3;
- (PBMediaPlayerView)mediaPlayerView;
- (PBSHeadphoneBannerRequest)request;
- (UIImageView)imageView;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setImageView:(id)a3;
- (void)setMediaPlayerView:(id)a3;
- (void)setRequest:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PBHeadphoneBannerViewController

- (PBHeadphoneBannerViewController)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBHeadphoneBannerViewController;
  v6 = -[PBHeadphoneBannerViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___PBHeadphoneBannerViewController;
  -[PBHeadphoneBannerViewController viewDidLoad](&v40, "viewDidLoad");
  unsigned int v3 = -[PBSHeadphoneBannerRequest isMovieAsset](self->_request, "isMovieAsset");
  id v4 = objc_alloc_init(&OBJC_CLASS___TVSPBannerPillContentViewConfiguration);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSHeadphoneBannerRequest assetPath](self->_request, "assetPath"));
  id v6 = [v5 length];

  double height = CGSizeZero.height;
  if (!v6)
  {
    TVSPBannerPillSizesMake(60.0, 60.0, CGSizeZero.width, height);
    TVSPBannerPillEdgeInsetsMake(objc_msgSend(v4, "setLeadingViewSizes:"), 12.0, 12.0, 0.0, 0.0);
    TVSPBannerPillEdgeInsetsMake(objc_msgSend(v4, "setLeadingViewEdgeInsets:"), 0.0, 40.0, 0.0, 40.0);
    objc_msgSend(v4, "setCenterContentEdgeInsets:");
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"speaker.bluetooth.fill"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v12,  2LL));
    v8 = (PBMediaPlayerView *)objc_claimAutoreleasedReturnValue([v11 imageWithConfiguration:v13]);

    objc_super v9 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v8);
    -[UIImageView setContentMode:](v9, "setContentMode:", 4LL);
LABEL_8:
    -[PBHeadphoneBannerViewController setImageView:](self, "setImageView:", v9);
    goto LABEL_9;
  }

  if (!v3)
  {
    TVSPBannerPillSizesMake(48.0, 48.0, CGSizeZero.width, height);
    TVSPBannerPillEdgeInsetsMake(objc_msgSend(v4, "setLeadingViewSizes:"), 16.0, 16.0, 0.0, 0.0);
    TVSPBannerPillEdgeInsetsMake(objc_msgSend(v4, "setLeadingViewEdgeInsets:"), 0.0, 40.0, 0.0, 40.0);
    objc_msgSend(v4, "setCenterContentEdgeInsets:");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBSHeadphoneBannerRequest assetPath](self->_request, "assetPath"));
    v8 = (PBMediaPlayerView *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithContentsOfFile:]( &OBJC_CLASS___UIImage,  "imageWithContentsOfFile:",  v14));

    objc_super v9 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v8);
    goto LABEL_8;
  }

  TVSPBannerPillSizesMake(56.0, 56.0, CGSizeZero.width, height);
  TVSPBannerPillEdgeInsetsMake(objc_msgSend(v4, "setLeadingViewSizes:"), 12.0, 12.0, 0.0, 0.0);
  TVSPBannerPillEdgeInsetsMake(objc_msgSend(v4, "setLeadingViewEdgeInsets:"), 0.0, 40.0, 0.0, 40.0);
  objc_msgSend(v4, "setCenterContentEdgeInsets:");
  v8 = objc_alloc_init(&OBJC_CLASS___PBMediaPlayerView);
  objc_super v9 = objc_alloc_init(&OBJC_CLASS___AVQueuePlayer);
  -[UIImageView setAllowsExternalPlayback:](v9, "setAllowsExternalPlayback:", 0LL);
  -[UIImageView setPreventsDisplaySleepDuringVideoPlayback:](v9, "setPreventsDisplaySleepDuringVideoPlayback:", 0LL);
  -[UIImageView _setDisallowsAutoPauseOnRouteRemovalIfNoAudio:]( v9,  "_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:",  1LL);
  -[PBMediaPlayerView setAvPlayer:](v8, "setAvPlayer:", v9);
  -[PBHeadphoneBannerViewController setMediaPlayerView:](self, "setMediaPlayerView:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSHeadphoneBannerRequest assetPath](self->_request, "assetPath"));
  if (v10) {
    -[PBMediaPlayerView loadMovieLoopWithPath:](self->_mediaPlayerView, "loadMovieLoopWithPath:", v10);
  }

LABEL_9:
  id v15 = objc_alloc(&OBJC_CLASS___TVSPBannerPillContentView);
  v16 = &OBJC_IVAR___PBHeadphoneBannerViewController__imageView;
  id v17 = [v15 initWithConfiguration:v4 leadingView:*(Class *)((char *)&self->super.super.super.isa + *v16) trailingView:0];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBSHeadphoneBannerRequest title](self->_request, "title"));
  [v17 setTitle:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBSHeadphoneBannerRequest subtitle](self->_request, "subtitle"));
  [v17 setSubtitle:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBHeadphoneBannerViewController view](self, "view"));
  [v20 addSubview:v17];

  [v17 layoutIfNeeded];
  [v17 frame];
  -[PBHeadphoneBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v21, 80.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v17 leadingAnchor]);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PBHeadphoneBannerViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v39 leadingAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v37]);
  v41[0] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v17 trailingAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBHeadphoneBannerViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v35 trailingAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
  v41[1] = v31;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v17 topAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBHeadphoneBannerViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 topAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v24]);
  v41[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v17 bottomAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBHeadphoneBannerViewController view](self, "view"));
  v32 = v4;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bottomAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v28]);
  v41[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v30);
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBHeadphoneBannerViewController;
  -[PBHeadphoneBannerViewController viewWillLayoutSubviews](&v6, "viewWillLayoutSubviews");
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  BOOL v4 = [v3 userInterfaceLayoutDirection] == (id)1;

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBHeadphoneBannerViewController traitOverrides](self, "traitOverrides"));
  [v5 setLayoutDirection:v4];
}

- (NSString)requestIdentifier
{
  return (NSString *)@"HeadphoneConnectionBanner";
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.PineBoard";
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (PBSHeadphoneBannerRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (PBMediaPlayerView)mediaPlayerView
{
  return self->_mediaPlayerView;
}

- (void)setMediaPlayerView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end