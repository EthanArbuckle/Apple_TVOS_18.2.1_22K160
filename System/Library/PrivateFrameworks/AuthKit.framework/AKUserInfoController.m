@interface AKUserInfoController
+ (id)sharedController;
- (AKUserInfoController)init;
- (BOOL)_additionalInfoChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_adpCohortChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_authorizationPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_birthYearChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_deviceListPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_edpStateChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_idmsEDPTokenIdChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_loginHandlesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_managedAppleIDInfoChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_passcodeAuthPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_passkeyPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_passwordVersionChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_piggybackingApprovalEligibleChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_securityKeysChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_shouldUpdateConfigsForAltDSID:(id)a3 responseParameters:(id)a4;
- (BOOL)_srpProtocolChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_trustedContactPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_trustedPhoneNumbersChangedForAccount:(id)a3 userInformation:(id)a4;
- (BOOL)_updateAccount:(id)a3 withUserInformationResponse:(id)a4 modifyAliases:(BOOL)a5;
- (BOOL)_walrusPropertiesChangedForAccount:(id)a3 userInformation:(id)a4;
- (id)_userInfoChangeNotificationDictionaryForAltDSID:(id)a3 userInformation:(id)a4;
- (id)authorizationUserInformationForRequest:(id)a3 shouldRequestUpdate:(BOOL *)a4 error:(id *)a5;
- (id)previousAccountInfoRefreshDateForAccount:(id)a3;
- (void)_broadcastEmailChangeNotification;
- (void)_fetchUserInformationForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6;
- (void)_fetchUserInformationWithContext:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6;
- (void)_processHideMyEmailForAltDSID:(id)a3 userInfo:(id)a4 response:(id)a5;
- (void)_processIncomingUserInformationForAltDSID:(id)a3 userInformation:(id)a4;
- (void)_refreshApplicationInformationForAltDSID:(id)a3;
- (void)_refreshDeviceListForAccount:(id)a3;
- (void)_sendNotification:(id)a3 withUserInfo:(id)a4;
- (void)_setPreviousAccountInfoRefreshDate:(id)a3 forAccount:(id)a4;
- (void)_syncPrivateEmailsForAltDSID:(id)a3 client:(id)a4 userInformation:(id)a5 completion:(id)a6;
- (void)_updatePrivateEmailsWithInformation:(id)a3;
- (void)_updateUserConfigIfNecessaryForAltDSID:(id)a3 responseParameters:(id)a4;
- (void)fetchUserInformationForAltDSID:(id)a3 client:(id)a4 completion:(id)a5;
- (void)fetchUserInformationWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)processPushMessage:(id)a3;
- (void)refreshAccountUsernamesForAltDSID:(id)a3 dataCenter:(id)a4;
- (void)refreshAccountUsernamesForAltDSID:(id)a3 withUserInformation:(id)a4;
- (void)sendUserInfoChangeNotificationWithPayload:(id)a3;
- (void)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4;
- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5;
@end

@implementation AKUserInfoController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005BE88;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F418 != -1) {
    dispatch_once(&qword_10020F418, block);
  }
  return (id)qword_10020F410;
}

- (AKUserInfoController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKUserInfoController;
  v2 = -[AKUserInfoController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;
  }

  return v2;
}

- (void)fetchUserInformationForAltDSID:(id)a3 client:(id)a4 completion:(id)a5
{
}

- (void)fetchUserInformationWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
}

- (void)_fetchUserInformationForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v14, "setAltDSID:", v13);

  -[AKUserInfoController _fetchUserInformationWithContext:client:dataCenter:completion:]( self,  "_fetchUserInformationWithContext:client:dataCenter:completion:",  v14,  v12,  v11,  v10);
}

- (void)_fetchUserInformationWithContext:(id)a3 client:(id)a4 dataCenter:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 authKitAccountWithAltDSID:v16 error:0]);

    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[AKUserInfoController _setPreviousAccountInfoRefreshDate:forAccount:]( self,  "_setPreviousAccountInfoRefreshDate:forAccount:",  v19,  v17);
    }

    uint64_t v20 = _AKLogSystem(v18);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
      *(_DWORD *)buf = 138412290;
      v32 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Starting to fetch user info for %@",  buf,  0xCu);
    }

    v23 = objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider);
    v24 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v23,  "initWithContext:urlBagKey:",  v10,  AKURLBagKeyFetchUserInfo);
    -[AKURLRequestProviderImpl setClient:](v24, "setClient:", v11);
    -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v24, "setAuthenticatedRequest:", 1LL);
    -[AKURLRequestProviderImpl setDataCenterIdentifier:](v24, "setDataCenterIdentifier:", v12);
    v25 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v24);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10005C270;
    v27[3] = &unk_1001C8058;
    id v28 = v10;
    v29 = self;
    id v30 = v13;
    -[AKServiceControllerImpl executeRequestWithCompletion:](v25, "executeRequestWithCompletion:", v27);
  }

  else if (v13)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7025LL));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v26);
  }
}

- (void)refreshAccountUsernamesForAltDSID:(id)a3 dataCenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSXPCConnection beginTransaction](&OBJC_CLASS___NSXPCConnection, "beginTransaction");
  -[AKUserInfoController _fetchUserInformationForAltDSID:client:dataCenter:completion:]( self,  "_fetchUserInformationForAltDSID:client:dataCenter:completion:",  v7,  0LL,  v6,  &stru_1001C8DE0);
}

- (BOOL)_shouldUpdateConfigsForAltDSID:(id)a3 responseParameters:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authKitAccountWithAltDSID:v6 error:0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 configDataVersionForAccount:v8]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKConfigDataVersion]);
  BOOL v12 = v11 && (!v10 || ([v11 isEqual:v10] & 1) == 0);

  return v12;
}

- (void)_updateUserConfigIfNecessaryForAltDSID:(id)a3 responseParameters:(id)a4
{
  id v6 = a3;
  if (-[AKUserInfoController _shouldUpdateConfigsForAltDSID:responseParameters:]( self,  "_shouldUpdateConfigsForAltDSID:responseParameters:",  v6,  a4))
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___AKUserConfigController);
    uint64_t v9 = AKAllConfigsKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    -[AKUserConfigController fetchUserConfigForAltDSID:client:dataCenter:forIdentifiers:completion:]( v7,  "fetchUserConfigForAltDSID:client:dataCenter:forIdentifiers:completion:",  v6,  0LL,  0LL,  v8,  &stru_1001C8E20);
  }
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)1400)
  {
    uint64_t v5 = _AKLogSystem(1400LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling push in info controller with command AKPushMessageCommandAccountInfoChanged...",  v12,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"userinfodata"]);

    if (v8)
    {
      uint64_t v9 = -[AKAppleIDUserInformationResponse initWithResponseBody:]( objc_alloc(&OBJC_CLASS___AKAppleIDUserInformationResponse),  "initWithResponseBody:",  v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
      -[AKUserInfoController _processIncomingUserInformationForAltDSID:userInformation:]( self,  "_processIncomingUserInformationForAltDSID:userInformation:",  v10,  v9);
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 eventDetails]);
      uint64_t v9 = (AKAppleIDUserInformationResponse *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"dataCenter"]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
      -[AKUserInfoController refreshAccountUsernamesForAltDSID:dataCenter:]( self,  "refreshAccountUsernamesForAltDSID:dataCenter:",  v10,  v9);
    }
  }
}

- (void)_processHideMyEmailForAltDSID:(id)a3 userInfo:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 primaryAuthKitAccount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSIDForAccount:v12]);
  id v14 = [v13 isEqualToString:v8];
  if ((v14 & 1) != 0)
  {
    v16 = -[AKPrivateEmailInformation initWithResponseBody:]( objc_alloc(&OBJC_CLASS___AKPrivateEmailInformation),  "initWithResponseBody:",  v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
    int v18 = [v17 currentProtocolVersion];
    if (v18 >= -[AKPrivateEmailInformation protocolVersion](v16, "protocolVersion"))
    {
LABEL_14:
      if (-[AKPrivateEmailInformation shouldSyncWithServer](v16, "shouldSyncWithServer")) {
        -[AKUserInfoController _syncPrivateEmailsForAltDSID:client:userInformation:completion:]( self,  "_syncPrivateEmailsForAltDSID:client:userInformation:completion:",  v8,  0LL,  v10,  0LL);
      }
      else {
        -[AKUserInfoController _updatePrivateEmailsWithInformation:](self, "_updatePrivateEmailsWithInformation:", v16);
      }

      goto LABEL_18;
    }

    v29 = self;
    id v31 = 0LL;
    [v17 clearDatabase:&v31];
    id v19 = v31;
    if (v19)
    {
      v21 = v19;
      uint64_t v22 = _AKLogHme(v19, v20);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100136790();
      }
    }

    else
    {
      id v30 = 0LL;
      unsigned int v25 = objc_msgSend( v17,  "setProtocolVersion:error:",  -[AKPrivateEmailInformation protocolVersion](v16, "protocolVersion"),  &v30);
      id v26 = v30;
      v21 = v26;
      if (v25)
      {
        -[AKPrivateEmailInformation setShouldSyncWithServer:](v16, "setShouldSyncWithServer:", 1LL);
LABEL_13:

        self = v29;
        goto LABEL_14;
      }

      uint64_t v28 = _AKLogHme(v26, v27);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100136730();
      }
    }

    goto LABEL_13;
  }

  uint64_t v24 = _AKLogHme(v14, v15);
  v16 = (AKPrivateEmailInformation *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG)) {
    sub_1001367F0();
  }
LABEL_18:
}

- (void)_processIncomingUserInformationForAltDSID:(id)a3 userInformation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 userInformationRepresentation]);
  -[AKUserInfoController refreshAccountUsernamesForAltDSID:withUserInformation:]( self,  "refreshAccountUsernamesForAltDSID:withUserInformation:",  v7,  v6);

  -[AKUserInfoController updateUserInformationForAltDSID:userInformation:completion:]( self,  "updateUserInformationForAltDSID:userInformation:completion:",  v7,  v8,  0LL);
}

- (void)_syncPrivateEmailsForAltDSID:(id)a3 client:(id)a4 userInformation:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([a5 userInformationRepresentation]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 privateEmailListVersion]);
  id v14 = v13;
  if (v13 && ([v13 isEqualToString:@"0"] & 1) == 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentEmailListVersion]);
    id v17 = [v14 isEqualToString:v16];
    if ((v17 & 1) != 0)
    {
LABEL_14:

      goto LABEL_15;
    }

    uint64_t v18 = _AKLogSystem(v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100136848();
    }

    v21 = -[AKPrivateEmailServiceController initWithClient:altDSID:]( objc_alloc(&OBJC_CLASS___AKPrivateEmailServiceController),  "initWithClient:altDSID:",  v10,  v9);
    if (v21)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10005CD0C;
      v25[3] = &unk_1001C6B38;
      id v26 = (id)os_transaction_create("com.apple.authkit.sync-private-emails");
      id v27 = v11;
      id v22 = v26;
      -[AKPrivateEmailServiceController executeFetchHmeListRequestWithCompletion:]( v21,  "executeFetchHmeListRequestWithCompletion:",  v25);
    }

    else
    {
      uint64_t v23 = _AKLogHme(0LL, v20);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10013681C();
      }

      if (!v11) {
        goto LABEL_13;
      }
      id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7096LL));
      (*((void (**)(id, void, id))v11 + 2))(v11, 0LL, v22);
    }

LABEL_13:
    goto LABEL_14;
  }

- (void)_updatePrivateEmailsWithInformation:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privateEmailListVersion]);
  uint64_t v6 = _AKLogHme(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100136974();
  }

  if (v4 && ([v4 isEqualToString:@"0"] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKPrivateEmailStoreManager sharedInstance]( &OBJC_CLASS___AKPrivateEmailStoreManager,  "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentEmailListVersion]);
    uint64_t v11 = _AKLogHme(v9, v10);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100136914();
    }

    if (([v4 isEqualToString:v9] & 1) == 0)
    {
      id v19 = 0LL;
      unsigned __int8 v13 = [v8 commitChangesToCacheWithInformation:v3 error:&v19];
      id v14 = v19;
      v16 = v14;
      if ((v13 & 1) == 0)
      {
        uint64_t v17 = _AKLogHme(v14, v15);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1001368B4();
        }
      }
    }
  }
}

- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void, id, void *))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKUserInfoController _userInfoChangeNotificationDictionaryForAltDSID:userInformation:]( self,  "_userInfoChangeNotificationDictionaryForAltDSID:userInformation:",  v8,  v9));
  if (![v11 count]) {
    goto LABEL_58;
  }
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( self->_accountManager,  "authKitAccountWithAltDSID:error:",  v8,  0LL));
  id v13 = [v9 authMode];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKUserInfoChangedAuthModeKey]);

  BOOL v15 = v14 != 0LL;
  if (v14) {
    -[AKAccountManager setAuthenticationMode:forAccount:]( self->_accountManager,  "setAuthenticationMode:forAccount:",  v13,  v12);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 isMdmInfoRequired]);
  id v17 = [v16 BOOLValue];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKUserInfoChangedMDMInfoRequiredKey]);
  if (v18)
  {
    -[AKAccountManager setMDMInformationRequired:forAccount:]( self->_accountManager,  "setMDMInformationRequired:forAccount:",  v17,  v12);
    BOOL v15 = 1;
  }

  id v19 = [v9 appleIDSecurityLevel];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKUserInfoChangedSecurityLevelKey]);

  if (v20)
  {
    -[AKAccountManager setSecurityLevel:forAccount:](self->_accountManager, "setSecurityLevel:forAccount:", v19, v12);
    if (v19 == (id)4)
    {
      v21 = -[AKSatoriController initWithClient:](objc_alloc(&OBJC_CLASS___AKSatoriController), "initWithClient:", 0LL);
      -[AKSatoriController warmUpVerificationSessionWithCompletionHandler:]( v21,  "warmUpVerificationSessionWithCompletionHandler:",  0LL);
    }

    BOOL v15 = 1;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKUserInfoChangedRepairStateKey]);

  if (v22)
  {
    -[AKAccountManager setRepairState:forAccount:]( self->_accountManager,  "setRepairState:forAccount:",  [v9 repairState],  v12);
    BOOL v15 = 1;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKGroupKitEligibilityKey]);

  if (v23)
  {
    accountManager = self->_accountManager;
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v9 groupKitEligibility]);
    -[AKAccountManager setGroupKitEligibility:forAccount:]( accountManager,  "setGroupKitEligibility:forAccount:",  v25,  v12);

    BOOL v15 = 1;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKSOSActiveDeviceKey]);
  if (v26)
  {

LABEL_17:
    v29 = self->_accountManager;
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v9 hasSOSActiveDevice]);
    -[AKAccountManager setHasSOSActiveDevice:forAccount:]( v29,  "setHasSOSActiveDevice:forAccount:",  [v30 BOOLValue],  v12);

    int v28 = 1;
    goto LABEL_18;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKSOSActiveDeviceLegacyKey]);

  int v28 = v15;
  if (v27) {
    goto LABEL_17;
  }
LABEL_18:
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"activeHMECount"]);

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v9 activeHMECount]);
    -[AKAccountManager setActiveiCloudPrivateEmailCount:forAccount:]( self->_accountManager,  "setActiveiCloudPrivateEmailCount:forAccount:",  v32,  v12);

    int v28 = 1;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"inActiveHMECount"]);

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v9 inActiveHMECount]);
    -[AKAccountManager setInactiveiCloudPrivateEmailCount:forAccount:]( self->_accountManager,  "setInactiveiCloudPrivateEmailCount:forAccount:",  v34,  v12);

    int v28 = 1;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKSOSNeededKey]);

  if (v35)
  {
    v36 = self->_accountManager;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v9 SOSNeeded]);
    -[AKAccountManager setSOSNeeded:forAccount:](v36, "setSOSNeeded:forAccount:", [v37 BOOLValue], v12);

    int v28 = 1;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKConfigDataVersion]);

  if (v38)
  {
    v39 = self->_accountManager;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v9 configDataVersion]);
    -[AKAccountManager setConfigDataVersion:forAccount:](v39, "setConfigDataVersion:forAccount:", v40, v12);

    int v28 = 1;
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AKHasModernRKKey]);

  if (v41)
  {
    v42 = self->_accountManager;
    v43 = (void *)objc_claimAutoreleasedReturnValue([v9 hasModernRecoveryKey]);
    -[AKAccountManager setHasModernRecoveryKey:forAccount:]( v42,  "setHasModernRecoveryKey:forAccount:",  [v43 BOOLValue],  v12);

    int v28 = 1;
  }

  BOOL v71 = v15;
  v72 = v10;
  id v73 = v8;
  v44 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:AK3PRegulatoryOverrideKey]);

  if (v44)
  {
    v45 = self->_accountManager;
    v46 = (void *)objc_claimAutoreleasedReturnValue([v9 thirdPartyRegulatoryOverride]);
    -[AKAccountManager set3PRegulatoryOverride:forAccount:](v45, "set3PRegulatoryOverride:forAccount:", v46, v12);

    int v28 = 1;
  }

  int v59 = v28;
  unsigned __int8 v60 = -[AKUserInfoController _authorizationPropertiesChangedForAccount:userInformation:]( self,  "_authorizationPropertiesChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v61 = -[AKUserInfoController _passkeyPropertiesChangedForAccount:userInformation:]( self,  "_passkeyPropertiesChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v62 = -[AKUserInfoController _walrusPropertiesChangedForAccount:userInformation:]( self,  "_walrusPropertiesChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v63 = -[AKUserInfoController _passcodeAuthPropertiesChangedForAccount:userInformation:]( self,  "_passcodeAuthPropertiesChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v64 = -[AKUserInfoController _deviceListPropertiesChangedForAccount:userInformation:]( self,  "_deviceListPropertiesChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v65 = -[AKUserInfoController _additionalInfoChangedForAccount:userInformation:]( self,  "_additionalInfoChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v70 = -[AKUserInfoController _trustedPhoneNumbersChangedForAccount:userInformation:]( self,  "_trustedPhoneNumbersChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v69 = -[AKUserInfoController _securityKeysChangedForAccount:userInformation:]( self,  "_securityKeysChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v68 = -[AKUserInfoController _loginHandlesChangedForAccount:userInformation:]( self,  "_loginHandlesChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v67 = -[AKUserInfoController _managedAppleIDInfoChangedForAccount:userInformation:]( self,  "_managedAppleIDInfoChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v66 = -[AKUserInfoController _trustedContactPropertiesChangedForAccount:userInformation:]( self,  "_trustedContactPropertiesChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v47 = -[AKUserInfoController _birthYearChangedForAccount:userInformation:]( self,  "_birthYearChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v48 = -[AKUserInfoController _adpCohortChangedForAccount:userInformation:]( self,  "_adpCohortChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v49 = -[AKUserInfoController _edpStateChangedForAccount:userInformation:]( self,  "_edpStateChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v50 = -[AKUserInfoController _passwordVersionChangedForAccount:userInformation:]( self,  "_passwordVersionChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v51 = -[AKUserInfoController _srpProtocolChangedForAccount:userInformation:]( self,  "_srpProtocolChangedForAccount:userInformation:",  v12,  v9);
  unsigned __int8 v52 = -[AKUserInfoController _idmsEDPTokenIdChangedForAccount:userInformation:]( self,  "_idmsEDPTokenIdChangedForAccount:userInformation:",  v12,  v9);
  id v53 = (id)-[AKUserInfoController _piggybackingApprovalEligibleChangedForAccount:userInformation:]( self,  "_piggybackingApprovalEligibleChangedForAccount:userInformation:",  v12,  v9);
  if ((v53 & 1) != 0
    || (v52 & 1) != 0
    || (v51 & 1) != 0
    || (v50 & 1) != 0
    || (v49 & 1) != 0
    || (v48 & 1) != 0
    || (v47 & 1) != 0
    || (v66 & 1) != 0
    || (v67 & 1) != 0
    || (v68 & 1) != 0
    || (v69 & 1) != 0
    || (v70 & 1) != 0
    || (v65 & 1) != 0
    || (v64 & 1) != 0
    || (v63 & 1) != 0
    || (v62 & 1) != 0
    || (v61 & 1) != 0
    || (v60 & 1) != 0
    || v59)
  {
    v56 = self->_accountManager;
    id v74 = 0LL;
    id v54 = -[AKAccountManager saveAccount:error:](v56, "saveAccount:error:", v12, &v74);
    id v53 = v74;
    v55 = v53;
  }

  else
  {
    id v54 = 0LL;
    v55 = 0LL;
  }

  uint64_t v10 = v72;
  if (v71)
  {
    uint64_t v57 = _AKLogSystem(v53);
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
      sub_1001369D4();
    }

    -[AKUserInfoController sendUserInfoChangeNotificationWithPayload:]( self,  "sendUserInfoChangeNotificationWithPayload:",  v11);
  }

  id v8 = v73;
  -[AKUserInfoController updateBirthdayForAltDSID:userInformation:]( self,  "updateBirthdayForAltDSID:userInformation:",  v73,  v9);
  if (v72) {
    v72[2](v72, v54, v55);
  }

LABEL_58:
}

- (BOOL)_piggybackingApprovalEligibleChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  accountManager = self->_accountManager;
  id v8 = a4;
  unsigned int v9 = -[AKAccountManager piggybackingApprovalEligible:]( accountManager,  "piggybackingApprovalEligible:",  v6);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 piggybackingApprovalEligible]);

  id v11 = [v10 BOOLValue];
  if ((v9 ^ v11) == 1) {
    -[AKAccountManager setPiggybackingApprovalEligible:forAccount:]( self->_accountManager,  "setPiggybackingApprovalEligible:forAccount:",  v11,  v6);
  }

  return v9 ^ v11;
}

- (id)_userInfoChangeNotificationDictionaryForAltDSID:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( self->_accountManager,  "authKitAccountWithAltDSID:error:",  v6,  0LL));
  if (v9)
  {
    id v71 = v6;
    [v8 setObject:v6 forKeyedSubscript:AKUserInfoChangedAltDSIDKey];
    id v10 = -[AKAccountManager authenticationModeForAccount:](self->_accountManager, "authenticationModeForAccount:", v9);
    id v11 = [v7 authMode];
    if (v11 != v10 && v11 != 0LL)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
      [v8 setObject:v13 forKeyedSubscript:AKUserInfoChangedAuthModeKey];
    }

    unsigned int v14 = -[AKAccountManager mdmInformationRequiredForAccount:]( self->_accountManager,  "mdmInformationRequiredForAccount:",  v9);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v7 isMdmInfoRequired]);
    id v16 = [v15 BOOLValue];

    if (v14 != (_DWORD)v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
      [v8 setObject:v17 forKeyedSubscript:AKUserInfoChangedMDMInfoRequiredKey];
    }

    id v18 = -[AKAccountManager securityLevelForAccount:](self->_accountManager, "securityLevelForAccount:", v9);
    id v19 = [v7 appleIDSecurityLevel];
    if (v19 != v18 && v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
      [v8 setObject:v20 forKeyedSubscript:AKUserInfoChangedSecurityLevelKey];
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue( -[AKAccountManager hasSOSActiveDeviceForAccount:]( self->_accountManager,  "hasSOSActiveDeviceForAccount:",  v9));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 hasSOSActiveDevice]);
    uint64_t v23 = v22;
    if (v22 && (!v21 || v22 != (void *)v21))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v22 BOOLValue]));
      [v8 setObject:v24 forKeyedSubscript:AKSOSActiveDeviceKey];
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[AKAccountManager isSOSNeededForAccount:](self->_accountManager, "isSOSNeededForAccount:", v9));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 SOSNeeded]);
    id v73 = v26;
    if (v26 && (!v25 || v26 != (void *)v25))
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v26 BOOLValue]));
      [v8 setObject:v27 forKeyedSubscript:AKSOSNeededKey];
    }

    id v28 = -[AKAccountManager repairStateForAccount:](self->_accountManager, "repairStateForAccount:", v9);
    id v29 = [v7 repairState];
    if (v29 != v28 && v29)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v29));
      [v8 setObject:v30 forKeyedSubscript:AKUserInfoChangedRepairStateKey];
    }

    v91 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager webAccessEnabledForAccount:]( self->_accountManager,  "webAccessEnabledForAccount:",  v9));
    v83 = (void *)objc_claimAutoreleasedReturnValue([v7 webAccessEnabled]);
    if (v83)
    {
      if (!v91
        || (unsigned int v31 = [v83 BOOLValue], v31 != objc_msgSend(v91, "BOOLValue")))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v83 BOOLValue]));
        [v8 setObject:v32 forKeyedSubscript:AKWebAccessEnabledKey];
      }
    }

    v90 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager serverExperimentalFeaturesForAccount:]( self->_accountManager,  "serverExperimentalFeaturesForAccount:",  v9));
    v82 = (void *)objc_claimAutoreleasedReturnValue([v7 serverExperimentalFeatures]);
    if (v82)
    {
    }

    v89 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager passkeyEligibleForAccount:]( self->_accountManager,  "passkeyEligibleForAccount:",  v9));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v7 passkeyEligible]);
    if (v81)
    {
      if (!v89
        || (unsigned int v34 = [v81 BOOLValue], v34 != objc_msgSend(v89, "BOOLValue")))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v81 BOOLValue]));
        [v8 setObject:v35 forKeyedSubscript:AKPasskeyEligibleKey];
      }
    }

    v88 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager passkeyPresentForAccount:]( self->_accountManager,  "passkeyPresentForAccount:",  v9));
    v80 = (void *)objc_claimAutoreleasedReturnValue([v7 passkeyPresent]);
    if (v80)
    {
      if (!v88
        || (unsigned int v36 = [v80 BOOLValue], v36 != objc_msgSend(v88, "BOOLValue")))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v80 BOOLValue]));
        [v8 setObject:v37 forKeyedSubscript:AKPasskeyPresentKey];
      }
    }

    v87 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager groupKitEligibilityForAccount:]( self->_accountManager,  "groupKitEligibilityForAccount:",  v9));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v7 groupKitEligibility]);
    if (v79)
    {
    }

    v86 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager inactiveiCloudPrivateEmailCountForAccount:]( self->_accountManager,  "inactiveiCloudPrivateEmailCountForAccount:",  v9));
    v78 = (void *)objc_claimAutoreleasedReturnValue([v7 inActiveHMECount]);
    if (v78)
    {
    }

    v85 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager activeiCloudPrivateEmailCountForAccount:]( self->_accountManager,  "activeiCloudPrivateEmailCountForAccount:",  v9));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v7 activeHMECount]);
    if (v77)
    {
    }

    v76 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager configDataVersionForAccount:]( self->_accountManager,  "configDataVersionForAccount:",  v9));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v7 configDataVersion]);
    if (v75)
    {
      id v41 = v75;
      id v42 = v76;
      if (v42 && [v41 isEqual:v42])
      {
      }

      else
      {

        [v8 setObject:v41 forKeyedSubscript:AKConfigDataVersion];
      }
    }

    v92 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager hasModernRecoveryKeyForAccount:]( self->_accountManager,  "hasModernRecoveryKeyForAccount:",  v9));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v7 hasModernRecoveryKey]);
    v72 = v43;
    if (v43 && (!v92 || v43 != v92))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v43 BOOLValue]));
      [v8 setObject:v44 forKeyedSubscript:AKHasModernRKKey];
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager get3PRegulatoryOverride:](self->_accountManager, "get3PRegulatoryOverride:", v9));
    id v74 = (void *)objc_claimAutoreleasedReturnValue([v7 thirdPartyRegulatoryOverride]);
    if (v74)
    {
      id v46 = v74;
      id v47 = v45;
      if (v47 && [v46 isEqual:v47])
      {
      }

      else
      {

        [v8 setObject:v46 forKeyedSubscript:AK3PRegulatoryOverrideKey];
      }
    }

    unsigned __int8 v67 = v45;
    unsigned __int8 v70 = (void *)v21;
    uint64_t v48 = objc_claimAutoreleasedReturnValue(-[AKAccountManager adpCohortForAccount:](self->_accountManager, "adpCohortForAccount:", v9));
    uint64_t v49 = objc_claimAutoreleasedReturnValue([v7 adpCohort]);
    unsigned __int8 v50 = (void *)v49;
    if (v49 && (!v48 || v49 != v48)) {
      [v8 setObject:v49 forKeyedSubscript:AKADPCohortKey];
    }
    unsigned __int8 v68 = (void *)v25;
    unsigned __int8 v69 = v23;
    uint64_t v51 = objc_claimAutoreleasedReturnValue(-[AKAccountManager edpStateForAccount:](self->_accountManager, "edpStateForAccount:", v9));
    uint64_t v52 = objc_claimAutoreleasedReturnValue([v7 edpState]);
    id v53 = (void *)v52;
    if (v52 && (!v51 || v52 != v51)) {
      [v8 setObject:v52 forKeyedSubscript:AKEDPStateKey];
    }
    unsigned __int8 v65 = (void *)v51;
    id v54 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager passwordVersionForAccount:]( self->_accountManager,  "passwordVersionForAccount:",  v9));
    uint64_t v55 = objc_claimAutoreleasedReturnValue([v7 passwordVersion]);
    v56 = (void *)v55;
    unsigned __int8 v66 = (void *)v48;
    v84 = v8;
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager srpProtocolForAccount:](self->_accountManager, "srpProtocolForAccount:", v9));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v7 srpProtocol]);
    int v59 = v58;
    unsigned __int8 v60 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager idmsEDPTokenIdForAccount:]( self->_accountManager,  "idmsEDPTokenIdForAccount:",  v9));
    unsigned __int8 v61 = (void *)objc_claimAutoreleasedReturnValue([v7 idmsEDPTokenId]);
    unsigned __int8 v62 = v61;

    id v6 = v71;
    id v8 = v84;
  }

  id v63 = [v8 copy];

  return v63;
}

- (BOOL)_passkeyPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 passkeyEligible]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AKAccountManager passkeyEligibleForAccount:](self->_accountManager, "passkeyEligibleForAccount:", v6));
  id v10 = (void *)v9;
  if (!v8
    || v9 && (unsigned int v11 = [v8 BOOLValue], v11 == objc_msgSend(v10, "BOOLValue")))
  {
    BOOL v12 = 0;
  }

  else
  {
    -[AKAccountManager setPasskeyEligible:forAccount:]( self->_accountManager,  "setPasskeyEligible:forAccount:",  [v8 BOOLValue],  v6);
    BOOL v12 = 1;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 passkeyPresent]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[AKAccountManager passkeyPresentForAccount:](self->_accountManager, "passkeyPresentForAccount:", v6));
  BOOL v15 = (void *)v14;
  if (v13)
  {
    if (!v14
      || (unsigned int v16 = [v13 BOOLValue], v16 != objc_msgSend(v15, "BOOLValue")))
    {
      -[AKAccountManager setPasskeyPresent:forAccount:]( self->_accountManager,  "setPasskeyPresent:forAccount:",  [v13 BOOLValue],  v6);
      -[AKAccountManager setPasskeysInKeychainCount:forAccount:]( self->_accountManager,  "setPasskeysInKeychainCount:forAccount:",  0LL,  v6);
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (BOOL)_walrusPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 webAccessEnabled]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[AKAccountManager webAccessEnabledForAccount:](self->_accountManager, "webAccessEnabledForAccount:", v6));
  id v10 = (void *)v9;
  if (!v8
    || v9 && (unsigned int v11 = [v8 BOOLValue], v11 == objc_msgSend(v10, "BOOLValue")))
  {
    BOOL v12 = 0;
  }

  else
  {
    -[AKAccountManager setWebAccessEnabled:forAccount:]( self->_accountManager,  "setWebAccessEnabled:forAccount:",  [v8 BOOLValue],  v6);
    BOOL v12 = 1;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 serverExperimentalFeatures]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue( -[AKAccountManager serverExperimentalFeaturesForAccount:]( self->_accountManager,  "serverExperimentalFeaturesForAccount:",  v6));
  BOOL v15 = (void *)v14;
  if (v13)
  {
    if (!v14 || (id v16 = [v13 integerValue], v16 != objc_msgSend(v15, "integerValue")))
    {
      -[AKAccountManager setServerExperimentalFeatures:forAccount:]( self->_accountManager,  "setServerExperimentalFeatures:forAccount:",  v13,  v6);
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (BOOL)_passcodeAuthPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 passcodeAuthEnabled]);
  id v9 = [v8 BOOLValue];

  unsigned int v10 = v9 ^ -[AKAccountManager isPasscodeAuthEnabledForAccount:]( self->_accountManager,  "isPasscodeAuthEnabledForAccount:",  v6);
  if (v10 == 1) {
    -[AKAccountManager setPasscodeAuthEnabled:forAccount:]( self->_accountManager,  "setPasscodeAuthEnabled:forAccount:",  v9,  v6);
  }
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 askToBuy]);
  id v12 = [v11 BOOLValue];

  if ((_DWORD)v12 != -[AKAccountManager isAskToBuyForAccount:]( self->_accountManager,  "isAskToBuyForAccount:",  v6))
  {
    -[AKAccountManager setAskToBuy:forAccount:](self->_accountManager, "setAskToBuy:forAccount:", v12, v6);
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)_deviceListPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceListVersion]);
  id v9 = [v8 hash];

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager deviceListVersionForAccount:]( self->_accountManager,  "deviceListVersionForAccount:",  v6));
  id v11 = [v10 hash];

  if (v9 != v11)
  {
    accountManager = self->_accountManager;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceListVersion]);
    -[AKAccountManager setDeviceListVersion:forAccount:](accountManager, "setDeviceListVersion:forAccount:", v13, v6);

    -[AKAccountManager saveAccount:error:](self->_accountManager, "saveAccount:error:", v6, 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    LODWORD(v13) = [v14 isDeviceListCacheEnableDryMode];

    if ((_DWORD)v13)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
      id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10005E52C;
      v18[3] = &unk_1001C6538;
      v18[4] = self;
      id v19 = v6;
      dispatch_async(v16, v18);
    }
  }

  return v9 != v11;
}

- (BOOL)_authorizationPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 vettedPrimaryEmail]);
  id v9 = [v8 BOOLValue];

  unsigned int v10 = -[AKAccountManager verifiedPrimaryEmailForAccount:]( self->_accountManager,  "verifiedPrimaryEmailForAccount:",  v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 vettedPrimaryEmail]);
  if (!v11 || (v11, (_DWORD)v9 == v10))
  {
    char v12 = 0;
  }

  else
  {
    -[AKAccountManager setVerifiedPrimaryEmail:forAccount:]( self->_accountManager,  "setVerifiedPrimaryEmail:forAccount:",  v9,  v6);
    char v12 = 1;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 phoneAsAppleID]);
  id v14 = [v13 BOOLValue];

  unsigned int v15 = -[AKAccountManager phoneAsAppleIDForAccount:]( self->_accountManager,  "phoneAsAppleIDForAccount:",  v6);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 phoneAsAppleID]);
  if (v16)
  {

    if ((_DWORD)v14 != v15)
    {
      -[AKAccountManager setPhoneAsAppleID:forAccount:](self->_accountManager, "setPhoneAsAppleID:forAccount:", v14, v6);
      char v12 = 1;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 previouslyWantedPrivateEmail]);
  id v18 = [v17 BOOLValue];

  unsigned int v19 = -[AKAccountManager selectedPrivateEmailForAccount:]( self->_accountManager,  "selectedPrivateEmailForAccount:",  v6);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 previouslyWantedPrivateEmail]);
  if (v20)
  {

    if ((_DWORD)v18 != v19)
    {
      -[AKAccountManager setSelectedPrivateEmail:forAccount:]( self->_accountManager,  "setSelectedPrivateEmail:forAccount:",  v18,  v6);
      char v12 = 1;
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryEmailAddress]);
  uint64_t v22 = objc_claimAutoreleasedReturnValue( -[AKAccountManager primaryEmailAddressForAccount:]( self->_accountManager,  "primaryEmailAddressForAccount:",  v6));
  uint64_t v23 = (void *)v22;
  if (v21 && (!v22 || ([v21 isEqual:v22] & 1) == 0))
  {
    -[AKAccountManager setPrimaryEmailAddress:forAccount:]( self->_accountManager,  "setPrimaryEmailAddress:forAccount:",  v21,  v6);
    char v12 = 1;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 givenName]);
  uint64_t v25 = objc_claimAutoreleasedReturnValue(-[AKAccountManager givenNameForAccount:](self->_accountManager, "givenNameForAccount:", v6));
  id v26 = (void *)v25;
  if (v24 && (!v25 || ([v24 isEqual:v25] & 1) == 0))
  {
    -[AKAccountManager setGivenName:forAccount:](self->_accountManager, "setGivenName:forAccount:", v24, v6);
    char v12 = 1;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v7 familyName]);
  uint64_t v28 = objc_claimAutoreleasedReturnValue(-[AKAccountManager familyNameForAccount:](self->_accountManager, "familyNameForAccount:", v6));
  v85 = v26;
  v92 = (void *)v28;
  if (v27 && (!v28 || ([v27 isEqual:v28] & 1) == 0))
  {
    -[AKAccountManager setFamilyName:forAccount:](self->_accountManager, "setFamilyName:forAccount:", v27, v6);
    char v12 = 1;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v7 forwardingEmail]);
  uint64_t v30 = objc_claimAutoreleasedReturnValue(-[AKAccountManager forwardingEmailForAccount:](self->_accountManager, "forwardingEmailForAccount:", v6));
  v94 = v29;
  v91 = (void *)v30;
  if (v29 && (!v30 || ([v29 isEqual:v30] & 1) == 0))
  {
    -[AKAccountManager setForwardingEmail:forAccount:](self->_accountManager, "setForwardingEmail:forAccount:", v29, v6);
    char v12 = 1;
  }

  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v7 previouslySelectedEmail]);
  uint64_t v32 = objc_claimAutoreleasedReturnValue( -[AKAccountManager selectedAuthorizationEmailForAccount:]( self->_accountManager,  "selectedAuthorizationEmailForAccount:",  v6));
  v93 = v31;
  v87 = v23;
  v88 = v21;
  v90 = (void *)v32;
  if (v31 && (!v32 || ([v31 isEqual:v32] & 1) == 0))
  {
    -[AKAccountManager setSelectedAuthorizationEmail:forAccount:]( self->_accountManager,  "setSelectedAuthorizationEmail:forAccount:",  v31,  v6);
    char v12 = 1;
  }

  uint64_t v33 = objc_claimAutoreleasedReturnValue([v7 reachableEmails]);
  unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v33));
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager reachableEmailAddressesForAccount:]( self->_accountManager,  "reachableEmailAddressesForAccount:",  v6));
  uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v35));

  v89 = (void *)v33;
  v82 = (void *)v36;
  if (v33)
  {
    v37 = v34;
    if (([v34 isEqualToSet:v36] & 1) == 0)
    {
      -[AKAccountManager setReachableEmailAddresses:forAccount:]( self->_accountManager,  "setReachableEmailAddresses:forAccount:",  v89,  v6);
      char v12 = 1;
    }
  }

  else
  {
    v37 = v34;
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 hasUsedAuthorization]);
  id v39 = [v38 BOOLValue];

  unsigned int v40 = -[AKAccountManager authorizationUsedForAccount:]( self->_accountManager,  "authorizationUsedForAccount:",  v6);
  id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 hasUsedAuthorization]);
  if (v41)
  {

    if ((_DWORD)v39 != v40)
    {
      -[AKAccountManager setAuthorizationUsed:forAccount:]( self->_accountManager,  "setAuthorizationUsed:forAccount:",  v39,  v6);
      char v12 = 1;
    }
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue([v7 privateAttestationEnabled]);
  id v43 = [v42 BOOLValue];

  unsigned int v44 = -[AKAccountManager privateAttestationEnabledForAccount:]( self->_accountManager,  "privateAttestationEnabledForAccount:",  v6);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v7 privateAttestationEnabled]);
  if (v45)
  {

    if ((_DWORD)v43 != v44)
    {
      -[AKAccountManager setPrivateAttestationEnabled:forAccount:]( self->_accountManager,  "setPrivateAttestationEnabled:forAccount:",  v43,  v6);
      char v12 = 1;
    }
  }

  id v46 = (void *)objc_claimAutoreleasedReturnValue([v7 isUnderage]);
  id v47 = [v46 BOOLValue];

  unsigned int v48 = -[AKAccountManager userUnderAgeForAccount:](self->_accountManager, "userUnderAgeForAccount:", v6);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v7 isUnderage]);
  if (v49)
  {

    if ((_DWORD)v47 != v48)
    {
      -[AKAccountManager setUserUnderage:forAccount:](self->_accountManager, "setUserUnderage:forAccount:", v47, v6);
      char v12 = 1;
    }
  }

  unsigned __int8 v50 = (void *)objc_claimAutoreleasedReturnValue([v7 isSiwaForChildEnabled]);
  id v51 = [v50 BOOLValue];

  unsigned int v52 = -[AKAccountManager isSiwaEnabledForChildAccount:]( self->_accountManager,  "isSiwaEnabledForChildAccount:",  v6);
  if (-[AKAccountManager userUnderAgeForAccount:](self->_accountManager, "userUnderAgeForAccount:", v6))
  {
    id v53 = v37;
    id v54 = (void *)objc_claimAutoreleasedReturnValue([v7 isSiwaForChildEnabled]);

    if (v54)
    {
      v37 = v53;
      if (v51 != v52)
      {
        -[AKAccountManager setIsSiwaEnabled:forChildAccount:]( self->_accountManager,  "setIsSiwaEnabled:forChildAccount:",  v51,  v6);
        char v12 = 1;
      }
    }

    else
    {
      v37 = v53;
    }
  }

  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v7 isSenior]);
  id v56 = [v55 BOOLValue];

  unsigned int v57 = -[AKAccountManager userIsSeniorForAccount:](self->_accountManager, "userIsSeniorForAccount:", v6);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v7 isSenior]);
  if (v58)
  {

    if ((_DWORD)v56 != v57)
    {
      -[AKAccountManager setUserIsSenior:forAccount:](self->_accountManager, "setUserIsSenior:forAccount:", v56, v6);
      char v12 = 1;
    }
  }

  uint64_t v59 = objc_claimAutoreleasedReturnValue([v7 ageOfMajority]);
  uint64_t v60 = objc_claimAutoreleasedReturnValue(-[AKAccountManager ageOfMajorityForAccount:](self->_accountManager, "ageOfMajorityForAccount:", v6));
  v80 = (void *)v60;
  if (v59 && v59 != v60)
  {
    -[AKAccountManager setAgeOfMajority:forAccount:](self->_accountManager, "setAgeOfMajority:forAccount:", v59, v6);
    char v12 = 1;
  }

  unsigned __int8 v61 = (void *)objc_claimAutoreleasedReturnValue([v7 canAttestAge]);
  uint64_t v62 = objc_claimAutoreleasedReturnValue(-[AKAccountManager canAttestAgeForAccount:](self->_accountManager, "canAttestAgeForAccount:", v6));
  v84 = v27;
  v79 = (void *)v62;
  if (v61 && (void *)v62 != v61)
  {
    -[AKAccountManager setCanAttestAge:forAccount:](self->_accountManager, "setCanAttestAge:forAccount:", v61, v6);
    char v12 = 1;
  }

  id v63 = (void *)objc_claimAutoreleasedReturnValue([v7 appleIDCountryCode]);
  uint64_t v64 = objc_claimAutoreleasedReturnValue(-[AKAccountManager appleIDCountryCodeForAccount:](self->_accountManager, "appleIDCountryCodeForAccount:", v6));
  unsigned __int8 v65 = (void *)v64;
  v86 = v24;
  v83 = v37;
  v81 = (void *)v59;
  if (v63 && (!v64 || ([v63 isEqual:v64] & 1) == 0))
  {
    -[AKAccountManager setAppleIDCountryCode:forAccount:]( self->_accountManager,  "setAppleIDCountryCode:forAccount:",  v63,  v6);
    char v12 = 1;
  }

  v78 = v65;
  unsigned __int8 v66 = (void *)objc_claimAutoreleasedReturnValue([v7 isProximityAuthEligible]);
  uint64_t v67 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[AKAccountManager isProximityAuthEligible:](self->_accountManager, "isProximityAuthEligible:", v6)));
  unsigned __int8 v68 = (void *)v67;
  if (v66 && v66 != (void *)v67)
  {
    -[AKAccountManager setIsProximityAuthEligible:forAccount:]( self->_accountManager,  "setIsProximityAuthEligible:forAccount:",  [v66 BOOLValue],  v6);
    char v12 = 1;
  }

  id v69 = [v7 userAgeRange];
  if (v69 != -[AKAccountManager userAgeRangeForAccount:](self->_accountManager, "userAgeRangeForAccount:", v6))
  {
    -[AKAccountManager setUserAgeRange:forAccount:](self->_accountManager, "setUserAgeRange:forAccount:", v69, v6);
    char v12 = 1;
  }

  BOOL v77 = v12;
  unsigned __int8 v70 = (void *)objc_claimAutoreleasedReturnValue([v7 authorizedApplicationsListVersion]);
  id v71 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v6));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v73 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005ED9C;
  block[3] = &unk_1001C6510;
  id v96 = v70;
  id v97 = v71;
  v98 = self;
  id v74 = v71;
  id v75 = v70;
  dispatch_async(v73, block);

  return v77;
}

- (BOOL)_trustedContactPropertiesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 canHaveCustodian]);
  id v9 = [v8 BOOLValue];

  unsigned int v10 = -[AKAccountManager canHaveCustodianForAccount:]( self->_accountManager,  "canHaveCustodianForAccount:",  v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 canHaveCustodian]);
  if (!v11 || (v11, (_DWORD)v9 == v10))
  {
    BOOL v12 = 0;
  }

  else
  {
    -[AKAccountManager setCanHaveCustodian:forAccount:]( self->_accountManager,  "setCanHaveCustodian:forAccount:",  v9,  v6);
    BOOL v12 = 1;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 canBeCustodian]);
  id v14 = [v13 BOOLValue];

  unsigned int v15 = -[AKAccountManager canBeCustodianForAccount:]( self->_accountManager,  "canBeCustodianForAccount:",  v6);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 canBeCustodian]);
  if (v16)
  {

    if ((_DWORD)v14 != v15)
    {
      -[AKAccountManager setCanBeCustodian:forAccount:](self->_accountManager, "setCanBeCustodian:forAccount:", v14, v6);
      BOOL v12 = 1;
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 custodianEnabled]);
  id v18 = [v17 BOOLValue];

  unsigned int v19 = -[AKAccountManager custodianEnabledForAccount:]( self->_accountManager,  "custodianEnabledForAccount:",  v6);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 custodianEnabled]);
  if (v20)
  {

    if ((_DWORD)v18 != v19)
    {
      -[AKAccountManager setCustodianEnabled:forAccount:]( self->_accountManager,  "setCustodianEnabled:forAccount:",  v18,  v6);
      BOOL v12 = 1;
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 canHaveBeneficiary]);
  id v22 = [v21 BOOLValue];

  unsigned int v23 = -[AKAccountManager canHaveBeneficiaryForAccount:]( self->_accountManager,  "canHaveBeneficiaryForAccount:",  v6);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 canHaveBeneficiary]);
  if (v24)
  {

    if ((_DWORD)v22 != v23)
    {
      -[AKAccountManager setCanHaveBeneficiary:forAccount:]( self->_accountManager,  "setCanHaveBeneficiary:forAccount:",  v22,  v6);
      BOOL v12 = 1;
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v7 canBeBeneficiary]);
  id v26 = [v25 BOOLValue];

  unsigned int v27 = -[AKAccountManager canBeBeneficiaryForAccount:]( self->_accountManager,  "canBeBeneficiaryForAccount:",  v6);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 canBeBeneficiary]);
  if (v28)
  {

    if ((_DWORD)v26 != v27)
    {
      -[AKAccountManager setCanBeBeneficiary:forAccount:]( self->_accountManager,  "setCanBeBeneficiary:forAccount:",  v26,  v6);
      BOOL v12 = 1;
    }
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v7 custodianLastModified]);
  uint64_t v30 = objc_claimAutoreleasedReturnValue( -[AKAccountManager custodianLastModifiedForAccount:]( self->_accountManager,  "custodianLastModifiedForAccount:",  v6));
  unsigned int v52 = (void *)v30;
  if (v29 && v29 != v30)
  {
    -[AKAccountManager setCustodianLastModified:forAccount:]( self->_accountManager,  "setCustodianLastModified:forAccount:",  v29,  v6);
    BOOL v12 = 1;
  }

  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v7 beneficiaryLastModified]);
  uint64_t v32 = objc_claimAutoreleasedReturnValue( -[AKAccountManager beneficiaryLastModifiedForAccount:]( self->_accountManager,  "beneficiaryLastModifiedForAccount:",  v6));
  id v53 = (void *)v29;
  id v51 = (void *)v32;
  if (v31 && v31 != (void *)v32)
  {
    -[AKAccountManager setBeneficiaryLastModified:forAccount:]( self->_accountManager,  "setBeneficiaryLastModified:forAccount:",  v31,  v6);
    BOOL v12 = 1;
  }

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v7 custodianInfos]);
  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[AKAccountManager custodianInfosForAccount:](self->_accountManager, "custodianInfosForAccount:", v6));
  v35 = (void *)v34;
  if (!v33)
  {
    uint64_t v36 = 0LL;
    if (v34) {
      goto LABEL_25;
    }
LABEL_27:
    uint64_t v37 = 0LL;
    goto LABEL_28;
  }

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v33 sortedArrayUsingComparator:&stru_1001C8E60]);

  if (!v35) {
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v37 = objc_claimAutoreleasedReturnValue([v35 sortedArrayUsingComparator:&stru_1001C8E60]);

LABEL_28:
  uint64_t v49 = v37;
  if (v36 && (objc_msgSend(v36, "isEqualToArray:", v37, v37, v51, v52, v53) & 1) == 0)
  {
    -[AKAccountManager setCustodianInfos:forAccount:](self->_accountManager, "setCustodianInfos:forAccount:", v36, v6);
    BOOL v12 = 1;
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "beneficiaryInfo", v49));
  id v39 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager beneficiaryInfoForAccount:]( self->_accountManager,  "beneficiaryInfoForAccount:",  v6));
  uint64_t v40 = objc_claimAutoreleasedReturnValue( +[AKBeneficiaryUpdater removeWrappedKeyFrom:]( &OBJC_CLASS___AKBeneficiaryUpdater,  "removeWrappedKeyFrom:",  v39));
  id v41 = (void *)v40;
  if (v38)
  {
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v38 sortedArrayUsingComparator:&stru_1001C8E80]);

    if (v41)
    {
LABEL_33:
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v41 sortedArrayUsingComparator:&stru_1001C8E80]);

      goto LABEL_36;
    }
  }

  else
  {
    id v42 = 0LL;
    if (v40) {
      goto LABEL_33;
    }
  }

  id v43 = 0LL;
LABEL_36:
  id v44 = [v42 isEqualToArray:v43];
  if ((v44 & 1) == 0)
  {
    uint64_t v45 = _AKLogSystem(v44);
    id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      sub_100136AD4();
    }

    id v47 = (void *)objc_claimAutoreleasedReturnValue( +[AKBeneficiaryUpdater saveWrappedKeyInKeychain:]( &OBJC_CLASS___AKBeneficiaryUpdater,  "saveWrappedKeyInKeychain:",  v42));
    -[AKAccountManager setBeneficiaryInfo:forAccount:](self->_accountManager, "setBeneficiaryInfo:forAccount:", v47, v6);

    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)_adpCohortChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 adpCohort]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AKAccountManager adpCohortForAccount:](self->_accountManager, "adpCohortForAccount:", v6));
  id v9 = (void *)v8;
  if (!v7 || v8 && (id v10 = [v7 integerValue], v10 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v11 = 0;
  }

  else
  {
    -[AKAccountManager setADPCohort:forAccount:](self->_accountManager, "setADPCohort:forAccount:", v7, v6);
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_edpStateChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 edpState]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AKAccountManager edpStateForAccount:](self->_accountManager, "edpStateForAccount:", v6));
  id v9 = (void *)v8;
  if (!v7 || v8 && (id v10 = [v7 integerValue], v10 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v11 = 0;
  }

  else
  {
    -[AKAccountManager setEDPState:forAccount:](self->_accountManager, "setEDPState:forAccount:", v7, v6);
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_passwordVersionChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 passwordVersion]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AKAccountManager passwordVersionForAccount:](self->_accountManager, "passwordVersionForAccount:", v6));
  id v9 = (void *)v8;
  if (!v7 || v8 && (id v10 = [v7 integerValue], v10 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v11 = 0;
  }

  else
  {
    -[AKAccountManager setPasswordVersion:forAccount:](self->_accountManager, "setPasswordVersion:forAccount:", v7, v6);
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_srpProtocolChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 srpProtocol]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AKAccountManager srpProtocolForAccount:](self->_accountManager, "srpProtocolForAccount:", v6));
  id v9 = (void *)v8;
  if (!v7 || v8 && ([v7 isEqualToString:v8] & 1) != 0)
  {
    BOOL v10 = 0;
  }

  else
  {
    -[AKAccountManager setSRPProtocol:forAccount:](self->_accountManager, "setSRPProtocol:forAccount:", v7, v6);
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)_idmsEDPTokenIdChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 idmsEDPTokenId]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AKAccountManager idmsEDPTokenIdForAccount:](self->_accountManager, "idmsEDPTokenIdForAccount:", v6));
  id v9 = (void *)v8;
  if (!v7 || v8 && ([v7 isEqualToString:v8] & 1) != 0)
  {
    BOOL v10 = 0;
  }

  else
  {
    -[AKAccountManager setIdMSEDPTokenId:forAccount:](self->_accountManager, "setIdMSEDPTokenId:forAccount:", v7, v6);
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_refreshApplicationInformationForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)os_transaction_create("com.apple.authkit.authorization-list-update");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKApplicationInformationController sharedController]( &OBJC_CLASS___AKApplicationInformationController,  "sharedController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005FAC4;
  v8[3] = &unk_1001C8EA8;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 fetchAppInformationWithAltDSID:v7 client:0 completion:v8];
}

- (void)refreshAccountUsernamesForAltDSID:(id)a3 withUserInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allAccountNames]);
    if ([v9 count])
    {

      goto LABEL_7;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 userInformationRepresentation]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 phoneAsAppleID]);
    unsigned __int8 v15 = [v14 BOOLValue];

    if ((v15 & 1) != 0)
    {
LABEL_7:
      uint64_t v16 = _AKLogSystem(v10);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updating cached properties for Apple ID accounts with altDSID: %@",  (uint8_t *)&v22,  0xCu);
      }

      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( self->_accountManager,  "authKitAccountWithAltDSID:error:",  v6,  0LL));
      if (v12) {
        unsigned int v18 = -[AKUserInfoController _updateAccount:withUserInformationResponse:modifyAliases:]( self,  "_updateAccount:withUserInformationResponse:modifyAliases:",  v12,  v8,  1LL);
      }
      else {
        unsigned int v18 = 0;
      }
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager appleIDAccountWithAltDSID:]( self->_accountManager,  "appleIDAccountWithAltDSID:",  v6));
      if (v19) {
        v18 |= -[AKUserInfoController _updateAccount:withUserInformationResponse:modifyAliases:]( self,  "_updateAccount:withUserInformationResponse:modifyAliases:",  v19,  v8,  0LL);
      }
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager iCloudAccountForAltDSID:]( self->_accountManager,  "iCloudAccountForAltDSID:",  v6));
      if (v20)
      {
        if (((v18 | -[AKUserInfoController _updateAccount:withUserInformationResponse:modifyAliases:]( self,  "_updateAccount:withUserInformationResponse:modifyAliases:",  v20,  v8,  0LL)) & 1) == 0)
        {
LABEL_17:

          goto LABEL_18;
        }
      }

      else if (!v18)
      {
        goto LABEL_17;
      }

      -[AKUserInfoController _broadcastEmailChangeNotification](self, "_broadcastEmailChangeNotification");
      goto LABEL_17;
    }

    uint64_t v21 = _AKLogSystem(v10);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100136B8C();
    }
  }

  else
  {
    uint64_t v11 = _AKLogSystem(v7);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100136B60();
    }
  }

- (id)previousAccountInfoRefreshDateForAccount:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 previousAccountInfoRefreshDateForAccount:v3]);

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[AKUserDefaults objectForKey:]( &OBJC_CLASS___AKUserDefaults,  "objectForKey:",  AKLastEmailListRequestDateKey));
  }
  id v7 = v6;

  return v7;
}

- (void)_setPreviousAccountInfoRefreshDate:(id)a3 forAccount:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = _AKLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100136BB8();
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  [v9 setPreviousAccountInfoRefreshDate:v6 forAccount:v5];

  +[AKUserDefaults setValue:forKey:]( &OBJC_CLASS___AKUserDefaults,  "setValue:forKey:",  0LL,  AKLastEmailListRequestDateKey);
}

- (BOOL)_updateAccount:(id)a3 withUserInformationResponse:(id)a4 modifyAliases:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userInformationRepresentation]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 accountName]);
  if (v11)
  {
    BOOL v12 = (void *)v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 userInformationRepresentation]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountName]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
    unsigned __int8 v16 = [v14 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      uint64_t v18 = _AKLogSystem(v17);
      unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 138412290;
        id v37 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Username of account %@ is no longer a valid",  (uint8_t *)&v36,  0xCu);
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 userInformationRepresentation]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountName]);
      [v8 setUsername:v21];

      if (!v5) {
        goto LABEL_15;
      }
      int v22 = 1;
LABEL_9:
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager aliasesForAccount:](self->_accountManager, "aliasesForAccount:", v8));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v24));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 userInformationRepresentation]);
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountAliases]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v27));

      id v29 = [v28 isEqual:v25];
      if ((v29 & 1) != 0)
      {

        if (!v22)
        {
          BOOL v23 = 0;
          goto LABEL_16;
        }
      }

      else
      {
        uint64_t v30 = _AKLogSystem(v29);
        unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412546;
          id v37 = v8;
          __int16 v38 = 2112;
          id v39 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Updating full list of account names for %@ to: %@",  (uint8_t *)&v36,  0x16u);
        }

        accountManager = self->_accountManager;
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v9 userInformationRepresentation]);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 accountAliases]);
        -[AKAccountManager setAliases:forAccount:](accountManager, "setAliases:forAccount:", v34, v8);
      }

- (void)_broadcastEmailChangeNotification
{
  uint64_t v2 = _AKLogSystem(self);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100136C2C();
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v5 = AKAppleIDEmailsDidChangeNotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, AKAppleIDEmailsDidChangeNotification, 0LL, 0LL, 1u);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:v5 object:0];
}

- (void)sendUserInfoChangeNotificationWithPayload:(id)a3
{
}

- (void)_sendNotification:(id)a3 withUserInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _AKLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Posting %@ with payload: %@",  (uint8_t *)&v11,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v9 postNotificationName:v5 object:0 userInfo:v6 deliverImmediately:1];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 postNotificationName:v5 object:0 userInfo:v6];
}

- (id)authorizationUserInformationForRequest:(id)a3 shouldRequestUpdate:(BOOL *)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v8 = _AKLogSiwa(v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100136D24();
  }

  uint64_t v10 = v6;
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 authkitAccount]);
  id v12 = -[AKAccountManager authorizationUsedForAccount:](self->_accountManager, "authorizationUsedForAccount:", v11);
  unsigned __int8 v13 = -[AKAccountManager verifiedPrimaryEmailForAccount:]( self->_accountManager,  "verifiedPrimaryEmailForAccount:",  v11);
  unsigned int v14 = -[AKAccountManager phoneAsAppleIDForAccount:]( self->_accountManager,  "phoneAsAppleIDForAccount:",  v11);
  id v15 = -[AKAccountManager userUnderAgeForAccount:](self->_accountManager, "userUnderAgeForAccount:", v11);
  id v16 = -[AKAccountManager isSiwaEnabledForChildAccount:](self->_accountManager, "isSiwaEnabledForChildAccount:", v11);
  unsigned int v90 = -[AKAccountManager userIsSeniorForAccount:](self->_accountManager, "userIsSeniorForAccount:", v11);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager ageOfMajorityForAccount:](self->_accountManager, "ageOfMajorityForAccount:", v11));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager givenNameForAccount:](self->_accountManager, "givenNameForAccount:", v11));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager familyNameForAccount:](self->_accountManager, "familyNameForAccount:", v11));
  v95 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager primaryEmailAddressForAccount:]( self->_accountManager,  "primaryEmailAddressForAccount:",  v11));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v11));
  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[AKAccountManager iCloudAccountForAltDSID:](self->_accountManager, "iCloudAccountForAltDSID:"));
  v94 = (void *)v19;
  unsigned __int8 v86 = v13;
  unsigned int v87 = v14;
  if (v17 && v18)
  {
    uint64_t v21 = (uint64_t)v18;
  }

  else
  {
    uint64_t v22 = _AKLogSiwa(v19, v20);
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "The Given/Family Name for the current user was not found in the AuthKit account",  buf,  2u);
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[AKAccountManager givenNameForAccount:](self->_accountManager, "givenNameForAccount:", v94));
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[AKAccountManager familyNameForAccount:](self->_accountManager, "familyNameForAccount:", v94));

    if (a4) {
      *a4 = 1;
    }
    uint64_t v17 = (void *)v24;
  }

  uint64_t v25 = objc_alloc_init(&OBJC_CLASS___AKUserInformation);
  -[AKUserInformation setGivenName:](v25, "setGivenName:", v17);
  v89 = (void *)v21;
  -[AKUserInformation setFamilyName:](v25, "setFamilyName:", v21);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  -[AKUserInformation setHasUsedAuthorization:](v25, "setHasUsedAuthorization:", v26);

  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[AKUsernameFormatter formattedUsernameFromUsername:]( &OBJC_CLASS___AKUsernameFormatter,  "formattedUsernameFromUsername:",  v27));
  -[AKUserInformation setAccountName:](v25, "setAccountName:", v28);

  -[AKUserInformation setPrimaryEmailAddress:](v25, "setPrimaryEmailAddress:", v95);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
  -[AKUserInformation setIsUnderage:](v25, "setIsUnderage:", v29);

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
  -[AKUserInformation setIsSiwaForChildEnabled:](v25, "setIsSiwaForChildEnabled:", v30);

  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v90));
  -[AKUserInformation setIsSenior:](v25, "setIsSenior:", v31);

  -[AKUserInformation setAgeOfMajority:](v25, "setAgeOfMajority:", v93);
  -[AKUserInformation setAppleIDSecurityLevel:]( v25,  "setAppleIDSecurityLevel:",  -[AKAccountManager securityLevelForAccount:](self->_accountManager, "securityLevelForAccount:", v11));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager hasSOSActiveDeviceForAccount:]( self->_accountManager,  "hasSOSActiveDeviceForAccount:",  v11));
  -[AKUserInformation setHasSOSActiveDevice:](v25, "setHasSOSActiveDevice:", v32);

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager isSOSNeededForAccount:](self->_accountManager, "isSOSNeededForAccount:", v11));
  -[AKUserInformation setSOSNeeded:](v25, "setSOSNeeded:", v33);

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager configDataVersionForAccount:]( self->_accountManager,  "configDataVersionForAccount:",  v11));
  -[AKUserInformation setConfigDataVersion:](v25, "setConfigDataVersion:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager hasModernRecoveryKeyForAccount:]( self->_accountManager,  "hasModernRecoveryKeyForAccount:",  v11));
  -[AKUserInformation setHasModernRecoveryKey:](v25, "setHasModernRecoveryKey:", v35);

  int v36 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager get3PRegulatoryOverride:](self->_accountManager, "get3PRegulatoryOverride:", v11));
  -[AKUserInformation setThirdPartyRegulatoryOverride:](v25, "setThirdPartyRegulatoryOverride:", v36);

  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager adpCohortForAccount:](self->_accountManager, "adpCohortForAccount:", v11));
  -[AKUserInformation setAdpCohort:](v25, "setAdpCohort:", v37);

  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager edpStateForAccount:](self->_accountManager, "edpStateForAccount:", v11));
  -[AKUserInformation setEdpState:](v25, "setEdpState:", v38);

  id v39 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager passwordVersionForAccount:]( self->_accountManager,  "passwordVersionForAccount:",  v11));
  -[AKUserInformation setPasswordVersion:](v25, "setPasswordVersion:", v39);

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager srpProtocolForAccount:](self->_accountManager, "srpProtocolForAccount:", v11));
  -[AKUserInformation setSrpProtocol:](v25, "setSrpProtocol:", v40);

  id v41 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager idmsEDPTokenIdForAccount:](self->_accountManager, "idmsEDPTokenIdForAccount:", v11));
  -[AKUserInformation setIdmsEDPTokenId:](v25, "setIdmsEDPTokenId:", v41);

  if (-[AKUserInformation isManagedAppleID](v25, "isManagedAppleID"))
  {
    id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKAccountManager managedOrganizationTypeForAccount:]( self->_accountManager,  "managedOrganizationTypeForAccount:",  v11)));
    -[AKUserInformation setManagedOrganizationType:](v25, "setManagedOrganizationType:", v42);

    id v43 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager managedOrganizationNameForAccount:]( self->_accountManager,  "managedOrganizationNameForAccount:",  v11));
    -[AKUserInformation setManagedOrganizationName:](v25, "setManagedOrganizationName:", v43);

    id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[AKAccountManager isNotificationEmailAvailableForAccount:]( self->_accountManager,  "isNotificationEmailAvailableForAccount:",  v11)));
    -[AKUserInformation setIsNotificationEmailAvailable:](v25, "setIsNotificationEmailAvailable:", v44);

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager notificationEmailForAccount:]( self->_accountManager,  "notificationEmailForAccount:",  v11));
    -[AKUserInformation setNotificationEmail:](v25, "setNotificationEmail:", v45);

    -[AKUserInformation setAuthMode:]( v25,  "setAuthMode:",  -[AKAccountManager authenticationModeForAccount:](self->_accountManager, "authenticationModeForAccount:", v11));
  }

  v91 = v10;
  id v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestedScopes", a5));
  unsigned __int8 v47 = [v46 containsObject:AKAuthorizationScopeEmail];

  if ((v47 & 1) != 0)
  {
    uint64_t v50 = _AKLogSystem(v48);
    id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      sub_100136CF8();
    }

    id v52 = (id)objc_claimAutoreleasedReturnValue(-[AKAccountManager forwardingEmailForAccount:](self->_accountManager, "forwardingEmailForAccount:", v11));
    id v53 = -[AKAccountManager selectedPrivateEmailForAccount:]( self->_accountManager,  "selectedPrivateEmailForAccount:",  v11);
    id v54 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager selectedAuthorizationEmailForAccount:]( self->_accountManager,  "selectedAuthorizationEmailForAccount:",  v11));
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager combinedAliasesAndReachableEmailsForAccount:]( self->_accountManager,  "combinedAliasesAndReachableEmailsForAccount:",  v11));
    id v56 = [v55 mutableCopy];

    unsigned int v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v53));
    -[AKUserInformation setPreviouslyWantedPrivateEmail:](v25, "setPreviouslyWantedPrivateEmail:", v57);

    id v58 = -[AKUserInformation setPreviouslySelectedEmail:](v25, "setPreviouslySelectedEmail:", v54);
    if (v87)
    {
      uint64_t v60 = _AKLogSiwa(v58, v59);
      unsigned __int8 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "This is a Mako Account, Ignoring primary email address verification",  buf,  2u);
      }

      id v62 = [v56 count];
      if (v62)
      {
        uint64_t v64 = _AKLogSiwa(v62, v63);
        unsigned __int8 v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
          sub_100136CA0();
        }

        -[AKUserInformation setReachableEmails:](v25, "setReachableEmails:", v56);
        if (v52)
        {
          id v62 = -[AKUserInformation setForwardingEmail:](v25, "setForwardingEmail:", v52);
        }

        else
        {
          id v74 = (void *)objc_claimAutoreleasedReturnValue([v56 firstObject]);
          -[AKUserInformation setForwardingEmail:](v25, "setForwardingEmail:", v74);
        }
      }

      uint64_t v75 = _AKLogSiwa(v62, v63);
      v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v97 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "Completed getting UserInformation for Mako account with UserInfo:\n%@",  buf,  0xCu);
      }

      unsigned __int8 v68 = v25;
LABEL_42:
      id v69 = v89;
LABEL_43:

      goto LABEL_44;
    }

    if (v52)
    {
      -[AKUserInformation setForwardingEmail:](v25, "setForwardingEmail:", v52);
      id v69 = v89;
LABEL_29:
      [v56 insertObject:v52 atIndex:0];

      goto LABEL_32;
    }

    if ((v86 & 1) != 0)
    {
      id v52 = v95;
      -[AKUserInformation setForwardingEmail:](v25, "setForwardingEmail:", v52);
      id v69 = v89;
      if (v52) {
        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v78 = _AKLogSiwa(v58, v59);
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        sub_100136CCC();
      }

      uint64_t v80 = objc_claimAutoreleasedReturnValue(-[AKUserInformation reachableEmails](v25, "reachableEmails"));
      if (!v80
        || (v81 = (void *)v80,
            v82 = (void *)objc_claimAutoreleasedReturnValue(-[AKUserInformation reachableEmails](v25, "reachableEmails")),
            id v83 = [v82 count],
            v82,
            v81,
            !v83))
      {
        unsigned __int8 v68 = 0LL;
        if (v85) {
          void *v85 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7072LL));
        }
        goto LABEL_42;
      }

      -[AKUserInformation setForwardingEmail:](v25, "setForwardingEmail:", 0LL);
      id v69 = v89;
    }

- (BOOL)_additionalInfoChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 additionalInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager additionalInfoForAccount:](self->_accountManager, "additionalInfoForAccount:", v6));
  if (v8 && ([v8 isEqualToDictionary:v9] & 1) == 0)
  {
    -[AKAccountManager setAdditionalInfo:forAccount:](self->_accountManager, "setAdditionalInfo:forAccount:", v8, v6);
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 hasMDM]);
  id v12 = [v11 BOOLValue];

  unsigned int v13 = -[AKAccountManager hasMDMForAccount:](self->_accountManager, "hasMDMForAccount:", v6);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 hasMDM]);

  if (v14)
  {

    if ((_DWORD)v12 != v13)
    {
      -[AKAccountManager setHasMDM:forAccount:](self->_accountManager, "setHasMDM:forAccount:", v12, v6);
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (BOOL)_trustedPhoneNumbersChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 trustedPhoneNumbers]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager trustedPhoneNumbersForAccount:]( self->_accountManager,  "trustedPhoneNumbersForAccount:",  v6));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  if (v7 && ([v8 isEqualToSet:v10] & 1) == 0)
  {
    -[AKAccountManager setTrustedPhoneNumbers:forAccount:]( self->_accountManager,  "setTrustedPhoneNumbers:forAccount:",  v7,  v6);
    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_securityKeysChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 securityKeys]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager securityKeysForAccount:](self->_accountManager, "securityKeysForAccount:", v6));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  if (v7 && ([v8 isEqualToSet:v10] & 1) == 0)
  {
    -[AKAccountManager setSecurityKeys:forAccount:](self->_accountManager, "setSecurityKeys:forAccount:", v7, v6);
    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_loginHandlesChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 loginHandles]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager loginHandlesForAccount:](self->_accountManager, "loginHandlesForAccount:", v6));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  if (v7 && ([v8 isEqualToSet:v10] & 1) == 0)
  {
    -[AKAccountManager setLoginHandles:forAccount:](self->_accountManager, "setLoginHandles:forAccount:", v7, v6);
    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_managedAppleIDInfoChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isManagedAppleID])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKAccountManager managedOrganizationTypeForAccount:]( self->_accountManager,  "managedOrganizationTypeForAccount:",  v6)));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 managedOrganizationType]);
    BOOL v10 = v9;
    if (v9 && ([v9 isEqual:v8] & 1) == 0)
    {
      -[AKAccountManager setManagedOrganizationType:forAccount:]( self->_accountManager,  "setManagedOrganizationType:forAccount:",  [v10 integerValue],  v6);
      int v11 = 1;
    }

    else
    {
      int v11 = 0;
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[AKAccountManager managedOrganizationNameForAccount:]( self->_accountManager,  "managedOrganizationNameForAccount:",  v6));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 managedOrganizationName]);
    id v15 = v14;
    uint64_t v24 = (void *)v13;
    if (v14 && ([v14 isEqual:v13] & 1) == 0)
    {
      -[AKAccountManager setManagedOrganizationName:forAccount:]( self->_accountManager,  "setManagedOrganizationName:forAccount:",  v15,  v6);
      int v11 = 1;
    }

    unsigned int v16 = -[AKAccountManager isNotificationEmailAvailableForAccount:]( self->_accountManager,  "isNotificationEmailAvailableForAccount:",  v6);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 isNotificationEmailAvailable]);
    id v18 = [v17 BOOLValue];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 isNotificationEmailAvailable]);
    if (v19)
    {

      if (v16 != (_DWORD)v18)
      {
        -[AKAccountManager setIsNotificationEmailAvailable:forAccount:]( self->_accountManager,  "setIsNotificationEmailAvailable:forAccount:",  v18,  v6);
        int v11 = 1;
      }
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager notificationEmailForAccount:]( self->_accountManager,  "notificationEmailForAccount:",  v6));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 notificationEmail]);
    uint64_t v22 = v21;
    if (v21 && ([v21 isEqual:v20] & 1) == 0)
    {
      -[AKAccountManager setNotificationEmail:forAccount:]( self->_accountManager,  "setNotificationEmail:forAccount:",  v22,  v6);
      int v11 = 1;
    }

    BOOL v12 = v11 != 0;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_refreshDeviceListForAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AKDeviceListRequester);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
  id v7 = objc_opt_new(&OBJC_CLASS___AKCDPFactory);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  int v11 = -[AKDeviceListRequester initWithStoreManager:cdpFactory:accountManager:client:]( v5,  "initWithStoreManager:cdpFactory:accountManager:client:",  v6,  v7,  v8,  0LL);

  id v9 = objc_alloc_init(&OBJC_CLASS___AKDeviceListRequestContext);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v4));

  -[AKDeviceListRequestContext setAltDSID:](v9, "setAltDSID:", v10);
  -[AKDeviceListRequestContext setForceFetch:](v9, "setForceFetch:", 1LL);
  -[AKDeviceListRequestContext setIncludeUntrustedDevices:](v9, "setIncludeUntrustedDevices:", 1LL);
  -[AKDeviceListRequester fetchDeviceListWithContext:completionHandler:]( v11,  "fetchDeviceListWithContext:completionHandler:",  v9,  &stru_1001C8EE8);
}

- (BOOL)_birthYearChangedForAccount:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  accountManager = self->_accountManager;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager birthYearForAccount:](accountManager, "birthYearForAccount:", v6));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 birthYear]);

  if (!v10 || v9 && (id v11 = [v10 integerValue], v11 == objc_msgSend(v9, "integerValue")))
  {
    BOOL v12 = 0;
  }

  else
  {
    -[AKAccountManager setBirthYear:forAccount:](self->_accountManager, "setBirthYear:forAccount:", v10, v6);
    BOOL v12 = 1;
  }

  return v12;
}

- (void)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___AKBirthDayKeychain);
  id v23 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKBirthDayKeychain fetchBirthDayForAltDSID:error:](v7, "fetchBirthDayForAltDSID:error:", v5, &v23));
  id v9 = v23;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authKitAccountWithAltDSID:v5 error:0]);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v6 birthMonth]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 birthDay]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 birthYear]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@",  v12,  v13,  v14));

  unsigned int v16 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v16, "setDateFormat:", @"MM-dd-yyyy");
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSDate);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v16, "dateFromString:", v15));

  if (v18 != v8)
  {
    uint64_t v20 = _AKLogSystem(v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100136E10();
    }

    uint64_t v22 = 0LL;
    -[AKBirthDayKeychain updateBirthdayForAltDSID:userInformation:error:]( v7,  "updateBirthdayForAltDSID:userInformation:error:",  v5,  v6,  &v22);
  }
}

- (void).cxx_destruct
{
}

@end