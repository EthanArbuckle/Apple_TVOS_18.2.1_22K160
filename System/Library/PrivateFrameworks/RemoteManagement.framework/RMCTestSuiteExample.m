@interface RMCTestSuiteExample
+ (id)name;
- (id)run;
@end

@implementation RMCTestSuiteExample

+ (id)name
{
  return @"Example";
}

- (id)run
{
  v6[0] = @"Name";
  id v2 = [(id)objc_opt_class(self) name];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6[1] = @"Result";
  v7[0] = v3;
  v7[1] = @"Pass";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

@end