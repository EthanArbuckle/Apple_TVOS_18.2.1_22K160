@interface AMSMetrics
+ (id)lib_sharedInstanceWithContainerId:(id)a3;
+ (id)lib_sharedMetricsQueue;
@end

@implementation AMSMetrics

+ (id)lib_sharedInstanceWithContainerId:(id)a3
{
  id v3 = a3;
  if (qword_10032DD58 != -1) {
    dispatch_once(&qword_10032DD58, &stru_1002E6D18);
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue([(id)qword_10032DD50 objectForKey:v3]);
  if (!v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___AMSMetrics);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[Bag defaultBag](&OBJC_CLASS____TtC9storekitd3Bag, "defaultBag"));
    id v4 = [v5 initWithContainerID:v3 bag:v6];

    [(id)qword_10032DD50 setObject:v4 forKey:v3];
  }

  return v4;
}

+ (id)lib_sharedMetricsQueue
{
  if (qword_10032DD68 != -1) {
    dispatch_once(&qword_10032DD68, &stru_1002E6D38);
  }
  return (id)qword_10032DD60;
}

@end