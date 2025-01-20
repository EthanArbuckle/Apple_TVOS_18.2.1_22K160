@interface TVSettingsGeneralViewController
- (AFSettingsConnection)siriSettingsConnection;
- (BOOL)isTimeZoneUpdateAvailable;
- (TSKPreviewViewController)languagePreviewViewController;
- (TSKSettingItem)languageItem;
- (TSKSettingItem)siriLanguageItem;
- (TVSettingsBluetoothFacade)bluetoothFacade;
- (TVSettingsGeneralViewController)initWithStyle:(int64_t)a3;
- (TVSettingsNumberingSystemsFacade)numberingSystemFacade;
- (TVSettingsSiriVoiceTriggerFacade)siriVoiceTriggerFacade;
- (id)_deleteSiriHistoryStateString;
- (id)_dictationDescription;
- (id)_languageFormatter;
- (id)_localeFormatter;
- (id)_siriDeleteHistoryViewController;
- (id)_siriLanguageFormatter;
- (id)_sleepTimeouts;
- (id)_timeZoneNumberFormatter;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (int64_t)_keyboardsCount;
- (unint64_t)deleteSiriHistoryState;
- (void)_formatSleepTimeoutItem:(id)a3 withValue:(id)a4;
- (void)_promptForRMVWithLanguage:(id)a3 completion:(id)a4;
- (void)_showDeleteSiriHistoryFailedDialog;
- (void)_showRestrictionsViewController;
- (void)_updateAutomaticTimeZoneItem:(id)a3 value:(id)a4;
- (void)_updateSiriDeleteHistoryItem:(id)a3 optInStatus:(unint64_t)a4;
- (void)_updateTimeZoneItem:(id)a3 value:(id)a4;
- (void)activateKonamiCode:(id)a3;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBluetoothFacade:(id)a3;
- (void)setDeleteSiriHistoryState:(unint64_t)a3;
- (void)setIsTimeZoneUpdateAvailable:(BOOL)a3;
- (void)setNumberingSystemFacade:(id)a3;
- (void)setSiriSettingsConnection:(id)a3;
- (void)setSiriVoiceTriggerFacade:(id)a3;
- (void)timeChanged:(id)a3;
- (void)toggleAutomaticTimeZoneEnabled:(id)a3;
- (void)toggleDictationEnabled:(id)a3;
- (void)toggleSiriEnabled:(id)a3;
@end

@implementation TVSettingsGeneralViewController

- (TVSettingsGeneralViewController)initWithStyle:(int64_t)a3
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVSettingsGeneralViewController;
  v3 = -[TVSettingsGeneralViewController initWithStyle:](&v26, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_isTimeZoneUpdateAvailable = 0;
    objc_initWeak(&location, v3);
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10006A0C8;
    v23 = &unk_10018E810;
    objc_copyWeak(&v24, &location);
    dispatch_async(&_dispatch_main_q, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDeviceFacade sharedInstance]( &OBJC_CLASS___TVSettingsDeviceFacade,  "sharedInstance",  v20,  v21,  v22,  v23));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v4 selector:"timeChanged:" name:off_1001DF7B0[0] object:v5];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v4 selector:"internetAvailabilityChanged:" name:kATVInternetAvailabilityChanged object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v4 selector:"storeFrontChanged:" name:TVSStoreFrontDidChangeNotification object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v10 = objc_alloc_init(&OBJC_CLASS___TVSettingsBluetoothFacade);
    bluetoothFacade = v4->_bluetoothFacade;
    v4->_bluetoothFacade = v10;

    [v9 addObserver:v4 selector:"reloadSettingsIfNeeded" name:@"TVSettingsBluetoothDeviceInfoDidUpdateNotification" object:v4->_bluetoothFacade];
    v12 = objc_alloc_init(&OBJC_CLASS___TVSettingsNumberingSystemsFacade);
    numberingSystemFacade = v4->_numberingSystemFacade;
    v4->_numberingSystemFacade = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
    siriSettingsConnection = v4->_siriSettingsConnection;
    v4->_siriSettingsConnection = v14;

    v16 = -[TVSettingsSiriVoiceTriggerFacade initWithBluetoothFacade:]( objc_alloc(&OBJC_CLASS___TVSettingsSiriVoiceTriggerFacade),  "initWithBluetoothFacade:",  v4->_bluetoothFacade);
    siriVoiceTriggerFacade = v4->_siriVoiceTriggerFacade;
    v4->_siriVoiceTriggerFacade = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
    [v18 addObserver:v4 forKeyPath:@"configurations" options:0 context:off_1001DFD30];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"configurations" context:off_1001DFD30];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsGeneralViewController;
  -[TVSettingsGeneralViewController dealloc](&v5, "dealloc");
}

- (id)loadSettingGroups
{
  v223 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  v234 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppearanceFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppearanceFacade,  "sharedInstance"));
  v227 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionsSettings sharedInstance](&OBJC_CLASS___PBSRestrictionsSettings, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  id v236 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v233 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v239 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = TSKLocString(@"AboutTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v6,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsAboutViewController));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v228 = (void *)objc_claimAutoreleasedReturnValue( +[TSKKonamiCode codeWithSequence:action:]( &OBJC_CLASS___TSKKonamiCode,  "codeWithSequence:action:",  &off_1001AED88,  "activateKonamiCode:"));
  [v8 addKonamiCode:v228];
  [v8 setTarget:self];
  -[NSMutableArray addObject:](v239, "addObject:", v8);
  if ((_os_feature_enabled_impl("IdleScreen", "Fizzgig") & 1) == 0)
  {
    uint64_t v9 = TSKLocString(@"ScreenSaverTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v10,  0LL,  v223,  @"screenSaverName",  objc_opt_class(&OBJC_CLASS___TVSettingsScreenSaverViewController));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);

    -[NSMutableArray addObject:](v239, "addObject:", v12);
    v8 = (void *)v12;
  }

  uint64_t v13 = TSKLocString(@"UserInterfaceStyleTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = TSKLocString(@"UserInterfaceStyleDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v14,  v16,  v234,  @"systemAppearance",  objc_opt_class(&OBJC_CLASS___TVSettingsAppearanceViewController));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v234 userInterfaceStyleFormatter]);
  [v18 setLocalizedValueFormatter:v19];

  -[NSMutableArray addObject:](v239, "addObject:", v18);
  uint64_t v20 = TSKLocString(@"SleepTimeTitle");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = TSKLocString(@"SleepTimeDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController _sleepTimeouts](self, "_sleepTimeouts"));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem updatingMultiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "updatingMultiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v21,  v23,  v3,  @"sleepTimeout",  v24));

  v279[0] = _NSConcreteStackBlock;
  v279[1] = 3221225472LL;
  v279[2] = sub_10006C1F0;
  v279[3] = &unk_1001912E0;
  id v237 = v3;
  id v280 = v237;
  objc_copyWeak(&v281, &location);
  [v25 setUpdateBlock:v279];
  -[NSMutableArray addObject:](v239, "addObject:", v25);
  uint64_t v26 = TSKLocString(@"RestrictionsTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v27,  0LL,  v227,  @"restrictionsEnabled",  self,  "_showRestrictionsViewController"));

  [v28 setAccessoryTypes:1];
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v28 setLocalizedValueFormatter:v29];

  -[NSMutableArray addObject:](v239, "addObject:", v28);
  uint64_t v30 = TSKLocString(@"PrivacyTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v31,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsPrivacyViewController));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  -[NSMutableArray addObject:](v239, "addObject:", v33);
  uint64_t v34 = TSKLocString(@"LegalAndRegulatoryTitle");
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  id v36 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v35,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsLegalViewController));
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

  -[NSMutableArray addObject:](v239, "addObject:", v37);
  -[TSKSettingGroup setSettingItems:](v233, "setSettingItems:", v239);
  [v236 addObject:v233];
  v38 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v39 = TSKLocString(@"GeneralLocalizationSectionTitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v232 = -[TSKSettingGroup initWithTitle:](v38, "initWithTitle:", v40);

  v238 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v41 = TSKLocString(@"AppleTVLanguageTitle");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  id v43 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v42,  0LL,  v237,  @"systemLanguage",  objc_opt_class(&OBJC_CLASS___TVSettingsPreferredLanguagesViewController));
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

  [v44 setDeepLinkKey:@"LANGUAGE"];
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController _languageFormatter](self, "_languageFormatter"));
  [v44 setLocalizedValueFormatter:v45];

  [v44 setUpdateBlock:&stru_100191300];
  -[NSMutableArray addObject:](v238, "addObject:", v44);
  objc_storeStrong((id *)&self->_languageItem, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v47 = TSKLocStringFromBundleCachingKey(@"KeyboardTypeAuto", v46, 1LL, 0LL, @"Localizable-B519");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v290[0] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v50 = TSKLocStringFromBundleCachingKey(@"KeyboardTypeLinear", v49, 1LL, 0LL, @"Localizable-B519");
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v290[1] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v53 = TSKLocStringFromBundleCachingKey(@"KeyboardTypeGrid", v52, 1LL, 0LL, @"Localizable-B519");
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v290[2] = v54;
  v226 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v290, 3LL));

  v225 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEDA0,  v226);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v56 = TSKLocStringFromBundleCachingKey(@"KeyboardTypeTitle", v55, 1LL, 0LL, @"Localizable-B519");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v59 = TSKLocStringFromBundleCachingKey(@"KeyboardTypeDescription", v58, 1LL, 0LL, @"Localizable-B519");
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v57,  v60,  v237,  @"preferredKeyboardType",  &off_1001AEDA0));

  [v61 setLocalizedValueFormatter:v225];
  [v61 setUpdateBlock:&stru_100191320];
  -[NSMutableArray addObject:](v238, "addObject:", v61);
  uint64_t v62 = TSKLocString(@"DictationEnableTitle");
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  uint64_t v64 = TSKLocString(@"DictationDescription");
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v63,  v65,  v4,  @"dictationEnabled",  self,  "toggleDictationEnabled:"));

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v66 setLocalizedValueFormatter:v67];

  v276[0] = _NSConcreteStackBlock;
  v276[1] = 3221225472LL;
  v276[2] = sub_10006C490;
  v276[3] = &unk_1001912E0;
  id v68 = v4;
  id v277 = v68;
  objc_copyWeak(&v278, &location);
  [v66 setUpdateBlock:v276];
  -[NSMutableArray addObject:](v238, "addObject:", v66);
  uint64_t v69 = TSKLocString(@"RegionFormatTitle");
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  id v71 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v70,  0LL,  v237,  @"currentLocale",  objc_opt_class(&OBJC_CLASS___TVSettingsRegionViewController));
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);

  [v72 setDeepLinkKey:@"REGION"];
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController _localeFormatter](self, "_localeFormatter"));
  [v72 setLocalizedValueFormatter:v73];

  -[NSMutableArray addObject:](v238, "addObject:", v72);
  v74 = self->_numberingSystemFacade;
  uint64_t v75 = TSKLocString(@"NumbersFormatTitle");
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  v274[0] = _NSConcreteStackBlock;
  v274[1] = 3221225472LL;
  v274[2] = sub_10006C50C;
  v274[3] = &unk_10018EC30;
  v77 = v74;
  v275 = v77;
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v76,  0LL,  v77,  @"currentNumberingSystem",  v274));

  v272[0] = _NSConcreteStackBlock;
  v272[1] = 3221225472LL;
  v272[2] = sub_10006C53C;
  v272[3] = &unk_100191348;
  v221 = v77;
  v273 = v221;
  [v78 setUpdateBlock:v272];
  -[NSMutableArray addObject:](v238, "addObject:", v78);
  uint64_t v79 = TSKLocString(@"CapsLockTitle");
  v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
  uint64_t v81 = TSKLocString(@"CapsLockDescription");
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  bluetoothFacade = self->_bluetoothFacade;
  uint64_t v84 = TSKLocString(@"SettingsON");
  v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
  uint64_t v86 = TSKLocString(@"SettingsOFF");
  v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v80,  v82,  bluetoothFacade,  @"isCapsLockEnabled",  v85,  v87));

  [v88 setUpdateBlock:&stru_100191368];
  -[NSMutableArray addObject:](v238, "addObject:", v88);
  -[TSKSettingGroup setSettingItems:](v232, "setSettingItems:", v238);
  [v236 addObject:v232];
  v89 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v90 = TSKLocString(@"GeneralSiriSectionTitle");
  v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
  v235 = -[TSKSettingGroup initWithTitle:](v89, "initWithTitle:", v91);

  uint64_t v92 = TSKLocString(@"SiriDescription");
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  -[TSKSettingGroup setLocalizedDescription:](v235, "setLocalizedDescription:", v93);

  -[TSKSettingGroup setHidden:](v235, "setHidden:", MGGetBoolAnswer(@"assistant", v94) ^ 1);
  v240 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v95 = TSKLocString(@"SiriEnableTitle");
  v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
  v97 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v96,  0LL,  v68,  @"siriEnabled",  self,  "toggleSiriEnabled:"));

  v98 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v97 setLocalizedValueFormatter:v98];

  -[NSMutableArray addObject:](v240, "addObject:", v97);
  v224 = (void *)objc_claimAutoreleasedReturnValue([v68 availableLanguages]);
  uint64_t v99 = TSKLocString(@"SiriLanguageTitle");
  v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
  v101 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v100,  0LL,  v68,  @"language",  v224));

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController _siriLanguageFormatter](self, "_siriLanguageFormatter"));
  [v101 setLocalizedValueFormatter:v102];

  [v101 setSortsByTitle:1];
  v270[0] = _NSConcreteStackBlock;
  v270[1] = 3221225472LL;
  v270[2] = sub_10006C604;
  v270[3] = &unk_10018E608;
  id v103 = v68;
  id v271 = v103;
  [v101 setUpdateBlock:v270];
  -[NSMutableArray addObject:](v240, "addObject:", v101);
  objc_storeStrong((id *)&self->_siriLanguageItem, v101);
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController siriVoiceTriggerFacade](self, "siriVoiceTriggerFacade"));
  v105 = (void *)objc_claimAutoreleasedReturnValue([v104 localizedTriggerString:@"SiriHSAccessoriesTitle"]);
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v105,  0LL,  v103,  @"voiceTriggerEnabled",  v104,  "toggleVoiceTriggerEnabled:"));

  v107 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v106 setLocalizedValueFormatter:v107];

  v266[0] = _NSConcreteStackBlock;
  v266[1] = 3221225472LL;
  v266[2] = sub_10006C648;
  v266[3] = &unk_100191390;
  objc_copyWeak(&v269, &location);
  id v108 = v103;
  id v267 = v108;
  id v222 = v104;
  id v268 = v222;
  [v106 setUpdateBlock:v266];
  -[NSMutableArray addObject:](v240, "addObject:", v106);
  LODWORD(v105) = _os_feature_enabled_impl("CoreSpeech", "support_js");
  id v109 = sub_10006C784();
  v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
  BOOL v111 = os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v105)
  {
    if (v111)
    {
      v231 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController bluetoothFacade](self, "bluetoothFacade"));
      unsigned int v209 = [v231 hasPairedDoAPDevice];
      v210 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController bluetoothFacade](self, "bluetoothFacade"));
      unsigned int v211 = [v210 hasPairedJSDevice];
      v212 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController bluetoothFacade](self, "bluetoothFacade"));
      unsigned int v213 = [v212 hasPairedDoAPOnlyDevice];
      *(_DWORD *)buf = 67109632;
      unsigned int v285 = v209;
      __int16 v286 = 1024;
      unsigned int v287 = v211;
      __int16 v288 = 1024;
      unsigned int v289 = v213;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_DEBUG,  "support_js enabled %d %d %d",  buf,  0x14u);
    }

    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v113 = TSKLocStringFromBundleCachingKey( @"SiriHSJSAccessoriesTitle",  v112,  1LL,  0LL,  @"Localizable-JustSiri");
    v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
    v264[0] = _NSConcreteStackBlock;
    v264[1] = 3221225472LL;
    v264[2] = sub_10006C7C4;
    v264[3] = &unk_10018EC30;
    v115 = (os_log_s *)v222;
    v265 = v115;
    v116 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v114,  0LL,  v115,  @"voiceTriggerPhraseType",  v264));

    v260[0] = _NSConcreteStackBlock;
    v260[1] = 3221225472LL;
    v260[2] = sub_10006C7F4;
    v260[3] = &unk_1001913B8;
    objc_copyWeak(&v263, &location);
    id v261 = v108;
    v117 = v115;
    v262 = v117;
    [v116 setUpdateBlock:v260];
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s voiceTriggerPhraseFormatter](v117, "voiceTriggerPhraseFormatter"));
    [v116 setLocalizedValueFormatter:v118];

    -[NSMutableArray addObject:](v240, "addObject:", v116);
    objc_destroyWeak(&v263);
    v110 = v265;
  }

  else
  {
    if (v111)
    {
      v214 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController bluetoothFacade](self, "bluetoothFacade"));
      unsigned int v215 = [v214 hasPairedDoAPDevice];
      v216 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController bluetoothFacade](self, "bluetoothFacade"));
      unsigned int v217 = [v216 hasPairedJSDevice];
      v218 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController bluetoothFacade](self, "bluetoothFacade"));
      unsigned int v219 = [v218 hasPairedDoAPOnlyDevice];
      *(_DWORD *)buf = 67109632;
      unsigned int v285 = v215;
      __int16 v286 = 1024;
      unsigned int v287 = v217;
      __int16 v288 = 1024;
      unsigned int v289 = v219;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_DEBUG,  "support_js disabled %d %d %d",  buf,  0x14u);
    }

    v116 = v106;
  }

  uint64_t v119 = TSKLocString(@"SiriHistoryTitle");
  v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
  v258[0] = _NSConcreteStackBlock;
  v258[1] = 3221225472LL;
  v258[2] = sub_10006C8E0;
  v258[3] = &unk_10018E9D8;
  objc_copyWeak(&v259, &location);
  v121 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v120,  0LL,  v108,  @"dataSharingOptInStatus",  v258));

  v256[0] = _NSConcreteStackBlock;
  v256[1] = 3221225472LL;
  v256[2] = sub_10006C918;
  v256[3] = &unk_10018E9B0;
  objc_copyWeak(&v257, &location);
  [v121 setUpdateBlock:v256];
  [v121 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v240, "addObject:", v121);
  if (_os_feature_enabled_impl("SiriTV", "siri_tv_snippet_modernization"))
  {
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v123 = TSKLocStringFromBundleCachingKey( @"SiriAlwaysShowSpeechTitle",  v122,  1LL,  0LL,  @"Localizable-J255");
    v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v126 = TSKLocStringFromBundleCachingKey( @"SiriAlwaysShowSpeechTitle",  v125,  1LL,  0LL,  @"Localizable-J255");
    v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v129 = TSKLocStringFromBundleCachingKey( @"SiriAlwaysShowSpeechTitle",  v128,  1LL,  0LL,  @"Localizable-J255");
    v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
    v131 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v124,  0LL,  v108,  @"siriAlwaysShowSpeech",  v127,  v130));

    v132 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
    [v131 setLocalizedValueFormatter:v132];

    v254[0] = _NSConcreteStackBlock;
    v254[1] = 3221225472LL;
    v254[2] = sub_10006C98C;
    v254[3] = &unk_10018E608;
    id v255 = v108;
    [v131 setUpdateBlock:v254];
    -[NSMutableArray addObject:](v240, "addObject:", v131);
  }

  else
  {
    v131 = v121;
  }

  uint64_t v133 = TSKLocString(@"SiriOSAItemTitle");
  v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
  uint64_t v135 = TSKLocString(@"SettingsON");
  v136 = (void *)objc_claimAutoreleasedReturnValue(v135);
  uint64_t v137 = TSKLocString(@"SettingsOFF");
  v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v134,  0LL,  v108,  @"screenActionsEnabled",  v136,  v138));

  v252[0] = _NSConcreteStackBlock;
  v252[1] = 3221225472LL;
  v252[2] = sub_10006CA20;
  v252[3] = &unk_10018E608;
  id v140 = v108;
  id v253 = v140;
  [v139 setUpdateBlock:v252];
  -[NSMutableArray addObject:](v240, "addObject:", v139);
  uint64_t v141 = TSKLocString(@"SiriTCCItemTitle");
  v142 = (void *)objc_claimAutoreleasedReturnValue(v141);
  id v143 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v142,  0LL,  v140,  @"siriEnabled",  objc_opt_class(&OBJC_CLASS___TVSettingsSiriTCCController));
  v144 = (void *)objc_claimAutoreleasedReturnValue(v143);

  v250[0] = _NSConcreteStackBlock;
  v250[1] = 3221225472LL;
  v250[2] = sub_10006CA88;
  v250[3] = &unk_10018E608;
  id v220 = v140;
  id v251 = v220;
  [v144 setUpdateBlock:v250];
  -[NSMutableArray addObject:](v240, "addObject:", v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.siri"));

  -[NSMutableArray addObject:](v240, "addObject:", v145);
  -[TSKSettingGroup setSettingItems:](v235, "setSettingItems:", v240);
  [v236 addObject:v235];
  v146 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v147 = TSKLocString(@"GeneralUsageSectionTitle");
  v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
  v230 = -[TSKSettingGroup initWithTitle:](v146, "initWithTitle:", v148);

  v149 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (+[TVSDevice supportsApplicationStorage](&OBJC_CLASS___TVSDevice, "supportsApplicationStorage"))
  {
    uint64_t v150 = TSKLocString(@"DeviceUsageTitle");
    v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
    id v152 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v151,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsLocalStorageViewController));
    uint64_t v153 = objc_claimAutoreleasedReturnValue(v152);

    -[NSMutableArray addObject:](v149, "addObject:", v153);
    v145 = (void *)v153;
  }

  uint64_t v154 = TSKLocString(@"BackgroundAppRefreshTitle");
  v155 = (void *)objc_claimAutoreleasedReturnValue(v154);
  id v156 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v155,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsBackgroundAppRefreshViewController));
  v157 = (void *)objc_claimAutoreleasedReturnValue(v156);

  -[NSMutableArray addObject:](v149, "addObject:", v157);
  uint64_t v158 = TSKLocString(@"PreviouslyUsedEmailTitle");
  v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
  uint64_t v160 = TSKLocString(@"PreviouslyUsedEmailDescription");
  v161 = (void *)objc_claimAutoreleasedReturnValue(v160);
  id v162 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v159,  v161,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsPreviouslyUsedEmailViewController));
  v163 = (void *)objc_claimAutoreleasedReturnValue(v162);

  -[NSMutableArray addObject:](v149, "addObject:", v163);
  -[TSKSettingGroup setSettingItems:](v230, "setSettingItems:", v149);
  [v236 addObject:v230];
  v164 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v165 = TSKLocString(@"GeneralDateAndTimeSectionTitle");
  v166 = (void *)objc_claimAutoreleasedReturnValue(v165);
  v229 = -[TSKSettingGroup initWithTitle:](v164, "initWithTitle:", v166);

  v167 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v168 = TSKLocString(@"TimeZoneSetAutomaticallyTitle");
  v169 = (void *)objc_claimAutoreleasedReturnValue(v168);
  uint64_t v170 = TSKLocString(@"TimeZoneSetAutomaticallyDescription");
  v171 = (void *)objc_claimAutoreleasedReturnValue(v170);
  v172 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v169,  v171,  v237,  @"automaticTimeZoneSelectionEnabled",  self,  "toggleAutomaticTimeZoneEnabled:"));

  v173 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v172 setLocalizedValueFormatter:v173];

  v248[0] = _NSConcreteStackBlock;
  v248[1] = 3221225472LL;
  v248[2] = sub_10006CAFC;
  v248[3] = &unk_10018E9B0;
  objc_copyWeak(&v249, &location);
  [v172 setUpdateBlock:v248];
  -[NSMutableArray addObject:](v167, "addObject:", v172);
  uint64_t v174 = TSKLocString(@"TimeZoneItemTitle");
  v175 = (void *)objc_claimAutoreleasedReturnValue(v174);
  id v176 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v175,  0LL,  v237,  @"timeZoneCityID",  objc_opt_class(&OBJC_CLASS___TVSettingsTimeZoneEditingViewController));
  v177 = (void *)objc_claimAutoreleasedReturnValue(v176);

  v246[0] = _NSConcreteStackBlock;
  v246[1] = 3221225472LL;
  v246[2] = sub_10006CB8C;
  v246[3] = &unk_10018E9B0;
  objc_copyWeak(&v247, &location);
  [v177 setUpdateBlock:v246];
  -[NSMutableArray addObject:](v167, "addObject:", v177);
  uint64_t v178 = TSKLocString(@"TimeZoneSet24HourTitle");
  v179 = (void *)objc_claimAutoreleasedReturnValue(v178);
  v180 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v179,  0LL,  v237,  @"use24HourTime",  0LL,  0LL));

  v245[0] = _NSConcreteStackBlock;
  v245[1] = 3221225472LL;
  v245[2] = sub_10006CBF0;
  v245[3] = &unk_100190B00;
  v245[4] = self;
  id v181 = [[TVSBlockFormatter alloc] initWithFormattingBlock:v245];
  [v180 setLocalizedValueFormatter:v181];
  -[NSMutableArray addObject:](v167, "addObject:", v180);
  -[TSKSettingGroup setSettingItems:](v229, "setSettingItems:", v167);
  [v236 addObject:v229];
  if (_os_feature_enabled_impl("TVSettings", "VPN"))
  {
    v182 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
    v183 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
    uint64_t v184 = TSKLocString(@"GeneralManagementSectionTitle");
    v185 = (void *)objc_claimAutoreleasedReturnValue(v184);
    v186 = -[TSKSettingGroup initWithTitle:](v183, "initWithTitle:", v185);

    v187 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v188 = TSKLocString(@"VPNSectionDescription");
    v189 = (void *)objc_claimAutoreleasedReturnValue(v188);
    id v190 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  0LL,  v189,  v182,  @"activeConfiguration",  objc_opt_class(&OBJC_CLASS___TVSettingsVPNViewController));
    v191 = (void *)objc_claimAutoreleasedReturnValue(v190);

    v243[0] = _NSConcreteStackBlock;
    v243[1] = 3221225472LL;
    v243[2] = sub_10006CCC0;
    v243[3] = &unk_100190048;
    id v192 = v182;
    id v244 = v192;
    [v191 setUpdateBlock:v243];
    -[NSMutableArray addObject:](v187, "addObject:", v191);
    v193 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.vpn"));

    v241[0] = _NSConcreteStackBlock;
    v241[1] = 3221225472LL;
    v241[2] = sub_10006CDB4;
    v241[3] = &unk_10018E608;
    v194 = (TSKSettingGroup *)v192;
    v242 = v194;
    [v193 setUpdateBlock:v241];
    -[NSMutableArray addObject:](v187, "addObject:", v193);
    v195 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities deviceManagementBundlePath]( &OBJC_CLASS___TVSettingsUtilities,  "deviceManagementBundlePath"));
    v196 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v195));
    v197 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v196));

    uint64_t v198 = TSKLocString(@"ProfilesTitle");
    v199 = (void *)objc_claimAutoreleasedReturnValue(v198);
    [v197 setLocalizedTitle:v199];

    [v197 _preloadViewController];
    [v197 setUpdateBlock:&stru_1001913D8];
    [v197 setEnabledInStoreDemoMode:0];
    [v197 setDeepLinkableWhenHidden:1];
    -[NSMutableArray addObject:](v187, "addObject:", v197);
    -[TSKSettingGroup setSettingItems:](v186, "setSettingItems:", v187);
    [v236 addObject:v186];
  }

  else
  {
    v200 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
    uint64_t v201 = TSKLocString(@"GeneralProfilesSectionTitle");
    v202 = (void *)objc_claimAutoreleasedReturnValue(v201);
    v194 = -[TSKSettingGroup initWithTitle:](v200, "initWithTitle:", v202);

    v203 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities deviceManagementBundlePath]( &OBJC_CLASS___TVSettingsUtilities,  "deviceManagementBundlePath"));
    v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v203));
    v197 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v204));

    uint64_t v205 = TSKLocString(@"ProfilesTitle");
    v206 = (void *)objc_claimAutoreleasedReturnValue(v205);
    [v197 setLocalizedTitle:v206];

    [v197 _preloadViewController];
    [v197 setUpdateBlock:&stru_1001913F8];
    [v197 setEnabledInStoreDemoMode:0];
    [v197 setDeepLinkableWhenHidden:1];
    v283 = v197;
    v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v283, 1LL));
    -[TSKSettingGroup setSettingItems:](v194, "setSettingItems:", v207);

    [v236 addObject:v194];
  }

  objc_destroyWeak(&v247);
  objc_destroyWeak(&v249);

  objc_destroyWeak(&v257);
  objc_destroyWeak(&v259);

  objc_destroyWeak(&v269);
  objc_destroyWeak(&v278);

  objc_destroyWeak(&v281);
  objc_destroyWeak(&location);
  return v236;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( -[TVSettingsGeneralViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
  if (v5 == self->_languageItem)
  {
    languagePreviewViewController = self->_languagePreviewViewController;
    if (!languagePreviewViewController)
    {
      id v9 = objc_alloc(&OBJC_CLASS___TSKVibrantImageView);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsUtilities languageImage](&OBJC_CLASS___TVSettingsUtilities, "languageImage"));
      id v11 = [v9 initWithImage:v10 identifier:@"languageFlag"];

      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
      uint64_t v13 = self->_languagePreviewViewController;
      self->_languagePreviewViewController = v12;

      -[TSKPreviewViewController setContentView:](self->_languagePreviewViewController, "setContentView:", v11);
      languagePreviewViewController = self->_languagePreviewViewController;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedDescription](v5, "localizedDescription"));
    -[TSKPreviewViewController setDescriptionText:](languagePreviewViewController, "setDescriptionText:", v14);

    id v7 = self->_languagePreviewViewController;
  }

  else
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___TVSettingsGeneralViewController;
    id v6 = -[TVSettingsGeneralViewController previewForItemAtIndexPath:](&v17, "previewForItemAtIndexPath:", v4);
    id v7 = (TSKPreviewViewController *)objc_claimAutoreleasedReturnValue(v6);
  }

  uint64_t v15 = v7;

  return v15;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (TSKSettingItem *)a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSKSettingItem valueForSettingItem:](&OBJC_CLASS___TSKSettingItem, "valueForSettingItem:", v10));
  uint64_t v12 = v11;
  if (self->_siriLanguageItem == v10 && ([v11 isEqual:v9] & 1) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006D28C;
    v14[3] = &unk_100191420;
    id v15 = v8;
    id v16 = v9;
    objc_super v17 = v10;
    v18 = self;
    -[TVSettingsGeneralViewController _promptForRMVWithLanguage:completion:]( self,  "_promptForRMVWithLanguage:completion:",  v16,  v14);
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___TVSettingsGeneralViewController;
    -[TVSettingsGeneralViewController editingController:didProvideValue:forSettingItem:]( &v13,  "editingController:didProvideValue:forSettingItem:",  v8,  v9,  v10);
  }
}

- (void)timeChanged:(id)a3
{
  id v4 = sub_10006C784();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received TVSettingsDeviceFacadeSignificantTimeChangeNotification. Will reload settings",  v6,  2u);
  }

  -[TVSettingsGeneralViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)toggleSiriEnabled:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance", a3));
  unsigned int v5 = [v4 isSiriEnabled];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  unsigned int v7 = [v6 isDictationEnabled];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  uint64_t v9 = v5 ^ 1;
  [v8 setSiriEnabled:v9];

  if ((v9 & 1) == 0)
  {
    if (v7)
    {
      uint64_t v10 = TSKLocString(@"SiriAndDictationWarningTitle");
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = TSKLocString(@"SiriDisableWarningMessage");
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v11,  v13,  1LL));

      uint64_t v14 = TSKLocString(@"SettingsOK");
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  0LL));
      [v18 addAction:v16];

      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController navigationController](self, "navigationController"));
      [v17 presentViewController:v18 animated:1 completion:0];
    }
  }

- (void)toggleDictationEnabled:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance", a3));
  unsigned int v5 = [v4 isSiriEnabled];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  unsigned int v7 = [v6 isDictationEnabled];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  uint64_t v9 = v7 ^ 1;
  [v8 setDictationEnabled:v9];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
    [v10 setOfferedEnableDictation:1];

    if (v5)
    {
      uint64_t v11 = TSKLocString(@"SiriAndDictationWarningTitle");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = TSKLocString(@"DictationDisableWarningMessage");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v19 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v12,  v14,  1LL));

      uint64_t v15 = TSKLocString(@"SettingsOK");
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  0LL));
      [v19 addAction:v17];

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController navigationController](self, "navigationController"));
      [v18 presentViewController:v19 animated:1 completion:0];
    }
  }

- (void)toggleAutomaticTimeZoneEnabled:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance", a3));
  unsigned __int8 v5 = [v4 isAutomaticTimeZoneSelectionEnabled];

  if ((v5 & 1) != 0)
  {
    id v6 = sub_10006C784();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Disabling automatic time zone selection",  v27,  2u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
    [v8 setAutomaticTimeZoneSelectionEnabled:0];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
    if ([v8 locationServicesEnabled]
      && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 timeZoneItem]),
          id v10 = [v9 accessType],
          v9,
          v10 == (id)3))
    {
      id v11 = sub_10006C784();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Enabling automatic time zone selection",  buf,  2u);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
      [v13 setAutomaticTimeZoneSelectionEnabled:1];
    }

    else
    {
      id v14 = sub_10006C784();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Location services for time zone is not enabled. Will prompt",  v28,  2u);
      }

      uint64_t v16 = TSKLocString(@"TimeZoneLocationServicesWarningTitle");
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = TSKLocString(@"TimeZoneLocationServicesWarningMessage");
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v17,  v19,  1LL));

      uint64_t v20 = TSKLocString(@"TurnOnLocationButtonTitle");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  0LL,  &stru_100191440));
      [v13 addAction:v22];

      uint64_t v23 = TSKLocString(@"NotNowButtonTitle");
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v24,  1LL,  &stru_100191460));
      [v13 addAction:v25];

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController navigationController](self, "navigationController"));
      [v26 presentViewController:v13 animated:1 completion:0];
    }
  }
}

- (void)activateKonamiCode:(id)a3
{
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsSDMConfigurationViewController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsGeneralViewController navigationController](self, "navigationController"));
  [v4 pushViewController:v5 animated:1];
}

- (void)_formatSleepTimeoutItem:(id)a3 withValue:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  if ((uint64_t)[v9 integerValue] <= 0)
  {
    id v6 = (NSDateComponentsFormatter *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSDateComponentsFormatter localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"Sleep Never",  &stru_100195DD8,  0LL));
  }

  else
  {
    id v6 = objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter);
    -[NSDateComponentsFormatter setAllowedUnits:](v6, "setAllowedUnits:", 96LL);
    -[NSDateComponentsFormatter setUnitsStyle:](v6, "setUnitsStyle:", 3LL);
    unsigned int v7 = objc_opt_new(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setSecond:](v7, "setSecond:", [v9 integerValue]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromDateComponents:](v6, "stringFromDateComponents:", v7));
  }

  [v5 setLocalizedValue:v8];
}

- (id)_siriLanguageFormatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006DBE8;
  v7[3] = &unk_100190B00;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 initWithFormattingBlock:v7];

  return v5;
}

- (id)_languageFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100191480];
}

- (id)_localeFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_1001914A0];
}

- (id)_timeZoneNumberFormatter
{
  if (qword_1001E1820 != -1) {
    dispatch_once(&qword_1001E1820, &stru_1001914C0);
  }
  v2 = (void *)qword_1001E1818;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  [v2 setLocale:v3];

  return (id)qword_1001E1818;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFD30 == a6)
  {
    -[TVSettingsGeneralViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsGeneralViewController;
    -[TVSettingsGeneralViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)setIsTimeZoneUpdateAvailable:(BOOL)a3
{
  self->_isTimeZoneUpdateAvailable = a3;
  -[TVSettingsGeneralViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (id)_sleepTimeouts
{
  return &off_1001AEDB8;
}

- (void)_showRestrictionsViewController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsRestrictionsViewController);
  uint64_t v4 = TSKLocString(@"RestrictionsTitle");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsRestrictionsViewController setTitle:](v3, "setTitle:", v5);

  objc_initWeak(&location, self);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionService sharedInstance](&OBJC_CLASS___PBSRestrictionService, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006E02C;
  v9[3] = &unk_10018FC18;
  objc_copyWeak(&v11, &location);
  unsigned int v7 = v3;
  id v10 = v7;
  id v8 = [v6 validateRestrictionForSetting:1 allowInteraction:1 withCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateAutomaticTimeZoneItem:(id)a3 value:(id)a4
{
  id v4 = a3;
  unsigned int v5 = +[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
  id v7 = sub_10006C784();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000F89A8(v5, v6, v8);
  }

  if (!v5)
  {
    uint64_t v12 = @"TimeZoneAutomaticUnavailableInternetDescription";
LABEL_9:
    uint64_t v13 = TSKLocString(v12);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_10;
  }

  if (![v6 locationServicesEnabled]
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 timeZoneItem]),
        id v10 = [v9 accessType],
        v9,
        v10 != (id)3))
  {
    uint64_t v12 = @"TimeZoneAutomaticUnavailableNotAllowedDescription";
    goto LABEL_9;
  }

  id v11 = 0LL;
LABEL_10:
  [v4 setLocalizedDescription:v11];
}

- (void)_updateTimeZoneItem:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  id v9 = sub_10006C784();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000F8A7C((uint64_t)v7, v8, v10);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 cityNameForCityID:v7]);
  [v6 setLocalizedValue:v11];

  objc_msgSend(v6, "setEnabled:", objc_msgSend(v8, "isAutomaticTimeZoneSelectionEnabled") ^ 1);
  if (-[TVSettingsGeneralViewController isTimeZoneUpdateAvailable](self, "isTimeZoneUpdateAvailable"))
  {
    uint64_t v12 = TSKLocString(@"TimeZoneUpdateAvailableDescription");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v6 setLocalizedDescription:v13];
  }

  else
  {
    [v6 setLocalizedDescription:0];
  }
}

- (id)_dictationDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  if ([v2 isDictationSupportedForSystemLanguage:0])
  {
    uint64_t v3 = TSKLocString(@"DictationDescription");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IntlUtility sharedIntlUtility](&OBJC_CLASS___IntlUtility, "sharedIntlUtility"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 displayNameForLanguage:v6 context:1 displayLanguage:v7]);

    uint64_t v9 = TSKLocString(@"DictationUnavailableDescription");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v8));
  }

  return v4;
}

- (id)_siriDeleteHistoryViewController
{
  uint64_t v2 = TSKLocString(@"SiriDeleteHistoryTitle");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v3,  0LL,  1LL));

  uint64_t v5 = TSKLocString(@"SiriDeleteHistoryDeleteButtonTitle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006E5F0;
  v14[3] = &unk_10018F4E8;
  objc_copyWeak(&v15, &location);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  2LL,  v14));
  [v4 addAction:v7];

  uint64_t v8 = TSKLocString(@"SiriDeleteHistoryCancelButtonTitle");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006E7AC;
  v12[3] = &unk_10018F4E8;
  objc_copyWeak(&v13, &location);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  v12));
  [v4 addAction:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v4;
}

- (void)_updateSiriDeleteHistoryItem:(id)a3 optInStatus:(unint64_t)a4
{
  id v12 = a3;
  if (a4 == 1) {
    id v6 = @"SiriHistoryDescriptionOptedIn";
  }
  else {
    id v6 = @"SiriHistoryDescriptionNotOptedIn";
  }
  uint64_t v7 = TSKLocString(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v12 setLocalizedDescription:v8];
  unint64_t v9 = -[TVSettingsGeneralViewController deleteSiriHistoryState](self, "deleteSiriHistoryState");
  BOOL v10 = v9 == 1;
  [v12 setEnabled:v9 != 1];
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsGeneralViewController _deleteSiriHistoryStateString]( self,  "_deleteSiriHistoryStateString"));
  [v12 setLocalizedValue:v11];
}

- (id)_deleteSiriHistoryStateString
{
  if ((id)-[TVSettingsGeneralViewController deleteSiriHistoryState](self, "deleteSiriHistoryState") == (id)2)
  {
    uint64_t v2 = TSKLocString(@"SiriDeleteHistoryReceived");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (void)_showDeleteSiriHistoryFailedDialog
{
  uint64_t v3 = TSKLocString(@"SiriDeleteHistoryFailedTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"SiriDeleteHistoryFailedMessage");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  uint64_t v7 = TSKLocString(@"SettingsOK");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  0LL));
  [v10 addAction:v9];

  -[TVSettingsGeneralViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);
}

- (int64_t)_keyboardsCount
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyboardInputModeController sharedInputModeController]( &OBJC_CLASS___UIKeyboardInputModeController,  "sharedInputModeController"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 enabledInputModeIdentifiers]);
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (void)_promptForRMVWithLanguage:(id)a3 completion:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10006EDE0;
  v46[3] = &unk_10018FA70;
  id v25 = v6;
  id v47 = v25;
  id v24 = [v7 initWithTimeout:&_dispatch_main_q queue:v46 completion:10.0];
  uint64_t v22 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfileListFacade);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade availableUsers](v22, "availableUsers"));
  unint64_t v9 = dispatch_group_create();
  id v10 = objc_alloc_init(&OBJC_CLASS___BSAtomicSignal);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v43;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v13);
        if (([v10 hasBeenSignalled] & 1) == 0)
        {
          dispatch_group_enter(v9);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userProfile]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 iCloudAltDSID]);

          objc_initWeak(&location, self);
          siriSettingsConnection = self->_siriSettingsConnection;
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_10006EE5C;
          v31[3] = &unk_100191510;
          objc_copyWeak(&v40, &location);
          id v32 = v10;
          id v33 = v24;
          id v34 = v23;
          id v39 = v25;
          v35 = self;
          id v36 = v14;
          id v18 = v16;
          id v37 = v18;
          v38 = v9;
          -[AFSettingsConnection getSiriRMVStatusForiCloudAltDSID:completion:]( siriSettingsConnection,  "getSiriRMVStatusForiCloudAltDSID:completion:",  v18,  v31);

          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }

    while (v11);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006F47C;
  block[3] = &unk_100191538;
  id v28 = v24;
  id v29 = v10;
  id v30 = v25;
  id v19 = v25;
  id v20 = v10;
  id v21 = v24;
  dispatch_group_notify(v9, &_dispatch_main_q, block);

  [v21 start];
}

- (TSKSettingItem)siriLanguageItem
{
  return self->_siriLanguageItem;
}

- (TSKSettingItem)languageItem
{
  return self->_languageItem;
}

- (TSKPreviewViewController)languagePreviewViewController
{
  return self->_languagePreviewViewController;
}

- (BOOL)isTimeZoneUpdateAvailable
{
  return self->_isTimeZoneUpdateAvailable;
}

- (TVSettingsBluetoothFacade)bluetoothFacade
{
  return self->_bluetoothFacade;
}

- (void)setBluetoothFacade:(id)a3
{
}

- (unint64_t)deleteSiriHistoryState
{
  return self->_deleteSiriHistoryState;
}

- (void)setDeleteSiriHistoryState:(unint64_t)a3
{
  self->_deleteSiriHistoryState = a3;
}

- (TVSettingsNumberingSystemsFacade)numberingSystemFacade
{
  return self->_numberingSystemFacade;
}

- (void)setNumberingSystemFacade:(id)a3
{
}

- (AFSettingsConnection)siriSettingsConnection
{
  return self->_siriSettingsConnection;
}

- (void)setSiriSettingsConnection:(id)a3
{
}

- (TVSettingsSiriVoiceTriggerFacade)siriVoiceTriggerFacade
{
  return self->_siriVoiceTriggerFacade;
}

- (void)setSiriVoiceTriggerFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end