@interface SUControllerStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)failForwardMode;
- (SUControllerStatus)init;
- (SUControllerStatus)initWithCoder:(id)a3;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)managerState;
- (int64_t)updateState;
- (void)encodeWithCoder:(id)a3;
- (void)setFailForwardMode:(BOOL)a3;
- (void)setManagerState:(int64_t)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation SUControllerStatus

- (SUControllerStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SUControllerStatus;
  result = -[SUControllerStatus init](&v3, "init");
  if (result)
  {
    result->_failForwardMode = 0;
    result->_managerState = 0LL;
    result->_updateState = 0LL;
  }

  return result;
}

- (SUControllerStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SUControllerStatus;
  v5 = -[SUControllerStatus init](&v7, "init");
  if (v5)
  {
    v5->_managerState = (int64_t)[v4 decodeInt64ForKey:@"managerState"];
    v5->_updateState = (int64_t)[v4 decodeInt64ForKey:@"updateState"];
    v5->_failForwardMode = [v4 decodeBoolForKey:@"failForwardMode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUControllerStatus managerState](self, "managerState"),  @"managerState");
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerStatus updateState](self, "updateState"), @"updateState");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUControllerStatus failForwardMode](self, "failForwardMode"),  @"failForwardMode");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  0LL));
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SUControllerStatus),  v2,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)description
{
  id v3 = sub_100030320(-[SUControllerStatus managerState](self, "managerState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_100030320(-[SUControllerStatus updateState](self, "updateState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = -[SUControllerStatus failForwardMode](self, "failForwardMode");
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n       ManagerState: %@\n        UpdateState: %@\n    FailForwardMode: %@\n",  v4,  v6,  v8));

  return v9;
}

- (id)summary
{
  id v3 = sub_100030320(-[SUControllerStatus managerState](self, "managerState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_100030320(-[SUControllerStatus updateState](self, "updateState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%@)", v4, v6));

  return v7;
}

- (int64_t)managerState
{
  return self->_managerState;
}

- (void)setManagerState:(int64_t)a3
{
  self->_managerState = a3;
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

- (BOOL)failForwardMode
{
  return self->_failForwardMode;
}

- (void)setFailForwardMode:(BOOL)a3
{
  self->_failForwardMode = a3;
}

@end