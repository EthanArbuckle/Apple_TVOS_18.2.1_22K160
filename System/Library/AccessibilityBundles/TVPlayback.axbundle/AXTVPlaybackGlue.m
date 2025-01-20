@interface AXTVPlaybackGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTVPlaybackGlue

+ (id)accessibilityBundles
{
  return 0LL;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXValidationManager sharedInstance](&OBJC_CLASS___AXValidationManager, "sharedInstance"));
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_234 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_238];

    id v3 = [objc_allocWithZone((Class)AXTVPlaybackGlue) init];
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    id v6 =  [v7 addObserverForName:@"AXTVSStateMachineDidTransitionToState" object:0 queue:v5 usingBlock:&__block_literal_global_259];
  }

BOOL __49__AXTVPlaybackGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __49__AXTVPlaybackGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager setValidationTargetName:](v2, "setValidationTargetName:", @"TVPlayback");
  -[AXValidationManager setOverrideProcessName:](v2, "setOverrideProcessName:", @"TVPlayback");
  -[AXValidationManager setDebugBuild:](v2, "setDebugBuild:", 0LL);

  return AXPerformValidationChecks();
}

void __49__AXTVPlaybackGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPImageStackViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPPlayerAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPVideoViewAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"_TVPRoutePickerButtonAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPMusicNowPlayingControlItemAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPRoundButtonAccessibility",  1LL);
  -[AXValidationManager installSafeCategory:canInteractWithTargetClass:]( v2,  "installSafeCategory:canInteractWithTargetClass:",  @"TVPMusicNowPlayingCollectionViewCellAccessibility",  1LL);
}

void __49__AXTVPlaybackGlue_accessibilityInitializeBundle__block_invoke_4(id a1, NSNotification *a2)
{
  v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSNotification userInfo](v2, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"toState"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSNotification userInfo](v2, "userInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"fromState"]);

  if ([v4 length] && (objc_msgSend(v4, "isEqualToString:", v6) & 1) == 0)
  {
    double v7 = 0.0;
    if (([v4 isEqualToString:@"Waiting for initial view appearance"] & 1) != 0
      || ([v4 isEqualToString:@"Waiting for initial view appearance and prep player to prepare"] & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance and media item to prepare") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance and external loading of media item") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance to show video view") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance to show passcode prompt") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance and bumper player to keep up") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance to show bumper video") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance to show bumper text") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance and caching media item to keep up") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for initial view appearance and player to keep up") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Waiting for initial view appearance to show error") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Waiting for external loading of media item") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Showing Restrictions passcode prompt") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Waiting for prep player to prepare") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Waiting for media item to prepare") & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"Waiting for duration to become available and show resume menu") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Waiting for bumper player to keep up") & 1) != 0
      || ([v4 isEqualToString:@"Showing bumper video"] & 1) != 0
      || ([v4 isEqualToString:@"Showing bumper text"] & 1) != 0
      || ([v4 isEqualToString:@"Waiting for player to become likely to keep up"] & 1) != 0
      || ([v4 isEqualToString:@"Waiting for caching media item to become likely to keep up"] & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Showing video view") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Showing error message") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Waiting for button press to start playback") & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", @"Showing related content") & 1) != 0)
    {
      v8 = &UIAccessibilityLayoutChangedNotification;
    }

    else
    {
      if (![v4 isEqualToString:@"Waiting for initial view appearance to show resume menu"]) {
        goto LABEL_32;
      }
      double v7 = 0.5;
      v8 = &UIAccessibilityScreenChangedNotification;
    }

    UIAccessibilityNotifications v9 = *v8;
    if (v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = __49__AXTVPlaybackGlue_accessibilityInitializeBundle__block_invoke_5;
      v10[3] = &__block_descriptor_36_e5_v8__0l;
      UIAccessibilityNotifications v11 = v9;
      AXPerformBlockOnMainThreadAfterDelay(v10, v7);
    }
  }

void __49__AXTVPlaybackGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1)
{
}

@end