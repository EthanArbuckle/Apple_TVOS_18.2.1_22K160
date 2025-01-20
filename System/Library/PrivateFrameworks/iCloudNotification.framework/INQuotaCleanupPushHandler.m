@interface INQuotaCleanupPushHandler
- (BOOL)_isValidPush:(id)a3;
- (INQuotaCleanupPushHandler)initWithAccountStore:(id)a3;
- (void)clearClientCacheWithCacheTypes:(id)a3;
- (void)handleIncomingPushNotification:(id)a3;
@end

@implementation INQuotaCleanupPushHandler

- (INQuotaCleanupPushHandler)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___INQuotaCleanupPushHandler;
  v6 = -[INQuotaCleanupPushHandler init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v7;
}

- (void)handleIncomingPushNotification:(id)a3
{
  id v6 = a3;
  if (-[INQuotaCleanupPushHandler _isValidPush:](self, "_isValidPush:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"cacheTypes"]);
    -[INQuotaCleanupPushHandler clearClientCacheWithCacheTypes:](self, "clearClientCacheWithCacheTypes:", v5);
  }
}

- (BOOL)_isValidPush:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"event"]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"dsId"]);

    if (v11)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
      {
        v16 = v11;
        goto LABEL_12;
      }

      uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
      uint64_t v37 = objc_opt_isKindOfClass(v11, v36);
      if ((v37 & 1) != 0)
      {
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
LABEL_12:
        v18 = v16;
        accountStore = self->_accountStore;
        p_accountStore = &self->_accountStore;
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore aa_appleAccountWithPersonID:]( accountStore,  "aa_appleAccountWithPersonID:",  v16));
        id v40 = objc_msgSend(v28, "aa_isAccountClass:", AAAccountClassPrimary);
        BOOL v26 = (char)v40;
        if ((v40 & 1) == 0)
        {
          uint64_t v41 = _INLogSystem(v40);
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            sub_10001522C((uint64_t)v18, (id *)p_accountStore, v42);
          }

          uint64_t v44 = _INLogSystem(v43);
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_1000151FC(v45, v46, v47, v48, v49, v50, v51, v52);
          }
        }

        goto LABEL_21;
      }

      uint64_t v53 = _INLogSystem(v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
        sub_1000152EC((uint64_t)v11, (os_log_s *)v28);
      }
    }

    else
    {
      uint64_t v27 = _INLogSystem(v12);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
        sub_1000151CC((os_log_s *)v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }

    v18 = 0LL;
    BOOL v26 = 0;
LABEL_21:

    goto LABEL_22;
  }

  uint64_t v17 = _INLogSystem(isKindOfClass);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10001538C(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  BOOL v26 = 0;
LABEL_22:

  return v26;
}

- (void)clearClientCacheWithCacheTypes:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v4);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  if ((isKindOfClass & 1) != 0)
  {
    [v3 enumerateObjectsUsingBlock:&stru_100024B70];
  }

  else
  {
    uint64_t v7 = _INLogSystem(isKindOfClass);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000153BC();
    }
  }
}

- (void).cxx_destruct
{
}

  ;
}

@end