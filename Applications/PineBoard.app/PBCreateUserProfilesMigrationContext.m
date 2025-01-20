@interface PBCreateUserProfilesMigrationContext
- (ACAccount)gameCenterAccount;
- (ACAccount)iCloudAccount;
- (ACAccountStore)accountStore;
- (BOOL)hasActiveiTunesAccount;
- (NSArray)iTunesAccounts;
- (NSDictionary)iTunesAccountsByAltDSID;
- (NSString)gameCenterAltDSID;
- (NSString)iCloudAltDSID;
- (PBCreateUserProfilesMigrationContext)initWithAccountStore:(id)a3;
- (PBCreateUserProfilesMigrationContext)initWithAccountStore:(id)a3 iCloudAccount:(id)a4 iTunesAccounts:(id)a5 gameCenterAccount:(id)a6;
@end

@implementation PBCreateUserProfilesMigrationContext

- (PBCreateUserProfilesMigrationContext)initWithAccountStore:(id)a3 iCloudAccount:(id)a4 iTunesAccounts:(id)a5 gameCenterAccount:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"accountStore != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283F38(a2, (uint64_t)self, (uint64_t)v40);
    }
    _bs_set_crash_log_message([v40 UTF8String]);
    __break(0);
    JUMPOUT(0x10012B06CLL);
  }

  v16 = v15;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___PBCreateUserProfilesMigrationContext;
  v17 = -[PBCreateUserProfilesMigrationContext init](&v49, "init");
  v18 = v17;
  if (v17)
  {
    id obj = a6;
    v42 = v16;
    id v44 = v13;
    objc_storeStrong((id *)&v17->_accountStore, a3);
    objc_storeStrong((id *)&v18->_iCloudAccount, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_altDSID](v18->_iCloudAccount, "ams_altDSID"));
    v20 = (NSString *)[v19 copy];
    iCloudAltDSID = v18->_iCloudAltDSID;
    v18->_iCloudAltDSID = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v43 = v14;
    id v24 = v14;
    id v25 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v29, "ams_isLocalAccount") & 1) == 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ams_altDSID"));
            if (v30)
            {
              [v22 addObject:v29];
              [v23 setObject:v29 forKey:v30];
              if (v18->_hasActiveiTunesAccount) {
                unsigned __int8 v31 = 1;
              }
              else {
                unsigned __int8 v31 = [v29 isActive];
              }
              v18->_hasActiveiTunesAccount = v31;
            }
          }
        }

        id v26 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }

      while (v26);
    }

    v32 = (NSArray *)[v22 copy];
    iTunesAccounts = v18->_iTunesAccounts;
    v18->_iTunesAccounts = v32;

    v34 = (NSDictionary *)[v23 copy];
    iTunesAccountsByAltDSID = v18->_iTunesAccountsByAltDSID;
    v18->_iTunesAccountsByAltDSID = v34;

    objc_storeStrong((id *)&v18->_gameCenterAccount, obj);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ams_altDSID](v18->_gameCenterAccount, "ams_altDSID"));
    v37 = (NSString *)[v36 copy];
    gameCenterAltDSID = v18->_gameCenterAltDSID;
    v18->_gameCenterAltDSID = v37;

    id v14 = v43;
    id v13 = v44;
    v16 = v42;
  }

  return v18;
}

- (PBCreateUserProfilesMigrationContext)initWithAccountStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiCloudAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_iTunesAccounts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierGameCenter]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accountsWithAccountType:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  v10 = -[PBCreateUserProfilesMigrationContext initWithAccountStore:iCloudAccount:iTunesAccounts:gameCenterAccount:]( self,  "initWithAccountStore:iCloudAccount:iTunesAccounts:gameCenterAccount:",  v4,  v5,  v6,  v9);
  return v10;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)iCloudAccount
{
  return self->_iCloudAccount;
}

- (NSString)iCloudAltDSID
{
  return self->_iCloudAltDSID;
}

- (NSArray)iTunesAccounts
{
  return self->_iTunesAccounts;
}

- (NSDictionary)iTunesAccountsByAltDSID
{
  return self->_iTunesAccountsByAltDSID;
}

- (BOOL)hasActiveiTunesAccount
{
  return self->_hasActiveiTunesAccount;
}

- (ACAccount)gameCenterAccount
{
  return self->_gameCenterAccount;
}

- (NSString)gameCenterAltDSID
{
  return self->_gameCenterAltDSID;
}

- (void).cxx_destruct
{
}

@end