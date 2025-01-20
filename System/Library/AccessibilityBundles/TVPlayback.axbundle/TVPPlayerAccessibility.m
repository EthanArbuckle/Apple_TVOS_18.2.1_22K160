@interface TVPPlayerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)_axGetLastLoadingStartTime;
- (id)_accessibilityLastStateAnnouncement;
- (id)_accessibilityPlaybackStateLoading;
- (id)_accessibilityPlaybackStatePaused;
- (id)_accessibilityPlaybackStatePlaying;
- (id)_accessibilityPlaybackStateScanning;
- (id)_accessibilityPlaybackStateStopped;
- (id)_axGetLastStateBeforeLoading;
- (void)_axSetLastLoadingStartTime:(double)a3;
- (void)_axSetLastStateBeforeLoading:(id)a3;
- (void)_postCurrentMediaItemDidChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6;
- (void)_setAccessibilityLastStateAnnouncement:(id)a3;
- (void)_setState:(id)a3 updatedRate:(double)a4 reason:(id)a5 notifyListeners:(BOOL)a6;
@end

@implementation TVPPlayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPPlayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPlayer",  @"_setState:updatedRate:reason:notifyListeners:",  "v",  "@",  "d",  "@",  "B",  0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVPPlayer", @"state", "@", 0);
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVPPlaybackState",  @"stopped",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVPPlaybackState",  @"loading",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVPPlaybackState",  @"paused",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVPPlaybackState",  @"playing",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVPPlaybackState",  @"scanning",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPlayer",  @"_postCurrentMediaItemDidChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:",  "v",  "@",  "@",  "B",  "B",  0);
}

- (void)_postCurrentMediaItemDidChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v10 = UIAccessibilityScreenChangedNotification;
  id v11 = a4;
  id v12 = a3;
  _UIAccessibilityIgnoreNextNotification(v10);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVPPlayerAccessibility;
  -[TVPPlayerAccessibility _postCurrentMediaItemDidChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:]( &v13,  "_postCurrentMediaItemDidChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:",  v12,  v11,  v7,  v6);
}

- (id)_axGetLastStateBeforeLoading
{
  return (id)__UIAccessibilityGetAssociatedObject(self, &__TVPPlayerAccessibility___axGetLastStateBeforeLoading);
}

- (void)_axSetLastStateBeforeLoading:(id)a3
{
}

- (double)_axGetLastLoadingStartTime
{
  return result;
}

- (void)_axSetLastLoadingStartTime:(double)a3
{
}

- (void)_setState:(id)a3 updatedRate:(double)a4 reason:(id)a5 notifyListeners:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXATVUtils sharedInstance](&OBJC_CLASS___AXATVUtils, "sharedInstance"));
  unsigned int v13 = [v12 atvaccessibilityAnnounceStateChangesForTVSPlayer:self];

  if (v13)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[TVPPlayerAccessibility safeValueForKey:](self, "safeValueForKey:", @"state"));
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[TVPPlayerAccessibility _accessibilityPlaybackStateLoading](self, "_accessibilityPlaybackStateLoading"));

    if (v15 == v10)
    {
      -[TVPPlayerAccessibility _axSetLastStateBeforeLoading:](self, "_axSetLastStateBeforeLoading:", v14);
      -[TVPPlayerAccessibility _axSetLastLoadingStartTime:]( self,  "_axSetLastLoadingStartTime:",  CFAbsoluteTimeGetCurrent());
    }

    v43.receiver = self;
    v43.super_class = (Class)&OBJC_CLASS___TVPPlayerAccessibility;
    -[TVPPlayerAccessibility _setState:updatedRate:reason:notifyListeners:]( &v43,  "_setState:updatedRate:reason:notifyListeners:",  v10,  v11,  v6,  a4);
    if (v14 == v10)
    {
      id v27 = (id)objc_claimAutoreleasedReturnValue( -[TVPPlayerAccessibility _accessibilityPlaybackStateScanning]( self,  "_accessibilityPlaybackStateScanning"));

      if (v27 != v10) {
        goto LABEL_31;
      }
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue(-[TVPPlayerAccessibility _accessibilityPlaybackStateStopped](self, "_accessibilityPlaybackStateStopped"));

    if (v16 == v10)
    {
      id v28 = accessibilityLocalizedString(@"tv.player.stopped");
      v23 = (void *)objc_claimAutoreleasedReturnValue(v28);
      if (v23) {
        goto LABEL_28;
      }
    }

    else
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVPPlayerAccessibility _accessibilityPlaybackStatePaused](self, "_accessibilityPlaybackStatePaused"));

      if (v17 == v10)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPlayerAccessibility _accessibilityLastStateAnnouncement]( self,  "_accessibilityLastStateAnnouncement"));
        id v29 = accessibilityLocalizedString(@"tv.player.playing");
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        unsigned int v31 = [v22 isEqualToString:v30];

        if (v31)
        {
          id v32 = accessibilityLocalizedString(@"tv.player.paused");
          v23 = (void *)objc_claimAutoreleasedReturnValue(v32);
        }

        else
        {
          v23 = 0LL;
        }

        goto LABEL_24;
      }

      id v18 = (id)objc_claimAutoreleasedReturnValue( -[TVPPlayerAccessibility _accessibilityPlaybackStatePlaying]( self,  "_accessibilityPlaybackStatePlaying"));

      if (v18 == v10)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayerAccessibility _axGetLastStateBeforeLoading](self, "_axGetLastStateBeforeLoading"));
        v34 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPlayerAccessibility _accessibilityPlaybackStatePlaying]( self,  "_accessibilityPlaybackStatePlaying"));
        if (v33 == v34)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          -[TVPPlayerAccessibility _axGetLastLoadingStartTime](self, "_axGetLastLoadingStartTime");
          double v37 = Current - v36;

          if (v37 <= 3.0) {
            goto LABEL_31;
          }
        }

        else
        {
        }

        id v38 = accessibilityLocalizedString(@"tv.player.playing");
        v23 = (void *)objc_claimAutoreleasedReturnValue(v38);
        UIAccessibilityPostNotification(0xBD5u, 0LL);
        if (v23) {
          goto LABEL_28;
        }
      }

      else
      {
        id v19 = (id)objc_claimAutoreleasedReturnValue( -[TVPPlayerAccessibility _accessibilityPlaybackStateScanning]( self,  "_accessibilityPlaybackStateScanning"));

        if (v19 == v10)
        {
          float v20 = fabs(a4);
          uint64_t v21 = AXFormatFloat(0LL, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v23 = 0LL;
          if (a4 != 0.0)
          {
            if (a4 <= 0.0) {
              v24 = @"tv.player.rewinding";
            }
            else {
              v24 = @"tv.player.fastforwarding";
            }
            id v25 = accessibilityLocalizedString(v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v26, v22));
          }

- (id)_accessibilityLastStateAnnouncement
{
  return objc_getAssociatedObject(self, &_AXLastStateAnnouncementStorageKey);
}

- (void)_setAccessibilityLastStateAnnouncement:(id)a3
{
}

- (id)_accessibilityPlaybackStateStopped
{
  return -[objc_class safeValueForKey:]( NSClassFromString(@"TVPPlaybackState"),  "safeValueForKey:",  @"stopped");
}

- (id)_accessibilityPlaybackStateLoading
{
  return -[objc_class safeValueForKey:]( NSClassFromString(@"TVPPlaybackState"),  "safeValueForKey:",  @"loading");
}

- (id)_accessibilityPlaybackStatePaused
{
  return -[objc_class safeValueForKey:]( NSClassFromString(@"TVPPlaybackState"),  "safeValueForKey:",  @"paused");
}

- (id)_accessibilityPlaybackStatePlaying
{
  return -[objc_class safeValueForKey:]( NSClassFromString(@"TVPPlaybackState"),  "safeValueForKey:",  @"playing");
}

- (id)_accessibilityPlaybackStateScanning
{
  return -[objc_class safeValueForKey:]( NSClassFromString(@"TVPPlaybackState"),  "safeValueForKey:",  @"scanning");
}

@end