@interface SACommandFailed
- (id)ad_error;
- (id)description;
- (int64_t)resultCallbackCode;
@end

@implementation SACommandFailed

- (int64_t)resultCallbackCode
{
  int64_t result = (int64_t)-[SACommandFailed errorCode](self, "errorCode");
  if (!result) {
    return -1LL;
  }
  return result;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v10.receiver = self;
  v10.super_class = &OBJC_CLASS___SACommandFailed;
  id v4 = -[SACommandFailed description](&v10, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[SACommandFailed errorCode](self, "errorCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SACommandFailed reason](self, "reason"));
  v8 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ errorCode: %ld reason: %@", v5, v6, v7);

  return v8;
}

- (id)ad_error
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AFSiriAceErrorDomain,  -[SACommandFailed errorCode](self, "errorCode"),  0LL);
}

@end