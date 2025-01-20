@interface TVSettingsSiriVoiceTriggerViewController
- (TVSettingsSiriVoiceTriggerFacade)voiceTriggerFacade;
- (TVSettingsSiriVoiceTriggerViewController)initWithVoiceTriggerFacade:(id)a3;
- (id)loadSettingGroups;
- (void)dealloc;
- (void)setVoiceTriggerPhraseType:(id)a3;
@end

@implementation TVSettingsSiriVoiceTriggerViewController

- (TVSettingsSiriVoiceTriggerViewController)initWithVoiceTriggerFacade:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsSiriVoiceTriggerViewController;
  v6 = -[TVSettingsSiriVoiceTriggerViewController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_voiceTriggerFacade, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsSiriVoiceTriggerViewController;
  -[TVSettingsSiriVoiceTriggerViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSiriVoiceTriggerViewController voiceTriggerFacade](self, "voiceTriggerFacade"));
  objc_super v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 3LL);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_10000AD78;
  v21 = &unk_10018E608;
  id v22 = v3;
  id v5 = v3;
  v6 = objc_retainBlock(&v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedJSTriggerString:@"SiriHSJSItemTitle"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v7,  0LL,  &off_1001ACB40,  0LL,  self,  "setVoiceTriggerPhraseType:"));

  [v8 setUpdateBlock:v6];
  -[NSMutableArray addObject:](v4, "addObject:", v8);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedJSTriggerString:@"SiriHSItemTitle"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  &off_1001ACB58,  0LL,  self,  "setVoiceTriggerPhraseType:"));

  [v10 setUpdateBlock:v6];
  -[NSMutableArray addObject:](v4, "addObject:", v10);
  uint64_t v11 = TSKLocString(@"SettingsOFF");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v12,  0LL,  &off_1001ACB70,  0LL,  self,  "setVoiceTriggerPhraseType:"));

  [v13 setUpdateBlock:v6];
  -[NSMutableArray addObject:](v4, "addObject:", v13);
  v14 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  v15 = -[TSKSettingGroup initWithTitle:description:representedObject:keyPath:readOnly:accessoryTypes:childControllerClass:]( v14,  "initWithTitle:description:representedObject:keyPath:readOnly:accessoryTypes:childControllerClass:",  0LL,  0LL,  v5,  @"hasPairedDoAPOnlyDevice",  0LL,  0LL,  0LL,  v18,  v19,  v20,  v21);
  -[TSKSettingGroup setSettingItems:](v15, "setSettingItems:", v4);
  v23 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));

  return v16;
}

- (void)setVoiceTriggerPhraseType:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v5 = [v4 unsignedIntegerValue];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsSiriVoiceTriggerViewController voiceTriggerFacade](self, "voiceTriggerFacade"));
  [v6 setVoiceTriggerPhraseType:v5];
}

- (TVSettingsSiriVoiceTriggerFacade)voiceTriggerFacade
{
  return self->_voiceTriggerFacade;
}

- (void).cxx_destruct
{
}

@end