@interface SKManagerOperation
- (BOOL)run;
- (OS_dispatch_semaphore)finishedSemaphore;
- (SKManagerOperation)init;
- (SKProgress)skProgress;
- (float)progress;
- (id)progressHandler;
- (id)redactedDescription;
- (id)validateWithRecachedDisk:(id)a3 error:(id)a4;
- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6;
- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5;
- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5;
- (void)dmAsyncStartedForDisk:(__DADisk *)a3;
- (void)finished;
- (void)setFinishedSemaphore:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgressHandler:(id)a3;
- (void)setSkProgress:(id)a3;
@end

@implementation SKManagerOperation

- (SKManagerOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKManagerOperation;
  v2 = -[SKManagerOperation init](&v6, "init");
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    finishedSemaphore = v2->_finishedSemaphore;
    v2->_finishedSemaphore = (OS_dispatch_semaphore *)v3;
  }

  return v2;
}

- (BOOL)run
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"No implementation provided for generic base class.",  0LL));
  objc_exception_throw(v2);
  -[SKManagerOperation finished](v3, v4);
  return result;
}

- (void)finished
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  [v3 _advanceOperationQueue];

  SEL v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation finishedSemaphore](self, "finishedSemaphore"));
  dispatch_semaphore_signal(v4);
}

- (void)dmAsyncStartedForDisk:(__DADisk *)a3
{
  LODWORD(v3) = 0;
  -[SKManagerOperation setProgress:](self, "setProgress:", a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));

  if (v5)
  {
    objc_super v6 = (void (**)(id, void, float))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    v6[2](v6, 0LL, 0.0);
  }

- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler", a3, a4));

  if (v7)
  {
    *(float *)&double v8 = a5;
    -[SKManagerOperation setProgress:](self, "setProgress:", v8);
    v9 = (void (**)(id, void, float))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    v9[2](v9, 0LL, a5);
  }

- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5
{
  id v8 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));

  if (v6)
  {
    v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    -[SKManagerOperation progress](self, "progress");
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler", a3, *(void *)&a4, *(void *)&a5, a6));

  if (v7)
  {
    LODWORD(v8) = 1120403456;
    -[SKManagerOperation setProgress:](self, "setProgress:", v8);
    v9 = (void (**)(id, void))objc_claimAutoreleasedReturnValue(-[SKManagerOperation progressHandler](self, "progressHandler"));
    -[SKManagerOperation progress](self, "progress");
    v9[2](v9, 0LL);
  }

- (id)validateWithRecachedDisk:(id)a3 error:(id)a4
{
  objc_super v6 = (SKManagerOperation *)a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
LABEL_3:
    v10 = v9;
    goto LABEL_8;
  }

  id v11 = sub_10000E2BC();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (!v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      v16 = "-[SKManagerOperation validateWithRecachedDisk:error:]";
      __int16 v17 = 2112;
      v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s: Disk recache failed, failing %@",  (uint8_t *)&v15,  0x16u);
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 117LL, 0LL));
    goto LABEL_3;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    v16 = "-[SKManagerOperation validateWithRecachedDisk:error:]";
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Disk recached successfully: %@",  (uint8_t *)&v15,  0x16u);
  }

  v10 = 0LL;
LABEL_8:

  return v10;
}

- (id)redactedDescription
{
  id v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (SKProgress)skProgress
{
  return self->_skProgress;
}

- (void)setSkProgress:(id)a3
{
}

- (OS_dispatch_semaphore)finishedSemaphore
{
  return self->_finishedSemaphore;
}

- (void)setFinishedSemaphore:(id)a3
{
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
}

@end