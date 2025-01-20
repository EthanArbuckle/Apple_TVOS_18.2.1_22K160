@interface TVSettingsMusicAudioQualityViewController
- (TVSettingsMusicAudioQualityViewController)initWithStyle:(int64_t)a3;
- (id)_createItemWithInfo:(id)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_itemSelected:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)viewDidLoad;
@end

@implementation TVSettingsMusicAudioQualityViewController

- (TVSettingsMusicAudioQualityViewController)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsMusicAudioQualityViewController;
  v3 = -[TVSettingsMusicAudioQualityViewController initWithStyle:](&v8, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMusicAudioQualityFacade sharedInstance]( &OBJC_CLASS___TVSettingsMusicAudioQualityFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"audioQuality" options:0 context:off_1001DF800];
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.airplay"));
    airplayPreferences = v3->_airplayPreferences;
    v3->_airplayPreferences = (TVSPreferences *)v5;
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMusicAudioQualityFacade sharedInstance]( &OBJC_CLASS___TVSettingsMusicAudioQualityFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"audioQuality" context:off_1001DF800];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsMusicAudioQualityViewController;
  -[TVSettingsMusicAudioQualityViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsMusicAudioQualityViewController;
  -[TVSettingsMusicAudioQualityViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsMusicAudioQualityViewController tableView](self, "tableView"));
  [v3 registerClass:objc_opt_class(TSKTableViewSubtitleTextCell) forCellReuseIdentifier:@"TSKTableViewSubtitleTextCell"];
}

- (id)loadSettingGroups
{
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  v3 = objc_alloc(&OBJC_CLASS___TVSettingsAudioQualityItemInfo);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v5 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityDefault", v4, 1LL, 0LL, @"Oasis");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v8 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityDefaultSubtitle", v7, 1LL, 0LL, @"Oasis");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v11 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityHQDescription", v10, 1LL, 0LL, @"Oasis");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[TVSettingsAudioQualityItemInfo initWithAudioQuality:title:subtitle:moreInfo:]( v3,  "initWithAudioQuality:title:subtitle:moreInfo:",  0LL,  v6,  v9,  v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsMusicAudioQualityViewController _createItemWithInfo:](self, "_createItemWithInfo:", v13));
  [v31 addObject:v14];
  v15 = objc_alloc(&OBJC_CLASS___TVSettingsAudioQualityItemInfo);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v17 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityLossless", v16, 1LL, 0LL, @"Oasis");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v20 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityLosslessSubtitle", v19, 1LL, 0LL, @"Oasis");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v23 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityLosslessDescription", v22, 1LL, 0LL, @"Oasis");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = -[TVSettingsAudioQualityItemInfo initWithAudioQuality:title:subtitle:moreInfo:]( v15,  "initWithAudioQuality:title:subtitle:moreInfo:",  1LL,  v18,  v21,  v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsMusicAudioQualityViewController _createItemWithInfo:](self, "_createItemWithInfo:", v25));
  [v31 addObject:v26];
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v31));
  v32 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));

  return v28;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    uint64_t v5 = -[TSKAppIconPreviewViewController initWithApplicationBundleIdentifier:]( objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController),  "initWithApplicationBundleIdentifier:",  @"com.apple.TVMusic");
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v5;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[TSKPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v7);
  uint64_t v8 = self->_appPreviewViewController;

  return v8;
}

- (id)_createItemWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 moreInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  v6,  v4,  0LL,  self,  "_itemSelected:"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100035B30;
  v10[3] = &unk_10018E608;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsMusicAudioQualityFacade sharedInstance]( &OBJC_CLASS___TVSettingsMusicAudioQualityFacade,  "sharedInstance"));
  id v8 = v11;
  [v7 setUpdateBlock:v10];

  return v7;
}

- (void)_itemSelected:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMusicAudioQualityFacade sharedInstance]( &OBJC_CLASS___TVSettingsMusicAudioQualityFacade,  "sharedInstance"));
  objc_msgSend(v4, "setAudioQuality:", objc_msgSend(v6, "audioQuality"));

  id v5 = [v6 audioQuality];
  if ((v5 != 0LL) != -[TVSPreferences BOOLForKey:]( self->_airplayPreferences,  "BOOLForKey:",  @"BufferedLosslessSwitch"))
  {
    -[TVSPreferences setBool:forKey:]( self->_airplayPreferences,  "setBool:forKey:",  v5 != 0LL,  @"BufferedLosslessSwitch");
    -[TVSPreferences synchronize](self->_airplayPreferences, "synchronize");
    notify_post("com.apple.airplay.prefsChanged");
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsMusicAudioQualityViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v6 section]));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsMusicAudioQualityViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableCellWithIdentifier:@"TSKTableViewSubtitleTextCell" forIndexPath:v6]);

  [v10 settingItem:v9 didUpdateMetadataWithGroup:v8];
  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF800 == a6)
  {
    -[TVSettingsMusicAudioQualityViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsMusicAudioQualityViewController;
    -[TVSettingsMusicAudioQualityViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void).cxx_destruct
{
}

@end