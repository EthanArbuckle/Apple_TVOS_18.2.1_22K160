@interface AMSDRefreshMultiUserResult
- (AMSDRefreshMultiUserOptions)options;
- (AMSDRefreshMultiUserResult)initWithHomes:(id)a3 options:(id)a4;
- (BOOL)enabledThrottling;
- (BOOL)isScheduled;
- (NSArray)errors;
- (NSArray)homes;
- (NSString)hashedDescription;
- (void)setEnabledThrottling:(BOOL)a3;
- (void)setErrors:(id)a3;
- (void)setHomes:(id)a3;
- (void)setOptions:(id)a3;
- (void)setScheduled:(BOOL)a3;
@end

@implementation AMSDRefreshMultiUserResult

- (AMSDRefreshMultiUserResult)initWithHomes:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AMSDRefreshMultiUserResult;
  v9 = -[AMSDRefreshMultiUserResult init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homes, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (BOOL)enabledThrottling
{
  v2 = &v5;
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  if (self->_enabledThrottling)
  {
    BOOL v3 = -[AMSDRefreshMultiUserResult isScheduled](self, "isScheduled", v5);
    v2 = v6;
  }

  else
  {
    BOOL v3 = 0;
  }

  *((_BYTE *)v2 + 24) = v3;
  _Block_object_dispose(&v5, 8);
  return v3;
}

- (void)setEnabledThrottling:(BOOL)a3
{
  self->_enabledThrottling = a3;
}

- (NSString)hashedDescription
{
  BOOL v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> {",  objc_opt_class(self, a2),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[AMSDRefreshMultiUserResult enabledThrottling](self, "enabledThrottling")) {
    uint64_t v5 = @"true";
  }
  else {
    uint64_t v5 = @"false";
  }
  [v4 appendFormat:@"\n  enabledThrottling = %@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserResult errors](self, "errors"));
  uint64_t v7 = AMSHashIfNeeded(v6);
  char v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 appendFormat:@"\n  errors = %@", v8];

  if (-[AMSDRefreshMultiUserResult isScheduled](self, "isScheduled")) {
    v9 = @"true";
  }
  else {
    v9 = @"false";
  }
  [v4 appendFormat:@"\n  scheduled = %@", v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserResult homes](self, "homes"));
  uint64_t v11 = AMSHashIfNeeded(v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v4 appendFormat:@"\n  homes = %@", v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserResult options](self, "options"));
  uint64_t v14 = AMSHashIfNeeded(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v4 appendFormat:@"\n  options = %@", v15];

  [v4 appendString:@"\n}"];
  return (NSString *)v4;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (AMSDRefreshMultiUserOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)isScheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (void).cxx_destruct
{
}

@end