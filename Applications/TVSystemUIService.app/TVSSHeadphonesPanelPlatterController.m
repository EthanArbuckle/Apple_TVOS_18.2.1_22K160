@interface TVSSHeadphonesPanelPlatterController
- (BOOL)_bothHeadsetsSupportSpatialWhileSharing;
- (BOOL)_currentAppCanBeIneligibleForSpatialization;
- (BOOL)_currentAppSupportsHeadTracking;
- (BOOL)_currentAppSupportsSpatial;
- (BOOL)_currentAudioContentInfoEligibleForSpatialization;
- (BOOL)_currentModeAllowsSpatialAudio;
- (BOOL)_deviceSupportsSpatial;
- (BOOL)_headTrackingCurrentlySupported;
- (BOOL)_headTrackingDisabled;
- (BOOL)_resolvedSpatialAudioModeIsFixed;
- (BOOL)_resolvedSpatialAudioModeIsHeadTracked;
- (BOOL)_resolvedSpatialAudioModeIsOff;
- (BOOL)_shouldShowSeparateBatteryPercentagesForBatteryLevel:(id)a3;
- (BOOL)_spatialAndHeadTrackingEnabled;
- (BOOL)_spatialEnabledGlobally;
- (BOOL)_spatialFixedEnabled;
- (BOOL)_spatialUnavailable;
- (BOOL)_spatializeStereoEnabledForHeadphone:(id)a3;
- (BOOL)_splitterPreventingSpatial;
- (BOOL)_splitterSpatialActive;
- (BOOL)didPerformShareAudio;
- (MRNowPlayingAudioFormatController)audioFormatController;
- (PBSSuppressHeadphoneBulletinAssertion)suppressBulletinAssertion;
- (PBSVolumeButtonEventAssertion)volumeButtonAssertion;
- (PBSVolumeHUDAssertion)volumeHUDAssertion;
- (TVCSAudioRoute)focusedVolumeRoute;
- (TVCSAudioRoute)primaryRoute;
- (TVCSAudioRoute)secondaryRoute;
- (TVCSAudioRoutingController)routingController;
- (TVSSAudioNowPlayingController)audioNowPlayingController;
- (TVSSHeadphonesController)headphonesController;
- (TVSSHeadphonesPanelPlatterController)initWithAudioNowPlayingController:(id)a3 menuModeController:(id)a4 headphonesController:(id)a5;
- (TVSSMenuModeController)menuModeController;
- (id)_currentAppBundleID;
- (id)_headTrackingRendererForHeadphone:(id)a3;
- (id)_hierarchicalColorsForMenuOffPersonSymbol;
- (id)_localizedValueForCurrentSpatialState;
- (id)_localizedValueForCurrentSpatializeStereoState;
- (id)_localizedValueFromConversationDetectState:(BOOL)a3;
- (id)_localizedValueFromListeningMode:(int64_t)a3;
- (id)_noiseControlRendererForIdentifier:(id)a3;
- (id)_packageNameForCurrentSpatialState;
- (id)_packageNameForCurrentSpatializeStereoState;
- (id)_packageNameForListeningMode:(int64_t)a3;
- (id)_resolvedAudioFormat;
- (id)_routeFromItemIdentifier:(id)a3;
- (id)_speechDetectRendererForIdentifier:(id)a3;
- (id)_symbolForBatteryLevel:(id)a3;
- (id)_systemImageForListeningMode:(int64_t)a3;
- (id)contextMenuConfigurationForRenderer:(id)a3;
- (id)menuForRenderer:(id)a3;
- (void)_platterControllerWillDisappear:(BOOL)a3;
- (void)_refreshAudioFormatRenderer;
- (void)_refreshConversationDetectRenderer;
- (void)_refreshHeadTrackingRenderer;
- (void)_refreshHeadphoneSettingsRenderers;
- (void)_refreshNoiseControlRenderers;
- (void)_refreshSpatializeStereoRenderer;
- (void)_refreshVolumeRenderers;
- (void)_setHeadTrackingEnabledOnBothHeadsets:(BOOL)a3;
- (void)_setSpatialAudioModeOnBothHeadsets:(int64_t)a3;
- (void)_toggleSpatializeStereoForBothHeadsets;
- (void)_toggleSpatializeStereoForHeadphone:(id)a3;
- (void)_updateContent:(id)a3 withBatteryLevel:(id)a4;
- (void)_updateListeningModeForHeadphone:(id)a3 listeningMode:(int64_t)a4;
- (void)_updatePanelAnimated:(BOOL)a3;
- (void)_updateSpatialModeForHeadphone:(id)a3 spatialMode:(int64_t)a4 headTrackingEnabled:(BOOL)a5;
- (void)_willDisplayRendererHostingView:(id)a3;
- (void)accessorySettingsChanged:(id)a3;
- (void)audioRoutingController:(id)a3 didUpdateAvailableRoutes:(id)a4;
- (void)audioRoutingController:(id)a3 routeDidUpdate:(id)a4 withChangedProperties:(id)a5;
- (void)dealloc;
- (void)didPressMute:(id)a3;
- (void)handleVolumeDown;
- (void)handleVolumeUp;
- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4;
- (void)platterControllerDidActivate;
- (void)rendererGainedFocus:(id)a3;
- (void)rendererLostFocus:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)rendererWasUpdated:(id)a3;
- (void)setAudioFormatController:(id)a3;
- (void)setAudioNowPlayingController:(id)a3;
- (void)setDidPerformShareAudio:(BOOL)a3;
- (void)setFocusedVolumeRoute:(id)a3;
- (void)setHeadphonesController:(id)a3;
- (void)setMenuModeController:(id)a3;
- (void)setPrimaryRoute:(id)a3;
- (void)setRoutingController:(id)a3;
- (void)setSecondaryRoute:(id)a3;
- (void)setVolumeButtonAssertion:(id)a3;
- (void)setVolumeHUDAssertion:(id)a3;
- (void)shareAudioDidComplete:(BOOL)a3;
@end

@implementation TVSSHeadphonesPanelPlatterController

- (TVSSHeadphonesPanelPlatterController)initWithAudioNowPlayingController:(id)a3 menuModeController:(id)a4 headphonesController:(id)a5
{
  id v58 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v56 = 0LL;
  objc_storeStrong(&v56, a4);
  id v55 = 0LL;
  objc_storeStrong(&v55, a5);
  v42 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"separator",  19LL,  0LL);
  v63[0] = v42;
  v41 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"separator2",  19LL,  0LL);
  v63[1] = v41;
  id v40 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  id v39 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:", 1LL);
  v61[0] = v39;
  id v38 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
  v61[1] = v38;
  id v37 =  +[TVSPLayerAttribute minificationFilter:]( &OBJC_CLASS___TVSPLayerAttribute,  "minificationFilter:",  kCAFilterTrilinear);
  v61[2] = v37;
  v36 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 3LL);
  v35 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v40);
  v62 = v35;
  v34 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL);
  uint64_t v59 = TVSPRendererOptionImageWidth;
  v60 = &off_1001C8C00;
  v33 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL);
  v32 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:optionsDict:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:optionsDict:",  @"spatialaudio",  3LL,  0LL,  v34);
  v63[2] = v32;
  id v54 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 3LL);

  id v31 = v58;
  id v30 = +[TVSPLayout placeholderLayoutWithHeight:](&OBJC_CLASS___TVSPLayout, "placeholderLayoutWithHeight:", 300.0);
  id v58 = 0LL;
  v53.receiver = v31;
  v53.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesPanelPlatterController;
  id v58 = -[TVSSHeadphonesPanelPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v53,  "initWithIdentifier:layout:renderers:rendererProvider:",  @"com.apple.TVSystemUIService.headphones.item");
  objc_storeStrong(&v58, v58);

  if (v58)
  {
    v29 = -[TVCSAudioRoutingController initWithOptions:filter:sortDescriptors:]( objc_alloc(&OBJC_CLASS___TVCSAudioRoutingController),  "initWithOptions:filter:sortDescriptors:",  11LL,  &stru_1001BA630,  0LL);
    v5 = (void *)*((void *)v58 + 2);
    *((void *)v58 + 2) = v29;

    [*((id *)v58 + 2) addObserver:v58];
    v28 = objc_alloc_init(&OBJC_CLASS___MRNowPlayingAudioFormatController);
    v6 = (void *)*((void *)v58 + 3);
    *((void *)v58 + 3) = v28;

    [*((id *)v58 + 3) setDelegate:v58];
    objc_storeStrong((id *)v58 + 9, location[0]);
    objc_storeStrong((id *)v58 + 10, v56);
    objc_storeStrong((id *)v58 + 11, v55);
    v27 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v27,  "addObserver:selector:name:object:",  v58,  "accessorySettingsChanged:",  BluetoothAccessorySettingsChanged,  0LL);

    v26 = objc_alloc(&OBJC_CLASS___PBSVolumeButtonEventAssertion);
    aClass = (objc_class *)objc_opt_class(v58);
    v23 = NSStringFromClass(aClass);
    v24 = -[PBSVolumeButtonEventAssertion initWithIdentifier:](v26, "initWithIdentifier:");
    v7 = (void *)*((void *)v58 + 6);
    *((void *)v58 + 6) = v24;

    v22 = objc_alloc(&OBJC_CLASS___PBSVolumeHUDAssertion);
    v21 = (objc_class *)objc_opt_class(v58);
    v19 = NSStringFromClass(v21);
    v20 = -[PBSVolumeHUDAssertion initWithIdentifier:](v22, "initWithIdentifier:");
    v8 = (void *)*((void *)v58 + 7);
    *((void *)v58 + 7) = v20;

    v18 = objc_alloc(&OBJC_CLASS___PBSSuppressHeadphoneBulletinAssertion);
    v17 = (objc_class *)objc_opt_class(v58);
    v15 = NSStringFromClass(v17);
    v16 = -[PBSSuppressHeadphoneBulletinAssertion initWithIdentifier:](v18, "initWithIdentifier:");
    v9 = (void *)*((void *)v58 + 12);
    *((void *)v58 + 12) = v16;

    [*((id *)v58 + 12) acquire];
    v14 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v14,  "addObserver:selector:name:object:",  v58,  "handleVolumeUp",  _UIApplicationVolumeUpButtonUpNotification,  0LL);

    v13 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v13,  "addObserver:selector:name:object:",  v58,  "handleVolumeDown",  _UIApplicationVolumeDownButtonUpNotification,  0LL);

    objc_initWeak(&from, v58);
    id v12 = v58;
    v45 = _NSConcreteStackBlock;
    int v46 = -1073741824;
    int v47 = 0;
    v48 = sub_1000D4DC0;
    v49 = &unk_1001BA658;
    objc_copyWeak(&v51, &from);
    id v50 = v55;
    [v12 setRendererProvider:&v45];
    objc_storeStrong(&v50, 0LL);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&from);
  }

  v11 = (TVSSHeadphonesPanelPlatterController *)v58;
  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(&v55, 0LL);
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v58, 0LL);
  return v11;
}

- (void)dealloc
{
  v7 = self;
  SEL v6 = a2;
  -[PBSVolumeButtonEventAssertion relinquish](self->_volumeButtonAssertion, "relinquish");
  -[PBSVolumeHUDAssertion relinquish](v7->_volumeHUDAssertion, "relinquish");
  -[PBSSuppressHeadphoneBulletinAssertion relinquish](v7->_suppressBulletinAssertion, "relinquish");
  v2 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v2,  "removeObserver:name:object:",  v7,  BluetoothAccessorySettingsChanged);

  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  v7,  _UIApplicationVolumeUpButtonUpNotification,  0LL);

  v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v4,  "removeObserver:name:object:",  v7,  _UIApplicationVolumeDownButtonUpNotification,  0LL);

  v5.receiver = v7;
  v5.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesPanelPlatterController;
  -[TVSSHeadphonesPanelPlatterController dealloc](&v5, "dealloc");
}

- (void)platterControllerDidActivate
{
  v4 = self;
  v3[1] = (id)a2;
  -[PBSVolumeHUDAssertion acquire](self->_volumeHUDAssertion, "acquire");
  v3[0] = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "didPressMute:");
  [v3[0] setAllowedPressTypes:&off_1001C8738];
  id v2 = -[TVSSHeadphonesPanelPlatterController contentView](v4, "contentView");
  [v2 addGestureRecognizer:v3[0]];

  objc_storeStrong(v3, 0LL);
}

- (void)_platterControllerWillDisappear:(BOOL)a3
{
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  v17.receiver = v20;
  v17.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesPanelPlatterController;
  -[TVSSHeadphonesPanelPlatterController rendererWasSelected:context:]( &v17,  "rendererWasSelected:context:",  location[0],  v18);
  id v16 = [location[0] identifier];
  if ([v16 isEqualToString:@"speechdetectA"])
  {
    id v15 = -[TVSSHeadphonesPanelPlatterController _routeFromItemIdentifier:](v20, "_routeFromItemIdentifier:", v16);
    id v9 = [v15 headphoneConfiguration];
    unsigned __int8 v10 = [v9 conversationDetectEnabled];

    char v14 = v10 & 1;
    id v11 = [v15 headphoneConfiguration];
    [v11 setConversationDetectEnabled:!(v10 & 1)];

    -[TVSSHeadphonesPanelPlatterController _refreshConversationDetectRenderer]( v20,  "_refreshConversationDetectRenderer");
    objc_storeStrong(&v15, 0LL);
  }

  else if ([v16 isEqualToString:@"shareaudio"])
  {
    v13 = objc_alloc_init(&OBJC_CLASS___TVSSShareAudioPanelPlatterController);
    -[TVSSShareAudioPanelPlatterController setShareAudioDelegate:](v13, "setShareAudioDelegate:", v20);
    id v7 = v18;
    SEL v6 = v13;
    id v8 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    objc_msgSend(v7, "pushPlatterController:animator:sourceIdentifier:", v6);

    objc_storeStrong((id *)&v13, 0LL);
  }

  else if ([v16 isEqualToString:@"spatializestereo"])
  {
    if (-[TVSSHeadphonesPanelPlatterController _splitterSpatialActive](v20, "_splitterSpatialActive"))
    {
      -[TVSSHeadphonesPanelPlatterController _toggleSpatializeStereoForBothHeadsets]( v20,  "_toggleSpatializeStereoForBothHeadsets");
    }

    else
    {
      v4 = v20;
      objc_super v5 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v20, "primaryRoute");
      -[TVSSHeadphonesPanelPlatterController _toggleSpatializeStereoForHeadphone:]( v4,  "_toggleSpatializeStereoForHeadphone:");
    }
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)rendererGainedFocus:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = [location[0] identifier];
  id v5 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSHeadphonesSettingRenderer);
  if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
  {
    [location[0] setIsFocused:1];
  }

  else if (([v11 isEqualToString:@"volumeA"] & 1) != 0 {
         || ([v11 isEqualToString:@"volumeB"] & 1) != 0)
  }
  {
    char v8 = 0;
    char v6 = 0;
    if ([v11 isEqualToString:@"volumeA"])
    {
      id v9 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v13, "primaryRoute");
      char v8 = 1;
      v4 = v9;
    }

    else
    {
      id v7 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v13, "secondaryRoute");
      char v6 = 1;
      v4 = v7;
    }

    unsigned __int8 v10 = v4;
    if ((v6 & 1) != 0) {

    }
    if ((v8 & 1) != 0) {
    objc_storeStrong((id *)&v13->_focusedVolumeRoute, v10);
    }
    -[PBSVolumeButtonEventAssertion acquire](v13->_volumeButtonAssertion, "acquire");
    objc_storeStrong((id *)&v10, 0LL);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)rendererLostFocus:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = [location[0] identifier];
  id v4 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSHeadphonesSettingRenderer);
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
  {
    [location[0] setIsFocused:0];
  }

  else if (([v5 isEqualToString:@"volumeA"] & 1) != 0 {
         || ([v5 isEqualToString:@"volumeB"] & 1) != 0)
  }
  {
    objc_storeStrong((id *)&v7->_focusedVolumeRoute, 0LL);
    -[PBSVolumeButtonEventAssertion relinquish](v7->_volumeButtonAssertion, "relinquish");
  }

  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)contextMenuConfigurationForRenderer:(id)a3
{
  objc_super v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = [location[0] identifier];
  if (([v15 isEqualToString:@"noisecontrolA"] & 1) != 0
    || ([v15 isEqualToString:@"noisecontrolB"] & 1) != 0
    || ([v15 containsString:@"headtracking"] & 1) != 0)
  {
    id v14 = -[TVSSHeadphonesPanelPlatterController _routeFromItemIdentifier:](v17, "_routeFromItemIdentifier:", v15);
    id v4 = [v14 headphoneConfiguration];
    id v5 = [v4 listeningMode];

    v13[1] = v5;
    objc_initWeak(v13, v17);
    char v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_1000D6620;
    unsigned __int8 v10 = &unk_1001BA680;
    objc_copyWeak(&v12, v13);
    id v11 = location[0];
    id v18 =  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  &v6);
    objc_storeStrong(&v11, 0LL);
    objc_destroyWeak(&v12);
    objc_destroyWeak(v13);
    objc_storeStrong(&v14, 0LL);
  }

  else
  {
    id v18 = 0LL;
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v18;
}

- (id)menuForRenderer:(id)a3
{
  v78 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v76 = [location[0] identifier];
  if (([v76 isEqualToString:@"noisecontrolA"] & 1) != 0
    || ([v76 isEqualToString:@"noisecontrolB"] & 1) != 0)
  {
    id v75 = -[TVSSHeadphonesPanelPlatterController _routeFromItemIdentifier:](v78, "_routeFromItemIdentifier:", v76);
    id v27 = [v75 headphoneConfiguration];
    id v28 = [v27 listeningMode];

    id v74 = v28;
    v73 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    memset(__b, 0, sizeof(__b));
    id v29 = [v75 headphoneConfiguration];
    id obj = [v29 availableListeningModes];

    id v31 = [obj countByEnumeratingWithState:__b objects:v82 count:16];
    if (v31)
    {
      uint64_t v24 = *(void *)__b[2];
      uint64_t v25 = 0LL;
      id v26 = v31;
      while (1)
      {
        uint64_t v23 = v25;
        if (*(void *)__b[2] != v24) {
          objc_enumerationMutation(obj);
        }
        id v72 = *(id *)(__b[1] + 8 * v25);
        id v70 = [v72 integerValue];
        id v22 =  -[TVSSHeadphonesPanelPlatterController _localizedValueFromListeningMode:]( v78,  "_localizedValueFromListeningMode:",  v70);
        id v21 =  -[TVSSHeadphonesPanelPlatterController _systemImageForListeningMode:]( v78,  "_systemImageForListeningMode:",  v70);
        v62[1] = _NSConcreteStackBlock;
        int v63 = -1073741824;
        int v64 = 0;
        v65 = sub_1000D71C4;
        v66 = &unk_1001BA6A8;
        v67 = v78;
        v68[0] = v75;
        v68[1] = v70;
        v69 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v22,  v21);

        -[UIAction setState:](v69, "setState:", v74 == v70);
        -[NSMutableArray addObject:](v73, "addObject:", v69);
        objc_storeStrong((id *)&v69, 0LL);
        objc_storeStrong(v68, 0LL);
        objc_storeStrong((id *)&v67, 0LL);
        ++v25;
        if (v23 + 1 >= (unint64_t)v26)
        {
          uint64_t v25 = 0LL;
          id v26 = [obj countByEnumeratingWithState:__b objects:v82 count:16];
          if (!v26) {
            break;
          }
        }
      }
    }

    v62[0] =  +[UIMenu menuWithTitle:image:identifier:options:children:]( &OBJC_CLASS___UIMenu,  "menuWithTitle:image:identifier:options:children:",  &stru_1001BDAC8,  0LL,  0LL,  32LL,  v73);
    id v79 = v62[0];
    int v61 = 1;
    objc_storeStrong(v62, 0LL);
    objc_storeStrong((id *)&v73, 0LL);
    objc_storeStrong(&v75, 0LL);
  }

  else
  {
    id v19 = [location[0] identifier];
    unsigned __int8 v20 = [v19 containsString:@"headtracking"];

    if ((v20 & 1) != 0)
    {
      id v18 = -[TVSSHeadphonesPanelPlatterController routingController](v78, "routingController");
      id v17 = -[TVCSAudioRoutingController availableRoutes](v18, "availableRoutes");
      id v60 = [v17 firstObject];

      char v59 = 0;
      char v58 = 0;
      BOOL v57 = 0;
      if (-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsOff](v78, "_resolvedSpatialAudioModeIsOff"))
      {
        char v59 = 1;
      }

      else if (-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsFixed]( v78,  "_resolvedSpatialAudioModeIsFixed"))
      {
        char v58 = 1;
      }

      else
      {
        BOOL v57 = -[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsHeadTracked]( v78,  "_resolvedSpatialAudioModeIsHeadTracked");
      }

      id v9 = TVSSLocString(@"TVSSHeadphonesHeadTrackedTitle");
      int v8 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"person.headtrack.fill");
      v49[1] = _NSConcreteStackBlock;
      int v50 = -1073741824;
      int v51 = 0;
      v52 = sub_1000D7228;
      objc_super v53 = &unk_1001BA6D0;
      id v54 = v78;
      id v55 = v60;
      id v56 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v9,  v8);

      [v56 setState:v57];
      id v11 = TVSSLocString(@"TVSSHeadphonesFixedTitle");
      id v10 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:");
      v42 = _NSConcreteStackBlock;
      int v43 = -1073741824;
      int v44 = 0;
      v45 = sub_1000D7294;
      int v46 = &unk_1001BA6D0;
      int v47 = v78;
      id v48 = v60;
      v49[0] =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v11,  v10,  0LL,  &v42);

      [v49[0] setState:(v58 & 1) != 0];
      id v16 = TVSSLocString(@"TVSSHeadphonesHeadTrackingOffTitle");
      id v15 =  +[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"person.spatialaudio.fill");
      id v14 =  -[TVSSHeadphonesPanelPlatterController _hierarchicalColorsForMenuOffPersonSymbol]( v78,  "_hierarchicalColorsForMenuOffPersonSymbol");
      id v13 =  +[UIImageSymbolConfiguration _configurationWithHierarchicalColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "_configurationWithHierarchicalColors:");
      id v12 = objc_msgSend(v15, "imageWithSymbolConfiguration:");
      v34 = _NSConcreteStackBlock;
      int v35 = -1073741824;
      int v36 = 0;
      id v37 = sub_1000D7300;
      id v38 = &unk_1001BA6D0;
      id v39 = v78;
      id v40 = v60;
      id v41 =  +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v16,  v12,  0LL,  &v34);

      [v41 setState:(v59 & 1) != 0];
      id v33 = 0LL;
      if (!-[TVSSHeadphonesPanelPlatterController _headTrackingDisabled](v78, "_headTrackingDisabled")
        && -[TVSSHeadphonesPanelPlatterController _headTrackingCurrentlySupported]( v78,  "_headTrackingCurrentlySupported"))
      {
        v80[0] = v56;
        v80[1] = v49[0];
        v80[2] = v41;
        id v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v80, 3LL);
        id v6 = v33;
        id v33 = v5;
      }

      else
      {
        v81[0] = v49[0];
        v81[1] = v41;
        uint64_t v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 2LL);
        id v4 = v33;
        id v33 = v3;
      }

      id v32 =  +[UIMenu menuWithTitle:image:identifier:options:children:]( &OBJC_CLASS___UIMenu,  "menuWithTitle:image:identifier:options:children:",  &stru_1001BDAC8,  0LL,  0LL,  32LL,  v33);
      id v79 = v32;
      int v61 = 1;
      objc_storeStrong(&v32, 0LL);
      objc_storeStrong(&v33, 0LL);
      objc_storeStrong(&v41, 0LL);
      objc_storeStrong(&v40, 0LL);
      objc_storeStrong((id *)&v39, 0LL);
      objc_storeStrong(v49, 0LL);
      objc_storeStrong(&v48, 0LL);
      objc_storeStrong((id *)&v47, 0LL);
      objc_storeStrong(&v56, 0LL);
      objc_storeStrong(&v55, 0LL);
      objc_storeStrong((id *)&v54, 0LL);
      objc_storeStrong(&v60, 0LL);
    }

    else
    {
      id v79 = 0LL;
      int v61 = 1;
    }
  }

  objc_storeStrong(&v76, 0LL);
  objc_storeStrong(location, 0LL);
  return v79;
}

- (void)rendererWasUpdated:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = [location[0] identifier];
  if (([v12 isEqualToString:@"volumeA"] & 1) != 0
    || ([v12 isEqualToString:@"volumeB"] & 1) != 0)
  {
    char v9 = 0;
    char v7 = 0;
    if ([v12 isEqualToString:@"volumeA"])
    {
      id v10 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v14, "primaryRoute");
      char v9 = 1;
      uint64_t v3 = v10;
    }

    else
    {
      int v8 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v14, "secondaryRoute");
      char v7 = 1;
      uint64_t v3 = v8;
    }

    id v11 = v3;
    if ((v7 & 1) != 0) {

    }
    if ((v9 & 1) != 0) {
    id v6 = [location[0] content];
    }
    id v5 = -[TVCSAudioRoute volume](v11, "volume");
    id v4 = [v6 contentPercentage];
    objc_msgSend(v5, "setVolumeLevel:");

    objc_storeStrong(&v6, 0LL);
    objc_storeStrong((id *)&v11, 0LL);
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_willDisplayRendererHostingView:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = [location[0] identifier];
  id v11 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v16, "secondaryRoute");
  id v13 = -[TVCSAudioRoute routeUID](v11, "routeUID");
  unsigned __int8 v14 = 0;

  if ((v14 & 1) != 0)
  {
    -[TVSSHeadphonesPanelPlatterController setDidPerformShareAudio:](v16, "setDidPerformShareAudio:", 0LL);
    char v9 = -[TVSSHeadphonesPanelPlatterController headphonesController](v16, "headphonesController");
    unsigned __int8 v10 = -[TVSSHeadphonesController allowHeadphoneMoviesToPlay](v9, "allowHeadphoneMoviesToPlay");

    if ((v10 & 1) != 0)
    {
LABEL_5:
      -[TVSSHeadphonesController playHeadphoneMovies](v16->_headphonesController, "playHeadphoneMovies");
      goto LABEL_12;
    }

- (void)handleVolumeUp
{
  unsigned int v8 = self;
  location[1] = (id)a2;
  id v6 = -[TVCSAudioRoute volume](self->_focusedVolumeRoute, "volume");
  location[0] = [v6 volumeLevel];

  [location[0] floatValue];
  if (v2 + 0.0625 >= 1.0) {
    double v5 = 1.0;
  }
  else {
    double v5 = v2 + 0.0625;
  }
  id v4 = -[TVCSAudioRoute volume](v8->_focusedVolumeRoute, "volume");
  uint64_t v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5);
  objc_msgSend(v4, "setVolumeLevel:");

  objc_storeStrong(location, 0LL);
}

- (void)handleVolumeDown
{
  unsigned int v8 = self;
  location[1] = (id)a2;
  id v6 = -[TVCSAudioRoute volume](self->_focusedVolumeRoute, "volume");
  location[0] = [v6 volumeLevel];

  [location[0] floatValue];
  if (v2 - 0.0625 >= 0.0) {
    double v5 = v2 - 0.0625;
  }
  else {
    double v5 = 0.0;
  }
  id v4 = -[TVCSAudioRoute volume](v8->_focusedVolumeRoute, "volume");
  uint64_t v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5);
  objc_msgSend(v4, "setVolumeLevel:");

  objc_storeStrong(location, 0LL);
}

- (void)didPressMute:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (id)3)
  {
    id v3 = -[TVCSAudioRoute volume](v7->_focusedVolumeRoute, "volume");
    unsigned __int8 v4 = [v3 isMuted];

    id v5 = -[TVCSAudioRoute volume](v7->_focusedVolumeRoute, "volume");
    [v5 setMuted:!(v4 & 1)];
  }

  objc_storeStrong(location, 0LL);
}

- (void)audioRoutingController:(id)a3 didUpdateAvailableRoutes:(id)a4
{
  unsigned __int8 v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = sub_1000D7C84;
  unsigned __int8 v10 = &unk_1001B5A60;
  id v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)audioRoutingController:(id)a3 routeDidUpdate:(id)a4 withChangedProperties:(id)a5
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  if ([v15 count])
  {
    queue = &_dispatch_main_q;
    int v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = sub_1000D7E14;
    id v12 = &unk_1001B61C0;
    id v13 = v18;
    id v14 = v15;
    dispatch_async(queue, &v8);

    objc_storeStrong(&v14, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSHeadphonesPanelPlatterController _refreshAudioFormatRenderer](v7, "_refreshAudioFormatRenderer");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)shareAudioDidComplete:(BOOL)a3
{
  if (a3) {
    -[TVSSHeadphonesPanelPlatterController setDidPerformShareAudio:](self, "setDidPerformShareAudio:", 1LL);
  }
}

- (void)accessorySettingsChanged:(id)a3
{
  unsigned __int8 v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSHeadphonesPanelPlatterController _refreshHeadphoneSettingsRenderers](v4, "_refreshHeadphoneSettingsRenderers");
  objc_storeStrong(location, 0LL);
}

- (void)_updatePanelAnimated:(BOOL)a3
{
  int v63 = self;
  SEL v62 = a2;
  BOOL v61 = a3;
  v42 = -[TVSSHeadphonesPanelPlatterController routingController](self, "routingController");
  id v60 = -[TVCSAudioRoutingController availableRoutes](v42, "availableRoutes");

  if ([v60 count])
  {
    char v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    BOOL v57 = (unint64_t)[v60 count] > 1;
    if (v57)
    {
      id v40 = [v60 firstObject];
      -[TVSSHeadphonesPanelPlatterController setPrimaryRoute:](v63, "setPrimaryRoute:");

      id v41 = [v60 lastObject];
      -[TVSSHeadphonesPanelPlatterController setSecondaryRoute:](v63, "setSecondaryRoute:");
    }

    else
    {
      id v39 = [v60 firstObject];
      -[TVSSHeadphonesPanelPlatterController setPrimaryRoute:](v63, "setPrimaryRoute:");
    }

    int v36 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v63, "primaryRoute");
    id v56 = -[TVCSAudioRoute routeUID](v36, "routeUID");

    id v37 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v63, "secondaryRoute");
    id v55 = -[TVCSAudioRoute routeUID](v37, "routeUID");

    id v38 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", v56);
    -[NSMutableArray addObject:](v58, "addObject:");

    if (v57)
    {
      +[TVSPConstants volumeControlRowHeight](&OBJC_CLASS___TVSPConstants, "volumeControlRowHeight");
      v34 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"volumeA");
      -[NSMutableArray addObject:](v58, "addObject:");

      id v35 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
      -[NSMutableArray addObject:](v58, "addObject:");
    }

    else
    {
      id v32 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
      -[NSMutableArray addObject:](v58, "addObject:");

      id v33 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
      -[NSMutableArray addObject:](v58, "addObject:");
    }

    id v30 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v63, "primaryRoute");
    id v29 = -[TVCSAudioRoute headphoneConfiguration](v30, "headphoneConfiguration");
    unsigned __int8 v31 = [v29 noiseControlSupported];

    if ((v31 & 1) != 0)
    {
      id v28 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"noisecontrolA");
      -[NSMutableArray addObject:](v58, "addObject:");
    }

    char v53 = 0;
    char v51 = 0;
    unsigned __int8 v27 = 0;
    if (!v57)
    {
      id v54 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v63, "primaryRoute");
      char v53 = 1;
      id v52 = -[TVCSAudioRoute headphoneConfiguration](v54, "headphoneConfiguration");
      char v51 = 1;
      unsigned __int8 v27 = [v52 conversationDetectSupported];
    }

    if ((v51 & 1) != 0) {

    }
    if ((v53 & 1) != 0) {
    if ((v27 & 1) != 0)
    }
    {
      id v26 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"speechdetectA");
      -[NSMutableArray addObject:](v58, "addObject:");
    }

    if (v57)
    {
      id v17 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
      -[NSMutableArray addObject:](v58, "addObject:");

      id v18 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
      -[NSMutableArray addObject:](v58, "addObject:");

      id v19 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
      -[NSMutableArray addObject:](v58, "addObject:");

      unsigned __int8 v20 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", v55);
      -[NSMutableArray addObject:](v58, "addObject:");

      +[TVSPConstants volumeControlRowHeight](&OBJC_CLASS___TVSPConstants, "volumeControlRowHeight");
      id v21 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", @"volumeB");
      -[NSMutableArray addObject:](v58, "addObject:");

      id v22 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
      -[NSMutableArray addObject:](v58, "addObject:");

      uint64_t v24 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v63, "secondaryRoute");
      id v23 = -[TVCSAudioRoute headphoneConfiguration](v24, "headphoneConfiguration");
      unsigned __int8 v25 = [v23 noiseControlSupported];

      if ((v25 & 1) != 0)
      {
        id v16 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"noisecontrolB");
        -[NSMutableArray addObject:](v58, "addObject:");
      }

      id v15 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
      -[NSMutableArray addObject:](v58, "addObject:");
    }

    char v49 = 0;
    char v47 = 0;
    LOBYTE(v14) = 0;
    if (-[TVSSHeadphonesPanelPlatterController _deviceSupportsSpatial](v63, "_deviceSupportsSpatial"))
    {
      int v50 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v63, "primaryRoute");
      char v49 = 1;
      id v48 = -[TVCSAudioRoute headphoneConfiguration](v50, "headphoneConfiguration");
      char v47 = 1;
      LOBYTE(v14) = 0;
    }

    if ((v47 & 1) != 0) {

    }
    if ((v49 & 1) != 0) {
    if ((v14 & 1) != 0)
    }
    {
      if (v57)
      {
        id v13 =  +[TVSPRow separatorWithIdentifier:]( &OBJC_CLASS___TVSPRow,  "separatorWithIdentifier:",  @"separator2");
        -[NSMutableArray addObject:](v58, "addObject:");
      }

      +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
      id v8 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
      -[NSMutableArray addObject:](v58, "addObject:");

      int v9 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"spatialaudio");
      -[NSMutableArray addObject:](v58, "addObject:");

      +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
      id v10 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
      -[NSMutableArray addObject:](v58, "addObject:");

      id v11 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"headtracking");
      -[NSMutableArray addObject:](v58, "addObject:");

      id v12 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"spatializestereo");
      -[NSMutableArray addObject:](v58, "addObject:");
    }

    char v45 = 0;
    unsigned __int8 v7 = 0;
    if (!v57)
    {
      int v46 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v63, "primaryRoute");
      char v45 = 1;
      unsigned __int8 v7 = -[TVCSAudioRoute supportsWirelessSplitter](v46, "supportsWirelessSplitter");
    }

    if ((v45 & 1) != 0) {

    }
    if ((v7 & 1) != 0)
    {
      id v5 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", 24.0);
      -[NSMutableArray addObject:](v58, "addObject:");

      id v6 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"shareaudio");
      -[NSMutableArray addObject:](v58, "addObject:");
    }

    id v3 = v58;
    id v4 = -[TVSSHeadphonesPanelPlatterController renderers](v63, "renderers");
    int v44 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v3);

    id v43 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
    -[TVSSHeadphonesPanelPlatterController applyLayout:animator:](v63, "applyLayout:animator:", v44, v43);
    -[TVSSHeadphonesPanelPlatterController reloadContent](v63, "reloadContent");
    -[TVSSHeadphonesPanelPlatterController _updatePlatterSizeWithAnimator:](v63, "_updatePlatterSizeWithAnimator:", v43);
    objc_storeStrong(&v43, 0LL);
    objc_storeStrong((id *)&v44, 0LL);
    objc_storeStrong(&v55, 0LL);
    objc_storeStrong(&v56, 0LL);
    objc_storeStrong((id *)&v58, 0LL);
    int v59 = 0;
  }

  else
  {
    int v59 = 1;
  }

  objc_storeStrong(&v60, 0LL);
}

- (void)_refreshHeadphoneSettingsRenderers
{
}

- (void)_refreshNoiseControlRenderers
{
  unsigned __int8 v25 = self;
  v24[1] = (id)a2;
  id v18 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  v24[0] = -[TVCSAudioRoute headphoneConfiguration](v18, "headphoneConfiguration");

  if ([v24[0] noiseControlSupported])
  {
    id v23 = [v24[0] listeningMode];
    id v28 = @"noisecontrolA";
    id v15 = TVSSLocString(@"TVSSHeadphonesNoiseControlTitle");
    id v14 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.fill");
    id v13 =  -[TVSSHeadphonesPanelPlatterController _localizedValueFromListeningMode:]( v25,  "_localizedValueFromListeningMode:",  v23);
    id v12 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v15,  v14);
    id v29 = v12;
    id v11 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
    -[TVSSHeadphonesPanelPlatterController applyContent:](v25, "applyContent:");

    id v22 =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v25,  "rendererForIdentifier:",  @"noisecontrolA");
    id v16 = v22;
    id v17 =  -[TVSSHeadphonesPanelPlatterController _packageNameForListeningMode:]( v25,  "_packageNameForListeningMode:",  v23);
    objc_msgSend(v16, "setPackageName:");

    [v22 setDisplayAsOff:v23 == (id)1];
    objc_storeStrong(&v22, 0LL);
  }

  id v10 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v25, "secondaryRoute");
  id v21 = -[TVCSAudioRoute headphoneConfiguration](v10, "headphoneConfiguration");

  if ([v21 noiseControlSupported])
  {
    id v20 = [v21 listeningMode];
    float v2 = v25;
    id v26 = @"noisecontrolB";
    id v7 = TVSSLocString(@"TVSSHeadphonesNoiseControlTitle");
    id v6 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.fill");
    id v5 =  -[TVSSHeadphonesPanelPlatterController _localizedValueFromListeningMode:]( v25,  "_localizedValueFromListeningMode:",  v20);
    id v4 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v7,  v6);
    unsigned __int8 v27 = v4;
    id v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL);
    -[TVSSHeadphonesPanelPlatterController applyContent:](v2, "applyContent:");

    id v19 =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v25,  "rendererForIdentifier:",  @"noisecontrolB");
    id v8 = v19;
    id v9 =  -[TVSSHeadphonesPanelPlatterController _packageNameForListeningMode:]( v25,  "_packageNameForListeningMode:",  v20);
    objc_msgSend(v8, "setPackageName:");

    [v19 setDisplayAsOff:v20 == (id)1];
    objc_storeStrong(&v19, 0LL);
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(v24, 0LL);
}

- (void)_refreshConversationDetectRenderer
{
  id v16 = self;
  SEL v15 = a2;
  id v3 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v2 = -[TVCSAudioRoute headphoneConfiguration](v3, "headphoneConfiguration");
  unsigned __int8 v4 = [v2 conversationDetectEnabled];

  char v14 = v4 & 1;
  id v17 = @"speechdetectA";
  id v9 = TVSSLocString(@"TVSSHeadphonesDetectSpeechTitle");
  id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.wave.2.fill");
  id v7 =  -[TVSSHeadphonesPanelPlatterController _localizedValueFromConversationDetectState:]( v16,  "_localizedValueFromConversationDetectState:",  v4 & 1);
  id v6 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v9,  v8);
  id v18 = v6;
  id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL);
  -[TVSSHeadphonesPanelPlatterController applyContent:](v16, "applyContent:");

  id v13 =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v16,  "rendererForIdentifier:",  @"speechdetectA");
  id v10 = v13;
  id v12 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v16, "primaryRoute");
  id v11 = -[TVCSAudioRoute headphoneConfiguration](v12, "headphoneConfiguration");
  objc_msgSend(v10, "setDisplayAsOff:", (objc_msgSend(v11, "conversationDetectEnabled") ^ 1) & 1);

  objc_storeStrong(&v13, 0LL);
}

- (void)_refreshAudioFormatRenderer
{
  int v36 = self;
  v35[1] = (id)a2;
  id v2 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  BOOL v18 = v2 == 0LL;

  if (!v18)
  {
    v35[0] = 0LL;
    id v34 = TVSSLocString(@"TVSSHeadphonesSpatialAudioSectionTitle");
    if (-[TVSSHeadphonesPanelPlatterController _currentAppSupportsSpatial](v36, "_currentAppSupportsSpatial"))
    {
      id v33 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v36, "_currentAppBundleID");
      char v31 = 0;
      char v29 = 0;
      char v27 = 0;
      BOOL v17 = 0;
      if ([v33 length])
      {
        id v32 = +[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance");
        char v31 = 1;
        id v30 = -[PBSAppInfoController appInfos](v32, "appInfos");
        char v29 = 1;
        id v28 = [v30 objectForKeyedSubscript:v33];
        char v27 = 1;
        BOOL v17 = v28 != 0LL;
      }

      if ((v27 & 1) != 0) {

      }
      if ((v29 & 1) != 0) {
      if ((v31 & 1) != 0)
      }

      if (v17)
      {
        id v26 = [[ISIcon alloc] initWithBundleIdentifier:v33];
        id v16 = objc_alloc(&OBJC_CLASS___ISImageDescriptor);
        sub_1000D9888();
        double v23 = v3;
        double v24 = v4;
        id v25 = [v16 initWithSize:v3 scale:v4];
        id v5 = [v26 prepareImageForDescriptor:v25];
        id v22 = [v26 CGImageForDescriptor:v25];
        id v6 = -[UIImage initWithCGImage:scale:orientation:]( objc_alloc(&OBJC_CLASS___UIImage),  "initWithCGImage:scale:orientation:",  v22,  0LL,  2.0);
        id v7 = v35[0];
        v35[0] = v6;

        objc_storeStrong(&v25, 0LL);
        objc_storeStrong(&v26, 0LL);
      }

      id v8 = -[TVSSHeadphonesPanelPlatterController _resolvedAudioFormat](v36, "_resolvedAudioFormat");
      id v9 = v34;
      id v34 = v8;

      objc_storeStrong(&v33, 0LL);
    }

    id v13 = v36;
    id v37 = @"spatialaudio";
    SEL v15 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v34, v35[0]);
    id v38 = v15;
    char v14 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL);
    -[TVSSHeadphonesPanelPlatterController applyContent:](v13, "applyContent:");

    for (char i = 1; (i & 1) != 0; char i = 0)
    {
      id v20 =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v36,  "rendererForIdentifier:",  @"spatialaudio");
      while (1)
      {
        char v12 = 0;
        if (v20) {
          char v12 = i;
        }
        if ((v12 & 1) == 0) {
          break;
        }
        char v19 = -[TVSSHeadphonesPanelPlatterController _spatialUnavailable](v36, "_spatialUnavailable");
        id v10 = v20;
        id v11 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
        objc_msgSend(v10, "setIsDisabled:animator:", v19 & 1);

        char i = 0;
      }

      objc_storeStrong(&v20, 0LL);
    }

    objc_storeStrong(&v34, 0LL);
    objc_storeStrong(v35, 0LL);
  }

- (void)_refreshHeadTrackingRenderer
{
  SEL v15 = self;
  SEL v14 = a2;
  char v13 = -[TVSSHeadphonesPanelPlatterController _spatialUnavailable](self, "_spatialUnavailable");
  id v16 = @"headtracking";
  id v9 = TVSSLocString(@"TVSSHeadphonesSpatialAudioTitle");
  id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.fill");
  id v7 =  -[TVSSHeadphonesPanelPlatterController _localizedValueForCurrentSpatialState]( v15,  "_localizedValueForCurrentSpatialState");
  id v6 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v9,  v8);
  BOOL v17 = v6;
  id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL);
  -[TVSSHeadphonesPanelPlatterController applyContent:](v15, "applyContent:");

  id v12 =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v15,  "rendererForIdentifier:",  @"headtracking");
  id v10 =  -[TVSSHeadphonesPanelPlatterController _packageNameForCurrentSpatialState]( v15,  "_packageNameForCurrentSpatialState");
  objc_msgSend(v12, "setPackageName:");

  LOBYTE(v11) = 0;
  if (!-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsHeadTracked]( v15,  "_resolvedSpatialAudioModeIsHeadTracked")) {
    unsigned int v11 = !-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsFixed]( v15,  "_resolvedSpatialAudioModeIsFixed");
  }
  [v12 setDisplayAsOff:v11 & 1];
  id v3 = v12;
  char v2 = v13;
  id v4 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  objc_msgSend(v3, "setIsDisabled:animator:", v2 & 1);

  objc_storeStrong(&v12, 0LL);
}

- (void)_refreshSpatializeStereoRenderer
{
  id v16 = self;
  SEL v15 = a2;
  char v14 = -[TVSSHeadphonesPanelPlatterController _spatialUnavailable](self, "_spatialUnavailable");
  char v13 = -[TVSSHeadphonesPanelPlatterController _currentModeAllowsSpatialAudio](v16, "_currentModeAllowsSpatialAudio");
  BOOL v17 = @"spatializestereo";
  id v8 = TVSSLocString(@"TVSSHeadphonesSpatializeStereoTitle");
  id v7 =  +[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"person.spatialaudio.stereo.fill");
  id v6 =  -[TVSSHeadphonesPanelPlatterController _localizedValueForCurrentSpatializeStereoState]( v16,  "_localizedValueForCurrentSpatializeStereoState");
  id v5 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v8,  v7);
  BOOL v18 = v5;
  id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL);
  -[TVSSHeadphonesPanelPlatterController applyContent:](v16, "applyContent:");

  id location =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v16,  "rendererForIdentifier:",  @"spatializestereo");
  id v9 =  -[TVSSHeadphonesPanelPlatterController _packageNameForCurrentSpatializeStereoState]( v16,  "_packageNameForCurrentSpatializeStereoState");
  objc_msgSend(location, "setPackageName:");

  id v10 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v16, "primaryRoute");
  char v11 = 1;
  if (-[TVSSHeadphonesPanelPlatterController _spatializeStereoEnabledForHeadphone:]( v16,  "_spatializeStereoEnabledForHeadphone:"))
  {
    char v11 = 1;
    if (-[TVSSHeadphonesPanelPlatterController _currentAppSupportsSpatial](v16, "_currentAppSupportsSpatial")) {
      char v11 = v14;
    }
  }

  [location setDisplayAsOff:v11 & 1];

  char v3 = 1;
  if ((v14 & 1) == 0) {
    char v3 = v13 ^ 1;
  }
  id v2 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
  objc_msgSend(location, "setIsDisabled:animator:", v3 & 1);

  objc_storeStrong(&location, 0LL);
}

- (void)_refreshVolumeRenderers
{
  char v27 = self;
  SEL v26 = a2;
  for (char i = 1; (i & 1) != 0; char i = 0)
  {
    id v21 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v27, "primaryRoute");
    id v20 = -[TVCSAudioRoute volume](v21, "volume");
    id location = [v20 volumeLevel];

    while (1)
    {
      char v19 = 0;
      if (location) {
        char v19 = i;
      }
      if ((v19 & 1) == 0) {
        break;
      }
      id v12 = v27;
      id v34 = @"volumeA";
      id v17 = +[TVSPIdentifiers percentageID](&OBJC_CLASS___TVSPIdentifiers, "percentageID");
      id v32 = v17;
      id v33 = location;
      id v16 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32);
      SEL v15 = +[TVSPContent contentWithDictionary:](&OBJC_CLASS___TVSPContent, "contentWithDictionary:");
      id v35 = v15;
      char v14 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL);
      id v13 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
      -[TVSSHeadphonesPanelPlatterController applyContent:animator:](v12, "applyContent:animator:", v14);

      id v18 =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v27,  "rendererForIdentifier:",  @"volumeA");
      [v18 contentDidChange];

      char i = 0;
    }

    objc_storeStrong(&location, 0LL);
  }

  for (char j = 1; (j & 1) != 0; char j = 0)
  {
    char v11 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v27, "secondaryRoute");
    id v10 = -[TVCSAudioRoute volume](v11, "volume");
    id v22 = [v10 volumeLevel];

    while (1)
    {
      char v9 = 0;
      if (v22) {
        char v9 = j;
      }
      if ((v9 & 1) == 0) {
        break;
      }
      id v2 = v27;
      id v30 = @"volumeB";
      id v7 = +[TVSPIdentifiers percentageID](&OBJC_CLASS___TVSPIdentifiers, "percentageID");
      id v28 = v7;
      id v29 = v22;
      id v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28);
      id v5 = +[TVSPContent contentWithDictionary:](&OBJC_CLASS___TVSPContent, "contentWithDictionary:");
      char v31 = v5;
      id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
      id v3 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
      -[TVSSHeadphonesPanelPlatterController applyContent:animator:](v2, "applyContent:animator:", v4);

      id v8 =  -[TVSSHeadphonesPanelPlatterController rendererForIdentifier:]( v27,  "rendererForIdentifier:",  @"volumeB");
      [v8 contentDidChange];

      char j = 0;
    }

    objc_storeStrong(&v22, 0LL);
  }

- (void)_updateContent:(id)a3 withBatteryLevel:(id)a4
{
  char v53 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v51 = 0LL;
  objc_storeStrong(&v51, a4);
  id v50 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  [v50 setNumberStyle:3];
  [v50 setUsesSignificantDigits:0];
  [v50 setUsesGroupingSeparator:0];
  id v41 = [v51 leftPercentage];
  char v48 = 0;
  BOOL v42 = 0;
  if (v41)
  {
    id v49 = [v51 rightPercentage];
    char v48 = 1;
    BOOL v42 = v49 != 0LL;
  }

  if ((v48 & 1) != 0) {

  }
  if (v42)
  {
    if (-[TVSSHeadphonesPanelPlatterController _shouldShowSeparateBatteryPercentagesForBatteryLevel:]( v53,  "_shouldShowSeparateBatteryPercentagesForBatteryLevel:",  v51))
    {
      id v35 = TVSSLocString(@"TVSSHeadphonesLeftBatteryFormat");
      id v34 = [v51 leftPercentage];
      id v33 = objc_msgSend(v50, "stringFromNumber:");
      id v32 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v35, v33);
      objc_msgSend(location[0], "setContentText2:");

      id v39 = TVSSLocString(@"TVSSHeadphonesRightBatteryFormat");
      id v38 = [v51 rightPercentage];
      id v37 = objc_msgSend(v50, "stringFromNumber:");
      int v36 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v39, v37);
      objc_msgSend(location[0], "setContentText3:");
    }

    else
    {
      id v29 = [v51 leftPercentage];
      [v29 floatValue];
      float v31 = v4;
      id v30 = [v51 rightPercentage];
      [v30 floatValue];
      float v5 = *(float *)&v6;
      *(float *)&double v6 = v31;
      char v45 = 0;
      char v43 = 0;
      if (v31 >= v5)
      {
        id v44 = objc_msgSend(v51, "rightPercentage", v6);
        char v43 = 1;
        id v7 = v44;
      }

      else
      {
        id v46 = objc_msgSend(v51, "leftPercentage", v6);
        char v45 = 1;
        id v7 = v46;
      }

      id v47 = v7;
      if ((v43 & 1) != 0) {

      }
      if ((v45 & 1) != 0) {
      id v27 = [v50 stringFromNumber:v47];
      }
      objc_msgSend(location[0], "setContentText1:");

      id v28 = -[TVSSHeadphonesPanelPlatterController _symbolForBatteryLevel:](v53, "_symbolForBatteryLevel:", v47);
      objc_msgSend(location[0], "setContentImage1:");

      objc_storeStrong(&v47, 0LL);
    }
  }

  else
  {
    id v8 = [v51 leftPercentage];
    BOOL v26 = v8 == 0LL;

    if (v26)
    {
      id v9 = [v51 rightPercentage];
      BOOL v21 = v9 == 0LL;

      if (v21)
      {
        id v10 = [v51 singlePercentage];
        BOOL v16 = v10 == 0LL;

        if (!v16)
        {
          id v12 = [v51 singlePercentage];
          id v11 = objc_msgSend(v50, "stringFromNumber:");
          objc_msgSend(location[0], "setContentText1:");

          id v13 = v53;
          id v15 = [v51 singlePercentage];
          id v14 = -[TVSSHeadphonesPanelPlatterController _symbolForBatteryLevel:](v13, "_symbolForBatteryLevel:");
          objc_msgSend(location[0], "setContentImage1:");
        }
      }

      else
      {
        id v20 = TVSSLocString(@"TVSSHeadphonesRightBatteryFormat");
        id v19 = [v51 rightPercentage];
        id v18 = objc_msgSend(v50, "stringFromNumber:");
        id v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, v18);
        objc_msgSend(location[0], "setContentText2:");
      }
    }

    else
    {
      id v25 = TVSSLocString(@"TVSSHeadphonesLeftBatteryFormat");
      id v24 = [v51 leftPercentage];
      id v23 = objc_msgSend(v50, "stringFromNumber:");
      id v22 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v25, v23);
      objc_msgSend(location[0], "setContentText2:");
    }
  }

  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_noiseControlRendererForIdentifier:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 =  -[TVSSHeadphonesPanelPlatterController _routeFromItemIdentifier:]( v19,  "_routeFromItemIdentifier:",  location[0]);
  id v4 = [v17 headphoneConfiguration];
  id v5 = [v4 listeningMode];

  id v16 = v5;
  id v7 = objc_alloc(&OBJC_CLASS___TVSSHeadphonesSettingRenderer);
  id v6 = location[0];
  id v11 = TVSSLocString(@"TVSSHeadphonesNoiseControlTitle");
  id v10 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.fill");
  id v9 =  -[TVSSHeadphonesPanelPlatterController _localizedValueFromListeningMode:]( v19,  "_localizedValueFromListeningMode:",  v5);
  id v8 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v11,  v10);
  id v15 = -[TVSSHeadphonesSettingRenderer initWithIdentifier:format:content:overrideStylings:]( v7,  "initWithIdentifier:format:content:overrideStylings:",  v6,  16LL);

  id v12 = v15;
  id v13 =  -[TVSSHeadphonesPanelPlatterController _packageNameForListeningMode:]( v19,  "_packageNameForListeningMode:",  v16);
  -[TVSSHeadphonesSettingRenderer setPackageName:](v12, "setPackageName:");

  -[TVSSHeadphonesSettingRenderer setDisplayAsOff:](v15, "setDisplayAsOff:", v16 == (id)1);
  id v14 = v15;
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v14;
}

- (id)_speechDetectRendererForIdentifier:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 =  -[TVSSHeadphonesPanelPlatterController _routeFromItemIdentifier:]( v17,  "_routeFromItemIdentifier:",  location[0]);
  id v5 = location[0];
  id v10 = TVSSLocString(@"TVSSHeadphonesDetectSpeechTitle");
  id v9 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.wave.2.fill");
  id v4 = v17;
  id v8 = [v15 headphoneConfiguration];
  id v7 =  -[TVSSHeadphonesPanelPlatterController _localizedValueFromConversationDetectState:]( v4,  "_localizedValueFromConversationDetectState:",  (unint64_t)[v8 conversationDetectEnabled] & 1);
  id v6 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v10,  v9);
  id v14 =  +[TVSSHeadphonesSettingRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSHeadphonesSettingRenderer,  "rendererWithIdentifier:format:content:",  v5,  16LL);

  id v11 = v14;
  id v12 = [v15 headphoneConfiguration];
  -[TVSSHeadphonesSettingRenderer setDisplayAsOff:]( v11,  "setDisplayAsOff:",  ([v12 conversationDetectEnabled] ^ 1) & 1);

  id v13 = v14;
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v13;
}

- (id)_headTrackingRendererForHeadphone:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v16 = -[TVSSHeadphonesPanelPlatterController _spatialUnavailable](v18, "_spatialUnavailable");
  id v8 = objc_alloc(&OBJC_CLASS___TVSSHeadphonesSettingRenderer);
  id v12 = TVSSLocString(@"TVSSHeadphonesSpatialAudioTitle");
  id v11 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"person.fill");
  id v10 =  -[TVSSHeadphonesPanelPlatterController _localizedValueForCurrentSpatialState]( v18,  "_localizedValueForCurrentSpatialState");
  id v9 =  +[TVSPContent contentWithTitle:image:text1:]( &OBJC_CLASS___TVSPContent,  "contentWithTitle:image:text1:",  v12,  v11);
  id v15 = -[TVSSHeadphonesSettingRenderer initWithIdentifier:format:content:overrideStylings:]( v8,  "initWithIdentifier:format:content:overrideStylings:",  @"headtracking",  16LL);

  id v13 =  -[TVSSHeadphonesPanelPlatterController _packageNameForCurrentSpatialState]( v18,  "_packageNameForCurrentSpatialState");
  -[TVSSHeadphonesSettingRenderer setPackageName:](v15, "setPackageName:");

  LOBYTE(v14) = 0;
  if (!-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsHeadTracked]( v18,  "_resolvedSpatialAudioModeIsHeadTracked")) {
    unsigned int v14 = !-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsFixed]( v18,  "_resolvedSpatialAudioModeIsFixed");
  }
  -[TVSSHeadphonesSettingRenderer setDisplayAsOff:](v15, "setDisplayAsOff:", v14 & 1);
  id v5 = v15;
  char v4 = v16;
  id v6 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSHeadphonesSettingRenderer setIsDisabled:animator:](v5, "setIsDisabled:animator:", v4 & 1);

  id v7 = v15;
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)_updateListeningModeForHeadphone:(id)a3 listeningMode:(int64_t)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = [location[0] headphoneConfiguration];
  [v5 setListeningMode:a4];

  -[TVSSHeadphonesPanelPlatterController _refreshNoiseControlRenderers](v7, "_refreshNoiseControlRenderers");
  objc_storeStrong(location, 0LL);
}

- (void)_updateSpatialModeForHeadphone:(id)a3 spatialMode:(int64_t)a4 headTrackingEnabled:(BOOL)a5
{
  unsigned int v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (-[TVSSHeadphonesPanelPlatterController _splitterSpatialActive](v14, "_splitterSpatialActive"))
  {
    -[TVSSHeadphonesPanelPlatterController _setSpatialAudioModeOnBothHeadsets:]( v14,  "_setSpatialAudioModeOnBothHeadsets:",  a4);
    if (a4) {
      -[TVSSHeadphonesPanelPlatterController _setHeadTrackingEnabledOnBothHeadsets:]( v14,  "_setHeadTrackingEnabledOnBothHeadsets:",  a5);
    }
  }

  else
  {
    id v7 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v14, "primaryRoute");
    id v6 = -[TVCSAudioRoute headphoneConfiguration](v7, "headphoneConfiguration");
    id v5 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v14, "_currentAppBundleID");
    objc_msgSend(v6, "setSpatialAudioMode:forBundleID:", a4);

    id v10 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v14, "primaryRoute");
    id v9 = -[TVCSAudioRoute headphoneConfiguration](v10, "headphoneConfiguration");
    id v8 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v14, "_currentAppBundleID");
    objc_msgSend(v9, "setHeadTrackingEnabled:forBundleID:", a5);
  }

  -[TVSSHeadphonesPanelPlatterController _refreshHeadTrackingRenderer](v14, "_refreshHeadTrackingRenderer");
  -[TVSSHeadphonesPanelPlatterController _refreshSpatializeStereoRenderer](v14, "_refreshSpatializeStereoRenderer");
  objc_storeStrong(location, 0LL);
}

- (void)_toggleSpatializeStereoForHeadphone:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = -[TVSSHeadphonesPanelPlatterController _spatializeStereoEnabledForHeadphone:]( v9,  "_spatializeStereoEnabledForHeadphone:",  location[0]);
  uint64_t v4 = 3LL;
  if ((v3 & 1) == 0) {
    uint64_t v4 = 2LL;
  }
  uint64_t v7 = v4;
  id v6 = [location[0] headphoneConfiguration];
  id v5 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v9, "_currentAppBundleID");
  objc_msgSend(v6, "setSpatialAudioMode:forBundleID:", v7);

  -[TVSSHeadphonesPanelPlatterController _refreshHeadTrackingRenderer](v9, "_refreshHeadTrackingRenderer");
  -[TVSSHeadphonesPanelPlatterController _refreshSpatializeStereoRenderer](v9, "_refreshSpatializeStereoRenderer");
  objc_storeStrong(location, 0LL);
}

- (BOOL)_shouldShowSeparateBatteryPercentagesForBatteryLevel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = [location[0] leftPercentage];
  char v13 = 0;
  char v11 = 0;
  char v9 = 0;
  BOOL v8 = 0;
  if (v7)
  {
    id v14 = [location[0] rightPercentage];
    char v13 = 1;
    BOOL v8 = 0;
    if (v14)
    {
      id v12 = [location[0] leftPercentage];
      char v11 = 1;
      [v12 floatValue];
      float v6 = v3;
      id v10 = [location[0] rightPercentage];
      char v9 = 1;
      [v10 floatValue];
      BOOL v8 = vabds_f32(v6, v4) >= 0.1;
    }
  }

  BOOL v16 = v8;
  if ((v9 & 1) != 0) {

  }
  if ((v11 & 1) != 0) {
  if ((v13 & 1) != 0)
  }

  objc_storeStrong(location, 0LL);
  return v16;
}

- (id)_symbolForBatteryLevel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  [location[0] floatValue];
  float v6 = v3;
  if (v3 > 1.0 || v3 < 0.875)
  {
    if (v3 > 0.874 || v3 < 0.625)
    {
      if (v3 > 0.624 || v3 < 0.375)
      {
        double v4 = v3;
        if (v6 > 0.374 || (double v4 = v6, v6 < 0.125)) {
          id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.0percent", v4);
        }
        else {
          id v8 =  +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"battery.25percent",  v4);
        }
      }

      else
      {
        id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.50percent", v3);
      }
    }

    else
    {
      id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.75percent", v3);
    }
  }

  else
  {
    id v8 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"battery.100percent", v3);
  }

  objc_storeStrong(location, 0LL);
  return v8;
}

- (BOOL)_resolvedSpatialAudioModeIsHeadTracked
{
  return -[TVSSHeadphonesPanelPlatterController _headTrackingCurrentlySupported]( self,  "_headTrackingCurrentlySupported")
      && -[TVSSHeadphonesPanelPlatterController _currentAudioContentInfoEligibleForSpatialization]( self,  "_currentAudioContentInfoEligibleForSpatialization")
      && -[TVSSHeadphonesPanelPlatterController _spatialAndHeadTrackingEnabled](self, "_spatialAndHeadTrackingEnabled");
}

- (BOOL)_resolvedSpatialAudioModeIsFixed
{
  return -[TVSSHeadphonesPanelPlatterController _currentAudioContentInfoEligibleForSpatialization]( self,  "_currentAudioContentInfoEligibleForSpatialization")
      && (-[TVSSHeadphonesPanelPlatterController _spatialAndHeadTrackingEnabled](self, "_spatialAndHeadTrackingEnabled")
       && !-[TVSSHeadphonesPanelPlatterController _headTrackingCurrentlySupported]( self,  "_headTrackingCurrentlySupported")
       || -[TVSSHeadphonesPanelPlatterController _spatialFixedEnabled](self, "_spatialFixedEnabled"));
}

- (BOOL)_resolvedSpatialAudioModeIsOff
{
  return -[TVSSHeadphonesPanelPlatterController _spatialUnavailable](self, "_spatialUnavailable")
      || !-[TVSSHeadphonesPanelPlatterController _currentAudioContentInfoEligibleForSpatialization]( self,  "_currentAudioContentInfoEligibleForSpatialization")
      || !-[TVSSHeadphonesPanelPlatterController _currentModeAllowsSpatialAudio](self, "_currentModeAllowsSpatialAudio");
}

- (BOOL)_currentAppSupportsSpatial
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = &off_1001C8750;
  id v2 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v7, "_currentAppBundleID");
  BOOL v5 = v2 == 0LL;

  if (v5)
  {
    char v8 = 0;
  }

  else
  {
    id v4 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v7, "_currentAppBundleID");
    char v8 = (objc_msgSend(location[0], "containsObject:") ^ 1) & 1;
  }

  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

- (BOOL)_currentAudioContentInfoEligibleForSpatialization
{
  id v10 = self;
  location[1] = (id)a2;
  char v8 = -[TVSSHeadphonesPanelPlatterController audioFormatController](self, "audioFormatController");
  id v7 = -[MRNowPlayingAudioFormatController audioFormatContentInfo](v8, "audioFormatContentInfo");
  location[0] = [v7 bundleID];

  if ([location[0] isEqualToString:@"com.apple.facetime"])
  {
    char v11 = 1;
  }

  else
  {
    id v5 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v10, "_currentAppBundleID");
    unsigned __int8 v6 = objc_msgSend(location[0], "isEqualToString:");

    if ((v6 & 1) != 0)
    {
      id v4 = -[TVSSHeadphonesPanelPlatterController audioFormatController](v10, "audioFormatController");
      id v3 = -[MRNowPlayingAudioFormatController audioFormatContentInfo](v4, "audioFormatContentInfo");
      char v11 = [v3 isEligibleForSpatialization] & 1;
    }

    else
    {
      char v11 = -[TVSSHeadphonesPanelPlatterController _currentAppSupportsSpatial](v10, "_currentAppSupportsSpatial");
    }
  }

  objc_storeStrong(location, 0LL);
  return v11 & 1;
}

- (BOOL)_deviceSupportsSpatial
{
  return MGGetProductType(self, a2) != 1110205732;
}

- (BOOL)_currentAppSupportsHeadTracking
{
  id v3 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  unsigned int v4 = [v3 isEqualToString:@"com.apple.facetime"] ^ 1;

  return v4 & 1;
}

- (BOOL)_headTrackingCurrentlySupported
{
  LOBYTE(v3) = 0;
  if (-[TVSSHeadphonesPanelPlatterController _currentAppSupportsHeadTracking](self, "_currentAppSupportsHeadTracking")) {
    unsigned int v3 = !-[TVSSHeadphonesPanelPlatterController _splitterSpatialActive](self, "_splitterSpatialActive");
  }
  return v3 & 1;
}

- (id)_resolvedAudioFormat
{
  id v14 = self;
  v13[1] = (id)a2;
  v13[0] = TVSSLocString(@"TVSSHeadphonesSpatialStereoAudioFormat");
  char v12 = -[TVSSHeadphonesPanelPlatterController _currentModeAllowsSpatialAudio](v14, "_currentModeAllowsSpatialAudio");
  id v6 =  -[MRNowPlayingAudioFormatController audioFormatContentInfo]( v14->_audioFormatController,  "audioFormatContentInfo");
  id v7 = [v6 bestAvailableAudioFormat];

  uint64_t v11 = (uint64_t)v7;
  id v9 =  -[MRNowPlayingAudioFormatController audioFormatContentInfo]( v14->_audioFormatController,  "audioFormatContentInfo");
  id v8 = [v9 bundleID];
  unsigned __int8 v10 = [v8 isEqualToString:@"com.apple.facetime"];

  if ((v10 & 1) != 0) {
    uint64_t v11 = 1LL;
  }
  if (v11)
  {
    if (v11 == 1)
    {
      if ((v12 & 1) != 0) {
        id v2 = TVSSLocString(@"TVSSHeadphonesSpatialMultichannelAudioFormat");
      }
      else {
        id v2 = TVSSLocString(@"TVSSHeadphonesSpatialMultichannelAvailableFormat");
      }
    }

    else
    {
      if (v11 != 2) {
        goto LABEL_14;
      }
      if ((v12 & 1) != 0) {
        id v2 = TVSSLocString(@"TVSSHeadphonesSpatialDolbyAtmosAudioFormat");
      }
      else {
        id v2 = TVSSLocString(@"TVSSHeadphonesSpatialDolbyAtmosAvailableFormat");
      }
    }

    id v3 = v13[0];
    v13[0] = v2;
  }

- (BOOL)_spatialUnavailable
{
  return !-[TVSSHeadphonesPanelPlatterController _spatialEnabledGlobally](self, "_spatialEnabledGlobally")
      || !-[TVSSHeadphonesPanelPlatterController _currentAudioContentInfoEligibleForSpatialization]( self,  "_currentAudioContentInfoEligibleForSpatialization")
      || -[TVSSHeadphonesPanelPlatterController _splitterPreventingSpatial](self, "_splitterPreventingSpatial");
}

- (BOOL)_headTrackingDisabled
{
  return _AXSSpatialAudioHeadTracking(self, a2) == 0;
}

- (BOOL)_currentAppCanBeIneligibleForSpatialization
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  unsigned int v3 = [v4[0] isEqualToString:@"com.apple.TVMusic"] ^ 1;
  objc_storeStrong(v4, 0LL);
  return v3 & 1;
}

- (BOOL)_spatialEnabledGlobally
{
  id v8 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  char v14 = 0;
  BOOL v9 = 0;
  if (v8)
  {
    id v15 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
    char v14 = 1;
    BOOL v9 = v15 != 0LL;
  }

  if ((v14 & 1) != 0) {

  }
  if (v9)
  {
    id v5 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
    id v6 = -[TVCSAudioRoute headphoneConfiguration](v5, "headphoneConfiguration");
    char v12 = 0;
    char v10 = 0;
    unsigned __int8 v7 = 0;
    if ([v6 spatialAudioAllowed])
    {
      char v13 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
      char v12 = 1;
      id v11 = -[TVCSAudioRoute headphoneConfiguration](v13, "headphoneConfiguration");
      char v10 = 1;
      unsigned __int8 v7 = [v11 spatialAudioAllowed];
    }

    BOOL v17 = v7 & 1;
    if ((v10 & 1) != 0) {

    }
    if ((v12 & 1) != 0) {
  }
    }

  else
  {
    unsigned int v4 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
    id v3 = -[TVCSAudioRoute headphoneConfiguration](v4, "headphoneConfiguration");
    BOOL v17 = [v3 spatialAudioAllowed] & 1;
  }

  return v17;
}

- (id)_currentAppBundleID
{
  char v14 = self;
  location[1] = (id)a2;
  id v11 = -[TVSSHeadphonesPanelPlatterController audioNowPlayingController](self, "audioNowPlayingController");
  char v10 = -[TVSSAudioNowPlayingController nowPlayingState](v11, "nowPlayingState");
  BOOL v12 = (id)-[TVSSNowPlayingState playbackState](v10, "playbackState") != (id)2;

  if (v12)
  {
    id v5 = -[TVSSHeadphonesPanelPlatterController menuModeController](v14, "menuModeController");
    unsigned int v4 = -[TVSSMenuModeController provider](v5, "provider");
    id v3 = -[TVSSMenuModeStateProvider state](v4, "state");
    location[0] = -[TVSSMenuModeState focusedApp](v3, "focusedApp");

    id v6 = [location[0] identifier];
    unsigned __int8 v7 = [v6 isEqualToString:PBSDisplayLayoutElementAirPlayIdentifier];

    if ((v7 & 1) != 0) {
      id v15 = @"com.apple.TVAirPlay";
    }
    else {
      id v15 = (__CFString *)[location[0] bundleIdentifier];
    }
    objc_storeStrong(location, 0LL);
  }

  else
  {
    BOOL v9 = -[TVSSHeadphonesPanelPlatterController audioFormatController](v14, "audioFormatController");
    id v8 = -[MRNowPlayingAudioFormatController audioFormatContentInfo](v9, "audioFormatContentInfo");
    id v15 = (__CFString *)[v8 bundleID];
  }

  return v15;
}

- (BOOL)_currentModeAllowsSpatialAudio
{
  id v5 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v4 = -[TVCSAudioRoute headphoneConfiguration](v5, "headphoneConfiguration");
  id v3 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  id v6 = objc_msgSend(v4, "spatialAudioModeForBundleID:");

  BOOL v7 = 0;
  if (v6) {
    return v6 != (id)4;
  }
  return v7;
}

- (BOOL)_spatialFixedEnabled
{
  if (!-[TVSSHeadphonesPanelPlatterController _currentModeAllowsSpatialAudio](self, "_currentModeAllowsSpatialAudio")) {
    return 0;
  }
  id v3 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v4 = -[TVCSAudioRoute headphoneConfiguration](v3, "headphoneConfiguration");
  id v5 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  unsigned __int8 v6 = 1;
  BOOL v8 = v6 & 1;

  return v8;
}

- (BOOL)_spatialAndHeadTrackingEnabled
{
  if (!-[TVSSHeadphonesPanelPlatterController _currentModeAllowsSpatialAudio](self, "_currentModeAllowsSpatialAudio")) {
    return 0;
  }
  id v3 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v4 = -[TVCSAudioRoute headphoneConfiguration](v3, "headphoneConfiguration");
  id v5 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  LOBYTE(v6) = 0;
  BOOL v8 = v6 & 1;

  return v8;
}

- (BOOL)_spatializeStereoEnabledForHeadphone:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = [location[0] headphoneConfiguration];
  id v8 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v19, "_currentAppBundleID");
  id v10 = objc_msgSend(v9, "spatialAudioModeForBundleID:");

  char v16 = 0;
  unsigned __int8 v11 = 0;
  if (v10 == (id)1)
  {
    id v17 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](v19, "_currentAppBundleID");
    char v16 = 1;
    unsigned __int8 v11 = [v17 isEqualToString:@"com.apple.Fitness"];
  }

  if ((v16 & 1) != 0) {

  }
  if ((v11 & 1) != 0)
  {
    char v20 = 0;
  }

  else if (v10 == (id)1 {
         && -[TVSSHeadphonesPanelPlatterController _currentAudioContentInfoEligibleForSpatialization]( v19,  "_currentAudioContentInfoEligibleForSpatialization"))
  }
  {
    id v5 = -[TVSSHeadphonesPanelPlatterController audioFormatController](v19, "audioFormatController");
    id v6 = -[MRNowPlayingAudioFormatController audioFormatContentInfo](v5, "audioFormatContentInfo");
    char v14 = 0;
    char v12 = 0;
    LOBYTE(v7) = 0;
    if ([v6 isSpatialized])
    {
      id v15 = -[TVSSHeadphonesPanelPlatterController audioFormatController](v19, "audioFormatController");
      char v14 = 1;
      id v13 = -[MRNowPlayingAudioFormatController audioFormatContentInfo](v15, "audioFormatContentInfo");
      char v12 = 1;
      unsigned int v7 = [v13 isMultichannel] ^ 1;
    }

    char v20 = v7 & 1;
    if ((v12 & 1) != 0) {

    }
    if ((v14 & 1) != 0) {
  }
    }

  else
  {
    BOOL v4 = 0;
    if (-[TVSSHeadphonesPanelPlatterController _currentModeAllowsSpatialAudio](v19, "_currentModeAllowsSpatialAudio")) {
      BOOL v4 = v10 != (id)3;
    }
    char v20 = v4;
  }

  objc_storeStrong(location, 0LL);
  return v20 & 1;
}

- (BOOL)_splitterPreventingSpatial
{
  BOOL v4 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  char v6 = 0;
  char v5 = 0;
  if (v4)
  {
    unsigned int v7 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
    char v6 = 1;
    char v5 = 0;
    if (v7)
    {
      LOBYTE(v3) = 1;
      if ((_os_feature_enabled_impl("CoreAudioServices", "SpatialOnAggregateDevices") & 1) != 0) {
        unsigned int v3 = !-[TVSSHeadphonesPanelPlatterController _bothHeadsetsSupportSpatialWhileSharing]( self,  "_bothHeadsetsSupportSpatialWhileSharing");
      }
      char v5 = v3;
    }
  }

  if ((v6 & 1) != 0) {

  }
  return v5 & 1;
}

- (BOOL)_splitterSpatialActive
{
  unsigned int v3 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  char v5 = 0;
  unsigned __int8 v4 = 0;
  if (v3)
  {
    char v6 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
    char v5 = 1;
    unsigned __int8 v4 = 0;
    if (v6)
    {
      unsigned __int8 v4 = 0;
      if ((_os_feature_enabled_impl("CoreAudioServices", "SpatialOnAggregateDevices") & 1) != 0) {
        unsigned __int8 v4 = -[TVSSHeadphonesPanelPlatterController _bothHeadsetsSupportSpatialWhileSharing]( self,  "_bothHeadsetsSupportSpatialWhileSharing");
      }
    }
  }

  if ((v5 & 1) != 0) {

  }
  return v4 & 1;
}

- (BOOL)_bothHeadsetsSupportSpatialWhileSharing
{
  unsigned int v3 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v4 = -[TVCSAudioRoute headphoneConfiguration](v3, "headphoneConfiguration");
  char v8 = 0;
  char v6 = 0;
  unsigned __int8 v5 = 0;
  if ([v4 spatialAudioSupportedWhileSharing])
  {
    id v9 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
    char v8 = 1;
    id v7 = -[TVCSAudioRoute headphoneConfiguration](v9, "headphoneConfiguration");
    char v6 = 1;
    unsigned __int8 v5 = [v7 spatialAudioSupportedWhileSharing];
  }

  if ((v6 & 1) != 0) {

  }
  if ((v8 & 1) != 0) {
  return v5 & 1;
  }
}

- (void)_setSpatialAudioModeOnBothHeadsets:(int64_t)a3
{
  unsigned __int8 v5 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v4 = -[TVCSAudioRoute headphoneConfiguration](v5, "headphoneConfiguration");
  id v3 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  objc_msgSend(v4, "setSpatialAudioMode:forBundleID:", a3);

  char v8 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
  id v7 = -[TVCSAudioRoute headphoneConfiguration](v8, "headphoneConfiguration");
  id v6 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  objc_msgSend(v7, "setSpatialAudioMode:forBundleID:", a3);
}

- (void)_setHeadTrackingEnabledOnBothHeadsets:(BOOL)a3
{
  BOOL v9 = a3;
  unsigned __int8 v5 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v4 = -[TVCSAudioRoute headphoneConfiguration](v5, "headphoneConfiguration");
  id v3 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  objc_msgSend(v4, "setHeadTrackingEnabled:forBundleID:", v9);

  char v8 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
  id v7 = -[TVCSAudioRoute headphoneConfiguration](v8, "headphoneConfiguration");
  id v6 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  objc_msgSend(v7, "setHeadTrackingEnabled:forBundleID:", v9);
}

- (void)_toggleSpatializeStereoForBothHeadsets
{
  unsigned __int8 v5 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v4 = -[TVCSAudioRoute headphoneConfiguration](v5, "headphoneConfiguration");
  id v3 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  id v6 = objc_msgSend(v4, "spatialAudioModeForBundleID:");

  uint64_t v2 = 2LL;
  if (v6 != (id)3) {
    uint64_t v2 = 3LL;
  }
  uint64_t v13 = v2;
  BOOL v9 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  id v8 = -[TVCSAudioRoute headphoneConfiguration](v9, "headphoneConfiguration");
  id v7 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  objc_msgSend(v8, "setSpatialAudioMode:forBundleID:", v13);

  char v12 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](self, "secondaryRoute");
  id v11 = -[TVCSAudioRoute headphoneConfiguration](v12, "headphoneConfiguration");
  id v10 = -[TVSSHeadphonesPanelPlatterController _currentAppBundleID](self, "_currentAppBundleID");
  objc_msgSend(v11, "setSpatialAudioMode:forBundleID:", v13);

  -[TVSSHeadphonesPanelPlatterController _refreshSpatializeStereoRenderer](self, "_refreshSpatializeStereoRenderer");
}

- (id)_localizedValueFromListeningMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    __asm { BR              X8 }
  }

  return v4;
}

- (id)_systemImageForListeningMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    __asm { BR              X8 }
  }

  return v4;
}

- (id)_localizedValueFromConversationDetectState:(BOOL)a3
{
  if (a3) {
    return TVSSLocString(@"TVSSHeadphonesDetectSpeechOnTitle");
  }
  else {
    return TVSSLocString(@"TVSSHeadphonesDetectSpeechOffTitle");
  }
}

- (id)_localizedValueForCurrentSpatialState
{
  if (!-[TVSSHeadphonesPanelPlatterController _currentAppSupportsSpatial](self, "_currentAppSupportsSpatial")) {
    return TVSSLocString(@"TVSSHeadphonesNotAvailableTitle");
  }
  if (-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsHeadTracked]( self,  "_resolvedSpatialAudioModeIsHeadTracked"))
  {
    return TVSSLocString(@"TVSSHeadphonesHeadTrackedTitle");
  }

  if (-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsFixed]( self,  "_resolvedSpatialAudioModeIsFixed"))
  {
    return TVSSLocString(@"TVSSHeadphonesFixedTitle");
  }

  return TVSSLocString(@"TVSSHeadphonesHeadTrackingOffTitle");
}

- (id)_localizedValueForCurrentSpatializeStereoState
{
  if (!-[TVSSHeadphonesPanelPlatterController _currentAppSupportsSpatial](self, "_currentAppSupportsSpatial")) {
    return TVSSLocString(@"TVSSHeadphonesNotAvailableTitle");
  }
  id v4 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  char v7 = 0;
  char v5 = 0;
  if (-[TVSSHeadphonesPanelPlatterController _spatializeStereoEnabledForHeadphone:]( self,  "_spatializeStereoEnabledForHeadphone:")
    && -[TVSSHeadphonesPanelPlatterController _currentAudioContentInfoEligibleForSpatialization]( self,  "_currentAudioContentInfoEligibleForSpatialization"))
  {
    id v8 = TVSSLocString(@"TVSSHeadphonesSpatializeStereoOnTitle");
    char v7 = 1;
    id v3 = v8;
  }

  else
  {
    id v6 = TVSSLocString(@"TVSSHeadphonesSpatializeStereoOffTitle");
    char v5 = 1;
    id v3 = v6;
  }

  id v10 = v3;
  if ((v5 & 1) != 0) {

  }
  if ((v7 & 1) != 0) {
  return v10;
  }
}

- (id)_packageNameForListeningMode:(int64_t)a3
{
  v5[3] = self;
  v5[2] = (id)a2;
  v5[1] = (id)a3;
  v5[0] = 0LL;
  if ((unint64_t)a3 <= 4) {
    __asm { BR              X8 }
  }

  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (id)_packageNameForCurrentSpatialState
{
  if (-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsHeadTracked]( self,  "_resolvedSpatialAudioModeIsHeadTracked"))
  {
    return @"SpatialMultichannelHeadTracked";
  }

  if (-[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsFixed]( self,  "_resolvedSpatialAudioModeIsFixed"))
  {
    return @"SpatialMultichannelOn";
  }

  return @"SpatialMultichannelOff";
}

- (id)_packageNameForCurrentSpatializeStereoState
{
  id v8 = -[TVSSHeadphonesPanelPlatterController primaryRoute](self, "primaryRoute");
  if (-[TVSSHeadphonesPanelPlatterController _spatializeStereoEnabledForHeadphone:]( self,  "_spatializeStereoEnabledForHeadphone:")
    && -[TVSSHeadphonesPanelPlatterController _currentAppSupportsSpatial](self, "_currentAppSupportsSpatial"))
  {
    unsigned __int8 v2 = -[TVSSHeadphonesPanelPlatterController _resolvedSpatialAudioModeIsHeadTracked]( self,  "_resolvedSpatialAudioModeIsHeadTracked");
    id v3 = @"SpatialStereoHeadTracked";
    if ((v2 & 1) == 0) {
      id v3 = @"SpatialStereoOn";
    }
    id v4 = v3;
  }

  else
  {
    id v4 = @"SpatialStereoOff";
  }

  id v6 = v4;

  return v6;
}

- (id)_hierarchicalColorsForMenuOffPersonSymbol
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = +[UIColor quaternaryLabelColor](&OBJC_CLASS___UIColor, "quaternaryLabelColor");
  id v4 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001BA6F0);
  v6[0] = v5[0];
  v6[1] = v4;
  id v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL);
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong(v5, 0LL);
  return v3;
}

- (id)_routeFromItemIdentifier:(id)a3
{
  char v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (([location[0] isEqualToString:@"noisecontrolA"] & 1) != 0
    || ([location[0] isEqualToString:@"speechdetectA"] & 1) != 0)
  {
    id v6 = -[TVSSHeadphonesPanelPlatterController primaryRoute](v5, "primaryRoute");
  }

  else if ([location[0] isEqualToString:@"noisecontrolB"])
  {
    id v6 = -[TVSSHeadphonesPanelPlatterController secondaryRoute](v5, "secondaryRoute");
  }

  else
  {
    id v6 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v6;
}

- (TVCSAudioRoutingController)routingController
{
  return self->_routingController;
}

- (void)setRoutingController:(id)a3
{
}

- (MRNowPlayingAudioFormatController)audioFormatController
{
  return self->_audioFormatController;
}

- (void)setAudioFormatController:(id)a3
{
}

- (TVCSAudioRoute)primaryRoute
{
  return self->_primaryRoute;
}

- (void)setPrimaryRoute:(id)a3
{
}

- (TVCSAudioRoute)secondaryRoute
{
  return self->_secondaryRoute;
}

- (void)setSecondaryRoute:(id)a3
{
}

- (PBSVolumeButtonEventAssertion)volumeButtonAssertion
{
  return self->_volumeButtonAssertion;
}

- (void)setVolumeButtonAssertion:(id)a3
{
}

- (PBSVolumeHUDAssertion)volumeHUDAssertion
{
  return self->_volumeHUDAssertion;
}

- (void)setVolumeHUDAssertion:(id)a3
{
}

- (TVCSAudioRoute)focusedVolumeRoute
{
  return self->_focusedVolumeRoute;
}

- (void)setFocusedVolumeRoute:(id)a3
{
}

- (TVSSAudioNowPlayingController)audioNowPlayingController
{
  return self->_audioNowPlayingController;
}

- (void)setAudioNowPlayingController:(id)a3
{
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (void)setMenuModeController:(id)a3
{
}

- (TVSSHeadphonesController)headphonesController
{
  return self->_headphonesController;
}

- (void)setHeadphonesController:(id)a3
{
}

- (PBSSuppressHeadphoneBulletinAssertion)suppressBulletinAssertion
{
  return self->_suppressBulletinAssertion;
}

- (BOOL)didPerformShareAudio
{
  return self->_didPerformShareAudio;
}

- (void)setDidPerformShareAudio:(BOOL)a3
{
  self->_didPerformShareAudio = a3;
}

- (void).cxx_destruct
{
}

@end