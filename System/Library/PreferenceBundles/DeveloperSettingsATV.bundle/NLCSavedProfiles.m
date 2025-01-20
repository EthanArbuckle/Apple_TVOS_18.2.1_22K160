@interface NLCSavedProfiles
- (BOOL)createPresetProfiles;
- (BOOL)secondarySimulatorRunning;
- (BOOL)simulatorRunning;
- (NSArray)allProfilesArray;
- (NSArray)customProfilesArray;
- (NSArray)suppliedProfilesArray;
- (NSMutableDictionary)profileDictionary;
- (NSString)selectedProfileName;
- (NSString)simulatedProfileName;
- (id)addNewProfile:(id)a3;
- (id)profileDictionaryWithName:(id)a3;
- (id)restoreRowToSelect;
- (id)selectedProfileDictionary;
- (void)applyChanges;
- (void)applySimulationStatusChanges;
- (void)loadPreferences;
- (void)refreshArrays;
- (void)removeProfileWithName:(id)a3;
- (void)setAllProfilesArray:(id)a3;
- (void)setCustomProfilesArray:(id)a3;
- (void)setProfileDictionary:(id)a3;
- (void)setSecondarySimulatorRunning:(BOOL)a3;
- (void)setSelectedProfileName:(id)a3;
- (void)setSimulatedProfileName:(id)a3;
- (void)setSimulatorRunning:(BOOL)a3;
- (void)setSuppliedProfilesArray:(id)a3;
@end

@implementation NLCSavedProfiles

- (id)selectedProfileDictionary
{
  return -[NSMutableDictionary objectForKey:](self->profileDictionary, "objectForKey:", self->selectedProfileName);
}

- (void)refreshArrays
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->profileDictionary, "allKeys"));
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v6);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->profileDictionary, "allKeys"));
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->profileDictionary, "objectForKey:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"Preset"]);

        else {
          v14 = v3;
        }
        -[NSMutableArray addObject:](v14, "addObject:", v11);
      }

      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray sortedArrayUsingSelector:]( v4,  "sortedArrayUsingSelector:",  "localizedCaseInsensitiveCompare:"));
  -[NLCSavedProfiles setSuppliedProfilesArray:](self, "setSuppliedProfilesArray:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray sortedArrayUsingSelector:]( v3,  "sortedArrayUsingSelector:",  "localizedCaseInsensitiveCompare:"));
  -[NLCSavedProfiles setCustomProfilesArray:](self, "setCustomProfilesArray:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray sortedArrayUsingSelector:]( v5,  "sortedArrayUsingSelector:",  "localizedCaseInsensitiveCompare:"));
  -[NLCSavedProfiles setAllProfilesArray:](self, "setAllProfilesArray:", v17);
}

- (void)removeProfileWithName:(id)a3
{
  profileDictionary = self->profileDictionary;
  id v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](profileDictionary, "removeObjectForKey:", v5);
  -[NLCSavedProfiles refreshArrays](self, "refreshArrays");
  LODWORD(profileDictionary) = [v5 isEqualToString:self->selectedProfileName];

  if ((_DWORD)profileDictionary)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles allProfilesArray](self, "allProfilesArray"));
    id v7 = [v6 count];

    if (v7)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles allProfilesArray](self, "allProfilesArray"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);
      -[NLCSavedProfiles setSelectedProfileName:](self, "setSelectedProfileName:", v8);
    }

    else
    {
      -[NLCSavedProfiles setSelectedProfileName:](self, "setSelectedProfileName:", 0LL);
    }
  }

- (id)restoreRowToSelect
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles simulatedProfileName](self, "simulatedProfileName"));
  if (v3
    && (v4 = (void *)v3, unsigned int v5 = -[NLCSavedProfiles simulatorRunning](self, "simulatorRunning"), v4, v5))
  {
    v6 = self->simulatedProfileName;
  }

  else
  {
    v6 = (NSString *)CFPreferencesCopyAppValue(@"SelectedProfile", @"com.apple.network.prefPaneSimulate");
  }

  selectedProfileName = self->selectedProfileName;
  self->selectedProfileName = v6;

  return self->selectedProfileName;
}

- (id)profileDictionaryWithName:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->profileDictionary, "objectForKey:", a3);
}

- (void)loadPreferences
{
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"Profiles", @"com.apple.network.prefPaneSimulate");
  v4 = v3;
  if (!v3 || ![v3 count])
  {
    -[NLCSavedProfiles createPresetProfiles](self, "createPresetProfiles");
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"Profiles", @"com.apple.network.prefPaneSimulate");

    v4 = (void *)v5;
  }

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  profileDictionary = self->profileDictionary;
  self->profileDictionary = v6;

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
        v14 = self->profileDictionary;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", v13, (void)v33));
        id v16 = [v15 mutableCopy];
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, v13);
      }

      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v10);
  }

  v17 = (NSString *)CFPreferencesCopyAppValue(@"SimulatedProfile", @"com.apple.network.prefPaneSimulate");
  simulatedProfileName = self->simulatedProfileName;
  self->simulatedProfileName = v17;

  __int128 v19 = (NSString *)CFPreferencesCopyAppValue(@"SelectedProfile", @"com.apple.network.prefPaneSimulate");
  selectedProfileName = self->selectedProfileName;
  self->selectedProfileName = v19;

  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"SimulatorIsRunning",  @"com.apple.network.prefPaneSimulate",  0LL);
  *(_WORD *)&self->simulatorRunning = AppBooleanValue != 0;
  if (AppBooleanValue && self->simulatedProfileName)
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->profileDictionary, "objectForKey:"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 valueForKey:@"DNSDelayValue"]);
    self->secondarySimulatorRunning = [v23 BOOLValue];
  }

  v24 = (void *)CFPreferencesCopyAppValue(@"TimeAtLastRun", @"com.apple.network.prefPaneSimulate");
  double v25 = (double)(uint64_t)[v24 longValue];

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v26 systemUptime];
  double v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v29 timeIntervalSince1970];
  double v31 = v30 - v25;

  if (v31 > v28)
  {
    *(_WORD *)&self->simulatorRunning = 0;
    v32 = self->simulatedProfileName;
    self->simulatedProfileName = 0LL;
  }

  -[NLCSavedProfiles refreshArrays](self, "refreshArrays", (void)v33);
}

- (BOOL)createPresetProfiles
{
  v2 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 pathForResource:@"com.apple.network.prefPaneSimulate" ofType:@"plist"]);

  CFPropertyListRef v5 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  v4);
  CFPreferencesSetMultiple( (CFDictionaryRef)v5,  0LL,  @"com.apple.network.prefPaneSimulate",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  BOOL v6 = CFPreferencesSynchronize( @"com.apple.network.prefPaneSimulate",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost) != 0;

  return v6;
}

- (void)applyChanges
{
}

- (void)applySimulationStatusChanges
{
  if (-[NLCSavedProfiles simulatorRunning](self, "simulatorRunning"))
  {
    CFPreferencesSetAppValue(@"SimulatorIsRunning", kCFBooleanTrue, @"com.apple.network.prefPaneSimulate");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v3 timeIntervalSince1970];
    CFPropertyListRef v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", (uint64_t)v4));

    CFPreferencesSetAppValue(@"TimeAtLastRun", v5, @"com.apple.network.prefPaneSimulate");
  }

  else
  {
    CFPreferencesSetAppValue(@"SimulatorIsRunning", kCFBooleanFalse, @"com.apple.network.prefPaneSimulate");
  }

  CFPreferencesSetAppValue( @"SelectedProfile",  self->selectedProfileName,  @"com.apple.network.prefPaneSimulate");
  CFPreferencesSetAppValue( @"SimulatedProfile",  self->simulatedProfileName,  @"com.apple.network.prefPaneSimulate");
  CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
}

- (id)addNewProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NLCSavedProfiles profileDictionaryWithName:](self, "profileDictionaryWithName:", v4));
  if (v5)
  {
    BOOL v6 = (NSMutableDictionary *)v5;
    id v7 = 0LL;
  }

  else
  {
    double v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"UplinkBandwidth",  @"UplinkDelay",  @"UplinkPacketLossRatio",  @"UplinkBandwidthUnit",  @"DownlinkBandwidth",  @"DownlinkDelay",  @"DownlinkPacketLossRatio",  @"DownlinkBandwidthUnit",  @"RunOnInterface",  @"DNSDelayValue",  @"ProtocolFamily",  @"ExcludeLoopback",  0LL));
    LODWORD(v8) = 0;
    double v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
    LODWORD(v9) = 0;
    double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9));
    LODWORD(v10) = 0;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v10));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    LODWORD(v11) = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11));
    LODWORD(v12) = 0;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v12));
    LODWORD(v14) = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v25,  v28,  v22,  v24,  v23,  v13,  v15,  v16,  @"All",  v17,  v18,  v19,  0LL));

    __int128 v20 = -[NSMutableDictionary initWithObjects:forKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjects:forKeys:",  v26,  v27);
    -[NSMutableDictionary setObject:forKey:](self->profileDictionary, "setObject:forKey:", v20, v4);
    -[NLCSavedProfiles refreshArrays](self, "refreshArrays");
    BOOL v6 = v20;

    id v7 = v6;
  }

  return v7;
}

- (NSArray)suppliedProfilesArray
{
  return self->suppliedProfilesArray;
}

- (void)setSuppliedProfilesArray:(id)a3
{
}

- (NSArray)customProfilesArray
{
  return self->customProfilesArray;
}

- (void)setCustomProfilesArray:(id)a3
{
}

- (NSArray)allProfilesArray
{
  return self->allProfilesArray;
}

- (void)setAllProfilesArray:(id)a3
{
}

- (NSMutableDictionary)profileDictionary
{
  return self->profileDictionary;
}

- (void)setProfileDictionary:(id)a3
{
}

- (NSString)selectedProfileName
{
  return self->selectedProfileName;
}

- (void)setSelectedProfileName:(id)a3
{
}

- (NSString)simulatedProfileName
{
  return self->simulatedProfileName;
}

- (void)setSimulatedProfileName:(id)a3
{
}

- (BOOL)simulatorRunning
{
  return self->simulatorRunning;
}

- (void)setSimulatorRunning:(BOOL)a3
{
  self->simulatorRunning = a3;
}

- (BOOL)secondarySimulatorRunning
{
  return self->secondarySimulatorRunning;
}

- (void)setSecondarySimulatorRunning:(BOOL)a3
{
  self->secondarySimulatorRunning = a3;
}

- (void).cxx_destruct
{
}

@end