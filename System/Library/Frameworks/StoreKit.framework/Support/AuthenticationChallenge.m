@interface AuthenticationChallenge
+ (id)_messageForProtectionSpace:(id)a3;
+ (id)_titleForProtectionSpace:(id)a3;
- (AuthenticationChallenge)initWithAuthenticationChallenge:(id)a3;
- (NSString)localizedMessage;
- (NSString)localizedTitle;
- (NSString)user;
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation AuthenticationChallenge

- (AuthenticationChallenge)initWithAuthenticationChallenge:(id)a3
{
  id v5 = a3;
  v6 = -[AuthenticationChallenge init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_challenge, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 protectionSpace]);
    id v9 = [(id)objc_opt_class(v7) _messageForProtectionSpace:v8];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    localizedMessage = v7->_localizedMessage;
    v7->_localizedMessage = (NSString *)v10;

    id v12 = [(id)objc_opt_class(v7) _titleForProtectionSpace:v8];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    localizedTitle = v7->_localizedTitle;
    v7->_localizedTitle = (NSString *)v13;
  }

  return v7;
}

- (NSString)user
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLAuthenticationChallenge proposedCredential](self->_challenge, "proposedCredential"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 user]);

  return (NSString *)v3;
}

+ (id)_messageForProtectionSpace:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
  id v6 = [v3 port];
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%ld", v5, v6));
  }
  v8 = v7;
  if ([v3 isProxy])
  {
    uint64_t v9 = ASDLocalizedString(@"PROXY_AUTHENTICATION_MESSAGE_%@_%@");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v3 protocol]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v10,  @"%@%@",  0LL,  v11,  v8));
    [v4 appendString:v12];
  }

  else
  {
    uint64_t v13 = ASDLocalizedString(@"SERVER_AUTHENTICATION_MESSAGE_%@");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v10,  @"%@",  0LL,  v8));
    [v4 appendString:v11];
  }

  else {
    v14 = @"INSECURE_AUTH";
  }
  uint64_t v15 = ASDLocalizedString(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v4 appendFormat:@" %@", v16];

  return v4;
}

+ (id)_titleForProtectionSpace:(id)a3
{
  else {
    return (id)ASDLocalizedString(@"SERVER_AUTHENTICATION_TITLE");
  }
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (void)setUser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end