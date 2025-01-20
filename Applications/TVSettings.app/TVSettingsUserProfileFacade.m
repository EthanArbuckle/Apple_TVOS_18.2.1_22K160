@interface TVSettingsUserProfileFacade
+ (BOOL)automaticallyNotifiesObserversOfUserHasBeenRemoved;
+ (id)keyPathsForValuesAffectingCanEnableRecognizeMyVoice;
+ (id)keyPathsForValuesAffectingIsSigningInOrOutInProgress;
+ (id)keyPathsForValuesAffectingRecognizeMyVoiceAvailability;
+ (id)keyPathsForValuesAffectingRecognizeMyVoiceState;
- (ACAccount)iCloudAccount;
- (ACAccountStore)accountStore;
- (AFSettingsConnection)siriSettingsConnection;
- (BOOL)_adoptPersona;
- (BOOL)_isHSA2AltDSID:(id)a3;
- (BOOL)canEnableRecognizeMyVoice;
- (BOOL)canSignOutOfServiceType:(int64_t)a3;
- (BOOL)iCloudPhotoLibraryEnabled;
- (BOOL)iCloudPhotoStreamAvailable;
- (BOOL)iCloudPhotoStreamEnabled;
- (BOOL)iCloudSharedPhotosEnabled;
- (BOOL)isRemovingUser;
- (BOOL)isSigningInOrOutInProgress;
- (BOOL)isSingleUserDevice;
- (BOOL)isUpgradingUser;
- (BOOL)memoriesContentEnabled;
- (BOOL)needsAuthenticationToChangeiCloudPhotoOptions;
- (BOOL)userHasActiveiTunes;
- (BOOL)userHasBeenRemoved;
- (BOOL)userSupportsiCloudPhotoOptions;
- (CDPTVUIController)cdpUIProvider;
- (OS_dispatch_queue)siriQueue;
- (PBSIgnoreUserProfileAccountNotificationsAssertion)ignoreNotificationsAssertion;
- (PBSUserProfileApplicationManager)applicationManager;
- (PBSUserProfileManager)profileManager;
- (RBSAssertion)processAssertion;
- (TVSAccountStoreObserver)accountStoreObserver;
- (TVSPreferences)photosPreferences;
- (TVSettingsUser)user;
- (TVSettingsUserProfileFacade)initWithUser:(id)a3;
- (UMUserPersonaContext)initialPersonaContext;
- (int64_t)recognizeMyVoiceAvailability;
- (int64_t)recognizeMyVoiceState;
- (void)_acquireAssertionsWithName:(id)a3;
- (void)_afterTerminatingAppsRemoveUserWithCompletion:(id)a3;
- (void)_authenticateForServiceType:(int64_t)a3 presentingViewController:(id)a4 completion:(id)a5;
- (void)_cleanUpAfterSigningInOrOut;
- (void)_manateeAvailabilityChanged;
- (void)_presentDialogWithError:(id)a3 presentingViewController:(id)a4;
- (void)_restorePersona;
- (void)_sendAnalyticsEventCausedByActionType:(unint64_t)a3 newValue:(BOOL)a4;
- (void)_setIdleScreenSaverTypeToDefaultIfNeccessary;
- (void)_setIsRecognizeMyVoiceEnabled:(BOOL)a3 completion:(id)a4;
- (void)_signInGameCenterWithPresentingViewController:(id)a3;
- (void)_signIniCloudWithPresentingViewController:(id)a3;
- (void)_signIniTunesWithPresentingViewController:(id)a3;
- (void)_updateGroupRecommendationsConsentToAuthorized:(BOOL)a3;
- (void)_updateIcloudAccountWithEnabled:(BOOL)a3 dataclass:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)_updateProfileWithServiceType:(int64_t)a3 toAltDSID:(id)a4;
- (void)_updateRecognizeMyVoiceAvailability;
- (void)_updateRecognizeMyVoiceState;
- (void)_updateiCloudPhotoSettingWithEnabled:(BOOL)a3 dataclass:(id)a4 presentingViewController:(id)a5 propertySetCompletion:(id)a6;
- (void)_updateiCloudPhotoValues;
- (void)_useCompanionAuthWithPresentingViewController:(id)a3 dataclass:(id)a4 completion:(id)a5;
- (void)_usePasswordAuthWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)accountWasModified:(id)a3;
- (void)dealloc;
- (void)disableRecognizeMyVoiceWithCompletion:(id)a3;
- (void)enableRecognizeMyVoiceWithCompletion:(id)a3;
- (void)groupRecommendationsConsentViewController:(id)a3 didUpdateConsentWithAuthorized:(BOOL)a4;
- (void)groupRecommendationsConsentViewControllerDidCancel:(id)a3;
- (void)presentTermsUIForiCloudAccountWithCompletion:(id)a3;
- (void)removeUserWithCompletion:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAccountStoreObserver:(id)a3;
- (void)setApplicationManager:(id)a3;
- (void)setAuthenticationNeededToChangeiCloudPhotoOptions;
- (void)setCdpUIProvider:(id)a3;
- (void)setICloudAccount:(id)a3;
- (void)setIgnoreNotificationsAssertion:(id)a3;
- (void)setInitialPersonaContext:(id)a3;
- (void)setIsRemovingUser:(BOOL)a3;
- (void)setIsSigningInOrOutInProgress:(BOOL)a3;
- (void)setIsSingleUserDevice:(BOOL)a3;
- (void)setMemoriesContentEnabled:(BOOL)a3;
- (void)setNeedsAuthenticationToChangeiCloudPhotoOptions:(BOOL)a3;
- (void)setPhotosPreferences:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setProfileManager:(id)a3;
- (void)setRecognizeMyVoiceAvailability:(int64_t)a3;
- (void)setRecognizeMyVoiceState:(int64_t)a3;
- (void)setSiriQueue:(id)a3;
- (void)setSiriSettingsConnection:(id)a3;
- (void)setUserHasBeenRemoved:(BOOL)a3;
- (void)setiCloudPhotoLibraryEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5;
- (void)setiCloudPhotoStreamEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5;
- (void)setiCloudSharedPhotosEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5;
- (void)signInFlowController:(id)a3 presentGenericTermsUIForAccount:(id)a4 completion:(id)a5;
- (void)signInServiceType:(int64_t)a3 presentingViewController:(id)a4;
- (void)signOutOfServiceType:(int64_t)a3;
- (void)toggleRecognizeMyVoiceWithCompletion:(id)a3;
- (void)updateGroupRecommendationsConsentToAuthorized:(BOOL)a3 presentingViewController:(id)a4;
- (void)updateInputModes:(id)a3 withCompletion:(id)a4;
- (void)updatePreferredLanguages:(id)a3 inputModes:(id)a4 withCompletion:(id)a5;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation TVSettingsUserProfileFacade

- (TVSettingsUserProfileFacade)initWithUser:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfileFacade;
  v6 = -[TVSettingsUserProfileFacade init](&v43, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_user, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    profileManager = v7->_profileManager;
    v7->_profileManager = (PBSUserProfileManager *)v8;

    -[PBSUserProfileManager addObserver:](v7->_profileManager, "addObserver:", v7);
    v10 = objc_alloc_init(&OBJC_CLASS___PBSUserProfileApplicationManager);
    applicationManager = v7->_applicationManager;
    v7->_applicationManager = v10;

    v7->_needsAuthenticationToChangeiCloudPhotoOptions = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfileManager userProfilesSnapshot](v7->_profileManager, "userProfilesSnapshot"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 userProfiles]);
    BOOL v14 = (unint64_t)[v13 count] < 2;

    v7->_isSingleUserDevice = v14;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v7->_accountStore;
    v7->_accountStore = (ACAccountStore *)v15;

    objc_initWeak(&location, v7);
    *(_OWORD *)&v7->_recognizeMyVoiceState = xmmword_10012A3B0;
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.TVSettings.UserProfileFacade.siriQueue", 0LL);
    siriQueue = v7->_siriQueue;
    v7->_siriQueue = (OS_dispatch_queue *)v17;

    v19 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
    siriSettingsConnection = v7->_siriSettingsConnection;
    v7->_siriSettingsConnection = v19;

    id v21 = sub_1000CADE8();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1000FB4A8();
    }

    -[TVSettingsUserProfileFacade _updateRecognizeMyVoiceAvailability](v7, "_updateRecognizeMyVoiceAvailability");
    -[TVSettingsUserProfileFacade _updateRecognizeMyVoiceState](v7, "_updateRecognizeMyVoiceState");
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  CDPManateeAvailabilityChangedNotification));
    [v23 addObserver:v7 selector:"_manateeAvailabilityChanged" name:v24 object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v7,  (CFNotificationCallback)sub_1000CAE28,  kAFRecognizeMyVoiceSettingChangedDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    if ((_os_feature_enabled_impl("CoreCDP", "MultiUserManatee") & 1) != 0
      || [v5 isPrimary])
    {
      v26 = objc_alloc_init(&OBJC_CLASS___CDPTVUIController);
      cdpUIProvider = v7->_cdpUIProvider;
      v7->_cdpUIProvider = v26;
    }

    if ([v5 isPrimary])
    {
      v28 = objc_alloc_init(&OBJC_CLASS___TVSAccountStoreObserver);
      accountStoreObserver = v7->_accountStoreObserver;
      v7->_accountStoreObserver = v28;

      -[TVSAccountStoreObserver setDelegate:](v7->_accountStoreObserver, "setDelegate:", v7);
      uint64_t v30 = objc_claimAutoreleasedReturnValue( -[TVSAccountStoreObserver registerPrimaryAppleAccount]( v7->_accountStoreObserver,  "registerPrimaryAppleAccount"));
      iCloudAccount = v7->_iCloudAccount;
      v7->_iCloudAccount = (ACAccount *)v30;

      -[TVSettingsUserProfileFacade _updateiCloudPhotoValues](v7, "_updateiCloudPhotoValues");
      id v32 = objc_alloc(&OBJC_CLASS___ACMonitoredAccountStore);
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  ACAccountTypeIdentifierAppleAccount));
      id v34 = [v32 initWithAccountTypes:v33 delegate:v7];

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1000CB000;
      v39[3] = &unk_1001931B8;
      objc_copyWeak(&v41, &location);
      id v40 = v5;
      [v34 registerWithCompletion:v39];
      objc_storeStrong((id *)&v7->_accountStore, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v35 addObserver:v7 selector:"setAuthenticationNeededToChangeiCloudPhotoOptions" name:UIApplicationDidEnterBackgroundNotification object:0];

      uint64_t v36 = objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedPhotosPreferences](&OBJC_CLASS___TVSPreferences, "sharedPhotosPreferences"));
      photosPreferences = v7->_photosPreferences;
      v7->_photosPreferences = (TVSPreferences *)v36;

      objc_destroyWeak(&v41);
    }

    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  CDPManateeAvailabilityChangedNotification));
  [v3 removeObserver:self name:v4 object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFRecognizeMyVoiceSettingChangedDarwinNotification, 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self];

  -[RBSAssertion invalidate](self->_processAssertion, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfileFacade;
  -[TVSettingsUserProfileFacade dealloc](&v7, "dealloc");
}

+ (id)keyPathsForValuesAffectingIsSigningInOrOutInProgress
{
  v2 = NSStringFromSelector("isRemovingUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));

  return v4;
}

- (BOOL)isSigningInOrOutInProgress
{
  return self->_isSigningInOrOutInProgress || self->_isRemovingUser;
}

- (BOOL)userHasActiveiTunes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iTunesAltDSID]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_activeiTunesAccount](self->_accountStore, "ams_activeiTunesAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_altDSID"));

  if (v4) {
    unsigned __int8 v7 = [v4 isEqualToString:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)signInServiceType:(int64_t)a3 presentingViewController:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"viewController != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FB6B4(a2);
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CB608LL);
  }

  uint64_t v8 = v7;
  if (!self->_isSigningInOrOutInProgress)
  {
    -[TVSettingsUserProfileFacade setIsSigningInOrOutInProgress:](self, "setIsSigningInOrOutInProgress:", 1LL);
    id v9 = sub_1000CADE8();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      *(_DWORD *)buf = 138543618;
      id v21 = v12;
      __int16 v22 = 2048;
      int64_t v23 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Signing in to service. {userIdentifier=%{public}@, serviceType=%ld}",  buf,  0x16u);
    }

    id v13 = sub_1000CADE8();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Cleaning up unused accounts before signing in to service, if any...",  buf,  2u);
    }

    objc_initWeak((id *)buf, self);
    accountStore = self->_accountStore;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000CB634;
    v17[3] = &unk_1001940F8;
    objc_copyWeak(v19, (id *)buf);
    v19[1] = (id)a3;
    id v18 = v8;
    -[ACAccountStore tvsettings_removeAccountsNotUsedByUserProfilesWithCompletion:]( accountStore,  "tvsettings_removeAccountsNotUsedByUserProfilesWithCompletion:",  v17);

    objc_destroyWeak(v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)signOutOfServiceType:(int64_t)a3
{
  if (!self->_isSigningInOrOutInProgress)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
    if (!-[TVSettingsUserProfileFacade canSignOutOfServiceType:](self, "canSignOutOfServiceType:", a3))
    {
      id v9 = sub_1000CADE8();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000FB7F0(v5, a3, v10);
      }

      goto LABEL_26;
    }

    -[TVSettingsUserProfileFacade setIsSigningInOrOutInProgress:](self, "setIsSigningInOrOutInProgress:", 1LL);
    -[TVSettingsUserProfileFacade _acquireAssertionsWithName:]( self,  "_acquireAssertionsWithName:",  @"Sign Out of Service");
    if (a3 == 2)
    {
      accountStore = self->_accountStore;
      id v7 = (id)objc_claimAutoreleasedReturnValue([v5 gameCenterAltDSID]);
      uint64_t v8 = objc_claimAutoreleasedReturnValue( -[ACAccountStore tvsettings_gameCenterAccountWithAltDSID:]( accountStore,  "tvsettings_gameCenterAccountWithAltDSID:",  v7));
    }

    else
    {
      if (a3 == 1)
      {
        v19 = self->_accountStore;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v5 iTunesAltDSID]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore ams_iTunesAccountWithAltDSID:](v19, "ams_iTunesAccountWithAltDSID:", v20));

        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 userProfilesSnapshot]);
        int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 userProfiles]);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_1000CBB18;
        v36[3] = &unk_100194120;
        id v24 = v5;
        id v37 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bs_filter:", v36));

        BOOL v26 = (unint64_t)[v25 count] > 1;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_homeUserHiddenIdentifiers"));
        id v28 = [v27 count];

        if (v28) {
          int v29 = 1;
        }
        else {
          int v29 = v26;
        }
        if (v29 == 1)
        {
          id v30 = sub_1000CADE8();
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
            *(_DWORD *)buf = 138543874;
            v39 = v32;
            __int16 v40 = 1024;
            *(_DWORD *)id v41 = v28 != 0LL;
            *(_WORD *)&v41[4] = 1024;
            *(_DWORD *)&v41[6] = *(_DWORD *)v41;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "iTunes account is being used by other users. Removing from profile only. {userIdentifier=%{public}@, isAcc ountUsedByMultipleUsers=%{BOOL}d, isAccountUsedByHiddenIdentifiers=%{BOOL}d}",  buf,  0x18u);
          }

          -[TVSettingsUserProfileFacade _updateProfileWithServiceType:toAltDSID:]( self,  "_updateProfileWithServiceType:toAltDSID:",  1LL,  0LL);
          goto LABEL_26;
        }

        id v7 = v37;
LABEL_12:

        if (v12)
        {
          id v13 = sub_1000CADE8();
          BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
            *(_DWORD *)buf = 138543874;
            v39 = v15;
            __int16 v40 = 2048;
            *(void *)id v41 = a3;
            *(_WORD *)&v41[8] = 2112;
            v42 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Signing out of service... {userIdentifier=%{public}@, serviceType=%ld account=%@}",  buf,  0x20u);
          }

          objc_initWeak((id *)buf, self);
          v16 = self->_accountStore;
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_1000CBB78;
          v33[3] = &unk_100194148;
          objc_copyWeak(v35, (id *)buf);
          v35[1] = (id)a3;
          id v34 = v5;
          -[ACAccountStore removeAccount:withCompletionHandler:](v16, "removeAccount:withCompletionHandler:", v12, v33);

          objc_destroyWeak(v35);
          objc_destroyWeak((id *)buf);

LABEL_26:
          return;
        }

- (BOOL)canSignOutOfServiceType:(int64_t)a3
{
  unsigned int v4 = -[TVSettingsUser hasiCloudAccount](self->_user, "hasiCloudAccount", a3);
  unint64_t v5 = -[TVSettingsUser hasiTunesAccount](self->_user, "hasiTunesAccount") + (unint64_t)v4;
  unint64_t v6 = v5 + -[TVSettingsUser hasGameCenterAccount](self->_user, "hasGameCenterAccount");
  if (v6) {
    return v6 != 1;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"servicesCount > 0"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000FB934();
  }
  BOOL result = _bs_set_crash_log_message([v8 UTF8String]);
  __break(0);
  return result;
}

- (void)removeUserWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(id, void))a3;
  BOOL isRemovingUser = self->_isRemovingUser;
  id v6 = sub_1000CADE8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (isRemovingUser)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FB9DC((uint64_t)self);
    }

    v4[2](v4, 0LL);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser identifier](self->_user, "identifier"));
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing user... {userIdentifier=%{public}@}",  buf,  0xCu);
    }

    -[TVSettingsUserProfileFacade setIsRemovingUser:](self, "setIsRemovingUser:", 1LL);
    -[TVSettingsUserProfileFacade _acquireAssertionsWithName:]( self,  "_acquireAssertionsWithName:",  @"Remove User");
    objc_initWeak((id *)buf, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000CBF18;
    v14[3] = &unk_10018FAC0;
    objc_copyWeak(&v16, (id *)buf);
    uint64_t v15 = v4;
    v10 = objc_retainBlock(v14);
    ((void (*)(void *, uint64_t, uint64_t, uint64_t))v10[2])(v10, v11, v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_afterTerminatingAppsRemoveUserWithCompletion:(id)a3
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000CC24C;
  v18[3] = &unk_100194170;
  v18[4] = self;
  id v19 = a3;
  id v4 = v19;
  unint64_t v5 = objc_retainBlock(v18);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000CC2A4;
  v13[3] = &unk_1001941E8;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  id v17 = v5;
  id v10 = v7;
  uint64_t v11 = v5;
  id v12 = v6;
  [v8 removeUserProfileWithIdentifier:v9 completionHandler:v13];
}

- (void)presentTermsUIForiCloudAccountWithCompletion:(id)a3
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000CCE58;
  v18[3] = &unk_10018FA98;
  id v4 = a3;
  id v19 = v4;
  unint64_t v5 = objc_retainBlock(v18);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser identifier](self->_user, "identifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudAltDSID]);

  id v9 = sub_1000CADE8();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Presenting iCloud Terms UI. {userIdentifier=%{public}@}",  buf,  0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccountWithAltDSID:](self->_accountStore, "aa_appleAccountWithAltDSID:", v8));
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000CCED4;
    v14[3] = &unk_100194210;
    id v15 = v6;
    id v16 = v8;
    id v17 = v5;
    +[TVSiCloudAccountManager presentTermsUIForAccount:completion:]( &OBJC_CLASS___TVSiCloudAccountManager,  "presentTermsUIForAccount:completion:",  v11,  v14);
  }

  else
  {
    id v12 = sub_1000CADE8();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000FBC28();
    }

    ((void (*)(void *))v5[2])(v5);
  }
}

- (BOOL)userSupportsiCloudPhotoOptions
{
  return -[TVSettingsUser isPrimary](self->_user, "isPrimary");
}

- (void)setAuthenticationNeededToChangeiCloudPhotoOptions
{
  self->_needsAuthenticationToChangeiCloudPhotoOptions = 1;
}

- (void)setiCloudPhotoLibraryEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5
{
}

- (void)setiCloudSharedPhotosEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5
{
}

- (void)setiCloudPhotoStreamEnabled:(BOOL)a3 presentingViewController:(id)a4 propertySetCompletion:(id)a5
{
}

- (BOOL)memoriesContentEnabled
{
  return -[TVSPreferences isMemoriesContentEnabledWithDefaultValue:]( self->_photosPreferences,  "isMemoriesContentEnabledWithDefaultValue:",  1LL);
}

- (void)setMemoriesContentEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[TVSettingsUserProfileFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"memoriesContentEnabled");
  -[TVSPreferences setMemoriesContentEnabled:](self->_photosPreferences, "setMemoriesContentEnabled:", v3);
  -[TVSPreferences synchronize](self->_photosPreferences, "synchronize");
  -[TVSettingsUserProfileFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"memoriesContentEnabled");
  if (!v3) {
    -[TVSettingsUserProfileFacade _setIdleScreenSaverTypeToDefaultIfNeccessary]( self,  "_setIdleScreenSaverTypeToDefaultIfNeccessary");
  }
  -[TVSettingsUserProfileFacade _sendAnalyticsEventCausedByActionType:newValue:]( self,  "_sendAnalyticsEventCausedByActionType:newValue:",  3LL,  v3);
}

- (void)updateGroupRecommendationsConsentToAuthorized:(BOOL)a3 presentingViewController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"presentingViewController != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FBCA0();
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x1000CD3A0LL);
  }

  id v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  id v9 = [v8 groupRecommendationsConsent];
  uint64_t v10 = 1LL;
  if (!v4) {
    uint64_t v10 = 2LL;
  }
  if (v9 == (id)v10)
  {
    id v11 = v9;
    id v12 = sub_1000CADE8();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138543874;
      int64_t v23 = v14;
      __int16 v24 = 2048;
      id v25 = v11;
      __int16 v26 = 1024;
      BOOL v27 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Asked to update group recommendations consent to the current value, ignoring request. {identifier=%{public}@, cu rrentConsent=%ld, changeToAuthorized=%{BOOL}d}",  buf,  0x1Cu);
    }
  }

  else
  {
    -[TVSettingsUser setIsUpdatingGroupRecommendationsConsent:]( self->_user,  "setIsUpdatingGroupRecommendationsConsent:",  1LL);
    if ([v8 groupRecommendationsConsent])
    {
      -[TVSettingsUserProfileFacade _updateGroupRecommendationsConsentToAuthorized:]( self,  "_updateGroupRecommendationsConsentToAuthorized:",  v4);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIGroupRecommendationsConsentViewControllerConfiguration defaultConfiguration]( &OBJC_CLASS___TVSUIGroupRecommendationsConsentViewControllerConfiguration,  "defaultConfiguration"));
      uint64_t v16 = TSKLocString(@"AccountsUserGroupRecommendationsConsentDialogFooterText");
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      [v15 setFooterText:v17];

      id v18 = objc_alloc(&OBJC_CLASS___TVSUIGroupRecommendationsConsentViewController);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      id v20 = [v18 initWithUserProfileIdentifier:v19 configuration:v15];

      [v20 setDelegate:self];
      [v7 presentViewController:v20 animated:1 completion:0];
    }
  }
}

+ (id)keyPathsForValuesAffectingRecognizeMyVoiceState
{
  v2 = NSStringFromSelector("recognizeMyVoiceAvailability");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));

  return v4;
}

+ (id)keyPathsForValuesAffectingRecognizeMyVoiceAvailability
{
  v2 = NSStringFromSelector("recognizeMyVoiceState");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));

  return v4;
}

+ (id)keyPathsForValuesAffectingCanEnableRecognizeMyVoice
{
  v2 = NSStringFromSelector("recognizeMyVoiceAvailability");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));

  return v4;
}

- (BOOL)canEnableRecognizeMyVoice
{
  return (self->_recognizeMyVoiceAvailability & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)disableRecognizeMyVoiceWithCompletion:(id)a3
{
}

- (void)enableRecognizeMyVoiceWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  id v6 = sub_1000CADE8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    *(_DWORD *)buf = 138543362;
    id v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Enabling Recognize My Voice. {userIdentifier=%{public}@}",  buf,  0xCu);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___CPSSystemAuthenticationRequest);
  [v9 setService:4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
  [v9 setAppleAccountAltDSID:v10];

  id v11 = [[CPSAuthenticationSession alloc] initWithRequest:v9];
  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000CD73C;
  v22[3] = &unk_100194238;
  id v12 = v5;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  objc_copyWeak(&v26, (id *)buf);
  id v14 = v4;
  id v25 = v14;
  [v11 setSessionFinishedHandler:v22];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000CD8B4;
  v18[3] = &unk_100194260;
  id v15 = v12;
  id v19 = v15;
  id v16 = v13;
  id v20 = v16;
  id v17 = v14;
  id v21 = v17;
  [v11 setSessionFailedHandler:v18];
  [v11 start];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (void)toggleRecognizeMyVoiceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  int64_t recognizeMyVoiceState = self->_recognizeMyVoiceState;
  if (recognizeMyVoiceState == -1)
  {
    id v6 = sub_1000CADE8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FBDE4();
    }

    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else if (recognizeMyVoiceState)
  {
    if (recognizeMyVoiceState == 1) {
      -[TVSettingsUserProfileFacade disableRecognizeMyVoiceWithCompletion:]( self,  "disableRecognizeMyVoiceWithCompletion:",  v4);
    }
  }

  else
  {
    -[TVSettingsUserProfileFacade enableRecognizeMyVoiceWithCompletion:]( self,  "enableRecognizeMyVoiceWithCompletion:",  v4);
  }
}

- (void)updatePreferredLanguages:(id)a3 inputModes:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v10;
    id v12 = (void *)objc_opt_new(&OBJC_CLASS___PBSUpdateUserProfileAttributes);
    id v13 = v12;
    if (v8) {
      [v12 setPreferredLanguages:v8];
    }
    [v13 setPreferredInputModes:v9];
    profileManager = self->_profileManager;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser identifier](self->_user, "identifier"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000CDC1C;
    v18[3] = &unk_100194288;
    id v19 = v11;
    id v16 = v11;
    -[PBSUserProfileManager updateUserProfileWithIdentifier:attributes:completionHandler:]( profileManager,  "updateUserProfileWithIdentifier:attributes:completionHandler:",  v15,  v13,  v18);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"inputModes != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FBE10();
    }
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
  }

- (void)updateInputModes:(id)a3 withCompletion:(id)a4
{
}

+ (BOOL)automaticallyNotifiesObserversOfUserHasBeenRemoved
{
  return 0;
}

- (void)setUserHasBeenRemoved:(BOOL)a3
{
  if (!self->_isRemovingUser && self->_userHasBeenRemoved != a3)
  {
    -[TVSettingsUserProfileFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"userHasBeenRemoved");
    self->_userHasBeenRemoved = a3;
    -[TVSettingsUserProfileFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"userHasBeenRemoved");
  }

- (void)userProfileManagerDidUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CDD34;
  v4[3] = &unk_10018E468;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)accountWasModified:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CDEC0;
  v5[3] = &unk_10018E468;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)signInFlowController:(id)a3 presentGenericTermsUIForAccount:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000CE00C;
  v8[3] = &unk_1001929B0;
  id v9 = a4;
  id v10 = a5;
  id v6 = v9;
  id v7 = v10;
  +[TVSiCloudAccountManager presentTermsUIForAccount:completion:]( &OBJC_CLASS___TVSiCloudAccountManager,  "presentTermsUIForAccount:completion:",  v6,  v8);
}

- (void)groupRecommendationsConsentViewControllerDidCancel:(id)a3
{
  id v4 = sub_1000CADE8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Group recommendations consent dialog, change cancelled.",  v6,  2u);
  }

  -[TVSettingsUser setIsUpdatingGroupRecommendationsConsent:]( self->_user,  "setIsUpdatingGroupRecommendationsConsent:",  0LL);
}

- (void)groupRecommendationsConsentViewController:(id)a3 didUpdateConsentWithAuthorized:(BOOL)a4
{
}

- (void)_updateGroupRecommendationsConsentToAuthorized:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000CE184;
  v9[3] = &unk_1001942B0;
  id v10 = v6;
  id v11 = self;
  uint64_t v12 = v4;
  id v8 = v6;
  [v7 updateGroupRecommendationsConsent:v4 forUserProfileWithIdentifier:v8 completionHandler:v9];
}

- (void)_updateiCloudPhotoSettingWithEnabled:(BOOL)a3 dataclass:(id)a4 presentingViewController:(id)a5 propertySetCompletion:(id)a6
{
  BOOL v8 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    id v14 = v13;
    if (-[TVSettingsUserProfileFacade userSupportsiCloudPhotoOptions](self, "userSupportsiCloudPhotoOptions"))
    {
      objc_initWeak(&location, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000CE5C8;
      v24[3] = &unk_100194328;
      objc_copyWeak(&v27, &location);
      id v15 = v14;
      id v26 = v15;
      id v16 = v11;
      id v25 = v16;
      BOOL v28 = v8;
      id v17 = objc_retainBlock(v24);
      id v18 = v17;
      if (v8 && self->_needsAuthenticationToChangeiCloudPhotoOptions)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1000CE93C;
        v21[3] = &unk_100194350;
        id v22 = v15;
        id v23 = v18;
        id v19 = objc_retainBlock(v21);
        -[TVSettingsUserProfileFacade _useCompanionAuthWithPresentingViewController:dataclass:completion:]( self,  "_useCompanionAuthWithPresentingViewController:dataclass:completion:",  v12,  v16,  v19);
      }

      else
      {
        ((void (*)(void *))v17[2])(v17);
      }

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"viewController != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000FBF5C(a2);
    }
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
  }

- (void)_updateIcloudAccountWithEnabled:(BOOL)a3 dataclass:(id)a4 success:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v7)
  {
    SFTerminateProcessNamed(@"TVPhotos", 0LL, @"iCloud Photo dataclass options changed.");
    if ((id)kAccountDataclassCloudPhotos == v10)
    {
      -[TVSettingsUserProfileFacade _sendAnalyticsEventCausedByActionType:newValue:]( self,  "_sendAnalyticsEventCausedByActionType:newValue:",  0LL,  v8);
      if (v8) {
        -[TVSettingsUserProfileFacade setMemoriesContentEnabled:](self, "setMemoriesContentEnabled:", 1LL);
      }
      else {
        -[TVSettingsUserProfileFacade _setIdleScreenSaverTypeToDefaultIfNeccessary]( self,  "_setIdleScreenSaverTypeToDefaultIfNeccessary");
      }
    }

    else
    {
      if ((id)kAccountDataclassSharedStreams == v10)
      {
        id v12 = self;
        uint64_t v13 = 2LL;
        goto LABEL_12;
      }

      if ((id)kAccountDataclassMediaStream == v10)
      {
        id v12 = self;
        uint64_t v13 = 1LL;
LABEL_12:
        -[TVSettingsUserProfileFacade _sendAnalyticsEventCausedByActionType:newValue:]( v12,  "_sendAnalyticsEventCausedByActionType:newValue:",  v13,  v8);
      }
    }
  }

  else
  {
    id v14 = sub_1000CADE8();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
      int v17 = 138544386;
      id v18 = v10;
      __int16 v19 = 1024;
      BOOL v20 = v8;
      __int16 v21 = 2114;
      id v22 = v16;
      __int16 v23 = 2048;
      id v24 = [v11 code];
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error saving dataclass changes. {dataclass=%{public}@, enabled=%{BOOL}d, errorDomain=%{public}@, errorCode=%ld, error=%@}",  (uint8_t *)&v17,  0x30u);
    }
  }
}

- (void)_useCompanionAuthWithPresentingViewController:(id)a3 dataclass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___CPSSystemAuthenticationRequest);
  [v11 setOptions:1];
  [v11 setService:3];
  id v12 = [[CPSAuthenticationSession alloc] initWithRequest:v11];
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000CED74;
  v23[3] = &unk_100194378;
  objc_copyWeak(&v25, &location);
  id v13 = v10;
  id v24 = v13;
  [v12 setSessionFinishedHandler:v23];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_1000CEE44;
  __int16 v19 = &unk_1001943C8;
  objc_copyWeak(&v22, &location);
  id v14 = v8;
  id v20 = v14;
  id v15 = v13;
  id v21 = v15;
  [v12 setSessionFailedHandler:&v16];
  objc_msgSend(v12, "start", v16, v17, v18, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_usePasswordAuthWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser iCloudUsername](self->_user, "iCloudUsername"));

  if (v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
    [v9 setServiceType:1];
    [v9 setShouldAllowAppleIDCreation:0];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser iCloudUsername](self->_user, "iCloudUsername"));
    [v9 setUsername:v10];

    [v9 setIsUsernameEditable:0];
    [v9 setPresentingViewController:v6];
    [v9 setAuthenticationType:2];
    [v9 setIsEphemeral:1];
    id v11 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000CF294;
    v14[3] = &unk_1001943F0;
    objc_copyWeak(&v16, &location);
    id v15 = v7;
    -[AKAppleIDAuthenticationController authenticateWithContext:completion:]( v11,  "authenticateWithContext:completion:",  v9,  v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  else
  {
    id v12 = sub_1000CADE8();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000FC12C();
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }
  }
}

- (void)_updateiCloudPhotoValues
{
  self->_iCloudPhotoLibraryEnabled = -[ACAccount isEnabledForDataclass:]( self->_iCloudAccount,  "isEnabledForDataclass:",  kAccountDataclassCloudPhotos);
  self->_iCloudSharedPhotosEnabled = -[ACAccount isEnabledForDataclass:]( self->_iCloudAccount,  "isEnabledForDataclass:",  kAccountDataclassSharedStreams);
  uint64_t v3 = kAccountDataclassMediaStream;
  self->_iCloudPhotoStreamEnabled = -[ACAccount isEnabledForDataclass:]( self->_iCloudAccount,  "isEnabledForDataclass:",  kAccountDataclassMediaStream);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount provisionedDataclasses](self->_iCloudAccount, "provisionedDataclasses"));
  else {
    BOOL v5 = 0;
  }
  self->_iCloudPhotoStreamAvailable = v5;

  -[TVSettingsUserProfileFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"iCloudPhotoLibraryEnabled");
  -[TVSettingsUserProfileFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"iCloudSharedPhotosEnabled");
  -[TVSettingsUserProfileFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"iCloudPhotoStreamEnabled");
  -[TVSettingsUserProfileFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"iCloudPhotoStreamAvailable");
}

- (void)_updateProfileWithServiceType:(int64_t)a3 toAltDSID:(id)a4
{
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___PBSUpdateUserProfileAttributes);
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v11 = v10;
  SEL v19 = a2;
  switch(a3)
  {
    case 2LL:
      [v9 setGameCenterAltDSID:v10];
      uint64_t v4 = 2LL;
      break;
    case 1LL:
      [v9 setITunesAltDSID:v10];
      uint64_t v4 = 1LL;
      break;
    case 0LL:
      [v9 setICloudAltDSID:v10];
      uint64_t v4 = 0LL;
      break;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  char v13 = objc_opt_isKindOfClass(v11, v12) & 1;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);

  objc_initWeak(&location, self);
  profileManager = self->_profileManager;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000CF7E0;
  v20[3] = &unk_100194418;
  objc_copyWeak(v23, &location);
  v23[1] = (id)v19;
  v23[2] = (id)v4;
  v20[4] = self;
  char v24 = v13;
  id v17 = v15;
  id v21 = v17;
  v23[3] = (id)a3;
  id v18 = v8;
  id v22 = v18;
  -[PBSUserProfileManager updateUserProfileWithIdentifier:attributes:completionHandler:]( profileManager,  "updateUserProfileWithIdentifier:attributes:completionHandler:",  v17,  v9,  v20);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)_authenticateForServiceType:(int64_t)a3 presentingViewController:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationTVContext);
  [v10 setPresentingViewController:v8];
  [v10 setServiceType:a3];
  uint64_t v11 = TSKLocString(@"AccountSignInAlertReason");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 setReason:v12];

  [v10 setSupportsPiggybacking:1];
  char v13 = -[TVSettingsUserProfileAppleIDAuthenticationController initWithUserProfileAuthenticationType:]( objc_alloc(&OBJC_CLASS___TVSettingsUserProfileAppleIDAuthenticationController),  "initWithUserProfileAuthenticationType:",  1LL);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000CFB38;
  v16[3] = &unk_100194440;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  -[TVSettingsUserProfileAppleIDAuthenticationController authenticateWithContext:completion:]( v13,  "authenticateWithContext:completion:",  v10,  v16);
}

- (void)_signIniCloudWithPresentingViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000CFD8C;
  v6[3] = &unk_100194490;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  -[TVSettingsUserProfileFacade _authenticateForServiceType:presentingViewController:completion:]( self,  "_authenticateForServiceType:presentingViewController:completion:",  1LL,  v5,  v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_signIniTunesWithPresentingViewController:(id)a3
{
  id v5 = a3;
  if (-[TVSettingsUserProfileFacade _adoptPersona](self, "_adoptPersona"))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
    [v6 setAuthenticationType:2];
    id v7 = [[AMSUIAuthenticateTask alloc] initWithAccount:0 presentingViewController:v5 options:v6];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 performAuthentication]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000D0228;
    v10[3] = &unk_1001944B8;
    v10[4] = self;
    v10[5] = a2;
    [v8 addSuccessBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000D0364;
    v9[3] = &unk_10018EAA0;
    void v9[4] = self;
    [v8 addErrorBlock:v9];
  }

  else
  {
    -[TVSettingsUserProfileFacade _cleanUpAfterSigningInOrOut](self, "_cleanUpAfterSigningInOrOut");
  }
}

- (void)_signInGameCenterWithPresentingViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000D04F8;
  v6[3] = &unk_100194508;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[TVSettingsUserProfileFacade _authenticateForServiceType:presentingViewController:completion:]( self,  "_authenticateForServiceType:presentingViewController:completion:",  6LL,  v5,  v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)_adoptPersona
{
  p_user = &self->_user;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personaUniqueString]);

  if (v5)
  {
    initialPersonaContext = self->_initialPersonaContext;
    p_initialPersonaContext = &self->_initialPersonaContext;
    if (initialPersonaContext)
    {
      id v8 = sub_1000CADE8();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Already adopting a persona, cannot adopt another nor the same twice. {personaUniqueString=%{public}@}",  buf,  0xCu);
      }

      unsigned __int8 v10 = 0;
      goto LABEL_22;
    }

    char v13 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
    id v23 = 0LL;
    id v14 = [v13 copyCurrentPersonaContextWithError:&v23];
    id v15 = v23;
    if (v14)
    {
      objc_storeStrong((id *)p_initialPersonaContext, v14);
      id v16 = sub_1000CADE8();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Adopting persona. {personaUniqueString=%{public}@}",  buf,  0xCu);
      }

      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 generateAndRestorePersonaContextWithPersonaUniqueString:v5]);
      unsigned __int8 v10 = v18 == 0LL;
      if (!v18) {
        goto LABEL_21;
      }
      id v19 = sub_1000CADE8();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000FC82C();
      }
    }

    else
    {
      id v21 = sub_1000CADE8();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000FA44C();
      }
    }

    unsigned __int8 v10 = 0;
LABEL_21:

    goto LABEL_22;
  }

  if (!-[TVSettingsUser isPrimary](*p_user, "isPrimary"))
  {
    id v11 = sub_1000CADE8();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000FC79C((id *)p_user);
    }
  }

  unsigned __int8 v10 = -[TVSettingsUser isPrimary](*p_user, "isPrimary");
LABEL_22:

  return v10;
}

- (void)_restorePersona
{
  if (self->_initialPersonaContext)
  {
    id v3 = sub_1000CADE8();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      initialPersonaContext = self->_initialPersonaContext;
      int v9 = 138412290;
      unsigned __int8 v10 = initialPersonaContext;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Restoring persona. {savedPersonaContext=%@}",  (uint8_t *)&v9,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
    id v7 = [v6 restorePersonaWithSavedPersonaContext:self->_initialPersonaContext];

    id v8 = self->_initialPersonaContext;
    self->_initialPersonaContext = 0LL;
  }

- (void)_cleanUpAfterSigningInOrOut
{
  ignoreNotificationsAssertion = self->_ignoreNotificationsAssertion;
  self->_ignoreNotificationsAssertion = 0LL;

  -[RBSAssertion invalidate](self->_processAssertion, "invalidate");
  processAssertion = self->_processAssertion;
  self->_processAssertion = 0LL;

  -[TVSettingsUserProfileFacade setIsSigningInOrOutInProgress:](self, "setIsSigningInOrOutInProgress:", 0LL);
}

- (void)_presentDialogWithError:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS____TtC10TVSettings28TVSettingsUserErrorPresenter);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsUserErrorPresenter signInServiceFailedAlertForError:]( v7,  "signInServiceFailedAlertForError:",  v5));

    [v6 presentViewController:v8 animated:1 completion:0];
  }

  else
  {
    id v9 = sub_1000CADE8();
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000FC8B4();
    }
  }
}

- (void)_acquireAssertionsWithName:(id)a3
{
  id v4 = a3;
  -[PBSIgnoreUserProfileAccountNotificationsAssertion relinquish](self->_ignoreNotificationsAssertion, "relinquish");
  -[RBSAssertion invalidate](self->_processAssertion, "invalidate");
  id v5 = -[PBSIgnoreUserProfileAccountNotificationsAssertion initWithIdentifier:]( objc_alloc(&OBJC_CLASS___PBSIgnoreUserProfileAccountNotificationsAssertion),  "initWithIdentifier:",  v4);
  ignoreNotificationsAssertion = self->_ignoreNotificationsAssertion;
  self->_ignoreNotificationsAssertion = v5;

  -[PBSIgnoreUserProfileAccountNotificationsAssertion acquire](self->_ignoreNotificationsAssertion, "acquire");
  id v7 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget currentProcess](&OBJC_CLASS___RBSTarget, "currentProcess"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"FinishTaskUninterruptable"));
  id v17 = v9;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  id v11 = -[RBSAssertion initWithExplanation:target:attributes:]( v7,  "initWithExplanation:target:attributes:",  v4,  v8,  v10);
  processAssertion = self->_processAssertion;
  self->_processAssertion = v11;

  char v13 = self->_processAssertion;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D0F4C;
  v15[3] = &unk_100194530;
  id v16 = v4;
  id v14 = v4;
  -[RBSAssertion acquireWithInvalidationHandler:](v13, "acquireWithInvalidationHandler:", v15);
}

- (BOOL)_isHSA2AltDSID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authKitAccountWithAltDSID:v3]);

  if (v5) {
    BOOL v6 = [v4 securityLevelForAccount:v5] == (id)4;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setIsRecognizeMyVoiceEnabled:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  int64_t recognizeMyVoiceState = (void *)self->_recognizeMyVoiceState;
  -[TVSettingsUserProfileFacade setRecognizeMyVoiceState:](self, "setRecognizeMyVoiceState:", -1LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
  id v9 = self->_siriSettingsConnection;
  objc_initWeak(&location, self);
  siriQueue = (dispatch_queue_s *)self->_siriQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D1168;
  block[3] = &unk_1001945A8;
  BOOL v19 = a3;
  id v15 = v9;
  id v16 = v8;
  id v11 = v8;
  uint64_t v12 = v9;
  objc_copyWeak(v18, &location);
  v18[1] = recognizeMyVoiceState;
  id v17 = v6;
  id v13 = v6;
  dispatch_async(siriQueue, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

- (void)_updateRecognizeMyVoiceState
{
  if (-[TVSettingsUser hasiCloudAccount](self->_user, "hasiCloudAccount"))
  {
    -[TVSettingsUserProfileFacade setRecognizeMyVoiceState:](self, "setRecognizeMyVoiceState:", -1LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
    id v4 = self->_siriSettingsConnection;
    objc_initWeak(&location, self);
    siriQueue = (dispatch_queue_s *)self->_siriQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000D159C;
    v8[3] = &unk_1001945F8;
    id v9 = v4;
    id v10 = v3;
    id v6 = v3;
    id v7 = v4;
    objc_copyWeak(&v11, &location);
    dispatch_async(siriQueue, v8);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }

  else
  {
    -[TVSettingsUserProfileFacade setRecognizeMyVoiceState:](self, "setRecognizeMyVoiceState:", 0LL);
  }

- (void)_updateRecognizeMyVoiceAvailability
{
  if (-[TVSettingsUser hasiCloudAccount](self->_user, "hasiCloudAccount"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser userProfile](self->_user, "userProfile"));
    id v4 = self->_siriSettingsConnection;
    -[TVSettingsUserProfileFacade setRecognizeMyVoiceAvailability:](self, "setRecognizeMyVoiceAvailability:", 0LL);
    id v5 = sub_1000CADE8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);
      *(_DWORD *)buf = 138543874;
      id v20 = v7;
      __int16 v21 = 2160;
      uint64_t v22 = 1752392040LL;
      __int16 v23 = 2112;
      char v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Updating Manatee state and voice profile availability. {userIdentifier=%{public}@, altDSID=%{mask.hash}@}",  buf,  0x20u);
    }

    objc_initWeak((id *)buf, self);
    siriQueue = (dispatch_queue_s *)self->_siriQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D1AC4;
    block[3] = &unk_1001945F8;
    id v16 = v3;
    id v17 = v4;
    id v10 = v4;
    id v11 = v3;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_async(siriQueue, block);
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
  }

  else
  {
    id v12 = sub_1000CADE8();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser identifier](self->_user, "identifier"));
      *(_DWORD *)buf = 138543362;
      id v20 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Voice profile unavailable, user not signed in to iCloud. {userIdentifier=%{public}@}",  buf,  0xCu);
    }

    -[TVSettingsUserProfileFacade setRecognizeMyVoiceAvailability:](self, "setRecognizeMyVoiceAvailability:", 1LL);
  }

- (void)_manateeAvailabilityChanged
{
  id v3 = sub_1000CADE8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCB2C();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D200C;
  block[3] = &unk_10018E440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_sendAnalyticsEventCausedByActionType:(unint64_t)a3 newValue:(BOOL)a4
{
}

- (void)_setIdleScreenSaverTypeToDefaultIfNeccessary
{
  if ((_os_feature_enabled_impl("IdleScreen", "Fizzgig") & 1) == 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
    id v3 = [v4 idleScreenSaverType];
    if (v3 == (id)TVISScreenSaverTypeMemory
      || self->_userHasBeenRemoved && [v4 myPhotosScreenSaverSelected])
    {
      [v4 setIdleScreenSaverType:TVISScreenSaverTypeAerial];
    }
  }

- (TVSettingsUser)user
{
  return self->_user;
}

- (BOOL)isRemovingUser
{
  return self->_isRemovingUser;
}

- (void)setIsRemovingUser:(BOOL)a3
{
  self->_BOOL isRemovingUser = a3;
}

- (BOOL)isUpgradingUser
{
  return self->_isUpgradingUser;
}

- (void)setIsSigningInOrOutInProgress:(BOOL)a3
{
  self->_isSigningInOrOutInProgress = a3;
}

- (BOOL)userHasBeenRemoved
{
  return self->_userHasBeenRemoved;
}

- (BOOL)isSingleUserDevice
{
  return self->_isSingleUserDevice;
}

- (void)setIsSingleUserDevice:(BOOL)a3
{
  self->_isSingleUserDevice = a3;
}

- (BOOL)iCloudPhotoLibraryEnabled
{
  return self->_iCloudPhotoLibraryEnabled;
}

- (BOOL)iCloudSharedPhotosEnabled
{
  return self->_iCloudSharedPhotosEnabled;
}

- (BOOL)iCloudPhotoStreamEnabled
{
  return self->_iCloudPhotoStreamEnabled;
}

- (BOOL)iCloudPhotoStreamAvailable
{
  return self->_iCloudPhotoStreamAvailable;
}

- (int64_t)recognizeMyVoiceState
{
  return self->_recognizeMyVoiceState;
}

- (void)setRecognizeMyVoiceState:(int64_t)a3
{
  self->_int64_t recognizeMyVoiceState = a3;
}

- (int64_t)recognizeMyVoiceAvailability
{
  return self->_recognizeMyVoiceAvailability;
}

- (void)setRecognizeMyVoiceAvailability:(int64_t)a3
{
  self->_recognizeMyVoiceAvailability = a3;
}

- (PBSUserProfileManager)profileManager
{
  return self->_profileManager;
}

- (void)setProfileManager:(id)a3
{
}

- (PBSUserProfileApplicationManager)applicationManager
{
  return self->_applicationManager;
}

- (void)setApplicationManager:(id)a3
{
}

- (UMUserPersonaContext)initialPersonaContext
{
  return self->_initialPersonaContext;
}

- (void)setInitialPersonaContext:(id)a3
{
}

- (CDPTVUIController)cdpUIProvider
{
  return self->_cdpUIProvider;
}

- (void)setCdpUIProvider:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccount)iCloudAccount
{
  return self->_iCloudAccount;
}

- (void)setICloudAccount:(id)a3
{
}

- (PBSIgnoreUserProfileAccountNotificationsAssertion)ignoreNotificationsAssertion
{
  return self->_ignoreNotificationsAssertion;
}

- (void)setIgnoreNotificationsAssertion:(id)a3
{
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (BOOL)needsAuthenticationToChangeiCloudPhotoOptions
{
  return self->_needsAuthenticationToChangeiCloudPhotoOptions;
}

- (void)setNeedsAuthenticationToChangeiCloudPhotoOptions:(BOOL)a3
{
  self->_needsAuthenticationToChangeiCloudPhotoOptions = a3;
}

- (TVSAccountStoreObserver)accountStoreObserver
{
  return self->_accountStoreObserver;
}

- (void)setAccountStoreObserver:(id)a3
{
}

- (TVSPreferences)photosPreferences
{
  return self->_photosPreferences;
}

- (void)setPhotosPreferences:(id)a3
{
}

- (AFSettingsConnection)siriSettingsConnection
{
  return self->_siriSettingsConnection;
}

- (void)setSiriSettingsConnection:(id)a3
{
}

- (OS_dispatch_queue)siriQueue
{
  return self->_siriQueue;
}

- (void)setSiriQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end