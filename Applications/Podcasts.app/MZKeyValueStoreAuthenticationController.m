@interface MZKeyValueStoreAuthenticationController
- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4;
- (BOOL)shouldAuthenticate;
- (BOOL)shouldForceAuthenticationForTransaction:(id)a3;
- (MZKeyValueStoreAuthenticationController)init;
- (NSString)DSID;
- (NSString)DSIDText;
- (NSString)acceptedDSID;
- (NSString)acceptedDSIDText;
- (NSString)acceptedDSIDTextUserDefaultsKey;
- (NSString)acceptedDSIDUserDefaultsKey;
- (id)authenticationErrorsForTransaction:(id)a3;
- (void)resetAcceptedCredentials;
- (void)setAcceptedDSIDTextUserDefaultsKey:(id)a3;
- (void)setAcceptedDSIDUserDefaultsKey:(id)a3;
- (void)setShouldAuthenticate:(BOOL)a3;
@end

@implementation MZKeyValueStoreAuthenticationController

- (MZKeyValueStoreAuthenticationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreAuthenticationController;
  v2 = -[MZKeyValueStoreAuthenticationController init](&v8, "init");
  if (v2)
  {
    v3 = (NSString *)[@"MZKeyValueStore.LastDsid" copy];
    acceptedDSIDUserDefaultsKey = v2->_acceptedDSIDUserDefaultsKey;
    v2->_acceptedDSIDUserDefaultsKey = v3;

    v5 = (NSString *)[@"MZKeyValueStore.LastDsidText" copy];
    acceptedDSIDTextUserDefaultsKey = v2->_acceptedDSIDTextUserDefaultsKey;
    v2->_acceptedDSIDTextUserDefaultsKey = v5;
  }

  return v2;
}

- (BOOL)isAuthenticationValidForTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSID](self, "DSID"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSID](self, "acceptedDSID"));
  if (-[MZKeyValueStoreAuthenticationController shouldAuthenticate](self, "shouldAuthenticate")
    || v7 && v8 && ([v7 isEqualToString:v8] & 1) != 0
    || -[MZKeyValueStoreAuthenticationController shouldForceAuthenticationForTransaction:]( self,  "shouldForceAuthenticationForTransaction:",  v6))
  {
    BOOL v9 = 1;
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreAuthenticationController authenticationErrorsForTransaction:]( self,  "authenticationErrorsForTransaction:",  v6));
    BOOL v9 = 0;
    *a4 = v10;
  }

  return v9;
}

- (BOOL)shouldForceAuthenticationForTransaction:(id)a3
{
  id v4 = a3;
  if (-[MZKeyValueStoreAuthenticationController shouldAuthenticate](self, "shouldAuthenticate"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreAuthenticationController authenticationErrorsForTransaction:]( self,  "authenticationErrorsForTransaction:",  v4));
    id v6 = v5;
    if (v5) {
      BOOL v7 = ((unint64_t)[v5 code] & 0xFFFFFFFFFFFFFFFDLL) == -1004;
    }
    else {
      BOOL v7 = 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)authenticationErrorsForTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSIDText](self, "DSIDText"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSID](self, "DSID"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSID](self, "acceptedDSID"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController acceptedDSIDText](self, "acceptedDSIDText"));
  if (v7)
  {
    if (v6) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError storeAccountMismatchErrorWithPreviousStoreAccountText:currentStoreAccontText:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "storeAccountMismatchErrorWithPreviousStoreAccountText:currentStoreAccontText:transaction:underlyingError:",  v8,  v5,  v4,  0LL));
    }
    else {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError storeLoggedOutErrorWithPreviousStoreAccountText:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "storeLoggedOutErrorWithPreviousStoreAccountText:transaction:underlyingError:",  v7,  v4,  0LL));
    }
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError noStoreAccountErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "noStoreAccountErrorWithTransaction:underlyingError:",  v4,  0LL));
  }

  id v10 = (void *)v9;

  return v10;
}

- (void)resetAcceptedCredentials
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](&OBJC_CLASS___MZPreferences, "storeBookkeeperPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSID](self, "DSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreAuthenticationController acceptedDSIDUserDefaultsKey]( self,  "acceptedDSIDUserDefaultsKey"));
  [v3 setObject:v4 forKey:v5];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](&OBJC_CLASS___MZPreferences, "storeBookkeeperPreferences"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreAuthenticationController DSIDText](self, "DSIDText"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreAuthenticationController acceptedDSIDTextUserDefaultsKey]( self,  "acceptedDSIDTextUserDefaultsKey"));
  [v8 setObject:v6 forKey:v7];
}

- (NSString)acceptedDSID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](&OBJC_CLASS___MZPreferences, "storeBookkeeperPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreAuthenticationController acceptedDSIDUserDefaultsKey]( self,  "acceptedDSIDUserDefaultsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4 withDefaultValue:0]);

  return (NSString *)v5;
}

- (NSString)acceptedDSIDText
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](&OBJC_CLASS___MZPreferences, "storeBookkeeperPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MZKeyValueStoreAuthenticationController acceptedDSIDTextUserDefaultsKey]( self,  "acceptedDSIDTextUserDefaultsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4 withDefaultValue:0]);

  return (NSString *)v5;
}

- (NSString)DSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeDsid]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);

  return (NSString *)v4;
}

- (NSString)DSIDText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);

  return (NSString *)v4;
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (NSString)acceptedDSIDUserDefaultsKey
{
  return self->_acceptedDSIDUserDefaultsKey;
}

- (void)setAcceptedDSIDUserDefaultsKey:(id)a3
{
}

- (NSString)acceptedDSIDTextUserDefaultsKey
{
  return self->_acceptedDSIDTextUserDefaultsKey;
}

- (void)setAcceptedDSIDTextUserDefaultsKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end