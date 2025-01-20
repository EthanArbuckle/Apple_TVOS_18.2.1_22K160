@interface RBCoalitionKernelAdapter
- (int64_t)applyCoalitionWithID:(unint64_t)a3 coalitionLevel:(unint64_t)a4;
- (int64_t)coalitionInfoForPID:(int)a3 outCoalitionInfo:(coalition_info *)a4;
- (unint64_t)coalitionLevelForID:(unint64_t)a3;
@end

@implementation RBCoalitionKernelAdapter

- (unint64_t)coalitionLevelForID:(unint64_t)a3
{
  return 0LL;
}

- (int64_t)applyCoalitionWithID:(unint64_t)a3 coalitionLevel:(unint64_t)a4
{
  return -1LL;
}

- (int64_t)coalitionInfoForPID:(int)a3 outCoalitionInfo:(coalition_info *)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  int v19 = a3;
  rbs_process_log();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188634000, v6, OS_LOG_TYPE_DEFAULT, "coalitionInfoForPID: Calling proc_pidinfo", buf, 2u);
  }

  int v7 = proc_pidinfo(a3, 20, 0LL, buf, 40);
  if (v7 < 0)
  {
    int v11 = v7;
    rbs_process_log();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RBCoalitionKernelAdapter coalitionInfoForPID:outCoalitionInfo:].cold.1(a3, v11, v12);
    }

    return -1LL;
  }

  else
  {
    size_t v17 = 8LL;
    int v8 = sysctlbyname("kern.coalition_roles", v30, &v17, &v19, 4uLL);
    if (v8 < 0 || v17 != 8)
    {
      rbs_process_log();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = v19;
        uint64_t v14 = *(void *)buf;
        uint64_t v15 = *(void *)&buf[8];
        int v16 = *__error();
        *(_DWORD *)v20 = 67110144;
        int v21 = v13;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2048;
        uint64_t v25 = v15;
        __int16 v26 = 1024;
        int v27 = v8;
        __int16 v28 = 1024;
        int v29 = v16;
        _os_log_error_impl( &dword_188634000,  v9,  OS_LOG_TYPE_ERROR,  "Kernel call to get coalition roles for PID %d, resource coalition id: %llu, jetsam coalition id: %llu, failed: ret %d, errno %d.",  v20,  0x28u);
      }
    }

    int64_t result = 0LL;
    *(_OWORD *)&a4->var0 = *(_OWORD *)buf;
    a4->var2 = v31 == 1;
  }

  return result;
}

- (void)coalitionInfoForPID:(os_log_s *)a3 outCoalitionInfo:.cold.1(int a1, int a2, os_log_s *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v6 = *__error();
  v7[0] = 67109632;
  v7[1] = a1;
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_error_impl( &dword_188634000,  a3,  OS_LOG_TYPE_ERROR,  "Kernel call to get coalition info for PID %d failed: ret %d, errno %d.",  (uint8_t *)v7,  0x14u);
}

@end