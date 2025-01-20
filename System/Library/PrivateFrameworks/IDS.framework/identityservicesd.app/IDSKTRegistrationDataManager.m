@interface IDSKTRegistrationDataManager
- (BOOL)_isKTRegistrationData:(id)a3 forServiceIndex:(unsigned __int16)a4 inTrustedDevices:(id)a5;
- (BOOL)doesSignatureDSID:(id)a3 matchAccountDSID:(id)a4;
- (BOOL)handleTransparencySignatureResponse:(id)a3 error:(id)a4;
- (BOOL)hasReportedManateeBuddyTime;
- (BOOL)hasReportediCloudBuddyTime;
- (BOOL)hasReportediCloudManateeTime;
- (BOOL)hasUnregisteredKTData;
- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3;
- (BOOL)notePublicIdentityDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4;
- (BOOL)registrationNeedKTDataUpdated;
- (BOOL)requestGenerationOfUnregisteredKTRegDataWithPublicIdentityData:(id)a3 applicationKeyManager:(id)a4;
- (BOOL)serializeAndPersistKTDatasDeleteIfNull:(BOOL)a3;
- (IDSKTRegistrationDataManager)initWithIdentityDataSource:(id)a3 transparencyDaemon:(id)a4;
- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource;
- (NSDate)buddyFinishDate;
- (NSDate)iCloudSignInDate;
- (NSDate)manateeAvailableDate;
- (NSMutableDictionary)serviceIndexToKTRegDataConfigs;
- (TransparencyDaemon)transparencyDaemon;
- (id)_createKTTrustedDeviceForKVSisRegistered:(BOOL)a3;
- (id)_ktApplicationForKTRegistrationIndex:(unsigned __int16)a3;
- (id)accountController;
- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 withError:(id *)a5;
- (id)createKTRegistrationDataForServiceTypes:(id)a3 usingPublicIdentityData:(id)a4 withApplicationKeyManager:(id)a5;
- (id)createRegistrationStatusProvider;
- (id)keyManager;
- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3;
- (id)ktVerifier;
- (id)serviceController;
- (id)systemMonitor;
- (unsigned)_ktRegistrationDataIndexForKTApplication:(id)a3;
- (void)clearKTDatas;
- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 applicationKeyManager:(id)a5 withCompletion:(id)a6;
- (void)loadKTRegistrationDatasWithShouldGenerateKTData:(BOOL *)a3;
- (void)logIDSKTRegMetrics:(id)a3 expectedRegisteredData:(id)a4 forKeyIndex:(unsigned __int16)a5;
- (void)logKTRegistrationTimeMetricsForLatestRegisteredKTData:(id)a3 lastRegisteredKTData:(id)a4 forKeyIndex:(unsigned __int16)a5;
- (void)noteBuddyFinishTime;
- (void)noteManateeAvailableTime;
- (void)noteSuccessfulKVSSyncOfTrustedDevices:(id)a3;
- (void)noteiCloudSignInTime;
- (void)scheduleNextKVSSync;
- (void)setBuddyFinishDate:(id)a3;
- (void)setHasReportedManateeBuddyTime:(BOOL)a3;
- (void)setHasReportediCloudBuddyTime:(BOOL)a3;
- (void)setHasReportediCloudManateeTime:(BOOL)a3;
- (void)setICloudSignInDate:(id)a3;
- (void)setIdentityDataSource:(id)a3;
- (void)setManateeAvailableDate:(id)a3;
- (void)setServiceIndexToKTRegDataConfigs:(id)a3;
- (void)setTransparencyDaemon:(id)a3;
- (void)updateKVSWithCurrentKTRegistrationData;
@end

@implementation IDSKTRegistrationDataManager

- (IDSKTRegistrationDataManager)initWithIdentityDataSource:(id)a3 transparencyDaemon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSKTRegistrationDataManager;
  v9 = -[IDSKTRegistrationDataManager init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityDataSource, a3);
    objc_storeStrong((id *)&v10->_transparencyDaemon, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    serviceIndexToKTRegDataConfigs = v10->_serviceIndexToKTRegDataConfigs;
    v10->_serviceIndexToKTRegDataConfigs = v11;

    iCloudSignInDate = v10->_iCloudSignInDate;
    v10->_iCloudSignInDate = 0LL;

    buddyFinishDate = v10->_buddyFinishDate;
    v10->_buddyFinishDate = 0LL;

    manateeAvailableDate = v10->_manateeAvailableDate;
    v10->_manateeAvailableDate = 0LL;

    *(_WORD *)&v10->_hasReportediCloudBuddyTime = 0;
    v10->_hasReportedManateeBuddyTime = 0;
  }

  return v10;
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance");
}

- (id)ktVerifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance](&OBJC_CLASS___IDSKeyTransparencyVerifier, "sharedInstance");
}

- (id)keyManager
{
  return +[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance");
}

- (id)accountController
{
  return +[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance");
}

- (id)systemMonitor
{
  return +[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance");
}

- (void)clearKTDatas
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing KT Registration Data.", v9, 2u);
  }

  -[NSMutableDictionary removeAllObjects](self->_serviceIndexToKTRegDataConfigs, "removeAllObjects");
  int v4 = 0;
  do
  {
    v5 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationDataConfig);
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    unsigned int v7 = (unsigned __int16)v4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "setObject:forKeyedSubscript:",  v5,  v8);

    ++v4;
  }

  while (v7 < 3);
  -[IDSKTRegistrationDataManager serializeAndPersistKTDatasDeleteIfNull:]( self,  "serializeAndPersistKTDatasDeleteIfNull:",  1LL);
}

- (BOOL)hasUnregisteredKTData
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking for unregisterd KT Data.", buf, 2u);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager serviceIndexToKTRegDataConfigs]( self,  "serviceIndexToKTRegDataConfigs",  0LL));
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unregisteredKTData]);

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v9));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 unregisteredKTData]);

          uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 ktDataForRegistration]);
          if (v14)
          {
            v15 = (void *)v14;
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 ktPublicAccountKey]);
            if (v16)
            {
              objc_super v17 = (void *)v16;
              v18 = (void *)objc_claimAutoreleasedReturnValue([v13 ktDataSignature]);

              if (v18)
              {
                v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v28 = v9;
                  __int16 v29 = 2112;
                  v30 = v13;
                  _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Found unregistered KT Data for keyIndex. { keyIndex: %@, ktRegistrationData: %@ }",  buf,  0x16u);
                }

                BOOL v19 = 1;
                goto LABEL_23;
              }
            }

            else
            {
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Did not find any unregistered KT Data.",  buf,  2u);
  }

  BOOL v19 = 0;
LABEL_23:

  return v19;
}

- (BOOL)registrationNeedKTDataUpdated
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Checking if we need to reregister to update KT data.",  buf,  2u);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceIndexToKTRegDataConfigs](self, "serviceIndexToKTRegDataConfigs"));
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    __int128 v24 = v4;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unregisteredKTData]);

        v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v9));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 registeredKTData]);

        if (v11)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 ktPublicAccountKey]);
          if (v14)
          {
            v15 = (void *)v14;
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 ktDataSignature]);

            if (v16)
            {
              if (!v13) {
                goto LABEL_19;
              }
              uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 ktPublicAccountKey]);
              if (!v17) {
                goto LABEL_19;
              }
              v18 = (void *)v17;
              BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v13 ktPublicAccountKey]);
              v20 = (void *)objc_claimAutoreleasedReturnValue([v11 ktPublicAccountKey]);
              if (([v19 isEqualToData:v20] & 1) == 0)
              {

                int v4 = v24;
LABEL_19:

                BOOL v22 = 1;
                goto LABEL_20;
              }

              v21 = (void *)objc_claimAutoreleasedReturnValue([v13 ktDataSignature]);

              int v4 = v24;
              if (!v21) {
                goto LABEL_19;
              }
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 isRegistered:(BOOL)a4 withError:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency", a3, a4, a5));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    if (v5) {
      uint64_t v9 = @"YES";
    }
    v38[0] = 67109378;
    v38[1] = v6;
    __int16 v39 = 2112;
    v40 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Requesting copy of KTRegistrationData for keyIndex { keyIndex: %u, isRegistered: %@ }",  (uint8_t *)v38,  0x12u);
  }

  serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
  p_serviceIndexToKTRegDataConfigs = &self->_serviceIndexToKTRegDataConfigs;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v12));

  if (!v13)
  {
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1006A8AD0(v6, p_serviceIndexToKTRegDataConfigs, v26);
    }
    goto LABEL_18;
  }

  if (!v5)
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v13 unregisteredKTData]);

    if (v27)
    {
      v15 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationData);
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v13 unregisteredKTData]);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 ktDataForRegistration]);
      id v30 = [v29 copy];
      -[IDSKTRegistrationData setKtDataForRegistration:](v15, "setKtDataForRegistration:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue([v13 unregisteredKTData]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 ktPublicAccountKey]);
      id v33 = [v32 copy];
      -[IDSKTRegistrationData setKtPublicAccountKey:](v15, "setKtPublicAccountKey:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue([v13 unregisteredKTData]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 ktDataSignature]);
      id v36 = [v35 copy];
      -[IDSKTRegistrationData setKtDataSignature:](v15, "setKtDataSignature:", v36);

      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 unregisteredKTData]);
      goto LABEL_13;
    }

    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1006A8BA8();
    }
LABEL_18:
    v15 = 0LL;
    goto LABEL_19;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 registeredKTData]);

  if (!v14)
  {
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1006A8B48();
    }
    goto LABEL_18;
  }

  v15 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationData);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 registeredKTData]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 ktDataForRegistration]);
  id v18 = [v17 copy];
  -[IDSKTRegistrationData setKtDataForRegistration:](v15, "setKtDataForRegistration:", v18);

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v13 registeredKTData]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 ktPublicAccountKey]);
  id v21 = [v20 copy];
  -[IDSKTRegistrationData setKtPublicAccountKey:](v15, "setKtPublicAccountKey:", v21);

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v13 registeredKTData]);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 ktDataSignature]);
  id v24 = [v23 copy];
  -[IDSKTRegistrationData setKtDataSignature:](v15, "setKtDataSignature:", v24);

  __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 registeredKTData]);
LABEL_13:
  __int128 v26 = v25;
  -[IDSKTRegistrationData setUploadedToKVS:](v15, "setUploadedToKVS:", -[os_log_s uploadedToKVS](v25, "uploadedToKVS"));
LABEL_19:

  return v15;
}

- (void)loadKTRegistrationDatasWithShouldGenerateKTData:(BOOL *)a3
{
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Trying to load KT Registration Data from keychain.",  buf,  2u);
  }

  int v5 = 0;
  char v34 = 0;
  v35 = self;
  do
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationDataConfig);
    identityDataSource = self->_identityDataSource;
    id v39 = 0LL;
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource loadKTRegistrationDataForKeyIndex:isRegistered:error:]( identityDataSource,  "loadKTRegistrationDataForKeyIndex:isRegistered:error:",  (unsigned __int16)v5,  0LL,  &v39));
    id v9 = v39;
    v10 = v9;
    if (v8) {
      BOOL v11 = v9 == 0LL;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v41 = v5;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No unregistered KT data stored in keychain for keyIndex. { keyIndex: %u, error: %@ }",  buf,  0x12u);
      }
    }

    v13 = self->_identityDataSource;
    id v38 = 0LL;
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManagerIdentityDataSource loadKTRegistrationDataForKeyIndex:isRegistered:error:]( v13,  "loadKTRegistrationDataForKeyIndex:isRegistered:error:",  (unsigned __int16)v5,  1LL,  &v38));
    id v15 = v38;
    uint64_t v16 = v15;
    if (v14 && !v15)
    {
      if (v8)
      {
        BOOL v17 = 1;
        goto LABEL_19;
      }

      goto LABEL_32;
    }

    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v41 = v5;
      __int16 v42 = 2112;
      id v43 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No registered KT data stored in keychain for keyIndex. { keyIndex: %u, error: %@ }",  buf,  0x12u);
    }

    BOOL v17 = v14 != 0;
    if (v8 | v14)
    {
      if (v8)
      {
LABEL_19:
        BOOL v19 = objc_alloc(&OBJC_CLASS___IDSKTRegistrationData);
        id v37 = 0LL;
        v20 = -[IDSKTRegistrationData initWithDataRepresentation:error:]( v19,  "initWithDataRepresentation:error:",  v8,  &v37);
        id v21 = v37;
        BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        __int128 v23 = v22;
        if (v20)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v41 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Successfully deserialized unregistered KT Data from keychain for keyIndex, saving to config. { keyIndex: %u }",  buf,  8u);
          }

          -[IDSKTRegistrationDataConfig setUnregisteredKTData:](v6, "setUnregisteredKTData:", v20);
        }

        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109378;
            int v41 = v5;
            __int16 v42 = 2112;
            id v43 = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to deserialize unregisterd KT Data from keychain for keyIndex, need to generate new KT Data. { keyI ndex: %u, error: %@ }",  buf,  0x12u);
          }

          char v34 = 1;
        }

        if (!v17) {
          goto LABEL_40;
        }
        goto LABEL_32;
      }

      if (!v14)
      {
LABEL_40:
        self = v35;
        serviceIndexToKTRegDataConfigs = v35->_serviceIndexToKTRegDataConfigs;
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v5));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "setObject:forKeyedSubscript:",  v6,  v26);
        goto LABEL_41;
      }

- (BOOL)serializeAndPersistKTDatasDeleteIfNull:(BOOL)a3
{
  BOOL v4 = a3;
  int v6 = 0;
  *(void *)&__int128 v3 = 67109120LL;
  __int128 v32 = v3;
  do
  {
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v6,  v32));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKTData]);
    if (v10)
    {
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKTData]);
        *(_DWORD *)buf = 67109378;
        int v40 = v6;
        __int16 v41 = 2112;
        __int16 v42 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Saving registered KT Data for service key { keyIndex: %u, registeredKTData: %@ }",  buf,  0x12u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKTData]);
      id v38 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataRepresentationWithError:&v38]);
      id v15 = v38;

      if (v14)
      {
        identityDataSource = self->_identityDataSource;
        uint64_t v37 = 0LL;
        -[IDSRegistrationKeyManagerIdentityDataSource saveKTRegistrationData:forKeyIndex:isRegistered:error:]( identityDataSource,  "saveKTRegistrationData:forKeyIndex:isRegistered:error:",  v14,  (unsigned __int16)v6,  1LL,  &v37);
      }
    }

    else
    {
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKTData]);

      if (v17) {
        BOOL v18 = 1;
      }
      else {
        BOOL v18 = !v4;
      }
      if (!v18)
      {
        BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v32;
          int v40 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Removing registered KT Data from keychain because deleteIfNull == YES and no registered config present, {keyIndex: %u}",  buf,  8u);
        }

        v20 = self->_identityDataSource;
        uint64_t v36 = 0LL;
        -[IDSRegistrationKeyManagerIdentityDataSource removeKTRegistrationDataForKeyIndex:isRegistered:error:]( v20,  "removeKTRegistrationDataForKeyIndex:isRegistered:error:",  (unsigned __int16)v6,  1LL,  &v36);
      }
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 unregisteredKTData]);

    if (v21)
    {
      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v9 unregisteredKTData]);
        *(_DWORD *)buf = 67109378;
        int v40 = v6;
        __int16 v41 = 2112;
        __int16 v42 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Saving unregistered KT Data for service key { keyIndex: %u, unregisteredKTData: %@ }",  buf,  0x12u);
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 unregisteredKTData]);
      id v35 = 0LL;
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 dataRepresentationWithError:&v35]);
      id v26 = v35;

      if (v25)
      {
        __int128 v27 = self->_identityDataSource;
        uint64_t v34 = 0LL;
        -[IDSRegistrationKeyManagerIdentityDataSource saveKTRegistrationData:forKeyIndex:isRegistered:error:]( v27,  "saveKTRegistrationData:forKeyIndex:isRegistered:error:",  v25,  (unsigned __int16)v6,  0LL,  &v34);
      }
    }

    else
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v9 unregisteredKTData]);

      if (!v28 && v4)
      {
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v32;
          int v40 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Removing unregistered KT Data from keychain because deleteIfNull == YES and no registered config present, {keyIndex: %u}",  buf,  8u);
        }

        id v30 = self->_identityDataSource;
        uint64_t v33 = 0LL;
        -[IDSRegistrationKeyManagerIdentityDataSource removeKTRegistrationDataForKeyIndex:isRegistered:error:]( v30,  "removeKTRegistrationDataForKeyIndex:isRegistered:error:",  (unsigned __int16)v6,  0LL,  &v33);
      }
    }

    ++v6;
  }

  while (v6 != 4);
  return 1;
}

- (BOOL)notePublicIdentityDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4
{
  uint64_t v5 = a4;
  id v7 = a3;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataForRegistration]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 ktPublicAccountKey]);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataSignature]);
    *(_DWORD *)buf = 67109890;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v9;
    __int16 v79 = 2112;
    v80 = v10;
    __int16 v81 = 2112;
    v82 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "KT registration manager noting registration of data { keyIndex: %u, ktDataForRegistration: %@, ktPublicAccountKey: %@, ktDataSignature: %@ }",  buf,  0x26u);
  }

  serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v5));
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v12));

  if (!v13)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1006A8C08();
    }
    goto LABEL_48;
  }

  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 unregisteredKTData]);
  if (!v14)
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1006A8CC8();
    }

    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 registeredKTData]);
    if (!v14)
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1006A8C68();
      }
      goto LABEL_48;
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s registeredTime](v14, "registeredTime"));

  if (!v16)
  {
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[os_log_s setRegisteredTime:](v14, "setRegisteredTime:", v17);
  }

  if ((_DWORD)v5 == 1) {
    -[IDSKTRegistrationDataManager logIDSKTRegMetrics:expectedRegisteredData:forKeyIndex:]( self,  "logIDSKTRegMetrics:expectedRegisteredData:forKeyIndex:",  v7,  v14,  1LL);
  }
  v73 = self;
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktDataForRegistration](v14, "ktDataForRegistration"));
  if (v18 || (BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataForRegistration])) != 0)
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktDataForRegistration](v14, "ktDataForRegistration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataForRegistration]);
    unsigned int v21 = [v19 isEqualToData:v20];

    if (v18)
    {

      if (!v21) {
        goto LABEL_45;
      }
    }

    else
    {

      if ((v21 & 1) == 0) {
        goto LABEL_45;
      }
    }
  }

  BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataForRegistration]);
    *(_DWORD *)buf = 67109378;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Expected KT Data for registration matches what was registered for keyIndex. { keyIndex: %u, expectedKTData: %@ }",  buf,  0x12u);
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktPublicAccountKey](v14, "ktPublicAccountKey"));
  if (v23 || (BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 ktPublicAccountKey])) != 0)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktPublicAccountKey](v14, "ktPublicAccountKey"));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 ktPublicAccountKey]);
    unsigned int v26 = [v24 isEqualToData:v25];

    if (v23)
    {

      if (!v26) {
        goto LABEL_45;
      }
    }

    else
    {

      if ((v26 & 1) == 0) {
        goto LABEL_45;
      }
    }
  }

  __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktPublicAccountKey](v14, "ktPublicAccountKey"));
    *(_DWORD *)buf = 67109378;
    int v76 = v5;
    __int16 v77 = 2112;
    v78 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Expected KT public account key for registrations matches what we registered for keyIndex. { keyIndex: %u, expected KTPublicAccountKey: %@ }",  buf,  0x12u);
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktDataSignature](v14, "ktDataSignature"));
  if (v28 || (BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataSignature])) != 0)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktDataSignature](v14, "ktDataSignature"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataSignature]);
    unsigned int v31 = [v29 isEqualToData:v30];

    if (v28)
    {

      if (v31) {
        goto LABEL_34;
      }
LABEL_45:
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktDataForRegistration](v14, "ktDataForRegistration"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktPublicAccountKey](v14, "ktPublicAccountKey"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ktDataSignature](v14, "ktDataSignature"));
        v74 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataForRegistration]);
        v53 = (void *)objc_claimAutoreleasedReturnValue([v7 ktPublicAccountKey]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataSignature]);
        *(_DWORD *)buf = 67110658;
        int v76 = v5;
        __int16 v77 = 2112;
        v78 = v50;
        __int16 v79 = 2112;
        v80 = v51;
        __int16 v81 = 2112;
        v82 = v52;
        __int16 v83 = 2112;
        v84 = v74;
        __int16 v85 = 2112;
        v86 = v53;
        __int16 v87 = 2112;
        v88 = v54;
        _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Completed registration does not match unregistered KT Data for key index { keyIndex: %u, expectedKTDataForRegi stration: %@, expectedKTPublicAccountKey: %@, expectedKTDataSignature: %@, regKTDataForRegistration: %@, regKT PublicAccountKey: %@, regKTDataSignature: %@ }",  buf,  0x44u);
      }

LABEL_48:
      BOOL v48 = 0;
      goto LABEL_49;
    }

    if ((v31 & 1) == 0) {
      goto LABEL_45;
    }
  }

- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking if we have unregistered KT Data that is ready to register.",  (uint8_t *)v22,  2u);
  }

  serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 unregisteredKTData]);
  if (v9)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 unregisteredKTData]);
      v22[0] = 67109378;
      v22[1] = v3;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Found key index has unregistered KT Data { keyIndex: %u, unregisteredKTData: %@ }",  (uint8_t *)v22,  0x12u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 unregisteredKTData]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 ktDataForRegistration]);
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 unregisteredKTData]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 ktPublicAccountKey]);
      if (v16)
      {
        BOOL v17 = (void *)v16;
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v8 unregisteredKTData]);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 ktDataSignature]);

        if (v19)
        {
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v22[0]) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Unregistered KT Data has necessary fields to register.",  (uint8_t *)v22,  2u);
          }

          LOBYTE(v9) = 1;
LABEL_17:

          goto LABEL_18;
        }

- (id)createKTRegistrationDataForServiceTypes:(id)a3 usingPublicIdentityData:(id)a4 withApplicationKeyManager:(id)a5
{
  id v81 = a3;
  id v76 = a4;
  id v8 = a5;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v100 = v76;
    *(_WORD *)&v100[8] = 2112;
    *(void *)&v100[10] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Creating KT Registration Data objects without async enrollment. {publicIdentity: %@, applicationKeyManager: %@}",  buf,  0x16u);
  }

  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v81 allKeys]);
  id v11 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v96;
    *(void *)&__int128 v12 = 138412290LL;
    __int128 v71 = v12;
    id v15 = (void **)&IMInsertBoolsToXPCDictionary_ptr;
    id v84 = v8;
    v74 = v10;
    v75 = self;
    uint64_t v73 = *(void *)v96;
    do
    {
      uint64_t v16 = 0LL;
      id v77 = v13;
      do
      {
        if (*(void *)v96 != v14) {
          objc_enumerationMutation(obj);
        }
        key = *(void **)(*((void *)&v95 + 1) + 8LL * (void)v16);
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKeyedSubscript:v71]);
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](self, "serviceController"));
        v82 = v17;
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceIdentifier]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceWithIdentifier:v19]);

        unsigned int v21 = v20;
        if ([v20 adHocServiceType])
        {
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](self, "serviceController"));
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "primaryServiceForAdhocServiceType:", objc_msgSend(v20, "adHocServiceType")));
        }

        if ((-[NSMutableSet containsObject:](v10, "containsObject:", key) & 1) != 0)
        {
          __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
            *(_DWORD *)buf = v71;
            *(void *)v100 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Top level service already has relevant KT Data setup. { service: %@ }",  buf,  0xCu);
          }

          goto LABEL_41;
        }

        v80 = v16;
        __int128 v25 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData);
        unsigned int v26 = v21;
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v76 publicNGMIdentityData]);
        -[IDSProtoKeyTransparencyLoggableData setNgmPublicIdentity:](v25, "setNgmPublicIdentity:", v27);

        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v76 NGMVersion]);
        -[IDSProtoKeyTransparencyLoggableData setNgmVersion:]( v25,  "setNgmVersion:",  [v28 unsignedIntValue]);

        uint64_t v34 = _IDSKeyTransparencyVersionNumber(v29, v30, v31, v32, v33);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        __int16 v85 = v25;
        -[IDSProtoKeyTransparencyLoggableData setKtVersion:]( v25,  "setKtVersion:",  [v35 unsignedIntValue]);

        uint64_t v36 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        uint64_t v37 = self;
        id v38 = v36;
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](v37, "serviceController"));
        int v40 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
        __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v39 adHocServicesForIdentifier:v40]);
        __int16 v79 = v26;
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 arrayByAddingObject:v26]);

        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        id v43 = v42;
        id v44 = [v43 countByEnumeratingWithState:&v91 objects:v101 count:16];
        if (!v44) {
          goto LABEL_38;
        }
        id v45 = v44;
        uint64_t v46 = *(void *)v92;
        v86 = v38;
        id v87 = v43;
        do
        {
          v47 = 0LL;
          do
          {
            if (*(void *)v92 != v46) {
              objc_enumerationMutation(v43);
            }
            BOOL v48 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)v47);
            if ([v48 applicationKeyIndex])
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15[501],  "numberWithUnsignedShort:",  objc_msgSend(v48, "applicationKeyIndex")));
              unsigned __int8 v50 = -[NSMutableSet containsObject:](v38, "containsObject:", v49);

              if ((v50 & 1) == 0)
              {
                id v51 = [v48 applicationKeyIndex];
                id v90 = 0LL;
                v52 = (__SecKey *)[v8 copyPublicIdentityDataToRegisterForKeyIndex:v51 withError:&v90];
                id v53 = v90;
                v54 = v53;
                if (v52)
                {
                  id v88 = v53;
                  CFErrorRef error = 0LL;
                  uint64_t v55 = v15;
                  CFDataRef v56 = SecKeyCopyExternalRepresentation(v52, &error);
                  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                  v58 = v57;
                  if (v56)
                  {
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v59 = [v48 applicationKeyIndex];
                      v60 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v100 = v59;
                      id v8 = v84;
                      *(_WORD *)&v100[4] = 2112;
                      *(void *)&v100[6] = v60;
                      _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Adding application key %u to kt-loggable-data for service: %@",  buf,  0x12u);
                    }

                    v58 = objc_alloc_init(&OBJC_CLASS___IDSProtoApplicationKeyEntry);
                    -[os_log_s setKeyIndex:]( v58,  "setKeyIndex:",  sub_1002E08A0((int)[v48 applicationKeyIndex]));
                    -[os_log_s setPublicIdentity:](v58, "setPublicIdentity:", v56);

                    -[IDSProtoKeyTransparencyLoggableData addApplicationPublicIdentity:]( v85,  "addApplicationPublicIdentity:",  v58);
                    id v15 = v55;
                    v61 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v55[501],  "numberWithUnsignedShort:",  objc_msgSend(v48, "applicationKeyIndex")));
                    id v38 = v86;
                    -[NSMutableSet addObject:](v86, "addObject:", v61);
LABEL_25:
                  }

                  else
                  {
                    id v15 = v55;
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    {
                      unsigned int v65 = [v48 applicationKeyIndex];
                      CFErrorRef v66 = error;
                      v61 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)v100 = v65;
                      id v38 = v86;
                      *(_WORD *)&v100[4] = 2112;
                      *(void *)&v100[6] = v66;
                      id v8 = v84;
                      *(_WORD *)&v100[14] = 2112;
                      *(void *)&v100[16] = v61;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "Failed to get representation of application key { keyType: %u, error: %@, service: %@ }",  buf,  0x1Cu);
                      goto LABEL_25;
                    }
                  }

                  v54 = v88;

                  CFRelease(v52);
                  if (error) {
                    CFRelease(error);
                  }
                  id v43 = v87;
                }

                else
                {
                  BOOL v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                  {
                    unsigned int v63 = [v48 applicationKeyIndex];
                    v64 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v100 = v63;
                    id v38 = v86;
                    *(_WORD *)&v100[4] = 2112;
                    *(void *)&v100[6] = v64;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "Failed to get service application key { keyType: %u, service: %@ }",  buf,  0x12u);
                  }
                }
              }
            }

            v47 = (char *)v47 + 1;
          }

          while (v45 != v47);
          id v67 = [v43 countByEnumeratingWithState:&v91 objects:v101 count:16];
          id v45 = v67;
        }

        while (v67);
LABEL_38:

        v68 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationData);
        __int16 v23 = (os_log_s *)v85;
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoKeyTransparencyLoggableData data](v85, "data"));
        -[IDSKTRegistrationData setKtDataForRegistration:](v68, "setKtDataForRegistration:", v69);

        v10 = v74;
        if (v68) {
          CFDictionarySetValue((CFMutableDictionaryRef)theDict, key, v68);
        }
        -[NSMutableSet addObject:](v74, "addObject:", key);

        self = v75;
        uint64_t v14 = v73;
        id v13 = v77;
        unsigned int v21 = v79;
        uint64_t v16 = v80;
LABEL_41:

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v16 != v13);
      id v13 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
    }

    while (v13);
  }

  return theDict;
}

- (BOOL)requestGenerationOfUnregisteredKTRegDataWithPublicIdentityData:(id)a3 applicationKeyManager:(id)a4
{
  id v85 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Creating request for KT registration data.",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](self, "serviceController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allPrimaryServices]);

  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v101 objects:v110 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v102;
    id v90 = v6;
    __int16 v83 = v10;
    id v84 = self;
    uint64_t v82 = *(void *)v102;
    do
    {
      uint64_t v14 = 0LL;
      id v86 = v12;
      do
      {
        if (*(void *)v102 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)v14);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v15 ktRegistrationDataIndex]));
        unsigned __int8 v17 = -[NSMutableSet containsObject:](v10, "containsObject:", v16);

        if ((v17 & 1) != 0)
        {
          BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
            *(_DWORD *)buf = 138412290;
            *(void *)v106 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Top level service already has relevant KT Data setup. { service: %@ }",  buf,  0xCu);
          }
        }

        else
        {
          id v88 = v14;
          v20 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData);
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v85 publicNGMIdentityData]);
          -[IDSProtoKeyTransparencyLoggableData setNgmPublicIdentity:](v20, "setNgmPublicIdentity:", v21);

          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v85 NGMVersion]);
          -[IDSProtoKeyTransparencyLoggableData setNgmVersion:]( v20,  "setNgmVersion:",  [v22 unsignedIntValue]);

          uint64_t v28 = _IDSKeyTransparencyVersionNumber(v23, v24, v25, v26, v27);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          __int128 v91 = v20;
          -[IDSProtoKeyTransparencyLoggableData setKtVersion:]( v20,  "setKtVersion:",  [v29 unsignedIntValue]);

          uint64_t v30 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](self, "serviceController"));
          uint64_t v32 = v15;
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v31 adHocServicesForIdentifier:v33]);
          v89 = v32;
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 arrayByAddingObject:v32]);

          __int128 v99 = 0u;
          __int128 v100 = 0u;
          __int128 v97 = 0u;
          __int128 v98 = 0u;
          id v93 = v35;
          id v36 = [v93 countByEnumeratingWithState:&v97 objects:v109 count:16];
          uint64_t v37 = &IMInsertBoolsToXPCDictionary_ptr;
          __int128 v92 = v30;
          if (v36)
          {
            id v38 = v36;
            uint64_t v39 = *(void *)v98;
            do
            {
              for (i = 0LL; i != v38; i = (char *)i + 1)
              {
                if (*(void *)v98 != v39) {
                  objc_enumerationMutation(v93);
                }
                __int16 v41 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)i);
                if ([v41 applicationKeyIndex])
                {
                  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v37[501],  "numberWithUnsignedShort:",  objc_msgSend(v41, "applicationKeyIndex")));
                  unsigned __int8 v43 = -[NSMutableSet containsObject:](v30, "containsObject:", v42);

                  if ((v43 & 1) == 0)
                  {
                    id v44 = [v41 applicationKeyIndex];
                    id v96 = 0LL;
                    id v45 = (__SecKey *)[v6 copyPublicIdentityDataToRegisterForKeyIndex:v44 withError:&v96];
                    id v46 = v96;
                    if (v45)
                    {
                      CFErrorRef error = 0LL;
                      CFDataRef v47 = SecKeyCopyExternalRepresentation(v45, &error);
                      BOOL v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                      v49 = v48;
                      if (v47)
                      {
                        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                        {
                          unsigned int v50 = [v41 applicationKeyIndex];
                          id v51 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v106 = v50;
                          id v6 = v90;
                          *(_WORD *)&v106[4] = 2112;
                          *(void *)&v106[6] = v51;
                          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Adding application key %u to kt-loggable-data for service: %@",  buf,  0x12u);
                        }

                        v49 = objc_alloc_init(&OBJC_CLASS___IDSProtoApplicationKeyEntry);
                        -[os_log_s setKeyIndex:]( v49,  "setKeyIndex:",  sub_1002E08A0((int)[v41 applicationKeyIndex]));
                        -[os_log_s setPublicIdentity:](v49, "setPublicIdentity:", v47);

                        -[IDSProtoKeyTransparencyLoggableData addApplicationPublicIdentity:]( v91,  "addApplicationPublicIdentity:",  v49);
                        uint64_t v37 = &IMInsertBoolsToXPCDictionary_ptr;
                        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v41 applicationKeyIndex]));
                        -[NSMutableSet addObject:](v92, "addObject:", v52);
                      }

                      else
                      {
                        uint64_t v37 = &IMInsertBoolsToXPCDictionary_ptr;
                        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                        {
                          unsigned int v56 = [v41 applicationKeyIndex];
                          CFErrorRef v57 = error;
                          v58 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);
                          *(_DWORD *)buf = 67109634;
                          *(_DWORD *)v106 = v56;
                          *(_WORD *)&v106[4] = 2112;
                          *(void *)&v106[6] = v57;
                          id v6 = v90;
                          __int16 v107 = 2112;
                          v108 = v58;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Failed to get representation of application key { keyType: %u, error: %@, service: %@ }",  buf,  0x1Cu);
                        }
                      }

                      CFRelease(v45);
                      if (error) {
                        CFRelease(error);
                      }
                      uint64_t v30 = v92;
                    }

                    else
                    {
                      id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v54 = [v41 applicationKeyIndex];
                        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v106 = v54;
                        uint64_t v30 = v92;
                        *(_WORD *)&v106[4] = 2112;
                        *(void *)&v106[6] = v55;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Failed to get service application key { keyType: %u, service: %@ }",  buf,  0x12u);
                      }
                    }
                  }
                }
              }

              id v38 = [v93 countByEnumeratingWithState:&v97 objects:v109 count:16];
            }

            while (v38);
          }

          unsigned int v59 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationData);
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtoKeyTransparencyLoggableData data](v91, "data"));
          -[IDSKTRegistrationData setKtDataForRegistration:](v59, "setKtDataForRegistration:", v60);

          v61 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager _ktApplicationForKTRegistrationIndex:]( v84,  "_ktApplicationForKTRegistrationIndex:",  [v89 ktRegistrationDataIndex]));
          if (v61
            && (BOOL v62 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationData ktDataForRegistration](v59, "ktDataForRegistration")),
                v62,
                v62))
          {
            id v63 = objc_alloc(&OBJC_CLASS___TransparencyIDSRegistrationRequestData);
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationData ktDataForRegistration](v59, "ktDataForRegistration"));
            id v65 = [v63 initWithApplication:v61 registrationData:v64];

            CFErrorRef v66 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
            id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 pushToken]);
            [v65 setPushToken:v67];

            id v6 = v90;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v81, "setObject:forKeyedSubscript:", v65, v61);
            v10 = v83;
            uint64_t v14 = v88;
          }

          else
          {
            id v65 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            v10 = v83;
            uint64_t v14 = v88;
            if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
            {
              unsigned int v72 = [v89 ktRegistrationDataIndex];
              uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationData ktDataForRegistration](v59, "ktDataForRegistration"));
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v106 = v72;
              *(_WORD *)&v106[4] = 2112;
              *(void *)&v106[6] = v73;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v65,  OS_LOG_TYPE_ERROR,  "No KT Application found for key index or registration data is null. { keyIndex: %u, ktRegistrationData: %@ }",  buf,  0x12u);

              id v6 = v90;
            }
          }

          serviceIndexToKTRegDataConfigs = v84->_serviceIndexToKTRegDataConfigs;
          v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v89 ktRegistrationDataIndex]));
          BOOL v70 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v69));

          [v70 setUnregisteredKTData:v59];
          self = v84;
          __int128 v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v89 ktRegistrationDataIndex]));
          -[NSMutableSet addObject:](v10, "addObject:", v71);

          id v12 = v86;
          BOOL v18 = (os_log_s *)v91;
          uint64_t v13 = v82;
        }

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v101 objects:v110 count:16];
    }

    while (v12);
  }

  BOOL v74 = +[IMUserDefaults shouldDropKTAccountKeySignatureRequestOnLaunch]( &OBJC_CLASS___IMUserDefaults,  "shouldDropKTAccountKeySignatureRequestOnLaunch");
  if (v74 && CUTIsInternalInstall(v74, v75))
  {
    id v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "Default is set to drop account key signature generation request. This is not the path that's hit during registration.",  buf,  2u);
    }

    -[NSMutableDictionary removeAllObjects](v81, "removeAllObjects");
  }

  if (!+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "isKeyTransparencyEnabled"))
  {
    id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }

    -[NSMutableDictionary removeAllObjects](v81, "removeAllObjects");
  }

  if (-[NSMutableDictionary count](v81, "count"))
  {
    id v78 = [[TransparencyIDSRegistrationRequest alloc] initWithSignatureRequests:v81];
    [v78 setInitialTimeout:10.0];
    if ((objc_opt_respondsToSelector(v78, "setDontWaitForKeySigning:") & 1) != 0) {
      [v78 setDontWaitForKeySigning:1];
    }
    transparencyDaemon = self->_transparencyDaemon;
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = sub_100395E88;
    v94[3] = &unk_100902A18;
    v94[4] = self;
    -[TransparencyDaemon transparencyGetKTSignatures:complete:]( transparencyDaemon,  "transparencyGetKTSignatures:complete:",  v78,  v94);
  }

  else
  {
    id v78 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR)) {
      sub_1006A8D28();
    }
  }

  return 0;
}

- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 applicationKeyManager:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v107 = a4;
  id v11 = a5;
  id v99 = a6;
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v137 = v107;
    *(_WORD *)&v137[8] = 2112;
    *(void *)&v137[10] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Creating KT Registration Data objects. {publicIdentity: %@, applicationKeyManager: %@}",  buf,  0x16u);
  }

  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v106 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v100 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[IDSKTRegistrationDataManager clearKTDatas](self, "clearKTDatas");
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  id v14 = [obj countByEnumeratingWithState:&v131 objects:v139 count:16];
  v114 = v11;
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v132;
    unsigned __int8 v17 = (void **)&IMInsertBoolsToXPCDictionary_ptr;
    __int128 v104 = self;
    id v105 = v10;
    uint64_t v102 = *(void *)v132;
    __int128 v103 = v13;
    do
    {
      id v18 = 0LL;
      id v108 = v15;
      do
      {
        if (*(void *)v132 != v16) {
          objc_enumerationMutation(obj);
        }
        v112 = (char *)v18;
        BOOL v19 = *(void **)(*((void *)&v131 + 1) + 8LL * (void)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v19]);
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](self, "serviceController"));
        v111 = v20;
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v20 serviceIdentifier]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 serviceWithIdentifier:v22]);

        if ([v23 adHocServiceType])
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](self, "serviceController"));
          uint64_t v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "primaryServiceForAdhocServiceType:", objc_msgSend(v23, "adHocServiceType")));

          v113 = (void *)v25;
        }

        else
        {
          v113 = v23;
        }

        uint64_t v26 = v114;
        if ((-[NSMutableSet containsObject:](v13, "containsObject:", v19) & 1) == 0)
        {
          key = v19;
          uint64_t v30 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v107 publicNGMIdentityData]);
          -[IDSProtoKeyTransparencyLoggableData setNgmPublicIdentity:](v30, "setNgmPublicIdentity:", v31);

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v107 NGMVersion]);
          -[IDSProtoKeyTransparencyLoggableData setNgmVersion:]( v30,  "setNgmVersion:",  [v32 unsignedIntValue]);

          uint64_t v38 = _IDSKeyTransparencyVersionNumber(v33, v34, v35, v36, v37);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v115 = v30;
          -[IDSProtoKeyTransparencyLoggableData setKtVersion:]( v30,  "setKtVersion:",  [v39 unsignedIntValue]);

          int v40 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager serviceController](self, "serviceController"));
          __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v113 identifier]);
          unsigned __int8 v43 = (void *)objc_claimAutoreleasedReturnValue([v41 adHocServicesForIdentifier:v42]);
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 arrayByAddingObject:v113]);

          __int128 v130 = 0u;
          __int128 v128 = 0u;
          __int128 v129 = 0u;
          __int128 v127 = 0u;
          id v45 = v44;
          id v46 = [v45 countByEnumeratingWithState:&v127 objects:v138 count:16];
          v116 = v45;
          if (v46)
          {
            id v47 = v46;
            uint64_t v48 = *(void *)v128;
            v117 = v40;
            do
            {
              v49 = 0LL;
              do
              {
                if (*(void *)v128 != v48) {
                  objc_enumerationMutation(v45);
                }
                unsigned int v50 = *(void **)(*((void *)&v127 + 1) + 8LL * (void)v49);
                if ([v50 applicationKeyIndex])
                {
                  id v51 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17[501],  "numberWithUnsignedShort:",  objc_msgSend(v50, "applicationKeyIndex")));
                  unsigned __int8 v52 = -[NSMutableSet containsObject:](v40, "containsObject:", v51);

                  if ((v52 & 1) == 0)
                  {
                    id v53 = [v50 applicationKeyIndex];
                    id v126 = 0LL;
                    unsigned int v54 = (__SecKey *)[v26 copyPublicIdentityDataToRegisterForKeyIndex:v53 withError:&v126];
                    id v55 = v126;
                    unsigned int v56 = v55;
                    if (v54)
                    {
                      id v118 = v55;
                      CFErrorRef v57 = v17;
                      CFErrorRef error = 0LL;
                      CFDataRef v58 = SecKeyCopyExternalRepresentation(v54, &error);
                      unsigned int v59 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                      v60 = v59;
                      if (v58)
                      {
                        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                        {
                          unsigned int v61 = [v50 applicationKeyIndex];
                          BOOL v62 = (void *)objc_claimAutoreleasedReturnValue([v50 identifier]);
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v137 = v61;
                          uint64_t v26 = v114;
                          *(_WORD *)&v137[4] = 2112;
                          *(void *)&v137[6] = v62;
                          _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Adding application key %u to kt-loggable-data for service: %@",  buf,  0x12u);
                        }

                        v60 = objc_alloc_init(&OBJC_CLASS___IDSProtoApplicationKeyEntry);
                        -[os_log_s setKeyIndex:]( v60,  "setKeyIndex:",  sub_1002E08A0((int)[v50 applicationKeyIndex]));
                        -[os_log_s setPublicIdentity:](v60, "setPublicIdentity:", v58);

                        [v115 addApplicationPublicIdentity:v60];
                        unsigned __int8 v17 = v57;
                        id v63 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v57[501],  "numberWithUnsignedShort:",  objc_msgSend(v50, "applicationKeyIndex")));
                        -[NSMutableSet addObject:](v117, "addObject:", v63);

                        id v45 = v116;
                      }

                      else if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v67 = [v50 applicationKeyIndex];
                        CFErrorRef v68 = error;
                        v69 = (void *)objc_claimAutoreleasedReturnValue([v50 identifier]);
                        *(_DWORD *)buf = 67109634;
                        *(_DWORD *)v137 = v67;
                        id v45 = v116;
                        *(_WORD *)&v137[4] = 2112;
                        *(void *)&v137[6] = v68;
                        unsigned __int8 v17 = v57;
                        *(_WORD *)&v137[14] = 2112;
                        *(void *)&v137[16] = v69;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "Failed to get representation of application key { keyType: %u, error: %@, service: %@ }",  buf,  0x1Cu);

                        uint64_t v26 = v114;
                      }

                      else
                      {
                        unsigned __int8 v17 = v57;
                      }

                      CFRelease(v54);
                      unsigned int v56 = v118;
                      if (error) {
                        CFRelease(error);
                      }
                      int v40 = v117;
                    }

                    else
                    {
                      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v65 = [v50 applicationKeyIndex];
                        CFErrorRef v66 = (void *)objc_claimAutoreleasedReturnValue([v50 identifier]);
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v137 = v65;
                        id v45 = v116;
                        *(_WORD *)&v137[4] = 2112;
                        *(void *)&v137[6] = v66;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "Failed to get service application key { keyType: %u, service: %@ }",  buf,  0x12u);

                        uint64_t v26 = v114;
                      }
                    }
                  }
                }

                v49 = (char *)v49 + 1;
              }

              while (v47 != v49);
              id v70 = [v45 countByEnumeratingWithState:&v127 objects:v138 count:16];
              id v47 = v70;
            }

            while (v70);
          }

          __int128 v71 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationData);
          unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue([v115 data]);
          -[IDSKTRegistrationData setKtDataForRegistration:](v71, "setKtDataForRegistration:", v72);

          if (v71) {
            CFDictionarySetValue((CFMutableDictionaryRef)theDict, key, v71);
          }
          uint64_t v13 = v103;
          -[NSMutableSet addObject:](v103, "addObject:", key);
          self = v104;
          uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager _ktApplicationForKTRegistrationIndex:]( v104,  "_ktApplicationForKTRegistrationIndex:",  [v113 ktRegistrationDataIndex]));
          if (v73
            && (BOOL v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationData ktDataForRegistration](v71, "ktDataForRegistration")),
                v74,
                v74))
          {
            uint64_t v75 = v40;
            id v76 = objc_alloc(&OBJC_CLASS___TransparencyIDSRegistrationRequestData);
            id v77 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationData ktDataForRegistration](v71, "ktDataForRegistration"));
            id v78 = [v76 initWithApplication:v73 registrationData:v77];

            __int16 v79 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
            v80 = (void *)objc_claimAutoreleasedReturnValue([v79 pushToken]);
            [v78 setPushToken:v80];

            -[NSMutableDictionary setObject:forKeyedSubscript:](v100, "setObject:forKeyedSubscript:", v78, v73);
          }

          else
          {
            id v78 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            uint64_t v75 = v40;
            if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR))
            {
              unsigned int v87 = [v113 ktRegistrationDataIndex];
              id v88 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationData ktDataForRegistration](v71, "ktDataForRegistration"));
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v137 = v87;
              *(_WORD *)&v137[4] = 2112;
              *(void *)&v137[6] = v88;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v78,  OS_LOG_TYPE_ERROR,  "No KT Application found for key index or registration data is null. { keyIndex: %u, ktRegistrationData: %@ }",  buf,  0x12u);
            }
          }

          serviceIndexToKTRegDataConfigs = v104->_serviceIndexToKTRegDataConfigs;
          uint64_t v28 = v113;
          uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17[501],  "numberWithUnsignedShort:",  objc_msgSend(v113, "ktRegistrationDataIndex")));
          __int16 v83 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v82));

          [v83 setUnregisteredKTData:v71];
          id v84 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17[501],  "numberWithUnsignedShort:",  objc_msgSend(v113, "ktRegistrationDataIndex")));
          -[NSMutableSet addObject:](v106, "addObject:", v84);

          id v10 = v105;
          uint64_t v16 = v102;
          id v15 = v108;
          goto LABEL_47;
        }

        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        v115 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = v113;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v113 identifier]);
          *(_DWORD *)buf = 138412290;
          *(void *)v137 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Top level service already has relevant KT Data setup. { service: %@ }",  buf,  0xCu);

LABEL_47:
          id v86 = v111;
          id v85 = v112;
          goto LABEL_49;
        }

        id v86 = v111;
        id v85 = v112;
        uint64_t v28 = v113;
LABEL_49:

        id v18 = v85 + 1;
      }

      while (v18 != v15);
      id v15 = [obj countByEnumeratingWithState:&v131 objects:v139 count:16];
    }

    while (v15);
  }

  BOOL v89 = +[IMUserDefaults shouldDropKTAccountKeySignatureRequestDuringReg]( &OBJC_CLASS___IMUserDefaults,  "shouldDropKTAccountKeySignatureRequestDuringReg");
  if (v89 && CUTIsInternalInstall(v89, v90))
  {
    __int128 v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "Default is set to drop account key signature request during registration.",  buf,  2u);
    }

    -[NSMutableDictionary removeAllObjects](v100, "removeAllObjects");
  }

  if (!+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "isKeyTransparencyEnabled"))
  {
    __int128 v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }

    -[NSMutableDictionary removeAllObjects](v100, "removeAllObjects");
  }

  id v93 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager ktVerifier](self, "ktVerifier"));
  uint64_t v135 = kKTApplicationIdentifierIDS;
  __int128 v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v135, 1LL));
  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472LL;
  v119[2] = sub_100396BFC;
  v119[3] = &unk_100902A68;
  v120 = theDict;
  id v121 = v10;
  v122 = self;
  v123 = v100;
  id v124 = v99;
  id v95 = v99;
  id v96 = v100;
  id v97 = v10;
  __int128 v98 = theDict;
  [v93 getOptInStatesForKTApplications:v94 withCompletion:v119];
}

- (BOOL)doesSignatureDSID:(id)a3 matchAccountDSID:(id)a4
{
  uint64_t v5 = (os_log_s *)a3;
  id v6 = a4;
  if (!v5)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = 0LL;
      __int16 v15 = 2112;
      id v16 = v6;
      id v8 = "Missing signature dsid. Falling back and using signature without dsid validation. { signatureDSID: %@, accountDSID: %@ }";
      goto LABEL_7;
    }

- (BOOL)handleTransparencySignatureResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Handling signature response from transparency.",  buf,  2u);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager accountController](self, "accountController"));
  unsigned int v10 = [v9 isiCloudSignedIn];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager systemMonitor](self, "systemMonitor"));
  unsigned int v12 = [v11 isSetup];

  if (!v6)
  {
    int v68 = v12 ^ 1;
    if (((v10 ^ 1) & 1) != 0 || v68)
    {
      int v76 = v10 ^ 1 | v12;
      int v77 = v10 | v68;
      uint64_t v78 = -1004LL;
      uint64_t v79 = -1003LL;
      if (v10 | v12) {
        uint64_t v79 = -1000LL;
      }
      BOOL v80 = v77 == 1;
      if (v77 == 1) {
        unsigned int v81 = v10 | v12;
      }
      else {
        unsigned int v81 = 0;
      }
      if (v80) {
        uint64_t v78 = v79;
      }
      if (v76 == 1) {
        uint64_t v70 = v81;
      }
      else {
        uint64_t v70 = 1LL;
      }
      if (v76 == 1) {
        uint64_t v69 = v78;
      }
      else {
        uint64_t v69 = -1001LL;
      }
      if (v7) {
        goto LABEL_85;
      }
    }

    else
    {
      uint64_t v69 = -1002LL;
      uint64_t v70 = 1LL;
      if (v7)
      {
LABEL_85:
        NSErrorUserInfoKey v133 = NSUnderlyingErrorKey;
        id v134 = v7;
        uint64_t v71 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v134,  &v133,  1LL));
LABEL_106:
        id obj = (id)v71;
        uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKTRegistrationDataManagerErrorDomain",  v69));
        uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v69));
          *(_DWORD *)buf = 138412802;
          *(void *)v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = v83;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v75;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }",  buf,  0x20u);
        }

        id v84 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        [v84 logResultForEvent:@"kt-sig-resp" hardFailure:v70 result:v75];

        id v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          sub_1006A8D54();
        }

        goto LABEL_140;
      }
    }

    uint64_t v71 = 0LL;
    goto LABEL_106;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 registrationData]);
  id obj = v13;
  if (!v13)
  {
    int v72 = v12 ^ 1;
    if (((v10 ^ 1) & 1) != 0 || v72)
    {
      int v88 = v10 ^ 1 | v12;
      int v89 = v10 | v72;
      uint64_t v90 = -1014LL;
      uint64_t v91 = -1013LL;
      if (v10 | v12) {
        uint64_t v91 = -1000LL;
      }
      BOOL v92 = v89 == 1;
      if (v89 == 1) {
        unsigned int v93 = v10 | v12;
      }
      else {
        unsigned int v93 = 0;
      }
      if (v92) {
        uint64_t v90 = v91;
      }
      if (v88 == 1) {
        uint64_t v74 = v93;
      }
      else {
        uint64_t v74 = 1LL;
      }
      if (v88 == 1) {
        uint64_t v73 = v90;
      }
      else {
        uint64_t v73 = -1011LL;
      }
      if (v7) {
        goto LABEL_89;
      }
    }

    else
    {
      uint64_t v73 = -1012LL;
      uint64_t v74 = 1LL;
      if (v7)
      {
LABEL_89:
        NSErrorUserInfoKey v131 = NSUnderlyingErrorKey;
        id v132 = v7;
        uint64_t v75 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v132,  &v131,  1LL));
LABEL_135:
        __int128 v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKTRegistrationDataManagerErrorDomain",  v73,  v75));
        id v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          id v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v73));
          *(_DWORD *)buf = 138412802;
          *(void *)v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = v96;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v94;
          _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }",  buf,  0x20u);
        }

        id v97 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        [v97 logResultForEvent:@"kt-sig-resp" hardFailure:v74 result:v94];

        __int128 v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
          sub_1006A8DB4();
        }

LABEL_140:
        BOOL v87 = 0;
        goto LABEL_141;
      }
    }

    uint64_t v75 = 0LL;
    goto LABEL_135;
  }

  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v112 objects:v130 count:16];
  if (!v14)
  {
LABEL_118:
    BOOL v87 = 0;
    goto LABEL_142;
  }

  id v15 = v14;
  id v100 = v6;
  char v103 = 0;
  char log = 0;
  uint64_t v111 = *(void *)v113;
  id v109 = v7;
  do
  {
    id v16 = 0LL;
    do
    {
      if (*(void *)v113 != v111) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v112 + 1) + 8LL * (void)v16);
      uint64_t v18 = -[IDSKTRegistrationDataManager _ktRegistrationDataIndexForKTApplication:]( self,  "_ktRegistrationDataIndexForKTApplication:",  v17);
      serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v18));
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v20));

      if (!v21)
      {
        if (v7)
        {
          NSErrorUserInfoKey v128 = NSUnderlyingErrorKey;
          id v129 = v7;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v129,  &v128,  1LL));
        }

        else
        {
          uint64_t v23 = 0LL;
        }

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKTRegistrationDataManagerErrorDomain",  -2000LL,  v23));
        __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = &off_100947E48;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }",  buf,  0x20u);
        }

        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        [v42 logResultForEvent:@"kt-sig-resp" hardFailure:1 result:v25];

        unsigned __int8 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v17]);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v125 = v18;
          *(_WORD *)&v125[4] = 2112;
          *(void *)&v125[6] = v17;
          *(_WORD *)&v125[14] = 2112;
          *(void *)&v125[16] = v44;
          *(_WORD *)&v125[24] = 2112;
          *(void *)&v125[26] = v25;
          __int16 v126 = 2112;
          id v127 = v109;
          _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "No config for key index and KT Application. { keyIndex: %u, KT Application: %@, transparencyResponse: %@, er ror: %@, underlyingError: %@ }",  buf,  0x30u);

          id v7 = v109;
        }

        goto LABEL_45;
      }

      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 unregisteredKTData]);

      if (!v22)
      {
        if (v7)
        {
          NSErrorUserInfoKey v122 = NSUnderlyingErrorKey;
          id v123 = v7;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v123,  &v122,  1LL));
        }

        else
        {
          uint64_t v23 = 0LL;
        }

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKTRegistrationDataManagerErrorDomain",  -2001LL,  v23));
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v125 = @"kt-sig-resp";
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = &off_100947E60;
          *(_WORD *)&v125[18] = 2112;
          *(void *)&v125[20] = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Reporting KT metric { metricName: %@, errorCode: %@, error: %@ }",  buf,  0x20u);
        }

        id v46 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        [v46 logResultForEvent:@"kt-sig-resp" hardFailure:1 result:v25];

        unsigned __int8 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v125 = v18;
          *(_WORD *)&v125[4] = 2112;
          *(void *)&v125[6] = v17;
          *(_WORD *)&v125[14] = 2112;
          *(void *)&v125[16] = v25;
          *(_WORD *)&v125[24] = 2112;
          *(void *)&v125[26] = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "No unregistered KT data for keyIndex. { keyIndex: %u, ktApplication: %@, error: %@, underlyingError: %@ }",  buf,  0x26u);
        }

- (id)_ktApplicationForKTRegistrationIndex:(unsigned __int16)a3
{
  else {
    return *(id *)*(&off_100902A88 + (__int16)(a3 - 1));
  }
}

- (unsigned)_ktRegistrationDataIndexForKTApplication:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kKTApplicationIdentifierIDS])
  {
    unsigned __int16 v4 = 1;
  }

  else if ([v3 isEqualToString:kKTApplicationIdentifierIDSFaceTime])
  {
    unsigned __int16 v4 = 2;
  }

  else if ([v3 isEqualToString:kKTApplicationIdentifierIDSMultiplex])
  {
    unsigned __int16 v4 = 3;
  }

  else
  {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3
{
  return +[IDSKeyTransparencyVerifier keyTransparencyVersionNumberForServiceType:]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "keyTransparencyVersionNumberForServiceType:",  a3);
}

- (void)updateKVSWithCurrentKTRegistrationData
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager _createKTTrustedDeviceForKVSisRegistered:]( self,  "_createKTTrustedDeviceForKVSisRegistered:",  0LL));
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager _createKTTrustedDeviceForKVSisRegistered:]( self,  "_createKTTrustedDeviceForKVSisRegistered:",  1LL));
  if (v5) {
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }
  if (-[NSMutableArray count](v3, "count"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTRegistrationDataManager ktVerifier](self, "ktVerifier"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100399000;
    v8[3] = &unk_1008F8800;
    v8[4] = self;
    unsigned int v9 = v3;
    [v6 updateKVSWithTrustedDevices:v9 withCompletion:v8];
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No new trusted devices to insert into KVS.",  buf,  2u);
    }
  }
}

- (id)createRegistrationStatusProvider
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Asked to create KT Registration Status provider.",  buf,  2u);
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationStatusProvider);
  unsigned __int16 v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v5 = 1;
  *(void *)&__int128 v6 = 67109120LL;
  __int128 v14 = v6;
  do
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager _ktApplicationForKTRegistrationIndex:]( self,  "_ktApplicationForKTRegistrationIndex:",  (unsigned __int16)v5,  v14));
    if (!v7)
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v14;
        int v19 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "No KTApplication found for keyIndex. { keyIndex: %u }",  buf,  8u);
      }
    }

    id v17 = 0LL;
    id v9 = -[IDSKTRegistrationDataManager copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:]( self,  "copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:",  (unsigned __int16)v5,  0LL,  &v17);
    id v10 = v17;
    uint64_t v16 = 0LL;
    id v11 = -[IDSKTRegistrationDataManager copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:]( self,  "copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:",  (unsigned __int16)v5,  1LL,  &v16);
    id v12 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationStatus);
    [v12 setUnregisteredKTData:v9];
    [v12 setRegisteredKTData:v11];
    if (v12) {
      CFDictionarySetValue((CFMutableDictionaryRef)v4, v7, v12);
    }

    ++v5;
  }

  while (v5 != 4);
  [v15 setKtApplicationToKTRegStatus:v4];

  return v15;
}

- (id)_createKTTrustedDeviceForKVSisRegistered:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  id v7 = @"NO";
  if (v6)
  {
    if (v3) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v7;
    uint64_t v39 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Creating KT Trusted Device for KVS upload. { isRegistered: %@ }",  buf,  0xCu);
  }

  else
  {
    if (v3) {
      id v7 = @"YES";
    }
    uint64_t v35 = v7;
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDevice);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pushToken]);
  -[IDSProtoKeyTransparencyTrustedDevice setPushToken:](v8, "setPushToken:", v10);

  -[IDSProtoKeyTransparencyTrustedDevice setTransparencyVersion:]( v8,  "setTransparencyVersion:",  kTransparencyAnalyticsVersion);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 productBuildVersion]);
  -[IDSProtoKeyTransparencyTrustedDevice setBuildVersion:](v8, "setBuildVersion:", v12);

  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 productName]);
  uint64_t v36 = v8;
  -[IDSProtoKeyTransparencyTrustedDevice setProductName:](v8, "setProductName:", v14);

  uint64_t v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v15 = 1;
  *(void *)&__int128 v16 = 138412802LL;
  __int128 v34 = v16;
  do
  {
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v15,  v34));
    int v19 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v18));

    if (v19)
    {
      if (v3) {
        uint64_t v20 = objc_claimAutoreleasedReturnValue(-[__CFString registeredKTData](v19, "registeredKTData"));
      }
      else {
        uint64_t v20 = objc_claimAutoreleasedReturnValue(-[__CFString unregisteredKTData](v19, "unregisteredKTData"));
      }
      unsigned int v21 = (void *)v20;
      if (v20)
      {
        BOOL v22 = objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 ktDataForRegistration]);
        uint64_t v24 = -[IDSProtoKeyTransparencyLoggableData initWithData:](v22, "initWithData:", v23);

        if (v24)
        {
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v21 ktDataForRegistration]);
          if (v25)
          {
            uint64_t v26 = (void *)v25;
            unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v21 ktDataSignature]);

            if (v27)
            {
              uint64_t v28 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedService);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v21 ktDataSignature]);
              -[IDSProtoKeyTransparencyTrustedService setDeviceSignature:](v28, "setDeviceSignature:", v29);

              -[IDSProtoKeyTransparencyTrustedService setKtLoggableData:](v28, "setKtLoggableData:", v24);
              -[IDSProtoKeyTransparencyTrustedService setKeyIndex:]( v28,  "setKeyIndex:",  sub_1002E08AC((unsigned __int16)v15));
              -[NSMutableArray addObject:](v37, "addObject:", v28);
            }
          }
        }
      }

      else
      {
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v34;
          uint64_t v39 = v19;
          __int16 v40 = 1024;
          int v41 = v15;
          __int16 v42 = 2112;
          unsigned __int8 v43 = v35;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "No kt registration data found for key index. { config: %@, keyIndex: %u, isRegistered: %@ }",  buf,  0x1Cu);
        }
      }
    }

    else
    {
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "No config found for key index. { keyIndex: %u }",  buf,  8u);
      }
    }

    ++v15;
  }

  while (v15 != 4);
  if (-[NSMutableArray count](v37, "count"))
  {
    uint64_t v30 = v36;
    -[IDSProtoKeyTransparencyTrustedDevice setTrustedServices:](v36, "setTrustedServices:", v37);
    uint64_t v31 = v36;
  }

  else
  {
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    uint64_t v30 = v36;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1006A8E14();
    }

    uint64_t v31 = 0LL;
  }

  return v31;
}

- (void)noteSuccessfulKVSSyncOfTrustedDevices:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  int v6 = 1;
  *(void *)&__int128 v7 = 67109120LL;
  __int128 v15 = v7;
  do
  {
    serviceIndexToKTRegDataConfigs = self->_serviceIndexToKTRegDataConfigs;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v6,  v15));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( serviceIndexToKTRegDataConfigs,  "objectForKeyedSubscript:",  v9));

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unregisteredKTData]);
      id v12 = v11;
      if (v11
        && ([v11 uploadedToKVS] & 1) == 0
        && -[IDSKTRegistrationDataManager _isKTRegistrationData:forServiceIndex:inTrustedDevices:]( self,  "_isKTRegistrationData:forServiceIndex:inTrustedDevices:",  v12,  (unsigned __int16)v6,  v4))
      {
        char v5 = 1;
        [v12 setUploadedToKVS:1];
      }

      int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 registeredKTData]);
      __int128 v14 = v13;
      if (v13
        && ([v13 uploadedToKVS] & 1) == 0
        && -[IDSKTRegistrationDataManager _isKTRegistrationData:forServiceIndex:inTrustedDevices:]( self,  "_isKTRegistrationData:forServiceIndex:inTrustedDevices:",  v14,  (unsigned __int16)v6,  v4))
      {
        char v5 = 1;
        [v14 setUploadedToKVS:1];
      }
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v15;
        int v17 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "No config for keyIndex. { keyIndex: %u }",  buf,  8u);
      }
    }

    ++v6;
  }

  while (v6 != 4);
  if ((v5 & 1) != 0) {
    -[IDSKTRegistrationDataManager serializeAndPersistKTDatasDeleteIfNull:]( self,  "serializeAndPersistKTDatasDeleteIfNull:",  1LL);
  }
}

- (void)scheduleNextKVSSync
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1006A8E40();
  }
}

- (BOOL)_isKTRegistrationData:(id)a3 forServiceIndex:(unsigned __int16)a4 inTrustedDevices:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v8 = a5;
  id v32 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v32)
  {
    uint64_t v9 = *(void *)v42;
    __int128 v34 = v8;
    uint64_t v31 = *(void *)v42;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v33 = v10;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v10), "trustedServices", v31));
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v38;
          uint64_t v35 = *(void *)v38;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v38 != v15) {
                objc_enumerationMutation(v12);
              }
              int v17 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
              unsigned int v18 = [v17 keyIndex];
              if (v18 == sub_1002E08AC(v6))
              {
                int v19 = (void *)objc_claimAutoreleasedReturnValue([v17 ktLoggableData]);
                uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 deviceSignature]);
                unsigned int v21 = (void *)v20;
                if (v19) {
                  BOOL v22 = v20 == 0;
                }
                else {
                  BOOL v22 = 1;
                }
                if (!v22)
                {
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 data]);
                  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataForRegistration]);
                  if ([v23 isEqualToData:v24])
                  {
                    id v25 = v12;
                    uint64_t v26 = v6;
                    id v27 = v7;
                    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataSignature]);
                    unsigned __int8 v36 = [v21 isEqualToData:v28];

                    id v7 = v27;
                    uint64_t v6 = v26;
                    id v12 = v25;
                    uint64_t v15 = v35;

                    if ((v36 & 1) != 0)
                    {

                      BOOL v29 = 1;
                      id v8 = v34;
                      goto LABEL_27;
                    }
                  }

                  else
                  {
                  }
                }
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }

          while (v14);
        }

        uint64_t v10 = v33 + 1;
        id v8 = v34;
        uint64_t v9 = v31;
      }

      while ((id)(v33 + 1) != v32);
      BOOL v29 = 0;
      id v32 = [v34 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }

    while (v32);
  }

  else
  {
    BOOL v29 = 0;
  }

- (void)logIDSKTRegMetrics:(id)a3 expectedRegisteredData:(id)a4 forKeyIndex:(unsigned __int16)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 ktDataForRegistration]);

  if (!v8)
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412546;
      __int128 v39 = @"kt-reg-data-status";
      __int16 v40 = 2112;
      __int128 v41 = &off_100947EC0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric {metricName: %@, errorCode: %@}",  (uint8_t *)&v38,  0x16u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v16 = -3001LL;
    goto LABEL_12;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 ktDataForRegistration]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataForRegistration]);
  unsigned __int8 v11 = [v9 isEqualToData:v10];

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v11 & 1) == 0)
  {
    if (v13)
    {
      int v38 = 138412546;
      __int128 v39 = @"kt-reg-data-status";
      __int16 v40 = 2112;
      __int128 v41 = &off_100947ED8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric {metricName: %@, errorCode: %@}",  (uint8_t *)&v38,  0x16u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v16 = -3002LL;
LABEL_12:
    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKTRegistrationDataManagerErrorDomain",  v16,  0LL));
    [v14 logResultForEvent:@"kt-reg-data-status" hardFailure:1 result:v17];

    goto LABEL_13;
  }

  if (v13)
  {
    int v38 = 138412290;
    __int128 v39 = @"kt-reg-data-status";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric Success {metricName: %@}",  (uint8_t *)&v38,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v14 logSuccessForEventNamed:@"kt-reg-data-status"];
LABEL_13:

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v6 ktPublicAccountKey]);
  if (!v18)
  {
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412546;
      __int128 v39 = @"kt-reg-publicAccountKey-status";
      __int16 v40 = 2112;
      __int128 v41 = &off_100947EF0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric {metricName: %@, errorCode: %@}",  (uint8_t *)&v38,  0x16u);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v26 = -3003LL;
    goto LABEL_24;
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue([v6 ktPublicAccountKey]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 ktPublicAccountKey]);
  unsigned __int8 v21 = [v19 isEqualToData:v20];

  BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if ((v21 & 1) == 0)
  {
    if (v23)
    {
      int v38 = 138412546;
      __int128 v39 = @"kt-reg-publicAccountKey-status";
      __int16 v40 = 2112;
      __int128 v41 = &off_100947F08;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric {metricName: %@, errorCode: %@}",  (uint8_t *)&v38,  0x16u);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v26 = -3004LL;
LABEL_24:
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKTRegistrationDataManagerErrorDomain",  v26,  0LL));
    [v24 logResultForEvent:@"kt-reg-publicAccountKey-status" hardFailure:1 result:v27];

    goto LABEL_25;
  }

  if (v23)
  {
    int v38 = 138412290;
    __int128 v39 = @"kt-reg-publicAccountKey-status";
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric Success {metricName: %@}",  (uint8_t *)&v38,  0xCu);
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v24 logSuccessForEventNamed:@"kt-reg-publicAccountKey-status"];
LABEL_25:

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 ktDataSignature]);
  if (!v28)
  {
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138412546;
      __int128 v39 = @"kt-reg-dataSignature-status";
      __int16 v40 = 2112;
      __int128 v41 = &off_100947F20;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric {metricName: %@, errorCode: %@}",  (uint8_t *)&v38,  0x16u);
    }

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v36 = -3005LL;
    goto LABEL_36;
  }

  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v6 ktDataSignature]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 ktDataSignature]);
  unsigned __int8 v31 = [v29 isEqualToData:v30];

  id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if ((v31 & 1) == 0)
  {
    if (v33)
    {
      int v38 = 138412546;
      __int128 v39 = @"kt-reg-dataSignature-status";
      __int16 v40 = 2112;
      __int128 v41 = &off_100947F38;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric {metricName: %@, errorCode: %@}",  (uint8_t *)&v38,  0x16u);
    }

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v36 = -3006LL;
LABEL_36:
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKTRegistrationDataManagerErrorDomain",  v36,  0LL));
    [v34 logResultForEvent:@"kt-reg-dataSignature-status" hardFailure:1 result:v37];

    goto LABEL_37;
  }

  if (v33)
  {
    int v38 = 138412290;
    __int128 v39 = @"kt-reg-dataSignature-status";
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Logging KT Metric Success {metricName: %@}",  (uint8_t *)&v38,  0xCu);
  }

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v34 logSuccessForEventNamed:@"kt-reg-dataSignature-status"];
LABEL_37:
}

- (void)logKTRegistrationTimeMetricsForLatestRegisteredKTData:(id)a3 lastRegisteredKTData:(id)a4 forKeyIndex:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 ktPublicAccountKey]);
  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 ktDataSignature]);
    id v12 = (void *)v11;
    BOOL v146 = v11 != 0;
    if (v9 && v11)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v9 ktPublicAccountKey]);
      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 ktDataSignature]);
        BOOL v146 = v14 == 0LL;
      }

      else
      {
        BOOL v146 = 1;
      }
    }
  }

  else
  {
    BOOL v146 = 0;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 ktPublicAccountKey]);
  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 ktDataSignature]);
    if (v16)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v9 ktPublicAccountKey]);
      if (v17)
      {
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v9 ktDataSignature]);
        BOOL v19 = v18 != 0LL;
      }

      else
      {
        BOOL v19 = 0;
      }
    }

    else
    {
      BOOL v19 = 0;
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 ktPublicAccountKey]);
  if (v20)
  {
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 ktDataSignature]);
    BOOL v22 = v21 == 0LL;
  }

  else
  {
    BOOL v22 = 1;
  }

  if (v9) {
    BOOL v23 = v22;
  }
  else {
    BOOL v23 = 0;
  }
  int v24 = v23 || v19;
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24 == 1)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      id v27 = "Not reporting KT time metrics.";
LABEL_137:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
      goto LABEL_138;
    }

    goto LABEL_138;
  }

  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Reporting KT time metrics.", buf, 2u);
  }

  BOOL v145 = v22;
  if (!self->_iCloudSignInDate)
  {
    BOOL v140 = 0;
    BOOL v31 = 0;
    int v32 = 1;
    BOOL v30 = 1;
    goto LABEL_42;
  }

  buddyFinishDate = self->_buddyFinishDate;
  if (buddyFinishDate)
  {
    -[NSDate timeIntervalSinceDate:](buddyFinishDate, "timeIntervalSinceDate:");
    BOOL v30 = v29 < 0.0;
    if (!self->_iCloudSignInDate)
    {
      BOOL v31 = 0;
      int v32 = 1;
      goto LABEL_37;
    }
  }

  else
  {
    BOOL v30 = 0;
  }

  int v32 = 0;
  BOOL v31 = self->_manateeAvailableDate != 0LL;
LABEL_37:
  if (v22)
  {
    if ((v32 & 1) != 0)
    {
      BOOL v140 = 0;
      int v32 = 1;
    }

    else
    {
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v8 registeredTime]);
      BOOL v140 = v33 != 0LL;

      int v32 = 0;
    }
  }

  else
  {
    BOOL v140 = 0;
  }

- (void)noteiCloudSignInTime
{
  BOOL v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  iCloudSignInDate = self->_iCloudSignInDate;
  self->_iCloudSignInDate = v3;
}

- (void)noteBuddyFinishTime
{
  BOOL v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  buddyFinishDate = self->_buddyFinishDate;
  self->_buddyFinishDate = v3;
}

- (void)noteManateeAvailableTime
{
  BOOL v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  manateeAvailableDate = self->_manateeAvailableDate;
  self->_manateeAvailableDate = v3;
}

- (NSMutableDictionary)serviceIndexToKTRegDataConfigs
{
  return self->_serviceIndexToKTRegDataConfigs;
}

- (void)setServiceIndexToKTRegDataConfigs:(id)a3
{
}

- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource
{
  return self->_identityDataSource;
}

- (void)setIdentityDataSource:(id)a3
{
}

- (TransparencyDaemon)transparencyDaemon
{
  return self->_transparencyDaemon;
}

- (void)setTransparencyDaemon:(id)a3
{
}

- (NSDate)iCloudSignInDate
{
  return self->_iCloudSignInDate;
}

- (void)setICloudSignInDate:(id)a3
{
}

- (NSDate)buddyFinishDate
{
  return self->_buddyFinishDate;
}

- (void)setBuddyFinishDate:(id)a3
{
}

- (NSDate)manateeAvailableDate
{
  return self->_manateeAvailableDate;
}

- (void)setManateeAvailableDate:(id)a3
{
}

- (BOOL)hasReportediCloudBuddyTime
{
  return self->_hasReportediCloudBuddyTime;
}

- (void)setHasReportediCloudBuddyTime:(BOOL)a3
{
  self->_hasReportediCloudBuddyTime = a3;
}

- (BOOL)hasReportediCloudManateeTime
{
  return self->_hasReportediCloudManateeTime;
}

- (void)setHasReportediCloudManateeTime:(BOOL)a3
{
  self->_hasReportediCloudManateeTime = a3;
}

- (BOOL)hasReportedManateeBuddyTime
{
  return self->_hasReportedManateeBuddyTime;
}

- (void)setHasReportedManateeBuddyTime:(BOOL)a3
{
  self->_hasReportedManateeBuddyTime = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end