@interface SKTaskExecuter
- (BOOL)waitWithError:(id *)a3;
- (NSArray)tasks;
- (SKTaskExecuter)initWithTasks:(id)a3;
@end

@implementation SKTaskExecuter

- (SKTaskExecuter)initWithTasks:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SKTaskExecuter;
  v6 = -[SKTaskExecuter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tasks, a3);
  }

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  [v5 enumerateObjectsUsingBlock:&stru_1000083C0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100008400));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 filteredArrayUsingPredicate:v7]);

  if ([v8 count])
  {
    do
    {
      [v8 enumerateObjectsUsingBlock:&stru_100008420];
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_100008440));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredArrayUsingPredicate:v10]);

      v8 = v11;
    }

    while ([v11 count]);
  }

  else
  {
    v11 = v8;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  [v12 enumerateObjectsUsingBlock:&stru_100008460];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  [v13 enumerateObjectsUsingBlock:&stru_100008480];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskExecuter tasks](self, "tasks"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_1000084A0));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 filteredArrayUsingPredicate:v15]);

  id v17 = [v16 count];
  if (v17)
  {
    id v18 = SKGetOSLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v16 count];
      v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 task]);
      int v24 = 136315650;
      v25 = "-[SKTaskExecuter waitWithError:]";
      __int16 v26 = 2048;
      id v27 = v20;
      __int16 v28 = 1024;
      unsigned int v29 = [v22 terminationStatus];
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: %lu tasks failed, first exit status %d",  (uint8_t *)&v24,  0x1Cu);
    }

    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:userInfo:",  140LL,  0LL));
    }
  }

  return v17 == 0LL;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end