@interface ZhuGeSingletonService
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)sharedInstance;
@end

@implementation ZhuGeSingletonService

+ (id)sharedInstance
{
  if (qword_10001A0B0 != -1) {
    dispatch_once(&qword_10001A0B0, &stru_100014440);
  }
  pthread_mutex_lock(&stru_10001A0B8);
  v3 = (void *)qword_10001A0F8;
  if (!qword_10001A0F8)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = (void *)qword_10001A0F8;
    qword_10001A0F8 = (uint64_t)v4;

    v3 = (void *)qword_10001A0F8;
  }

  v6 = NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v7]);

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)a1);
    v10 = (void *)qword_10001A0F8;
    v11 = NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v10 setObject:v9 forKeyedSubscript:v12];

    v13 = (void *)qword_10001A0F8;
    v14 = NSStringFromClass((Class)a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v15]);
    [v16 initData];
  }

  pthread_mutex_unlock(&stru_10001A0B8);
  v17 = (void *)qword_10001A0F8;
  v18 = NSStringFromClass((Class)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v19]);

  return v20;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end