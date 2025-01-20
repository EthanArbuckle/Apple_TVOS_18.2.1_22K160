@interface DTTVNLCProfileStore
- (BOOL)NLCEnabled;
- (BOOL)isNLCRunning;
- (void)applyChanges;
- (void)enableNLC:(BOOL)a3;
- (void)loadFromSelectedProfile;
- (void)loadPreferences;
- (void)setNLCEnabled:(BOOL)a3;
- (void)setSelectedProfileName:(id)a3;
- (void)updateForSelectedProfile;
@end

@implementation DTTVNLCProfileStore

- (void)setNLCEnabled:(BOOL)a3
{
}

- (BOOL)NLCEnabled
{
  return -[DTTVNLCProfileStore isNLCRunning](self, "isNLCRunning");
}

- (void)loadPreferences
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DTTVNLCProfileStore;
  -[NLCSavedProfiles loadPreferences](&v3, "loadPreferences");
  -[DTTVNLCProfileStore loadFromSelectedProfile](self, "loadFromSelectedProfile");
}

- (void)setSelectedProfileName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTTVNLCProfileStore;
  -[NLCSavedProfiles setSelectedProfileName:](&v4, "setSelectedProfileName:", a3);
  -[NLCSavedProfiles applySimulationStatusChanges](self, "applySimulationStatusChanges");
  -[DTTVNLCProfileStore updateForSelectedProfile](self, "updateForSelectedProfile");
}

- (void)applyChanges
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DTTVNLCProfileStore;
  -[NLCSavedProfiles applyChanges](&v3, "applyChanges");
  -[DTTVNLCProfileStore updateForSelectedProfile](self, "updateForSelectedProfile");
}

- (void)updateForSelectedProfile
{
  if (*(&self->super.secondarySimulatorRunning + 1)) {
    -[DTTVNLCProfileStore enableNLC:](self, "enableNLC:", 1LL);
  }
}

- (void)enableNLC:(BOOL)a3
{
  BOOL v3 = a3;
  if (nlc_log)
  {
    v5 = "off";
    if (a3) {
      v5 = "on";
    }
    NSLog(@"%s %s", a2, "-[DTTVNLCProfileStore enableNLC:]", v5);
  }

  memset(&v25[1], 0, 204);
  v25[0] = 21;
  if (!v3)
  {
    if (_nlc_connect(&v24) == 1)
    {
      if (_nlc_disconnect(&v24) == 1)
      {
        CFPreferencesSetAppValue( @"SimulatorIsRunning",  kCFBooleanFalse,  @"com.apple.network.prefPaneSimulate");
        CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
        *(&self->super.secondarySimulatorRunning + 1) = 0;
        -[NLCSavedProfiles setSimulatorRunning:](self, "setSimulatorRunning:", 0LL);
        if (!nlc_log) {
          return;
        }
        NSLog(@"NLC Disabled");
        goto LABEL_42;
      }

      goto LABEL_45;
    }

- (BOOL)isNLCRunning
{
  if (nlc_log)
  {
    unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"SimulatorIsRunning",  @"com.apple.network.prefPaneSimulate",  0LL);
    NSLog(@"%s kSimulatorIsRunning: %u", "-[DTTVNLCProfileStore isNLCRunning]", AppBooleanValue);
  }

  int v4 = CFPreferencesGetAppBooleanValue(@"SimulatorIsRunning", @"com.apple.network.prefPaneSimulate", 0LL);
  *(&self->super.secondarySimulatorRunning + 1) = v4 != 0;
  if (v4)
  {
    v5 = (void *)CFPreferencesCopyAppValue(@"TimeAtLastRun", @"com.apple.network.prefPaneSimulate");
    double v6 = (double)(uint64_t)[v5 longValue];

    float v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v7 systemUptime];
    double v9 = v8;

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSince1970];
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", (uint64_t)v11));

    if (nlc_log) {
      NSLog( @"%s: timeSince1970 %ld lastRunTime %f systemUpTime %f",  "-[DTTVNLCProfileStore isNLCRunning]",  [v12 longValue],  *(void *)&v6,  *(void *)&v9);
    }
    float v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v13 timeIntervalSince1970];
    double v15 = v14 - v6;

    if (v15 > v9)
    {
      if (nlc_log) {
        NSLog(@"%s: time was reset, NLC is off", "-[DTTVNLCProfileStore isNLCRunning]");
      }
      *(&self->super.secondarySimulatorRunning + 1) = 0;
      -[NLCSavedProfiles setSimulatorRunning:](self, "setSimulatorRunning:", 0LL);
    }

    int v16 = *((unsigned __int8 *)&self->super.secondarySimulatorRunning + 1);
  }

  else
  {
    int v16 = 0;
  }

  if (nlc_log)
  {
    if (v16) {
      v17 = "YES";
    }
    else {
      v17 = "NO";
    }
    NSLog(@"%s %s", "-[DTTVNLCProfileStore isNLCRunning]", v17);
    int v16 = *((unsigned __int8 *)&self->super.secondarySimulatorRunning + 1);
  }

  return v16 != 0;
}

- (void)loadFromSelectedProfile
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles selectedProfileName](self, "selectedProfileName"));
  id v53 = (id)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles profileDictionaryWithName:](self, "profileDictionaryWithName:", v3));

  if (nlc_log)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles selectedProfileName](self, "selectedProfileName"));
    NSLog(@"%s selectedProfileName: %@", "-[DTTVNLCProfileStore loadFromSelectedProfile]", v4);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"DownlinkBandwidth"]);
  unsigned int v6 = [v5 intValue];

  float v7 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"DownlinkBandwidthUnit"]);
  unsigned int v8 = [v7 intValue];

  LODWORD(v9) = 1000 * v6;
  if (v8) {
    uint64_t v9 = v9;
  }
  else {
    uint64_t v9 = v6;
  }
  BOOL v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v9));
  p_currentProfile = &self->_currentProfile;
  currentProfile = self->_currentProfile;
  self->_currentProfile = v10;

  float v13 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"DownlinkPacketLossRatio"]);
  [v13 floatValue];
  float v15 = v14;

  uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f", v15));
  v17 = p_currentProfile[1];
  p_currentProfile[1] = (NSString *)v16;

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"DownlinkDelay"]);
  id v19 = [v18 intValue];

  uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v19));
  v21 = p_currentProfile[2];
  p_currentProfile[2] = (NSString *)v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"UplinkBandwidth"]);
  unsigned int v23 = [v22 intValue];

  mach_port_t v24 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"UplinkBandwidthUnit"]);
  unsigned int v25 = [v24 intValue];

  LODWORD(v26) = 1000 * v23;
  if (v25) {
    uint64_t v26 = v26;
  }
  else {
    uint64_t v26 = v23;
  }
  uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v26));
  __int128 v28 = p_currentProfile[3];
  p_currentProfile[3] = (NSString *)v27;

  int v29 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"UplinkPacketLossRatio"]);
  [v29 floatValue];
  float v31 = v30;

  uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%f", v31));
  v33 = p_currentProfile[4];
  p_currentProfile[4] = (NSString *)v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"UplinkDelay"]);
  id v35 = [v34 intValue];

  uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v35));
  v37 = p_currentProfile[5];
  p_currentProfile[5] = (NSString *)v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"DNSDelayValue"]);
  id v39 = [v38 intValue];

  uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v39));
  v41 = p_currentProfile[6];
  p_currentProfile[6] = (NSString *)v40;

  v42 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"ProtocolFamily"]);
  id v43 = [v42 intValue];

  uint64_t v44 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v43));
  v45 = p_currentProfile[8];
  p_currentProfile[8] = (NSString *)v44;

  uint64_t v46 = objc_claimAutoreleasedReturnValue([v53 objectForKey:@"RunOnInterface"]);
  v47 = p_currentProfile[7];
  p_currentProfile[7] = (NSString *)v46;

  v48 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"ExcludeLoopback"]);
  v49 = v48;
  if (v48) {
    id v50 = [v48 intValue];
  }
  else {
    id v50 = &dword_0 + 1;
  }
  uint64_t v51 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v50));
  v52 = p_currentProfile[9];
  p_currentProfile[9] = (NSString *)v51;
}

- (void).cxx_destruct
{
  p_currentProfile = &self->_currentProfile;
  for (uint64_t i = 10LL; i != -1; --i)
    objc_storeStrong((id *)&p_currentProfile[i], 0LL);
  objc_storeStrong((id *)&self->_nlcRunning, 0LL);
}

@end