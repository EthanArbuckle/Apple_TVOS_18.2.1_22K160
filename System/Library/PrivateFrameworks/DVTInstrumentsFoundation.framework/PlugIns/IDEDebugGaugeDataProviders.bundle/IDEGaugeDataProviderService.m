@interface IDEGaugeDataProviderService
- (id)sampleAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
@end

@implementation IDEGaugeDataProviderService

- (id)startSamplingForPIDs:(id)a3
{
  return a3;
}

- (id)sampleAttributes:(id)a3 forPIDs:(id)a4
{
  v13 = @"error";
  v5 = (objc_class *)objc_opt_class(self, a2, a3, a4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"internal error: class %@ doesn't implement the required methods %@",  v7,  v9));
  v14 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));

  return v11;
}

- (id)stopSamplingForPIDs:(id)a3
{
  return a3;
}

@end