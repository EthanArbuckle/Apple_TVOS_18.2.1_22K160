@interface AKSignOutManager
+ (id)sharedManager;
- (BOOL)markAccountForSignOutForAltDSID:(id)a3;
- (void)processPushMessage:(id)a3;
@end

@implementation AKSignOutManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008102C;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F508 != -1) {
    dispatch_once(&qword_10020F508, block);
  }
  return (id)qword_10020F500;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)2100)
  {
    uint64_t v5 = _AKLogSystem(2100LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received push command to sign out.", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
    BOOL v8 = -[AKSignOutManager markAccountForSignOutForAltDSID:](self, "markAccountForSignOutForAltDSID:", v7);
    BOOL v9 = v8;
    uint64_t v10 = _AKLogSystem(v8);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Successfully saved account after marking for sign out.",  v20,  2u);
      }
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_10013A648(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (BOOL)markAccountForSignOutForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authKitAccountWithAltDSID:v3 error:0]);

  uint64_t v7 = _AKLogSystem(v6);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10013A73C(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  if (v5)
  {
    [v4 setMarkedForSignOut:1 forAccount:v5];
    id v31 = 0LL;
    unsigned __int8 v17 = [v4 saveAccount:v5 error:&v31];
    id v18 = v31;
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = _AKLogSystem(v18);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10013A6A8(v19, v21);
      }
    }
  }

  else
  {
    uint64_t v22 = _AKLogSystem(v16);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
      sub_10013A678((os_log_s *)v19, v23, v24, v25, v26, v27, v28, v29);
    }
    unsigned __int8 v17 = 0;
  }

  return v17;
}

@end