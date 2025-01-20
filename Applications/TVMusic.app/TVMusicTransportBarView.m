@interface TVMusicTransportBarView
- (BOOL)alternateElapsedTimeAccessoryIsInScrubMode;
- (BOOL)isEnabled;
- (BOOL)isLive;
- (BOOL)shouldShowLoadingAccessory;
- (BOOL)shouldUseAlternateElapsedTimeAccessory;
- (CGRect)playerHeadFrame;
- (CGRect)playerHeadFrameForSize:(CGSize)a3;
- (CGSize)playerHeadSize;
- (NSString)bottomTitle;
- (NSString)elapsedTimeTitle;
- (NSString)leftEdgeTitle;
- (NSString)rightEdgeTitle;
- (TVMusicProgressBarView)progressBarView;
- (TVMusicTransportBarView)initWithFrame:(CGRect)a3;
- (TVMusicTransportBarView)initWithPlayer:(id)a3 frame:(CGRect)a4;
- (TVPTimeRange)bufferedRange;
- (UIColor)playerHeadColor;
- (UILabel)elapsedTimeLabel;
- (UILabel)leftEdgeLabel;
- (UILabel)rightEdgeLabel;
- (UIView)alternateElapsedTimeAccessory;
- (UIView)dimmingView;
- (UIView)labelContainer;
- (UIView)playerHead;
- (double)dimmingAlpha;
- (double)playbackProgress;
- (double)playbackStartLocation;
- (double)playerHeadAlpha;
- (double)presentedPlaybackProgress;
- (float)playerHeadShadowOpacity;
- (id)createProgressBarView;
- (id)timeFont;
- (int64_t)backwardAccessoryType;
- (int64_t)forwardAccessoryType;
- (void)_updateUserInteractionEnabled;
- (void)layoutSubviews;
- (void)setAlternateElapsedTimeAccessory:(id)a3;
- (void)setAlternateElapsedTimeAccessoryIsInScrubMode:(BOOL)a3;
- (void)setBackwardAccessoryType:(int64_t)a3;
- (void)setBottomTitle:(id)a3;
- (void)setBufferedRange:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setElapsedTimeLabel:(id)a3;
- (void)setElapsedTimeTitle:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setForwardAccessoryType:(int64_t)a3;
- (void)setInteractionMode:(int64_t)a3;
- (void)setIsLive:(BOOL)a3;
- (void)setLabelAlpha:(double)a3;
- (void)setLabelContainer:(id)a3;
- (void)setLeftEdgeLabel:(id)a3;
- (void)setLeftEdgeTitle:(id)a3;
- (void)setPlaybackProgress:(double)a3;
- (void)setPlaybackStartLocation:(double)a3;
- (void)setPlayerHead:(id)a3;
- (void)setPlayerHeadAlpha:(double)a3;
- (void)setPlayerHeadColor:(id)a3;
- (void)setPlayerHeadShadowOpacity:(float)a3;
- (void)setPlayerHeadSize:(CGSize)a3;
- (void)setProgressBarView:(id)a3;
- (void)setRightEdgeLabel:(id)a3;
- (void)setRightEdgeTitle:(id)a3;
- (void)setShouldShowLoadingAccessory:(BOOL)a3;
- (void)setShouldUseAlternateElapsedTimeAccessory:(BOOL)a3;
- (void)updateProgressBarPlayheadLocations;
@end

@implementation TVMusicTransportBarView

- (TVMusicTransportBarView)initWithFrame:(CGRect)a3
{
  return -[TVMusicTransportBarView initWithPlayer:frame:]( self,  "initWithPlayer:frame:",  0LL,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (TVMusicTransportBarView)initWithPlayer:(id)a3 frame:(CGRect)a4
{
  v110.receiver = self;
  v110.super_class = (Class)&OBJC_CLASS___TVMusicTransportBarView;
  v4 = -[TVMusicTransportBarView initWithFrame:]( &v110,  "initWithFrame:",  a3,  a4.origin.x,  a4.origin.y,  a4.size.width,  a4.size.height);
  v5 = v4;
  if (v4)
  {
    -[TVMusicTransportBarView setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 1LL);
    v5->_enabled = 1;
    v6 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVMusicTransportBarView bounds](v5, "bounds");
    v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    dimmingView = v5->_dimmingView;
    v5->_dimmingView = v7;

    -[UIView setAutoresizingMask:](v5->_dimmingView, "setAutoresizingMask:", 18LL);
    v9 = v5->_dimmingView;
    -[TVMusicTransportBarView dimmingAlpha](v5, "dimmingAlpha");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, v10));
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v11);

    -[TVMusicTransportBarView addSubview:](v5, "addSubview:", v5->_dimmingView);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView createProgressBarView](v5, "createProgressBarView"));
    progressBarView = v5->_progressBarView;
    v5->_progressBarView = (TVMusicProgressBarView *)v12;

    -[TVMusicProgressBarView setTranslatesAutoresizingMaskIntoConstraints:]( v5->_progressBarView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVMusicTransportBarView addSubview:](v5, "addSubview:", v5->_progressBarView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView leftAnchor](v5->_progressBarView, "leftAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 leftAnchor]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16]);
    [v17 setActive:1];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView rightAnchor](v5->_progressBarView, "rightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 rightAnchor]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v20]);
    [v21 setActive:1];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bottomAnchor]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView bottomAnchor](v5->_progressBarView, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24]);
    [v25 setActive:1];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView heightAnchor](v5->_progressBarView, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToConstant:14.0]);
    [v27 setActive:1];

    v28 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVMusicProgressBarView bounds](v5->_progressBarView, "bounds");
    v29 = -[UIView initWithFrame:](v28, "initWithFrame:");
    playerHeadContainer = v5->_playerHeadContainer;
    v5->_playerHeadContainer = v29;

    -[UIView setUserInteractionEnabled:](v5->_playerHeadContainer, "setUserInteractionEnabled:", 0LL);
    -[TVMusicTransportBarView addSubview:](v5, "addSubview:", v5->_playerHeadContainer);
    v31 = objc_alloc(&OBJC_CLASS___UIView);
    -[UIView bounds](v5->_playerHeadContainer, "bounds");
    v32 = -[UIView initWithFrame:](v31, "initWithFrame:");
    playerHeadMask = v5->_playerHeadMask;
    v5->_playerHeadMask = v32;

    v34 = v5->_playerHeadMask;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v34, "setBackgroundColor:", v35);

    -[UIView setMaskView:](v5->_playerHeadContainer, "setMaskView:", v5->_playerHeadMask);
    v36 = objc_alloc_init(&OBJC_CLASS___UIView);
    playerHead = v5->_playerHead;
    v5->_playerHead = v36;

    -[UIView setFrame:](v5->_playerHead, "setFrame:", CGPointZero.x, CGPointZero.y, 1.0, 14.0);
    -[UIView setOpaque:](v5->_playerHead, "setOpaque:", 0LL);
    v38 = v5->_playerHead;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v39);

    -[UIView setAlpha:](v5->_playerHead, "setAlpha:", 0.0);
    -[UIView addSubview:](v5->_playerHeadContainer, "addSubview:", v5->_playerHead);
    v40 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVMusicTransportBarView bounds](v5, "bounds");
    v41 = -[UIView initWithFrame:](v40, "initWithFrame:");
    -[UIView setAlpha:](v41, "setAlpha:", 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UIView setBackgroundColor:](v41, "setBackgroundColor:", v42);

    -[TVMusicTransportBarView addSubview:](v5, "addSubview:", v41);
    -[TVMusicTransportBarView setLabelContainer:](v5, "setLabelContainer:", v41);
    v43 = objc_alloc_init(&OBJC_CLASS___UILabel);
    leftEdgeLabel = v5->_leftEdgeLabel;
    v5->_leftEdgeLabel = v43;

    v45 = v5->_leftEdgeLabel;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView timeFont](v5, "timeFont"));
    -[UILabel setFont:](v45, "setFont:", v46);

    -[UILabel setOpaque:](v5->_leftEdgeLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v5->_leftEdgeLabel, "setBackgroundColor:", 0LL);
    v47 = v5->_leftEdgeLabel;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v47, "setTextColor:", v48);

    -[UILabel setTextAlignment:](v5->_leftEdgeLabel, "setTextAlignment:", 0LL);
    -[UIView addSubview:](v41, "addSubview:", v5->_leftEdgeLabel);
    v49 = objc_alloc_init(&OBJC_CLASS___UILabel);
    rightEdgeLabel = v5->_rightEdgeLabel;
    v5->_rightEdgeLabel = v49;

    v51 = v5->_rightEdgeLabel;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView timeFont](v5, "timeFont"));
    -[UILabel setFont:](v51, "setFont:", v52);

    v53 = v5->_rightEdgeLabel;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v53, "setTextColor:", v54);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v5->_rightEdgeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v41, "addSubview:", v5->_rightEdgeLabel);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_rightEdgeLabel, "firstBaselineAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicProgressBarView bottomAnchor](v5->_progressBarView, "bottomAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v56 constant:32.0]);
    [v57 setActive:1];

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v5->_rightEdgeLabel, "rightAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 rightAnchor]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v60]);
    [v61 setActive:1];

    v62 = objc_alloc_init(&OBJC_CLASS___UILabel);
    elapsedTimeLabel = v5->_elapsedTimeLabel;
    v5->_elapsedTimeLabel = v62;

    v64 = v5->_elapsedTimeLabel;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView timeFont](v5, "timeFont"));
    -[UILabel setFont:](v64, "setFont:", v65);

    -[UILabel setOpaque:](v5->_elapsedTimeLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v5->_elapsedTimeLabel, "setBackgroundColor:", 0LL);
    v66 = v5->_elapsedTimeLabel;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v66, "setTextColor:", v67);

    -[UIView addSubview:](v41, "addSubview:", v5->_elapsedTimeLabel);
    v68 = -[UIView initWithSize:](objc_alloc(&OBJC_CLASS___UIView), "initWithSize:", 64.0, 64.0);
    backwardAccessoryView = v5->_backwardAccessoryView;
    v5->_backwardAccessoryView = v68;

    v70 = v5->_backwardAccessoryView;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](v70, "setBackgroundColor:", v71);

    -[UIView setAlpha:](v5->_backwardAccessoryView, "setAlpha:", 0.0);
    -[UIView addSubview:](v41, "addSubview:", v5->_backwardAccessoryView);
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithScale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithScale:",  3LL));
    v73 = objc_alloc(&OBJC_CLASS___UIImageView);
    v74 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"backward.end.alt.fill",  v72));
    v75 = -[UIImageView initWithImage:](v73, "initWithImage:", v74);
    backwardTrackMask = v5->_backwardTrackMask;
    v5->_backwardTrackMask = v75;

    -[UIImageView setContentMode:](v5->_backwardTrackMask, "setContentMode:", 8LL);
    v77 = objc_alloc(&OBJC_CLASS___UIImageView);
    v78 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"gobackward.30",  v72));
    v79 = -[UIImageView initWithImage:](v77, "initWithImage:", v78);
    backwardTimeSkipMask = v5->_backwardTimeSkipMask;
    v5->_backwardTimeSkipMask = v79;

    -[UIImageView setContentMode:](v5->_backwardTimeSkipMask, "setContentMode:", 8LL);
    v81 = objc_alloc(&OBJC_CLASS___UIImageView);
    v82 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"backward.fill",  v72));
    v83 = -[UIImageView initWithImage:](v81, "initWithImage:", v82);
    backwardScanningMask = v5->_backwardScanningMask;
    v5->_backwardScanningMask = v83;

    -[UIImageView setContentMode:](v5->_backwardScanningMask, "setContentMode:", 8LL);
    v85 = -[UIView initWithSize:](objc_alloc(&OBJC_CLASS___UIView), "initWithSize:", 64.0, 64.0);
    forwardAccessoryView = v5->_forwardAccessoryView;
    v5->_forwardAccessoryView = v85;

    v87 = v5->_forwardAccessoryView;
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIView setBackgroundColor:](v87, "setBackgroundColor:", v88);

    -[UIView setAlpha:](v5->_forwardAccessoryView, "setAlpha:", 0.0);
    -[UIView addSubview:](v41, "addSubview:", v5->_forwardAccessoryView);
    v89 = objc_alloc(&OBJC_CLASS___UIImageView);
    v90 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"forward.end.alt.fill",  v72));
    v91 = -[UIImageView initWithImage:](v89, "initWithImage:", v90);
    forwardTrackMask = v5->_forwardTrackMask;
    v5->_forwardTrackMask = v91;

    -[UIImageView setContentMode:](v5->_forwardTrackMask, "setContentMode:", 7LL);
    v93 = objc_alloc(&OBJC_CLASS___UIImageView);
    v94 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"goforward.30",  v72));
    v95 = -[UIImageView initWithImage:](v93, "initWithImage:", v94);
    forwardTimeSkipMask = v5->_forwardTimeSkipMask;
    v5->_forwardTimeSkipMask = v95;

    -[UIImageView setContentMode:](v5->_forwardTimeSkipMask, "setContentMode:", 7LL);
    v97 = objc_alloc(&OBJC_CLASS___UIImageView);
    v98 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"forward.fill",  v72));
    v99 = -[UIImageView initWithImage:](v97, "initWithImage:", v98);
    forwardScanningMask = v5->_forwardScanningMask;
    v5->_forwardScanningMask = v99;

    -[UIImageView setContentMode:](v5->_forwardScanningMask, "setContentMode:", 7LL);
    v101 = objc_alloc(&OBJC_CLASS___UIImageView);
    v102 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"play.circle",  v72));
    v103 = -[UIImageView initWithImage:](v101, "initWithImage:", v102);
    forwardPlayMask = v5->_forwardPlayMask;
    v5->_forwardPlayMask = v103;

    -[UIImageView setContentMode:](v5->_forwardPlayMask, "setContentMode:", 7LL);
    v105 = objc_alloc(&OBJC_CLASS___UIImageView);
    v106 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"stop.circle",  v72));
    v107 = -[UIImageView initWithImage:](v105, "initWithImage:", v106);
    forwardStopMask = v5->_forwardStopMask;
    v5->_forwardStopMask = v107;

    -[UIImageView setContentMode:](v5->_forwardStopMask, "setContentMode:", 7LL);
  }

  return v5;
}

- (void)setAlternateElapsedTimeAccessory:(id)a3
{
  id v8 = a3;
  p_alternateElapsedTimeAccessory = &self->_alternateElapsedTimeAccessory;
  objc_storeStrong((id *)&self->_alternateElapsedTimeAccessory, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_alternateElapsedTimeAccessory, "superview"));

  if (!v6)
  {
    -[UIView addSubview:](self->_labelContainer, "addSubview:", *p_alternateElapsedTimeAccessory);
    goto LABEL_5;
  }

  v7 = v8;
  if (!v8)
  {
    -[UIView removeFromSuperview](*p_alternateElapsedTimeAccessory, "removeFromSuperview");
LABEL_5:
    v7 = v8;
  }
}

- (void)setShouldUseAlternateElapsedTimeAccessory:(BOOL)a3
{
  if (self->_shouldUseAlternateElapsedTimeAccessory != a3)
  {
    self->_shouldUseAlternateElapsedTimeAccessory = a3;
    elapsedTimeLabel = self->_elapsedTimeLabel;
    if (a3)
    {
      -[UILabel setAlpha:](self->_elapsedTimeLabel, "setAlpha:", 0.0);
      -[TVMusicTransportBarView setPlayerHeadSize:](self, "setPlayerHeadSize:", 1.0, 14.0);
    }

    else
    {
      -[UIView alpha](self->_labelContainer, "alpha");
      -[UILabel setAlpha:](elapsedTimeLabel, "setAlpha:");
    }
  }

- (id)timeFont
{
  if (qword_1002BE750 != -1) {
    dispatch_once(&qword_1002BE750, &stru_100268F00);
  }
  return (id)qword_1002BE748;
}

- (void)updateProgressBarPlayheadLocations
{
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGRectGetMinX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  v7 = -[UIView superview](self->_playerHead, "superview", CGRectGetWidth(v21));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[TVMusicTransportBarView playerHeadFrame](self, "playerHeadFrame");
  objc_msgSend(v8, "convertRect:toView:", self);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v22.origin.CGFloat x = v10;
  v22.origin.CGFloat y = v12;
  v22.size.CGFloat width = v14;
  v22.size.CGFloat height = v16;
  -[TVMusicTransportBarView convertPoint:toView:]( self,  "convertPoint:toView:",  self->_progressBarView,  CGRectGetMidX(v22),  0.0);
  double v18 = v17;
  -[TVMusicProgressBarView bounds](self->_progressBarView, "bounds");
  double v19 = CGRectGetWidth(v23);
  if (v19 > 0.0) {
    -[TVMusicProgressBarView setPlayheadStart:](self->_progressBarView, "setPlayheadStart:", v18 / v19);
  }
}

- (void)layoutSubviews
{
  v120.receiver = self;
  v120.super_class = (Class)&OBJC_CLASS___TVMusicTransportBarView;
  -[TVMusicTransportBarView layoutSubviews](&v120, "layoutSubviews");
  -[TVMusicProgressBarView frame](self->_progressBarView, "frame");
  CGFloat v115 = v4;
  CGFloat v116 = v3;
  CGFloat v113 = v6;
  CGFloat v114 = v5;
  -[UIView setFrame:](self->_playerHeadContainer, "setFrame:");
  playerHead = self->_playerHead;
  -[TVMusicTransportBarView playerHeadFrame](self, "playerHeadFrame");
  -[UIView setFrame:](playerHead, "setFrame:");
  -[UIView bounds](self->_playerHeadContainer, "bounds");
  double x = v121.origin.x;
  double y = v121.origin.y;
  double width = v121.size.width;
  double height = v121.size.height;
  double v12 = CGRectGetHeight(v121) * 0.5;
  -[UIView setFrame:](self->_playerHeadMask, "setFrame:", x, y, width, height);
  -[UIView _setCornerRadius:](self->_playerHeadMask, "_setCornerRadius:", v12);
  -[UIView frame](self->_playerHead, "frame");
  if (CGRectGetMinX(v122) < v12)
  {
    playerHeadContainer = self->_playerHeadContainer;
  }

  else
  {
    -[UIView frame](self->_playerHead, "frame");
    double MaxX = CGRectGetMaxX(v123);
    CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_playerHead, "superview"));
    [v14 bounds];
    CGFloat v15 = CGRectGetWidth(v124) - v12;

    playerHeadContainer = self->_playerHeadContainer;
    if (MaxX <= v15)
    {
      playerHeadMask = 0LL;
      goto LABEL_6;
    }
  }

  playerHeadMask = self->_playerHeadMask;
LABEL_6:
  -[UIView setMaskView:](playerHeadContainer, "setMaskView:", playerHeadMask);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_playerHead, "superview"));
  -[TVMusicTransportBarView playerHeadFrameForSize:](self, "playerHeadFrameForSize:", 1.0, 14.0);
  objc_msgSend(v18, "convertRect:toView:", self);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  CGFloat v110 = v22;
  double Center = UIRectGetCenter( -[TVMusicTransportBarView updateProgressBarPlayheadLocations](self, "updateProgressBarPlayheadLocations"),  v20,  v22,  v24,  v26);
  -[UILabel frame](self->_elapsedTimeLabel, "frame");
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  -[UILabel center](self->_elapsedTimeLabel, "center");
  double v112 = v20;
  double v111 = v26;
  if (self->_shouldUseAlternateElapsedTimeAccessory)
  {
    -[UIView sizeThatFits:](self->_alternateElapsedTimeAccessory, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    double v37 = v36;
    double v39 = v38;
    CGFloat v40 = Center + v36 * -0.5;
    v125.origin.double x = v20;
    double v41 = v110;
    v125.origin.double y = v110;
    v125.size.double width = v24;
    v125.size.double height = v26;
    double v42 = CGRectGetMaxY(v125) + 10.0;
    v126.origin.double x = v40;
    v126.origin.double y = v42;
    v126.size.double width = v37;
    v126.size.double height = v39;
    double MinX = CGRectGetMinX(v126);
    -[UIView frame](self->_playerHeadContainer, "frame");
    CGFloat v44 = CGRectGetMaxX(v127) + -2.0;
    v128.origin.double x = v40;
    v128.origin.double y = v42;
    v128.size.double width = v37;
    v128.size.double height = v39;
    double v45 = v44 - CGRectGetWidth(v128);
    if (MinX >= v45) {
      double v46 = v45;
    }
    else {
      double v46 = MinX;
    }
    -[UIView frame](self->_playerHeadContainer, "frame");
    double v47 = CGRectGetMinX(v129);
    if (v46 < v47) {
      double v46 = v47;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self, "progressBarView"));
    [v48 focusTranslation];
    double v50 = v46 - v49;

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self, "progressBarView"));
    [v51 focusTranslation];
    double v53 = v42 - v52;

    -[UIView setFrame:](self->_alternateElapsedTimeAccessory, "setFrame:", v50, v53, v37, v39);
    -[UIView frame](self->_alternateElapsedTimeAccessory, "frame");
    CGFloat v28 = v54;
    CGFloat v30 = v55;
    CGFloat v32 = v56;
    CGFloat v34 = v57;
    -[UIView center](self->_alternateElapsedTimeAccessory, "center");
    double v59 = v58;
  }

  else
  {
    double v59 = v35;
    double v41 = v110;
  }

  backwardAccessoryView = self->_backwardAccessoryView;
  v130.origin.double x = v28;
  v130.origin.double y = v30;
  v130.size.double width = v32;
  v130.size.double height = v34;
  CGFloat v61 = CGRectGetMinX(v130) + -14.0;
  -[UIView frame](self->_backwardAccessoryView, "frame");
  -[UIView setCenter:](backwardAccessoryView, "setCenter:", v61 - v62 * 0.5, v59);
  forwardAccessoryView = self->_forwardAccessoryView;
  v131.origin.double x = v28;
  v131.origin.double y = v30;
  v131.size.double width = v32;
  v131.size.double height = v34;
  CGFloat v64 = CGRectGetMaxX(v131) + 14.0;
  -[UIView frame](self->_forwardAccessoryView, "frame");
  -[UIView setCenter:](forwardAccessoryView, "setCenter:", v64 + v65 * 0.5, v59);
  -[UILabel frame](self->_elapsedTimeLabel, "frame");
  double v66 = CGRectGetMinX(v132);
  -[UIView alpha](self->_backwardAccessoryView, "alpha");
  double v67 = 0.0;
  if (v68 > 0.0) {
    -[UIView frame](self->_backwardAccessoryView, "frame");
  }
  double v69 = v66 - v67 + -30.0;
  -[UILabel frame](self->_leftEdgeLabel, "frame");
  CGFloat v70 = v133.origin.x;
  CGFloat v71 = v133.origin.y;
  CGFloat v72 = v133.size.width;
  CGFloat v73 = v133.size.height;
  double v74 = CGRectGetWidth(v133);
  v134.origin.double x = v70;
  v134.origin.double y = v71;
  v134.size.double width = v72;
  v134.size.double height = v73;
  double v75 = CGRectGetHeight(v134);
  v135.origin.double y = v115;
  v135.origin.double x = v116;
  v135.size.double height = v113;
  v135.size.double width = v114;
  double v76 = CGRectGetMinX(v135);
  -[UILabel frame](self->_elapsedTimeLabel, "frame");
  double MinY = CGRectGetMinY(v136);
  BOOL v78 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
  -[UILabel setFrame:](self->_leftEdgeLabel, "setFrame:", v76, MinY, v74, v75);
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", v78);
  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472LL;
  v119[2] = sub_10000D610;
  v119[3] = &unk_100268E30;
  v119[4] = self;
  *(double *)&v119[5] = v69;
  v79 = objc_retainBlock(v119);
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v81 = [v80 applicationState];

  if (v81) {
    ((void (*)(void *))v79[2])(v79);
  }
  else {
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v79,  0LL,  0.15,  0.0);
  }
  -[UIView center](self->_forwardAccessoryView, "center");
  double v83 = v82;
  double v85 = v84;
  -[UIView frame](self->_forwardAccessoryView, "frame");
  double v87 = v86;
  -[TVMusicSpinnerView frame](self->_spinner, "frame");
  -[TVMusicSpinnerView setCenter:](self->_spinner, "setCenter:", v83 + (v87 - v88) * -0.5, v85);
  alternateElapsedTimeAccessordouble y = (UILabel *)self->_alternateElapsedTimeAccessory;
  if (!alternateElapsedTimeAccessory) {
    alternateElapsedTimeAccessordouble y = self->_elapsedTimeLabel;
  }
  v90 = alternateElapsedTimeAccessory;
  -[UILabel frame](v90, "frame");
  UIRectCenteredXInRect(v91, v92, v93, v94, v112, v41, v24, v111);
  double v95 = CGRectGetMaxX(v137);
  -[UIView alpha](self->_forwardAccessoryView, "alpha");
  double v96 = 0.0;
  double v97 = 0.0;
  if (v98 > 0.0) {
    -[UIView frame](self->_forwardAccessoryView, "frame");
  }
  double v99 = v95 + v97;
  if (-[TVMusicSpinnerView isAnimating](self->_spinner, "isAnimating"))
  {
    -[TVMusicSpinnerView frame](self->_spinner, "frame");
    double v96 = v100;
  }

  double v101 = v99 + v96 + 30.0;
  rightEdgeLabel = self->_rightEdgeLabel;
  -[UILabel bounds](rightEdgeLabel, "bounds");
  -[UILabel convertRect:toView:](rightEdgeLabel, "convertRect:toView:", self);
  double v103 = CGRectGetMinX(v138);
  -[UILabel alpha](v90, "alpha");
  BOOL v105 = v104 > 0.0;
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472LL;
  v117[2] = sub_10000D660;
  v117[3] = &unk_100268F28;
  if (v101 < v103) {
    BOOL v105 = 0;
  }
  BOOL v118 = v105;
  v117[4] = self;
  v106 = objc_retainBlock(v117);
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v108 = [v107 applicationState];

  if (v108) {
    ((void (*)(void *))v106[2])(v106);
  }
  else {
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327680LL,  v106,  0LL,  0.15,  0.0);
  }
}

- (CGRect)playerHeadFrame
{
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)playerHeadFrameForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[TVMusicProgressBarView frame](self->_progressBarView, "frame");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_playerHead, "superview"));
  -[TVMusicTransportBarView convertRect:toView:](self, "convertRect:toView:", v14, v7, v9, v11, v13);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.double x = v16;
  v31.origin.double y = v18;
  v31.size.double width = v20;
  v31.size.double height = v22;
  double MinX = CGRectGetMinX(v31);
  v32.origin.double x = v16;
  v32.origin.double y = v18;
  v32.size.double width = v20;
  v32.size.double height = v22;
  double v24 = MinX + (CGRectGetWidth(v32) - width) * (self->_playbackProgress - self->_playbackStartLocation);
  v33.origin.double x = v16;
  v33.origin.double y = v18;
  v33.size.double width = v20;
  v33.size.double height = v22;
  double v25 = CGRectGetMaxX(v33) - width;
  if (v24 >= v25) {
    double v24 = v25;
  }
  v34.origin.double x = v16;
  v34.origin.double y = v18;
  v34.size.double width = v20;
  v34.size.double height = v22;
  CGFloat v26 = CGRectGetHeight(v34) - height;
  v35.origin.double x = v16;
  v35.origin.double y = v18;
  v35.size.double width = v20;
  v35.size.double height = v22;
  double v27 = CGRectGetMinY(v35) + v26 * 0.5;
  double v28 = v24;
  double v29 = width;
  double v30 = height;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v27;
  result.origin.double x = v28;
  return result;
}

- (void)setBufferedRange:(id)a3
{
  id v12 = a3;
  [v12 startTime];
  double v6 = v5;
  p_bufferedRange = &self->_bufferedRange;
  -[TVPTimeRange startTime](*p_bufferedRange, "startTime");
  if (v6 != v8
    || ([v12 duration], double v10 = v9, -[TVPTimeRange duration](*p_bufferedRange, "duration"), v10 != v11))
  {
    objc_storeStrong((id *)p_bufferedRange, a3);
  }
}

- (void)setLeftEdgeTitle:(id)a3
{
  id v6 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_leftEdgeLabel, "text"));
  unsigned __int8 v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_leftEdgeLabel, "setText:", v6);
    -[UILabel sizeToFit](self->_leftEdgeLabel, "sizeToFit");
    -[TVMusicTransportBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)leftEdgeTitle
{
  return -[UILabel text](self->_leftEdgeLabel, "text");
}

- (void)setRightEdgeTitle:(id)a3
{
  id v6 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_rightEdgeLabel, "text"));
  unsigned __int8 v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0) {
    -[UILabel setText:](self->_rightEdgeLabel, "setText:", v6);
  }
}

- (NSString)rightEdgeTitle
{
  return -[UILabel text](self->_rightEdgeLabel, "text");
}

- (void)setElapsedTimeTitle:(id)a3
{
  id v6 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_elapsedTimeLabel, "text"));
  unsigned __int8 v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_elapsedTimeLabel, "setText:", v6);
    -[UILabel sizeToFit](self->_elapsedTimeLabel, "sizeToFit");
    -[TVMusicTransportBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)elapsedTimeTitle
{
  return -[UILabel text](self->_elapsedTimeLabel, "text");
}

- (void)setPlaybackProgress:(double)a3
{
  if (self->_playbackProgress != a3)
  {
    self->_playbackProgress = a3;
    -[TVMusicTransportBarView setNeedsLayout](self, "setNeedsLayout");
  }

- (double)presentedPlaybackProgress
{
  playerHead = self->_playerHead;
  -[UIView bounds](playerHead, "bounds");
  -[UIView convertRect:toView:](playerHead, "convertRect:toView:", self);
  double v5 = v4;
  -[TVMusicTransportBarView convertPoint:toView:]( self,  "convertPoint:toView:",  self->_progressBarView,  v6 + v4 * 0.5,  0.0);
  double v8 = v7;
  -[TVMusicProgressBarView frame](self->_progressBarView, "frame");
  return (v8 - v5 * 0.5) / (v9 - v5);
}

- (void)setPlaybackStartLocation:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (self->_playbackStartLocation != v3)
  {
    self->_playbackStartLocation = v3;
    -[TVMusicTransportBarView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[TVMusicTransportBarView _updateUserInteractionEnabled](self, "_updateUserInteractionEnabled");
}

- (void)setIsLive:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isLive = a3;
  double labelAlpha = 1.0;
  if (!a3) {
    double labelAlpha = self->_labelAlpha;
  }
  -[UIView setAlpha:](self->_labelContainer, "setAlpha:", labelAlpha);
  -[TVMusicProgressBarView setHideProgress:](self->_progressBarView, "setHideProgress:", v3);
  -[TVMusicTransportBarView _updateUserInteractionEnabled](self, "_updateUserInteractionEnabled");
}

- (void)setShouldShowLoadingAccessory:(BOOL)a3
{
  self->_shouldShowLoadingAccessordouble y = a3;
  spinner = self->_spinner;
  if (a3)
  {
    if (!spinner)
    {
      double v5 = objc_alloc(&OBJC_CLASS___TVMusicSpinnerView);
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      double v7 = -[TVMusicSpinnerView initWithFrame:color:](v5, "initWithFrame:color:", v6, 0.0, 0.0, 20.0, 20.0);
      double v8 = self->_spinner;
      self->_spinner = v7;

      -[TVMusicTransportBarView addSubview:](self, "addSubview:", self->_spinner);
      spinner = self->_spinner;
    }

    -[TVMusicSpinnerView startAnimating](spinner, "startAnimating");
  }

  else
  {
    -[TVMusicSpinnerView stopAnimating](spinner, "stopAnimating");
  }

- (void)setForwardAccessoryType:(int64_t)a3
{
  self->_forwardAccessoryType = a3;
  switch(a3)
  {
    case 1LL:
      -[TVMusicSpinnerView setHidden:](self->_spinner, "setHidden:", 1LL);
      -[UIView setMaskView:](self->_forwardAccessoryView, "setMaskView:", self->_forwardTrackMask);
      forwardTrackMask = self->_forwardTrackMask;
      -[UIView bounds](self->_forwardAccessoryView, "bounds");
      -[UIImageView setFrame:](forwardTrackMask, "setFrame:");
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10000E010;
      v16[3] = &unk_100268CF0;
      v16[4] = self;
      double v5 = v16;
      goto LABEL_8;
    case 2LL:
      -[TVMusicSpinnerView setHidden:](self->_spinner, "setHidden:", 1LL);
      -[UIView setMaskView:](self->_forwardAccessoryView, "setMaskView:", self->_forwardTimeSkipMask);
      forwardTimeSkipMask = self->_forwardTimeSkipMask;
      -[UIView bounds](self->_forwardAccessoryView, "bounds");
      -[UIImageView setFrame:](forwardTimeSkipMask, "setFrame:");
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10000E028;
      v15[3] = &unk_100268CF0;
      v15[4] = self;
      double v5 = v15;
      goto LABEL_8;
    case 3LL:
      -[TVMusicSpinnerView setHidden:](self->_spinner, "setHidden:", 1LL);
      -[UIView setMaskView:](self->_forwardAccessoryView, "setMaskView:", self->_forwardScanningMask);
      forwardScanningMask = self->_forwardScanningMask;
      -[UIView bounds](self->_forwardAccessoryView, "bounds");
      -[UIImageView setFrame:](forwardScanningMask, "setFrame:");
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10000E040;
      v14[3] = &unk_100268CF0;
      v14[4] = self;
      double v5 = v14;
      goto LABEL_8;
    case 4LL:
      -[TVMusicSpinnerView setHidden:](self->_spinner, "setHidden:", 1LL);
      -[UIView setMaskView:](self->_forwardAccessoryView, "setMaskView:", self->_forwardPlayMask);
      forwardPlayMask = self->_forwardPlayMask;
      -[UIView bounds](self->_forwardAccessoryView, "bounds");
      -[UIImageView setFrame:](forwardPlayMask, "setFrame:");
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10000E058;
      v13[3] = &unk_100268CF0;
      v13[4] = self;
      double v5 = v13;
      goto LABEL_8;
    case 5LL:
      -[TVMusicSpinnerView setHidden:](self->_spinner, "setHidden:", 1LL);
      -[UIView setMaskView:](self->_forwardAccessoryView, "setMaskView:", self->_forwardStopMask);
      forwardStopMask = self->_forwardStopMask;
      -[UIView bounds](self->_forwardAccessoryView, "bounds");
      -[UIImageView setFrame:](forwardStopMask, "setFrame:");
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10000E070;
      v12[3] = &unk_100268CF0;
      v12[4] = self;
      double v5 = v12;
LABEL_8:
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.15);
      break;
    default:
      v10[4] = self;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10000E088;
      v11[3] = &unk_100268CF0;
      v11[4] = self;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10000E0A0;
      v10[3] = &unk_100268F50;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v11,  v10,  0.15,  0.0);
      break;
  }

  -[TVMusicTransportBarView setNeedsLayout](self, "setNeedsLayout");
  -[TVMusicTransportBarView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setBackwardAccessoryType:(int64_t)a3
{
  self->_backwardAccessoryType = a3;
  switch(a3)
  {
    case 3LL:
      -[UIView setMaskView:](self->_backwardAccessoryView, "setMaskView:", self->_backwardScanningMask);
      backwardScanningMask = self->_backwardScanningMask;
      -[UIView bounds](self->_backwardAccessoryView, "bounds");
      -[UIImageView setFrame:](backwardScanningMask, "setFrame:");
      double v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      double v15 = sub_10000E2F0;
      CGFloat v16 = &unk_100268CF0;
      double v17 = self;
      double v5 = &v13;
      break;
    case 2LL:
      -[UIView setMaskView:](self->_backwardAccessoryView, "setMaskView:", self->_backwardTimeSkipMask);
      backwardTimeSkipMask = self->_backwardTimeSkipMask;
      -[UIView bounds](self->_backwardAccessoryView, "bounds");
      -[UIImageView setFrame:](backwardTimeSkipMask, "setFrame:");
      CGFloat v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      CGFloat v20 = sub_10000E2D8;
      double v21 = &unk_100268CF0;
      CGFloat v22 = self;
      double v5 = &v18;
      break;
    case 1LL:
      -[UIView setMaskView:](self->_backwardAccessoryView, "setMaskView:", self->_backwardTrackMask);
      backwardTrackMask = self->_backwardTrackMask;
      -[UIView bounds](self->_backwardAccessoryView, "bounds");
      -[UIImageView setFrame:](backwardTrackMask, "setFrame:");
      double v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472LL;
      double v25 = sub_10000E2C0;
      CGFloat v26 = &unk_100268CF0;
      double v27 = self;
      double v5 = &v23;
      break;
    default:
      double v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472LL;
      double v10 = sub_10000E308;
      double v11 = &unk_100268CF0;
      id v12 = self;
      double v5 = &v8;
      break;
  }

  +[UIView animateWithDuration:animations:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:",  v5,  0.15,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27);
}

- (void)setInteractionMode:(int64_t)a3
{
  if (self->_interactionMode != a3)
  {
    self->_interactionMode = a3;
    if (a3 == 2)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10000E698;
      v15[3] = &unk_100268CF0;
      v15[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v15, 0.2);
      rightEdgeLabel = self->_rightEdgeLabel;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10000E6B0;
      v14[3] = &unk_100268CF0;
      v14[4] = self;
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  rightEdgeLabel,  5242880LL,  v14,  &stru_100268FD0,  0.2);
      leftEdgeLabel = self->_leftEdgeLabel;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10000E710;
      v13[3] = &unk_100268CF0;
      v13[4] = self;
      double v6 = &stru_100268FF0;
      double v7 = v13;
    }

    else if (a3 == 1)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000E5C0;
      v18[3] = &unk_100268CF0;
      v18[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v18, 0.2);
      double v4 = self->_rightEdgeLabel;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000E5D8;
      v17[3] = &unk_100268CF0;
      v17[4] = self;
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v4,  5242880LL,  v17,  &stru_100268F90,  0.2);
      leftEdgeLabel = self->_leftEdgeLabel;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10000E638;
      v16[3] = &unk_100268CF0;
      v16[4] = self;
      double v6 = &stru_100268FB0;
      double v7 = v16;
    }

    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10000E770;
      v12[3] = &unk_100268CF0;
      v12[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v12, 0.2);
      uint64_t v9 = self->_rightEdgeLabel;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10000E788;
      v11[3] = &unk_100268CF0;
      v11[4] = self;
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  v9,  5242880LL,  v11,  &stru_100269010,  0.2);
      leftEdgeLabel = self->_leftEdgeLabel;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10000E7E0;
      v10[3] = &unk_100268CF0;
      v10[4] = self;
      double v6 = &stru_100269030;
      double v7 = v10;
    }

    +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  leftEdgeLabel,  5242880LL,  v7,  v6,  0.2);
  }

- (double)dimmingAlpha
{
  return 0.15;
}

- (id)createProgressBarView
{
  return (id)objc_opt_new(&OBJC_CLASS___TVMusicProgressBarView, a2);
}

- (CGSize)playerHeadSize
{
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)setPlayerHeadSize:(CGSize)a3
{
}

- (double)playerHeadAlpha
{
  return result;
}

- (void)setPlayerHeadAlpha:(double)a3
{
}

- (void)setPlayerHeadColor:(id)a3
{
}

- (void)setPlayerHeadShadowOpacity:(float)a3
{
  self->_playerHeadShadowOpacitdouble y = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_playerHead, "layer"));
  *(float *)&double v4 = a3;
  [v5 setShadowOpacity:v4];
  if (a3 != 0.0)
  {
    [v5 setShadowRadius:4.0];
    objc_msgSend(v5, "setShadowOffset:", 0.0, 4.0);
  }
}

- (void)setLabelAlpha:(double)a3
{
  double v3 = a3;
  self->_double labelAlpha = a3;
  if (-[TVMusicTransportBarView isLive](self, "isLive")) {
    double v3 = 1.0;
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView labelContainer](self, "labelContainer"));
  [v5 setAlpha:v3];
}

- (void)_updateUserInteractionEnabled
{
  BOOL v4 = (-[TVMusicTransportBarView isLive](self, "isLive")
     || (-[TVMusicTransportBarView playerHeadAlpha](self, "playerHeadAlpha"), v3 > 0.0))
    && -[TVMusicTransportBarView isEnabled](self, "isEnabled");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self, "progressBarView"));
  [v5 setUserInteractionEnabled:v4];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (NSString)bottomTitle
{
  return self->_bottomTitle;
}

- (void)setBottomTitle:(id)a3
{
}

- (double)playbackProgress
{
  return self->_playbackProgress;
}

- (TVPTimeRange)bufferedRange
{
  return self->_bufferedRange;
}

- (double)playbackStartLocation
{
  return self->_playbackStartLocation;
}

- (UIColor)playerHeadColor
{
  return self->_playerHeadColor;
}

- (float)playerHeadShadowOpacity
{
  return self->_playerHeadShadowOpacity;
}

- (int64_t)forwardAccessoryType
{
  return self->_forwardAccessoryType;
}

- (int64_t)backwardAccessoryType
{
  return self->_backwardAccessoryType;
}

- (TVMusicProgressBarView)progressBarView
{
  return self->_progressBarView;
}

- (void)setProgressBarView:(id)a3
{
}

- (UILabel)rightEdgeLabel
{
  return self->_rightEdgeLabel;
}

- (void)setRightEdgeLabel:(id)a3
{
}

- (BOOL)shouldShowLoadingAccessory
{
  return self->_shouldShowLoadingAccessory;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (UIView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
}

- (UILabel)leftEdgeLabel
{
  return self->_leftEdgeLabel;
}

- (void)setLeftEdgeLabel:(id)a3
{
}

- (UILabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (void)setElapsedTimeLabel:(id)a3
{
}

- (BOOL)alternateElapsedTimeAccessoryIsInScrubMode
{
  return self->_alternateElapsedTimeAccessoryIsInScrubMode;
}

- (void)setAlternateElapsedTimeAccessoryIsInScrubMode:(BOOL)a3
{
  self->_alternateElapsedTimeAccessoryIsInScrubMode = a3;
}

- (BOOL)shouldUseAlternateElapsedTimeAccessory
{
  return self->_shouldUseAlternateElapsedTimeAccessory;
}

- (UIView)alternateElapsedTimeAccessory
{
  return self->_alternateElapsedTimeAccessory;
}

- (UIView)playerHead
{
  return self->_playerHead;
}

- (void)setPlayerHead:(id)a3
{
}

- (void).cxx_destruct
{
}

@end