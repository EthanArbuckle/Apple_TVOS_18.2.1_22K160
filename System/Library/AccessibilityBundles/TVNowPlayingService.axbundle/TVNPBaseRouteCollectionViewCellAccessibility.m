@interface TVNPBaseRouteCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsGuideElement;
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityGetLastControlState;
- (id)_axVolumeSliderView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityReinterpretVoiceOverCommand:(int64_t)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetLastControlState:(id)a3;
- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation TVNPBaseRouteCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVNPBaseRouteCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"musicBarState",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"deviceType",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"titleText",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"subtitleText",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"displayAsSelected",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"volumeSliderView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"volumeProgressView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRouteCollectionViewCell",  @"_configureAppearanceForControlState:withAnimationCoordinator:",  "v",  "Q",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPNowPlayingSliderView",  @"value",  "f",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPNowPlayingSliderView",  @"minimumValue",  "f",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPNowPlayingSliderView",  @"maximumValue",  "f",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPNowPlayingSliderView",  @"setValue:animated:",  "v",  "f",  "B",  0);
  [v3 validateClass:@"TVNPNowPlayingSliderView" isKindOfClass:@"UIControl"];
  [v3 validateClass:@"TVNPRoutingRoutesCollectionViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingRoutesCollectionViewController",  @"setRouteForVolume:",  "v",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = accessibilityLocalizedStringForRouteDeviceType((unint64_t)-[TVNPBaseRouteCollectionViewCellAccessibility safeUnsignedIntegerForKey:]( self,  "safeUnsignedIntegerForKey:",  @"deviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = accessibilityLocalizedString(@"route.cell.type");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRouteCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleText"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRouteCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subtitleText"));
  uint64_t v8 = __UIAXStringForVariables(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)accessibilityValue
{
  id v3 = (char *)-[TVNPBaseRouteCollectionViewCellAccessibility safeUnsignedIntegerForKey:]( self,  "safeUnsignedIntegerForKey:",  @"musicBarState");
  if (v3 == (_BYTE *)&dword_0 + 1)
  {
    id v5 = @"music.bar.state.playing";
    goto LABEL_5;
  }

  if (v3 == (_BYTE *)&dword_0 + 2)
  {
    id v5 = @"music.bar.state.paused";
LABEL_5:
    id v6 = accessibilityLocalizedString(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    goto LABEL_7;
  }

  v7 = 0LL;
LABEL_7:
  char v28 = 0;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRouteCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"volumeLevel"));
  uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v28) {
    abort();
  }
  if (v11)
  {
    id v12 = accessibilityLocalizedString(@"volume.level.description");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 floatValue];
    uint64_t v15 = AXFormatFloatWithPercentage(0LL, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v16));
  }

  else
  {
    v17 = 0LL;
  }

  id v18 = accessibilityLocalizedString(@"route.not.connected");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (-[TVNPBaseRouteCollectionViewCellAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"displayAsSelected"))
  {
    id v20 = accessibilityLocalizedString(@"route.connected");
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

    v19 = (void *)v21;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  unsigned int v23 = [v22 _accessibilityViewIsVisible];

  if (v23)
  {
    id v24 = v17;
  }

  else
  {
    uint64_t v25 = __UIAXStringForVariables(v19);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v25);
  }

  v26 = v24;

  return v26;
}

- (id)accessibilityHint
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRouteCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"volumeProgressView"));
  unsigned int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    id v5 = accessibilityLocalizedString(@"route.cell.hint");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCellAccessibility;
    id v7 = -[TVNPBaseRouteCollectionViewCellAccessibility accessibilityHint](&v9, "accessibilityHint");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  unsigned int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCellAccessibility;
    return UIAccessibilityTraitAdjustable | -[TVNPBaseRouteCollectionViewCellAccessibility accessibilityTraits]( &v7,  "accessibilityTraits");
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCellAccessibility;
    return -[TVNPBaseRouteCollectionViewCellAccessibility accessibilityTraits](&v6, "accessibilityTraits");
  }

- (void)accessibilityIncrement
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  [v3 safeFloatForKey:@"minimumValue"];
  float v5 = v4;

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  [v6 safeFloatForKey:@"maximumValue"];
  float v8 = v7;

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  [v9 safeFloatForKey:@"value"];
  float v11 = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  char v13 = objc_opt_respondsToSelector(v12, "setValue:animated:");

  if ((v13 & 1) != 0)
  {
    if (v11 + 0.05 <= v5) {
      double v14 = v5;
    }
    else {
      double v14 = v11 + 0.05;
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
    v16 = v15;
    *(float *)&double v17 = v14;
    if (v14 >= v8) {
      *(float *)&double v17 = v8;
    }
    [v15 setValue:0 animated:v17];

    id v18 = (id)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
    [v18 sendActionsForControlEvents:4096];
  }

- (void)accessibilityDecrement
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  [v3 safeFloatForKey:@"minimumValue"];
  float v5 = v4;

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  [v6 safeFloatForKey:@"maximumValue"];
  float v8 = v7;

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  [v9 safeFloatForKey:@"value"];
  float v11 = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  char v13 = objc_opt_respondsToSelector(v12, "setValue:animated:");

  if ((v13 & 1) != 0)
  {
    if (v11 + -0.05 <= v5) {
      double v14 = v5;
    }
    else {
      double v14 = v11 + -0.05;
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
    v16 = v15;
    *(float *)&double v17 = v14;
    if (v14 >= v8) {
      *(float *)&double v17 = v8;
    }
    [v15 setValue:0 animated:v17];

    id v18 = (id)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
    [v18 sendActionsForControlEvents:4096];
  }

- (BOOL)_accessibilityIsGuideElement
{
  return 1;
}

- (id)_axVolumeSliderView
{
  char v8 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIControl, a2);
  float v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRouteCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"volumeSliderView"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v8);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8) {
    abort();
  }
  return v6;
}

- (int64_t)_accessibilityReinterpretVoiceOverCommand:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  unsigned int v6 = [v5 _accessibilityViewIsVisible];
  if ((unint64_t)(a3 - 18) <= 0xFFFFFFFFFFFFFFFDLL && v6)
  {

    if (a3 != 13) {
      return 2LL;
    }
  }

  else
  {
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCellAccessibility;
  return -[TVNPBaseRouteCollectionViewCellAccessibility _accessibilityReinterpretVoiceOverCommand:]( &v8,  "_accessibilityReinterpretVoiceOverCommand:",  a3);
}

- (BOOL)_accessibilityServesAsFirstElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  unsigned __int8 v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPBaseRouteCollectionViewCellAccessibility _axVolumeSliderView](self, "_axVolumeSliderView"));
  char v3 = [v2 _accessibilityViewIsVisible] ^ 1;

  return v3;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRouteCollectionViewCellAccessibility _accessibilityViewController]( self,  "_accessibilityViewController"));
  char v3 = objc_opt_respondsToSelector(v2, "setRouteForVolume:");
  if ((v3 & 1) != 0) {
    [v2 setRouteForVolume:0];
  }

  return v3 & 1;
}

- (id)_accessibilityGetLastControlState
{
  return (id)__UIAccessibilityGetAssociatedObject( self,  &__TVNPBaseRouteCollectionViewCellAccessibility___accessibilityGetLastControlState);
}

- (void)_accessibilitySetLastControlState:(id)a3
{
}

- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCellAccessibility;
  -[TVNPBaseRouteCollectionViewCellAccessibility _configureAppearanceForControlState:withAnimationCoordinator:]( &v11,  "_configureAppearanceForControlState:withAnimationCoordinator:",  a3,  a4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRouteCollectionViewCellAccessibility _accessibilityGetLastControlState]( self,  "_accessibilityGetLastControlState"));
  BOOL v7 = ((unint64_t)[v6 unsignedIntegerValue] & 0xFF0000) != 0;

  if (((((a3 & 0xFF0000) == 0) ^ v7) & 1) == 0)
  {
    dispatch_time_t v8 = dispatch_time(0LL, 400000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __109__TVNPBaseRouteCollectionViewCellAccessibility__configureAppearanceForControlState_withAnimationCoordinator___block_invoke;
    block[3] = &unk_82B0;
    block[4] = self;
    dispatch_after(v8, &_dispatch_main_q, block);
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[TVNPBaseRouteCollectionViewCellAccessibility _accessibilitySetLastControlState:]( self,  "_accessibilitySetLastControlState:",  v9);
}

void __109__TVNPBaseRouteCollectionViewCellAccessibility__configureAppearanceForControlState_withAnimationCoordinator___block_invoke( uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 100000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __109__TVNPBaseRouteCollectionViewCellAccessibility__configureAppearanceForControlState_withAnimationCoordinator___block_invoke_2;
  block[3] = &unk_82B0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, &_dispatch_main_q, block);
}

void __109__TVNPBaseRouteCollectionViewCellAccessibility__configureAppearanceForControlState_withAnimationCoordinator___block_invoke_2( uint64_t a1)
{
}

@end