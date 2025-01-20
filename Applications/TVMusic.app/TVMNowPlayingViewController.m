@interface TVMNowPlayingViewController
+ (void)initialize;
- (BOOL)_changeMediaInDirection:(int64_t)a3;
- (BOOL)_delegateHandlerForControlGesture:(int64_t)a3;
- (BOOL)_doesDelegateHandleControlGestures;
- (BOOL)_isAudioOnDemand;
- (BOOL)_isCellFocused;
- (BOOL)_isDescendentOfViewController:(id)a3;
- (BOOL)_isMediaItemExplicit:(id)a3;
- (BOOL)_isScrubberActive;
- (BOOL)_isScrubbingAllowed;
- (BOOL)_isSingleCoverFocusable;
- (BOOL)_isSingleCoverFocusableState:(id)a3 viewStyle:(int64_t)a4 hasLyrics:(BOOL)a5;
- (BOOL)_isStreamingLive;
- (BOOL)_isStreamingRadioPlayback;
- (BOOL)_isUnknownItemType;
- (BOOL)_isVideoPresented;
- (BOOL)_shouldShowTransportBar;
- (BOOL)_skipForwardOrBackIfNeeded;
- (BOOL)_tvTabBarShouldAutohide;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isDismissingVideoView;
- (BOOL)isMainTabView;
- (BOOL)isRadioPlayback;
- (BOOL)isRestMode;
- (BOOL)isScrubbing;
- (BOOL)isShowingIdleViewController;
- (BOOL)isShowingModalPopup;
- (BOOL)isTransportBarVisible;
- (BOOL)isViewSeen;
- (BOOL)isViewVisible;
- (BOOL)keepTransportBarVisible;
- (BOOL)musicVideoPlayerViewControllerShouldDismiss:(id)a3;
- (BOOL)nowPlayingSnapshotBackgroundViewShouldPerformSnapshot:(id)a3;
- (BOOL)nowPlayingViewShouldHandlePressPlayPause:(id)a3;
- (BOOL)playerViewControllerShouldDismiss:(id)a3;
- (BOOL)popWhenPlayerStops;
- (BOOL)scrollWithPlayingItem;
- (BOOL)scrubWasDecelerating;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showAnimatedBackground;
- (BOOL)singleCoverOnly;
- (BOOL)waitingForPlayerJump;
- (BSInvalidatable)partyStudioIdleTimerAssertion;
- (CGPoint)_contentOffsetForIndexPath:(id)a3;
- (CGPoint)_contentOffsetForScrubPercentage:(double)a3 withScrollView:(id)a4;
- (CGRect)_cameraOptionsFrameAtPosition:(CGPoint)a3 size:(CGSize)a4;
- (CGRect)_idleViewControllerTargetCoverFrame;
- (CGRect)musicVideoPlayerViewController:(id)a3 rectForPresentationAnimationTransitionInSourceView:(id)a4;
- (CGSize)_itemSizeForMediaItem:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MPAVRoute)endpointRoute;
- (NSArray)partyStudioAnimators;
- (NSCache)motionArtworkCache;
- (NSDate)lastObserverFireDate;
- (NSIndexPath)centerIndexPath;
- (NSIndexPath)initialIndexPath;
- (NSIndexPath)lastFocusedIndexPath;
- (NSLayoutConstraint)songInfoViewBottomConstraint;
- (NSMapTable)motionArtworkTable;
- (NSTimer)updateTimer;
- (TVMNowPlayingCompactMetadataView)songInfoView;
- (TVMNowPlayingViewController)initWithPlayer:(id)a3;
- (TVMNowPlayingViewController)initWithPlayer:(id)a3 options:(int64_t)a4;
- (TVMusicAudioTransportBarView)transportBar;
- (TVMusicBarsView)musicBarsView;
- (TVMusicDefiniteDurationPlaybackProgress)definiteDurationPlaybackProgress;
- (TVMusicMPObjectMediaItem)singleCoverMediaItem;
- (TVMusicNowPlayingContentView)partyStudioArtworkTransitionView;
- (TVMusicNowPlayingContentView)singleCoverView;
- (TVMusicNowPlayingViewPresentation)viewPresentation;
- (TVMusicPlaybackProgressAnimator)playbackProgressAnimator;
- (TVMusicPlayer)player;
- (TVMusicScrubbingConfiguration)scrubbingConfiguration;
- (TVMusicUltrawideScreenManager)ultrawideScreenManager;
- (TVMusicVideoPlayerViewController)videoPlayerViewController;
- (TVPHardwareButtonEventManager)buttonEventManager;
- (TVPMusicNowPlayingBackgroundProvider)customBackgroundProvider;
- (TVPPlaybackViewControllerDelegate)playbackDelegate;
- (TVSStateMachine)stateMachine;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIContextMenuInteraction)singleCoverContextMenuInteraction;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIFocusGuide)transportBarFocusGuide;
- (UIScrollView)scrubScrollView;
- (UIView)controlsShadowView;
- (UIView)embeddedVideoView;
- (UIView)lastFocusedControl;
- (UIView)songInfoViewContainer;
- (UIView)videoDimmingView;
- (UIView)vocalsMessageView;
- (UIViewController)idleViewController;
- (UIViewPropertyAnimator)singleCoverViewAnimator;
- (UIViewPropertyAnimator)videoDismissAnimator;
- (UIViewPropertyAnimator)videoPresentAnimator;
- (_TVMusicNowPlayingIdleViewControllerContext)idleViewControllerContext;
- (_TVMusicNowPlayingInvalidationContext)invalidationContext;
- (_TVMusicNowPlayingSelectedItemCoordinator)selectedItemCoordinator;
- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)controlsView;
- (double)_elapsedTimeForScrubPercentage:(double)a3;
- (double)_removeIdleViewControllerAndRestoreLayout:(BOOL)a3 animatingBeforePlaylist:(BOOL)a4;
- (double)_scrubPercentageForContentOffset:(CGPoint)a3 withScrollView:(id)a4;
- (double)_scrubPercentageForElapsedTime:(double)a3;
- (double)currentElapsedTimeForPlaybackProgressAnimator:(id)a3;
- (double)initialScrubPercentage;
- (double)lastKnownElapsedTime;
- (double)lastKnownPlaylistCollectionViewWidth;
- (double)playlistExitTime;
- (double)scrubPercentage;
- (double)songInfoTimeout;
- (id)_cellForMediaItem:(id)a3;
- (id)_cellForSingleCoverMediaItem;
- (id)_indexPathForPlayingItem;
- (id)_itemIdentifierForPlayingItem;
- (id)_loadStringValueForMetadataItem:(id)a3;
- (id)_mediaItemAtCenterOfPlaylistCollectionView;
- (id)_motionArtworkForItemIdentifier:(id)a3;
- (id)_nowPlayingInfoFromMediaItem:(id)a3;
- (id)_placeholderBackgroundColor;
- (id)_placeholderColor;
- (id)_playlistCollectionView;
- (id)collectionView:(id)a3 cellForMediaItem:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)elapsedTimeToken;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)mediaItemAtIndex:(int64_t)a3;
- (id)nowPlayingCurrentLyricsViewController:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_forwardAccessoryTypeForCenterRestState;
- (int64_t)_indexForPlayingItem;
- (int64_t)_preferredAccessoryTypeForCurrentState;
- (int64_t)initialViewMode;
- (int64_t)nowPlayingOptions;
- (int64_t)numberOfMediaItems;
- (int64_t)viewStyle;
- (void)_addControlsShadowView;
- (void)_addControlsView;
- (void)_addGestureRecognizers;
- (void)_addSongInfoView;
- (void)_addTransportBar;
- (void)_addVocalsMessageView;
- (void)_beginBatchUpdates:(id)a3;
- (void)_cleanupPartyStudioCameraMenu;
- (void)_configurePlayingCellForIndexPath:(id)a3;
- (void)_didBecomeActive:(id)a3;
- (void)_dismissCameraPicker;
- (void)_dismissPartyStudioCameraMenuAnimated:(BOOL)a3;
- (void)_dismissVideoViewController;
- (void)_dismissVideoViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_enableScrollWithPlayingItemIfNeeded;
- (void)_fingerRestRecognized:(id)a3;
- (void)_finishBatchUpdates:(id)a3;
- (void)_focusCurrentPlayingItem;
- (void)_focusCurrentPlayingItemAnimated:(BOOL)a3;
- (void)_handleCoverSelected:(id)a3;
- (void)_handleLeftLongClick:(id)a3;
- (void)_handleLeftTap:(id)a3;
- (void)_handleLongClick:(id)a3;
- (void)_handleMenuButton:(id)a3;
- (void)_handlePhysicalSelectButton:(id)a3;
- (void)_handleRightLongClick:(id)a3;
- (void)_handleRightTap:(id)a3;
- (void)_handleSelectButton:(id)a3;
- (void)_handleStateToggleGesture:(id)a3;
- (void)_handleTogglePlayPause;
- (void)_handleTouchInteractionGesture:(id)a3;
- (void)_hideSongInfoViewAnimated:(BOOL)a3;
- (void)_hideSongInfoViewAnimated:(BOOL)a3 slideOut:(BOOL)a4;
- (void)_makePartyStudioIdleTimerAssertion;
- (void)_metadataDidChange:(id)a3;
- (void)_performPlayNextCommandForItemAtIndex:(int64_t)a3;
- (void)_playMediaItemAtIndex:(int64_t)a3;
- (void)_playbackDidError:(id)a3;
- (void)_playbackMediaItemDidChange:(id)a3;
- (void)_playbackPlayerPathDidChange:(id)a3;
- (void)_playbackStateDidChange:(id)a3;
- (void)_playbackVideoOutputDidChange:(id)a3;
- (void)_presentVideoViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentation:(id)a3 didChangeShowCamera:(BOOL)a4 shouldAnimate:(BOOL)a5;
- (void)_registerStateMachineHandlers;
- (void)_releasePartyStudioIdleTimerAssertion;
- (void)_removeIdleViewControllerAndRestoreLayout:(BOOL)a3;
- (void)_resetSongInfoTimeout;
- (void)_scrollCollectionView:(id)a3 toIndexPath:(id)a4 animated:(BOOL)a5;
- (void)_scrubScrollViewDidEndDecelerating;
- (void)_scrubScrollViewDidEndDraggingAndWillDecelerate:(BOOL)a3;
- (void)_scrubScrollViewDidScroll;
- (void)_scrubScrollViewWillBeginDragging;
- (void)_scrubScrollViewWillEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4;
- (void)_setBackdropForMediaItem:(id)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)_setIdleViewController:(id)a3 forMediaItem:(id)a4;
- (void)_setPlayerElapsedTimeFromScrubberPosition;
- (void)_showCameraPicker;
- (void)_showContextMenu;
- (void)_showPartyStudioCameraMenuFromButtonFrame:(CGRect)a3;
- (void)_showSongInfoViewAnimated:(BOOL)a3;
- (void)_showSongInfoViewIfNecessary;
- (void)_startPlaylistExitTimeout:(int64_t)a3;
- (void)_syncPlaybackProgressAnimatorToTransportBarVisibleState:(BOOL)a3;
- (void)_timerTick:(id)a3;
- (void)_transitionToPlaylistWithAfterCurrentStateTransitionBlock:(id *)a3 animated:(BOOL)a4;
- (void)_updateAudioRoute;
- (void)_updateEmbeddedVideoView;
- (void)_updateFocusOnScrollEnd;
- (void)_updateForViewStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateIdleViewControllerIfNeeded;
- (void)_updateInterfaceForState:(id)a3 fromState:(id)a4;
- (void)_updateNowPlayingHeader;
- (void)_updateNowPlayingView;
- (void)_updateNowPlayingViewAnimated:(BOOL)a3;
- (void)_updateOffsetWithElapsedTime:(double)a3;
- (void)_updateScrubPercentageWithScrollView:(id)a3;
- (void)_updateSingleCoverView;
- (void)_updateSongInfoViewConstraints:(BOOL)a3 willShowTransportBar:(BOOL)a4;
- (void)_updateVideoViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateVocalsMessageAnimated:(BOOL)a3;
- (void)_willCloseVocalAttenuationView:(id)a3;
- (void)_willOpenVocalAttenuationView:(id)a3;
- (void)_willStartUserInitiatedPlayback;
- (void)cameraControllerConnectionDidChange:(id)a3;
- (void)cameraOptionsViewController:(id)a3 didFinishWithEffect:(id)a4;
- (void)cameraOptionsViewControllerDidTapConnect:(id)a3;
- (void)cameraOptionsViewControllerDidTapDevice:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureVideoForVisibleCells;
- (void)configureVideoForVisibleCellsWithPlayingIndexPath:(id)a3;
- (void)createNewIdleViewControllerForMediaItem:(id)a3;
- (void)dealloc;
- (void)didEndUserEngagingLyrics;
- (void)didShowPictureInPicture;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)nowPlayingView:(id)a3 playlistWillBecomeHiddenWithAnimator:(id)a4 executionBlock:(id)a5;
- (void)nowPlayingView:(id)a3 playlistWillBecomeVisibleWithAnimator:(id)a4 interruptingTransition:(BOOL)a5;
- (void)nowPlayingViewDidPressPlayPause:(id)a3;
- (void)nowPlayingViewDidSelectRepeat:(id)a3;
- (void)nowPlayingViewDidSelectShuffle:(id)a3;
- (void)nowPlayingViewLyricsSelected:(id)a3;
- (void)nowPlayingViewPlaylistDidBecomeHidden:(id)a3;
- (void)nowPlayingViewPlaylistDidBecomeVisible:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performBatchUpdates:(id)a3;
- (void)playbackProgressAnimator:(id)a3 updateTitlesForElapsedTime:(double)a4 withPlaybackDuration:(double)a5;
- (void)presentation:(id)a3 didChangeShowCamera:(BOOL)a4;
- (void)presentation:(id)a3 didChangeShowEffects:(BOOL)a4 buttonFrame:(CGRect)a5;
- (void)presentation:(id)a3 didChangeShowInfo:(BOOL)a4;
- (void)presentation:(id)a3 didChangeStyle:(int64_t)a4;
- (void)presentation:(id)a3 didChangeVocalControl:(BOOL)a4;
- (void)reloadPlaylist;
- (void)resumeAnimatingMusicBars;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setButtonEventManager:(id)a3;
- (void)setCenterIndexPath:(id)a3;
- (void)setControlsShadowView:(id)a3;
- (void)setControlsView:(id)a3;
- (void)setCustomBackgroundProvider:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefiniteDurationPlaybackProgress:(id)a3;
- (void)setDismissingVideoView:(BOOL)a3;
- (void)setElapsedTimeToken:(id)a3;
- (void)setEmbeddedVideoView:(id)a3;
- (void)setEndpointRoute:(id)a3;
- (void)setIdleViewController:(id)a3;
- (void)setIdleViewControllerContext:(id)a3;
- (void)setInitialIndexPath:(id)a3;
- (void)setInitialScrubPercentage:(double)a3;
- (void)setInitialViewMode:(int64_t)a3;
- (void)setInvalidationContext:(id)a3;
- (void)setIsRadioPlayback:(BOOL)a3;
- (void)setIsRestMode:(BOOL)a3;
- (void)setIsShowingModalPopup:(BOOL)a3;
- (void)setKeepTransportBarVisible:(BOOL)a3;
- (void)setLastFocusedControl:(id)a3;
- (void)setLastFocusedIndexPath:(id)a3;
- (void)setLastKnownElapsedTime:(double)a3;
- (void)setLastKnownPlaylistCollectionViewWidth:(double)a3;
- (void)setLastObserverFireDate:(id)a3;
- (void)setMotionArtworkCache:(id)a3;
- (void)setMotionArtworkTable:(id)a3;
- (void)setNowPlayingOptions:(int64_t)a3;
- (void)setPartyStudioAnimators:(id)a3;
- (void)setPartyStudioArtworkTransitionView:(id)a3;
- (void)setPartyStudioIdleTimerAssertion:(id)a3;
- (void)setPlaybackDelegate:(id)a3;
- (void)setPlaybackProgressAnimator:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlaylistExitTime:(double)a3;
- (void)setPopWhenPlayerStops:(BOOL)a3;
- (void)setScrollWithPlayingItem:(BOOL)a3;
- (void)setScrubPercentage:(double)a3;
- (void)setScrubScrollView:(id)a3;
- (void)setScrubWasDecelerating:(BOOL)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setScrubbingConfiguration:(id)a3;
- (void)setSelectedItemCoordinator:(id)a3;
- (void)setShowAnimatedBackground:(BOOL)a3;
- (void)setShowingIdleViewController:(BOOL)a3;
- (void)setSingleCoverContextMenuInteraction:(id)a3;
- (void)setSingleCoverMediaItem:(id)a3;
- (void)setSingleCoverOnly:(BOOL)a3;
- (void)setSingleCoverView:(id)a3;
- (void)setSingleCoverViewAnimator:(id)a3;
- (void)setSongInfoTimeout:(double)a3;
- (void)setSongInfoView:(id)a3;
- (void)setSongInfoViewBottomConstraint:(id)a3;
- (void)setSongInfoViewContainer:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTransportBar:(id)a3;
- (void)setTransportBarFocusGuide:(id)a3;
- (void)setTransportBarVisible:(BOOL)a3;
- (void)setTransportBarVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setTransportBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setUltrawideScreenManager:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)setVideoDimmingView:(id)a3;
- (void)setVideoDismissAnimator:(id)a3;
- (void)setVideoPlayerViewController:(id)a3;
- (void)setVideoPresentAnimator:(id)a3;
- (void)setViewPresentation:(id)a3;
- (void)setViewSeen:(BOOL)a3;
- (void)setViewStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setViewVisible:(BOOL)a3;
- (void)setVocalsMessageView:(id)a3;
- (void)setWaitingForPlayerJump:(BOOL)a3;
- (void)skipToNextItemForPlayerViewController:(id)a3;
- (void)skipToPreviousItemForPlayerViewController:(id)a3;
- (void)stopAnimatingMusicBars;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIdleViewControllerIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
- (void)willStopPictureInPictureWithCompletion:(id)a3;
- (void)willUserEngageLyrics;
@end

@implementation TVMNowPlayingViewController

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.AppleTV.playback", "TVPMusicNowPlaying");
  v3 = (void *)qword_1002BEBE8;
  qword_1002BEBE8 = (uint64_t)v2;
}

- (TVMNowPlayingViewController)initWithPlayer:(id)a3
{
  return -[TVMNowPlayingViewController initWithPlayer:options:](self, "initWithPlayer:options:", a3, 0LL);
}

- (TVMNowPlayingViewController)initWithPlayer:(id)a3 options:(int64_t)a4
{
  id v7 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  v8 = -[TVMNowPlayingViewController initWithNibName:bundle:](&v46, "initWithNibName:bundle:", 0LL, 0LL);
  v9 = v8;
  if (v8)
  {
    p_player = (id *)&v8->_player;
    objc_storeStrong((id *)&v8->_player, a3);
    v9->_nowPlayingOptions = a4;
    v9->_scrollWithPlayingItem = 1;
    v11 = objc_alloc_init(&OBJC_CLASS___NSCache);
    motionArtworkCache = v9->_motionArtworkCache;
    v9->_motionArtworkCache = v11;

    -[NSCache setCountLimit:](v9->_motionArtworkCache, "setCountLimit:", 4LL);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    motionArtworkTable = v9->_motionArtworkTable;
    v9->_motionArtworkTable = (NSMapTable *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    partyStudioAnimators = v9->_partyStudioAnimators;
    v9->_partyStudioAnimators = (NSArray *)v15;

    objc_initWeak(&location, v9);
    v17 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000BD484;
    v43[3] = &unk_10026DCB8;
    objc_copyWeak(&v44, &location);
    v18 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v17,  "initWithName:initialState:mode:stateChangeHandler:",  @"NowPlayingStateMachine",  @"Uninitialized",  0LL,  v43);
    stateMachine = v9->_stateMachine;
    v9->_stateMachine = v18;

    -[TVSStateMachine setCallsStateChangeHandlerSynchronously:]( v9->_stateMachine,  "setCallsStateChangeHandlerSynchronously:",  1LL);
    -[TVSStateMachine setLogObject:](v9->_stateMachine, "setLogObject:", qword_1002BEBE8);
    -[TVMNowPlayingViewController _registerStateMachineHandlers](v9, "_registerStateMachineHandlers");
    v20 = objc_alloc_init(&OBJC_CLASS___TVMusicBarsView);
    musicBarsView = v9->_musicBarsView;
    v9->_musicBarsView = v20;

    -[TVMusicBarsView setMusicBarsStyle:](v9->_musicBarsView, "setMusicBarsStyle:", 2LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([*p_player playQueue]);
    [v22 addObserver:v9 selector:"_playbackVideoOutputDidChange:" name:@"TVMusicPlayQueueVideoOutputChangedNotification" object:v23];

    [v22 addObserver:v9 selector:"_playbackPlayerPathDidChange:" name:@"TVMusicPlayQueuePlayerPathChangedNotification" object:0];
    [v22 addObserver:v9 selector:"_playbackMediaItemDidChange:" name:TVPPlaybackCurrentMediaItemDidChangeNotification object:*p_player];
    [v22 addObserver:v9 selector:"_playbackStateDidChange:" name:TVPPlaybackStateDidChangeNotification object:*p_player];
    [v22 addObserver:v9 selector:"_playbackDidError:" name:TVPPlaybackErrorNotification object:*p_player];
    [v22 addObserver:v9 selector:"_metadataDidChange:" name:TVPMediaItemMetadataDidChangeNotification object:0];
    [v22 addObserver:v9 selector:"_didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicNowPlayingPlayerControlsView didSelectContextMenuNotification]( &OBJC_CLASS____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView,  "didSelectContextMenuNotification"));
    [v22 addObserver:v9 selector:"_controlsViewDidSelectContextMenu:" name:v24 object:0];

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification willOpenVocalAttenuationView]( &OBJC_CLASS___NSNotification,  "willOpenVocalAttenuationView"));
    [v22 addObserver:v9 selector:"_willOpenVocalAttenuationView:" name:v25 object:0];

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification willCloseVocalAttenuationView]( &OBJC_CLASS___NSNotification,  "willCloseVocalAttenuationView"));
    [v22 addObserver:v9 selector:"_willCloseVocalAttenuationView:" name:v26 object:0];

    [*p_player addObserver:v9 forKeyPath:@"playlist" options:11 context:0];
    [*p_player addObserver:v9 forKeyPath:@"isLive" options:11 context:0];
    [*p_player addObserver:v9 forKeyPath:@"playlist.supportsShuffle" options:1 context:off_1002B6D80];
    [*p_player addObserver:v9 forKeyPath:@"playlist.supportsRepeat" options:1 context:off_1002B6D88];
    [*p_player addObserver:v9 forKeyPath:@"playlist.shuffleEnabled" options:1 context:off_1002B6D90];
    [*p_player addObserver:v9 forKeyPath:@"playlist.repeatMode" options:1 context:off_1002B6D98];
    [*p_player addObserver:v9 forKeyPath:@"bufferedTimeRange" options:5 context:off_1002B6DA0];
    [*p_player addObserver:v9 forKeyPath:@"playQueue.canEnableVocalAttenuation" options:1 context:off_1002B6DA8];
    if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
      && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[PSCameraController sharedInstance](&OBJC_CLASS___PSCameraController, "sharedInstance"));
      [v27 addObserver:v9];
    }

    id v28 = *p_player;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000BD4F0;
    v41[3] = &unk_10026DCE0;
    objc_copyWeak(&v42, &location);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 addElapsedTimeObserver:v41]);
    id elapsedTimeToken = v9->_elapsedTimeToken;
    v9->_id elapsedTimeToken = (id)v29;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  v31 = objc_alloc(&OBJC_CLASS___TVPHardwareButtonEventManager);
  v33 = (objc_class *)objc_opt_class(v9, v32);
  v34 = NSStringFromClass(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = -[TVPHardwareButtonEventManager initWithName:](v31, "initWithName:", v35);
  buttonEventManager = v9->_buttonEventManager;
  v9->_buttonEventManager = v36;

  v38 = -[TVMusicUltrawideScreenManager initWithUltrawideStateChangeCompletion:]( objc_alloc(&OBJC_CLASS___TVMusicUltrawideScreenManager),  "initWithUltrawideStateChangeCompletion:",  0LL);
  ultrawideScreenManager = v9->_ultrawideScreenManager;
  v9->_ultrawideScreenManager = v38;

  return v9;
}

- (BOOL)isMainTabView
{
  return -[TVMNowPlayingViewController nowPlayingOptions](self, "nowPlayingOptions") & 1;
}

- (void)_beginBatchUpdates:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext", a3));

  if (v4)
  {
    id v5 = sub_1000BD900();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));
      int v12 = 136315650;
      uint64_t v13 = "-[TVMNowPlayingViewController _beginBatchUpdates:]";
      __int16 v14 = 2080;
      uint64_t v15 = "-[TVMNowPlayingViewController _beginBatchUpdates:]";
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Batch Updates: Performed when an existing update has not been committed: %@",  (uint8_t *)&v12,  0x20u);
    }
  }

  v8 = objc_alloc_init(&OBJC_CLASS____TVMusicNowPlayingInvalidationContext);
  -[TVMNowPlayingViewController setInvalidationContext:](self, "setInvalidationContext:", v8);
  id v9 = sub_1000BD900();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));
    int v12 = 136315650;
    uint64_t v13 = "-[TVMNowPlayingViewController _beginBatchUpdates:]";
    __int16 v14 = 2080;
    uint64_t v15 = "-[TVMNowPlayingViewController _beginBatchUpdates:]";
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Batch Updates: Beginning with context: %@",  (uint8_t *)&v12,  0x20u);
  }
}

- (void)_finishBatchUpdates:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000BD900();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));
    *(_DWORD *)buf = 136315650;
    v72 = "-[TVMNowPlayingViewController _finishBatchUpdates:]";
    __int16 v73 = 2080;
    v74 = "-[TVMNowPlayingViewController _finishBatchUpdates:]";
    __int16 v75 = 2112;
    v76 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Batch Updates: Finishing with context: %@",  buf,  0x20u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 objectForKeyedSubscript:@"TVPMusicPlaylistTransitioningAnimationTypeUserInfoKey"]);
    uint64_t v12 = (uint64_t)[v11 integerValue];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
    __int16 v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 currentState]);
    if (v14 == @"Rest mode")
    {
      unsigned int v15 = [v9 playingItem];

      if (v15) {
        uint64_t v12 = 1LL;
      }
    }

    else
    {
    }

    if (![v9 queue])
    {
LABEL_39:
      if (![v9 video])
      {
LABEL_48:
        if ([v9 playingItem])
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12 == 0));
          [v53 setObject:v54 forKeyedSubscript:@"TVPMusicNowPlayingEventShouldAnimateUserInfoKey"];

          v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
          [v55 postEvent:@"Track changed" withContext:0 userInfo:v53];
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
        v57 = (void *)objc_claimAutoreleasedReturnValue( [v56 objectForKeyedSubscript:@"TVPMusicPlaylistTransitioningShowPlaylist"]);
        unsigned int v58 = [v57 BOOLValue];

        if (v58)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
          v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v59 currentState]);

          if (v60 == @"Rest mode")
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
            [v61 postEvent:@"Force active mode"];
          }
        }

        -[TVMNowPlayingViewController setInvalidationContext:](self, "setInvalidationContext:", 0LL);

        goto LABEL_54;
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController parentViewController](self, "parentViewController"));

      if (v44)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
        objc_super v46 = (void *)objc_claimAutoreleasedReturnValue([v43 playQueue]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 videoOutput]);
        [v45 setVideoOutput:v47];
      }

      -[TVMNowPlayingViewController _updateEmbeddedVideoView](self, "_updateEmbeddedVideoView");
      v48 = (void *)objc_claimAutoreleasedReturnValue([v43 currentMediaItem]);
      -[TVMNowPlayingViewController _setBackdropForMediaItem:](self, "_setBackdropForMediaItem:", v48);

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue([v49 currentState]);
      if (v50 == @"Rest mode")
      {
      }

      else
      {
        v51 = v50;
        unsigned __int8 v52 = -[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented");

        if ((v52 & 1) == 0) {
          goto LABEL_47;
        }
      }

      -[TVMNowPlayingViewController _updateVideoViewControllerAnimated:completion:]( self,  "_updateVideoViewControllerAnimated:completion:",  0LL,  0LL);
LABEL_47:

      goto LABEL_48;
    }

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v17 itemIdentifierForIndexPath:v18]);
    }

    else
    {
      v19 = 0LL;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 playQueue]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 activeList]);

    v23 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
    -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:]( v23,  "appendSectionsWithIdentifiers:",  &off_1002822D0);
    if (v22) {
      v24 = v22;
    }
    else {
      v24 = &__NSArray0__struct;
    }
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:](v23, "appendItemsWithIdentifiers:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    [v25 applySnapshot:v23 animatingDifferences:1];

    if (![v22 count]) {
      [v9 setPlayingItem:1];
    }
    if (([v9 playingItem] & 1) != 0 || !v19)
    {
      if ([v9 playingItem])
      {
        uint64_t v31 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
        if (!v31
          || (uint64_t v32 = (void *)v31,
              v62 = v19,
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem")),
              id v34 = -[NSDiffableDataSourceSnapshot indexOfItemIdentifier:](v23, "indexOfItemIdentifier:", v33),
              v33,
              v19 = v62,
              v32,
              v34 == (id)0x7FFFFFFFFFFFFFFFLL))
        {
          -[TVMNowPlayingViewController setScrollWithPlayingItem:](self, "setScrollWithPlayingItem:", 1LL);
        }
      }

      goto LABEL_38;
    }

    uint64_t v64 = v12;
    id v65 = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 indexPathForItemIdentifier:v19]);

    if (v27)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
      unsigned __int8 v29 = [v27 isEqual:v28];

      if ((v29 & 1) != 0)
      {
LABEL_37:

        uint64_t v12 = v64;
        id v4 = v65;
LABEL_38:

        goto LABEL_39;
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v30,  v27,  1LL);
    }

    else
    {
      v63 = v19;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v35 indexPathsForVisibleItems]);

      id v36 = [v30 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v67;
LABEL_28:
        uint64_t v39 = 0LL;
        while (1)
        {
          if (*(void *)v67 != v38) {
            objc_enumerationMutation(v30);
          }
          v40 = *(void **)(*((void *)&v66 + 1) + 8 * v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
          LOBYTE(v40) = [v40 isEqual:v41];

          if (v37 == (id)++v39)
          {
            id v37 = [v30 countByEnumeratingWithState:&v66 objects:v70 count:16];
            if (v37) {
              goto LABEL_28;
            }
            goto LABEL_34;
          }
        }
      }

      else
      {
LABEL_34:

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        id v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
        -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v30,  v42,  0LL);
      }

      v27 = 0LL;
      v19 = v63;
    }

    goto LABEL_37;
  }

- (void)performBatchUpdates:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
    [v8 reloadData];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController traitCollection](self, "traitCollection"));
    id v10 = [v9 userInterfaceStyle];

    if (v10 == (id)2) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    -[TVMusicBarsView setMusicBarsStyle:](self->_musicBarsView, "setMusicBarsStyle:", v11);
  }

- (void)viewWillAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController viewWillAppear:](&v26, "viewWillAppear:", a3);
  -[TVPHardwareButtonEventManager setCanAcceptHardwareButtonEvents:]( self->_buttonEventManager,  "setCanAcceptHardwareButtonEvents:",  1LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"TVMusicNowPlayingWillAppear" object:self];

  objc_initWeak(&location, self);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_1000BE3FC;
  v23 = &unk_10026B0C0;
  objc_copyWeak(&v24, &location);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v20,  0.2));
  -[TVMNowPlayingViewController setUpdateTimer:](self, "setUpdateTimer:", v5, v20, v21, v22, v23);

  -[TVMNowPlayingViewController reloadPlaylist](self, "reloadPlaylist");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
  [v6 setShouldAcceptEvents:1];

  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
  if (v7 == @"Uninitialized")
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    [v9 layoutIfNeeded];

    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Initialize");
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _itemIdentifierForPlayingItem](self, "_itemIdentifierForPlayingItem"));
    -[TVMNowPlayingViewController setSingleCoverMediaItem:](self, "setSingleCoverMediaItem:", v8);

    -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", 2LL);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentMediaItem]);

  if (v11)
  {
    -[TVMNowPlayingViewController _updateNowPlayingView](self, "_updateNowPlayingView");
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
    [v12 postEvent:@"Force rest mode"];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    [v13 setNothingPlaying:1];

    -[TVMNowPlayingViewController updateIdleViewControllerIfNeeded](self, "updateIdleViewControllerIfNeeded");
  }

  if (-[TVMNowPlayingViewController isViewSeen](self, "isViewSeen")) {
    -[TVMNowPlayingViewController _updateVideoViewControllerAnimated:completion:]( self,  "_updateVideoViewControllerAnimated:completion:",  0LL,  0LL);
  }
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController tabBarController](self, "tabBarController"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tabBar]);
  id v16 = objc_msgSend(v15, "tvm_isDescendentFocused");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  [v17 setAlwaysHideContainerText:v16];

  if (MSVDeviceSupportsVocalAttenuation())
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playQueue]);
    [v19 prepareVocalControls];
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  -[TVMNowPlayingViewController setViewVisible:](self, "setViewVisible:", 1LL);
  -[TVMNowPlayingViewController updateIdleViewControllerIfNeeded](self, "updateIdleViewControllerIfNeeded");
  -[TVMNowPlayingViewController _updateEmbeddedVideoView](self, "_updateEmbeddedVideoView");
  if (!-[TVMNowPlayingViewController isViewSeen](self, "isViewSeen")
    && (id)-[TVMNowPlayingViewController initialViewMode](self, "initialViewMode") == (id)3)
  {
    -[TVMNowPlayingViewController _presentVideoViewControllerAnimated:completion:]( self,  "_presentVideoViewControllerAnimated:completion:",  1LL,  0LL);
  }

  -[TVMNowPlayingViewController setTransportBarVisible:]( self,  "setTransportBarVisible:",  -[TVMNowPlayingViewController _shouldShowTransportBar](self, "_shouldShowTransportBar"));
  if (!-[TVMNowPlayingViewController isViewSeen](self, "isViewSeen")) {
    -[TVMNowPlayingViewController setViewSeen:](self, "setViewSeen:", 1LL);
  }
  ultrawideScreenManager = self->_ultrawideScreenManager;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  -[TVMusicUltrawideScreenManager viewDidAppear:](ultrawideScreenManager, "viewDidAppear:", v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController viewWillDisappear:](&v8, "viewWillDisappear:", a3);
  -[TVMNowPlayingViewController setViewVisible:](self, "setViewVisible:", 0LL);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Transport bar timeout");
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 0LL);
  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0LL;

  -[TVPHardwareButtonEventManager setCanAcceptHardwareButtonEvents:]( self->_buttonEventManager,  "setCanAcceptHardwareButtonEvents:",  0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"TVMusicNowPlayingWillDisappear" object:self];

  ultrawideScreenManager = self->_ultrawideScreenManager;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  -[TVMusicUltrawideScreenManager viewWillDisappear:](ultrawideScreenManager, "viewWillDisappear:", v7);
}

- (void)dealloc
{
  if (-[NSTimer isValid](self->_updateTimer, "isValid")) {
    -[NSTimer invalidate](self->_updateTimer, "invalidate");
  }
  -[TVMusicPlaybackProgressAnimator invalidate](self->_playbackProgressAnimator, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[TVMusicPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"playlist.supportsShuffle",  off_1002B6D80);
  -[TVMusicPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"playlist.supportsRepeat",  off_1002B6D88);
  -[TVMusicPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"playlist.shuffleEnabled",  off_1002B6D90);
  -[TVMusicPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"playlist.repeatMode",  off_1002B6D98);
  -[TVMusicPlayer removeObserver:forKeyPath:context:]( self->_player,  "removeObserver:forKeyPath:context:",  self,  @"bufferedTimeRange",  off_1002B6DA0);
  -[TVMusicPlayer removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, @"isLive");
  -[TVMusicPlayer removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, @"playlist");
  -[TVMusicPlayer removeObserver:forKeyPath:]( self->_player,  "removeObserver:forKeyPath:",  self,  @"playQueue.canEnableVocalAttenuation");
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    -[TVMNowPlayingViewController _releasePartyStudioIdleTimerAssertion](self, "_releasePartyStudioIdleTimerAssertion");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PSCameraController sharedInstance](&OBJC_CLASS___PSCameraController, "sharedInstance"));
    [v4 removeObserver:self];
  }

  -[TVMusicUltrawideScreenManager willDeallocView](self->_ultrawideScreenManager, "willDeallocView");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController dealloc](&v5, "dealloc");
}

- (void)loadView
{
  v3 = objc_alloc(&OBJC_CLASS___TVMNowPlayingView);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v4 bounds];
  objc_super v5 = -[TVMNowPlayingView initWithFrame:](v3, "initWithFrame:");

  -[TVMNowPlayingView setAccessibilityIdentifier:]( v5,  "setAccessibilityIdentifier:",  @"TVMusic.NowPlaying.NowPlayingView");
  -[TVMNowPlayingView setNowPlayingDelegate:](v5, "setNowPlayingDelegate:", self);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentMediaItem]);
  -[TVMNowPlayingView setNothingPlaying:](v5, "setNothingPlaying:", v7 == 0LL);

  -[TVMNowPlayingView setLayoutMargins:](v5, "setLayoutMargins:", 0.0, 0.0, 14.0 + 90.0, 0.0);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playlist]);

  -[TVMNowPlayingView setRepeatVisible:](v5, "setRepeatVisible:", [v9 supportsRepeat]);
  -[TVMNowPlayingView setShuffleVisible:](v5, "setShuffleVisible:", [v9 supportsShuffle]);
  -[TVMNowPlayingView setRepeatMode:](v5, "setRepeatMode:", [v9 repeatMode]);
  -[TVMNowPlayingView setShuffleEnabled:](v5, "setShuffleEnabled:", [v9 shuffleEnabled]);
  objc_initWeak(&location, self);
  id v10 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](v5, "playlistCollectionView"));
  v33[1] = 3221225472LL;
  v33[2] = sub_1000BED4C;
  v33[3] = &unk_10026DD08;
  v33[0] = _NSConcreteStackBlock;
  objc_copyWeak(&v34, &location);
  uint64_t v12 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v10,  "initWithCollectionView:cellProvider:",  v11,  v33);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](v5, "playlistCollectionView"));
  [v13 setDataSource:v12];

  -[TVMNowPlayingViewController setDataSource:](self, "setDataSource:", v12);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](v5, "playlistCollectionView"));
  objc_msgSend( v14,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVMusicNowPlayingCollectionViewCell, v15),  @"NowPlayingCellIdentifier");

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](v5, "playlistCollectionView"));
  objc_msgSend( v16,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(TVMusicNowPlayingCollectionViewCell, v17),  @"NowPlayingWideCellIdentifier");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingView playlistCollectionView](v5, "playlistCollectionView"));
  [v18 setDelegate:self];

  -[TVMNowPlayingViewController setView:](self, "setView:", v5);
  if (!self->_scrubScrollView)
  {
    uint64_t v32 = objc_alloc_init(&OBJC_CLASS___TVMusicScrubbingConfiguration);
    -[TVMNowPlayingViewController setScrubbingConfiguration:](self, "setScrubbingConfiguration:", v32);
    v19 = -[UIScrollView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIScrollView),  "initWithFrame:",  0.0,  980.0,  1920.0,  10.0);
    scrubScrollView = self->_scrubScrollView;
    self->_scrubScrollView = v19;

    -[UIScrollView tvs_bind:toObject:withKeyPath:options:]( self->_scrubScrollView,  "tvs_bind:toObject:withKeyPath:options:",  @"horizontalScrollDecelerationFactor",  v32,  @"decelerationRate",  0LL);
    uint64_t v21 = self->_scrubScrollView;
    uint64_t v36 = TVSBindingOptionValueTransformer;
    v22 = -[TVMusicBlockBasedValueTransformer initWithBlock:]( objc_alloc(&OBJC_CLASS___TVMusicBlockBasedValueTransformer),  "initWithBlock:",  &stru_10026DD48);
    id v37 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    -[UIScrollView tvs_bind:toObject:withKeyPath:options:]( v21,  "tvs_bind:toObject:withKeyPath:options:",  @"contentSize",  v32,  @"padScalingFactor",  v23);

    -[UIScrollView setBounces:](self->_scrubScrollView, "setBounces:", 0LL);
    -[UIScrollView _setContentOffsetRoundingEnabled:](self->_scrubScrollView, "_setContentOffsetRoundingEnabled:", 0LL);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 containerView]);
    [v25 addSubview:self->_scrubScrollView];

    objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView panGestureRecognizer](self->_scrubScrollView, "panGestureRecognizer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allowedTouchTypes]);
    id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ([v27 count]) {
      -[NSMutableArray addObjectsFromArray:](v28, "addObjectsFromArray:", v27);
    }
    [v26 setAllowedTouchTypes:v28];
    [v26 _setHysteresis:200.0];
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 containerView]);
    [v30 addGestureRecognizer:v26];

    [v26 setEnabled:0];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[UIScrollView directionalPressGestureRecognizer]( self->_scrubScrollView,  "directionalPressGestureRecognizer"));
    [v31 setEnabled:0];

    -[UIScrollView setHidden:](self->_scrubScrollView, "setHidden:", 1LL);
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v3, "appendSectionsWithIdentifiers:", &off_1002822E8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playQueue]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 activeList]);
  id v7 = (void *)v6;
  if (v6) {
    objc_super v8 = (void *)v6;
  }
  else {
    objc_super v8 = &__NSArray0__struct;
  }
  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:](v3, "appendItemsWithIdentifiers:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
  [v9 applySnapshot:v3 animatingDifferences:0];

  -[TVMNowPlayingViewController _addControlsView](self, "_addControlsView");
  -[TVMNowPlayingViewController _addTransportBar](self, "_addTransportBar");
  -[TVMNowPlayingViewController _addGestureRecognizers](self, "_addGestureRecognizers");
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    -[TVMNowPlayingViewController _addControlsShadowView](self, "_addControlsShadowView");
    -[TVMNowPlayingViewController _addSongInfoView](self, "_addSongInfoView");
    -[TVMNowPlayingViewController _addVocalsMessageView](self, "_addVocalsMessageView");
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lyricsContainerView]);
  uint64_t v12 = -[UIContextMenuInteraction initWithDelegate:]( objc_alloc(&OBJC_CLASS___UIContextMenuInteraction),  "initWithDelegate:",  self);
  [v11 addInteraction:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 addObserver:self selector:"_beginBatchUpdates:" name:@"TVPMusicPlaylistTransitioningWillBeginNotification" object:0];

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v14 addObserver:self selector:"_finishBatchUpdates:" name:@"TVPMusicPlaylistTransitioningWillFinishNotification" object:0];
}

- (void)willMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController willMoveToParentViewController:](&v9, "willMoveToParentViewController:");
  if (a3)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playQueue]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 videoOutput]);
    [v5 setVideoOutput:v8];
  }

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (-[TVMNowPlayingViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 window]);
      [v11 safeAreaInsets];
      double top = v12;
      double left = v13;
      double bottom = v14;
      double right = v15;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController _setContentOverlayInsets:](&v16, "_setContentOverlayInsets:", top, left, bottom, right);
}

- (void)viewWillLayoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController viewWillLayoutSubviews](&v31, "viewWillLayoutSubviews");
  transportBar = self->_transportBar;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 containerView]);
  [v5 bounds];
  -[TVMusicAudioTransportBarView setFrame:](transportBar, "setFrame:");

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 visibleCells]);

  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * (void)i) updatePlaceholderImage];
      }

      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v9);
  }

  double lastKnownPlaylistCollectionViewWidth = self->_lastKnownPlaylistCollectionViewWidth;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  [v13 frame];
  double v15 = v14;

  if (lastKnownPlaylistCollectionViewWidth != v15)
  {
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    unsigned int v17 = [v16 isPlaylistVisible];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playlistCollectionView]);
    unsigned __int8 v20 = objc_msgSend(v19, "tvm_isDescendentFocused");

    if (v17)
    {
      if (self->_scrollWithPlayingItem) {
        char v21 = v20;
      }
      else {
        char v21 = 1;
      }
      if ((v21 & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 playlistCollectionView]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 collectionViewLayout]);
        [v24 invalidateLayout];

        -[TVMNowPlayingViewController _focusCurrentPlayingItemAnimated:](self, "_focusCurrentPlayingItemAnimated:", 0LL);
      }
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
    [v25 frame];
    self->_double lastKnownPlaylistCollectionViewWidth = v26;
  }

- (void)reloadPlaylist
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));

  if (v3)
  {
    id v4 = (NSDiffableDataSourceSnapshot *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController invalidationContext]( self,  "invalidationContext"));
    -[NSDiffableDataSourceSnapshot setQueue:](v4, "setQueue:", 1LL);
  }

  else
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
    -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v4, "appendSectionsWithIdentifiers:", &off_100282300);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playQueue]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 activeList]);
    id v8 = (void *)v7;
    if (v7) {
      id v9 = (void *)v7;
    }
    else {
      id v9 = &__NSArray0__struct;
    }
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:](v4, "appendItemsWithIdentifiers:", v9);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    [v10 applySnapshot:v4 animatingDifferences:0];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _itemIdentifierForPlayingItem](self, "_itemIdentifierForPlayingItem"));
    -[TVMNowPlayingViewController setSingleCoverMediaItem:](self, "setSingleCoverMediaItem:", v11);

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
    -[TVMNowPlayingViewController _configurePlayingCellForIndexPath:](self, "_configurePlayingCellForIndexPath:", v12);
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playQueue]);
  id v20 = (id)objc_claimAutoreleasedReturnValue([v14 audioRoute]);

  if ([v20 isDeviceRoute])
  {
    double v15 = @"music";
LABEL_10:
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", v15));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _placeholderColor](self, "_placeholderColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _placeholderBackgroundColor](self, "_placeholderBackgroundColor"));
    [v16 setPlaceholderImage:v17 imageColor:v18 backgroundColor:v19 relativeSize:0.5];

    goto LABEL_11;
  }

  double v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[MPAVRoutingController _symbolNameForRoute:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolNameForRoute:",  v20));
  if (v15) {
    goto LABEL_10;
  }
LABEL_11:
}

- (id)_placeholderColor
{
  os_log_t v2 = (void *)qword_1002BEBF0;
  if (!qword_1002BEBF0)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_10026DD68));
    id v4 = (void *)qword_1002BEBF0;
    qword_1002BEBF0 = v3;

    os_log_t v2 = (void *)qword_1002BEBF0;
  }

  return v2;
}

- (id)_placeholderBackgroundColor
{
  os_log_t v2 = (void *)qword_1002BEBF8;
  if (!qword_1002BEBF8)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_10026DD88));
    id v4 = (void *)qword_1002BEBF8;
    qword_1002BEBF8 = v3;

    os_log_t v2 = (void *)qword_1002BEBF8;
  }

  return v2;
}

- (void)setTransportBarVisible:(BOOL)a3
{
}

- (void)setTransportBarVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setTransportBarVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = (void (**)(id, void))a5;
  if (!v6) {
    -[TVMNowPlayingViewController setScrubbing:](self, "setScrubbing:", 0LL);
  }
  if (self->_transportBarVisible == v6)
  {
    if (v8) {
      v8[2](v8, 0LL);
    }
  }

  else
  {
    if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
    {
      if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
      {
        -[TVMNowPlayingCompactMetadataView alpha](self->_songInfoView, "alpha");
        if (v9 == 0.0) {
          -[UIView layoutIfNeeded](self->_songInfoViewContainer, "layoutIfNeeded");
        }
      }
    }

    -[TVMusicTransportBarView setEnabled:](self->_transportBar, "setEnabled:", v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBarFocusGuide](self, "transportBarFocusGuide"));
    [v10 setEnabled:v6];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000BFA1C;
    v24[3] = &unk_100268F28;
    BOOL v25 = v6;
    v24[4] = self;
    uint64_t v11 = objc_retainBlock(v24);
    double v12 = (void (**)(void))v11;
    if (v6)
    {
      transportBar = self->_transportBar;
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      -[TVMusicAudioTransportBarView setIsLive:](transportBar, "setIsLive:", [v14 isLive]);

      -[TVMNowPlayingViewController _syncPlaybackProgressAnimatorToTransportBarVisibleState:]( self,  "_syncPlaybackProgressAnimatorToTransportBarVisibleState:",  1LL);
      if (v5)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000BFB1C;
        v22[3] = &unk_100269590;
        v23 = v8;
        +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v12,  v22,  0.35);
      }

      else
      {
        v12[2](v12);
        if (v8) {
          v8[2](v8, 1LL);
        }
      }
    }

    else
    {
      if (v5)
      {
        objc_initWeak(&location, self);
        double v15 = _NSConcreteStackBlock;
        uint64_t v16 = 3221225472LL;
        unsigned int v17 = sub_1000BFB30;
        v18 = &unk_10026DDB0;
        objc_copyWeak(&v20, &location);
        v19 = v8;
        +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v12,  &v15,  0.4);

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }

      else
      {
        ((void (*)(void *))v11[2])(v11);
        if (v8) {
          v8[2](v8, 1LL);
        }
      }

      -[TVMNowPlayingViewController _dismissPartyStudioCameraMenuAnimated:]( self,  "_dismissPartyStudioCameraMenuAnimated:",  0LL,  v15,  v16,  v17,  v18);
      if (-[TVMusicAudioTransportBarView isScrubberFocused](self->_transportBar, "isScrubberFocused")) {
        -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      }
    }
  }

  self->_transportBarVisible = v6;
  -[TVMNowPlayingViewController _updateVocalsMessageAnimated:](self, "_updateVocalsMessageAnimated:", 1LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  if (v11 == v10)
  {
    unsigned int v12 = [v9 isEqual:@"isLive"];

    if (!v12) {
      goto LABEL_5;
    }
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    id v13 = [v11 isLive];
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
    [v14 setIsLive:v13];
  }

LABEL_5:
  if (-[TVMNowPlayingViewController isViewLoaded](self, "isViewLoaded"))
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer playlist](self->_player, "playlist"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    if (off_1002B6D88 == a6)
    {
      id v17 = sub_1000BD900();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v25 = 67109120;
        LODWORD(v26) = [v15 supportsRepeat];
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "playlist supportsRepeat changed: %d",  (uint8_t *)&v25,  8u);
      }

      objc_msgSend(v16, "setRepeatVisible:", objc_msgSend(v15, "supportsRepeat"));
    }

    else if (off_1002B6D80 == a6)
    {
      id v19 = sub_1000BD900();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v25 = 67109120;
        LODWORD(v26) = [v15 supportsShuffle];
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "playlist supportsShuffle changed: %d",  (uint8_t *)&v25,  8u);
      }

      objc_msgSend(v16, "setShuffleVisible:", objc_msgSend(v15, "supportsShuffle"));
    }

    else if (off_1002B6D98 == a6)
    {
      id v21 = sub_1000BD900();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v25 = 134217984;
        id v26 = [v15 repeatMode];
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "playlist repeatMode changed: %li",  (uint8_t *)&v25,  0xCu);
      }

      objc_msgSend(v16, "setRepeatMode:", objc_msgSend(v15, "repeatMode"));
    }

    else if (off_1002B6D90 == a6)
    {
      id v23 = sub_1000BD900();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = 67109120;
        LODWORD(v26) = [v15 shuffleEnabled];
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "playlist shuffleEnabled changed: %d",  (uint8_t *)&v25,  8u);
      }

      objc_msgSend(v16, "setShuffleEnabled:", objc_msgSend(v15, "shuffleEnabled"));
    }

    else if (off_1002B6DA0 == a6)
    {
      -[TVMNowPlayingViewController _updateBoundBufferedTimeRange](self, "_updateBoundBufferedTimeRange");
    }

    else if (off_1002B6DA8 == a6)
    {
      -[TVMNowPlayingViewController _updateVocalsMessageAnimated:](self, "_updateVocalsMessageAnimated:", 0LL);
    }
  }
}

- (void)setIsRadioPlayback:(BOOL)a3
{
  self->_isRadioPlayback = a3;
  -[TVMNowPlayingViewController reloadPlaylist](self, "reloadPlaylist");
}

- (void)didShowPictureInPicture
{
}

- (void)willStopPictureInPictureWithCompletion:(id)a3
{
}

- (void)willUserEngageLyrics
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
    unsigned int v4 = [v3 shouldShowCamera];

    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_1000BFFFC;
      v5[3] = &unk_100268CF0;
      v5[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.3);
    }
  }

- (void)didEndUserEngagingLyrics
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
    unsigned int v4 = [v3 shouldShowCamera];

    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_1000C00FC;
      v5[3] = &unk_100268CF0;
      v5[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.3);
    }

    else
    {
      -[UIView setAlpha:](self->_partyStudioLyricsOverlay, "setAlpha:", 0.0);
    }
  }

- (void)_updateInterfaceForState:(id)a3 fromState:(id)a4
{
  id v6 = a3;
  id v7 = [v6 isEqualToString:@"Rest mode"];
  -[TVMNowPlayingViewController setIsRestMode:](self, "setIsRestMode:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  [v8 setIsRestMode:v7];

  BOOL v9 = -[TVMNowPlayingViewController _shouldShowTransportBar](self, "_shouldShowTransportBar");
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
    unsigned int v11 = [v10 shouldShowCamera];

    int v12 = v11 ^ 1;
    if (!(_DWORD)v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  int v12 = 1;
  if ((_DWORD)v7) {
LABEL_6:
  }
    -[TVMNowPlayingViewController setLastFocusedControl:](self, "setLastFocusedControl:", 0LL);
LABEL_7:
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 controlsContainerView]);
  [v14 setUserInteractionEnabled:v7 ^ 1];

  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    int64_t v15 = -[TVMNowPlayingViewController viewStyle](self, "viewStyle");
    if (v15 == 1)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
      BOOL v17 = v16 == 0LL;
    }

    else
    {
      BOOL v17 = 0;
    }

    if (v15) {
      int v18 = v17;
    }
    else {
      int v18 = 1;
    }
    else {
      int v19 = v18;
    }
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
    [v20 alpha];
    -[TVMNowPlayingViewController _updateSongInfoViewConstraints:willShowTransportBar:]( self,  "_updateSongInfoViewConstraints:willShowTransportBar:",  v21 > 0.0,  v9);

    -[TVMNowPlayingCompactMetadataView alpha](self->_songInfoView, "alpha");
    if (v22 == 0.0 && v19) {
      -[UIView layoutIfNeeded](self->_songInfoViewContainer, "layoutIfNeeded");
    }
    BOOL v23 = a4 != @"Uninitialized";
    if (v19) {
      -[TVMNowPlayingViewController _showSongInfoViewAnimated:](self, "_showSongInfoViewAnimated:", v23);
    }
    else {
      -[TVMNowPlayingViewController _hideSongInfoViewAnimated:](self, "_hideSongInfoViewAnimated:", v23);
    }
  }

  BOOL v24 = a4 != @"Uninitialized";
  if (v9)
  {
    -[TVMNowPlayingViewController setTransportBarVisible:animated:](self, "setTransportBarVisible:animated:", 1LL, v24);
    int v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
    [v25 setGradientBottomMargin:280.0];
  }

  else
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000C0594;
    v42[3] = &unk_10026CB08;
    v42[4] = self;
    v43 = &stru_10026DDF0;
    -[TVMNowPlayingViewController setTransportBarVisible:animated:completion:]( self,  "setTransportBarVisible:animated:completion:",  0LL,  v24,  v42);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lyricsContentView]);
  [v27 setUserInteractionEnabled:v7];

  -[TVMNowPlayingViewController playlistExitTime](self, "playlistExitTime");
  if (v28 > 0.0) {
    -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", 2LL);
  }
  if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)2) {
    char v29 = (char)v7;
  }
  else {
    char v29 = 1;
  }
  if ((v29 & 1) == 0)
  {
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
    -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v30,  v31,  1LL);
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 nowPlayingConfiguration]);
  id v34 = [v33 copy];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  id v36 = [v35 style];
  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
  BOOL v38 = -[TVMNowPlayingViewController _isSingleCoverFocusableState:viewStyle:hasLyrics:]( self,  "_isSingleCoverFocusableState:viewStyle:hasLyrics:",  v6,  v36,  v37 != 0LL);

  [v34 setIsFocusable:v38];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  [v39 setNowPlayingConfiguration:v34];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000C05F8;
  v41[3] = &unk_100268CF0;
  void v41[4] = self;
  v40 = v41;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D896C;
  block[3] = &unk_100268D60;
  id v45 = v40;
  dispatch_async(&_dispatch_main_q, block);
}

- (int64_t)numberOfMediaItems
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 snapshot]);
  id v4 = [v3 numberOfItems];

  return (int64_t)v4;
}

- (id)mediaItemAtIndex:(int64_t)a3
{
  if (-[TVMNowPlayingViewController numberOfMediaItems](self, "numberOfMediaItems") <= a3)
  {
    id v7 = 0LL;
  }

  else
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a3,  0LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 itemIdentifierForIndexPath:v6]);
  }

  return v7;
}

- (BOOL)_tvTabBarShouldAutohide
{
  return 1;
}

- (void)_setBackdropForMediaItem:(id)a3
{
  id v26 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  BOOL v5 = (TVMusicNowPlayingSnapshotBackgroundView *)objc_claimAutoreleasedReturnValue([v4 backgroundProvider]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 videoOutput]);
  if (v7)
  {
    id v8 = (void *)v7;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v26 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
    id v10 = (void *)TVPMediaTypeMusicVideo;

    if (v9 == v10)
    {
      BOOL v5 = v5;
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingSnapshotBackgroundView, v11);
      if ((objc_opt_isKindOfClass(v5, v12) & 1) != 0)
      {
        unsigned int v13 = 1;
        double v14 = v5;
      }

      else
      {
        uint64_t v16 = objc_alloc_init(&OBJC_CLASS___TVMusicNowPlayingSnapshotBackgroundView);

        -[TVMusicNowPlayingSnapshotBackgroundView setDelegate:](v16, "setDelegate:", self);
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);
        -[TVMusicNowPlayingSnapshotBackgroundView setTargetView:](v16, "setTargetView:", v18);

        double v14 = v16;
        unsigned int v13 = 1;
        BOOL v5 = v14;
      }

      goto LABEL_10;
    }
  }

  else
  {
  }

  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController customBackgroundProvider](self, "customBackgroundProvider"));

  if (!v15)
  {
    unsigned int v13 = 0;
    goto LABEL_11;
  }

  double v14 = (TVMusicNowPlayingSnapshotBackgroundView *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController customBackgroundProvider]( self,  "customBackgroundProvider"));
  unsigned int v13 = 0;
LABEL_10:

  BOOL v5 = v14;
LABEL_11:
  int v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  [v19 setBackgroundProvider:v5];

  if (v26) {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v26 mediaItemMetadataForProperty:TVPMediaItemMetadataMPArtworkCatalog]);
  }
  else {
    id v20 = 0LL;
  }
  double v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  [v21 setBackgroundArtwork:v20];

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v22 backgroundView]);
  BOOL v24 = v23;
  if (v20) {
    uint64_t v25 = 1LL;
  }
  else {
    uint64_t v25 = v13;
  }
  [v23 setBlurAllowed:v25];
}

- (UIView)embeddedVideoView
{
  embeddedVideoView = self->_embeddedVideoView;
  if (!embeddedVideoView)
  {
    id v4 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGPointZero.x,  CGPointZero.y,  928.0,  522.0);
    BOOL v5 = self->_embeddedVideoView;
    self->_embeddedVideoView = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 videoOutput]);
    double v8 = 1.0;
    if (!v7) {
      double v8 = 0.0;
    }
    -[UIView setAlpha:](self->_embeddedVideoView, "setAlpha:", v8);

    embeddedVideoView = self->_embeddedVideoView;
  }

  return embeddedVideoView;
}

- (TVMusicVideoPlayerViewController)videoPlayerViewController
{
  videoPlayerViewController = self->_videoPlayerViewController;
  if (!videoPlayerViewController)
  {
    id v4 = objc_alloc(&OBJC_CLASS___TVMusicVideoPlayerViewController);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    id v6 = -[TVMusicVideoPlayerViewController initWithPlayer:](v4, "initWithPlayer:", v5);
    uint64_t v7 = self->_videoPlayerViewController;
    self->_videoPlayerViewController = v6;

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController parentViewController](self, "parentViewController"));
    if (v8)
    {
      BOOL v9 = self->_videoPlayerViewController;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playQueue]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 videoOutput]);
      -[TVMusicVideoPlayerViewController setVideoOutput:](v9, "setVideoOutput:", v12);
    }

    -[TVMNowPlayingViewController addChildViewController:]( self,  "addChildViewController:",  self->_videoPlayerViewController);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self->_videoPlayerViewController, "view"));
    [v13 setAutoresizingMask:18];

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self->_videoPlayerViewController, "view"));
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    [v15 bounds];
    objc_msgSend(v14, "setFrame:");

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicVideoPlayerViewController view](self->_videoPlayerViewController, "view"));
    [v16 addSubview:v17];

    -[TVMusicVideoPlayerViewController didMoveToParentViewController:]( self->_videoPlayerViewController,  "didMoveToParentViewController:",  self);
    videoPlayerViewController = self->_videoPlayerViewController;
  }

  return videoPlayerViewController;
}

- (void)_updateEmbeddedVideoView
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playQueue]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v4 videoOutput]);

  if (v12) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
  [v6 setAlpha:v5];

  if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)2)
  {
    -[TVMNowPlayingViewController configureVideoForVisibleCells](self, "configureVideoForVisibleCells");
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingConfiguration]);
    id v9 = [v8 copy];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    [v9 setVideoView:v10];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    [v11 setNowPlayingConfiguration:v9];
  }
}

- (void)_updateVideoViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 videoOutput]);

  if (v7) {
    -[TVMNowPlayingViewController _presentVideoViewControllerAnimated:completion:]( self,  "_presentVideoViewControllerAnimated:completion:",  v4,  v8);
  }
  else {
    -[TVMNowPlayingViewController _dismissVideoViewControllerAnimated:completion:]( self,  "_dismissVideoViewControllerAnimated:completion:",  v4,  v8);
  }
}

- (void)_timerTick:(id)a3
{
  if (v4 > 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    -[TVMNowPlayingViewController playlistExitTime](self, "playlistExitTime");
    if (Current > v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      unsigned int v8 = objc_msgSend(v7, "tvm_isDescendentFocused");

      if (v8) {
        -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Active mode timeout");
      }
    }
  }

  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing")
    && self->_songInfoTimeout > 0.0
    && CFAbsoluteTimeGetCurrent() > self->_songInfoTimeout)
  {
    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Song Info Timeout");
  }

- (BOOL)_isStreamingRadioPlayback
{
  BOOL v3 = -[TVMNowPlayingViewController isRadioPlayback](self, "isRadioPlayback");
  if (v3)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentMediaItem]);
    unsigned __int8 v6 = [v5 hasTrait:TVPMediaItemTraitIsStreaming];

    LOBYTE(v3) = v6;
  }

  return v3;
}

- (BOOL)_isStreamingLive
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  unsigned __int8 v3 = [v2 isLive];

  return v3;
}

- (void)_startPlaylistExitTimeout:(int64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
  if (v6 == (void *)v7)
  {

    -[TVMNowPlayingViewController setPlaylistExitTime:](self, "setPlaylistExitTime:", 0.0);
    return;
  }

  unsigned int v8 = (void *)v7;
  unsigned __int8 v9 = -[TVMNowPlayingViewController isShowingModalPopup](self, "isShowingModalPopup");

  double v10 = 0.0;
  if ((v9 & 1) != 0 || !a3) {
    goto LABEL_9;
  }
  if (a3 == 2 || a3 == 1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    sub_1000C0F50();
    double v10 = Current + v12;
LABEL_9:
    -[TVMNowPlayingViewController setPlaylistExitTime:](self, "setPlaylistExitTime:", v10);
  }

- (void)_focusCurrentPlayingItem
{
}

- (void)_focusCurrentPlayingItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 indexPathForItemIdentifier:v8]);
  }

  else
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  unsigned int v11 = [v10 isPlaylistVisible];

  if (v11)
  {
    -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v5,  v9,  v3);
  }

  else
  {
    objc_initWeak(&location, self);
    -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v5,  v9,  0LL);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000C1158;
    v13[3] = &unk_100269F48;
    objc_copyWeak(&v14, &location);
    [v12 setPlaylistVisible:1 completion:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_isScrubberActive
{
  BOOL v3 = -[TVMNowPlayingViewController isTransportBarVisible](self, "isTransportBarVisible");
  if (v3)
  {
    BOOL v3 = -[TVMusicAudioTransportBarView isScrubberFocused](self->_transportBar, "isScrubberFocused");
    if (v3) {
      LOBYTE(v3) = CFAbsoluteTimeGetCurrent() > self->_scrubberFocusTime + 0.4;
    }
  }

  return v3;
}

- (id)_playlistCollectionView
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playlistCollectionView]);

  return v3;
}

- (void)_addTransportBar
{
  if (!self->_transportBar)
  {
    BOOL v3 = objc_alloc(&OBJC_CLASS___TVMusicAudioTransportBarView);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    double v5 = -[TVMusicTransportBarView initWithPlayer:frame:]( v3,  "initWithPlayer:frame:",  v4,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    transportBar = self->_transportBar;
    self->_transportBar = v5;

    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___TVMusicDefiniteDurationPlaybackProgress);
    definiteDurationPlaybackProgress = self->_definiteDurationPlaybackProgress;
    self->_definiteDurationPlaybackProgress = v7;

    unsigned __int8 v9 = self->_transportBar;
    double v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController definiteDurationPlaybackProgress]( self,  "definiteDurationPlaybackProgress"));
    -[TVMusicAudioTransportBarView tvs_bind:toObject:withKeyPath:options:]( v9,  "tvs_bind:toObject:withKeyPath:options:",  @"leftEdgeTitle",  v10,  @"firstTitle",  0LL);

    unsigned int v11 = self->_transportBar;
    double v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController definiteDurationPlaybackProgress]( self,  "definiteDurationPlaybackProgress"));
    -[TVMusicAudioTransportBarView tvs_bind:toObject:withKeyPath:options:]( v11,  "tvs_bind:toObject:withKeyPath:options:",  @"elapsedTimeTitle",  v12,  @"currentTitle",  0LL);

    unsigned int v13 = self->_transportBar;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController definiteDurationPlaybackProgress]( self,  "definiteDurationPlaybackProgress"));
    -[TVMusicAudioTransportBarView tvs_bind:toObject:withKeyPath:options:]( v13,  "tvs_bind:toObject:withKeyPath:options:",  @"rightEdgeTitle",  v14,  @"lastTitle",  0LL);

    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer state](self->_player, "state"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));

    if (v15 == v16)
    {
      -[TVMNowPlayingViewController stopAnimatingMusicBars](self, "stopAnimatingMusicBars");
    }

    else
    {
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer state](self->_player, "state"));
      int v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

      if (v17 == v18) {
        -[TVMNowPlayingViewController resumeAnimatingMusicBars](self, "resumeAnimatingMusicBars");
      }
    }

    -[TVMusicAudioTransportBarView setInsetsLayoutMarginsFromSafeArea:]( self->_transportBar,  "setInsetsLayoutMarginsFromSafeArea:",  1LL);
    -[TVMusicAudioTransportBarView setLayoutMargins:](self->_transportBar, "setLayoutMargins:", 0.0, 0.0, 90.0, 0.0);
    -[TVMusicAudioTransportBarView setAlpha:](self->_transportBar, "setAlpha:", 0.0);
    -[TVMusicTransportBarView setEnabled:](self->_transportBar, "setEnabled:", 0LL);
    int v19 = self->_transportBar;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    -[TVMusicAudioTransportBarView setIsLive:](v19, "setIsLive:", [v20 isLive]);

    double v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 containerView]);
    [v22 insertSubview:self->_transportBar atIndex:0];

    -[TVMNowPlayingViewController _updateBoundBufferedTimeRange](self, "_updateBoundBufferedTimeRange");
    BOOL v23 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    transportBarFocusGuide = self->_transportBarFocusGuide;
    self->_transportBarFocusGuide = v23;

    -[UIFocusGuide setEnabled:](self->_transportBarFocusGuide, "setEnabled:", 0LL);
    uint64_t v25 = self->_transportBarFocusGuide;
    id v44 = self->_transportBar;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
    -[UIFocusGuide setPreferredFocusEnvironments:](v25, "setPreferredFocusEnvironments:", v26);

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 containerView]);
    [v28 addLayoutGuide:self->_transportBarFocusGuide];

    char v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self->_transportBar, "progressBarView"));
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](self->_transportBarFocusGuide, "leftAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v29 leftAnchor]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v41]);
    v43[0] = v40;
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](self->_transportBarFocusGuide, "rightAnchor"));
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 rightAnchor]);
    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v30]);
    v43[1] = v31;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](self->_transportBarFocusGuide, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v29 bottomAnchor]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v33]);
    v43[2] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide heightAnchor](self->_transportBarFocusGuide, "heightAnchor"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v29 heightAnchor]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v36]);
    v43[3] = v37;
    BOOL v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v38);
  }

- (void)_addControlsView
{
  int v19 = objc_alloc_init(&OBJC_CLASS___TVMusicNowPlayingViewPresentation);
  -[TVMusicNowPlayingViewPresentation setDelegate:](v19, "setDelegate:", self);
  if ((-[TVMNowPlayingViewController nowPlayingOptions](self, "nowPlayingOptions") & 4) != 0)
  {
    uint64_t v5 = 1LL;
    double v4 = v19;
    goto LABEL_5;
  }

  unsigned __int8 v3 = -[TVMNowPlayingViewController nowPlayingOptions](self, "nowPlayingOptions");
  double v4 = v19;
  if ((v3 & 2) != 0)
  {
    uint64_t v5 = 2LL;
LABEL_5:
    -[TVMusicNowPlayingViewPresentation setStyle:](v4, "setStyle:", v5);
    double v4 = v19;
  }

  -[TVMNowPlayingViewController setViewPresentation:](self, "setViewPresentation:", v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 controlsContainerView]);

  unsigned int v8 = objc_alloc(&OBJC_CLASS____TtC7TVMusic35TVMusicNowPlayingPlayerControlsView);
  [v7 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  int v18 = -[TVMusicNowPlayingPlayerControlsView initWithFrame:player:presentation:]( v8,  "initWithFrame:player:presentation:",  v17,  v19,  v10,  v12,  v14,  v16);

  -[TVMusicNowPlayingPlayerControlsView setAutoresizingMask:](v18, "setAutoresizingMask:", 18LL);
  [v7 addSubview:v18];
  -[TVMNowPlayingViewController setControlsView:](self, "setControlsView:", v18);
}

- (void)_addControlsShadowView
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  CGFloat v12 = CGRectGetHeight(v17) + -292.0;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double v13 = -[TVMLagunaControlsShadowView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVMLagunaControlsShadowView),  "initWithFrame:",  0.0,  v12,  CGRectGetWidth(v18),  292.0);
  controlsShadowView = self->_controlsShadowView;
  self->_controlsShadowView = &v13->super;

  -[UIView setAutoresizingMask:](self->_controlsShadowView, "setAutoresizingMask:", 10LL);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  id v16 = (id)objc_claimAutoreleasedReturnValue([v15 containerView]);

  [v16 insertSubview:self->_controlsShadowView atIndex:0];
}

- (void)_addSongInfoView
{
  unsigned __int8 v3 = objc_alloc(&OBJC_CLASS___UIView);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  [v4 bounds];
  CGFloat v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
  songInfoViewContainer = self->_songInfoViewContainer;
  self->_songInfoViewContainer = v5;

  -[UIView setAutoresizingMask:](self->_songInfoViewContainer, "setAutoresizingMask:", 18LL);
  -[UIView setUserInteractionEnabled:](self->_songInfoViewContainer, "setUserInteractionEnabled:", 0LL);
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  [v7 addSubview:self->_songInfoViewContainer];

  double v8 = objc_alloc_init(&OBJC_CLASS___TVMNowPlayingCompactMetadataView);
  songInfoView = self->_songInfoView;
  self->_songInfoView = v8;

  -[TVMNowPlayingCompactMetadataView setAlpha:](self->_songInfoView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_songInfoViewContainer, "addSubview:", self->_songInfoView);
  -[TVMNowPlayingCompactMetadataView setTranslatesAutoresizingMaskIntoConstraints:]( self->_songInfoView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView leadingAnchor](self->_songInfoView, "leadingAnchor"));
  CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue([v11 safeAreaLayoutGuide]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 leadingAnchor]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v13]);
  [v14 setActive:1];

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView heightAnchor](self->_songInfoView, "heightAnchor"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToConstant:100.0]);
  [v16 setActive:1];

  CGRect v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView bottomAnchor](self->_songInfoView, "bottomAnchor"));
  CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bottomAnchor]);
  id v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v19 constant:-204.0]);
  songInfoViewBottomConstraint = self->_songInfoViewBottomConstraint;
  self->_songInfoViewBottomConstraint = v20;

  -[NSLayoutConstraint setActive:](self->_songInfoViewBottomConstraint, "setActive:", 1LL);
}

- (void)_updateSongInfoViewConstraints:(BOOL)a3 willShowTransportBar:(BOOL)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)1)
  {
    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));

    if (v7) {
      BOOL v8 = v5;
    }
    else {
      BOOL v8 = 0;
    }
    v4 |= v8;
  }

  double v9 = -60.0;
  if (v4) {
    double v9 = -204.0;
  }
  -[NSLayoutConstraint setConstant:](self->_songInfoViewBottomConstraint, "setConstant:", v9);
  -[UIView setNeedsLayout](self->_songInfoViewContainer, "setNeedsLayout");
}

- (void)_showSongInfoViewIfNecessary
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  if ([v5 shouldShowCamera])
  {
    -[TVMNowPlayingCompactMetadataView alpha](self->_songInfoView, "alpha");
    double v4 = v3;

    if (v4 == 0.0)
    {
      -[TVMNowPlayingViewController _resetSongInfoTimeout](self, "_resetSongInfoTimeout");
      -[TVMNowPlayingViewController _showSongInfoViewAnimated:](self, "_showSongInfoViewAnimated:", 1LL);
    }
  }

  else
  {
  }

- (void)_showSongInfoViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
  [v5 alpha];
  -[TVMNowPlayingViewController _updateSongInfoViewConstraints:willShowTransportBar:]( self,  "_updateSongInfoViewConstraints:willShowTransportBar:",  v6 > 0.0,  -[TVMNowPlayingViewController _shouldShowTransportBar](self, "_shouldShowTransportBar"));

  -[UIView layoutIfNeeded](self->_songInfoViewContainer, "layoutIfNeeded");
  if (!-[TVMNowPlayingViewController _shouldShowTransportBar](self, "_shouldShowTransportBar"))
  {
    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lyricsContainerView]);

    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    CGRect v18 = -[TVMusicGradientView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVMusicGradientView),  "initWithFrame:",  v11,  v13,  v15,  v17 + 252.0);
    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v27[0] = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v27[1] = v20;
    double v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v27[2] = v21;
    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v27[3] = v22;
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL));
    -[TVMusicGradientView setColors:](v18, "setColors:", v23);

    -[TVMusicGradientView setLocations:](v18, "setLocations:", &off_100282318);
    -[TVMusicGradientView setStartPoint:](v18, "setStartPoint:", 0.5, 0.0);
    -[TVMusicGradientView setEndPoint:](v18, "setEndPoint:", 0.5, 1.0);
    [v8 setMaskView:v18];
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000C1EF0;
  v26[3] = &unk_100268CF0;
  v26[4] = self;
  BOOL v24 = objc_retainBlock(v26);
  uint64_t v25 = v24;
  if (v3) {
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v24, 0.35);
  }
  else {
    ((void (*)(void *))v24[2])(v24);
  }
  -[TVMNowPlayingViewController _updateVocalsMessageAnimated:](self, "_updateVocalsMessageAnimated:", v3);
}

- (void)_hideSongInfoViewAnimated:(BOOL)a3
{
}

- (void)_hideSongInfoViewAnimated:(BOOL)a3 slideOut:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    double v6 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  50.0,  0.0,  0.0);
    CGFloat v7 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v6,  0.0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000C219C;
    v14[3] = &unk_100268CF0;
    v14[4] = self;
    -[UIViewPropertyAnimator addAnimations:](v7, "addAnimations:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000C2274;
    v13[3] = &unk_10026BB60;
    void v13[4] = self;
    -[UIViewPropertyAnimator addCompletion:](v7, "addCompletion:", v13);
    -[UIViewPropertyAnimator startAnimation](v7, "startAnimation");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000C22F8;
    v12[3] = &unk_100268CF0;
    v12[4] = self;
    BOOL v8 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:controlPoint1:controlPoint2:animations:",  v12,  0.33,  0.33,  0.0,  0.67,  1.0);
    -[UIViewPropertyAnimator startAnimation](v8, "startAnimation");
  }

  else
  {
    double v9 = 0.4;
    if (!a3) {
      double v9 = 0.0;
    }
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000C2354;
    v11[3] = &unk_100268CF0;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C240C;
    v10[3] = &unk_100268F50;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v11,  v10,  v9);
  }

  -[TVMNowPlayingViewController _updateVocalsMessageAnimated:](self, "_updateVocalsMessageAnimated:", v4);
}

- (void)_resetSongInfoTimeout
{
  self->_songInfoTimeout = CFAbsoluteTimeGetCurrent() + 5.0;
}

- (void)_addVocalsMessageView
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
  {
    if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"mic_and_stars"));
      BOOL v3 = objc_alloc(&OBJC_CLASS___UIImageView);
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v37 imageWithRenderingMode:2]);
      id v5 = -[UIImageView initWithImage:](v3, "initWithImage:", v4);

      -[UIImageView setContentMode:](v5, "setContentMode:", 1LL);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v5,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
      -[UIImageView setTintColor:](v5, "setTintColor:", v6);

      CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5, "widthAnchor"));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 constraintEqualToConstant:30.0]);
      v40[0] = v8;
      double v9 = v5;
      id v36 = v5;
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5, "heightAnchor"));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToConstant:30.0]);
      v40[1] = v11;
      double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v12);

      double v13 = objc_opt_new(&OBJC_CLASS___UILabel);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v13,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      LODWORD(v14) = 1132003328;
      -[UILabel setContentCompressionResistancePriority:forAxis:]( v13,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v14);
      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleCaption2,  256LL));
      -[UILabel setFont:](v13, "setFont:", v15);

      -[UILabel setLineBreakMode:](v13, "setLineBreakMode:", 4LL);
      double v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](v13, "setTextColor:", v16);

      -[UILabel setPreferredVibrancy:](v13, "setPreferredVibrancy:", 1LL);
      double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      CGRect v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"VocalAttenuationUnavailable" value:&stru_100279068 table:0]);
      -[UILabel setText:](v13, "setText:", v18);

      int v19 = objc_alloc(&OBJC_CLASS___UIStackView);
      v39[0] = v9;
      v39[1] = v13;
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
      double v21 = -[UIStackView initWithArrangedSubviews:](v19, "initWithArrangedSubviews:", v20);

      LODWORD(v22) = 1132003328;
      -[UIView setContentCompressionResistancePriority:forAxis:]( v21,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v22);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
      -[UIView setAxis:](v21, "setAxis:", 0LL);
      -[UIView setAlignment:](v21, "setAlignment:", 0LL);
      -[UIView setDistribution:](v21, "setDistribution:", 3LL);
      -[UIView setSpacing:](v21, "setSpacing:", 10.0);
      -[UIView setUserInteractionEnabled:](v21, "setUserInteractionEnabled:", 0LL);
      -[UIView setAlpha:](v21, "setAlpha:", 0.0);
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      [v23 addSubview:v21];

      vocalsMessageView = self->_vocalsMessageView;
      self->_vocalsMessageView = v21;
      id v34 = v21;

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_vocalsMessageView, "trailingAnchor"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 safeAreaLayoutGuide]);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 trailingAnchor]);
      double v28 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v27]);
      v38[0] = v28;
      char v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v13, "lastBaselineAnchor"));
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
      objc_super v31 = (void *)objc_claimAutoreleasedReturnValue([v30 lastBaselineAnchor]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v31]);
      v38[1] = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v33);
    }
  }

- (void)_updateVocalsMessageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
    [v5 alpha];
    if (v6 <= 0.0) {
      unsigned int v7 = 0;
    }
    else {
      unsigned int v7 = !-[TVMNowPlayingViewController isTransportBarVisible](self, "isTransportBarVisible");
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playQueue]);
    unsigned int v10 = [v9 canEnableVocalAttenuation];

    if ((v7 & (v10 ^ 1)) != 0) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    if (v3)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000C2A9C;
      v13[3] = &unk_100268E30;
      void v13[4] = self;
      *(double *)&void v13[5] = v11;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v13, 0.3);
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController vocalsMessageView](self, "vocalsMessageView"));
      [v12 setAlpha:v11];
    }
  }

- (int64_t)viewStyle
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  id v3 = [v2 style];

  return (int64_t)v3;
}

- (void)setViewStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[TVMNowPlayingViewController viewStyle](self, "viewStyle") != a3)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
    [v7 setStyle:a3];

    -[TVMNowPlayingViewController _updateForViewStyle:animated:](self, "_updateForViewStyle:animated:", a3, v4);
  }

- (void)_updateForViewStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController partyStudioAnimators](self, "partyStudioAnimators"));
    id v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v7) {
      goto LABEL_20;
    }
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ([v12 isRunning])
        {
          [v12 stopAnimation:0];
          [v12 finishAnimationAtPosition:0];
          char v9 = 1;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v8);

    if ((v9 & 1) != 0)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
      if (!v13)
      {
        double v6 = 0LL;
        goto LABEL_20;
      }

      double v14 = (void *)v13;
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v15 indexPathForItemIdentifier:v16]);

      if (v6)
      {
        double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v17 cellForItemAtIndexPath:v6]);
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v19);
        if ((objc_opt_isKindOfClass(v18, v20) & 1) == 0)
        {
LABEL_18:

          goto LABEL_20;
        }

        double v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 cellForItemAtIndexPath:v6]);

        if (v22)
        {
          CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v22 contentView]);
          [v18 setAlpha:1.0];
          double v17 = v22;
          goto LABEL_18;
        }
      }

- (void)_syncPlaybackProgressAnimatorToTransportBarVisibleState:(BOOL)a3
{
  playbackProgressAnimator = self->_playbackProgressAnimator;
  if (playbackProgressAnimator) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (v5)
  {
    if (playbackProgressAnimator && !a3)
    {
      -[TVMusicPlaybackProgressAnimator invalidate](playbackProgressAnimator, "invalidate");
      double v6 = self->_playbackProgressAnimator;
      self->_playbackProgressAnimator = 0LL;
    }
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player", a3));
    id v7 = -[TVMusicPlaybackProgressAnimator initWithTransportBarView:]( objc_alloc(&OBJC_CLASS___TVMusicPlaybackProgressAnimator),  "initWithTransportBarView:",  self->_transportBar);
    id v8 = self->_playbackProgressAnimator;
    self->_playbackProgressAnimator = v7;

    -[TVMusicPlaybackProgressAnimator setDelegate:](self->_playbackProgressAnimator, "setDelegate:", self);
    -[TVMusicPlaybackProgressAnimator tvs_bind:toObject:withKeyPath:options:]( self->_playbackProgressAnimator,  "tvs_bind:toObject:withKeyPath:options:",  @"playbackDuration",  v13,  @"duration",  0LL);
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackProgressAnimator](self, "playbackProgressAnimator"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    [v10 rate];
    objc_msgSend(v9, "setEffectivePlaybackRate:");

    [v13 elapsedTime];
    if (v11 != 0.0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackProgressAnimator](self, "playbackProgressAnimator"));
      [v13 elapsedTime];
      objc_msgSend(v12, "moveInstantaneouslyToElapsedTime:");
    }
  }

- (id)_itemIdentifierForPlayingItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentMediaItem]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVMusicMPObjectMediaItem, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentMediaItem]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_indexPathForPlayingItem
{
  return +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  -[TVMNowPlayingViewController _indexForPlayingItem](self, "_indexForPlayingItem"),  0LL);
}

- (int64_t)_indexForPlayingItem
{
  int64_t v3 = -[TVMNowPlayingViewController numberOfMediaItems](self, "numberOfMediaItems");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playlist]);
  uint64_t v6 = (uint64_t)[v5 activeListIndex];

  else {
    return v6 & ~(v6 >> 63);
  }
}

- (CGSize)_itemSizeForMediaItem:(id)a3
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
  unsigned int v4 = [v3 isEqualToString:TVPMediaTypeMusicVideo];
  uint64_t v5 = &qword_1001E7F88;
  if (!v4) {
    uint64_t v5 = &qword_1001E7F78;
  }
  double v6 = *(double *)v5;
  if (v4) {
    id v7 = (uint64_t *)&unk_1001E7F90;
  }
  else {
    id v7 = &qword_1001E7F80;
  }
  double v8 = *(double *)v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_addGestureRecognizers
{
  id v27 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  int64_t v3 = -[TVMusicB39TapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVMusicB39TapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleLeftTap:");
  leftTapGestureRecognizer = self->_leftTapGestureRecognizer;
  self->_leftTapGestureRecognizer = v3;

  -[TVMusicB39TapGestureRecognizer setAllowedPressTypes:]( self->_leftTapGestureRecognizer,  "setAllowedPressTypes:",  &off_100282330);
  -[TVMusicB39TapGestureRecognizer setDelegate:](self->_leftTapGestureRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_leftTapGestureRecognizer];
  uint64_t v5 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handleLeftLongClick:");
  leftb39LongClickRecognizer = self->_leftb39LongClickRecognizer;
  self->_leftb39LongClickRecognizer = v5;

  -[UILongPressGestureRecognizer setAllowedPressTypes:]( self->_leftb39LongClickRecognizer,  "setAllowedPressTypes:",  &off_100282348);
  -[UILongPressGestureRecognizer setDelegate:](self->_leftb39LongClickRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_leftb39LongClickRecognizer];
  id v7 = -[TVMusicB39TapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVMusicB39TapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleRightTap:");
  rightTapGestureRecognizer = self->_rightTapGestureRecognizer;
  self->_rightTapGestureRecognizer = v7;

  -[TVMusicB39TapGestureRecognizer setAllowedPressTypes:]( self->_rightTapGestureRecognizer,  "setAllowedPressTypes:",  &off_100282360);
  -[TVMusicB39TapGestureRecognizer setDelegate:](self->_rightTapGestureRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_rightTapGestureRecognizer];
  double v9 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handleRightLongClick:");
  rightb39LongClickRecognizer = self->_rightb39LongClickRecognizer;
  self->_rightb39LongClickRecognizer = v9;

  -[UILongPressGestureRecognizer setAllowedPressTypes:]( self->_rightb39LongClickRecognizer,  "setAllowedPressTypes:",  &off_100282378);
  -[UILongPressGestureRecognizer setDelegate:](self->_rightb39LongClickRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_rightb39LongClickRecognizer];
  double v11 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleTogglePlayPause");
  -[UITapGestureRecognizer setAllowedPressTypes:](v11, "setAllowedPressTypes:", &off_100282390);
  [v27 addGestureRecognizer:v11];
  id v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  menuButtonRecognizer = self->_menuButtonRecognizer;
  self->_menuButtonRecognizer = v12;

  -[UITapGestureRecognizer setDelegate:](self->_menuButtonRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setAllowedPressTypes:](self->_menuButtonRecognizer, "setAllowedPressTypes:", &off_1002823A8);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  [v14 addGestureRecognizer:self->_menuButtonRecognizer];

  double v15 = -[UIDigitizerLongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UIDigitizerLongPressGestureRecognizer),  "initWithTarget:action:",  self,  "_handleLongClick:");
  longClickGestureRecognizer = self->_longClickGestureRecognizer;
  self->_longClickGestureRecognizer = v15;

  -[UIDigitizerLongPressGestureRecognizer setDelegate:](self->_longClickGestureRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_longClickGestureRecognizer];
  double v17 = -[TVMusicSelectGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVMusicSelectGestureRecognizer),  "initWithTarget:action:",  self,  "_handleSelectButton:");
  selectGestureRecognizer = self->_selectGestureRecognizer;
  self->_selectGestureRecognizer = v17;

  -[TVMusicSelectGestureRecognizer setDelegate:](self->_selectGestureRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_selectGestureRecognizer];
  uint64_t v19 = -[TVMusicB39TapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVMusicB39TapGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePhysicalSelectButton:");
  selectTapGestureRecognizer = self->_selectTapGestureRecognizer;
  self->_selectTapGestureRecognizer = v19;

  -[TVMusicB39TapGestureRecognizer setAllowedPressTypes:]( self->_selectTapGestureRecognizer,  "setAllowedPressTypes:",  &off_1002823C0);
  -[TVMusicB39TapGestureRecognizer setDelegate:](self->_selectTapGestureRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_selectTapGestureRecognizer];
  double v21 = -[TVMusicB239FingerRestGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVMusicB239FingerRestGestureRecognizer),  "initWithTarget:action:",  self,  "_fingerRestRecognized:");
  fingerRestedRecognizer = self->_fingerRestedRecognizer;
  self->_fingerRestedRecognizer = v21;

  -[TVMusicB239FingerRestGestureRecognizer setAllowedPressTypes:]( self->_fingerRestedRecognizer,  "setAllowedPressTypes:",  &off_1002823D8);
  -[TVMusicB239FingerRestGestureRecognizer setMinimumPressDuration:]( self->_fingerRestedRecognizer,  "setMinimumPressDuration:",  0.2);
  -[TVMusicB239FingerRestGestureRecognizer setDelegate:](self->_fingerRestedRecognizer, "setDelegate:", self);
  [v27 addGestureRecognizer:self->_fingerRestedRecognizer];
  BOOL v23 = -[TVMusicNowPlayingStateToggleGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVMusicNowPlayingStateToggleGestureRecognizer),  "initWithTarget:action:",  self,  "_handleStateToggleGesture:");
  toggleStateGestureRecognizer = self->_toggleStateGestureRecognizer;
  self->_toggleStateGestureRecognizer = v23;

  -[TVMusicNowPlayingStateToggleGestureRecognizer setAllowedPressTypes:]( self->_toggleStateGestureRecognizer,  "setAllowedPressTypes:",  &off_1002823F0);
  -[TVMusicNowPlayingStateToggleGestureRecognizer setDelegate:]( self->_toggleStateGestureRecognizer,  "setDelegate:",  self);
  [v27 addGestureRecognizer:self->_toggleStateGestureRecognizer];
  id v25 = -[TVMusicNowPlayingInteractionGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVMusicNowPlayingInteractionGestureRecognizer),  "initWithTarget:action:",  self,  "_handleTouchInteractionGesture:");
  touchInteractionGestureRecognizer = self->_touchInteractionGestureRecognizer;
  self->_touchInteractionGestureRecognizer = v25;

  -[TVMusicNowPlayingInteractionGestureRecognizer setDelegate:]( self->_touchInteractionGestureRecognizer,  "setDelegate:",  self);
  [v27 addGestureRecognizer:self->_touchInteractionGestureRecognizer];
}

- (BOOL)_skipForwardOrBackIfNeeded
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  [v3 duration];
  double v5 = v4;
  double v6 = TVPDurationUnknown;

  if (v5 == v6) {
    return 0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  [v7 elapsedTime];
  double v9 = v8;

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
  id v11 = [v10 backwardAccessoryType];

  if (v11 == (id)2)
  {
    if (v9 + -30.0 >= 0.0) {
      double v12 = v9 + -30.0;
    }
    else {
      double v12 = 0.0;
    }
  }

  else
  {
    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
    id v19 = [v18 forwardAccessoryType];

    if (v19 != (id)2) {
      return 0;
    }
    double v12 = v9 + 30.0;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    [v20 duration];
    if (v21 == TVPDurationIndefinite)
    {
    }

    else
    {
      double v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      [v22 duration];
      double v24 = v23;

      if (v12 >= v24) {
        return 0;
      }
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  [v13 elapsedTime];
  double v15 = v14;

  if (v12 != v15)
  {
    -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", 2LL);
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    [v16 setElapsedTime:v12];

    return 1;
  }

  return 0;
}

- (int64_t)_forwardAccessoryTypeForCenterRestState
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  unsigned int v4 = [v3 isLive];

  if (!v4) {
    return 0LL;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
  if (v6 == v7) {
    int64_t v8 = 5LL;
  }
  else {
    int64_t v8 = 4LL;
  }

  return v8;
}

- (int64_t)_preferredAccessoryTypeForCurrentState
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
  id v5 = [v4 item];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController mediaItemAtIndex:](self, "mediaItemAtIndex:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
  unsigned int v8 = [v7 isScrubberFocused];

  if (v8)
  {
    if ([v3 isLive])
    {
      int64_t v9 = 0LL;
    }

    else
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playQueue]);
      if ([v11 isRadioStationStreaming])
      {
      }

      else
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue( [v6 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataArtistUploaded"]);
        unsigned int v13 = [v12 BOOLValue];

        if (!v13)
        {
          int64_t v9 = 1LL;
          goto LABEL_10;
        }
      }

      int64_t v9 = 2LL;
    }
  }

  else
  {
    int64_t v9 = -[TVMNowPlayingViewController _isCellFocused](self, "_isCellFocused");
  }

- (BOOL)_isCellFocused
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tvm_focusedView"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (id)_motionArtworkForItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController motionArtworkTable](self, "motionArtworkTable"));
    id v7 = (TVMNowPlayingMotionArtwork *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

    if (!v7)
    {
      id v7 = -[TVMNowPlayingMotionArtwork initWithMediaItem:]( objc_alloc(&OBJC_CLASS___TVMNowPlayingMotionArtwork),  "initWithMediaItem:",  v4);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController motionArtworkCache](self, "motionArtworkCache"));
      [v8 setObject:v7 forKey:v5];

      int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController motionArtworkTable](self, "motionArtworkTable"));
      [v9 setObject:v7 forKey:v5];
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (double)currentElapsedTimeForPlaybackProgressAnimator:(id)a3
{
  if (-[TVMNowPlayingViewController isScrubbing](self, "isScrubbing", a3))
  {
    -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", 2LL);
    -[TVMNowPlayingViewController scrubPercentage](self, "scrubPercentage");
    -[TVMNowPlayingViewController _elapsedTimeForScrubPercentage:](self, "_elapsedTimeForScrubPercentage:");
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    [v5 elapsedTime];
    double v7 = v6;

    return v7;
  }

  return result;
}

- (void)playbackProgressAnimator:(id)a3 updateTitlesForElapsedTime:(double)a4 withPlaybackDuration:(double)a5
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController definiteDurationPlaybackProgress]( self,  "definiteDurationPlaybackProgress",  a3));
  [v7 setElapsedTime:a4];
  [v7 setDuration:a5];
}

- (void)_updateOffsetWithElapsedTime:(double)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController scrubScrollView](self, "scrubScrollView"));
  -[TVMNowPlayingViewController _scrubPercentageForElapsedTime:](self, "_scrubPercentageForElapsedTime:", a3);
  -[TVMNowPlayingViewController _contentOffsetForScrubPercentage:withScrollView:]( self,  "_contentOffsetForScrubPercentage:withScrollView:",  v5);
  objc_msgSend(v5, "setContentOffset:");
}

- (double)_elapsedTimeForScrubPercentage:(double)a3
{
  return v4 * a3;
}

- (double)_scrubPercentageForElapsedTime:(double)a3
{
  double v5 = a3 / v4;
  BOOL v6 = v4 <= 0.0;
  double result = 0.0;
  if (!v6) {
    return v5;
  }
  return result;
}

- (CGPoint)_contentOffsetForScrubPercentage:(double)a3 withScrollView:(id)a4
{
  CGFloat y = CGPointZero.y;
  id v6 = a4;
  [v6 contentSize];
  double v8 = v7;
  [v6 bounds];
  double v10 = v9;

  double v11 = (1.0 - a3) * (v8 - v10);
  double v12 = y;
  result.CGFloat y = v12;
  result.x = v11;
  return result;
}

- (double)_scrubPercentageForContentOffset:(CGPoint)a3 withScrollView:(id)a4
{
  double x = a3.x;
  id v5 = a4;
  [v5 contentSize];
  double v7 = v6;
  [v5 bounds];
  double v9 = v8;

  return 1.0 - x / (v7 - v9);
}

- (void)_updateScrubPercentageWithScrollView:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  -[TVMNowPlayingViewController _scrubPercentageForContentOffset:withScrollView:]( self,  "_scrubPercentageForContentOffset:withScrollView:",  v4);
  double v6 = v5;

  -[TVMNowPlayingViewController setScrubPercentage:](self, "setScrubPercentage:", v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  unsigned int v13 = (UIScrollView *)a3;
  if (self->_scrubScrollView == v13)
  {
    -[TVMNowPlayingViewController _scrubScrollViewDidScroll](self, "_scrubScrollViewDidScroll");
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    [v4 alpha];
    if (v5 <= 2.22044605e-16)
    {
    }

    else
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      [v6 alpha];
      double v8 = v7;

      if (v8 > 2.22044605e-16)
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        [v9 setAlpha:0.0];

        double v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _cellForSingleCoverMediaItem]( self,  "_cellForSingleCoverMediaItem"));
        double v11 = v10;
        if (v10)
        {
          double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 contentView]);
          [v12 setAlpha:1.0];
        }
      }
    }
  }
}

- (void)_scrubScrollViewDidScroll
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[TVMNowPlayingViewController setLastObserverFireDate:](self, "setLastObserverFireDate:", v3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  double v9 = (UIScrollView *)a3;
  if (self->_scrubScrollView == v9)
  {
    -[TVMNowPlayingViewController _scrubScrollViewWillBeginDragging](self, "_scrubScrollViewWillBeginDragging");
  }

  else if ((+[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR") & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 backgroundProvider]);
    char v6 = objc_opt_respondsToSelector(v5, "beginThrottle");

    if ((v6 & 1) != 0)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 backgroundProvider]);
      [v8 beginThrottle];
    }
  }
}

- (void)_scrubScrollViewWillBeginDragging
{
  if (!-[TVMNowPlayingViewController waitingForPlayerJump](self, "waitingForPlayerJump"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    [v3 elapsedTime];
    double v5 = v4;

    -[TVMNowPlayingViewController _updateOffsetWithElapsedTime:](self, "_updateOffsetWithElapsedTime:", v5);
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackProgressAnimator](self, "playbackProgressAnimator"));
    [v6 moveInstantaneouslyToElapsedTime:v5];
  }

  -[TVMNowPlayingViewController scrubPercentage](self, "scrubPercentage");
  -[TVMNowPlayingViewController _elapsedTimeForScrubPercentage:](self, "_elapsedTimeForScrubPercentage:");
  -[TVMNowPlayingViewController setLastKnownElapsedTime:](self, "setLastKnownElapsedTime:");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[TVMNowPlayingViewController setLastObserverFireDate:](self, "setLastObserverFireDate:", v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackProgressAnimator](self, "playbackProgressAnimator"));
  [v8 beginDragging];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (UIScrollView *)a3;
  if (self->_scrubScrollView == v6)
  {
    unsigned int v13 = v6;
    -[TVMNowPlayingViewController _scrubScrollViewDidEndDraggingAndWillDecelerate:]( self,  "_scrubScrollViewDidEndDraggingAndWillDecelerate:",  v4);
    goto LABEL_7;
  }

  if (!v4)
  {
    unsigned int v13 = v6;
    unsigned __int8 v7 = +[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR");
    char v6 = v13;
    if ((v7 & 1) == 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 backgroundProvider]);
      char v10 = objc_opt_respondsToSelector(v9, "endThrottle");

      char v6 = v13;
      if ((v10 & 1) != 0)
      {
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 backgroundProvider]);
        [v12 endThrottle];

LABEL_7:
        char v6 = v13;
      }
    }
  }
}

- (void)_scrubScrollViewDidEndDraggingAndWillDecelerate:(BOOL)a3
{
  if (-[TVMNowPlayingViewController isScrubbing](self, "isScrubbing")) {
    -[TVMNowPlayingViewController setWaitingForPlayerJump:](self, "setWaitingForPlayerJump:", 1LL);
  }
  if (!a3 && !-[TVMNowPlayingViewController scrubWasDecelerating](self, "scrubWasDecelerating")) {
    -[TVMNowPlayingViewController _scrubScrollViewDidEndDecelerating](self, "_scrubScrollViewDidEndDecelerating");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v12 = (UIScrollView *)a3;
  if (self->_scrubScrollView == v12)
  {
    -[TVMNowPlayingViewController _scrubScrollViewDidEndDecelerating](self, "_scrubScrollViewDidEndDecelerating");
    goto LABEL_7;
  }

  BOOL v4 = (UIScrollView *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));

  double v5 = v12;
  if (v4 == v12)
  {
    -[TVMNowPlayingViewController _updateFocusOnScrollEnd](self, "_updateFocusOnScrollEnd");
    unsigned __int8 v6 = +[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR");
    double v5 = v12;
    if ((v6 & 1) == 0)
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 backgroundProvider]);
      char v9 = objc_opt_respondsToSelector(v8, "endThrottle");

      double v5 = v12;
      if ((v9 & 1) != 0)
      {
        char v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
        double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 backgroundProvider]);
        [v11 endThrottle];

LABEL_7:
        double v5 = v12;
      }
    }
  }
}

- (void)_scrubScrollViewDidEndDecelerating
{
  if (-[TVMNowPlayingViewController isScrubbing](self, "isScrubbing"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackProgressAnimator](self, "playbackProgressAnimator"));
    [v3 endDragging];

    -[TVMNowPlayingViewController _setPlayerElapsedTimeFromScrubberPosition]( self,  "_setPlayerElapsedTimeFromScrubberPosition");
    dispatch_time_t v4 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C43E4;
    block[3] = &unk_100268CF0;
    void block[4] = self;
    dispatch_after(v4, &_dispatch_main_q, block);
  }

- (void)_setPlayerElapsedTimeFromScrubberPosition
{
  double v4 = v3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  [v5 setElapsedTime:v4];
}

- (void)_willOpenVocalAttenuationView:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView", a3));
  [v3 setUserInteractionEnabled:0];
}

- (void)_willCloseVocalAttenuationView:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView", a3));
  [v3 setUserInteractionEnabled:1];
}

- (void)_showContextMenu
{
  if ((_os_feature_enabled_impl("UIKit", "tv_context_menu") & 1) == 0)
  {
    double v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  1LL));
    objc_initWeak(location, self);
    -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", 0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playlist]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
    id v6 = [v5 item];

    unsigned __int8 v7 = [v4 canMoveItemAtIndexToPlayNext:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController mediaItemAtIndex:](self, "mediaItemAtIndex:", v6));
    if (v8) {
      unsigned __int8 v9 = [v4 canInsertAfterCurrentPlayingItem:v8];
    }
    else {
      unsigned __int8 v9 = 0;
    }
    unsigned __int8 v21 = v9;
    id v10 = [v4 endAction];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000C481C;
    v31[3] = &unk_10026DE18;
    objc_copyWeak(v33, location);
    id v11 = v4;
    id v32 = v11;
    v33[1] = v10;
    double v12 = objc_retainBlock(v31);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
    char v14 = objc_opt_respondsToSelector(v13, "contextMenuForMediaItem:completionHandler:");

    if ((v14 & 1) != 0)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
      double v16 = (char *)[v15 item];
      if ((uint64_t)v16 >= (uint64_t)((char *)-[TVMNowPlayingViewController numberOfMediaItems]( self,  "numberOfMediaItems")
                                   - 1))
      {
        CGRect v18 = (char *)-[TVMNowPlayingViewController numberOfMediaItems](self, "numberOfMediaItems") - 1;
      }

      else
      {
        double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
        CGRect v18 = (char *)[v17 item];
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController mediaItemAtIndex:](self, "mediaItemAtIndex:", v18));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000C4858;
      v23[3] = &unk_10026DEB8;
      id v24 = v22;
      objc_copyWeak(v28, location);
      v28[1] = v6;
      id v27 = v12;
      unsigned __int8 v29 = v7;
      unsigned __int8 v30 = v21;
      id v25 = v11;
      id v26 = self;
      [v20 contextMenuForMediaItem:v19 completionHandler:v23];

      objc_destroyWeak(v28);
    }

    objc_destroyWeak(v33);
    objc_destroyWeak(location);
  }

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player", a3, a4.x, a4.y));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playQueue]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPlayerResponse]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tracklist]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMContextMenus getCurrentMusicItemFromTracklist:]( &OBJC_CLASS___TVMContextMenus,  "getCurrentMusicItemFromTracklist:",  v7));
    if (v8) {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMContextMenus menuForNowPlayingItem:]( &OBJC_CLASS___TVMContextMenus,  "menuForNowPlayingItem:",  v8));
    }
    else {
      unsigned __int8 v9 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v9 = 0LL;
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = objc_alloc(&OBJC_CLASS___UITargetedPreview);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 imageView]);
  id v8 = [v5 initWithView:v7];

  return v8;
}

- (void)nowPlayingView:(id)a3 playlistWillBecomeVisibleWithAnimator:(id)a4 interruptingTransition:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  -[TVMNowPlayingViewController configureVideoForVisibleCells](self, "configureVideoForVisibleCells");
  if (!-[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    [v11 alpha];
    if (v12 <= 2.22044605e-16)
    {
LABEL_22:

LABEL_23:
      -[TVMNowPlayingViewController _removeIdleViewControllerAndRestoreLayout:animatingBeforePlaylist:]( self,  "_removeIdleViewControllerAndRestoreLayout:animatingBeforePlaylist:",  1LL,  1LL);
      if (v5) {
        double v10 = 0.0;
      }
      else {
        double v10 = v56;
      }
      goto LABEL_26;
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

    if (!v13) {
      goto LABEL_23;
    }
    char v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 nowPlayingConfiguration]);
    id v16 = [v15 copy];

    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
    objc_msgSend(v16, "setIsFocused:", objc_msgSend(v17, "tvm_isDescendentFocused"));

    [v16 setIsHighlighted:0];
    [v16 setVideoView:0];
    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v19 indexPathForItemIdentifier:v20]);

      if (v11)
      {
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 cellForItemAtIndexPath:v11]);
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v23);
        if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v25 cellForItemAtIndexPath:v11]);
        }

        else
        {
          CGRect v18 = 0LL;
        }
      }

      else
      {
        CGRect v18 = 0LL;
      }
    }

    else
    {
      id v11 = 0LL;
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 contentView]);
    [v26 setAlpha:0.0];

    unsigned int v27 = [v16 isFocused];
    uint64_t v28 = 1LL;
    if (!v27) {
      uint64_t v28 = 2LL;
    }
    uint64_t v59 = v28;
    int64x2_t v60 = vdupq_n_s64(2uLL);
    [v18 setEffectOverrides:&v59];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_1000C5350;
    v57[3] = &unk_100268B30;
    v57[4] = self;
    id v58 = v16;
    id v29 = v16;
    [v7 addAnimations:v57];
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 videoOutput]);
    if (v31)
    {
      id v32 = (void *)v31;
      unsigned __int8 v33 = -[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented");

      if ((v33 & 1) != 0)
      {
LABEL_21:

        goto LABEL_22;
      }

      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
      unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue([v34 view]);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
      [v36 bounds];
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      id v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      objc_msgSend(v35, "convertRect:toView:", v45, v38, v40, v42, v44);
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      [v54 addSubview:v30];

      objc_msgSend(v30, "setFrame:", v47, v49, v51, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v30 layer]);
      [v55 setCornerRadius:12.0];
    }

    goto LABEL_21;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));

  if (v8) {
    -[TVMNowPlayingViewController _removeIdleViewControllerAndRestoreLayout:]( self,  "_removeIdleViewControllerAndRestoreLayout:",  0LL);
  }
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  double v10 = 0.0;
  [v9 setAlpha:0.0];

LABEL_26:
  [v7 startAnimationAfterDelay:v10];
}

- (void)nowPlayingView:(id)a3 playlistWillBecomeHiddenWithAnimator:(id)a4 executionBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 indexPathForItemIdentifier:v12]);

      if (v13)
      {
        char v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 cellForItemAtIndexPath:v13]);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v16);
        if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
        {
          CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          double v10 = (void *)objc_claimAutoreleasedReturnValue([v18 cellForItemAtIndexPath:v13]);
        }

        else
        {
          double v10 = 0LL;
        }

        if (v10)
        {
          if (v9)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 superview]);

            if (v19)
            {
              [v10 center];
              double v21 = v20;
              double v23 = v22;
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 superview]);
              objc_msgSend(v9, "convertPoint:fromView:", v24, v21, v23);
              double v26 = v25;
              double v28 = v27;

              id v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
              [v29 center];
              CGFloat v31 = v26 - v30;
              id v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
              [v32 center];
              CGAffineTransformMakeTranslation(&v71, v31, v28 - v33);
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
              CGAffineTransform v70 = v71;
              [v34 setTransform:&v70];

              v35 = (void *)objc_claimAutoreleasedReturnValue([v10 contentView]);
              [v35 setAlpha:0.0];
            }
          }
        }
      }

      else
      {
        double v10 = 0LL;
      }
    }

    else
    {
      unsigned int v13 = 0LL;
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    double v37 = (void *)objc_claimAutoreleasedReturnValue([v36 nowPlayingConfiguration]);
    id v38 = [v37 copy];

    [v38 setIsFocused:0];
    [v38 setIsHighlighted:0];
    double v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    [v39 setNowPlayingConfiguration:v38];

    double v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    [v40 setAlpha:1.0];
  }

  double v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  uint64_t v42 = objc_claimAutoreleasedReturnValue([v41 videoOutput]);
  if (!v42) {
    goto LABEL_17;
  }
  double v43 = (void *)v42;
  unsigned __int8 v44 = -[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented");

  if ((v44 & 1) == 0)
  {
    id v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    double v41 = (void *)objc_claimAutoreleasedReturnValue([v45 view]);

    double v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    double v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    [v47 bounds];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    objc_msgSend(v46, "convertRect:toView:", v56, v49, v51, v53, v55);
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;

    id v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    [v65 addSubview:v41];

    objc_msgSend(v41, "setFrame:", v58, v60, v62, v64);
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v41 layer]);
    [v66 setCornerRadius:12.0];

LABEL_17:
  }

  double v67 = 1.0;
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    double v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
    else {
      double v67 = 1.0;
    }
    int v68 = 1;
  }

  else
  {
    int v68 = 0;
  }

  __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  [v69 setAlpha:v67];

  if (v68) {
  v6[2](v6);
  }
}

- (void)nowPlayingViewPlaylistDidBecomeVisible:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _cellForSingleCoverMediaItem](self, "_cellForSingleCoverMediaItem"));
  BOOL v5 = v4;
  if (v4)
  {
    memset(v26, 0, sizeof(v26));
    [v4 setEffectOverrides:v26];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentView]);
    [v6 setAlpha:1.0];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingConfiguration]);
  id v9 = [v8 copy];

  [v9 setVideoView:0];
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  [v10 setNowPlayingConfiguration:v9];

  -[TVMNowPlayingViewController configureVideoForVisibleCells](self, "configureVideoForVisibleCells");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 superview]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
  if (v13 == (void *)v14)
  {

    goto LABEL_7;
  }

  double v15 = (void *)v14;
  unsigned __int8 v16 = -[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented");

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);

    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    [v18 bounds];
    objc_msgSend(v11, "setFrame:");

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    [v19 addSubview:v11];

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
    [v12 setCornerRadius:0.0];
LABEL_7:
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  if (v20)
  {
    double v21 = (void *)v20;
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    [v22 alpha];
    double v24 = v23;

    if (v24 > 2.22044605e-16)
    {
      double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v25 setAlpha:0.0];
    }
  }
}

- (void)nowPlayingViewPlaylistDidBecomeHidden:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingConfiguration]);
  id v20 = [v5 copy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
  [v20 setVideoView:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  [v7 setNowPlayingConfiguration:v20];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layer]);
  [v10 setCornerRadius:0.0];

  -[TVMNowPlayingViewController setScrollWithPlayingItem:](self, "setScrollWithPlayingItem:", 1LL);
  -[TVMNowPlayingViewController _updateIdleViewControllerIfNeeded](self, "_updateIdleViewControllerIfNeeded");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 superview]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
  if (v13 == (void *)v14)
  {

    goto LABEL_5;
  }

  double v15 = (void *)v14;
  unsigned __int8 v16 = -[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented");

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);

    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    [v18 bounds];
    objc_msgSend(v11, "setFrame:");

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
    [v19 addSubview:v11];

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
    [v12 setCornerRadius:0.0];
LABEL_5:
  }
}

- (BOOL)nowPlayingViewShouldHandlePressPlayPause:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController presentedViewController](self, "presentedViewController", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIAlertController, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (void)nowPlayingViewDidPressPlayPause:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v5 == v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    [v7 pause];
  }

- (void)nowPlayingViewDidSelectRepeat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);

  id v7 = [v4 repeatMode];
  if (v7) {
    uint64_t v8 = 2LL * (v7 == (id)1);
  }
  else {
    uint64_t v8 = 1LL;
  }
  id v9 = sub_1000BD900();
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    id v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Playlist set repeatMode: %li to %li",  (uint8_t *)&v11,  0x16u);
  }

  [v6 setRepeatMode:v8];
  [v4 setRepeatMode:v8];
}

- (void)nowPlayingViewDidSelectShuffle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);

  uint64_t v7 = [v6 shuffleEnabled] ^ 1;
  id v8 = sub_1000BD900();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Playlist set shuffleEnabled: %d",  (uint8_t *)v10,  8u);
  }

  [v6 setShuffleEnabled:v7 preserveCurrentItem:1];
  [v4 setShuffleEnabled:v7];
}

- (void)nowPlayingViewLyricsSelected:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine", a3));
  [v3 postEvent:@"Force rest mode"];
}

- (id)nowPlayingCurrentLyricsViewController:(id)a3
{
  idleViewController = self->_idleViewController;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVMTimedLyricsViewController, a2);
  if ((objc_opt_isKindOfClass(idleViewController, v5) & 1) != 0) {
    id v6 = self->_idleViewController;
  }
  else {
    id v6 = 0LL;
  }
  return v6;
}

- (void)_performPlayNextCommandForItemAtIndex:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
  uint64_t v7 = (char *)[v6 item];

  else {
    id v8 = v7 + 1;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v8,  0LL));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController mediaItemAtIndex:](self, "mediaItemAtIndex:", a3));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000C623C;
  v21[3] = &unk_10026DEE0;
  v21[4] = self;
  id v11 = v5;
  id v22 = v11;
  id v12 = objc_retainBlock(v21);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playQueue]);

  if ([v14 canMoveItemAtIndexToPlayNext:a3])
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 snapshot]);

    [v14 moveItemAtIndexToPlayNext:a3];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 currentMediaItem]);
    [v16 moveItemWithIdentifier:v10 afterItemWithIdentifier:v17];

    -[TVMNowPlayingViewController setCenterIndexPath:](self, "setCenterIndexPath:", v9);
    CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000C6294;
    v20[3] = &unk_100268CF0;
    v20[4] = self;
    [v18 applySnapshot:v16 animatingDifferences:1 completion:v20];

    ((void (*)(void *, void *))v12[2])(v12, v9);
  }

  else if (v10 && [v14 canInsertAfterCurrentPlayingItem:v10])
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v8 + 1,  0LL));

    [v14 insertAfterCurrentPlayingItem:v10];
    ((void (*)(void *, uint64_t))v12[2])(v12, v19);
    id v9 = (void *)v19;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (TVMusicB39TapGestureRecognizer *)a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 currentState]);

  if ((TVMusicB39TapGestureRecognizer *)self->_menuButtonRecognizer != v4)
  {
    if ((TVMusicB39TapGestureRecognizer *)self->_leftb39LongClickRecognizer == v4
      || (TVMusicB39TapGestureRecognizer *)self->_rightb39LongClickRecognizer == v4)
    {
      if (v6 == @"Active mode")
      {
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
        unsigned __int8 v14 = [v13 isScrubberFocused];

        if ((v14 & 1) != 0) {
          goto LABEL_18;
        }
      }

      if (v6 == @"Rest mode") {
        goto LABEL_18;
      }
    }

    else if (self->_leftTapGestureRecognizer != v4 && self->_rightTapGestureRecognizer != v4 {
           || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView")),
    }
               id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 controlsContainerView]),
               unsigned __int8 v9 = objc_msgSend(v8, "tvm_isDescendentFocused"),
               v8,
               v7,
               (v9 & 1) == 0))
    {
LABEL_18:
      unsigned int v12 = !-[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented");
      goto LABEL_19;
    }

    goto LABEL_17;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  if ([v10 nothingPlaying])
  {

LABEL_17:
    LOBYTE(v12) = 0;
    goto LABEL_19;
  }

  unsigned __int8 v11 = -[TVMNowPlayingViewController singleCoverOnly](self, "singleCoverOnly");

  if ((v11 & 1) != 0) {
    goto LABEL_17;
  }
  if (-[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented"))
  {
    LOBYTE(v12) = 1;
  }

  else
  {
    if (v6 == @"Rest mode")
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      if (objc_msgSend(v17, "tvm_isDescendentFocused"))
      {
        CGRect v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
        unsigned int v16 = [v18 isEqual:v19] ^ 1;
      }

      else
      {
        LOBYTE(v16) = 0;
      }
    }

    else
    {
      LOBYTE(v16) = 0;
    }

    if (v6 == @"Active mode") {
      LOBYTE(v12) = 1;
    }
    else {
      LOBYTE(v12) = v16;
    }
  }

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_menuButtonRecognizer != a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return self->_selectTapGestureRecognizer == a3 && self->_selectGestureRecognizer == a4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  if ((self->_leftTapGestureRecognizer == a3 || self->_rightTapGestureRecognizer == a3)
    && +[TVMusicB39TapGestureRecognizer isRotary](&OBJC_CLASS___TVMusicB39TapGestureRecognizer, "isRotary"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
    if (![v7 isEqual:v8])
    {
      unsigned __int8 v11 = 0;
      goto LABEL_9;
    }

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
    unsigned int v10 = objc_msgSend(v9, "tvm_isDescendentFocused");

    if (v10)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _focusGesturesForFailureRequirements]);
      unsigned __int8 v11 = [v8 containsObject:v6];
LABEL_9:

      goto LABEL_10;
    }
  }

  unsigned __int8 v11 = 0;
LABEL_10:

  return v11;
}

- (id)preferredFocusEnvironments
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  if (!_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    || !_os_feature_enabled_impl("TVMusic", "LagunaSing")
    || !self->_cameraOptionsViewController
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation")),
        unsigned int v6 = [v5 shouldShowEffects],
        v5,
        !v6))
  {
    if (-[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented"))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
      double v28 = v8;
      unsigned __int8 v9 = &v28;
      goto LABEL_28;
    }

    if (v4 == @"Rest mode")
    {
      if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)2)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        double v27 = v8;
        unsigned __int8 v9 = &v27;
        goto LABEL_28;
      }

      if (-[TVMNowPlayingViewController isTransportBarVisible](self, "isTransportBarVisible"))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
        double v26 = v8;
        unsigned __int8 v9 = &v26;
        goto LABEL_28;
      }

      if (!-[TVMNowPlayingViewController viewStyle](self, "viewStyle"))
      {
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

        if (v16)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
          double v25 = v8;
          unsigned __int8 v9 = &v25;
          goto LABEL_28;
        }
      }

      if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)1)
      {
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));

        if (v14)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
          double v24 = v8;
          unsigned __int8 v9 = &v24;
          goto LABEL_28;
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

        if (v17)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
          double v23 = v8;
          unsigned __int8 v9 = &v23;
          goto LABEL_28;
        }
      }
    }

    else if (v4 == @"Active mode")
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController lastFocusedControl](self, "lastFocusedControl"));

      if (!v10)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
        v20[0] = v8;
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController controlsView](self, "controlsView"));
        v20[1] = v15;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));

LABEL_29:
        goto LABEL_30;
      }

      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController controlsView](self, "controlsView"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController lastFocusedControl](self, "lastFocusedControl"));
      unsigned int v13 = +[UIFocusSystem environment:containsEnvironment:]( &OBJC_CLASS___UIFocusSystem,  "environment:containsEnvironment:",  v11,  v12);

      if (v13)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController controlsView](self, "controlsView"));
        id v22 = v8;
        unsigned __int8 v9 = &v22;
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController lastFocusedControl](self, "lastFocusedControl"));
        double v21 = v8;
        unsigned __int8 v9 = &v21;
      }

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
  unsigned int v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 currentState]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 nextFocusedView]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 previouslyFocusedView]);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
  if (-[TVMNowPlayingViewController singleCoverOnly](self, "singleCoverOnly")) {
    goto LABEL_2;
  }
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  unsigned int v12 = [v11 isShowingInfo];

  if (!v12)
  {
    if (v6 == @"Rest mode" && v9)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
      unsigned __int8 v17 = [v7 isDescendantOfView:v16];

      if ((v17 & 1) == 0) {
        goto LABEL_2;
      }
    }

    else if (v6 != @"Rest mode")
    {
LABEL_20:
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      unsigned __int8 v25 = [v7 isDescendantOfView:v24];

      if ((v25 & 1) != 0 || v6 != @"Active mode")
      {
        double v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self->_transportBar, "progressBarView"));

        if (v7 == v26)
        {
          unsigned __int8 v10 = -[TVMNowPlayingViewController _isScrubbingAllowed](self, "_isScrubbingAllowed");
          goto LABEL_12;
        }

        double v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController tabBarController](self, "tabBarController"));
        double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 tabBar]);
        if (![v7 isDescendantOfView:v28])
        {

          goto LABEL_28;
        }

        unsigned __int8 v29 = -[TVMNowPlayingViewController _isVideoPresented](self, "_isVideoPresented");

        if ((v29 & 1) == 0)
        {
LABEL_28:
          if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)2)
          {
            unsigned __int8 v10 = 1;
          }

          else
          {
            double v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
            unsigned __int8 v31 = [v7 isDescendantOfView:v30];

            unsigned __int8 v10 = v31 ^ 1;
          }

          goto LABEL_12;
        }
      }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___TVMNowPlayingViewController;
  -[TVMNowPlayingViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v45,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedItem]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIView, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedItem]);
  }
  else {
    unsigned __int8 v11 = 0LL;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___UIView, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0) {
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);
  }
  else {
    double v15 = 0LL;
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  if ([v15 isDescendantOfView:v16]
    && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v17), (objc_opt_isKindOfClass(v11, v18) & 1) == 0))
  {
    uint64_t v37 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v19);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v37);

    if ((isKindOfClass & 1) == 0) {
      -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", 2LL);
    }
  }

  else
  {
  }

  double v39 = _NSConcreteStackBlock;
  uint64_t v40 = 3221225472LL;
  double v41 = sub_1000C70BC;
  uint64_t v42 = &unk_100268B30;
  id v20 = v15;
  id v43 = v20;
  unsigned __int8 v44 = self;
  [v7 addCoordinatedAnimations:&v39 completion:&stru_10026DF00];
  double v21 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _playlistCollectionView]( self,  "_playlistCollectionView",  v39,  v40,  v41,  v42));
  unsigned int v22 = [v20 isDescendantOfView:v21];

  if (v22)
  {
    if (-[TVMNowPlayingViewController isDismissingVideoView](self, "isDismissingVideoView")) {
      goto LABEL_23;
    }
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
    [v23 postEvent:@"Force rest mode"];
  }

  else
  {
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
    if (v23)
    {
      double v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _motionArtworkForItemIdentifier:]( self,  "_motionArtworkForItemIdentifier:",  v23));
      [v24 setShouldPlay:1];
      double v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
      if (v26)
      {
        if (v11)
        {
          uint64_t v27 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v25);
          if ((objc_opt_isKindOfClass(v11, v27) & 1) != 0)
          {
            double v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
            unsigned int v29 = [v20 isDescendantOfView:v28];

            if (v29)
            {
              double v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
              -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v30,  v26,  1LL);
            }
          }
        }
      }
    }

    unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 controlsContainerView]);
    unsigned int v33 = [v20 isDescendantOfView:v32];

    if (v33) {
      -[TVMNowPlayingViewController setLastFocusedControl:](self, "setLastFocusedControl:", v20);
    }
  }

LABEL_23:
  if (!-[TVMusicAudioTransportBarView isScrubberFocused](self->_transportBar, "isScrubberFocused"))
  {
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
    v35 = v34;
    id v36 = @"Unfocused Progress Bar";
    goto LABEL_28;
  }

  if (-[TVMusicAudioTransportBarView isScrubberFocused](self->_transportBar, "isScrubberFocused")
    && -[TVMNowPlayingViewController isTransportBarVisible](self, "isTransportBarVisible"))
  {
    self->_scrubberFocusTime = CFAbsoluteTimeGetCurrent();
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
    v35 = v34;
    id v36 = @"Focused Progress Bar";
LABEL_28:
    [v34 postEvent:v36];
  }
}

- (void)_handleCoverSelected:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _itemIdentifierForPlayingItem](self, "_itemIdentifierForPlayingItem", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
  uint64_t v5 = (void *)TVPMediaTypeMusicVideo;

  if (v4 == v5)
  {
    -[TVMNowPlayingViewController _presentVideoViewControllerAnimated:completion:]( self,  "_presentVideoViewControllerAnimated:completion:",  1LL,  0LL);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
    [v6 postEvent:@"Force rest mode"];
  }
}

- (void)_handleLeftTap:(id)a3
{
  id v4 = a3;
}

- (void)_handleRightTap:(id)a3
{
  id v4 = a3;
}

- (void)_fingerRestRecognized:(id)a3
{
  id v12 = a3;
  id v4 = (char *)[v12 state];
  if ((unint64_t)(v4 - 1) > 1)
  {
    unsigned __int8 v11 = v4;
    if ((unint64_t)(v4 - 3) <= 2)
    {
      p_stateMachine = &self->_stateMachine;
      -[TVSStateMachine postEvent:](*p_stateMachine, "postEvent:", @"Finger rest lifted");
      if (v11 == (char *)3)
      {
        uint64_t v9 = @"Touch up";
LABEL_12:
        -[TVSStateMachine postEvent:](*p_stateMachine, "postEvent:", v9);
      }
    }
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer state](self->_player, "state"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning"));

    if (v5 != v6)
    {
      [v12 digitizerLocation];
      int64_t v7 = +[TVMusicSelectGestureRecognizer horizontalTouchAreaForLocation:]( &OBJC_CLASS___TVMusicSelectGestureRecognizer,  "horizontalTouchAreaForLocation:");
      id v8 = @"Finger rested in center";
      if (v7 == 2) {
        id v8 = @"Finger rested on right";
      }
      if (v7 == 1) {
        uint64_t v9 = @"Finger rested on left";
      }
      else {
        uint64_t v9 = v8;
      }
      p_stateMachine = &self->_stateMachine;
      goto LABEL_12;
    }
  }
}

- (BOOL)_doesDelegateHandleControlGestures
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  char v4 = objc_opt_respondsToSelector(v3, "playbackViewController:handleControlGesture:");

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
    char v6 = objc_opt_respondsToSelector(v5, "playbackDelegate");

    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
    id v8 = v7;
    if ((v6 & 1) != 0)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 playbackDelegate]);

      id v8 = (void *)v9;
    }

    char v10 = objc_opt_respondsToSelector(v8, "playbackViewController:handleControlGesture:");
  }

  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)_delegateHandlerForControlGesture:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  LOBYTE(a3) = [v5 playbackViewController:self handleControlGesture:a3];

  return a3;
}

- (void)_handleStateToggleGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == (id)3
    && ([v4 recognizedReason] == (id)2
     || (id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") != (id)2))
  {
    -[TVSStateMachine postEvent:withContext:](self->_stateMachine, "postEvent:withContext:", @"Button touch", 0LL);
  }
}

- (void)_handleTouchInteractionGesture:(id)a3
{
  id v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = 2LL;
  }

  -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", v5);
}

- (void)_handlePhysicalSelectButton:(id)a3
{
  id v9 = a3;
  if ([v9 state] == (id)3
    && ([v9 isSynthetic] & 1) == 0
    && !-[TVMNowPlayingViewController _delegateHandlerForControlGesture:]( self,  "_delegateHandlerForControlGesture:",  0LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvm_focusedView"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIButton, v6);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v7);

    if ((isKindOfClass & 1) == 0) {
      -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Clicked select button");
    }
  }
}

- (void)_handleSelectButton:(id)a3
{
  id v21 = a3;
  id v4 = [v21 state];
  uint64_t v5 = v21;
  if (v4 != (id)3) {
    goto LABEL_14;
  }
  id v6 = [v21 horizontalTouchArea];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
    char v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
    unsigned int v11 = [v9 isEqual:v10];

    if (!v11)
    {
LABEL_8:
      unsigned __int8 v14 = -[TVMNowPlayingViewController _delegateHandlerForControlGesture:]( self,  "_delegateHandlerForControlGesture:",  0LL);
      uint64_t v5 = v21;
      if ((v14 & 1) != 0) {
        goto LABEL_14;
      }
      uint64_t v13 = @"Clicked select button";
      goto LABEL_12;
    }
  }

  if (v6 != (id)2)
  {
    if (v6 == (id)1)
    {
      unsigned __int8 v12 = -[TVMNowPlayingViewController _delegateHandlerForControlGesture:]( self,  "_delegateHandlerForControlGesture:",  1LL);
      uint64_t v5 = v21;
      if ((v12 & 1) != 0) {
        goto LABEL_14;
      }
      uint64_t v13 = @"Click left";
      goto LABEL_12;
    }

    goto LABEL_8;
  }

  unsigned __int8 v15 = -[TVMNowPlayingViewController _delegateHandlerForControlGesture:]( self,  "_delegateHandlerForControlGesture:",  2LL);
  uint64_t v5 = v21;
  if ((v15 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v13 = @"Click right";
LABEL_12:
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tvm_focusedView"));
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___UIButton, v18);
  char isKindOfClass = objc_opt_isKindOfClass(v17, v19);

  uint64_t v5 = v21;
  if ((isKindOfClass & 1) == 0)
  {
    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", v13);
    uint64_t v5 = v21;
  }

- (void)_handleLongClick:(id)a3
{
  id v8 = a3;
  id v4 = (char *)[v8 state];
  if (v4 == (char *)1)
  {
    [v8 digitizerLocation];
    int64_t v5 = +[TVMusicSelectGestureRecognizer horizontalTouchAreaForLocation:]( &OBJC_CLASS___TVMusicSelectGestureRecognizer,  "horizontalTouchAreaForLocation:");
    id v6 = @"Long click center";
    if (v5 == 2) {
      id v6 = @"Long click right";
    }
    if (v5 == 1) {
      uint64_t v7 = @"Long click left";
    }
    else {
      uint64_t v7 = v6;
    }
    goto LABEL_9;
  }

  if ((unint64_t)(v4 - 3) <= 1)
  {
    uint64_t v7 = @"Long click ended";
LABEL_9:
    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", v7);
  }
}

- (void)_handleLeftLongClick:(id)a3
{
  id v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    int64_t v5 = @"Long click ended";
  }

  else
  {
    int64_t v5 = @"Long click left";
  }

  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", v5);
}

- (void)_handleRightLongClick:(id)a3
{
  id v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    int64_t v5 = @"Long click ended";
  }

  else
  {
    int64_t v5 = @"Long click right";
  }

  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", v5);
}

- (void)_handleMenuButton:(id)a3
{
}

- (void)_handleTogglePlayPause
{
  id v3 = sub_1000BD900();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    char v10 = "-[TVMNowPlayingViewController _handleTogglePlayPause]";
    __int16 v11 = 2080;
    unsigned __int8 v12 = "-[TVMNowPlayingViewController _handleTogglePlayPause]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v9, 0x16u);
  }

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v6 != v7) {
    -[TVMNowPlayingViewController _willStartUserInitiatedPlayback](self, "_willStartUserInitiatedPlayback");
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  [v8 togglePlayPause];
}

- (void)stopAnimatingMusicBars
{
}

- (void)resumeAnimatingMusicBars
{
}

- (void)_playMediaItemAtIndex:(int64_t)a3
{
  if (-[TVMNowPlayingViewController _indexForPlayingItem](self, "_indexForPlayingItem") == a3)
  {
    -[TVMNowPlayingViewController _willStartUserInitiatedPlayback](self, "_willStartUserInitiatedPlayback");
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    [v9 play];
  }

  else
  {
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
    char v6 = objc_opt_respondsToSelector(v5, "playMediaItemAtIndex:");

    if ((v6 & 1) != 0)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
      [v9 playMediaItemAtIndex:a3];
    }

    else
    {
      -[TVMNowPlayingViewController _willStartUserInitiatedPlayback](self, "_willStartUserInitiatedPlayback");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      char v8 = objc_opt_respondsToSelector(v7, "changeToMediaAtIndex:reason:");

      if ((v8 & 1) == 0) {
        return;
      }
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      [v9 changeToMediaAtIndex:a3 reason:0];
    }
  }
}

- (BOOL)_changeMediaInDirection:(int64_t)a3
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  char v6 = objc_opt_respondsToSelector(v5, "playbackViewControllerShouldChangeMediaUsingDirection:");

  if ((v6 & 1) == 0) {
    return 0;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  unsigned int v8 = [v7 playbackViewControllerShouldChangeMediaUsingDirection:self];

  if (!v8) {
    return 0;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  [v9 changeMediaInDirection:a3];

  return 1;
}

- (void)_willStartUserInitiatedPlayback
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  char v4 = objc_opt_respondsToSelector(v3, "playbackViewControllerUserWillInitiatePlayback:");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
    [v5 playbackViewControllerUserWillInitiatePlayback:self];
  }

- (id)_nowPlayingInfoFromMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  char v6 = objc_opt_new(&OBJC_CLASS___TVAudioNowPlayingItemConfigurationObject);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataTitle]);
  unsigned int v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataRadioStationName]);
  }
  char v10 = v9;

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataArtist]);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataAlbum]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataRadioStationAttribution]);
  -[TVAudioNowPlayingItemConfigurationObject setTrackTitle:](v6, "setTrackTitle:", v10);
  -[TVAudioNowPlayingItemConfigurationObject setArtistName:](v6, "setArtistName:", v11);
  -[TVAudioNowPlayingItemConfigurationObject setAlbumTitle:](v6, "setAlbumTitle:", v12);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);
  -[TVAudioNowPlayingItemConfigurationObject setPlaylistTrackCount:]( v6,  "setPlaylistTrackCount:",  [v14 count]);

  -[TVAudioNowPlayingItemConfigurationObject setRadioStationAttribution:](v6, "setRadioStationAttribution:", v13);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);
  BOOL v16 = [v15 repeatMode] != 0;

  -[TVAudioNowPlayingItemConfigurationObject setRepeating:](v6, "setRepeating:", v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 playlist]);
  -[TVAudioNowPlayingItemConfigurationObject setShuffleEnabled:]( v6,  "setShuffleEnabled:",  [v17 shuffleEnabled]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataContentRatingDomain]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataContentRatingIsExplicitMusic]);
  else {
    id v20 = 0LL;
  }
  -[TVAudioNowPlayingItemConfigurationObject setExplicit:](v6, "setExplicit:", v20);

  return v6;
}

- (void)_playbackPlayerPathDidChange:(id)a3
{
}

- (void)_playbackVideoOutputDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext", a3));

  if (v4)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));
    [v9 setVideo:1];
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 playQueue]);
    char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 videoOutput]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    [v7 setVideoOutput:v6];

    -[TVMNowPlayingViewController _updateEmbeddedVideoView](self, "_updateEmbeddedVideoView");
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v9 currentMediaItem]);
    -[TVMNowPlayingViewController _setBackdropForMediaItem:](self, "_setBackdropForMediaItem:", v8);

    -[TVMNowPlayingViewController _updateVideoViewControllerAnimated:completion:]( self,  "_updateVideoViewControllerAnimated:completion:",  1LL,  0LL);
  }
}

- (void)_updateAudioRoute
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  id v4 = sub_1000C80F8;
  id v5 = &unk_100268CF0;
  char v6 = self;
  os_log_t v2 = v3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v4((uint64_t)v2);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D8978;
    block[3] = &unk_100268D60;
    unsigned int v8 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_playbackMediaItemDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 currentMediaItem]);
  if (!v6)
  {

    goto LABEL_5;
  }

  uint64_t v7 = (void *)v6;
  unsigned __int8 v8 = -[TVMNowPlayingViewController _isUnknownItemType](self, "_isUnknownItemType");

  if ((v8 & 1) != 0) {
LABEL_5:
  }
    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Nothing is playing");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));

  if (v9)
  {
    char v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController invalidationContext](self, "invalidationContext"));
    [v10 setPlayingItem:1];
  }

  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000C82BC;
    v12[3] = &unk_100268B30;
    v12[4] = self;
    id v13 = v4;
    __int16 v11 = v12;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D896C;
    block[3] = &unk_100268D60;
    id v15 = v11;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (BOOL)_isDescendentOfViewController:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController parentViewController](self, "parentViewController"));
  while (v5)
  {
    if (v5 == v4) {
      break;
    }
    uint64_t v6 = v5;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v5 parentViewController]);
  }

  return v5 == v4;
}

- (void)_playbackStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TVPPlaybackStateOldStateKey]);

  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 state]);
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  if (v8 != v9) {
    goto LABEL_2;
  }
  unsigned int v18 = -[TVMNowPlayingViewController popWhenPlayerStops](self, "popWhenPlayerStops");

  if (v18)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v9 = (id)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:TVPPlaybackStateChangeReasonKey]);

    if (([v9 isEqualToString:TVPPlaybackChangeReasonNewPlaylist] & 1) != 0
      || ([v9 isEqualToString:TVPPlaybackChangeReasonErrorDidOccur] & 1) != 0)
    {
LABEL_2:

      goto LABEL_3;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    id v21 = [v20 applicationState];

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController presentedViewController](self, "presentedViewController"));
    if (v22)
    {
      BOOL v23 = v21 == 0LL;
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController presentedViewController](self, "presentedViewController"));
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472LL;
      v71[2] = sub_1000C8B78;
      v71[3] = &unk_100268F28;
      v71[4] = self;
      BOOL v72 = v23;
      [v24 dismissViewControllerAnimated:1 completion:v71];

      goto LABEL_38;
    }

    double v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController navigationController](self, "navigationController"));
    double v55 = (void *)objc_claimAutoreleasedReturnValue([v54 topViewController]);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController parentViewController](self, "parentViewController"));
    double v57 = v55;
    if (v55 != (void *)v56)
    {
      double v58 = (void *)v56;
      __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController navigationController](self, "navigationController"));
      double v59 = (TVMNowPlayingViewController *)objc_claimAutoreleasedReturnValue([v66 topViewController]);
      if (v59 != self)
      {
        double v63 = v59;
        double v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController navigationController](self, "navigationController"));
        id v65 = v54;
        double v60 = (void *)objc_claimAutoreleasedReturnValue([v62 topViewController]);
        unsigned __int8 v64 = -[TVMNowPlayingViewController _isDescendentOfViewController:](self, "_isDescendentOfViewController:", v60);

        if ((v64 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_45;
      }

      double v57 = v58;
    }

LABEL_45:
    double v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController navigationController](self, "navigationController"));
    id v61 = [v48 popViewControllerAnimated:v21 == 0];
    goto LABEL_37;
  }

- (void)_playbackDidError:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  id v5 = sub_1000C8D30;
  uint64_t v6 = &unk_100268CF0;
  uint64_t v7 = self;
  id v3 = v4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v5((uint64_t)v3);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D8978;
    block[3] = &unk_100268D60;
    id v9 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_metadataDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8D90;
  block[3] = &unk_100268CF0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_didBecomeActive:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v5 == v6) {
    -[TVMNowPlayingViewController resumeAnimatingMusicBars](self, "resumeAnimatingMusicBars");
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 currentState]);
  if (v7 == @"Rest mode")
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
    id v9 = [v8 style];

    if (v9 == (id)2)
    {
      -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      -[TVMNowPlayingViewController updateFocusIfNeeded](self, "updateFocusIfNeeded");
      -[TVMNowPlayingViewController _focusCurrentPlayingItemAnimated:](self, "_focusCurrentPlayingItemAnimated:", 0LL);
    }
  }

  else
  {
  }

- (id)_loadStringValueForMetadataItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v15 = 0LL;
    id v6 = [v4 statusOfValueForKey:@"stringValue" error:&v15];
    id v7 = v15;
    if (v6 != (id)1)
    {
      if (v6 == (id)2)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringValue]);
LABEL_8:

        goto LABEL_9;
      }

      objc_initWeak(&location, self);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"stringValue"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000C904C;
      v11[3] = &unk_10026DF28;
      id v12 = v5;
      objc_copyWeak(&v13, &location);
      [v12 loadValuesAsynchronouslyForKeys:v9 completionHandler:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

    id v8 = 0LL;
    goto LABEL_8;
  }

  id v8 = 0LL;
LABEL_9:

  return v8;
}

- (void)_configurePlayingCellForIndexPath:(id)a3
{
  id v5 = a3;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathsForVisibleItems]);

  id obj = v7;
  id v24 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cellForItemAtIndexPath:v9]);

        unsigned int v12 = [v5 isEqual:v9];
        if (v12) {
          musicBarsView = self->_musicBarsView;
        }
        else {
          musicBarsView = 0LL;
        }
        [v11 setBottomAccessoryView:musicBarsView];
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController mediaItemAtIndex:]( self,  "mediaItemAtIndex:",  [v5 item]));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
        unsigned int v16 = [v15 hasPlaybackRestrictions];

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataIsPurchased"]);
        unsigned int v18 = [v17 BOOLValue];

        [v11 setDisabled:v16 & ((v12 | v18) ^ 1)];
        if (v12
          && (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView")),
              !objc_msgSend(v3, "tvm_isDescendentFocused")))
        {
          uint64_t v19 = 1LL;
        }

        else
        {
          uint64_t v19 = (uint64_t)[v11 isFocused];
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 motionView]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 artwork]);
        [v21 setShouldPlay:v19];

        if (v12) {
      }
        }

      id v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v24);
  }
}

- (CGPoint)_contentOffsetForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  CGFloat y = CGPointZero.y;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layoutAttributesForItemAtIndexPath:v4]);

  if (v8)
  {
    [v8 frame];
    double MinX = CGRectGetMinX(v15);
    [v5 bounds];
    double Width = CGRectGetWidth(v16);
    [v8 frame];
    double x = MinX + (Width - CGRectGetWidth(v17)) * -0.5;
  }

  else
  {
    double x = CGPointZero.x;
  }

  double v12 = x;
  double v13 = y;
  result.CGFloat y = v13;
  result.double x = v12;
  return result;
}

- (void)_scrollCollectionView:(id)a3 toIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v38 = a3;
  id v8 = a4;
  -[TVMNowPlayingViewController setCenterIndexPath:](self, "setCenterIndexPath:", v8);
  unsigned __int8 v9 = objc_msgSend(v38, "tvm_isDescendentFocused");
  -[TVMNowPlayingViewController _contentOffsetForIndexPath:](self, "_contentOffsetForIndexPath:", v8);
  double v11 = v10;
  if ((v9 & 1) != 0)
  {
    [v38 contentOffset];
    if (v11 == v12)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "tvm_focusedView"));
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v14);
      if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
      {
        CGRect v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "tvm_focusedView"));

        if (v16)
        {
          CGRect v17 = (void *)objc_claimAutoreleasedReturnValue([v38 indexPathForCell:v16]);
          if (v17)
          {
            unsigned int v18 = v17;
            unsigned __int8 v19 = [v17 isEqual:v8];

            if ((v19 & 1) != 0) {
              goto LABEL_15;
            }
          }
        }
      }

      else
      {

        CGRect v16 = 0LL;
      }

      [v38 setNeedsFocusUpdate];
LABEL_15:

      goto LABEL_16;
    }

    if (v5)
    {
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      if ([v22 isPlaylistVisible])
      {

        id v20 = v38;
      }

      else
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 layoutAttributesForItemAtIndexPath:v8]);
        [v24 frame];
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        [v38 bounds];
        v40.origin.double x = v33;
        v40.origin.CGFloat y = v34;
        v40.size.width = v35;
        v40.size.height = v36;
        v39.origin.double x = v26;
        v39.origin.CGFloat y = v28;
        v39.size.width = v30;
        v39.size.height = v32;
        BOOL v37 = CGRectIntersectsRect(v39, v40);

        id v20 = v38;
        if (v37)
        {
          [v38 setNeedsFocusUpdate];
          goto LABEL_16;
        }
      }

      uint64_t v21 = 1LL;
    }

    else
    {
      [v38 setNeedsFocusUpdate];
      id v20 = v38;
      uint64_t v21 = 0LL;
    }
  }

  else
  {
    id v20 = v38;
    uint64_t v21 = v5;
  }

  objc_msgSend(v20, "setContentOffset:animated:", v21);
LABEL_16:
}

- (void)_updateNowPlayingView
{
}

- (void)_updateNowPlayingViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentMediaItem]);

  if (v6)
  {
    if (-[TVMNowPlayingViewController _isUnknownItemType](self, "_isUnknownItemType"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      [v7 setNothingPlaying:1];

      -[TVMNowPlayingViewController updateIdleViewControllerIfNeeded](self, "updateIdleViewControllerIfNeeded");
    }

    else
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 snapshot]);

      if ([v10 indexOfItemIdentifier:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        double v11 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
        -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:]( v11,  "appendSectionsWithIdentifiers:",  &off_100282408);
        double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playQueue]);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 activeList]);
        uint64_t v15 = (void *)v14;
        if (v14) {
          CGRect v16 = (void *)v14;
        }
        else {
          CGRect v16 = &__NSArray0__struct;
        }
        -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:](v11, "appendItemsWithIdentifiers:", v16);

        CGRect v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
        [v17 applySnapshot:v11 animatingDifferences:0];
      }

      else
      {
        CGFloat v33 = v6;
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
        [v10 reconfigureItemsWithIdentifiers:v18];

        double v11 = (NSDiffableDataSourceSnapshot *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
        -[NSDiffableDataSourceSnapshot applySnapshot:animatingDifferences:]( v11,  "applySnapshot:animatingDifferences:",  v10,  1LL);
      }

      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      [v19 setNothingPlaying:0];

      -[TVMNowPlayingViewController _setBackdropForMediaItem:](self, "_setBackdropForMediaItem:", v6);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    unsigned int v21 = [v20 isPlaylistVisible];

    if (v21)
    {
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      unsigned int v23 = objc_msgSend(v22, "tvm_isDescendentFocused");

      if (!v23)
      {
LABEL_22:
        -[TVMNowPlayingViewController _updateNowPlayingHeader](self, "_updateNowPlayingHeader");
        CGFloat v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v32 postNotificationName:@"TVMusicNowPlayingDidUpdateView" object:self];

        goto LABEL_23;
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
      if (v24)
      {
        double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue([v25 cellForItemAtIndexPath:v24]);
        unsigned __int8 v27 = [v26 isFocused];

        if ((v27 & 1) == 0) {
          -[TVMNowPlayingViewController _focusCurrentPlayingItemAnimated:]( self,  "_focusCurrentPlayingItemAnimated:",  v3);
        }
      }
    }

    else
    {
      CGFloat v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
      if (v28)
      {
        double v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
        CGFloat v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v29 indexPathForItemIdentifier:v30]);
      }

      else
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
      }

      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v31,  v24,  0LL);
    }

    goto LABEL_22;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  [v8 setNothingPlaying:1];

  -[TVMNowPlayingViewController _updateNowPlayingHeader](self, "_updateNowPlayingHeader");
  -[TVMNowPlayingViewController updateIdleViewControllerIfNeeded](self, "updateIdleViewControllerIfNeeded");
LABEL_23:
}

- (void)_updateNowPlayingHeader
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
  id v4 = [v3 item];

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController mediaItemAtIndex:](self, "mediaItemAtIndex:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataAutoplaying]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVPlayback"));
    id v15 = (id)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"NowPlayingAutoplayingHeader" value:&stru_100279068 table:@"Localizable"]);
  }

  else
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataContainerKind]);
    id v8 = v9;
    if (v9 && ([v9 isEqualToString:TVPMediaItemMetadataContainerKindAlbum] & 1) == 0)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataContainerName]);
    }

    else
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataAlbum]);
      if ([v10 length])
      {
        id v16 = v10;
      }

      else
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataArtist]);
        if ([v12 length]) {
          id v16 = v12;
        }
        else {
          id v16 = 0LL;
        }
      }

      double v11 = v16;
    }

    id v15 = v11;
    if (![v11 length])
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataTitle]);

      id v15 = (id)v13;
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  [v14 setContainerText:v15];
}

- (void)configureVideoForVisibleCells
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
  -[TVMNowPlayingViewController configureVideoForVisibleCellsWithPlayingIndexPath:]( self,  "configureVideoForVisibleCellsWithPlayingIndexPath:",  v3);
}

- (void)configureVideoForVisibleCellsWithPlayingIndexPath:(id)a3
{
  id v22 = a3;
  if (-[TVMNowPlayingViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathsForVisibleItems]);
    id v25 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v25)
    {
      uint64_t v6 = *(void *)v27;
      uint64_t v7 = TVPMediaItemMetadataMediaType;
      uint64_t v23 = TVPMediaItemMetadataMediaType;
      id v24 = (void *)TVPMediaTypeMusicVideo;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v5);
          }
          unsigned __int8 v9 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          double v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController mediaItemAtIndex:]( self,  "mediaItemAtIndex:",  [v9 item]));
          double v11 = v10;
          if (v10)
          {
            double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaItemMetadataForProperty:v7]);
            if (v12 == v24)
            {
              uint64_t v14 = v6;
              id v15 = v5;
              id v16 = v4;
              id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController endpointRoute](self, "endpointRoute"));
              unsigned int v18 = v17;

              id v4 = v16;
              BOOL v5 = v15;
              uint64_t v6 = v14;
              uint64_t v7 = v23;
            }

            else
            {
              LOBYTE(v13) = 0;
            }

            unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 cellForItemAtIndexPath:v9]);
            id v20 = v19;
            if ((v13 & 1) != 0)
            {
              unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
              [v20 setVideoView:v21];
            }

            else
            {
              [v19 setVideoView:0];
            }
          }
        }

        id v25 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v25);
    }
  }
}

- (id)_cellForMediaItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = 0LL;
    goto LABEL_6;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForItemIdentifier:v4]);

  if (!v6)
  {
LABEL_6:
    double v12 = 0LL;
    goto LABEL_9;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cellForItemAtIndexPath:v6]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cellForItemAtIndexPath:v6]);
  }

  else
  {
    double v12 = 0LL;
  }

LABEL_9:
  return v12;
}

- (id)_cellForSingleCoverMediaItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _cellForMediaItem:](self, "_cellForMediaItem:", v3));

  return v4;
}

- (BOOL)_isUnknownItemType
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentMediaItem]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataIsUnknownItem]);
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)_transitionToPlaylistWithAfterCurrentStateTransitionBlock:(id *)a3 animated:(BOOL)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
  [v7 setEnabled:0];

  dispatch_time_t v8 = dispatch_time(0LL, 250000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CA178;
  block[3] = &unk_100269B10;
  objc_copyWeak(&v13, &location);
  dispatch_after(v8, &_dispatch_main_q, block);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000CA1C0;
  v9[3] = &unk_10026DF50;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a4;
  *a3 = objc_retainBlock(v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_enableScrollWithPlayingItemIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _mediaItemAtCenterOfPlaylistCollectionView]( self,  "_mediaItemAtCenterOfPlaylistCollectionView"));
  if (v3)
  {
    id v5 = v3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlayer currentMediaItem](self->_player, "currentMediaItem"));

    id v3 = v5;
    if (v5 == v4) {
      self->_scrollWithPlayingItem = 1;
    }
  }
}

- (id)_mediaItemAtCenterOfPlaylistCollectionView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  id v4 = [v3 visibleBounds];
  id v9 = objc_msgSend(v3, "indexPathForItemAtPoint:", UIRectGetCenter(v4, v5, v6, v7, v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController mediaItemAtIndex:](self, "mediaItemAtIndex:", [v10 item]));

  return v11;
}

- (void)setCenterIndexPath:(id)a3
{
  id v5 = a3;
  if ((-[NSIndexPath isEqual:](self->_centerIndexPath, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_centerIndexPath, a3);
    if (v5)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView", 0LL));
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathsForVisibleItems]);

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          BOOL v11 = 0LL;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
            id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cellForItemAtIndexPath:v12]);

            objc_msgSend(v14, "setShowAttribution:animated:", objc_msgSend(v5, "isEqual:", v12), 1);
            BOOL v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }

        while (v9);
      }
    }
  }
}

- (void)setSingleCoverMediaItem:(id)a3
{
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPObjectMediaItem mediaItemMetadataForProperty:]( self->_singleCoverMediaItem,  "mediaItemMetadataForProperty:",  @"TVMusicMediaItemMetadataMPIdentifierSet"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPIdentifierSet"]);
  if (([v6 isEqual:v7] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _cellForMediaItem:]( self,  "_cellForMediaItem:",  self->_singleCoverMediaItem));
    memset(v10, 0, sizeof(v10));
    [v8 setEffectOverrides:v10];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
    [v9 setAlpha:1.0];

    objc_storeStrong((id *)&self->_singleCoverMediaItem, a3);
  }

  -[TVMNowPlayingViewController _updateSingleCoverView](self, "_updateSingleCoverView");
}

- (BOOL)_isSingleCoverFocusable
{
  os_log_t v2 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](v2, "viewPresentation"));
  id v6 = [v5 style];
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](v2, "idleViewController"));
  LOBYTE(v2) = -[TVMNowPlayingViewController _isSingleCoverFocusableState:viewStyle:hasLyrics:]( v2,  "_isSingleCoverFocusableState:viewStyle:hasLyrics:",  v4,  v6,  v7 != 0LL);

  return (char)v2;
}

- (BOOL)_isSingleCoverFocusableState:(id)a3 viewStyle:(int64_t)a4 hasLyrics:(BOOL)a5
{
  BOOL v5 = !a5;
  if (a4 != 1) {
    BOOL v5 = 0;
  }
  if (!a4) {
    BOOL v5 = 1;
  }
  return a3 == @"Rest mode" && v5;
}

- (void)_updateSingleCoverView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  BOOL v5 = v4;
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingConfiguration]);

    if (v6)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingConfiguration]);
      id v9 = (TVMusicNowPlayingContentConfiguration *)[v8 copy];
    }

    else
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___TVMusicNowPlayingContentConfiguration);
    }

    -[TVMusicNowPlayingContentConfiguration setShowsFocusEffects:](v9, "setShowsFocusEffects:", 0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 state]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));
    -[TVMusicNowPlayingContentConfiguration setIsPlaying:](v9, "setIsPlaying:", v11 == v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataContentRatingDomain]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataContentRatingIsExplicitMusic]);
    unsigned int v15 = [v13 isEqualToString:TVPMediaItemMetadataContentRatingDomainMusic];
    id v16 = 0LL;
    if (v15) {
      id v16 = objc_msgSend(v14, "BOOLValue", 0);
    }
    v101 = v14;
    -[TVMusicNowPlayingContentConfiguration setIsExplicit:](v9, "setIsExplicit:", v16);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataTitle]);
    if (v17)
    {
      -[TVMusicNowPlayingContentConfiguration setTitle:](v9, "setTitle:", v17);
    }

    else
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataRadioStationName]);
      -[TVMusicNowPlayingContentConfiguration setTitle:](v9, "setTitle:", v18);
    }

    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataArtist]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataAlbum]);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataRadioStationAttribution]);
    id v22 = v21;
    if (v21 && [v21 length])
    {
      -[TVMusicNowPlayingContentConfiguration setExpandedSubtitle:](v9, "setExpandedSubtitle:", v22);
      -[TVMusicNowPlayingContentConfiguration setSubtitle:](v9, "setSubtitle:", v22);
    }

    else
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      if ([v19 length]) {
        [v23 addObject:v19];
      }
      if ([v20 length]) {
        [v23 addObject:v20];
      }
      if ([v23 count])
      {
        id v24 = v6;
        id v25 = v22;
        __int128 v26 = v20;
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v23 componentsJoinedByString:@" — "]);
        -[TVMusicNowPlayingContentConfiguration setExpandedSubtitle:](v9, "setExpandedSubtitle:", v27);

        id v20 = v26;
        id v22 = v25;
        id v6 = v24;
      }

      else
      {
        -[TVMusicNowPlayingContentConfiguration setExpandedSubtitle:](v9, "setExpandedSubtitle:", 0LL);
      }

      -[TVMusicNowPlayingContentConfiguration setSubtitle:](v9, "setSubtitle:", v19);
    }

    -[TVMNowPlayingViewController _itemSizeForMediaItem:](self, "_itemSizeForMediaItem:", v3);
    double v29 = v28;
    double v31 = v30;
    -[TVMusicNowPlayingContentConfiguration setContentSize:](v9, "setContentSize:");
    uint64_t v32 = TVPMediaItemMetadataMPArtworkCatalog;
    CGFloat v33 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataMPArtworkCatalog]);
    uint64_t v35 = objc_opt_class(&OBJC_CLASS___MPArtworkCatalog, v34);
    uint64_t v89 = v32;
    if ((objc_opt_isKindOfClass(v33, v35) & 1) != 0) {
      CGFloat v36 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:v32]);
    }
    else {
      CGFloat v36 = 0LL;
    }

    objc_msgSend(v36, "setFittingSize:", v29 + 36.0, v31 + 36.0);
    [v36 setDestinationScale:0.0];
    -[TVMusicNowPlayingContentConfiguration setArtworkCatalog:](v9, "setArtworkCatalog:", v36);
    if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)2)
    {
      -[TVMusicNowPlayingContentConfiguration setVideoView:](v9, "setVideoView:", 0LL);
    }

    else
    {
      BOOL v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
      -[TVMusicNowPlayingContentConfiguration setVideoView:](v9, "setVideoView:", v37);
    }

    v100 = (void *)objc_claimAutoreleasedReturnValue( [v3 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataEnqueuingParticipant"]);
    -[TVMusicNowPlayingContentConfiguration setEnqueuingParticipant:](v9, "setEnqueuingParticipant:");
    v99 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
    else {
      uint64_t v38 = 5LL;
    }
    id v39 = sub_100030470(v38, 2uLL);
    CGRect v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    -[TVMusicNowPlayingContentConfiguration setPlaceholderImage:](v9, "setPlaceholderImage:", v40);

    if (_os_feature_enabled_impl("TVMusic", "Motion_In_Now_Playing"))
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _motionArtworkForItemIdentifier:]( self,  "_motionArtworkForItemIdentifier:",  v3));
      -[TVMusicNowPlayingContentConfiguration setMotionArtwork:](v9, "setMotionArtwork:", v41);
    }

    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

    if (v42)
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v43 setNowPlayingConfiguration:v9];

      double v44 = v101;
    }

    else
    {
      v90 = v36;
      v92 = v22;
      v94 = v20;
      v96 = v19;
      v97 = v13;
      v88 = v6;
      double v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingContentConfiguration makeContentView](v9, "makeContentView"));
      -[TVMNowPlayingViewController setSingleCoverView:](self, "setSingleCoverView:", v45);

      double v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v46 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      else {
        double v48 = 1.0;
      }
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v49 setAlpha:v48];

      double v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v50 addTarget:self action:"_handleCoverSelected:" forControlEvents:0x2000];

      double v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      double v52 = (void *)objc_claimAutoreleasedReturnValue([v51 containerView]);
      double v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v52 addSubview:v53];

      if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
      {
        if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
        {
          double v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
          unsigned int v55 = [v54 shouldShowCamera];

          if (v55)
          {
            uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
            [v56 setAlpha:0.0];
          }
        }
      }

      v87 = -[UIContextMenuInteraction initWithDelegate:]( objc_alloc(&OBJC_CLASS___UIContextMenuInteraction),  "initWithDelegate:",  self);
      double v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v57 addInteraction:v87];

      -[TVMNowPlayingViewController setSingleCoverContextMenuInteraction:]( self,  "setSingleCoverContextMenuInteraction:",  v87);
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      v84 = (void *)objc_claimAutoreleasedReturnValue([v86 centerXAnchor]);
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      v83 = (void *)objc_claimAutoreleasedReturnValue([v85 centerXAnchor]);
      double v58 = (void *)objc_claimAutoreleasedReturnValue([v84 constraintEqualToAnchor:v83]);
      v104[0] = v58;
      double v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      double v60 = (void *)objc_claimAutoreleasedReturnValue([v59 centerYAnchor]);
      id v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      double v62 = (void *)objc_claimAutoreleasedReturnValue([v61 centerYAnchor]);
      double v63 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v62]);
      v104[1] = v63;
      unsigned __int8 v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 2LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v64);

      id v6 = v88;
      unsigned __int8 v19 = v96;
      id v13 = v97;
      double v44 = v101;
      id v22 = v92;
      id v20 = v94;
      CGFloat v36 = v90;
    }

    if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
      && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      v95 = v20;
      v98 = v13;
      id v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingContentConfiguration title](v9, "title"));
      __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView titleLabel](self->_songInfoView, "titleLabel"));
      [v66 setText:v65];

      double v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingContentConfiguration subtitle](v9, "subtitle"));
      id v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView subtitleLabel](self->_songInfoView, "subtitleLabel"));
      [v68 setText:v67];

      id v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingContentConfiguration placeholderImage](v9, "placeholderImage"));
      CGAffineTransform v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView imageView](self->_songInfoView, "imageView"));
      [v70 setImage:v69];

      CGAffineTransform v71 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:v89]);
      uint64_t v73 = objc_opt_class(&OBJC_CLASS___MPArtworkCatalog, v72);
      v91 = v36;
      v93 = v22;
      if ((objc_opt_isKindOfClass(v71, v73) & 1) != 0) {
        v74 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaItemMetadataForProperty:v89]);
      }
      else {
        v74 = 0LL;
      }

      __int16 v75 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView imageView](self->_songInfoView, "imageView"));
      [v75 frame];
      objc_msgSend(v74, "setFittingSize:", v76, v77);

      v78 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingCompactMetadataView imageView](self->_songInfoView, "imageView"));
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472LL;
      v102[2] = sub_1000CB150;
      v102[3] = &unk_10026DF78;
      id v79 = v69;
      id v103 = v79;
      [v74 setDestination:v78 configurationBlock:v102];

      -[TVMNowPlayingCompactMetadataView setIsExplicit:]( self->_songInfoView,  "setIsExplicit:",  -[TVMusicNowPlayingContentConfiguration isExplicit](v9, "isExplicit"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
      v81 = (void *)objc_claimAutoreleasedReturnValue([v80 state]);
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

      if (v81 == v82) {
        -[TVMNowPlayingCompactMetadataView resumeAnimatingMusicBars](self->_songInfoView, "resumeAnimatingMusicBars");
      }

      id v13 = v98;
      double v44 = v101;
      id v22 = v93;
      id v20 = v95;
      CGFloat v36 = v91;
    }
  }

  else
  {
    [v4 removeFromSuperview];

    -[TVMNowPlayingViewController setSingleCoverView:](self, "setSingleCoverView:", 0LL);
  }
}

- (void)updateIdleViewControllerIfNeeded
{
  if (-[TVMNowPlayingViewController isViewLoaded](self, "isViewLoaded"))
  {
    if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)1) {
      -[TVMNowPlayingViewController _updateIdleViewControllerIfNeeded](self, "_updateIdleViewControllerIfNeeded");
    }
    else {
      -[TVMNowPlayingViewController _removeIdleViewControllerAndRestoreLayout:]( self,  "_removeIdleViewControllerAndRestoreLayout:",  1LL);
    }
  }

- (CGRect)_idleViewControllerTargetCoverFrame
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    objc_msgSend(v4, "convertRect:fromView:", v14, v7, v9, v11, v13);
    double x = v15;
    double y = v17;
    double width = v19;
    double height = v21;
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 artworkLayoutGuide]);
  [v24 layoutFrame];
  double v29 = UIRectCenteredXInRect(x, y, width, height, v25, v26, v27, v28);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  double v36 = v29;
  double v37 = v31;
  double v38 = v33;
  double v39 = v35;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (void)_setIdleViewController:(id)a3 forMediaItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));

  if (v8 != v6)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
    -[TVMNowPlayingViewController setIdleViewController:](self, "setIdleViewController:", v6);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

    if (v10)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentState]);
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      BOOL v14 = -[TVMNowPlayingViewController _isSingleCoverFocusableState:viewStyle:hasLyrics:]( self,  "_isSingleCoverFocusableState:viewStyle:hasLyrics:",  v12,  [v13 style],  v6 != 0);

      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nowPlayingConfiguration]);
      id v17 = [v16 copy];

      [v17 setIsFocusable:v14];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v18 setNowPlayingConfiguration:v17];

      if (!v14)
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        unsigned int v20 = [v19 isFocused];

        if (v20) {
          -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
        }
      }
    }

    if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
      && _os_feature_enabled_impl("TVMusic", "LagunaSing")
      && +[TVMDevice isSingSupported](&OBJC_CLASS___TVMDevice, "isSingSupported"))
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue(+[PSCameraController sharedInstance](&OBJC_CLASS___PSCameraController, "sharedInstance"));
      else {
        id v22 = 0LL;
      }
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      [v80 setShouldShowCamera:v22];

      v81 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      [v81 setUsingLagunaSingMode:v22];
    }

    else
    {
      LOBYTE(v22) = 0;
    }

    -[TVMNowPlayingViewController _idleViewControllerTargetCoverFrame](self, "_idleViewControllerTargetCoverFrame");
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    v102.origin.double x = v23;
    v102.origin.double y = v25;
    v102.size.double width = v27;
    v102.size.double height = v29;
    if (v6)
    {
      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
      char v32 = objc_opt_respondsToSelector( v31,  "playbackViewController:willShowIdleViewController:forMediaItem:targetCoverFrame:");

      if ((v32 & 1) != 0)
      {
        double v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
        [v33 playbackViewController:self willShowIdleViewController:v6 forMediaItem:v7 targetCoverFrame:&v102];
      }

      -[TVMNowPlayingViewController addChildViewController:](self, "addChildViewController:", v6);
      double v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lyricsContentView]);
      double v36 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
      [v35 addSubview:v36];

      double v37 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
      [v37 setAlpha:0.0];

      double v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      double v39 = (void *)objc_claimAutoreleasedReturnValue([v38 lyricsContentView]);
      [v39 bounds];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      double v48 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
      objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
      [v49 setAutoresizingMask:18];

      if ((v22 & 1) != 0)
      {
        double v50 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
        [v50 setAlpha:1.0];

        [v6 didMoveToParentViewController:self];
      }

      else
      {
        uint64_t v56 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
        v100[0] = _NSConcreteStackBlock;
        v100[1] = 3221225472LL;
        v100[2] = sub_1000CBB2C;
        v100[3] = &unk_100268CF0;
        id v57 = v6;
        id v101 = v57;
        double v58 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v56,  "initWithDuration:curve:animations:",  0LL,  v100,  0.3);
        v97[0] = _NSConcreteStackBlock;
        v97[1] = 3221225472LL;
        v97[2] = sub_1000CBB60;
        v97[3] = &unk_10026DFA0;
        id v98 = v57;
        v99 = self;
        -[UIViewPropertyAnimator addCompletion:](v58, "addCompletion:", v97);
        -[UIViewPropertyAnimator startAnimationAfterDelay:](v58, "startAnimationAfterDelay:", 0.75);
      }

      double v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
      double v60 = (__CFString *)objc_claimAutoreleasedReturnValue([v59 currentState]);
      id v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      double v62 = (void *)objc_claimAutoreleasedReturnValue([v61 lyricsContentView]);
      [v62 setUserInteractionEnabled:v60 == @"Rest mode"];

      -[TVMNowPlayingViewController setShowingIdleViewController:](self, "setShowingIdleViewController:", 1LL);
      double v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      double v54 = v53;
      uint64_t v55 = 1LL;
    }

    else
    {
      double v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      double v52 = (void *)objc_claimAutoreleasedReturnValue([v51 lyricsContentView]);
      [v52 setUserInteractionEnabled:0];

      -[TVMNowPlayingViewController setShowingIdleViewController:](self, "setShowingIdleViewController:", 0LL);
      double v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      double v54 = v53;
      uint64_t v55 = 0LL;
    }

    [v53 setIsShowingLyrics:v55];

    unsigned int v63 = -[TVMNowPlayingViewController isTransportBarVisible](self, "isTransportBarVisible");
    double v64 = 280.0;
    if (!v63) {
      double v64 = 0.0;
    }
    [v6 setGradientBottomMargin:v64];
    -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    id v65 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  55.0,  15.0,  0.0,  0.0);
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));

    if (v66)
    {
      double v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
      unsigned int v68 = [v67 isRunning];

      if (v68)
      {
        id v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
        [v69 stopAnimation:1];

        CGAffineTransform v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
        [v70 finishAnimationAtPosition:2];
      }

      if ((v22 & 1) != 0)
      {
        double MinX = CGRectGetMinX(v102);
        v103.origin.double x = v24;
        v103.origin.double y = v26;
        v103.size.double width = v28;
        v103.size.double height = v30;
        CGFloat v72 = CGRectGetMinX(v103);
        CGAffineTransformMakeTranslation(&v90, MinX - v72, 0.0);
        uint64_t v73 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        CGAffineTransform v89 = v90;
        -[UIViewPropertyAnimator setTransform:](v73, "setTransform:", &v89);
      }

      else
      {
        uint64_t v73 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v65,  0.0);
        v91[1] = 3221225472LL;
        CGRect v92 = v102;
        v91[0] = _NSConcreteStackBlock;
        v91[2] = sub_1000CBBDC;
        v91[3] = &unk_10026DFC8;
        v91[4] = self;
        CGFloat v93 = v24;
        CGFloat v94 = v26;
        CGFloat v95 = v28;
        CGFloat v96 = v30;
        -[UIViewPropertyAnimator addAnimations:](v73, "addAnimations:", v91);
        -[TVMNowPlayingViewController setSingleCoverViewAnimator:](self, "setSingleCoverViewAnimator:", v73);
        -[UIViewPropertyAnimator startAnimation](v73, "startAnimation");
      }
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
    __int16 v75 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    double v76 = (void *)objc_claimAutoreleasedReturnValue([v75 lyricsContentView]);
    unsigned int v77 = [v74 isDescendantOfView:v76];

    if (v77)
    {
      [v9 willMoveToParentViewController:0];
      v78 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v65,  0.0);
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472LL;
      v87[2] = sub_1000CBC60;
      v87[3] = &unk_100268CF0;
      id v79 = v9;
      id v88 = v79;
      -[UIViewPropertyAnimator addAnimations:](v78, "addAnimations:", v87);
      v82 = _NSConcreteStackBlock;
      uint64_t v83 = 3221225472LL;
      v84 = sub_1000CBC94;
      v85 = &unk_10026BB60;
      id v86 = v79;
      -[UIViewPropertyAnimator addCompletion:](v78, "addCompletion:", &v82);
      -[UIViewPropertyAnimator startAnimation](v78, "startAnimation", v82, v83, v84, v85);
    }
  }
}

- (void)_removeIdleViewControllerAndRestoreLayout:(BOOL)a3
{
}

- (double)_removeIdleViewControllerAndRestoreLayout:(BOOL)a3 animatingBeforePlaylist:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lyricsContentView]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  unsigned int v11 = [v10 nothingPlaying];

  -[TVMNowPlayingViewController setIdleViewController:](self, "setIdleViewController:", 0LL);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  unsigned int v13 = [v12 isDescendantOfView:v9];

  if (v13)
  {
    [v7 willMoveToParentViewController:0];
    BOOL v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    if (v11) {
      double v15 = 0.0;
    }
    else {
      double v15 = 0.42;
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1000CC0F8;
    v47[3] = &unk_100268CF0;
    id v16 = v7;
    id v48 = v16;
    id v17 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v14,  "initWithDuration:controlPoint1:controlPoint2:animations:",  v47,  v15,  0.33,  0.0,  0.67,  1.0);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1000CC12C;
    v45[3] = &unk_10026DFA0;
    v45[4] = self;
    id v46 = v16;
    -[UIViewPropertyAnimator addCompletion:](v17, "addCompletion:", v45);
    -[UIViewPropertyAnimator startAnimation](v17, "startAnimation");
  }

  double v18 = 0.0;
  if (v5)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
    if (v19)
    {
      unsigned int v20 = (void *)v19;
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      id v22 = v21;
      if (v21) {
        [v21 transform];
      }
      else {
        memset(&v44, 0, sizeof(v44));
      }
      IsIdentitdouble y = CGAffineTransformIsIdentity(&v44);

      if (!IsIdentity)
      {
        CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
        unsigned int v25 = [v24 isRunning];

        if (v25)
        {
          CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
          [v26 stopAnimation:1];

          CGFloat v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
          [v27 finishAnimationAtPosition:2];
        }

        CGFloat v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        CGFloat v29 = (void *)objc_claimAutoreleasedReturnValue([v28 nowPlayingConfiguration]);
        id v30 = [v29 copy];

        objc_msgSend( v30,  "setIsFocusable:",  -[TVMNowPlayingViewController _isSingleCoverFocusable](self, "_isSingleCoverFocusable"));
        double v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        [v31 setNowPlayingConfiguration:v30];

        char v32 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
        double v33 = 120.0;
        if (!v4) {
          double v33 = 55.0;
        }
        double v34 = 20.0;
        if (!v4) {
          double v34 = 15.0;
        }
        double v35 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v32,  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  v33,  v34,  0.0,  0.0);
        double v36 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v35,  0.0);
        -[TVMNowPlayingViewController setSingleCoverViewAnimator:](self, "setSingleCoverViewAnimator:", v36);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_1000CC1D8;
        v43[3] = &unk_100268CF0;
        void v43[4] = self;
        -[UIViewPropertyAnimator addAnimations:](v36, "addAnimations:", v43);
        -[UIViewPropertyAnimator duration](v36, "duration");
        double v38 = v37;
        -[UIViewPropertyAnimator startAnimationAfterDelay:](v36, "startAnimationAfterDelay:", 0.25);
        double v18 = v38 + 0.25;
      }
    }
  }

  double v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  double v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lyricsContentView]);
  [v40 setUserInteractionEnabled:0];

  -[TVMNowPlayingViewController setShowingIdleViewController:](self, "setShowingIdleViewController:", 0LL);
  if (v5)
  {
    double v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
    [v41 setIsShowingLyrics:0];
  }

  return v18;
}

- (void)_updateIdleViewControllerIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
  if (!v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 currentMediaItem]);

    id v5 = sub_1000BD900();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Idle Mode - Single cover index path missing. Falling back to playing item.",  (uint8_t *)&v22,  2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  if ((objc_opt_respondsToSelector(v7, "playbackViewController:shouldShowIdleViewControllerForMediaItem:") & 1) == 0) {
    goto LABEL_19;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  if (([v8 playbackViewController:self shouldShowIdleViewControllerForMediaItem:v3] & 1) == 0)
  {

LABEL_19:
    goto LABEL_20;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  char v10 = objc_opt_respondsToSelector(v9, "playbackViewController:wantsIdleViewControllerForMediaItem:withCompletion:");

  if ((v10 & 1) == 0)
  {
LABEL_20:
    -[TVMNowPlayingViewController setIdleViewControllerContext:](self, "setIdleViewControllerContext:", 0LL);
    -[TVMNowPlayingViewController _removeIdleViewControllerAndRestoreLayout:]( self,  "_removeIdleViewControllerAndRestoreLayout:",  1LL);
    goto LABEL_21;
  }

  id v11 = sub_1000BD900();
  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    CGFloat v23 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Idle Mode - Requesting idle view for media item [%@]",  (uint8_t *)&v22,  0xCu);
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewControllerContext](self, "idleViewControllerContext"));
  BOOL v14 = v13;
  if (v13
    && (double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 mediaItem]),
        unsigned int v16 = [v15 isEqualToMediaItem:v3],
        v15,
        v16))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 idleViewController]);
    unsigned int v18 = [v14 isFinished];
    id v19 = sub_1000BD900();
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v21)
      {
        int v22 = 138412290;
        CGFloat v23 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Idle Mode - Existing idle context found with view controller [%@]",  (uint8_t *)&v22,  0xCu);
      }

      if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)1)
      {
        if (v17) {
          -[TVMNowPlayingViewController _setIdleViewController:forMediaItem:]( self,  "_setIdleViewController:forMediaItem:",  v17,  v3);
        }
        else {
          -[TVMNowPlayingViewController _removeIdleViewControllerAndRestoreLayout:]( self,  "_removeIdleViewControllerAndRestoreLayout:",  1LL);
        }
      }
    }

    else
    {
      if (v21)
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Idle Mode - Existing idle context found waiting to finish",  (uint8_t *)&v22,  2u);
      }
    }
  }

  else
  {
    -[TVMNowPlayingViewController createNewIdleViewControllerForMediaItem:]( self,  "createNewIdleViewControllerForMediaItem:",  v3);
  }

LABEL_21:
}

- (void)createNewIdleViewControllerForMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = -[_TVMusicNowPlayingIdleViewControllerContext initWithMediaItem:]( objc_alloc(&OBJC_CLASS____TVMusicNowPlayingIdleViewControllerContext),  "initWithMediaItem:",  v4);
  -[TVMNowPlayingViewController setIdleViewControllerContext:](self, "setIdleViewControllerContext:", v5);
  -[TVMNowPlayingViewController _removeIdleViewControllerAndRestoreLayout:]( self,  "_removeIdleViewControllerAndRestoreLayout:",  0LL);
  objc_initWeak(&location, self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController playbackDelegate](self, "playbackDelegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000CC63C;
  v8[3] = &unk_10026DFF0;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  double v9 = v7;
  [v6 playbackViewController:self wantsIdleViewControllerForMediaItem:v4 withCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_isMediaItemExplicit:(id)a3
{
  uint64_t v3 = TVPMediaItemMetadataContentRatingDomain;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaItemMetadataForProperty:TVPMediaItemMetadataContentRatingIsExplicitMusic]);

  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_isAudioOnDemand
{
  if (!-[TVMNowPlayingViewController _isStreamingRadioPlayback](self, "_isStreamingRadioPlayback")) {
    return 0;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  [v3 duration];
  BOOL v5 = v4 != TVPDurationIndefinite;

  return v5;
}

- (BOOL)_shouldShowTransportBar
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
  double v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);

  if (v4 == @"Rest mode")
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState scanning](&OBJC_CLASS___TVPPlaybackState, "scanning"));
    if (v6 == v10) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = -[TVMNowPlayingViewController isScrubbing](self, "isScrubbing");
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
    BOOL v9 = v11 != 0LL;

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _itemIdentifierForPlayingItem](self, "_itemIdentifierForPlayingItem"));
    unsigned int v7 = [v12 isEqual:v13] ^ 1;
  }

  else
  {
    unsigned int v7 = 0;
    unsigned __int8 v8 = 0;
    BOOL v9 = 0;
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
  if (v6 == v14)
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    unsigned int v15 = [v16 isLive] ^ 1;
  }

  else
  {
    unsigned int v15 = 0;
  }

  if (v4 == @"Active mode") {
    char v17 = 1;
  }
  else {
    char v17 = v8;
  }
  if ((v17 & 1) != 0 || v15)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currentMediaItem]);
    if (v20 && ((-[TVMNowPlayingViewController singleCoverOnly](self, "singleCoverOnly") | v9 | v7) & 1) == 0)
    {
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      unsigned int v18 = [v21 isShowingInfo] ^ 1;
    }

    else
    {
      LOBYTE(v18) = 0;
    }
  }

  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)_isScrubbingAllowed
{
  if (-[TVMNowPlayingViewController _isAudioOnDemand](self, "_isAudioOnDemand")) {
    return 1;
  }
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);

  uint64_t v8 = 0LL;
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    unsigned __int8 v3 = [v5 player:v6 shouldSeekToTime:&v8 playbackDate:0];
  }

  else
  {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (BOOL)_isVideoPresented
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  if (v5 == v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    [v14 bounds];
    BOOL v7 = v13 == v16 && v11 == v15;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_presentVideoViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  BOOL v7 = (void (**)(void))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);

  [v9 setAlpha:1.0];
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[PSCameraController sharedInstance](&OBJC_CLASS___PSCameraController, "sharedInstance"));
    [v12 setAllInputsEnabled:0];
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);
  if (v13 == v8)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDismissAnimator](self, "videoDismissAnimator"));
    if ([v4 state] != (id)1)
    {

      goto LABEL_24;
    }
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController endpointRoute](self, "endpointRoute"));
  double v15 = v14;
  if (!v14)
  {

    if (v13 == v8)
    {

      double v13 = v8;
    }

    goto LABEL_14;
  }

  unsigned __int8 v16 = [v14 isDeviceRoute];

  if (v13 == v8)
  {

    if ((v16 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_14:
    char v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
    id v18 = [v17 state];

    if (v5)
    {
      if (v18 == (id)1)
      {
        id v19 = sub_1000BD900();
        unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v56 = "-[TVMNowPlayingViewController _presentVideoViewControllerAnimated:completion:]";
          __int16 v57 = 2080;
          double v58 = "-[TVMNowPlayingViewController _presentVideoViewControllerAnimated:completion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Attempting to present video when already presenting.",  buf,  0x16u);
        }
      }

      else
      {
        CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDismissAnimator](self, "videoDismissAnimator"));
        id v24 = [v23 state];

        if (v24 == (id)1)
        {
          unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDismissAnimator](self, "videoDismissAnimator"));
          [v25 stopAnimation:1];

          -[TVMNowPlayingViewController setVideoDismissAnimator:](self, "setVideoDismissAnimator:", 0LL);
        }

        CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue([v11 superview]);

        if (v26 != v8)
        {
          [v9 bounds];
          objc_msgSend(v9, "convertRect:toView:", v8);
          objc_msgSend(v11, "setFrame:");
          [v11 setAutoresizingMask:18];
          [v8 addSubview:v11];
        }

        CGFloat v27 = (UIView *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDimmingView](self, "videoDimmingView"));
        if (!v27)
        {
          CGFloat v28 = objc_alloc(&OBJC_CLASS___UIView);
          [v8 bounds];
          CGFloat v27 = -[UIView initWithFrame:](v28, "initWithFrame:");
          CGFloat v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
          -[UIView setBackgroundColor:](v27, "setBackgroundColor:", v29);

          -[UIView setAlpha:](v27, "setAlpha:", 0.0);
          -[TVMNowPlayingViewController setVideoDimmingView:](self, "setVideoDimmingView:", v27);
        }

        [v8 insertSubview:v27 belowSubview:v11];
        id v30 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472LL;
        v53[2] = sub_1000CD35C;
        v53[3] = &unk_100268CF0;
        double v31 = v27;
        double v54 = v31;
        char v32 = -[UIViewPropertyAnimator initWithDuration:dampingRatio:animations:]( v30,  "initWithDuration:dampingRatio:animations:",  v53,  0.4,  1.0);
        [v9 setAlpha:1.0];
        if ([v9 isDescendantOfView:v8])
        {
          double v33 = (void *)objc_claimAutoreleasedReturnValue([v11 layer]);
          [v33 setCornerRadius:12.0];

          [v11 setClipsToBounds:1];
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_1000CD368;
          v52[3] = &unk_100268B30;
          v52[4] = v11;
          v52[5] = v8;
          double v34 = v52;
        }

        else
        {
          [v8 bounds];
          objc_msgSend(v11, "setFrame:");
          [v11 setAlpha:0.0];
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472LL;
          v51[2] = sub_1000CD3AC;
          v51[3] = &unk_100268CF0;
          v51[4] = v11;
          double v34 = v51;
        }

        -[UIViewPropertyAnimator addAnimations:](v32, "addAnimations:", v34);
        double v43 = _NSConcreteStackBlock;
        uint64_t v44 = 3221225472LL;
        double v45 = sub_1000CD3B8;
        id v46 = &unk_10026E018;
        double v47 = v9;
        id v48 = self;
        uint64_t v49 = v31;
        double v50 = v7;
        double v42 = v31;
        -[UIViewPropertyAnimator addCompletion:](v32, "addCompletion:", &v43);
        -[TVMNowPlayingViewController setVideoPresentAnimator:]( self,  "setVideoPresentAnimator:",  v32,  v43,  v44,  v45,  v46,  v47,  v48);
        -[UIViewPropertyAnimator startAnimation](v32, "startAnimation");
        -[UIViewPropertyAnimator tvm_scheduleFinishAnimationIfNeeded](v32, "tvm_scheduleFinishAnimationIfNeeded");
      }
    }

    else if (v18 == (id)1)
    {
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
      [v21 stopAnimation:0];

      int v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
      [v22 finishAnimationAtPosition:0];

      -[TVMNowPlayingViewController setVideoPresentAnimator:](self, "setVideoPresentAnimator:", 0LL);
    }

    else
    {
      double v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDismissAnimator](self, "videoDismissAnimator"));
      id v36 = [v35 state];

      if (v36 == (id)1)
      {
        double v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDismissAnimator](self, "videoDismissAnimator"));
        [v37 stopAnimation:1];

        -[TVMNowPlayingViewController setVideoDismissAnimator:](self, "setVideoDismissAnimator:", 0LL);
      }

      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
      [v11 setAutoresizingMask:18];
      [v8 bounds];
      objc_msgSend(v11, "setFrame:");
      [v8 addSubview:v11];
      double v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
      double v39 = (void *)objc_claimAutoreleasedReturnValue([v38 videoOutput]);
      double v40 = 1.0;
      if (!v39) {
        double v40 = 0.0;
      }
      [v9 setAlpha:v40];

      [v8 layoutIfNeeded];
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 0LL);
      -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      double v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
      [v41 postEvent:@"Force rest mode"];

      if (v7) {
        goto LABEL_25;
      }
    }

    goto LABEL_42;
  }

  if ((v16 & 1) != 0) {
    goto LABEL_14;
  }
LABEL_24:
  if (v7) {
LABEL_25:
  }
    v7[2](v7);
LABEL_42:
}

- (void)_dismissVideoViewController
{
}

- (void)_dismissVideoViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 superview]);
  if (v11 == v7)
  {
    -[TVMNowPlayingViewController setDismissingVideoView:](self, "setDismissingVideoView:", 1LL);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDismissAnimator](self, "videoDismissAnimator"));
    id v13 = [v12 state];

    if (v4)
    {
      if (v13 == (id)1)
      {
        id v14 = sub_1000BD900();
        double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v69 = "-[TVMNowPlayingViewController _dismissVideoViewControllerAnimated:completion:]";
          __int16 v70 = 2080;
          CGAffineTransform v71 = "-[TVMNowPlayingViewController _dismissVideoViewControllerAnimated:completion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Attempting to dismiss video when animation is already in progress.",  buf,  0x16u);
        }
      }

      else
      {
        char v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
        id v18 = [v17 state];

        if (v18 == (id)1)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
          [v19 stopAnimation:0];

          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
          [v20 finishAnimationAtPosition:2];

          -[TVMNowPlayingViewController setVideoPresentAnimator:](self, "setVideoPresentAnimator:", 0LL);
        }

        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
        int v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _itemIdentifierForPlayingItem]( self,  "_itemIdentifierForPlayingItem"));
        -[TVMNowPlayingViewController setSingleCoverMediaItem:](self, "setSingleCoverMediaItem:", v22);

        -[TVMNowPlayingViewController setCenterIndexPath:](self, "setCenterIndexPath:", v21);
        CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        [v23 reloadData];

        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        -[TVMNowPlayingViewController _scrollCollectionView:toIndexPath:animated:]( self,  "_scrollCollectionView:toIndexPath:animated:",  v24,  v21,  0LL);

        -[TVMNowPlayingViewController _updateEmbeddedVideoView](self, "_updateEmbeddedVideoView");
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);
        CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);
        [v26 bounds];
        objc_msgSend(v25, "convertRect:toView:", v7);
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;

        [v10 setClipsToBounds:1];
        [v7 addSubview:v10];
        double v35 = (UIView *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDimmingView](self, "videoDimmingView"));
        if (!v35)
        {
          id v36 = objc_alloc(&OBJC_CLASS___UIView);
          [v7 bounds];
          double v35 = -[UIView initWithFrame:](v36, "initWithFrame:");
          double v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
          -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v37);

          -[UIView setAlpha:](v35, "setAlpha:", 1.0);
          -[TVMNowPlayingViewController setVideoDimmingView:](self, "setVideoDimmingView:", v35);
        }

        [v7 insertSubview:v35 belowSubview:v10];
        double v38 = -[UIViewPropertyAnimator initWithDuration:dampingRatio:animations:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:dampingRatio:animations:",  &stru_10026E038,  0.35,  1.0);
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472LL;
        v66[2] = sub_1000CDB94;
        v66[3] = &unk_100268CF0;
        double v39 = v35;
        double v67 = v39;
        -[UIViewPropertyAnimator addAnimations:](v38, "addAnimations:", v66);
        [v8 setAlpha:1.0];
        if ([v8 isDescendantOfView:v7])
        {
          double v40 = (void *)objc_claimAutoreleasedReturnValue([v10 layer]);
          [v40 setCornerRadius:0.0];

          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472LL;
          v65[2] = sub_1000CDBA0;
          v65[3] = &unk_10026E060;
          v65[4] = v10;
          *(double *)&v65[5] = v28;
          *(double *)&v65[6] = v30;
          double v41 = v65;
          *(double *)&v65[7] = v32;
          *(double *)&v65[8] = v34;
        }

        else
        {
          objc_msgSend(v10, "setFrame:", v28, v30, v32, v34);
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472LL;
          v64[2] = sub_1000CDBF8;
          v64[3] = &unk_100268CF0;
          v64[4] = v10;
          double v41 = v64;
        }

        -[UIViewPropertyAnimator addAnimations:](v38, "addAnimations:", v41);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472LL;
        v60[2] = sub_1000CDC04;
        v60[3] = &unk_10026E018;
        v60[4] = v10;
        double v51 = v39;
        id v61 = v51;
        double v62 = self;
        unsigned int v63 = v6;
        -[UIViewPropertyAnimator addCompletion:](v38, "addCompletion:", v60);
        -[TVMNowPlayingViewController setVideoDismissAnimator:](self, "setVideoDismissAnimator:", v38);
        -[UIViewPropertyAnimator startAnimation](v38, "startAnimation");
        -[UIViewPropertyAnimator tvm_scheduleFinishAnimationIfNeeded](v38, "tvm_scheduleFinishAnimationIfNeeded");
        if (-[UIViewPropertyAnimator isRunning](v38, "isRunning"))
        {
          double v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
          id v53 = [v52 applicationState];

          if (v53)
          {
            -[UIViewPropertyAnimator delay](v38, "delay");
            double v55 = v54;
            -[UIViewPropertyAnimator duration](v38, "duration");
            dispatch_time_t v57 = dispatch_time(0LL, (uint64_t)((v55 + v56) * 1000000000.0));
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472LL;
            v58[2] = sub_1000CDCD0;
            v58[3] = &unk_100268CF0;
            double v59 = v38;
            dispatch_after(v57, &_dispatch_main_q, v58);
          }
        }
      }
    }

    else if (v13 == (id)1)
    {
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDismissAnimator](self, "videoDismissAnimator"));
      [v16 stopAnimation:0];

      -[TVMNowPlayingViewController setVideoDismissAnimator:](self, "setVideoDismissAnimator:", 0LL);
    }

    else
    {
      double v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
      id v43 = [v42 state];

      if (v43 == (id)1)
      {
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
        [v44 stopAnimation:0];

        double v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPresentAnimator](self, "videoPresentAnimator"));
        [v45 finishAnimationAtPosition:2];

        -[TVMNowPlayingViewController setVideoPresentAnimator:](self, "setVideoPresentAnimator:", 0LL);
      }

      id v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDimmingView](self, "videoDimmingView"));

      if (v46)
      {
        double v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoDimmingView](self, "videoDimmingView"));
        [v47 removeFromSuperview];

        -[TVMNowPlayingViewController setVideoDimmingView:](self, "setVideoDimmingView:", 0LL);
      }

      -[TVMNowPlayingViewController _updateEmbeddedVideoView](self, "_updateEmbeddedVideoView");
      [v10 setAutoresizingMask:18];
      [v8 bounds];
      objc_msgSend(v10, "setFrame:");
      [v8 addSubview:v10];
      id v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController videoPlayerViewController](self, "videoPlayerViewController"));
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 videoOutput]);
      double v50 = 1.0;
      if (!v49) {
        double v50 = 0.0;
      }
      [v8 setAlpha:v50];

      -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      if (v6) {
        v6[2](v6);
      }
      -[TVMNowPlayingViewController setDismissingVideoView:](self, "setDismissingVideoView:", 0LL);
    }
  }

  else if (v6)
  {
    v6[2](v6);
  }
}

- (id)collectionView:(id)a3 cellForMediaItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  -[TVMNowPlayingViewController _itemSizeForMediaItem:](self, "_itemSizeForMediaItem:", v8);
  double v12 = v11;
  double v14 = v13;
  if (v13 == 522.0 && v11 == 928.0) {
    unsigned __int8 v16 = @"NowPlayingWideCellIdentifier";
  }
  else {
    unsigned __int8 v16 = @"NowPlayingCellIdentifier";
  }
  char v17 = (void *)objc_claimAutoreleasedReturnValue([v10 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v9]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _nowPlayingInfoFromMediaItem:]( self,  "_nowPlayingInfoFromMediaItem:",  v8));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 trackTitle]);
  [v17 setSongTitle:v19];

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 artistName]);
  [v17 setArtistName:v20];

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_1000CE12C;
  v53[3] = &unk_100268B30;
  id v21 = v17;
  id v54 = v21;
  id v22 = v18;
  id v55 = v22;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v53);
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 radioStationAttribution]);
  double v51 = (void *)v23;
  double v52 = v22;
  if (v23)
  {
    uint64_t v24 = v23;
    [v21 setDetailDescription:v23];
    [v21 setArtistName:v24];
  }

  else
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v22 artistName]);
    CGFloat v26 = (void *)v25;
    double v27 = &stru_100279068;
    if (v25) {
      double v28 = (__CFString *)v25;
    }
    else {
      double v28 = &stru_100279068;
    }
    double v29 = v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue([v22 albumTitle]);
    double v31 = (void *)v30;
    if (v30) {
      double v32 = (__CFString *)v30;
    }
    else {
      double v32 = &stru_100279068;
    }
    double v33 = v32;

    if (-[__CFString length](v29, "length") && -[__CFString length](v33, "length")) {
      double v27 = @" — ";
    }
    double v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v29,  v27,  v33));
    [v21 setDetailDescription:v34];
  }

  double v35 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
  id v36 = (void *)TVPMediaTypeMusicVideo;

  double v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
  unsigned int v38 = [v9 isEqual:v37];

  double v39 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  double v40 = v9;
  unsigned int v41 = [v39 hasPlaybackRestrictions];

  double v42 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataIsPurchased"]);
  unsigned int v43 = [v42 BOOLValue];

  [v21 setDisabled:v41 & ((v43 | v38) ^ 1)];
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
  objc_msgSend(v21, "setShowsMetadata:", objc_msgSend(v44, "isShowingInfo") ^ 1);

  if (v35 == v36) {
    uint64_t v45 = 4LL;
  }
  else {
    uint64_t v45 = 1LL;
  }
  [v21 setPlaceholderType:v45];
  id v46 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataMPArtworkCatalog]);
  objc_msgSend(v46, "setFittingSize:", v12 + 36.0, v14 + 36.0);
  [v46 setDestinationScale:0.0];
  [v21 setArtworkCatalog:v46];
  double v47 = (void *)objc_claimAutoreleasedReturnValue( [v8 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataEnqueuingParticipant"]);
  [v21 setParticipant:v47];
  id v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
  objc_msgSend(v21, "setShowAttribution:", objc_msgSend(v48, "isEqual:", v40));

  id v49 = v21;
  return v49;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v51 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemIdentifierForIndexPath:v9]);

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
  unsigned int v14 = [v9 isEqual:v13];

  if ((v14 & 1) != 0)
  {
    [v8 setBottomAccessoryView:self->_musicBarsView];
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 state]);
    char v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

    if (v16 == v17) {
      -[TVMusicBarsView resumeAnimating](self->_musicBarsView, "resumeAnimating");
    }
  }

  else
  {
    [v8 setBottomAccessoryView:0];
  }

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v18);
  if ((objc_opt_isKindOfClass(v8, v19) & 1) != 0) {
    unsigned int v20 = v8;
  }
  else {
    unsigned int v20 = 0LL;
  }
  id v21 = v20;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  unsigned int v23 = [v22 isPlaylistVisible];

  if (v23)
  {
    else {
      unsigned int v25 = 0;
    }
    if (v25 == 1
      && ((id v26 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController endpointRoute](self, "endpointRoute"))) == 0LL
       || (double v27 = v26,
           unsigned __int8 v28 = [v26 isDeviceRoute],
           v27,
           v27,
           (v28 & 1) != 0)))
    {
      double v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController embeddedVideoView](self, "embeddedVideoView"));
      [v21 setVideoView:v29];
    }

    else
    {
      [v21 setVideoView:0];
    }
  }

  uint64_t v30 = objc_opt_class(&OBJC_CLASS___TVMusicMPObjectMediaItem, v24);
  if ((objc_opt_isKindOfClass(v11, v30) & 1) != 0) {
    double v31 = v11;
  }
  else {
    double v31 = 0LL;
  }
  id v32 = v31;
  if (_os_feature_enabled_impl("TVMusic", "Motion_In_Now_Playing"))
  {
    double v33 = (void *)objc_claimAutoreleasedReturnValue([v21 motionView]);
    double v34 = (void *)objc_claimAutoreleasedReturnValue([v33 artwork]);
    double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 uniqueIdentifier]);
    uint64_t v36 = objc_claimAutoreleasedReturnValue([v32 uniqueIdentifier]);
    double v37 = self;
    id v38 = v32;
    double v39 = v11;
    id v40 = v21;
    id v41 = v8;
    id v42 = v9;
    unsigned int v43 = (void *)v36;
    unsigned __int8 v50 = [v35 isEqualToString:v36];

    id v9 = v42;
    id v8 = v41;
    id v21 = v40;
    double v11 = v39;
    id v32 = v38;
    uint64_t v44 = v37;

    if ((v50 & 1) == 0)
    {
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](v37, "_indexPathForPlayingItem"));
      unsigned int v46 = [v9 isEqual:v45];

      double v47 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _motionArtworkForItemIdentifier:]( v44,  "_motionArtworkForItemIdentifier:",  v32));
      else {
        uint64_t v48 = (uint64_t)[v21 isFocused];
      }
      [v47 setShouldPlay:v48];
      id v49 = (void *)objc_claimAutoreleasedReturnValue([v21 motionView]);
      [v49 setArtwork:v47];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v5);
  BOOL v7 = (objc_opt_isKindOfClass(v10, v6) & 1) == 0;
  id v8 = v10;
  if (v7) {
    id v8 = 0LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 motionView]);
  [v9 setArtwork:0];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 snapshot]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemIdentifiers]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  -[TVMNowPlayingViewController _itemSizeForMediaItem:](self, "_itemSizeForMediaItem:", v10);
  double v12 = v11;

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
  -[TVMNowPlayingViewController _itemSizeForMediaItem:](self, "_itemSizeForMediaItem:", v13);
  double v15 = v14;

  CGFloat bottom = UIEdgeInsetsZero.bottom;
  [v6 bounds];
  CGFloat v16 = (CGRectGetWidth(v31) - v12) * 0.5;
  [v6 bounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v32.origin.double x = v18;
  v32.origin.double y = v20;
  v32.size.double width = v22;
  v32.size.double height = v24;
  CGFloat v25 = (CGRectGetWidth(v32) - v15) * 0.5;

  double top = UIEdgeInsetsZero.top;
  double v27 = v16;
  double v28 = bottom;
  double v29 = v25;
  result.double right = v29;
  result.CGFloat bottom = v28;
  result.double left = v27;
  result.double top = top;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController mediaItemAtIndex:]( self,  "mediaItemAtIndex:",  objc_msgSend(a5, "item", a3, a4)));
  if (v6)
  {
    -[TVMNowPlayingViewController _itemSizeForMediaItem:](self, "_itemSizeForMediaItem:", v6);
    CGFloat width = v7;
    CGFloat height = v9;
  }

  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v11 = width;
  double v12 = height;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v27 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nextFocusedIndexPath]);
  if (!v8)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _cellForSingleCoverMediaItem](self, "_cellForSingleCoverMediaItem"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 motionView]);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 artwork]);
    [v14 setShouldPlay:1];

LABEL_8:
    goto LABEL_9;
  }

  -[TVMNowPlayingViewController setCenterIndexPath:](self, "setCenterIndexPath:", v8);
  -[TVMNowPlayingViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v8);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController mediaItemAtIndex:](self, "mediaItemAtIndex:", [v8 item]));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVMusicMPSongMediaItem, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    double v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController mediaItemAtIndex:]( self,  "mediaItemAtIndex:",  [v8 item]));
  }
  else {
    double v12 = 0LL;
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player"));
  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentMediaItem]);
  -[TVMNowPlayingViewController setScrollWithPlayingItem:]( self,  "setScrollWithPlayingItem:",  [v12 isEqual:v16]);

  if (v12)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _motionArtworkForItemIdentifier:]( self,  "_motionArtworkForItemIdentifier:",  v12));
    [v13 setShouldPlay:1];
    goto LABEL_8;
  }

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathForItemIdentifier:v7]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
  }

  if (v8
    && (id v9 = [v8 section], (uint64_t)v9 < (uint64_t)objc_msgSend(v4, "numberOfSections"))
    && (id v10 = [v8 item],
        (uint64_t)v10 < (uint64_t)objc_msgSend(v4, "numberOfItemsInSection:", objc_msgSend(v8, "section"))))
  {
    id v11 = v8;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 itemIdentifierForIndexPath:v9]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVMusicMPSongMediaItem, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 itemIdentifierForIndexPath:v14]);
    }

    else
    {
      double v15 = 0LL;
    }

    if (v15)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v15 song]);

      if (v7)
      {
        CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v15 song]);
        id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMContextMenus menuForNowPlayingItem:]( &OBJC_CLASS___TVMContextMenus,  "menuForNowPlayingItem:",  v16));
      }
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (BOOL)playerViewControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)skipToNextItemForPlayerViewController:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player", a3));
  [v3 changeMediaInDirection:0];
}

- (void)skipToPreviousItemForPlayerViewController:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController player](self, "player", a3));
  [v3 changeMediaInDirection:1];
}

- (CGRect)musicVideoPlayerViewController:(id)a3 rectForPresentationAnimationTransitionInSourceView:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 layoutAttributesForItemAtIndexPath:v5]);

  if (v7)
  {
    [v7 frame];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
    CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
    unsigned int v17 = [v5 isEqual:v16];

    if (v17)
    {
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGRect v23 = CGRectInset(v22, 36.0 * -0.5, 36.0 * -0.5);
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
    }
  }

  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)musicVideoPlayerViewControllerShouldDismiss:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingSnapshotBackgroundViewShouldPerformSnapshot:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication", a3));
  if ([v4 applicationState] || !-[TVMNowPlayingViewController isViewVisible](self, "isViewVisible"))
  {
    BOOL v6 = 0;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController presentedViewController](self, "presentedViewController"));
    BOOL v6 = v5 == 0LL;
  }

  return v6;
}

- (void)_updateFocusOnScrollEnd
{
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
  unsigned int v3 = objc_msgSend(v18, "tvm_isDescendentFocused");
  id v4 = v18;
  if (v3)
  {
    id v5 = [v18 visibleBounds];
    id v10 = objc_msgSend(v18, "indexPathForItemAtPoint:", UIRectGetCenter(v5, v6, v7, v8, v9));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));
    unsigned __int8 v14 = [v12 isEqual:v13];

    if ((v14 & 1) == 0)
    {
      if (v11)
      {
        -[TVMNowPlayingViewController setCenterIndexPath:](self, "setCenterIndexPath:", v11);
      }

      else
      {
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
        -[TVMNowPlayingViewController setCenterIndexPath:](self, "setCenterIndexPath:", v15);
      }

      [v18 setNeedsFocusUpdate];
    }

    CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController mediaItemAtIndex:]( self,  "mediaItemAtIndex:",  [v11 item]));
    if (v16)
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _motionArtworkForItemIdentifier:]( self,  "_motionArtworkForItemIdentifier:",  v16));
      [v17 setShouldPlay:1];
    }

    id v4 = v18;
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v8 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));

  id v5 = v8;
  if (v4 == v8)
  {
    unsigned __int8 v6 = [v8 isDecelerating];
    id v5 = v8;
    if ((v6 & 1) == 0)
    {
      unsigned int v7 = objc_msgSend(v8, "tvm_isDescendentFocused");
      id v5 = v8;
      if (v7)
      {
        -[TVMNowPlayingViewController _updateFocusOnScrollEnd](self, "_updateFocusOnScrollEnd");
        id v5 = v8;
      }
    }
  }
}

- (void)_scrubScrollViewWillEndDraggingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  a4->CGFloat x = v6;
  a4->CGFloat y = v7;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  double v9 = (UIScrollView *)a3;
  if (self->_scrubScrollView == v9)
  {
    double v19 = v9;
    -[TVMNowPlayingViewController _scrubScrollViewWillEndDraggingWithVelocity:targetContentOffset:]( self,  "_scrubScrollViewWillEndDraggingWithVelocity:targetContentOffset:",  a5,  x,  y);
LABEL_12:
    double v9 = v19;
    goto LABEL_13;
  }

  if (a5)
  {
    double v19 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController centerIndexPath](self, "centerIndexPath"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    unsigned __int8 v12 = [v11 isPlaylistVisible];

    if ((v12 & 1) == 0)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
      if (v13)
      {
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController dataSource](self, "dataSource"));
        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverMediaItem](self, "singleCoverMediaItem"));
        uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 indexPathForItemIdentifier:v15]);

        id v10 = v14;
      }

      else
      {
        uint64_t v16 = objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
      }

      id v10 = (void *)v16;
    }

    if (v10)
    {
      -[TVMNowPlayingViewController _contentOffsetForIndexPath:](self, "_contentOffsetForIndexPath:", v10);
      a5->double x = v17;
      a5->double y = v18;
    }

    goto LABEL_12;
  }

- (void)presentation:(id)a3 didChangeStyle:(int64_t)a4
{
}

- (void)presentation:(id)a3 didChangeVocalControl:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  BOOL v6 = !a4;
  -[TVMNowPlayingViewController setIsShowingModalPopup:](self, "setIsShowingModalPopup:", a4);
  -[TVMNowPlayingViewController _startPlaylistExitTimeout:](self, "_startPlaylistExitTimeout:", v5);
  -[TVMusicTransportBarView setEnabled:](self->_transportBar, "setEnabled:", v6);
}

- (void)presentation:(id)a3 didChangeShowInfo:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = -[TVMNowPlayingViewController _shouldShowTransportBar](self, "_shouldShowTransportBar", a3);
  -[TVMNowPlayingViewController setTransportBarVisible:](self, "setTransportBarVisible:", v6);
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
  {
    if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      unsigned int v8 = [v7 shouldShowCamera];

      if (v8)
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController transportBar](self, "transportBar"));
        [v9 alpha];
        double v11 = v10;

        if (v11 <= 0.0) {
          -[TVMNowPlayingViewController _hideSongInfoViewAnimated:](self, "_hideSongInfoViewAnimated:", 1LL);
        }
        else {
          -[TVMNowPlayingViewController _showSongInfoViewAnimated:](self, "_showSongInfoViewAnimated:", 1LL);
        }
      }
    }
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 nowPlayingConfiguration]);
  id v14 = [v13 copy];

  BOOL v15 = !v4;
  [v14 setShowsMetadata:v15];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
  [v16 setNowPlayingConfiguration:v14];

  CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
  if (v17)
  {
    if (v6) {
      double v18 = 280.0;
    }
    else {
      double v18 = 0.0;
    }
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));
    [v19 setGradientBottomMargin:v18];
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView", 0LL));
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 visibleCells]);

  id v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v22)
  {
    id v24 = v22;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v21);
        }
        id v27 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        uint64_t v28 = objc_opt_class(&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell, v23);
        if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
          [v27 setShowsMetadata:v15];
        }
      }

      id v24 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v24);
  }
}

- (void)_presentation:(id)a3 didChangeShowCamera:(BOOL)a4 shouldAnimate:(BOOL)a5
{
  BOOL v6 = a4;
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing")
    && +[TVMDevice isSingSupported](&OBJC_CLASS___TVMDevice, "isSingSupported"))
  {
    if (!a5)
    {
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
    }

    BOOL v358 = a5;
    rect_24 = self;
    if (v6)
    {
      -[TVMNowPlayingViewController _makePartyStudioIdleTimerAssertion](self, "_makePartyStudioIdleTimerAssertion");
      if (!self->_partyStudioViewController)
      {
        unsigned int v8 = -[PSPartyStudioViewController initWithPlayer:]( objc_alloc(&OBJC_CLASS___PSPartyStudioViewController),  "initWithPlayer:",  self->_player);
        partyStudioViewController = self->_partyStudioViewController;
        self->_partyStudioViewController = v8;

        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PSPartyStudioViewController view](self->_partyStudioViewController, "view"));
        [v10 setAlpha:0.0];

        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PSPartyStudioViewController view](self->_partyStudioViewController, "view"));
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 containerView]);
        [v13 insertSubview:v11 atIndex:0];

        -[TVMNowPlayingViewController addChildViewController:]( self,  "addChildViewController:",  self->_partyStudioViewController);
        id v14 = objc_alloc_init(&OBJC_CLASS___UIView);
        partyStudioLyricsOverladouble y = self->_partyStudioLyricsOverlay;
        self->_partyStudioLyricsOverladouble y = v14;

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_partyStudioLyricsOverlay,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
        id v17 = objc_claimAutoreleasedReturnValue([v16 colorWithAlphaComponent:0.2]);
        id v18 = [v17 CGColor];
        double v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_partyStudioLyricsOverlay, "layer"));
        [v19 setBackgroundColor:v18];

        -[UIView setAlpha:](self->_partyStudioLyricsOverlay, "setAlpha:", 0.0);
        [v11 addSubview:self->_partyStudioLyricsOverlay];
        v374 = (void *)objc_claimAutoreleasedReturnValue([v11 widthAnchor]);
        rect_16b = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_partyStudioLyricsOverlay, "widthAnchor"));
        rect_8c = (void *)objc_claimAutoreleasedReturnValue([v374 constraintEqualToAnchor:rect_16b]);
        v443[0] = rect_8c;
        rectb = (void *)objc_claimAutoreleasedReturnValue([v11 heightAnchor]);
        v356 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_partyStudioLyricsOverlay, "heightAnchor"));
        double v20 = (void *)objc_claimAutoreleasedReturnValue([rectb constraintEqualToAnchor:v356]);
        v443[1] = v20;
        double v21 = (void *)objc_claimAutoreleasedReturnValue([v11 centerXAnchor]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](rect_24->_partyStudioLyricsOverlay, "centerXAnchor"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22]);
        v443[2] = v23;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 centerYAnchor]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](rect_24->_partyStudioLyricsOverlay, "centerYAnchor"));
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25]);
        v443[3] = v26;
        id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v443, 4LL));
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v27);

        self = rect_24;
      }

      __int128 v438 = 0u;
      __int128 v437 = 0u;
      __int128 v436 = 0u;
      __int128 v435 = 0u;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController partyStudioAnimators](self, "partyStudioAnimators"));
      id v29 = [v28 countByEnumeratingWithState:&v435 objects:v442 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v436;
        do
        {
          for (i = 0LL; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v436 != v31) {
              objc_enumerationMutation(v28);
            }
            double v33 = *(void **)(*((void *)&v435 + 1) + 8LL * (void)i);
          }

          id v30 = [v28 countByEnumeratingWithState:&v435 objects:v442 count:16];
        }

        while (v30);
      }

      double v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      double v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoViewContainer](self, "songInfoViewContainer"));
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
      double v37 = (void *)objc_claimAutoreleasedReturnValue([v36 imageView]);
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
      double v39 = (void *)objc_claimAutoreleasedReturnValue([v38 imageView]);
      [v39 bounds];
      objc_msgSend(v37, "convertRect:toView:", v35);
      CGFloat v41 = v40;
      CGFloat rect_8 = v42;
      CGFloat v44 = v43;
      CGFloat v46 = v45;

      double v47 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController partyStudioArtworkTransitionView]( self,  "partyStudioArtworkTransitionView"));
      v375 = v35;
      if (v47)
      {
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController partyStudioArtworkTransitionView]( self,  "partyStudioArtworkTransitionView"));
      }

      else
      {
        double v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue([v67 nowPlayingConfiguration]);
        id v69 = [v68 copy];

        [v69 setVideoView:0];
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v69 makeContentView]);
        __int16 v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        CGAffineTransform v71 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        [v71 bounds];
        objc_msgSend(v70, "convertRect:toView:", v35);
        objc_msgSend(v48, "setFrame:");

        CGFloat v72 = (void *)objc_claimAutoreleasedReturnValue([v48 layer]);
        [v72 setZPosition:1.0];

        [v35 addSubview:v48];
        -[TVMNowPlayingViewController setPartyStudioArtworkTransitionView:]( self,  "setPartyStudioArtworkTransitionView:",  v48);
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        [v73 setAlpha:0.0];

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
        __int16 v75 = (void *)objc_claimAutoreleasedReturnValue([v74 imageView]);
        [v75 setAlpha:0.0];

        double v76 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
        unsigned int v77 = (void *)objc_claimAutoreleasedReturnValue([v76 titleLabel]);
        [v77 setAlpha:0.0];

        v78 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
        id v79 = (void *)objc_claimAutoreleasedReturnValue([v78 subtitleLabel]);
        [v79 setAlpha:0.0];

        v80 = (void *)objc_claimAutoreleasedReturnValue([v48 imageView]);
        v81 = (void *)objc_claimAutoreleasedReturnValue([v80 layer]);
        [v81 setMasksToBounds:1];

        v82 = (void *)objc_claimAutoreleasedReturnValue([v48 imageView]);
        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v82 layer]);
        [v83 setCornerCurve:kCACornerCurveContinuous];

        v84 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        v85 = (void *)objc_claimAutoreleasedReturnValue([v84 imageView]);
        id v86 = (void *)objc_claimAutoreleasedReturnValue([v85 config]);
        [v86 cornerRadius];
        double v88 = v87;
        CGAffineTransform v89 = (void *)objc_claimAutoreleasedReturnValue([v48 imageView]);
        CGAffineTransform v90 = (void *)objc_claimAutoreleasedReturnValue([v89 layer]);
        [v90 setCornerRadius:v88];

        double v35 = v375;
      }

      -[TVMNowPlayingViewController _showSongInfoViewAnimated:](self, "_showSongInfoViewAnimated:", 0LL);
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      CGRect v92 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
      [v92 bounds];
      objc_msgSend(v91, "convertRect:toView:", v35);
      CGFloat v94 = v93;
      CGFloat v339 = v93;
      CGFloat v342 = v95;
      CGFloat sxb = v96;
      CGFloat v98 = v97;
      CGFloat v99 = v95;

      v444.origin.double x = v41;
      v444.origin.double y = rect_8;
      v444.size.CGFloat width = v44;
      v444.size.CGFloat height = v46;
      CGFloat v100 = v41;
      double MidX = CGRectGetMidX(v444);
      v445.origin.double x = v94;
      v445.origin.double y = sxb;
      v445.size.CGFloat width = v98;
      v445.size.CGFloat height = v99;
      double txb = MidX - CGRectGetMidX(v445);
      v446.origin.double x = v100;
      v446.origin.double y = rect_8;
      v446.size.CGFloat width = v44;
      v446.size.CGFloat height = v46;
      double MidY = CGRectGetMidY(v446);
      v447.origin.double x = v339;
      v447.origin.double y = sxb;
      v447.size.CGFloat width = v98;
      v447.size.CGFloat height = v342;
      CGFloat v103 = CGRectGetMidY(v447);
      CGAffineTransformMakeTranslation(&v434, txb, MidY - v103);
      v448.origin.double x = v100;
      v448.origin.double y = rect_8;
      v448.size.CGFloat width = v44;
      v448.size.CGFloat height = v46;
      double Width = CGRectGetWidth(v448);
      v449.origin.double x = v339;
      v449.origin.double y = sxb;
      v449.size.CGFloat width = v98;
      v449.size.CGFloat height = v342;
      CGFloat v105 = Width / CGRectGetWidth(v449);
      v450.origin.double x = v100;
      v450.origin.double y = rect_8;
      v450.size.CGFloat width = v44;
      v450.size.CGFloat height = v46;
      double Height = CGRectGetHeight(v450);
      v451.origin.double x = v339;
      v451.origin.double y = sxb;
      v451.size.CGFloat width = v98;
      v451.size.CGFloat height = v342;
      CGFloat v107 = CGRectGetHeight(v451);
      CGAffineTransform v432 = v434;
      CGAffineTransformScale(&v433, &v432, v105, Height / v107);
      CGAffineTransform v434 = v433;
      v452.origin.double x = v339;
      v452.origin.double y = sxb;
      v452.size.CGFloat width = v98;
      v452.size.CGFloat height = v342;
      double v108 = CGRectGetHeight(v452);
      v453.origin.double x = v100;
      v453.origin.double y = rect_8;
      v453.size.CGFloat width = v44;
      v453.size.CGFloat height = v46;
      double v109 = v108 / CGRectGetHeight(v453);
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
      v111 = (void *)objc_claimAutoreleasedReturnValue([v110 imageView]);
      v112 = (void *)objc_claimAutoreleasedReturnValue([v111 layer]);
      [v112 cornerRadius];
      double v114 = v109 * v113;

      rect = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  50.0,  0.0,  0.0);
      v115 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  rect,  0.0);
      v428[0] = _NSConcreteStackBlock;
      v428[1] = 3221225472LL;
      v428[2] = sub_1000D1720;
      v428[3] = &unk_10026E088;
      id v116 = v48;
      id v429 = v116;
      double v430 = v114;
      CGAffineTransform v431 = v434;
      -[UIViewPropertyAnimator addAnimations:](v115, "addAnimations:", v428);
      v427[0] = _NSConcreteStackBlock;
      v427[1] = 3221225472LL;
      v427[2] = sub_1000D17A0;
      v427[3] = &unk_10026BB60;
      v427[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v115, "addCompletion:", v427);
      -[UIViewPropertyAnimator startAnimation](v115, "startAnimation");
      v353 = v115;
      [v34 addObject:v115];
      v117 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v425[0] = _NSConcreteStackBlock;
      v425[1] = 3221225472LL;
      v425[2] = sub_1000D181C;
      v425[3] = &unk_100268CF0;
      id v64 = v116;
      id v426 = v64;
      v118 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v117,  "initWithDuration:controlPoint1:controlPoint2:animations:",  v425,  0.22,  0.17,  0.0,  0.67,  1.0);
      -[UIViewPropertyAnimator startAnimation](v118, "startAnimation");
      [v34 addObject:v118];
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController"));

      if (v119) {
        -[TVMNowPlayingViewController _updateIdleViewControllerIfNeeded](self, "_updateIdleViewControllerIfNeeded");
      }
      double v120 = 0.0;
      tdouble x = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  50.0,  0.0,  0.0);
      v121 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  tx,  0.0);
      v424[0] = _NSConcreteStackBlock;
      v424[1] = 3221225472LL;
      v424[2] = sub_1000D1878;
      v424[3] = &unk_100268CF0;
      v424[4] = self;
      -[UIViewPropertyAnimator addAnimations:](v121, "addAnimations:", v424);
      -[UIViewPropertyAnimator startAnimation](v121, "startAnimation");
      sdouble x = v121;
      [v34 addObject:v121];
      v122 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v423[0] = _NSConcreteStackBlock;
      v423[1] = 3221225472LL;
      v423[2] = sub_1000D18AC;
      v423[3] = &unk_100268CF0;
      v423[4] = self;
      v123 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v122,  "initWithDuration:controlPoint1:controlPoint2:animations:",  v423,  0.25,  0.33,  0.0,  0.67,  1.0);
      -[UIViewPropertyAnimator startAnimationAfterDelay:](v123, "startAnimationAfterDelay:", 0.5);
      v343 = v123;
      [v34 addObject:v123];
      v124 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      v125 = (void *)objc_claimAutoreleasedReturnValue([v124 indexPathsForVisibleItems]);
      rect_16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v125 count]));

      v126 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      LODWORD(v124) = [v126 isPlaylistVisible];

      if ((_DWORD)v124)
      {
        v340 = v118;
        id rect_8a = v64;
        v127 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
        uint64_t v128 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (char *)[v127 item] - 1,  objc_msgSend(v127, "section")));
        uint64_t v129 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (char *)[v127 item] + 1,  objc_msgSend(v127, "section")));
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        v131 = (void *)objc_claimAutoreleasedReturnValue([v130 collectionViewLayout]);
        v337 = (void *)v128;
        v132 = (void *)objc_claimAutoreleasedReturnValue([v131 layoutAttributesForItemAtIndexPath:v128]);

        v133 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        v134 = (void *)objc_claimAutoreleasedReturnValue([v133 collectionViewLayout]);
        v335 = (void *)v129;
        v135 = (void *)objc_claimAutoreleasedReturnValue([v134 layoutAttributesForItemAtIndexPath:v129]);

        if (v132)
        {
          v136 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v132 frame];
          objc_msgSend(v136, "convertRect:toView:", v35);
          CGFloat v138 = v137;
          CGFloat v140 = v139;
          CGFloat v142 = v141;
          CGFloat v144 = v143;

          v454.origin.double x = v138;
          v454.origin.double y = v140;
          v454.size.CGFloat width = v142;
          v454.size.CGFloat height = v144;
          double v120 = -CGRectGetMaxX(v454);
        }

        double v328 = v120;
        v330 = v135;
        if (v135)
        {
          v145 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          v146 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v146 bounds];
          objc_msgSend(v145, "convertRect:toView:", v35);
          CGFloat v148 = v147;
          CGFloat v332 = v149;
          CGFloat v151 = v150;
          CGFloat v153 = v152;

          v154 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v135 frame];
          objc_msgSend(v154, "convertRect:toView:", v35);
          CGFloat v156 = v155;
          CGFloat v158 = v157;
          CGFloat v160 = v159;
          CGFloat v162 = v161;

          v455.origin.double x = v148;
          v455.origin.double y = v332;
          v455.size.CGFloat width = v151;
          v455.size.CGFloat height = v153;
          double v163 = CGRectGetWidth(v455);
          v456.origin.double x = v156;
          v456.origin.double y = v158;
          v456.size.CGFloat width = v160;
          v456.size.CGFloat height = v162;
          double v164 = v163 - CGRectGetMinX(v456);
        }

        else
        {
          double v164 = 0.0;
        }

        v334 = v132;
        __int128 v421 = 0u;
        __int128 v422 = 0u;
        __int128 v419 = 0u;
        __int128 v420 = 0u;
        v261 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController _playlistCollectionView]( self,  "_playlistCollectionView",  *(void *)&v328));
        v262 = (void *)objc_claimAutoreleasedReturnValue([v261 indexPathsForVisibleItems]);

        id v263 = [v262 countByEnumeratingWithState:&v419 objects:v441 count:16];
        if (v263)
        {
          id v264 = v263;
          uint64_t v265 = *(void *)v420;
          double y = CGPointZero.y;
          do
          {
            for (j = 0LL; j != v264; j = (char *)j + 1)
            {
              if (*(void *)v420 != v265) {
                objc_enumerationMutation(v262);
              }
              v268 = *(void **)(*((void *)&v419 + 1) + 8LL * (void)j);
              if (([v268 isEqual:v127] & 1) == 0)
              {
                v269 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
                v270 = (void *)objc_claimAutoreleasedReturnValue([v269 cellForItemAtIndexPath:v268]);

                if (v270)
                {
                  [v270 bounds];
                  objc_msgSend(v270, "convertRect:toView:", v375);
                  double v272 = v271;
                  double v274 = v273;
                  double v276 = v275;
                  double v278 = v277 + 200.0;
                  v279 = -[UIGraphicsImageRenderer initWithBounds:]( objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer),  "initWithBounds:",  CGPointZero.x,  y,  v275,  v277 + 200.0);
                  v417[0] = _NSConcreteStackBlock;
                  v417[1] = 3221225472LL;
                  v417[2] = sub_1000D1930;
                  v417[3] = &unk_10026E0B0;
                  id v418 = v270;
                  v280 = (void *)objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v279, "imageWithActions:", v417));

                  v281 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v280);
                  -[UIImageView setFrame:](v281, "setFrame:", v272, v274, v276, v278);
                  [v375 addSubview:v281];
                  [rect_16 setObject:v281 forKeyedSubscript:v268];
                }

                self = rect_24;
              }
            }

            id v264 = [v262 countByEnumeratingWithState:&v419 objects:v441 count:16];
          }

          while (v264);
        }

        if ([rect_16 count])
        {
          v282 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v282 setHidden:1];

          v283 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  50.0,  0.0,  0.0);
          v284 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v283,  0.0);
          v412[0] = _NSConcreteStackBlock;
          v412[1] = 3221225472LL;
          v412[2] = sub_1000D198C;
          v412[3] = &unk_10026E0D8;
          id v285 = rect_16;
          id v413 = v285;
          id v414 = v127;
          uint64_t v415 = v329;
          double v416 = v164;
          -[UIViewPropertyAnimator addAnimations:](v284, "addAnimations:", v412);
          v410[0] = _NSConcreteStackBlock;
          v410[1] = 3221225472LL;
          v410[2] = sub_1000D1B08;
          v410[3] = &unk_10026DFA0;
          v410[4] = self;
          id v411 = v285;
          -[UIViewPropertyAnimator addCompletion:](v284, "addCompletion:", v410);
          -[UIViewPropertyAnimator startAnimation](v284, "startAnimation");
          [v34 addObject:v284];
        }

        double v35 = v375;
        id v64 = rect_8a;
        v118 = v340;
      }

      v286 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v409[0] = _NSConcreteStackBlock;
      v409[1] = 3221225472LL;
      v409[2] = sub_1000D1C14;
      v409[3] = &unk_100268CF0;
      v409[4] = self;
      v287 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v286,  "initWithDuration:controlPoint1:controlPoint2:animations:",  v409,  0.42,  0.33,  0.0,  0.67,  1.0);
      v408[0] = _NSConcreteStackBlock;
      v408[1] = 3221225472LL;
      v408[2] = sub_1000D1CA0;
      v408[3] = &unk_10026BB60;
      v408[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v287, "addCompletion:", v408);
      -[UIViewPropertyAnimator startAnimation](v287, "startAnimation");
      [v34 addObject:v287];
      v288 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      v289 = (void *)objc_claimAutoreleasedReturnValue([v288 backgroundProvider]);
      char v290 = objc_opt_respondsToSelector(v289, "beginThrottle");

      if ((v290 & 1) != 0)
      {
        v291 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
        v292 = (void *)objc_claimAutoreleasedReturnValue([v291 backgroundProvider]);
        [v292 beginThrottle];
      }

      -[TVMNowPlayingViewController setPartyStudioAnimators:](self, "setPartyStudioAnimators:", v34);

      v293 = rect;
    }

    else
    {
      -[TVMNowPlayingViewController _releasePartyStudioIdleTimerAssertion]( self,  "_releasePartyStudioIdleTimerAssertion");
      -[PSPartyStudioViewController willMoveToParentViewController:]( self->_partyStudioViewController,  "willMoveToParentViewController:",  0LL);
      if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") != (id)1
        || (id v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController idleViewController](self, "idleViewController")),
            v49,
            !v49))
      {
        unsigned __int8 v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
        unsigned int v51 = [v50 isRunning];

        if (v51)
        {
          double v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
          [v52 stopAnimation:1];

          id v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverViewAnimator](self, "singleCoverViewAnimator"));
          [v53 finishAnimationAtPosition:0];
        }

        id v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        __int128 v55 = *(_OWORD *)&CGAffineTransformIdentity.c;
        v407[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
        v407[1] = v55;
        v407[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
        [v54 setTransform:v407];
      }

      __int128 v405 = 0u;
      __int128 v406 = 0u;
      __int128 v403 = 0u;
      __int128 v404 = 0u;
      double v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController partyStudioAnimators](self, "partyStudioAnimators"));
      id v57 = [v56 countByEnumeratingWithState:&v403 objects:v440 count:16];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = *(void *)v404;
        do
        {
          for (k = 0LL; k != v58; k = (char *)k + 1)
          {
            if (*(void *)v404 != v59) {
              objc_enumerationMutation(v56);
            }
            id v61 = *(void **)(*((void *)&v403 + 1) + 8LL * (void)k);
          }

          id v58 = [v56 countByEnumeratingWithState:&v403 objects:v440 count:16];
        }

        while (v58);
      }

      double v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      double v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoViewContainer](self, "songInfoViewContainer"));
      double v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
      unsigned int v63 = (void *)objc_claimAutoreleasedReturnValue([v62 indexPathsForVisibleItems]);
      id v64 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v63 count]));

      id v65 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController partyStudioArtworkTransitionView]( self,  "partyStudioArtworkTransitionView"));
      if (v65)
      {
        __int128 v66 = (void *)objc_claimAutoreleasedReturnValue( -[TVMNowPlayingViewController partyStudioArtworkTransitionView]( self,  "partyStudioArtworkTransitionView"));
      }

      else
      {
        v165 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        v166 = (void *)objc_claimAutoreleasedReturnValue([v165 nowPlayingConfiguration]);
        id v167 = [v166 copy];

        [v167 setVideoView:0];
        __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v167 makeContentView]);
        v168 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        v169 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        [v169 bounds];
        objc_msgSend(v168, "convertRect:toView:", v35);
        objc_msgSend(v66, "setFrame:");

        [v35 addSubview:v66];
        -[TVMNowPlayingViewController setPartyStudioArtworkTransitionView:]( self,  "setPartyStudioArtworkTransitionView:",  v66);
        v170 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController singleCoverView](self, "singleCoverView"));
        [v170 setAlpha:0.0];

        v171 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
        v172 = (void *)objc_claimAutoreleasedReturnValue([v171 imageView]);
        v173 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
        id rect_8d = v64;
        v174 = (void *)objc_claimAutoreleasedReturnValue([v173 imageView]);
        [v174 bounds];
        objc_msgSend(v172, "convertRect:toView:", v35);
        CGFloat v176 = v175;
        CGFloat rect_16c = v175;
        CGFloat v178 = v177;
        CGFloat v180 = v179;
        CGFloat v182 = v181;
        CGFloat rectc = v181;

        [v66 frame];
        CGFloat v184 = v183;
        CGFloat v186 = v185;
        CGFloat v188 = v187;
        CGFloat v190 = v189;
        v457.origin.double x = v176;
        v457.origin.double y = v178;
        v457.size.CGFloat width = v180;
        v457.size.CGFloat height = v182;
        double v191 = CGRectGetMidX(v457);
        v458.origin.double x = v184;
        v458.origin.double y = v186;
        v458.size.CGFloat width = v188;
        v458.size.CGFloat height = v190;
        CGFloat v192 = v191 - CGRectGetMidX(v458);
        v459.origin.double x = v176;
        v459.origin.double y = v178;
        v459.size.CGFloat width = v180;
        v459.size.CGFloat height = rectc;
        double v193 = CGRectGetMidY(v459);
        v460.origin.double x = v184;
        v460.origin.double y = v186;
        v460.size.CGFloat width = v188;
        v460.size.CGFloat height = v190;
        CGFloat v194 = CGRectGetMidY(v460);
        CGAffineTransformMakeTranslation(&v434, v192, v193 - v194);
        v461.origin.double x = rect_16c;
        v461.origin.double y = v178;
        CGFloat v354 = v178;
        v461.size.CGFloat width = v180;
        v461.size.CGFloat height = rectc;
        double sxc = CGRectGetWidth(v461);
        v462.origin.double x = v184;
        v462.origin.double y = v186;
        v462.size.CGFloat width = v188;
        v462.size.CGFloat height = v190;
        double sxd = sxc / CGRectGetWidth(v462);
        v463.origin.double x = rect_16c;
        v463.origin.double y = v178;
        v463.size.CGFloat width = v180;
        v463.size.CGFloat height = rectc;
        double v195 = CGRectGetHeight(v463);
        v464.origin.double x = v184;
        v464.origin.double y = v186;
        v464.size.CGFloat width = v188;
        v464.size.CGFloat height = v190;
        CGFloat v196 = CGRectGetHeight(v464);
        CGAffineTransform v432 = v434;
        CGAffineTransformScale(&v433, &v432, sxd, v195 / v196);
        CGAffineTransform v434 = v433;
        CGAffineTransform v402 = v433;
        [v66 setTransform:&v402];
        v197 = (void *)objc_claimAutoreleasedReturnValue([v66 headerView]);
        [v197 setAlpha:0.0];

        v198 = (void *)objc_claimAutoreleasedReturnValue([v66 subtitleLabel]);
        [v198 setAlpha:0.0];

        v199 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
        v200 = (void *)objc_claimAutoreleasedReturnValue([v199 imageView]);
        [v200 setAlpha:0.0];

        v201 = (void *)objc_claimAutoreleasedReturnValue([v66 imageView]);
        v202 = (void *)objc_claimAutoreleasedReturnValue([v201 layer]);
        [v202 setMasksToBounds:1];

        v203 = (void *)objc_claimAutoreleasedReturnValue([v66 imageView]);
        v204 = (void *)objc_claimAutoreleasedReturnValue([v203 layer]);
        [v204 setCornerCurve:kCACornerCurveContinuous];

        v465.origin.double x = v184;
        v465.origin.double y = v186;
        v465.size.CGFloat width = v188;
        v465.size.CGFloat height = v190;
        double v205 = CGRectGetHeight(v465);
        v466.origin.double x = rect_16c;
        v466.size.CGFloat width = v180;
        v466.origin.double y = v354;
        v466.size.CGFloat height = rectc;
        double v206 = v205 / CGRectGetHeight(v466);
        v207 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController songInfoView](self, "songInfoView"));
        v208 = (void *)objc_claimAutoreleasedReturnValue([v207 imageView]);
        v209 = (void *)objc_claimAutoreleasedReturnValue([v208 layer]);
        [v209 cornerRadius];
        double v211 = v206 * v210;
        v212 = (void *)objc_claimAutoreleasedReturnValue([v66 imageView]);
        v213 = v35;
        v214 = (void *)objc_claimAutoreleasedReturnValue([v212 layer]);
        [v214 setCornerRadius:v211];

        double v35 = v213;
        id v64 = rect_8d;
      }

      v355 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  50.0,  0.0,  0.0);
      v215 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v355,  0.0);
      v216 = _NSConcreteStackBlock;
      v399[0] = _NSConcreteStackBlock;
      v399[1] = 3221225472LL;
      v399[2] = sub_1000D1CB4;
      v399[3] = &unk_100268B30;
      id v217 = v66;
      id v400 = v217;
      v401 = self;
      -[UIViewPropertyAnimator addAnimations:](v215, "addAnimations:", v399);
      v398[0] = _NSConcreteStackBlock;
      v398[1] = 3221225472LL;
      v398[2] = sub_1000D1D7C;
      v398[3] = &unk_10026BB60;
      v398[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v215, "addCompletion:", v398);
      -[UIViewPropertyAnimator startAnimation](v215, "startAnimation");
      txa = v215;
      [v34 addObject:v215];
      v218 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v396[0] = _NSConcreteStackBlock;
      v396[1] = 3221225472LL;
      v396[2] = sub_1000D1E04;
      v396[3] = &unk_100268CF0;
      sxa = (UISpringTimingParameters *)v217;
      v397 = sxa;
      v219 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v218,  "initWithDuration:controlPoint1:controlPoint2:animations:",  v396,  0.33,  0.33,  0.0,  0.67,  1.0);
      -[UIViewPropertyAnimator startAnimationAfterDelay:](v219, "startAnimationAfterDelay:", 0.33);
      v344 = v219;
      [v34 addObject:v219];
      if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)1)
      {
        v220 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  50.0,  0.0,  0.0);
        v221 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v220,  0.0);
        v395[0] = _NSConcreteStackBlock;
        v395[1] = 3221225472LL;
        v395[2] = sub_1000D1E60;
        v395[3] = &unk_100268CF0;
        v395[4] = self;
        -[UIViewPropertyAnimator addAnimations:](v221, "addAnimations:", v395);
        -[UIViewPropertyAnimator startAnimation](v221, "startAnimation");
        [v34 addObject:v221];
      }

      v222 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
      v394[0] = _NSConcreteStackBlock;
      v394[1] = 3221225472LL;
      v394[2] = sub_1000D1E94;
      v394[3] = &unk_100268CF0;
      v394[4] = self;
      double recta = 0.0;
      v223 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v222,  "initWithDuration:controlPoint1:controlPoint2:animations:",  v394,  0.22,  0.17);
      v393[0] = _NSConcreteStackBlock;
      v393[1] = 3221225472LL;
      v393[2] = sub_1000D1F18;
      v393[3] = &unk_10026BB60;
      v393[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v223, "addCompletion:", v393);
      -[UIViewPropertyAnimator startAnimation](v223, "startAnimation");
      v341 = v223;
      [v34 addObject:v223];
      if ((id)-[TVMNowPlayingViewController viewStyle](self, "viewStyle") == (id)2)
      {
        v224 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _indexPathForPlayingItem](self, "_indexPathForPlayingItem"));
        uint64_t v225 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (char *)[v224 item] - 1,  objc_msgSend(v224, "section")));
        uint64_t v226 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (char *)[v224 item] + 1,  objc_msgSend(v224, "section")));
        v227 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        v228 = (void *)objc_claimAutoreleasedReturnValue([v227 collectionViewLayout]);
        v336 = (void *)v225;
        v229 = (void *)objc_claimAutoreleasedReturnValue([v228 layoutAttributesForItemAtIndexPath:v225]);

        v230 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        v231 = (void *)objc_claimAutoreleasedReturnValue([v230 collectionViewLayout]);
        v333 = (void *)v226;
        v338 = (void *)objc_claimAutoreleasedReturnValue([v231 layoutAttributesForItemAtIndexPath:v226]);

        if (v229)
        {
          v232 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v229 frame];
          objc_msgSend(v232, "convertRect:toView:", v35);
          CGFloat v234 = v233;
          CGFloat v236 = v235;
          CGFloat v238 = v237;
          CGFloat v240 = v239;

          v467.origin.double x = v234;
          v467.origin.double y = v236;
          v467.size.CGFloat width = v238;
          v467.size.CGFloat height = v240;
          double recta = -CGRectGetMaxX(v467);
        }

        v357 = v34;
        v376 = v35;
        rect_8b = v64;
        v331 = v229;
        if (v338)
        {
          v241 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          v242 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v242 bounds];
          objc_msgSend(v241, "convertRect:toView:", v35);
          CGFloat rect_16d = v243;
          CGFloat v245 = v244;
          CGFloat v247 = v246;
          CGFloat v249 = v248;

          v250 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v338 frame];
          objc_msgSend(v250, "convertRect:toView:", v35);
          CGFloat v252 = v251;
          CGFloat v254 = v253;
          CGFloat v256 = v255;
          CGFloat v258 = v257;

          v468.origin.double x = rect_16d;
          v468.origin.double y = v245;
          v468.size.CGFloat width = v247;
          v468.size.CGFloat height = v249;
          double v259 = CGRectGetWidth(v468);
          v469.origin.double x = v252;
          v469.origin.double y = v254;
          v469.size.CGFloat width = v256;
          v469.size.CGFloat height = v258;
          double v260 = v259 - CGRectGetMinX(v469);
        }

        else
        {
          double v260 = 0.0;
        }

        __int128 v391 = 0u;
        __int128 v392 = 0u;
        __int128 v389 = 0u;
        __int128 v390 = 0u;
        v294 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
        v295 = (void *)objc_claimAutoreleasedReturnValue([v294 indexPathsForVisibleItems]);

        rect_16a = v295;
        id v296 = [v295 countByEnumeratingWithState:&v389 objects:v439 count:16];
        if (v296)
        {
          id v297 = v296;
          uint64_t v298 = *(void *)v390;
          double v299 = CGPointZero.y;
          do
          {
            for (m = 0LL; m != v297; m = (char *)m + 1)
            {
              if (*(void *)v390 != v298) {
                objc_enumerationMutation(rect_16a);
              }
              v301 = *(void **)(*((void *)&v389 + 1) + 8LL * (void)m);
              if (([v301 isEqual:v224] & 1) == 0)
              {
                v302 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
                v303 = (void *)objc_claimAutoreleasedReturnValue([v302 cellForItemAtIndexPath:v301]);

                if (v303)
                {
                  [v303 bounds];
                  objc_msgSend(v303, "convertRect:toView:", v376);
                  double v305 = v304;
                  double v307 = v306;
                  double v309 = v308;
                  double v311 = v310 + 200.0;
                  v312 = -[UIGraphicsImageRenderer initWithBounds:]( objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer),  "initWithBounds:",  CGPointZero.x,  v299,  v308,  v310 + 200.0);
                  v313 = v216;
                  v387[0] = v216;
                  v387[1] = 3221225472LL;
                  v387[2] = sub_1000D1F54;
                  v387[3] = &unk_10026E0B0;
                  id v388 = v303;
                  v314 = (void *)objc_claimAutoreleasedReturnValue(-[UIGraphicsImageRenderer imageWithActions:](v312, "imageWithActions:", v387));

                  v315 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v314);
                  -[UIImageView setFrame:](v315, "setFrame:", v305, v307, v309, v311);
                  id v316 = [v301 item];
                  if ((uint64_t)v316 >= (uint64_t)[v224 item])
                  {
                    CGAffineTransformMakeTranslation(&v384, v260, 0.0);
                    CGAffineTransform v383 = v384;
                    v317 = &v383;
                  }

                  else
                  {
                    CGAffineTransformMakeTranslation(&v386, recta, 0.0);
                    CGAffineTransform v385 = v386;
                    v317 = &v385;
                  }

                  -[UIImageView setTransform:](v315, "setTransform:", v317);
                  [v376 addSubview:v315];
                  [rect_8b setObject:v315 forKeyedSubscript:v301];

                  self = rect_24;
                  v216 = v313;
                }
              }
            }

            id v297 = [rect_16a countByEnumeratingWithState:&v389 objects:v439 count:16];
          }

          while (v297);
        }

        id v64 = rect_8b;
        double v34 = v357;
        if ([rect_8b count])
        {
          v318 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController _playlistCollectionView](self, "_playlistCollectionView"));
          [v318 setHidden:1];

          v319 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  50.0,  0.0,  0.0);
          v320 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v319,  0.0);
          v381[0] = v216;
          v381[1] = 3221225472LL;
          v381[2] = sub_1000D1FB0;
          v381[3] = &unk_100268CF0;
          id v321 = rect_8b;
          id v382 = v321;
          -[UIViewPropertyAnimator addAnimations:](v320, "addAnimations:", v381);
          v379[0] = v216;
          v379[1] = 3221225472LL;
          v379[2] = sub_1000D20EC;
          v379[3] = &unk_10026DFA0;
          v379[4] = self;
          id v380 = v321;
          -[UIViewPropertyAnimator addCompletion:](v320, "addCompletion:", v379);
          -[UIViewPropertyAnimator startAnimation](v320, "startAnimation");
          [v357 addObject:v320];
        }

        double v35 = v376;
      }

      v378[0] = v216;
      v378[1] = 3221225472LL;
      v378[2] = sub_1000D21F8;
      v378[3] = &unk_100268CF0;
      v378[4] = self;
      v322 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:controlPoint1:controlPoint2:animations:",  v378,  0.42,  0.33,  0.0,  0.67,  0.0);
      v377[0] = v216;
      v377[1] = 3221225472LL;
      v377[2] = sub_1000D2260;
      v377[3] = &unk_10026BB60;
      v377[4] = self;
      -[UIViewPropertyAnimator addCompletion:](v322, "addCompletion:", v377);
      -[UIViewPropertyAnimator startAnimation](v322, "startAnimation");
      [v34 addObject:v322];
      -[TVMNowPlayingViewController setPartyStudioAnimators:](self, "setPartyStudioAnimators:", v34);
      v323 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
      v324 = (void *)objc_claimAutoreleasedReturnValue([v323 backgroundProvider]);
      char v325 = objc_opt_respondsToSelector(v324, "endThrottle");

      if ((v325 & 1) != 0)
      {
        v326 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
        v327 = (void *)objc_claimAutoreleasedReturnValue([v326 backgroundProvider]);
        [v327 endThrottle];
      }

      v293 = sxa;
    }

    if (!v358) {
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }
  }

- (void)presentation:(id)a3 didChangeShowCamera:(BOOL)a4
{
}

- (void)presentation:(id)a3 didChangeShowEffects:(BOOL)a4 buttonFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    if (a4)
    {
      BOOL v13 = 0LL;
    }

    else
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController stateMachine](self, "stateMachine"));
      BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 currentState]);
      BOOL v13 = v6 == @"Rest mode";
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController nowPlayingView](self, "nowPlayingView"));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lyricsContentView]);
    [v15 setUserInteractionEnabled:v13];

    if (a4)
    {
      -[TVMNowPlayingViewController _showPartyStudioCameraMenuFromButtonFrame:]( self,  "_showPartyStudioCameraMenuFromButtonFrame:",  x,  y,  width,  height);
    }

    else
    {

      -[TVMNowPlayingViewController _dismissPartyStudioCameraMenuAnimated:]( self,  "_dismissPartyStudioCameraMenuAnimated:",  1LL);
    }

    -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (void)_showPartyStudioCameraMenuFromButtonFrame:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!-[TVMNowPlayingViewController _isVideoPresented]( self,  "_isVideoPresented",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height)
    && _os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    cameraOptionsViewController = self->_cameraOptionsViewController;
    if (!cameraOptionsViewController)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[PSCameraController sharedInstance](&OBJC_CLASS___PSCameraController, "sharedInstance"));
      double v9 = objc_alloc(&OBJC_CLASS___PSCameraOptionsViewController);
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 currentEffect]);
      double v11 = -[PSCameraOptionsViewController initWithEffect:](v9, "initWithEffect:", v10);
      unsigned __int8 v12 = self->_cameraOptionsViewController;
      self->_cameraOptionsViewController = v11;

      -[PSCameraOptionsViewController setDelegate:](self->_cameraOptionsViewController, "setDelegate:", self);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PSCameraOptionsViewController view](self->_cameraOptionsViewController, "view"));
      [v13 addSubview:v14];

      -[TVMNowPlayingViewController addChildViewController:]( self,  "addChildViewController:",  self->_cameraOptionsViewController);
      -[PSCameraOptionsViewController didMoveToParentViewController:]( self->_cameraOptionsViewController,  "didMoveToParentViewController:",  self);

      cameraOptionsViewController = self->_cameraOptionsViewController;
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[PSCameraOptionsViewController view](cameraOptionsViewController, "view"));
    -[TVMNowPlayingViewController _cameraOptionsFrameAtPosition:size:]( self,  "_cameraOptionsFrameAtPosition:size:",  x + width,  y + -710.0,  500.0,  700.0);
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
    [v24 bringSubviewToFront:v15];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000D26A8;
    v32[3] = &unk_10026E060;
    id v25 = v15;
    id v33 = v25;
    uint64_t v34 = v17;
    uint64_t v35 = v19;
    uint64_t v36 = v21;
    uint64_t v37 = v23;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v32);
    id v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    id v29 = sub_1000D2734;
    id v30 = &unk_100268CF0;
    id v31 = v25;
    id v26 = v25;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  &v27,  0LL,  0.3,  0.0);
    -[TVMusicB39TapGestureRecognizer setEnabled:]( self->_leftTapGestureRecognizer,  "setEnabled:",  0LL,  v27,  v28,  v29,  v30);
    -[TVMusicB39TapGestureRecognizer setEnabled:](self->_rightTapGestureRecognizer, "setEnabled:", 0LL);
    -[TVMNowPlayingViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (CGRect)_cameraOptionsFrameAtPosition:(CGPoint)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  double width = a4.width;
  CGFloat y = a3.y;
  double v7 = a3.x - a4.width;
  if (v7 >= 80.0) {
    double v8 = v7;
  }
  else {
    double v8 = 80.0;
  }
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController view](self, "view"));
  [v9 bounds];
  double v11 = v10;

  double v12 = v11 - (width + 80.0);
  if (v12 >= v8) {
    double v12 = v8;
  }
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_cleanupPartyStudioCameraMenu
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
  {
    if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PSCameraOptionsViewController view](self->_cameraOptionsViewController, "view"));
      [v3 removeFromSuperview];

      -[PSCameraOptionsViewController willMoveToParentViewController:]( self->_cameraOptionsViewController,  "willMoveToParentViewController:",  0LL);
      -[PSCameraOptionsViewController removeFromParentViewController]( self->_cameraOptionsViewController,  "removeFromParentViewController");
      cameraOptionsViewController = self->_cameraOptionsViewController;
      self->_cameraOptionsViewController = 0LL;

      -[TVMusicB39TapGestureRecognizer setEnabled:](self->_leftTapGestureRecognizer, "setEnabled:", 1LL);
      -[TVMusicB39TapGestureRecognizer setEnabled:](self->_rightTapGestureRecognizer, "setEnabled:", 1LL);
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      [v5 setShouldShowEffects:0];
    }
  }

- (void)_dismissPartyStudioCameraMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    if (v3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSCameraOptionsViewController view](self->_cameraOptionsViewController, "view"));
      v7[4] = self;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1000D2A24;
      v8[3] = &unk_100268CF0;
      id v9 = v5;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1000D2AA0;
      v7[3] = &unk_100268F50;
      id v6 = v5;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v8,  v7,  0.3,  0.0);
    }

    else
    {
      -[TVMNowPlayingViewController _cleanupPartyStudioCameraMenu](self, "_cleanupPartyStudioCameraMenu");
    }
  }

- (void)_showCameraPicker
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
  {
    if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      -[TVMNowPlayingViewController _dismissCameraPicker](self, "_dismissCameraPicker");
      BOOL v3 = objc_alloc_init(&OBJC_CLASS___PSCameraPickerViewController);
      cameraPickerViewController = self->_cameraPickerViewController;
      self->_cameraPickerViewController = v3;

      -[TVMNowPlayingViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_cameraPickerViewController,  1LL,  0LL);
    }
  }

- (void)_dismissCameraPicker
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    cameraPickerViewController = self->_cameraPickerViewController;
    if (cameraPickerViewController)
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[PSCameraPickerViewController presentingViewController]( cameraPickerViewController,  "presentingViewController"));
      [v4 dismissViewControllerAnimated:1 completion:0];

      id v5 = self->_cameraPickerViewController;
      self->_cameraPickerViewController = 0LL;
    }
  }

- (void)_makePartyStudioIdleTimerAssertion
{
  if (!self->_partyStudioIdleTimerAssertion)
  {
    id v3 = sub_1000BD900();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v13 = @"PS-Camera-On";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Idle timer assertion - new assertion to disable idle timer with reason: %@",  buf,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ITIdleTimerState sharedInstance](&OBJC_CLASS___ITIdleTimerState, "sharedInstance"));
    id v11 = 0LL;
    id v6 = (BSInvalidatable *)[v5 newAssertionToDisableIdleTimerForReason:@"PS-Camera-On" error:&v11];
    id v7 = v11;
    partyStudioIdleTimerAssertion = self->_partyStudioIdleTimerAssertion;
    self->_partyStudioIdleTimerAssertion = v6;

    if (v7)
    {
      id v9 = sub_1000BD900();
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001B9C44((uint64_t)v7, v10);
      }
    }
  }

- (void)_releasePartyStudioIdleTimerAssertion
{
  if (self->_partyStudioIdleTimerAssertion)
  {
    id v3 = sub_1000BD900();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Idle timer assertion -  invalidation", v6, 2u);
    }

    -[BSInvalidatable invalidate](self->_partyStudioIdleTimerAssertion, "invalidate");
    partyStudioIdleTimerAssertion = self->_partyStudioIdleTimerAssertion;
    self->_partyStudioIdleTimerAssertion = 0LL;
  }

- (void)cameraControllerConnectionDidChange:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D2E84;
    block[3] = &unk_1002699F8;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    dispatch_async(&_dispatch_main_q, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)cameraOptionsViewController:(id)a3 didFinishWithEffect:(id)a4
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
  {
    if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMNowPlayingViewController viewPresentation](self, "viewPresentation"));
      [v5 setShouldShowEffects:0];
    }
  }

- (void)cameraOptionsViewControllerDidTapDevice:(id)a3
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
  {
    if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000D3004;
      block[3] = &unk_100268CF0;
      void block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)cameraOptionsViewControllerDidTapConnect:(id)a3
{
  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture"))
  {
    if (_os_feature_enabled_impl("TVMusic", "LagunaSing"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000D3100;
      block[3] = &unk_100268CF0;
      void block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)_registerStateMachineHandlers
{
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472LL;
  v144[2] = sub_1000D4614;
  v144[3] = &unk_10026E100;
  objc_copyWeak(&v145, &location);
  id v3 = objc_retainBlock(v144);
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472LL;
  v142[2] = sub_1000D48F8;
  v142[3] = &unk_100269B10;
  objc_copyWeak(&v143, &location);
  id v4 = objc_retainBlock(v142);
  v140[0] = _NSConcreteStackBlock;
  v140[1] = 3221225472LL;
  v140[2] = sub_1000D4A30;
  v140[3] = &unk_100269F48;
  objc_copyWeak(&v141, &location);
  id v5 = objc_retainBlock(v140);
  stateMachine = self->_stateMachine;
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472LL;
  v138[2] = sub_1000D4AC0;
  v138[3] = &unk_10026E128;
  double v67 = v4;
  id v139 = v67;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( stateMachine,  "registerDefaultHandlerForEvent:withBlock:",  @"Focused Progress Bar",  v138);
  id v7 = self->_stateMachine;
  v136[0] = _NSConcreteStackBlock;
  v136[1] = 3221225472LL;
  v136[2] = sub_1000D4B10;
  v136[3] = &unk_10026E128;
  unsigned int v68 = v5;
  id v137 = v68;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v7,  "registerDefaultHandlerForEvent:withBlock:",  @"Unfocused Progress Bar",  v136);
  double v8 = self->_stateMachine;
  v160[0] = @"Rest mode";
  v160[1] = @"Active mode";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v160, 2LL));
  v134[0] = _NSConcreteStackBlock;
  v134[1] = 3221225472LL;
  v134[2] = sub_1000D4B64;
  v134[3] = &unk_100268B58;
  objc_copyWeak(&v135, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v8,  "registerHandlerForEvent:onStates:withBlock:",  @"Track changed",  v9,  v134);

  double v10 = self->_stateMachine;
  v159[0] = @"Metadata update";
  v159[1] = @"Timed Metadata update";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v159, 2LL));
  v158[0] = @"Active mode";
  v158[1] = @"Rest mode";
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v158, 2LL));
  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472LL;
  v132[2] = sub_1000D5154;
  v132[3] = &unk_100268B58;
  objc_copyWeak(&v133, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v10,  "registerHandlerForEvents:onStates:withBlock:",  v11,  v12,  v132);

  double v13 = self->_stateMachine;
  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472LL;
  v130[2] = sub_1000D51BC;
  v130[3] = &unk_100268B58;
  objc_copyWeak(&v131, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v13,  "registerHandlerForEvent:onState:withBlock:",  @"Touch up",  @"Rest mode",  v130);
  double v14 = self->_stateMachine;
  v157[0] = @"Active mode";
  v157[1] = @"Rest mode";
  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v157, 2LL));
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472LL;
  v128[2] = sub_1000D5280;
  v128[3] = &unk_100268B58;
  objc_copyWeak(&v129, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v14,  "registerHandlerForEvent:onStates:withBlock:",  @"Long click ended",  v15,  v128);

  uint64_t v16 = self->_stateMachine;
  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472LL;
  v126[2] = sub_1000D5390;
  v126[3] = &unk_100268B58;
  objc_copyWeak(&v127, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v16,  "registerHandlerForEvent:onState:withBlock:",  @"Nothing is playing",  @"Active mode",  v126);
  uint64_t v17 = self->_stateMachine;
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472LL;
  v124[2] = sub_1000D54C4;
  v124[3] = &unk_100268B58;
  objc_copyWeak(&v125, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v17,  "registerHandlerForEvent:onState:withBlock:",  @"Nothing is playing",  @"Rest mode",  v124);
  uint64_t v18 = self->_stateMachine;
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472LL;
  v122[2] = sub_1000D5510;
  v122[3] = &unk_100268B58;
  objc_copyWeak(&v123, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v18,  "registerHandlerForEvent:onState:withBlock:",  @"Menu button",  @"Active mode",  v122);
  uint64_t v19 = self->_stateMachine;
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472LL;
  v120[2] = sub_1000D5570;
  v120[3] = &unk_100268B58;
  objc_copyWeak(&v121, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v19,  "registerHandlerForEvent:onState:withBlock:",  @"Menu button",  @"Rest mode",  v120);
  uint64_t v20 = self->_stateMachine;
  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472LL;
  v118[2] = sub_1000D567C;
  v118[3] = &unk_100268B58;
  objc_copyWeak(&v119, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v20,  "registerHandlerForEvent:onState:withBlock:",  @"Active mode timeout",  @"Rest mode",  v118);
  uint64_t v21 = self->_stateMachine;
  CGFloat v156 = @"Active mode";
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v156, 1LL));
  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472LL;
  v116[2] = sub_1000D5810;
  v116[3] = &unk_100268B58;
  objc_copyWeak(&v117, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v21,  "registerHandlerForEvent:onStates:withBlock:",  @"Active mode timeout",  v22,  v116);

  if (_os_feature_enabled_impl("Laguna", "ContinuityCapture")
    && _os_feature_enabled_impl("TVMusic", "LagunaSing"))
  {
    uint64_t v23 = self->_stateMachine;
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472LL;
    v114[2] = sub_1000D5968;
    v114[3] = &unk_100268B58;
    objc_copyWeak(&v115, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v23,  "registerHandlerForEvent:onState:withBlock:",  @"Song Info Timeout",  @"Rest mode",  v114);
    objc_destroyWeak(&v115);
  }

  id v24 = self->_stateMachine;
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472LL;
  v112[2] = sub_1000D59E8;
  v112[3] = &unk_100268B58;
  objc_copyWeak(&v113, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v24,  "registerHandlerForEvent:onState:withBlock:",  @"Clicked select button",  @"Active mode",  v112);
  id v25 = self->_stateMachine;
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472LL;
  v109[2] = sub_1000D5AF0;
  v109[3] = &unk_10026E178;
  objc_copyWeak(&v111, &location);
  id v26 = v3;
  id v110 = v26;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v25,  "registerHandlerForEvent:onState:withBlock:",  @"Clicked select button",  @"Rest mode",  v109);
  id v27 = self->_stateMachine;
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472LL;
  v107[2] = sub_1000D602C;
  v107[3] = &unk_100268B58;
  objc_copyWeak(&v108, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v27,  "registerHandlerForEvent:onState:withBlock:",  @"Initialize",  @"Uninitialized",  v107);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( self->_stateMachine,  "registerHandlerForEvent:onState:withBlock:",  @"Button touch",  @"Rest mode",  &stru_10026E1B8);
  uint64_t v28 = self->_stateMachine;
  v155[0] = @"Tap left";
  v155[1] = @"Click left";
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v155, 2LL));
  v154 = @"Rest mode";
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v154, 1LL));
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472LL;
  void v104[2] = sub_1000D63FC;
  v104[3] = &unk_10026E178;
  objc_copyWeak(&v106, &location);
  id v31 = v26;
  id v105 = v31;
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v28,  "registerHandlerForEvents:onStates:withBlock:",  v29,  v30,  v104);

  id v32 = objc_loadWeakRetained(&location);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 stateMachine]);
  v101[0] = _NSConcreteStackBlock;
  v101[1] = 3221225472LL;
  v101[2] = sub_1000D6518;
  v101[3] = &unk_10026E178;
  objc_copyWeak(&v103, &location);
  uint64_t v34 = v31;
  id v102 = v34;
  [v33 registerHandlerForEvent:@"Click left" onState:@"Active mode" withBlock:v101];

  id v35 = objc_loadWeakRetained(&location);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 stateMachine]);
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_1000D66C4;
  v99[3] = &unk_100268B58;
  objc_copyWeak(&v100, &location);
  [v36 registerHandlerForEvent:@"Tap left" onState:@"Active mode" withBlock:v99];

  uint64_t v37 = self->_stateMachine;
  v153[0] = @"Tap right";
  v153[1] = @"Click right";
  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v153, 2LL));
  double v152 = @"Rest mode";
  double v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v152, 1LL));
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472LL;
  v96[2] = sub_1000D6918;
  v96[3] = &unk_10026E178;
  objc_copyWeak(&v98, &location);
  double v40 = v34;
  id v97 = v40;
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v37,  "registerHandlerForEvents:onStates:withBlock:",  v38,  v39,  v96);

  id v41 = objc_loadWeakRetained(&location);
  double v42 = (void *)objc_claimAutoreleasedReturnValue([v41 stateMachine]);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472LL;
  v93[2] = sub_1000D69EC;
  v93[3] = &unk_10026E178;
  objc_copyWeak(&v95, &location);
  __int128 v66 = v40;
  id v94 = v66;
  [v42 registerHandlerForEvent:@"Click right" onState:@"Active mode" withBlock:v93];

  double v43 = self->_stateMachine;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v91[2] = sub_1000D6BB8;
  v91[3] = &unk_100268B58;
  objc_copyWeak(&v92, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v43,  "registerHandlerForEvent:onState:withBlock:",  @"Tap right",  @"Active mode",  v91);
  CGFloat v44 = self->_stateMachine;
  v151[0] = @"Long click left";
  v151[1] = @"Long click right";
  double v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v151, 2LL));
  v150[0] = @"Rest mode";
  v150[1] = @"Active mode";
  CGFloat v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v150, 2LL));
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_1000D6E44;
  v89[3] = &unk_100268B58;
  objc_copyWeak(&v90, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v44,  "registerHandlerForEvents:onStates:withBlock:",  v45,  v46,  v89);

  double v47 = self->_stateMachine;
  double v149 = @"Long click center";
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v149, 1LL));
  v148[0] = @"Rest mode";
  v148[1] = @"Active mode";
  id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v148, 2LL));
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_1000D7068;
  v87[3] = &unk_100268B58;
  objc_copyWeak(&v88, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v47,  "registerHandlerForEvents:onStates:withBlock:",  v48,  v49,  v87);

  id v50 = objc_loadWeakRetained(&location);
  unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue([v50 stateMachine]);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_1000D7114;
  v85[3] = &unk_100268B58;
  objc_copyWeak(&v86, &location);
  [v51 registerHandlerForEvent:@"Finger rested on left" onState:@"Rest mode" withBlock:v85];

  id v52 = objc_loadWeakRetained(&location);
  id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 stateMachine]);
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472LL;
  v83[2] = sub_1000D7204;
  v83[3] = &unk_100268B58;
  objc_copyWeak(&v84, &location);
  [v53 registerHandlerForEvent:@"Finger rested on left" onState:@"Active mode" withBlock:v83];

  id v54 = objc_loadWeakRetained(&location);
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 stateMachine]);
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_1000D730C;
  v81[3] = &unk_100268B58;
  objc_copyWeak(&v82, &location);
  [v55 registerHandlerForEvent:@"Finger rested on right" onState:@"Rest mode" withBlock:v81];

  id v56 = objc_loadWeakRetained(&location);
  id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 stateMachine]);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_1000D73FC;
  v79[3] = &unk_100268B58;
  objc_copyWeak(&v80, &location);
  [v57 registerHandlerForEvent:@"Finger rested on right" onState:@"Active mode" withBlock:v79];

  id v58 = objc_loadWeakRetained(&location);
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v58 stateMachine]);
  v147[0] = @"Rest mode";
  v147[1] = @"Active mode";
  double v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v147, 2LL));
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_1000D7504;
  v77[3] = &unk_100268B58;
  objc_copyWeak(&v78, &location);
  [v59 registerHandlerForEvent:@"Finger rest lifted" onStates:v60 withBlock:v77];

  id v61 = self->_stateMachine;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_1000D7598;
  v75[3] = &unk_100268B58;
  objc_copyWeak(&v76, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v61,  "registerHandlerForEvent:onState:withBlock:",  @"Finger rested in center",  @"Rest mode",  v75);
  id v62 = objc_loadWeakRetained(&location);
  unsigned int v63 = (void *)objc_claimAutoreleasedReturnValue([v62 stateMachine]);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_1000D7634;
  v73[3] = &unk_100268B58;
  objc_copyWeak(&v74, &location);
  [v63 registerHandlerForEvent:@"Finger rested in center" onState:@"Active mode" withBlock:v73];

  id v64 = self->_stateMachine;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_1000D76E0;
  v71[3] = &unk_100268B58;
  objc_copyWeak(&v72, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v64,  "registerHandlerForEvent:onState:withBlock:",  @"Force rest mode",  @"Active mode",  v71);
  id v65 = self->_stateMachine;
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_1000D7794;
  v69[3] = &unk_100268B58;
  objc_copyWeak(&v70, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v65,  "registerHandlerForEvent:onState:withBlock:",  @"Force active mode",  @"Rest mode",  v69);
  objc_destroyWeak(&v70);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&v76);
  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);
  objc_destroyWeak(&v82);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&v92);

  objc_destroyWeak(&v95);
  objc_destroyWeak(&v98);
  objc_destroyWeak(&v100);

  objc_destroyWeak(&v103);
  objc_destroyWeak(&v106);
  objc_destroyWeak(&v108);

  objc_destroyWeak(&v111);
  objc_destroyWeak(&v113);
  objc_destroyWeak(&v117);
  objc_destroyWeak(&v119);
  objc_destroyWeak(&v121);
  objc_destroyWeak(&v123);
  objc_destroyWeak(&v125);
  objc_destroyWeak(&v127);
  objc_destroyWeak(&v129);
  objc_destroyWeak(&v131);
  objc_destroyWeak(&v133);
  objc_destroyWeak(&v135);

  objc_destroyWeak(&v141);
  objc_destroyWeak(&v143);

  objc_destroyWeak(&v145);
  objc_destroyWeak(&location);
}

- (TVMusicPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (BOOL)isRadioPlayback
{
  return self->_isRadioPlayback;
}

- (BOOL)popWhenPlayerStops
{
  return self->_popWhenPlayerStops;
}

- (void)setPopWhenPlayerStops:(BOOL)a3
{
  self->_popWhenPlayerStops = a3;
}

- (BOOL)singleCoverOnly
{
  return self->_singleCoverOnly;
}

- (void)setSingleCoverOnly:(BOOL)a3
{
  self->_singleCoverOnlCGFloat y = a3;
}

- (TVPPlaybackViewControllerDelegate)playbackDelegate
{
  return (TVPPlaybackViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_playbackDelegate);
}

- (void)setPlaybackDelegate:(id)a3
{
}

- (BOOL)showAnimatedBackground
{
  return self->_showAnimatedBackground;
}

- (void)setShowAnimatedBackground:(BOOL)a3
{
  self->_showAnimatedBackground = a3;
}

- (TVPMusicNowPlayingBackgroundProvider)customBackgroundProvider
{
  return self->_customBackgroundProvider;
}

- (void)setCustomBackgroundProvider:(id)a3
{
}

- (int64_t)initialViewMode
{
  return self->_initialViewMode;
}

- (void)setInitialViewMode:(int64_t)a3
{
  self->_initialViewMode = a3;
}

- (MPAVRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (void)setEndpointRoute:(id)a3
{
}

- (_TVMusicNowPlayingInvalidationContext)invalidationContext
{
  return self->_invalidationContext;
}

- (void)setInvalidationContext:(id)a3
{
}

- (TVMusicNowPlayingViewPresentation)viewPresentation
{
  return self->_viewPresentation;
}

- (void)setViewPresentation:(id)a3
{
}

- (BOOL)scrollWithPlayingItem
{
  return self->_scrollWithPlayingItem;
}

- (void)setScrollWithPlayingItem:(BOOL)a3
{
  self->_scrollWithPlayingItem = a3;
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (UIFocusGuide)transportBarFocusGuide
{
  return self->_transportBarFocusGuide;
}

- (void)setTransportBarFocusGuide:(id)a3
{
}

- (TVMusicAudioTransportBarView)transportBar
{
  return self->_transportBar;
}

- (void)setTransportBar:(id)a3
{
}

- (UIView)controlsShadowView
{
  return self->_controlsShadowView;
}

- (void)setControlsShadowView:(id)a3
{
}

- (UIView)songInfoViewContainer
{
  return self->_songInfoViewContainer;
}

- (void)setSongInfoViewContainer:(id)a3
{
}

- (TVMNowPlayingCompactMetadataView)songInfoView
{
  return self->_songInfoView;
}

- (void)setSongInfoView:(id)a3
{
}

- (NSLayoutConstraint)songInfoViewBottomConstraint
{
  return self->_songInfoViewBottomConstraint;
}

- (void)setSongInfoViewBottomConstraint:(id)a3
{
}

- (UIView)vocalsMessageView
{
  return self->_vocalsMessageView;
}

- (void)setVocalsMessageView:(id)a3
{
}

- (TVMusicPlaybackProgressAnimator)playbackProgressAnimator
{
  return self->_playbackProgressAnimator;
}

- (void)setPlaybackProgressAnimator:(id)a3
{
}

- (TVMusicDefiniteDurationPlaybackProgress)definiteDurationPlaybackProgress
{
  return self->_definiteDurationPlaybackProgress;
}

- (void)setDefiniteDurationPlaybackProgress:(id)a3
{
}

- (id)elapsedTimeToken
{
  return self->_elapsedTimeToken;
}

- (void)setElapsedTimeToken:(id)a3
{
}

- (double)lastKnownElapsedTime
{
  return self->_lastKnownElapsedTime;
}

- (void)setLastKnownElapsedTime:(double)a3
{
  self->_lastKnownElapsedTime = a3;
}

- (NSDate)lastObserverFireDate
{
  return self->_lastObserverFireDate;
}

- (void)setLastObserverFireDate:(id)a3
{
}

- (BOOL)isTransportBarVisible
{
  return self->_transportBarVisible;
}

- (double)playlistExitTime
{
  return self->_playlistExitTime;
}

- (void)setPlaylistExitTime:(double)a3
{
  self->_playlistExitTime = a3;
}

- (double)songInfoTimeout
{
  return self->_songInfoTimeout;
}

- (void)setSongInfoTimeout:(double)a3
{
  self->_songInfoTimeout = a3;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (NSIndexPath)centerIndexPath
{
  return self->_centerIndexPath;
}

- (NSIndexPath)lastFocusedIndexPath
{
  return self->_lastFocusedIndexPath;
}

- (void)setLastFocusedIndexPath:(id)a3
{
}

- (NSIndexPath)initialIndexPath
{
  return self->_initialIndexPath;
}

- (void)setInitialIndexPath:(id)a3
{
}

- (double)initialScrubPercentage
{
  return self->_initialScrubPercentage;
}

- (void)setInitialScrubPercentage:(double)a3
{
  self->_initialScrubPercentage = a3;
}

- (UIScrollView)scrubScrollView
{
  return self->_scrubScrollView;
}

- (void)setScrubScrollView:(id)a3
{
}

- (double)scrubPercentage
{
  return self->_scrubPercentage;
}

- (void)setScrubPercentage:(double)a3
{
  self->_scrubPercentage = a3;
}

- (BOOL)scrubWasDecelerating
{
  return self->_scrubWasDecelerating;
}

- (void)setScrubWasDecelerating:(BOOL)a3
{
  self->_scrubWasDecelerating = a3;
}

- (TVMusicScrubbingConfiguration)scrubbingConfiguration
{
  return self->_scrubbingConfiguration;
}

- (void)setScrubbingConfiguration:(id)a3
{
}

- (BOOL)waitingForPlayerJump
{
  return self->_waitingForPlayerJump;
}

- (void)setWaitingForPlayerJump:(BOOL)a3
{
  self->_waitingForPlayerJump = a3;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (BOOL)isViewSeen
{
  return self->_viewSeen;
}

- (void)setViewSeen:(BOOL)a3
{
  self->_viewSeen = a3;
}

- (TVPHardwareButtonEventManager)buttonEventManager
{
  return self->_buttonEventManager;
}

- (void)setButtonEventManager:(id)a3
{
}

- (_TVMusicNowPlayingSelectedItemCoordinator)selectedItemCoordinator
{
  return self->_selectedItemCoordinator;
}

- (void)setSelectedItemCoordinator:(id)a3
{
}

- (BOOL)keepTransportBarVisible
{
  return self->_keepTransportBarVisible;
}

- (void)setKeepTransportBarVisible:(BOOL)a3
{
  self->_keepTransportBarVisible = a3;
}

- (BOOL)isShowingIdleViewController
{
  return self->_showingIdleViewController;
}

- (void)setShowingIdleViewController:(BOOL)a3
{
  self->_showingIdleViewController = a3;
}

- (UIViewController)idleViewController
{
  return self->_idleViewController;
}

- (void)setIdleViewController:(id)a3
{
}

- (_TVMusicNowPlayingIdleViewControllerContext)idleViewControllerContext
{
  return self->_idleViewControllerContext;
}

- (void)setIdleViewControllerContext:(id)a3
{
}

- (TVMusicBarsView)musicBarsView
{
  return self->_musicBarsView;
}

- (BOOL)isDismissingVideoView
{
  return self->_dismissingVideoView;
}

- (void)setDismissingVideoView:(BOOL)a3
{
  self->_dismissingVideoView = a3;
}

- (void)setVideoPlayerViewController:(id)a3
{
}

- (void)setEmbeddedVideoView:(id)a3
{
}

- (UIView)videoDimmingView
{
  return self->_videoDimmingView;
}

- (void)setVideoDimmingView:(id)a3
{
}

- (UIViewPropertyAnimator)videoPresentAnimator
{
  return self->_videoPresentAnimator;
}

- (void)setVideoPresentAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)videoDismissAnimator
{
  return self->_videoDismissAnimator;
}

- (void)setVideoDismissAnimator:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (TVMusicNowPlayingContentView)singleCoverView
{
  return self->_singleCoverView;
}

- (void)setSingleCoverView:(id)a3
{
}

- (UIContextMenuInteraction)singleCoverContextMenuInteraction
{
  return self->_singleCoverContextMenuInteraction;
}

- (void)setSingleCoverContextMenuInteraction:(id)a3
{
}

- (UIViewPropertyAnimator)singleCoverViewAnimator
{
  return self->_singleCoverViewAnimator;
}

- (void)setSingleCoverViewAnimator:(id)a3
{
}

- (TVMusicMPObjectMediaItem)singleCoverMediaItem
{
  return self->_singleCoverMediaItem;
}

- (_TtC7TVMusic35TVMusicNowPlayingPlayerControlsView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
}

- (BOOL)isShowingModalPopup
{
  return self->_isShowingModalPopup;
}

- (void)setIsShowingModalPopup:(BOOL)a3
{
  self->_isShowingModalPopup = a3;
}

- (UIView)lastFocusedControl
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_lastFocusedControl);
}

- (void)setLastFocusedControl:(id)a3
{
}

- (int64_t)nowPlayingOptions
{
  return self->_nowPlayingOptions;
}

- (void)setNowPlayingOptions:(int64_t)a3
{
  self->_nowPlayingOptions = a3;
}

- (BOOL)isRestMode
{
  return self->_isRestMode;
}

- (void)setIsRestMode:(BOOL)a3
{
  self->_isRestMode = a3;
}

- (TVMusicNowPlayingContentView)partyStudioArtworkTransitionView
{
  return self->_partyStudioArtworkTransitionView;
}

- (void)setPartyStudioArtworkTransitionView:(id)a3
{
}

- (NSArray)partyStudioAnimators
{
  return self->_partyStudioAnimators;
}

- (void)setPartyStudioAnimators:(id)a3
{
}

- (BSInvalidatable)partyStudioIdleTimerAssertion
{
  return self->_partyStudioIdleTimerAssertion;
}

- (void)setPartyStudioIdleTimerAssertion:(id)a3
{
}

- (NSCache)motionArtworkCache
{
  return self->_motionArtworkCache;
}

- (void)setMotionArtworkCache:(id)a3
{
}

- (NSMapTable)motionArtworkTable
{
  return self->_motionArtworkTable;
}

- (void)setMotionArtworkTable:(id)a3
{
}

- (double)lastKnownPlaylistCollectionViewWidth
{
  return self->_lastKnownPlaylistCollectionViewWidth;
}

- (void)setLastKnownPlaylistCollectionViewWidth:(double)a3
{
  self->_double lastKnownPlaylistCollectionViewWidth = a3;
}

- (TVMusicUltrawideScreenManager)ultrawideScreenManager
{
  return self->_ultrawideScreenManager;
}

- (void)setUltrawideScreenManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end