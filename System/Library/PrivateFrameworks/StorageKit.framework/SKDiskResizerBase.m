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
  v8 = -[SKDiskResizerBase init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_disk, a3);
    v9->_requestedSize = a4;
    v9->_originalSize = -[SKDiskResizerBase currentSize](v9, "currentSize");
    uint64_t v10 = +[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL);
    progress = v9->_progress;
    v9->_progress = (SKProgress *)v10;
  }

  return v9;
}

- (int64_t)completedUnitCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = [v2 completedUnitCount];

  return v3;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (a3 >= 100) {
      a3 = 100LL;
    }
    -[SKDiskResizerBase progress](self, "progress");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 setCompletedUnitCount:a3];
  }

- (unint64_t)currentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 unformattedSize];

  return v3;
}

- (BOOL)resizeWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v5 = -[SKDiskResizerBase resizeStateMachine:](self, "resizeStateMachine:");
  -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", v5);

  -[SKDiskResizerBase activeFSM](self, "activeFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKDiskResizerBase activeFSM](self, "activeFSM");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = 0LL;
    [v7 runWithError:&v16];
    id v8 = v16;
    v9 = -[SKDiskResizerBase resizeError](self, "resizeError");
    if (v9)
    {
      uint64_t v10 = -[SKDiskResizerBase resizeError](self, "resizeError");

      id v8 = (id)v10;
    }

    if (a3) {
      *a3 = v8;
    }
    -[SKDiskResizerBase setActiveFSM:](self, "setActiveFSM:", 0LL);
    v11 = -[SKDiskResizerBase progress](self, "progress");
    uint64_t v12 = [v11 totalUnitCount];
    -[SKDiskResizerBase progress](self, "progress");
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setCompletedUnitCount:v12];

    BOOL v14 = v8 == 0LL;
  }

  else
  {
    SKGetOSLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SKDiskResizerBase resizeWithError:]";
      _os_log_impl(&dword_188F75000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "%s: Can't create FSM for resize", buf, 0xCu);
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (id)resizeStateMachine:(id *)a3
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 raise];

  return 0LL;
}

- (id)eventFromSize
{
  unint64_t v3 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
  unint64_t v4 = -[SKDiskResizerBase originalSize](self, "originalSize");
  v5 = &kGrowEvent;
  if (v3 <= v4) {
    v5 = &kShrinkEvent;
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
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a3 && (id v5 = *a3) != 0LL)
  {
    id v6 = v5;
    -[SKDiskResizerBase resizeError](self, "resizeError");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    SKGetOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[SKDiskResizerBase resizeError](self, "resizeError");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = 136315650;
        id v16 = "-[SKDiskResizerBase rollbackResize:]";
        __int16 v17 = 2112;
        v18 = v6;
        __int16 v19 = 2112;
        unint64_t v20 = (unint64_t)v10;
        _os_log_impl( &dword_188F75000,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failing resize with %@ after attempt to recover from %@",  (uint8_t *)&v15,  0x20u);
      }

      -[SKDiskResizerBase resizeError](self, "resizeError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0LL;
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        id v16 = "-[SKDiskResizerBase rollbackResize:]";
        __int16 v17 = 2112;
        v18 = v6;
        __int16 v19 = 2048;
        unint64_t v20 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
        __int16 v21 = 2048;
        unint64_t v22 = -[SKDiskResizerBase originalSize](self, "originalSize");
        _os_log_impl( &dword_188F75000,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Rolling back resize after %@, reverting resize direction from %llu to %llu",  (uint8_t *)&v15,  0x2Au);
      }

      -[SKDiskResizerBase setResizeError:](self, "setResizeError:", v6);
      unint64_t v13 = -[SKDiskResizerBase requestedSize](self, "requestedSize");
      -[SKDiskResizerBase setRequestedSize:]( self,  "setRequestedSize:",  -[SKDiskResizerBase originalSize](self, "originalSize"));
      -[SKDiskResizerBase setOriginalSize:](self, "setOriginalSize:", v13);
      -[SKDiskResizerBase eventFromSize](self, "eventFromSize");
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    }
  }

  else
  {
    SKGetOSLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[SKDiskResizerBase rollbackResize:]";
      _os_log_impl( &dword_188F75000,  v12,  OS_LOG_TYPE_ERROR,  "%s: Reached resize rollback without setting any error",  (uint8_t *)&v15,  0xCu);
    }

    +[SKError nilWithSKErrorCode:error:](&OBJC_CLASS___SKError, "nilWithSKErrorCode:error:", 102LL, a3);
    return (id)objc_claimAutoreleasedReturnValue();
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