@interface AXTVSettingsFacade
+ (id)sharedInstance;
- (BOOL)_axMenuOptionEnabled:(unint64_t)a3;
- (BOOL)displayFilterBlueColorCorrectionEnabled;
- (BOOL)displayFilterBrightnessEnabled;
- (BOOL)displayFilterCategoryColorEnabled;
- (BOOL)displayFilterCategoryInvertedEnabled;
- (BOOL)displayFilterCategoryLightSensitivityEnabled;
- (BOOL)displayFilterCategoryReduceWhitePointEnabled;
- (BOOL)displayFilterCategoryWarmthEnabled;
- (BOOL)displayFilterGrayscaleEnabled;
- (BOOL)displayFilterGreenColorCorrectionEnabled;
- (BOOL)displayFilterInvertColorsEnabled;
- (BOOL)displayFilterRedColorCorrectionEnabled;
- (BOOL)displayFilterRedNightModeEnabled;
- (BOOL)displayFilterReduceWhitePointEnabled;
- (BOOL)displayFilterTintSingleColorEnabled;
- (BOOL)displayFilterWarmthEnabled;
- (BOOL)displayFiltersEnabled;
- (BOOL)extendedVoiceIsolationMediaModesEnabled;
- (BOOL)faceTimeLiveCaptionsEnabled;
- (BOOL)hoverTextEnabled;
- (BOOL)photosensitiveMitigationEnabled;
- (BOOL)showAXMenuClosedCaptions;
- (BOOL)showAXMenuDisplayFilterColorAdjustments;
- (BOOL)showAXMenuDisplayFilterInvertColors;
- (BOOL)showAXMenuDisplayFilterLightSensitivity;
- (BOOL)showAXMenuDisplayFilterReduceWhitePoint;
- (BOOL)showAXMenuHoverText;
- (BOOL)showAXMenuPhotosensitiveMitigation;
- (BOOL)showAXMenuSwitchControl;
- (BOOL)showAXMenuVideoDescriptions;
- (BOOL)showAXMenuVoiceOver;
- (BOOL)showAXMenuZoom;
- (BOOL)switchControlEnabled;
- (void)_setEnabled:(BOOL)a3 forAXMenuOption:(unint64_t)a4;
- (void)setDisplayFilterBlueColorCorrectionEnabled:(BOOL)a3;
- (void)setDisplayFilterBrightnessEnabled:(BOOL)a3;
- (void)setDisplayFilterCategoryColorEnabled:(BOOL)a3;
- (void)setDisplayFilterCategoryInvertedEnabled:(BOOL)a3;
- (void)setDisplayFilterCategoryLightSensitivityEnabled:(BOOL)a3;
- (void)setDisplayFilterCategoryReduceWhitePointEnabled:(BOOL)a3;
- (void)setDisplayFilterCategoryWarmthEnabled:(BOOL)a3;
- (void)setDisplayFilterGrayscaleEnabled:(BOOL)a3;
- (void)setDisplayFilterGreenColorCorrectionEnabled:(BOOL)a3;
- (void)setDisplayFilterInvertColorsEnabled:(BOOL)a3;
- (void)setDisplayFilterRedColorCorrectionEnabled:(BOOL)a3;
- (void)setDisplayFilterRedNightModeEnabled:(BOOL)a3;
- (void)setDisplayFilterReduceWhitePointEnabled:(BOOL)a3;
- (void)setDisplayFilterTintSingleColorEnabled:(BOOL)a3;
- (void)setDisplayFilterWarmthEnabled:(BOOL)a3;
- (void)setExtendedVoiceIsolationMediaModesEnabled:(BOOL)a3;
- (void)setFaceTimeLiveCaptionsEnabled:(BOOL)a3;
- (void)setHoverTextEnabled:(BOOL)a3;
- (void)setPhotosensitiveMitigationEnabled:(BOOL)a3;
- (void)setShowAXMenuClosedCaptions:(BOOL)a3;
- (void)setShowAXMenuDisplayFilterColorAdjustments:(BOOL)a3;
- (void)setShowAXMenuDisplayFilterInvertColors:(BOOL)a3;
- (void)setShowAXMenuDisplayFilterLightSensitivity:(BOOL)a3;
- (void)setShowAXMenuDisplayFilterReduceWhitePoint:(BOOL)a3;
- (void)setShowAXMenuHoverText:(BOOL)a3;
- (void)setShowAXMenuPhotosensitiveMitigation:(BOOL)a3;
- (void)setShowAXMenuSwitchControl:(BOOL)a3;
- (void)setShowAXMenuVideoDescriptions:(BOOL)a3;
- (void)setShowAXMenuVoiceOver:(BOOL)a3;
- (void)setShowAXMenuZoom:(BOOL)a3;
- (void)setSwitchControlEnabled:(BOOL)a3;
- (void)setTypeToSiriEnabled:(BOOL)a3;
@end

@implementation AXTVSettingsFacade

+ (id)sharedInstance
{
  if (qword_80638 != -1) {
    dispatch_once(&qword_80638, &stru_66F10);
  }
  return (id)qword_80630;
}

- (void)setShowAXMenuVoiceOver:(BOOL)a3
{
}

- (BOOL)showAXMenuVoiceOver
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 1LL);
}

- (void)setShowAXMenuZoom:(BOOL)a3
{
}

- (BOOL)showAXMenuZoom
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 2LL);
}

- (void)setShowAXMenuHoverText:(BOOL)a3
{
}

- (BOOL)showAXMenuHoverText
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 1024LL);
}

- (void)setShowAXMenuClosedCaptions:(BOOL)a3
{
}

- (BOOL)showAXMenuClosedCaptions
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 4LL);
}

- (void)setShowAXMenuVideoDescriptions:(BOOL)a3
{
}

- (BOOL)showAXMenuVideoDescriptions
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 8LL);
}

- (BOOL)showAXMenuSwitchControl
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 32LL);
}

- (void)setShowAXMenuSwitchControl:(BOOL)a3
{
}

- (BOOL)showAXMenuDisplayFilterInvertColors
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 64LL);
}

- (void)setShowAXMenuDisplayFilterInvertColors:(BOOL)a3
{
}

- (BOOL)showAXMenuDisplayFilterColorAdjustments
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 128LL);
}

- (void)setShowAXMenuDisplayFilterColorAdjustments:(BOOL)a3
{
}

- (BOOL)showAXMenuDisplayFilterLightSensitivity
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 256LL);
}

- (void)setShowAXMenuDisplayFilterLightSensitivity:(BOOL)a3
{
}

- (BOOL)showAXMenuDisplayFilterReduceWhitePoint
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 512LL);
}

- (void)setShowAXMenuDisplayFilterReduceWhitePoint:(BOOL)a3
{
}

- (BOOL)showAXMenuPhotosensitiveMitigation
{
  return -[AXTVSettingsFacade _axMenuOptionEnabled:](self, "_axMenuOptionEnabled:", 2048LL);
}

- (void)setShowAXMenuPhotosensitiveMitigation:(BOOL)a3
{
}

- (BOOL)switchControlEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 switchControlEnabled];

  return v3;
}

- (void)setSwitchControlEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  [v4 setSwitchControlEnabled:v3];
}

- (void)setTypeToSiriEnabled:(BOOL)a3
{
}

- (BOOL)displayFiltersEnabled
{
  if (-[AXTVSettingsFacade displayFilterCategoryColorEnabled](self, "displayFilterCategoryColorEnabled")
    || -[AXTVSettingsFacade displayFilterCategoryLightSensitivityEnabled]( self,  "displayFilterCategoryLightSensitivityEnabled")
    || -[AXTVSettingsFacade displayFilterCategoryInvertedEnabled](self, "displayFilterCategoryInvertedEnabled"))
  {
    return 1;
  }

  else
  {
    return -[AXTVSettingsFacade displayFilterCategoryReduceWhitePointEnabled]( self,  "displayFilterCategoryReduceWhitePointEnabled");
  }

- (BOOL)displayFilterCategoryColorEnabled
{
  return MADisplayFilterPrefGetCategoryEnabled(1LL, a2) != 0;
}

- (void)setDisplayFilterCategoryColorEnabled:(BOOL)a3
{
}

- (BOOL)displayFilterCategoryLightSensitivityEnabled
{
  return MADisplayFilterPrefGetCategoryEnabled(2LL, a2) != 0;
}

- (void)setDisplayFilterCategoryLightSensitivityEnabled:(BOOL)a3
{
}

- (BOOL)displayFilterCategoryReduceWhitePointEnabled
{
  return MADisplayFilterPrefGetCategoryEnabled(3LL, a2) != 0;
}

- (void)setDisplayFilterCategoryReduceWhitePointEnabled:(BOOL)a3
{
}

- (BOOL)displayFilterCategoryWarmthEnabled
{
  return MADisplayFilterPrefGetCategoryEnabled(4LL, a2) != 0;
}

- (void)setDisplayFilterCategoryWarmthEnabled:(BOOL)a3
{
}

- (BOOL)displayFilterCategoryInvertedEnabled
{
  return MADisplayFilterPrefGetCategoryEnabled(5LL, a2) != 0;
}

- (void)setDisplayFilterCategoryInvertedEnabled:(BOOL)a3
{
}

- (BOOL)displayFilterGrayscaleEnabled
{
  return MADisplayFilterPrefGetType(1LL, a2) == 1;
}

- (void)setDisplayFilterGrayscaleEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(1LL, 1LL);
  }
}

- (BOOL)displayFilterRedColorCorrectionEnabled
{
  return MADisplayFilterPrefGetType(1LL, a2) == 2;
}

- (void)setDisplayFilterRedColorCorrectionEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(1LL, 2LL);
  }
}

- (BOOL)displayFilterGreenColorCorrectionEnabled
{
  return MADisplayFilterPrefGetType(1LL, a2) == 4;
}

- (void)setDisplayFilterGreenColorCorrectionEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(1LL, 4LL);
  }
}

- (BOOL)displayFilterBlueColorCorrectionEnabled
{
  return MADisplayFilterPrefGetType(1LL, a2) == 8;
}

- (void)setDisplayFilterBlueColorCorrectionEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(1LL, 8LL);
  }
}

- (BOOL)displayFilterTintSingleColorEnabled
{
  return MADisplayFilterPrefGetType(1LL, a2) == 16;
}

- (void)setDisplayFilterTintSingleColorEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(1LL, 16LL);
  }
}

- (BOOL)displayFilterRedNightModeEnabled
{
  return MADisplayFilterPrefGetType(1LL, a2) == 32;
}

- (void)setDisplayFilterRedNightModeEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(1LL, 32LL);
  }
}

- (BOOL)displayFilterInvertColorsEnabled
{
  return MADisplayFilterPrefGetType(5LL, a2) == 512;
}

- (void)setDisplayFilterInvertColorsEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(5LL, 512LL);
  }
}

- (BOOL)displayFilterBrightnessEnabled
{
  return MADisplayFilterPrefGetType(2LL, a2) == 64;
}

- (void)setDisplayFilterBrightnessEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(2LL, 64LL);
  }
}

- (BOOL)displayFilterWarmthEnabled
{
  return MADisplayFilterPrefGetType(4LL, a2) == 256;
}

- (void)setDisplayFilterWarmthEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(4LL, 256LL);
  }
}

- (BOOL)displayFilterReduceWhitePointEnabled
{
  return MADisplayFilterPrefGetType(3LL, a2) == 128;
}

- (void)setDisplayFilterReduceWhitePointEnabled:(BOOL)a3
{
  if (a3) {
    MADisplayFilterPrefSetType(3LL, 128LL);
  }
}

- (BOOL)photosensitiveMitigationEnabled
{
  return _AXSPhotosensitiveMitigationEnabled(self, a2) != 0;
}

- (void)setPhotosensitiveMitigationEnabled:(BOOL)a3
{
}

- (void)_setEnabled:(BOOL)a3 forAXMenuOption:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  unint64_t v6 = (unint64_t)[v7 accessibilityMenuOptions];
  if (((((v6 & a4) == 0) ^ v5) & 1) == 0) {
    [v7 setAccessibilityMenuOptions:v6 ^ a4];
  }
}

- (BOOL)_axMenuOptionEnabled:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  unint64_t v5 = (unint64_t)[v4 accessibilityMenuOptions];

  return (v5 & a3) != 0;
}

- (BOOL)hoverTextEnabled
{
  return _AXSHoverTextEnabled(self, a2) != 0;
}

- (void)setHoverTextEnabled:(BOOL)a3
{
}

- (BOOL)faceTimeLiveCaptionsEnabled
{
  return _AXSFaceTimeCaptionsEnabled(self, a2) != 0;
}

- (void)setFaceTimeLiveCaptionsEnabled:(BOOL)a3
{
}

- (BOOL)extendedVoiceIsolationMediaModesEnabled
{
  return _AXSExtendedVoiceIsolationMediaModesEnabled(self, a2) != 0;
}

- (void)setExtendedVoiceIsolationMediaModesEnabled:(BOOL)a3
{
  if (!a3)
  {
    id v9 = 0LL;
    uint64_t v10 = 0LL;
    unsigned __int8 v4 = +[AVAudioApplication getEnhanceDialogueLevel:error:]( &OBJC_CLASS___AVAudioApplication,  "getEnhanceDialogueLevel:error:",  &v10,  &v9);
    id v5 = v9;
    if ((v4 & 1) != 0)
    {
      if (v10 != 3)
      {
LABEL_8:

        return;
      }

      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([&off_6F9C0 stringValue]);
      [v6 postNotificationName:@"com.apple.TVPAudioVideoSettings.setEnhanceDialogueLevel" object:v7 userInfo:0];
    }

    else
    {
      uint64_t v8 = AXLogCommon();
      unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
        sub_3CE4C((uint64_t)v5, (os_log_s *)v6);
      }
    }

    goto LABEL_8;
  }

@end