@interface IDSDeviceAccountMigration
+ (void)migrateATVToSupportDeviceAccountsIfNeededWithAccountController:(id)a3 serviceController:(id)a4;
+ (void)migrateAwayFromMultiwayAppleIDAccountsWithAccountController:(id)a3 serviceController:(id)a4;
+ (void)migrateToNewBAACert;
@end

@implementation IDSDeviceAccountMigration

+ (void)migrateATVToSupportDeviceAccountsIfNeededWithAccountController:(id)a3 serviceController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  unsigned __int8 v8 = [v7 appBoolForKey:@"ATVAppleIDToDeviceAccountMigration"];

  if ((v8 & 1) == 0)
  {
    [a1 migrateAwayFromMultiwayAppleIDAccountsWithAccountController:v10 serviceController:v6];
    [a1 migrateToNewBAACert];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
    [v9 setAppBool:1 forKey:@"ATVAppleIDToDeviceAccountMigration"];
  }
}

+ (void)migrateAwayFromMultiwayAppleIDAccountsWithAccountController:(id)a3 serviceController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Migrating TV FT services from Apple ID to device accounts",  (uint8_t *)&v17,  2u);
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceWithIdentifier:@"com.apple.private.alloy.facetime.multi"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 appleIDAccountOnService:v8]);

  if (v9)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Deleting existing apple ID multiway account %@",  (uint8_t *)&v17,  0xCu);
    }

    [v5 forceRemoveAccount:v9];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceWithIdentifier:@"com.apple.ess"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 appleIDAccountOnService:v11]);

  if (v12)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Deleting existing apple ID ess account %@",  (uint8_t *)&v17,  0xCu);
    }

    [v5 forceRemoveAccount:v12];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceWithIdentifier:@"com.apple.private.ac"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 appleIDAccountOnService:v14]);

  if (v15)
  {
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Deleting existing apple ID ac account %@",  (uint8_t *)&v17,  0xCu);
    }

    [v5 forceRemoveAccount:v15];
  }
}

+ (void)migrateToNewBAACert
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Purging old TV BAA cert to generate new device account BAA cert",  v8,  2u);
  }

  v3 = objc_alloc(&OBJC_CLASS___IDSBAASigner);
  uint64_t v5 = im_primary_queue(v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[IDSBAASigner initWithQueue:](v3, "initWithQueue:", v6);
  -[IDSBAASigner purgeBAACertForTopic:](v7, "purgeBAACertForTopic:", 0LL);
}

@end