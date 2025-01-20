@interface SKResizeOperation
- (BOOL)resizeLastPartitionWithError:(id *)a3;
- (BOOL)run;
- (SKDisk)targetDisk;
- (SKLastPartitionResizer)lastPartResizer;
- (SKResizeOperation)initWithDisk:(id)a3 toSize:(unint64_t)a4 withCompletionBlock:(id)a5;
- (id)callbackBlock;
- (unint64_t)size;
- (void)finishWithError:(id)a3;
- (void)setCallbackBlock:(id)a3;
- (void)setLastPartResizer:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setTargetDisk:(id)a3;
@end

@implementation SKResizeOperation

- (SKResizeOperation)initWithDisk:(id)a3 toSize:(unint64_t)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SKResizeOperation;
  v10 = -[SKManagerOperation init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    -[SKResizeOperation setTargetDisk:](v10, "setTargetDisk:", v8);
    -[SKResizeOperation setSize:](v11, "setSize:", a4);
    -[SKResizeOperation setCallbackBlock:](v11, "setCallbackBlock:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[SKProgress progressWithTotalUnitCount:]( &OBJC_CLASS___SKProgress,  "progressWithTotalUnitCount:",  100LL));
    -[SKManagerOperation setSkProgress:](v11, "setSkProgress:", v12);
  }

  return v11;
}

- (BOOL)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKResizeOperation targetDisk](self, "targetDisk"));
  unsigned int v4 = [v3 isWholeDisk];

  if (v4)
  {
    id v10 = 0LL;
    -[SKResizeOperation resizeLastPartitionWithError:](self, "resizeLastPartitionWithError:", &v10);
    id v5 = v10;
  }

  else
  {
    id v6 = sub_10000E2BC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SKResizeOperation run]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s: Resize operation (on iOS) is currently supported only for whole disks",  buf,  0xCu);
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[SKError errorWithPOSIXCode:error:](&OBJC_CLASS___SKError, "errorWithPOSIXCode:error:", 45LL, 0LL));
  }

  id v8 = v5;
  -[SKResizeOperation finishWithError:](self, "finishWithError:", v5);

  return 1;
}

- (void)finishWithError:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](self, "skProgress"));
    id v5 = [v4 totalUnitCount];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](self, "skProgress"));
    [v6 setCompletedUnitCount:v5];
  }

  v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[SKResizeOperation callbackBlock](self, "callbackBlock"));
  ((void (**)(void, id))v7)[2](v7, v8);

  -[SKManagerOperation finished](self, "finished");
}

- (BOOL)resizeLastPartitionWithError:(id *)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___SKLastPartitionResizer);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKResizeOperation targetDisk](self, "targetDisk"));
  v7 = -[SKDiskResizerBase initWithDisk:requestedSize:]( v5,  "initWithDisk:requestedSize:",  v6,  -[SKResizeOperation size](self, "size"));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](self, "skProgress"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](v7, "progress"));
  [v8 chainChildProgress:v9 withPendingUnitCount:100];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitionResizer resizeStateMachine:](v7, "resizeStateMachine:", a3));
  v11 = v10;
  if (v10) {
    unsigned __int8 v12 = [v10 runWithError:a3];
  }
  else {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (SKDisk)targetDisk
{
  return (SKDisk *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTargetDisk:(id)a3
{
}

- (id)callbackBlock
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCallbackBlock:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (SKLastPartitionResizer)lastPartResizer
{
  return self->_lastPartResizer;
}

- (void)setLastPartResizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end