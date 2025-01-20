@interface IDSTemporaryPhoneUserSynchronizer
- (IDSCTAdapter)ctAdapter;
- (IDSTemporaryPhoneUserExpirationManager)expirationManager;
- (IDSTemporaryPhoneUserSynchronizer)initWithUserStore:(id)a3 ctAdapter:(id)a4;
- (IDSTransactionQueue)transactionQueue;
- (IDSUserStore)userStore;
- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4;
- (void)expirationManager:(id)a3 didExpireUser:(id)a4;
- (void)expirationManager:(id)a3 nearingExpirationForUser:(id)a4;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
- (void)setCtAdapter:(id)a3;
- (void)setExpirationManager:(id)a3;
- (void)setTransactionQueue:(id)a3;
- (void)setUserStore:(id)a3;
- (void)userStore:(id)a3 didAddUser:(id)a4;
- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5;
- (void)userStore:(id)a3 didUpdateUser:(id)a4;
@end

@implementation IDSTemporaryPhoneUserSynchronizer

- (IDSTemporaryPhoneUserSynchronizer)initWithUserStore:(id)a3 ctAdapter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSTemporaryPhoneUserSynchronizer;
  v9 = -[IDSTemporaryPhoneUserSynchronizer init](&v15, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___IDSTransactionQueue);
    transactionQueue = v9->_transactionQueue;
    v9->_transactionQueue = v10;

    objc_storeStrong((id *)&v9->_userStore, a3);
    objc_storeStrong((id *)&v9->_ctAdapter, a4);
    v12 = -[IDSTemporaryPhoneUserExpirationManager initWithUserStore:delegate:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserExpirationManager),  "initWithUserStore:delegate:",  v7,  v9);
    expirationManager = v9->_expirationManager;
    v9->_expirationManager = v12;

    [v7 addActionListener:v9 forRealm:0];
  }

  return v9;
}

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  id v5 = a3;
  if ([v5 realm] == (id)2)
  {
    v6 = -[IDSTemporaryPhoneUserRemoveTransaction initWithUser:alertType:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserRemoveTransaction),  "initWithUser:alertType:",  v5,  0LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "User removed. Prepending transaction %@",  (uint8_t *)&v10,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer transactionQueue](self, "transactionQueue"));
    [v8 prependItem:v6];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer userStore](self, "userStore"));
    [v9 reloadUsersForRealm:2];
  }
}

- (id)updatedUserSetForRealm:(int64_t)a3 currentUsers:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 2)
  {
    id v8 = -[NSMutableSet initWithSet:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithSet:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer transactionQueue](self, "transactionQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1003D1090;
    v13[3] = &unk_100904380;
    int v10 = v8;
    v14 = v10;
    objc_super v15 = self;
    [v9 executeReadyItemsWithBlock:v13];

    v11 = v10;
  }

  else
  {
    v11 = (NSMutableSet *)v6;
  }

  return v11;
}

- (void)userStore:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 realm])
  {
    id v8 = -[IDSTemporaryPhoneUser initWithPhoneUser:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUser),  "initWithPhoneUser:",  v7);
    v9 = -[IDSTemporaryPhoneUserRemoveTransaction initWithUser:alertType:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserRemoveTransaction),  "initWithUser:alertType:",  v8,  0LL);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Phone user added. Adding transaction %@",  (uint8_t *)&v12,  0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer transactionQueue](self, "transactionQueue"));
    [v11 appendItem:v9];

    [v6 reloadUsersForRealm:2];
  }
}

- (void)userStore:(id)a3 didUpdateUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 realm])
  {
    id v8 = -[IDSTemporaryPhoneUser initWithPhoneUser:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUser),  "initWithPhoneUser:",  v7);
    v9 = -[IDSTemporaryPhoneUserRemoveTransaction initWithUser:alertType:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserRemoveTransaction),  "initWithUser:alertType:",  v8,  0LL);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Phone user changed. Adding transaction %@",  (uint8_t *)&v12,  0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer transactionQueue](self, "transactionQueue"));
    [v11 appendItem:v9];

    [v6 reloadUsersForRealm:2];
  }
}

- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 realm])
  {
    if (!v10)
    {
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138412290;
        id v29 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not provisioning for Home Number because nil authenticationCertificate for user: %@",  (uint8_t *)&v28,  0xCu);
      }

      goto LABEL_19;
    }

    v11 = (os_log_s *)v9;
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer ctAdapter](self, "ctAdapter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s uniqueIdentifier](v11, "uniqueIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 SIMForIdentifier:v13]);

    if (v14)
    {
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 phoneNumber]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s phoneNumber](v11, "phoneNumber"));
      unsigned int v17 = +[IDSCTAdapter isPhoneNumber:equivalentToExistingPhoneNumber:]( &OBJC_CLASS___IDSCTAdapter,  "isPhoneNumber:equivalentToExistingPhoneNumber:",  v15,  v16);

      if (v17)
      {
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412546;
          id v29 = v11;
          __int16 v30 = 2112;
          v31 = v14;
          v19 = "Not provisioning for Home Number because SIM is still present {user: %@, SIM: %@}";
          v20 = v18;
          uint32_t v21 = 22;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, v21);
          goto LABEL_18;
        }

        goto LABEL_18;
      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[FTUserConfiguration sharedInstance](&OBJC_CLASS___FTUserConfiguration, "sharedInstance"));
    if ([v22 isDeviceInDualPhoneIdentityMode])
    {
      unsigned __int8 v23 = -[os_log_s isDefaultUser](v11, "isDefaultUser");

      if ((v23 & 1) == 0)
      {
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412290;
          id v29 = v11;
          v19 = "Not provisioning for Home Number because removed SIM is not the default phone SIM on the DSDS phone {user: %@}";
          v20 = v18;
          uint32_t v21 = 12;
          goto LABEL_11;
        }

- (void)expirationManager:(id)a3 nearingExpirationForUser:(id)a4
{
}

- (void)expirationManager:(id)a3 didExpireUser:(id)a4
{
  id v5 = a4;
  id v6 = -[IDSTemporaryPhoneUserRemoveTransaction initWithUser:alertType:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserRemoveTransaction),  "initWithUser:alertType:",  v5,  1LL);

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "User expired. Prepending transaction %@",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer transactionQueue](self, "transactionQueue"));
  [v8 prependItem:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserSynchronizer userStore](self, "userStore"));
  [v9 reloadUsersForRealm:2];
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSCTAdapter)ctAdapter
{
  return self->_ctAdapter;
}

- (void)setCtAdapter:(id)a3
{
}

- (IDSTemporaryPhoneUserExpirationManager)expirationManager
{
  return self->_expirationManager;
}

- (void)setExpirationManager:(id)a3
{
}

- (IDSTransactionQueue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end