@interface TVAppSettingsViewController
- (BOOL)currentAutoPlayBgVideoSoundValue;
- (BOOL)didFetchConfiguration;
- (BOOL)didFetchPostPlayAutoPlaySettings;
- (BOOL)isRefreshingAppGroup;
- (NSNumber)syncMySportsEnabled;
- (TVAppSettingsViewController)init;
- (id)_accessFormatter;
- (id)_appGroup;
- (id)_autoPlayGroup;
- (id)_negateBooleanFormatter;
- (id)_notificationsGroup;
- (id)_purchasesAndRentalsGroup;
- (id)_topShelfGroup;
- (id)_videoAudioGroup;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_clearAllHistory:(id)a3;
- (void)_clearSearchHistory:(id)a3;
- (void)_handleDidUpdateAutoplayVideoSound:(id)a3;
- (void)_loadConfigurationSync:(BOOL)a3 withCompletion:(id)a4;
- (void)_loadPostPlayAutoPlaySettingsWithCompletion:(id)a3;
- (void)_promptToDisableChannel:(id)a3 withExternalID:(id)a4;
- (void)_promptToEnableChannel:(id)a3 withExternalID:(id)a4;
- (void)_refreshAppGroup;
- (void)_showPrivacy:(id)a3;
- (void)_showVppaExpiredPrompt:(id)a3;
- (void)_toggleSpecifier:(id)a3;
- (void)_updateAppDisplayNames:(BOOL)a3 withCompletion:(id)a4;
- (void)_videoResolutionSelected:(id)a3;
- (void)nextEpisodeSettingDidChange;
- (void)prepareForDeepLinkWithURL:(id)a3;
- (void)recommendedItemsSettingDidChange;
- (void)setCurrentAutoPlayBgVideoSoundValue:(BOOL)a3;
- (void)setDidFetchConfiguration:(BOOL)a3;
- (void)setDidFetchPostPlayAutoPlaySettings:(BOOL)a3;
- (void)setRefreshingAppGroup:(BOOL)a3;
- (void)setSyncMySportsEnabled:(id)a3;
- (void)syncMySportsEnabled;
- (void)syncMySportsEnabledDidChange:(id)a3;
@end

@implementation TVAppSettingsViewController

- (TVAppSettingsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVAppSettingsViewController;
  v2 = -[TVAppSettingsViewController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[TVAppSettingsViewController setDidFetchConfiguration:](v2, "setDidFetchConfiguration:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"syncMySportsEnabledDidChange:" name:WLKSportsFavoriteSyncSettingChangedNotification object:0];
  }

  return v3;
}

- (void)prepareForDeepLinkWithURL:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiTunesAccount"));

  if (v5 && -[TVAppSettingsViewController didFetchConfiguration](self, "didFetchConfiguration")) {
    -[TVAppSettingsViewController _updateAppDisplayNames:withCompletion:]( self,  "_updateAppDisplayNames:withCompletion:",  1LL,  0LL);
  }
}

- (id)loadSettingGroups
{
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472LL;
  v113[2] = __48__TVAppSettingsViewController_loadSettingGroups__block_invoke;
  v113[3] = &unk_105A8;
  objc_copyWeak(&v114, location);
  -[TVAppSettingsViewController _loadConfigurationSync:withCompletion:]( self,  "_loadConfigurationSync:withCompletion:",  0LL,  v113);
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472LL;
  v111[2] = __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_2;
  v111[3] = &unk_105A8;
  objc_copyWeak(&v112, location);
  -[TVAppSettingsViewController _loadPostPlayAutoPlaySettingsWithCompletion:]( self,  "_loadPostPlayAutoPlaySettingsWithCompletion:",  v111);
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiTunesAccount"));

  v101 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSystemPreferencesStore sharedPreferences]( &OBJC_CLASS___WLKSystemPreferencesStore,  "sharedPreferences"));
  id v100 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"PRIVATE_MODE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v8,  0LL,  v101,  @"privateModeEnabled",  0LL,  0LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsViewController _negateBooleanFormatter](self, "_negateBooleanFormatter"));
  [v102 setLocalizedValueFormatter:v9];

  int v10 = _os_feature_enabled_impl("TVApp", "testarossa");
  v11 = @"PRIVATE_MODE_FOOTER";
  if (v10) {
    v11 = @"PRIVATE_MODE_WATCHLIST_FOOTER";
  }
  v95 = v11;
  v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:v95 value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  [v102 setLocalizedDescription:v14];

  -[NSMutableArray addObject:](v5, "addObject:", v102);
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsViewController _autoPlayGroup](self, "_autoPlayGroup"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsViewController _videoAudioGroup](self, "_videoAudioGroup"));
  if (_os_feature_enabled_impl("TVApp", "testarossa"))
  {
    v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v94 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"CONTINUE_WATCHING_ART_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  }

  else
  {
    v17 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v94 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"UP_NEXT_ART_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  }

  v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"UP_NEXT_ART_POSTER_ART" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  v21 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"UP_NEXT_ART_STILL_FRAME" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  v99 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v94,  0LL,  v101,  @"upNextLockupsUseCoverArt",  v20,  v23));

  if (_os_feature_enabled_impl("TVApp", "testarossa"))
  {
    v24 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"CONTINUE_WATCHING_ART_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  }

  else
  {
    v27 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v26 = objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"UP_NEXT_ART_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  }

  v28 = (void *)v26;
  [v99 setLocalizedDescription:v26];

  if (-[TVAppSettingsViewController didFetchConfiguration](self, "didFetchConfiguration"))
  {
    id v110 = 0LL;
    int v29 = WLKIsSportsEnabled(&v110);
    id v30 = v110;
    if (v29)
    {
      v31 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue( [v32 localizedStringForKey:@"SPORTS_SPOILERS_ALLOWED" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v33,  0LL,  v101,  @"sportsScoreSpoilersAllowed",  0LL,  0LL));

      v35 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"SPORTS_SPOILER_ALLOWED_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      [v34 setLocalizedDescription:v37];

      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472LL;
      v109[2] = __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_3;
      v109[3] = &unk_105D0;
      v109[4] = self;
      [v34 setUpdateBlock:v109];
      -[NSMutableArray addObject:](v5, "addObject:", v34);
      unsigned int v38 = +[WLKSportsFavoriteManager isOptOutAvailable]( &OBJC_CLASS___WLKSportsFavoriteManager,  "isOptOutAvailable");
      if (v98) {
        unsigned int v39 = v38;
      }
      else {
        unsigned int v39 = 0;
      }
      if (v39 == 1)
      {
        id v108 = 0LL;
        int v40 = WLKIsSportsFavoritesEnabled(&v108);
        id v41 = v108;
        if (v40)
        {
          v42 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"SYNC_MY_SPORTS_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
          v45 = -[TVAppSettingsSyncMySportsEnabledShim initWithDelegate:]( objc_alloc(&OBJC_CLASS___TVAppSettingsSyncMySportsEnabledShim),  "initWithDelegate:",  self);
          v93 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v44,  0LL,  v45,  @"syncMySportsEnabled",  0LL,  0LL));

          v46 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
          v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue( [v47 localizedStringForKey:@"SYNC_MY_SPORTS_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
          [v93 setLocalizedDescription:v48];

          -[NSMutableArray addObject:](v5, "addObject:", v93);
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  @"com.apple.onboarding.mysports"));
          v50 = (void *)objc_claimAutoreleasedReturnValue([v49 flow]);
          v92 = v49;
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 localizedButtonTitle]);
          v106[0] = _NSConcreteStackBlock;
          v106[1] = 3221225472LL;
          v106[2] = __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_67;
          v106[3] = &unk_105F8;
          id v52 = v50;
          id v107 = v52;
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v51,  0LL,  0LL,  0LL,  v106));
          [v53 setShouldPresentChildController:1];
          -[NSMutableArray addObject:](v5, "addObject:", v53);
        }
      }

      else
      {
        id v41 = 0LL;
      }
    }

    -[NSMutableArray addObject:](v5, "addObject:", v99);
    if ((_os_feature_enabled_impl("TVApp", "nimbus") & 1) == 0)
    {
      v58 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue( [v59 localizedStringForKey:@"POST_PLAY_AUTO_PLAY_NEXT_VIDEO" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v60,  0LL,  v101,  @"postPlayAutoPlayNextVideo",  0LL,  0LL));

      v62 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue( [v63 localizedStringForKey:@"POST_PLAY_AUTO_PLAY_NEXT_VIDEO_THIS_DEVICE_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      [v61 setLocalizedDescription:v64];

      -[NSMutableArray addObject:](v5, "addObject:", v61);
    }

    [v100 setSettingItems:v5];
    -[NSMutableArray addObject:](v3, "addObject:", v100);
    if (v97) {
      -[NSMutableArray addObject:](v3, "addObject:", v97);
    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsViewController _topShelfGroup](self, "_topShelfGroup"));
    if (v65) {
      -[NSMutableArray addObject:](v3, "addObject:", v65);
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsViewController _notificationsGroup](self, "_notificationsGroup"));
    v67 = (void *)objc_claimAutoreleasedReturnValue([v66 settingItems]);
    id v68 = [v67 count];

    if (v68) {
      -[NSMutableArray addObject:](v3, "addObject:", v66);
    }
    if (v96) {
      -[NSMutableArray addObject:](v3, "addObject:", v96);
    }
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsViewController _purchasesAndRentalsGroup](self, "_purchasesAndRentalsGroup"));
    -[NSMutableArray addObject:](v3, "addObject:", v69);
    if (v98)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVAppSettingsViewController _appGroup](self, "_appGroup"));
      [v70 setAutoHide:1];
      -[TVAppSettingsViewController _refreshAppGroup](self, "_refreshAppGroup");
      objc_initWeak(&from, self);
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472LL;
      v103[2] = __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_2_77;
      v103[3] = &unk_10620;
      objc_copyWeak(&v104, &from);
      [v70 setUpdateBlock:v103];
      -[NSMutableArray addObject:](v3, "addObject:", v70);
      objc_destroyWeak(&v104);
      objc_destroyWeak(&from);
    }
  }

  else
  {
    -[NSMutableArray addObject:](v5, "addObject:", v99);
    [v100 setSettingItems:v5];
    -[NSMutableArray addObject:](v3, "addObject:", v100);
    if (v97) {
      -[NSMutableArray addObject:](v3, "addObject:", v97);
    }
    if (v96) {
      -[NSMutableArray addObject:](v3, "addObject:", v96);
    }
    id v54 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
    v55 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue( [v56 localizedStringForKey:@"LOADING" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    id v30 = [v54 initWithTitle:v57];

    [v30 setAutoHide:0];
    [v30 setUpdateBlock:&__block_literal_global];
    -[NSMutableArray addObject:](v3, "addObject:", v30);
  }

  id v71 = [[TSKSettingGroup alloc] initWithTitle:0];
  v72 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v73 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue( [v74 localizedStringForKey:@"CLEAR_SEARCH_HISTORY" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v75,  0LL,  0LL,  0LL,  self,  "_clearSearchHistory:"));

  v77 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  v79 = (void *)objc_claimAutoreleasedReturnValue( [v78 localizedStringForKey:@"CLEAR_SEARCH_HISTORY_FOOTER" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  [v76 setLocalizedDescription:v79];

  -[NSMutableArray addObject:](v72, "addObject:", v76);
  if (v98)
  {
    v80 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
    v82 = (void *)objc_claimAutoreleasedReturnValue( [v81 localizedStringForKey:@"CLEAR_HISTORY" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    v83 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v82,  0LL,  0LL,  0LL,  self,  "_clearAllHistory:"));

    v84 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
    v86 = (void *)objc_claimAutoreleasedReturnValue( [v85 localizedStringForKey:@"CLEAR_HISTORY_FOOTER_FORMAT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    [v83 setLocalizedDescription:v86];

    -[NSMutableArray addObject:](v72, "addObject:", v83);
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyLinkController linkWithBundleIdentifier:]( &OBJC_CLASS___OBPrivacyLinkController,  "linkWithBundleIdentifier:",  @"com.apple.onboarding.tvapp"));
  v88 = (void *)objc_claimAutoreleasedReturnValue([v87 flow]);
  v89 = (void *)objc_claimAutoreleasedReturnValue([v88 localizedButtonTitle]);

  v90 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v89,  0LL,  0LL,  0LL,  self,  "_showPrivacy:"));
  [v90 setAccessoryTypes:1];
  -[NSMutableArray addObject:](v72, "addObject:", v90);
  [v71 setSettingItems:v72];
  -[NSMutableArray addObject:](v3, "addObject:", v71);

  objc_destroyWeak(&v112);
  objc_destroyWeak(&v114);
  objc_destroyWeak(location);
  return v3;
}

void __48__TVAppSettingsViewController_loadSettingGroups__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained reloadSettings];
  }

void __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained reloadSettings];
  }

void __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = [v5 BOOLValue];
  if (v6 != [*(id *)(*(void *)(a1 + 32) + 40) BOOLValue])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40LL), a3);
    uint64_t v7 = WLKSystemLogObject();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = [v5 BOOLValue];
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Settings Show Sports Scores value changed to %d",  (uint8_t *)v10,  8u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PluginAnalytics sharedInstance](&OBJC_CLASS___PluginAnalytics, "sharedInstance"));
    [v9 recordSettingsChange:@"showSportsScores" value:v5];
  }
}

id __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_67(uint64_t a1)
{
  return [[OBPrivacySplashController alloc] initWithFlow:*(void *)(a1 + 32)];
}

void __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_2_77(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  else {
    uint64_t v4 = 0LL;
  }
  [v3 setAccessoryTypes:v4];
}

void __48__TVAppSettingsViewController_loadSettingGroups__block_invoke_3_80(id a1, TSKSettingItem *a2, id a3)
{
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  tvPreviewViewController = self->_tvPreviewViewController;
  if (!tvPreviewViewController)
  {
    unsigned int v6 = (TSKPreviewViewController *)[[TSKAppIconPreviewViewController alloc] initWithApplicationBundleIdentifier:@"com.apple.TVWatchList"];
    uint64_t v7 = self->_tvPreviewViewController;
    self->_tvPreviewViewController = v6;

    tvPreviewViewController = self->_tvPreviewViewController;
  }

  v8 = tvPreviewViewController;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[TSKPreviewViewController setDescriptionText:](v8, "setDescriptionText:", v9);

  return v8;
}

- (void)_loadPostPlayAutoPlaySettingsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  objc_initWeak(&location, self);
  if (-[TVAppSettingsViewController didFetchPostPlayAutoPlaySettings](self, "didFetchPostPlayAutoPlaySettings"))
  {
    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    id v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[WLKPostPlayAutoPlayManager defaultManager]( &OBJC_CLASS___WLKPostPlayAutoPlayManager,  "defaultManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    _DWORD v10[2] = __75__TVAppSettingsViewController__loadPostPlayAutoPlaySettingsWithCompletion___block_invoke;
    v10[3] = &unk_10688;
    objc_copyWeak(&v12, &location);
    uint64_t v7 = v5;
    v11 = v7;
    [v6 fetchStatusForAllTypesWithCompletion:v10];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __75__TVAppSettingsViewController__loadPostPlayAutoPlaySettingsWithCompletion___block_invoke_2;
    v8[3] = &unk_106B0;
    v9 = v4;
    dispatch_group_notify(v7, &_dispatch_main_q, v8);

    objc_destroyWeak(&v12);
  }

  objc_destroyWeak(&location);
}

void __75__TVAppSettingsViewController__loadPostPlayAutoPlaySettingsWithCompletion___block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDidFetchPostPlayAutoPlaySettings:1];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __75__TVAppSettingsViewController__loadPostPlayAutoPlaySettingsWithCompletion___block_invoke_2( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1LL);
  }
  return result;
}

- (void)_loadConfigurationSync:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  unsigned int v6 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  objc_initWeak(&location, self);
  if (-[TVAppSettingsViewController didFetchConfiguration](self, "didFetchConfiguration"))
  {
    if (v6) {
      v6[2](v6, 0LL);
    }
  }

  else
  {
    uint64_t v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[WLKConfigurationManager sharedInstance](&OBJC_CLASS___WLKConfigurationManager, "sharedInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __69__TVAppSettingsViewController__loadConfigurationSync_withCompletion___block_invoke;
    v15[3] = &unk_10700;
    v9 = v7;
    v16 = v9;
    BOOL v18 = v4;
    objc_copyWeak(&v17, &location);
    [v8 fetchConfigurationWithOptions:0 cachePolicy:1 queryParameters:0 completion:v15];

    if (v4)
    {
      dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
      dispatch_group_wait(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelUtilities sharedInstance](&OBJC_CLASS___WLKChannelUtilities, "sharedInstance"));
      id v12 = [v11 orderedChannels];

      -[TVAppSettingsViewController setDidFetchConfiguration:](self, "setDidFetchConfiguration:", 1LL);
      if (v6) {
        v6[2](v6, 1LL);
      }
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __69__TVAppSettingsViewController__loadConfigurationSync_withCompletion___block_invoke_106;
      block[3] = &unk_106B0;
      v14 = v6;
      dispatch_group_notify(v9, &_dispatch_main_q, block);
    }

    objc_destroyWeak(&v17);
  }

  objc_destroyWeak(&location);
}

void __69__TVAppSettingsViewController__loadConfigurationSync_withCompletion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (v6)
  {
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    uint64_t v11 = WLKNetworkingLogObject();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Failed to fetch init/config %@", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  else if (*(_BYTE *)(a1 + 48))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelUtilities sharedInstance](&OBJC_CLASS___WLKChannelUtilities, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __69__TVAppSettingsViewController__loadConfigurationSync_withCompletion___block_invoke_103;
    v14[3] = &unk_106D8;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    char v17 = v9;
    id v15 = *(id *)(a1 + 32);
    [v13 loadIfNeededWithCompletion:v14];

    objc_destroyWeak(&v16);
  }
}

void __69__TVAppSettingsViewController__loadConfigurationSync_withCompletion___block_invoke_103( uint64_t a1,  unsigned int a2,  void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (v5) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = a2;
  }
  if (*(_BYTE *)(a1 + 48)) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0LL;
  }
  [WeakRetained setDidFetchConfiguration:v9];
  if (v5)
  {
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    uint64_t v11 = WLKNetworkingLogObject();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Failed to fetch brands %@", (uint8_t *)&v13, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__TVAppSettingsViewController__loadConfigurationSync_withCompletion___block_invoke_106( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1LL);
  }
  return result;
}

- (id)_autoPlayGroup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_activeiTunesAccount"));

  if (v4 && _os_feature_enabled_impl("TVApp", "nimbus"))
  {
    id v5 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
    id v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"AUTO_PLAY_GROUP" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    id v9 = [v5 initWithTitle:v8];

    objc_initWeak(&location, self);
    v39[1] = 3221225472LL;
    v39[2] = __45__TVAppSettingsViewController__autoPlayGroup__block_invoke;
    v39[3] = &unk_10620;
    v39[0] = _NSConcreteStackBlock;
    objc_copyWeak(&v40, &location);
    [v9 setUpdateBlock:v39];
    dispatch_time_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (self->_didFetchPostPlayAutoPlaySettings)
    {
      id v11 = [[WLKPostPlayAutoPlayToggleInterface alloc] initWithDelegate:self];
      id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"AUTO_PLAY_NEXT_EPISODE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v14,  0LL,  v11,  @"isNextEpisodeSettingEnabled",  0LL,  0LL));

      id v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      char v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"AUTO_PLAY_NEXT_EPISODE_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      [v15 setLocalizedDescription:v18];

      -[NSMutableArray addObject:](v10, "addObject:", v15);
      v19 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"AUTO_PLAY_RECOMMENDED_ITEMS" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v21,  0LL,  v11,  @"isRecommendedItemsSettingEnabled",  0LL,  0LL));

      v23 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"AUTO_PLAY_RECOMMENDED_ITEMS_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      [v22 setLocalizedDescription:v25];

      -[NSMutableArray addObject:](v10, "addObject:", v22);
    }

    else
    {
      uint64_t v26 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"AUTO_PLAY_NEXT_EPISODE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v28,  0LL,  0LL,  0LL));

      int v29 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"AUTO_PLAY_NEXT_EPISODE_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      [v11 setLocalizedDescription:v31];

      -[NSMutableArray addObject:](v10, "addObject:", v11);
      v32 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 localizedStringForKey:@"AUTO_PLAY_RECOMMENDED_ITEMS" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem titleItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKSettingItem,  "titleItemWithTitle:description:representedObject:keyPath:",  v34,  0LL,  0LL,  0LL));

      v35 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 localizedStringForKey:@"AUTO_PLAY_RECOMMENDED_ITEMS_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      [v15 setLocalizedDescription:v37];

      -[NSMutableArray addObject:](v10, "addObject:", v15);
    }

    [v9 setSettingItems:v10];
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

void __45__TVAppSettingsViewController__autoPlayGroup__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  else {
    uint64_t v4 = 4LL;
  }

  [v5 setAccessoryTypes:v4];
}

- (id)_videoAudioGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"VIDEO_AUDIO_GROUP" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v42 = [v3 initWithTitle:v6];

  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = objc_alloc(&OBJC_CLASS___TSKPreferencesFacade);
  uint64_t v8 = WLKTVAppBundleID();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v46 = [v7 initWithDomain:v9 notifyChanges:1];

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  LODWORD(v9) = +[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR");
  dispatch_time_t v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"VIDEO_QUALITY_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  if ((_DWORD)v9)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v12,  0LL,  v44,  @"iTunesFileVideoResolution",  self,  "_videoResolutionSelected:"));

    id v14 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
    id v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    char v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"VIDEO_QUALITY_VALUE_BEST" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    v53[0] = v17;
    BOOL v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"VIDEO_QUALITY_VALUE_BETTER" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    v53[1] = v20;
    v21 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"VIDEO_QUALITY_VALUE_GOOD" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    v53[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 3LL));
    id v25 = [v14 initWithInputs:&off_11DA0 outputs:v24];

    [v13 setLocalizedValueFormatter:v25];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = __47__TVAppSettingsViewController__videoAudioGroup__block_invoke;
    v52[3] = &unk_105D0;
    v52[4] = self;
    [v13 setUpdateBlock:v52];
  }

  else
  {
    uint64_t v26 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"VIDEO_QUALITY_VALUE_BEST" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    int v29 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"VIDEO_QUALITY_VALUE_GOOD" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v12,  0LL,  v44,  @"iTunesFileVideoResolution",  v28,  v31));

    [v13 setAvailableValues:&off_11DB8];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = __47__TVAppSettingsViewController__videoAudioGroup__block_invoke_2;
    v50[3] = &unk_10728;
    v50[4] = self;
    id v51 = v44;
    [v13 setUpdateBlock:v50];
  }

  -[NSMutableArray addObject:](v45, "addObject:", v13, v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v46 valueForKey:@"AutoPlayBgVideoSound"]);
  v33 = v32;
  if (v32)
  {
    -[TVAppSettingsViewController setCurrentAutoPlayBgVideoSoundValue:]( self,  "setCurrentAutoPlayBgVideoSoundValue:",  [v32 BOOLValue]);
  }

  else
  {
    -[TVAppSettingsViewController setCurrentAutoPlayBgVideoSoundValue:]( self,  "setCurrentAutoPlayBgVideoSoundValue:",  1LL);
    [v46 setValue:&__kCFBooleanTrue forKey:@"AutoPlayBgVideoSound"];
  }

  v34 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue( [v35 localizedStringForKey:@"AUTOPLAY_VIDEO_SOUND" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  v37 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue( [v38 localizedStringForKey:@"AUTOPLAY_VIDEO_SOUND_FOOTER" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v40 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v36,  v39,  v46,  @"AutoPlayBgVideoSound",  0LL,  0LL));

  objc_initWeak(&location, self);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = __47__TVAppSettingsViewController__videoAudioGroup__block_invoke_3;
  v47[3] = &unk_10620;
  objc_copyWeak(&v48, &location);
  [v40 setUpdateBlock:v47];
  -[NSMutableArray addObject:](v45, "addObject:", v40);
  [v43 setSettingItems:v45];
  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

  return v43;
}

void __47__TVAppSettingsViewController__videoAudioGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = (char *)[a3 integerValue];
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    dispatch_time_t v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v8 = v7;
    id v9 = @"VIDEO_QUALITY_VALUE_BETTER_DESCRIPTION";
  }

  else if (v5 == (_BYTE *)&dword_0 + 2)
  {
    id v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = v7;
    id v9 = @"VIDEO_QUALITY_VALUE_BEST_DESCRIPTION";
  }

  else
  {
    id v11 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v8 = v7;
    id v9 = @"VIDEO_QUALITY_VALUE_GOOD_DESCRIPTION";
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  [v13 setLocalizedDescription:v12];
}

id __47__TVAppSettingsViewController__videoAudioGroup__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (char *)[v5 integerValue];
  uint64_t v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_time_t v10 = v9;
  if (v7 == (_BYTE *)&dword_0 + 1) {
    id v11 = @"VIDEO_QUALITY_VALUE_BEST_DESCRIPTION";
  }
  else {
    id v11 = @"VIDEO_QUALITY_VALUE_GOOD_DESCRIPTION";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v11 value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  [v6 setLocalizedDescription:v12];

  objc_msgSend(*(id *)(a1 + 40), "setITunesMaxHLSVideoResolution:", objc_msgSend(v5, "integerValue"));
  id v13 = *(void **)(a1 + 40);
  id v14 = [v5 integerValue];

  return [v13 setITunesFileVideoResolution:v14];
}

void __47__TVAppSettingsViewController__videoAudioGroup__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  NSLog(@"Settings: autoplayVideoSound did update to value %@", v6);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      [WeakRetained _handleDidUpdateAutoplayVideoSound:v6];
    }
  }
}

- (void)_videoResolutionSelected:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance", a3));
  id v3 = (char *)[v5 iTunesFileVideoResolution];
  if (v3) {
    uint64_t v4 = v3 != (_BYTE *)&dword_0 + 1;
  }
  else {
    uint64_t v4 = 2LL;
  }
  [v5 setITunesMaxHLSVideoResolution:v4];
  [v5 setITunesFileVideoResolution:v4];
}

- (id)_purchasesAndRentalsGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", @"PURCHASES_AND_RENTALS_SECTION_TITLE"));
  id v23 = [v3 initWithTitle:v6];

  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"PURCHASES_AND_RENTALS_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  dispatch_time_t v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"PURCHASES_AND_RENTALS_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"PURCHASES_AND_RENTALS_HD_VALUE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  char v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"PURCHASES_AND_RENTALS_SD_VALUE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v9,  v12,  v21,  @"iTunesVideoPurchaseResolution",  v15,  v18));

  [v19 setAvailableValues:&off_11DD0];
  -[NSMutableArray addObject:](v22, "addObject:", v19);
  [v23 setSettingItems:v22];

  return v23;
}

- (void)_handleDidUpdateAutoplayVideoSound:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    unsigned int v5 = [v4 BOOLValue];
    BOOL v6 = v5 == -[TVAppSettingsViewController currentAutoPlayBgVideoSoundValue](self, "currentAutoPlayBgVideoSoundValue");
    id v4 = v11;
    if (!v6)
    {
      NSLog(@"Settings: User has updated autoplayVideoSound to new value %@", v11);
      -[TVAppSettingsViewController setCurrentAutoPlayBgVideoSoundValue:]( self,  "setCurrentAutoPlayBgVideoSoundValue:",  [v11 BOOLValue]);
      id v7 = objc_alloc(&OBJC_CLASS___TSKPreferencesFacade);
      uint64_t v8 = WLKTVAppBundleID();
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = [v7 initWithDomain:v9 notifyChanges:1];

      [v10 setValue:&__kCFBooleanTrue forKey:@"AutoPlayBgVideoSoundUserHasChanged"];
      id v4 = v11;
    }
  }
}

- (id)_notificationsGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"NOTIFICATIONS_GROUP" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v7 = [v3 initWithTitle:v6];

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[WLKPushNotificationSettings defaultSettings]( &OBJC_CLASS___WLKPushNotificationSettings,  "defaultSettings"));
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x3032000000LL;
  v44[3] = __Block_byref_object_copy_;
  v44[4] = __Block_byref_object_dispose_;
  id v45 = 0LL;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = __50__TVAppSettingsViewController__notificationsGroup__block_invoke;
  v40[3] = &unk_10750;
  id v42 = &v46;
  id v43 = v44;
  id v10 = dispatch_semaphore_create(0LL);
  id v41 = v10;
  WLKFetchNotificationCategories(v40);
  dispatch_time_t v11 = dispatch_time(0LL, 5000000000LL);
  if (dispatch_semaphore_wait(v10, v11))
  {
    NSLog(@"Settings: Fetch notification categories from bag timed out.");
  }

  else
  {
    uint64_t v12 = v47[3];
    if ((v12 & 1) != 0)
    {
      int v13 = _os_feature_enabled_impl("TVApp", "testarossa");
      id v14 = @"EXPLICIT_NOTIFICATIONS_TOPIC";
      if (v13) {
        id v14 = @"EXPLICIT_NOTIFICATIONS_WATCHLIST_TOPIC";
      }
      unsigned int v39 = v14;
      int v15 = _os_feature_enabled_impl("TVApp", "testarossa");
      id v16 = @"EXPLICIT_NOTIFICATIONS_DESCRIPTION";
      if (v15) {
        id v16 = @"EXPLICIT_NOTIFICATIONS_WATCHLIST_DESCRIPTION";
      }
      unsigned int v38 = v16;
      char v17 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:v39 value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      v20 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:v38 value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v19,  v22,  v9,  @"allowExplicitNotifications",  0LL,  0LL));

      -[NSMutableArray addObject:](v8, "addObject:", v23);
      uint64_t v12 = v47[3];
    }

    if ((v12 & 2) != 0)
    {
      v24 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"IMPLICIT_NOTIFICATIONS_TOPIC" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      v27 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      int v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"IMPLICIT_NOTIFICATIONS_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v26,  v29,  v9,  @"allowImplicitNotifications",  0LL,  0LL));

      -[NSMutableArray addObject:](v8, "addObject:", v30);
      uint64_t v12 = v47[3];
    }

    if ((v12 & 4) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.WatchListKit"));
      v32 = (void *)objc_claimAutoreleasedReturnValue( [v31 localizedStringForKey:@"MARKETING_PUSH_NOTIFICATIONS" value:&stru_10E38 table:@"WatchListKit"]);
      v33 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue( [v34 localizedStringForKey:@"MARKETING_NOTIFICATIONS_DESCRIPTION" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v32,  v35,  v9,  @"allowMarketingNotifications",  0LL,  0LL));

      -[NSMutableArray addObject:](v8, "addObject:", v36);
    }

    objc_msgSend(v7, "setSettingItems:", v8, v38);
  }

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  return v7;
}

void __50__TVAppSettingsViewController__notificationsGroup__block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_topShelfGroup
{
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TOPSHELF_SECTION_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v35 = [v3 initWithTitle:v6];

  id v7 = objc_alloc(&OBJC_CLASS___TSKPreferencesFacade);
  uint64_t v8 = WLKTVAppBundleID();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v7 initWithDomain:v9 notifyChanges:1];

  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:@"TopShelfShowUpNext"]);
  if (!v11)
  {
    dispatch_time_t v11 = &__kCFBooleanFalse;
    [v10 setValue:&__kCFBooleanFalse forKey:@"TopShelfShowUpNext"];
  }

  objc_storeStrong((id *)&self->_topShelfUpNextEnabled, v11);
  int v12 = _os_feature_enabled_impl("TVApp", "testarossa");
  v34 = v10;
  int v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  int v15 = v14;
  if (v12) {
    id v16 = @"TOPSHELF_CONTINUE_WATCHING_DESCRIPTION";
  }
  else {
    id v16 = @"TOPSHELF_DESCRIPTION";
  }
  uint64_t v32 = objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v16 value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  int v17 = _os_feature_enabled_impl("TVApp", "testarossa");
  BOOL v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v17) {
    v21 = @"TOPSHELF_VALUE_CONTINUE_WATCHING";
  }
  else {
    v21 = @"TOPSHELF_VALUE_UPNEXT";
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v19,  "localizedStringForKey:value:table:",  v21,  &stru_10E38,  @"TVAppSettings_tvOS",  v32));

  id v23 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"TOPSHELF_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  uint64_t v26 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"TOPSHELF_VALUE_WTW" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  int v29 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v25,  v33,  v34,  @"TopShelfShowUpNext",  v22,  v28));

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = __45__TVAppSettingsViewController__topShelfGroup__block_invoke;
  v36[3] = &unk_105D0;
  v36[4] = self;
  [v29 setUpdateBlock:v36];
  if (v29)
  {
    v37 = v29;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
    [v35 setSettingItems:v30];
  }

  return v35;
}

void __45__TVAppSettingsViewController__topShelfGroup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  +[WLKTopShelfCacheManager requestInvalidation](&OBJC_CLASS___WLKTopShelfCacheManager, "requestInvalidation");
  +[WLKTopShelfCacheManager requestReload](&OBJC_CLASS___WLKTopShelfCacheManager, "requestReload");
  unsigned int v6 = [v5 BOOLValue];
  if (v6 != [*(id *)(*(void *)(a1 + 32) + 32) BOOLValue])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32LL), a3);
    uint64_t v7 = WLKSystemLogObject();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = [v5 BOOLValue];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Settings TopShelf value changed to %d", (uint8_t *)v10, 8u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PluginAnalytics sharedInstance](&OBJC_CLASS___PluginAnalytics, "sharedInstance"));
    [v9 recordSettingsChange:@"showUpNextOnHomeScreen" value:v5];
  }
}

- (id)_appGroup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  objc_initWeak(&location, self);
  id v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"APPS_GROUP" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  dispatch_time_t v11 = __40__TVAppSettingsViewController__appGroup__block_invoke;
  int v12 = &unk_107A0;
  objc_copyWeak(&v13, &location);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v6,  v3,  @"_watchListAppsFiltered",  &v9));

  objc_msgSend(v7, "setComparesArrayDeeply:", 0, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

id __40__TVAppSettingsViewController__appGroup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = [[WLKAppSettingsFacade alloc] initWithSettings:v4];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    uint64_t v8 = NSStringFromSelector("accessStatus");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v7,  0LL,  v6,  v9,  WeakRetained,  "_toggleSpecifier:"));

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = __40__TVAppSettingsViewController__appGroup__block_invoke_2;
    v21[3] = &unk_105D0;
    v21[4] = WeakRetained;
    id v11 = WeakRetained;
    [v10 setUpdateBlock:v21];
    id v12 = objc_alloc(&OBJC_CLASS___TSKBlockDeepLinkKey);
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    BOOL v18 = __40__TVAppSettingsViewController__appGroup__block_invoke_3;
    v19 = &unk_10778;
    id v20 = v4;
    id v13 = [v12 initWithPredicate:&v16];
    objc_msgSend(v10, "setDynamicDeepLinkKey:", v13, v16, v17, v18, v19);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 _accessFormatter]);
    [v10 setLocalizedValueFormatter:v14];
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

void __40__TVAppSettingsViewController__appGroup__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "isRefreshingAppGroup") ^ 1);
}

id __40__TVAppSettingsViewController__appGroup__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"Connect"] & 1) != 0
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]),
        unsigned __int8 v5 = [v3 isEqual:v4],
        v4,
        (v5 & 1) != 0))
  {
    id v6 = &dword_0 + 1;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelUtilities sharedInstance](&OBJC_CLASS___WLKChannelUtilities, "sharedInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 channelIDForBundleID:v3]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]);
    id v6 = [v8 isEqual:v9];
  }

  return v6;
}

- (void)_refreshAppGroup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __47__TVAppSettingsViewController__refreshAppGroup__block_invoke;
  v4[3] = &unk_10818;
  objc_copyWeak(&v5, &location);
  [v3 synchronize:1 completion:v4];
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

void __47__TVAppSettingsViewController__refreshAppGroup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = __47__TVAppSettingsViewController__refreshAppGroup__block_invoke_2;
  v2[3] = &unk_107F0;
  v2[4] = WeakRetained;
  [WeakRetained _updateAppDisplayNames:0 withCompletion:v2];
}

void __47__TVAppSettingsViewController__refreshAppGroup__block_invoke_2(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __47__TVAppSettingsViewController__refreshAppGroup__block_invoke_3;
  block[3] = &unk_107C8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);
}

void __47__TVAppSettingsViewController__refreshAppGroup__block_invoke_3(uint64_t a1)
{
}

- (void)_updateAppDisplayNames:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(id, void))a4;
  NSLog(@"TVAppSettingsViewController - updating app display names");
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v17 = 0LL;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __69__TVAppSettingsViewController__updateAppDisplayNames_withCompletion___block_invoke;
  v14[3] = &unk_10840;
  id v16 = &v17;
  uint64_t v8 = v6;
  int v15 = v8;
  [v7 _updateDisplayNamesForUI:v14];
  if (v4)
  {
    id v9 = &_dispatch_main_q;
    dispatch_assert_queue_V2(&_dispatch_main_q);

    dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
    dispatch_group_wait(v8, v10);
    if (v5) {
      v5[2](v5, *((unsigned __int8 *)v18 + 24));
    }
  }

  else if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __69__TVAppSettingsViewController__updateAppDisplayNames_withCompletion___block_invoke_2;
    v11[3] = &unk_10868;
    id v12 = v5;
    id v13 = &v17;
    dispatch_group_notify(v8, &_dispatch_main_q, v11);
  }

  _Block_object_dispose(&v17, 8);
}

void __69__TVAppSettingsViewController__updateAppDisplayNames_withCompletion___block_invoke( uint64_t a1,  unsigned int a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  NSLog(@"TVAppSettingsViewController - app display name update finished with status: %d", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__TVAppSettingsViewController__updateAppDisplayNames_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
}

- (void)_showPrivacy:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:]( &OBJC_CLASS___OBPrivacyPresenter,  "presenterForPrivacySplashWithIdentifier:",  @"com.apple.onboarding.tvapp"));
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)nextEpisodeSettingDidChange
{
  uint64_t v3 = WLKSystemLogObject(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "auto-play next episode did change", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__TVAppSettingsViewController_nextEpisodeSettingDidChange__block_invoke;
  block[3] = &unk_10890;
  objc_copyWeak(&v6, buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __58__TVAppSettingsViewController_nextEpisodeSettingDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSettingsIfNeeded];
}

- (void)recommendedItemsSettingDidChange
{
  uint64_t v3 = WLKSystemLogObject(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "auto-play recommended items did change", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __63__TVAppSettingsViewController_recommendedItemsSettingDidChange__block_invoke;
  block[3] = &unk_10890;
  objc_copyWeak(&v6, buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __63__TVAppSettingsViewController_recommendedItemsSettingDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSettingsIfNeeded];
}

- (void)syncMySportsEnabledDidChange:(id)a3
{
  syncMySportsEnabled = self->_syncMySportsEnabled;
  self->_syncMySportsEnabled = 0LL;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __60__TVAppSettingsViewController_syncMySportsEnabledDidChange___block_invoke;
  v5[3] = &unk_10890;
  objc_copyWeak(&v6, &location);
  dispatch_async(&_dispatch_main_q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __60__TVAppSettingsViewController_syncMySportsEnabledDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSettingsIfNeeded];
}

- (NSNumber)syncMySportsEnabled
{
  syncMySportsEnabled = self->_syncMySportsEnabled;
  if (!syncMySportsEnabled)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x2020000000LL;
    char v24 = 0;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSportsFavoriteManager defaultManager](&OBJC_CLASS___WLKSportsFavoriteManager, "defaultManager"));
    int v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    uint64_t v17 = __50__TVAppSettingsViewController_syncMySportsEnabled__block_invoke;
    BOOL v18 = &unk_108B8;
    char v20 = &v21;
    id v6 = v4;
    uint64_t v19 = v6;
    [v5 isOnboarded:&v15];

    dispatch_time_t v7 = dispatch_time(0LL, 3000000000LL);
    uint64_t v8 = dispatch_semaphore_wait(v6, v7);
    if (v8)
    {
      uint64_t v10 = WLKSystemLogObject(v8, v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TVAppSettingsViewController syncMySportsEnabled].cold.1(v11);
      }
    }

    id v12 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *((unsigned __int8 *)v22 + 24),  v15,  v16,  v17,  v18));
    id v13 = self->_syncMySportsEnabled;
    self->_syncMySportsEnabled = v12;

    _Block_object_dispose(&v21, 8);
    syncMySportsEnabled = self->_syncMySportsEnabled;
  }

  return syncMySportsEnabled;
}

void __50__TVAppSettingsViewController_syncMySportsEnabled__block_invoke( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  id v6 = a4;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  uint64_t v8 = WLKSystemLogObject(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __50__TVAppSettingsViewController_syncMySportsEnabled__block_invoke_cold_1(a2, v6, v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setSyncMySportsEnabled:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_syncMySportsEnabled, a3);
  -[NSTimer invalidate](self->_syncMySportsDebouncer, "invalidate");
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke;
  v8[3] = &unk_10908;
  void v8[4] = self;
  objc_copyWeak(&v9, &location);
  id v6 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v8,  0.5));
  syncMySportsDebouncer = self->_syncMySportsDebouncer;
  self->_syncMySportsDebouncer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSportsFavoriteManager defaultManager](&OBJC_CLASS___WLKSportsFavoriteManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 syncMySportsEnabled]);
  id v7 = [v6 BOOLValue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke_2;
  v8[3] = &unk_108E0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  [v5 setOptInStatus:v7 completion:v8];

  objc_destroyWeak(&v9);
}

void __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (v3)
  {
    uint64_t v7 = WLKSystemLogObject(WeakRetained, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke_2_cold_1(v3, v8);
    }
  }

  else if (WeakRetained)
  {
    uint64_t v9 = WLKSystemLogObject(WeakRetained, v5);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Settings: Successfully set sports syncing opt in status. Reloading.",  buf,  2u);
    }

    id v11 = (void *)v6[2];
    v6[2] = 0LL;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke_249;
    block[3] = &unk_107C8;
    void block[4] = v6;
    dispatch_async(&_dispatch_main_q, block);
  }
}

id __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke_249(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSettingsIfNeeded];
}

- (id)_accessFormatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "onTitle", @"-"));
  v8[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 offTitle]);
  v8[2] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));

  id v6 = [[TSKMappingFormatter alloc] initWithInputs:&off_11DE8 outputs:v5];
  return v6;
}

- (id)_negateBooleanFormatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 offTitle]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 onTitle]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKBoolFormatter formatterWithOnTitle:offTitle:]( &OBJC_CLASS___TSKBoolFormatter,  "formatterWithOnTitle:offTitle:",  v3,  v4));

  return v5;
}

- (void)_showVppaExpiredPrompt:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  char v20 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"APP_VPPA_PROMPT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  uint64_t v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"APP_VPPA_EXPIRED_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  v20,  1LL));
  id v11 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"APP_VPPA_OPEN_TV_APP" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = __54__TVAppSettingsViewController__showVppaExpiredPrompt___block_invoke;
  v21[3] = &unk_10930;
  id v22 = v4;
  id v14 = v4;
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  v21));
  [v10 addAction:v15];
  uint64_t v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"CANCEL" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  1LL,  0LL));
  [v10 addAction:v19];
  -[TVAppSettingsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);
}

void __54__TVAppSettingsViewController__showVppaExpiredPrompt___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]);

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.WatchList://tv.apple.com/vppaconsent?channelId=%@",  v3));
  }

  else
  {
    NSLog(@"TVAppSettingsViewController::channelID is nil. Just launch TV App");
    id v6 = @"com.apple.WatchList://";
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)_promptToEnableChannel:(id)a3 withExternalID:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_activeiTunesAccount"));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v33 username]);
  uint64_t v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"APP_OPT_IN_PROMPT_FORMAT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v32, v11, v8));

  id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"APP_OPT_IN_TITLE_FORMAT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v31, v14, v8));

  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v29,  v30,  1LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 channelID]);
  uint64_t v17 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"APP_OPT_IN_FORMAT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = __69__TVAppSettingsViewController__promptToEnableChannel_withExternalID___block_invoke;
  v34[3] = &unk_10980;
  id v35 = v16;
  id v36 = v28;
  id v37 = v6;
  id v20 = v6;
  id v21 = v28;
  id v22 = v16;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  v34));
  [v15 addAction:v23];
  char v24 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"CANCEL" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v26,  1LL,  0LL));
  [v15 addAction:v27];
  -[TVAppSettingsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v15,  1LL,  0LL);
}

void __69__TVAppSettingsViewController__promptToEnableChannel_withExternalID___block_invoke(id *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  [v2 setStatus:1 forChannelID:a1[4] externalID:a1[5]];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 settingsForChannelID:a1[4] externalID:a1[5]]);
  NSLog(@"Enabling channel %@", a1[4]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __69__TVAppSettingsViewController__promptToEnableChannel_withExternalID___block_invoke_2;
  v5[3] = &unk_10958;
  id v6 = a1[6];
  id v7 = v2;
  id v8 = a1[4];
  id v9 = a1[5];
  id v4 = v2;
  +[WLKSettingsCloudUtilities updateCloudStoreAppSettings:deleteHistory:completion:]( &OBJC_CLASS___WLKSettingsCloudUtilities,  "updateCloudStoreAppSettings:deleteHistory:completion:",  v3,  0LL,  v5);
}

void __69__TVAppSettingsViewController__promptToEnableChannel_withExternalID___block_invoke_2( uint64_t a1,  int a2)
{
  if (a2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]);
    NSLog(@"Successfully enabled channel %@", v3);
  }

  else
  {
    NSLog(@"Failed to sync opt-in to cloud, reverting");
    [*(id *)(a1 + 40) setStatus:2 forChannelID:*(void *)(a1 + 48) externalID:*(void *)(a1 + 56)];
  }

- (void)_promptToDisableChannel:(id)a3 withExternalID:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_activeiTunesAccount"));

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v43 username]);
  id v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v42 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"APP_OPT_OUT_PROMPT_FORMAT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  id v41 = (void *)v8;
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v42, v11, v12, v8));

  id v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v40 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"APP_OPT_OUT_TITLE_FORMAT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v40, v15, v8));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v38,  v39,  1LL));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke;
  v48[3] = &unk_109A8;
  id v49 = (id)objc_claimAutoreleasedReturnValue([v6 channelID]);
  id v50 = v36;
  id v51 = v6;
  id v34 = v6;
  id v37 = v36;
  id v35 = v49;
  uint64_t v17 = objc_retainBlock(v48);
  BOOL v18 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"APP_OPT_OUT_FORMAT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v34 title]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v20));

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke_3;
  v46[3] = &unk_109D0;
  id v21 = v17;
  id v47 = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v32,  0LL,  v46));
  [v16 addAction:v22];
  uint64_t v23 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  char v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"APP_OPT_OUT_AND_DELETE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke_4;
  v44[3] = &unk_109D0;
  id v45 = v21;
  uint64_t v26 = v21;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  2LL,  v44));
  [v16 addAction:v27];
  id v28 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  int v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"CANCEL" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v30,  1LL,  0LL));
  [v16 addAction:v31];
  -[TVAppSettingsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v16,  1LL,  0LL);
}

void __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke( id *a1,  uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  [v4 setStatus:2 forChannelID:a1[4] externalID:a1[5]];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 settingsForChannelID:a1[4] externalID:a1[5]]);
  id v6 = @"NO";
  if ((_DWORD)a2) {
    id v6 = @"YES";
  }
  NSLog(@"Disabling channel %@ Delete:%@", a1[4], v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke_2;
  void v8[3] = &unk_10958;
  id v9 = a1[6];
  id v10 = v4;
  id v11 = a1[4];
  id v12 = a1[5];
  id v7 = v4;
  +[WLKSettingsCloudUtilities updateCloudStoreAppSettings:deleteHistory:completion:]( &OBJC_CLASS___WLKSettingsCloudUtilities,  "updateCloudStoreAppSettings:deleteHistory:completion:",  v5,  a2,  v8);
}

void __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke_2( uint64_t a1,  int a2,  uint64_t a3)
{
  if (a2)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]);
    NSLog(@"Successfully disabled channel %@", v4);
  }

  else
  {
    NSLog(@"Failed to sync opt-out to cloud, reverting %@", a3);
    [*(id *)(a1 + 40) setStatus:1 forChannelID:*(void *)(a1 + 48) externalID:*(void *)(a1 + 56)];
  }

uint64_t __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __70__TVAppSettingsViewController__promptToDisableChannel_withExternalID___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_clearAllHistory:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore", a3));
  id v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiTunesAccount"));

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v26 username]);
  id v25 = (void *)v5;
  int v6 = _os_feature_enabled_impl("TVApp", "testarossa");
  id v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v6) {
    id v10 = @"CLEAR_HISTORY_PROMPT_FORMAT_CONTINUE_WATCHING";
  }
  else {
    id v10 = @"CLEAR_HISTORY_PROMPT_FORMAT";
  }
  char v24 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v24, v5));
  id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"CLEAR_HISTORY_PROMPT_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v14,  v11,  1LL));

  uint64_t v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"CLEAR_HISTORY" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  2LL,  &__block_literal_global_318));

  id v20 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"CANCEL" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  1LL,  0LL));

  [v15 addAction:v19];
  [v15 addAction:v23];
  -[TVAppSettingsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v15,  1LL,  0LL);
}

void __48__TVAppSettingsViewController__clearAllHistory___block_invoke(id a1, UIAlertAction *a2)
{
}

void __48__TVAppSettingsViewController__clearAllHistory___block_invoke_2(id a1, BOOL a2, NSError *a3)
{
  if (a2)
  {
    dispatch_async(&_dispatch_main_q, &__block_literal_global_320);
    id v3 = @"YES";
  }

  else
  {
    id v3 = @"NO";
  }

  NSLog(@"Settings: Delete-all! %@", v3);
}

void __48__TVAppSettingsViewController__clearAllHistory___block_invoke_3(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v1 postNotificationName:WLKSettingsClearPlayHistoryNotification object:0];
}

- (void)_clearSearchHistory:(id)a3
{
  id v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v18 = (id)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"CLEAR_SEARCH_HISTORY_PROMPT" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);

  int v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"CLEAR_SEARCH_HISTORY_PROMPT_TITLE" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v18,  1LL));

  id v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"CLEAR_SEARCH_HISTORY_BUTTON" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  2LL,  &__block_literal_global_330));

  id v14 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"CANCEL" value:&stru_10E38 table:@"TVAppSettings_tvOS"]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  0LL));

  [v9 addAction:v13];
  [v9 addAction:v17];
  -[TVAppSettingsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
}

void __51__TVAppSettingsViewController__clearSearchHistory___block_invoke(id a1, UIAlertAction *a2)
{
  id v2 = objc_alloc(&OBJC_CLASS___TSKPreferencesFacade);
  uint64_t v3 = WLKTVAppBundleID();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v2 initWithDomain:v4 notifyChanges:1];

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_activeiTunesAccount"));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"SearchHistoryHasBeenCleared"]);
  id v10 = [v9 mutableCopy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);
  if ([v11 length])
  {
    unint64_t v12 = 0LL;
    uint64_t v13 = 5381LL;
    do
      uint64_t v13 = 127 * (v13 & 0xFFFFFFFFFFFFFFLL) + [v11 characterAtIndex:v12++];
    while (v12 < (unint64_t)[v11 length]);
  }

  else
  {
    uint64_t v13 = 5381LL;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v13));
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v14));

  if (v10)
  {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:v15];
    [v5 setValue:v10 forKey:@"SearchHistoryHasBeenCleared"];
  }

  else
  {
    id v18 = v15;
    uint64_t v19 = &__kCFBooleanTrue;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    [v5 setValue:v16 forKey:@"SearchHistoryHasBeenCleared"];
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v17 postNotificationName:@"SearchHistoryHasBeenCleared" object:0];
}

- (void)_toggleSpecifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__TVAppSettingsViewController__toggleSpecifier___block_invoke;
  block[3] = &unk_10688;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __48__TVAppSettingsViewController__toggleSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) representedObject]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelUtilities sharedInstance](&OBJC_CLASS___WLKChannelUtilities, "sharedInstance"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 channelID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 channelForID:v6]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[WLKConfigurationManager sharedInstance](&OBJC_CLASS___WLKConfigurationManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _configuration]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __48__TVAppSettingsViewController__toggleSpecifier___block_invoke_2;
  v12[3] = &unk_10AD8;
  id v13 = v4;
  id v14 = WeakRetained;
  id v15 = v7;
  id v16 = [v9 vppaStatus];
  id v10 = v7;
  id v11 = v4;
  dispatch_async(&_dispatch_main_q, v12);
}

void __48__TVAppSettingsViewController__toggleSpecifier___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) accessStatus] == (char *)&dword_0 + 1)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 48);
    id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) externalID]);
    [v3 _promptToDisableChannel:v2 withExternalID:v6];
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 40);
    if ((*(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [*(id *)(a1 + 40) _showVppaExpiredPrompt:*(void *)(a1 + 48)];
      return;
    }

    id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) externalID]);
    [v5 _promptToEnableChannel:v4 withExternalID:v6];
  }
}

- (BOOL)isRefreshingAppGroup
{
  return self->_refreshingAppGroup;
}

- (void)setRefreshingAppGroup:(BOOL)a3
{
  self->_refreshingAppGroup = a3;
}

- (BOOL)didFetchConfiguration
{
  return self->_didFetchConfiguration;
}

- (void)setDidFetchConfiguration:(BOOL)a3
{
  self->_didFetchConfiguration = a3;
}

- (BOOL)didFetchPostPlayAutoPlaySettings
{
  return self->_didFetchPostPlayAutoPlaySettings;
}

- (void)setDidFetchPostPlayAutoPlaySettings:(BOOL)a3
{
  self->_didFetchPostPlayAutoPlaySettings = a3;
}

- (BOOL)currentAutoPlayBgVideoSoundValue
{
  return self->_currentAutoPlayBgVideoSoundValue;
}

- (void)setCurrentAutoPlayBgVideoSoundValue:(BOOL)a3
{
  self->_currentAutoPlayBgVideoSoundValue = a3;
}

- (void).cxx_destruct
{
}

- (void)syncMySportsEnabled
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Settings: Fetch sync my sports opt in status timed out.",  v1,  2u);
}

void __50__TVAppSettingsViewController_syncMySportsEnabled__block_invoke_cold_1( char a1,  void *a2,  os_log_s *a3)
{
  int v4 = a1 & 1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "Settings: Fetch sync my sports opt in status completed. isOnboarded=%i, error=%@",  (uint8_t *)v6,  0x12u);
}

void __54__TVAppSettingsViewController_setSyncMySportsEnabled___block_invoke_2_cold_1( void *a1,  os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "Settings: Failed to set sports syncing opt in status. error=%@",  (uint8_t *)&v4,  0xCu);
}

@end