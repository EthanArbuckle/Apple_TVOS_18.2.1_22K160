@interface RPNWActivityUtils
+ (id)activityFromToken:(id)a3;
+ (id)tokenForActivity:(id)a3;
+ (id)updateOptions:(id)a3 withNWActivityMetrics:(id)a4;
+ (void)failActivity:(id)a3 error:(id)a4;
@end

@implementation RPNWActivityUtils

+ (id)tokenForActivity:(id)a3
{
  id v3 = a3;
  v4 = v3;
  else {
    v5 = 0LL;
  }

  return v5;
}

+ (id)activityFromToken:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    [a3 getUUIDBytes:v5];
    id v3 = (id)nw_activity_create_from_token(v5);
  }

  return v3;
}

+ (void)failActivity:(id)a3 error:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  if (v8)
  {
    id v6 = objc_claimAutoreleasedReturnValue([v8 domain]);
    id v7 = [v6 UTF8String];

    nw_activity_complete_with_reason_and_underlying_error_string(v5, 3, v7, [v8 code]);
  }

  else
  {
    nw_activity_complete_with_reason(v5, 3LL);
  }
}

+ (id)updateOptions:(id)a3 withNWActivityMetrics:(id)a4
{
  id v5 = (NSMutableDictionary *)a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v5, "mutableCopy");
    if (!v7) {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v6,  @"nwActivityMetrics");

    id v5 = v7;
  }

  return v5;
}

@end