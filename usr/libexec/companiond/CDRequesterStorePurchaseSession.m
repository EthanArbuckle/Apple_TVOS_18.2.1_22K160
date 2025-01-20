@interface CDRequesterStorePurchaseSession
- (BOOL)_isSandboxPurchase;
- (id)_idsMessageRecipientUsernames;
- (id)_responseForGetNotifInfoRequest:(id)a3;
- (void)_configureRapportClient:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
@end

@implementation CDRequesterStorePurchaseSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  v14 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterSession request](self, "request"));
  v5 = (AMSDelegatePurchaseRequest *)objc_claimAutoreleasedReturnValue([v4 purchaseRequest]);
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = v5;

  if (!self->_purchaseRequest)
  {
    v10 = @"Missing delegate purchase request";
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
  v6[2] = sub_100010B8C;
  v6[3] = &unk_100030898;
  v6[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001108C;
  v5[3] = &unk_100030898;
  v5[4] = self;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" options:0 handler:v5];
}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 storeAccountToken]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 nonce]);

  LOBYTE(self) = sub_100011444(self, v5, v6);
  if ((self & 1) != 0)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___CDGetNotifInfoResponse);
  }

  else
  {
    uint64_t v9 = cps_session_log(v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001F42C();
    }

    v8 = 0LL;
  }

  return v8;
}

- (BOOL)_isSandboxPurchase
{
  return -[ACAccount ams_isSandboxAccount](self->_storeAccount, "ams_isSandboxAccount");
}

- (id)_idsMessageRecipientUsernames
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_altDSID](self->_storeAccount, "ams_altDSID"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfilesSnapshot]);

    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 selectedUserProfile]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesAltDSID]);
    unsigned __int8 v8 = [v7 isEqualToString:v3];

    if ((v8 & 1) != 0)
    {
      v16.receiver = self;
      v16.super_class = (Class)&OBJC_CLASS___CDRequesterStorePurchaseSession;
      id v10 = -[CDRequesterSession _idsMessageRecipientUsernames](&v16, "_idsMessageRecipientUsernames");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      uint64_t v13 = cps_session_log(v9);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_10001F484();
      }

      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v12 = cps_session_log(0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10001F458();
    }
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (void).cxx_destruct
{
}

  ;
}

@end