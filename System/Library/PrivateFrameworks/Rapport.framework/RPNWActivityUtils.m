@interface RPNWActivityUtils
+ (id)activityFromToken:(id)a3;
+ (id)tokenForActivity:(id)a3;
+ (id)updateOptions:(id)a3 withNWActivityMetrics:(id)a4;
+ (void)failActivity:(id)a3 error:(id)a4;
@end

@implementation RPNWActivityUtils

+ (id)tokenForActivity:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  else {
    v4 = 0LL;
  }

  return v4;
}

+ (id)activityFromToken:(id)a3
{
  id v3 = a3;
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    [a3 getUUIDBytes:v5];
    id v3 = (void *)nw_activity_create_from_token();
  }

  return v3;
}

+ (void)failActivity:(id)a3 error:(id)a4
{
  id v7 = a4;
  id v5 = a3;
  if (v7)
  {
    id v6 = [v7 domain];
    [v6 UTF8String];

    [v7 code];
    nw_activity_complete_with_reason_and_underlying_error_string();
  }

  else
  {
    nw_activity_complete_with_reason();
  }
}

+ (id)updateOptions:(id)a3 withNWActivityMetrics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = (id)[v5 mutableCopy];
    if (!v7) {
      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    [v7 setObject:v6 forKeyedSubscript:@"nwActivityMetrics"];

    id v5 = v7;
  }

  return v5;
}

@end