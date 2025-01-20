@interface TVSSNowPlayingControlsRenderer
- (BOOL)isFocusable;
- (BOOL)wantsFloatingContentView;
- (TVSSAudioNowPlayingController)nowPlayingController;
- (TVSSNowPlayingControlBackward15Button)backButton;
- (TVSSNowPlayingControlForward30Button)forwardButton;
- (TVSSNowPlayingControlNextButton)nextButton;
- (TVSSNowPlayingControlPlayPauseButton)playPauseButton;
- (TVSSNowPlayingControlPreviousButton)previousButton;
- (TVSSNowPlayingControlsRenderer)initWithIdentifier:(id)a3 formatProvider:(id)a4 content:(id)a5 overrideStylings:(id)a6;
- (unint64_t)packageStateForPlaybackState:(int64_t)a3;
- (void)_updateControlsAvailability;
- (void)configureContentView:(id)a3;
- (void)nextTrack;
- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4;
- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)previousTrack;
- (void)skipBackward;
- (void)skipForward;
- (void)togglePlayPause;
@end

@implementation TVSSNowPlayingControlsRenderer

- (TVSSNowPlayingControlsRenderer)initWithIdentifier:(id)a3 formatProvider:(id)a4 content:(id)a5 overrideStylings:(id)a6
{
  v23 = self;
  SEL v22 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = 0LL;
  objc_storeStrong(&v18, a6);
  v6 = v23;
  v23 = 0LL;
  v17.receiver = v6;
  v17.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlsRenderer;
  v16 = -[TVSSNowPlayingControlsRenderer initWithIdentifier:formatProvider:content:overrideStylings:]( &v17,  "initWithIdentifier:formatProvider:content:overrideStylings:",  location,  v20,  v19,  v18);
  v23 = v16;
  objc_storeStrong((id *)&v23, v16);
  if (v16)
  {
    id v12 = v19;
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSSAudioNowPlayingController);
    if (((objc_opt_isKindOfClass(v12, v7) ^ 1) & 1) != 0)
    {
      v11 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v11,  "handleFailureInMethod:object:file:lineNumber:description:",  v22,  v23,  @"TVSSNowPlayingControlsRenderer.m",  47LL,  @"Expecting TVSSAudioNowPlayingController class");
    }

    objc_storeStrong((id *)&v23->_nowPlayingController, v19);
    v10 = -[TVSSAudioNowPlayingController nowPlayingState](v23->_nowPlayingController, "nowPlayingState");
    -[TVSSNowPlayingState addObserver:](v10, "addObserver:", v23);
  }

  v9 = v23;
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v23, 0LL);
  return v9;
}

- (void)configureContentView:(id)a3
{
  v68 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v66.receiver = v68;
  v66.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlsRenderer;
  -[TVSSNowPlayingControlsRenderer configureContentView:](&v66, "configureContentView:", location[0]);
  [location[0] setSemanticContentAttribute:3];
  v65 = objc_alloc_init(&OBJC_CLASS___TVSSNowPlayingControlPlayPauseButton);
  v6 = v65;
  v5 = v68;
  uint64_t v7 = -[TVSSAudioNowPlayingController nowPlayingState](v68->_nowPlayingController, "nowPlayingState");
  -[TVSSNowPlayingControlPlayPauseButton setPackageState:]( v6,  "setPackageState:",  -[TVSSNowPlayingControlsRenderer packageStateForPlaybackState:]( v5,  "packageStateForPlaybackState:",  -[TVSSNowPlayingState playbackState](v7, "playbackState")));

  -[TVSSNowPlayingControlPlayPauseButton addTarget:action:forControlEvents:]( v65,  "addTarget:action:forControlEvents:",  v68,  "togglePlayPause");
  -[TVSSNowPlayingControlPlayPauseButton setTranslatesAutoresizingMaskIntoConstraints:]( v65,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [location[0] addSubview:v65];
  objc_storeStrong((id *)&v68->_playPauseButton, v65);
  v64 = objc_alloc_init(&OBJC_CLASS___TVSSNowPlayingControlNextButton);
  -[TVSSNowPlayingControlNextButton addTarget:action:forControlEvents:]( v64,  "addTarget:action:forControlEvents:",  v68,  "nextTrack",  0x2000LL);
  -[TVSSNowPlayingControlNextButton setTranslatesAutoresizingMaskIntoConstraints:]( v64,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [location[0] addSubview:v64];
  objc_storeStrong((id *)&v68->_nextButton, v64);
  v63 = objc_alloc_init(&OBJC_CLASS___TVSSNowPlayingControlPreviousButton);
  -[TVSSNowPlayingControlPreviousButton addTarget:action:forControlEvents:]( v63,  "addTarget:action:forControlEvents:",  v68,  "previousTrack",  0x2000LL);
  -[TVSSNowPlayingControlPreviousButton setTranslatesAutoresizingMaskIntoConstraints:]( v63,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [location[0] addSubview:v63];
  objc_storeStrong((id *)&v68->_previousButton, v63);
  v62 = objc_alloc_init(&OBJC_CLASS___TVSSNowPlayingControlForward30Button);
  -[TVSSNowPlayingControlForward30Button addTarget:action:forControlEvents:]( v62,  "addTarget:action:forControlEvents:",  v68,  "skipForward",  0x2000LL);
  -[TVSSNowPlayingControlForward30Button setTranslatesAutoresizingMaskIntoConstraints:]( v62,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [location[0] addSubview:v62];
  objc_storeStrong((id *)&v68->_forwardButton, v62);
  id obj = objc_alloc_init(&OBJC_CLASS___TVSSNowPlayingControlBackward15Button);
  [obj addTarget:v68 action:"skipBackward" forControlEvents:0x2000];
  [obj setTranslatesAutoresizingMaskIntoConstraints:0];
  [location[0] addSubview:obj];
  objc_storeStrong((id *)&v68->_backButton, obj);
  +[TVSSConstants nowPlayingLargePlaybackButtonDiameter]( &OBJC_CLASS___TVSSConstants,  "nowPlayingLargePlaybackButtonDiameter");
  double v60 = v3;
  +[TVSSConstants nowPlayingPlaybackButtonDiameter](&OBJC_CLASS___TVSSConstants, "nowPlayingPlaybackButtonDiameter");
  double v59 = v4;
  id v58 = -[TVSSNowPlayingControlPlayPauseButton heightAnchor](v65, "heightAnchor");
  id v57 = [v58 constraintEqualToConstant:v60];
  v69[0] = v57;
  id v56 = -[TVSSNowPlayingControlPlayPauseButton widthAnchor](v65, "widthAnchor");
  id v55 = [v56 constraintEqualToConstant:v60];
  v69[1] = v55;
  id v54 = -[TVSSNowPlayingControlPlayPauseButton centerXAnchor](v65, "centerXAnchor");
  id v53 = [location[0] centerXAnchor];
  id v52 = objc_msgSend(v54, "constraintEqualToAnchor:");
  v69[2] = v52;
  id v51 = -[TVSSNowPlayingControlPlayPauseButton topAnchor](v65, "topAnchor");
  id v50 = [location[0] topAnchor];
  id v49 = objc_msgSend(v51, "constraintEqualToAnchor:");
  v69[3] = v49;
  id v48 = -[TVSSNowPlayingControlNextButton heightAnchor](v64, "heightAnchor");
  id v47 = [v48 constraintEqualToConstant:v59];
  v69[4] = v47;
  id v46 = -[TVSSNowPlayingControlNextButton widthAnchor](v64, "widthAnchor");
  id v45 = [v46 constraintEqualToConstant:v59];
  v69[5] = v45;
  id v44 = -[TVSSNowPlayingControlNextButton centerYAnchor](v64, "centerYAnchor");
  id v43 = -[TVSSNowPlayingControlPlayPauseButton centerYAnchor](v65, "centerYAnchor");
  id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
  v69[6] = v42;
  id v41 = -[TVSSNowPlayingControlNextButton leadingAnchor](v64, "leadingAnchor");
  id v40 = -[TVSSNowPlayingControlPlayPauseButton trailingAnchor](v65, "trailingAnchor");
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:constant:");
  v69[7] = v39;
  id v38 = -[TVSSNowPlayingControlPreviousButton heightAnchor](v63, "heightAnchor");
  id v37 = [v38 constraintEqualToConstant:v59];
  v69[8] = v37;
  id v36 = -[TVSSNowPlayingControlPreviousButton widthAnchor](v63, "widthAnchor");
  id v35 = [v36 constraintEqualToConstant:v59];
  v69[9] = v35;
  id v34 = -[TVSSNowPlayingControlPreviousButton centerYAnchor](v63, "centerYAnchor");
  id v33 = -[TVSSNowPlayingControlPlayPauseButton centerYAnchor](v65, "centerYAnchor");
  id v32 = objc_msgSend(v34, "constraintEqualToAnchor:");
  v69[10] = v32;
  id v31 = -[TVSSNowPlayingControlPreviousButton trailingAnchor](v63, "trailingAnchor");
  id v30 = -[TVSSNowPlayingControlPlayPauseButton leadingAnchor](v65, "leadingAnchor");
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:constant:");
  v69[11] = v29;
  id v28 = -[TVSSNowPlayingControlForward30Button heightAnchor](v62, "heightAnchor");
  id v27 = [v28 constraintEqualToConstant:v59];
  v69[12] = v27;
  id v26 = -[TVSSNowPlayingControlForward30Button widthAnchor](v62, "widthAnchor");
  id v25 = [v26 constraintEqualToConstant:v59];
  v69[13] = v25;
  id v24 = -[TVSSNowPlayingControlForward30Button centerYAnchor](v62, "centerYAnchor");
  id v23 = -[TVSSNowPlayingControlPlayPauseButton centerYAnchor](v65, "centerYAnchor");
  id v22 = objc_msgSend(v24, "constraintEqualToAnchor:");
  v69[14] = v22;
  id v21 = -[TVSSNowPlayingControlForward30Button leadingAnchor](v62, "leadingAnchor");
  id v20 = -[TVSSNowPlayingControlPlayPauseButton trailingAnchor](v65, "trailingAnchor");
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", 12.0);
  v69[15] = v19;
  id v18 = [obj heightAnchor];
  id v17 = [v18 constraintEqualToConstant:v59];
  v69[16] = v17;
  id v16 = [obj widthAnchor];
  id v15 = [v16 constraintEqualToConstant:v59];
  v69[17] = v15;
  id v14 = [obj centerYAnchor];
  id v13 = -[TVSSNowPlayingControlPlayPauseButton centerYAnchor](v65, "centerYAnchor");
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v69[18] = v12;
  id v11 = [obj trailingAnchor];
  id v10 = -[TVSSNowPlayingControlPlayPauseButton leadingAnchor](v65, "leadingAnchor");
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", -12.0);
  v69[19] = v9;
  v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 20LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSSNowPlayingControlsRenderer _updateControlsAvailability](v68, "_updateControlsAvailability");
  objc_storeStrong(&obj, 0LL);
  objc_storeStrong((id *)&v62, 0LL);
  objc_storeStrong((id *)&v63, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)wantsFloatingContentView
{
  return 0;
}

- (BOOL)isFocusable
{
  return 0;
}

- (void)togglePlayPause
{
}

- (void)nextTrack
{
}

- (void)previousTrack
{
}

- (void)skipForward
{
  forwardButton = self->_forwardButton;
  double v3 = +[NSSymbolBounceEffect bounceDownEffect](&OBJC_CLASS___NSSymbolBounceEffect, "bounceDownEffect");
  -[TVSSNowPlayingControlButton addSymbolEffect:](forwardButton, "addSymbolEffect:");
}

- (void)skipBackward
{
  backButton = self->_backButton;
  double v3 = +[NSSymbolBounceEffect bounceDownEffect](&OBJC_CLASS___NSSymbolBounceEffect, "bounceDownEffect");
  -[TVSSNowPlayingControlButton addSymbolEffect:](backButton, "addSymbolEffect:");
}

- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSNowPlayingControlPlayPauseButton setPackageState:]( v6->_playPauseButton,  "setPackageState:",  -[TVSSNowPlayingControlsRenderer packageStateForPlaybackState:](v6, "packageStateForPlaybackState:", a4));
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSNowPlayingControlsRenderer _updateControlsAvailability](v7, "_updateControlsAvailability");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (unint64_t)packageStateForPlaybackState:(int64_t)a3
{
  if (a3 != 2) {
    return 0LL;
  }
  id v5 = -[TVSSAudioNowPlayingController nowPlayingState](self->_nowPlayingController, "nowPlayingState");
  double v4 = -[TVSSNowPlayingState currentMediaItem](v5, "currentMediaItem");
  unsigned __int8 v6 = -[TVSSNowPlayingMediaItem isLiveContent](v4, "isLiveContent");

  if ((v6 & 1) != 0) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (void)_updateControlsAvailability
{
  unsigned __int8 v6 = -[TVSSAudioNowPlayingController nowPlayingState](self->_nowPlayingController, "nowPlayingState");
  id v5 = -[TVSSNowPlayingState currentMediaItem](v6, "currentMediaItem");
  unsigned __int8 v7 = -[TVSSNowPlayingMediaItem isPodcast](v5, "isPodcast");

  if ((v7 & 1) != 0)
  {
    -[TVSSNowPlayingControlForward30Button setHidden:](self->_forwardButton, "setHidden:", 0LL);
    -[TVSSNowPlayingControlBackward15Button setHidden:](self->_backButton, "setHidden:", 0LL);
    -[TVSSNowPlayingControlNextButton setHidden:](self->_nextButton, "setHidden:", 1LL);
    -[TVSSNowPlayingControlPreviousButton setHidden:](self->_previousButton, "setHidden:", 1LL);
  }

  else
  {
    double v3 = -[TVSSAudioNowPlayingController nowPlayingState](self->_nowPlayingController, "nowPlayingState");
    v2 = -[TVSSNowPlayingState currentMediaItem](v3, "currentMediaItem");
    unsigned __int8 v4 = -[TVSSNowPlayingMediaItem isLiveContent](v2, "isLiveContent");

    -[TVSSNowPlayingControlForward30Button setHidden:](self->_forwardButton, "setHidden:", 1LL);
    -[TVSSNowPlayingControlBackward15Button setHidden:](self->_backButton, "setHidden:", 1LL);
    if ((v4 & 1) != 0)
    {
      -[TVSSNowPlayingControlNextButton setHidden:](self->_nextButton, "setHidden:", 1LL);
      -[TVSSNowPlayingControlPreviousButton setHidden:](self->_previousButton, "setHidden:", 1LL);
    }

    else
    {
      -[TVSSNowPlayingControlNextButton setHidden:](self->_nextButton, "setHidden:", 0LL);
      -[TVSSNowPlayingControlPreviousButton setHidden:](self->_previousButton, "setHidden:", 0LL);
    }
  }

- (TVSSAudioNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (TVSSNowPlayingControlPlayPauseButton)playPauseButton
{
  return self->_playPauseButton;
}

- (TVSSNowPlayingControlNextButton)nextButton
{
  return self->_nextButton;
}

- (TVSSNowPlayingControlPreviousButton)previousButton
{
  return self->_previousButton;
}

- (TVSSNowPlayingControlForward30Button)forwardButton
{
  return self->_forwardButton;
}

- (TVSSNowPlayingControlBackward15Button)backButton
{
  return self->_backButton;
}

- (void).cxx_destruct
{
}

@end