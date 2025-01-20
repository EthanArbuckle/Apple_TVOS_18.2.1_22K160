@interface UAPingUserActivityInfo
- (UAPingUserActivityInfo)initWithPayloadSize:(unint64_t)a3;
- (id)initFromPing:(id)a3;
- (id)statusString;
- (id)wasContinuedBlock;
- (void)setWasContinuedBlock:(id)a3;
@end

@implementation UAPingUserActivityInfo

- (UAPingUserActivityInfo)initWithPayloadSize:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UAPingUserActivityInfo;
  v4 = -[UAPingUserActivityInfo initWithUUID:type:options:](&v8, "initWithUUID:type:options:", 0LL, 21LL, 0LL);
  v5 = v4;
  if (v4)
  {
    -[UAPingUserActivityInfo setActivityType:](v4, "setActivityType:", @"com.apple.private.handoff.ping");
    -[UAPingUserActivityInfo setTitle:](v5, "setTitle:", @"PING!");
    -[UAPingUserActivityInfo setEligibleForHandoff:](v5, "setEligibleForHandoff:", 1LL);
    if (a3)
    {
      id v6 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", a3));
      arc4random_buf([v6 mutableBytes], (size_t)objc_msgSend(v6, "length"));
      -[UAPingUserActivityInfo setPayload:identifier:](v5, "setPayload:identifier:", v6, UAUserActivityUserInfoPayload);
    }
  }

  return v5;
}

- (id)initFromPing:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UAPingUserActivityInfo;
  v3 = -[UAPingUserActivityInfo initWithUserActivityInfo:](&v6, "initWithUserActivityInfo:", a3);
  v4 = v3;
  if (v3)
  {
    -[UAPingUserActivityInfo setType:](v3, "setType:", 22LL);
    -[UAPingUserActivityInfo setActivityType:](v4, "setActivityType:", @"com.apple.private.handoff.pong");
    -[UAPingUserActivityInfo setTitle:](v4, "setTitle:", @"PONG!");
    -[UAPingUserActivityInfo setEligibleForHandoff:](v4, "setEligibleForHandoff:", 1LL);
  }

  return v4;
}

- (id)statusString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAPingUserActivityInfo uuid](self, "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[UAPingUserActivityInfo payloadForIdentifier:]( self,  "payloadForIdentifier:",  UAUserActivityUserInfoPayload));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: payloadSize=%ld",  v4,  [v5 length]));

  return v6;
}

- (id)wasContinuedBlock
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setWasContinuedBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end