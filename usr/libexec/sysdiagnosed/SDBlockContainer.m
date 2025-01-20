@interface SDBlockContainer
+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6;
+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6 withCompletionBlock:(id)a7;
- (BOOL)_execute;
- (BOOL)finished;
- (BOOL)flattenReturnedDirectoryPaths;
- (NSMutableArray)paths;
- (id)block;
- (id)completionBlock;
- (id)logBlock;
- (void)end;
- (void)setBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3;
- (void)setLogBlock:(id)a3;
- (void)setPaths:(id)a3;
- (void)startTimeout;
@end

@implementation SDBlockContainer

+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    v12 = -[SDContainer initWithName:andDestination:withDelegate:]( objc_alloc(&OBJC_CLASS___SDBlockContainer),  "initWithName:andDestination:withDelegate:",  v9,  0LL,  v11);
    v13 = v12;
    if (v12)
    {
      -[SDBlockContainer setBlock:](v12, "setBlock:", v10);
      -[SDTaskContainer setTimeout:](v13, "setTimeout:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      -[SDBlockContainer setPaths:](v13, "setPaths:", v14);

      -[SDBlockContainer setFlattenReturnedDirectoryPaths:](v13, "setFlattenReturnedDirectoryPaths:", 1LL);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100056BA8();
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v15 stderrWrite:@"Can't create a block container with nil block %@, block : %@", v9, 0];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v16 log:@"Can't create a block container with nil block %@, block : %@", v9, 0];

    v13 = 0LL;
  }

  return v13;
}

+ (id)containerWithName:(id)a3 forBlock:(id)a4 withTimeout:(double)a5 withDelegate:(id)a6 withCompletionBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v17 = objc_msgSend( (id)objc_opt_class(a1, v16),  "containerWithName:forBlock:withTimeout:withDelegate:",  v15,  v14,  v13,  a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18) {
    [v18 setCompletionBlock:v12];
  }

  return v18;
}

- (void)end
{
  if (!-[SDBlockContainer finished](self, "finished"))
  {
    -[SDBlockContainer setFinished:](self, "setFinished:", 1LL);
    v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
    dispatch_source_cancel(v3);

    id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
    [v4 recordBlockTaskEnd];
  }

- (void)startTimeout
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003E404;
  v3[3] = &unk_100088EA8;
  v3[4] = self;
  -[SDTaskContainer startTimeout:withHandler:](self, "startTimeout:withHandler:", v3);
}

- (BOOL)_execute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](&OBJC_CLASS___SDTaskDepot, "sharedTaskDepot"));
  [v3 recordBlockTaskStart];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E548;
  block[3] = &unk_100088EA8;
  block[4] = self;
  dispatch_async(v5, block);

  return 1;
}

- (NSMutableArray)paths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setPaths:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 120LL, 1);
}

- (void)setBlock:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 128LL, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)logBlock
{
  return self->_logBlock;
}

- (void)setLogBlock:(id)a3
{
}

- (BOOL)flattenReturnedDirectoryPaths
{
  return self->_flattenReturnedDirectoryPaths;
}

- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3
{
  self->_flattenReturnedDirectoryPaths = a3;
}

- (void).cxx_destruct
{
}

@end