@interface SUCoreActivityOptions
+ (BOOL)supportsSecureCoding;
- (NSDate)runDate;
- (NSNumber)batteryLevelGreaterThan;
- (NSNumber)batteryLevelLessThan;
- (SUCoreActivityOptions)init;
- (SUCoreActivityOptions)initWithCoder:(id)a3;
- (id)_stringForPriority:(int)a3;
- (id)_stringForTriState:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)carplayState;
- (int)mediaPlayingState;
- (int)networkState;
- (int)phoneCallState;
- (int)plugInState;
- (int)priority;
- (int)screenOnState;
- (int)waking;
- (int)wifiState;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryLevelGreaterThan:(id)a3;
- (void)setBatteryLevelLessThan:(id)a3;
- (void)setCarplayState:(int)a3;
- (void)setMediaPlayingState:(int)a3;
- (void)setNetworkState:(int)a3;
- (void)setPhoneCallState:(int)a3;
- (void)setPlugInState:(int)a3;
- (void)setPriority:(int)a3;
- (void)setRunDate:(id)a3;
- (void)setScreenOnState:(int)a3;
- (void)setWaking:(int)a3;
- (void)setWifiState:(int)a3;
@end

@implementation SUCoreActivityOptions

- (SUCoreActivityOptions)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SUCoreActivityOptions;
  v2 = -[SUCoreActivityOptions init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    runDate = v2->_runDate;
    v2->_runDate = 0LL;

    batteryLevelGreaterThan = v3->_batteryLevelGreaterThan;
    v3->_batteryLevelGreaterThan = 0LL;

    batteryLevelLessThan = v3->_batteryLevelLessThan;
    v3->_batteryLevelLessThan = 0LL;

    v3->_priority = 0;
    *(_OWORD *)&v3->_plugInState = 0u;
    *(_OWORD *)&v3->_waking = 0u;
  }

  return v3;
}

- (SUCoreActivityOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SUCoreActivityOptions;
  v5 = -[SUCoreActivityOptions init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runDate"];
    runDate = v5->_runDate;
    v5->_runDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryLevelGreaterThan"];
    batteryLevelGreaterThan = v5->_batteryLevelGreaterThan;
    v5->_batteryLevelGreaterThan = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batteryLevelLessThan"];
    batteryLevelLessThan = v5->_batteryLevelLessThan;
    v5->_batteryLevelLessThan = (NSNumber *)v10;

    v5->_plugInState = [v4 decodeIntForKey:@"pluginState"];
    v5->_screenOnState = [v4 decodeIntForKey:@"screenOnState"];
    v5->_networkState = [v4 decodeIntForKey:@"networkState"];
    v5->_wifiState = [v4 decodeIntForKey:@"wifiState"];
    v5->_waking = [v4 decodeIntForKey:@"waking"];
    v5->_phoneCallState = [v4 decodeIntForKey:@"phoneCallState"];
    v5->_carplayState = [v4 decodeIntForKey:@"carplayState"];
    v5->_mediaPlayingState = [v4 decodeIntForKey:@"mediaPlayingState"];
    v5->_priority = [v4 decodeIntForKey:@"priority"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  runDate = self->_runDate;
  id v5 = a3;
  [v5 encodeObject:runDate forKey:@"runDate"];
  [v5 encodeObject:self->_batteryLevelGreaterThan forKey:@"batteryLevelGreaterThan"];
  [v5 encodeObject:self->_batteryLevelLessThan forKey:@"batteryLevelLessThan"];
  [v5 encodeInt:self->_plugInState forKey:@"pluginState"];
  [v5 encodeInt:self->_screenOnState forKey:@"screenOnState"];
  [v5 encodeInt:self->_networkState forKey:@"networkState"];
  [v5 encodeInt:self->_wifiState forKey:@"wifiState"];
  [v5 encodeInt:self->_waking forKey:@"waking"];
  [v5 encodeInt:self->_phoneCallState forKey:@"phoneCallState"];
  [v5 encodeInt:self->_carplayState forKey:@"carplayState"];
  [v5 encodeInt:self->_mediaPlayingState forKey:@"mediaPlayingState"];
  [v5 encodeInt:self->_mediaPlayingState forKey:@"priority"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SUCoreActivityOptions runDate](self, "runDate");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setRunDate:v7];

  -[SUCoreActivityOptions batteryLevelGreaterThan](self, "batteryLevelGreaterThan");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setBatteryLevelGreaterThan:v9];

  -[SUCoreActivityOptions batteryLevelLessThan](self, "batteryLevelLessThan");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setBatteryLevelLessThan:v11];

  objc_msgSend(v5, "setPlugInState:", -[SUCoreActivityOptions plugInState](self, "plugInState"));
  objc_msgSend(v5, "setScreenOnState:", -[SUCoreActivityOptions screenOnState](self, "screenOnState"));
  objc_msgSend(v5, "setNetworkState:", -[SUCoreActivityOptions networkState](self, "networkState"));
  objc_msgSend(v5, "setWifiState:", -[SUCoreActivityOptions wifiState](self, "wifiState"));
  objc_msgSend(v5, "setWaking:", -[SUCoreActivityOptions waking](self, "waking"));
  objc_msgSend(v5, "setPhoneCallState:", -[SUCoreActivityOptions phoneCallState](self, "phoneCallState"));
  objc_msgSend(v5, "setCarplayState:", -[SUCoreActivityOptions carplayState](self, "carplayState"));
  objc_msgSend(v5, "setMediaPlayingState:", -[SUCoreActivityOptions mediaPlayingState](self, "mediaPlayingState"));
  objc_msgSend(v5, "setPriority:", -[SUCoreActivityOptions priority](self, "priority"));
  return v5;
}

- (id)_stringForTriState:(int)a3
{
  else {
    return off_18A0F0208[a3];
  }
}

- (id)_stringForPriority:(int)a3
{
  v3 = @"Default(Utility)";
  if (a3 == 1) {
    v3 = @"Maintenance";
  }
  if (a3 == 2) {
    return @"Utility";
  }
  else {
    return (id)v3;
  }
}

- (id)description
{
  v18 = (void *)NSString;
  [MEMORY[0x189612760] stringFromDate:self->_runDate];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  batteryLevelGreaterThan = self->_batteryLevelGreaterThan;
  if (!batteryLevelGreaterThan) {
    batteryLevelGreaterThan = (NSNumber *)@"NOT_SET";
  }
  v16 = batteryLevelGreaterThan;
  if (self->_batteryLevelLessThan) {
    batteryLevelLessThan = self->_batteryLevelLessThan;
  }
  else {
    batteryLevelLessThan = (NSNumber *)@"NOT_SET";
  }
  v15 = -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_plugInState);
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_screenOnState);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_networkState);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_wifiState);
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_waking);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_phoneCallState);
  -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_carplayState);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUCoreActivityOptions _stringForTriState:](self, "_stringForTriState:", self->_mediaPlayingState);
  v12 = -[SUCoreActivityOptions _stringForPriority:](self, "_stringForPriority:", self->_priority);
  [v18 stringWithFormat:@"RunDate: %@ BatteryLevelGreaterThan: %@ BatteryLevelLessThan: %@ PluginState: %@ ScreenOnState: %@ NetworkState: %@ WifiState: %@ Waking: %@ PhoneCallState: %@ CarplayState: %@ MediaPlayingState: %@ Priority: %@", v17, v16, batteryLevelLessThan, v15, v5, v6, v7, v8, v9, v10, v11, v12];
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSDate)runDate
{
  return self->_runDate;
}

- (void)setRunDate:(id)a3
{
}

- (NSNumber)batteryLevelGreaterThan
{
  return self->_batteryLevelGreaterThan;
}

- (void)setBatteryLevelGreaterThan:(id)a3
{
}

- (NSNumber)batteryLevelLessThan
{
  return self->_batteryLevelLessThan;
}

- (void)setBatteryLevelLessThan:(id)a3
{
}

- (int)plugInState
{
  return self->_plugInState;
}

- (void)setPlugInState:(int)a3
{
  self->_plugInState = a3;
}

- (int)screenOnState
{
  return self->_screenOnState;
}

- (void)setScreenOnState:(int)a3
{
  self->_screenOnState = a3;
}

- (int)networkState
{
  return self->_networkState;
}

- (void)setNetworkState:(int)a3
{
  self->_networkState = a3;
}

- (int)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(int)a3
{
  self->_wifiState = a3;
}

- (int)waking
{
  return self->_waking;
}

- (void)setWaking:(int)a3
{
  self->_waking = a3;
}

- (int)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(int)a3
{
  self->_phoneCallState = a3;
}

- (int)carplayState
{
  return self->_carplayState;
}

- (void)setCarplayState:(int)a3
{
  self->_carplayState = a3;
}

- (int)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setMediaPlayingState:(int)a3
{
  self->_mediaPlayingState = a3;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
}

@end