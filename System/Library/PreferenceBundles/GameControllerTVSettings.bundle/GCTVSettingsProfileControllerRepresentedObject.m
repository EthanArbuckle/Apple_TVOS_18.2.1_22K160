@interface GCTVSettingsProfileControllerRepresentedObject
- (BOOL)customizable;
- (BOOL)deletingProfile;
- (BOOL)hapticFeedbackOverride;
- (BOOL)isBaseProfile;
- (BOOL)lightbarCustomColorEnabled;
- (BOOL)lightbarOverride;
- (BOOL)videoRecordingEnabled;
- (GCSController)controller;
- (GCTVSettingsProfileController)customizatonController;
- (GCTVSettingsProfileControllerRepresentedObject)initWithProfile:(id)a3 controller:(id)a4;
- (NSArray)allElements;
- (NSArray)configurableControllerButtons;
- (NSArray)configurableControllerDpads;
- (NSDictionary)elementMappings;
- (NSString)name;
- (NSString)sfSymbolsName;
- (NSUUID)uuid;
- (double)hapticStrength;
- (id)availableColorValues;
- (id)availableVibrationValues;
- (id)colorFormatter;
- (id)profileFromCurrentConfiguration;
- (id)vibrationFormatter;
- (int64_t)lightbarColor;
- (void)promptDeleteProfile;
- (void)promptRestoreToDefaults;
- (void)restoreToDefaults;
- (void)save;
- (void)setAllElements:(id)a3;
- (void)setBaseProfile:(BOOL)a3;
- (void)setConfigurableControllerButtons:(id)a3;
- (void)setConfigurableControllerDpads:(id)a3;
- (void)setController:(id)a3;
- (void)setCustomizable:(BOOL)a3;
- (void)setCustomizatonController:(id)a3;
- (void)setDeletingProfile:(BOOL)a3;
- (void)setElementMappings:(id)a3;
- (void)setHapticFeedbackOverride:(BOOL)a3;
- (void)setHapticStrength:(double)a3;
- (void)setLightbarColor:(int64_t)a3;
- (void)setLightbarCustomColorEnabled:(BOOL)a3;
- (void)setLightbarOverride:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSfSymbolsName:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVideoRecordingEnabled:(BOOL)a3;
@end

@implementation GCTVSettingsProfileControllerRepresentedObject

- (GCTVSettingsProfileControllerRepresentedObject)initWithProfile:(id)a3 controller:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = &OBJC_CLASS___GCTVSettingsProfileControllerRepresentedObject;
  v8 = -[GCTVSettingsProfileControllerRepresentedObject init](&v41, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controller, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allButtons]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingComparator:&stru_4CCF8]);
    configurableControllerButtons = v9->_configurableControllerButtons;
    v9->_configurableControllerButtons = (NSArray *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 allDpads]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 sortedArrayUsingComparator:&stru_4CD18]);
    configurableControllerDpads = v9->_configurableControllerDpads;
    v9->_configurableControllerDpads = (NSArray *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[NSArray arrayByAddingObjectsFromArray:]( v9->_configurableControllerDpads,  "arrayByAddingObjectsFromArray:",  v9->_configurableControllerButtons));
    allElements = v9->_allElements;
    v9->_allElements = (NSArray *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v6 uuid]);
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 name]);
    name = v9->_name;
    v9->_name = (NSString *)v20;

    v9->_baseProfile = [v6 isBaseProfile];
    v9->_customizable = [v6 customizable];
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v6 sfSymbolsName]);
    sfSymbolsName = v9->_sfSymbolsName;
    v9->_sfSymbolsName = (NSString *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue([v6 elementMappings]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[GCSProfile elementMappingsFrom:for:]( &OBJC_CLASS___GCSProfile,  "elementMappingsFrom:for:",  v24,  v9->_allElements));

    v26 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v25 count]);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v27 = v25;
    id v28 = [v27 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "elementKey", (void)v37));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v32, v33);
        }

        id v29 = [v27 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }

      while (v29);
    }

    elementMappings = v9->_elementMappings;
    v9->_elementMappings = &v26->super;

    v9->_hapticFeedbackOverride = [v6 hapticFeedbackOverride];
    [v6 hapticStrength];
    v9->_hapticStrength = v35;
    v9->_lightbarOverride = [v6 lightbarOverride];
    v9->_lightbarCustomColorEnabled = [v6 lightbarCustomColorEnabled];
    v9->_lightbarColor = (int64_t)[v6 lightbarColor];
    v9->_videoRecordingEnabled = [v6 longPressShareGesture] == (char *)&dword_0 + 2;
  }

  return v9;
}

- (void)restoreToDefaults
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController allButtons](self->_controller, "allButtons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingComparator:&stru_4CD38]);
  -[GCTVSettingsProfileControllerRepresentedObject setConfigurableControllerButtons:]( self,  "setConfigurableControllerButtons:",  v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCSController allDpads](self->_controller, "allDpads"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_4CD58]);
  -[GCTVSettingsProfileControllerRepresentedObject setConfigurableControllerDpads:]( self,  "setConfigurableControllerDpads:",  v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray arrayByAddingObjectsFromArray:]( self->_configurableControllerDpads,  "arrayByAddingObjectsFromArray:",  self->_configurableControllerButtons));
  -[GCTVSettingsProfileControllerRepresentedObject setAllElements:](self, "setAllElements:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[GCSProfile elementMappingsFrom:for:]( &OBJC_CLASS___GCSProfile,  "elementMappingsFrom:for:",  &__NSDictionary0__struct,  self->_allElements));
  v9 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "elementKey", (void)v17));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, v16);
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  -[GCTVSettingsProfileControllerRepresentedObject setElementMappings:](self, "setElementMappings:", v9);
  -[GCTVSettingsProfileControllerRepresentedObject setHapticFeedbackOverride:](self, "setHapticFeedbackOverride:", 0LL);
  -[GCTVSettingsProfileControllerRepresentedObject setHapticStrength:](self, "setHapticStrength:", 1.0);
  -[GCTVSettingsProfileControllerRepresentedObject setLightbarOverride:](self, "setLightbarOverride:", 0LL);
  -[GCTVSettingsProfileControllerRepresentedObject setLightbarCustomColorEnabled:]( self,  "setLightbarCustomColorEnabled:",  0LL);
  -[GCTVSettingsProfileControllerRepresentedObject setLightbarColor:](self, "setLightbarColor:", 0LL);
  -[GCTVSettingsProfileControllerRepresentedObject setVideoRecordingEnabled:](self, "setVideoRecordingEnabled:", 1LL);
}

- (void)promptRestoreToDefaults
{
  id v3 = sub_EA9C(@"RESTORE_BUTTON_DEFAULTS_PROMPT_RESET");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  __int128 v17 = sub_A078;
  __int128 v18 = &unk_4CD80;
  objc_copyWeak(&v19, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v4,  2LL,  &v15));

  id v6 = sub_EA9C(@"RESTORE_BUTTON_DEFAULTS_PROMPT_TITLE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_EA9C(@"RESTORE_BUTTON_DEFAULTS_PROMPT_MESSAGE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v9,  1LL,  v15,  v16,  v17,  v18));

  [v10 addAction:v5];
  id v11 = sub_EA9C(@"RESTORE_BUTTON_DEFAULTS_PROMPT_CANCEL");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  0LL));
  [v10 addAction:v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizatonController);
  [WeakRetained presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)promptDeleteProfile
{
  id v3 = sub_EA9C(@"TV_DELETE_PROFILE_PROMPT_DELETE");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  __int128 v17 = sub_A294;
  __int128 v18 = &unk_4CD80;
  objc_copyWeak(&v19, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v4,  2LL,  &v15));

  id v6 = sub_EA9C(@"TV_DELETE_PROFILE_PROMPT_TITLE");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_EA9C(@"TV_DELETE_PROFILE_PROMPT_MESSAGE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v9,  1LL,  v15,  v16,  v17,  v18));

  [v10 addAction:v5];
  id v11 = sub_EA9C(@"TV_DELETE_PROFILE_PROMPT_CANCEL");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  0LL));
  [v10 addAction:v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizatonController);
  [WeakRetained presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (id)profileFromCurrentConfiguration
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  elementMappings = self->_elementMappings;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_A450;
  id v19 = &unk_4CDA8;
  v5 = v3;
  __int128 v20 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](elementMappings, "enumerateKeysAndObjectsUsingBlock:", &v16);
  BOOL videoRecordingEnabled = self->_videoRecordingEnabled;
  id v7 = self->_name;
  name = self->_name;
  uint64_t v9 = _GCFConvertStringToLocalizedString(@"%@", @"GCS_PROFILE_DEFAULT");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  LODWORD(name) = -[NSString isEqualToString:](name, "isEqualToString:", v10);

  if ((_DWORD)name)
  {

    id v7 = @"GCS_PROFILE_DEFAULT";
  }

  id v11 = objc_alloc(&OBJC_CLASS___GCSProfile);
  LOWORD(v15) = *(_WORD *)&self->_lightbarOverride;
  LOBYTE(v14) = self->_hapticFeedbackOverride;
  id v12 = -[GCSProfile initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:]( v11,  "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:e lementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOve rride:lightbarCustomColorEnabled:lightbarColor:",  self->_uuid,  v7,  0LL,  0LL,  self->_baseProfile,  self->_customizable,  self->_hapticStrength,  self->_sfSymbolsName,  v5,  v14,  0LL,  2LL * videoRecordingEnabled,  v15,  self->_lightbarColor,  v16,  v17,  v18,  v19);

  return v12;
}

- (void)save
{
  p_customizatonController = &self->_customizatonController;
  if (self->_deletingProfile)
  {
    __int128 v31 = 0uLL;
    __int128 v32 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v30 = 0uLL;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_customizatonController);
    v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained prefsStore]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profiles]);

    id v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v30;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
          unsigned int v12 = [v11 isEqual:self->_uuid];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)availableVibrationValues
{
  return &off_4FCD0;
}

- (id)vibrationFormatter
{
  id v3 = sub_EA9C(@"TV_RUMBLE_OFF");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v18 = v4;
  id v5 = sub_EA9C(@"TV_RUMBLE_VERY_WEAK");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v19 = v6;
  id v7 = sub_EA9C(@"TV_RUMBLE_WEAK");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  __int128 v20 = v8;
  id v9 = sub_EA9C(@"TV_RUMBLE_MEDIUM");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v21 = v10;
  id v11 = sub_EA9C(@"TV_RUMBLE_STRONG");
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v22 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 5LL));

  id v14 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileControllerRepresentedObject availableVibrationValues]( self,  "availableVibrationValues",  v18,  v19,  v20,  v21));
  id v16 = [v14 initWithInputs:v15 outputs:v13];

  return v16;
}

- (id)availableColorValues
{
  return &off_4FCE8;
}

- (id)colorFormatter
{
  id v3 = sub_EA9C(@"COLOR_UNSET");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v22 = v4;
  id v5 = sub_EA9C(@"COLOR_ARCADE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v23 = v6;
  id v7 = sub_EA9C(@"COLOR_RED");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v24 = v8;
  id v9 = sub_EA9C(@"COLOR_GREEN");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  __int128 v25 = v10;
  id v11 = sub_EA9C(@"COLOR_BLUE");
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  __int128 v26 = v12;
  id v13 = sub_EA9C(@"COLOR_PURPLE");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  __int128 v27 = v14;
  id v15 = sub_EA9C(@"COLOR_YELLOW");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  __int128 v28 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 7LL));

  id v18 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsProfileControllerRepresentedObject availableColorValues]( self,  "availableColorValues",  v22,  v23,  v24,  v25,  v26,  v27));
  id v20 = [v18 initWithInputs:v19 outputs:v17];

  return v20;
}

- (NSArray)configurableControllerButtons
{
  return self->_configurableControllerButtons;
}

- (void)setConfigurableControllerButtons:(id)a3
{
}

- (NSArray)configurableControllerDpads
{
  return self->_configurableControllerDpads;
}

- (void)setConfigurableControllerDpads:(id)a3
{
}

- (NSArray)allElements
{
  return self->_allElements;
}

- (void)setAllElements:(id)a3
{
}

- (GCSController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (GCTVSettingsProfileController)customizatonController
{
  return (GCTVSettingsProfileController *)objc_loadWeakRetained((id *)&self->_customizatonController);
}

- (void)setCustomizatonController:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isBaseProfile
{
  return self->_baseProfile;
}

- (void)setBaseProfile:(BOOL)a3
{
  self->_baseProfile = a3;
}

- (BOOL)customizable
{
  return self->_customizable;
}

- (void)setCustomizable:(BOOL)a3
{
  self->_customizable = a3;
}

- (NSString)sfSymbolsName
{
  return self->_sfSymbolsName;
}

- (void)setSfSymbolsName:(id)a3
{
}

- (NSDictionary)elementMappings
{
  return self->_elementMappings;
}

- (void)setElementMappings:(id)a3
{
}

- (BOOL)hapticFeedbackOverride
{
  return self->_hapticFeedbackOverride;
}

- (void)setHapticFeedbackOverride:(BOOL)a3
{
  self->_hapticFeedbackOverride = a3;
}

- (double)hapticStrength
{
  return self->_hapticStrength;
}

- (void)setHapticStrength:(double)a3
{
  self->_hapticStrength = a3;
}

- (BOOL)lightbarOverride
{
  return self->_lightbarOverride;
}

- (void)setLightbarOverride:(BOOL)a3
{
  self->_lightbarOverride = a3;
}

- (BOOL)lightbarCustomColorEnabled
{
  return self->_lightbarCustomColorEnabled;
}

- (void)setLightbarCustomColorEnabled:(BOOL)a3
{
  self->_lightbarCustomColorEnabled = a3;
}

- (int64_t)lightbarColor
{
  return self->_lightbarColor;
}

- (void)setLightbarColor:(int64_t)a3
{
  self->_lightbarColor = a3;
}

- (BOOL)videoRecordingEnabled
{
  return self->_videoRecordingEnabled;
}

- (void)setVideoRecordingEnabled:(BOOL)a3
{
  self->_BOOL videoRecordingEnabled = a3;
}

- (BOOL)deletingProfile
{
  return self->_deletingProfile;
}

- (void)setDeletingProfile:(BOOL)a3
{
  self->_deletingProfile = a3;
}

- (void).cxx_destruct
{
}

@end