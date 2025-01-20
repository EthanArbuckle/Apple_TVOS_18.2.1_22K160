@interface IDSRegistrationConductor
+ (BOOL)enableHomeNumber;
+ (BOOL)shouldEnableATVDeviceRegistration;
+ (BOOL)shouldEnableHomeNumber;
- (BOOL)shouldSupressRepairLogic;
- (IDSAccountRepair)accountRepair;
- (IDSAccountSync)accountSync;
- (IDSCTAdapter)CTAdapter;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSDeviceCertificationRepair)deviceCertificationRepair;
- (IDSDeviceUserSynchronizer)deviceUserSynchronizer;
- (IDSHeartbeatCenter)heartbeatCenter;
- (IDSRegistrationConductor)init;
- (IDSRegistrationController)registrationController;
- (IDSRestoreMonitor)restoreMonitor;
- (IDSRestrictions)restrictions;
- (IDSSIMPhoneUserSynchronizer)SIMPhoneUserSynchronizer;
- (IDSSIMResponder)SIMResponder;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IDSSystemAccountUserSynchronizer)systemAccountUserSynchronizer;
- (IDSTemporaryPhoneUserSynchronizer)temporaryPhoneUserSynchronizer;
- (IDSUserAccountSynchronizer)userAccountSynchronizer;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)registrationQueue;
- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4;
- (void)SIM:(id)a3 didUpdateRegistrationState:(BOOL)a4;
- (void)_setupRestoreTimer;
- (void)accountControllerDidFinishLoadingAccounts:(id)a3;
- (void)bagReloaded:(id)a3;
- (void)carrierBundleInformationDidChange;
- (void)checkRestorationState;
- (void)deviceRecertificationCompleted:(id)a3;
- (void)forceRepairAccounts:(id)a3;
- (void)kickMissedTemporaryAlerts;
- (void)kickRepair;
- (void)kickiCloudRepair;
- (void)preferredAccountChanged:(id)a3;
- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4;
- (void)serviceRestrictionsChanged:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setAccountRepair:(id)a3;
- (void)setAccountSync:(id)a3;
- (void)setCTAdapter:(id)a3;
- (void)setDeviceCertificationRepair:(id)a3;
- (void)setDeviceUserSynchronizer:(id)a3;
- (void)setHeartbeatCenter:(id)a3;
- (void)setRegistrationController:(id)a3;
- (void)setRegistrationQueue:(id)a3;
- (void)setRestoreMonitor:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setSIMPhoneUserSynchronizer:(id)a3;
- (void)setSIMResponder:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setShouldSupressRepairLogic:(BOOL)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setSystemAccountUserSynchronizer:(id)a3;
- (void)setTemporaryPhoneUserSynchronizer:(id)a3;
- (void)setUserAccountSynchronizer:(id)a3;
- (void)setUserStore:(id)a3;
- (void)setup;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation IDSRegistrationConductor

- (IDSRegistrationConductor)init
{
  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___IDSRegistrationConductor;
  v2 = -[IDSRegistrationConductor init](&v76, "init");
  v4 = v2;
  if (v2)
  {
    uint64_t v5 = im_primary_queue(v2, v3);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    registrationQueue = v4->_registrationQueue;
    v4->_registrationQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[IDSRestoreMonitor sharedInstance](&OBJC_CLASS___IDSRestoreMonitor, "sharedInstance"));
    restoreMonitor = v4->_restoreMonitor;
    v4->_restoreMonitor = (IDSRestoreMonitor *)v8;

    v10 = -[IDSSystemAccountAdapter initWithQueue:]( objc_alloc(&OBJC_CLASS___IDSSystemAccountAdapter),  "initWithQueue:",  v4->_registrationQueue);
    systemAccountAdapter = v4->_systemAccountAdapter;
    v4->_systemAccountAdapter = v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
    CTAdapter = v4->_CTAdapter;
    v4->_CTAdapter = (IDSCTAdapter *)v12;

    -[IDSCTAdapter addListener:](v4->_CTAdapter, "addListener:", v4);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    accountController = v4->_accountController;
    v4->_accountController = (IDSDAccountController *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    serviceController = v4->_serviceController;
    v4->_serviceController = (IDSDServiceController *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
    registrationController = v4->_registrationController;
    v4->_registrationController = (IDSRegistrationController *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[IDSRestrictions sharedInstance](&OBJC_CLASS___IDSRestrictions, "sharedInstance"));
    restrictions = v4->_restrictions;
    v4->_restrictions = (IDSRestrictions *)v20;

    v22 = -[IDSUserStore initWithQueue:]( objc_alloc(&OBJC_CLASS___IDSUserStore),  "initWithQueue:",  v4->_registrationQueue);
    userStore = v4->_userStore;
    v4->_userStore = v22;

    v24 = objc_alloc(&OBJC_CLASS___IDSSIMPhoneUserSynchronizer);
    v25 = v4->_userStore;
    v26 = v4->_registrationQueue;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    v29 = v4->_CTAdapter;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor registrationController](v4, "registrationController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    v33 = -[IDSSIMPhoneUserSynchronizer initWithUserStore:queue:lockdownManager:systemMonitor:CTAdapter:userConfiguration:registrationController:pairingManager:]( v24,  "initWithUserStore:queue:lockdownManager:systemMonitor:CTAdapter:userConfiguration:registrationController:pairingManager:",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
    SIMPhoneUserSynchronizer = v4->_SIMPhoneUserSynchronizer;
    v4->_SIMPhoneUserSynchronizer = v33;

    v35 = objc_alloc(&OBJC_CLASS___IDSSystemAccountUserSynchronizer);
    v36 = v4->_systemAccountAdapter;
    v37 = v4->_userStore;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDataMigrationTracker sharedInstance](&OBJC_CLASS___IDSDataMigrationTracker, "sharedInstance"));
    v39 = -[IDSSystemAccountUserSynchronizer initWithSystemAccountAdapter:userStore:migrationTracker:queue:]( v35,  "initWithSystemAccountAdapter:userStore:migrationTracker:queue:",  v36,  v37,  v38,  v4->_registrationQueue);
    systemAccountUserSynchronizer = v4->_systemAccountUserSynchronizer;
    v4->_systemAccountUserSynchronizer = v39;

    LODWORD(v36) = +[IDSRegistrationConductor enableHomeNumber]( &OBJC_CLASS___IDSRegistrationConductor,  "enableHomeNumber");
    temporaryPhoneUserSynchronizer = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v42 = os_log_type_enabled(temporaryPhoneUserSynchronizer, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v36)
    {
      if (v42)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  temporaryPhoneUserSynchronizer,  OS_LOG_TYPE_DEFAULT,  "Home Number enabled",  buf,  2u);
      }

      v43 = -[IDSTemporaryPhoneUserSynchronizer initWithUserStore:ctAdapter:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserSynchronizer),  "initWithUserStore:ctAdapter:",  v4->_userStore,  v4->_CTAdapter);
      temporaryPhoneUserSynchronizer = (os_log_s *)v4->_temporaryPhoneUserSynchronizer;
      v4->_temporaryPhoneUserSynchronizer = v43;
    }

    else if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  temporaryPhoneUserSynchronizer,  OS_LOG_TYPE_DEFAULT,  "Home Number disabled",  buf,  2u);
    }

    if (+[IDSRegistrationConductor shouldEnableATVDeviceRegistration]( &OBJC_CLASS___IDSRegistrationConductor,  "shouldEnableATVDeviceRegistration"))
    {
      v44 = objc_alloc_init(&OBJC_CLASS___IDSDeviceUserSynchronizer);
      deviceUserSynchronizer = v4->_deviceUserSynchronizer;
      v4->_deviceUserSynchronizer = v44;
    }

    -[IDSUserStore setDataProvider:forRealm:]( v4->_userStore,  "setDataProvider:forRealm:",  v4->_SIMPhoneUserSynchronizer,  0LL);
    -[IDSUserStore setDataProvider:forRealm:]( v4->_userStore,  "setDataProvider:forRealm:",  v4->_systemAccountUserSynchronizer,  1LL);
    if (+[IDSRegistrationConductor enableHomeNumber](&OBJC_CLASS___IDSRegistrationConductor, "enableHomeNumber")) {
      -[IDSUserStore setDataProvider:forRealm:]( v4->_userStore,  "setDataProvider:forRealm:",  v4->_temporaryPhoneUserSynchronizer,  2LL);
    }
    if (+[IDSRegistrationConductor shouldEnableATVDeviceRegistration]( &OBJC_CLASS___IDSRegistrationConductor,  "shouldEnableATVDeviceRegistration"))
    {
      -[IDSUserStore setDataProvider:forRealm:]( v4->_userStore,  "setDataProvider:forRealm:",  v4->_deviceUserSynchronizer,  3LL);
    }

    v46 = objc_alloc(&OBJC_CLASS___IDSUserAccountSynchronizer);
    v47 = v4->_userStore;
    v48 = v4->_accountController;
    v49 = v4->_serviceController;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDataMigrationTracker sharedInstance](&OBJC_CLASS___IDSDataMigrationTracker, "sharedInstance"));
    v51 = -[IDSUserAccountSynchronizer initWithUserStore:accountController:serviceController:migrationTracker:restrictions:queue:]( v46,  "initWithUserStore:accountController:serviceController:migrationTracker:restrictions:queue:",  v47,  v48,  v49,  v50,  v4->_restrictions,  v4->_registrationQueue);
    userAccountSynchronizer = v4->_userAccountSynchronizer;
    v4->_userAccountSynchronizer = v51;

    uint64_t v53 = objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
    heartbeatCenter = v4->_heartbeatCenter;
    v4->_heartbeatCenter = (IDSHeartbeatCenter *)v53;

    uint64_t v55 = objc_claimAutoreleasedReturnValue(+[IDSAccountSync sharedInstance](&OBJC_CLASS___IDSAccountSync, "sharedInstance"));
    accountSync = v4->_accountSync;
    v4->_accountSync = (IDSAccountSync *)v55;

    v57 = objc_alloc(&OBJC_CLASS___IDSAccountRepair);
    v58 = v4->_accountController;
    v59 = v4->_systemAccountAdapter;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeyTransparencyVerifier sharedInstance]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "sharedInstance"));
    v62 = -[IDSAccountRepair initWithAccountController:systemAccountAdapter:userDefaults:keyTransparencyVerifier:]( v57,  "initWithAccountController:systemAccountAdapter:userDefaults:keyTransparencyVerifier:",  v58,  v59,  v60,  v61);
    accountRepair = v4->_accountRepair;
    v4->_accountRepair = v62;

    v64 = objc_alloc_init(&OBJC_CLASS___IDSDeviceCertificationRepair);
    deviceCertificationRepair = v4->_deviceCertificationRepair;
    v4->_deviceCertificationRepair = v64;

    v66 = objc_alloc(&OBJC_CLASS___IDSSIMResponder);
    v67 = v4->_accountController;
    v68 = v4->_serviceController;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestrictions sharedInstance](&OBJC_CLASS___IDSRestrictions, "sharedInstance"));
    v70 = -[IDSSIMResponder initWithAccountController:serviceController:restrictions:registrationController:]( v66,  "initWithAccountController:serviceController:restrictions:registrationController:",  v67,  v68,  v69,  v4->_registrationController);
    SIMResponder = v4->_SIMResponder;
    v4->_SIMResponder = v70;

    IMRegisterForPreferredAccountChangeNotificationsInternal();
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v72 addObserver:v4 selector:"preferredAccountChanged:" name:IMPreferredAccountForServiceChangedNotificationInternal object:0];
    [v72 addObserver:v4 selector:"bagReloaded:" name:IDSServerBagFinishedLoadingNotification object:0];
    [v72 addObserver:v4 selector:"serviceRestrictionsChanged:" name:kCFManagedPreferencesMCXNotificationName object:kCFManagedPreferencesMCXObjectName];
    [v72 addObserver:v4 selector:"serviceRestrictionsChanged:" name:FaceTimeDeviceRegistrationCapabilityChangedNotification object:0];
    [v72 addObserver:v4 selector:"serviceRestrictionsChanged:" name:FaceTimeDeviceCapabilityChangedNotification object:0];
    [v72 addObserver:v4 selector:"serviceRestrictionsChanged:" name:FaceTimeDeviceRestictionsChangedNotification object:0];
    [v72 addObserver:v4 selector:"ktRegDataUpdated:" name:IDSRegistrationKeyManagerKTRegDataUpdatedNotification object:0];
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v73 addListener:v4];
  }

  return v4;
}

- (void)setup
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor registrationController](self, "registrationController"));
  [v3 addListener:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountController](self, "accountController"));
  [v4 setDelegate:self];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor userStore](self, "userStore"));
  [v5 reloadUsers];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v7 = [v6 isUnderFirstDataProtectionLock];

  if ((v7 & 1) == 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10016DE4C;
    v10[3] = &unk_1008F6010;
    v10[4] = self;
    im_dispatch_after_primary_queue(v10, 15.0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10016DEA0;
    v9[3] = &unk_1008F6010;
    v9[4] = self;
    im_dispatch_after_primary_queue(v9, 0.0);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10016DEA8;
  v8[3] = &unk_1008F6010;
  v8[4] = self;
  im_dispatch_after_primary_queue(v8, 1.0);
}

- (void)kickMissedTemporaryAlerts
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor userStore](self, "userStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 usersWithRealm:2]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v15 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "finishedRegistration", v15, (void)v16)
          && ([v11 hasNotifiedSuccess] & 1) == 0)
        {
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Alerting for finished Home Number registration that has not notified user %@",  buf,  0xCu);
          }

          +[IDSTemporaryPhoneAlertManager presentSuccessAlertForUser:]( &OBJC_CLASS___IDSTemporaryPhoneAlertManager,  "presentSuccessAlertForUser:",  v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v11 temporaryPhoneUserWithNotifiedSuccess]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor userStore](self, "userStore"));
          [v14 updateUser:v13];
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v8);
  }
}

+ (BOOL)enableHomeNumber
{
  return _[a1 shouldEnableHomeNumber];
}

+ (BOOL)shouldEnableHomeNumber
{
  return 0;
}

+ (BOOL)shouldEnableATVDeviceRegistration
{
  if (_os_feature_enabled_impl("TelephonyUtilities", "aTVHandoff"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    int v3 = [v2 deviceType] == (id)5;
  }

  else
  {
    int v3 = 0;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"disable-atv-device-registration"]);

  if (v5)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
      v3 &= ~[v5 BOOLValue];
    }
  }

  return v3;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (OS_dispatch_queue)registrationQueue
{
  return self->_registrationQueue;
}

- (void)setRegistrationQueue:(id)a3
{
}

- (IDSRestoreMonitor)restoreMonitor
{
  return self->_restoreMonitor;
}

- (void)setRestoreMonitor:(id)a3
{
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IDSCTAdapter)CTAdapter
{
  return self->_CTAdapter;
}

- (void)setCTAdapter:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (void)setRegistrationController:(id)a3
{
}

- (IDSSIMPhoneUserSynchronizer)SIMPhoneUserSynchronizer
{
  return self->_SIMPhoneUserSynchronizer;
}

- (void)setSIMPhoneUserSynchronizer:(id)a3
{
}

- (IDSSystemAccountUserSynchronizer)systemAccountUserSynchronizer
{
  return self->_systemAccountUserSynchronizer;
}

- (void)setSystemAccountUserSynchronizer:(id)a3
{
}

- (IDSTemporaryPhoneUserSynchronizer)temporaryPhoneUserSynchronizer
{
  return self->_temporaryPhoneUserSynchronizer;
}

- (void)setTemporaryPhoneUserSynchronizer:(id)a3
{
}

- (IDSDeviceUserSynchronizer)deviceUserSynchronizer
{
  return self->_deviceUserSynchronizer;
}

- (void)setDeviceUserSynchronizer:(id)a3
{
}

- (IDSUserAccountSynchronizer)userAccountSynchronizer
{
  return self->_userAccountSynchronizer;
}

- (void)setUserAccountSynchronizer:(id)a3
{
}

- (IDSHeartbeatCenter)heartbeatCenter
{
  return self->_heartbeatCenter;
}

- (void)setHeartbeatCenter:(id)a3
{
}

- (IDSRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (IDSAccountSync)accountSync
{
  return self->_accountSync;
}

- (void)setAccountSync:(id)a3
{
}

- (IDSAccountRepair)accountRepair
{
  return self->_accountRepair;
}

- (void)setAccountRepair:(id)a3
{
}

- (IDSDeviceCertificationRepair)deviceCertificationRepair
{
  return self->_deviceCertificationRepair;
}

- (void)setDeviceCertificationRepair:(id)a3
{
}

- (IDSSIMResponder)SIMResponder
{
  return self->_SIMResponder;
}

- (void)setSIMResponder:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)shouldSupressRepairLogic
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair"));
  unsigned __int8 v3 = [v2 shouldSupressRepairLogic];

  return v3;
}

- (void)setShouldSupressRepairLogic:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair"));
  [v4 setShouldSupressRepairLogic:v3];
}

- (void)kickRepair
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair"));
  [v2 repairAccounts];
}

- (void)kickiCloudRepair
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair"));
  [v2 repairiCloudBasedAccounts];
}

- (void)forceRepairAccounts:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair"));
  [v5 forceRepairAccounts:v4];
}

- (void)accountControllerDidFinishLoadingAccounts:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor restrictions](self, "restrictions", a3));
  [v4 updateAccountActivation];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountSync](self, "accountSync"));
  [v5 kickAnyUnfinishedSynchronization];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor userAccountSynchronizer](self, "userAccountSynchronizer"));
  [v6 synchronize];
}

- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountSync](self, "accountSync"));
  [v6 stopAnyUnfinishedSynchronization];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountSync](self, "accountSync"));
  [v7 noteShouldSynchronizeAllServices];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountSync](self, "accountSync"));
  [v8 noteShouldSynchronizeTinkerDeviceInfo];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair"));
  [v9 kickRepairForAllRegistrationsSucceeded:v5];
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "First unlock, kick accounts check", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10016E6B0;
  v4[3] = &unk_1008F6010;
  v4[4] = self;
  im_dispatch_after_primary_queue(v4, 10.0);
  -[IDSRegistrationConductor kickMissedTemporaryAlerts](self, "kickMissedTemporaryAlerts");
}

- (void)preferredAccountChanged:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10016E788;
  v3[3] = &unk_1008F6010;
  v3[4] = self;
  im_dispatch_after_primary_queue(v3, 2.0);
}

- (void)bagReloaded:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair", a3));
  [v3 recalculatePhoneRepairTimer];
}

- (void)serviceRestrictionsChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair", a3));
  [v4 setupPhoneNumberRepairTimer];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor userAccountSynchronizer](self, "userAccountSynchronizer"));
  [v5 synchronize];
}

- (void)deviceRecertificationCompleted:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor accountRepair](self, "accountRepair", a3));
  [v3 repairAccounts];
}

- (void)SIM:(id)a3 didUpdateRegistrationState:(BOOL)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor registrationQueue](self, "registrationQueue", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016E8E0;
  v7[3] = &unk_1008F6418;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

- (void)carrierBundleInformationDidChange
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor registrationQueue](self, "registrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016E9D4;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor registrationQueue](self, "registrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016EAE4;
  block[3] = &unk_1008F5F58;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_setupRestoreTimer
{
}

- (void)checkRestorationState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v4 = [v3 isSetup];

  if ((v4 & 1) != 0)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is properly setup", v7, 2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationConductor SIMPhoneUserSynchronizer](self, "SIMPhoneUserSynchronizer"));
    [v6 verifyState];
  }

  else
  {
    -[IDSRegistrationConductor _setupRestoreTimer](self, "_setupRestoreTimer");
  }

@end