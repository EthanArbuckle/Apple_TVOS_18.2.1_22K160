@interface TVSettingsRestrictionsViewController
- (TVSettingsRestrictionsViewController)initWithStyle:(int64_t)a3;
- (id)_allowRestrictBoolFormatter;
- (id)_allowRestrictFormatter;
- (id)_booksRatingFormatter;
- (id)_contentFilterRegionFormatter;
- (id)_explicitMusicFormatter;
- (id)_ratingFormatter;
- (id)_ratingLongFormatter;
- (id)_yesNoFormatter;
- (id)loadSettingGroups;
- (void)_changePasscode:(id)a3;
- (void)_disableRestrictions;
- (void)_enableRestrictions;
- (void)_handleSetPasscodeResult:(id)a3;
- (void)_resetRestrictions:(id)a3;
- (void)_toggleBypassRestrictionsItem:(id)a3;
- (void)_toggleRestrictions:(id)a3;
- (void)_updateGuardedState;
- (void)dealloc;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsRestrictionsViewController

- (TVSettingsRestrictionsViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsViewController;
  v3 = -[TVSettingsRestrictionsViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
    [v4 addObserver:v3];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsViewController;
  -[TVSettingsRestrictionsViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsRestrictionsViewController;
  -[TVSettingsRestrictionsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  [v3 reloadIfNeeded];
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  v185 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfileListFacade);
  v202 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = TSKLocString(@"RestrictionsEnableTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v189 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v3,  @"areRestrictionsEnabled",  self,  "_toggleRestrictions:"));

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v189 setLocalizedValueFormatter:v6];

  v219[0] = _NSConcreteStackBlock;
  v219[1] = 3221225472LL;
  v219[2] = sub_100081B38;
  v219[3] = &unk_10018E608;
  id v7 = v3;
  id v220 = v7;
  v201 = objc_retainBlock(v219);
  uint64_t v8 = TSKLocString(@"RestrictionsChangePasscodeTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v188 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v9,  0LL,  0LL,  0LL,  self,  "_changePasscode:"));

  [v188 setUpdateBlock:v201];
  uint64_t v10 = TSKLocString(@"RestrictionsResetTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v187 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v11,  0LL,  0LL,  0LL,  self,  "_resetRestrictions:"));

  [v187 setUpdateBlock:v201];
  v12 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v13 = TSKLocString(@"RestrictionsParentalControlsSectionTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v186 = -[TSKSettingGroup initWithTitle:](v12, "initWithTitle:", v14);

  v227[0] = v189;
  v227[1] = v188;
  v227[2] = v187;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v227, 3LL));
  -[TSKSettingGroup setSettingItems:](v186, "setSettingItems:", v15);

  -[NSMutableArray addObject:](v202, "addObject:", v186);
  objc_initWeak(&location, self);
  uint64_t v16 = TSKLocString(@"RestrictionsBypassWithDeviceUsersGroupTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v215[0] = _NSConcreteStackBlock;
  v215[1] = 3221225472LL;
  v215[2] = sub_100081B7C;
  v215[3] = &unk_100191E30;
  v215[4] = self;
  objc_copyWeak(&v217, &location);
  id v18 = v7;
  id v216 = v18;
  v196 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v17,  v185,  @"availableUsers",  v215));

  [v196 setUpdateBlock:v201];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileListFacade availableUsers](v185, "availableUsers"));
  objc_msgSend(v196, "setHidden:", objc_msgSend(v19, "count") == 0);

  -[NSMutableArray addObject:](v202, "addObject:", v196);
  uint64_t v20 = TSKLocString(@"RestrictionsAllowPurchaseAndRentalTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v195 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v21,  0LL,  v18,  @"allowsPurchaseAndRental",  0LL,  0LL));

  [v195 setAvailableValues:&off_1001AEE60];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _allowRestrictFormatter](self, "_allowRestrictFormatter"));
  [v195 setLocalizedValueFormatter:v22];

  uint64_t v23 = TSKLocString(@"RestrictionsAllowInAppPurchase");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = TSKLocString(@"RestrictionsAllowValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = TSKLocString(@"RestrictionsBlockValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v175 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v24,  0LL,  v18,  @"allowsInAppPurchase",  v26,  v28));

  v29 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v30 = TSKLocString(@"RestrictionsiTunesStoreGroupTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v194 = -[TSKSettingGroup initWithTitle:](v29, "initWithTitle:", v31);

  v226[0] = v195;
  v226[1] = v175;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v226, 2LL));
  -[TSKSettingGroup setSettingItems:](v194, "setSettingItems:", v32);

  -[TSKSettingGroup setUpdateBlock:](v194, "setUpdateBlock:", v201);
  -[NSMutableArray addObject:](v202, "addObject:", v194);
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _explicitMusicFormatter](self, "_explicitMusicFormatter"));
  uint64_t v33 = TSKLocString(@"RestrictionsContentFilterRegionTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  id v35 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v34,  0LL,  v18,  @"contentRestrictionsCountryCode",  objc_opt_class(&OBJC_CLASS___TVSettingsRestrictionsRegionViewController));
  v193 = (void *)objc_claimAutoreleasedReturnValue(v35);

  v213[0] = _NSConcreteStackBlock;
  v213[1] = 3221225472LL;
  v213[2] = sub_100081E14;
  v213[3] = &unk_10018E608;
  id v36 = v18;
  id v214 = v36;
  [v193 setUpdateBlock:v213];
  v37 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController _contentFilterRegionFormatter]( self,  "_contentFilterRegionFormatter"));
  [v193 setLocalizedValueFormatter:v37];

  uint64_t v38 = TSKLocString(@"RestrictionsAllowExplicitMusicAndPodcastsTitle");
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v192 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v39,  0LL,  v36,  @"allowsExplicitContent",  0LL,  0LL));

  [v192 setAvailableValues:&off_1001AEE78];
  [v192 setLocalizedValueFormatter:v174];
  uint64_t v40 = TSKLocString(@"RestrictionsAllowMusicVideos");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v184 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v41,  0LL,  v36,  @"allowsMusicVideos",  0LL,  0LL));

  v42 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController _allowRestrictBoolFormatter]( self,  "_allowRestrictBoolFormatter"));
  [v184 setLocalizedValueFormatter:v42];

  uint64_t v43 = TSKLocString(@"RestrictionsAllowMusicSocialFeatures");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  uint64_t v45 = TSKLocString(@"RestrictionsShow_MusicSocial");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  uint64_t v47 = TSKLocString(@"RestrictionsHide_MusicSocial");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v183 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v44,  0LL,  v36,  @"allowsMusicSocialFeatures",  v46,  v48));

  [v183 setUpdateBlock:&stru_100191E50];
  uint64_t v49 = TSKLocString(@"RestrictionsRestrictMoviesTitle");
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v200 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v50,  0LL,  v36,  @"movieRestriction",  0LL));

  uint64_t v51 = TSKLocString(@"SettingsRestrictionMoviesDescription");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  [v200 setDetailedLocalizedTitle:v52];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _ratingFormatter](self, "_ratingFormatter"));
  [v200 setLocalizedValueFormatter:v53];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _ratingLongFormatter](self, "_ratingLongFormatter"));
  [v200 setDetailedLocalizedValueFormatter:v54];

  v211[0] = _NSConcreteStackBlock;
  v211[1] = 3221225472LL;
  v211[2] = sub_100081EF0;
  v211[3] = &unk_10018E608;
  id v55 = v36;
  id v212 = v55;
  [v200 setUpdateBlock:v211];
  uint64_t v56 = TSKLocString(@"RestrictionsRestrictTVShowsTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v199 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v57,  0LL,  v55,  @"tvShowRestriction",  0LL));

  uint64_t v58 = TSKLocString(@"SettingsRestrictionTVShowsDescription");
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  [v199 setDetailedLocalizedTitle:v59];

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _ratingFormatter](self, "_ratingFormatter"));
  [v199 setLocalizedValueFormatter:v60];

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _ratingLongFormatter](self, "_ratingLongFormatter"));
  [v199 setDetailedLocalizedValueFormatter:v61];

  v209[0] = _NSConcreteStackBlock;
  v209[1] = 3221225472LL;
  v209[2] = sub_100081F88;
  v209[3] = &unk_10018E608;
  id v62 = v55;
  id v210 = v62;
  [v199 setUpdateBlock:v209];
  uint64_t v63 = TSKLocString(@"RestrictionsRestrictAppsTitle");
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
  v198 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v64,  0LL,  v62,  @"appRestriction",  0LL));

  uint64_t v65 = TSKLocString(@"SettingsRestrictionAppsDescription");
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  [v198 setDetailedLocalizedTitle:v66];

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _ratingFormatter](self, "_ratingFormatter"));
  [v198 setLocalizedValueFormatter:v67];

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _ratingLongFormatter](self, "_ratingLongFormatter"));
  [v198 setDetailedLocalizedValueFormatter:v68];

  v207[0] = _NSConcreteStackBlock;
  v207[1] = 3221225472LL;
  v207[2] = sub_100082020;
  v207[3] = &unk_10018E608;
  id v69 = v62;
  id v208 = v69;
  [v198 setUpdateBlock:v207];
  uint64_t v70 = TSKLocString(@"RestrictionsSiriExplicitLanguageTitle");
  v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
  uint64_t v72 = TSKLocString(@"RestrictionsShow_SiriExplicit");
  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  uint64_t v74 = TSKLocString(@"RestrictionsHide_SiriExplicit");
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
  v182 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v71,  0LL,  v69,  @"allowsSiriExplicitLanguage",  v73,  v75));

  [v182 setUpdateBlock:&stru_100191E70];
  uint64_t v76 = TSKLocString(@"RestrictionsRestrictBooksTitle");
  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
  uint64_t v78 = TSKLocString(@"RestrictionsRestrictBooksDescription");
  v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
  v197 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v77,  v79,  v69,  @"allowsBookstoreErotica",  0LL,  0LL));

  [v197 setAvailableValues:&off_1001AEE90];
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _booksRatingFormatter](self, "_booksRatingFormatter"));
  [v197 setLocalizedValueFormatter:v80];

  [v197 setUpdateBlock:&stru_100191E90];
  v81 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v82 = TSKLocString(@"RestrictionsAllowedContentGroupTitle");
  v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
  v191 = -[TSKSettingGroup initWithTitle:](v81, "initWithTitle:", v83);

  v225[0] = v193;
  v225[1] = v192;
  v225[2] = v184;
  v225[3] = v183;
  v225[4] = v200;
  v225[5] = v199;
  v225[6] = v198;
  v225[7] = v197;
  v225[8] = v182;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v225, 9LL));
  -[TSKSettingGroup setSettingItems:](v191, "setSettingItems:", v84);

  -[TSKSettingGroup setUpdateBlock:](v191, "setUpdateBlock:", v201);
  -[NSMutableArray addObject:](v202, "addObject:", v191);
  uint64_t v85 = TSKLocString(@"RestrictionsAllowMultiplayerGamesNone");
  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
  v224[0] = v86;
  uint64_t v87 = TSKLocString(@"RestrictionsAllowMultiplayerGamesFriendsOnly");
  v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
  v224[1] = v88;
  uint64_t v89 = TSKLocString(@"RestrictionsAllowMultiplayerGamesEveryone");
  v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
  v224[2] = v90;
  v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v224, 3LL));

  uint64_t v91 = TSKLocString(@"RestrictionsAllowMultiplayerGamingTitle");
  v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
  v181 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v92,  0LL,  v69,  @"gameCenterAllowedOtherPlayerTypes",  &off_1001AEEA8));

  v93 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEEA8,  v173);
  [v181 setLocalizedValueFormatter:v93];

  uint64_t v94 = TSKLocString(@"RestrictionsAllowNearbyMultiplayerGamingTitle");
  v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
  v180 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v95,  0LL,  v69,  @"allowsGameCenterNearbyMultiplayer",  0LL,  0LL));

  v96 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController _allowRestrictBoolFormatter]( self,  "_allowRestrictBoolFormatter"));
  [v180 setLocalizedValueFormatter:v96];

  uint64_t v97 = TSKLocString(@"RestrictionsAllowGameCenterPrivateMessagingTitle");
  v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
  v179 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v98,  0LL,  v69,  @"allowsGameCenterPrivateMessaging",  0LL,  0LL));

  v99 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController _allowRestrictBoolFormatter]( self,  "_allowRestrictBoolFormatter"));
  [v179 setLocalizedValueFormatter:v99];

  uint64_t v100 = TSKLocString(@"RestrictionsAllowGamingProfilePrivacyChangesTitle");
  v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
  v178 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v101,  0LL,  v69,  @"allowsGameCenterProfilePrivacyChanges",  0LL,  0LL));

  v102 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController _allowRestrictBoolFormatter]( self,  "_allowRestrictBoolFormatter"));
  [v178 setLocalizedValueFormatter:v102];

  uint64_t v103 = TSKLocString(@"RestrictionsAllowGamingProfileChangesTitle");
  v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
  v177 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v104,  0LL,  v69,  @"allowsGameCenterProfileChanges",  0LL,  0LL));

  v105 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController _allowRestrictBoolFormatter]( self,  "_allowRestrictBoolFormatter"));
  [v177 setLocalizedValueFormatter:v105];

  uint64_t v106 = TSKLocString(@"RestrictionsAllowReplayKit");
  v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
  uint64_t v108 = TSKLocString(@"SettingsYES");
  v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
  uint64_t v110 = TSKLocString(@"SettingsNO");
  v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
  v172 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v107,  0LL,  v69,  @"allowsScreenRecording",  v109,  v111));

  uint64_t v112 = TSKLocString(@"RestrictionsAllowGameCenterFriendsSharingTitle");
  v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
  uint64_t v114 = TSKLocString(@"RestrictionsAllowGameCenterFriendsSharingDescription");
  v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
  v176 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v113,  v115,  v69,  @"allowsGameCenterFriendSharing",  0LL,  0LL));

  v116 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController _allowRestrictBoolFormatter]( self,  "_allowRestrictBoolFormatter"));
  [v176 setLocalizedValueFormatter:v116];

  v117 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v118 = TSKLocString(@"RestrictionsGameCenterGroupTitle");
  v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
  v190 = -[TSKSettingGroup initWithTitle:](v117, "initWithTitle:", v119);

  v223[0] = v181;
  v223[1] = v180;
  v223[2] = v179;
  v223[3] = v178;
  v223[4] = v177;
  v223[5] = v172;
  v223[6] = v176;
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v223, 7LL));
  -[TSKSettingGroup setSettingItems:](v190, "setSettingItems:", v120);

  v205[0] = _NSConcreteStackBlock;
  v205[1] = 3221225472LL;
  v205[2] = sub_100082160;
  v205[3] = &unk_10018E608;
  id v121 = v69;
  id v206 = v121;
  -[TSKSettingGroup setUpdateBlock:](v190, "setUpdateBlock:", v205);
  -[NSMutableArray addObject:](v202, "addObject:", v190);
  uint64_t v122 = TSKLocString(@"RestrictionsAirPlaySettingsTitle");
  v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
  v124 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v123,  0LL,  v121,  @"allowsAirPlaySettingsUI",  0LL,  0LL));

  v125 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _allowRestrictFormatter](self, "_allowRestrictFormatter"));
  [v124 setLocalizedValueFormatter:v125];

  [v124 setAvailableValues:&off_1001AEEC0];
  uint64_t v126 = TSKLocString(@"RestrictionsConferenceRoomDisplayTitle");
  v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
  uint64_t v128 = TSKLocString(@"SettingsYES");
  v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
  uint64_t v130 = TSKLocString(@"SettingsNO");
  v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
  v132 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v127,  0LL,  v121,  @"allowsConferenceRoomDisplaySettingsUI",  v129,  v131));

  v133 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRestrictionsViewController _allowRestrictFormatter](self, "_allowRestrictFormatter"));
  [v132 setLocalizedValueFormatter:v133];

  [v132 setAvailableValues:&off_1001AEED8];
  uint64_t v134 = TSKLocString(@"RestrictionsAllowLocationServicesChangesTitle");
  v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
  uint64_t v136 = TSKLocString(@"RestrictionsAllowValue");
  v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
  uint64_t v138 = TSKLocString(@"RestrictionsRestrictValue");
  v139 = (void *)objc_claimAutoreleasedReturnValue(v138);
  v171 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v135,  0LL,  v121,  @"allowsLocationServicesUI",  v137,  v139));

  uint64_t v140 = TSKLocString(@"BackgroundAppRefreshTitle");
  v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
  uint64_t v142 = TSKLocString(@"RestrictionsAllowValue");
  v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
  uint64_t v144 = TSKLocString(@"RestrictionsRestrictValue");
  v145 = (void *)objc_claimAutoreleasedReturnValue(v144);
  v146 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v141,  0LL,  v121,  @"allowsBackgroundAppRefreshModification",  v143,  v145));

  uint64_t v147 = TSKLocString(@"RestrictionsAllowVideoSubscriberAccountChangesTitle");
  v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
  uint64_t v149 = TSKLocString(@"RestrictionsAllowValue");
  v150 = (void *)objc_claimAutoreleasedReturnValue(v149);
  uint64_t v151 = TSKLocString(@"RestrictionsRestrictValue");
  v152 = (void *)objc_claimAutoreleasedReturnValue(v151);
  v153 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v148,  0LL,  v121,  @"allowsVideoSubscriberAccountChanges",  v150,  v152));

  v154 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v155 = TSKLocString(@"RestrictionsAllowChangesGroupTitle");
  v156 = (void *)objc_claimAutoreleasedReturnValue(v155);
  v157 = -[TSKSettingGroup initWithTitle:](v154, "initWithTitle:", v156);

  v222[0] = v124;
  v222[1] = v132;
  v222[2] = v171;
  v222[3] = v146;
  v222[4] = v153;
  v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v222, 5LL));
  -[TSKSettingGroup setSettingItems:](v157, "setSettingItems:", v158);

  -[TSKSettingGroup setUpdateBlock:](v157, "setUpdateBlock:", v201);
  -[NSMutableArray addObject:](v202, "addObject:", v157);
  uint64_t v159 = TSKLocString(@"RestrictionsAllowRemoteAppPairingTitle");
  v160 = (void *)objc_claimAutoreleasedReturnValue(v159);
  uint64_t v161 = TSKLocString(@"RestrictionsAllowValue");
  v162 = (void *)objc_claimAutoreleasedReturnValue(v161);
  uint64_t v163 = TSKLocString(@"RestrictionsRestrictValue");
  v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
  v165 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v160,  0LL,  v121,  @"allowsRemoteAppPairing",  v162,  v164));

  v203[0] = _NSConcreteStackBlock;
  v203[1] = 3221225472LL;
  v203[2] = sub_1000821BC;
  v203[3] = &unk_10018E608;
  id v166 = v121;
  id v204 = v166;
  [v165 setUpdateBlock:v203];
  v167 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v221 = v165;
  v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v221, 1LL));
  -[TSKSettingGroup setSettingItems:](v167, "setSettingItems:", v168);

  -[TSKSettingGroup setUpdateBlock:](v167, "setUpdateBlock:", v201);
  -[NSMutableArray addObject:](v202, "addObject:", v167);
  id v169 = -[NSMutableArray copy](v202, "copy");

  objc_destroyWeak(&v217);
  objc_destroyWeak(&location);

  return v169;
}

- (void)_toggleRestrictions:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance",  a3));
  unsigned int v5 = [v4 areRestrictionsEnabled];

  if (v5) {
    -[TVSettingsRestrictionsViewController _disableRestrictions](self, "_disableRestrictions");
  }
  else {
    -[TVSettingsRestrictionsViewController _enableRestrictions](self, "_enableRestrictions");
  }
}

- (id)_explicitMusicFormatter
{
  uint64_t v2 = TSKLocString(@"RestrictionsExplicitValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[0] = v3;
  uint64_t v4 = TSKLocString(@"RestrictionsCleanValue");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  id v7 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEEF0,  v6);
  return v7;
}

- (id)_booksRatingFormatter
{
  uint64_t v2 = TSKLocString(@"SettingsRestrictionRatingBooksAny");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[0] = v3;
  uint64_t v4 = TSKLocString(@"SettingsRestrictionRatingBooksRestricted");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  id v7 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEF08,  v6);
  return v7;
}

- (id)_allowRestrictFormatter
{
  uint64_t v2 = TSKLocString(@"RestrictionsAllowValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v12 = v3;
  uint64_t v4 = TSKLocString(@"RestrictionsBlockValue");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v13 = v5;
  uint64_t v6 = TSKLocString(@"RestrictionsRestrictValue");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  uint64_t v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AEF20, v8, v12, v13);

  return v10;
}

- (id)_allowRestrictBoolFormatter
{
  uint64_t v2 = TSKLocString(@"RestrictionsAllowValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = TSKLocString(@"RestrictionsBlockValue");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKBoolFormatter formatterWithOnTitle:offTitle:]( &OBJC_CLASS___TSKBoolFormatter,  "formatterWithOnTitle:offTitle:",  v3,  v5));

  return v6;
}

- (id)_yesNoFormatter
{
  uint64_t v2 = TSKLocString(@"SettingsYES");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v12 = v3;
  uint64_t v4 = TSKLocString(@"RestrictionsRestrictValue");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v13 = v5;
  uint64_t v6 = TSKLocString(@"SettingsNO");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  uint64_t v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AEF38, v8, v12, v13);

  return v10;
}

- (id)_contentFilterRegionFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100191EB0];
}

- (id)_ratingFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100191ED0];
}

- (id)_ratingLongFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100191EF0];
}

- (void)_enableRestrictions
{
  v3 = objc_alloc(&OBJC_CLASS___TVSettingsRestrictionsSetPasscodeViewController);
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  uint64_t v8 = sub_10008288C;
  v9 = &unk_100191F18;
  objc_copyWeak(&v10, &location);
  uint64_t v4 = -[TVSettingsRestrictionsSetPasscodeViewController initWithTitle:prompt:completion:]( v3,  "initWithTitle:prompt:completion:",  0LL,  0LL,  &v6);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController navigationController]( self,  "navigationController",  v6,  v7,  v8,  v9));
  [v5 pushViewController:v4 animated:1];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_disableRestrictions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  objc_initWeak(&location, self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionService sharedInstance](&OBJC_CLASS___PBSRestrictionService, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100082A0C;
  v7[3] = &unk_10018FC18;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  id v6 = [v4 validateRestrictionForSetting:5 allowInteraction:1 withCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_changePasscode:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(&OBJC_CLASS___TVSUIRestrictionsPasscodeEntryViewController);
  uint64_t v6 = TSKLocString(@"RestrictionsPasscodeChangeOldTitle");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = TSKLocString(@"RestrictionsPasscodeChangeOldPrompt");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100082C18;
  v15 = &unk_100191F68;
  objc_copyWeak(&v16, &location);
  id v10 = [v5 initWithTitle:v7 prompt:v9 completion:&v12];

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsRestrictionsViewController navigationController]( self,  "navigationController",  v12,  v13,  v14,  v15));
  [v11 pushViewController:v10 animated:1];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleSetPasscodeResult:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
    [v5 enableRestrictionsWithPasscode:v4];

    AnalyticsSendEvent(@"com.apple.appletv.restrictions.enable", 0LL);
  }

  -[TVSettingsRestrictionsViewController _updateGuardedState](self, "_updateGuardedState");
}

- (void)_updateGuardedState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  id v4 = [v3 areRestrictionsEnabled];

  -[TVSettingsRestrictionsViewController tvsui_setGuardedByPIN:](self, "tvsui_setGuardedByPIN:", v4);
}

- (void)_resetRestrictions:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance",  a3));
  [v3 resetRestrictions];
}

- (void)_toggleBypassRestrictionsItem:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSRestrictionsDataProvider sharedInstance]( &OBJC_CLASS___TVCSRestrictionsDataProvider,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  uint64_t v5 = [v3 allowsRestrictionsBypassUsingCompanionDeviceForUserWithIdentifier:v4] ^ 1;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v3 setAllowsRestrictionsBypassUsingCompanionDevice:v5 forUserWithIdentifier:v6];
}

@end