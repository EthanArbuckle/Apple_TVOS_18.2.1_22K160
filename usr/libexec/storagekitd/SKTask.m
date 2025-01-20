@interface SKTask
- (BOOL)endedSuccessfully;
- (BOOL)waitWithError:(id *)a3;
- (NSFileHandle)stderrHandle;
- (NSFileHandle)stdoutHandle;
- (NSProgress)progress;
- (NSTask)task;
- (SKTask)initWithExecutable:(id)a3;
- (SKTask)initWithExecutable:(id)a3 arguments:(id)a4;
- (SKTaskDataParser)stderrParser;
- (SKTaskDataParser)stdoutParser;
- (void)setProgress:(id)a3;
- (void)setStderrParser:(id)a3;
- (void)setStdoutParser:(id)a3;
@end

@implementation SKTask

- (SKTask)initWithExecutable:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SKTask;
  v8 = -[SKTask init](&v28, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSTask);
    task = v8->_task;
    v8->_task = v9;

    -[NSTask setExecutableURL:](v8->_task, "setExecutableURL:", v6);
    -[NSTask setArguments:](v8->_task, "setArguments:", v7);
    v11 = v8->_task;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](&OBJC_CLASS___NSPipe, "pipe"));
    -[NSTask setStandardOutput:](v11, "setStandardOutput:", v12);

    v13 = v8->_task;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPipe pipe](&OBJC_CLASS___NSPipe, "pipe"));
    -[NSTask setStandardError:](v13, "setStandardError:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSTask standardOutput](v8->_task, "standardOutput"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 fileHandleForReading]);
    stdoutHandle = v8->_stdoutHandle;
    v8->_stdoutHandle = (NSFileHandle *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSTask standardError](v8->_task, "standardError"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 fileHandleForReading]);
    stderrHandle = v8->_stderrHandle;
    v8->_stderrHandle = (NSFileHandle *)v19;

    v22 = (void *)objc_opt_new(&OBJC_CLASS___SKTaskNOOPParser, v21);
    -[SKTask setStderrParser:](v8, "setStderrParser:", v22);

    v24 = (void *)objc_opt_new(&OBJC_CLASS___SKTaskNOOPParser, v23);
    -[SKTask setStdoutParser:](v8, "setStdoutParser:", v24);

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 100LL));
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v25;
  }

  return v8;
}

- (SKTask)initWithExecutable:(id)a3
{
  return -[SKTask initWithExecutable:arguments:](self, "initWithExecutable:arguments:", a3, &__NSArray0__struct);
}

- (BOOL)endedSuccessfully
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  if ([v3 isRunning])
  {
    BOOL v4 = 0;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
    BOOL v4 = [v5 terminationStatus] == 0;
  }

  return v4;
}

- (BOOL)waitWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  [v5 waitUntilExit];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  unsigned int v7 = [v6 terminationStatus];

  if (a3 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  (int)[v8 terminationStatus],  0));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](self, "task"));
  BOOL v10 = [v9 terminationStatus] == 0;

  return v10;
}

- (SKTaskDataParser)stdoutParser
{
  return self->_stdoutParser;
}

- (void)setStdoutParser:(id)a3
{
}

- (SKTaskDataParser)stderrParser
{
  return self->_stderrParser;
}

- (void)setStderrParser:(id)a3
{
}

- (NSFileHandle)stdoutHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSFileHandle)stderrHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSTask)task
{
  return (NSTask *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end