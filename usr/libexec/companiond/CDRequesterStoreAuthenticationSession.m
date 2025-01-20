@interface CDRequesterStoreAuthenticationSession
- (id)_idsMessageRecipientUsernames;
- (id)_responseForGetNotifInfoRequest:(id)a3;
- (void)_configureRapportClient:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
@end

@implementation CDRequesterStoreAuthenticationSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  v14 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v5 = (AMSDelegateAuthenticateRequest *)objc_claimAutoreleasedReturnValue([v4 authenticationRequest]);
  authenticationRequest = self->_authenticationRequest;
  self->_authenticationRequest = v5;

  if (!self->_authenticationRequest)
  {
    v10 = @"Missing delegate authentication request";
    uint64_t v11 = 201LL;
LABEL_6:
    uint64_t v12 = CPSErrorMake(v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14[2](v14, v13);

    goto LABEL_7;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v8 = (ACAccount *)objc_claimAutoreleasedReturnValue([v7 account]);
  storeAccount = self->_storeAccount;
  self->_storeAccount = v8;

  if (!self->_storeAccount)
  {
    v10 = @"Missing store account";
    uint64_t v11 = 200LL;
    goto LABEL_6;
  }

  v14[2](v14, 0LL);
LABEL_7:
}

- (void)_configureRapportClient:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000BFD4;
  v6[3] = &unk_100030898;
  v6[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C2E0;
  v5[3] = &unk_100030898;
  v5[4] = self;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" options:0 handler:v5];
}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 storeAccountToken]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 nonce]);

  LOBYTE(self) = sub_10000C698(self, v5, v6);
  if ((self & 1) != 0)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___CDGetNotifInfoResponse);
  }

  else
  {
    uint64_t v9 = cps_session_log(v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001F148(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v8 = 0LL;
  }

  return v8;
}

- (id)_idsMessageRecipientUsernames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_altDSID](self->_storeAccount, "ams_altDSID"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 userProfilesSnapshot]);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v30 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userProfiles](v4, "userProfiles"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 iTunesAltDSID]);
          unsigned int v14 = [v13 isEqualToString:v2];

          if (v14)
          {
            id v15 = v12;
            id v16 = [[PBSUserProfileAccountInfo alloc] initWithUserProfile:v15];

            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 iCloudAccount]);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 username]);

            if (v18) {
              [v5 addObject:v18];
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v9);
    }

    id v19 = [v5 copy];
    v20 = v30;
  }

  else
  {
    uint64_t v21 = cps_session_log(0LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10001F178(v20, v22, v23, v24, v25, v26, v27, v28);
    }
    id v19 = 0LL;
  }

  return v19;
}

- (void).cxx_destruct
{
}

@end