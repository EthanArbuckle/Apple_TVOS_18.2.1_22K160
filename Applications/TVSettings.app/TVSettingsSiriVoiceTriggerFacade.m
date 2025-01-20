@interface TVSettingsSiriVoiceTriggerFacade
- (BOOL)hasPairedDoAPOnlyDevice;
- (TVSettingsBluetoothFacade)bluetoothFacade;
- (TVSettingsSiriVoiceTriggerFacade)initWithBluetoothFacade:(id)a3;
- (id)localizedDescriptionForVoiceTriggerPhraseType:(unint64_t)a3;
- (id)localizedJSTriggerString:(id)a3;
- (id)localizedTriggerString:(id)a3;
- (id)voiceTriggerPhraseFormatter;
- (unint64_t)voiceTriggerPhraseType;
- (void)bluetoothDeviceInfoChanged:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBluetoothFacade:(id)a3;
- (void)setVoiceTriggerPhraseType:(unint64_t)a3;
- (void)toggleVoiceTriggerEnabled:(id)a3;
@end

@implementation TVSettingsSiriVoiceTriggerFacade

- (TVSettingsSiriVoiceTriggerFacade)initWithBluetoothFacade:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsSiriVoiceTriggerFacade;
  v6 = -[TVSettingsSiriVoiceTriggerFacade init](&v10, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
    [v7 addObserver:v6 forKeyPath:@"voiceTriggerEnabled" options:1 context:off_1001E0B00];
    [v7 addObserver:v6 forKeyPath:@"voiceTriggerPhraseType" options:1 context:off_1001E0B00];
    objc_storeStrong((id *)&v6->_bluetoothFacade, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v6 selector:"bluetoothDeviceInfoChanged:" name:@"TVSettingsBluetoothDeviceInfoDidUpdateNotification" object:v6->_bluetoothFacade];

    v6->_hasPairedDoAPOnlyDevice = [v5 hasPairedDoAPOnlyDevice];
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"voiceTriggerEnabled" context:off_1001E0B00];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  [v5 removeObserver:self forKeyPath:@"voiceTriggerPhraseType" context:off_1001E0B00];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsSiriVoiceTriggerFacade;
  -[TVSettingsSiriVoiceTriggerFacade dealloc](&v7, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0B00 == a6)
  {
    -[TVSettingsSiriVoiceTriggerFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"voiceTriggerPhraseType",  a4,  a5);
    -[TVSettingsSiriVoiceTriggerFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"voiceTriggerPhraseType");
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVSettingsSiriVoiceTriggerFacade;
    -[TVSettingsSiriVoiceTriggerFacade observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)bluetoothDeviceInfoChanged:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSiriVoiceTriggerFacade bluetoothFacade](self, "bluetoothFacade", a3));
  unsigned int v5 = [v4 hasPairedDoAPOnlyDevice];

  if (self->_hasPairedDoAPOnlyDevice != v5)
  {
    -[TVSettingsSiriVoiceTriggerFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"hasPairedDoAPOnlyDevice");
    self->_hasPairedDoAPOnlyDevice = v5;
    -[TVSettingsSiriVoiceTriggerFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"hasPairedDoAPOnlyDevice");
  }

- (unint64_t)voiceTriggerPhraseType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  if ([v2 isVoiceTriggerEnabled])
  {
    if ([v2 voiceTriggerPhraseType] == (id)1) {
      unint64_t v3 = 2LL;
    }
    else {
      unint64_t v3 = 1LL;
    }
  }

  else
  {
    unint64_t v3 = 0LL;
  }

  id v4 = sub_1000D800C();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCB58(v3, v5, v6, v7, v8, v9, v10, v11);
  }

  return v3;
}

- (void)setVoiceTriggerPhraseType:(unint64_t)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  id v6 = sub_1000D800C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCBC0(a3, v7, v8, v9, v10, v11, v12, v13);
  }

  -[TVSettingsSiriVoiceTriggerFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"voiceTriggerPhraseType");
  [v5 setVoiceTriggerEnabled:a3 != 0];
  [v5 setVoiceTriggerPhraseType:a3 == 2];
  -[TVSettingsSiriVoiceTriggerFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"voiceTriggerPhraseType");
}

- (void)toggleVoiceTriggerEnabled:(id)a3
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance", a3));
  unsigned int v4 = [v3 isVoiceTriggerEnabled];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  [v5 setVoiceTriggerEnabled:v4 ^ 1];
}

- (id)localizedTriggerString:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 language]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedVoiceTriggerPhraseForLanguageCode:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@" " withString:@" "]);
  uint64_t v8 = TSKLocString(v3);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v7));
  return v10;
}

- (id)localizedJSTriggerString:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 language]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedCompactVoiceTriggerPhraseForLanguageCode:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedVoiceTriggerPhraseForLanguageCode:v5]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@" " withString:@" "]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v10 = TSKLocStringFromBundleCachingKey(v3, v9, 1LL, 0LL, @"Localizable-JustSiri");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v6, v8));
  return v12;
}

- (id)localizedDescriptionForVoiceTriggerPhraseType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSiriVoiceTriggerFacade bluetoothFacade](self, "bluetoothFacade"));
      else {
        uint64_t v7 = @"SiriHSJSAccessoriesDescription";
      }
      id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsSiriVoiceTriggerFacade localizedJSTriggerString:]( self,  "localizedJSTriggerString:",  v7));

      break;
    case 1uLL:
      uint64_t v5 = objc_claimAutoreleasedReturnValue( -[TVSettingsSiriVoiceTriggerFacade localizedTriggerString:]( self,  "localizedTriggerString:",  @"SiriHSAccessoriesDescription"));
      goto LABEL_10;
    case 0uLL:
      uint64_t v5 = objc_claimAutoreleasedReturnValue( -[TVSettingsSiriVoiceTriggerFacade localizedJSTriggerString:]( self,  "localizedJSTriggerString:",  @"SiriHSJSOffAccessoriesDescription"));
LABEL_10:
      id v3 = (void *)v5;
      break;
  }

  return v3;
}

- (id)voiceTriggerPhraseFormatter
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000D8484;
  v3[3] = &unk_100190B00;
  v3[4] = self;
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:v3];
}

- (BOOL)hasPairedDoAPOnlyDevice
{
  return self->_hasPairedDoAPOnlyDevice;
}

- (TVSettingsBluetoothFacade)bluetoothFacade
{
  return self->_bluetoothFacade;
}

- (void)setBluetoothFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end