@interface TVSettingsAudioConversionViewController
- (TVSettingsAudioConversionViewController)initWithStyle:(int64_t)a3;
- (id)_atmosOptionFormatter;
- (id)_multiChannelAudioFormatter;
- (id)loadSettingGroups;
- (void)_convertFormatWithSettingItem:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSettingsAudioConversionViewController

- (TVSettingsAudioConversionViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsAudioConversionViewController;
  v3 = -[TVSettingsAudioConversionViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"audioFormats" options:0 context:off_1001DF2F0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"audioFormats" context:off_1001DF2F0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsAudioConversionViewController;
  -[TVSettingsAudioConversionViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade sharedInstance]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "sharedInstance"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVSettingsAudioConversionViewController _multiChannelAudioFormatter](self, "_multiChannelAudioFormatter"));
  v32 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v7 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v6);
  uint64_t v8 = TSKLocString(@"AVSurroundChangeFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  v4,  @"audioFormatConversionEnabled",  self,  "_convertFormatWithSettingItem:"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v10 setLocalizedValueFormatter:v11];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100015710;
  v40[3] = &unk_10018ED70;
  id v12 = v4;
  id v41 = v12;
  id v13 = v3;
  id v42 = v13;
  [v10 setUpdateBlock:v40];
  [v7 addObject:v10];
  uint64_t v14 = TSKLocString(@"AVSurroundNewFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v15,  0LL,  v13,  @"audioOutputFormat",  0LL,  0LL));

  [v16 setAvailableValues:&off_1001AEAA0];
  v34 = (void *)v5;
  [v16 setLocalizedValueFormatter:v5];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10001582C;
  v37[3] = &unk_10018ED70;
  id v38 = v13;
  id v17 = v12;
  id v39 = v17;
  id v33 = v13;
  [v16 setUpdateBlock:v37];
  [v16 setLocalizedValueFormatter:v5];
  [v7 addObject:v16];
  -[TSKSettingGroup setSettingItems:](v32, "setSettingItems:", v7);
  v18 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v19 = TSKLocString(@"AVSurroundImmersiveAudio");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = -[TSKSettingGroup initWithTitle:](v18, "initWithTitle:", v20);

  v23 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v22);
  uint64_t v24 = TSKLocString(@"AVSurroundDolbyAtmos");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v25,  0LL,  v17,  @"atmosEnabled",  0LL,  0LL));

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v17 atmosEnabled]));
  [v26 setDefaultValue:v27];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10001592C;
  v35[3] = &unk_10018E608;
  id v36 = v17;
  id v28 = v17;
  [v26 setUpdateBlock:v35];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioConversionViewController _atmosOptionFormatter](self, "_atmosOptionFormatter"));
  [v26 setLocalizedValueFormatter:v29];

  [v23 addObject:v26];
  -[TSKSettingGroup setSettingItems:](v21, "setSettingItems:", v23);
  v43[0] = v32;
  v43[1] = v21;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));

  return v30;
}

- (id)_multiChannelAudioFormatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  unsigned int v3 = [v2 isDolbyDigitalEncoderAvailable];

  if (v3)
  {
    uint64_t v4 = TSKLocString(@"AVSurroundDolby");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v15[0] = v5;
    uint64_t v6 = TSKLocString(@"AVSurroundStereo");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v15[1] = v7;
    uint64_t v8 = v15;
  }

  else
  {
    uint64_t v9 = TSKLocString(@"AVSurroundOn");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14[0] = v5;
    uint64_t v10 = TSKLocString(@"AVSurroundOff");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v14[1] = v7;
    uint64_t v8 = v14;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));

  id v12 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEAB8,  v11);
  return v12;
}

- (id)_atmosOptionFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_10018EDB0];
}

- (void)_convertFormatWithSettingItem:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade sharedInstance]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "sharedInstance",  a3));
  unsigned int v5 = [v4 audioFormatConversionEnabled];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade sharedInstance]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "sharedInstance"));
  id v21 = v6;
  if (v5)
  {
    [v6 setAudioFormatConversionEnabled:0];
    v7 = v21;
  }

  else
  {
    else {
      uint64_t v8 = @"AVSurroundConvertFormatDialogAtmosUnavailableMessage";
    }
    uint64_t v9 = TSKLocString(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

    uint64_t v11 = TSKLocString(@"AVSurroundConvertFormatDialogTitle");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  v10,  1LL));

    uint64_t v14 = TSKLocString(@"AVSurroundConvertFormatConfirmButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  &stru_10018EDD0));
    [v13 addAction:v16];

    uint64_t v17 = TSKLocString(@"AVSurroundConvertFormatRevertButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  1LL,  0LL));
    [v13 addAction:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioConversionViewController navigationController](self, "navigationController"));
    [v20 presentViewController:v13 animated:1 completion:0];

    v7 = (void *)v10;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF2F0 == a6)
  {
    -[TVSettingsAudioConversionViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsAudioConversionViewController;
    -[TVSettingsAudioConversionViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

@end