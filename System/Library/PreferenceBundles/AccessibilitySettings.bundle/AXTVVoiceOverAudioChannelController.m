@interface AXTVVoiceOverAudioChannelController
- (BOOL)_canBeItemBeToggled:(id)a3;
- (id)loadSettingGroups;
- (void)_selectRoute:(id)a3;
@end

@implementation AXTVVoiceOverAudioChannelController

- (BOOL)_canBeItemBeToggled:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVVoiceOverAudioChannelController tableView](self, "tableView"));
  v6 = (char *)[v5 numberOfRowsInSection:0];

  if ((uint64_t)v6 < 1)
  {
    BOOL v8 = 0;
  }

  else
  {
    v7 = 0LL;
    BOOL v8 = 1;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v7,  0LL));
      v10 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVVoiceOverAudioChannelController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v9));
      if (([v10 isEqual:v4] & 1) == 0
        && [v10 accessoryTypes] == (char *)&dword_0 + 2)
      {
        break;
      }

      BOOL v8 = (uint64_t)++v7 < (uint64_t)v6;
      if (v6 == v7) {
        goto LABEL_9;
      }
    }
  }

- (void)_selectRoute:(id)a3
{
  id v22 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v22 representedObject]);
  if (-[AXTVVoiceOverAudioChannelController _canBeItemBeToggled:](self, "_canBeItemBeToggled:", v22))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager sharedManager](&OBJC_CLASS___AXAudioHardwareManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRoute]);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 savedChannelsForOutput:v7 forSource:1]);
    id v9 = [v8 mutableCopy];

    if (!v9)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVVoiceOverAudioChannelController tableView](self, "tableView"));
      v11 = (char *)[v10 numberOfRowsInSection:0];

      if ((uint64_t)v11 >= 1)
      {
        for (i = 0LL; i != v11; ++i)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  i,  0LL));
          v14 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVVoiceOverAudioChannelController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v13));
          if ([v14 accessoryTypes] == (char *)&dword_0 + 2)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([v22 representedObject]);
            v16 = (void *)objc_claimAutoreleasedReturnValue([v15 channel]);
            [v9 addObject:v16];
          }
        }
      }
    }

    if ([v22 accessoryTypes] == (char *)&dword_0 + 2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 channel]);
      [v9 removeObject:v17];

      [v22 setUpdateBlock:&stru_66D80];
    }

    else
    {
      [v22 setUpdateBlock:&stru_66DA0];
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 channel]);
      [v9 addObject:v18];
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager sharedManager](&OBJC_CLASS___AXAudioHardwareManager, "sharedManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentRoute]);
    [v19 setSavedChannels:v9 forOutput:v21 forSource:1];
  }
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager defaultPort](&OBJC_CLASS___AXAudioHardwareManager, "defaultPort"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  v44 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 portName]);
  id v12 = AXTVLocString(@"AXSpeechChannels", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v3 initWithTitle:v13];

  v48 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager sharedManager](&OBJC_CLASS___AXAudioHardwareManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentRoute]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 savedChannelsForOutput:v17 forSource:1]);

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[AXAudioHardwareManager defaultPortChannels](&OBJC_CLASS___AXAudioHardwareManager, "defaultPortChannels"));
  id v49 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v49)
  {
    id v42 = v14;
    int v43 = 0;
    v19 = 0LL;
    uint64_t v46 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v49; i = (char *)i + 1)
      {
        v21 = v19;
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        unsigned int v23 = [v18 containsObject:v22];
        if (!v18 && [obj count]) {
          unsigned int v23 = (v43 + (_DWORD)i) < 2;
        }
        v24 = objc_opt_new(&OBJC_CLASS___AXTVRouteSelection);
        -[AXTVRouteSelection setChannel:](v24, "setChannel:", v22);
        -[AXTVRouteSelection setIsForSpeech:](v24, "setIsForSpeech:", 1LL);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v22 channelName]);
        uint64_t v26 = AXAudioHDMIChannelLabelDescription([v22 channelLabel]);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        if ([v27 length])
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v44 portType]);
          unsigned int v29 = [v28 isEqualToString:AVAudioSessionPortHDMI];

          if (v29)
          {
            id v37 = AXTVLocString( @"AXVoiceOverAudioChannelNameAndDescription",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)v25);
            uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);

            v25 = (void *)v38;
          }
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v25,  0LL,  v24,  0LL,  self,  "_selectRoute:"));

        if (v23) {
          uint64_t v39 = 2LL;
        }
        else {
          uint64_t v39 = 0LL;
        }
        [v19 setAccessoryTypes:v39];
        [v19 setEnabledInStoreDemoMode:1];
        -[NSMutableArray addObject:](v48, "addObject:", v19);
      }

      v43 += (int)i;
      id v49 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }

    while (v49);

    id v14 = v42;
  }

  [v14 setSettingItems:v48];
  id v54 = v14;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));

  return v40;
}

@end