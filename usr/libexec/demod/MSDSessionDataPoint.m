@interface MSDSessionDataPoint
- (id)print;
@end

@implementation MSDSessionDataPoint

- (id)print
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Override %@ in a subclass",  v3));

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));
  objc_exception_throw(v5);
  return -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v6, v7, v8, v9);
}

@end