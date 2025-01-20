@interface UABestAppUserActivityInfoSuppressionRecord
- (NSDate)hardSupressUntil;
- (NSDate)lastInterestingTime;
- (NSDate)supressUntil;
- (NSUUID)itemUUID;
- (id)description;
- (void)setHardSupressUntil:(id)a3;
- (void)setItemUUID:(id)a3;
- (void)setLastInterestingTime:(id)a3;
- (void)setSupressUntil:(id)a3;
@end

@implementation UABestAppUserActivityInfoSuppressionRecord

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppUserActivityInfoSuppressionRecord itemUUID](self, "itemUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppUserActivityInfoSuppressionRecord hardSupressUntil](self, "hardSupressUntil"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppUserActivityInfoSuppressionRecord supressUntil](self, "supressUntil"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UABestAppUserActivityInfoSuppressionRecord lastInterestingTime](self, "lastInterestingTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"supressionRec(%@ hard=%@ until=%@ (lastInterestingTime=%@)"),  v3,  v4,  v5,  v6);

  return v7;
}

- (NSUUID)itemUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setItemUUID:(id)a3
{
}

- (NSDate)hardSupressUntil
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHardSupressUntil:(id)a3
{
}

- (NSDate)supressUntil
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSupressUntil:(id)a3
{
}

- (NSDate)lastInterestingTime
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLastInterestingTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end