@interface ZhuGeSingletonArmory
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)sharedInstance;
@end

@implementation ZhuGeSingletonArmory

+ (id)sharedInstance
{
  if (sharedInstance_aToken != -1) {
    dispatch_once(&sharedInstance_aToken, &__block_literal_global_1);
  }
  pthread_mutex_lock(&sharedInstance_aRecursiveMutex);
  v3 = (void *)sharedInstance__singleton;
  if (!sharedInstance__singleton)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    v5 = (void *)sharedInstance__singleton;
    sharedInstance__singleton = (uint64_t)v4;

    v3 = (void *)sharedInstance__singleton;
  }

  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)a1);
    v9 = (void *)sharedInstance__singleton;
    NSStringFromClass((Class)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v8 forKeyedSubscript:v10];

    v11 = (void *)sharedInstance__singleton;
    NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 initData];
  }

  pthread_mutex_unlock(&sharedInstance_aRecursiveMutex);
  v14 = (void *)sharedInstance__singleton;
  NSStringFromClass((Class)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __38__ZhuGeSingletonArmory_sharedInstance__block_invoke()
{
  return initPthreadRecursiveMutex(&sharedInstance_aRecursiveMutex);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end