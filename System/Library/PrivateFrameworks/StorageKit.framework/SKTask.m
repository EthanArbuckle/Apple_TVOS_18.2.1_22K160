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
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SKTask;
  v8 = -[SKTask init](&v26, sel_init);
  if (v8)
  {
    v9 = (NSTask *)objc_alloc_init(MEMORY[0x189607A38]);
    task = v8->_task;
    v8->_task = v9;

    -[NSTask setExecutableURL:](v8->_task, "setExecutableURL:", v6);
    -[NSTask setArguments:](v8->_task, "setArguments:", v7);
    v11 = v8->_task;
    [MEMORY[0x1896079B0] pipe];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTask setStandardOutput:](v11, "setStandardOutput:", v12);

    v13 = v8->_task;
    [MEMORY[0x1896079B0] pipe];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTask setStandardError:](v13, "setStandardError:", v14);
    v15 = -[NSTask standardOutput](v8->_task, "standardOutput");
    uint64_t v16 = [v15 fileHandleForReading];
    stdoutHandle = v8->_stdoutHandle;
    v8->_stdoutHandle = (NSFileHandle *)v16;
    v18 = -[NSTask standardError](v8->_task, "standardError");
    uint64_t v19 = [v18 fileHandleForReading];
    stderrHandle = v8->_stderrHandle;
    v8->_stderrHandle = (NSFileHandle *)v19;

    v21 = (void *)objc_opt_new();
    -[SKTask setStderrParser:](v8, "setStderrParser:", v21);

    v22 = (void *)objc_opt_new();
    -[SKTask setStdoutParser:](v8, "setStdoutParser:", v22);

    uint64_t v23 = [MEMORY[0x1896079E0] progressWithTotalUnitCount:100];
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v23;
  }

  return v8;
}

- (SKTask)initWithExecutable:(id)a3
{
  return -[SKTask initWithExecutable:arguments:](self, "initWithExecutable:arguments:", a3, MEMORY[0x189604A58]);
}

- (BOOL)endedSuccessfully
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 isRunning])
  {
    BOOL v4 = 0;
  }

  else
  {
    v5 = -[SKTask task](self, "task");
    BOOL v4 = [v5 terminationStatus] == 0;
  }

  return v4;
}

- (BOOL)waitWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 waitUntilExit];

  -[SKTask task](self, "task");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 terminationStatus];

  if (a3 && v7)
  {
    v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x189607688];
    v10 = -[SKTask task](self, "task");
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, (int)objc_msgSend(v10, "terminationStatus"), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[SKTask task](self, "task");
  BOOL v12 = [v11 terminationStatus] == 0;

  return v12;
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