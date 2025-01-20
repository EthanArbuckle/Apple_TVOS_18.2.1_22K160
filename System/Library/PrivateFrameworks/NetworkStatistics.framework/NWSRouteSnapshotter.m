@interface NWSRouteSnapshotter
- (NWSRouteSnapshotter)initWithSource:(id)a3 dest:(id)a4 mask:(id)a5 ifindex:(int)a6;
- (id)snapshot;
- (void)snapshot;
@end

@implementation NWSRouteSnapshotter

- (id)snapshot
{
  v19[15] = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  uint64_t v16 = 1007LL;
  unint64_t v17 = -[NWSSnapshotter kernelSourceRef](self, "kernelSourceRef");
  v3 = -[NWSSnapshotter snapshotSource](self, "snapshotSource");
  uint64_t v4 = [v3 send:&v15 length:24 err:v14];

  if (v4 != 24)
  {
    NStatGetLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v4 < 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter snapshot].cold.6();
      }
    }

    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[NWSRouteSnapshotter snapshot].cold.7();
    }

    goto LABEL_21;
  }
  v5 = -[NWSSnapshotter snapshotSource](self, "snapshotSource");
  uint64_t v6 = [v5 recv:&v15 length:272 err:v14];

  if (v6 <= 271)
  {
    NStatGetLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6 < 0)
    {
      if (v8) {
        -[NWSRouteSnapshotter snapshot].cold.1();
      }
    }

    else if (v8)
    {
      -[NWSRouteSnapshotter snapshot].cold.2();
    }

- (NWSRouteSnapshotter)initWithSource:(id)a3 dest:(id)a4 mask:(id)a5 ifindex:(int)a6
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NWSRouteSnapshotter;
  v13 = -[NWSRouteSnapshotter init](&v26, sel_init);
  if (!v13) {
    goto LABEL_34;
  }
  if (v11
    && (unint64_t)[v11 length] >= 0x10
    && (unint64_t)[v11 length] < 0x1D)
  {
    if (v12
      && ((unint64_t)[v11 length] < 0x10 || (unint64_t)objc_msgSend(v11, "length") >= 0x1D))
    {
      NStatGetLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.10(v12);
      }
      goto LABEL_7;
    }

    v27 = (uint64_t *)&v27;
    uint64_t v28 = 1001LL;
    uint64_t v29 = 1LL;
    memset(v30, 0, sizeof(v30));
    uint64_t v31 = 0LL;
    int v32 = a6;
    [v11 getBytes:v30 length:28];
    if (v12) {
      [v12 getBytes:(char *)&v30[1] + 12 length:28];
    }
    uint64_t v16 = [v10 send:&v27 length:84 err:v25];
    if (v16 != 84)
    {
      uint64_t v20 = v16;
      NStatGetLog();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      if (v20 < 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[NWSRouteSnapshotter snapshot].cold.6();
        }
      }

      else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.9();
      }

      goto LABEL_7;
    }

    uint64_t v17 = [v10 recv:&v27 length:88 err:v25];
    if (v17 <= 31)
    {
      uint64_t v18 = v17;
      NStatGetLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v19 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v18 < 0)
      {
        if (v19) {
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.2();
        }
      }

      else if (v19)
      {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.3();
      }

      goto LABEL_7;
    }

    if ((_DWORD)v28 != 10001)
    {
      if ((_DWORD)v28 == 1)
      {
        int v22 = v29;
        NStatGetLog();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v23 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (v22 == 2)
        {
          if (v23) {
            -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.6(v14);
          }
        }

        else if (v23)
        {
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.7(v14);
        }
      }

      else
      {
        NStatGetLog();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.4();
        }
      }

      goto LABEL_7;
    }

    if (v27 != (uint64_t *)&v27)
    {
      NStatGetLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.5((uint64_t *)&v27, (uint64_t)&v27, v14);
      }
      goto LABEL_7;
    }

    -[NWSSnapshotter setKernelSourceRef:](v13, "setKernelSourceRef:", v29);
    -[NWSSnapshotter setSnapshotSource:](v13, "setSnapshotSource:", v10);
LABEL_34:
    uint64_t v15 = v13;
    goto LABEL_35;
  }

  NStatGetLog();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.1(v11, v11 == 0LL);
  }
LABEL_7:

  uint64_t v15 = 0LL;
LABEL_35:

  return v15;
}

- (void)snapshot
{
}

- (void)initWithSource:(void *)a1 dest:(char)a2 mask:ifindex:.cold.1(void *a1, char a2)
{
  if ((a2 & 1) == 0) {
    [a1 length];
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_187FF5000, v2, v3, "dest check failed  %p %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6();
}

- (void)initWithSource:dest:mask:ifindex:.cold.2()
{
}

- (void)initWithSource:dest:mask:ifindex:.cold.3()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1();
  uint64_t v3 = 32LL;
  OUTLINED_FUNCTION_3(&dword_187FF5000, v0, v1, "recv too small, received %ld, expected %lu", v2);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:dest:mask:ifindex:.cold.4()
{
}

- (void)initWithSource:(os_log_s *)a3 dest:mask:ifindex:.cold.5(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_3( &dword_187FF5000,  a3,  (uint64_t)a3,  "received wrong context, received %llu expected %lu",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:(os_log_t)log dest:mask:ifindex:.cold.6(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_187FF5000, log, OS_LOG_TYPE_ERROR, "received non-critical error for SRC_ADDED", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithSource:(os_log_s *)a1 dest:mask:ifindex:.cold.7(os_log_s *a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  __error();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_187FF5000, a1, OS_LOG_TYPE_ERROR, "received error %d for SRC_ADDED", v2, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:dest:mask:ifindex:.cold.9()
{
}

- (void)initWithSource:(void *)a1 dest:mask:ifindex:.cold.10(void *a1)
{
}

@end