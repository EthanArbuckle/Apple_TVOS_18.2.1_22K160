@interface TVSettingsMusicViewController
- (TVSettingsMusicViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSettingsMusicViewController

- (TVSettingsMusicViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsMusicViewController;
  v3 = -[TVSettingsMusicViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCloudMediaLibraryFacade sharedInstance]( &OBJC_CLASS___TVSettingsCloudMediaLibraryFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"syncState" options:0 context:off_1001DF560];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCloudMediaLibraryFacade sharedInstance]( &OBJC_CLASS___TVSettingsCloudMediaLibraryFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"syncState" context:off_1001DF560];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsMusicViewController;
  -[TVSettingsMusicViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCloudMediaLibraryFacade sharedInstance]( &OBJC_CLASS___TVSettingsCloudMediaLibraryFacade,  "sharedInstance"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[TVPMusicSettings sharedInstance](&OBJC_CLASS___TVPMusicSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
  objc_super v4 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v5 = TSKLocString(@"MusicAppLibrarySection");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[TSKSettingGroup initWithTitle:](v4, "initWithTitle:", v6);

  v9 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
  uint64_t v10 = TSKLocString(@"iTMSAddPlaylistSongsTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v11,  0LL,  v2,  @"addingToPlaylistAddsToLibrary",  0LL,  0LL));

  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472LL;
  v104[2] = sub_100020654;
  v104[3] = &unk_10018E608;
  id v13 = v2;
  id v105 = v13;
  [v12 setUpdateBlock:v104];
  [v9 addObject:v12];
  uint64_t v14 = TSKLocString(@"iTMSAddFavoriteSongsTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v15,  0LL,  v13,  @"favoritingAddsToLibrary",  0LL,  0LL));

  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472LL;
  v102[2] = sub_1000206C0;
  v102[3] = &unk_10018E608;
  id v17 = v13;
  id v103 = v17;
  [v16 setUpdateBlock:v102];
  v85 = v16;
  [v9 addObject:v16];
  v89 = v9;
  -[TSKSettingGroup setSettingItems:](v7, "setSettingItems:", v9);
  [v3 addObject:v7];
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472LL;
  v100[2] = sub_10002072C;
  v100[3] = &unk_10018E608;
  v90 = v7;
  id v91 = v17;
  id v101 = v91;
  -[TSKSettingGroup setUpdateBlock:](v7, "setUpdateBlock:", v100);
  uint64_t v19 = objc_opt_new(&OBJC_CLASS___TVSettingsMusicTopShelfFacade, v18);
  v20 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v21 = TSKLocString(@"MusicAppHomeScreenSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = -[TSKSettingGroup initWithTitle:](v20, "initWithTitle:", v22);

  uint64_t v24 = TSKLocString(@"MusicAppVideoPlaylists");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v110[0] = v25;
  uint64_t v26 = TSKLocString(@"MusicAppLibraryAndTopAlbums");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v110[1] = v27;
  uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v110, 2LL));

  uint64_t v29 = TSKLocString(@"MusicAppTopShelf");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  uint64_t v31 = TSKLocString(@"MusicAppTopShelfDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v88 = (void *)v19;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v30,  v32,  v19,  @"topShelfStyle",  &off_1001AEB00));

  v86 = (void *)v28;
  v34 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEB00,  v28);
  [v33 setLocalizedValueFormatter:v34];

  [v33 setShouldPresentChildController:0];
  [v33 setChildControllerBlock:0];
  v109 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v109, 1LL));
  -[TSKSettingGroup setSettingItems:](v23, "setSettingItems:", v35);

  v87 = v23;
  [v3 addObject:v23];
  v36 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v37 = TSKLocString(@"MusicAppPlaybackSection");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v84 = -[TSKSettingGroup initWithTitle:](v36, "initWithTitle:", v38);

  v40 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v39);
  v41 = 0LL;
  if (MSVDeviceSupportsEnhancedMusic())
  {
    v82 = v33;
    uint64_t v42 = objc_claimAutoreleasedReturnValue( +[TVSettingsMusicAudioQualityFacade sharedInstance]( &OBJC_CLASS___TVSettingsMusicAudioQualityFacade,  "sharedInstance"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v83 = v3;
    uint64_t v44 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualitySurroundSound", v43, 1LL, 0LL, @"Oasis");
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v47 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualitySurroundAutomatic", v46, 1LL, 0LL, @"Oasis");
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    uint64_t v49 = v42;
    v81 = (void *)v42;
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v45,  0LL,  v42,  @"spatialAudio",  v48,  0LL));

    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472LL;
    v98[2] = sub_100020770;
    v98[3] = &unk_10018E608;
    id v80 = v91;
    id v99 = v80;
    [v50 setUpdateBlock:v98];
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v52 = TSKLocStringFromBundleCachingKey(@"MusicAudioQuality", v51, 1LL, 0LL, @"Oasis");
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    id v54 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v53,  0LL,  v49,  @"audioQuality",  objc_opt_class(&OBJC_CLASS___TVSettingsMusicAudioQualityViewController));
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v57 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityDefault", v56, 1LL, 0LL, @"Oasis");
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    v108[0] = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v60 = TSKLocStringFromBundleCachingKey(@"MusicAudioQualityLossless", v59, 1LL, 0LL, @"Oasis");
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    v108[1] = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v63 = TSKLocStringFromBundleCachingKey( @"MusicAudioQualityHiResLosslessAbbreviated",  v62,  1LL,  0LL,  @"Oasis");
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    v108[2] = v64;
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v108, 3LL));

    v66 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEB18,  v65);
    [v55 setLocalizedValueFormatter:v66];
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472LL;
    v96[2] = sub_10002083C;
    v96[3] = &unk_10018E608;
    id v97 = v80;
    [v55 setUpdateBlock:v96];
    [v40 addObject:v50];
    [v40 addObject:v55];
    v41 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", @" ");

    v3 = v83;
    v33 = v82;
  }

  uint64_t v67 = TSKLocString(@"MusicSoundCheckTitle");
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v68,  0LL,  v93,  @"soundCheckEnabled",  0LL,  0LL));

  [v69 setUpdateBlock:&stru_10018F2C8];
  [v40 addObject:v69];
  uint64_t v70 = TSKLocString(@"MusicUseListeningHistoryTitle");
  v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v71,  0LL,  v92,  @"useListeningHistory",  0LL,  0LL));

  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472LL;
  v94[2] = sub_1000208EC;
  v94[3] = &unk_10018E608;
  id v73 = v91;
  id v95 = v73;
  [v72 setUpdateBlock:v94];
  if (v41)
  {
    v74 = v84;
    -[TSKSettingGroup setSettingItems:](v84, "setSettingItems:", v40);
    [v3 addObject:v84];
    v107 = v72;
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v107, 1LL));
    -[TSKSettingGroup setSettingItems:](v41, "setSettingItems:", v75);

    [v3 addObject:v41];
  }

  else
  {
    [v40 addObject:v72];
    v74 = v84;
    -[TSKSettingGroup setSettingItems:](v84, "setSettingItems:", v40);
    [v3 addObject:v84];
  }

  v76 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", @" ");
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.applemusic"));

  [v77 setDeepLinkKey:@"AppleMusicPrivacyTitle"];
  v106 = v77;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v106, 1LL));
  -[TSKSettingGroup setSettingItems:](v76, "setSettingItems:", v78);

  [v3 addObject:v76];
  return v3;
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

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF560 == a6)
  {
    -[TVSettingsMusicViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsMusicViewController;
    -[TVSettingsMusicViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void).cxx_destruct
{
}

@end