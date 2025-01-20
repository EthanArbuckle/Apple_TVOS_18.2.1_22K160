@interface SKEraseOperation
- (BOOL)done;
- (BOOL)run;
- (NSMutableArray)physicalStoresToErase;
- (NSString)passwordHandle;
- (SKEraseOperation)initWithEraser:(id)a3 withCompletionBlock:(id)a4;
- (float)progress;
- (id)description;
- (id)error;
- (id)resultingDisk;
- (int64_t)physicalStoreErasing;
- (void)finished;
- (void)setPasswordHandle:(id)a3;
- (void)setPhysicalStoreErasing:(int64_t)a3;
- (void)setPhysicalStoresToErase:(id)a3;
@end

@implementation SKEraseOperation

- (SKEraseOperation)initWithEraser:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SKEraseOperation;
  v9 = -[SKManagerOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eraser, a3);
    id v11 = [v8 copy];
    id callbackBlock = v10->_callbackBlock;
    v10->_id callbackBlock = v11;
  }

  return v10;
}

- (BOOL)run
{
  eraser = self->_eraser;
  if (eraser)
  {
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    v24 = sub_100019A70;
    v25 = sub_100019A80;
    id v26 = 0LL;
    id obj = 0LL;
    v4 = (SKStateMachine *)objc_claimAutoreleasedReturnValue( -[SKEraserProtocol createStateMachineWithError:]( eraser,  "createStateMachineWithError:",  &obj));
    objc_storeStrong(&v26, obj);
    fsm = self->_fsm;
    self->_fsm = v4;

    if (self->_fsm)
    {
      objc_initWeak(&location, self);
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      v15 = sub_100019A88;
      v16 = &unk_1000452A0;
      objc_copyWeak(&v18, &location);
      v17 = &v21;
      v6 = objc_retainBlock(&v13);
      id eraseBlock = self->eraseBlock;
      self->id eraseBlock = v6;

      objc_storeWeak(&self->weakEraseBlock, v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SKDaemonManager sharedManager]( &OBJC_CLASS___SKDaemonManager,  "sharedManager",  v13,  v14,  v15,  v16));
      [v8 syncAllDisksWithCompletionBlock:self->eraseBlock];

      BOOL v9 = self->_operationError == 0LL;
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    else
    {
      objc_storeStrong((id *)&self->_operationError, (id)v22[5]);
      -[SKEraseOperation finished](self, "finished");
      BOOL v9 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    v10 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    operationError = self->_operationError;
    self->_operationError = v10;

    -[SKEraseOperation finished](self, "finished");
    return 0;
  }

  return v9;
}

- (float)progress
{
  return self->_lastProgress;
}

- (BOOL)done
{
  return self->_hasFinished;
}

- (id)error
{
  return self->_operationError;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Erase disk operation, with eraser: %@",  self->_eraser);
}

- (void)finished
{
  self->_hasFinished = 1;
  id v3 = sub_10000E2BC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self->_resultingDisk, "mountPoint"));
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Erase Complete, Mount Point: %@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v7 = (SKDisk *)objc_claimAutoreleasedReturnValue([v6 _recacheSyncDisk:self->_resultingDisk]);
  resultingDisk = self->_resultingDisk;
  self->_resultingDisk = v7;

  BOOL v9 = (NSError *)objc_claimAutoreleasedReturnValue( -[SKManagerOperation validateWithRecachedDisk:error:]( self,  "validateWithRecachedDisk:error:",  self->_resultingDisk,  self->_operationError));
  operationError = self->_operationError;
  self->_operationError = v9;

  id v11 = sub_10000E2BC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk mountPoint](self->_resultingDisk, "mountPoint"));
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Recache Complete, Mount Point: %@", buf, 0xCu);
  }

  (*((void (**)(void))self->_callbackBlock + 2))();
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SKEraseOperation;
  -[SKManagerOperation finished](&v14, "finished");
}

- (id)resultingDisk
{
  return self->_resultingDisk;
}

- (NSString)passwordHandle
{
  return self->_passwordHandle;
}

- (void)setPasswordHandle:(id)a3
{
}

- (NSMutableArray)physicalStoresToErase
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setPhysicalStoresToErase:(id)a3
{
}

- (int64_t)physicalStoreErasing
{
  return self->_physicalStoreErasing;
}

- (void)setPhysicalStoreErasing:(int64_t)a3
{
  self->_physicalStoreErasing = a3;
}

- (void).cxx_destruct
{
}

@end