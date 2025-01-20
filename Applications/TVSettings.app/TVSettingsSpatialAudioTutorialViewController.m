@interface TVSettingsSpatialAudioTutorialViewController
- (BOOL)initialSpatialSetting;
- (TVCSSpatialTutorialStatePublisher)statePublisher;
- (TVNPSpatialAudioTutorialPlayerView)spatialVideoPlayerView;
- (TVNPSpatialAudioTutorialPlayerView)stereoVideoPlayerView;
- (TVSBluetoothDevice)bluetoothDevice;
- (TVSettingsSpatialAudioTutorialViewController)initWithBluetoothDevice:(id)a3;
- (UISegmentedControl)modeSegmentedControl;
- (void)_menuButtonAction;
- (void)_playSpatialVideo;
- (void)_playStereoVideo;
- (void)_setupAVPlayerForVideoNamed:(id)a3 playerView:(id)a4;
- (void)_toggleMode:(id)a3;
- (void)dealloc;
- (void)didEnterBackground;
- (void)setBluetoothDevice:(id)a3;
- (void)setInitialSpatialSetting:(BOOL)a3;
- (void)setModeSegmentedControl:(id)a3;
- (void)setSpatialVideoPlayerView:(id)a3;
- (void)setStatePublisher:(id)a3;
- (void)setStereoVideoPlayerView:(id)a3;
- (void)viewDidLoad;
- (void)willEnterForeground;
@end

@implementation TVSettingsSpatialAudioTutorialViewController

- (TVSettingsSpatialAudioTutorialViewController)initWithBluetoothDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsSpatialAudioTutorialViewController;
  v6 = -[TVSettingsSpatialAudioTutorialViewController initWithNibName:bundle:]( &v11,  "initWithNibName:bundle:",  0LL,  0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bluetoothDevice, a3);
    v7->_initialSpatialSetting = [v5 spatialAudioAllowed];
    -[TVSettingsSpatialAudioTutorialViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 8LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v7 selector:"didEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v7 selector:"willEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsSpatialAudioTutorialViewController;
  -[TVSettingsSpatialAudioTutorialViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v116.receiver = self;
  v116.super_class = (Class)&OBJC_CLASS___TVSettingsSpatialAudioTutorialViewController;
  -[TVSettingsSpatialAudioTutorialViewController viewDidLoad](&v116, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSpatialAudioTutorialViewController view](self, "view"));
  v112 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonAction");
  -[UITapGestureRecognizer setAllowedPressTypes:](v112, "setAllowedPressTypes:", &off_1001AEA70);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v112, "setAllowedTouchTypes:", &__NSArray0__struct);
  [v3 addGestureRecognizer:v112];
  v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
  -[UILabel setFont:](v4, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v4, "setTextColor:", v6);

  -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1LL);
  v115 = v4;
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"SpatialAudioTutorialTitle" value:&stru_100195DD8 table:0]);
  -[UILabel setText:](v4, "setText:", v9);

  [v3 addSubview:v4];
  v10 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setNumberOfLines:](v10, "setNumberOfLines:", 0LL);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v10, "setFont:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v10, "setTextColor:", v12);

  -[UILabel setTextAlignment:](v10, "setTextAlignment:", 1LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"SpatialAudioTutorialInstructions" value:&stru_100195DD8 table:0]);
  -[UILabel setText:](v10, "setText:", v15);

  v113 = v3;
  [v3 addSubview:v10];
  v16 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  [v3 addSubview:v16];
  v17 = objc_alloc_init(&OBJC_CLASS___TVNPSpatialAudioTutorialPlayerView);
  spatialVideoPlayerView = self->_spatialVideoPlayerView;
  self->_spatialVideoPlayerView = v17;

  -[TVNPSpatialAudioTutorialPlayerView setTranslatesAutoresizingMaskIntoConstraints:]( self->_spatialVideoPlayerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v114 = v16;
  -[UIView addSubview:](v16, "addSubview:", self->_spatialVideoPlayerView);
  v19 = objc_alloc_init(&OBJC_CLASS___TVNPSpatialAudioTutorialPlayerView);
  stereoVideoPlayerView = self->_stereoVideoPlayerView;
  self->_stereoVideoPlayerView = v19;

  -[TVNPSpatialAudioTutorialPlayerView setTranslatesAutoresizingMaskIntoConstraints:]( self->_stereoVideoPlayerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView addSubview:](v16, "addSubview:", self->_stereoVideoPlayerView);
  v124[0] = objc_opt_class(&OBJC_CLASS___TVSettingsSpatialAudioTutorialViewController);
  v124[1] = objc_opt_class(&OBJC_CLASS___UISegmentedControl);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v124, 2LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:",  v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](&OBJC_CLASS___UIColor, "systemDarkGrayColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 colorWithAlphaComponent:0.85]);
  [v22 setBackgroundColor:v24 forState:0];

  v123[0] = objc_opt_class(&OBJC_CLASS___TVSettingsSpatialAudioTutorialViewController);
  v123[1] = objc_opt_class(&OBJC_CLASS___UISegmentedControl);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v123, 2LL));
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:",  v25));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v26 setBackgroundColor:v27 forState:8];

  v28 = objc_alloc(&OBJC_CLASS___UISegmentedControl);
  v29 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"SpatialAudioSpatialButtonTitle" value:&stru_100195DD8 table:0]);
  v122[0] = v31;
  v32 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"SpatialAudioStereoButtonTitle" value:&stru_100195DD8 table:0]);
  v122[1] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 2LL));
  v36 = -[UISegmentedControl initWithItems:](v28, "initWithItems:", v35);
  modeSegmentedControl = self->_modeSegmentedControl;
  self->_modeSegmentedControl = v36;

  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:]( self->_modeSegmentedControl,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UISegmentedControl addTarget:action:forControlEvents:]( self->_modeSegmentedControl,  "addTarget:action:forControlEvents:",  self,  "_toggleMode:",  4096LL);
  v38 = self->_modeSegmentedControl;
  NSAttributedStringKey v120 = NSForegroundColorAttributeName;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v121 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v121,  &v120,  1LL));
  -[UISegmentedControl setTitleTextAttributes:forState:](v38, "setTitleTextAttributes:forState:", v40, 0LL);

  v41 = self->_modeSegmentedControl;
  NSAttributedStringKey v118 = NSForegroundColorAttributeName;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  v119 = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v119,  &v118,  1LL));
  -[UISegmentedControl setTitleTextAttributes:forState:](v41, "setTitleTextAttributes:forState:", v43, 8LL);

  [v3 addSubview:self->_modeSegmentedControl];
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v115, "centerXAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v108 = (void *)objc_claimAutoreleasedReturnValue([v110 constraintEqualToAnchor:v109]);
  v117[0] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v10, "centerXAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v105 = (void *)objc_claimAutoreleasedReturnValue([v107 constraintEqualToAnchor:v106]);
  v117[1] = v105;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v10, "widthAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue([v104 constraintEqualToConstant:550.0]);
  v117[2] = v103;
  v111 = v10;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v10, "firstBaselineAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v115, "lastBaselineAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue([v102 constraintEqualToAnchor:v101 constant:54.0]);
  v117[3] = v100;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v114, "centerXAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v97 = (void *)objc_claimAutoreleasedReturnValue([v99 constraintEqualToAnchor:v98]);
  v117[4] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v114, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v10, "lastBaselineAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue([v96 constraintEqualToAnchor:v95 constant:32.0]);
  v117[5] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v114, "heightAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue([v93 constraintEqualToConstant:640.0]);
  v117[6] = v92;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v114, "widthAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue([v91 constraintEqualToConstant:640.0]);
  v117[7] = v90;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView heightAnchor](self->_spatialVideoPlayerView, "heightAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v114, "heightAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v89 constraintEqualToAnchor:v88]);
  v117[8] = v87;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView widthAnchor](self->_spatialVideoPlayerView, "widthAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v114, "widthAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue([v86 constraintEqualToAnchor:v85]);
  v117[9] = v84;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView centerYAnchor](self->_spatialVideoPlayerView, "centerYAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v114, "centerYAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToAnchor:v82]);
  v117[10] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView centerXAnchor](self->_spatialVideoPlayerView, "centerXAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v114, "centerXAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v79]);
  v117[11] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView heightAnchor](self->_stereoVideoPlayerView, "heightAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v114, "heightAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToAnchor:v76]);
  v117[12] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView widthAnchor](self->_stereoVideoPlayerView, "widthAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v114, "widthAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToAnchor:v73]);
  v117[13] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView centerYAnchor](self->_stereoVideoPlayerView, "centerYAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v114, "centerYAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v71 constraintEqualToAnchor:v70]);
  v117[14] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView centerXAnchor](self->_stereoVideoPlayerView, "centerXAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v114, "centerXAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v68 constraintEqualToAnchor:v67]);
  v117[15] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl widthAnchor](self->_modeSegmentedControl, "widthAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintGreaterThanOrEqualToConstant:760.0]);
  v117[16] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl centerXAnchor](self->_modeSegmentedControl, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v44]);
  v117[17] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl topAnchor](self->_modeSegmentedControl, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v114, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintEqualToAnchor:v47 constant:32.0]);
  v117[18] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UISegmentedControl bottomAnchor](self->_modeSegmentedControl, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToAnchor:v50 constant:-80.0]);
  v117[19] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v117, 20LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  unsigned int v54 = [v53 deemed4KCapable];
  v55 = @"Spatial_Audio_loop_ATV_HD_audio_mux";
  if (v54) {
    v55 = @"Spatial_Audio_loop_ATV_4K_audio_mux";
  }
  v56 = v55;

  -[TVSettingsSpatialAudioTutorialViewController _setupAVPlayerForVideoNamed:playerView:]( self,  "_setupAVPlayerForVideoNamed:playerView:",  v56,  self->_spatialVideoPlayerView);
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  unsigned int v58 = [v57 deemed4KCapable];
  v59 = @"Stereo_Audio_loop_ATV_HD_audio_mux";
  if (v58) {
    v59 = @"Stereo_Audio_loop_ATV_4K_audio_mux";
  }
  v60 = v59;

  -[TVSettingsSpatialAudioTutorialViewController _setupAVPlayerForVideoNamed:playerView:]( self,  "_setupAVPlayerForVideoNamed:playerView:",  v60,  self->_stereoVideoPlayerView);
  -[TVSettingsSpatialAudioTutorialViewController _playSpatialVideo](self, "_playSpatialVideo");
  v61 = -[TVCSSpatialTutorialStatePublisher initWithSpatialEnabled:]( objc_alloc(&OBJC_CLASS___TVCSSpatialTutorialStatePublisher),  "initWithSpatialEnabled:",  self->_initialSpatialSetting);
  statePublisher = self->_statePublisher;
  self->_statePublisher = v61;
}

- (void)didEnterBackground
{
}

- (void)willEnterForeground
{
}

- (void)_setupAVPlayerForVideoNamed:(id)a3 playerView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLForResource:v7 withExtension:@"mov"]);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", v10, 0LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](&OBJC_CLASS___AVPlayerItem, "playerItemWithAsset:", v11));
  [v12 setAllowedAudioSpatializationFormats:4];
  CMTimeMakeWithSeconds(&v24, 14.0, 60);
  [v12 setForwardPlaybackEndTime:&v24];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 player]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentItem]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 asset]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 URL]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 absoluteString]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 absoluteString]);
  unsigned __int8 v20 = [v17 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AVQueuePlayer playerWithPlayerItem:](&OBJC_CLASS___AVQueuePlayer, "playerWithPlayerItem:", v12));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[AVPlayerLooper playerLooperWithPlayer:templateItem:]( &OBJC_CLASS___AVPlayerLooper,  "playerLooperWithPlayer:templateItem:",  v21,  v12));
    [v6 setPlayer:v21];
    [v6 setLooper:v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 player]);
    [v23 play];
  }
}

- (void)_toggleMode:(id)a3
{
  id v4 = a3;
  if ([v4 selectedSegmentIndex]
    || !-[TVNPSpatialAudioTutorialPlayerView isHidden](self->_spatialVideoPlayerView, "isHidden"))
  {
    if ([v4 selectedSegmentIndex] == (id)1
      && -[TVNPSpatialAudioTutorialPlayerView isHidden](self->_stereoVideoPlayerView, "isHidden"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting spatial allowed to: NO",  v5,  2u);
      }

      -[TVSBluetoothDevice setSpatialAudioAllowed:](self->_bluetoothDevice, "setSpatialAudioAllowed:", 0LL);
      -[TVSettingsSpatialAudioTutorialViewController _playStereoVideo](self, "_playStereoVideo");
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting spatial allowed to: YES",  buf,  2u);
    }

    -[TVSBluetoothDevice setSpatialAudioAllowed:](self->_bluetoothDevice, "setSpatialAudioAllowed:", 1LL);
    -[TVSettingsSpatialAudioTutorialViewController _playSpatialVideo](self, "_playSpatialVideo");
  }
}

- (void)_playSpatialVideo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView player](self->_spatialVideoPlayerView, "player"));
  [v3 setMuted:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView player](self->_stereoVideoPlayerView, "player"));
  [v4 setMuted:1];

  -[TVNPSpatialAudioTutorialPlayerView setHidden:](self->_spatialVideoPlayerView, "setHidden:", 0LL);
  -[TVNPSpatialAudioTutorialPlayerView setHidden:](self->_stereoVideoPlayerView, "setHidden:", 1LL);
}

- (void)_playStereoVideo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView player](self->_stereoVideoPlayerView, "player"));
  [v3 setMuted:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView player](self->_spatialVideoPlayerView, "player"));
  [v4 setMuted:1];

  -[TVNPSpatialAudioTutorialPlayerView setHidden:](self->_stereoVideoPlayerView, "setHidden:", 0LL);
  -[TVNPSpatialAudioTutorialPlayerView setHidden:](self->_spatialVideoPlayerView, "setHidden:", 1LL);
}

- (void)_menuButtonAction
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView player](self->_stereoVideoPlayerView, "player"));
  [v3 setMuted:1];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView player](self->_spatialVideoPlayerView, "player"));
  [v4 setMuted:1];

  -[TVSettingsSpatialAudioTutorialViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
}

- (TVCSSpatialTutorialStatePublisher)statePublisher
{
  return self->_statePublisher;
}

- (void)setStatePublisher:(id)a3
{
}

- (TVNPSpatialAudioTutorialPlayerView)spatialVideoPlayerView
{
  return self->_spatialVideoPlayerView;
}

- (void)setSpatialVideoPlayerView:(id)a3
{
}

- (TVNPSpatialAudioTutorialPlayerView)stereoVideoPlayerView
{
  return self->_stereoVideoPlayerView;
}

- (void)setStereoVideoPlayerView:(id)a3
{
}

- (UISegmentedControl)modeSegmentedControl
{
  return self->_modeSegmentedControl;
}

- (void)setModeSegmentedControl:(id)a3
{
}

- (TVSBluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (BOOL)initialSpatialSetting
{
  return self->_initialSpatialSetting;
}

- (void)setInitialSpatialSetting:(BOOL)a3
{
  self->_initialSpatialSetting = a3;
}

- (void).cxx_destruct
{
}

@end