@interface AXTVVoiceOverRotorViewController
- (id)_voiceOverRotorGroup;
- (id)loadSettingGroups;
- (void)_rotorCellClicked:(id)a3;
@end

@implementation AXTVVoiceOverRotorViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVVoiceOverRotorViewController _voiceOverRotorGroup](self, "_voiceOverRotorGroup"));
  [v3 axSafelyAddObject:v4];

  return v3;
}

- (id)_voiceOverRotorGroup
{
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 voiceOverRotorItems]);
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_145B8;
  v12 = &unk_65AD0;
  v13 = self;
  v14 = v4;
  v7 = v4;
  [v6 enumerateObjectsUsingBlock:&v9];

  objc_msgSend(v3, "setSettingItems:", v7, v9, v10, v11, v12, v13);
  return v3;
}

- (void)_rotorCellClicked:(id)a3
{
  id v4 = a3;
  LOBYTE(v32) = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ((_BYTE)v32) {
    abort();
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RotorItem"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Enabled"]);
  unsigned int v11 = [v10 BOOLValue];

  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_14A58;
  v36 = sub_14A68;
  id v37 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v31 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 voiceOverRotorItems]);
  id v14 = [v13 mutableCopy];

  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_14A70;
  v24 = &unk_65AF8;
  id v15 = v9;
  id v25 = v15;
  v26 = &v28;
  v27 = &v32;
  [v14 enumerateObjectsUsingBlock:&v21];
  if (v33[5]
    || (id v20 = v15,
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/settings/AccessibilitySettings/source/AXTVVoiceOverRoto rViewController.m",  76LL,  "-[AXTVVoiceOverRotorViewController _rotorCellClicked:]",  @"this rotor item must not be nil: %@"),  v33[5]))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  v11 ^ 1,  v20,  v21,  v22,  v23,  v24));
    [(id)v33[5] setObject:v16 forKeyedSubscript:@"Enabled"];

    [v14 replaceObjectAtIndex:v29[3] withObject:v33[5]];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v17 setVoiceOverRotorItems:v14];

    v18 = (void *)objc_claimAutoreleasedReturnValue([(id)v33[5] objectForKeyedSubscript:@"Enabled"]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
    [v19 setObject:v18 forKeyedSubscript:@"Enabled"];

    -[AXTVVoiceOverRotorViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

@end