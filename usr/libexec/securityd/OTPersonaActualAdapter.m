@interface OTPersonaActualAdapter
- (BOOL)currentThreadIsForPrimaryiCloudAccount;
- (OTPersonaActualAdapter)init;
- (id)currentThreadPersonaUniqueString;
- (void)performBlockWithPersonaIdentifier:(id)a3 block:(id)a4;
- (void)prepareThreadForKeychainAPIUseForPersonaIdentifier:(id)a3;
@end

@implementation OTPersonaActualAdapter

- (OTPersonaActualAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OTPersonaActualAdapter;
  return -[OTPersonaActualAdapter init](&v3, "init");
}

- (id)currentThreadPersonaUniqueString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentPersona]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userPersonaUniqueString]);
  return v4;
}

- (BOOL)currentThreadIsForPrimaryiCloudAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentPersona]);

  unint64_t v4 = (unint64_t)[v3 userPersonaType];
  BOOL v5 = 1;
  if (v4 <= 6)
  {
    if (((1LL << v4) & 0x29) != 0) {
      goto LABEL_9;
    }
    if (((1LL << v4) & 0x44) != 0)
    {
LABEL_8:
      BOOL v5 = 0;
      goto LABEL_9;
    }
  }

  if (v4 != 1000)
  {
    v6 = sub_10001267C("persona");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userPersonaUniqueString]);
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 1024;
      unsigned int v13 = [v3 userPersonaType];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received unexpected Universal/Managed/other persona; treating as not for primary account: %@(%d)",
        (uint8_t *)&v10,
        0x12u);
    }

    goto LABEL_8;
  }

- (void)prepareThreadForKeychainAPIUseForPersonaIdentifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 generateAndRestorePersonaContextWithPersonaUniqueString:v3]);

  v6 = sub_10001267C("ckks-persona");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      __int16 v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unable to adopt persona %@: %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Adopted persona for id '%@'",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)performBlockWithPersonaIdentifier:(id)a3 block:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPersonaActualAdapter currentThreadPersonaUniqueString](self, "currentThreadPersonaUniqueString"));
  if ([v8 isEqualToString:v7])
  {
    v6[2](v6);
  }

  else
  {
    -[OTPersonaActualAdapter prepareThreadForKeychainAPIUseForPersonaIdentifier:]( self,  "prepareThreadForKeychainAPIUseForPersonaIdentifier:",  v8);
    v6[2](v6);
    -[OTPersonaActualAdapter prepareThreadForKeychainAPIUseForPersonaIdentifier:]( self,  "prepareThreadForKeychainAPIUseForPersonaIdentifier:",  v7);
  }
}

@end