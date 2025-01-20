@interface TVSettingsAirPlayViewController
- (BOOL)lastPBSNeedsHomeKitAutoOnboardingValue;
- (NSMutableSet)updatingResidentDevices;
- (NSURL)lastDeepLinkURL;
- (TSKSettingItem)nameItem;
- (TVSettingsAirPlayViewController)initWithStyle:(int64_t)a3;
- (TVSettingsHomeSetupController)homeSetupController;
- (TVSiCloudAccountManager)accountManager;
- (id)_homeNeedsUserInterentionAlertViewController;
- (id)_homeNoiCloudAccountAlertViewController;
- (id)_makeDeviceNameChildViewControllerWithItem:(id)a3;
- (id)_overscanAdjustmentFormatter;
- (id)loadSettingGroups;
- (id)pbsPrefsObserverToken;
- (void)_handleFinishHomeSetupCFUAction;
- (void)_presentSetAccessoryNameFailedViewControllerWithError:(id)a3;
- (void)_presentWHASetupViewController;
- (void)_pushRoomPickerViewController;
- (void)_setDeviceName:(id)a3;
- (void)_showConferenceRoomDisplayViewController;
- (void)_toggleResidenceEnabled:(id)a3;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentActionForDisplayedDeepLinkURL;
- (void)setHomeSetupController:(id)a3;
- (void)setLastDeepLinkURL:(id)a3;
- (void)setLastPBSNeedsHomeKitAutoOnboardingValue:(BOOL)a3;
- (void)setPbsPrefsObserverToken:(id)a3;
- (void)setUpdatingResidentDevices:(id)a3;
@end

@implementation TVSettingsAirPlayViewController

- (TVSettingsAirPlayViewController)initWithStyle:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayViewController;
  v3 = -[TVSettingsAirPlayViewController initWithStyle:](&v19, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVSettingsHomeSetupController);
    homeSetupController = v3->_homeSetupController;
    v3->_homeSetupController = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
    accountManager = v3->_accountManager;
    v3->_accountManager = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
    [v8 addObserver:v3 forKeyPath:@"settingsModificationAllowed" options:0 context:off_1001E0590];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v9 addObserver:v3 forKeyPath:@"homeConfigurationState" options:0 context:off_1001E0598];
    [v9 addObserver:v3 forKeyPath:@"localAccessory" options:0 context:off_1001E05A0];
    [v9 addObserver:v3 forKeyPath:@"hasOptedToHH2" options:0 context:off_1001E05A8];
    [v9 reloadHomeConfiguration];
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    v3->_lastPBSNeedsHomeKitAutoOnboardingValue = objc_msgSend(v10, "pbs_needsHomeKitAutoOnboarding");

    objc_initWeak(&location, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000BCA64;
    v16[3] = &unk_10018E810;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v12,  v16));
    id pbsPrefsObserverToken = v3->_pbsPrefsObserverToken;
    v3->_id pbsPrefsObserverToken = (id)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"settingsModificationAllowed" context:off_1001E0590];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"homeConfigurationState" context:off_1001E0598];
  [v4 removeObserver:self forKeyPath:@"localAccessory" context:off_1001E05A0];
  [v4 removeObserver:self forKeyPath:@"hasOptedToHH2" context:off_1001E05A8];
  +[TVSPreferences removeDomainObserver:]( &OBJC_CLASS___TVSPreferences,  "removeDomainObserver:",  self->_pbsPrefsObserverToken);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayViewController;
  -[TVSettingsAirPlayViewController dealloc](&v5, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsAirPlayFacade sharedInstance](&OBJC_CLASS___TVSettingsAirPlayFacade, "sharedInstance"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionsSettings sharedInstance](&OBJC_CLASS___PBSRestrictionsSettings, "sharedInstance"));
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayViewController _overscanAdjustmentFormatter](self, "_overscanAdjustmentFormatter"));
  v108 = (void *)objc_claimAutoreleasedReturnValue([v107 roomNameFormatter]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v6 = TSKLocString(@"APAirPlayTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = TSKLocString(@"APSecurityTypeDefaultDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v7,  v9,  v3,  @"enabled",  0LL,  0LL));

  [v109 addObject:v10];
  uint64_t v11 = TSKLocString(@"APAccessControlTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v12,  0LL,  v107,  @"localizedAllowAccessShortDescription",  objc_opt_class(&OBJC_CLASS___TVSettingsAirPlayAccessViewController));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472LL;
  v144[2] = sub_1000BDC50;
  v144[3] = &unk_10018E608;
  id v15 = v3;
  id v145 = v15;
  [v14 setUpdateBlock:v144];
  [v109 addObject:v14];
  uint64_t v16 = TSKLocString(@"APCRDTitle");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = TSKLocString(@"APCRDModeDescriptionText");
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v17,  v19,  v105,  @"mode",  self,  "_showConferenceRoomDisplayViewController"));

  [v20 setAccessoryTypes:1];
  v141[0] = _NSConcreteStackBlock;
  v141[1] = 3221225472LL;
  v141[2] = sub_1000BDCA4;
  v141[3] = &unk_10018ED70;
  id v97 = v4;
  id v142 = v97;
  id v21 = v15;
  id v143 = v21;
  [v20 setUpdateBlock:v141];
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsCRDViewController crdModeFormatter]( &OBJC_CLASS___TVSettingsCRDViewController,  "crdModeFormatter"));
  [v20 setLocalizedValueFormatter:v22];

  [v109 addObject:v20];
  uint64_t v23 = TSKLocString(@"AVAdjustForOverscanTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = TSKLocString(@"AVAdjustForOverscanDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v106 inputs]);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v24,  v26,  v21,  @"overscanAdjustment",  v27));

  [v28 setLocalizedValueFormatter:v106];
  v139[0] = _NSConcreteStackBlock;
  v139[1] = 3221225472LL;
  v139[2] = sub_1000BDD18;
  v139[3] = &unk_10018E608;
  id v96 = v21;
  id v140 = v96;
  [v28 setUpdateBlock:v139];
  [v109 addObject:v28];
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v109));
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v29 = TSKLocString(@"WHARoomTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  uint64_t v31 = TSKLocString(@"WHASetupTitleDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v30,  v32,  v5,  @"localAccessory",  self,  "_presentWHASetupViewController"));

  [v33 setLocalizedValueFormatter:v108];
  v137[0] = _NSConcreteStackBlock;
  v137[1] = 3221225472LL;
  v137[2] = sub_1000BDD5C;
  v137[3] = &unk_10018E608;
  id v34 = v5;
  id v138 = v34;
  [v33 setUpdateBlock:v137];
  [v110 addObject:v33];
  uint64_t v35 = TSKLocString(@"WHARoomTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  uint64_t v37 = TSKLocString(@"WHANoiCloudDescription");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v135[0] = _NSConcreteStackBlock;
  v135[1] = 3221225472LL;
  v135[2] = sub_1000BDDA4;
  v135[3] = &unk_10018E9D8;
  objc_copyWeak(&v136, &location);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v36,  v38,  v34,  @"localAccessory",  v135));

  [v39 setShouldPresentChildController:1];
  [v39 setLocalizedValueFormatter:v108];
  v133[0] = _NSConcreteStackBlock;
  v133[1] = 3221225472LL;
  v133[2] = sub_1000BDDDC;
  v133[3] = &unk_10018E608;
  id v40 = v34;
  id v134 = v40;
  [v39 setUpdateBlock:v133];
  [v110 addObject:v39];
  uint64_t v41 = TSKLocString(@"WHARoomTitle");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  uint64_t v43 = TSKLocString(@"WHARoomTitleDescription");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v42,  v44,  v40,  @"localAccessory",  self,  "_pushRoomPickerViewController"));

  [v45 setAccessoryTypes:1];
  [v45 setLocalizedValueFormatter:v108];
  v131[0] = _NSConcreteStackBlock;
  v131[1] = 3221225472LL;
  v131[2] = sub_1000BDE54;
  v131[3] = &unk_10018E608;
  id v46 = v40;
  id v132 = v46;
  [v45 setUpdateBlock:v131];
  [v110 addObject:v45];
  uint64_t v47 = TSKLocString(@"WHARoomTitle");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  uint64_t v49 = TSKLocString(@"WHAProblemDescription");
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v129[0] = _NSConcreteStackBlock;
  v129[1] = 3221225472LL;
  v129[2] = sub_1000BDED0;
  v129[3] = &unk_10018E9D8;
  objc_copyWeak(&v130, &location);
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v48,  v50,  v46,  @"localAccessory",  v129));

  [v51 setShouldPresentChildController:1];
  [v51 setLocalizedValueFormatter:v108];
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472LL;
  v127[2] = sub_1000BDF08;
  v127[3] = &unk_10018E608;
  id v52 = v46;
  id v128 = v52;
  [v51 setUpdateBlock:v127];
  [v110 addObject:v51];
  uint64_t v53 = TSKLocString(@"WHARoomTitle");
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  uint64_t v55 = TSKLocString(@"WHASynchronizingDescription");
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472LL;
  v125[2] = sub_1000BDF80;
  v125[3] = &unk_10018E9D8;
  objc_copyWeak(&v126, &location);
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v54,  v56,  v52,  @"localAccessory",  v125));

  [v57 setShouldPresentChildController:1];
  [v57 setLocalizedValueFormatter:v108];
  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472LL;
  v123[2] = sub_1000BDFB8;
  v123[3] = &unk_10018E608;
  id v58 = v52;
  id v124 = v58;
  [v57 setUpdateBlock:v123];
  [v110 addObject:v57];
  uint64_t v59 = TSKLocString(@"AboutNameTitle");
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472LL;
  v121[2] = sub_1000BE060;
  v121[3] = &unk_10018E9D8;
  objc_copyWeak(&v122, &location);
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v60,  0LL,  v104,  @"name",  v121));

  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472LL;
  v119[2] = sub_1000BE0B4;
  v119[3] = &unk_10018E608;
  id v61 = v58;
  id v120 = v61;
  [v102 setUpdateBlock:v119];
  [v110 addObject:v102];
  objc_storeStrong((id *)&self->_nameItem, v102);
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v110));
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472LL;
  v117[2] = sub_1000BE1C4;
  v117[3] = &unk_10018E608;
  id v95 = v100;
  id v118 = v95;
  [v62 setUpdateBlock:v117];
  v99 = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  uint64_t v64 = TSKLocString(@"HomeKitCamerasTitle");
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  id v66 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v65,  0LL,  v63,  @"cameraProfiles",  objc_opt_class(&OBJC_CLASS___TVSettingsHomeKitCamerasViewController));
  v101 = (void *)objc_claimAutoreleasedReturnValue(v66);

  [v101 setUpdateBlock:&stru_100193C20];
  v151 = v101;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v151, 1LL));
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v67));

  uint64_t v68 = TSKLocString(@"HomeKitSecureAccessoriesTitle");
  v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
  id v70 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v69,  0LL,  v63,  @"secureServices",  objc_opt_class(&OBJC_CLASS___TVSettingsHomeKitSecureAccessoriesViewController));
  v71 = (void *)objc_claimAutoreleasedReturnValue(v70);

  [v71 setUpdateBlock:&stru_100193C40];
  v150 = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v150, 1LL));
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v72));

  uint64_t v74 = TSKLocString(@"HomeKitSectionTitle");
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
  v149[0] = v99;
  v149[1] = v98;
  v149[2] = v73;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v149, 3LL));
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[TSKAggregateSettingGroup groupWithTitle:settingGroups:]( &OBJC_CLASS___TSKAggregateSettingGroup,  "groupWithTitle:settingGroups:",  v75,  v76));

  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472LL;
  v115[2] = sub_1000BE2B0;
  v115[3] = &unk_10018E608;
  id v78 = v63;
  id v116 = v78;
  [v77 setUpdateBlock:v115];
  uint64_t v79 = TSKLocString(@"HomeKitHubSectionTitle");
  v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472LL;
  v113[2] = sub_1000BE2F4;
  v113[3] = &unk_100193C68;
  objc_copyWeak(&v114, &location);
  v81 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v80,  v78,  @"residentDevices",  v113));

  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472LL;
  v111[2] = sub_1000BE594;
  v111[3] = &unk_10018E608;
  id v94 = v61;
  id v112 = v94;
  [v81 setUpdateBlock:v111];
  uint64_t v82 = TSKLocString(@"HomeKitUpdateOSItemTitle");
  v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
  uint64_t v84 = TSKLocString(@"HomeKitUpdateOSDialogSubtitle");
  v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
  id v86 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v83,  v85,  v78,  @"canAccessHomeData",  objc_opt_class(&OBJC_CLASS___TVSettingsHomeKitUpdateOSViewController));
  v87 = (void *)objc_claimAutoreleasedReturnValue(v86);

  [v87 setShouldPresentChildController:1];
  [v87 setUpdateBlock:&stru_100193C88];
  uint64_t v88 = TSKLocString(@"HomeKitSectionTitle");
  v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
  v148 = v87;
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v148, 1LL));
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v89,  v90));

  v147[0] = v103;
  v147[1] = v77;
  v147[2] = v81;
  v147[3] = v91;
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v147, 4LL));

  objc_destroyWeak(&v114);
  objc_destroyWeak(&v122);

  objc_destroyWeak(&v126);
  objc_destroyWeak(&v130);

  objc_destroyWeak(&v136);
  objc_destroyWeak(&location);
  return v92;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v14 = v12;
  if (off_1001E0590 == a6)
  {
    -[TVSettingsAirPlayViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayViewController navigationController](self, "navigationController"));
    id v16 = [v15 popToViewController:self animated:1];

    goto LABEL_17;
  }

  if (off_1001E0598 != a6)
  {
    if (off_1001E05A0 == a6)
    {
      uint64_t v24 = TVCSHomeLog(v12, v13);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localAccessory]);
        *(_DWORD *)buf = 136315394;
        v30 = "-[TVSettingsAirPlayViewController observeValueForKeyPath:ofObject:change:context:]";
        __int16 v31 = 2112;
        v32 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Local Accessory Changed %@", buf, 0x16u);
      }
    }

    else if (off_1001E05A8 != a6)
    {
      v28.receiver = self;
      v28.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayViewController;
      -[TVSettingsAirPlayViewController observeValueForKeyPath:ofObject:change:context:]( &v28,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
      goto LABEL_17;
    }

    -[TVSettingsAirPlayViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    goto LABEL_17;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v18 = [v17 homeConfigurationState];
  uint64_t v20 = TVCSHomeLog(v18, v19);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = TVCSHomeConfigurationStateToString(v18);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    *(_DWORD *)buf = 136315650;
    v30 = "-[TVSettingsAirPlayViewController observeValueForKeyPath:ofObject:change:context:]";
    __int16 v31 = 2112;
    v32 = v23;
    __int16 v33 = 2048;
    id v34 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Configuration state changed to %@ (%lu)",  buf,  0x20u);
  }

  if (v18 == (id)2) {
    [v17 startBrowsingForLocalAccessory];
  }
  else {
    [v17 stopBrowsingForLocalAccessory];
  }

LABEL_17:
}

- (void)presentActionForDisplayedDeepLinkURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  unsigned int v4 = [v3 containsString:@"cfuAction=finishSetup"];

  if (v4)
  {
    -[TVSettingsAirPlayViewController _handleFinishHomeSetupCFUAction](self, "_handleFinishHomeSetupCFUAction");
    lastDeepLinkURL = self->_lastDeepLinkURL;
    self->_lastDeepLinkURL = 0LL;
  }

- (id)_overscanAdjustmentFormatter
{
  uint64_t v2 = TSKLocString(@"APOverscanAutoValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v12 = v3;
  uint64_t v4 = TSKLocString(@"SettingsON");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v13 = v5;
  uint64_t v6 = TSKLocString(@"SettingsOFF");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  id v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AF238, v8, v12, v13);

  return v10;
}

- (void)_showConferenceRoomDisplayViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsCRDViewController);
  uint64_t v4 = TSKLocString(@"APCRDTitle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsCRDViewController setTitle:](v3, "setTitle:", v5);

  objc_initWeak(&location, self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionService sharedInstance](&OBJC_CLASS___PBSRestrictionService, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000BEB5C;
  v9[3] = &unk_10018FC18;
  objc_copyWeak(&v11, &location);
  v7 = v3;
  id v10 = v7;
  id v8 = [v6 validateRestrictionForSetting:3 allowInteraction:1 withCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_homeNeedsUserInterentionAlertViewController
{
  uint64_t v2 = TSKLocString(@"WHAProblemAlertTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = TSKLocString(@"WHAProblemAlertDescription");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v3,  v5,  1LL));

  uint64_t v7 = TSKLocString(@"WHAProblemAlertButtonTitle");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  &stru_100193CA8));

  [v6 addAction:v9];
  return v6;
}

- (id)_homeNoiCloudAccountAlertViewController
{
  uint64_t v2 = TSKLocString(@"WHANoiCloudAlertTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = TSKLocString(@"WHANoiCloudAlertDescription");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v3,  v5,  1LL));

  uint64_t v7 = TSKLocString(@"WHANoiCloudAlertButtonTitle");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  &stru_100193CC8));

  [v6 addAction:v9];
  return v6;
}

- (void)_toggleResidenceEnabled:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  unsigned int v6 = [v5 isEnabled];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayViewController updatingResidentDevices](self, "updatingResidentDevices"));
  [v7 addObject:v5];

  -[TVSettingsAirPlayViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000BEEF4;
  v9[3] = &unk_10018EB78;
  objc_copyWeak(&v11, &location);
  id v8 = v5;
  id v10 = v8;
  [v8 updatedEnabled:v6 ^ 1 completionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_makeDeviceNameChildViewControllerWithItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  uint64_t v6 = TSKLocString(@"NameChooseDeviceName");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TSKTextInputViewController setHeaderText:](v5, "setHeaderText:", v7);

  uint64_t v8 = TSKLocString(@"NameEnterNameText");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[TSKTextInputViewController setMessageText:](v5, "setMessageText:", v9);

  -[TSKTextInputViewController setEditingDelegate:](v5, "setEditingDelegate:", self);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedValueForSettingItem:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedValueForSettingItem:",  v4));

  if ((TVCSIsStringAppleTV(v10) & 1) == 0) {
    -[TSKTextInputViewController setInitialText:](v5, "setInitialText:", v10);
  }

  return v5;
}

- (void)_setDeviceName:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

  if (![v6 length])
  {

    uint64_t v6 = 0LL;
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000BF2D0;
  v18[3] = &unk_100190838;
  v18[4] = self;
  uint64_t v7 = objc_retainBlock(v18);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  if ([v8 homeConfigurationState] == (id)4)
  {
    uint64_t v10 = TVCSHomeLog(4LL, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[TVSettingsAirPlayViewController _setDeviceName:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Setting local accessory name.",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 localAccessory]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000BF354;
    v15[3] = &unk_100190860;
    v15[4] = self;
    id v17 = v7;
    id v16 = v8;
    [v12 setConfiguredName:v6 completionHandler:v15];
  }

  else if (v6)
  {
    ((void (*)(void *, void *))v7[2])(v7, v6);
  }

  else
  {
    uint64_t v13 = TSKLocString(@"DefaultName");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    ((void (*)(void *, void *))v7[2])(v7, v14);
  }
}

- (void)_presentSetAccessoryNameFailedViewControllerWithError:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[TVCSHomeKitErrorUtilities localizedMessageForHomeKitError:]( &OBJC_CLASS___TVCSHomeKitErrorUtilities,  "localizedMessageForHomeKitError:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  0LL,  1LL));
  uint64_t v5 = TSKLocString(@"OK");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  1LL,  0LL));
  [v4 addAction:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayViewController navigationController](self, "navigationController"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topViewController]);
  [v9 presentViewController:v4 animated:1 completion:0];
}

- (void)_presentWHASetupViewController
{
}

- (void)_pushRoomPickerViewController
{
}

- (void)_handleFinishHomeSetupCFUAction
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayViewController _settingGroups](self, "_settingGroups"));
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v4)
  {
    uint64_t v6 = v3;
    goto LABEL_21;
  }

  id v5 = v4;
  uint64_t v19 = self;
  id obj = v3;
  uint64_t v6 = 0LL;
  uint64_t v7 = *(void *)v26;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "settingItems", v19));
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v22;
        while (2)
        {
          for (j = 0LL; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)j);
            if ([v15 acceptsDeepLinkPathComponent:@"WHARoomTitle"])
            {
              id v16 = v15;

              uint64_t v6 = v16;
              goto LABEL_16;
            }
          }

          id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  if (self->_nameItem == a5)
  {
    -[TVSettingsAirPlayViewController _setDeviceName:](self, "_setDeviceName:", a4);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVSettingsAirPlayViewController;
    -[TVSettingsAirPlayViewController editingController:didProvideValue:forSettingItem:]( &v5,  "editingController:didProvideValue:forSettingItem:",  a3,  a4);
  }

- (NSURL)lastDeepLinkURL
{
  return self->_lastDeepLinkURL;
}

- (void)setLastDeepLinkURL:(id)a3
{
}

- (TSKSettingItem)nameItem
{
  return self->_nameItem;
}

- (TVSettingsHomeSetupController)homeSetupController
{
  return self->_homeSetupController;
}

- (void)setHomeSetupController:(id)a3
{
}

- (TVSiCloudAccountManager)accountManager
{
  return self->_accountManager;
}

- (NSMutableSet)updatingResidentDevices
{
  return self->_updatingResidentDevices;
}

- (void)setUpdatingResidentDevices:(id)a3
{
}

- (BOOL)lastPBSNeedsHomeKitAutoOnboardingValue
{
  return self->_lastPBSNeedsHomeKitAutoOnboardingValue;
}

- (void)setLastPBSNeedsHomeKitAutoOnboardingValue:(BOOL)a3
{
  self->_lastPBSNeedsHomeKitAutoOnboardingValue = a3;
}

- (id)pbsPrefsObserverToken
{
  return self->_pbsPrefsObserverToken;
}

- (void)setPbsPrefsObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end