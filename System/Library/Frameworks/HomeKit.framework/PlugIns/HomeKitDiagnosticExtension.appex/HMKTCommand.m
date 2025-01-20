@interface HMKTCommand
+ (NSString)name;
- (int)main:(id)a3;
@end

@implementation HMKTCommand

+ (NSString)name
{
  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if ([v3 hasPrefix:@"HMKT"])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"HMKT", "length")));

    v3 = (void *)v4;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lowercaseString]);

  return (NSString *)v5;
}

- (int)main:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:]( v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16);
}

@end