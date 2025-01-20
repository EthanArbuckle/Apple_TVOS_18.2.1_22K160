@interface AKAuthorizationCredentialStateController
- (AKAccountManager)accountManager;
- (AKAuthorizationCredentialStateController)init;
- (AKAuthorizationCredentialStateController)initWithClient:(id)a3;
- (AKAuthorizationCredentialStateController)initWithClient:(id)a3 accountManager:(id)a4 localAccountsStorageController:(id)a5 sharedAccountsStorageController:(id)a6;
- (AKAuthorizationStoring)localAccountsStorageController;
- (AKClient)client;
- (BOOL)_demoModeEnabled;
- (BOOL)_isCapableOfSilentAuthForRequest:(id)a3;
- (BOOL)_verifyUserID:(id)a3 forAltDSID:(id)a4;
- (id)_fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4;
- (id)_fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4;
- (int64_t)_internalCredentialStateForUserState:(int64_t)a3 error:(id)a4;
- (int64_t)_sanitizedCredentialStateForExternalClients:(int64_t)a3;
- (int64_t)getInternalCredentialStateForCredentialRequestContext:(id)a3;
- (void)_getLocalCredentialStateWithStateRequest:(id)a3 completion:(id)a4;
- (void)_verifyClientInformationForRequest:(id)a3 completion:(id)a4;
- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4;
- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setLocalAccountsStorageController:(id)a3;
@end

@implementation AKAuthorizationCredentialStateController

- (AKAuthorizationCredentialStateController)init
{
  return 0LL;
}

- (AKAuthorizationCredentialStateController)initWithClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AKAuthorizationCredentialStateController;
  v6 = -[AKAuthorizationCredentialStateController init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v7->_accountManager;
    v7->_accountManager = (AKAccountManager *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[AKAuthorizationStoreManager sharedInstance](&OBJC_CLASS___AKAuthorizationStoreManager, "sharedInstance"));
    localAccountsStorageController = v7->_localAccountsStorageController;
    v7->_localAccountsStorageController = (AKAuthorizationStoring *)v10;
  }

  return v7;
}

- (AKAuthorizationCredentialStateController)initWithClient:(id)a3 accountManager:(id)a4 localAccountsStorageController:(id)a5 sharedAccountsStorageController:(id)a6
{
  return 0LL;
}

- (void)getCredentialStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKAuthorizationCredentialStateController _demoModeEnabled](self, "_demoModeEnabled");
  if (!v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 clientID]);

    if (!v12)
    {
      uint64_t v15 = _AKLogSiwa(v13, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Credential state request does not contain clientID, reverting to XPC client information.",  buf,  2u);
      }

      uint64_t v19 = _AKLogSiwa(v17, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
        *(_DWORD *)buf = 138412290;
        v56 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Setting clientID to %@", buf, 0xCu);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
      [v6 setClientID:v22];
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 teamID]);

    if (!v23)
    {
      uint64_t v26 = _AKLogSiwa(v24, v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Credential state does not contain teamID, reverting to XPC client information.",  buf,  2u);
      }

      uint64_t v30 = _AKLogSiwa(v28, v29);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient teamID](self->_client, "teamID"));
        *(_DWORD *)buf = 138412290;
        v56 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Setting teamID to %@", buf, 0xCu);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient teamID](self->_client, "teamID"));
      [v6 setTeamID:v33];
    }

    if (-[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess")) {
      goto LABEL_20;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue([v6 clientID]);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
    if ([v34 isEqualToString:v35])
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v6 teamID]);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient teamID](self->_client, "teamID"));
      unsigned __int8 v38 = [v36 isEqualToString:v37];

      if ((v38 & 1) != 0)
      {
LABEL_20:
        v40 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

        if (v40)
        {
          uint64_t v43 = _AKLogSiwa(v41, v42);
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "AltDSID is included in the State Request,this should only be happening in testing",  buf,  2u);
          }

          goto LABEL_30;
        }

        uint64_t v51 = objc_claimAutoreleasedReturnValue( -[AKAccountManager altDSIDForAuthKitAccountRequestingAuthorization]( self->_accountManager,  "altDSIDForAuthKitAccountRequestingAuthorization"));
        if (v51)
        {
          v44 = (os_log_s *)v51;
          [v6 setAltDSID:v51];
LABEL_30:

          [v6 setShouldIgnoreUserID:0];
          [v6 setShouldIgnoreTeamID:0];
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_10006E59C;
          v52[3] = &unk_1001C9220;
          v52[4] = self;
          id v53 = v6;
          id v54 = v7;
          -[AKAuthorizationCredentialStateController _verifyClientInformationForRequest:completion:]( self,  "_verifyClientInformationForRequest:completion:",  v53,  v52);

          goto LABEL_31;
        }

        uint64_t v49 = -7022LL;
LABEL_27:
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v49));
        (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 2LL, v50);

        goto LABEL_31;
      }
    }

    else
    {
    }

    uint64_t v45 = _AKLogSystem(v39);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient teamID](self->_client, "teamID"));
      *(_DWORD *)buf = 138412546;
      v56 = v47;
      __int16 v57 = 2112;
      v58 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Requested Credential state does not match XPC client's bundleID (%@) or teamID (%@), returning AKAuthenticationE rrorInvalidContext",  buf,  0x16u);
    }

    uint64_t v49 = -7044LL;
    goto LABEL_27;
  }

  uint64_t v10 = _AKLogSiwa(v8, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "This is an internal build with Demo mode for Authorization activated, returning 'NOT FOUND' credential state",  buf,  2u);
  }

  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 2LL, 0LL);
LABEL_31:
}

- (int64_t)getInternalCredentialStateForCredentialRequestContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationCredentialStateRequest);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizationRequest]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 teamID]);
  [v5 setTeamID:v7];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentifier]);
  [v5 setUserID:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 clientID]);
  [v5 setClientID:v9];

  objc_msgSend(v5, "setShouldIgnoreTeamID:", objc_msgSend(v4, "_isWebLogin"));
  [v5 setShouldIgnoreUserID:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 clientID]);

  if (!v10)
  {
    uint64_t v13 = _AKLogSiwa(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Credential state request does not contain clientID, reverting to XPC client information.",  (uint8_t *)&buf,  2u);
    }

    uint64_t v17 = _AKLogSiwa(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Setting clientID to %@",  (uint8_t *)&buf,  0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
    [v5 setClientID:v20];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v5 teamID]);
  BOOL v22 = v21 == 0LL;

  if (v22)
  {
    uint64_t v25 = _AKLogSiwa(v23, v24);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Credential state does not contain teamID, reverting to XPC client information.",  (uint8_t *)&buf,  2u);
    }

    uint64_t v29 = _AKLogSiwa(v27, v28);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient teamID](self->_client, "teamID"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Setting teamID to %@", (uint8_t *)&buf, 0xCu);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient teamID](self->_client, "teamID"));
    [v5 setTeamID:v32];
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x2020000000LL;
  uint64_t v38 = 2LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10006E9F0;
  v35[3] = &unk_1001C9248;
  v35[4] = self;
  v35[5] = &buf;
  -[AKAuthorizationCredentialStateController _verifyClientInformationForRequest:completion:]( self,  "_verifyClientInformationForRequest:completion:",  v5,  v35);
  int64_t v33 = *(void *)(*((void *)&buf + 1) + 24LL);
  _Block_object_dispose(&buf, 8);

  return v33;
}

- (void)getCredentialStateForClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Attempting private call to fetch credential state for clientID: %@",  buf,  0xCu);
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___AKAuthorizationCredentialStateRequest);
  [v11 setClientID:v6];
  [v11 setShouldIgnoreTeamID:1];
  [v11 setShouldIgnoreUserID:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006EB70;
  v13[3] = &unk_1001C9270;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  -[AKAuthorizationCredentialStateController _verifyClientInformationForRequest:completion:]( self,  "_verifyClientInformationForRequest:completion:",  v11,  v13);
}

- (void)_verifyClientInformationForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void *))a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 teamID]);
  if (!v8 || (v9 = (void *)v8, unsigned int v10 = [v6 shouldIgnoreTeamID], v9, v10))
  {
    BOOL v11 = -[AKClient hasInternalEntitledAccess](self->_client, "hasInternalEntitledAccess");
    BOOL v12 = v11;
    uint64_t v14 = _AKLogSiwa(v11, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (!v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100138310(v16, v20, v21, v22, v23, v24, v25, v26);
      }

      uint64_t v27 = -7073LL;
      goto LABEL_15;
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client has internal entitlements and does not have a teamID",  v38,  2u);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 clientID]);

  if (!v17)
  {
    uint64_t v28 = _AKLogSiwa(v18, v19);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1001382E0(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    uint64_t v27 = -7074LL;
LABEL_15:
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v27));
    v7[2](v7, 2LL, v37);

    goto LABEL_16;
  }

  -[AKAuthorizationCredentialStateController _getLocalCredentialStateWithStateRequest:completion:]( self,  "_getLocalCredentialStateWithStateRequest:completion:",  v6,  v7);
LABEL_16:
}

- (int64_t)_internalCredentialStateForUserState:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 != 3 || v5)
  {
  }

  else
  {
    a3 = 3LL;
  }

  return a3;
}

- (void)_getLocalCredentialStateWithStateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager altDSIDForAuthKitAccountRequestingAuthorization]( self->_accountManager,  "altDSIDForAuthKitAccountRequestingAuthorization"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 clientID]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationCredentialStateController _fetchDeveloperTeamWithClientID:withAltDSID:]( self,  "_fetchDeveloperTeamWithClientID:withAltDSID:",  v9,  v8));

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 apps]);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v6 clientID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

  if (v13)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 teamID]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 teamID]);
    unsigned int v18 = [v16 isEqualToString:v17];

    if (v18)
    {
      id v19 = v10;
      if (v19)
      {
LABEL_4:
        v116 = v7;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 userIdentifier]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 userID]);
        unsigned int v117 = [v20 isEqualToString:v21];

        id v119 = v19;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 userIdentifier]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 userID]);
        unsigned int v24 = [v22 isEqualToString:v23];

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 transferState]);
        unsigned int v26 = [v25 isEqualToString:AKAuthorizationTransferStateTransferred];

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v13 transferState]);
        unsigned int v28 = [v27 isEqualToString:AKAuthorizationTransferStateExpired];

        id v29 = [v13 state];
        id v31 = v29;
        unsigned int v115 = v28;
        if ((v26 & 1) != 0 || v28)
        {
          uint64_t v44 = objc_claimAutoreleasedReturnValue([v6 userID]);
          unsigned int v45 = v24;
          id v46 = v6;
          v47 = v13;
          v48 = v10;
          uint64_t v49 = v8;
          v50 = (void *)v44;
          unsigned int v32 = -[AKAuthorizationCredentialStateController _verifyUserID:forAltDSID:]( self,  "_verifyUserID:forAltDSID:",  v44,  v49);

          uint64_t v8 = v49;
          unsigned int v10 = v48;
          uint64_t v13 = v47;
          id v6 = v46;
          unsigned int v24 = v45;
        }

        else
        {
          unsigned int v32 = 0;
        }

        unsigned int v51 = v117;
        if (v31 == (id)3)
        {
          uint64_t v52 = _AKLogSiwa(v29, v30);
          id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            sub_100138400(v53, v54, v55, v56, v57, v58, v59, v60);
          }

          uint64_t v63 = _AKLogSiwa(v61, v62);
          v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            sub_100138340(v13, v10, v64);
          }

          unsigned int v32 = 0;
          unsigned int v115 = 0;
          unsigned int v26 = 0;
          unsigned int v51 = 0;
          int v65 = 1;
          uint64_t v113 = 1LL;
LABEL_22:
          v118 = v10;
          if (((v51 | v24) & 1) == 0 && (v32 & 1) == 0)
          {
            id v29 = [v6 shouldIgnoreUserID];
            if ((v29 & 1) == 0)
            {
              v84 = v8;
              uint64_t v85 = _AKLogSiwa(v29, v30);
              v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "Application has a credential, failed user identifier validation.",  buf,  2u);
              }

              v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7091LL));
              id v7 = v116;
              ((void (**)(id, id, void *))v116)[2](v116, (id)2, v87);

              uint64_t v8 = v84;
              goto LABEL_61;
            }
          }

          v114 = v8;
          int v66 = v51 | v65;
          int v67 = v26 ^ 1;
          int v68 = v66 | v26 ^ 1;
          int v69 = v32 ^ 1;
          if ((v68 & 1) == 0 && (v69 & 1) == 0)
          {
            uint64_t v70 = _AKLogSiwa(v29, v30);
            v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Application in transferred state with unsafe matching user identifier (to be verified by IdMS).",  buf,  2u);
            }

            id v7 = v116;
            v116[2](v116, (id)3, 0LL);
            goto LABEL_30;
          }

          if (((v68 | v32) & 1) == 0)
          {
            id v29 = [v6 shouldIgnoreUserID];
            if ((v29 & 1) == 0)
            {
              uint64_t v88 = _AKLogSiwa(v29, v30);
              v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "Application in transferred state with no matching user identifier.",  buf,  2u);
              }

              v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7091LL));
              id v7 = v116;
              ((void (**)(id, id, void *))v116)[2](v116, (id)2, v90);

              goto LABEL_30;
            }
          }

          unsigned int v77 = v51;
          int v78 = v115 ^ 1;
          int v79 = v66 | v115 ^ 1;
          if ((v79 | v69) & 1) != 0 || (id v29 = [v6 shouldIgnoreUserID], (v29))
          {
            id v19 = v119;
            if (((v79 | v32) & 1) == 0)
            {
              id v29 = [v6 shouldIgnoreUserID];
              if ((v29 & 1) == 0)
              {
                uint64_t v97 = _AKLogSiwa(v29, v30);
                v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
                if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "Application in expired state with no matching user identifier.",  buf,  2u);
                }

                uint64_t v99 = -7091LL;
                goto LABEL_82;
              }
            }

            int v80 = HIDWORD(v113) | v24 ^ 1;
            if (((v80 | v67) & 1) == 0)
            {
              uint64_t v92 = _AKLogSiwa(v29, v30);
              v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "Application in transfered state with strongly matching alternate user identifier.",  buf,  2u);
              }

              id v7 = v116;
              v116[2](v116, (id)3, 0LL);
              goto LABEL_88;
            }

            if (((v80 | v78) & 1) != 0
              || (id v29 = [v6 shouldIgnoreUserID], (v29 & 1) != 0))
            {
              if (((HIDWORD(v113) | v113 | v67) & 1) != 0)
              {
                if (((HIDWORD(v113) | v113 | v78) & 1) != 0)
                {
                  if (((v77 | HIDWORD(v113) | v78) & 1) == 0)
                  {
                    id v29 = [v6 shouldIgnoreUserID];
                    if ((_DWORD)v29)
                    {
                      uint64_t v81 = _AKLogSiwa(v29, v30);
                      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
                      id v7 = v116;
                      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        v83 = "Application in expired state with no matching user identifier but user identifier match is"
                              " being ignored (for internal credential state) and No match for Team Identifier, directly "
                              "returning application's credential state.";
LABEL_95:
                        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, v83, buf, 2u);
                        goto LABEL_96;
                      }

                      goto LABEL_96;
                    }
                  }

                  id v7 = v116;
                  if ((v79 & 1) == 0)
                  {
                    id v29 = [v6 shouldIgnoreUserID];
                    if ((_DWORD)v29)
                    {
                      uint64_t v106 = _AKLogSiwa(v29, v30);
                      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
                      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)__int128 buf = 0;
                        v83 = "Application in expired state with no matching user identifier but user identifier match is"
                              " being ignored (for internal credential state), directly returning application's credential state.";
                        goto LABEL_95;
                      }

- (BOOL)_demoModeEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
  BOOL v3 = [v2 shouldAllowDemoMode] == (id)1;

  return v3;
}

- (BOOL)_isCapableOfSilentAuthForRequest:(id)a3
{
  BOOL v3 = self;
  accountManager = self->_accountManager;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 altDSID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( accountManager,  "authKitAccountWithAltDSID:error:",  v5,  0LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager continuationTokenForAccount:]( v3->_accountManager,  "continuationTokenForAccount:",  v6));
  LOBYTE(v3) = v7 != 0LL;

  return (char)v3;
}

- (int64_t)_sanitizedCredentialStateForExternalClients:(int64_t)a3
{
  return a3;
}

- (id)_fetchDeveloperTeamWithTeamID:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Fetching developer team with id: %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_10006FB9C;
  unsigned int v18 = sub_10006FBAC;
  id v19 = 0LL;
  localAccountsStorageController = self->_localAccountsStorageController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006FBB4;
  v14[3] = &unk_1001C9298;
  v14[4] = &buf;
  -[AKAuthorizationStoring fetchDeveloperTeamWithTeamID:withAltDSID:completion:]( localAccountsStorageController,  "fetchDeveloperTeamWithTeamID:withAltDSID:completion:",  v6,  v7,  v14);
  id v12 = *(id *)(*((void *)&buf + 1) + 40LL);
  _Block_object_dispose(&buf, 8);

  return v12;
}

- (id)_fetchDeveloperTeamWithClientID:(id)a3 withAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Fetching developer team for client with ID: %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_10006FB9C;
  unsigned int v18 = sub_10006FBAC;
  id v19 = 0LL;
  localAccountsStorageController = self->_localAccountsStorageController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006FDBC;
  v14[3] = &unk_1001C9298;
  v14[4] = &buf;
  -[AKAuthorizationStoring fetchDeveloperTeamWithClientID:withAltDSID:completion:]( localAccountsStorageController,  "fetchDeveloperTeamWithClientID:withAltDSID:completion:",  v6,  v7,  v14);
  id v12 = *(id *)(*((void *)&buf + 1) + 40LL);
  _Block_object_dispose(&buf, 8);

  return v12;
}

- (BOOL)_verifyUserID:(id)a3 forAltDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Performing unsafe verification with User ID: %@",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    localAccountsStorageController = self->_localAccountsStorageController;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10006FFF4;
    v15[3] = &unk_1001C92C0;
    v15[4] = &buf;
    -[AKAuthorizationStoring performUnsafeVerificationWithUserID:withAltDSID:completion:]( localAccountsStorageController,  "performUnsafeVerificationWithUserID:withAltDSID:completion:",  v6,  v7,  v15);
    BOOL v13 = *(_BYTE *)(*((void *)&buf + 1) + 24LL) != 0;
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    if (v11)
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unsafe verification failed due to nil User ID.",  (uint8_t *)&buf,  2u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (AKClient)client
{
  return self->_client;
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AKAuthorizationStoring)localAccountsStorageController
{
  return self->_localAccountsStorageController;
}

- (void)setLocalAccountsStorageController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end