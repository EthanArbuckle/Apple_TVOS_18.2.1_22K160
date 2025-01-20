@interface CredentialStore
- (void)setValue:(id)a3 forCredential:(id)a4 completion:(id)a5;
- (void)valueForCredential:(id)a3 completion:(id)a4;
@end

@implementation CredentialStore

- (void)valueForCredential:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void, void *))a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Reading of credential (%d) not supported",  [a3 credential]));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1020LL,  v7));
  v5[2](v5, 0LL, v6);
}

- (void)setValue:(id)a3 forCredential:(id)a4 completion:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  v8 = (void (**)(id, void))a5;
  id v9 = [v7 credential];
  if (v9 == (id)LACCredentialPasscode)
  {
    id v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](&OBJC_CLASS___LAPasscodeHelper, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 externalizedContext]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v7 userID]));
    id v14 = [v11 verifyPasswordUsingAKS:v18 acmContext:v12 userId:v13 policy:0 options:0 bioLockoutRecovery:0];

    if (!v14)
    {
      v8[2](v8, 0LL);
      goto LABEL_7;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Injection of credential (%d) failed rc=%d",  v10,  v14));
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[LAErrorHelper internalErrorWithMessage:](&OBJC_CLASS___LAErrorHelper, "internalErrorWithMessage:", v15));
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Injection of credential (%d) not supported",  LACCredentialPasscode));
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorWithCode:message:](&OBJC_CLASS___LAErrorHelper, "errorWithCode:message:", -1020LL, v15));
  }

  v17 = (void *)v16;
  v8[2](v8, v16);

LABEL_7:
}

@end