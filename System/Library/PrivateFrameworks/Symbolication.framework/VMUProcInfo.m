@interface VMUProcInfo
+ (id)getProcessIds;
+ (int)processParentId:(int)a3;
- (BOOL)isApp;
- (BOOL)isCFM;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMachO;
- (BOOL)isNative;
- (BOOL)isRunning;
- (BOOL)isSemiCriticalProcess;
- (BOOL)isSemiCriticalProcessWithNoTimeLimit;
- (BOOL)isZombie;
- (BOOL)shouldAnalyzeWithCorpse;
- (BOOL)signal:(int)a3;
- (BOOL)terminate;
- (VMUProcInfo)initWithPid:(int)a3;
- (VMUProcInfo)initWithTask:(unsigned int)a3;
- (VMUProcInfo)initWithVMUTask:(id)a3;
- (id)_infoFromCommandLine:(int)a3;
- (id)arguments;
- (id)description;
- (id)envVars;
- (id)firstArgument;
- (id)name;
- (id)platformName;
- (id)procTableName;
- (id)realAppName;
- (id)requestedAppName;
- (id)userAppName;
- (id)valueForEnvVar:(id)a3;
- (int)cpuType;
- (int)pid;
- (int)ppid;
- (int64_t)compare:(id)a3;
- (int64_t)compareByName:(id)a3;
- (int64_t)compareByUserAppName:(id)a3;
- (timeval)startTime;
- (unint64_t)hash;
- (unsigned)platform;
- (unsigned)task;
- (void)dealloc;
- (void)update;
@end

@implementation VMUProcInfo

- (VMUProcInfo)initWithPid:(int)a3
{
  v4 = -[VMUProcInfo init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    v4->_task = 0;
    vmuTask = v4->_vmuTask;
    v4->_vmuTask = 0LL;
  }

  return v5;
}

- (VMUProcInfo)initWithTask:(unsigned int)a3
{
  v4 = -[VMUProcInfo init](self, "init");
  v5 = v4;
  if (v4)
  {
    vmuTask = v4->_vmuTask;
    v4->_vmuTask = 0LL;

    if (!mach_port_mod_refs(*MEMORY[0x1895FBBE0], a3, 0, 1))
    {
      v5->_task = a3;
      if (!pid_for_task(a3, &x)) {
        v5->_pid = x;
      }
    }
  }

  return v5;
}

- (VMUProcInfo)initWithVMUTask:(id)a3
{
  id v5 = a3;
  v6 = -[VMUProcInfo init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vmuTask, a3);
    v7->_pid = -[VMUTask pid](v7->_vmuTask, "pid");
    v7->_task = -[VMUTask taskPort](v7->_vmuTask, "taskPort");
  }

  return v7;
}

- (void)dealloc
{
  if (!self->_vmuTask)
  {
    mach_port_name_t task = self->_task;
    if (task + 1 >= 2) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], task);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUProcInfo;
  -[VMUProcInfo dealloc](&v4, sel_dealloc);
}

+ (id)getProcessIds
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v10 = 0;
  *(void *)v9 = 0xE00000001LL;
  [MEMORY[0x189603FA8] array];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (sysctl(v9, 3u, 0LL, &__size, 0LL, 0LL) < 0)
  {
    perror("Failure calling sysctl to get process list buffer size");
  }

  else
  {
    v3 = (int *)calloc(1uLL, __size);
    if ((sysctl(v9, 3u, v3, &__size, 0LL, 0LL) & 0x80000000) == 0 && (int)(__size / 0x288) >= 1)
    {
      uint64_t v4 = (__size / 0x288);
      id v5 = v3 + 10;
      do
      {
        [MEMORY[0x189607968] numberWithInteger:*v5];
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 insertObject:v6 atIndex:0];

        v5 += 162;
        --v4;
      }

      while (v4);
    }

    free(v3);
  }

  return v2;
}

+ (int)processParentId:(int)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  size_t v4 = 648LL;
  *(void *)id v5 = 0xE00000001LL;
  int v6 = 1;
  int v7 = a3;
  sysctl(v5, 4u, v8, &v4, 0LL, 0LL);
  if (v4 == 648) {
    return v9;
  }
  else {
    return -1;
  }
}

- (timeval)startTime
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  p_startTime = &self->_startTime;
  __darwin_time_t tv_sec = self->_startTime.tv_sec;
  if (tv_sec) {
    goto LABEL_4;
  }
  if (self->_startTime.tv_usec)
  {
    __darwin_time_t tv_sec = 0LL;
LABEL_4:
    uint64_t v5 = *(void *)&self->_startTime.tv_usec;
    goto LABEL_21;
  }

  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
  {
    *(void *)v14 = 0LL;
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VMUTaskMemoryCache getCoreFileProcStarttimeSec:]((uint64_t)v7))
    {
    }

    else
    {
      -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = -[VMUTaskMemoryCache getCoreFileProcStarttimeUSec:]((uint64_t)v10);

      if (!v11)
      {
        __darwin_time_t tv_sec = *(void *)v14;
        self->_startTime.__darwin_time_t tv_sec = *(void *)v14;
        self->_startTime.tv_usec = 0;
        goto LABEL_4;
      }
    }

    goto LABEL_20;
  }

  *(void *)v14 = 0xE00000001LL;
  int pid = self->_pid;
  int v15 = 1;
  int v16 = pid;
  if (sysctl(v14, 4u, 0LL, &__size, 0LL, 0LL) < 0)
  {
    v12 = "Failure calling sysctl to get buf size";
LABEL_19:
    perror(v12);
    goto LABEL_20;
  }

  int v9 = (timeval *)calloc(1uLL, __size);
  if (sysctl(v14, 4u, v9, &__size, 0LL, 0LL) < 0)
  {
    free(v9);
    v12 = "Failure calling sysctl to get proc buf";
    goto LABEL_19;
  }

  if (v9[2].tv_usec == self->_pid)
  {
    timeval *p_startTime = *v9;
    free(v9);
    __darwin_time_t tv_sec = p_startTime->tv_sec;
    goto LABEL_4;
  }

  free(v9);
LABEL_20:
  uint64_t v5 = 0LL;
  __darwin_time_t tv_sec = 0LL;
LABEL_21:
  result.tv_usec = v5;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (id)procTableName
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!self->_procTableName)
  {
    vmuTask = self->_vmuTask;
    if (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore"))
    {
      *(void *)int v15 = 0xE00000001LL;
      int pid = self->_pid;
      int v16 = 1;
      int v17 = pid;
      if (sysctl(v15, 4u, 0LL, &__size, 0LL, 0LL) < 0)
      {
        v13 = "Failure calling sysctl to get buf size";
      }

      else
      {
        int v9 = calloc(1uLL, __size);
        if ((sysctl(v15, 4u, v9, &__size, 0LL, 0LL) & 0x80000000) == 0)
        {
          if (v9[10] == self->_pid)
          {
            [NSString stringWithUTF8String:(char *)v9 + 243];
            uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            uint64_t v10 = @"Exited process";
          }

          procTableName = self->_procTableName;
          self->_procTableName = &v10->isa;

          free(v9);
          return self->_procTableName;
        }

        free(v9);
        v13 = "Failure calling sysctl to get proc buf";
      }

      perror(v13);
      return 0LL;
    }

    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    size_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUTaskMemoryCache coreFileProcName](v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = (NSString *)[v5 copy];
    int v7 = self->_procTableName;
    self->_procTableName = v6;
  }

  return self->_procTableName;
}

- (id)_infoFromCommandLine:(int)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  size_t __size = 0LL;
  else {
    uint64_t v5 = (__CFString *)objc_opt_new();
  }
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
  {
    *(void *)v34 = 0LL;
    int v32 = 0;
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VMUTaskMemoryCache getCoreFileUserstack:]((uint64_t)v7))
    {
    }

    else
    {
      -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = -[VMUTaskMemoryCache getCoreFileArgsLen:]((uint64_t)v9);

      if (!v10) {
        goto LABEL_13;
      }
    }

    size_t v30 = 0LL;
    size_t v31 = 0LL;
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 mapAddress:*(void *)v34 - v32 size:v32 returnedAddress:&v31 returnedSize:&v30];

    if (v12) {
      goto LABEL_13;
    }
    size_t v16 = v30;
    size_t __size = v30;
    int v17 = malloc(v30);
    if (!v17) {
      goto LABEL_13;
    }
    v8 = v17;
    memcpy(v17, (const void *)v31, v16);
    goto LABEL_18;
  }

  *(void *)v34 = 0x800000001LL;
  size_t v31 = 8LL;
  if (!sysctl(v34, 2u, &__size, &v31, 0LL, 0LL))
  {
    *(void *)v34 = 0x3100000001LL;
    int pid = self->_pid;
    v8 = malloc(__size);
    if (sysctl(v34, 3u, v8, &__size, 0LL, 0LL))
    {
LABEL_10:
      free(v8);
      goto LABEL_13;
    }

    size_t v16 = __size;
LABEL_18:
    *((_BYTE *)v8 + v16 - 1) = 0;
    if (!a3)
    {
      v19 = (void *)NSString;
      v20 = v8 + 1;
LABEL_28:
      [v19 stringWithUTF8String:v20];
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      free(v8);
      v13 = v21;
      goto LABEL_14;
    }

    size_t v18 = 4LL;
    if (v16 >= 5)
    {
      while (*((_BYTE *)v8 + v18))
      {
        if (v16 == ++v18) {
          goto LABEL_10;
        }
      }
    }

    if (v18 < v16)
    {
      while (!*((_BYTE *)v8 + v18))
      {
        if (v16 == ++v18) {
          goto LABEL_10;
        }
      }

      if (a3 == 1)
      {
        v20 = (_DWORD *)((char *)v8 + v18);
        v19 = (void *)NSString;
        goto LABEL_28;
      }

      if (v18 < v16)
      {
        while (*((_BYTE *)v8 + v18))
        {
          if (++v18 >= v16) {
            goto LABEL_10;
          }
        }
      }

      if (v18 < v16)
      {
        while (!*((_BYTE *)v8 + v18))
        {
          if (v16 == ++v18) {
            goto LABEL_10;
          }
        }

        int v22 = *v8 - (*v8 > 0);
        if (v22 >= 1 && v18 < v16)
        {
          uint64_t v26 = 0LL;
          while (1)
          {
            [NSString stringWithUTF8String:(char *)v8 + v18];
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27)
            {
              size_t v29 = -[__CFString length](v27, "length");
            }

            else
            {
              NSLog(@"Argument num %d utf8 null: %s\n", v26, (char *)v8 + v18);
              size_t v29 = strlen((const char *)v8 + v18);
            }

            v18 += v29;
            if (v18 < __size)
            {
              while (!*((_BYTE *)v8 + v18))
              {
                if (++v18 >= __size)
                {
                  size_t v18 = __size;
                  break;
                }
              }
            }

            if (a3 == 2) {
              break;
            }
            if (a3 == 3 && v28) {
              -[__CFString addObject:](v5, "addObject:", v28);
            }

            uint64_t v26 = (v26 + 1);
            size_t v16 = __size;
          }

          goto LABEL_71;
        }

- (id)realAppName
{
  if (!self->_realAppName)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 0LL);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    realAppName = self->_realAppName;
    self->_realAppName = v3;

    uint64_t v5 = self->_realAppName;
    if (!v5 || !-[NSString length](v5, "length"))
    {
      -[VMUProcInfo procTableName](self, "procTableName");
      int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      int v7 = self->_realAppName;
      self->_realAppName = v6;
    }
  }

  return self->_realAppName;
}

- (id)requestedAppName
{
  if (!self->_requestedAppName)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 1LL);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestedAppName = self->_requestedAppName;
    self->_requestedAppName = v3;

    uint64_t v5 = self->_requestedAppName;
    if (!v5 || !-[NSString length](v5, "length"))
    {
      -[VMUProcInfo procTableName](self, "procTableName");
      int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      int v7 = self->_requestedAppName;
      self->_requestedAppName = v6;
    }
  }

  return self->_requestedAppName;
}

- (id)firstArgument
{
  p_firstArg = &self->_firstArg;
  firstArg = self->_firstArg;
  if (!firstArg)
  {
    uint64_t v5 = -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 2LL);
    int v6 = (void *)v5;
    if (v5) {
      int v7 = (__CFString *)v5;
    }
    else {
      int v7 = &stru_189E010C8;
    }
    objc_storeStrong((id *)p_firstArg, v7);

    firstArg = self->_firstArg;
  }

  return firstArg;
}

- (id)arguments
{
  arguments = self->_arguments;
  if (!arguments)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 3LL);
    size_t v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_arguments;
    self->_arguments = v4;

    arguments = self->_arguments;
  }

  return arguments;
}

- (id)envVars
{
  envVars = self->_envVars;
  if (!envVars)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 4LL);
    size_t v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_envVars;
    self->_envVars = v4;

    envVars = self->_envVars;
  }

  return envVars;
}

- (id)valueForEnvVar:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x186E32E40]();
  uint64_t v6 = [v4 length];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = (void *)[objc_alloc(NSString) initWithFormat:@"%@=", v4];
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    -[VMUProcInfo envVars](self, "envVars");
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0LL;
      uint64_t v13 = v7 + 1;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v9);
          }
          size_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v16 hasPrefix:v8])
          {
            uint64_t v17 = [v16 substringFromIndex:v13];

            int v12 = (void *)v17;
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v11);
    }

    else
    {
      int v12 = 0LL;
    }

    objc_autoreleasePoolPop(v5);
  }

  else
  {
    objc_autoreleasePoolPop(v5);
    int v12 = 0LL;
  }

  return v12;
}

- (id)userAppName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 rangeOfString:@"LaunchCFMApp"];
    if (v5)
    {
      uint64_t v6 = -[VMUProcInfo firstArgument](self, "firstArgument");

      id v4 = (void *)v6;
    }
  }

  return v4;
}

- (id)name
{
  name = self->_name;
  if (!name)
  {
    if (!self->_pid)
    {
      self->_name = (NSString *)@"mach_kernel";
      goto LABEL_7;
    }

    -[VMUProcInfo userAppName](self, "userAppName");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 lastPathComponent];
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_name;
    self->_name = v5;

    uint64_t v7 = self->_name;
    if (!v7 || !-[NSString length](v7, "length"))
    {
      name = -[VMUProcInfo procTableName](self, "procTableName");
      [name lastPathComponent];
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      int v9 = self->_name;
      self->_name = v8;

LABEL_7:
    }
  }

  return self->_name;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<VMUProcInfo: %@ (PID %d)>", self->_name, self->_pid];
}

- (int)pid
{
  return self->_pid;
}

- (int)ppid
{
  int result = self->_ppid;
  if (!result)
  {
    vmuTask = self->_vmuTask;
    if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
    {
      -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUTaskMemoryCache getCoreFilePPid:]((uint64_t)v5);

      int result = -1;
    }

    else
    {
      int result = +[VMUProcInfo processParentId:](&OBJC_CLASS___VMUProcInfo, "processParentId:", self->_pid);
    }

    self->_pint pid = result;
  }

  return result;
}

- (unsigned)task
{
  return 0;
}

- (void)update
{
  name = self->_name;
  self->_name = 0LL;

  id v4 = -[VMUProcInfo name](self, "name");
  envVars = self->_envVars;
  self->_envVars = 0LL;

  id v6 = -[VMUProcInfo envVars](self, "envVars");
  procTableName = self->_procTableName;
  self->_procTableName = 0LL;

  id v8 = -[VMUProcInfo procTableName](self, "procTableName");
  realAppName = self->_realAppName;
  self->_realAppName = 0LL;

  id v10 = -[VMUProcInfo realAppName](self, "realAppName");
  requestedAppName = self->_requestedAppName;
  self->_requestedAppName = 0LL;

  id v12 = -[VMUProcInfo requestedAppName](self, "requestedAppName");
  firstArg = self->_firstArg;
  self->_firstArg = 0LL;

  id v14 = -[VMUProcInfo firstArgument](self, "firstArgument");
  -[VMUProcInfo isZombie](self, "isZombie");
}

- (BOOL)isApp
{
  return 0;
}

- (BOOL)isMachO
{
  return !-[VMUProcInfo isCFM](self, "isCFM");
}

- (BOOL)isCFM
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v2 rangeOfString:@"LaunchCFMApp"] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (int)cpuType
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v10 = -1;
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
  {
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = [v4 getCoreFileCPUType:&v10];

    if (v5) {
      return -1;
    }
    else {
      return v10;
    }
  }

  else
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    *(_OWORD *)uint64_t v11 = 0u;
    size_t v9 = 12LL;
    if (sysctlnametomib("sysctl.proc_cputype", v11, &v9) != -1)
    {
      size_t v7 = v9;
      v11[v9] = self->_pid;
      size_t v8 = 4LL;
      size_t v9 = v7 + 1;
      if (sysctl(v11, v7 + 1, &v10, &v8, 0LL, 0LL) == -1) {
        return -1;
      }
    }

    return v10;
  }

- (BOOL)isNative
{
  vmuTask = self->_vmuTask;
  if (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore")) {
    return CSTaskIsTranslated() ^ 1;
  }
  -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 taskIsTranslated];

  return v5;
}

- (unsigned)platform
{
  unsigned int v7 = 0;
  vmuTask = self->_vmuTask;
  if (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore")) {
    return CSPlatformForTask();
  }
  -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 getPlatform:&v7];

  if (v5) {
    return 0;
  }
  else {
    return v7;
  }
}

- (id)platformName
{
  return VMUPlatformNameForPlatform(-[VMUProcInfo platform](self, "platform"));
}

- (BOOL)isRunning
{
  vmuTask = self->_vmuTask;
  return (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore")) && VMUProcessIsAnalyzable(self->_pid);
}

- (BOOL)isSemiCriticalProcess
{
  if (isSemiCriticalProcess_onceToken != -1) {
    dispatch_once(&isSemiCriticalProcess_onceToken, &__block_literal_global_15);
  }
  -[VMUProcInfo name](self, "name");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([(id)isSemiCriticalProcess_s_semiCriticalSystemProcesses containsObject:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasSuffix:@"boardd"];
  }

  return v4;
}

void __36__VMUProcInfo_isSemiCriticalProcess__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithObjects:@"Carousel", @"SpringBoard", 0];
  v1 = (void *)isSemiCriticalProcess_s_semiCriticalSystemProcesses;
  isSemiCriticalProcess_s_semiCriticalSystemProcesses = v0;
}

- (BOOL)isSemiCriticalProcessWithNoTimeLimit
{
  return 0;
}

- (BOOL)isZombie
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore")) {
    return 0;
  }
  BOOL result = 1;
  if (!self->_isZombie)
  {
    *(void *)size_t v9 = 0xE00000001LL;
    int pid = self->_pid;
    int v10 = 1;
    int v11 = pid;
    if (sysctl(v9, 4u, 0LL, &__size, 0LL, 0LL) < 0)
    {
      unsigned int v7 = "Failure calling sysctl to get buf size";
    }

    else
    {
      id v6 = calloc(1uLL, __size);
      if (sysctl(v9, 4u, v6, &__size, 0LL, 0LL) < 0)
      {
        free(v6);
        unsigned int v7 = "Failure calling sysctl to get proc buf";
      }

      else
      {
        if (*((_DWORD *)v6 + 10) == self->_pid)
        {
          self->_isZombie = *((_BYTE *)v6 + 36) == 5;
          free(v6);
          return self->_isZombie;
        }

        free(v6);
        unsigned int v7 = "Process exited";
      }
    }

    perror(v7);
    return 0;
  }

  return result;
}

- (BOOL)shouldAnalyzeWithCorpse
{
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore")) {
    return 0;
  }
  if (shouldAnalyzeWithCorpse_onceToken != -1) {
    dispatch_once(&shouldAnalyzeWithCorpse_onceToken, &__block_literal_global_67);
  }
  int v5 = (void *)shouldAnalyzeWithCorpse_s_criticalSystemProcesses;
  -[VMUProcInfo name](self, "name");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = [v5 containsObject:v6];

  return (char)v5;
}

void __38__VMUProcInfo_shouldAnalyzeWithCorpse__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithObjects:@"Activity Monitor", @"bluetoothd", @"cfprefsd", @"coreaudiod", @"coreservicesd", @"coresymbolicationd", @"diagnosticd", @"hidd", @"kernelmanagerd", @"kextd", @"launchd", @"launchd.development", @"launchservicesd", @"logd", @"loginwindow", @"mach_kernel", @"mds", @"mdworker", @"notifyd", @"opendirectoryd", @"powerd", @"ReportCrash", @"ReportMemoryException", @"ReportPanic", @"rpc.lockd", @"securityd", @"spindump_agent", @"sysdiagnose", @"taskgated", @"TouchBarServer", @"UserEventAgent", @"usbd", @"watchdogd", @"WindowServer", @"WindowManager", 0];
  v1 = (void *)shouldAnalyzeWithCorpse_s_criticalSystemProcesses;
  shouldAnalyzeWithCorpse_s_criticalSystemProcesses = v0;
}

- (BOOL)terminate
{
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore")) {
    return 1;
  }
  pid_t pid = self->_pid;
  if (pid < 1) {
    return 0;
  }
  int v6 = kill(pid, 3);
  int v7 = kill(self->_pid, 9);
  return !v6 || v7 == 0;
}

- (BOOL)signal:(int)a3
{
  vmuTask = self->_vmuTask;
  return vmuTask && -[VMUTask isCore](vmuTask, "isCore") || kill(self->_pid, a3) == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [v4 pid] == self->_pid;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int pid = self->_pid;
  if (pid >= (int)[v4 pid])
  {
    int v7 = self->_pid;
    int64_t v6 = v7 != [v4 pid];
  }

  else
  {
    int64_t v6 = -1LL;
  }

  return v6;
}

- (int64_t)compareByName:(id)a3
{
  id v4 = a3;
  -[VMUProcInfo name](self, "name");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 name];
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  int64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (int64_t)compareByUserAppName:(id)a3
{
  id v4 = a3;
  -[VMUProcInfo userAppName](self, "userAppName");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 userAppName];
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  int64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUProcInfo;
  return -[VMUProcInfo hash](&v3, sel_hash);
}

- (void).cxx_destruct
{
}

@end