@interface TVMNowPlayingView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)highContrastMode;
- (BOOL)isArtworkVisible;
- (BOOL)isLoadingBackground;
- (BOOL)isPlaylistVisible;
- (BOOL)isShuffleEnabled;
- (BOOL)nothingPlaying;
- (BOOL)repeatVisible;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)shuffleVisible;
- (BOOL)usingLagunaSingMode;
- (MPArtworkCatalog)backgroundArtwork;
- (TVMNowPlayingView)initWithFrame:(CGRect)a3;
- (TVMusicNowPlayingBackgroundContainerView)backgroundView;
- (TVMusicNowPlayingCollectionViewFlowLayout)collectionViewFlowLayout;
- (TVMusicNowPlayingViewDelegate)nowPlayingDelegate;
- (TVPMusicNowPlayingBackgroundProvider)backgroundProvider;
- (UICollectionView)playlistCollectionView;
- (UIImage)backgroundImage;
- (UIImage)placeholderImage;
- (UILayoutGuide)artworkLayoutGuide;
- (UITapGestureRecognizer)playPauseGestureRecognizer;
- (UIView)containerView;
- (UIView)controlsContainerView;
- (UIView)coverArtPlaceholder;
- (UIView)lyricsContainerView;
- (UIView)lyricsContentView;
- (UIViewPropertyAnimator)playlistAnimator;
- (_TVMScalablePlaceholderImage)scalablePlaceholderImage;
- (id)_addLabel;
- (id)_constraintsForLayout;
- (id)_routePickerTextColorForFocusState:(BOOL)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)repeatMode;
- (void)_layoutLyricsViews;
- (void)_playPausePressedGestureRecognized:(id)a3;
- (void)_setBackgroundAlpha;
- (void)_setupLagunaSingLyricsViewControl;
- (void)_setupLyricsViewControl;
- (void)_updateContrastMode:(BOOL)a3;
- (void)_updateForNothingPlayingState:(BOOL)a3;
- (void)_updatePlaceholderImage;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setArtworkVisible:(BOOL)a3;
- (void)setBackgroundArtwork:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundProvider:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCoverArtPlaceholder:(id)a3;
- (void)setFocusToDataView;
- (void)setHighContrastMode:(BOOL)a3;
- (void)setIsLoadingBackground:(BOOL)a3;
- (void)setNothingPlaying:(BOOL)a3;
- (void)setNowPlayingDelegate:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImage:(id)a3 imageColor:(id)a4 backgroundColor:(id)a5 relativeSize:(double)a6;
- (void)setPlaylistAnimator:(id)a3;
- (void)setPlaylistVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPlaylistVisible:(BOOL)a3 completion:(id)a4;
- (void)setRepeatMode:(int64_t)a3;
- (void)setRepeatVisible:(BOOL)a3;
- (void)setScalablePlaceholderImage:(id)a3;
- (void)setShuffleEnabled:(BOOL)a3;
- (void)setShuffleVisible:(BOOL)a3;
- (void)setUsingLagunaSingMode:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVMNowPlayingView

- (TVMNowPlayingView)initWithFrame:(CGRect)a3
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___TVMNowPlayingView;
  v3 = -[TVMNowPlayingView initWithFrame:]( &v54,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___TVMusicNowPlayingBackgroundContainerView);
    -[TVMNowPlayingView bounds](v3, "bounds");
    v5 = -[TVMusicNowPlayingBackgroundContainerView initWithFrame:](v4, "initWithFrame:");
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v5;

    -[TVMusicNowPlayingBackgroundContainerView setAutoresizingMask:](v3->_backgroundView, "setAutoresizingMask:", 18LL);
    -[TVMNowPlayingView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v7 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVMNowPlayingView bounds](v3, "bounds");
    v8 = -[UIView initWithFrame:](v7, "initWithFrame:");
    containerView = v3->_containerView;
    v3->_containerView = v8;

    -[UIView setLayoutMargins:]( v3->_containerView,  "setLayoutMargins:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
    -[UIView setAutoresizingMask:](v3->_containerView, "setAutoresizingMask:", 18LL);
    -[UIView setInsetsLayoutMarginsFromSafeArea:](v3->_containerView, "setInsetsLayoutMarginsFromSafeArea:", 0LL);
    -[UIView setPreservesSuperviewLayoutMargins:](v3->_containerView, "setPreservesSuperviewLayoutMargins:", 1LL);
    -[TVMNowPlayingView addSubview:](v3, "addSubview:", v3->_containerView);
    v10 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    artworkLayoutGuide = v3->_artworkLayoutGuide;
    v3->_artworkLayoutGuide = v10;

    -[UIView addLayoutGuide:](v3->_containerView, "addLayoutGuide:", v3->_artworkLayoutGuide);
    v12 = objc_alloc_init(&OBJC_CLASS____TVPMusicNowPlayingFocusableView);
    coverArtPlaceholder = v3->_coverArtPlaceholder;
    v3->_coverArtPlaceholder = &v12->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_coverArtPlaceholder,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_coverArtPlaceholder);
    -[TVMNowPlayingView setArtworkVisible:](v3, "setArtworkVisible:", 1LL);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView _addLabel](v3, "_addLabel"));
    nothingPlayingLabel = v3->_nothingPlayingLabel;
    v3->_nothingPlayingLabel = (UILabel *)v14;

    v16 = v3->_nothingPlayingLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor"));
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    v18 = v3->_nothingPlayingLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVPlayback"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"NowPlayingNothingPlaying" value:&stru_100279068 table:@"Localizable"]);
    -[UILabel setText:](v18, "setText:", v20);

    v21 = v3->_nothingPlayingLabel;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v21, "setFont:", v22);

    v53 = objc_alloc_init(&OBJC_CLASS___TVMusicNowPlayingCollectionViewFlowLayout);
    v23 = objc_alloc(&OBJC_CLASS____TtC7TVMusic31TVMusicNowPlayingCollectionView);
    -[UIView bounds](v3->_containerView, "bounds");
    v24 = -[TVMusicNowPlayingCollectionView initWithFrame:collectionViewLayout:]( v23,  "initWithFrame:collectionViewLayout:",  v53);
    -[TVMusicNowPlayingCollectionView setAlpha:](v24, "setAlpha:", 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVMusicNowPlayingCollectionView setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[TVMusicNowPlayingCollectionView setTranslatesAutoresizingMaskIntoConstraints:]( v24,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVMusicNowPlayingCollectionView setClipsToBounds:](v24, "setClipsToBounds:", 0LL);
    -[TVMusicNowPlayingCollectionView setContentInsetAdjustmentBehavior:]( v24,  "setContentInsetAdjustmentBehavior:",  2LL);
    -[UIView addSubview:](v3->_containerView, "addSubview:", v24);
    playlistCollectionView = v3->_playlistCollectionView;
    v3->_playlistCollectionView = &v24->super;
    v52 = v24;

    v27 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    collectionViewFocusGuide = v3->_collectionViewFocusGuide;
    v3->_collectionViewFocusGuide = v27;

    -[UIFocusGuide setIdentifier:](v3->_collectionViewFocusGuide, "setIdentifier:", @"collectionViewFocusGuide");
    v29 = v3->_collectionViewFocusGuide;
    v56 = v52;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
    -[UIFocusGuide setPreferredFocusEnvironments:](v29, "setPreferredFocusEnvironments:", v30);

    -[UIView addLayoutGuide:](v3->_containerView, "addLayoutGuide:", v3->_collectionViewFocusGuide);
    v31 = objc_alloc_init(&OBJC_CLASS___UIFocusContainerGuide);
    -[UIView addLayoutGuide:](v3->_containerView, "addLayoutGuide:", v31);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusContainerGuide leadingAnchor](v31, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](v3->_playlistCollectionView, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50]);
    v55[0] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusContainerGuide trailingAnchor](v31, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](v3->_playlistCollectionView, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
    v55[1] = v46;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusContainerGuide topAnchor](v31, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](v3->_playlistCollectionView, "topAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v33]);
    v55[2] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusContainerGuide bottomAnchor](v31, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](v3->_playlistCollectionView, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v36]);
    v55[3] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v38);

    -[TVMNowPlayingView _setupLyricsViewControl](v3, "_setupLyricsViewControl");
    v39 = v3->_containerView;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView _constraintsForLayout](v3, "_constraintsForLayout"));
    -[UIView addConstraints:](v39, "addConstraints:", v40);

    v41 = objc_alloc(&OBJC_CLASS___UIView);
    -[UIView bounds](v3->_containerView, "bounds");
    v42 = -[UIView initWithFrame:](v41, "initWithFrame:");
    controlsContainerView = v3->_controlsContainerView;
    v3->_controlsContainerView = v42;

    -[UIView setAutoresizingMask:](v3->_controlsContainerView, "setAutoresizingMask:", 18LL);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_controlsContainerView, "layer"));
    [v44 setZPosition:1.0];

    -[UIView addSubview:](v3->_containerView, "addSubview:", v3->_controlsContainerView);
    -[TVMNowPlayingView _updateForNothingPlayingState:](v3, "_updateForNothingPlayingState:", v3->_nothingPlaying);
  }

  return v3;
}

- (void)_setupLyricsViewControl
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  -[UIView bounds](self->_containerView, "bounds");
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
  lyricsContainerView = self->_lyricsContainerView;
  self->_lyricsContainerView = v4;

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_lyricsContainerView);
  v6 = objc_alloc_init(&OBJC_CLASS___UIView);
  lyricsContentView = self->_lyricsContentView;
  self->_lyricsContentView = v6;

  -[UIView addSubview:](self->_lyricsContainerView, "addSubview:", self->_lyricsContentView);
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    -[TVMNowPlayingView _setupLagunaSingLyricsViewControl](self, "_setupLagunaSingLyricsViewControl");
  }

  -[TVMNowPlayingView _layoutLyricsViews](self, "_layoutLyricsViews");
}

- (void)_setupLagunaSingLyricsViewControl
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView containerView](self, "containerView"));
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v12 = objc_alloc(&OBJC_CLASS___UIView);
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    v13 = -[UIView initWithFrame:](v12, "initWithFrame:", 0.0, 0.0, 960.0, CGRectGetHeight(v25));
    lagunaSingLyricsShadowView = self->_lagunaSingLyricsShadowView;
    self->_lagunaSingLyricsShadowView = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___CAGradientLayer);
    -[UIView bounds](self->_lagunaSingLyricsShadowView, "bounds");
    -[CAGradientLayer setFrame:](v15, "setFrame:");
    -[CAGradientLayer setLocations:](v15, "setLocations:", &off_1002820C0);
    -[CAGradientLayer setStartPoint:](v15, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v15, "setEndPoint:", 1.0, 0.5);
    id v16 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 CGColor]);

    id v18 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 CGColor]);

    v24[0] = v17;
    v24[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    -[CAGradientLayer setColors:](v15, "setColors:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_lagunaSingLyricsShadowView, "layer"));
    [v21 insertSublayer:v15 atIndex:0];

    -[UIView setUserInteractionEnabled:](self->_lagunaSingLyricsShadowView, "setUserInteractionEnabled:", 0LL);
    if (self->_usingLagunaSingMode) {
      double v22 = 1.0;
    }
    else {
      double v22 = 0.0;
    }
    -[UIView setAlpha:](self->_lagunaSingLyricsShadowView, "setAlpha:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView containerView](self, "containerView"));
    [v23 insertSubview:self->_lagunaSingLyricsShadowView atIndex:0];
  }

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMNowPlayingView;
  -[TVMNowPlayingView willMoveToWindow:](&v11, "willMoveToWindow:", v4);
  if (v4)
  {
    CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playPauseGestureRecognizer](self, "playPauseGestureRecognizer"));

    if (!v5)
    {
      double v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_playPausePressedGestureRecognized:");
      playPauseGestureRecognizer = self->_playPauseGestureRecognizer;
      self->_playPauseGestureRecognizer = v6;

      -[UITapGestureRecognizer setDelegate:](self->_playPauseGestureRecognizer, "setDelegate:", self);
      -[UITapGestureRecognizer setAllowedPressTypes:]( self->_playPauseGestureRecognizer,  "setAllowedPressTypes:",  &off_1002820D8);
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playPauseGestureRecognizer](self, "playPauseGestureRecognizer"));
    [v4 addGestureRecognizer:v8];
    goto LABEL_7;
  }

  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView window](self, "window"));

  if (v9)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView window](self, "window"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playPauseGestureRecognizer](self, "playPauseGestureRecognizer"));
    [v8 removeGestureRecognizer:v10];

LABEL_7:
  }
}

- (void)setNothingPlaying:(BOOL)a3
{
  if (self->_nothingPlaying != a3)
  {
    self->_nothingPlaying = a3;
    -[TVMNowPlayingView _updateForNothingPlayingState:](self, "_updateForNothingPlayingState:");
  }

- (void)_updateForNothingPlayingState:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    -[TVMNowPlayingView setBackgroundArtwork:](self, "setBackgroundArtwork:", 0LL);
    if (!self->_placeholderImageView)
    {
      CGFloat v5 = objc_alloc(&OBJC_CLASS___UIImageView);
      -[UIView bounds](self->_coverArtPlaceholder, "bounds");
      double v6 = -[UIImageView initWithFrame:](v5, "initWithFrame:");
      placeholderImageView = self->_placeholderImageView;
      self->_placeholderImageView = v6;

      -[UIImageView setAutoresizingMask:](self->_placeholderImageView, "setAutoresizingMask:", 18LL);
      -[UIImageView setContentMode:](self->_placeholderImageView, "setContentMode:", 2LL);
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_placeholderImageView, "layer"));
      [v8 setCornerRadius:12.0];

      CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_placeholderImageView, "layer"));
      [v9 setMasksToBounds:1];

      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_coverArtPlaceholder, "layer"));
      LODWORD(v11) = 1051931443;
      [v10 setShadowOpacity:v11];

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_coverArtPlaceholder, "layer"));
      objc_msgSend(v12, "setShadowOffset:", 0.0, 4.0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_coverArtPlaceholder, "layer"));
      [v13 setShadowRadius:8.0];

      -[UIView addSubview:](self->_coverArtPlaceholder, "addSubview:", self->_placeholderImageView);
      -[TVMNowPlayingView _updatePlaceholderImage](self, "_updatePlaceholderImage");
    }

    -[UILabel setAlpha:](self->_nothingPlayingLabel, "setAlpha:", 1.0);
    -[TVMNowPlayingView setBackgroundProvider:](self, "setBackgroundProvider:", 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView coverArtPlaceholder](self, "coverArtPlaceholder"));
    [v14 setHidden:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](self, "playlistCollectionView"));
    [v15 setHidden:1];

    id v16 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView controlsContainerView](self, "controlsContainerView"));
    -[UIImageView setHidden:](v16, "setHidden:", 1LL);
  }

  else
  {
    -[UILabel setAlpha:](self->_nothingPlayingLabel, "setAlpha:", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView coverArtPlaceholder](self, "coverArtPlaceholder"));
    [v17 setHidden:1];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](self, "playlistCollectionView"));
    [v18 setHidden:0];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView controlsContainerView](self, "controlsContainerView"));
    [v19 setHidden:0];

    -[UIImageView removeFromSuperview](self->_placeholderImageView, "removeFromSuperview");
    id v16 = self->_placeholderImageView;
    self->_placeholderImageView = 0LL;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView backgroundView](self, "backgroundView"));
  [v20 setBlurAllowed:!v3];

  -[TVMNowPlayingView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (void)_updatePlaceholderImage
{
  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView)
  {
    if (!self->_scalablePlaceholderImage)
    {
      -[UIImageView setImage:](placeholderImageView, "setImage:", 0LL);
      id v27 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView viewWithTag:](self->_placeholderImageView, "viewWithTag:", 1000LL));
      [v27 removeFromSuperview];
      goto LABEL_6;
    }

    -[_TVMScalablePlaceholderImage imageScale](self->_scalablePlaceholderImage, "imageScale");
    id v4 = self->_placeholderImageView;
    if (v5 == 0.0)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView viewWithTag:](v4, "viewWithTag:", 1000LL));
      [v6 removeFromSuperview];

      CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMScalablePlaceholderImage image](self->_scalablePlaceholderImage, "image"));
      -[UIImageView setImage:](self->_placeholderImageView, "setImage:", v7);

      id v27 = (id)objc_claimAutoreleasedReturnValue(-[_TVMScalablePlaceholderImage imageColor](self->_scalablePlaceholderImage, "imageColor"));
      -[UIImageView setTintColor:](self->_placeholderImageView, "setTintColor:");
LABEL_6:

      return;
    }

    -[UIImageView setImage:](v4, "setImage:", 0LL);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMScalablePlaceholderImage backgroundColor](self->_scalablePlaceholderImage, "backgroundColor"));
    -[UIImageView setBackgroundColor:](self->_placeholderImageView, "setBackgroundColor:", v8);

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[UIImageView viewWithTag:](self->_placeholderImageView, "viewWithTag:", 1000LL));
    if (v9)
    {
      double v10 = (UIImageView *)v9;
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMScalablePlaceholderImage image](self->_scalablePlaceholderImage, "image"));
      -[UIImageView setImage:](v10, "setImage:", v11);
    }

    else
    {
      v12 = objc_alloc(&OBJC_CLASS___UIImageView);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMScalablePlaceholderImage image](self->_scalablePlaceholderImage, "image"));
      double v10 = -[UIImageView initWithImage:](v12, "initWithImage:", v13);

      -[UIImageView setContentMode:](v10, "setContentMode:", 1LL);
      -[UIImageView setTag:](v10, "setTag:", 1000LL);
      -[UIImageView addSubview:](self->_placeholderImageView, "addSubview:", v10);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v10,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      id v28 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v10, "centerXAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_placeholderImageView, "centerXAnchor"));
      CGRect v25 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v26]);
      v29[0] = v25;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v10, "centerYAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_placeholderImageView, "centerYAnchor"));
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23]);
      v29[1] = v22;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v10, "widthAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_placeholderImageView, "widthAnchor"));
      -[_TVMScalablePlaceholderImage imageScale](self->_scalablePlaceholderImage, "imageScale");
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v15));
      v29[2] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v10, "heightAnchor"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_placeholderImageView, "heightAnchor"));
      -[_TVMScalablePlaceholderImage imageScale](self->_scalablePlaceholderImage, "imageScale");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:multiplier:", v18));
      v29[3] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 4LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v20);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMScalablePlaceholderImage imageColor](self->_scalablePlaceholderImage, "imageColor"));
    -[UIImageView setTintColor:](v10, "setTintColor:", v21);
  }

- (void)setScalablePlaceholderImage:(id)a3
{
  double v5 = (_TVMScalablePlaceholderImage *)a3;
  if (self->_scalablePlaceholderImage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_scalablePlaceholderImage, a3);
    -[TVMNowPlayingView _updatePlaceholderImage](self, "_updatePlaceholderImage");
    double v5 = v6;
  }
}

- (void)setPlaceholderImage:(id)a3 imageColor:(id)a4 backgroundColor:(id)a5 relativeSize:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[_TVMScalablePlaceholderImage initWithImage:scale:imageColor:backgroundColor:]( objc_alloc(&OBJC_CLASS____TVMScalablePlaceholderImage),  "initWithImage:scale:imageColor:backgroundColor:",  v12,  v11,  v10,  a6);

  -[TVMNowPlayingView setScalablePlaceholderImage:](self, "setScalablePlaceholderImage:", v13);
}

- (void)setPlaceholderImage:(id)a3
{
}

- (UIImage)placeholderImage
{
  return -[_TVMScalablePlaceholderImage image](self->_scalablePlaceholderImage, "image");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    nothingPlayingLabel = self->_nothingPlayingLabel;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor"));
    -[UILabel setTextColor:](nothingPlayingLabel, "setTextColor:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](self, "playlistCollectionView"));
    [v10 reloadData];
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView traitCollection](self, "traitCollection"));
  -[TVMNowPlayingView _updateContrastMode:]( self,  "_updateContrastMode:",  [v11 accessibilityContrast] == (id)1);
}

- (void)_updateContrastMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[TVMNowPlayingView highContrastMode](self, "highContrastMode") != a3)
  {
    -[TVMNowPlayingView setHighContrastMode:](self, "setHighContrastMode:", v3);
    -[TVMNowPlayingView _setBackgroundAlpha](self, "_setBackgroundAlpha");
  }

- (void)_setBackgroundAlpha
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView backgroundProvider](self, "backgroundProvider"));
  id v4 = v3;
  if (v3
    && [v3 conformsToProtocol:&OBJC_PROTOCOL____TtP7TVMusic31TVMNowPlayingBackgroundProvider_])
  {
    if (-[TVMNowPlayingView highContrastMode](self, "highContrastMode"))
    {
      LODWORD(v5) = 1.0;
      [v4 setCustomBlackScrimAlpha:v5];
    }

    else
    {
      objc_initWeak(&location, self);
      backgroundArtwork = self->_backgroundArtwork;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100034660;
      v7[3] = &unk_10026A1B0;
      objc_copyWeak(&v8, &location);
      -[MPArtworkCatalog requestColorAnalysisWithAlgorithm:completion:]( backgroundArtwork,  "requestColorAnalysisWithAlgorithm:completion:",  1LL,  v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (TVMusicNowPlayingCollectionViewFlowLayout)collectionViewFlowLayout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](self, "playlistCollectionView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionViewLayout]);

  return (TVMusicNowPlayingCollectionViewFlowLayout *)v3;
}

- (id)_routePickerTextColorForFocusState:(BOOL)a3
{
  if (a3 && !-[TVMNowPlayingView _isNothingPlaying](self, "_isNothingPlaying")) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }
  else {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor"));
  }
  return v3;
}

- (id)_constraintsForLayout
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](self->_artworkLayoutGuide, "centerXAnchor"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToAnchor:v5]);
  [v3 addObject:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_artworkLayoutGuide, "widthAnchor"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 constraintEqualToConstant:522.0]);
  [v3 addObject:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_artworkLayoutGuide, "heightAnchor"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToConstant:522.0]);
  [v3 addObject:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_artworkLayoutGuide, "topAnchor"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12 constant:194.0]);
  [v3 addObject:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_nothingPlayingLabel, "firstBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_coverArtPlaceholder, "bottomAnchor"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15 constant:40.0]);
  [v3 addObject:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_nothingPlayingLabel, "centerXAnchor"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_coverArtPlaceholder, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
  [v3 addObject:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_coverArtPlaceholder, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](self->_artworkLayoutGuide, "centerXAnchor"));
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
  [v3 addObject:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_coverArtPlaceholder, "widthAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_artworkLayoutGuide, "widthAnchor"));
  CGRect v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24]);
  [v3 addObject:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_coverArtPlaceholder, "centerYAnchor"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_artworkLayoutGuide, "centerYAnchor"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27]);
  [v3 addObject:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_coverArtPlaceholder, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToConstant:522.0]);
  [v3 addObject:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView widthAnchor](self->_playlistCollectionView, "widthAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_containerView, "widthAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32]);
  [v3 addObject:v33];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView heightAnchor](self->_playlistCollectionView, "heightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToConstant:522.0 + 36.0]);
  [v3 addObject:v35];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView centerXAnchor](self->_playlistCollectionView, "centerXAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_containerView, "centerXAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37]);
  [v3 addObject:v38];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_playlistCollectionView, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_artworkLayoutGuide, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40]);
  [v3 addObject:v41];

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](self->_collectionViewFocusGuide, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_playlistCollectionView, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43]);
  [v3 addObject:v44];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](self->_collectionViewFocusGuide, "leftAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leftAnchor](self->_playlistCollectionView, "leftAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46]);
  [v3 addObject:v47];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](self->_collectionViewFocusGuide, "rightAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView rightAnchor](self->_playlistCollectionView, "rightAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v49]);
  [v3 addObject:v50];

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](self->_collectionViewFocusGuide, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_playlistCollectionView, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v52]);
  [v3 addObject:v53];

  id v54 = [v3 copy];
  return v54;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVMNowPlayingView;
  -[TVMNowPlayingView layoutSubviews](&v21, "layoutSubviews");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView window](self, "window"));
  id v4 = v3;
  if (v3)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 traitCollection]);
    id v6 = [v5 userInterfaceStyle];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView coverArtPlaceholder](self, "coverArtPlaceholder"));
    id v8 = [v7 overrideUserInterfaceStyle];

    if (v6 != v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView coverArtPlaceholder](self, "coverArtPlaceholder"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
      objc_msgSend(v9, "setOverrideUserInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView containerView](self, "containerView"));
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView lyricsContainerView](self, "lyricsContainerView"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[TVMNowPlayingView _layoutLyricsViews](self, "_layoutLyricsViews");
}

- (void)_layoutLyricsViews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (-[TVMNowPlayingView usingLagunaSingMode](self, "usingLagunaSingMode"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_nowPlayingDelegate);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained nowPlayingCurrentLyricsViewController:self]);

    if (v12) {
      [v12 lyricsContentFrame];
    }
    else {
      double v13 = 810.0;
    }
    double v4 = v4 + 50.0 - v13;
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView lyricsContentView](self, "lyricsContentView"));
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);
}

- (void)setUsingLagunaSingMode:(BOOL)a3
{
  self->_usingLagunaSingMode = a3;
  double v4 = 0.0;
  if (a3) {
    double v4 = 1.0;
  }
  -[UIView setAlpha:](self->_lagunaSingLyricsShadowView, "setAlpha:", v4);
  -[TVMNowPlayingView _layoutLyricsViews](self, "_layoutLyricsViews");
}

- (id)preferredFocusEnvironments
{
  lastFocusedView = self->_lastFocusedView;
  if (lastFocusedView
    && lastFocusedView != self->_coverArtPlaceholder
    && !-[UIView isDescendantOfView:](lastFocusedView, "isDescendantOfView:", self->_playlistCollectionView)
    && !self->_forceFocusToPlaylistView)
  {
    double v7 = self->_lastFocusedView;
    if (v7) {
      goto LABEL_13;
    }
LABEL_15:
    double v8 = &__NSArray0__struct;
    goto LABEL_16;
  }

  double v4 = self->_lyricsContentView;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](v4, "subviews"));
  if ([v5 count])
  {
    unsigned __int8 v6 = -[TVMNowPlayingView isPlaylistVisible](self, "isPlaylistVisible");

    if ((v6 & 1) == 0)
    {
      double v7 = v4;
      goto LABEL_12;
    }
  }

  else
  {
  }

  if (self->_forceFocusToPlaylistView) {
    double v7 = self->_playlistCollectionView;
  }
  else {
    double v7 = 0LL;
  }
LABEL_12:
  self->_forceFocusToPlaylistView = 0;

  if (!v7) {
    goto LABEL_15;
  }
LABEL_13:
  double v10 = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
LABEL_16:

  return v8;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nextFocusedView]);
  if ([v5 isDescendantOfView:self->_controlsContainerView])
  {
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 nextFocusedView]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 previouslyFocusedView]);

    if (v6 == v7)
    {
      BOOL v10 = 0;
      goto LABEL_6;
    }
  }

  double v8 = (UIView *)objc_claimAutoreleasedReturnValue([v4 nextFocusedView]);
  lastFocusedView = self->_lastFocusedView;
  self->_lastFocusedView = v8;

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMNowPlayingView;
  -[TVMNowPlayingView didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  double v7 = (UIView *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  if (v7 == self->_coverArtPlaceholder)
  {
    unsigned int v9 = -[TVMNowPlayingView _isNothingPlaying](self, "_isNothingPlaying");

    if (!v9) {
      goto LABEL_6;
    }
LABEL_5:
    -[TVMNowPlayingView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    goto LABEL_6;
  }

  double v8 = (TVMNowPlayingView *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
  if (v8 == self)
  {
    unsigned __int8 v10 = -[TVMNowPlayingView _isNothingPlaying](self, "_isNothingPlaying");

    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

LABEL_6:
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setPlaylistVisible:(BOOL)a3 completion:(id)a4
{
}

- (void)setPlaylistVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  unsigned int v9 = v8;
  if (self->_playlistVisible != v6)
  {
    self->_playlistVisible = v6;
    -[UIFocusGuide setEnabled:](self->_collectionViewFocusGuide, "setEnabled:", v6);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistAnimator](self, "playlistAnimator"));
    if (v12)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistAnimator](self, "playlistAnimator"));
      unsigned int v14 = [v13 isRunning];

      if (v14)
      {
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistAnimator](self, "playlistAnimator"));
        uint64_t v12 = 1LL;
        [v15 stopAnimation:1];

        double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistAnimator](self, "playlistAnimator"));
        [v16 finishAnimationAtPosition:2];

        -[TVMNowPlayingView setPlaylistAnimator:](self, "setPlaylistAnimator:", 0LL);
      }

      else
      {
        uint64_t v12 = 0LL;
      }
    }

    double v17 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    if (v6)
    {
      double v18 = 0.32;
      if (!v5) {
        double v18 = 0.0;
      }
      objc_super v11 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v17,  "initWithDuration:curve:animations:",  2LL,  &stru_10026A1D0,  v18);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1000356E0;
      v31[3] = &unk_100268CF0;
      v31[4] = self;
      -[UIViewPropertyAnimator addAnimations:](v11, "addAnimations:", v31);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100035714;
      v29[3] = &unk_10026A1F8;
      void v29[4] = self;
      v30 = v9;
      -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", v29);
      -[TVMNowPlayingView setPlaylistAnimator:](self, "setPlaylistAnimator:", v11);
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView nowPlayingDelegate](self, "nowPlayingDelegate"));
      [v19 nowPlayingView:self playlistWillBecomeVisibleWithAnimator:v11 interruptingTransition:v12];

      -[UIViewPropertyAnimator tvm_scheduleFinishAnimationIfNeeded](v11, "tvm_scheduleFinishAnimationIfNeeded");
      v20 = v30;
    }

    else
    {
      double v21 = 0.35;
      if (!v5) {
        double v21 = 0.0;
      }
      double v22 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v17,  "initWithDuration:curve:animations:",  0LL,  &stru_10026A218,  v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView nowPlayingDelegate](self, "nowPlayingDelegate"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1000357B4;
      v26[3] = &unk_100268BE8;
      v26[4] = self;
      id v27 = v22;
      id v28 = v9;
      objc_super v11 = v22;
      [v23 nowPlayingView:self playlistWillBecomeHiddenWithAnimator:v11 executionBlock:v26];

      v20 = v27;
    }

    goto LABEL_16;
  }

  if (v8)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    void v24[2] = sub_100035924;
    v24[3] = &unk_100268D60;
    CGRect v25 = (UIViewPropertyAnimator *)v8;
    unsigned __int8 v10 = v24;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100036598;
    block[3] = &unk_100268D60;
    id v33 = v10;
    dispatch_async(&_dispatch_main_q, block);

    objc_super v11 = v25;
LABEL_16:
  }
}

- (void)setArtworkVisible:(BOOL)a3
{
  self->_artworkVisible = a3;
  -[UIView setHidden:](self->_coverArtPlaceholder, "setHidden:", !a3);
  -[UIView setUserInteractionEnabled:](self->_coverArtPlaceholder, "setUserInteractionEnabled:", 0LL);
}

- (void)setFocusToDataView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](self, "playlistCollectionView"));
  unsigned __int8 v4 = objc_msgSend(v3, "tvm_isDescendentFocused");

  if ((v4 & 1) == 0)
  {
    lastFocusedView = self->_lastFocusedView;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](self, "playlistCollectionView"));
    LODWORD(lastFocusedView) = -[UIView isDescendantOfView:](lastFocusedView, "isDescendantOfView:", v6);

    if ((_DWORD)lastFocusedView)
    {
      self->_forceFocusToPlaylistView = 1;
    }

    else
    {
      double v7 = self->_lastFocusedView;
      self->_lastFocusedView = 0LL;
    }

    -[TVMNowPlayingView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[TVMNowPlayingView updateFocusIfNeeded](self, "updateFocusIfNeeded");
  }

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](self, "playlistCollectionView"));
  if (v4
    && (id v6 = [v4 section], (uint64_t)v6 < (uint64_t)objc_msgSend(v5, "numberOfSections"))
    && (id v7 = [v4 item],
        (uint64_t)v7 < (uint64_t)objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v4, "section"))))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 layoutAttributesForItemAtIndexPath:v4]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playPauseGestureRecognizer](self, "playPauseGestureRecognizer"));

  if (v5 != v4) {
    return 1;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView nowPlayingDelegate](self, "nowPlayingDelegate"));
  unsigned __int8 v8 = [v7 nowPlayingViewShouldHandlePressPlayPause:self];

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setBackgroundProvider:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView backgroundView](self, "backgroundView"));
  [v4 setBackgroundProvider:v6];

  if ((objc_opt_respondsToSelector(v6, "image") & 1) != 0
    && (objc_opt_respondsToSelector(v6, "setImage:") & 1) != 0
    && !-[TVMNowPlayingView isLoadingBackground](self, "isLoadingBackground"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView backgroundImage](self, "backgroundImage"));
    [v6 setImage:v5];
  }
}

- (TVPMusicNowPlayingBackgroundProvider)backgroundProvider
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView backgroundView](self, "backgroundView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundProvider]);

  return (TVPMusicNowPlayingBackgroundProvider *)v3;
}

- (void)setBackgroundArtwork:(id)a3
{
  id v5 = (MPArtworkCatalog *)a3;
  if (self->_backgroundArtwork != v5)
  {
    objc_storeStrong((id *)&self->_backgroundArtwork, a3);
    -[TVMNowPlayingView setBackgroundImage:](self, "setBackgroundImage:", 0LL);
    if (v5)
    {
      -[TVMNowPlayingView setIsLoadingBackground:](self, "setIsLoadingBackground:", 1LL);
      -[MPArtworkCatalog setFittingSize:](v5, "setFittingSize:", 522.0, 522.0);
      objc_initWeak(&location, self);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100035D98;
      v9[3] = &unk_10026A268;
      objc_copyWeak(&v11, &location);
      unsigned __int8 v10 = v5;
      -[MPArtworkCatalog requestImageWithCompletion:](v10, "requestImageWithCompletion:", v9);
      -[TVMNowPlayingView _setBackgroundAlpha](self, "_setBackgroundAlpha");

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView backgroundProvider](self, "backgroundProvider"));
      char v7 = objc_opt_respondsToSelector(v6, "setImage:");

      if ((v7 & 1) != 0)
      {
        unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView backgroundProvider](self, "backgroundProvider"));
        [v8 setImage:0];
      }
    }
  }
}

- (void)_playPausePressedGestureRecognized:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView nowPlayingDelegate](self, "nowPlayingDelegate", a3));
  [v4 nowPlayingViewDidPressPlayPause:self];
}

- (id)_addLabel
{
  double v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setTextAlignment:](v3, "setTextAlignment:", 1LL);
  -[UILabel setLineBreakMode:](v3, "setLineBreakMode:", 4LL);
  -[UIView addSubview:](self->_containerView, "addSubview:", v3);
  return v3;
}

- (TVMusicNowPlayingViewDelegate)nowPlayingDelegate
{
  return (TVMusicNowPlayingViewDelegate *)objc_loadWeakRetained((id *)&self->_nowPlayingDelegate);
}

- (void)setNowPlayingDelegate:(id)a3
{
}

- (UIView)lyricsContentView
{
  return self->_lyricsContentView;
}

- (UIView)lyricsContainerView
{
  return self->_lyricsContainerView;
}

- (BOOL)usingLagunaSingMode
{
  return self->_usingLagunaSingMode;
}

- (UIView)controlsContainerView
{
  return self->_controlsContainerView;
}

- (UILayoutGuide)artworkLayoutGuide
{
  return self->_artworkLayoutGuide;
}

- (BOOL)isArtworkVisible
{
  return self->_artworkVisible;
}

- (BOOL)isPlaylistVisible
{
  return self->_playlistVisible;
}

- (UICollectionView)playlistCollectionView
{
  return self->_playlistCollectionView;
}

- (BOOL)nothingPlaying
{
  return self->_nothingPlaying;
}

- (BOOL)repeatVisible
{
  return self->_repeatVisible;
}

- (void)setRepeatVisible:(BOOL)a3
{
  self->_repeatVisible = a3;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (void)setRepeatMode:(int64_t)a3
{
  self->_repeatMode = a3;
}

- (BOOL)shuffleVisible
{
  return self->_shuffleVisible;
}

- (void)setShuffleVisible:(BOOL)a3
{
  self->_shuffleVisible = a3;
}

- (BOOL)isShuffleEnabled
{
  return self->_shuffleEnabled;
}

- (void)setShuffleEnabled:(BOOL)a3
{
  self->_shuffleEnabled = a3;
}

- (MPArtworkCatalog)backgroundArtwork
{
  return self->_backgroundArtwork;
}

- (TVMusicNowPlayingBackgroundContainerView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (BOOL)isLoadingBackground
{
  return self->_isLoadingBackground;
}

- (void)setIsLoadingBackground:(BOOL)a3
{
  self->_isLoadingBackground = a3;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIView)coverArtPlaceholder
{
  return self->_coverArtPlaceholder;
}

- (void)setCoverArtPlaceholder:(id)a3
{
}

- (UITapGestureRecognizer)playPauseGestureRecognizer
{
  return self->_playPauseGestureRecognizer;
}

- (UIViewPropertyAnimator)playlistAnimator
{
  return self->_playlistAnimator;
}

- (void)setPlaylistAnimator:(id)a3
{
}

- (_TVMScalablePlaceholderImage)scalablePlaceholderImage
{
  return self->_scalablePlaceholderImage;
}

- (BOOL)highContrastMode
{
  return self->_highContrastMode;
}

- (void)setHighContrastMode:(BOOL)a3
{
  self->_highContrastMode = a3;
}

- (void).cxx_destruct
{
}

@end