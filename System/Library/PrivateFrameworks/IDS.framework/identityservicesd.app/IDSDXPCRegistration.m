@interface IDSDXPCRegistration
- (BOOL)onlyAllowReads;
- (IDSCTAdapter)ctAdapter;
- (IDSDAccountController)accountController;
- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4;
- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4 userStore:(id)a5 accountController:(id)a6 ctAdapter:(id)a7;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)queue;
- (void)constructRAResponseDictionaryForServices:(id)a3 completionHandler:(id)a4;
- (void)disableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)enableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)removeTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)requestSelectedSubscriptionsWithCompletion:(id)a3;
- (void)requestUnselectedTemporaryPhoneAliasesWithCompletion:(id)a3;
- (void)selectSubscription:(id)a3 withCompletion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setCtAdapter:(id)a3;
- (void)setOnlyAllowReads:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSelectedSubscriptions:(id)a3 withCompletion:(id)a4;
- (void)setUserStore:(id)a3;
- (void)unselectSubscription:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSDXPCRegistration

- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4 userStore:(id)a5 accountController:(id)a6 ctAdapter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSDXPCRegistration;
  v18 = -[IDSDXPCRegistration init](&v28, "init");
  if (!v18)
  {
LABEL_12:
    v22 = v18;
    goto LABEL_13;
  }

  id v27 = v15;
  unsigned __int8 v19 = [v14 hasEntitlement:kIDSPhoneNumberAuthenticationEntitlement];
  unsigned __int8 v20 = [v14 hasEntitlement:@"com.apple.private.imcore.spi.database-access"];
  if ((v19 & 1) != 0 || (v20 & 1) != 0)
  {
    id v26 = v13;
    char v23 = v19 | v20 ^ 1;
    if ((v23 & 1) == 0)
    {
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Allowing bypass entitlement to read from IDSXPCRegistration {connection: %@}",  buf,  0xCu);
      }
    }

    objc_storeStrong((id *)&v18->_queue, a3);
    v18->_onlyAllowReads = v23 ^ 1;
    objc_storeStrong((id *)&v18->_userStore, a5);
    objc_storeStrong((id *)&v18->_accountController, a6);
    objc_storeStrong((id *)&v18->_ctAdapter, a7);
    id v13 = v26;
    id v15 = v27;
    goto LABEL_12;
  }

  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Missing phone number authentication entitlement -- failing creation of IDSDXPCRegistration collaborator {connection: %@}",  buf,  0xCu);
  }

  v22 = 0LL;
  id v15 = v27;
LABEL_13:

  return v22;
}

- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 registrationConductor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userStore]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  id v13 = -[IDSDXPCRegistration initWithQueue:connection:userStore:accountController:ctAdapter:]( self,  "initWithQueue:connection:userStore:accountController:ctAdapter:",  v7,  v6,  v10,  v11,  v12);

  return v13;
}

- (void)requestSelectedSubscriptionsWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, uint64_t))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 selectedPhoneNumberRegistrationSubscriptionLabels]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  id v15 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentSIMsWithError:&v15]);
  id v8 = v15;

  if (v8)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch sims -- returning nil {simFetchError: %@}",  buf,  0xCu);
    }

    uint64_t v10 = IDSPhoneSubscriptionSelectorErrorDomain;
    NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
    id v23 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  100LL,  v11));
    v3[2](v3, 0LL, v12);

    v3 = (void (**)(id, void, uint64_t))v12;
  }

  else
  {
    id v13 = sub_100318D68(v7, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v11;
      __int16 v18 = 2112;
      unsigned __int8 v19 = v5;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Client requested selected subscriptions {subscriptions: %@, selectedLabelIDs: %@, SIMs: %@}",  buf,  0x20u);
    }

    ((void (**)(id, void *, uint64_t))v3)[2](v3, v11, 0LL);
  }
}

- (void)requestUnselectedTemporaryPhoneAliasesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration accountController](self, "accountController"));
  unsigned int v6 = [v5 hasiCloudAccount];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration ctAdapter](self, "ctAdapter"));
  if ([v7 isAnySIMInserted])
  {
    BOOL v8 = 1;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 usersWithRealm:0]);
    BOOL v8 = [v10 count] != 0;
  }

  if ((v6 & v8 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 usersWithRealm:2]);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "__imArrayByFilteringWithBlock:", &stru_100901120));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10031923C;
    v19[3] = &unk_100901148;
    v19[4] = self;
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString __imArrayByApplyingBlock:](v13, "__imArrayByApplyingBlock:", v19));
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client requested unselected temporary phone aliases {descriptions: %@, users: %@}",  buf,  0x16u);
    }

    v4[2](v4, v14, 0LL);
  }

  else
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = @"NO";
      if (v6) {
        __int16 v18 = @"YES";
      }
      else {
        __int16 v18 = @"NO";
      }
      if (v8) {
        id v17 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client requested unselected temporary phone aliases, but not in state where home number is allowed {isiCloudSign edIn: %@, allowHomeNumber: %@}",  buf,  0x16u);
    }

    v4[2](v4, &__NSArray0__struct, 0LL);
  }
}

- (void)selectSubscription:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (!-[IDSDXPCRegistration onlyAllowReads](self, "onlyAllowReads"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
    id v29 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentSIMsWithError:&v29]);
    id v9 = v29;

    if (v9)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch sims -- returning nil {simFetchError: %@}",  buf,  0xCu);
      }

      uint64_t v13 = IDSPhoneSubscriptionSelectorErrorDomain;
      NSErrorUserInfoKey v30 = NSUnderlyingErrorKey;
      id v31 = v9;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
      id v15 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  100LL,  v14));
      v7[2](v7, 0LL, v15);
      goto LABEL_14;
    }

    id v16 = sub_1003196B4(v11, v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v17 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 selectedPhoneNumberRegistrationSubscriptionLabels]);
    id v15 = -[NSMutableSet initWithArray:](v17, "initWithArray:", v19);

    -[NSMutableSet addObject:](v15, "addObject:", v14);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
    if (([v20 isDeviceInDualPhoneIdentityMode] & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
      unsigned int v22 = [v21 isDeviceInManualPhoneSelectionMode];

      if (!v22)
      {
LABEL_13:
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
        [v23 setPNRReason:5 forUserUniqueIdentifier:v14];

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v15, "allObjects"));
        [v24 setSelectedPhoneNumberRegistrationSubscriptionLabels:v25];

        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v15, "allObjects"));
        id v27 = sub_100318D68(v11, v26);
        objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

        ((void (**)(id, void *, id))v7)[2](v7, v28, 0LL);
LABEL_14:

        goto LABEL_15;
      }

      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
      [v20 setIsDeviceInManualPhoneSelectionMode:0];
    }

    goto LABEL_13;
  }

  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  400LL,  0LL));
  v7[2](v7, 0LL, v9);
LABEL_15:
}

- (void)unselectSubscription:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (!-[IDSDXPCRegistration onlyAllowReads](self, "onlyAllowReads"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
    id v28 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentSIMsWithError:&v28]);
    id v9 = v28;

    if (v9)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch sims -- returning nil {simFetchError: %@}",  buf,  0xCu);
      }

      uint64_t v13 = IDSPhoneSubscriptionSelectorErrorDomain;
      NSErrorUserInfoKey v29 = NSUnderlyingErrorKey;
      id v30 = v9;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      id v15 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  100LL,  v14));
      v7[2](v7, 0LL, v15);
      goto LABEL_14;
    }

    id v16 = sub_1003196B4(v11, v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v17 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 selectedPhoneNumberRegistrationSubscriptionLabels]);
    id v15 = -[NSMutableSet initWithArray:](v17, "initWithArray:", v19);

    -[NSMutableSet removeObject:](v15, "removeObject:", v14);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
    if (([v20 isDeviceInDualPhoneIdentityMode] & 1) == 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
      unsigned __int8 v22 = [v21 isDeviceInManualPhoneSelectionMode];

      if ((v22 & 1) != 0)
      {
LABEL_13:
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v15, "allObjects"));
        [v23 setSelectedPhoneNumberRegistrationSubscriptionLabels:v24];

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v15, "allObjects"));
        id v26 = sub_100318D68(v11, v25);
        id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

        ((void (**)(id, void *, id))v7)[2](v7, v27, 0LL);
LABEL_14:

        goto LABEL_15;
      }

      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
      [v20 setIsDeviceInManualPhoneSelectionMode:1];
    }

    goto LABEL_13;
  }

  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  400LL,  0LL));
  v7[2](v7, 0LL, v9);
LABEL_15:
}

- (void)setSelectedSubscriptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (-[IDSDXPCRegistration onlyAllowReads](self, "onlyAllowReads"))
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  400LL,  0LL));
    v7[2](v7, 0LL, v9);
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
    id v40 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentSIMsWithError:&v40]);
    id v9 = v40;

    if (v9)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch sims -- returning nil {simFetchError: %@}",  buf,  0xCu);
      }

      uint64_t v13 = IDSPhoneSubscriptionSelectorErrorDomain;
      NSErrorUserInfoKey v42 = NSUnderlyingErrorKey;
      id v43 = v9;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  100LL,  v14));
      v7[2](v7, 0LL, v15);
    }

    else
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100319F20;
      v38[3] = &unk_100901170;
      id v16 = v11;
      id v39 = v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imArrayByApplyingBlock:", v38));
      __int16 v18 = v17;
      if (v17 && (id v19 = [v17 count], v19 == objc_msgSend(v6, "count")))
      {
        id v32 = v16;
        id v33 = v18;
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "__imSetFromArray"));
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v21 = [v20 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v35;
          do
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
              id v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
              [v26 setPNRReason:5 forUserUniqueIdentifier:v25];
            }

            id v22 = [v20 countByEnumeratingWithState:&v34 objects:v41 count:16];
          }

          while (v22);
        }

        id v27 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v20 allObjects]);
        [v27 setSelectedPhoneNumberRegistrationSubscriptionLabels:v28];

        NSErrorUserInfoKey v29 = (void *)objc_claimAutoreleasedReturnValue([v20 allObjects]);
        id v30 = sub_100318D68(v32, v29);
        id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

        ((void (**)(id, void *, id))v7)[2](v7, v31, 0LL);
        __int16 v18 = v33;
      }

      else
      {
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  200LL,  0LL));
        v7[2](v7, 0LL, v20);
      }

      id v14 = v39;
    }
  }
}

- (void)removeTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (-[IDSDXPCRegistration onlyAllowReads](self, "onlyAllowReads"))
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  400LL,  0LL));
    v7[2](v7, 0LL, v9);
    goto LABEL_22;
  }

  uint64_t v23 = v7;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Told to remove temporary URI { uri: %@ }",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 usersWithRealm:2]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = v12;
  id v13 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v13)
  {
LABEL_17:

LABEL_20:
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  200LL,  0LL));
    id v7 = v23;
    v23[2](v23, 0LL, v18);
    goto LABEL_21;
  }

  id v14 = v13;
  uint64_t v15 = *(void *)v25;
LABEL_9:
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(void *)v25 != v15) {
      objc_enumerationMutation(v9);
    }
    id v17 = *(void **)(*((void *)&v24 + 1) + 8 * v16);
    if ([v17 realm] != (id)2) {
      goto LABEL_15;
    }
    id v18 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 phoneNumber]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 unprefixedURI]);
    unsigned __int8 v21 = [v19 isEqualToString:v20];

    if ((v21 & 1) != 0) {
      break;
    }

LABEL_15:
    if (v14 == (id)++v16)
    {
      id v14 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }

  if (!v18) {
    goto LABEL_20;
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  [v22 forceRemoveUser:v18 silently:1];

  id v7 = v23;
  v23[2](v23, 1LL, 0LL);
LABEL_21:

LABEL_22:
}

- (void)disableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (-[IDSDXPCRegistration onlyAllowReads](self, "onlyAllowReads"))
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  400LL,  0LL));
    v7[2](v7, 0LL, v9);
    goto LABEL_25;
  }

  NSErrorUserInfoKey v29 = v7;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Told to disable temporary URI { uri: %@ }",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 usersWithRealm:2]);

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v9 = v12;
  id v13 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v13)
  {
LABEL_17:

LABEL_21:
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  200LL,  0LL));
    id v7 = v29;
    v29[2](v29, 0LL, v18);
    goto LABEL_24;
  }

  id v14 = v13;
  uint64_t v15 = *(void *)v31;
LABEL_9:
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(void *)v31 != v15) {
      objc_enumerationMutation(v9);
    }
    id v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
    if ([v17 realm] != (id)2) {
      goto LABEL_15;
    }
    id v18 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 phoneNumber]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 unprefixedURI]);
    unsigned __int8 v21 = [v19 isEqualToString:v20];

    if ((v21 & 1) != 0) {
      break;
    }

LABEL_15:
    if (v14 == (id)++v16)
    {
      id v14 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }

  if (!v18) {
    goto LABEL_21;
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 propertiesForUser:v18]);
  __int128 v24 = v23;
  id v7 = v29;
  if (v23) {
    __int128 v25 = v23;
  }
  else {
    __int128 v25 = objc_alloc_init(&OBJC_CLASS___IDSUserProperties);
  }
  __int128 v26 = v25;

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUserProperties propsByupdatingDisableRegistration:]( v26,  "propsByupdatingDisableRegistration:",  1LL));
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  [v28 setProperties:v27 forUser:v18];

  v29[2](v29, 1LL, 0LL);
LABEL_24:

LABEL_25:
}

- (void)enableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (-[IDSDXPCRegistration onlyAllowReads](self, "onlyAllowReads"))
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  400LL,  0LL));
    v7[2](v7, 0LL, v9);
    goto LABEL_25;
  }

  NSErrorUserInfoKey v29 = v7;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Told to enable temporary URI { uri: %@ }",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 usersWithRealm:2]);

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v9 = v12;
  id v13 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v13)
  {
LABEL_17:

LABEL_21:
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPhoneSubscriptionSelectorErrorDomain,  200LL,  0LL));
    id v7 = v29;
    v29[2](v29, 0LL, v18);
    goto LABEL_24;
  }

  id v14 = v13;
  uint64_t v15 = *(void *)v31;
LABEL_9:
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(void *)v31 != v15) {
      objc_enumerationMutation(v9);
    }
    id v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
    if ([v17 realm] != (id)2) {
      goto LABEL_15;
    }
    id v18 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 phoneNumber]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 unprefixedURI]);
    unsigned __int8 v21 = [v19 isEqualToString:v20];

    if ((v21 & 1) != 0) {
      break;
    }

LABEL_15:
    if (v14 == (id)++v16)
    {
      id v14 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }

  if (!v18) {
    goto LABEL_21;
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 propertiesForUser:v18]);
  __int128 v24 = v23;
  id v7 = v29;
  if (v23) {
    __int128 v25 = v23;
  }
  else {
    __int128 v25 = objc_alloc_init(&OBJC_CLASS___IDSUserProperties);
  }
  __int128 v26 = v25;

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUserProperties propsByupdatingDisableRegistration:]( v26,  "propsByupdatingDisableRegistration:",  0LL));
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCRegistration userStore](self, "userStore"));
  [v28 setProperties:v27 forUser:v18];

  v29[2](v29, 1LL, 0LL);
LABEL_24:

LABEL_25:
}

- (void)constructRAResponseDictionaryForServices:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAccountSync sharedInstance](&OBJC_CLASS___IDSAccountSync, "sharedInstance"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 constructRAResponseDictionary:v6]);

  v5[2](v5, v8);
}

- (BOOL)onlyAllowReads
{
  return self->_onlyAllowReads;
}

- (void)setOnlyAllowReads:(BOOL)a3
{
  self->_onlyAllowReads = a3;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSCTAdapter)ctAdapter
{
  return self->_ctAdapter;
}

- (void)setCtAdapter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end