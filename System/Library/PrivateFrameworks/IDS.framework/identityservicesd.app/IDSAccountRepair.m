@interface IDSAccountRepair
+ (double)_phoneNumberRepairIntervalForCount:(int64_t)a3;
- (BOOL)_checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:(id)a3;
- (BOOL)_hasActiveAppleIDBasedAccountOnService:(id)a3;
- (BOOL)_isPhoneAccount:(id)a3 registeredAndMatchingThisAccount:(id)a4;
- (BOOL)_repairPhoneNumberAccounts;
- (BOOL)_shouldBypassRepairLogic;
- (BOOL)_shouldNotSetupPhoneNumberRepairTimer;
- (BOOL)shouldSupressRepairLogic;
- (BOOL)waitingForMigration;
- (IDSAccountRepair)initWithAccountController:(id)a3 systemAccountAdapter:(id)a4 userDefaults:(id)a5 keyTransparencyVerifier:(id)a6;
- (IDSDAccountController)accountController;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IMDispatchTimer)phoneRepairTimer;
- (IMDispatchTimer)repairTimer;
- (IMUserDefaults)userDefaults;
- (double)lastBagRepairInterval;
- (id)_activeAppleIDAccount;
- (id)_createiTunesAccountFromSystemIfNeeded;
- (id)_lastRepairIntervalFromPrefs;
- (id)_totalRepairCountFromPrefs;
- (void)_createAndEnableExistingSystemAccounts;
- (void)_phoneNumberRepairTimerHit:(id)a3;
- (void)_registerForAccountRepairActivity;
- (void)_repairAccountsWithSuccessfulPhoneNumberRegistration;
- (void)_repairAccountsWithSuccessfullAppleIDRegistrationForDSID:(id)a3 service:(id)a4;
- (void)_repairKTAccount:(id)a3;
- (void)_repairKVSEntriesForKT;
- (void)_repairTimerHit:(id)a3;
- (void)_repairiTunesBasedAccounts;
- (void)_resetPhoneNumberRepairCounter;
- (void)forceRepairAccounts:(id)a3;
- (void)kickRepairForAllRegistrationsSucceeded:(id)a3;
- (void)recalculatePhoneRepairTimer;
- (void)repairAccounts;
- (void)repairService:(id)a3 withPrimaryUserName:(id)a4;
- (void)repairiCloudBasedAccounts;
- (void)setAccountController:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setLastBagRepairInterval:(double)a3;
- (void)setPhoneRepairTimer:(id)a3;
- (void)setRepairTimer:(id)a3;
- (void)setShouldSupressRepairLogic:(BOOL)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setWaitingForMigration:(BOOL)a3;
- (void)setupPhoneNumberRepairTimer;
@end

@implementation IDSAccountRepair

- (IDSAccountRepair)initWithAccountController:(id)a3 systemAccountAdapter:(id)a4 userDefaults:(id)a5 keyTransparencyVerifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___IDSAccountRepair;
  v15 = -[IDSAccountRepair init](&v31, "init");
  v16 = v15;
  if (v15)
  {
    v15->_waitingForMigration = 1;
    objc_storeStrong((id *)&v15->_systemAccountAdapter, a4);
    objc_storeStrong((id *)&v16->_accountController, a3);
    objc_storeStrong((id *)&v16->_userDefaults, a5);
    objc_storeStrong((id *)&v16->_keyTransparencyVerifier, a6);
    v17 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
    uint64_t v19 = im_primary_queue(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000E7D24;
    v29[3] = &unk_1008F8088;
    v21 = v16;
    v30 = v21;
    v22 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v17,  "initWithQueue:interval:repeats:handlerBlock:",  v20,  604800LL,  1LL,  v29);
    repairTimer = v21->_repairTimer;
    v21->_repairTimer = v22;

    -[IDSAccountRepair setupPhoneNumberRepairTimer](v21, "setupPhoneNumberRepairTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDataMigrationTracker sharedInstance](&OBJC_CLASS___IDSDataMigrationTracker, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 performMigrationIfNeeded]);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000E7DB4;
    v27[3] = &unk_1008F7798;
    v28 = v21;
    [v25 registerResultBlock:v27];
  }

  return v16;
}

- (void)forceRepairAccounts:(id)a3
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v23;
    *(void *)&__int128 v4 = 138412802LL;
    __int128 v19 = v4;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        unsigned int v9 = objc_msgSend(v8, "isUserDisabled", v19);
        unsigned int v10 = [v8 isRegistered];
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestrictions sharedInstance](&OBJC_CLASS___IDSRestrictions, "sharedInstance"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
        unsigned int v13 = [v11 shouldDisableService:v12];

        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          if (v9) {
            v15 = @"YES";
          }
          else {
            v15 = @"NO";
          }
          *(_DWORD *)buf = v19;
          v27 = v15;
          if (v10) {
            v16 = @"YES";
          }
          else {
            v16 = @"NO";
          }
          __int16 v28 = 2112;
          v29 = v16;
          __int16 v30 = 2112;
          objc_super v31 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Checking if account is candidate for force repair {isUserDisabled: %@, isRegistered: %@, account: %@}",  buf,  0x20u);
        }

        if (((v9 | v10 | v13) & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);
          [v17 enableAccountWithUniqueID:v18];

          [v8 registerAccount];
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }

    while (v5);
  }
}

- (void)_repairTimerHit:(id)a3
{
  id v4 = a3;
  if (self->_waitingForMigration)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10069ADF4();
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    unsigned int v7 = [v6 isUnderFirstDataProtectionLock];

    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    unsigned int v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10069ADC8();
      }
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Repair timer fired: %@",  (uint8_t *)&v10,  0xCu);
      }

      -[IDSAccountRepair repairAccounts](self, "repairAccounts");
    }
  }
}

- (BOOL)_shouldBypassRepairLogic
{
  if (-[IDSAccountRepair shouldSupressRepairLogic](self, "shouldSupressRepairLogic"))
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v4 = "Bypassing repair -> Safeview?";
      id v5 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  unsigned int v7 = [v6 hasHardDeregistered];

  if (v7)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v4 = "Bypassing repair -> hasHardDeregistered";
      id v5 = (uint8_t *)&v9;
      goto LABEL_7;
    }

- (void)kickRepairForAllRegistrationsSucceeded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  unsigned int v6 = [v5 isLoading];

  if (v6)
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Waiting on accounts to load, the account controller isn't ready yet",  buf,  2u);
    }
  }

  else
  {
    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v33 = v4;
    id obj = v4;
    id v38 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    if (v38)
    {
      int v8 = 0;
      char v35 = 0;
      uint64_t v37 = *(void *)v46;
      __int16 v9 = &IMInsertBoolsToXPCDictionary_ptr;
      do
      {
        for (i = 0LL; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceIdentifier]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceWithIdentifier:v13]);

          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accounts]);

          id v17 = [v16 countByEnumeratingWithState:&v41 objects:v55 count:16];
          if (v17)
          {
            v39 = v14;
            int v40 = v8;
            uint64_t v18 = v9;
            __int128 v19 = self;
            uint64_t v20 = *(void *)v42;
            while (2)
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v42 != v20) {
                  objc_enumerationMutation(v16);
                }
                __int128 v22 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)j);
                __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 registration]);

                if (v23 == v11)
                {
                  id v17 = v22;
                  goto LABEL_19;
                }
              }

              id v17 = [v16 countByEnumeratingWithState:&v41 objects:v55 count:16];
              if (v17) {
                continue;
              }
              break;
            }

- (void)_repairAccountsWithSuccessfulPhoneNumberRegistration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  unsigned int v3 = [v2 isLoading];

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      unsigned int v6 = "Waiting on accounts to load, the account controller isn't ready yet";
      goto LABEL_70;
    }

    goto LABEL_71;
  }

  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "   => This was an SMS registration, let's see what we should repair",  buf,  2u);
  }

  if (!-[IDSAccountRepair _shouldBypassRepairLogic](self, "_shouldBypassRepairLogic"))
  {
    -[IDSAccountRepair _resetPhoneNumberRepairCounter](self, "_resetPhoneNumberRepairCounter");
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accounts]);

    __int16 v9 = self;
    id v10 = [v8 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (!v10) {
      goto LABEL_68;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v72;
    v57 = v8;
    uint64_t v59 = *(void *)v72;
    while (1)
    {
      unsigned int v13 = 0LL;
      do
      {
        if (*(void *)v72 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)v13);
        if (!objc_msgSend(v14, "accountType", v57))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
          unsigned int v16 = [v15 wantsPhoneNumberAccount];

          if (v16)
          {
            if (([v14 isAdHocAccount] & 1) == 0)
            {
              v63 = v14;
              id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v18 = [v14 registrationError];
                *(_DWORD *)buf = 67109120;
                LODWORD(v76) = v18;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  " => Failed account, let's see if we should kick it (Registration Error: %d)",  buf,  8u);
              }

              unint64_t v19 = (unint64_t)[v14 registrationError];
              if (v19 > 0x31) {
                goto LABEL_35;
              }
              if (((1LL << v19) & 0x3824088600000LL) != 0) {
                goto LABEL_20;
              }
              if (v19 != 2)
              {
                if (v19 == 39)
                {
                  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](v9, "accountController"));
                  objc_super v31 = v14;
                  v32 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v30 appleIDAccountOnService:v32]);

                  if ([v33 isEnabled])
                  {
                    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v76 = v33;
                      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  " => Matching Apple ID account on this service is enabled: %@",  buf,  0xCu);
                    }

                    id v14 = v63;
                    goto LABEL_57;
                  }

                  unsigned __int8 v52 = -[IDSAccountRepair _checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:]( v9,  "_checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:",  v31);

                  id v14 = v31;
                  if ((v52 & 1) != 0) {
                    goto LABEL_57;
                  }
                  goto LABEL_20;
                }

- (BOOL)_isPhoneAccount:(id)a3 registeredAndMatchingThisAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isAdHocAccount])
  {
    unsigned __int8 v7 = 0;
  }

  else
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userUniqueIdentifier]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userUniqueIdentifier]);
    else {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_checkForOtherRegisteredTopLevelPhoneAccountMatchingThisAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountsWithType:0]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[IDSAccountRepair _isPhoneAccount:registeredAndMatchingThisAccount:]( self,  "_isPhoneAccount:registeredAndMatchingThisAccount:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i),  v4,  (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)_repairAccountsWithSuccessfullAppleIDRegistrationForDSID:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  unsigned int v9 = [v8 isLoading];

  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      BOOL v12 = "Waiting on accounts to load, the account controller isn't ready yet";
      goto LABEL_35;
    }

    goto LABEL_36;
  }

  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "   => This was an AppleID registration, let's see what we should repair",  buf,  2u);
  }

  if (!-[IDSAccountRepair _shouldBypassRepairLogic](self, "_shouldBypassRepairLogic"))
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v33 = self;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accounts]);

    id v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (!v15) {
      goto LABEL_33;
    }
    id v17 = v15;
    uint64_t v18 = *(void *)v36;
    *(void *)&__int128 v16 = 138412290LL;
    __int128 v32 = v16;
    while (1)
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if (objc_msgSend(v20, "accountType", v32) == 1
          && ([v20 isAdHocAccount] & 1) == 0)
        {
          unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 dsID]);
          id v22 = (id)objc_claimAutoreleasedReturnValue([v20 service]);

          if (v22 != v7)
          {
            BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v40 = v6;
              __int16 v41 = 2112;
              __int128 v42 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  " => DSIDs match to %@, kicking for repair %@",  buf,  0x16u);
            }

            if (([v20 isRegistered] & 1) == 0)
            {
              __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v25 = [v20 registrationError];
                *(_DWORD *)buf = 67109120;
                LODWORD(v40) = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  " => Failed account, let's see if we should kick it (Registration Error: %d)",  buf,  8u);
              }

              unint64_t v26 = (unint64_t)[v20 registrationError] + 1;
              if (v26 > 0x32) {
                goto LABEL_26;
              }
              if (((1LL << v26) & 0x718A310C0000DLL) != 0) {
                continue;
              }
              if (((1LL << v26) & 0x40000000002LL) == 0) {
                goto LABEL_26;
              }
              unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 service]);
              if ([v21 iCloudBasedService])
              {
                unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iCloudSystemAccountWithError:]( v33->_systemAccountAdapter,  "iCloudSystemAccountWithError:",  0LL));

                if (!v27) {
                  continue;
                }
LABEL_26:
                __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v32;
                  id v40 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  " => Kicking Apple ID based account: %@",  buf,  0xCu);
                }

                v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](v33, "accountController"));
                __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueID]);
                [v29 enableAccountWithUniqueID:v30];

                [v20 registerAccount];
                objc_super v31 = (void *)objc_claimAutoreleasedReturnValue([v20 linkedAccounts]);
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472LL;
                v34[2] = sub_1000E9A68;
                v34[3] = &unk_1008F9CE0;
                v34[4] = v33;
                objc_msgSend(v31, "__imForEach:", v34);

                unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v32;
                  id v40 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  " ** Tried to repair account: %@",  buf,  0xCu);
                }
              }

- (void)_registerForAccountRepairActivity
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Registering for account repair activity.",  buf,  2u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000E9C70;
  handler[3] = &unk_1008FA018;
  objc_copyWeak(&v5, (id *)buf);
  xpc_activity_register("com.apple.ids.accountrepair", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)repairAccounts
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  unsigned int v4 = [v3 isLoading];

  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Waiting on accounts to load, the account controller isn't ready yet";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_140;
    }

    goto LABEL_140;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned int v8 = [v7 isUnderFirstDataProtectionLock];

  if (v8)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10069ADC8();
    }
    goto LABEL_140;
  }

  BOOL waitingForMigration = self->_waitingForMigration;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!waitingForMigration)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Account repair timer fired", buf, 2u);
    }

    v95 = self;
    -[IDSAccountRepair _createAndEnableExistingSystemAccounts](self, "_createAndEnableExistingSystemAccounts");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"iMessage",  @"com.apple.private.alloy.maps",  @"FaceTime",  @"FaceTime_temporary",  @"iMessage_temporary",  @"IDS_temporary",  0LL));
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cleaning up dead keychain items", buf, 2u);
    }

    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v107 objects:v120 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v108;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v108 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)i);
          unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v112 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Cleaning up keychain items for service: %@",  buf,  0xCu);
          }

          IMDeleteItemsForService(v18);
        }

        id v15 = [v13 countByEnumeratingWithState:&v107 objects:v120 count:16];
      }

      while (v15);
    }

    v94 = (os_log_s *)v13;

    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " => Done", buf, 2u);
    }

    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
    [v21 setMostRecentIDSRegistrationReason:3];

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRequestReasonContainer repairRequestWithSubreason:pathID:]( &OBJC_CLASS___IDSRequestReasonContainer,  "repairRequestWithSubreason:pathID:",  1LL,  3LL));
    [v22 setRegistrationRequestReason:v23];

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
    [v24 performCleanUpWithCompletion:0];

    unsigned int v25 = v95;
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](v95, "accountController"));
    unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accounts]);
    id v28 = [v27 _copyForEnumerating];

    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v103 objects:v119 count:16];
    if (!v30)
    {
LABEL_137:

      -[IDSAccountRepair repairiCloudBasedAccounts](v25, "repairiCloudBasedAccounts");
      -[IDSAccountRepair _repairiTunesBasedAccounts](v25, "_repairiTunesBasedAccounts");
      -[IDSAccountRepair _repairKVSEntriesForKT](v25, "_repairKVSEntriesForKT");
      v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, " *** Done", buf, 2u);
      }

      id v5 = v94;
      goto LABEL_140;
    }

    id v31 = v30;
    uint64_t v101 = IDSServiceNameiMessage;
    uint64_t v102 = *(void *)v104;
    uint64_t v99 = IDSServiceNameFaceTime;
    uint64_t v97 = IDSServiceNameFaceTimeMulti;
    uint64_t v98 = IDSServiceNameCalling;
    id v96 = v29;
LABEL_28:
    uint64_t v32 = 0LL;
    id v100 = v31;
    while (1)
    {
      if (*(void *)v104 != v102) {
        objc_enumerationMutation(v29);
      }
      id v33 = *(void **)(*((void *)&v103 + 1) + 8 * v32);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue([v33 service]);
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v33 service]);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 identifier]);

      if (([v37 isEqualToString:v101] & 1) != 0
        || ([v37 isEqualToString:v99] & 1) != 0
        || [v37 isEqualToString:v98])
      {
        unsigned int v38 = [v37 isEqualToString:v101];
      }

      else
      {
        unsigned int v50 = [v37 isEqualToString:v97];
        unsigned int v38 = [v37 isEqualToString:v101];
        if (!v50) {
          goto LABEL_58;
        }
      }

      if (([v33 isUserDisabled] & 1) == 0
        && ([v33 isRegistered] & 1) == 0)
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestrictions sharedInstance](&OBJC_CLASS___IDSRestrictions, "sharedInstance"));
        unsigned __int8 v40 = [v39 shouldDisableService:v34];

        if ((v40 & 1) == 0)
        {
          unint64_t v41 = (unint64_t)[v33 registrationError];
          unsigned int v42 = (v41 < 0x32) & (0x3800000000000uLL >> v41);
          BOOL v43 = ((0x7320779FFFF9uLL >> v41) & 1) == 0 && v41 < 0x32;
          __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            if (v43) {
              __int128 v45 = @"NO";
            }
            else {
              __int128 v45 = @"YES";
            }
            id v46 = [v33 registrationError];
            *(_DWORD *)buf = 138413058;
            unsigned __int8 v47 = @"NO";
            if (v42) {
              unsigned __int8 v47 = @"YES";
            }
            v112 = v37;
            __int16 v113 = 2112;
            v114 = v45;
            unsigned int v25 = v95;
            __int16 v115 = 2048;
            id v116 = v46;
            __int16 v117 = 2112;
            v118 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Checking disabled account {serviceIdentifier: %@, shouldRepair: %@, registrationError: %lld, shouldCheckKTStates: %@ }",  buf,  0x2Au);
          }

          if (!v43)
          {
            __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](v25, "accountController"));
            [v48 enableAccountWithUniqueID:v35];

            [v33 registerAccount];
          }

          if ((v42 & _os_feature_enabled_impl("IDS", "IDSKTDelayRegistration")) == 1)
          {
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            id v29 = v96;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Registration failed due to bad KT Account Key. Checking state to see if are ready to register.",  buf,  2u);
            }

            -[IDSAccountRepair _repairKTAccount:](v25, "_repairKTAccount:", v33);
          }

          else
          {
            id v29 = v96;
          }
        }
      }

- (void)repairService:(id)a3 withPrimaryUserName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pushTopic]);
  unsigned int v8 = [v7 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

  if ([v5 adHocServiceType] != 2 || v8)
  {
    unsigned int v9 = [v5 adHocServiceType] == 2 ? v8 : 0;
    if (v9 != 1
      || (BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController")),
          unsigned int v11 = [v10 isLocalSetupEnabled],
          v10,
          v11))
    {
      if ([v5 adHocServiceType] != 5)
      {
        if (![v5 disabledOnTinkerWatch]
          || (BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance")),
              unsigned __int8 v13 = [v12 isCurrentDeviceTinkerConfiguredWatch],
              v12,
              (v13 & 1) == 0))
        {
          if (![v5 enabledOnlyWhenPaired]
            || (id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController")),
                unsigned int v15 = [v14 isTraditionalLocalSetupEnabled],
                v14,
                v15))
          {
            context = objc_autoreleasePoolPush();
            __int128 v95 = 0u;
            __int128 v96 = 0u;
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
            v82 = v5;
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountsOnService:v5 withType:1]);

            id v18 = [v17 countByEnumeratingWithState:&v95 objects:v103 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v96;
              do
              {
                for (i = 0LL; i != v19; i = (char *)i + 1)
                {
                  if (*(void *)v96 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  id v22 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)i);
                  if (([v22 isAdHocAccount] & 1) == 0)
                  {
                    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v100 = v22;
                      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "   Checking account for deletion: %@",  buf,  0xCu);
                    }

                    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 loginID]);
                    int v25 = IMAreEmailsLogicallyTheSame(v24, v6);

                    unint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
                    if (v25)
                    {
                      if (v27)
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "   Account is primary, it should not be deleted",  buf,  2u);
                      }
                    }

                    else
                    {
                      if (v27)
                      {
                        id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 loginID]);
                        *(_DWORD *)buf = 138412546;
                        id v100 = v6;
                        __int16 v101 = 2112;
                        uint64_t v102 = v28;
                        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "  => Account does not appear to be primary, disabling it, and deleting it  (%@ <> %@)",  buf,  0x16u);
                      }

                      unint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                      -[os_log_s removeAccount:](v26, "removeAccount:", v22);
                    }
                  }
                }

                id v19 = [v17 countByEnumeratingWithState:&v95 objects:v103 count:16];
              }

              while (v19);
            }

            objc_autoreleasePoolPop(context);
            id v5 = v82;
            unsigned __int8 v29 = -[IDSAccountRepair _hasActiveAppleIDBasedAccountOnService:]( self,  "_hasActiveAppleIDBasedAccountOnService:",  v82);
            id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 accountsOnService:v82]);
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "__imArrayByFilteringWithBlock:", &stru_1008FA078));

            id v34 = sub_1000EBA18(v33, 1, v32);
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            id v36 = sub_1000EBA18((uint64_t)v35, 0, v32);
            __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            id v38 = sub_1000EBA18((uint64_t)v37, 2, v32);
            id v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            v79 = v32;
            id v40 = sub_1000EBA18((uint64_t)v39, 3, v32);
            uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
            v91[0] = _NSConcreteStackBlock;
            v91[1] = 3221225472LL;
            v91[2] = sub_1000EBABC;
            v91[3] = &unk_1008FA0A0;
            unsigned __int8 v94 = v29;
            id v78 = v6;
            id v92 = v78;
            v93 = self;
            objc_msgSend(v35, "__imForEach:", v91);
            v90[0] = _NSConcreteStackBlock;
            v90[1] = 3221225472LL;
            v90[2] = sub_1000EBE40;
            v90[3] = &unk_1008FA0C8;
            v90[4] = self;
            v84 = v37;
            objc_msgSend(v37, "__imForEach:", v90);
            v89[0] = _NSConcreteStackBlock;
            v89[1] = 3221225472LL;
            v89[2] = sub_1000EC0A0;
            v89[3] = &unk_1008FA0C8;
            v89[4] = self;
            unsigned __int8 v83 = v39;
            objc_msgSend(v39, "__imForEach:", v89);
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472LL;
            v88[2] = sub_1000EC174;
            v88[3] = &unk_1008FA0C8;
            v88[4] = self;
            contexta = (void *)v41;
            unsigned int v42 = (void *)v41;
            BOOL v43 = v35;
            objc_msgSend(v42, "__imForEach:", v88);
            __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
            __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 accountsOnService:v82 withType:1]);
            id v46 = [v45 count];

            if (!v46)
            {
              unsigned __int8 v47 = objc_autoreleasePoolPush();
              __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v100 = v82;
                _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  " => We have no active apple ID based accounts for service: %@",  buf,  0xCu);
              }

              v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair _activeAppleIDAccount](self, "_activeAppleIDAccount"));
              if (v49)
              {
                id v50 = v78;
                __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v49 loginID]);
                int v52 = IMAreEmailsLogicallyTheSame(v50, v51);

                v77 = v47;
                if (v52)
                {
                  __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v49 loginID]);
                    *(_DWORD *)buf = 138412546;
                    id v100 = v82;
                    __int16 v101 = 2112;
                    uint64_t v102 = v54;
                    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Creating new account based on existing account with service %@ login ID %@",  buf,  0x16u);
                  }

                  uint64_t v55 = objc_claimAutoreleasedReturnValue([v49 loginID]);
                  BOOL v56 = (void *)objc_claimAutoreleasedReturnValue([v49 accountInfo]);
                  id v50 = (id)v55;
                }

                else
                {
                  BOOL v56 = 0LL;
                }

                id v58 = objc_alloc(&OBJC_CLASS___IDSDAccount);
                id v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
                v57 = -[IDSDAccount initWithLoginID:service:uniqueID:accountType:accountConfig:]( v58,  "initWithLoginID:service:uniqueID:accountType:accountConfig:",  v50,  v82,  v59,  1LL,  v56);

                id v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                [v60 addPrimaryAccount:v57];

                id v61 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](v57, "uniqueID"));
                [v61 enablePrimaryAccountWithUniqueID:v62];

                uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount linkedAccounts](v57, "linkedAccounts"));
                v87[0] = _NSConcreteStackBlock;
                v87[1] = 3221225472LL;
                v87[2] = sub_1000EC360;
                v87[3] = &unk_1008F9CE0;
                v87[4] = self;
                objc_msgSend(v63, "__imForEach:", v87);

                -[IDSDAccount setupAccountWithCompletionBlock:](v57, "setupAccountWithCompletionBlock:", 0LL);
                unsigned __int8 v47 = v77;
              }

              else
              {
                v57 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v57,  OS_LOG_TYPE_DEFAULT,  " => No other signed in AppleID accounts, skipping",  buf,  2u);
                }
              }

              objc_autoreleasePoolPop(v47);
              BOOL v43 = v35;
            }

            if (objc_msgSend(v82, "wantsATVDeviceAccount", v77))
            {
              if (![v82 iCloudBasedService]
                || (v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController")),
                    unsigned int v65 = [v64 isiCloudSignedIn],
                    v64,
                    v65))
              {
                uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v66 accountsOnService:v82 withType:3]);
                id v68 = [v67 count];

                if (!v68)
                {
                  unsigned int v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v100 = v82;
                    _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  " => We have no active SMS based accounts for service: %@",  buf,  0xCu);
                  }

                  __int128 v70 = objc_alloc(&OBJC_CLASS___IDSDAccount);
                  __int128 v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
                  __int128 v72 = -[IDSDAccount initWithLoginID:service:uniqueID:accountType:accountConfig:]( v70,  "initWithLoginID:service:uniqueID:accountType:accountConfig:",  &stru_100912B50,  v82,  v71,  3LL,  0LL);

                  __int128 v73 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                  [v73 addPrimaryAccount:v72];

                  __int128 v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                  v75 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](v72, "uniqueID"));
                  [v74 enablePrimaryAccountWithUniqueID:v75];

                  unsigned int v76 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount linkedAccounts](v72, "linkedAccounts"));
                  v86[0] = _NSConcreteStackBlock;
                  v86[1] = 3221225472LL;
                  v86[2] = sub_1000EC3EC;
                  v86[3] = &unk_1008F9CE0;
                  v86[4] = self;
                  objc_msgSend(v76, "__imForEach:", v86);

                  -[IDSDAccount setupAccountWithCompletionBlock:](v72, "setupAccountWithCompletionBlock:", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)_activeAppleIDAccount
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController", 0LL));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accounts]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 accountType] == 1
          && [v7 isEnabled]
          && (int)[v7 registrationStatus] >= 2
          && ![v7 isAdHocAccount])
        {
          id v4 = v7;
          goto LABEL_14;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)_hasActiveAppleIDBasedAccountOnService:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountsOnService:v4]);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v10 accountType] == 1
          && [v10 isEnabled]
          && (int)[v10 registrationStatus] >= 2
          && ![v10 isAdHocAccount])
        {
          LOBYTE(v7) = 1;
          goto LABEL_14;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)_createiTunesAccountFromSystemIfNeeded
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iTunesSystemAccountWithError:]( self->_systemAccountAdapter,  "iTunesSystemAccountWithError:",  0LL));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesService]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 existingAccountOnService:v5 withType:1 loginID:v7]);

    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v5 == 0LL;
    }
    if (v9)
    {
      __int128 v11 = 0LL;
    }

    else
    {
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
      __int128 v11 = (IDSDAccount *)[v10 length];

      if (v11)
      {
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v3 DSID]);
        id v13 = [v12 length];

        if (v13)
        {
          uint64_t v26 = kIDSServiceDefaultsAuthorizationIDKey;
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 DSID]);
          BOOL v27 = v14;
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
        }

        else
        {
          __int128 v15 = 0LL;
        }

        uint64_t v16 = objc_alloc(&OBJC_CLASS___IDSDAccount);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
        __int128 v11 = -[IDSDAccount initWithLoginID:service:uniqueID:accountType:accountConfig:]( v16,  "initWithLoginID:service:uniqueID:accountType:accountConfig:",  v17,  v5,  v18,  1LL,  v15);

        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog iCloud](&OBJC_CLASS___IMRGLog, "iCloud"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](v11, "smallDescription"));
          int v22 = 138412546;
          BOOL v23 = v5;
          __int16 v24 = 2112;
          int v25 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Created new iTunes account based on system account { service: %@, account: %@ }",  (uint8_t *)&v22,  0x16u);
        }
      }
    }
  }

  else
  {
    __int128 v11 = 0LL;
  }

  return v11;
}

- (void)_createAndEnableExistingSystemAccounts
{
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSAccountRepair _createiTunesAccountFromSystemIfNeeded]( self,  "_createiTunesAccountFromSystemIfNeeded"));
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v5 = v3;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v9);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
        [v11 addAccount:v10];

        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
    }

    while (v7);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v12 = v5;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v16);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController", (void)v20));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
        [v18 enablePrimaryAccountWithUniqueID:v19];

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
    }

    while (v14);
  }
}

- (void)_repairiTunesBasedAccounts
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  unsigned int v4 = [v3 isLoading];

  if (v4)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waiting on accounts to load, the account controller isn't ready yet",  buf,  2u);
    }
  }

  else
  {
    if (-[IDSAccountRepair _shouldBypassRepairLogic](self, "_shouldBypassRepairLogic")) {
      return;
    }
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
      unsigned int v8 = [v7 hasActiveSMSAccount];
      BOOL v9 = @"NO";
      if (v8) {
        BOOL v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "   => Has SMS Account active: %@", buf, 0xCu);
    }

    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iTunesSystemAccountWithError:]( self->_systemAccountAdapter,  "iTunesSystemAccountWithError:",  0LL));
    uint64_t v5 = v10;
    if (v10)
    {
      __int128 v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[os_log_s username](v10, "username"));
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Repairing iTunes based accounts if needed (Primary account: %@)",  buf,  0xCu);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 iTunesService]);

      -[IDSAccountRepair repairService:withPrimaryUserName:](self, "repairService:withPrimaryUserName:", v14, v11);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, " => Done repair attempt", buf, 2u);
      }
    }

    else
    {
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "iTunes isn't signed in, no repair needed, signing out",  buf,  2u);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000ECE78;
      v17[3] = &unk_1008F6010;
      v17[4] = self;
      im_dispatch_after_primary_queue(v17, 1.0);
    }
  }
}

- (void)repairiCloudBasedAccounts
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
  unsigned int v4 = [v3 isLoading];

  if (v4)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waiting on accounts to load, the account controller isn't ready yet",  buf,  2u);
    }
  }

  else
  {
    if (-[IDSAccountRepair _shouldBypassRepairLogic](self, "_shouldBypassRepairLogic")) {
      return;
    }
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
      unsigned int v8 = [v7 hasActiveSMSAccount];
      BOOL v9 = @"NO";
      if (v8) {
        BOOL v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "   => Has SMS Account active: %@", buf, 0xCu);
    }

    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iCloudSystemAccountWithError:]( self->_systemAccountAdapter,  "iCloudSystemAccountWithError:",  0LL));
    uint64_t v5 = v10;
    if (v10)
    {
      __int128 v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[os_log_s username](v10, "username"));
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Repairing iCloud based accounts if needed (Primary account: %@)",  buf,  0xCu);
      }

      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allServices]);

      id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
            if ([v19 iCloudBasedService]) {
              -[IDSAccountRepair repairService:withPrimaryUserName:]( self,  "repairService:withPrimaryUserName:",  v19,  v11);
            }
          }

          id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }

        while (v16);
      }

      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " => Done repair attempt", buf, 2u);
      }
    }

    else
    {
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "iCloud isn't signed in, no repair needed, signing out",  buf,  2u);
      }

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000ED310;
      v23[3] = &unk_1008F6010;
      v23[4] = self;
      im_dispatch_after_primary_queue(v23, 1.0);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
      [v22 updateDevicePropertiesWithDevices:0];
    }
  }
}

- (void)_repairKTAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking to see if we can repair the KT account.",  buf,  2u);
  }

  keyTransparencyVerifier = self->_keyTransparencyVerifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000ED4DC;
  v8[3] = &unk_1008FA0F0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[IDSKeyTransparencyVerifier fetchKTCDPStatus:](keyTransparencyVerifier, "fetchKTCDPStatus:", v8);
}

- (void)_repairKVSEntriesForKT
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Checking to see if we need to repair KVS.",  v4,  2u);
  }

  if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "isKeyTransparencyEnabled"))
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeyTransparencyVerifier sharedInstance]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "sharedInstance"));
    [v3 repairKVSDeviceEntryIfNeeded];
  }

  else
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
      sub_10069AE20();
    }
  }
}

+ (double)_phoneNumberRepairIntervalForCount:(int64_t)a3
{
  double v4 = sub_1000ED708();
  double v5 = sub_1000ED790();
  double v6 = exp2((double)a3);
  else {
    double v7 = v4 * (double)(uint64_t)v6;
  }
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218752;
    double v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = (uint64_t)v6;
    __int16 v14 = 2048;
    int64_t v15 = a3;
    __int16 v16 = 2048;
    double v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Current repair interval: %f multiplier: %ld index: %ld max: %f",  (uint8_t *)&v10,  0x2Au);
  }

  return v7;
}

- (BOOL)_shouldNotSetupPhoneNumberRepairTimer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if ([v2 registrationSupported]) {
    unsigned int v3 = !+[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration");
  }
  else {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (id)_lastRepairIntervalFromPrefs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair userDefaults](self, "userDefaults"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appValueForKey:@"LastRepairInterval"]);

  return v3;
}

- (id)_totalRepairCountFromPrefs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair userDefaults](self, "userDefaults"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appValueForKey:@"TotalRepairCount"]);

  return v3;
}

- (void)setupPhoneNumberRepairTimer
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v4 = [v3 isUnderFirstDataProtectionLock];

  if ((v4 & 1) == 0)
  {
    if (-[IDSAccountRepair _shouldNotSetupPhoneNumberRepairTimer](self, "_shouldNotSetupPhoneNumberRepairTimer"))
    {
      double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v6 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
        else {
          double v7 = @"NO";
        }
        if (+[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration"))
        {
          unsigned int v8 = @"YES";
        }

        else
        {
          unsigned int v8 = @"NO";
        }

        *(_DWORD *)buf = 138412546;
        __int128 v45 = v7;
        __int16 v46 = 2112;
        unsigned __int8 v47 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not setting up repair (registrationSupported: %@) (supportsSMSIdentification: %@)",  buf,  0x16u);
      }

- (void)recalculatePhoneRepairTimer
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Bag reloaded, setting up new phone number repair timer",  buf,  2u);
  }

  double v4 = floor(self->_lastBagRepairInterval);
  if (v4 > 0.0 && v4 != floor(sub_1000ED708()))
  {
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Repair intervals differ, setting up new repair timer",  v6,  2u);
    }

    -[IDSAccountRepair setupPhoneNumberRepairTimer](self, "setupPhoneNumberRepairTimer");
  }

- (void)_resetPhoneNumberRepairCounter
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting phone number repair counter", v5, 2u);
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair userDefaults](self, "userDefaults"));
  [v4 removeAppValueForKey:@"TotalRepairCount"];
}

- (void)_phoneNumberRepairTimerHit:(id)a3
{
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Phone repair timer hit", buf, 2u);
  }

  -[IMDispatchTimer invalidate](self->_phoneRepairTimer, "invalidate");
  if (!-[IDSAccountRepair _repairPhoneNumberAccounts](self, "_repairPhoneNumberAccounts")) {
    -[IDSAccountRepair _resetPhoneNumberRepairCounter](self, "_resetPhoneNumberRepairCounter");
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair _totalRepairCountFromPrefs](self, "_totalRepairCountFromPrefs"));
  double v7 = v6;
  if (v6) {
    unsigned int v8 = (char *)[v6 integerValue];
  }
  else {
    unsigned int v8 = 0LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8 + 1));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair userDefaults](self, "userDefaults"));
  [v10 removeAppValueForKey:@"InitialRepairInterval"];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair userDefaults](self, "userDefaults"));
  [v11 setAppValue:v5 forKey:@"LastRepairInterval"];

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair userDefaults](self, "userDefaults"));
  [v12 setAppValue:v9 forKey:@"TotalRepairCount"];

  +[IDSAccountRepair _phoneNumberRepairIntervalForCount:]( &OBJC_CLASS___IDSAccountRepair,  "_phoneNumberRepairIntervalForCount:",  v8);
  double v14 = v13;
  int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v14));
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Next repair date %@", buf, 0xCu);
  }

  double v17 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v19 = im_primary_queue(v17, v18);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000EE348;
  v23[3] = &unk_1008F8088;
  v23[4] = self;
  double v21 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v17,  "initWithQueue:interval:repeats:handlerBlock:",  v20,  (unint64_t)v14,  0LL,  v23);
  phoneRepairTimer = self->_phoneRepairTimer;
  self->_phoneRepairTimer = v21;
}

- (BOOL)_repairPhoneNumberAccounts
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Repairing phone number accounts", buf, 2u);
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  if (![v4 registrationSupported])
  {

    return 0;
  }

  unsigned int v5 = +[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration");

  if (!v5 || -[IDSAccountRepair _shouldBypassRepairLogic](self, "_shouldBypassRepairLogic")) {
    return 0;
  }
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allServices]);

  id v8 = [v7 countByEnumeratingWithState:&v77 objects:v98 count:16];
  if (v8)
  {
    id v9 = v8;
    char v66 = 0;
    uint64_t v10 = *(void *)v78;
    __int128 v67 = self;
    uint64_t v62 = *(void *)v78;
    uint64_t v63 = v7;
    do
    {
      double v11 = 0LL;
      id v64 = v9;
      do
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v11);
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pushTopic]);
        unsigned int v14 = [v13 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

        if ([v12 adHocServiceType] != 2 || v14 != 0)
        {
          unsigned int v16 = [v12 adHocServiceType] == 2 ? v14 : 0;
          if (v16 != 1
            || (double v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController")),
                unsigned int v18 = [v17 isLocalSetupEnabled],
                v17,
                v18))
          {
            if ([v12 adHocServiceType] != 5)
            {
              if (![v12 disabledOnTinkerWatch]
                || (uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPairingManager sharedInstance]( IDSPairingManager,  "sharedInstance")),  v20 = [v19 isCurrentDeviceTinkerConfiguredWatch],  v19,  (v20 & 1) == 0))
              {
                if (![v12 enabledOnlyWhenPaired]
                  || (double v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController")),
                      unsigned int v22 = [v21 isTraditionalLocalSetupEnabled],
                      v21,
                      v22))
                {
                  unsigned int v65 = v11;
                  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountsOnService:v12]);

                  __int128 v75 = 0u;
                  __int128 v76 = 0u;
                  __int128 v73 = 0u;
                  __int128 v74 = 0u;
                  id v25 = v24;
                  id v26 = [v25 countByEnumeratingWithState:&v73 objects:v97 count:16];
                  if (v26)
                  {
                    id v27 = v26;
                    uint64_t v28 = *(void *)v74;
                    id v68 = v25;
                    do
                    {
                      for (i = 0LL; i != v27; i = (char *)i + 1)
                      {
                        if (*(void *)v74 != v28) {
                          objc_enumerationMutation(v25);
                        }
                        unsigned int v30 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
                        if (![v30 accountType]
                          && ([v30 isAdHocAccount] & 1) == 0)
                        {
                          unsigned int v70 = [v30 isRegistered];
                          double v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 uniqueID]);
                          unsigned int v69 = [v31 isEnabledAccount:v32];

                          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v30 service]);
                          unsigned int v34 = [v33 shouldAutoRegisterAllHandles];

                          unsigned int v71 = [v30 isUserDisabled];
                          LODWORD(v33) = [v30 registrationStatus];
                          unint64_t v35 = (unint64_t)[v30 registrationError];
                          unint64_t v36 = v35;
                          LODWORD(v37) = 0;
                          if ((_DWORD)v33 == -1 && v35 <= 0x2E) {
                            unint64_t v37 = (0x700040000FE0uLL >> v35) & 1;
                          }
                          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountRepair accountController](self, "accountController"));
                          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v30 service]);
                          id v40 = (void *)objc_claimAutoreleasedReturnValue([v38 appleIDAccountOnService:v39]);

                          unsigned int v41 = [v40 isRegistered];
                          unsigned int v42 = v41;
                          if (((v37 & 1) != 0 || ((v34 | v41) & 1) != 0 || v71 != 1)
                            && (v70 & v69 & 1) == 0
                            && v36 != 38)
                          {
                            int v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
                            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                            {
                              uint64_t v53 = objc_claimAutoreleasedReturnValue([v30 smallDescription]);
                              *(_DWORD *)buf = 138414082;
                              if (v34) {
                                unsigned int v54 = @"YES";
                              }
                              else {
                                unsigned int v54 = @"NO";
                              }
                              uint64_t v82 = v53;
                              uint64_t v55 = (void *)v53;
                              if (v42) {
                                BOOL v56 = @"YES";
                              }
                              else {
                                BOOL v56 = @"NO";
                              }
                              __int16 v83 = 2112;
                              if (v71) {
                                v57 = @"YES";
                              }
                              else {
                                v57 = @"NO";
                              }
                              v84 = v54;
                              if ((_DWORD)v37) {
                                id v58 = @"YES";
                              }
                              else {
                                id v58 = @"NO";
                              }
                              __int16 v85 = 2112;
                              if (v70) {
                                id v59 = @"YES";
                              }
                              else {
                                id v59 = @"NO";
                              }
                              uint32_t v86 = v56;
                              if (v69) {
                                id v60 = @"YES";
                              }
                              else {
                                id v60 = @"NO";
                              }
                              __int16 v87 = 2112;
                              v88 = v57;
                              __int16 v89 = 1024;
                              int v90 = v36;
                              __int16 v91 = 2112;
                              id v92 = v58;
                              __int16 v93 = 2112;
                              unsigned __int8 v94 = v59;
                              __int16 v95 = 2112;
                              __int128 v96 = v60;
                              _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "REPAIR %@ (shouldAutoRegister: %@) (companionAccountRegistered: %@) (isUserDisabled: %@) (registrationError: %d  -  shouldRepairFailedAccount: %@) (registered: %@) (enabled: %@)",  buf,  0x4Eu);
                            }

                            v72[0] = _NSConcreteStackBlock;
                            v72[1] = 3221225472LL;
                            v72[2] = sub_1000EEA54;
                            v72[3] = &unk_1008F5F80;
                            self = v67;
                            v72[4] = v67;
                            v72[5] = v30;
                            im_dispatch_after_primary_queue(v72, 0.0);
                            char v66 = 1;
                          }

                          else
                          {
                            BOOL v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog phoneRepair](&OBJC_CLASS___IMRGLog, "phoneRepair"));
                            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                            {
                              uint64_t v44 = objc_claimAutoreleasedReturnValue([v30 smallDescription]);
                              __int128 v45 = (void *)v44;
                              *(_DWORD *)buf = 138414082;
                              if (v34) {
                                __int16 v46 = @"YES";
                              }
                              else {
                                __int16 v46 = @"NO";
                              }
                              uint64_t v82 = v44;
                              if (v42) {
                                unsigned __int8 v47 = @"YES";
                              }
                              else {
                                unsigned __int8 v47 = @"NO";
                              }
                              __int16 v83 = 2112;
                              if (v71) {
                                __int128 v48 = @"YES";
                              }
                              else {
                                __int128 v48 = @"NO";
                              }
                              v84 = v46;
                              if ((_DWORD)v37) {
                                v49 = @"YES";
                              }
                              else {
                                v49 = @"NO";
                              }
                              __int16 v85 = 2112;
                              if (v70) {
                                id v50 = @"YES";
                              }
                              else {
                                id v50 = @"NO";
                              }
                              uint32_t v86 = v47;
                              if (v69) {
                                __int16 v51 = @"YES";
                              }
                              else {
                                __int16 v51 = @"NO";
                              }
                              __int16 v87 = 2112;
                              v88 = v48;
                              __int16 v89 = 1024;
                              int v90 = v36;
                              __int16 v91 = 2112;
                              id v92 = v49;
                              __int16 v93 = 2112;
                              unsigned __int8 v94 = v50;
                              __int16 v95 = 2112;
                              __int128 v96 = v51;
                              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "GOOD   %@ (shouldAutoRegister: %@) (companionAccountRegistered: %@) (isUserDisabled: %@) (registrationError: %d  -  shouldRepairFailedAccount: %@) (registered: %@) (enabled: %@)",  buf,  0x4Eu);
                            }

                            self = v67;
                          }

                          id v25 = v68;
                        }
                      }

                      id v27 = [v25 countByEnumeratingWithState:&v73 objects:v97 count:16];
                    }

                    while (v27);
                  }

                  double v7 = v63;
                  id v9 = v64;
                  uint64_t v10 = v62;
                  double v11 = v65;
                }
              }
            }
          }
        }

        double v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v77 objects:v98 count:16];
    }

    while (v9);
  }

  else
  {
    char v66 = 0;
  }

  return v66 & 1;
}

- (BOOL)shouldSupressRepairLogic
{
  return self->_shouldSupressRepairLogic;
}

- (void)setShouldSupressRepairLogic:(BOOL)a3
{
  self->_shouldSupressRepairLogic = a3;
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSKeyTransparencyVerifier)keyTransparencyVerifier
{
  return self->_keyTransparencyVerifier;
}

- (void)setKeyTransparencyVerifier:(id)a3
{
}

- (IMDispatchTimer)repairTimer
{
  return self->_repairTimer;
}

- (void)setRepairTimer:(id)a3
{
}

- (IMDispatchTimer)phoneRepairTimer
{
  return self->_phoneRepairTimer;
}

- (void)setPhoneRepairTimer:(id)a3
{
}

- (double)lastBagRepairInterval
{
  return self->_lastBagRepairInterval;
}

- (void)setLastBagRepairInterval:(double)a3
{
  self->_lastBagRepairInterval = a3;
}

- (BOOL)waitingForMigration
{
  return self->_waitingForMigration;
}

- (void)setWaitingForMigration:(BOOL)a3
{
  self->_BOOL waitingForMigration = a3;
}

- (void).cxx_destruct
{
}

@end