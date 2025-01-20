@interface TVPMusicNowPlayingControlItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)contextControlItem;
+ (id)controlItemWithImage:(id)a3 handler:(id)a4;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVPMusicNowPlayingControlItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPMusicNowPlayingControlItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVPMusicNowPlayingControlItem",  @"controlItemWithImage:handler:",  "@",  "@",  "@?",  0);
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVPMusicNowPlayingControlItem",  @"contextControlItem",  "@",  0);
  [v3 validateClass:@"TVPMusicNowPlayingControlItem" hasInstanceVariable:@"_buttonView" withType:"TVPRoundButton"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMusicNowPlayingControlItem",  @"image",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMusicNowPlayingControlItem",  @"type",  "q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMusicNowPlayingControlItem",  @"imageForControlState:",  "@",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIImage",  @"imageAsset",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIImageAsset",  @"assetName",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPMusicNowPlayingControlItemAccessibility;
  -[TVPMusicNowPlayingControlItemAccessibility _accessibilityLoadAccessibilityInformation]( &v11,  "_accessibilityLoadAccessibilityInformation");
  LOBYTE(location) = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMusicNowPlayingControlItemAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_buttonView"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if ((_BYTE)location) {
    abort();
  }
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __88__TVPMusicNowPlayingControlItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_8328;
  objc_copyWeak(&v9, &location);
  [v7 _setAccessibilityLabelBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __88__TVPMusicNowPlayingControlItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v9 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIImage, v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained safeValueForKey:@"image"]);
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v9);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v9) {
    abort();
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accessibilityLabel]);

  return v7;
}

- (id)accessibilityLabel
{
  uint64_t v3 = (char *)-[TVPMusicNowPlayingControlItemAccessibility safeIntegerForKey:]( self,  "safeIntegerForKey:",  @"type");
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __64__TVPMusicNowPlayingControlItemAccessibility_accessibilityLabel__block_invoke;
  v11[3] = &unk_8350;
  v11[4] = self;
  v11[5] = &v12;
  AXPerformSafeBlock(v11);
  id v4 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"imageAsset"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 safeStringForKey:@"assetName"]);

  if (v3 == (_BYTE *)&dword_0 + 1)
  {
    v7 = @"options.button.label";
  }

  else if ([v6 axContainsString:@"quote.bubble"])
  {
    v7 = @"lyrics.button.label";
  }

  else if ([v6 axContainsString:@"infinity"])
  {
    v7 = @"autoplay.button.label";
  }

  else
  {
    if (![v6 axContainsString:@"nowplaying_add"])
    {
      char v9 = 0LL;
      goto LABEL_10;
    }

    v7 = @"add.button.label";
  }

  id v8 = accessibilityLocalizedString(v7);
  char v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
LABEL_10:

  return v9;
}

void __64__TVPMusicNowPlayingControlItemAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) imageForControlState:0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)controlItemWithImage:(id)a3 handler:(id)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___TVPMusicNowPlayingControlItemAccessibility;
  id v4 = objc_msgSendSuper2(&v7, "controlItemWithImage:handler:", a3, a4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 _accessibilityLoadAccessibilityInformation];
  return v5;
}

+ (id)contextControlItem
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___TVPMusicNowPlayingControlItemAccessibility;
  id v2 = objc_msgSendSuper2(&v8, "contextControlItem");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeUIViewForKey:@"_buttonView"]);
  id v5 = accessibilityLocalizedString(@"options.button.label");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setAccessibilityLabel:v6];

  return v3;
}

@end