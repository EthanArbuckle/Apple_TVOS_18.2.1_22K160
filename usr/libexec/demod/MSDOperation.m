@interface MSDOperation
- (BOOL)canPassCheckpoint;
- (BOOL)isAllDependentInComponentCancelled;
- (BOOL)isLeaf;
- (BOOL)isRoot;
- (BOOL)result;
- (BOOL)retryable;
- (BOOL)rollback;
- (BOOL)runInstallInParallel;
- (BOOL)skipped;
- (MSDComponent)component;
- (MSDOperation)initWithContext:(id)a3;
- (MSDOperationBarrier)checkpointBarrier;
- (MSDOperationContext)context;
- (MSDOperationObserver)observer;
- (NSError)error;
- (NSMutableSet)dependents;
- (NSString)identifier;
- (id)allDependentOperations;
- (id)description;
- (id)methodSelectors;
- (int64_t)type;
- (unint64_t)flag;
- (unint64_t)signpostId;
- (void)addDependency:(id)a3;
- (void)execute;
- (void)main;
- (void)produceNewDependentOperation:(id)a3 forRollback:(BOOL)a4;
- (void)setCheckpointBarrier:(id)a3;
- (void)setComponent:(id)a3;
- (void)setContext:(id)a3;
- (void)setDependents:(id)a3;
- (void)setError:(id)a3;
- (void)setFlag:(unint64_t)a3;
- (void)setObserver:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setRetryable:(BOOL)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setSkipped:(BOOL)a3;
@end

@implementation MSDOperation

- (MSDOperation)initWithContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSDOperation;
  v5 = -[MSDOperation init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDOperation setContext:](v5, "setContext:", v4);
    -[MSDOperation setComponent:](v6, "setComponent:", 0LL);
    -[MSDOperation setFlag:](v6, "setFlag:", 0LL);
    -[MSDOperation setCheckpointBarrier:](v6, "setCheckpointBarrier:", 0LL);
    -[MSDOperation setObserver:](v6, "setObserver:", 0LL);
    id v7 = sub_10003AAAC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    -[MSDOperation setSignpostId:](v6, "setSignpostId:", os_signpost_id_generate(v8));

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[MSDOperation setDependents:](v6, "setDependents:", v9);
  }

  return v6;
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (MSDOperationContext)context
{
  return (MSDOperationContext *)*(id *)&self->_result;
}

- (int64_t)type
{
  return 0LL;
}

- (BOOL)retryable
{
  return -[MSDOperation flag](self, "flag") & 1;
}

- (void)setRetryable:(BOOL)a3
{
}

- (BOOL)skipped
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  unsigned __int8 v3 = [v2 skipped];

  return v3;
}

- (void)setSkipped:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  [v4 setSkipped:v3];
}

- (void)main
{
  BOOL v3 = _os_activity_create( (void *)&_mh_execute_header,  "Perform Operation",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v21);
  id v4 = sub_10003A95C();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: entered.", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
    [v7 operationDidStart:self];
  }

  id v8 = sub_10003AAAC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  unint64_t v10 = -[MSDOperation signpostId](self, "signpostId");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138412290;
      v23 = self;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "Perform Operation",  "Operation name: %{xcode:string}@",  buf,  0xCu);
    }
  }

  -[MSDOperation execute](self, "execute");
  id v12 = sub_10003AAAC();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  unint64_t v14 = -[MSDOperation signpostId](self, "signpostId");
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      unsigned int v16 = -[MSDOperation result](self, "result");
      *(_DWORD *)buf = 138412546;
      v23 = self;
      __int16 v24 = 1024;
      unsigned int v25 = v16;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_END,  v15,  "Perform Operation",  "Operation name: %{xcode:string}@ result: %{xcode:BOOLean}d",  buf,  0x12u);
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
    [v18 operationWillFinish:self];
  }

  id v19 = sub_10003A95C();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: will return.", buf, 0xCu);
  }

  os_activity_scope_leave(&v21);
}

- (id)methodSelectors
{
  return +[NSArray array](&OBJC_CLASS___NSArray, "array");
}

- (void)execute
{
  if (-[MSDOperation canPassCheckpoint](self, "canPassCheckpoint"))
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDOperation methodSelectors](self, "methodSelectors"));
    id v3 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v3)
    {
      id v5 = v3;
      uint64_t v6 = *(void *)v30;
      *(void *)&__int128 v4 = 67109120LL;
      __int128 v27 = v4;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          v9 = objc_autoreleasePoolPush();
          unint64_t v10 = (const char *)[v8 pointerValue];
          os_signpost_id_t v11 = NSStringFromSelector(v10);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v13 = (uint64_t (*)(MSDOperation *, const char *))-[MSDOperation methodForSelector:]( self,  "methodForSelector:",  v10);
          id v14 = sub_10003AAAC();
          os_signpost_id_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          unint64_t v16 = -[MSDOperation signpostId](self, "signpostId");
          if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v17 = v16;
            if (os_signpost_enabled(v15))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v12;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "Execute Method Selector",  "Selector name: %{xcode:string}@",  buf,  0xCu);
            }
          }

          int v18 = v13(self, v10);
          id v19 = sub_10003AAAC();
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          unint64_t v21 = -[MSDOperation signpostId](self, "signpostId");
          if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v22 = v21;
            if (os_signpost_enabled(v20))
            {
              *(_DWORD *)buf = v27;
              LODWORD(v34) = v18;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  v22,  "Execute Method Selector",  "Selector result: %{xcode:BOOLean}d",  buf,  8u);
            }
          }

          if ((v18 & 1) == 0)
          {
            id v25 = sub_10003A95C();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              sub_10009F870((uint64_t)v12, v26);
            }

            objc_autoreleasePoolPop(v9);
LABEL_21:
            uint64_t v24 = 0LL;
            goto LABEL_22;
          }

          unsigned int v23 = -[MSDOperation canPassCheckpoint](self, "canPassCheckpoint");

          objc_autoreleasePoolPop(v9);
          if (!v23) {
            goto LABEL_21;
          }
        }

        id v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    uint64_t v24 = 1LL;
LABEL_22:
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  -[MSDOperation setResult:](self, "setResult:", v24, v27);
}

- (BOOL)canPassCheckpoint
{
  if (-[MSDOperation isCancelled](self, "isCancelled"))
  {
    id v3 = sub_10003A95C();
    __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      uint64_t v24 = self;
      id v5 = "%{public}@ is cancelled.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v23, 0xCu);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (-[MSDOperation skipped](self, "skipped"))
  {
    id v6 = sub_10003A95C();
    __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      uint64_t v24 = self;
      id v5 = "%{public}@ is skipped.";
      goto LABEL_7;
    }

- (BOOL)isRoot
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependencies](self, "dependencies"));
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isLeaf
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependents](self, "dependents"));
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isAllDependentInComponentCancelled
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependents](self, "dependents", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 component]);

        if (v9 == v10 && ![v8 isCancelled])
        {
          BOOL v11 = 0;
          goto LABEL_12;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (void)addDependency:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDOperation;
  id v4 = a3;
  -[MSDOperation addDependency:](&v6, "addDependency:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dependents", v6.receiver, v6.super_class));

  [v5 addObject:self];
}

- (void)produceNewDependentOperation:(id)a3 forRollback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int128 v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 1026;
    BOOL v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: New dependent operation produced: %{public}@ for rollback: %{public, BOOL}d",  buf,  0x1Cu);
  }

  [v6 addDependency:self];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));

  if (v9)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    BOOL v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000830B4;
    block[3] = &unk_1000FA480;
    block[4] = self;
    id v13 = v6;
    BOOL v14 = v4;
    dispatch_async(v11, block);
  }
}

- (id)allDependentOperations
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v4, "addObject:", self);
  while (-[NSMutableArray count](v4, "count"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v4, "objectAtIndex:", 0LL));
    -[NSMutableArray removeObjectAtIndex:](v4, "removeObjectAtIndex:", 0LL);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v15 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dependents]);
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 component]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));

          if (v12 == v13 && (-[NSMutableSet containsObject:](v3, "containsObject:", v11) & 1) == 0)
          {
            -[NSMutableSet addObject:](v3, "addObject:", v11);
            -[NSMutableArray addObject:](v4, "addObject:", v11);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }
  }

  return v3;
}

- (BOOL)rollback
{
  return 1;
}

- (id)description
{
  unsigned int v3 = -[MSDOperation result](self, "result");
  BOOL v4 = @"NO";
  if (v3) {
    BOOL v4 = @"YES";
  }
  id v5 = v4;
  unint64_t v6 = -[MSDOperation flag](self, "flag");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation identifier](self, "identifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueName]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Name=%@ Result=%@ Flag=%lx>",  v7,  v9,  v5,  v6));

  return v10;
}

- (BOOL)runInstallInParallel
{
  return 0;
}

- (MSDComponent)component
{
  return *(MSDComponent **)&self->super._private1;
}

- (void)setComponent:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (unint64_t)signpostId
{
  return (unint64_t)self->_component;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_component = (MSDComponent *)a3;
}

- (NSMutableSet)dependents
{
  return (NSMutableSet *)self->_context;
}

- (void)setDependents:(id)a3
{
}

- (BOOL)result
{
  return (BOOL)self->super._private;
}

- (void)setResult:(BOOL)a3
{
  LOBYTE(self->super._private) = a3;
}

- (NSError)error
{
  return (NSError *)self->_signpostId;
}

- (void)setError:(id)a3
{
}

- (unint64_t)flag
{
  return (unint64_t)self->_dependents;
}

- (void)setFlag:(unint64_t)a3
{
  self->_dependents = (NSMutableSet *)a3;
}

- (MSDOperationBarrier)checkpointBarrier
{
  return (MSDOperationBarrier *)self->_error;
}

- (void)setCheckpointBarrier:(id)a3
{
}

- (MSDOperationObserver)observer
{
  return (MSDOperationObserver *)objc_loadWeakRetained((id *)&self->_flag);
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end