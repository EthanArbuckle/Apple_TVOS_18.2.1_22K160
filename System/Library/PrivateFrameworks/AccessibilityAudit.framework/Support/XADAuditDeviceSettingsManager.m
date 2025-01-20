@interface XADAuditDeviceSettingsManager
- (NSHashTable)_notificationContext;
- (XADAuditDeviceSettingsManager)init;
- (id)_fontCategories;
- (id)_fontValueFromCategoryIndex:(int64_t)a3;
- (id)_platformDefaultSettings;
- (id)_platformSettings;
- (id)settingsToCache;
- (int64_t)_fontCategoryIndexFromValue:(id)a3;
- (void)_settingDidChange:(id)a3;
- (void)_settingDidChangeBoldFonts:(id)a3;
- (void)_settingDidChangeButtonShapes:(id)a3;
- (void)_settingDidChangeDifferentiateWithoutColor:(id)a3;
- (void)_settingDidChangeGrayscale:(id)a3;
- (void)_settingDidChangeInvertColors:(id)a3;
- (void)_settingDidChangeOnOffLabels:(id)a3;
- (void)dealloc;
- (void)setHostAPIVersion:(int64_t)a3;
- (void)set_notificationContext:(id)a3;
- (void)startObservingChanges;
- (void)stopObservingChanges;
- (void)updateCurrentValueForSetting:(id)a3 postNotificationIfChanged:(BOOL)a4;
- (void)updateSetting:(id)a3 withNumberValue:(id)a4;
@end

@implementation XADAuditDeviceSettingsManager

- (XADAuditDeviceSettingsManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___XADAuditDeviceSettingsManager;
  v2 = -[XADAuditDeviceSettingsManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _platformSettings](v2, "_platformSettings"));
    -[XADAuditDeviceSettingsManager setSettings:](v3, "setSettings:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _platformDefaultSettings](v3, "_platformDefaultSettings"));
    -[XADAuditDeviceSettingsManager setDefaultSettings:](v3, "setDefaultSettings:", v5);

    -[XADAuditDeviceSettingsManager updateCurrentValueForAllSettingsAndPostNotificationIfChanged:]( v3,  "updateCurrentValueForAllSettingsAndPostNotificationIfChanged:",  1LL);
  }

  return v3;
}

- (id)settingsToCache
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XADAuditDeviceSettingsManager;
  id v2 = -[XADAuditDeviceSettingsManager settingsToCache](&v8, "settingsToCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[AXAuditDeviceSetting createWithIdentifier:currentValue:settingType:]( &OBJC_CLASS___AXAuditDeviceSetting,  "createWithIdentifier:currentValue:settingType:",  @"FONT_EXTENDED_RANGES",  0LL,  3LL));
  v5 = (void *)v4;
  if (v4)
  {
    if (v3)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 arrayByAddingObject:v4]);

      v3 = (void *)v6;
    }

    else
    {
      uint64_t v9 = v4;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    }
  }

  return v3;
}

- (void)setHostAPIVersion:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___XADAuditDeviceSettingsManager;
  -[XADAuditDeviceSettingsManager setHostAPIVersion:](&v6, "setHostAPIVersion:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _platformSettings](self, "_platformSettings"));
  -[XADAuditDeviceSettingsManager setSettings:](self, "setSettings:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _platformDefaultSettings](self, "_platformDefaultSettings"));
  -[XADAuditDeviceSettingsManager setDefaultSettings:](self, "setDefaultSettings:", v5);

  -[XADAuditDeviceSettingsManager updateCurrentValueForAllSettingsAndPostNotificationIfChanged:]( self,  "updateCurrentValueForAllSettingsAndPostNotificationIfChanged:",  1LL);
}

- (id)_platformDefaultSettings
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _platformSettings](self, "_platformSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditDeviceSetting createWithIdentifier:currentValue:settingType:]( &OBJC_CLASS___AXAuditDeviceSetting,  "createWithIdentifier:currentValue:settingType:",  @"FONT_EXTENDED_RANGES",  &off_100015978,  3LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 arrayByAddingObject:v3]);

  return v4;
}

- (id)_platformSettings
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditDeviceSetting createWithIdentifier:currentValue:settingType:]( &OBJC_CLASS___AXAuditDeviceSetting,  "createWithIdentifier:currentValue:settingType:",  AXAuditDeviceSettingIdentifierInvertColors,  &off_100015978,  3LL));
  -[NSMutableArray addObject:](v2, "addObject:", v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditDeviceSetting createWithIdentifier:currentValue:settingType:]( &OBJC_CLASS___AXAuditDeviceSetting,  "createWithIdentifier:currentValue:settingType:",  AXAuditDeviceSettingIdentifierReduceTransparency,  &off_100015978,  3LL));
  -[NSMutableArray addObject:](v2, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditDeviceSetting createWithIdentifier:currentValue:settingType:]( &OBJC_CLASS___AXAuditDeviceSetting,  "createWithIdentifier:currentValue:settingType:",  AXAuditDeviceSettingIdentifierReduceMotion,  &off_100015978,  3LL));
  -[NSMutableArray addObject:](v2, "addObject:", v5);

  return v2;
}

- (void)stopObservingChanges
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___XADAuditDeviceSettingsManager;
  -[XADAuditDeviceSettingsManager stopObservingChanges](&v4, "stopObservingChanges");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_settingDidChange:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager settingForIdentifier:](self, "settingForIdentifier:", a3));
  -[XADAuditDeviceSettingsManager updateCurrentValueForSetting:postNotificationIfChanged:]( self,  "updateCurrentValueForSetting:postNotificationIfChanged:",  v4,  1LL);
}

- (void)_settingDidChangeInvertColors:(id)a3
{
}

- (void)_settingDidChangeBoldFonts:(id)a3
{
}

- (void)_settingDidChangeOnOffLabels:(id)a3
{
}

- (void)_settingDidChangeButtonShapes:(id)a3
{
}

- (void)_settingDidChangeGrayscale:(id)a3
{
}

- (void)_settingDidChangeDifferentiateWithoutColor:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___XADAuditDeviceSettingsManager;
  -[XADAuditDeviceSettingsManager dealloc](&v3, "dealloc");
}

- (void)startObservingChanges
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___XADAuditDeviceSettingsManager;
  -[XADAuditDeviceSettingsManager startObservingChanges](&v7, "startObservingChanges");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  5LL,  1LL);
  -[XADAuditDeviceSettingsManager set_notificationContext:](self, "set_notificationContext:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _notificationContext](self, "_notificationContext"));
  [v5 addObject:self];

  objc_super v6 = (const void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _notificationContext](self, "_notificationContext"));
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006AF8,  kAXSInvertColorsEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006B34,  kAXSDarkenSystemColorsEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006B70,  kAXSReduceMotionChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006BAC,  kAXSEnhanceBackgroundContrastChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006BE8,  kAXSEnhanceTextLegibilityChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006C24,  kAXSIncreaseButtonLegibilityNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006C60,  kAXSButtonShapesEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006C9C,  kAXSGrayscaleEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006CD8,  kAXSDifferentiateWithoutColorChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v6,  (CFNotificationCallback)sub_100006D14,  @"ApplePreferredContentSizeCategoryChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (id)_fontCategories
{
  return  -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  UIContentSizeCategoryExtraSmall,  UIContentSizeCategorySmall,  UIContentSizeCategoryMedium,  UIContentSizeCategoryLarge,  UIContentSizeCategoryExtraLarge,  UIContentSizeCategoryExtraExtraLarge,  UIContentSizeCategoryExtraExtraExtraLarge,  UIContentSizeCategoryAccessibilityMedium,  UIContentSizeCategoryAccessibilityLarge,  UIContentSizeCategoryAccessibilityExtraLarge,  UIContentSizeCategoryAccessibilityExtraExtraLarge,  UIContentSizeCategoryAccessibilityExtraExtraExtraLarge,  0LL);
}

- (void)updateCurrentValueForSetting:(id)a3 postNotificationIfChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned int v8 = [v6 enabled];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 currentValueNumber]);
  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierInvertColors])
  {
    int v10 = _AXSInvertColorsEnabled();
LABEL_19:
    if (v10) {
      v11 = &__kCFBooleanTrue;
    }
    else {
      v11 = &__kCFBooleanFalse;
    }
    v12 = v6;
    goto LABEL_23;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierIncreaseContrast])
  {
    int v10 = _AXDarkenSystemColors();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierReduceMotion])
  {
    int v10 = _AXSReduceMotionEnabled();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierReduceTransparency])
  {
    int v10 = _AXSEnhanceBackgroundContrastEnabled();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierBoldFonts])
  {
    int v10 = _AXSEnhanceTextLegibilityEnabled();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierOnOffLabels])
  {
    int v10 = _AXSIncreaseButtonLegibility();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierButtonShapes])
  {
    int v10 = _AXSButtonShapesEnabled();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierGrayscale])
  {
    int v10 = _AXSGrayscaleEnabled();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierDifferentiateWithoutColor])
  {
    int v10 = _AXSDifferentiateWithoutColorEnabled();
    goto LABEL_19;
  }

  if ([v7 isEqualToString:AXAuditDeviceSettingIdentifierFontsSize])
  {
    v19 = (const __CFString *)[(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
    v20 = (void *)CFPreferencesCopyAppValue(@"UIPreferredContentSizeCategoryName", v19);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString, v21);
    if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _fontCategories](self, "_fontCategories"));
      id v24 = [v23 indexOfObject:v20];

      v25 = (void *)objc_claimAutoreleasedReturnValue( -[XADAuditDeviceSettingsManager _fontValueFromCategoryIndex:]( self,  "_fontValueFromCategoryIndex:",  v24));
      [v6 setCurrentValueNumber:v25];
    }

    goto LABEL_40;
  }

  int AppBooleanValue = CFPreferencesGetAppBooleanValue( kPSLargeTextUsesExtendedRangeKey,  off_10001A178,  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", AppBooleanValue != 0));
    [v6 setCurrentValueNumber:v20];
LABEL_40:

    goto LABEL_24;
  }

  v12 = v6;
  v11 = 0LL;
LABEL_23:
  [v12 setCurrentValueNumber:v11];
LABEL_24:
  if (v4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager settingForIdentifier:](self, "settingForIdentifier:", v13));

    if (v14)
    {
      if (v8 == [v6 enabled])
      {
        if (v9 || (v17 = (void *)objc_claimAutoreleasedReturnValue([v6 currentValueNumber])) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v6 currentValueNumber]);
          unsigned __int8 v16 = [v9 isEqual:v15];

          if ((v16 & 1) != 0) {
            goto LABEL_33;
          }
        }

        else
        {
        }
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager delegate](self, "delegate"));
      [v18 axAuditDeviceManager:self settingDidChange:v6];
    }
  }

- (id)_fontValueFromCategoryIndex:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _fontCategories](self, "_fontCategories"));
  id v5 = [v4 count];

  if ((unint64_t)v5 < 2)
  {
    objc_super v7 = &off_100015978;
  }

  else
  {
    double v6 = (double)a3 / ((double)(unint64_t)v5 + -1.0);
    if (v6 > 1.0) {
      double v6 = 1.0;
    }
    if (v6 < 0.0) {
      double v6 = 0.0;
    }
    objc_super v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  }

  return v7;
}

- (int64_t)_fontCategoryIndexFromValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _fontCategories](self, "_fontCategories"));
  id v6 = [v5 count];

  if ((unint64_t)v6 < 2)
  {
    int64_t v8 = 0LL;
  }

  else
  {
    [v4 doubleValue];
    if (v7 > 1.0) {
      double v7 = 1.0;
    }
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    int64_t v8 = llround(((double)(unint64_t)v6 + -1.0) * v7);
  }

  return v8;
}

- (void)updateSetting:(id)a3 withNumberValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___XADAuditDeviceSettingsManager;
  -[XADAuditDeviceSettingsManager updateSetting:withNumberValue:](&v37, "updateSetting:withNumberValue:", v6, v7);
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierInvertColors])
  {
    _AXSInvertColorsSetEnabled([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierIncreaseContrast])
  {
    _AXSSetDarkenSystemColors([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierReduceMotion])
  {
    _AXSSetReduceMotionEnabled([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierReduceTransparency])
  {
    _AXSSetEnhanceBackgroundContrastEnabled([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierBoldFonts])
  {
    _AXSSetEnhanceTextLegibilityEnabled([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierOnOffLabels])
  {
    _AXSSetIncreaseButtonLegibility([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierButtonShapes])
  {
    _AXSSetButtonShapesEnabled([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierGrayscale])
  {
    _AXSGrayscaleSetEnabled([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierDifferentiateWithoutColor])
  {
    _AXSSetDifferentiateWithoutColorEnabled([v7 BOOLValue]);
  }

  else if ([v8 isEqualToString:AXAuditDeviceSettingIdentifierFontsSize])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _fontCategories](self, "_fontCategories"));
    unint64_t v10 = -[XADAuditDeviceSettingsManager _fontCategoryIndexFromValue:](self, "_fontCategoryIndexFromValue:", v7);
    id v11 = [v9 indexOfObject:UIContentSizeCategoryExtraExtraExtraLarge];
    if ((v10 & 0x8000000000000000) != 0 || (uint64_t v12 = (uint64_t)v11, v10 >= (unint64_t)[v9 count]))
    {
      unsigned int v19 = [v8 isEqualToString:@"FONT_EXTENDED_RANGES"];
      if (v7 && v19)
      {
        unsigned int v20 = [v7 BOOLValue];
        if (v20) {
          uint64_t v21 = (CFPropertyListRef *)&kCFBooleanTrue;
        }
        else {
          uint64_t v21 = (CFPropertyListRef *)&kCFBooleanFalse;
        }
        CFPreferencesSetAppValue(kPSLargeTextUsesExtendedRangeKey, *v21, off_10001A178);
        uint64_t v22 = CFPreferencesAppSynchronize(off_10001A178);
        if ((v20 & 1) == 0)
        {
          v23 = (const __CFString *)[(id)CPSharedResourcesDirectory(v22) stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
          id v24 = (void *)CFPreferencesCopyAppValue(@"UIPreferredContentSizeCategoryName", v23);
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v25);
          if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditDeviceSettingsManager _fontCategories](self, "_fontCategories"));
            id v28 = [v27 indexOfObject:v24];

            unint64_t v29 = (unint64_t)[v9 indexOfObject:UIContentSizeCategoryExtraExtraExtraLarge];
            if ((v29 & 0x8000000000000000LL) == 0)
            {
              int64_t v30 = v29;
              if (v29 < (unint64_t)[v9 count] && (uint64_t)v28 > v30)
              {
                v31 = (const void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v30]);

                v33 = (const __CFString *)[(id)CPSharedResourcesDirectory(v32) stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
                CFPreferencesSetAppValue(@"UIPreferredContentSizeCategoryName", v31, v33);
                v35 = (const __CFString *)[(id)CPSharedResourcesDirectory(v34) stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
                CFPreferencesAppSynchronize(v35);
                id v24 = (void *)v31;
              }
            }
          }
        }

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"ApplePreferredContentSizeCategoryChangedNotification",  0LL,  0LL,  1u);
        dispatch_async(&_dispatch_main_q, &stru_100014A88);
      }
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v10]);
      v14 = (const __CFString *)[(id)CPSharedResourcesDirectory(v13) stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
      CFPreferencesSetAppValue(@"UIPreferredContentSizeCategoryName", v13, v14);
      unsigned __int8 v16 = (const __CFString *)[(id)CPSharedResourcesDirectory(v15) stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
      CFPreferencesAppSynchronize(v16);
      else {
        v17 = (CFPropertyListRef *)&kCFBooleanTrue;
      }
      CFPreferencesSetAppValue(kPSLargeTextUsesExtendedRangeKey, *v17, off_10001A178);
      CFPreferencesAppSynchronize(off_10001A178);
      v18 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification( v18,  @"ApplePreferredContentSizeCategoryChangedNotification",  0LL,  0LL,  1u);
      dispatch_async(&_dispatch_main_q, &stru_100014A68);
    }
  }

  -[XADAuditDeviceSettingsManager updateCurrentValueForSetting:postNotificationIfChanged:]( self,  "updateCurrentValueForSetting:postNotificationIfChanged:",  v6,  1LL);
}

- (NSHashTable)_notificationContext
{
  return self->__notificationContext;
}

- (void)set_notificationContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end