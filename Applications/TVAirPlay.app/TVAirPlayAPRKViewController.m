@interface TVAirPlayAPRKViewController
- (AVPlayerViewController)avPlayerViewController;
- (TVAirPlayAPRKVideoSession)videoSession;
- (TVAirPlayAPRKViewController)initWithVideoSession:(id)a3;
- (TVAirPlayAPRKViewControllerDelegate)delegate;
- (TVImageProxy)posterImageProxy;
- (UIWindow)focusStealingWindow;
- (id)playerViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4;
- (id)posterImageProxyForItem:(id)a3 withURLFormat:(id)a4;
- (void)_updateRequiresLinearPlayback;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)setAvPlayerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPosterImageProxy:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVAirPlayAPRKViewController

- (TVAirPlayAPRKViewController)initWithVideoSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKViewController;
  v6 = -[TVAirPlayAPRKViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_videoSession, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKViewController;
  -[TVAirPlayAPRKViewController viewDidLoad](&v23, "viewDidLoad");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKVideoSession videoView](self->_videoSession, "videoView"));
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = 0LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKVideoSession videoViewController](self->_videoSession, "videoViewController"));
    if (v5)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___AVPlayerViewController);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      {
        objc_storeStrong((id *)&self->_avPlayerViewController, v5);
        id v7 = v5;
        -[AVPlayerViewController setAllowsPictureInPicturePlayback:]( self->_avPlayerViewController,  "setAllowsPictureInPicturePlayback:",  1LL);
        -[AVPlayerViewController setDelegate:](self->_avPlayerViewController, "setDelegate:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_avPlayerViewController, "player"));
        [v8 addObserver:self forKeyPath:@"currentItem" options:5 context:off_10003F3E8];

        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_avPlayerViewController, "player"));
        [v9 addObserver:self forKeyPath:@"currentItem.restrictions" options:3 context:off_10003F3F0];
      }
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  }

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAPRKViewController view](self, "view"));
  if (v5) {
    -[TVAirPlayAPRKViewController addChildViewController:](self, "addChildViewController:", v5);
  }
  [v10 addSubview:v4];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 topAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  [v13 setActive:1];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 rightAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 rightAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
  [v16 setActive:1];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
  [v19 setActive:1];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 leftAnchor]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 leftAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
  [v22 setActive:1];

  if (v5) {
    [v5 didMoveToParentViewController:self];
  }
}

- (void)dealloc
{
  if (self->_focusStealingWindow)
  {
    id v3 = sub_100004250();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      focusStealingWindow = self->_focusStealingWindow;
      *(_DWORD *)buf = 134217984;
      v11 = focusStealingWindow;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing focus stealing window(%p)",  buf,  0xCu);
    }

    -[UIWindow setHidden:](self->_focusStealingWindow, "setHidden:", 1LL);
    uint64_t v6 = self->_focusStealingWindow;
    self->_focusStealingWindow = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_avPlayerViewController, "player"));
  [v7 removeObserver:self forKeyPath:@"currentItem" context:off_10003F3E8];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_avPlayerViewController, "player"));
  [v8 removeObserver:self forKeyPath:@"currentItem.restrictions" context:off_10003F3F0];

  -[TVImageProxy cancel](self->_posterImageProxy, "cancel");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKViewController;
  -[TVAirPlayAPRKViewController dealloc](&v9, "dealloc");
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4 = a3;
  p_focusStealingWindow = &self->_focusStealingWindow;
  -[UIWindow setHidden:](self->_focusStealingWindow, "setHidden:", 1LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 windowScene]);

  objc_super v9 = -[UIWindow initWithWindowScene:](objc_alloc(&OBJC_CLASS___UIWindow), "initWithWindowScene:", v8);
  objc_storeStrong((id *)p_focusStealingWindow, v9);
  -[UIWindow makeKeyAndVisible](*p_focusStealingWindow, "makeKeyAndVisible");
  id v10 = sub_100004250();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218240;
    id v13 = v4;
    __int16 v14 = 2048;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stealing focus away from AVPlayerViewController(%p, window = %p)",  (uint8_t *)&v12,  0x16u);
  }
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4 = a3;
  -[UIWindow setHidden:](self->_focusStealingWindow, "setHidden:", 1LL);
  focusStealingWindow = self->_focusStealingWindow;
  self->_focusStealingWindow = 0LL;

  id v6 = sub_100004250();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_focusStealingWindow;
    int v9 = 134218240;
    id v10 = v4;
    __int16 v11 = 2048;
    int v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Returning focus back to AVPlayerViewController(%p, window = %p)",  (uint8_t *)&v9,  0x16u);
  }
}

- (id)playerViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVMetadataItem identifierForKey:keySpace:]( &OBJC_CLASS___AVMetadataItem,  "identifierForKey:keySpace:",  AVMetadataQuickTimeMetadataKeyDisplayName,  AVMetadataKeySpaceQuickTimeMetadata));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 commonMetadata]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:]( &OBJC_CLASS___AVMetadataItem,  "metadataItemsFromArray:filteredByIdentifier:",  v6,  v5));

  if (![v7 count])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 extendedLanguageTag]);
    if ([v4 hasMediaCharacteristic:@"com.apple.amp.appletv.home-team-radio"])
    {
      if ([v9 isEqualToString:@"en"])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        __int16 v11 = v10;
        int v12 = @"HOME_RADIO_ENGLISH";
LABEL_17:
        v8 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v12 value:&stru_1000325D8 table:0]);

LABEL_19:
        goto LABEL_20;
      }

      if ([v9 isEqualToString:@"fr"])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        __int16 v11 = v10;
        int v12 = @"HOME_RADIO_FRENCH";
        goto LABEL_17;
      }

      if ([v9 isEqualToString:@"es"])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        __int16 v11 = v10;
        int v12 = @"HOME_RADIO_SPANISH";
        goto LABEL_17;
      }
    }

    else if ([v4 hasMediaCharacteristic:@"com.apple.amp.appletv.away-team-radio"])
    {
      if ([v9 isEqualToString:@"en"])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        __int16 v11 = v10;
        int v12 = @"AWAY_RADIO_ENGLISH";
        goto LABEL_17;
      }

      if ([v9 isEqualToString:@"fr"])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        __int16 v11 = v10;
        int v12 = @"AWAY_RADIO_FRENCH";
        goto LABEL_17;
      }

      if ([v9 isEqualToString:@"es"])
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        __int16 v11 = v10;
        int v12 = @"AWAY_RADIO_SPANISH";
        goto LABEL_17;
      }
    }

    v8 = 0LL;
    goto LABEL_19;
  }

  v8 = 0LL;
LABEL_20:

  return v8;
}

- (void)_updateRequiresLinearPlayback
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_avPlayerViewController, "player"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentItem]);
  unsigned __int16 v5 = (unsigned __int16)[v4 restrictions];

  -[AVPlayerViewController setRequiresLinearPlayback:]( self->_avPlayerViewController,  "setRequiresLinearPlayback:",  v5 != 0LL);
}

- (id)posterImageProxyForItem:(id)a3 withURLFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend( [TVURLDescription alloc],  "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:",  v7,  0,  @"jpeg",  195.0,  110.0,  0.0);
  int v9 = objc_alloc(&OBJC_CLASS___TVImageProxy);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVViewFactory imageURLWithDescription:](&OBJC_CLASS___TVViewFactory, "imageURLWithDescription:", v8));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
  int v12 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v9,  "initWithObject:imageLoader:groupType:",  v10,  v11,  0LL);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100017174;
  v15[3] = &unk_100031198;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  id v13 = v6;
  id v16 = v13;
  -[TVImageProxy setCompletionHandler:](v12, "setCompletionHandler:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10003F3E8 == a6)
  {
    -[TVAirPlayAPRKViewController _updatePosterArtwork](self, "_updatePosterArtwork");
  }

  else if (off_10003F3F0 == a6)
  {
    -[TVAirPlayAPRKViewController _updateRequiresLinearPlayback](self, "_updateRequiresLinearPlayback");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___TVAirPlayAPRKViewController;
    -[TVAirPlayAPRKViewController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (TVAirPlayAPRKVideoSession)videoSession
{
  return self->_videoSession;
}

- (TVAirPlayAPRKViewControllerDelegate)delegate
{
  return (TVAirPlayAPRKViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIWindow)focusStealingWindow
{
  return self->_focusStealingWindow;
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (void)setAvPlayerViewController:(id)a3
{
}

- (TVImageProxy)posterImageProxy
{
  return self->_posterImageProxy;
}

- (void)setPosterImageProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end