@interface TVSettingsVideoSubscriberFacade
+ (id)keyPathsForValuesAffectingCurrentAccountUsername;
+ (id)keyPathsForValuesAffectingCurrentIdentityProviderAppStoreRoomURL;
+ (id)keyPathsForValuesAffectingCurrentIdentityProviderDisplayName;
+ (id)keyPathsForValuesAffectingCurrentIdentityProviderDisplayNameForHash;
+ (id)sharedInstance;
- (BOOL)currentIdentityProviderIsFullySupported;
- (BOOL)hasChannelApps;
- (BOOL)hasSetTopBoxProfile;
- (BOOL)isMoreAppsEnabled;
- (BOOL)isMoreAppsHidden;
- (BOOL)isOptingOutOfSTB;
- (BOOL)isSTBOptOutEnabled;
- (BOOL)isSTBOptOutHidden;
- (BOOL)isSignInEnabled;
- (BOOL)isSignInHidden;
- (BOOL)isSignOutEnabled;
- (BOOL)isSignOutHidden;
- (BOOL)isSigningIn;
- (BOOL)isSigningOut;
- (BOOL)setTopBoxProviderAllowsOptOut;
- (BOOL)shouldShowMVPDAppInstallPromptFromViewController:(id)a3;
- (NSArray)expressionEvaluators;
- (NSDictionary)appSections;
- (NSOperationQueue)privateQueue;
- (NSString)currentAccountUsername;
- (NSString)currentIdentityProviderDisplayName;
- (NSString)currentIdentityProviderDisplayNameForHash;
- (NSString)setTopBoxIdentityProviderDisplayName;
- (NSURL)currentIdentityProviderAppStoreRoomURL;
- (TVSettingsVideoSubscriberFacade)init;
- (VSAccount)currentAccount;
- (VSAppSettingsFacade)appSettingsFacade;
- (VSBackgroundTask)optOutBackgroundTask;
- (VSIdentityProvider)currentIdentityProvider;
- (VSIdentityProvider)stbIdentityProvider;
- (VSIdentityProviderAvailabilityInfoCenter)availabilityInfoCenter;
- (VSIdentityProviderFetchOperation)identityProviderFetchOperation;
- (VSIdentityProviderRequestManager)requestManager;
- (VSPersistentStorage)storage;
- (VSPreferences)preferences;
- (VSRemoteNotifier)developerRemoteNotifier;
- (VSRestrictionsCenter)restrictionsCenter;
- (VSSetTopBoxProfile)stbProfile;
- (VSTopShelfPurger)topShelfPurger;
- (id)_hashForExpressions:(id)a3;
- (id)_hashForExpressions:(id)a3 xorWithExpressions:(id)a4;
- (id)_signOutRequest;
- (id)accountStoreChangeObserver;
- (id)availabilityStatusChangeObserver;
- (id)optOutCompletionHandler;
- (int64_t)availabilityStatus;
- (unint64_t)moreAppsHash;
- (unint64_t)signInHash;
- (unint64_t)signOutHash;
- (unint64_t)stbOptOutHash;
- (void)_accountStoreDidChange;
- (void)_availabilityStatusDidChange;
- (void)_defineRelationship:(id)a3 forProperty:(id)a4;
- (void)_establishRelationships;
- (void)_forciblySignOut;
- (void)_loadIdentityProviderInfoForAccount:(id)a3;
- (void)_updateSetTopBoxState;
- (void)dealloc;
- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5;
- (void)presentMVPDAppInstallPromptFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAccountStoreChangeObserver:(id)a3;
- (void)setAppSections:(id)a3;
- (void)setAppSettingsFacade:(id)a3;
- (void)setAvailabilityInfoCenter:(id)a3;
- (void)setAvailabilityStatus:(int64_t)a3;
- (void)setAvailabilityStatusChangeObserver:(id)a3;
- (void)setCurrentAccount:(id)a3;
- (void)setCurrentIdentityProvider:(id)a3;
- (void)setCurrentIdentityProviderIsFullySupported:(BOOL)a3;
- (void)setDeveloperRemoteNotifier:(id)a3;
- (void)setExpressionEvaluators:(id)a3;
- (void)setHasChannelApps:(BOOL)a3;
- (void)setHasSetTopBoxProfile:(BOOL)a3;
- (void)setIdentityProviderFetchOperation:(id)a3;
- (void)setMoreAppsEnabled:(BOOL)a3;
- (void)setMoreAppsHash:(unint64_t)a3;
- (void)setMoreAppsHidden:(BOOL)a3;
- (void)setNeedsUpdateApps;
- (void)setOptOutBackgroundTask:(id)a3;
- (void)setOptOutCompletionHandler:(id)a3;
- (void)setOptingOutOfSTB:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRequestManager:(id)a3;
- (void)setRestrictionsCenter:(id)a3;
- (void)setSetTopBoxProviderAllowsOptOut:(BOOL)a3;
- (void)setSignInEnabled:(BOOL)a3;
- (void)setSignInHash:(unint64_t)a3;
- (void)setSignInHidden:(BOOL)a3;
- (void)setSignOutEnabled:(BOOL)a3;
- (void)setSignOutHash:(unint64_t)a3;
- (void)setSignOutHidden:(BOOL)a3;
- (void)setSigningIn:(BOOL)a3;
- (void)setSigningOut:(BOOL)a3;
- (void)setStbIdentityProvider:(id)a3;
- (void)setStbOptOutEnabled:(BOOL)a3;
- (void)setStbOptOutHash:(unint64_t)a3;
- (void)setStbOptOutHidden:(BOOL)a3;
- (void)setStbProfile:(id)a3;
- (void)setStorage:(id)a3;
- (void)setTopShelfPurger:(id)a3;
- (void)startOptingOutOfSetTopBoxWithCompletionHandler:(id)a3;
- (void)startSigningInWithCompletionHandler:(id)a3;
- (void)startSigningOut;
@end

@implementation TVSettingsVideoSubscriberFacade

+ (id)sharedInstance
{
  if (qword_16440 != -1) {
    dispatch_once(&qword_16440, &stru_10458);
  }
  return (id)qword_16438;
}

- (TVSettingsVideoSubscriberFacade)init
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___TVSettingsVideoSubscriberFacade;
  v3 = -[TVSettingsVideoSubscriberFacade init](&v44, "init");
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    preferences = v3->_preferences;
    v3->_preferences = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = v6;

    -[NSOperationQueue setName:](v3->_privateQueue, "setName:", @"TVSettingsVideoSubscriberFacade");
    v8 = objc_alloc_init(&OBJC_CLASS___VSPersistentStorage);
    storage = v3->_storage;
    v3->_storage = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[VSRestrictionsCenter defaultRestrictionsCenter]( &OBJC_CLASS___VSRestrictionsCenter,  "defaultRestrictionsCenter"));
    restrictionsCenter = v3->_restrictionsCenter;
    v3->_restrictionsCenter = (VSRestrictionsCenter *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[VSIdentityProviderAvailabilityInfoCenter defaultCenter]( &OBJC_CLASS___VSIdentityProviderAvailabilityInfoCenter,  "defaultCenter"));
    availabilityInfoCenter = v3->_availabilityInfoCenter;
    v3->_availabilityInfoCenter = (VSIdentityProviderAvailabilityInfoCenter *)v12;

    v14 = objc_alloc_init(&OBJC_CLASS___VSTopShelfPurger);
    topShelfPurger = v3->_topShelfPurger;
    v3->_topShelfPurger = v14;

    v16 = -[VSAppSettingsFacade initWithStorage:restrictionsCenter:]( objc_alloc(&OBJC_CLASS___VSAppSettingsFacade),  "initWithStorage:restrictionsCenter:",  v3->_storage,  v3->_restrictionsCenter);
    appSettingsFacade = v3->_appSettingsFacade;
    v3->_appSettingsFacade = v16;

    v18 = v3->_appSettingsFacade;
    uint64_t v19 = VSMainConcurrencyBindingOptions();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[VSAppSettingsFacade vs_bind:toObject:withKeyPath:options:]( v18,  "vs_bind:toObject:withKeyPath:options:",  @"identityProvider",  v3,  @"currentIdentityProvider",  v20);

    v21 = v3->_appSettingsFacade;
    uint64_t v22 = VSMainConcurrencyBindingOptions();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[TVSettingsVideoSubscriberFacade vs_bind:toObject:withKeyPath:options:]( v3,  "vs_bind:toObject:withKeyPath:options:",  @"appSections",  v21,  @"appSections",  v23);

    v24 = v3->_appSettingsFacade;
    uint64_t v25 = VSMainConcurrencyBindingOptions();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[TVSettingsVideoSubscriberFacade vs_bind:toObject:withKeyPath:options:]( v3,  "vs_bind:toObject:withKeyPath:options:",  @"hasChannelApps",  v24,  @"hasChannelApps",  v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    objc_initWeak(&location, v3);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VSPersistentStorage accountStore](v3->_storage, "accountStore"));
    uint64_t v30 = VSAccountStoreDidChangeNotification;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_2854;
    v41[3] = &unk_10480;
    objc_copyWeak(&v42, &location);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v27 addObserverForName:v30 object:v29 queue:v28 usingBlock:v41]);
    objc_storeWeak(&v3->_accountStoreChangeObserver, v31);

    -[TVSettingsVideoSubscriberFacade _accountStoreDidChange](v3, "_accountStoreDidChange");
    v32 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
    v33 = -[VSRemoteNotifier initWithNotificationName:]( v32,  "initWithNotificationName:",  VSDeveloperServiceSettingsDidChangeNotification);
    developerRemoteNotifier = v3->_developerRemoteNotifier;
    v3->_developerRemoteNotifier = v33;

    -[VSRemoteNotifier setDelegate:](v3->_developerRemoteNotifier, "setDelegate:", v3);
    -[TVSettingsVideoSubscriberFacade _updateSetTopBoxState](v3, "_updateSetTopBoxState");
    uint64_t v35 = VSIdentityProviderAvailabilityDidChangeNotification;
    v36 = v3->_availabilityInfoCenter;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_2880;
    v39[3] = &unk_10480;
    objc_copyWeak(&v40, &location);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v27 addObserverForName:v35 object:v36 queue:v28 usingBlock:v39]);
    objc_storeWeak(&v3->_availabilityStatusChangeObserver, v37);

    -[TVSettingsVideoSubscriberFacade _availabilityStatusDidChange](v3, "_availabilityStatusDidChange");
    -[TVSettingsVideoSubscriberFacade _establishRelationships](v3, "_establishRelationships");
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id WeakRetained = objc_loadWeakRetained(&self->_accountStoreChangeObserver);
  if (WeakRetained) {
    [v3 removeObserver:WeakRetained];
  }
  id v5 = objc_loadWeakRetained(&self->_availabilityStatusChangeObserver);
  if (v5) {
    [v3 removeObserver:v5];
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsVideoSubscriberFacade;
  -[TVSettingsVideoSubscriberFacade dealloc](&v6, "dealloc");
}

- (void)_defineRelationship:(id)a3 forProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade expressionEvaluators](self, "expressionEvaluators"));
  v13 = -[NSMutableArray initWithArray:](v8, "initWithArray:", v9);

  id v10 = objc_alloc_init(&OBJC_CLASS___VSExpressionEvaluator);
  [v10 setExpression:v7];

  uint64_t v11 = VSMainConcurrencyBindingOptions([v10 setObject:self]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[TVSettingsVideoSubscriberFacade vs_bind:toObject:withKeyPath:options:]( self,  "vs_bind:toObject:withKeyPath:options:",  v6,  v10,  @"value",  v12);

  -[NSMutableArray addObject:](v13, "addObject:", v10);
  -[TVSettingsVideoSubscriberFacade setExpressionEvaluators:](self, "setExpressionEvaluators:", v13);
}

- (id)_hashForExpressions:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:",  &off_11310));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v15 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", 1, (char *)objc_msgSend( v3,  "count") - 1));
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      v8 = 0LL;
      v9 = v4;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v8);
        v23[0] = v9;
        v23[1] = v17;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"leftshift:by:",  v11));

        v22[0] = v12;
        v22[1] = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
        v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"bitwiseOr:with:",  v13));

        v8 = (char *)v8 + 1;
        v9 = v4;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)_hashForExpressions:(id)a3 xorWithExpressions:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade _hashForExpressions:](self, "_hashForExpressions:", a3));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0LL;
      v13 = v7;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
        v21[0] = v13;
        v21[1] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v21,  2LL,  (void)v17));
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForFunction:arguments:]( &OBJC_CLASS___NSExpression,  "expressionForFunction:arguments:",  @"bitwiseXor:with:",  v15));

        uint64_t v12 = (char *)v12 + 1;
        v13 = v7;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v10);
  }

  return v7;
}

- (void)_establishRelationships
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != NULL",  @"currentAccount"));
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"hasChannelApps"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"restrictionsCenter.accountModificationAllowed"));
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"signingIn"));
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"signingOut"));
  id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != NULL",  @"currentIdentityProvider.appStoreRoomURL"));
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"hasSetTopBoxProfile"));
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"setTopBoxProviderAllowsOptOut"));
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == TRUE",  @"optingOutOfSTB"));
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v3));
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v49));
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v50));
  v62[0] = v47;
  v62[1] = v4;
  id v42 = (void *)v4;
  v62[2] = v41;
  uint64_t v63 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v48));
  uint64_t v6 = v63;
  v39 = (void *)v63;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 4LL));
  objc_super v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));

  v61[0] = v3;
  v61[1] = v4;
  v38 = (void *)v5;
  v61[2] = v5;
  v61[3] = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 4LL));
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));

  v60[0] = v40;
  v60[1] = v3;
  uint64_t v9 = v3;
  v37 = (void *)v3;
  v60[2] = v51;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v60, 3LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v10));

  v59[0] = v11;
  v59[1] = v5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 2LL));
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v12));

  v58[0] = v52;
  v58[1] = v46;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v13));

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:",  &__kCFBooleanTrue));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConstantValue:]( &OBJC_CLASS___NSExpression,  "expressionForConstantValue:",  &__kCFBooleanFalse));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v9,  v14,  v15));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:](self, "_defineRelationship:forProperty:");
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v44,  v14,  v15));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:](self, "_defineRelationship:forProperty:");
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v47,  v14,  v15));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:](self, "_defineRelationship:forProperty:");
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v45,  v14,  v15));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v43,  @"signOutEnabled");
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v11,  v15,  v14));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v30,  @"moreAppsHidden");
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v36,  v14,  v15));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v29,  @"moreAppsEnabled");
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v48,  v15,  v14));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:](self, "_defineRelationship:forProperty:");
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v35,  v15,  v14));
  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v33,  @"stbOptOutHidden");
  v57[0] = v34;
  v57[1] = v33;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade _hashForExpressions:](self, "_hashForExpressions:", v16));

  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v28,  @"stbOptOutHash");
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v49,  v14,  v15));
  v56[0] = v32;
  v56[1] = v31;
  v56[2] = v27;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 3LL));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade _hashForExpressions:](self, "_hashForExpressions:", v17));

  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v25,  @"signInHash");
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForKeyPath:]( &OBJC_CLASS___NSExpression,  "expressionForKeyPath:",  @"currentIdentityProviderDisplayNameForHash.hash"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForConditional:trueExpression:falseExpression:]( &OBJC_CLASS___NSExpression,  "expressionForConditional:trueExpression:falseExpression:",  v50,  v14,  v15));
  v55[0] = v26;
  v55[1] = v43;
  v55[2] = v19;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 3LL));
  v54 = v18;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVideoSubscriberFacade _hashForExpressions:xorWithExpressions:]( self,  "_hashForExpressions:xorWithExpressions:",  v20,  v21));

  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v22,  @"signOutHash");
  v53[0] = v30;
  v53[1] = v29;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 2LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade _hashForExpressions:](self, "_hashForExpressions:", v23));

  -[TVSettingsVideoSubscriberFacade _defineRelationship:forProperty:]( self,  "_defineRelationship:forProperty:",  v24,  @"moreAppsHash");
}

- (void)_accountStoreDidChange
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade storage](self, "storage"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountStore]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_3628;
  v6[3] = &unk_10520;
  v6[4] = self;
  [v4 fetchAccountsWithCompletionHandler:v6];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade topShelfPurger](self, "topShelfPurger"));
  [v5 purge];
}

- (void)_availabilityStatusDidChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade availabilityInfoCenter](self, "availabilityInfoCenter"));
  -[TVSettingsVideoSubscriberFacade setAvailabilityStatus:](self, "setAvailabilityStatus:", [v3 status]);
}

- (void)setNeedsUpdateApps
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade appSettingsFacade](self, "appSettingsFacade"));
  [v2 setNeedsUpdateApps];
}

- (void)_updateSetTopBoxState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_38E4;
  v4[3] = &unk_10598;
  v4[4] = self;
  [v3 fetchSetTopBoxProfileWithCompletion:v4];
}

- (void)_loadIdentityProviderInfoForAccount:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identityProviderID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 forceUnwrapObject]);

  uint64_t v6 = -[VSIdentityProviderFetchOperation initWithIdentityProviderID:]( objc_alloc(&OBJC_CLASS___VSIdentityProviderFetchOperation),  "initWithIdentityProviderID:",  v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVideoSubscriberFacade identityProviderFetchOperation]( self,  "identityProviderFetchOperation"));
  [v7 cancel];

  -[TVSettingsVideoSubscriberFacade setIdentityProviderFetchOperation:](self, "setIdentityProviderFetchOperation:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade privateQueue](self, "privateQueue"));
  [v8 addOperation:v6];

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_3DFC;
  v15 = &unk_104F8;
  v16 = self;
  __int128 v17 = v6;
  uint64_t v9 = v6;
  uint64_t v10 = VSMainThreadOperationWithBlock(&v12);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v11, "addDependency:", v9, v12, v13, v14, v15, v16);
  VSEnqueueCompletionOperation(v11);
}

- (id)_signOutRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade currentAccount](self, "currentAccount"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSOptional optionalWithObject:](&OBJC_CLASS___VSOptional, "optionalWithObject:", v3));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 forceUnwrapObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade storage](self, "storage"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderRequest deleteAccountRequestWithAccount:storage:]( &OBJC_CLASS___VSIdentityProviderRequest,  "deleteAccountRequestWithAccount:storage:",  v5,  v6));

  return v7;
}

- (void)startSigningInWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The completionHandler parameter must not be nil.");
  }
  if (!-[TVSettingsVideoSubscriberFacade isSignInHidden](self, "isSignInHidden")
    && -[TVSettingsVideoSubscriberFacade isSignInEnabled](self, "isSignInEnabled")
    && !-[TVSettingsVideoSubscriberFacade isSigningIn](self, "isSigningIn"))
  {
    -[TVSettingsVideoSubscriberFacade setSigningIn:](self, "setSigningIn:", 1LL);
    id v5 = objc_alloc_init(&OBJC_CLASS___VSStorefrontCodeLoadOperation);
    id v6 = objc_alloc_init(&OBJC_CLASS___VSAMSStorefrontFetchAllOperation);
    id v7 = objc_alloc_init(&OBJC_CLASS___VSIdentityProviderFetchAllOperation);
    [v6 addDependency:v5];
    [v7 addDependency:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade privateQueue](self, "privateQueue"));
    [v8 addOperation:v5];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade privateQueue](self, "privateQueue"));
    [v9 addOperation:v7];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade privateQueue](self, "privateQueue"));
    [v10 addOperation:v6];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_41F4;
    v16[3] = &unk_106C8;
    v16[4] = self;
    id v17 = v5;
    id v19 = v7;
    id v20 = v4;
    id v18 = v6;
    id v11 = v7;
    id v12 = v6;
    id v13 = v5;
    uint64_t v14 = VSMainThreadOperationWithBlock(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v15 addDependency:v11];
    VSEnqueueCompletionOperation(v15);
  }
}

- (void)startOptingOutOfSetTopBoxWithCompletionHandler:(id)a3
{
  id v13 = a3;
  if (-[TVSettingsVideoSubscriberFacade setTopBoxProviderAllowsOptOut](self, "setTopBoxProviderAllowsOptOut"))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade stbIdentityProvider](self, "stbIdentityProvider"));
    if (v4)
    {
      id v5 = (void *)v4;
      unsigned __int8 v6 = -[TVSettingsVideoSubscriberFacade isOptingOutOfSTB](self, "isOptingOutOfSTB");

      if ((v6 & 1) == 0)
      {
        id v7 = objc_alloc_init(&OBJC_CLASS___VSBackgroundTask);
        -[VSBackgroundTask setName:](v7, "setName:", @"STB Opt Out");
        -[VSBackgroundTask begin](v7, "begin");
        -[TVSettingsVideoSubscriberFacade setOptOutBackgroundTask:](self, "setOptOutBackgroundTask:", v7);
        -[TVSettingsVideoSubscriberFacade setOptingOutOfSTB:](self, "setOptingOutOfSTB:", 1LL);
        -[TVSettingsVideoSubscriberFacade setOptOutCompletionHandler:](self, "setOptOutCompletionHandler:", v13);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade stbIdentityProvider](self, "stbIdentityProvider"));

        if (!v8) {
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [self stbIdentityProvider] parameter must not be nil.");
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade stbIdentityProvider](self, "stbIdentityProvider"));
        uint64_t v10 = -[VSIdentityProviderRequestManager initWithIdentityProvider:]( objc_alloc(&OBJC_CLASS___VSIdentityProviderRequestManager),  "initWithIdentityProvider:",  v9);
        -[VSIdentityProviderRequestManager setDelegate:](v10, "setDelegate:", self);
        -[TVSettingsVideoSubscriberFacade setRequestManager:](self, "setRequestManager:", v10);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade storage](self, "storage"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[VSIdentityProviderRequest STBOptOutRequestWithStorage:]( &OBJC_CLASS___VSIdentityProviderRequest,  "STBOptOutRequestWithStorage:",  v11));

        -[VSIdentityProviderRequestManager enqueueRequest:](v10, "enqueueRequest:", v12);
      }
    }
  }
}

- (void)_forciblySignOut
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade storage](self, "storage"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 channelsCenter]);
  [v4 _removeSavedAccountChannelsWithCompletionHandler:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 privacyFacade]);
  [v5 reset];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade currentAccount](self, "currentAccount"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VSOptional optionalWithObject:](&OBJC_CLASS___VSOptional, "optionalWithObject:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 accountStore]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 forceUnwrapObject]);
  id v11 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v8 removeAccounts:v10 withCompletionHandler:0];

  -[TVSettingsVideoSubscriberFacade setSigningOut:](self, "setSigningOut:", 0LL);
}

- (void)startSigningOut
{
  if (!-[TVSettingsVideoSubscriberFacade isSignOutHidden](self, "isSignOutHidden")
    && -[TVSettingsVideoSubscriberFacade isSignOutEnabled](self, "isSignOutEnabled")
    && !-[TVSettingsVideoSubscriberFacade isSigningOut](self, "isSigningOut"))
  {
    -[TVSettingsVideoSubscriberFacade setSigningOut:](self, "setSigningOut:", 1LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade currentIdentityProvider](self, "currentIdentityProvider"));
    id v9 = v3;
    if (v3)
    {
      if ([v3 isFullySupportedForRequestsExpectingAuthenticationSchemes:0])
      {
        id v4 = v9;
        id v5 = -[VSIdentityProviderRequestManager initWithIdentityProvider:]( objc_alloc(&OBJC_CLASS___VSIdentityProviderRequestManager),  "initWithIdentityProvider:",  v4);

        -[VSIdentityProviderRequestManager setDelegate:](v5, "setDelegate:", self);
        -[TVSettingsVideoSubscriberFacade setRequestManager:](self, "setRequestManager:", v5);
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade _signOutRequest](self, "_signOutRequest"));
        -[VSIdentityProviderRequestManager enqueueRequest:](v5, "enqueueRequest:", v6);

LABEL_11:
        return;
      }

      if (([v9 isDeveloper] & 1) == 0)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 providerID]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 forceUnwrapObject]);
        +[VSMetricsManagerObjC recordSignOutEventWithProviderIdentifier:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordSignOutEventWithProviderIdentifier:",  v8);
      }
    }

    -[TVSettingsVideoSubscriberFacade _forciblySignOut](self, "_forciblySignOut");
    goto LABEL_11;
  }

+ (id)keyPathsForValuesAffectingCurrentAccountUsername
{
  if (qword_16450 != -1) {
    dispatch_once(&qword_16450, &stru_106E8);
  }
  return (id)qword_16448;
}

- (NSString)currentAccountUsername
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade currentAccount](self, "currentAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 username]);

  return (NSString *)v3;
}

+ (id)keyPathsForValuesAffectingCurrentIdentityProviderDisplayName
{
  if (qword_16460 != -1) {
    dispatch_once(&qword_16460, &stru_10708);
  }
  return (id)qword_16458;
}

- (NSString)currentIdentityProviderDisplayName
{
  if ((char *)-[TVSettingsVideoSubscriberFacade availabilityStatus](self, "availabilityStatus") == (char *)&dword_0 + 1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade currentIdentityProvider](self, "currentIdentityProvider"));
    id v4 = v3;
    if (v3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
      unsigned __int8 v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 forceUnwrapObject]);
    }

    else
    {
      unsigned __int8 v6 = &stru_10E08;
    }
  }

  else
  {
    unsigned __int8 v6 = 0LL;
  }

  return (NSString *)v6;
}

- (NSString)setTopBoxIdentityProviderDisplayName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade stbIdentityProvider](self, "stbIdentityProvider"));
  id v3 = v2;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 displayName]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 forceUnwrapObject]);
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingCurrentIdentityProviderDisplayNameForHash
{
  if (qword_16470 != -1) {
    dispatch_once(&qword_16470, &stru_10728);
  }
  return (id)qword_16468;
}

- (NSString)currentIdentityProviderDisplayNameForHash
{
  id v2 = (__CFString *)objc_claimAutoreleasedReturnValue( -[TVSettingsVideoSubscriberFacade currentIdentityProviderDisplayName]( self,  "currentIdentityProviderDisplayName"));
  if (!v2) {
    id v2 = &stru_10E08;
  }
  return (NSString *)v2;
}

+ (id)keyPathsForValuesAffectingCurrentIdentityProviderAppStoreRoomURL
{
  if (qword_16480 != -1) {
    dispatch_once(&qword_16480, &stru_10748);
  }
  return (id)qword_16478;
}

- (NSURL)currentIdentityProviderAppStoreRoomURL
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade currentIdentityProvider](self, "currentIdentityProvider"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appStoreRoomURL]);

  return (NSURL *)v3;
}

- (BOOL)shouldShowMVPDAppInstallPromptFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade appSettingsFacade](self, "appSettingsFacade"));
  unsigned __int8 v6 = [v5 shouldShowMVPDAppInstallPromptFromViewController:v4];

  return v6;
}

- (void)presentMVPDAppInstallPromptFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsVideoSubscriberFacade appSettingsFacade](self, "appSettingsFacade"));
  [v10 presentMVPDAppInstallPromptFromViewController:v9 animated:v5 completion:v8];
}

- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  -[TVSettingsVideoSubscriberFacade setRequestManager:](self, "setRequestManager:", 0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_50D0;
  v13[3] = &unk_10770;
  id v14 = v7;
  v15 = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_52FC;
  v10[3] = &unk_10798;
  id v11 = v14;
  id v12 = self;
  id v9 = v14;
  [v8 unwrapObject:v13 error:v10];
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
}

- (VSAccount)currentAccount
{
  return self->_currentAccount;
}

- (void)setCurrentAccount:(id)a3
{
}

- (BOOL)currentIdentityProviderIsFullySupported
{
  return self->_currentIdentityProviderIsFullySupported;
}

- (void)setCurrentIdentityProviderIsFullySupported:(BOOL)a3
{
  self->_currentIdentityProviderIsFullySupported = a3;
}

- (unint64_t)signInHash
{
  return self->_signInHash;
}

- (void)setSignInHash:(unint64_t)a3
{
  self->_signInHash = a3;
}

- (BOOL)isSignInHidden
{
  return self->_signInHidden;
}

- (void)setSignInHidden:(BOOL)a3
{
  self->_signInHidden = a3;
}

- (BOOL)isSignInEnabled
{
  return self->_signInEnabled;
}

- (void)setSignInEnabled:(BOOL)a3
{
  self->_signInEnabled = a3;
}

- (BOOL)isSigningIn
{
  return self->_signingIn;
}

- (void)setSigningIn:(BOOL)a3
{
  self->_signingIn = a3;
}

- (unint64_t)signOutHash
{
  return self->_signOutHash;
}

- (void)setSignOutHash:(unint64_t)a3
{
  self->_signOutHash = a3;
}

- (BOOL)isSignOutHidden
{
  return self->_signOutHidden;
}

- (void)setSignOutHidden:(BOOL)a3
{
  self->_signOutHidden = a3;
}

- (BOOL)isSignOutEnabled
{
  return self->_signOutEnabled;
}

- (void)setSignOutEnabled:(BOOL)a3
{
  self->_signOutEnabled = a3;
}

- (BOOL)isSigningOut
{
  return self->_signingOut;
}

- (void)setSigningOut:(BOOL)a3
{
  self->_signingOut = a3;
}

- (unint64_t)moreAppsHash
{
  return self->_moreAppsHash;
}

- (void)setMoreAppsHash:(unint64_t)a3
{
  self->_moreAppsHash = a3;
}

- (BOOL)isMoreAppsHidden
{
  return self->_moreAppsHidden;
}

- (void)setMoreAppsHidden:(BOOL)a3
{
  self->_moreAppsHidden = a3;
}

- (BOOL)isMoreAppsEnabled
{
  return self->_moreAppsEnabled;
}

- (void)setMoreAppsEnabled:(BOOL)a3
{
  self->_moreAppsEnabled = a3;
}

- (unint64_t)stbOptOutHash
{
  return self->_stbOptOutHash;
}

- (void)setStbOptOutHash:(unint64_t)a3
{
  self->_stbOptOutHash = a3;
}

- (BOOL)isSTBOptOutHidden
{
  return self->_stbOptOutHidden;
}

- (void)setStbOptOutHidden:(BOOL)a3
{
  self->_stbOptOutHidden = a3;
}

- (BOOL)isSTBOptOutEnabled
{
  return self->_stbOptOutEnabled;
}

- (void)setStbOptOutEnabled:(BOOL)a3
{
  self->_stbOptOutEnabled = a3;
}

- (BOOL)isOptingOutOfSTB
{
  return self->_optingOutOfSTB;
}

- (void)setOptingOutOfSTB:(BOOL)a3
{
  self->_optingOutOfSTB = a3;
}

- (NSDictionary)appSections
{
  return self->_appSections;
}

- (void)setAppSections:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (VSIdentityProvider)currentIdentityProvider
{
  return self->_currentIdentityProvider;
}

- (void)setCurrentIdentityProvider:(id)a3
{
}

- (VSAppSettingsFacade)appSettingsFacade
{
  return self->_appSettingsFacade;
}

- (void)setAppSettingsFacade:(id)a3
{
}

- (VSIdentityProviderAvailabilityInfoCenter)availabilityInfoCenter
{
  return self->_availabilityInfoCenter;
}

- (void)setAvailabilityInfoCenter:(id)a3
{
}

- (int64_t)availabilityStatus
{
  return self->_availabilityStatus;
}

- (void)setAvailabilityStatus:(int64_t)a3
{
  self->_availabilityStatus = a3;
}

- (BOOL)hasSetTopBoxProfile
{
  return self->_hasSetTopBoxProfile;
}

- (void)setHasSetTopBoxProfile:(BOOL)a3
{
  self->_hasSetTopBoxProfile = a3;
}

- (BOOL)setTopBoxProviderAllowsOptOut
{
  return self->_setTopBoxProviderAllowsOptOut;
}

- (void)setSetTopBoxProviderAllowsOptOut:(BOOL)a3
{
  self->_setTopBoxProviderAllowsOptOut = a3;
}

- (BOOL)hasChannelApps
{
  return self->_hasChannelApps;
}

- (void)setHasChannelApps:(BOOL)a3
{
  self->_hasChannelApps = a3;
}

- (id)optOutCompletionHandler
{
  return self->_optOutCompletionHandler;
}

- (void)setOptOutCompletionHandler:(id)a3
{
}

- (NSArray)expressionEvaluators
{
  return self->_expressionEvaluators;
}

- (void)setExpressionEvaluators:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSIdentityProviderFetchOperation)identityProviderFetchOperation
{
  return self->_identityProviderFetchOperation;
}

- (void)setIdentityProviderFetchOperation:(id)a3
{
}

- (id)accountStoreChangeObserver
{
  return objc_loadWeakRetained(&self->_accountStoreChangeObserver);
}

- (void)setAccountStoreChangeObserver:(id)a3
{
}

- (id)availabilityStatusChangeObserver
{
  return objc_loadWeakRetained(&self->_availabilityStatusChangeObserver);
}

- (void)setAvailabilityStatusChangeObserver:(id)a3
{
}

- (VSIdentityProviderRequestManager)requestManager
{
  return self->_requestManager;
}

- (void)setRequestManager:(id)a3
{
}

- (VSSetTopBoxProfile)stbProfile
{
  return self->_stbProfile;
}

- (void)setStbProfile:(id)a3
{
}

- (VSIdentityProvider)stbIdentityProvider
{
  return self->_stbIdentityProvider;
}

- (void)setStbIdentityProvider:(id)a3
{
}

- (VSBackgroundTask)optOutBackgroundTask
{
  return self->_optOutBackgroundTask;
}

- (void)setOptOutBackgroundTask:(id)a3
{
}

- (VSRemoteNotifier)developerRemoteNotifier
{
  return self->_developerRemoteNotifier;
}

- (void)setDeveloperRemoteNotifier:(id)a3
{
}

- (VSTopShelfPurger)topShelfPurger
{
  return self->_topShelfPurger;
}

- (void)setTopShelfPurger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end