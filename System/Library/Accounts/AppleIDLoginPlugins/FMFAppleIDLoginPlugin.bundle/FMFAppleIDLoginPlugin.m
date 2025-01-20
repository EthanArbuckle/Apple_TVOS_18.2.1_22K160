id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}
st;
- (id)parametersForLoginRequest;
- (id)serviceIdentifier;
- (void)handleLoginResponse:(id)a3 completion:(id)a4;
@end

@implementation FMFAppleIDLoginPlugin

- (id)serviceIdentifier
{
  return @"com.apple.findmy";
}

- (id)parametersForIdentityEstablishmentRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAppleIDLoginPlugin _accountStore](self, "_accountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));

  if (v3 && (uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_fmfAccount"))) != 0)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"account-exists");
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"apple-id");
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_personID"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_personID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, @"dsid");
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 credential]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 credentialItemForKey:ACFindMyFriendsTokenKey]);

    if (v12) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, @"auth-token");
    }
  }

  else
  {
    v6 = (NSMutableDictionary *)&off_4150;
  }

  return v6;
}

- (id)parametersForLoginRequest
{
  return 0LL;
}

- (void)handleLoginResponse:(id)a3 completion:(id)a4
{
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    uint64_t v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void).cxx_destruct
{
}

@end