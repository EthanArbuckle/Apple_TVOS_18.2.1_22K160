@interface AXTVAirPodsSettingsFacade
+ (AXTVAirPodsSettingsFacade)facadeWithDevice:(id)a3;
+ (NSArray)pressAndHoldDurationDefaults;
+ (NSArray)pressDurationDefaults;
+ (NSFormatter)pressAndHoldDurationValueFormatter;
+ (NSFormatter)pressDurationValueFormatter;
- (BOOL)caseToneVolumeEnabled;
- (BOOL)isSpatialAudioLocked;
- (BOOL)noiseCancellation;
- (BOOL)supportsCaseToneVolume;
- (BOOL)supportsNoiseCancellation;
- (BOOL)supportsStemPress;
- (BOOL)supportsToneVolume;
- (BluetoothDevice)device;
- (double)pressAndHoldDuration;
- (double)pressDuration;
- (double)toneVolume;
- (void)setCaseToneVolumeEnabled:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setNoiseCancellation:(BOOL)a3;
- (void)setPressAndHoldDuration:(double)a3;
- (void)setPressDuration:(double)a3;
- (void)setSpatialAudioLocked:(BOOL)a3;
- (void)setToneVolume:(double)a3;
@end

@implementation AXTVAirPodsSettingsFacade

+ (AXTVAirPodsSettingsFacade)facadeWithDevice:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___AXTVAirPodsSettingsFacade);
  -[AXTVAirPodsSettingsFacade setDevice:](v4, "setDevice:", v3);

  return v4;
}

+ (NSArray)pressDurationDefaults
{
  return (NSArray *)&off_700D8;
}

+ (NSArray)pressAndHoldDurationDefaults
{
  return (NSArray *)&off_700F0;
}

+ (NSFormatter)pressDurationValueFormatter
{
  return (NSFormatter *) [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66380];
}

+ (NSFormatter)pressAndHoldDurationValueFormatter
{
  return (NSFormatter *) [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_663A0];
}

- (double)pressDuration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);
  [v3 tapSpeedForDeviceAddress:v5];
  double v7 = v6;

  return v7;
}

- (void)setPressDuration:(double)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 address]);
  *(float *)&a3 = a3;
  LODWORD(v7) = LODWORD(a3);
  [v8 setTapSpeed:v6 forDeviceAddress:v7];
}

- (double)pressAndHoldDuration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);
  [v3 holdDurationForDeviceAddress:v5];
  double v7 = v6;

  return v7;
}

- (void)setPressAndHoldDuration:(double)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 address]);
  *(float *)&a3 = a3;
  LODWORD(v7) = LODWORD(a3);
  [v8 setHoldDuration:v6 forDeviceAddress:v7];
}

- (BOOL)noiseCancellation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);
  unsigned __int8 v6 = [v3 noiseCancellationEnabledWithOneUnitForDeviceAddress:v5];

  return v6;
}

- (void)setNoiseCancellation:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 address]);
  [v7 setNoiseCancellationEnabledWithOneUnit:v3 forDeviceAddress:v6];
}

- (BOOL)isSpatialAudioLocked
{
  return _AXSSpatialAudioHeadTracking(self, a2) == 3;
}

- (void)setSpatialAudioLocked:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  _AXSSetSpatialAudioHeadTracking(v3, a2);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, kAXSAirPodSpatialAudioLockToDeviceChangedNotification, 0LL, 0LL, 1u);
}

- (double)toneVolume
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);
  double v6 = (double)[v3 toneVolumeForDeviceAddress:v5];

  return v6;
}

- (void)setToneVolume:(double)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 address]);
  [v7 setToneVolume:a3 forDeviceAddress:v6];
}

- (BOOL)caseToneVolumeEnabled
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);
  unsigned __int8 v6 = [v3 caseTonesEnabledForDeviceAddress:v5];

  return v6;
}

- (void)setCaseToneVolumeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 address]);
  [v7 setCaseTonesEnabled:v3 forDeviceAddress:v6];
}

- (BOOL)supportsNoiseCancellation
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v3 vendorId]));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 productId]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@,%@", v4, v6));

  if (([v7 isEqual:@"76,8206"] & 1) != 0
    || ([v7 isEqual:@"76,8210"] & 1) != 0
    || ([v7 isEqual:@"76,8212"] & 1) != 0)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    unsigned __int8 v8 = [v7 isEqual:@"76,8228"];
  }

  return v8;
}

- (BOOL)supportsStemPress
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v3 vendorId]));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 productId]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@,%@", v4, v6));

  LOBYTE(v3) = [v7 isEqual:@"76,8210"] ^ 1;
  return (char)v3;
}

- (BOOL)supportsToneVolume
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  BOOL v3 = [v2 getAACPCapabilityInteger:7] != 0;

  return v3;
}

- (BOOL)supportsCaseToneVolume
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVAirPodsSettingsFacade device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);
  unsigned __int8 v6 = [v3 supportsCaseTonesForDeviceAddress:v5];

  return v6;
}

- (BluetoothDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end