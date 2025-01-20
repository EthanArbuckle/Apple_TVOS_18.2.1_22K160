@interface TVSettingsAppBundleViewController
- (BOOL)isRoot;
- (NSBundle)settingsBundle;
- (NSString)bundleID;
- (NSString)containerPath;
- (NSString)plistName;
- (TVSettingsItemFactory)itemFactory;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBundleID:(id)a3;
- (void)setContainerPath:(id)a3;
- (void)setItemFactory:(id)a3;
- (void)setPlistName:(id)a3;
- (void)setRoot:(BOOL)a3;
- (void)setSettingsBundle:(id)a3;
@end

@implementation TVSettingsAppBundleViewController

- (void)dealloc
{
  if (self->_observingCrossAppTrackingAllowedSwitchEnabled)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
    [v3 removeObserver:self forKeyPath:@"crossAppTrackingAllowedSwitchEnabled" context:off_1001DF4E8];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsAppBundleViewController;
  -[TVSettingsAppBundleViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController bundleID](self, "bundleID"));
  itemFactory = self->_itemFactory;
  if (itemFactory)
  {
    v5 = itemFactory;
  }

  else
  {
    v6 = objc_alloc(&OBJC_CLASS___TVSettingsItemFactory);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController settingsBundle](self, "settingsBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController containerPath](self, "containerPath"));
    v5 = -[TVSettingsItemFactory initWithBundle:appIdentifier:containerPath:]( v6,  "initWithBundle:appIdentifier:containerPath:",  v7,  v3,  v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController settingsBundle](self, "settingsBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController plistName](self, "plistName"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 URLForResource:v10 withExtension:@"plist"]);

  v159 = (void *)v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v11));
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"StringsTable"]);
  if (v14) {
    -[TVSettingsItemFactory setStringsTable:](v5, "setStringsTable:", v14);
  }
  v162 = (void *)v14;
  v15 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v13);
  v17 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"PreferenceSpecifiers"]);
  v168[0] = _NSConcreteStackBlock;
  v168[1] = 3221225472LL;
  v168[2] = sub_10001D6B8;
  v168[3] = &unk_10018F1D8;
  v161 = v5;
  v169 = v161;
  id v19 = v15;
  id v170 = v19;
  id v20 = v17;
  v21 = v19;
  id v22 = v20;
  id v171 = v20;
  v160 = v18;
  [v18 enumerateObjectsWithOptions:2 usingBlock:v168];
  if ([v19 count])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v19));
    [v22 insertObject:v23 atIndex:0];
  }

  if (-[TVSettingsAppBundleViewController isRoot](self, "isRoot")
    && +[TVSettingsAppsFacade settingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "settingsNeededForBundleID:",  v3))
  {
    v155 = v22;
    v25 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v24);
    v157 = v21;
    v158 = v12;
    if (+[TVSettingsAppsFacade locationSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "locationSettingsNeededForBundleID:",  v3))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 itemForBundleID:v3]);
      if (v27)
      {
        uint64_t v28 = TSKLocString(@"AppsAllowAccessLocationTitle");
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v27 explanatoryText]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v27 allowedAccessTypes]);
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v29,  v30,  v27,  @"accessType",  v31));

        v12 = v158;
        v33 = (void *)objc_claimAutoreleasedReturnValue([v26 accessTypeFormatter]);
        [v32 setLocalizedValueFormatter:v33];

        v166[0] = _NSConcreteStackBlock;
        v166[1] = 3221225472LL;
        v166[2] = sub_10001D9A0;
        v166[3] = &unk_10018E608;
        id v167 = v26;
        [v32 setUpdateBlock:v166];
        [v25 addObject:v32];

        v21 = v157;
      }
    }

    if (+[TVSettingsAppsFacade photosSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "photosSettingsNeededForBundleID:",  v3))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsPhotosAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsPhotosAccessFacade,  "sharedInstance"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 infoForIdentifier:v3]);
      if (v35)
      {
        uint64_t v36 = TSKLocString(@"AppsAllowAccessPhotosTitle");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        uint64_t v38 = TSKLocString(@"PrivacyAppAllowAccess");
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        uint64_t v40 = TSKLocString(@"PrivacyAppDenyAccess");
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v37,  0LL,  v35,  @"allowAccess",  v39,  v41));

        v12 = v158;
        v21 = v157;

        [v25 addObject:v42];
      }
    }

    if (_os_feature_enabled_impl("TelephonyUtilities", "Laguna")
      && +[TVSettingsAppsFacade microphoneSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "microphoneSettingsNeededForBundleID:",  v3))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMicrophoneAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMicrophoneAccessFacade,  "sharedInstance"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 infoForIdentifier:v3]);
      if (v44)
      {
        v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v45 = TSKLocStringFromBundleCachingKey( @"AppsAllowAccessMicrophoneTitle",  v153,  1LL,  0LL,  @"Localizable-Laguna");
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        uint64_t v47 = TSKLocString(@"PrivacyAppAllowAccess");
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        uint64_t v49 = TSKLocString(@"PrivacyAppDenyAccess");
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v46,  0LL,  v44,  @"allowAccess",  v48,  v50));

        v12 = v158;
        [v25 addObject:v51];

        v21 = v157;
      }
    }

    if (_os_feature_enabled_impl("TelephonyUtilities", "Laguna")
      && +[TVSettingsAppsFacade cameraSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "cameraSettingsNeededForBundleID:",  v3))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCameraAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsCameraAccessFacade,  "sharedInstance"));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 infoForIdentifier:v3]);
      if (v53)
      {
        v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v54 = TSKLocStringFromBundleCachingKey( @"AppsAllowAccessCameraTitle",  v154,  1LL,  0LL,  @"Localizable-Laguna");
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        uint64_t v56 = TSKLocString(@"PrivacyAppAllowAccess");
        v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        uint64_t v58 = TSKLocString(@"PrivacyAppDenyAccess");
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v55,  0LL,  v53,  @"allowAccess",  v57,  v59));

        v12 = v158;
        [v25 addObject:v60];

        v21 = v157;
      }
    }

    if (+[TVSettingsAppsFacade bluetoothPrivacySettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "bluetoothPrivacySettingsNeededForBundleID:",  v3))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBluetoothPrivacyFacade sharedInstance]( &OBJC_CLASS___TVSettingsBluetoothPrivacyFacade,  "sharedInstance"));
      v62 = (void *)objc_claimAutoreleasedReturnValue([v61 infoForIdentifier:v3]);
      if (v62)
      {
        uint64_t v63 = TSKLocString(@"BluetoothServiceTitle");
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        uint64_t v65 = TSKLocString(@"BluetoothServiceDescription");
        v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
        uint64_t v67 = TSKLocString(@"PrivacyAppAllowAccess");
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        uint64_t v69 = TSKLocString(@"PrivacyAppDenyAccess");
        v70 = v25;
        v71 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v72 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v64,  v66,  v62,  @"allowAccess",  v68,  v71));

        v25 = v70;
        v12 = v158;

        v21 = v157;
        [v70 addObject:v72];
      }
    }

    if (+[TVSettingsAppsFacade notificationSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "notificationSettingsNeededForBundleID:",  v3))
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
      v74 = (void *)objc_claimAutoreleasedReturnValue([v73 notificationSettingForIdentifier:v3]);
      if (v74)
      {
        uint64_t v75 = TSKLocString(@"AppsAllowAccessNotificationTitle");
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
        uint64_t v77 = TSKLocString(@"PrivacyAppAllowAccess");
        v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
        uint64_t v79 = TSKLocString(@"PrivacyAppDenyAccess");
        v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v76,  0LL,  v74,  @"allowsNotifications",  v78,  v80));

        v12 = v158;
        v21 = v157;

        [v25 addObject:v81];
      }
    }

    if (+[TVSettingsAppsFacade backgroundAppRefreshSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "backgroundAppRefreshSettingsNeededForBundleID:",  v3))
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsBackgroundAppRefreshFacade sharedInstance]( &OBJC_CLASS___TVSettingsBackgroundAppRefreshFacade,  "sharedInstance"));
      v83 = (void *)objc_claimAutoreleasedReturnValue([v82 backgroundAppRefreshSettingForIdentifier:v3]);
      if (v83)
      {
        uint64_t v84 = TSKLocString(@"AppsAllowAccessBackgroundAppRefreshTitle");
        v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
        v86 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v85,  0LL,  v83,  @"allowsBackgroundAppRefresh",  0LL,  0LL));

        [v86 setUpdateBlock:&stru_10018F1F8];
        [v25 addObject:v86];
      }
    }

    if (+[TVSettingsAppsFacade crossAppTrackingSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "crossAppTrackingSettingsNeededForBundleID:",  v3))
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCrossAppTrackingFacade sharedInstance]( &OBJC_CLASS___TVSettingsCrossAppTrackingFacade,  "sharedInstance"));
      v88 = (void *)objc_claimAutoreleasedReturnValue([v87 infoForIdentifier:v3]);
      if (v88)
      {
        [v87 addObserver:self forKeyPath:@"crossAppTrackingAllowedSwitchEnabled" options:0 context:&off_1001DF4E8];
        self->_observingCrossAppTrackingAllowedSwitchEnabled = 1;
        uint64_t v89 = TSKLocString(@"AppsAllowAccessTracking");
        v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
        uint64_t v91 = TSKLocString(@"PrivacyAllowAccess");
        v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
        uint64_t v93 = TSKLocString(@"PrivacyDenyAccess");
        v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
        v95 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v90,  0LL,  v88,  @"allowAccess",  v92,  v94));

        v12 = v158;
        v21 = v157;

        v164[0] = _NSConcreteStackBlock;
        v164[1] = 3221225472LL;
        v164[2] = sub_10001DA78;
        v164[3] = &unk_10018E608;
        id v165 = v87;
        [v95 setUpdateBlock:v164];
        [v25 addObject:v95];
      }
    }

    if (+[TVSettingsAppsFacade homeKitSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "homeKitSettingsNeededForBundleID:",  v3))
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
      v97 = (void *)objc_claimAutoreleasedReturnValue([v96 infoForIdentifier:v3]);
      if (v97)
      {
        uint64_t v98 = TSKLocString(@"AppsAllowAccessHomeKitTitle");
        v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
        uint64_t v100 = TSKLocString(@"PrivacyAppAllowAccess");
        v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
        uint64_t v102 = TSKLocString(@"PrivacyAppDenyAccess");
        v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
        v104 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v99,  0LL,  v97,  @"allowAccess",  v101,  v103));

        v12 = v158;
        v21 = v157;

        [v25 addObject:v104];
      }
    }

    if (+[TVSettingsAppsFacade MSOSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "MSOSettingsNeededForBundleID:",  v3))
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsMSOFacade sharedInstance](&OBJC_CLASS___TVSettingsMSOFacade, "sharedInstance"));
      v106 = (void *)objc_claimAutoreleasedReturnValue([v105 infoForIdentifier:v3]);
      if (v106)
      {
        uint64_t v107 = TSKLocString(@"AppsAllowAccessMSOTitle");
        v108 = (void *)objc_claimAutoreleasedReturnValue(v107);
        uint64_t v109 = TSKLocString(@"PrivacyAppAllowAccess");
        v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
        uint64_t v111 = TSKLocString(@"PrivacyAppDenyAccess");
        v112 = (void *)objc_claimAutoreleasedReturnValue(v111);
        v113 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v108,  0LL,  v106,  @"allowAccess",  v110,  v112));

        v12 = v158;
        v21 = v157;

        v163[0] = _NSConcreteStackBlock;
        v163[1] = 3221225472LL;
        v163[2] = sub_10001DABC;
        v163[3] = &unk_10018E608;
        v163[4] = self;
        [v113 setUpdateBlock:v163];
        [v25 addObject:v113];
      }
    }

    if (+[TVSettingsAppsFacade mediaLibrarySettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "mediaLibrarySettingsNeededForBundleID:",  v3))
    {
      v114 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsMediaLibraryAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsMediaLibraryAccessFacade,  "sharedInstance"));
      v115 = (void *)objc_claimAutoreleasedReturnValue([v114 infoForIdentifier:v3]);
      if (v115)
      {
        uint64_t v116 = TSKLocString(@"AppsAllowAccessMediaLibraryTitle");
        v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
        uint64_t v118 = TSKLocString(@"PrivacyAppAllowAccess");
        v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
        uint64_t v120 = TSKLocString(@"PrivacyAppDenyAccess");
        v121 = (void *)objc_claimAutoreleasedReturnValue(v120);
        v122 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v117,  0LL,  v115,  @"allowAccess",  v119,  v121));

        v12 = v158;
        v21 = v157;

        [v25 addObject:v122];
      }
    }

    if (+[TVSettingsAppsFacade userAccessSettingsNeededForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "userAccessSettingsNeededForBundleID:",  v3))
    {
      v123 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUserAccessFacade sharedInstance]( &OBJC_CLASS___TVSettingsUserAccessFacade,  "sharedInstance"));
      v124 = (void *)objc_claimAutoreleasedReturnValue([v123 infoForIdentifier:v3]);
      if (v124)
      {
        uint64_t v125 = TSKLocString(@"AppsAllowAccessUserTitle");
        v126 = (void *)objc_claimAutoreleasedReturnValue(v125);
        uint64_t v127 = TSKLocString(@"PrivacyAppAllowAccess");
        v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
        uint64_t v129 = TSKLocString(@"PrivacyAppDenyAccess");
        v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
        v131 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v126,  0LL,  v124,  @"allowAccess",  v128,  v130));

        v12 = v158;
        v21 = v157;

        [v25 addObject:v131];
      }
    }

    if ([v25 count])
    {
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
      v133 = (void *)objc_claimAutoreleasedReturnValue([v132 appInfos]);
      v134 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController bundleID](self, "bundleID"));
      v135 = (void *)objc_claimAutoreleasedReturnValue([v133 objectForKey:v134]);

      v136 = (void *)objc_claimAutoreleasedReturnValue([v155 firstObject]);
      v137 = (void *)objc_claimAutoreleasedReturnValue([v136 localizedTitle]);
      id v138 = [v137 length];

      if (!v138)
      {
        uint64_t v139 = TSKLocString(@"AppsSettingsFormatSectionTitle");
        v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
        v141 = (void *)objc_claimAutoreleasedReturnValue([v135 localizedName]);
        v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v140, v141));

        [v136 setLocalizedTitle:v142];
      }

      uint64_t v143 = TSKLocString(@"AppsAllowAccessFormatSectionTitle");
      v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
      v145 = (void *)objc_claimAutoreleasedReturnValue([v135 localizedName]);
      v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v144, v145));

      v147 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v146,  v25));
      [v155 insertObject:v147 atIndex:0];

      v21 = v157;
      v12 = v158;
    }

    if (![v25 count] && _TVSLogInternalLogLevel >= 5)
    {
      uint64_t v148 = TVSSystemLog;
      pthread_main_np();
      pthread_self();
      v152 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController bundleID](self, "bundleID"));
      _TVSLogBase(v156, &_os_log_default, 1LL, 0LL, 5LL, v148);
    }

    id v22 = v155;
  }

  v149 = v171;
  id v150 = v22;

  return v150;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    v5 = objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppBundleViewController bundleID](self, "bundleID"));
    v7 = -[TSKAppIconPreviewViewController initWithApplicationBundleIdentifier:]( v5,  "initWithApplicationBundleIdentifier:",  v6);
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v7;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[TSKPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v9);
  v10 = self->_appPreviewViewController;

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF4E8 == a6)
  {
    -[TVSettingsAppBundleViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsAppBundleViewController;
    -[TVSettingsAppBundleViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (NSBundle)settingsBundle
{
  return self->_settingsBundle;
}

- (void)setSettingsBundle:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
}

- (NSString)plistName
{
  return self->_plistName;
}

- (void)setPlistName:(id)a3
{
}

- (BOOL)isRoot
{
  return self->_root;
}

- (void)setRoot:(BOOL)a3
{
  self->_root = a3;
}

- (TVSettingsItemFactory)itemFactory
{
  return self->_itemFactory;
}

- (void)setItemFactory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end