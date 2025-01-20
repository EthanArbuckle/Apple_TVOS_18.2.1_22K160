@interface MTShowSettingsViewController
+ (id)footerText;
- (BOOL)descriptionViewIsExpanded;
- (BOOL)isSerialPodcast;
- (MTDefaultsChangeNotifier)defaultsNotifier;
- (MTOptionSetting)episodesToKeepSetting;
- (MTOptionSetting)removePlayedDownloadsSetting;
- (MTOptionSetting)showTypeSetting;
- (MTRadioGroupDescription)showTypeRadioGroup;
- (MTSetting)subscribedSetting;
- (MTSettingsGroup)downloadsSettingsGroup;
- (MTSettingsGroup)episodeOrderSettingsGroup;
- (MTSettingsGroup)showSettingsGroup;
- (MTShowSettingsViewController)init;
- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3;
- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3 delegate:(id)a4;
- (MTShowSettingsViewControllerDelegate)delegate;
- (NSString)uuid;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)autoDownloadFooterTextWithGlobalLimit;
- (id)deletePlayedText:(int64_t)a3;
- (id)headerForOnThisDevice;
- (id)metricDataSource;
- (id)metricsName;
- (id)optionsForDeletePlayedEpisodes;
- (id)optionsForHidesPlayedEpisodes;
- (id)optionsForLimitSetting;
- (id)optionsForLimitWithGlobalDefault;
- (id)settingsForDownloadsGroup;
- (id)settingsForEpisodesGroup;
- (id)settingsForShowGroup;
- (id)stringForGlobalDefaultLimit;
- (id)subscribeFooterText:(BOOL)a3;
- (void)dealloc;
- (void)podcastInfoViewDidExpand:(id)a3;
- (void)podcastInfoViewWasTapped:(id)a3;
- (void)refreshSettings;
- (void)setDefaultsNotifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionViewIsExpanded:(BOOL)a3;
- (void)setDownloadsSettingsGroup:(id)a3;
- (void)setEpisodeOrderSettingsGroup:(id)a3;
- (void)setEpisodesToKeepSetting:(id)a3;
- (void)setIsSerialPodcast:(BOOL)a3;
- (void)setRemovePlayedDownloadsSetting:(id)a3;
- (void)setShowSettingsGroup:(id)a3;
- (void)setShowTypeRadioGroup:(id)a3;
- (void)setShowTypeSetting:(id)a3;
- (void)setSubscribedSetting:(id)a3;
- (void)setUuid:(id)a3;
- (void)setupView;
- (void)syncControllerOperationCompleted:(id)a3;
- (void)updateEpisodeLimit:(int64_t)a3;
- (void)updateEpisodeOrderSetting:(unint64_t)a3;
- (void)updateNotifications:(BOOL)a3;
- (void)updateRemovePlayedDownloads:(int64_t)a3;
- (void)updateSettings:(BOOL)a3;
- (void)updateSubscription:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTShowSettingsViewController

- (MTShowSettingsViewController)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"MTWrongInitializer",  @"Use -[self init]",  0LL));
  objc_exception_throw(v2);
  return -[MTShowSettingsViewController initWithPodcastUuid:](v3, v4, v5);
}

- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3
{
  return -[MTShowSettingsViewController initWithPodcastUuid:delegate:](self, "initWithPodcastUuid:delegate:", a3, 0LL);
}

- (MTShowSettingsViewController)initWithPodcastUuid:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTShowSettingsViewController;
  v9 = -[MTGenericSettingsViewController init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainOrPrivateContext]);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100091964;
    v15[3] = &unk_100240240;
    id v16 = v12;
    v17 = v10;
    id v13 = v12;
    [v13 performBlockAndWait:v15];
  }

  return v10;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController defaultsNotifier](self, "defaultsNotifier"));
  [v3 stop];

  -[MTShowSettingsViewController setDefaultsNotifier:](self, "setDefaultsNotifier:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTShowSettingsViewController;
  -[MTGenericSettingsViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTShowSettingsViewController;
  -[MTTVGenericSettingsViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTShowSettingsViewController setupView](self, "setupView");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTShowSettingsViewController;
  id v7 = a4;
  -[MTShowSettingsViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v9,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100091B30;
  v8[3] = &unk_100241C60;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_100242F10];
}

- (void)setupView
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setContentInset:", -0.5, 0.0, 0.0, 0.0);

  objc_initWeak(&location, self);
  v55[0] = kMTPodcastDeletePlayedEpisodesDefaultKey;
  v55[1] = kMTPodcastAutoDownloadStateDefaultKey;
  v55[2] = kMTPodcastEpisodeLimitDefaultKey;
  v55[3] = MTPodcastHidesPlayedEpisodesAppWideUserDefaultsKey;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 4LL));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  id v5 = objc_alloc(&OBJC_CLASS___MTDefaultsChangeNotifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  id v7 = -[MTDefaultsChangeNotifier initWithProperties:defaults:](v5, "initWithProperties:defaults:", v46, v6);
  -[MTShowSettingsViewController setDefaultsNotifier:](self, "setDefaultsNotifier:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController defaultsNotifier](self, "defaultsNotifier"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1000923A0;
  v51[3] = &unk_1002428E0;
  objc_copyWeak(&v52, &location);
  [v8 addCallback:v51];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController defaultsNotifier](self, "defaultsNotifier"));
  [v9 start];

  v10 = objc_alloc_init(&OBJC_CLASS___MTSettingsController);
  v45 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v44 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"Following" value:&stru_100248948 table:0]);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_100092444;
  v50[3] = &unk_100240110;
  v50[4] = self;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetting switchSettingWithTitle:initialValue:identifier:changeHandler:]( &OBJC_CLASS___MTSetting,  "switchSettingWithTitle:initialValue:identifier:changeHandler:",  v12,  0LL,  @"subscription",  v50));
  -[MTShowSettingsViewController setSubscribedSetting:](self, "setSubscribedSetting:", v13);

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100092450;
  v49[3] = &unk_100242F38;
  v49[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MTRadioGroupDescription radioGroupWithInitialValue:changeHandler:]( &OBJC_CLASS___MTRadioGroupDescription,  "radioGroupWithInitialValue:changeHandler:",  0LL,  v49));
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[MTShowSettingsViewController isSerialPodcast](self, "isSerialPodcast"))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"SHOW_TYPE_SERIAL" value:&stru_100248948 table:0]);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetting radioOptionWithTitle:radioGroup:value:identifier:]( &OBJC_CLASS___MTSetting,  "radioOptionWithTitle:radioGroup:value:identifier:",  v17,  v14,  2LL,  @"showTypeSerial"));

    -[NSMutableArray addObject:](v15, "addObject:", v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"SHOW_TYPE_EPISODIC" value:&stru_100248948 table:0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetting radioOptionWithTitle:radioGroup:value:identifier:]( &OBJC_CLASS___MTSetting,  "radioOptionWithTitle:radioGroup:value:identifier:",  v20,  v14,  1LL,  @"showTypeEpisodic"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"SHOW_TYPE_OLDEST_TO_NEWEST" value:&stru_100248948 table:0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetting radioOptionWithTitle:radioGroup:value:identifier:]( &OBJC_CLASS___MTSetting,  "radioOptionWithTitle:radioGroup:value:identifier:",  v23,  v14,  4LL,  @"showTypeOldestToNewest"));

  v54[0] = v24;
  v54[1] = v21;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
  -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v25);

  -[MTShowSettingsViewController setShowTypeRadioGroup:](self, "setShowTypeRadioGroup:", v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"Episode Order" value:&stru_100248948 table:0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup groupWithTitle:footerText:settings:]( &OBJC_CLASS___MTSettingsGroup,  "groupWithTitle:footerText:settings:",  v27,  0LL,  v15));
  -[MTShowSettingsViewController setEpisodeOrderSettingsGroup:](self, "setEpisodeOrderSettingsGroup:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"REMOVE_PLAYED_DOWNLOADS" value:&stru_100248948 table:0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue( [v31 localizedStringForKey:@"REMOVE_PLAYED_DOWNLOADS" value:&stru_100248948 table:0]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10009245C;
  v48[3] = &unk_100242F38;
  v48[4] = self;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetting optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:]( &OBJC_CLASS___MTSetting,  "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:",  v30,  v32,  0LL,  0LL,  0LL,  @"remove-played-downlaods",  v48));
  -[MTShowSettingsViewController setRemovePlayedDownloadsSetting:](self, "setRemovePlayedDownloadsSetting:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue( [v34 localizedStringForKey:@"AUTOMATICALLY_DOWNLOAD" value:&stru_100248948 table:0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"LIMIT_EPISODES_NAVBAR" value:&stru_100248948 table:0]);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100092468;
  v47[3] = &unk_100242F38;
  v47[4] = self;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[MTSetting optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:]( &OBJC_CLASS___MTSetting,  "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:",  v35,  v37,  0LL,  0LL,  0LL,  @"limit-unplayed",  v47));
  -[MTShowSettingsViewController setEpisodesToKeepSetting:](self, "setEpisodesToKeepSetting:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController settingsForDownloadsGroup](self, "settingsForDownloadsGroup"));
  uint64_t v40 = objc_claimAutoreleasedReturnValue( +[MTSettingsGroup groupWithTitle:footerText:settings:]( &OBJC_CLASS___MTSettingsGroup,  "groupWithTitle:footerText:settings:",  0LL,  0LL,  v39));
  -[MTShowSettingsViewController setDownloadsSettingsGroup:](self, "setDownloadsSettingsGroup:", v40);

  -[MTSettingsController setGroups:](v10, "setGroups:", v45);
  -[MTSettingsController setOrder:](v10, "setOrder:", v44);
  -[MTGenericSettingsViewController setSettingsController:](self, "setSettingsController:", v10);
  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribedSetting](self, "subscribedSetting"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 value]);
  LOBYTE(v40) = [v42 BOOLValue];

  if ((v40 & 1) == 0)
  {
    -[MTShowSettingsViewController updateNotificationSettingsToMatchSubscription:]( self,  "updateNotificationSettingsToMatchSubscription:",  0LL);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
    [v43 reloadData];
  }

  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

- (id)settingsForShowGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribedSetting](self, "subscribedSetting"));
  id v5 = v2;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)settingsForEpisodesGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController showTypeSetting](self, "showTypeSetting"));
  id v5 = v2;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)settingsForDownloadsGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController removePlayedDownloadsSetting](self, "removePlayedDownloadsSetting"));
  id v5 = v2;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)refreshSettings
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  char v52 = 0;
  v47[0] = 0LL;
  v47[1] = v47;
  v47[2] = 0x2020000000LL;
  char v48 = 0;
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x2020000000LL;
  char v46 = 0;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000LL;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000929C8;
  v23[3] = &unk_100242F60;
  id v5 = v4;
  id v24 = v5;
  v25 = self;
  v26 = &v49;
  v27 = v47;
  v28 = v45;
  v29 = &v42;
  v30 = &v39;
  v31 = v38;
  v32 = &v35;
  v33 = v34;
  [v5 performBlockAndWait:v23];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *((unsigned __int8 *)v50 + 24)));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribedSetting](self, "subscribedSetting"));
  [v7 setValue:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v40[3]));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodesToKeepSetting](self, "episodesToKeepSetting"));
  [v9 setValue:v8];

  v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTShowSettingsViewController optionsForLimitWithGlobalDefault]( self,  "optionsForLimitWithGlobalDefault"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodesToKeepSetting](self, "episodesToKeepSetting"));
  [v11 setOptions:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v43[3]));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController removePlayedDownloadsSetting](self, "removePlayedDownloadsSetting"));
  [v13 setValue:v12];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController optionsForDeletePlayedEpisodes](self, "optionsForDeletePlayedEpisodes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController removePlayedDownloadsSetting](self, "removePlayedDownloadsSetting"));
  [v15 setOptions:v14];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController deletePlayedText:](self, "deletePlayedText:", v43[3]));
  v17 = (void *)objc_claimAutoreleasedReturnValue([&stru_100248948 stringByAppendingString:v16]);

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup footerAttributedString:]( &OBJC_CLASS___MTSettingsGroup,  "footerAttributedString:",  v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController downloadsSettingsGroup](self, "downloadsSettingsGroup"));
  [v19 setGroupFooter:v18];

  uint64_t v20 = v36[3];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController showTypeRadioGroup](self, "showTypeRadioGroup"));
  [v21 setValue:v20];

  -[MTShowSettingsViewController updateSettings:](self, "updateSettings:", *((unsigned __int8 *)v50 + 24));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  [v22 reloadData];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v49, 8);
}

- (void)updateSettings:(BOOL)a3
{
  BOOL v3 = a3;
  v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController subscribeFooterText:](self, "subscribeFooterText:", v3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController settingsForShowGroup](self, "settingsForShowGroup"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup groupWithTitle:footerText:settings:]( &OBJC_CLASS___MTSettingsGroup,  "groupWithTitle:footerText:settings:",  0LL,  v6,  v7));
  -[MTShowSettingsViewController setShowSettingsGroup:](self, "setShowSettingsGroup:", v8);

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController showSettingsGroup](self, "showSettingsGroup"));
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v9, @"showSettings");

  -[NSMutableArray addObject:](v5, "addObject:", @"showSettings");
  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController episodeOrderSettingsGroup](self, "episodeOrderSettingsGroup"));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v10, @"episodeOrderSettings");

    -[NSMutableArray addObject:](v5, "addObject:", @"episodeOrderSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController downloadsSettingsGroup](self, "downloadsSettingsGroup"));
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v11, @"downloadsSettings");

    -[NSMutableArray addObject:](v5, "addObject:", @"downloadsSettings");
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  [v12 setGroups:v14];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  [v13 setOrder:v5];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *(double *)&qword_1002B3908;
}

- (id)headerForOnThisDevice
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"LOCAL_DEVICE_SETTINGS_ATV" value:&stru_100248948 table:0]);

  return v3;
}

- (id)subscribeFooterText:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  &stru_100248948,  0LL);
  }

  else
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SETTINGS_FOOTER_UNFOLLOW" value:&stru_100248948 table:0]);

    BOOL v3 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup footerAttributedString:]( &OBJC_CLASS___MTSettingsGroup,  "footerAttributedString:",  v5));
  }

  return v3;
}

- (id)optionsForLimitWithGlobalDefault
{
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController stringForGlobalDefaultLimit](self, "stringForGlobalDefaultLimit"));
  v30[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedStringForKey:@"Off" value:&stru_100248948 table:0]);
  v30[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"Latest Episode" value:&stru_100248948 table:0]);
  v30[2] = v25;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"2 Latest Episodes" value:&stru_100248948 table:0]);
  v30[3] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"3 Latest Episodes" value:&stru_100248948 table:0]);
  v30[4] = v21;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"5 Latest Episodes" value:&stru_100248948 table:0]);
  v30[5] = v19;
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"10 Latest Episodes" value:&stru_100248948 table:0]);
  v30[6] = v17;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"Last 24 Hours" value:&stru_100248948 table:0]);
  v30[7] = v2;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"Last 7 Days" value:&stru_100248948 table:0]);
  v30[8] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Last 14 Days" value:&stru_100248948 table:0]);
  v30[9] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"Last 30 Days" value:&stru_100248948 table:0]);
  v30[10] = v8;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"All New Episodes" value:&stru_100248948 table:0]);
  v30[11] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 12LL));

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithArray:",  &off_100255218));
  id v13 = [v11 mutableCopy];
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:]( &OBJC_CLASS___MTOptionsDescription,  "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:",  v11,  v13,  v12,  0LL,  &stru_100242FA0));

  return v14;
}

- (id)stringForGlobalDefaultLimit
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  BOOL v3 = (const mach_header_64 *)[v2 episodeLimitForKey:kMTPodcastEpisodeLimitDefaultKey];

  switch((unint64_t)v3)
  {
    case 0uLL:
      objc_super v4 = @"All New Episodes";
      break;
    case 1uLL:
      objc_super v4 = @"Latest Episode";
      break;
    case 2uLL:
      objc_super v4 = @"2 Latest Episodes";
      break;
    case 3uLL:
      objc_super v4 = @"3 Latest Episodes";
      break;
    case 4uLL:
      objc_super v4 = @"5 Latest Episodes";
      break;
    case 5uLL:
      objc_super v4 = @"10 Latest Episodes";
      break;
    case 6uLL:
      objc_super v4 = @"Last 24 Hours";
      break;
    case 7uLL:
      objc_super v4 = @"Last 7 Days";
      break;
    case 8uLL:
      objc_super v4 = @"Last 14 Days";
      break;
    case 9uLL:
      objc_super v4 = @"Last 30 Days";
      break;
    default:
      id v5 = @"Default";
      if (v3 == &_mh_execute_header) {
        objc_super v4 = @"Off";
      }
      else {
        objc_super v4 = v5;
      }
      break;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"Default (%@)" value:&stru_100248948 table:0]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v4 value:&stru_100248948 table:0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v9));

  return v10;
}

- (id)optionsForLimitSetting
{
  char v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  char v46 = (void *)objc_claimAutoreleasedReturnValue([v48 localizedStringForKey:@"Off" value:&stru_100248948 table:0]);
  v53[0] = v46;
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v44 localizedStringForKey:@"1 Most Recent" value:&stru_100248948 table:0]);
  v53[1] = v42;
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v40 localizedStringForKey:@"2 Most Recent" value:&stru_100248948 table:0]);
  v53[2] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v36 localizedStringForKey:@"3 Most Recent" value:&stru_100248948 table:0]);
  v53[3] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedStringForKey:@"5 Most Recent" value:&stru_100248948 table:0]);
  v53[4] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedStringForKey:@"10 Most Recent" value:&stru_100248948 table:0]);
  v53[5] = v27;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"1 Day" value:&stru_100248948 table:0]);
  v53[6] = v3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"1 Week" value:&stru_100248948 table:0]);
  v53[7] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"2 Weeks" value:&stru_100248948 table:0]);
  v53[8] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"1 Month" value:&stru_100248948 table:0]);
  v53[9] = v9;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 10LL));

  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v49 localizedStringForKey:@"Off" value:&stru_100248948 table:0]);
  v52[0] = v47;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v45 localizedStringForKey:@"1 Next" value:&stru_100248948 table:0]);
  v52[1] = v43;
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v41 localizedStringForKey:@"2 Next" value:&stru_100248948 table:0]);
  v52[2] = v39;
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedStringForKey:@"3 Next" value:&stru_100248948 table:0]);
  v52[3] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v33 localizedStringForKey:@"5 Next" value:&stru_100248948 table:0]);
  v52[4] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedStringForKey:@"10 Next" value:&stru_100248948 table:0]);
  v52[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"1 Day" value:&stru_100248948 table:0]);
  v52[6] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"1 Week" value:&stru_100248948 table:0]);
  v52[7] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:@"2 Weeks" value:&stru_100248948 table:0]);
  v52[8] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:@"1 Month" value:&stru_100248948 table:0]);
  v52[9] = v18;
  uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 10LL));

  uint64_t v20 = (void *)v19;
  if (self->_isSerialPodcast) {
    v21 = (void *)v19;
  }
  else {
    v21 = v50;
  }
  id v22 = v21;
  id v23 = [v22 mutableCopy];
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithArray:",  &off_100255230));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:]( &OBJC_CLASS___MTOptionsDescription,  "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:",  v22,  v23,  v24,  0LL,  &stru_100242FC0));

  return v25;
}

- (id)optionsForDeletePlayedEpisodes
{
  v21[0] = @"PLACEHOLDER";
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"On" value:&stru_100248948 table:0]);
  v21[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Off" value:&stru_100248948 table:0]);
  v21[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  id v8 = [v7 mutableCopy];

  id v9 = [v8 mutableCopy];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithArray:",  &off_100255248));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  +[MTPodcast deletePlayedEpisodesDefaultValue]( &OBJC_CLASS___MTPodcast,  "deletePlayedEpisodesDefaultValue")));
  id v12 = [v10 indexOfObject:v11];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"Default (%@)" value:&stru_100248948 table:0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v12]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v15));
  [v8 setObject:v16 atIndexedSubscript:0];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v12]);
  [v9 setObject:v17 atIndexedSubscript:0];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100093BF4;
  v20[3] = &unk_100242FE8;
  v20[4] = self;
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:]( &OBJC_CLASS___MTOptionsDescription,  "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:",  v8,  v9,  v10,  v20,  0LL));

  return v18;
}

- (id)deletePlayedText:(int64_t)a3
{
  id v3 = (id)a3;
  if (a3 == 0xFFFFFFFFLL) {
    id v3 = +[MTPodcast deletePlayedEpisodesDefaultValue](&OBJC_CLASS___MTPodcast, "deletePlayedEpisodesDefaultValue");
  }
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = v4;
  if (v3 == (id)1) {
    v6 = @"DELETE_PLAYED_FOOTER_ON";
  }
  else {
    v6 = @"DELETE_PLAYED_FOOTER_OFF";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100248948 table:0]);

  return v7;
}

- (id)autoDownloadFooterTextWithGlobalLimit
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"CHANGE_FOR_ALL" value:&stru_100248948 table:0]);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"AUTODOWNLOAD_FOOTER_MACOS" value:&stru_100248948 table:0]);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v5,  @"%@",  0LL,  v3));
  id v7 = [v6 rangeOfString:v3];
  uint64_t v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", UIApplicationOpenSettingsURLString));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:]( &OBJC_CLASS___MTSettingsGroup,  "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:",  v6,  NSLinkAttributeName,  v10,  v7,  v9));

  return v11;
}

- (id)optionsForHidesPlayedEpisodes
{
  v20[0] = @"PLACEHOLDER";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"Off" value:&stru_100248948 table:0]);
  v20[1] = v3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"On" value:&stru_100248948 table:0]);
  v20[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL));
  id v7 = [v6 mutableCopy];

  id v8 = [v7 mutableCopy];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithArray:",  &off_100255260));
  else {
    uint64_t v10 = 1LL;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  id v12 = [v9 indexOfObject:v11];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"Default (%@)" value:&stru_100248948 table:0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v12]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v15));
  [v7 setObject:v16 atIndexedSubscript:0];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v12]);
  [v8 setObject:v17 atIndexedSubscript:0];

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTOptionsDescription optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:]( &OBJC_CLASS___MTOptionsDescription,  "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:",  v7,  v8,  v9,  0LL,  0LL));
  return v18;
}

- (void)updateEpisodeLimit:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100094144;
  v9[3] = &unk_100240710;
  id v10 = v6;
  v11 = self;
  int64_t v12 = a3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v9];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  [v8 showSettings:self changedEpisodeLimit:a3];

  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateRemovePlayedDownloads:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController uuid](self, "uuid"));
  +[MTPodcast setRemovePlayedDownloadsSetting:forPodcastUuid:]( &OBJC_CLASS___MTPodcast,  "setRemovePlayedDownloadsSetting:forPodcastUuid:",  a3,  v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  [v6 showSettings:self changedRemovePlayedDownloads:a3];

  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController uuid](self, "uuid"));
  if (v3)
  {
    [v5 enableSubscriptionOnPodcastUUID:v6 from:3];

    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    uint64_t v19 = sub_1000943D8;
    uint64_t v20 = sub_1000943E8;
    id v21 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000943F0;
    v12[3] = &unk_100240558;
    id v9 = v8;
    id v13 = v9;
    v14 = self;
    v15 = &v16;
    [v9 performBlockAndWait:v12];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreReportingController sharedInstance]( &OBJC_CLASS___MTStoreReportingController,  "sharedInstance"));
    [v10 reportWithType:4 userInfo:v17[5] location:@"psst" reason:0];

    _Block_object_dispose(&v16, 8);
  }

  else
  {
    [v5 disableSubscriptionOnPodcastUUID:v6 from:3];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  [v11 showSettings:self changedSubscribed:v3];

  -[MTShowSettingsViewController updateNotificationSettingsToMatchSubscription:]( self,  "updateNotificationSettingsToMatchSubscription:",  v3);
  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100094544;
  v9[3] = &unk_100241458;
  id v10 = v6;
  v11 = self;
  BOOL v12 = v3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v9];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  [v8 showSettings:self changedNotifications:v3];

  -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
}

- (void)updateEpisodeOrderSetting:(unint64_t)a3
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000946F0;
  v9[3] = &unk_100243010;
  id v7 = v6;
  id v10 = v7;
  v11 = self;
  BOOL v12 = &v19;
  id v13 = &v15;
  unint64_t v14 = a3;
  [v7 performBlockAndWait:v9];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController delegate](self, "delegate"));
  [v8 showSettings:self changedShowType:v20[3]];

  if (*((_BYTE *)v16 + 24)) {
    -[MTShowSettingsViewController refreshSettings](self, "refreshSettings");
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (id)metricsName
{
  return @"PodcastSettings";
}

- (id)metricDataSource
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController uuid](self, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  return v6;
}

- (void)podcastInfoViewDidExpand:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  [v4 frame];
  double v6 = v5;

  [v7 _tableHeaderHeightDidChangeToHeight:v6];
}

- (void)podcastInfoViewWasTapped:(id)a3
{
}

+ (id)footerText
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"SETTINGS_APP" value:&stru_100248948 table:0]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SHOW_SETTINGS_EPISODE_DISPLAY_FOOTER" value:&stru_100248948 table:0]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v5,  @"%@",  0LL,  v3));
  id v7 = [v6 rangeOfString:v3];
  uint64_t v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", UIApplicationOpenSettingsURLString));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTSettingsGroup footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:]( &OBJC_CLASS___MTSettingsGroup,  "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:",  v6,  NSLinkAttributeName,  v10,  v7,  v9));

  return v11;
}

- (void)syncControllerOperationCompleted:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTShowSettingsViewController tableView](self, "tableView"));
  [v4 reloadData];
}

- (MTShowSettingsViewControllerDelegate)delegate
{
  return (MTShowSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)descriptionViewIsExpanded
{
  return self->_descriptionViewIsExpanded;
}

- (void)setDescriptionViewIsExpanded:(BOOL)a3
{
  self->_descriptionViewIsExpanded = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isSerialPodcast
{
  return self->_isSerialPodcast;
}

- (void)setIsSerialPodcast:(BOOL)a3
{
  self->_isSerialPodcast = a3;
}

- (MTSettingsGroup)showSettingsGroup
{
  return self->_showSettingsGroup;
}

- (void)setShowSettingsGroup:(id)a3
{
}

- (MTSetting)subscribedSetting
{
  return self->_subscribedSetting;
}

- (void)setSubscribedSetting:(id)a3
{
}

- (MTSettingsGroup)episodeOrderSettingsGroup
{
  return self->_episodeOrderSettingsGroup;
}

- (void)setEpisodeOrderSettingsGroup:(id)a3
{
}

- (MTOptionSetting)showTypeSetting
{
  return self->_showTypeSetting;
}

- (void)setShowTypeSetting:(id)a3
{
}

- (MTRadioGroupDescription)showTypeRadioGroup
{
  return self->_showTypeRadioGroup;
}

- (void)setShowTypeRadioGroup:(id)a3
{
}

- (MTSettingsGroup)downloadsSettingsGroup
{
  return self->_downloadsSettingsGroup;
}

- (void)setDownloadsSettingsGroup:(id)a3
{
}

- (MTOptionSetting)removePlayedDownloadsSetting
{
  return self->_removePlayedDownloadsSetting;
}

- (void)setRemovePlayedDownloadsSetting:(id)a3
{
}

- (MTOptionSetting)episodesToKeepSetting
{
  return self->_episodesToKeepSetting;
}

- (void)setEpisodesToKeepSetting:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsNotifier
{
  return self->_defaultsNotifier;
}

- (void)setDefaultsNotifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end