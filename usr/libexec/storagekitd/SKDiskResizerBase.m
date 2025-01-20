@interface SKDiskResizerBase
- (BOOL)resizeWithError:(id *)a3;
- (NSError)resizeError;
- (SKDisk)disk;
- (SKDiskResizerBase)initWithDisk:(id)a3 requestedSize:(unint64_t)a4;
- (SKProgress)progress;
- (SKStateMachine)activeFSM;
- (id)cancelWithError:(id *)a3;
- (id)eventFromSize;
- (id)resizeStateMachine:(id *)a3;
- (id)rollbackResize:(id *)a3;
- (int64_t)completedUnitCount;
- (unint64_t)currentSize;
- (unint64_t)originalSize;
- (unint64_t)requestedSize;
- (void)setActiveFSM:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setDisk:(id)a3;
- (void)setOriginalSize:(unint64_t)a3;
- (void)setProgress:(id)a3;
- (void)setRequestedSize:(unint64_t)a3;
- (void)setResizeError:(id)a3;
@end

@implementation SKDiskResizerBase

- (SKDiskResizerBase)initWithDisk:(id)a3 requestedSize:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SKDiskResizerBase;
  v8 = -[SKDiskResizerBase init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_disk, a3);
    v9->_requestedSize = a4;
    v9->_originalSize = -[SKDiskResizerBase currentSize](v9, "currentSize");
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL));
    progress = v9->_progress;
    v9->_progress = (SKProgress *)v10;
  }

  return v9;
}

- (int64_t)completedUnitCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  id v3 = [v2 completedUnitCount];

  return (int64_t)v3;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

  if (!v5)
  {
    if (a3 >= 100) {
      a3 = 100LL;
    }
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
    [v6 setCompletedUnitCount:a3];
  }

- (unint64_t)currentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase disk](self, "disk"));
  id v3 = [v2 unformattedSize];

  return (unint64_t)v3;
}

- (BOOL)resizeWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeStateMachine:](self, "resizeStateMachine:"));
  -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase activeFSM](self, "activeFSM"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase activeFSM](self, "activeFSM"));
    id v17 = 0LL;
    [v7 runWithError:&v17];
    id v8 = v17;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));
    if (v9)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

      id v8 = (id)v10;
    }

    if (a3) {
      *a3 = v8;
    }
    -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", 0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
    id v12 = [v11 totalUnitCount];
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
    [v13 setCompletedUnitCount:v12];

    BOOL v14 = v8 == 0LL;
  }

  else
  {
    id v15 = sub_10000E2BC();
    id v8 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SKDiskResizerBase resizeWithError:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "%s: Can't create FSM for resize",  buf,  0xCu);
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (id)resizeStateMachine:(id *)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"com.apple.storagekit.notimplemented",  @"A required method is not implemented",  0LL));
  [v3 raise];

  return 0LL;
}

- (id)eventFromSize
{
  unint64_t v3 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  unint64_t v4 = -[SKDiskResizerBase originalSize](self, "originalSize");
  v5 = &off_100051918;
  if (v3 <= v4) {
    v5 = &off_100051920;
  }
  return *v5;
}

- (id)cancelWithError:(id *)a3
{
  id v5 = +[SKError errorWithPOSIXCode:error:](&OBJC_CLASS___SKError, "errorWithPOSIXCode:error:", 89LL, a3);
  return -[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3);
}

- (id)rollbackResize:(id *)a3
{
  if (a3 && (id v5 = *a3) != 0LL)
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

    id v8 = sub_10000E2BC();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));
        int v17 = 136315650;
        v18 = "-[SKDiskResizerBase rollbackResize:]";
        __int16 v19 = 2112;
        v20 = v6;
        __int16 v21 = 2112;
        unint64_t v22 = (unint64_t)v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s: Failing resize with %@ after attempt to recover from %@",  (uint8_t *)&v17,  0x20u);
      }

      *a3 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));
      return 0LL;
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        v18 = "-[SKDiskResizerBase rollbackResize:]";
        __int16 v19 = 2112;
        v20 = v6;
        __int16 v21 = 2048;
        unint64_t v22 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
        __int16 v23 = 2048;
        unint64_t v24 = -[SKDiskResizerBase originalSize](self, "originalSize");
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Rolling back resize after %@, reverting resize direction from %llu to %llu",  (uint8_t *)&v17,  0x2Au);
      }

      -[SKDiskResizerBase setResizeError:](self, "setResizeError:", v6);
      unint64_t v15 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
      -[SKDiskResizerBase setRequestedSize:]( self,  "setRequestedSize:",  -[SKDiskResizerBase originalSize](self, "originalSize"));
      -[SKDiskResizerBase setOriginalSize:](self, "setOriginalSize:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));

      return v16;
    }
  }

  else
  {
    id v13 = sub_10000E2BC();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      v18 = "-[SKDiskResizerBase rollbackResize:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Reached resize rollback without setting any error",  (uint8_t *)&v17,  0xCu);
    }

    return (id)objc_claimAutoreleasedReturnValue( +[SKError nilWithSKErrorCode:error:]( &OBJC_CLASS___SKError,  "nilWithSKErrorCode:error:",  102LL,  a3));
  }

- (SKDisk)disk
{
  return self->_disk;
}

- (void)setDisk:(id)a3
{
}

- (unint64_t)requestedSize
{
  return self->_requestedSize;
}

- (void)setRequestedSize:(unint64_t)a3
{
  self->_requestedSize = a3;
}

- (SKProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (SKStateMachine)activeFSM
{
  return self->_activeFSM;
}

- (void)setActiveFSM:(id)a3
{
}

- (NSError)resizeError
{
  return self->_resizeError;
}

- (void)setResizeError:(id)a3
{
}

- (unint64_t)originalSize
{
  return self->_originalSize;
}

- (void)setOriginalSize:(unint64_t)a3
{
  self->_originalSize = a3;
}

- (void).cxx_destruct
{
}

@end