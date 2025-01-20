@interface AXTVAirPodsSettingsViewController
- (AXTVAirPodsSettingsFacade)facade;
- (AXTVAirPodsSettingsViewController)initWithDevice:(id)a3;
- (BOOL)_supportsSpatialAudio;
- (BOOL)isBeatsProduct;
- (BluetoothDevice)btDevice;
- (NSString)productId;
- (double)_defaultSliderValue;
- (double)_displayedToneVolume:(double)a3;
- (double)displayedMaxValue;
- (id)_btDeviceAddress;
- (id)_toneVolumeFooter:(float)a3;
- (id)loadSettingGroups;
- (void)setBtDevice:(id)a3;
- (void)setFacade:(id)a3;
- (void)setProductId:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVAirPodsSettingsViewController

- (AXTVAirPodsSettingsViewController)initWithDevice:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AXTVAirPodsSettingsViewController;
  v5 = -[AXTVAirPodsSettingsViewController init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVAirPodsSettingsFacade facadeWithDevice:]( &OBJC_CLASS___AXTVAirPodsSettingsFacade,  "facadeWithDevice:",  v4));
    -[AXTVAirPodsSettingsViewController setFacade:](v5, "setFacade:", v6);

    -[AXTVAirPodsSettingsViewController setBtDevice:](v5, "setBtDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    -[AXTVAirPodsSettingsViewController setTitle:](v5, "setTitle:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 vendorId]));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 productId]));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@,%@", v8, v9));
    -[AXTVAirPodsSettingsViewController setProductId:](v5, "setProductId:", v10);
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVAirPodsSettingsViewController;
  -[AXTVAirPodsSettingsViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController _btDeviceAddress](self, "_btDeviceAddress"));
  *(float *)&double v6 = (float)[v4 toneVolumeForDeviceAddress:v5];
  -[AXTVAirPodsSettingsViewController _updateToneVolumeFooter:](self, "_updateToneVolumeFooter:", v6);
}

- (id)loadSettingGroups
{
  id v102 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
  unsigned int v4 = [v3 supportsStemPress];

  v5 = &AFPreferencesAssistantEnabled_ptr;
  if (v4)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v7 = AXAirPodsLocalizedStringForKey(@"PressDuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = AXAirPodsLocalizedStringForKey(@"PressDurationFooter");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVAirPodsSettingsFacade pressDurationDefaults]( &OBJC_CLASS___AXTVAirPodsSettingsFacade,  "pressDurationDefaults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v8,  v10,  v11,  @"pressDuration",  v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVAirPodsSettingsFacade pressDurationValueFormatter]( &OBJC_CLASS___AXTVAirPodsSettingsFacade,  "pressDurationValueFormatter"));
    [v13 setLocalizedValueFormatter:v14];

    [v6 addObject:v13];
    v5 = &AFPreferencesAssistantEnabled_ptr;
    uint64_t v15 = AXAirPodsLocalizedStringForKey(@"HoldDuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = AXAirPodsLocalizedStringForKey(@"HoldDurationFooter");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVAirPodsSettingsFacade pressAndHoldDurationDefaults]( &OBJC_CLASS___AXTVAirPodsSettingsFacade,  "pressAndHoldDurationDefaults"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v16,  v18,  v19,  @"pressAndHoldDuration",  v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVAirPodsSettingsFacade pressAndHoldDurationValueFormatter]( &OBJC_CLASS___AXTVAirPodsSettingsFacade,  "pressAndHoldDurationValueFormatter"));
    [v21 setLocalizedValueFormatter:v22];

    [v6 addObject:v21];
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));
    [v102 addObject:v23];
  }

  else
  {
    double v6 = 0LL;
    v21 = 0LL;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
  unsigned int v25 = [v24 supportsNoiseCancellation];

  if (v25)
  {
    uint64_t v26 = AXAirPodsLocalizedStringForKey(@"NoiseControlSetting");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v28 = AXAirPodsLocalizedStringForKey(@"NoiseControlFooter");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController productId](self, "productId"));
    unsigned int v31 = [v30 isEqual:@"76,8210"];

    if (v31)
    {
      uint64_t v32 = AXAirPodsLocalizedStringForKey(@"NoiseControlSettingEarbud");
      uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);

      uint64_t v34 = AXAirPodsB494LocalizedStringForKey(@"NoiseControlFooterBeats");
      uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);

      v27 = (void *)v33;
      v29 = (void *)v35;
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
    uint64_t v38 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v27,  v29,  v37,  @"noiseCancellation",  0LL,  0LL));

    [v36 addObject:v38];
    uint64_t v39 = AXAirPodsLocalizedStringForKey(@"NoiseControl");
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v40,  v36));
    [v102 addObject:v41];

    double v6 = v36;
    v21 = (void *)v38;
  }

  if (-[AXTVAirPodsSettingsViewController _supportsSpatialAudio](self, "_supportsSpatialAudio"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

    id v50 = AXTVLocString(@"AXLockSpatialAudioToggle", v43, v44, v45, v46, v47, v48, v49, v99);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    id v59 = AXTVLocString(@"AXSpatialAudioFooter", v52, v53, v54, v55, v56, v57, v58, v100);
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
    uint64_t v62 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v51,  v60,  v61,  @"spatialAudioLocked",  0LL,  0LL));

    [v42 addObject:v62];
    id v70 = AXTVLocString(@"AXSpatialAudioHeader", v63, v64, v65, v66, v67, v68, v69, v101);
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v71,  v42));
    [v102 addObject:v72];

    double v6 = v42;
    v21 = (void *)v62;
  }

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
  unsigned int v75 = [v74 supportsToneVolume];

  if (v75)
  {
    objc_initWeak(&location, self);
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
    id v77 = objc_loadWeakRetained(&location);
    v78 = (void *)objc_claimAutoreleasedReturnValue([v77 _btDeviceAddress]);
    *(float *)&double v79 = (float)[v76 toneVolumeForDeviceAddress:v78];
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController _toneVolumeFooter:](self, "_toneVolumeFooter:", v79));

    uint64_t v81 = AXAirPodsLocalizedStringForKey(@"ToneVolume");
    v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472LL;
    v104[2] = sub_29800;
    v104[3] = &unk_66338;
    objc_copyWeak(&v105, &location);
    v104[4] = self;
    v84 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v82,  v80,  v83,  @"toneVolume",  v104));

    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472LL;
    v103[2] = sub_29A90;
    v103[3] = &unk_66360;
    v103[4] = self;
    id v85 = [[TVSBlockFormatter alloc] initWithFormattingBlock:v103];
    [v84 setLocalizedValueFormatter:v85];

    [v73 addObject:v84];
    objc_destroyWeak(&v105);

    objc_destroyWeak(&location);
    v5 = &AFPreferencesAssistantEnabled_ptr;
  }

  else
  {
    v84 = v21;
  }

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
  unsigned int v87 = [v86 supportsCaseToneVolume];

  if (v87)
  {
    uint64_t v88 = AXBeats463LocalizedStringForKey(@"CASE_TONES_SWITCHER");
    v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
    uint64_t v90 = AXBeats463LocalizedStringForKey(@"CASE_TONES_FOOTER");
    v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController facade](self, "facade"));
    uint64_t v93 = objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v89,  v91,  v92,  @"caseToneVolumeEnabled",  0LL,  0LL));

    [v73 addObject:v93];
    v84 = (void *)v93;
  }

  if ([v73 count])
  {
    v94 = v5[300];
    uint64_t v95 = AXAirPodsLocalizedStringForKey(@"ToneVolume");
    v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue([v94 groupWithTitle:v96 settingItems:v73]);
    [v102 addObject:v97];
  }

  return v102;
}

- (double)_displayedToneVolume:(double)a3
{
  double v5 = (a3 + -15.0) / 85.0;
  -[AXTVAirPodsSettingsViewController displayedMaxValue](self, "displayedMaxValue");
  double v7 = (v5 * (v6 + -15.0) + 15.0) / 100.0;
  id v8 = -[AXTVAirPodsSettingsViewController _defaultSliderValue](self, "_defaultSliderValue");
  if (vabdd_f64(a3, v9) < 0.001) {
    double v7 = 1.0;
  }
  uint64_t v10 = AXLogAirPodSettings(v8);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[AXTVAirPodsSettingsViewController displayedMaxValue](self, "displayedMaxValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
    int v16 = 138412802;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Display tone volume: current: %@ max: %@, new: %@",  (uint8_t *)&v16,  0x20u);
  }

  return v7;
}

- (double)_defaultSliderValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController _btDeviceAddress](self, "_btDeviceAddress"));
  double v5 = (double)[v3 defaultToneVolumeForDeviceAddress:v4];

  return v5;
}

- (double)displayedMaxValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController _btDeviceAddress](self, "_btDeviceAddress"));
  unsigned int v5 = [v3 defaultToneVolumeForDeviceAddress:v4];

  return 10000.0 / (double)v5;
}

- (id)_toneVolumeFooter:(float)a3
{
  uint64_t v5 = AXAirPodsLocalizedStringForKey(@"TONE_VOLUME_FOOTER");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[AXTVAirPodsSettingsViewController isBeatsProduct](self, "isBeatsProduct"))
  {
    uint64_t v7 = AXAirPodsLocalizedStringForKey(@"TONE_VOLUME_FOOTER_BEATS");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    double v6 = (void *)v8;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsViewController _btDeviceAddress](self, "_btDeviceAddress"));
  float v11 = (float)[v9 defaultToneVolumeForDeviceAddress:v10];

  if (v11 < a3)
  {
    uint64_t v12 = AXAirPodsLocalizedStringForKey(@"TONE_VOLUME_FOOTER_EXTRA_LOUD");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingFormat:@" %@", v13]);

    double v6 = (void *)v14;
  }

  return v6;
}

- (BOOL)isBeatsProduct
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  LOBYTE(self) = [v3 isBeatsProduct:self->_btDevice];

  return (char)self;
}

- (id)_btDeviceAddress
{
  return -[BluetoothDevice address](self->_btDevice, "address");
}

- (BOOL)_supportsSpatialAudio
{
  return AXDeviceIsJ42(self, a2) ^ 1;
}

- (AXTVAirPodsSettingsFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
}

- (BluetoothDevice)btDevice
{
  return self->_btDevice;
}

- (void)setBtDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end