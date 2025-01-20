@interface INVerifyTermsPushHandler
- (INVerifyTermsPushHandler)init;
- (INVerifyTermsPushHandler)initWithAccountStore:(id)a3;
- (void)_refreshAppleAccount:(id)a3 completion:(id)a4;
- (void)handleIncomingPushNotification:(id)a3;
@end

@implementation INVerifyTermsPushHandler

- (INVerifyTermsPushHandler)init
{
  return 0LL;
}

- (INVerifyTermsPushHandler)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___INVerifyTermsPushHandler;
  v6 = -[INVerifyTermsPushHandler init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v7;
}

- (void)handleIncomingPushNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"dsid"]);

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"event"]);

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v11);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
      if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
      {
        id v16 = v6;
        goto LABEL_12;
      }

      uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
      uint64_t v36 = objc_opt_isKindOfClass(v6, v35);
      if ((v36 & 1) != 0)
      {
        id v16 = (id)objc_claimAutoreleasedReturnValue([v6 stringValue]);
LABEL_12:
        v25 = v16;
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[ACAccountStore aa_appleAccountWithPersonID:]( self->_accountStore,  "aa_appleAccountWithPersonID:",  v16));
        if (!v27)
        {
          uint64_t v41 = _INLogSystem(0LL);
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_100014740();
          }

          goto LABEL_30;
        }

        id v37 = [v9 isEqualToString:@"t_needs_agree"];
        if ((_DWORD)v37)
        {
          uint64_t v38 = _INLogSystem(v37);
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
LABEL_26:

            -[INVerifyTermsPushHandler _refreshAppleAccount:completion:]( self,  "_refreshAppleAccount:completion:",  v27,  &stru_100024A40);
            goto LABEL_30;
          }

          int v48 = 138412290;
          v49 = v27;
          v40 = "Will post terms follow up for account: %@";
        }

        else
        {
          id v44 = [v9 isEqualToString:@"t_did_agree"];
          int v45 = (int)v44;
          uint64_t v46 = _INLogSystem(v44);
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          v39 = v47;
          if (!v45)
          {
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_1000147A0();
            }

            goto LABEL_30;
          }

          if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_26;
          }
          int v48 = 138412290;
          v49 = v27;
          v40 = "Will dismiss terms follow up for account: %@";
        }

        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)&v48, 0xCu);
        goto LABEL_26;
      }

      uint64_t v43 = _INLogSystem(v36);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100014800((uint64_t)v6, v27);
      }
    }

    else
    {
      uint64_t v26 = _INLogSystem(isKindOfClass);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100014898(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }

    v25 = 0LL;
LABEL_30:

    goto LABEL_31;
  }

  uint64_t v17 = _INLogSystem(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
    sub_10001470C((os_log_s *)v9, v18, v19, v20, v21, v22, v23, v24);
  }
  v25 = 0LL;
LABEL_31:
}

- (void)_refreshAppleAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  accountStore = self->_accountStore;
  uint64_t v13 = kACDiscoverPropertiesShouldSaveKey;
  uint64_t v14 = &__kCFBooleanTrue;
  id v8 = a3;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000344C;
  v11[3] = &unk_100024A68;
  id v12 = v6;
  id v10 = v6;
  -[ACAccountStore discoverPropertiesForAccount:options:completion:]( accountStore,  "discoverPropertiesForAccount:options:completion:",  v8,  v9,  v11);
}

- (void).cxx_destruct
{
}

@end