@interface MZKeyValueStoreError
+ (id)clientClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5;
+ (id)delegateCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)keyValueStoreDisabledErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)keyValueStoreErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 transaction:(id)a5 underlyingError:(id)a6;
+ (id)killSwitchErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)networkingBlockedErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)noStoreAccountErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)serverClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5;
+ (id)storeAccountMismatchErrorWithPreviousStoreAccountText:(id)a3 currentStoreAccontText:(id)a4 transaction:(id)a5 underlyingError:(id)a6;
+ (id)storeAccountSessionExpiredWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)storeGenericErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)storeLoggedOutErrorWithPreviousStoreAccountText:(id)a3 transaction:(id)a4 underlyingError:(id)a5;
+ (id)storeValidationErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionCancelledErrorWithTransaction:(id)a3 code:(int64_t)a4 underlyingError:(id)a5;
+ (id)transactionCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionMissingDomainErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionMissingURLErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionTimeoutErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)unknownErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)userCancelledSignInErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)userClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5;
+ (id)userEnteredWrongCredentialsErrorWithTransaction:(id)a3 underlyingError:(id)a4;
- (BOOL)isAccountsChangedError;
- (BOOL)isAuthenticationError;
- (BOOL)isClampError;
- (BOOL)isRecoverableError;
- (BOOL)isTransactionCancelledError;
- (BOOL)isTransactionMissingInformationError;
- (NSString)transactionDescription;
- (double)retrySeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentStoreAccountKey;
- (id)description;
- (id)previousStoreAccountKey;
- (void)setTransactionDescription:(id)a3;
@end

@implementation MZKeyValueStoreError

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:NSUnderlyingErrorKey]);

  if (v4) {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", underlying error = \"%@\"",  v4));
  }
  else {
    v5 = &stru_100248948;
  }
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError localizedDescription](self, "localizedDescription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> %@%@",  v8,  self,  v9,  v5));

  return v10;
}

- (BOOL)isAuthenticationError
{
  return ((unint64_t)-[MZKeyValueStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFCLL) == -1004LL;
}

- (BOOL)isAccountsChangedError
{
  return (((unint64_t)-[MZKeyValueStoreError code](self, "code") + 1003) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)isRecoverableError
{
  uint64_t v2 = (uint64_t)-[MZKeyValueStoreError code](self, "code");
  BOOL result = 1;
  if (v2 > -2007)
  {
    return 0;
  }

  return result;
}

- (BOOL)isClampError
{
  id v2 = -[MZKeyValueStoreError code](self, "code");
  return (unint64_t)v2 + 2004 < 4 || v2 == (id)-1009LL;
}

- (BOOL)isTransactionCancelledError
{
  return ((unint64_t)-[MZKeyValueStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFELL) == -4002LL;
}

- (BOOL)isTransactionMissingInformationError
{
  return ((unint64_t)-[MZKeyValueStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFELL) == -3002LL;
}

- (id)previousStoreAccountKey
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"MZKeyValueStorePreviousStoreAccountKey"]);

  return v3;
}

- (id)currentStoreAccountKey
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"MZKeyValueStoreCurrentStoreAccountKey"]);

  return v3;
}

- (double)retrySeconds
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"MZKeyValueStoreRetrySecondsKey"]);

  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreError;
  id v4 = -[MZKeyValueStoreError copyWithZone:](&v7, "copyWithZone:", a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError transactionDescription](self, "transactionDescription"));
  [v4 setTransactionDescription:v5];

  return v4;
}

+ (id)keyValueStoreErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a4,  NSLocalizedDescriptionKey));
  v12 = sub_100048FF0(v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  a3,  v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);

  [v14 setTransactionDescription:v15];
  return v14;
}

+ (id)unknownErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4 = a4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MZKeyValueStoreErrorGeneric: An unknown server error occurred.  Please %@",  @"submit a bug to PEP Podcasts with console logs attached"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  NSLocalizedDescriptionKey,  0LL));

  objc_super v7 = sub_100048FF0(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -1LL,  v8));
  return v9;
}

+ (id)keyValueStoreDisabledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-2006LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -2006LL,  v8,  v6,  v5));

  return v9;
}

+ (id)networkingBlockedErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-2004LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -2004LL,  v8,  v6,  v5));

  return v9;
}

+ (id)killSwitchErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-2005LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -2005LL,  v8,  v6,  v5));

  return v9;
}

+ (id)storeLoggedOutErrorWithPreviousStoreAccountText:(id)a3 transaction:(id)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v10 setValue:@"MZKeyValueStoreErrorStoreAccountLoggedOut" forKey:NSLocalizedDescriptionKey];
  [v10 setValue:v9 forKey:@"MZKeyValueStorePreviousStoreAccountKey"];

  v11 = sub_100048FF0(v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -1002LL,  v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);

  [v13 setTransactionDescription:v14];
  return v13;
}

+ (id)storeAccountMismatchErrorWithPreviousStoreAccountText:(id)a3 currentStoreAccontText:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v13 setValue:@"MZKeyValueStoreErrorStoreAccountMismatch" forKey:NSLocalizedDescriptionKey];
  [v13 setValue:v12 forKey:@"MZKeyValueStorePreviousStoreAccountKey"];

  [v13 setValue:v11 forKey:@"MZKeyValueStoreCurrentStoreAccountKey"];
  v14 = sub_100048FF0(v13, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -1003LL,  v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);

  [v16 setTransactionDescription:v17];
  return v16;
}

+ (id)storeGenericErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"MZKeyValueStoreErrorGeneric: This usually means your format is wrong. Turn on MZ_KVSTORE_SERIALIZER_LOG and MZ_KVSTORE_LOG for debugging.",  NSLocalizedDescriptionKey));
  id v6 = sub_100048FF0(v5, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -1007LL,  v7));
  return v8;
}

+ (id)storeValidationErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"MZKeyValueStoreErrorValidation: Your request is invalid, maybe referenced a non-existent Domain. Turn on MZ_KVSTORE_SERIALIZER_LOG and MZ_KVSTORE_LOG for debugging",  NSLocalizedDescriptionKey));
  id v6 = sub_100048FF0(v5, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -1007LL,  v7));
  return v8;
}

+ (id)userCancelledSignInErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-1005LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -1005LL,  v8,  v6,  v5));

  return v9;
}

+ (id)userEnteredWrongCredentialsErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-1006LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -1006LL,  v8,  v6,  v5));

  return v9;
}

+ (id)noStoreAccountErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-1001LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -1001LL,  v8,  v6,  v5));

  return v9;
}

+ (id)storeAccountSessionExpiredWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-1004LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -1004LL,  v8,  v6,  v5));

  return v9;
}

+ (id)transactionMissingDomainErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-3002LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -3002LL,  v8,  v6,  v5));

  return v9;
}

+ (id)transactionMissingURLErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000491E8(-3001LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  -3001LL,  v8,  v6,  v5));

  return v9;
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 code:(int64_t)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = sub_1000491E8(a4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:",  a4,  v10,  v8,  v7));

  return v11;
}

+ (id)transactionTimeoutErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return [a1 transactionCancelledErrorWithTransaction:a3 code:-4003 underlyingError:a4];
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return [a1 transactionCancelledErrorWithTransaction:a3 code:-4001 underlyingError:a4];
}

+ (id)delegateCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return [a1 transactionCancelledErrorWithTransaction:a3 code:-4002 underlyingError:a4];
}

+ (id)userClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v9 setValue:@"MZKeyValueStoreErrorUserClamp" forKey:NSLocalizedDescriptionKey];
  if (fabs(a4) > 2.22044605e-16)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    [v9 setValue:v10 forKey:@"MZKeyValueStoreRetrySecondsKey"];
  }

  id v11 = sub_100048FF0(v9, v7);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -2003LL,  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
  [v13 setTransactionDescription:v14];

  return v13;
}

+ (id)clientClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v9 setValue:@"MZKeyValueStoreErrorClientClamp" forKey:NSLocalizedDescriptionKey];
  if (fabs(a4) > 2.22044605e-16)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    [v9 setValue:v10 forKey:@"MZKeyValueStoreRetrySecondsKey"];
  }

  id v11 = sub_100048FF0(v9, v7);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -1009LL,  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
  [v13 setTransactionDescription:v14];

  return v13;
}

+ (id)serverClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v9 setValue:@"MZKeyValueStoreErrorServerClamp" forKey:NSLocalizedDescriptionKey];
  if (fabs(a4) > 2.22044605e-16)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    [v9 setValue:v10 forKey:@"MZKeyValueStoreRetrySecondsKey"];
  }

  id v11 = sub_100048FF0(v9, v7);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError errorWithDomain:code:userInfo:]( &OBJC_CLASS___MZKeyValueStoreError,  "errorWithDomain:code:userInfo:",  @"MZKeyValueStoreErrorDomain",  -2002LL,  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
  [v13 setTransactionDescription:v14];

  return v13;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void)setTransactionDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end