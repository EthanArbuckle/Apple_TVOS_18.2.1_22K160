@interface IDSSIMPhoneUserSynchronizer
- (BOOL)_isInDualPhoneIdentityModeForSims:(id)a3;
- (FTUserConfiguration)userConfiguration;
- (IDSCTAdapter)CTAdapter;
- (IDSPairingManager)pairingManager;
- (IDSRegistrationController)registrationController;
- (IDSSIMPhoneUserSynchronizer)initWithUserStore:(id)a3 queue:(id)a4 lockdownManager:(id)a5 systemMonitor:(id)a6 CTAdapter:(id)a7 userConfiguration:(id)a8 registrationController:(id)a9 pairingManager:(id)a10;
- (IDSUserStore)userStore;
- (IMLockdownManager)lockdownManager;
- (IMSystemMonitor)systemMonitor;
- (NSMutableDictionary)cachedIsSameSIM;
- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4;
- (void)SIMInformationDidChange;
- (void)_checkRegistrationStatus;
- (void)_setupForCurrentSubscriptionState;
- (void)dealloc;
- (void)didUpdatePairedDevice:(id)a3;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
- (void)selectedSubscriptionLabelDidChange:(id)a3;
- (void)setCTAdapter:(id)a3;
- (void)setCachedIsSameSIM:(id)a3;
- (void)setLockdownManager:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setRegistrationController:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setUserConfiguration:(id)a3;
- (void)setUserStore:(id)a3;
- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5;
- (void)verifyState;
@end

@implementation IDSSIMPhoneUserSynchronizer

- (IDSSIMPhoneUserSynchronizer)initWithUserStore:(id)a3 queue:(id)a4 lockdownManager:(id)a5 systemMonitor:(id)a6 CTAdapter:(id)a7 userConfiguration:(id)a8 registrationController:(id)a9 pairingManager:(id)a10
{
  id v28 = a3;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v16 = a9;
  id v17 = a10;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___IDSSIMPhoneUserSynchronizer;
  v18 = -[IDSSIMPhoneUserSynchronizer init](&v29, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userStore, a3);
    objc_storeStrong((id *)&v19->_lockdownManager, a5);
    objc_storeStrong((id *)&v19->_systemMonitor, a6);
    objc_storeStrong((id *)&v19->_userConfiguration, a8);
    objc_storeStrong((id *)&v19->_CTAdapter, a7);
    objc_storeStrong((id *)&v19->_registrationController, a9);
    objc_storeStrong((id *)&v19->_pairingManager, a10);
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cachedIsSameSIM = v19->_cachedIsSameSIM;
    v19->_cachedIsSameSIM = v20;

    -[IDSCTAdapter addListener:](v19->_CTAdapter, "addListener:", v19);
    -[IDSPairingManager addDelegate:](v19->_pairingManager, "addDelegate:", v19);
    -[IDSUserStore addActionListener:](v19->_userStore, "addActionListener:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 addObserver:v19 selector:"selectedSubscriptionLabelDidChange:" name:FTUserConfigurationSelectedSubscriptionLabelDidChange object:0];
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSSIMPhoneUserSynchronizer;
  -[IDSSIMPhoneUserSynchronizer dealloc](&v3, "dealloc");
}

- (void)verifyState
{
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initial state check for Phone numbers", v4, 2u);
  }

  -[IDSSIMPhoneUserSynchronizer _setupForCurrentSubscriptionState](self, "_setupForCurrentSubscriptionState");
}

- (BOOL)_isInDualPhoneIdentityModeForSims:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "__imArrayByApplyingBlock:", &stru_1008FDDC0));
  id v5 = [v4 count];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 appValueForKey:@"isInDualSIMIdentifier"]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);

  if (-[FTUserConfiguration isDeviceInDualPhoneIdentityMode]( self->_userConfiguration,  "isDeviceInDualPhoneIdentityMode")
    && (-[__CFString isEqualToString:](v7, "isEqualToString:", v9) & 1) == 0)
  {
    -[FTUserConfiguration setIsDeviceInDualPhoneIdentityMode:]( self->_userConfiguration,  "setIsDeviceInDualPhoneIdentityMode:",  0LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      v23 = v7;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Device identifier differs disabling dual mode {persistedDeviceIdentifier: %@, currentDeviceIdentifier: %@}",  (uint8_t *)&v22,  0x16u);
    }
  }

  if ((-[FTUserConfiguration isDeviceInDualPhoneIdentityMode]( self->_userConfiguration,  "isDeviceInDualPhoneIdentityMode") & 1) == 0 && (unint64_t)v5 >= 2)
  {
    -[FTUserConfiguration setIsDeviceInDualPhoneIdentityMode:]( self->_userConfiguration,  "setIsDeviceInDualPhoneIdentityMode:",  1LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
    [v11 setAppValue:v9 forKey:@"isInDualSIMIdentifier"];
  }

  unsigned int v12 = -[IDSCTAdapter dualSIMCapabilityEnabled](self->_CTAdapter, "dualSIMCapabilityEnabled");
  unsigned int v13 = -[FTUserConfiguration isDeviceInDualPhoneIdentityMode]( self->_userConfiguration,  "isDeviceInDualPhoneIdentityMode");
  unsigned int v14 = v13;
  else {
    int v15 = v12;
  }
  int v16 = v15 & v13;
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = @"NO";
    if (v16) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    else {
      v20 = @"YES";
    }
    int v22 = 138412802;
    v23 = v19;
    __int16 v24 = 2112;
    id v25 = v20;
    if (v14) {
      v18 = @"YES";
    }
    __int16 v26 = 2112;
    id v27 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Determined if device is in dual phone identity mode { isDualIdentity: %@, multipleInsertedSims: %@, isDeviceInDual PhoneIdentityMode: %@ }",  (uint8_t *)&v22,  0x20u);
  }

  return v16;
}

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_1006A3908((uint64_t)v4, v5);
  }
}

- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMPhoneUserSynchronizer registrationController](self, "registrationController"));
  unsigned __int8 v7 = [v6 systemSupportsPhoneNumberRegistration];

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[FTUserConfiguration selectedPhoneNumberRegistrationSubscriptionLabels]( self->_userConfiguration,  "selectedPhoneNumberRegistrationSubscriptionLabels"));
    v9 = (__CFString *)[v5 mutableCopy];
    CTAdapter = self->_CTAdapter;
    id v133 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCTAdapter currentSIMsWithError:](CTAdapter, "currentSIMsWithError:", &v133));
    id v104 = v133;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMPhoneUserSynchronizer cachedIsSameSIM](self, "cachedIsSameSIM"));
    [v12 removeAllObjects];

    unsigned int v13 = -[IDSSIMPhoneUserSynchronizer _isInDualPhoneIdentityModeForSims:]( self,  "_isInDualPhoneIdentityModeForSims:",  v11);
    unsigned int v105 = -[FTUserConfiguration isDeviceInManualPhoneSelectionMode]( self->_userConfiguration,  "isDeviceInManualPhoneSelectionMode");
    unsigned int v14 = 0LL;
    if (v13)
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMPhoneUserSynchronizer userStore](self, "userStore"));
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 usersWithRealm:2]);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imArrayByApplyingBlock:", &stru_1008FDE00));
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "__imArrayByApplyingBlock:", &stru_1008FDE40));
    v106 = self;
    v107 = v14;
    v103 = (void *)v17;
    if (v14)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "__imSetFromArray"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "__imSetFromArray"));
      unsigned int v21 = [v19 intersectsSet:v20];
    }

    else
    {
      unsigned int v21 = 0;
    }

    v111 = (void *)v8;
    if (v8) {
      int v24 = 1;
    }
    else {
      int v24 = v21;
    }
    unsigned int v100 = v13;
    int v25 = v24 & (v13 | v105);
    __int16 v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    id obj = v11;
    int v114 = v25;
    id v119 = [obj countByEnumeratingWithState:&v129 objects:v150 count:16];
    if (v119)
    {
      uint64_t v118 = *(void *)v130;
      id v112 = v5;
      v113 = v9;
      do
      {
        for (i = 0LL; i != v119; i = (char *)i + 1)
        {
          if (*(void *)v130 != v118) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(void **)(*((void *)&v129 + 1) + 8LL * (void)i);
          objc_super v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 SIMIdentifier]);
          if (v29
            && (!v25
             || ([v111 containsObject:v29] & 1) != 0
             || [v107 containsObject:v29]))
          {
            v116 = v28;
            __int128 v127 = 0u;
            __int128 v128 = 0u;
            __int128 v125 = 0u;
            __int128 v126 = 0u;
            v30 = (IDSPhoneUser *)v5;
            id v31 = -[IDSPhoneUser countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v125,  v149,  16LL);
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v126;
LABEL_24:
              uint64_t v34 = 0LL;
              while (1)
              {
                if (*(void *)v126 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = *(void **)(*((void *)&v125 + 1) + 8 * v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue([v35 uniqueIdentifier]);
                unsigned int v37 = [v36 isEqualToString:v29];

                if (v37) {
                  break;
                }
                if (v32 == (id)++v34)
                {
                  id v32 = -[IDSPhoneUser countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v125,  v149,  16LL);
                  if (v32) {
                    goto LABEL_24;
                  }
                  goto LABEL_30;
                }
              }

              -[NSMutableArray addObject:](v26, "addObject:", v29);
              if ([v35 realm])
              {
                v9 = v113;
                goto LABEL_59;
              }

              v43 = v35;
              v44 = v106->_CTAdapter;
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString phoneNumber](v43, "phoneNumber"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString phoneBookNumber](v43, "phoneBookNumber"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uniqueIdentifier](v43, "uniqueIdentifier"));
              id v124 = 0LL;
              LODWORD(v44) = -[IDSCTAdapter isPNRNumber:andPhoneBookNumber:differentEnoughFromSIMIdentifier:toReregisterWithNewNumber:]( v44,  "isPNRNumber:andPhoneBookNumber:differentEnoughFromSIMIdentifier:toReregisterWithNewNumber:",  v45,  v46,  v47,  &v124);
              id v109 = v124;

              int v48 = (int)v44;
              v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  v44 ^ 1));
              v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMPhoneUserSynchronizer cachedIsSameSIM](v106, "cachedIsSameSIM"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uniqueIdentifier](v43, "uniqueIdentifier"));
              [v50 setObject:v49 forKeyedSubscript:v51];

              v52 = (void *)objc_claimAutoreleasedReturnValue([v116 mobileCountryCode]);
              if ([v52 length]) {
                uint64_t v53 = objc_claimAutoreleasedReturnValue([v116 mobileCountryCode]);
              }
              else {
                uint64_t v53 = objc_claimAutoreleasedReturnValue(-[__CFString countryCode](v43, "countryCode"));
              }
              v54 = (void *)v53;

              v55 = (void *)objc_claimAutoreleasedReturnValue([v116 mobileNetworkCode]);
              if ([v55 length]) {
                uint64_t v56 = objc_claimAutoreleasedReturnValue([v116 mobileNetworkCode]);
              }
              else {
                uint64_t v56 = objc_claimAutoreleasedReturnValue(-[__CFString networkCode](v43, "networkCode"));
              }
              v110 = (void *)v56;

              v108 = v54;
              if (v48)
              {
                v57 = objc_alloc(&OBJC_CLASS___IDSPhoneUser);
                id v58 = [v116 isDefaultVoiceSIM];
                v59 = (void *)objc_claimAutoreleasedReturnValue([v116 mobileCountryCode]);
                v60 = (void *)objc_claimAutoreleasedReturnValue([v116 mobileNetworkCode]);
                v61 = -[IDSPhoneUser initWithLabelID:phoneBookNumber:isDefaultUser:countryCode:networkCode:]( v57,  "initWithLabelID:phoneBookNumber:isDefaultUser:countryCode:networkCode:",  v29,  v109,  v58,  v59,  v60);

                v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v135 = v29;
                  __int16 v136 = 2112;
                  v137 = v43;
                  __int16 v138 = 2112;
                  v139 = (const __CFString *)v61;
                  _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Recognized phone number change without labelID change {labelID: %@, currentUser: %@, newUser: %@}",  buf,  0x20u);
                }

                v9 = v113;
                -[__CFString removeObject:](v113, "removeObject:", v43);
                -[__CFString addObject:](v113, "addObject:", v61);
                v63 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
                v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUser uniqueIdentifier](v61, "uniqueIdentifier"));
                [v63 setPNRReason:4 forUserUniqueIdentifier:v64];

                goto LABEL_57;
              }

              unsigned int v65 = -[__CFString isDefaultUser](v43, "isDefaultUser");
              v9 = v113;
              if (v65 == [v116 isDefaultVoiceSIM])
              {
                v66 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString countryCode](v43, "countryCode"));
                if ([v66 isEqualToString:v54])
                {
                  v67 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString networkCode](v43, "networkCode"));
                  unsigned __int8 v68 = [v67 isEqualToString:v110];

                  v54 = v108;
                  if ((v68 & 1) != 0) {
                    goto LABEL_58;
                  }
                }

                else
                {
                }
              }

              v61 = (IDSPhoneUser *)objc_claimAutoreleasedReturnValue( -[__CFString phoneUserWithUpdatedDefaultUser:countryCode:networkCode:]( v43,  "phoneUserWithUpdatedDefaultUser:countryCode:networkCode:",  [v116 isDefaultVoiceSIM],  v54,  v110));
              v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                else {
                  v70 = @"NO";
                }
                v102 = v70;
                if (-[IDSPhoneUser isDefaultUser](v61, "isDefaultUser")) {
                  v71 = @"YES";
                }
                else {
                  v71 = @"NO";
                }
                v101 = v71;
                v117 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString countryCode](v43, "countryCode"));
                uint64_t v72 = objc_claimAutoreleasedReturnValue(-[IDSPhoneUser countryCode](v61, "countryCode"));
                v73 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString networkCode](v43, "networkCode"));
                uint64_t v74 = objc_claimAutoreleasedReturnValue(-[IDSPhoneUser networkCode](v61, "networkCode"));
                *(_DWORD *)buf = 138413570;
                v135 = v102;
                __int16 v136 = 2112;
                v137 = v101;
                __int16 v138 = 2112;
                v139 = v117;
                __int16 v140 = 2112;
                uint64_t v141 = v72;
                v75 = (void *)v72;
                __int16 v142 = 2112;
                v143 = v73;
                __int16 v144 = 2112;
                uint64_t v145 = v74;
                v76 = (void *)v74;
                _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Recognized SIM property change {currentUser.defaultUser: %@, newUser.defaultUser: %@, currentUser.mcc: %@, newUser.mcc: %@, currentUser.mnc: %@, newUser.mnc: %@}",  buf,  0x3Eu);

                v9 = v113;
              }

              -[__CFString removeObject:](v9, "removeObject:", v43);
              -[__CFString addObject:](v9, "addObject:", v61);
LABEL_57:

              v54 = v108;
LABEL_58:

              goto LABEL_59;
            }

- (void)selectedSubscriptionLabelDidChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001FEBF4;
  v3[3] = &unk_1008F6010;
  v3[4] = self;
  im_dispatch_after_primary_queue(v3, 1.0);
}

- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5
{
  id v6 = a4;
  if (![v6 realm])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
    [v5 clearConsentDenialsForPhoneUser:v6];
  }
}

- (void)SIMInformationDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1001FED24;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  im_dispatch_after_primary_queue(v2, 1.0);
}

- (void)_setupForCurrentSubscriptionState
{
}

- (void)_checkRegistrationStatus
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMPhoneUserSynchronizer lockdownManager](self, "lockdownManager"));
  unsigned __int8 v4 = [v3 isActivated];

  if ((v4 & 1) != 0)
  {
    if (+[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration"))
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v6 = "****** Device is not configured yet, bailing";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }

    else
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      unsigned int v8 = [v7 requiresKeychainMigration];

      if (v8)
      {
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v6 = "****** Under first lock and keychain upgrade pending, bailing";
          goto LABEL_10;
        }
      }

      else
      {
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSUserStore usersWithRealm:](self->_userStore, "usersWithRealm:", 0LL));
        id v9 = -[os_log_s count](v5, "count");
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v11)
          {
            *(_DWORD *)buf = 138412290;
            v41 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "** Found Tracked Phone Number users: %@",  buf,  0xCu);
          }

          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          uint64_t v33 = v5;
          id obj = v5;
          id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v36;
            do
            {
              for (i = 0LL; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v36 != v14) {
                  objc_enumerationMutation(obj);
                }
                int v16 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
                id v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "phoneNumber", v33));
                uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 phoneBookNumber]);
                v19 = (void *)v18;
                if (v17) {
                  BOOL v20 = 1;
                }
                else {
                  BOOL v20 = v18 == 0;
                }
                if (!v20)
                {
                  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUserStore authenticationCertificateForUser:]( self->_userStore,  "authenticationCertificateForUser:",  v16));

                  if (v21)
                  {
                    userStore = self->_userStore;
                    v23 = (void *)objc_claimAutoreleasedReturnValue([v16 phoneUserWithUpdatedPhoneNumber:v19]);
                    -[IDSUserStore updateUser:](userStore, "updateUser:", v23);

                    id v17 = v19;
                  }

                  else
                  {
                    id v17 = 0LL;
                  }
                }

                int v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMPhoneUserSynchronizer cachedIsSameSIM](self, "cachedIsSameSIM"));
                int v25 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
                __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v25]);

                if (!v26 || ([v26 BOOLValue] & 1) == 0)
                {
                  CTAdapter = self->_CTAdapter;
                  id v28 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
                  LODWORD(CTAdapter) = -[IDSCTAdapter isPNRNumber:andPhoneBookNumber:differentEnoughFromSIMIdentifier:toReregisterWithNewNumber:]( CTAdapter,  "isPNRNumber:andPhoneBookNumber:differentEnoughFromSIMIdentifier:t oReregisterWithNewNumber:",  v17,  v19,  v28,  0LL);

                  if ((_DWORD)CTAdapter)
                  {
                    objc_super v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "** Dispatching request to re-register via SMS",  buf,  2u);
                    }

                    v30 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
                    id v31 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
                    [v30 setPNRReason:3 forUserUniqueIdentifier:v31];

                    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPACStateTracker sharedInstance]( &OBJC_CLASS___IDSPACStateTracker,  "sharedInstance"));
                    [v32 notePhoneAuthCertLost:8];

                    -[IDSUserStore setAuthenticationCertificate:forUser:]( self->_userStore,  "setAuthenticationCertificate:forUser:",  0LL,  v16);
                  }
                }
              }

              id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
            }

            while (v13);
          }

          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
          -[os_log_s checkHeartbeat](v10, "checkHeartbeat");
          id v5 = v33;
        }

        else if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "** Found no tracked Phone Number registration",  buf,  2u);
        }
      }
    }
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "****** Device isn't in a state that can register right now, bailing";
      goto LABEL_10;
    }
  }
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMPhoneUserSynchronizer pairingManager](self, "pairingManager"));
  unsigned int v6 = [v5 isCurrentDeviceTinkerConfiguredWatch];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyPairingType]);
  id v8 = [v7 integerValue];

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 && v8 == (id)1)
  {
    if (v10)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "IDSSIMPhoneUserSynchronizer received an update to the paired tinker device",  (uint8_t *)v11,  2u);
    }

    -[IDSUserStore reloadUsersForRealm:](self->_userStore, "reloadUsersForRealm:", 0LL);
  }

  else
  {
    if (v10)
    {
      v11[0] = 67109376;
      v11[1] = v6;
      __int16 v12 = 2048;
      id v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "IDSSimPhoneUserSynchronizer does not support non-tinker devices. isTinkerConfiguredWatch: %d pairingType: %ld",  (uint8_t *)v11,  0x12u);
    }
  }

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSCTAdapter)CTAdapter
{
  return self->_CTAdapter;
}

- (void)setCTAdapter:(id)a3
{
}

- (IMLockdownManager)lockdownManager
{
  return self->_lockdownManager;
}

- (void)setLockdownManager:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (void)setRegistrationController:(id)a3
{
}

- (FTUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setUserConfiguration:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (NSMutableDictionary)cachedIsSameSIM
{
  return self->_cachedIsSameSIM;
}

- (void)setCachedIsSameSIM:(id)a3
{
}

- (void).cxx_destruct
{
}

@end