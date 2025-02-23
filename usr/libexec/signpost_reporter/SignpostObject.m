@interface SignpostObject
- (id)coreAnalyticsPayload;
- (id)signpostType;
@end

@implementation SignpostObject

- (id)signpostType
{
  return @"SignpostObject";
}

- (id)coreAnalyticsPayload
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject subsystem](self, "subsystem"));
  [v3 setObject:v4 forKeyedSubscript:@"Subsystem"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject category](self, "category"));
  [v3 setObject:v5 forKeyedSubscript:@"Category"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject name](self, "name"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject name](self, "name"));
    [v3 setObject:v7 forKeyedSubscript:@"Name"];
  }

  else
  {
    [v3 setObject:@"Unknown" forKeyedSubscript:@"Name"];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string1Name](self, "string1Name"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string1Name](self, "string1Name"));
    [v3 setObject:v9 forKeyedSubscript:@"String1Name"];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string1Value](self, "string1Value"));
    [v3 setObject:v10 forKeyedSubscript:@"String1Value"];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string2Name](self, "string2Name"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string2Name](self, "string2Name"));
    [v3 setObject:v12 forKeyedSubscript:@"String2Name"];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject string2Value](self, "string2Value"));
    [v3 setObject:v13 forKeyedSubscript:@"String2Value"];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number1Name](self, "number1Name"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number1Name](self, "number1Name"));
    [v3 setObject:v15 forKeyedSubscript:@"Number1Name"];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number1Value](self, "number1Value"));
    [v3 setObject:v16 forKeyedSubscript:@"Number1Value"];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number2Name](self, "number2Name"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number2Name](self, "number2Name"));
    [v3 setObject:v18 forKeyedSubscript:@"Number2Name"];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject number2Value](self, "number2Value"));
    [v3 setObject:v19 forKeyedSubscript:@"Number2Value"];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostObject signpostType](self, "signpostType"));
  [v3 setObject:v20 forKeyedSubscript:@"IntervalType"];

  -[SignpostObject durationSeconds](self, "durationSeconds");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v3 setObject:v21 forKeyedSubscript:@"DurationInSeconds"];

  return v3;
}

@end