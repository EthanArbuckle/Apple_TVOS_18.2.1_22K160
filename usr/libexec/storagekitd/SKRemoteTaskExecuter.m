@interface SKRemoteTaskExecuter
- (BOOL)waitWithError:(id *)a3;
- (NSArray)tasks;
- (SKRemoteTaskExecuter)initWithTasks:(id)a3;
@end

@implementation SKRemoteTaskExecuter

- (SKRemoteTaskExecuter)initWithTasks:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SKRemoteTaskExecuter;
  v6 = -[SKRemoteTaskExecuter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tasks, a3);
  }

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteTaskExecuter tasks](self, "tasks", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * (void)i) waitWithError:a3])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end