@interface SUCoreCodeCoverage
+ (id)getCodeCoveragePathForName:(id)a3;
+ (void)_handleSignal:(int)a3 forName:(id)a4;
+ (void)dumpCodeCoverageForName:(id)a3;
+ (void)initializeForName:(id)a3;
+ (void)resetCodeCoverageForName:(id)a3;
@end

@implementation SUCoreCodeCoverage

+ (void)initializeForName:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( &dword_187139000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)",  v5,  2u);
  }
}

+ (void)_handleSignal:(int)a3 forName:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  if (a3 == 31)
  {
    v8 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v8 oslog];
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl( &dword_187139000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SUCoreCodeCoverage] Signal handler received SIGUSR2, resetting code coverage",  (uint8_t *)v12,  2u);
    }

    +[SUCoreCodeCoverage resetCodeCoverageForName:](&OBJC_CLASS___SUCoreCodeCoverage, "resetCodeCoverageForName:", v5);
  }

  else if (a3 == 30)
  {
    v6 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v6 oslog];
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl( &dword_187139000,  v7,  OS_LOG_TYPE_DEFAULT,  "[SUCoreCodeCoverage] Signal handler received SIGUSR1, dumping code coverage",  (uint8_t *)v12,  2u);
    }

    +[SUCoreCodeCoverage dumpCodeCoverageForName:](&OBJC_CLASS___SUCoreCodeCoverage, "dumpCodeCoverageForName:", v5);
  }

  else
  {
    v10 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v10 oslog];
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = a3;
      _os_log_impl( &dword_187139000,  v11,  OS_LOG_TYPE_DEFAULT,  "[SUCoreCodeCoverage] Unhandled signal: %d (ignored)",  (uint8_t *)v12,  8u);
    }
  }
}

+ (id)getCodeCoveragePathForName:(id)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  v3 = (objc_class *)MEMORY[0x189607848];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  v6 = (void *)NSString;
  uint64_t v7 = getpid();
  [MEMORY[0x189603F50] date];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringFromDate:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"%@/%@.%d.%@.profraw", @"/tmp/ASUCodeCoverage", v4, v7, v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v22 = *MEMORY[0x189607500];
  [MEMORY[0x189607968] numberWithInt:511];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v13 fileExistsAtPath:@"/tmp/ASUCodeCoverage"])
  {

    id v14 = 0LL;
  }

  else
  {
    [MEMORY[0x1896078A8] defaultManager];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = 0LL;
    char v17 = [v16 createDirectoryAtPath:@"/tmp/ASUCodeCoverage" withIntermediateDirectories:0 attributes:v12 error:&v21];
    id v14 = v21;

    if ((v17 & 1) == 0)
    {
      v19 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v19 oslog];
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[SUCoreCodeCoverage getCodeCoveragePathForName:].cold.1((uint64_t)v14, v20);
      }

      id v18 = 0LL;
      goto LABEL_10;
    }
  }

  id v18 = v10;
LABEL_10:

  return v18;
}

+ (void)dumpCodeCoverageForName:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( &dword_187139000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)",  v5,  2u);
  }
}

+ (void)resetCodeCoverageForName:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( &dword_187139000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)",  v5,  2u);
  }
}

+ (void)getCodeCoveragePathForName:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_187139000,  a2,  OS_LOG_TYPE_ERROR,  "[SUCoreCodeCoverage] Unable to create output directory: '%{public}@'",  (uint8_t *)&v2,  0xCu);
}

@end