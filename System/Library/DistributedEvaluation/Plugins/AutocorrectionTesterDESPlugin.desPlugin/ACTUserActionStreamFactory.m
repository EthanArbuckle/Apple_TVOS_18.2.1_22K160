@interface ACTUserActionStreamFactory
+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4;
@end

@implementation ACTUserActionStreamFactory

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (NSString *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"UserActionStream"]);
  v8 = v7;
  if (v7) {
    Class v9 = NSClassFromString(v7);
  }
  else {
    Class v9 = (Class)&OBJC_CLASS____ACTUserActionStream;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class userActionStreamWithParameters:delegate:]( v9,  "userActionStreamWithParameters:delegate:",  v5,  v6));

  return v10;
}

@end