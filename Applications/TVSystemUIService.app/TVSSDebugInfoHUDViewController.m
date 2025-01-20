@interface TVSSDebugInfoHUDViewController
- (TVSSAudioNowPlayingController)audioNowPlayingController;
- (TVSSDebugInfoHUDViewController)initWithMenuModeController:(id)a3 privacyController:(id)a4;
- (TVSSHUDBoxedValueVisualization)cameraInUseViz;
- (TVSSHUDBoxedValueVisualization)dictationViz;
- (TVSSHUDBoxedValueVisualization)faceTimeActiveViz;
- (TVSSHUDBoxedValueVisualization)focusedBundleIdViz;
- (TVSSHUDBoxedValueVisualization)hasUserAttentionViz;
- (TVSSHUDBoxedValueVisualization)headboardRequestedVisibilityViz;
- (TVSSHUDBoxedValueVisualization)keyboardFocusedElementIdViz;
- (TVSSHUDBoxedValueVisualization)locationInUseViz;
- (TVSSHUDBoxedValueVisualization)locationIndicatorDisplayLocationViz;
- (TVSSHUDBoxedValueVisualization)micInUseViz;
- (TVSSHUDBoxedValueVisualization)openRequestedReasonViz;
- (TVSSHUDBoxedValueVisualization)playbackStateViz;
- (TVSSHUDBoxedValueVisualization)playerControlStateViz;
- (TVSSHUDBoxedValueVisualization)recordingIndicatorDisplayLocationViz;
- (TVSSHUDBoxedValueVisualization)siriPresentationVisibilityViz;
- (TVSSHUDBoxedValueVisualization)splitViewVisibleViz;
- (TVSSHUDValueHistoryVisualization)bannerRequestedVisibilityViz;
- (TVSSHUDValueHistoryVisualization)modeViz;
- (TVSSHUDView)hudView;
- (TVSSMenuModeController)menuModeController;
- (TVSSPrivacyController)privacyController;
- (void)_updateVisualizations;
- (void)dealloc;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)menuModeStateProviderDidChange:(id)a3;
- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)privacyControllerStateDidChange:(id)a3;
- (void)setAudioNowPlayingController:(id)a3;
- (void)setBannerRequestedVisibilityViz:(id)a3;
- (void)setCameraInUseViz:(id)a3;
- (void)setDictationViz:(id)a3;
- (void)setFaceTimeActiveViz:(id)a3;
- (void)setFocusedBundleIdViz:(id)a3;
- (void)setHasUserAttentionViz:(id)a3;
- (void)setHeadboardRequestedVisibilityViz:(id)a3;
- (void)setHudView:(id)a3;
- (void)setKeyboardFocusedElementIdViz:(id)a3;
- (void)setLocationInUseViz:(id)a3;
- (void)setLocationIndicatorDisplayLocationViz:(id)a3;
- (void)setMenuModeController:(id)a3;
- (void)setMicInUseViz:(id)a3;
- (void)setModeViz:(id)a3;
- (void)setOpenRequestedReasonViz:(id)a3;
- (void)setPlaybackStateViz:(id)a3;
- (void)setPlayerControlStateViz:(id)a3;
- (void)setPrivacyController:(id)a3;
- (void)setRecordingIndicatorDisplayLocationViz:(id)a3;
- (void)setSiriPresentationVisibilityViz:(id)a3;
- (void)setSplitViewVisibleViz:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSSDebugInfoHUDViewController

- (TVSSDebugInfoHUDViewController)initWithMenuModeController:(id)a3 privacyController:(id)a4
{
  v57 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v55 = 0LL;
  objc_storeStrong(&v55, a4);
  v4 = v57;
  v57 = 0LL;
  v54.receiver = v4;
  v54.super_class = (Class)&OBJC_CLASS___TVSSDebugInfoHUDViewController;
  v57 = -[TVSSDebugInfoHUDViewController init](&v54, "init");
  objc_storeStrong((id *)&v57, v57);
  if (v57)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVSSHUDView);
    hudView = v57->_hudView;
    v57->_hudView = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___TVSSHUDValueHistoryVisualization);
    modeViz = v57->_modeViz;
    v57->_modeViz = v7;

    -[TVSSHUDVisualization setTitle:](v57->_modeViz, "setTitle:", @"Mode");
    -[TVSSHUDValueHistoryVisualization setNumberOfValuesToKeep:](v57->_modeViz, "setNumberOfValuesToKeep:", 3LL);
    v9 = objc_alloc_init(&OBJC_CLASS___TVSSHUDValueHistoryVisualization);
    bannerRequestedVisibilityViz = v57->_bannerRequestedVisibilityViz;
    v57->_bannerRequestedVisibilityViz = v9;

    -[TVSSHUDVisualization setTitle:](v57->_bannerRequestedVisibilityViz, "setTitle:", @"Banner State");
    v11 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    keyboardFocusedElementIdViz = v57->_keyboardFocusedElementIdViz;
    v57->_keyboardFocusedElementIdViz = v11;

    -[TVSSHUDVisualization setTitle:]( v57->_keyboardFocusedElementIdViz,  "setTitle:",  @"Keyboard Focused Element ID");
    v13 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    focusedBundleIdViz = v57->_focusedBundleIdViz;
    v57->_focusedBundleIdViz = v13;

    -[TVSSHUDVisualization setTitle:](v57->_focusedBundleIdViz, "setTitle:", @"  Bundle ID");
    v15 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    headboardRequestedVisibilityViz = v57->_headboardRequestedVisibilityViz;
    v57->_headboardRequestedVisibilityViz = v15;

    -[TVSSHUDVisualization setTitle:]( v57->_headboardRequestedVisibilityViz,  "setTitle:",  @"HeadBoard Req Visible");
    v17 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    openRequestedReasonViz = v57->_openRequestedReasonViz;
    v57->_openRequestedReasonViz = v17;

    -[TVSSHUDVisualization setTitle:](v57->_openRequestedReasonViz, "setTitle:", @"Open Reason");
    v19 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    hasUserAttentionViz = v57->_hasUserAttentionViz;
    v57->_hasUserAttentionViz = v19;

    -[TVSSHUDVisualization setTitle:](v57->_hasUserAttentionViz, "setTitle:", @"Has User Attention");
    v21 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    splitViewVisibleViz = v57->_splitViewVisibleViz;
    v57->_splitViewVisibleViz = v21;

    -[TVSSHUDVisualization setTitle:](v57->_splitViewVisibleViz, "setTitle:", @"Split View Active");
    v23 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    locationInUseViz = v57->_locationInUseViz;
    v57->_locationInUseViz = v23;

    -[TVSSHUDVisualization setTitle:](v57->_locationInUseViz, "setTitle:", @"Location In Use");
    v25 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    locationIndicatorDisplayLocationViz = v57->_locationIndicatorDisplayLocationViz;
    v57->_locationIndicatorDisplayLocationViz = v25;

    -[TVSSHUDVisualization setTitle:]( v57->_locationIndicatorDisplayLocationViz,  "setTitle:",  @"  Location Indicator Display In");
    v27 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    cameraInUseViz = v57->_cameraInUseViz;
    v57->_cameraInUseViz = v27;

    -[TVSSHUDVisualization setTitle:](v57->_cameraInUseViz, "setTitle:", @"Camera in Use");
    v29 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    micInUseViz = v57->_micInUseViz;
    v57->_micInUseViz = v29;

    -[TVSSHUDVisualization setTitle:](v57->_micInUseViz, "setTitle:", @"Mic In Use");
    v31 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    recordingIndicatorDisplayLocationViz = v57->_recordingIndicatorDisplayLocationViz;
    v57->_recordingIndicatorDisplayLocationViz = v31;

    -[TVSSHUDVisualization setTitle:]( v57->_recordingIndicatorDisplayLocationViz,  "setTitle:",  @"  Recording Indicator Display In");
    v33 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    playerControlStateViz = v57->_playerControlStateViz;
    v57->_playerControlStateViz = v33;

    -[TVSSHUDVisualization setTitle:](v57->_playerControlStateViz, "setTitle:", @"Player State");
    v35 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    faceTimeActiveViz = v57->_faceTimeActiveViz;
    v57->_faceTimeActiveViz = v35;

    -[TVSSHUDVisualization setTitle:](v57->_faceTimeActiveViz, "setTitle:", @"FaceTime Active");
    v37 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    playbackStateViz = v57->_playbackStateViz;
    v57->_playbackStateViz = v37;

    -[TVSSHUDVisualization setTitle:](v57->_playbackStateViz, "setTitle:", @"Audio Playback State");
    v39 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    siriPresentationVisibilityViz = v57->_siriPresentationVisibilityViz;
    v57->_siriPresentationVisibilityViz = v39;

    -[TVSSHUDVisualization setTitle:](v57->_siriPresentationVisibilityViz, "setTitle:", @"Siri Orb State");
    v41 = objc_alloc_init(&OBJC_CLASS___TVSSHUDBoxedValueVisualization);
    dictationViz = v57->_dictationViz;
    v57->_dictationViz = v41;

    -[TVSSHUDVisualization setTitle:](v57->_dictationViz, "setTitle:", @"Dictating");
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_modeViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_keyboardFocusedElementIdViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_focusedBundleIdViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_bannerRequestedVisibilityViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_headboardRequestedVisibilityViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_openRequestedReasonViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_hasUserAttentionViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_splitViewVisibleViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_locationInUseViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_locationIndicatorDisplayLocationViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_cameraInUseViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_micInUseViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_recordingIndicatorDisplayLocationViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_playerControlStateViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_faceTimeActiveViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_playbackStateViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_siriPresentationVisibilityViz);
    -[TVSSHUDView addVisualization:](v57->_hudView, "addVisualization:", v57->_dictationViz);
    objc_storeStrong((id *)&v57->_menuModeController, location[0]);
    -[TVSSMenuModeController addControllerObserver:](v57->_menuModeController, "addControllerObserver:", v57);
    v48 = -[TVSSMenuModeController provider](v57->_menuModeController, "provider");
    -[TVSSMenuModeStateProvider addProviderObserver:](v48, "addProviderObserver:", v57);

    objc_storeStrong((id *)&v57->_privacyController, v55);
    -[TVSSPrivacyController addControllerObserver:](v57->_privacyController, "addControllerObserver:", v57);
    v43 =  +[TVSSAudioNowPlayingController sharedInstance]( &OBJC_CLASS___TVSSAudioNowPlayingController,  "sharedInstance");
    audioNowPlayingController = v57->_audioNowPlayingController;
    v57->_audioNowPlayingController = v43;

    v49 = -[TVSSAudioNowPlayingController nowPlayingState](v57->_audioNowPlayingController, "nowPlayingState");
    -[TVSSNowPlayingState addObserver:](v49, "addObserver:", v57);

    v50 = v57->_audioNowPlayingController;
    v45 = (objc_class *)objc_opt_class(v57);
    v52 = NSStringFromClass(v45);
    v51 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %p", v52, v57);
    -[TVSSAudioNowPlayingController addActivationReason:](v50, "addActivationReason:");
  }

  v47 = v57;
  objc_storeStrong(&v55, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v57, 0LL);
  return v47;
}

- (void)dealloc
{
  v9 = self;
  SEL v8 = a2;
  -[TVSSPrivacyController removeControllerObserver:](self->_privacyController, "removeControllerObserver:", self);
  v3 = -[TVSSAudioNowPlayingController nowPlayingState](v9->_audioNowPlayingController, "nowPlayingState");
  -[TVSSNowPlayingState removeObserver:](v3, "removeObserver:", v9);

  audioNowPlayingController = v9->_audioNowPlayingController;
  v2 = (objc_class *)objc_opt_class(v9);
  v6 = NSStringFromClass(v2);
  v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %p", v6, v9);
  -[TVSSAudioNowPlayingController removeActivationReason:](audioNowPlayingController, "removeActivationReason:");

  v7.receiver = v9;
  v7.super_class = (Class)&OBJC_CLASS___TVSSDebugInfoHUDViewController;
  -[TVSSDebugInfoHUDViewController dealloc](&v7, "dealloc");
}

- (void)viewDidLoad
{
  v18 = self;
  SEL v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSSDebugInfoHUDViewController;
  -[TVSSDebugInfoHUDViewController viewDidLoad](&v16, "viewDidLoad");
  id v15 = -[TVSSDebugInfoHUDViewController view](v18, "view");
  -[TVSSHUDView setTranslatesAutoresizingMaskIntoConstraints:]( v18->_hudView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [v15 addSubview:v18->_hudView];
  id v14 = -[TVSSHUDView leadingAnchor](v18->_hudView, "leadingAnchor");
  id v13 = [v15 leadingAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v19[0] = v12;
  id v11 = -[TVSSHUDView trailingAnchor](v18->_hudView, "trailingAnchor");
  id v10 = [v15 trailingAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v19[1] = v9;
  id v8 = -[TVSSHUDView topAnchor](v18->_hudView, "topAnchor");
  id v7 = [v15 topAnchor];
  id v6 = objc_msgSend(v8, "constraintEqualToAnchor:");
  v19[2] = v6;
  id v5 = -[TVSSHUDView bottomAnchor](v18->_hudView, "bottomAnchor");
  id v4 = [v15 bottomAnchor];
  id v3 = objc_msgSend(v5, "constraintEqualToAnchor:");
  v19[3] = v3;
  v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSSDebugInfoHUDViewController _updateVisualizations](v18, "_updateVisualizations");
  objc_storeStrong(&v15, 0LL);
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSDebugInfoHUDViewController _updateVisualizations](v7, "_updateVisualizations");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)menuModeStateProviderDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSDebugInfoHUDViewController _updateVisualizations](v4, "_updateVisualizations");
  objc_storeStrong(location, 0LL);
}

- (void)privacyControllerStateDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSDebugInfoHUDViewController _updateVisualizations](v4, "_updateVisualizations");
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSDebugInfoHUDViewController _updateVisualizations](v5, "_updateVisualizations");
  objc_storeStrong(location, 0LL);
}

- (void)_updateVisualizations
{
  v48 = self;
  v47[1] = (id)a2;
  modeViz = self->_modeViz;
  id v29 = TVSSMenuModeDescription(-[TVSSMenuModeController mode](self->_menuModeController, "mode"));
  -[TVSSHUDValueHistoryVisualization setValue:](modeViz, "setValue:");

  v30 = -[TVSSMenuModeController provider](v48->_menuModeController, "provider");
  v47[0] = -[TVSSMenuModeStateProvider state](v30, "state");

  keyboardFocusedElementIdViz = v48->_keyboardFocusedElementIdViz;
  id v33 = [v47[0] keyboardFocusedElement];
  id v32 = [v33 identifier];
  -[TVSSHUDBoxedValueVisualization setValue:](keyboardFocusedElementIdViz, "setValue:");

  focusedBundleIdViz = v48->_focusedBundleIdViz;
  id v36 = [v47[0] keyboardFocusedElement];
  id v35 = [v36 bundleIdentifier];
  -[TVSSHUDBoxedValueVisualization setValue:](focusedBundleIdViz, "setValue:");

  bannerRequestedVisibilityViz = v48->_bannerRequestedVisibilityViz;
  id v39 = [v47[0] bannerContext];
  id v38 = TVSSMenuModeBannerPresentationStateDescription((unint64_t)[v39 bannerPresentationState]);
  -[TVSSHUDValueHistoryVisualization setValue:](bannerRequestedVisibilityViz, "setValue:");

  headboardRequestedVisibilityViz = v48->_headboardRequestedVisibilityViz;
  v41 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] headboardRequestedVisibility] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](headboardRequestedVisibilityViz, "setValue:");

  id v46 = [v47[0] interactionRequestReason];
  if (v46)
  {
    id v45 = [v46 integerValue];
    id v27 = (id)PBSystemUIServicePresentMenuReasonName(v45);
    -[TVSSHUDBoxedValueVisualization setValue:](v48->_openRequestedReasonViz, "setValue:");
  }

  else
  {
    -[TVSSHUDBoxedValueVisualization setValue:](v48->_openRequestedReasonViz, "setValue:", @"None");
  }

  hasUserAttentionViz = v48->_hasUserAttentionViz;
  id v5 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] hasUserAttention] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](hasUserAttentionViz, "setValue:");

  splitViewVisibleViz = v48->_splitViewVisibleViz;
  id v7 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] isSplitViewVisible] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](splitViewVisibleViz, "setValue:");

  locationInUseViz = v48->_locationInUseViz;
  id v9 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] isLocationInUse] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](locationInUseViz, "setValue:");

  cameraInUseViz = v48->_cameraInUseViz;
  id v11 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] isCameraInUse] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](cameraInUseViz, "setValue:");

  micInUseViz = v48->_micInUseViz;
  id v13 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] isMicInUse] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](micInUseViz, "setValue:");

  playerControlStateViz = v48->_playerControlStateViz;
  id v15 = (id)PBSystemUIServicePlaybackControlsStateDescription([v47[0] playbackControlsState]);
  -[TVSSHUDBoxedValueVisualization setValue:](playerControlStateViz, "setValue:");

  faceTimeActiveViz = v48->_faceTimeActiveViz;
  SEL v17 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] isFaceTimeActive] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](faceTimeActiveViz, "setValue:");

  playbackStateViz = v48->_playbackStateViz;
  v21 = -[TVSSDebugInfoHUDViewController audioNowPlayingController](v48, "audioNowPlayingController");
  v20 = -[TVSSAudioNowPlayingController nowPlayingState](v21, "nowPlayingState");
  id v19 = TVSSPlabackStateDescription(-[TVSSNowPlayingState playbackState](v20, "playbackState"));
  -[TVSSHUDBoxedValueVisualization setValue:](playbackStateViz, "setValue:");

  siriPresentationVisibilityViz = v48->_siriPresentationVisibilityViz;
  id v23 = (id)PBSystemUISiriPresentationVisibilityDescription([v47[0] siriPresentationVisibility]);
  -[TVSSHUDBoxedValueVisualization setValue:](siriPresentationVisibilityViz, "setValue:");

  dictationViz = v48->_dictationViz;
  v25 =  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  (unint64_t)[v47[0] isDictating] & 1);
  -[TVSSHUDBoxedValueVisualization setValue:](dictationViz, "setValue:");

  v26 = -[TVSSDebugInfoHUDViewController privacyController](v48, "privacyController");
  id v44 = -[TVSSPrivacyController privacyState](v26, "privacyState");

  id v43 = [v44 locationIndicator];
  if (v43)
  {
    id v3 = TVSSPrivacyIndicatorDisplayLocationDescription((uint64_t)[v43 displayLocation]);
    -[TVSSHUDBoxedValueVisualization setValue:](v48->_locationIndicatorDisplayLocationViz, "setValue:");
  }

  else
  {
    -[TVSSHUDBoxedValueVisualization setValue:](v48->_locationIndicatorDisplayLocationViz, "setValue:", @"None");
  }

  id location = [v44 recordingIndicator];
  if (location)
  {
    v2 = TVSSPrivacyIndicatorDisplayLocationDescription((uint64_t)[location displayLocation]);
    -[TVSSHUDBoxedValueVisualization setValue:](v48->_recordingIndicatorDisplayLocationViz, "setValue:");
  }

  else
  {
    -[TVSSHUDBoxedValueVisualization setValue:](v48->_recordingIndicatorDisplayLocationViz, "setValue:", @"None");
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(v47, 0LL);
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (void)setMenuModeController:(id)a3
{
}

- (TVSSPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void)setPrivacyController:(id)a3
{
}

- (TVSSAudioNowPlayingController)audioNowPlayingController
{
  return self->_audioNowPlayingController;
}

- (void)setAudioNowPlayingController:(id)a3
{
}

- (TVSSHUDView)hudView
{
  return self->_hudView;
}

- (void)setHudView:(id)a3
{
}

- (TVSSHUDValueHistoryVisualization)modeViz
{
  return self->_modeViz;
}

- (void)setModeViz:(id)a3
{
}

- (TVSSHUDValueHistoryVisualization)bannerRequestedVisibilityViz
{
  return self->_bannerRequestedVisibilityViz;
}

- (void)setBannerRequestedVisibilityViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)keyboardFocusedElementIdViz
{
  return self->_keyboardFocusedElementIdViz;
}

- (void)setKeyboardFocusedElementIdViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)focusedBundleIdViz
{
  return self->_focusedBundleIdViz;
}

- (void)setFocusedBundleIdViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)headboardRequestedVisibilityViz
{
  return self->_headboardRequestedVisibilityViz;
}

- (void)setHeadboardRequestedVisibilityViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)openRequestedReasonViz
{
  return self->_openRequestedReasonViz;
}

- (void)setOpenRequestedReasonViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)hasUserAttentionViz
{
  return self->_hasUserAttentionViz;
}

- (void)setHasUserAttentionViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)splitViewVisibleViz
{
  return self->_splitViewVisibleViz;
}

- (void)setSplitViewVisibleViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)locationInUseViz
{
  return self->_locationInUseViz;
}

- (void)setLocationInUseViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)locationIndicatorDisplayLocationViz
{
  return self->_locationIndicatorDisplayLocationViz;
}

- (void)setLocationIndicatorDisplayLocationViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)cameraInUseViz
{
  return self->_cameraInUseViz;
}

- (void)setCameraInUseViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)micInUseViz
{
  return self->_micInUseViz;
}

- (void)setMicInUseViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)recordingIndicatorDisplayLocationViz
{
  return self->_recordingIndicatorDisplayLocationViz;
}

- (void)setRecordingIndicatorDisplayLocationViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)playerControlStateViz
{
  return self->_playerControlStateViz;
}

- (void)setPlayerControlStateViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)faceTimeActiveViz
{
  return self->_faceTimeActiveViz;
}

- (void)setFaceTimeActiveViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)playbackStateViz
{
  return self->_playbackStateViz;
}

- (void)setPlaybackStateViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)siriPresentationVisibilityViz
{
  return self->_siriPresentationVisibilityViz;
}

- (void)setSiriPresentationVisibilityViz:(id)a3
{
}

- (TVSSHUDBoxedValueVisualization)dictationViz
{
  return self->_dictationViz;
}

- (void)setDictationViz:(id)a3
{
}

- (void).cxx_destruct
{
}

@end