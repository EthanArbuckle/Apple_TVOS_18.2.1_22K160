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
  v6 = -[SKTaskExecuter init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tasks, a3);
  }

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  -[SKTaskExecuter tasks](self, "tasks");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_148];
  v6 = -[SKTaskExecuter tasks](self, "tasks");
  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_151];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 filteredArrayUsingPredicate:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v8 count])
  {
    do
    {
      [v8 enumerateObjectsUsingBlock:&__block_literal_global_152];
      -[SKTaskExecuter tasks](self, "tasks");
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_153];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 filteredArrayUsingPredicate:v10];
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v11;
    }

    while ([v11 count]);
  }

  else
  {
    v11 = v8;
  }
  v12 = -[SKTaskExecuter tasks](self, "tasks");
  [v12 enumerateObjectsUsingBlock:&__block_literal_global_154];
  v13 = -[SKTaskExecuter tasks](self, "tasks");
  [v13 enumerateObjectsUsingBlock:&__block_literal_global_155];
  v14 = -[SKTaskExecuter tasks](self, "tasks");
  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_156];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 filteredArrayUsingPredicate:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = [v16 count];
  if (v17)
  {
    SKGetOSLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v16 count];
      [v16 objectAtIndexedSubscript:0];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 task];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = 136315650;
      v24 = "-[SKTaskExecuter waitWithError:]";
      __int16 v25 = 2048;
      uint64_t v26 = v19;
      __int16 v27 = 1024;
      int v28 = [v21 terminationStatus];
      _os_log_impl( &dword_188F75000,  v18,  OS_LOG_TYPE_ERROR,  "%s: %lu tasks failed, first exit status %d",  (uint8_t *)&v23,  0x1Cu);
    }

    if (a3)
    {
      +[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 140LL, 0LL);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v17 == 0;
}

void __32__SKTaskExecuter_waitWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 launch];
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 isRunning];

  return v3;
}

void __32__SKTaskExecuter_waitWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 stdoutParser];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [v10 stdoutParser];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stdoutHandle];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 readDataUpToLength:4096 error:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 parseData:v5];
  }

  [v10 stderrParser];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v10 stderrParser];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stderrHandle];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 readDataUpToLength:4096 error:0];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 parseData:v9];
  }
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 isRunning];

  return v3;
}

void __32__SKTaskExecuter_waitWithError___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 waitUntilExit];
}

void __32__SKTaskExecuter_waitWithError___block_invoke_6(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 stderrParser];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [v10 stdoutParser];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stdoutHandle];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 readDataToEndOfFile];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 parseData:v5];
  }

  [v10 stderrParser];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v10 stderrParser];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stderrHandle];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 readDataToEndOfFile];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 parseData:v9];
  }
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 endedSuccessfully] ^ 1;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end