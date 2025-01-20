@interface AMSDRefreshMultiUserOptions
- (AMSDRefreshMultiUserOptions)initWithReason:(id)a3;
- (BOOL)ignoreThrottling;
- (BOOL)shouldUseCloudData;
- (NSString)hashedDescription;
- (NSString)reasonDescription;
- (double)schedulingInterval;
- (double)throttlingInterval;
- (id)_stringForRefreshType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)reasonType;
- (void)setIgnoreThrottling:(BOOL)a3;
- (void)setReasonDescription:(id)a3;
- (void)setReasonType:(unint64_t)a3;
- (void)setSchedulingInterval:(double)a3;
- (void)setShouldUseCloudData:(BOOL)a3;
- (void)setThrottlingInterval:(double)a3;
@end

@implementation AMSDRefreshMultiUserOptions

- (AMSDRefreshMultiUserOptions)initWithReason:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AMSDRefreshMultiUserOptions;
  v5 = -[AMSDRefreshMultiUserOptions init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_ignoreThrottling = 0;
    v7 = (NSString *)[v4 copy];
    reasonDescription = v6->_reasonDescription;
    v6->_reasonDescription = v7;

    v6->_shouldUseCloudData = 1;
    v6->_schedulingInterval = 0.0;
    v6->_throttlingInterval = 0.0;
    v6->_reasonType = 2LL;
  }

  return v6;
}

- (NSString)hashedDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> {",  v5,  self));

  if (-[AMSDRefreshMultiUserOptions ignoreThrottling](self, "ignoreThrottling")) {
    v7 = @"true";
  }
  else {
    v7 = @"false";
  }
  [v6 appendFormat:@"\n  ignoreThrottling = %@", v7];
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserOptions reasonDescription](self, "reasonDescription"));
  v9 = (void *)v8;
  objc_super v10 = @"(null)";
  if (v8) {
    objc_super v10 = (const __CFString *)v8;
  }
  [v6 appendFormat:@"\n  reason = %@", v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDRefreshMultiUserOptions _stringForRefreshType:]( self,  "_stringForRefreshType:",  -[AMSDRefreshMultiUserOptions reasonType](self, "reasonType")));
  [v6 appendFormat:@"\n  refreshType = %@", v11];

  -[AMSDRefreshMultiUserOptions schedulingInterval](self, "schedulingInterval");
  objc_msgSend(v6, "appendFormat:", @"\n  schedulingInterval = %f", v12);
  if (-[AMSDRefreshMultiUserOptions shouldUseCloudData](self, "shouldUseCloudData")) {
    v13 = @"true";
  }
  else {
    v13 = @"false";
  }
  [v6 appendFormat:@"\n  shouldUseCloudData = %@", v13];
  -[AMSDRefreshMultiUserOptions throttlingInterval](self, "throttlingInterval");
  objc_msgSend(v6, "appendFormat:", @"\n  throttlingInterval = %f", v14);
  [v6 appendString:@"\n}"];
  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setIgnoreThrottling:", -[AMSDRefreshMultiUserOptions ignoreThrottling](self, "ignoreThrottling"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserOptions reasonDescription](self, "reasonDescription"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setReasonDescription:v7];

  objc_msgSend(v5, "setReasonType:", -[AMSDRefreshMultiUserOptions reasonType](self, "reasonType"));
  -[AMSDRefreshMultiUserOptions schedulingInterval](self, "schedulingInterval");
  objc_msgSend(v5, "setSchedulingInterval:");
  objc_msgSend( v5,  "setShouldUseCloudData:",  -[AMSDRefreshMultiUserOptions shouldUseCloudData](self, "shouldUseCloudData"));
  -[AMSDRefreshMultiUserOptions throttlingInterval](self, "throttlingInterval");
  objc_msgSend(v5, "setThrottlingInterval:");
  return v5;
}

- (id)_stringForRefreshType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Reason unknown";
  }
  else {
    return off_1000D7C00[a3];
  }
}

- (BOOL)ignoreThrottling
{
  return self->_ignoreThrottling;
}

- (void)setIgnoreThrottling:(BOOL)a3
{
  self->_ignoreThrottling = a3;
}

- (NSString)reasonDescription
{
  return self->_reasonDescription;
}

- (void)setReasonDescription:(id)a3
{
}

- (unint64_t)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(unint64_t)a3
{
  self->_reasonType = a3;
}

- (double)schedulingInterval
{
  return self->_schedulingInterval;
}

- (void)setSchedulingInterval:(double)a3
{
  self->_schedulingInterval = a3;
}

- (BOOL)shouldUseCloudData
{
  return self->_shouldUseCloudData;
}

- (void)setShouldUseCloudData:(BOOL)a3
{
  self->_shouldUseCloudData = a3;
}

- (double)throttlingInterval
{
  return self->_throttlingInterval;
}

- (void)setThrottlingInterval:(double)a3
{
  self->_throttlingInterval = a3;
}

- (void).cxx_destruct
{
}

@end