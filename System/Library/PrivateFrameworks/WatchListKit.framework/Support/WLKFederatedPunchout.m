@interface WLKFederatedPunchout
- (NSDate)matchTime;
- (id)expiry;
- (int64_t)failureReason;
- (unint64_t)ttl;
- (void)setFailureReason:(int64_t)a3;
- (void)setMatchTime:(id)a3;
- (void)setTtl:(unint64_t)a3;
@end

@implementation WLKFederatedPunchout

- (unint64_t)ttl
{
  id AssociatedObject = objc_getAssociatedObject(self, WLKFederatedPunchoutReporterAdditionsKeyTTL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (void)setTtl:(unint64_t)a3
{
  id v4 = WLKFederatedPunchoutReporterAdditionsKeyTTL;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  objc_setAssociatedObject(self, v4, v5, (void *)1);
}

- (NSDate)matchTime
{
  return (NSDate *)objc_getAssociatedObject(self, WLKFederatedPunchoutReporterAdditionsKeyMatchTime);
}

- (void)setMatchTime:(id)a3
{
}

- (int64_t)failureReason
{
  id AssociatedObject = objc_getAssociatedObject(self, WLKFederatedPunchoutReporterAdditionsKeyFailureReason);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)setFailureReason:(int64_t)a3
{
  id v4 = WLKFederatedPunchoutReporterAdditionsKeyFailureReason;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  objc_setAssociatedObject(self, v4, v5, (void *)1);
}

- (id)expiry
{
  v3 = objc_alloc(&OBJC_CLASS___NSDate);
  double v4 = (double)-[WLKFederatedPunchout ttl](self, "ttl");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLKFederatedPunchout punchoutTime](self, "punchoutTime"));
  v6 = -[NSDate initWithTimeInterval:sinceDate:](v3, "initWithTimeInterval:sinceDate:", v5, v4);

  return v6;
}

@end