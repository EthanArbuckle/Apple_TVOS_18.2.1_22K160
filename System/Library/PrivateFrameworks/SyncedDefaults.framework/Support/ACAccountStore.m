@interface ACAccountStore
- (id)syd_accountForCurrentPersonaWithError:(id *)a3;
- (id)syd_accountForPersonaIdentifier:(id)a3 error:(id *)a4;
- (id)syd_accountIdentifierForCurrentPersona;
@end

@implementation ACAccountStore

- (id)syd_accountForPersonaIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SYDGetAccountsLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100030068();
  }

  uint64_t v32 = ACAccountTypeIdentifierAppleAccount;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
  id v30 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountsWithAccountTypeIdentifiers:error:]( self,  "accountsWithAccountTypeIdentifiers:error:",  v9,  &v30));
  id v11 = v30;

  if (v11)
  {
    id v12 = SYDGetAccountsLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100030008();
    }
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "personaIdentifier", (void)v26));
        unsigned int v20 = [v19 isEqualToString:v6];

        if (v20)
        {
          id v15 = v18;
          goto LABEL_17;
        }
      }

      id v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

- (id)syd_accountForCurrentPersonaWithError:(id *)a3
{
  id v5 = SYDGetAccountsLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100030184(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if ((sub_10000BF78() & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userPersonaUniqueString]);

    id v30 = 0LL;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore syd_accountForPersonaIdentifier:error:]( self,  "syd_accountForPersonaIdentifier:error:",  v15,  &v30));
    id v17 = v30;
    if (v17)
    {
      id v18 = SYDGetAccountsLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000300D4();
      }
    }

    if (a3) {
      *a3 = v17;
    }
  }

  else
  {
    id v20 = SYDGetAccountsLog();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100030150(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](self, "aa_primaryAppleAccount"));
  }

  return v16;
}

- (id)syd_accountIdentifierForCurrentPersona
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore syd_accountForCurrentPersonaWithError:]( self,  "syd_accountForCurrentPersonaWithError:",  0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return v3;
}

@end