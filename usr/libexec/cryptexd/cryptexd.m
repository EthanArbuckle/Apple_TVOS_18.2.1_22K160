void sub_100001D48(uint64_t a1, int a2)
{
  void *v4;
  os_log_s *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  char *v9;
  int v10;
  os_log_s *v11;
  void *v12;
  int v13;
  void *v14;
  os_log_s *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  CFErrorRef v21;
  CFErrorRef v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  if (a2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);

    if (v4)
    {
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cryptexName]);
      if (v6) {
        v8 = 3LL;
      }
      else {
        v8 = 2LL;
      }
      *(_DWORD *)buf = 138543618;
      v26 = v7;
      v27 = 1024;
      v28 = a2;
      v9 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v5, 16LL);
    }

    else
    {
      v19 = &_os_log_default;
      v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cryptexName]);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 1024;
      v28 = a2;
      v9 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);

      v5 = (os_log_s *)&_os_log_default;
    }

    v21 = sub_10000A444( "-[UpgradeOperation terminateJobsWithCompletion:]_block_invoke",  "upgrade_sequencer.m",  128,  "com.apple.security.cryptex.posix",  a2,  0LL,  v9);
LABEL_20:
    v22 = v21;
    free(v9);
    goto LABEL_21;
  }

  v10 = *__error();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cryptexName]);
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Terminated jobs for cryptex '%{public}@'",  buf,  0xCu);
  }

  *__error() = v10;
  v13 = proc_terminate_all_rsr(9);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);

    if (v14)
    {
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cryptexName]);
      if (v16) {
        v18 = 3LL;
      }
      else {
        v18 = 2LL;
      }
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 1024;
      v28 = v13;
      v9 = (char *)_os_log_send_and_compose_impl(v18, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
    }

    else
    {
      v23 = &_os_log_default;
      v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cryptexName]);
      *(_DWORD *)buf = 138543618;
      v26 = v24;
      v27 = 1024;
      v28 = v13;
      v9 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);

      v15 = (os_log_s *)&_os_log_default;
    }

    v21 = sub_10000A444( "-[UpgradeOperation terminateJobsWithCompletion:]_block_invoke",  "upgrade_sequencer.m",  143,  "com.apple.security.cryptex.posix",  v13,  0LL,  v9);
    goto LABEL_20;
  }

  v22 = 0LL;
LABEL_21:
  (*(void (**)(void, CFErrorRef))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v22);
}

void sub_10000213C(_Unwind_Exception *a1)
{
}

void sub_10000229C(uint64_t a1)
{
  int v2 = *__error();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Upgrade complete.", v5, 2u);
  }

  *__error() = v2;
  v4 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) group]);
  dispatch_group_leave(v4);
}

void sub_1000023E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1000026E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000270C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleInterfaceLockMessage:v3];
}

void sub_100002ACC(_Unwind_Exception *a1)
{
}

void sub_100002C2C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___UpgradeSequencer);
  id v2 = (void *)qword_10005A3D8;
  qword_10005A3D8 = (uint64_t)v1;
}

int *sub_100002E14(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _timeout]);

  int v3 = *__error();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _timeout]);
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Timed out client.: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Timed out client. [no error]", (uint8_t *)&v8, 2u);
  }

  result = __error();
  int *result = v3;
  return result;
}

void sub_100003000(uint64_t a1)
{
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_1000035D0;
  v43 = sub_1000035E0;
  id v44 = 0LL;
  id v2 = dispatch_group_create();
  if ([*(id *)(a1 + 32) _isInterfaceLocked])
  {
    int v3 = (void *)v40[5];
    v40[5] = 0LL;

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000035E8;
    v38[3] = &unk_100055190;
    v4 = *(void **)(a1 + 40);
    v38[4] = *(void *)(a1 + 32);
    v38[5] = &v39;
    [v4 enumerateKeysAndObjectsUsingBlock:v38];
    v5 = *(void **)(a1 + 32);
    if (v40[5])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 logHandle]);

      if (v6)
      {
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          uint64_t v8 = 3LL;
        }
        else {
          uint64_t v8 = 2LL;
        }
        LOWORD(v45) = 0;
        v9 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v7, 16LL);
      }

      else
      {
        LOWORD(v45) = 0;
        v9 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      }

      CFErrorRef v22 = sub_10000A444( "-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  425,  "com.apple.security.cryptex",  11LL,  (const void *)v40[5],  v9);
      free(v9);
      v23 = (dispatch_group_s *)v40[5];
      v40[5] = (uint64_t)v22;
      goto LABEL_24;
    }

    signed int v14 = [v5 _setKernelUpgradeOngoing:1];
    v15 = *(void **)(a1 + 32);
    if (!v14)
    {
      [v15 _disableInterfaceLockTimeout];
      dispatch_group_enter(v2);
      v24 = *(void **)(a1 + 40);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000038B4;
      v33[3] = &unk_1000551E0;
      v25 = v2;
      uint64_t v26 = *(void *)(a1 + 32);
      v34 = v25;
      uint64_t v35 = v26;
      char v37 = *(_BYTE *)(a1 + 56);
      v36 = &v39;
      [v24 enumerateKeysAndObjectsUsingBlock:v33];
      v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100003AE4;
      block[3] = &unk_100055208;
      uint64_t v28 = *(void *)(a1 + 32);
      v32 = &v39;
      block[4] = v28;
      id v31 = *(id *)(a1 + 48);
      dispatch_group_notify(v25, v27, block);

      dispatch_group_leave(v25);
      v23 = v34;
LABEL_24:

      goto LABEL_25;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 logHandle]);

    if (v16)
    {
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v18 = 3LL;
      }
      else {
        uint64_t v18 = 2LL;
      }
      int v45 = 67109120;
      signed int v46 = v14;
      v19 = (char *)_os_log_send_and_compose_impl(v18, 0LL, 0LL, 0LL, &_mh_execute_header, v17, 16LL);
    }

    else
    {
      int v45 = 67109120;
      signed int v46 = v14;
      v19 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v29 = sub_10000A444( "-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  435,  "com.apple.security.cryptex.posix",  v14,  0LL,  v19);
    free(v19);
    v21 = (void *)v40[5];
    v40[5] = (uint64_t)v29;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);

    if (v10)
    {
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        uint64_t v12 = 3LL;
      }
      else {
        uint64_t v12 = 2LL;
      }
      LOWORD(v45) = 0;
      v13 = (char *)_os_log_send_and_compose_impl(v12, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
    }

    else
    {
      LOWORD(v45) = 0;
      v13 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v20 = sub_10000A444( "-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  393,  "com.apple.security.cryptex",  11LL,  0LL,  v13);
    free(v13);
    v21 = (void *)v40[5];
    v40[5] = (uint64_t)v20;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v40[5]);
LABEL_25:

  _Block_object_dispose(&v39, 8);
}

void sub_100003574(_Unwind_Exception *a1)
{
}

uint64_t sub_1000035D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000035E0(uint64_t a1)
{
}

void sub_1000035E8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);

    if (v15)
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        uint64_t v17 = 3LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      signed int v14 = (char *)_os_log_send_and_compose_impl(v17, 0LL, 0LL, 0LL, &_mh_execute_header, v16, 16LL);
    }

    else
    {
      signed int v14 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v18 = sub_10000A444( "-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  407,  "com.apple.security.cryptex",  11LL,  0LL,  v14);
    goto LABEL_17;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);

    if (v11)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      signed int v14 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v12, 16LL);
    }

    else
    {
      signed int v14 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v18 = sub_10000A444( "-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  415,  "com.apple.security.cryptex",  11LL,  0LL,  v14);
LABEL_17:
    CFErrorRef v19 = v18;
    free(v14);
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *a4 = 1;
  }
}

void sub_10000388C(_Unwind_Exception *a1)
{
}

void sub_1000038B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = *(dispatch_group_s **)(a1 + 32);
  id v7 = a3;
  dispatch_group_enter(v6);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003988;
  v11[3] = &unk_1000551B8;
  uint64_t v9 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v15 = *(void *)(a1 + 48);
  id v14 = v9;
  id v10 = v5;
  [v12 _startUpgradeForCryptex:v10 withGraftPath:v7 killingJobs:v8 withCompletion:v11];
}

void sub_100003988(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v5 = *__error();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "start upgrade of cryptex '%{public}@': %@",  (uint8_t *)&v13,  0x16u);
    }

    *__error() = v5;
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v11 = *(void *)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    if (!v11) {
      objc_storeStrong(v10, a2);
    }
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "start upgrade of cryptex '%{public}@' [no error]",  (uint8_t *)&v13,  0xCu);
    }

    *__error() = v5;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_100003AE4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  int v3 = *__error();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  int v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      int v12 = 138412290;
      uint64_t v13 = v6;
      id v7 = "start upgrade session: %@";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    id v7 = "start upgrade session [no error]";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    uint32_t v10 = 2;
    goto LABEL_6;
  }

  *__error() = v3;
  [*(id *)(a1 + 32) _restartInterfaceLockTimeout];
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
}

void sub_100003CA4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _completeUpgradeWithError:0]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100003DC4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) upgradesUnderway]);
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    CFErrorRef v5 = (CFErrorRef)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
    [v3 onComplete:v4 withQueue:v5];
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);

    if (v6)
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      os_log_type_t v9 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v7, 16LL);
    }

    else
    {
      os_log_type_t v9 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v5 = sub_10000A444( "-[UpgradeSequencer onUpgradeCompleteForCryptex:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  497,  "com.apple.security.cryptex",  8LL,  0LL,  v9);
    free(v9);
    (*(void (**)(void, CFErrorRef))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v5);
  }

  uint32_t v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
  dispatch_resume(v10);
}

void sub_100003F74(_Unwind_Exception *a1)
{
}

void sub_100004044(uint64_t a1)
{
  id v2 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
  dispatch_resume(v2);
}

void sub_100004144(uint64_t a1)
{
  CFErrorRef v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);

  if (v5)
  {
    __int128 buffer = *(_OWORD *)"unknown";
    __int128 v65 = *(_OWORD *)&qword_100044668;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
    id v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v6 conn]);
    pid_t pid = xpc_connection_get_pid(v7);
    proc_name(pid, &buffer, 0x20u);

    os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (v9)
    {
      uint32_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conn]);
      if (v13)
      {
        id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
        int v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v2 conn]);
        pid_t v14 = xpc_connection_get_pid(v3);
      }

      else
      {
        pid_t v14 = -1;
      }

      *(_DWORD *)buf = 136315650;
      p___int128 buffer = &buffer;
      __int16 v60 = 1024;
      pid_t v61 = v14;
      __int16 v62 = 1024;
      LODWORD(v63) = 16;
      v38 = (char *)_os_log_send_and_compose_impl(v11, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
      if (v13)
      {
      }
    }

    else
    {
      id v25 = &_os_log_default;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 conn]);
      if (v27)
      {
        uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
        id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 conn]);
        pid_t v28 = xpc_connection_get_pid((xpc_connection_t)v2);
      }

      else
      {
        pid_t v28 = -1;
      }

      *(_DWORD *)buf = 136315650;
      p___int128 buffer = &buffer;
      __int16 v60 = 1024;
      pid_t v61 = v28;
      __int16 v62 = 1024;
      LODWORD(v63) = 16;
      v38 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      if (v27)
      {
      }

      uint32_t v10 = (os_log_s *)&_os_log_default;
    }

    CFErrorRef v39 = sub_10000A444( "-[UpgradeSequencer lockInterfaceForClient:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  524,  "com.apple.security.cryptex.posix",  16LL,  0LL,  v38);
  }

  else
  {
    if (sub_1000294D4(*(void *)(a1 + 40), (uint64_t)"com.apple.private.security.cryptex.upgrade"))
    {
      __int16 v15 = *(_xpc_connection_s **)(a1 + 40);
      id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
      xpc_connection_set_target_queue(v15, v16);

      uint64_t v17 = objc_alloc(&OBJC_CLASS___UpgradeClient);
      uint64_t v18 = *(void *)(a1 + 40);
      CFErrorRef v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      uint64_t v20 = -[UpgradeClient initWithConn:log:](v17, "initWithConn:log:", v18, v19);
      [*(id *)(a1 + 32) setLockingClient:v20];

      v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_10000494C;
      v57[3] = &unk_1000550D8;
      v57[4] = *(void *)(a1 + 32);
      [v21 onCancel:v57];

      CFErrorRef v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
      [v22 activate];

      v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100004954;
      block[3] = &unk_1000550D8;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v23, block);

      CFErrorRef v24 = 0LL;
      goto LABEL_39;
    }

    __int128 buffer = *(_OWORD *)"unknown";
    __int128 v65 = *(_OWORD *)&qword_100044668;
    CFErrorRef v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
    v30 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v29 conn]);
    pid_t v31 = xpc_connection_get_pid(v30);
    proc_name(v31, &buffer, 0x20u);

    v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
    if (v32)
    {
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        uint64_t v34 = 3LL;
      }
      else {
        uint64_t v34 = 2LL;
      }
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 conn]);
      if (v36)
      {
        id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
        int v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v2 conn]);
        pid_t v37 = xpc_connection_get_pid(v3);
      }

      else
      {
        pid_t v37 = -1;
      }

      *(_DWORD *)buf = 136315650;
      p___int128 buffer = &buffer;
      __int16 v60 = 1024;
      pid_t v61 = v37;
      __int16 v62 = 1024;
      LODWORD(v63) = 144;
      v38 = (char *)_os_log_send_and_compose_impl(v34, 0LL, 0LL, 0LL, &_mh_execute_header, v33, 16LL);
      if (v36)
      {
      }
    }

    else
    {
      id v40 = &_os_log_default;
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 conn]);
      if (v42)
      {
        uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
        id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 conn]);
        pid_t v43 = xpc_connection_get_pid((xpc_connection_t)v2);
      }

      else
      {
        pid_t v43 = -1;
      }

      *(_DWORD *)buf = 136315650;
      p___int128 buffer = &buffer;
      __int16 v60 = 1024;
      pid_t v61 = v43;
      __int16 v62 = 1024;
      LODWORD(v63) = 144;
      v38 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      if (v42)
      {
      }

      v33 = (os_log_s *)&_os_log_default;
    }

    CFErrorRef v39 = sub_10000A444( "-[UpgradeSequencer lockInterfaceForClient:withCompletion:]_block_invoke",  "upgrade_sequencer.m",  534,  "com.apple.security.cryptex.posix",  144LL,  0LL,  v38);
  }

  CFErrorRef v24 = v39;
  free(v38);
LABEL_39:
  __int128 buffer = *(_OWORD *)"unknown";
  __int128 v65 = *(_OWORD *)&qword_100044668;
  pid_t v44 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  proc_name(v44, &buffer, 0x20u);
  int v45 = *__error();
  signed int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logHandle]);
  v47 = v46;
  if (v24)
  {
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v48 = *(_xpc_connection_s **)(a1 + 40);
      if (v48) {
        pid_t v49 = xpc_connection_get_pid(v48);
      }
      else {
        pid_t v49 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p___int128 buffer = &buffer;
      __int16 v60 = 1024;
      pid_t v61 = v49;
      __int16 v62 = 2112;
      CFErrorRef v63 = v24;
      v52 = "XPC client <process=%s pid=%d>: lock upgrade interface: %@";
      v53 = v47;
      os_log_type_t v54 = OS_LOG_TYPE_ERROR;
      uint32_t v55 = 28;
LABEL_50:
      _os_log_impl((void *)&_mh_execute_header, v53, v54, v52, buf, v55);
    }
  }

  else if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    v50 = *(_xpc_connection_s **)(a1 + 40);
    if (v50) {
      pid_t v51 = xpc_connection_get_pid(v50);
    }
    else {
      pid_t v51 = -1;
    }
    *(_DWORD *)buf = 136315394;
    p___int128 buffer = &buffer;
    __int16 v60 = 1024;
    pid_t v61 = v51;
    v52 = "XPC client <process=%s pid=%d>: lock upgrade interface [no error]";
    v53 = v47;
    os_log_type_t v54 = OS_LOG_TYPE_DEBUG;
    uint32_t v55 = 18;
    goto LABEL_50;
  }

  *__error() = v45;
  (*(void (**)(void, CFErrorRef))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v24);
}

void sub_10000490C(_Unwind_Exception *a1)
{
}

id sub_10000494C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterfaceLockCancel];
}

id sub_100004954(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartInterfaceLockTimeout];
}

void sub_100004A08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004A20(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);

  if (v2)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lockingClient]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sub_10003A06C( [v3 cred],  *(_DWORD **)(a1 + 48));
  }
}

void sub_100004B30(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _abort]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100004EE8(_Unwind_Exception *a1)
{
}

void sub_100005860(_Unwind_Exception *a1)
{
}

void sub_10000596C(_Unwind_Exception *a1)
{
}

void sub_100005D28(_Unwind_Exception *a1)
{
}

void sub_100005E6C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a3;
  [v4 setError:v3];
  [v4 completeUpgrade];
}

void sub_100005F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UpgradeSequencer getSharedInstance](&OBJC_CLASS___UpgradeSequencer, "getSharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000602C;
  v8[3] = &unk_1000552F0;
  v8[4] = a3;
  v8[5] = a2;
  [v6 onUpgradeCompleteForCryptex:v7 withCompletion:v8];
}

uint64_t sub_10000602C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

void sub_100006034()
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[UpgradeSequencer getSharedInstance](&OBJC_CLASS___UpgradeSequencer, "getSharedInstance"));
  v0 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([v1 lockAcquireQueue]);
  dispatch_resume(v0);
}

uint64_t sub_100006080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, a2, a3, 80LL, a5, v5, 16LL);
}

BOOL sub_100006090()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_10000609C(unint64_t a1)
{
  if (a1 > 0xA || a1 - 1 > 9) {
    return 0LL;
  }
  else {
    return (uint64_t)*(&off_100055310 + a1 - 1);
  }
}

unint64_t sub_1000060C8(uint64_t a1, const char *a2, char a3)
{
  uint64_t v6 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v7 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a1, 4LL);
  id v26 = 0LL;
  uint64_t v8 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a2, 4LL);
  os_log_type_t v9 = -[NSURL URLByDeletingLastPathComponent]( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8),  "URLByDeletingLastPathComponent");
  if ((a3 & 2) != 0)
  {
    uint32_t v10 = v9;
    NSFileAttributeKey v31 = NSFilePosixPermissions;
    v32 = &off_100057B58;
    if (!-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v6,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v9,  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL),  &v26))
    {
      unint64_t v14 = (unint64_t)[v26 code];
      int v15 = *__error();
      if (qword_10005A3E0 != -1) {
        dispatch_once(&qword_10005A3E0, &stru_100055360);
      }
      uint64_t v21 = qword_10005A3E8;
      if (!os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      CFErrorRef v22 = -[NSString UTF8String](-[NSURL path](v10, "path"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      pid_t v28 = v22;
      __int16 v29 = 1024;
      int v30 = v14;
      uint64_t v17 = "failed to create dir at %s: %{darwin.errno}d";
      v23 = (os_log_s *)v21;
      uint32_t v24 = 18;
      goto LABEL_33;
    }
  }

  if ((a3 & 4) != 0)
  {
    if ((faccessat(-2, a2, 4, 32) & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v11 = *__error();
    if (v11 != 2)
    {
      if (v11)
      {
        unint64_t v14 = *__error();
        int v15 = *__error();
        if (qword_10005A3E0 != -1) {
          dispatch_once(&qword_10005A3E0, &stru_100055360);
        }
        uint64_t v16 = qword_10005A3E8;
        if (!os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v2_Block_object_dispose(va, 8) = v14;
        uint64_t v17 = "failed to access symlink: %{darwin.errno}d";
LABEL_32:
        v23 = (os_log_s *)v16;
        uint32_t v24 = 8;
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v17, buf, v24);
LABEL_34:
        *__error() = v15;
        return v14;
      }

      int v12 = *__error();
      if (qword_10005A3E0 != -1) {
        dispatch_once(&qword_10005A3E0, &stru_100055360);
      }
      uint64_t v13 = (os_log_s *)qword_10005A3E8;
      if (os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "symlink exists, removing", buf, 2u);
      }

      *__error() = v12;
      if (unlink(a2))
      {
        unint64_t v14 = *__error();
        int v15 = *__error();
        if (qword_10005A3E0 != -1) {
          dispatch_once(&qword_10005A3E0, &stru_100055360);
        }
        uint64_t v16 = qword_10005A3E8;
        if (!os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v2_Block_object_dispose(va, 8) = v14;
        uint64_t v17 = "failed to unlink symlink: %{darwin.errno}d";
        goto LABEL_32;
      }
    }
  }

  if (!-[NSFileManager createSymbolicLinkAtPath:withDestinationPath:error:]( v6,  "createSymbolicLinkAtPath:withDestinationPath:error:",  v8,  v7,  &v26))
  {
    id v18 = [v26 code];
    int v15 = *__error();
    if (qword_10005A3E0 != -1) {
      dispatch_once(&qword_10005A3E0, &stru_100055360);
    }
    CFErrorRef v19 = (os_log_s *)qword_10005A3E8;
    if (os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = -[NSString UTF8String](v7, "UTF8String");
      *(_DWORD *)buf = 136315394;
      pid_t v28 = v20;
      __int16 v29 = 1024;
      int v30 = (int)v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "failed to create symlink to %s: %{darwin.errno}d",  buf,  0x12u);
    }

    unint64_t v14 = (unint64_t)v18;
    goto LABEL_34;
  }

  return 0LL;
}

unint64_t sub_1000064FC(uint64_t a1, uint64_t a2, const char *a3, char a4)
{
  uint64_t v8 = realpath_np(a2, v16);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    int v10 = *__error();
    if (qword_10005A3E0 != -1) {
      dispatch_once(&qword_10005A3E0, &stru_100055360);
    }
    int v11 = (os_log_s *)qword_10005A3E8;
    if (os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "realpath_np: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v10;
  }

  else
  {
    snprintf(__str, 0x400uLL, "%s/%s", v16, a3);
    return sub_1000060C8(a1, __str, a4);
  }

  return v9;
}

void sub_100006650(id a1)
{
  qword_10005A3E8 = (uint64_t)os_log_create("com.apple.libcryptex", "fs");
}

uint64_t sub_10000667C(void *a1)
{
  if (&_wd_optin_service_register_sync
    && wd_optin_service_launchd_job_label
    && wd_optin_service_process_name
    && wd_optin_service_bundle_id
    && wd_optin_service_bootstrap_service_name
    && wd_optin_service_late_first_checkin
    && wd_optin_service_panic_on_first_timeout
    && wd_optin_service_capture_ddt_on_timeout)
  {
    if (!a1) {
      return 1LL;
    }
    CFErrorRef v2 = 0LL;
    goto LABEL_20;
  }

  id v3 = sub_100006884();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    id v5 = sub_100006884();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl(v7, 0LL, 0LL, 0LL, &_mh_execute_header, v6, 16LL);
  }

  else
  {
    uint64_t v8 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
  }

  CFErrorRef v2 = sub_10000A444("watchdog_available", "watchdog.m", 173, "com.apple.security.cryptex", 10LL, 0LL, v8);
  free(v8);
  if (a1)
  {
    if (v2)
    {
      CFTypeRef v9 = CFRetain(v2);
LABEL_21:
      *a1 = v9;
      goto LABEL_22;
    }

LABEL_20:
    CFTypeRef v9 = 0LL;
    goto LABEL_21;
  }

    goto LABEL_31;
  }

  int64 = xpc_dictionary_get_int64(v6, "COMMAND");
  if (int64 == 3)
  {
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = 138412290;
      int v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: ADD", (uint8_t *)&v29, 0xCu);
    }

    -[CryptexSession sessionAddParseXPC:](self, "sessionAddParseXPC:", v6);
  }

  else
  {
    uint64_t v21 = int64;
    if (int64 == 2)
    {
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = 138412290;
        int v30 = self;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: STOP", (uint8_t *)&v29, 0xCu);
      }

      -[CryptexSession sessionStopWithReason:exitCode:](self, "sessionStopWithReason:exitCode:", 4LL, 0LL);
    }

    else if (int64 == 1)
    {
      CFErrorRef v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = 138412290;
        int v30 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: START", (uint8_t *)&v29, 0xCu);
      }

      -[CryptexSession sessionStart](self, "sessionStart");
    }

    else
    {
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_10003E8E8(v21, v27);
      }
    }
  }

  pid_t v28 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession session_work_group](self, "session_work_group"));
  dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

  -[CryptexSession sessionMessageReply:](self, "sessionMessageReply:", v6);
LABEL_31:
}

LABEL_22:
  if (v2)
  {
    CFRelease(v2);
    return 0LL;
  }

  return 1LL;
}

    cryptex_core_attach_signature(v8, a2);
    dispatch_async_f(*(dispatch_queue_t *)(v7 + 96), a4, (dispatch_function_t)sub_10001B59C);
    return;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "protex personalization: %@", buf, 0xCu);
  }

  *__error() = v9;
  a4[2] = (uint64_t)CFRetain(a3);
  cryptex_target_async_f(v7, a4, sub_100015E3C);
}

void sub_10000685C(_Unwind_Exception *a1)
{
}

id sub_100006884()
{
  if (qword_10005A3F8 != -1) {
    dispatch_once(&qword_10005A3F8, &stru_1000553A8);
  }
  return (id)qword_10005A3F0;
}

id sub_1000068C4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v57 = 0LL;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  os_log_type_t v54 = sub_100006F74;
  uint32_t v55 = sub_100006F84;
  id v56 = 0LL;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if ((sub_10000667C(&v57) & 1) == 0)
  {
    id v8 = 0LL;
    CFTypeRef v9 = (void *)v52[5];
    v52[5] = v57;
LABEL_45:

    goto LABEL_46;
  }

  id v5 = v3;
  uint64_t v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary) {
    id v7 = v6;
  }
  else {
    id v7 = 0LL;
  }

  if (v7)
  {
    xpc_object_t value = xpc_dictionary_get_value(v6, "Watchdog");
    int v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    int v12 = v11;
    if (!v11
      || ((id v13 = v11, xpc_get_type(v13) == (xpc_type_t)&_xpc_type_array)
        ? (id v14 = v13)
        : (id v14 = 0LL),
          v13,
          v14,
          v14))
    {
      id v21 = v12;

      CFErrorRef v22 = 0LL;
      goto LABEL_29;
    }

    id v23 = sub_100006884();
    uint32_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (v24)
    {
      id v25 = sub_100006884();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        uint64_t v27 = 3LL;
      }
      else {
        uint64_t v27 = 2LL;
      }
      *(_WORD *)buf = 0;
      pid_t v28 = (char *)_os_log_send_and_compose_impl(v27, 0LL, 0LL, 0LL, &_mh_execute_header, v26, 16LL);
    }

    else
    {
      *(_WORD *)buf = 0;
      pid_t v28 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v22 = sub_10000A444( "_watchdog_copy_watchdog_array",  "watchdog.m",  152,  "com.apple.security.cryptex",  11LL,  0LL,  v28);
    free(v28);
  }

  else
  {
    id v15 = sub_100006884();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
    {
      id v17 = sub_100006884();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        uint64_t v19 = 3LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
      *(_WORD *)buf = 0;
      uint64_t v20 = (char *)_os_log_send_and_compose_impl(v19, 0LL, 0LL, 0LL, &_mh_execute_header, v18, 16LL);
    }

    else
    {
      *(_WORD *)buf = 0;
      uint64_t v20 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v22 = sub_10000A444( "_watchdog_copy_watchdog_array",  "watchdog.m",  147,  "com.apple.security.cryptex",  11LL,  0LL,  v20);
    free(v20);
  }

  id v21 = 0LL;
LABEL_29:

  id v8 = v21;
  __int16 v29 = (void *)v52[5];
  v52[5] = (uint64_t)v22;

  if (v52[5])
  {
    id v30 = sub_100006884();
    NSFileAttributeKey v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

    if (v31)
    {
      id v32 = sub_100006884();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        uint64_t v34 = 3LL;
      }
      else {
        uint64_t v34 = 2LL;
      }
      *(_WORD *)buf = 0;
      uint64_t v35 = (char *)_os_log_send_and_compose_impl(v34, 0LL, 0LL, 0LL, &_mh_execute_header, v33, 16LL);
    }

    else
    {
      *(_WORD *)buf = 0;
      uint64_t v35 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v42 = sub_10000A444( "watchdog_create_service_descriptions",  "watchdog.m",  200,  "com.apple.security.cryptex",  11LL,  (const void *)v52[5],  v35);
LABEL_44:
    CFErrorRef v43 = v42;
    free(v35);
    CFTypeRef v9 = (void *)v52[5];
    v52[5] = (uint64_t)v43;
    goto LABEL_45;
  }

  if (!v8)
  {
    v52[5] = 0LL;
    id v47 = sub_100006884();
    CFTypeRef v9 = (void *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_INFO,  "No jobs to register with watchdog.",  buf,  2u);
      id v8 = 0LL;
    }

    goto LABEL_45;
  }

  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_100006F8C;
  applier[3] = &unk_100055388;
  v50 = &v51;
  pid_t v49 = v4;
  BOOL v36 = xpc_array_apply(v8, applier);

  if (!v36)
  {
    id v37 = sub_100006884();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

    if (v38)
    {
      id v39 = sub_100006884();
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        uint64_t v41 = 3LL;
      }
      else {
        uint64_t v41 = 2LL;
      }
      *(_WORD *)buf = 0;
      uint64_t v35 = (char *)_os_log_send_and_compose_impl(v41, 0LL, 0LL, 0LL, &_mh_execute_header, v40, 16LL);
    }

    else
    {
      *(_WORD *)buf = 0;
      uint64_t v35 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v42 = sub_10000A444( "watchdog_create_service_descriptions",  "watchdog.m",  227,  "com.apple.security.cryptex",  11LL,  (const void *)v52[5],  v35);
    goto LABEL_44;
  }

LABEL_46:
  pid_t v44 = v52;
  if (a2 && !v52[5])
  {
    *a2 = -[NSMutableArray copy](v4, "copy");
    pid_t v44 = v52;
  }

  id v45 = (id)v44[5];

  _Block_object_dispose(&v51, 8);
  return v45;
}

    id v37 = *(void **)(v4 + 72);
    if (v37)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        v38 = 3LL;
      }
      else {
        v38 = 2LL;
      }
      id v39 = *(const char **)(v4 + 56);
      if (!v39) {
        id v39 = "[anonymous]";
      }
      buf = 136446466;
      v88 = v39;
      v89 = 1024;
      LODWORD(v90) = v9;
      id v40 = v37;
    }

    else
    {
      uint64_t v41 = *(const char **)(v4 + 56);
      if (!v41) {
        uint64_t v41 = "[anonymous]";
      }
      buf = 136446466;
      v88 = v41;
      v89 = 1024;
      LODWORD(v90) = v9;
      id v40 = &_os_log_default;
      v38 = 2LL;
    }

    CFErrorRef v42 = (char *)_os_log_send_and_compose_impl(v38, 0LL, 0LL, 0LL, &_mh_execute_header, v40, 16LL);
    id v18 = sub_10000A444("_quire_bootstrap_diags", "quire.c", 2037, "com.apple.security.cryptex.posix", v9, 0LL, v42);
    free(v42);
LABEL_57:
    if (v17 == -1) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }

  snprintf(to, 0x400uLL, "%s/%s", v83, *(const char **)(a2 + 72));
  if (symlink(to, "/AppleInternal/Diags") && *__error() != 17)
  {
    CFTypeRef v9 = *__error();
    v74 = *(const char **)(v4 + 56);
    int v11 = *__error();
    v72 = *(os_log_s **)(v4 + 72);
    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v75 = "[anonymous]";
    if (v74) {
      v75 = v74;
    }
    buf = 136446466;
    v88 = v75;
    v89 = 1024;
    LODWORD(v90) = v9;
    v68 = "%{public}s: failed to create symlink for diags: %{darwin.errno}d";
    goto LABEL_114;
  }

  uint64_t v57 = *(const char **)(v4 + 56);
  v58 = *__error();
  v59 = *(os_log_s **)(v4 + 72);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    __int16 v60 = "[anonymous]";
    if (v57) {
      __int16 v60 = v57;
    }
    buf = 136446210;
    v88 = v60;
    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEBUG,  "%{public}s: bootstrap diags successfully",  (uint8_t *)&buf,  0xCu);
  }

  id v18 = 0LL;
  *__error() = v58;
LABEL_58:
  if (close(v17) == -1) {
    sub_100040A90(&v79, &buf);
  }
LABEL_59:
  free(__big);
  return v18;
}

  if (value) {
    CFRelease(value);
  }
  return v16;
}

void sub_100006F38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

uint64_t sub_100006F74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006F84(uint64_t a1)
{
}

uint64_t sub_100006F8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v78 = 0LL;
  v79 = 0LL;
  v76 = 0LL;
  v77 = 0LL;
  v75 = 0LL;
  __int16 v74 = 0;
  BOOL v73 = 0;
  if ((sub_10000667C(&v79) & 1) == 0)
  {
    id v9 = 0LL;
    CFErrorRef v10 = v79;
    goto LABEL_61;
  }

  id v6 = v5;
  id v7 = v6;
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  if (!v8)
  {
    id v18 = sub_100006884();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19)
    {
      id v20 = sub_100006884();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        uint64_t v22 = 3LL;
      }
      else {
        uint64_t v22 = 2LL;
      }
      *(_WORD *)buf = 0;
      id v17 = (char *)_os_log_send_and_compose_impl(v22, 0LL, 0LL, 0LL, &_mh_execute_header, v21, 16LL);
    }

    else
    {
      *(_WORD *)buf = 0;
      id v17 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v29 = sub_10000A444( "_watchdog_create_service_description",  "watchdog.m",  51,  "com.apple.security.cryptex",  11LL,  0LL,  v17);
    goto LABEL_60;
  }

  int v11 = sub_10003CE10(v7, "Label", &v78);
  if (v11)
  {
    id v12 = sub_100006884();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13)
    {
      id v14 = sub_100006884();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        uint64_t v16 = 3LL;
      }
      else {
        uint64_t v16 = 2LL;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "Label";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      id v17 = (char *)_os_log_send_and_compose_impl(v16, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
    }

    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "Label";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      id v17 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v29 = sub_10000A444( "_watchdog_create_service_description",  "watchdog.m",  57,  "com.apple.security.cryptex.posix",  v11,  0LL,  v17);
LABEL_60:
    CFErrorRef v10 = v29;
    free(v17);
    id v9 = 0LL;
    goto LABEL_61;
  }

  int v23 = sub_10003CE10(v7, "ProcessName", &v77);
  if (v23)
  {
    id v24 = sub_100006884();
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    if (v25)
    {
      id v26 = sub_100006884();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        uint64_t v28 = 3LL;
      }
      else {
        uint64_t v28 = 2LL;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "ProcessName";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      id v17 = (char *)_os_log_send_and_compose_impl(v28, 0LL, 0LL, 0LL, &_mh_execute_header, v27, 16LL);
    }

    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "ProcessName";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      id v17 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v29 = sub_10000A444( "_watchdog_create_service_description",  "watchdog.m",  63,  "com.apple.security.cryptex.posix",  v23,  0LL,  v17);
    goto LABEL_60;
  }

  int v30 = sub_10003CE10(v7, "CFBundleIdentifier", &v76);
  if (v30)
  {
    id v31 = sub_100006884();
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

    if (v32)
    {
      id v33 = sub_100006884();
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        uint64_t v35 = 3LL;
      }
      else {
        uint64_t v35 = 2LL;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "CFBundleIdentifier";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v30;
      id v17 = (char *)_os_log_send_and_compose_impl(v35, 0LL, 0LL, 0LL, &_mh_execute_header, v34, 16LL);
    }

    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "CFBundleIdentifier";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v30;
      id v17 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v29 = sub_10000A444( "_watchdog_create_service_description",  "watchdog.m",  69,  "com.apple.security.cryptex.posix",  v30,  0LL,  v17);
    goto LABEL_60;
  }

  int v36 = sub_10003CE10(v7, "WatchdogMachService", &v75);
  if (v36)
  {
    id v37 = sub_100006884();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

    if (v38)
    {
      id v39 = sub_100006884();
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        uint64_t v41 = 3LL;
      }
      else {
        uint64_t v41 = 2LL;
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "WatchdogMachService";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v36;
      id v17 = (char *)_os_log_send_and_compose_impl(v41, 0LL, 0LL, 0LL, &_mh_execute_header, v40, 16LL);
    }

    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "WatchdogMachService";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v36;
      id v17 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v29 = sub_10000A444( "_watchdog_create_service_description",  "watchdog.m",  75,  "com.apple.security.cryptex.posix",  v36,  0LL,  v17);
    goto LABEL_60;
  }

  if (sub_10003CE70(v7, "LateFirstCheckin", (BOOL *)&v74 + 1))
  {
    HIBYTE(v74) = 0;
    int v42 = *__error();
    id v43 = sub_100006884();
    pid_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "LateFirstCheckin";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIBYTE(v74);
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v42;
  }

  if (sub_10003CE70(v7, "PanicOnFirstTimeout", &v73))
  {
    BOOL v73 = 0;
    int v45 = *__error();
    id v46 = sub_100006884();
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "PanicOnFirstTimeout";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v73;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v45;
  }

  if (sub_10003CE70(v7, "CaptureDdtOnTimeout", (BOOL *)&v74))
  {
    LOBYTE(v74) = 0;
    int v48 = *__error();
    id v49 = sub_100006884();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "CaptureDdtOnTimeout";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v74;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v48;
  }

  v80[0] = wd_optin_service_launchd_job_label;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v78));
  *(void *)buf = v72;
  v80[1] = wd_optin_service_process_name;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v77));
  *(void *)&buf[8] = v71;
  v80[2] = wd_optin_service_bundle_id;
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v76));
  *(void *)&uint8_t buf[16] = v51;
  v80[3] = wd_optin_service_bootstrap_service_name;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v75));
  v82 = v52;
  v80[4] = wd_optin_service_late_first_checkin;
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", HIBYTE(v74)));
  v83 = v53;
  v80[5] = wd_optin_service_panic_on_first_timeout;
  os_log_type_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v73));
  v84 = v54;
  v80[6] = wd_optin_service_capture_ddt_on_timeout;
  uint32_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v74));
  v85 = v55;
  id v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v80,  7LL));
  id v9 = [v56 copy];

  CFErrorRef v10 = 0LL;
LABEL_61:

  id v57 = v9;
  v58 = v57;
  if (v10) {
    BOOL v59 = 1;
  }
  else {
    BOOL v59 = v57 == 0LL;
  }
  uint64_t v60 = !v59;
  if (v59)
  {
    id v61 = sub_100006884();
    __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(v61);

    if (v62)
    {
      id v63 = sub_100006884();
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        uint64_t v65 = 3LL;
      }
      else {
        uint64_t v65 = 2LL;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a2;
      v66 = (char *)_os_log_send_and_compose_impl(v65, 0LL, 0LL, 0LL, &_mh_execute_header, v64, 16LL);
    }

    else
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a2;
      v66 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v67 = sub_10000A444( "watchdog_create_service_descriptions_block_invoke",  "watchdog.m",  216,  "com.apple.security.cryptex",  11LL,  v10,  v66);
    free(v66);
    uint64_t v68 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v69 = *(void **)(v68 + 40);
    *(void *)(v68 + 40) = v67;
  }

  else
  {
    [*(id *)(a1 + 32) addObject:v57];
  }

  return v60;
}

void sub_100007B48(_Unwind_Exception *a1)
{
}

id sub_100007B80(void *a1)
{
  CFErrorRef v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int v3 = sub_10000667C(0LL);
  if (a1 && v3)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v4 = a1;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v8),  "objectForKeyedSubscript:",  wd_optin_service_launchd_job_label,  (void)v12));
          -[NSMutableArray addObject:](v2, "addObject:", v9);

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }
  }

  id v10 = -[NSMutableArray copy](v2, "copy", (void)v12);

  return v10;
}

CFErrorRef sub_100007CC8(void *a1)
{
  CFErrorRef v29 = 0LL;
  id v1 = a1;
  if (!sub_10000667C(&v29))
  {
    CFErrorRef v19 = v29;
    goto LABEL_37;
  }

  if (![v1 count])
  {
LABEL_28:
    CFErrorRef v19 = 0LL;
    goto LABEL_37;
  }

  CFErrorRef v2 = 0LL;
  while (1)
  {
    int v3 = (char *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", v2, v27, v28));
    int v30 = 0LL;
    if ((sub_10000667C(&v30) & 1) != 0)
    {
      if ((wd_optin_service_register_sync(v3) & 1) != 0)
      {
        id v4 = sub_100006884();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Registered job with watchdog: %{public}@",  buf,  0xCu);
        }

        goto LABEL_27;
      }

      CFIndex v7 = *__error();
      id v8 = sub_100006884();
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      if (v7 == 45)
      {
        if (v9)
        {
          id v10 = sub_100006884();
          int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          uint64_t v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
          *(_WORD *)buf = 0;
          LODWORD(v2_Block_object_dispose(va, 8) = 2;
          uint64_t v27 = buf;
          __int128 v13 = (char *)_os_log_send_and_compose_impl(v12, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
        }

        else
        {
          *(_WORD *)buf = 0;
          LODWORD(v2_Block_object_dispose(va, 8) = 2;
          uint64_t v27 = buf;
          __int128 v13 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
        }

        CFErrorRef v18 = sub_10000A444( "_watchdog_bootstrap_service",  "watchdog.m",  129,  "com.apple.security.cryptex",  10LL,  0LL,  v13);
      }

      else
      {
        if (v9)
        {
          id v14 = sub_100006884();
          __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 138543618;
          uint64_t v17 = v16 ? 3LL : 2LL;
          id v32 = v3;
          __int16 v33 = 1024;
          int v34 = v7;
          LODWORD(v2_Block_object_dispose(va, 8) = 18;
          uint64_t v27 = buf;
          __int128 v13 = (char *)_os_log_send_and_compose_impl(v17, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
        }

        else
        {
          *(_DWORD *)buf = 138543618;
          id v32 = v3;
          __int16 v33 = 1024;
          int v34 = v7;
          LODWORD(v2_Block_object_dispose(va, 8) = 18;
          uint64_t v27 = buf;
          __int128 v13 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
        }

        CFErrorRef v18 = sub_10000A444( "_watchdog_bootstrap_service",  "watchdog.m",  131,  "com.apple.security.cryptex.posix",  v7,  0LL,  v13);
      }

      CFErrorRef v6 = v18;
      free(v13);
    }

    else
    {
      CFErrorRef v6 = v30;
    }

    if (v6) {
      break;
    }
LABEL_27:

    if (++v2 >= [v1 count]) {
      goto LABEL_28;
    }
  }

  id v20 = sub_100006884();
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (v21)
  {
    id v22 = sub_100006884();
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      uint64_t v24 = 3LL;
    }
    else {
      uint64_t v24 = 2LL;
    }
    *(_DWORD *)buf = 134217984;
    id v32 = v2;
    id v25 = (char *)_os_log_send_and_compose_impl(v24, 0LL, 0LL, 0LL, &_mh_execute_header, v23, 16LL);
  }

  else
  {
    *(_DWORD *)buf = 134217984;
    id v32 = v2;
    id v25 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
  }

  CFErrorRef v19 = sub_10000A444( "watchdog_bootstrap_service_descriptions",  "watchdog.m",  275,  "com.apple.security.cryptex",  33LL,  v6,  v25);
  free(v25);

LABEL_37:
  return v19;
}

void sub_10000815C(_Unwind_Exception *a1)
{
}

void sub_100008188(id a1)
{
  os_log_t v1 = os_log_create("com.apple.libcryptex", "watchdog");
  CFErrorRef v2 = (void *)qword_10005A3F0;
  qword_10005A3F0 = (uint64_t)v1;
}

void sub_1000081B8(uint64_t a1)
{
  uint64_t v4 = a1;
  dispatch_release(*(dispatch_object_t *)(a1 + 80));
  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 104));
  free(*(void **)(a1 + 112));
  close_drop_np(a1 + 88, &v4);
  close_drop_np(a1 + 92, &v4);
  CFErrorRef v2 = *(void **)(a1 + 272);
  if (v2) {
    os_release(v2);
  }
  int v3 = *(void **)(a1 + 280);
  if (v3) {
    os_release(v3);
  }
  os_release(*(void **)(a1 + 304));
  sub_10003A9CC(a1 + 16);
}

int *sub_100008240()
{
  v0 = sub_100008B14();
  bzero(buf, 0x400uLL);
  bufsize[0] = 1024;
  int v1 = *_NSGetArgc();
  CFErrorRef v2 = *_NSGetArgv();
  v62[0] = 0;
  if (_NSGetExecutablePath(buf, bufsize)) {
    sub_10003DF08(&v64, v69);
  }
  v0[6] = getprogname();
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      int v3 = strdup(buf);
      if (v3) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    int v3 = strdup(buf);
    if (!v3) {
      sub_10003DB70(buf);
    }
  }

  v0[12] = v3;
  v0[36] = *_NSGetEnviron();
  for (int i = getopt_long(v1, v2, "r", (const option *)&off_1000553C8, v62);
        i != -1;
        int i = getopt_long(v1, v2, "r", (const option *)&off_1000553C8, v62))
  {
    if (optind <= 0) {
      sub_10003DE78(&v64, v69);
    }
    switch(i)
    {
      case ':':
        uint64_t v9 = v62[0];
        id v10 = (const char *)v0[2];
        int v11 = *__error();
        uint64_t v12 = (os_log_s *)v0[4];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          __int128 v13 = (&off_1000553C8)[4 * v9];
          *(_DWORD *)v69 = 136446466;
          id v14 = "[anonymous]";
          if (v10) {
            id v14 = v10;
          }
          *(void *)&v69[4] = v14;
          *(_WORD *)&v69[12] = 2080;
          *(void *)&v69[14] = v13;
          __int128 v15 = v12;
          BOOL v16 = "%{public}s: missing argument for option: %s";
          goto LABEL_24;
        }

        break;
      case '?':
        uint64_t v17 = v2[optind - 1];
        CFErrorRef v18 = (const char *)v0[2];
        int v11 = *__error();
        CFErrorRef v19 = (os_log_s *)v0[4];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v69 = 136446466;
          id v20 = "[anonymous]";
          if (v18) {
            id v20 = v18;
          }
          *(void *)&v69[4] = v20;
          *(_WORD *)&v69[12] = 2080;
          *(void *)&v69[14] = v17;
          __int128 v15 = v19;
          BOOL v16 = "%{public}s: unknown option: %s";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, v69, 0x16u);
        }

        break;
      case 'r':
        id v5 = (const char *)v0[2];
        int v6 = *__error();
        CFIndex v7 = (os_log_s *)v0[4];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          id v8 = "[anonymous]";
          if (v5) {
            id v8 = v5;
          }
          *(_DWORD *)v69 = 136446210;
          *(void *)&v69[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: other side of exec", v69, 0xCu);
        }

        *__error() = v6;
        v0[5] |= 2uLL;
        continue;
      default:
        sub_10003DEF0();
    }

    *__error() = v11;
  }

  bzero(buf, 0x400uLL);
  int v21 = open("/var/db/", 1048832);
  if (v21 < 0) {
    sub_10003DDF0(&v64, v69);
  }
  int v22 = v21;
  int v23 = open("/var/run/", 1048832);
  if (v23 < 0) {
    sub_10003DD68(&v64, v69);
  }
  int v24 = v23;
  *((_DWORD *)v0 + 22) = sub_100008EA4((uint64_t)v0, v22, (uint64_t)buf);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      id v25 = strdup(buf);
      if (v25) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    id v25 = strdup(buf);
    if (!v25) {
      sub_10003DB70(buf);
    }
  }

  v0[13] = v25;
  *((_DWORD *)v0 + 23) = sub_100008EA4((uint64_t)v0, v24, (uint64_t)buf);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      id v26 = strdup(buf);
      if (v26) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    id v26 = strdup(buf);
    if (!v26) {
      sub_10003DB70(buf);
    }
  }

  v0[14] = v26;
  if (v24 != -1 && close(v24) == -1) {
    sub_10003DCEC(v69, buf);
  }
  if (v22 != -1 && close(v22) == -1) {
    sub_10003DCEC(v69, buf);
  }
  uint64_t v27 = img4_chip_select_personalized_ap();
  *(void *)__int16 v62 = 0LL;
  *(void *)bufsize = 0LL;
  uint64_t v28 = (const char *)v0[2];
  int v29 = *__error();
  int v30 = (os_log_s *)v0[4];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    id v31 = "[anonymous]";
    if (v28) {
      id v31 = v28;
    }
    *(_DWORD *)buf = 136446466;
    v66 = v31;
    __int16 v67 = 2048;
    uint64_t v68 = *(const char **)v62;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "%{public}s: copied %lu mounts",  (uint8_t *)buf,  0x16u);
  }

  *__error() = v29;
  if (*(void *)v62)
  {
    unint64_t v32 = 0LL;
    do
    {
      __int16 v33 = *(char **)bufsize;
      int v34 = (const char *)(*(void *)bufsize + 3582 * v32);
      memset(v69, 0, 32);
      uint64_t v35 = (const char *)v0[2];
      int v36 = *__error();
      id v37 = (os_log_s *)v0[4];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v38 = "[anonymous]";
        if (v35) {
          v38 = v35;
        }
        v66 = v38;
        __int16 v67 = 2080;
        uint64_t v68 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "%{public}s: potential forerunner: %s",  (uint8_t *)buf,  0x16u);
      }

      *__error() = v36;
      if (_dispatch_is_multithreaded())
      {
        id v39 = strdup(v34);
        if (!v39)
        {
          do
          {
            __os_temporary_resource_shortage();
            id v40 = strdup(v34);
          }

          while (!v40);
          id v39 = v40;
        }
      }

      else
      {
        id v39 = strdup(v34);
        if (!v39) {
          sub_10003DB70(v34);
        }
      }

      int v41 = cryptex_core_parse_hdiid(v39, v69);
      int v42 = (const char *)v0[2];
      int v43 = *__error();
      pid_t v44 = (os_log_s *)v0[4];
      BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);
      if (v41)
      {
        if (v45)
        {
          *(_DWORD *)buf = 136446466;
          id v46 = "[anonymous]";
          if (v42) {
            id v46 = v42;
          }
          v66 = v46;
          __int16 v67 = 2080;
          uint64_t v68 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "%{public}s: not a forerunner: %s",  (uint8_t *)buf,  0x16u);
        }

        *__error() = v43;
      }

      else
      {
        if (v45)
        {
          *(_DWORD *)buf = 136446466;
          id v47 = "[anonymous]";
          if (v42) {
            id v47 = v42;
          }
          v66 = v47;
          __int16 v67 = 2080;
          uint64_t v68 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "%{public}s: found forerunner: %s",  (uint8_t *)buf,  0x16u);
        }

        *__error() = v43;
        int v48 = (char *)calloc(1uLL, 0xD98uLL);
        if (!v48) {
          sub_10003DAAC(&v64, buf);
        }
        id v49 = v48;
        __strlcpy_chk(v48 + 8, *(void *)&v69[8], 255LL, 255LL);
        v50 = &v33[3582 * v32];
        __strlcpy_chk(v49 + 263, v50 + 510, 1024LL, 1024LL);
        __strlcpy_chk(v49 + 1287, v50 + 1534, 1024LL, 1024LL);
        __strlcpy_chk(v49 + 2311, v50 + 2558, 1024LL, 1024LL);
        __strlcpy_chk(v49 + 3383, *(void *)&v69[24], 97LL, 97LL);
        sub_10003AA08(v49 + 3335, v49 + 3383);
        *(void *)id v49 = v0[37];
        v0[37] = v49;
      }

      free(v39);
      ++v32;
    }

    while (v32 < *(void *)v62);
  }

  free(*(void **)bufsize);
  uint64_t v51 = (const char *)v0[2];
  int v52 = *__error();
  uint64_t v53 = (os_log_s *)v0[4];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v54 = "[anonymous]";
    if (v51) {
      os_log_type_t v54 = v51;
    }
    uint32_t v55 = (const char *)v0[13];
    *(_DWORD *)buf = 136446466;
    v66 = v54;
    __int16 v67 = 2080;
    uint64_t v68 = v55;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "%{public}s: state dir = %s",  (uint8_t *)buf,  0x16u);
  }

  *__error() = v52;
  id v56 = (const char *)v0[2];
  int v57 = *__error();
  v58 = (os_log_s *)v0[4];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    BOOL v59 = "[anonymous]";
    if (v56) {
      BOOL v59 = v56;
    }
    uint64_t v60 = (const char *)v0[14];
    *(_DWORD *)buf = 136446466;
    v66 = v59;
    __int16 v67 = 2080;
    uint64_t v68 = v60;
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEBUG,  "%{public}s: run state dir = %s",  (uint8_t *)buf,  0x16u);
  }

  result = __error();
  int *result = v57;
  qword_10005A400 = (uint64_t)v0;
  return result;
}

void *sub_100008B14()
{
  v0 = (void *)sub_100010F5C(344LL);
  v0[7] = off_10005A3B0;
  v0[8] = "com.apple.security.cryptexd";
  v0[9] = "com.apple.security.cryptexd";
  v0[10] = os_retain(*(void **)(off_10005A3A0 + 8));
  v0[38] = os_log_create("com.apple.libcryptex", "authinstall");
  v0[11] = -1LL;
  v0[41] = os_transaction_create("Bootstrap cryptexd");
  sub_10003A6E4((uint64_t)(v0 + 2), (int)"com.apple.security.cryptexd", "daemon");
  return v0;
}

void *sub_100008BC0()
{
  return os_retain((void *)qword_10005A400);
}

void sub_100008BCC()
{
}

uint64_t sub_100008BDC()
{
  return *(void *)(off_10005A3A0 + 8);
}

uint64_t sub_100008BF0(uint64_t a1)
{
  return *(void *)(a1 + 312);
}

uint64_t sub_100008BF8(uint64_t a1)
{
  if ((*(_BYTE *)off_10005A3A0 & 1) == 0) {
    sub_10003DF9C();
  }
  AMAuthInstallLogSetHandler(sub_100008F88);
  id v2 = sub_10001494C();
  [v2 activate];
  int v3 = *(const char **)(a1 + 16);
  int v4 = *__error();
  id v5 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = "[anonymous]";
    if (v3) {
      int v6 = v3;
    }
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}s: Activated event server",  (uint8_t *)&buf,  0xCu);
  }

  *__error() = v4;
  if (v2) {
    os_release(v2);
  }
  dispatch_source_t v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  *(dispatch_queue_t *)(a1 + 80));
  dispatch_set_context(v7, (void *)a1);
  dispatch_source_set_event_handler_f(v7, (dispatch_function_t)sub_100009040);
  *(void *)(a1 + 280) = v7;
  dispatch_activate(v7);
  mach_port_t sp = 0;
  uintptr_t v8 = sp;
  *(_DWORD *)(a1 + 120) = sp;
  dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  v8,  0LL,  *(dispatch_queue_t *)(a1 + 80));
  dispatch_set_context(v9, (void *)a1);
  dispatch_source_set_event_handler_f(v9, (dispatch_function_t)sub_10000914C);
  dispatch_source_set_cancel_handler_f(v9, (dispatch_function_t)sub_100009228);
  *(void *)(a1 + 272) = v9;
  dispatch_activate(v9);
  id v10 = dispatch_queue_create("DaemonHandler", &_dispatch_queue_attr_concurrent);
  *(void *)(a1 + 312) = v10;
  mach_service = xpc_connection_create_mach_service("com.apple.security.cryptex.xpc", v10, 1uLL);
  *(void *)(a1 + 320) = mach_service;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000LL;
  BOOL v16 = sub_100009248;
  uint64_t v17 = &unk_100055408;
  uint64_t v18 = a1;
  xpc_connection_set_event_handler(mach_service, &buf);
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 320));
  *(void *)(a1 + 336) = xpc_remote_connection_create_remote_service_listener( "com.apple.security.cryptexd.remote",  *(void *)(a1 + 312),  0LL);
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000LL;
  BOOL v16 = sub_100009484;
  uint64_t v17 = &unk_100055448;
  uint64_t v18 = a1;
  xpc_remote_connection_set_event_handler();
  return xpc_remote_connection_activate(*(void *)(a1 + 336));
}

uint64_t sub_100008EA4(uint64_t a1, int a2, uint64_t a3)
{
  int v6 = *__error();
  if (v6) {
    BOOL v7 = v6 == 17;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    sub_10003E0A8(&v11, v12);
  }
  uint64_t v8 = openat(a2, *(const char **)(a1 + 64), 1048832);
  if ((v8 & 0x80000000) != 0) {
    sub_10003E19C(&v11, v12);
  }
  uint64_t v9 = v8;
  return v9;
}

void sub_100008F88(uint64_t a1, uint64_t a2)
{
  int v3 = os_retain((void *)qword_10005A400);
  int v4 = (os_log_s *)v3[38];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  os_release(v3);
}

void sub_100009040(uint64_t a1)
{
  id v2 = sub_100014D14();
  int v3 = *(const char **)(a1 + 16);
  int v4 = *__error();
  int v5 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = "[anonymous]";
    if (v3) {
      uint64_t v6 = v3;
    }
    int v7 = 136446210;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s: received SIGTERM",  (uint8_t *)&v7,  0xCu);
  }

  *__error() = v4;
  sub_100017B88(v2, 0LL, &j__xpc_transaction_exit_clean);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 280));
  dispatch_release(*(dispatch_object_t *)(a1 + 280));
  *(void *)(a1 + 280) = 0LL;
  if (v2) {
    os_release(v2);
  }
}

void sub_10000914C(uint64_t a1)
{
  id v2 = *(const char **)(a1 + 16);
  int v3 = *__error();
  int v4 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = "[anonymous]";
    int v6 = *(_DWORD *)(a1 + 120);
    if (v2) {
      int v5 = v2;
    }
    int v7 = 136446466;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%{public}s: ipc recv: port = %#x",  (uint8_t *)&v7,  0x12u);
  }

  *__error() = v3;
  sub_1000295EC(*(unsigned int *)(a1 + 120));
}

uint64_t sub_100009228(dispatch_source_s *a1)
{
  unsigned int handle = dispatch_source_get_handle(a1);
  return mach_right_recv_destruct(handle, 0LL, 0LL);
}

void sub_100009248(uint64_t a1, _xpc_connection_s *object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32LL);
    *(void *)int v10 = _NSConcreteStackBlock;
    *(void *)&v10[8] = 0x40000000LL;
    *(void *)&v10[16] = sub_1000093A0;
    uint64_t v11 = &unk_100055428;
    uint64_t v12 = v9;
    xpc_connection_set_event_handler(object, v10);
    xpc_connection_activate(object);
  }

  else
  {
    int v4 = xpc_copy_description(object);
    int v5 = *(const char **)(*(void *)(a1 + 32) + 16LL);
    int v6 = *__error();
    int v7 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = "[anonymous]";
      if (v5) {
        uint64_t v8 = v5;
      }
      *(_DWORD *)int v10 = 136446466;
      *(void *)&v10[4] = v8;
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s: Received unexpected object: %s",  v10,  0x16u);
    }

    *__error() = v6;
    free(v4);
  }

void sub_1000093A0(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    int v5 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003E218(object, v5);
    }
  }

  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v4 = sub_10002A210(object);
    switch(v4)
    {
      case 9LL:
        sub_100026950(object);
        break;
      case 6LL:
        sub_1000378E4(object);
        break;
      case 2LL:
        sub_100010D98(object);
        break;
      default:
        int v6 = *(os_log_s **)(a1 + 32);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10003E2AC(v6);
        }
        break;
    }
  }

void sub_100009484(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_remote_connection)
  {
    sub_10001EF64(object);
  }

  else
  {
    uint64_t v4 = xpc_copy_description(object);
    int v5 = *(const char **)(*(void *)(a1 + 32) + 16LL);
    int v6 = *__error();
    int v7 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = "[anonymous]";
      if (v5) {
        uint64_t v8 = v5;
      }
      int v9 = 136446466;
      int v10 = v8;
      __int16 v11 = 2080;
      uint64_t v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s: Received unexpected object: %s",  (uint8_t *)&v9,  0x16u);
    }

    *__error() = v6;
    free(v4);
  }

uint64_t sub_1000095BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(v8, v6, v5, 80LL, a5, v7, 16LL);
}

uint64_t sub_1000095D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, a2, v5, 80LL, a5, v6, 16LL);
}

double sub_1000095EC(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

  ;
}

BOOL sub_100009634()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

BOOL sub_100009640(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

uint64_t sub_100009648(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

  ;
}

uint64_t sub_100009670(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

  ;
}

uint64_t sub_100009698(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

double sub_1000096A4()
{
  void *v0 = 0LL;
  double result = 0.0;
  *int v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  return result;
}

size_t sub_1000096C0(const char *__s)
{
  return strlen(__s);
}

char *sub_1000096CC(int *a1)
{
  return strerror(*a1);
}

  ;
}

CFErrorRef sub_1000096F8(uint64_t a1, void *a2)
{
  if (a1)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "img4_chip_omit", *(void *)(a1 + 16));
    xpc_dictionary_set_uint64(empty, "img4_chip_cepo", *(unsigned int *)(a1 + 24));
    xpc_dictionary_set_uint64(empty, "img4_chip_bord", *(unsigned int *)(a1 + 28));
    xpc_dictionary_set_uint64(empty, "img4_chip_chip", *(unsigned int *)(a1 + 32));
    xpc_dictionary_set_uint64(empty, "img4_chip_sdom", *(unsigned int *)(a1 + 36));
    xpc_dictionary_set_uint64(empty, "img4_chip_ecid", *(void *)(a1 + 40));
    xpc_dictionary_set_uint64(empty, "img4_chip_cpro", *(unsigned __int8 *)(a1 + 48));
    xpc_dictionary_set_uint64(empty, "img4_chip_csec", *(unsigned __int8 *)(a1 + 49));
    xpc_dictionary_set_uint64(empty, "img4_chip_epro", *(unsigned __int8 *)(a1 + 50));
    xpc_dictionary_set_uint64(empty, "img4_chip_esec", *(unsigned __int8 *)(a1 + 51));
    xpc_dictionary_set_uint64(empty, "img4_chip_iuou", *(unsigned __int8 *)(a1 + 52));
    xpc_dictionary_set_uint64(empty, "img4_chip_rsch", *(unsigned __int8 *)(a1 + 53));
    xpc_dictionary_set_uint64(empty, "img4_chip_euou", *(unsigned __int8 *)(a1 + 54));
    xpc_dictionary_set_uint64(empty, "img4_chip_esdm", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_uint64(empty, "img4_chip_fpgt", *(unsigned __int8 *)(a1 + 60));
    xpc_dictionary_set_uint64(empty, "img4_chip_fchp", *(unsigned int *)(a1 + 128));
    xpc_dictionary_set_uint64(empty, "img4_chip_type", *(unsigned int *)(a1 + 132));
    xpc_dictionary_set_uint64(empty, "img4_chip_styp", *(unsigned int *)(a1 + 136));
    xpc_dictionary_set_uint64(empty, "img4_chip_clas", *(unsigned int *)(a1 + 140));
    if (a2)
    {
      xpc_object_t empty = empty;
      CFErrorRef v5 = 0LL;
      *a2 = empty;
    }

    else
    {
      CFErrorRef v5 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    CFErrorRef v5 = sub_10000A444("img4_chip_instance_to_xpc", "img4_xpc.m", 35, "com.apple.security.cryptex", 11LL, 0LL, v6);
    free(v6);
    xpc_object_t empty = 0LL;
  }

  return v5;
}

void sub_10000995C(_Unwind_Exception *a1)
{
}

void sub_100009970(uint64_t a1)
{
}

uint64_t sub_10000999C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100011308(64LL);
  *(void *)(v6 + 40) = a3;
  *(void *)(v6 + 4_Block_object_dispose(va, 8) = a1;
  *(_DWORD *)(v6 + 56) = dup_np(a2);
  sub_10003A6E4(v6 + 16, (int)"com.apple.security.cryptexd", *(char **)(a1 + 8));
  return v6;
}

uint64_t sub_1000099FC( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void *, uint64_t), char a5)
{
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(void *)(v5 + 16))
  {
    uint64_t v6 = a2;
    unint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    int v10 = "%s/%s";
    __int16 v11 = ".";
    while (1)
    {
      uint64_t v12 = *(void *)(v5 + 8 * v8 + 24);
      bzero(__str, 0x400uLL);
      snprintf(__str, 0x400uLL, v10, v12, *(void *)(v6 + 16));
      uint64_t v13 = *(const char **)(a1 + 16);
      int v14 = *__error();
      __int128 v15 = *(os_log_s **)(a1 + 32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136446466;
        BOOL v16 = "[anonymous]";
        if (v13) {
          BOOL v16 = v13;
        }
        int v43 = v16;
        __int16 v44 = 2080;
        BOOL v45 = __str;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: opening subpath: %s", buf, 0x16u);
      }

      *__error() = v14;
      int v17 = openat(*(_DWORD *)(a1 + 56), __str, 0);
      if ((v17 & 0x80000000) == 0) {
        *__error() = 0;
      }
      int v18 = *__error();
      if (v18 != 2)
      {
        CFErrorRef v19 = v11;
        uint64_t v20 = v9;
        int v21 = v10;
        if (v18)
        {
          int v26 = *__error();
          uint64_t v27 = *(const char **)(a1 + 16);
          int v23 = *__error();
          uint64_t v28 = *(os_log_s **)(a1 + 32);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136446722;
            int v29 = "[anonymous]";
            if (v27) {
              int v29 = v27;
            }
            int v43 = v29;
            __int16 v44 = 2080;
            BOOL v45 = __str;
            __int16 v46 = 1024;
            int v47 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to open subpath: %s: %{darwin.errno}d",  buf,  0x1Cu);
          }

          uint64_t v6 = a2;
        }

        else
        {
          int v22 = *(const char **)(a1 + 16);
          int v23 = *__error();
          int v24 = *(os_log_s **)(a1 + 32);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = 136446466;
            id v25 = "[anonymous]";
            if (v22) {
              id v25 = v22;
            }
            int v43 = v25;
            __int16 v44 = 2080;
            BOOL v45 = __str;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "%{public}s: opened subpath: %s",  buf,  0x16u);
          }
        }

        *__error() = v23;
        int v10 = v21;
        uint64_t v9 = v20;
        __int16 v11 = v19;
      }

      if ((v17 & 0x80000000) == 0) {
        break;
      }
      if (v17 != -1)
      {
        LODWORD(v32) = 4;
        goto LABEL_39;
      }

LABEL_41:
      ++v8;
      uint64_t v5 = *(void *)(a1 + 48);
      if (v8 >= *(void *)(v5 + 16)) {
        return v9;
      }
    }

    if ((a5 & 1) != 0)
    {
      uint64_t v35 = (void *)sub_100009E24((void *)a1, v6, __str);
      a4(a1, v35, a3);
      if (v35) {
        os_release(v35);
      }
      LODWORD(v32) = 20;
LABEL_39:
      if (close(v17) == -1) {
        sub_10003E3CC(&v41, buf);
      }
    }

    else
    {
      int v30 = fdopendir(v17);
      if (!v30) {
        sub_10003E2EC(&v41, buf);
      }
      id v31 = v30;
      while (1)
      {
        unint64_t v32 = readdir(v31);
        if (!v32) {
          break;
        }
        bzero(buf, 0x400uLL);
        d_name = v32->d_name;
        if (strcmp(d_name, v11) && strcmp(d_name, ".."))
        {
          snprintf((char *)buf, 0x400uLL, v10, __str, d_name);
          int v34 = (void *)sub_100009E24((void *)a1, v6, (const char *)buf);
          uint64_t v9 = ((uint64_t (*)(uint64_t, void *, uint64_t))a4)(a1, v34, a3);
          if (v34) {
            os_release(v34);
          }
          if (v9)
          {
            LODWORD(v32) = 20;
            break;
          }
        }
      }

      if (closedir(v31) == -1) {
        sub_10003E35C(&v41, buf);
      }
    }

    goto LABEL_41;
  }

  return 0LL;
}

    if (tn - 1 <= 0xFFFFFFFD) {
      mach_right_send_release(tn);
    }
    if (v27) {
      break;
    }
    ++v6;
    int v3 = v7 + 38;
    if (v7 == 570) {
      goto LABEL_54;
    }
  }

  if (v27 != 11)
  {
    uint64_t v51 = 0LL;
    goto LABEL_68;
  }

uint64_t sub_100009E24(void *a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = (const char *)a1[2];
  int v7 = *__error();
  unint64_t v8 = (os_log_s *)a1[4];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = "[anonymous]";
    if (v6) {
      uint64_t v9 = v6;
    }
    int v23 = 136446466;
    int v24 = v9;
    __int16 v25 = 2080;
    int v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: resource: %s", (uint8_t *)&v23, 0x16u);
  }

  *__error() = v7;
  uint64_t v10 = sub_100026344(a2, a1, a3, 0LL);
  int v11 = sub_100026470(v10, 0);
  uint64_t v12 = (const char *)a1[2];
  int v13 = *__error();
  int v14 = (os_log_s *)a1[4];
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int128 v15 = "[anonymous]";
      int v23 = 136446722;
      if (v12) {
        __int128 v15 = v12;
      }
      int v24 = v15;
      __int16 v25 = 2080;
      int v26 = a3;
      __int16 v27 = 1024;
      LODWORD(v2_Block_object_dispose(va, 8) = v11;
      BOOL v16 = "%{public}s: failed to open resource %s: %{darwin.errno}d";
      int v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 28;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v23, v19);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = "[anonymous]";
    if (v12) {
      uint64_t v20 = v12;
    }
    int v21 = *(const char **)(a1[6] + 8LL);
    int v23 = 136446722;
    int v24 = v20;
    __int16 v25 = 2080;
    int v26 = v21;
    __int16 v27 = 2080;
    uint64_t v28 = a3;
    BOOL v16 = "%{public}s: calling out with %s resource: %s";
    int v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 32;
    goto LABEL_14;
  }

  *__error() = v13;
  return v10;
}

double sub_10000A028(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

char *sub_10000A048(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding <= -2) {
    sub_10003E43C();
  }
  CFIndex v4 = MaximumSizeForEncoding + 1;
  uint64_t v5 = (char *)calloc(1uLL, MaximumSizeForEncoding + 1);
  if (v5)
  {
    uint64_t v6 = v5;
    int CString = CFStringGetCString(a1, v5, v4, 0x8000100u);
    if (CString) {
      unint64_t v8 = v6;
    }
    else {
      unint64_t v8 = 0LL;
    }
    if (CString) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = v6;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  free(v5);
  return v8;
}

CFNumberRef sub_10000A0D4(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
}

unint64_t sub_10000A100(const __CFNumber *a1)
{
  unint64_t valuePtr = -1LL;
  if (!CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr)) {
    sub_10003E454();
  }
  if (HIDWORD(valuePtr)) {
    sub_10003E46C(&v2, v4);
  }
  return valuePtr;
}

CFStringRef sub_10000A17C(char *cStr)
{
  return CFStringCreateWithCString(0LL, cStr, 0x8000100u);
}

char *sub_10000A190(const __CFString *a1, char *a2, CFIndex a3)
{
  if (a3 < 0) {
    sub_10003E518();
  }
  if (CFStringGetCString(a1, a2, a3, 0x8000100u)) {
    return a2;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000A1C8(uint64_t a1, CFURLRef *a2)
{
  uint64_t v4 = realpath_np(a1, cStr);
  if (!(_DWORD)v4)
  {
    uint64_t v5 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
    if (!v5) {
      sub_10003E530(&v9, v11);
    }
    uint64_t v6 = v5;
    CFURLRef v7 = CFURLCreateWithFileSystemPath(0LL, v5, kCFURLPOSIXPathStyle, 0);
    if (!v7) {
      sub_10003E5A4(&v9, v11);
    }
    *a2 = v7;
    CFRelease(v6);
  }

  return v4;
}

CFMutableDictionaryRef sub_10000A2A0()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result) {
    sub_10003E618(&v1, v2);
  }
  return result;
}

void sub_10000A310(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
  if (!v5) {
    sub_10003E68C(&v8, v9);
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void sub_10000A3AC(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v5) {
    sub_10003E530(&v7, v8);
  }
  CFStringRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

CFErrorRef sub_10000A444( const char *a1, const char *a2, int a3, const char *a4, CFIndex a5, const void *a6, char *cStr)
{
  int valuePtr = a3;
  CFStringRef v12 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  CFStringRef v13 = CFStringCreateWithCString(0LL, a1, 0x8000100u);
  int v14 = CFStringCreateWithCString(0LL, a4, 0x8000100u);
  CFStringRef v15 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
  CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  int v17 = sub_10000A2A0();
  CFDictionarySetValue(v17, kCFErrorLocalizedDescriptionKey, v12);
  if (os_variant_allows_internal_security_policies("com.apple.security.cryptexd"))
  {
    CFDictionarySetValue(v17, @"FunctionName", v13);
    CFDictionarySetValue(v17, @"FileName", v15);
    CFDictionarySetValue(v17, @"LineNumber", v16);
  }

  if (a6) {
    CFDictionarySetValue(v17, kCFErrorUnderlyingErrorKey, a6);
  }
  CFErrorRef v18 = CFErrorCreate(0LL, v14, a5, v17);
  CFRelease(v17);
  CFRelease(v12);
  CFRelease(v13);
  CFRelease(v14);
  CFRelease(v15);
  CFRelease(v16);
  return v18;
}

CFIndex sub_10000A5D8(CFIndex result)
{
  if (result)
  {
    uint64_t v1 = (__CFError *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    if (v2 != CFErrorGetTypeID()) {
      return 0xFFFFFFFFLL;
    }
    Value = v1;
    while (1)
    {
      CFErrorDomain Domain = CFErrorGetDomain(Value);
      if (CFEqual(Domain, @"com.apple.security.cryptex.posix")) {
        break;
      }
      CFStringRef v5 = CFErrorCopyUserInfo(Value);
      if (!v5) {
        break;
      }
      CFStringRef v6 = v5;
      Value = (__CFError *)CFDictionaryGetValue(v5, kCFErrorUnderlyingErrorKey);
      CFRelease(v6);
      if (!Value) {
        goto LABEL_10;
      }
    }

    CFErrorDomain v7 = CFErrorGetDomain(Value);
    if (CFEqual(v7, @"com.apple.security.cryptex.posix")) {
      return CFErrorGetCode(Value);
    }
LABEL_10:
    CFErrorDomain v8 = CFErrorGetDomain(v1);
    if (CFEqual(v8, @"com.apple.security.cryptex") && (unsigned int Code = CFErrorGetCode(v1), Code <= 0x24)) {
      return dword_1000446A0[Code];
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

CFDictionaryRef sub_10000A6D8(CFDictionaryRef result, const void *a2, uint64_t a3)
{
  if (result)
  {
    Value = result;
    CFTypeID v6 = CFGetTypeID(result);
    CFTypeID TypeID = CFErrorGetTypeID();
    CFMutableDictionaryRef result = 0LL;
    if (a2)
    {
      if (v6 == TypeID)
      {
        while (1)
        {
          CFErrorDomain Domain = CFErrorGetDomain(Value);
          if (CFEqual(Domain, a2))
          {
            if (CFErrorGetCode(Value) == a3) {
              break;
            }
          }

          CFMutableDictionaryRef result = CFErrorCopyUserInfo(Value);
          if (!result) {
            return result;
          }
          uint64_t v9 = result;
          Value = (__CFError *)CFDictionaryGetValue(result, kCFErrorUnderlyingErrorKey);
          CFRelease(v9);
          if (!Value) {
            return 0LL;
          }
        }

        return (CFDictionaryRef)1;
      }
    }
  }

  return result;
}

uint64_t sub_10000A794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

  ;
}

void sub_10000AB28(void *a1)
{
  CFTypeID v2 = (void *)objc_claimAutoreleasedReturnValue([a1 cs]);
  uint64_t uid = cryptex_session_core_get_uid();

  uint64_t v4 = sub_100038088(uid);
  if ((_DWORD)v4)
  {
    [a1 setError:v4];
    int v5 = *__error();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 log]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      int v11 = a1;
      __int16 v12 = 1024;
      unsigned int v13 = [a1 error];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to uncork session %@: %{darwin.errno}d",  (uint8_t *)&v10,  0x12u);
    }

    *__error() = v5;
    uint64_t v7 = a1;
    uint64_t v8 = 32LL;
  }

  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = 4LL;
  }

  [v7 sessionEventNotify:v8];
  uint64_t v9 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "session_work_group"));
  dispatch_group_leave(v9);
}

void sub_10000B1A0(void *a1, void *a2, CFIndex a3, void *a4)
{
  uint64_t v7 = a1;
  id v8 = a2;
  if (a3 && (CFIndex v9 = sub_10000A5D8(a3), (_DWORD)v9))
  {
    CFIndex v10 = v9;
    int v11 = *__error();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([a4 log]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to unbootstrap quire: %{darwin.errno}d",  (uint8_t *)v14,  8u);
    }

    *__error() = v11;
    [a4 setError:v10];
    [a4 sessionEventNotify:32];
    unsigned int v13 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "session_work_group"));
    dispatch_group_leave(v13);
  }

  else
  {
    sub_100016BE8(v7, v8, a4, sub_10000DA3C);
  }
}

LABEL_10:
    *__error() = v12;
    goto LABEL_15;
  }

  dictionary = xpc_dictionary_get_dictionary(v4, "PAYLOAD");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  if (!v7)
  {
    -[CryptexSession setError:](self, "setError:", 22LL);
    __int16 v12 = *__error();
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109120;
      uint32_t v19 = -[CryptexSession error](self, "error");
      int v14 = "Payload format incorrect: %{darwin.errno}d";
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  id v8 = v7;
  array = xpc_dictionary_get_array(v7, "CRYPTEXES");
  CFIndex v10 = (void *)objc_claimAutoreleasedReturnValue(array);
  if (v10)
  {
    int v11 = v10;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_10000B524;
    applier[3] = &unk_100055530;
    void applier[4] = self;
    xpc_array_apply(v10, applier);
  }

  else
  {
    -[CryptexSession setError:](self, "setError:", 22LL);
    CFStringRef v15 = *__error();
    CFNumberRef v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109120;
      uint32_t v19 = -[CryptexSession error](self, "error");
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "session_add incorrectly formatted: %{darwin.errno}d",  buf,  8u);
    }

    *__error() = v15;
  }

LABEL_15:
}

  if ((_DWORD)v7 != -1 && close(v7) == -1) {
    sub_10003E800(&v35, buf);
  }
  return v8;
}

    CFStringRef v15 = v12;
    CFNumberRef v16 = 18;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&buf, v16);
    goto LABEL_12;
  }

  __int16 v25 = sub_10000E158((uint64_t)v85, "AppleInternalDiags", 640, &v76, *(os_log_s **)(v4 + 72));
  if (v25)
  {
    CFIndex v9 = v25;
    int v26 = *(const char **)(v4 + 56);
    int v21 = *__error();
    int v22 = *(os_log_s **)(v4 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = "[anonymous]";
      if (v26) {
        __int16 v27 = v26;
      }
      __int128 buf = 136446466;
      v88 = v27;
      v89 = 1024;
      LODWORD(v90) = v9;
      int v24 = "%{public}s: failed to create diags volume: %{darwin.errno}d";
      goto LABEL_43;
    }

    goto LABEL_45;
  }

  *(void *)(v4 + 176) |= 0x20uLL;
  __strlcpy_chk(v83, "/tmp/tmp-mount-XXXXXX", 1024LL, 1024LL);
  if (!mkdtemp(v83))
  {
    CFIndex v9 = *__error();
    __int16 v44 = *(const char **)(v4 + 56);
    int v11 = *__error();
    __int16 v12 = *(os_log_s **)(v4 + 72);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    BOOL v45 = "[anonymous]";
    if (v44) {
      BOOL v45 = v44;
    }
    __int128 buf = 136446466;
    v88 = v45;
    v89 = 1024;
    LODWORD(v90) = v9;
    int v14 = "%{public}s: failed to create temporary mount point: %{darwin.errno}d";
    goto LABEL_10;
  }

  snprintf(v84, 0xFFuLL, "/dev/%ss%d", v85, v76);
  int v30 = sub_10000E308(v84, (uint64_t)v83, *(os_log_s **)(v4 + 72));
  if (v30)
  {
    CFIndex v9 = v30;
    id v31 = *(const char **)(v4 + 56);
    int v21 = *__error();
    int v22 = *(os_log_s **)(v4 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unint64_t v32 = "[anonymous]";
      if (v31) {
        unint64_t v32 = v31;
      }
      __int128 buf = 136446466;
      v88 = v32;
      v89 = 1024;
      LODWORD(v90) = v9;
      int v24 = "%{public}s: failed to mount diags volume: %{darwin.errno}d";
      goto LABEL_43;
    }

    goto LABEL_45;
  }

  snprintf(from, 0x400uLL, "%s/%s", *(const char **)(v4 + 416), *(const char **)(a2 + 72));
  snprintf(to, 0x400uLL, "%s/%s", v83, "AppleInternal");
  __int16 v46 = mkdir(to, 0x1FFu);
  if (v46)
  {
    CFIndex v9 = v46;
    int v47 = *(const char **)(v4 + 56);
    int v21 = *__error();
    int v48 = *(os_log_s **)(v4 + 72);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    id v49 = "[anonymous]";
    __int128 buf = 136446722;
    if (v47) {
      id v49 = v47;
    }
    v88 = v49;
    v89 = 2080;
    v90 = to;
    v91 = 1024;
    LODWORD(v92) = v9;
    int v24 = "%{public}s: failed to mkdir %s: %{darwin.errno}d";
    uint64_t v35 = v48;
    int v36 = 28;
    goto LABEL_44;
  }

  if (copyfile(from, to, 0LL, 0xC8008u))
  {
    CFIndex v9 = *__error();
    os_log_type_t v54 = *(const char **)(v4 + 56);
    int v11 = *__error();
    uint32_t v55 = *(os_log_s **)(v4 + 72);
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    id v56 = "[anonymous]";
    __int128 buf = 136446978;
    if (v54) {
      id v56 = v54;
    }
    v88 = v56;
    v89 = 2080;
    v90 = from;
    v91 = 2080;
    v92 = to;
    v93 = 1024;
    v94 = v9;
    int v14 = "%{public}s: failed to copyfile from %s to %s: %{darwin.errno}d";
    CFStringRef v15 = v55;
    CFNumberRef v16 = 38;
    goto LABEL_11;
  }

  snprintf(__str, 0x400uLL, "%s/%s/.%s", v83, *(const char **)(a2 + 72), *(const char **)(v4 + 208));
  int v17 = open(__str, 512, 420LL);
  if (v17 < 0)
  {
    CFIndex v9 = *__error();
    uint64_t v65 = *(const char **)(v4 + 56);
    int v11 = *__error();
    v66 = *(os_log_s **)(v4 + 72);
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v67 = "[anonymous]";
    __int128 buf = 136446722;
    if (v65) {
      __int16 v67 = v65;
    }
    v88 = v67;
    v89 = 2080;
    v90 = __str;
    v91 = 1024;
    LODWORD(v92) = v9;
    uint64_t v68 = "%{public}s: failed to open %s: %{darwin.errno}d";
    v69 = v66;
    v70 = 28;
    goto LABEL_115;
  }

  if (unlink("/AppleInternal/Diags") && *__error() != 2)
  {
    CFIndex v9 = *__error();
    v71 = *(const char **)(v4 + 56);
    int v11 = *__error();
    v72 = *(os_log_s **)(v4 + 72);
    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    BOOL v73 = "[anonymous]";
    if (v71) {
      BOOL v73 = v71;
    }
    __int128 buf = 136446466;
    v88 = v73;
    v89 = 1024;
    LODWORD(v90) = v9;
    uint64_t v68 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
LABEL_114:
    v69 = v72;
    v70 = 18;
LABEL_115:
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, v68, (uint8_t *)&buf, v70);
LABEL_13:
    *__error() = v11;
    if (!v9)
    {
      CFErrorRef v18 = 0LL;
      goto LABEL_57;
    }

id sub_10000B524(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "BUNDLEID");
  int v37 = xpc_dictionary_dup_fd(v4, "DMG");
  int v36 = xpc_dictionary_dup_fd(v4, "TCH");
  int v35 = xpc_dictionary_dup_fd(v4, "IM4");
  int v34 = xpc_dictionary_dup_fd(v4, "INF");
  int v33 = xpc_dictionary_dup_fd(v4, "VOLHASH");
  int64_t int64 = xpc_dictionary_get_int64(v4, "TYPE");
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v4, "CRYPTEX1_PROPERTIES");
  uint64_t v8 = objc_claimAutoreleasedReturnValue(dictionary);
  CFIndex v9 = (void *)v8;
  if (v8) {
    CFIndex v10 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary(v8);
  }
  else {
    CFIndex v10 = 0LL;
  }
  id v11 = [*(id *)(a1 + 32) sessionAddCptxWithBundleID:string withType:int64 dmgFd:&v37 trustCacheFD:&v36 manifestFD:&v35 volumeHashFD:&v33 infoPlistFd:&v34 cx1Properties:v10];

  if (v33 != -1 && close(v33) == -1)
  {
    uint64_t v38 = 0LL;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v41 = 0u;
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v14 = *__error();
    if (v13) {
      uint64_t v15 = 3LL;
    }
    else {
      uint64_t v15 = 2LL;
    }
    int v39 = 67109120;
    int v40 = v14;
    uint64_t v16 = _os_log_send_and_compose_impl(v15, &v38, &v41, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v17 = _os_crash_msg(v38, v16);
    sub_10003E7FC(v17);
  }

  if (v34 != -1 && close(v34) == -1)
  {
    uint64_t v38 = 0LL;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v41 = 0u;
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v19 = *__error();
    if (v18) {
      uint64_t v20 = 3LL;
    }
    else {
      uint64_t v20 = 2LL;
    }
    int v39 = 67109120;
    int v40 = v19;
    uint64_t v21 = _os_log_send_and_compose_impl(v20, &v38, &v41, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v22 = _os_crash_msg(v38, v21);
    sub_10003E7FC(v22);
  }

  if (v35 != -1 && close(v35) == -1)
  {
    uint64_t v38 = 0LL;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v41 = 0u;
    BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v24 = *__error();
    if (v23) {
      uint64_t v25 = 3LL;
    }
    else {
      uint64_t v25 = 2LL;
    }
    int v39 = 67109120;
    int v40 = v24;
    uint64_t v26 = _os_log_send_and_compose_impl(v25, &v38, &v41, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v27 = _os_crash_msg(v38, v26);
    sub_10003E7FC(v27);
  }

  if (v36 != -1 && close(v36) == -1)
  {
    uint64_t v38 = 0LL;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v41 = 0u;
    BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v29 = *__error();
    if (v28) {
      uint64_t v30 = 3LL;
    }
    else {
      uint64_t v30 = 2LL;
    }
    int v39 = 67109120;
    int v40 = v29;
    uint64_t v31 = _os_log_send_and_compose_impl(v30, &v38, &v41, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v32 = _os_crash_msg(v38, v31);
    sub_10003E7FC(v32);
  }

  if (v37 != -1 && close(v37) == -1) {
    sub_10003E734(&v38, &v41);
  }

  return v11;
}

void sub_10000B988( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12, unsigned int a13, unsigned int a14, unsigned int a15, unsigned int a16)
{
}

uint64_t sub_10000B9F0(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result != -1)
  {
    uint64_t result = close(result);
    if ((_DWORD)result == -1) {
      sub_10003E800(&v2, v3);
    }
  }

  return result;
}

void sub_10000BCC0(void *a1, void *a2, CFIndex a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v27 = a4;
  id v9 = *(id *)(a4 + 32);
  if (a3 && (CFIndex v10 = sub_10000A5D8(a3), (_DWORD)v10))
  {
    CFIndex v11 = v10;
    int v12 = *__error();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v29) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "exiting session codex install: %{darwin.errno}d",  buf,  8u);
    }

    *__error() = v12;
    [v9 setError:v11];
    int v14 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session_work_group"));
    dispatch_group_leave(v14);

    sub_100037F94(&v27);
  }

  else if (*(_DWORD *)(a4 + 8))
  {
    int v15 = *__error();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = *(_DWORD *)(a4 + 8);
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "_session_install_codex_callback context error: %{darwin.errno}d",  buf,  8u);
    }

    *__error() = v15;
    [v9 setError:*(unsigned int *)(a4 + 8)];
  }

  else
  {
    if (v8)
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v9 cs]);
      int uid = cryptex_session_core_get_uid();

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 cs]);
      uint64_t overrides = cryptex_session_core_get_overrides();
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(overrides);

      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v9 cs]);
      uint64_t v24 = cryptex_session_core_copy_name();
      sub_100030CF4((uint64_t)v8, uid, v22, v24);

      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v29 = v9;
        __int16 v30 = 2048;
        id v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: Saving the quire %p", buf, 0x16u);
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "quire_array"));
      [v26 addObject:v8];
    }

    sub_10001737C((uint64_t)v7, v8, (void *)a4, sub_10000D904);
  }
}

LABEL_4:
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
      CFIndex v10 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = 136315138;
        __int16 v30 = (CryptexSession *)string;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Recieved error from peer - %s",  (uint8_t *)&v29,  0xCu);
      }
    }

    else
    {
      CFIndex v10 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSession log](self, "log"));
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_10003E8B4((os_log_s *)v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }

    if (iterator) {
      IOObjectRelease(iterator);
    }
  }

  return v2;
}

void sub_10000C424(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_connection)
  {
    xpc_type_t v5 = type;
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) log]);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5 == (xpc_type_t)&_xpc_type_error)
    {
      if (v7)
      {
        *(_DWORD *)__int128 buf = 136315138;
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        id v8 = "connection error: %s";
        id v9 = v6;
        uint32_t v10 = 12;
        goto LABEL_10;
      }
    }

    else if (v7)
    {
      *(_WORD *)__int128 buf = 0;
      id v8 = "unrecognized connection event";
      id v9 = v6;
      uint32_t v10 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }

    goto LABEL_12;
  }

  pid_t pid = xpc_connection_get_pid((xpc_connection_t)v3);
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) log]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(string) = pid;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "activating peer for %d", buf, 8u);
  }

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer_array"));
  [v13 addObject:v3];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000C61C;
  v15[3] = &unk_100055558;
  v15[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v16 = v14;
  xpc_connection_set_event_handler((xpc_connection_t)v14, v15);
  xpc_connection_activate((xpc_connection_t)v14);

LABEL_12:
}

id sub_10000C61C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseCommandFromMessage:a2 fromPeer:*(void *)(a1 + 40)];
}

void sub_10000CE68(_Unwind_Exception *a1)
{
}

void sub_10000D14C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[CryptexSessionList createCryptexSessionList](&OBJC_CLASS___CryptexSessionList, "createCryptexSessionList"));
  uint64_t v2 = (void *)qword_10005A410;
  qword_10005A410 = v1;
}

BOOL sub_10000D340(uint64_t a1, void *a2)
{
  id v3 = (char *)[a2 copySessionName];
  BOOL v4 = strcmp(*(const char **)(a1 + 32), v3) == 0;
  free(v3);
  return v4;
}

uint64_t sub_10000D3E0(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](&OBJC_CLASS___CryptexSessionList, "sharedList"));
  BOOL v13 = (pthread_rwlock_t *)(v2 + 8);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v2 + 8));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v14 = (void *)v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)v2 list]);
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (int i = 0LL; i != v5; int i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "log", v13));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "passing session %@", buf, 0xCu);
        }

        CFIndex v11 = (void *)objc_claimAutoreleasedReturnValue([v8 cs]);
        v1[2](v1, v11);
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v5);
  }

  pthread_rwlock_unlock(v13);
  return 0LL;
}

uint64_t sub_10000D5B8(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](&OBJC_CLASS___CryptexSessionList, "sharedList"));
  __int128 v15 = (pthread_rwlock_t *)(v4 + 8);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v4 + 8));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v16 = (void *)v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 list]);
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (int i = 0LL; i != v7; int i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint32_t v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        CFIndex v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "log", v15));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "passing session %@", buf, 0xCu);
        }

        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 cs]);
        v3[2](v3, v13, a2);
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v7);
  }

  pthread_rwlock_unlock(v15);
  return 0LL;
}

uint64_t sub_10000D794(void *a1)
{
  id v1 = a1;
  uint64_t v2 = -[CryptexSession initWithCore:](objc_alloc(&OBJC_CLASS___CryptexSession), "initWithCore:", v1);

  if (v2)
  {
    -[CryptexSession setupHandler](v2, "setupHandler");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](&OBJC_CLASS___CryptexSessionList, "sharedList"));
    [v3 addCryptexSession:v2];

    uint64_t v4 = -[CryptexSession activate](v2, "activate");
  }

  else
  {
    uint64_t v4 = 22LL;
  }

  return v4;
}

void sub_10000D81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](&OBJC_CLASS___CryptexSessionList, "sharedList"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 findCryptexSession:a1]);

  id v7 = v8;
  if (v8)
  {
    [v8 sessionStopWithReason:a2 exitCode:a3];
    id v7 = v8;
  }
}

dispatch_queue_s *sub_10000D894(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](&OBJC_CLASS___CryptexSessionList, "sharedList"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 findCryptexSession:a1]);

  if (v3)
  {
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 getDispatchQueue]);
  }

  else
  {
    uint64_t v4 = &_dispatch_main_q;
    id v5 = &_dispatch_main_q;
  }

  return v4;
}

void sub_10000D904(void *a1, void *a2, CFIndex a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v15 = a4;
  id v9 = *(id *)(a4 + 32);
  if (a3)
  {
    CFIndex v10 = sub_10000A5D8(a3);
    if ((_DWORD)v10)
    {
      CFIndex v11 = v10;
      int v12 = *__error();
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 log]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 67109120;
        int v17 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "exiting session quire bootstrap: %{darwin.errno}d",  buf,  8u);
      }

      *__error() = v12;
      [v9 setError:v11];
    }
  }

  id v14 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session_work_group"));
  dispatch_group_leave(v14);

  sub_100037F94(&v15);
}

void sub_10000DA3C(void *a1, void *a2, CFIndex a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  if (a3)
  {
    int v9 = *__error();
    CFIndex v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([a4 log]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      CFIndex v21 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to unmount quire: %@",  (uint8_t *)&v20,  0xCu);
    }

    *__error() = v9;
    [a4 setError:sub_10000A5D8(a3)];
  }

  else
  {
    CFIndex v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "quire_array"));
    unsigned int v12 = [v11 containsObject:v8];

    if (v12)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "quire_array"));
      [v13 removeObject:v8];
    }

    else
    {
      [a4 setError:2];
      int v14 = *__error();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([a4 log]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134218240;
        CFIndex v21 = (CFIndex)v8;
        __int16 v22 = 1024;
        unsigned int v23 = [a4 error];
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Quire object not found %p: %{darwin.errno}d",  (uint8_t *)&v20,  0x12u);
      }

      *__error() = v14;
    }
  }

  if ([a4 error])
  {
    [a4 sessionEventNotify:32];
  }

  else
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "quire_array"));
    id v17 = [v16 count];

    if (!v17)
    {
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([a4 log]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "taking down the session",  (uint8_t *)&v20,  2u);
      }

      [a4 sessionEventNotify:16];
      [a4 cancelPeerConnections];
    }
  }

  __int128 v19 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "session_work_group"));
  dispatch_group_leave(v19);
}

void sub_10000DCB4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void *sub_10000DCC4()
{
  if (qword_10005A418 != -1) {
    dispatch_once(&qword_10005A418, &stru_1000555E0);
  }
  return &unk_10005A420;
}

void sub_10000DD04(id a1)
{
}

void sub_10000DD40(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  id v7 = a3;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10000DE80;
  v14[3] = &unk_100055630;
  __int128 v16 = v17;
  id v8 = a4;
  id v15 = v8;
  launch_cryptex_terminate(a1, v7, v14);
  dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL * a2);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000DF18;
  v11[3] = &unk_100055680;
  id v12 = v8;
  BOOL v13 = v17;
  id v10 = v8;
  dispatch_after(v9, v7, v11);

  _Block_object_dispose(v17, 8);
}

void sub_10000DE68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10000DE80(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000DF04;
  v8[3] = &unk_100055608;
  id v5 = v3;
  uint64_t v7 = *(void *)(v4 + 24);
  id v6 = (dispatch_once_t *)(v4 + 24);
  id v9 = v5;
  int v10 = a2;
  if (v7 != -1) {
    dispatch_once(v6, v8);
  }
}

uint64_t sub_10000DF04(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40));
}

void sub_10000DF18(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DF94;
  block[3] = &unk_100055658;
  id v3 = v1;
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v4 = (dispatch_once_t *)(v2 + 24);
  id v7 = v3;
  if (v5 != -1) {
    dispatch_once(v4, block);
  }
}

uint64_t sub_10000DF94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000DFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 1;
  id v3 = -[NSString pathComponents]( -[NSString stringByResolvingSymlinksInPath]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1),  "stringByResolvingSymlinksInPath"),  "pathComponents");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000E090;
  v6[3] = &unk_1000556A8;
  v6[4] = -[NSString pathComponents]( -[NSString stringByResolvingSymlinksInPath]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2),  "stringByResolvingSymlinksInPath"),  "pathComponents");
  v6[5] = &v7;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", v6);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_10000E074( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

char *sub_10000E090(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  uint64_t result = (char *)[*(id *)(a1 + 32) count];
  if ((unint64_t)(result - 1) <= a3
    || (uint64_t result = (char *)objc_msgSend(a2, "isEqual:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3)),
        (result & 1) == 0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  return result;
}

uint64_t sub_10000E104()
{
  return 1LL;
}

uint64_t sub_10000E10C()
{
  return 0LL;
}

BOOL sub_10000E114(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0LL;
  int v2 = APFSVolumeRoleFind(a1, a2, &cf);
  if (cf) {
    CFRelease(cf);
  }
  return v2 == 0;
}

uint64_t sub_10000E158(uint64_t a1, char *a2, int a3, _WORD *a4, os_log_s *a5)
{
  char v10 = sub_10000A2A0();
  sub_10000A3AC(v10, kAPFSVolumeNameKey, a2);
  sub_10000A310(v10, kAPFSVolumeRoleKey, a3);
  int v11 = APFSVolumeCreate(a1, v10);
  if (v11)
  {
    int v12 = v11;
    int v13 = *__error();
    if (!os_log_type_enabled(a5, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      *__error() = v13;
      uint64_t v17 = 22LL;
      goto LABEL_6;
    }

    int v20 = 136315394;
    CFIndex v21 = a2;
    __int16 v22 = 1024;
    int v23 = v12;
    int v14 = "failed to create volume %s: 0x%x";
    id v15 = a5;
    uint32_t v16 = 18;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v20, v16);
    goto LABEL_5;
  }

  Value = (const __CFNumber *)CFDictionaryGetValue(v10, kAPFSVolumeFSIndexKey);
  if (!Value)
  {
    int v13 = *__error();
    if (!os_log_type_enabled(a5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    int v20 = 136315138;
    CFIndex v21 = a2;
    int v14 = "failed to get volume %s index key";
    id v15 = a5;
    uint32_t v16 = 12;
    goto LABEL_4;
  }

  uint64_t v17 = 0LL;
  if (a4) {
    *a4 = sub_10000A100(Value) + 1;
  }
LABEL_6:
  if (v10) {
    CFRelease(v10);
  }
  return v17;
}

uint64_t sub_10000E308(char *a1, uint64_t a2, os_log_s *a3)
{
  int v13 = -1;
  pid_t v14 = -1;
  __argv[0] = "/sbin/mount_apfs";
  uint64_t v22 = unk_1000556E0;
  __argv[1] = a1;
  uint64_t v21 = a2;
  uint64_t v4 = posix_spawn(&v14, "/sbin/mount_apfs", 0LL, 0LL, __argv, 0LL);
  if ((_DWORD)v4)
  {
    uint64_t v5 = v4;
    int v6 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(char **)uint32_t v16 = __argv[0];
      *(_WORD *)&v16[8] = 1024;
      int v17 = v5;
      uint64_t v7 = "failed to posix_spawn %s: %{darwin.errno}d";
LABEL_4:
      id v8 = a3;
      uint32_t v9 = 18;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_19;
    }

    goto LABEL_19;
  }

  pid_t v10 = waitpid(v14, &v13, 0);
  if (v10 != v14)
  {
    pid_t v11 = v10;
    uint64_t v5 = *__error();
    int v6 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109376;
      *(_DWORD *)uint32_t v16 = v11;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v5;
      uint64_t v7 = "unexpected return code for waitpid: %d: %{darwin.errno}d";
      id v8 = a3;
      uint32_t v9 = 14;
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  if ((v13 & 0x7F) != 0)
  {
    if ((v13 & 0x7F) == 0x7F)
    {
      int v6 = *__error();
      uint64_t v5 = 35LL;
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(char **)uint32_t v16 = __argv[0];
        *(_WORD *)&v16[8] = 1024;
        int v17 = 35;
        uint64_t v7 = "%s exited with an unknown state: %{darwin.errno}d";
        goto LABEL_4;
      }

LABEL_19:
      *__error() = v6;
      return v5;
    }

    int v6 = *__error();
    uint64_t v5 = 4LL;
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)__int128 buf = 136315650;
    *(char **)uint32_t v16 = __argv[0];
    *(_WORD *)&v16[8] = 1024;
    int v17 = v13 & 0x7F;
    __int16 v18 = 1024;
    int v19 = 4;
    uint64_t v7 = "%s exited with signal: %d: %{darwin.errno}d";
LABEL_17:
    id v8 = a3;
    uint32_t v9 = 24;
    goto LABEL_18;
  }

  uint64_t v5 = BYTE1(v13);
  if (BYTE1(v13))
  {
    int v6 = *__error();
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)__int128 buf = 136315650;
    *(char **)uint32_t v16 = __argv[0];
    *(_WORD *)&v16[8] = 1024;
    int v17 = BYTE1(v13);
    __int16 v18 = 1024;
    int v19 = v5;
    uint64_t v7 = "%s returned non-zero exit: %d: %{darwin.errno}d";
    goto LABEL_17;
  }

  return v5;
}

  *__error() = v5;
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v3;
  cryptex_target_async_f(v2, a1, sub_10001DB40);
  uint64_t result = v19;
  if (v19 != -1)
  {
    uint64_t result = close(v19);
    if ((_DWORD)result == -1) {
      sub_10003E3CC(&v20, buf);
    }
  }

  return result;
}

uint64_t sub_10000E5C0(int a1, char **a2, os_log_s *a3)
{
  kern_return_t v14;
  kern_return_t v15;
  int v16;
  CFNumberRef v17;
  CFNumberRef Value;
  CFTypeID v19;
  int v20;
  CFTypeID v21;
  unsigned __int16 valuePtr;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[88];
  existing = 0;
  int v6 = IOServiceMatching("AppleAPFSVolume");
  if (v6)
  {
    uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v6, &existing);
    if ((_DWORD)MatchingServices)
    {
      uint64_t v8 = MatchingServices;
      int v9 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "failed to get matching services: %{mach.errno}x",  buf,  8u);
      }

      *__error() = v9;
      uint64_t v10 = sub_1000108D4(v8);
      goto LABEL_34;
    }

    IOIteratorReset(existing);
    io_object_t v12 = IOIteratorNext(existing);
    if (!v12)
    {
LABEL_33:
      uint64_t v10 = 93LL;
      goto LABEL_34;
    }

    io_registry_entry_t v13 = v12;
    uint64_t v10 = 0xFFFFFFFFLL;
    while (1)
    {
      properties = 0LL;
      if (!IORegistryEntryInPlane(v13, "IOService")) {
        goto LABEL_16;
      }
      pid_t v14 = IORegistryEntryCreateCFProperties(v13, &properties, kCFAllocatorDefault, 0);
      if (v14) {
        break;
      }
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"RoleValue");
      int v17 = Value;
      if (Value)
      {
        int v19 = CFGetTypeID(Value);
        if (v19 != CFNumberGetTypeID()) {
          goto LABEL_32;
        }
        int valuePtr = 0;
        if (!CFNumberGetValue(v17, kCFNumberSInt16Type, &valuePtr) || valuePtr != a1) {
          goto LABEL_32;
        }
        int v17 = (const __CFNumber *)CFDictionaryGetValue(properties, @"FormattedBy");
        int v20 = *__error();
        if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "volume is formatted by %@", buf, 0xCu);
        }

        *__error() = v20;
        if (v17 && (uint64_t v21 = CFGetTypeID(v17), v21 == CFStringGetTypeID()))
        {
          uint64_t v10 = 0LL;
          *a2 = sub_10000A048((const __CFString *)v17);
          LODWORD(v17) = 4;
        }

        else
        {
LABEL_32:
          LODWORD(v17) = 0;
        }
      }

LABEL_17:
      if (properties) {
        CFRelease(properties);
      }
      if (IOObjectRelease(v13)) {
        sub_10003E95C(&properties, buf);
      }
      io_registry_entry_t v13 = IOIteratorNext(existing);
      if (!v13) {
        goto LABEL_33;
      }
    }

    id v15 = v14;
    uint32_t v16 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "failed to get service properties: %{mach.errno}x",  buf,  8u);
    }

    *__error() = v16;
LABEL_16:
    LODWORD(v17) = 8;
    goto LABEL_17;
  }

  int v11 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)&uint8_t buf[4] = "AppleAPFSVolume";
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to match service %s", buf, 0xCu);
  }

  *__error() = v11;
  uint64_t v10 = 78LL;
LABEL_34:
  if (existing && IOObjectRelease(existing)) {
    sub_10003E95C(&properties, buf);
  }
  return v10;
}

uint64_t sub_10000E964(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v4 = a2;
  CFArrayRef theArray = 0LL;
  if (APFSVolumeRoleFind(a1, a2, &theArray))
  {
    int v5 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(f_mntonname) = v4;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to find volume for role %d", buf, 8u);
    }

    *__error() = v5;
    uint64_t v6 = 2LL;
  }

  else if (CFArrayGetCount(theArray) < 1)
  {
LABEL_15:
    uint64_t v6 = 0LL;
  }

  else
  {
    CFIndex v7 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v7);
      int v9 = sub_10000A048(ValueAtIndex);
      uint32_t v16 = 0LL;
      int v10 = getmntinfo(&v16, 2);
      if (v10)
      {
        int v11 = v10;
        f_mntfromname = v16->f_mntfromname;
        while (strcmp(v9, f_mntfromname))
        {
          uint32_t v16 = (statfs *)(f_mntfromname + 1056);
          f_mntfromname += 2168;
          if (!--v11) {
            goto LABEL_13;
          }
        }

        if (unmount(f_mntfromname - 1024, 0x80000)) {
          break;
        }
      }

LABEL_13:
      if (APFSVolumeDelete(v9))
      {
        uint64_t v6 = *__error();
        int v13 = *__error();
        if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_DWORD *)__int128 buf = 136315394;
        f_mntonname = v9;
        __int16 v20 = 1024;
        int v21 = v6;
        pid_t v14 = "failed to delete volume %s: %{darwin.errno}d";
        goto LABEL_20;
      }

      free(v9);
      if (++v7 >= CFArrayGetCount(theArray)) {
        goto LABEL_15;
      }
    }

    uint64_t v6 = *__error();
    int v13 = *__error();
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)__int128 buf = 136315394;
    f_mntonname = v16->f_mntonname;
    __int16 v20 = 1024;
    int v21 = v6;
    pid_t v14 = "failed to umount %s: %{darwin.errno}d";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
LABEL_21:
    *__error() = v13;
    free(v9);
  }

  if (theArray) {
    CFRelease(theArray);
  }
  return v6;
}

uint64_t sub_10000EBBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

double sub_10000EBD4(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void *sub_10000EBF8(uint64_t a1)
{
  int v2 = sub_100014D14();
  id v3 = sub_100017B18((uint64_t)v2, (char *)(a1 + 24), 0LL);
  if (v2) {
    os_release(v2);
  }
  return v3;
}

uint64_t sub_10000EC3C(void *a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v6 = (void *)sub_100011440((uint64_t)a2, 0LL);
  uint64_t v7 = sub_1000114A4((uint64_t)v6);
  if ((_DWORD)v7)
  {
    uint64_t v8 = v7;
    int v9 = (const char *)a1[7];
    int v10 = *__error();
    int v11 = (os_log_s *)a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      io_object_t v12 = "[anonymous]";
      if (v9) {
        io_object_t v12 = v9;
      }
      *(_DWORD *)uint64_t v26 = 136446466;
      *(void *)&v26[4] = v12;
      __int16 v27 = 1024;
      LODWORD(v2_Block_object_dispose(va, 8) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to resolve proc: %{darwin.errno}d",  v26,  0x12u);
    }

    *__error() = v10;
  }

  else
  {
    uint64_t v8 = sub_1000120BC((uint64_t)v6, "com.apple.private.security.cryptex.install");
    int v13 = (const char *)a1[7];
    int v14 = *__error();
    id v15 = (os_log_s *)a1[9];
    if ((_DWORD)v8)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint32_t v16 = "[anonymous]";
        uint64_t v17 = v6[8];
        uint64_t v18 = v6[9];
        if (v13) {
          uint32_t v16 = v13;
        }
        *(_DWORD *)uint64_t v26 = 136447490;
        *(void *)&v26[4] = v16;
        __int16 v27 = 2080;
        BOOL v28 = "uninstall";
        __int16 v29 = 2080;
        __int16 v30 = "com.apple.private.security.cryptex.install";
        __int16 v31 = 2080;
        uint64_t v32 = v17;
        __int16 v33 = 2080;
        uint64_t v34 = v18;
        __int16 v35 = 1024;
        int v36 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s: proc not entitled for %s: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d",  v26,  0x3Au);
      }

      *__error() = v14;
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v19 = "[anonymous]";
        if (v13) {
          int v19 = v13;
        }
        uint64_t v20 = v6[8];
        uint64_t v21 = v6[9];
        *(_DWORD *)uint64_t v26 = 136447234;
        *(void *)&v26[4] = v19;
        __int16 v27 = 2080;
        BOOL v28 = "uninstall";
        __int16 v29 = 2080;
        __int16 v30 = "com.apple.private.security.cryptex.install";
        __int16 v31 = 2080;
        uint64_t v32 = v20;
        __int16 v33 = 2080;
        uint64_t v34 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s: authorized proc for %s: entitlement = %s, proc = %s, signing id = %s",  v26,  0x34u);
      }

      *__error() = v14;
      uint64_t v22 = a1[49];
      *(void *)uint64_t v26 = 0LL;
      uint64_t v8 = cryptex_uninstall_unpack(a2, v26);
      if (!(_DWORD)v8)
      {
        unint64_t v23 = v26[0] & 1;
        uint64_t v24 = sub_10002A130(0LL, a2, a3);
        sub_100017570(v22, a1, v23, v24, sub_10000EF08);
        uint64_t v8 = 36LL;
      }
    }
  }

  if (v6) {
    os_release(v6);
  }
  os_release(a1);
  return v8;
}

void sub_10000EF08(dispatch_queue_t *a1, void *a2, uint64_t a3, void *a4)
{
  int v8 = *__error();
  int v9 = (os_log_s *)a2[9];
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = a3;
      int v10 = "unbootstrap: %@";
      int v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    int v10 = "unbootstrap [no error]";
    int v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    uint32_t v13 = 2;
    goto LABEL_6;
  }

  *__error() = v8;
  sub_100016BE8(a1, a2, a4, sub_10000F01C);
}

void sub_10000F01C(uint64_t a1, uint64_t a2, CFIndex a3, uint64_t a4)
{
  if (a3) {
    int v5 = sub_10000A5D8(a3);
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = a4;
  sub_10002A180(&v6, v5);
}

id sub_10000F064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v29 = 0LL;
  int v10 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  int v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s/%s", a4, a3);
  os_log_type_t v12 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11);
  uint32_t v13 = -[NSURL URLByDeletingLastPathComponent](v12, "URLByDeletingLastPathComponent");
  NSFileAttributeKey v36 = NSFilePosixPermissions;
  int v37 = &off_100057B70;
  if (!-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v10,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v13,  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL),  &v29))
  {
    id v16 = [v29 code];
    int v17 = *__error();
    if (qword_10005A828 != -1) {
      dispatch_once(&qword_10005A828, &stru_100055718);
    }
    uint64_t v18 = (os_log_s *)qword_10005A820;
    if (os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR))
    {
      int v19 = -[NSString UTF8String](-[NSURL path](v13, "path"), "UTF8String");
      *(_DWORD *)__int128 buf = 136315394;
      __int16 v33 = v19;
      __int16 v34 = 1024;
      int v35 = (int)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "failed to create directory at %s: %{darwin.errno}d",  buf,  0x12u);
    }

    goto LABEL_33;
  }

  if (-[NSFileManager fileExistsAtPath:](v10, "fileExistsAtPath:", v11))
  {
    int v28 = *__error();
    if (qword_10005A828 != -1) {
      dispatch_once(&qword_10005A828, &stru_100055718);
    }
    int v14 = (os_log_s *)qword_10005A820;
    if (os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "trampoline file exists, removing", buf, 2u);
    }

    *__error() = v28;
    if (!-[NSFileManager removeItemAtPath:error:](v10, "removeItemAtPath:error:", v11, &v29))
    {
      id v16 = [v29 code];
      int v17 = *__error();
      if (qword_10005A828 != -1) {
        dispatch_once(&qword_10005A828, &stru_100055718);
      }
      uint64_t v24 = (os_log_s *)qword_10005A820;
      if (os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = -[NSString UTF8String](v11, "UTF8String");
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v33 = v25;
        __int16 v34 = 1024;
        int v35 = (int)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "failed to remove file at %s: %{darwin.errno}d",  buf,  0x12u);
      }

      goto LABEL_33;
    }
  }

  if (a5) {
    uint64_t v15 = @"#!/bin/sh\n/usr/bin/cryptexctl exec -P -i %s %s %s $@\n";
  }
  else {
    uint64_t v15 = @"#!/bin/sh\n/usr/bin/cryptexctl exec -i %s %s %s $@\n";
  }
  if (!-[NSString writeToFile:atomically:encoding:error:]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, a1, a2, a3),  "writeToFile:atomically:encoding:error:",  v11,  0LL,  4LL,  &v29))
  {
    id v20 = [v29 code];
    int v17 = *__error();
    if (qword_10005A828 != -1) {
      dispatch_once(&qword_10005A828, &stru_100055718);
    }
    uint64_t v21 = (os_log_s *)qword_10005A820;
    if (!os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v22 = -[NSString UTF8String](-[NSURL path](v12, "path"), "UTF8String");
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v33 = v22;
    __int16 v34 = 1024;
    int v35 = (int)v20;
    unint64_t v23 = "failed to write trampoline at %s: %{darwin.errno}d";
    goto LABEL_31;
  }

  NSFileAttributeKey v30 = NSFilePosixPermissions;
  __int16 v31 = &off_100057B70;
  if (!-[NSFileManager setAttributes:ofItemAtPath:error:]( v10,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL),  v11,  &v29))
  {
    id v20 = [v29 code];
    int v17 = *__error();
    if (qword_10005A828 != -1) {
      dispatch_once(&qword_10005A828, &stru_100055718);
    }
    uint64_t v21 = (os_log_s *)qword_10005A820;
    if (!os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v26 = -[NSString UTF8String](-[NSURL path](v12, "path"), "UTF8String");
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v33 = v26;
    __int16 v34 = 1024;
    int v35 = (int)v20;
    unint64_t v23 = "failed to change trampoline permission at %s: %{darwin.errno}d";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x12u);
LABEL_32:
    id v16 = v20;
LABEL_33:
    *__error() = v17;
    return v16;
  }

  return 0LL;
}

void sub_10000F528(id a1)
{
  qword_10005A820 = (uint64_t)os_log_create("com.apple.libcryptex", "bin_trampoline");
}

uint64_t sub_10000F554(BOOL *a1)
{
  int v4 = 0;
  size_t v3 = 4LL;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v4, &v3, 0LL, 0LL)) {
    return *__error();
  }
  uint64_t result = 0LL;
  if (a1) {
    *a1 = v4 != 0;
  }
  return result;
}

void sub_10000F5C8(void **a1)
{
}

void *sub_10000F614(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (void *)sub_1000110D4(128LL);
  v6[10] = a3;
  v6[11] = os_retain(a2);
  v6[12] = os_retain((void *)a1);
  uint64_t v7 = cryptex_core_create(0LL);
  v6[13] = v7;
  if (*(void *)(a1 + 168))
  {
    cryptex_core_attach_host();
    uint64_t v7 = v6[13];
  }

  if (*(void *)(a1 + 216))
  {
    cryptex_core_set_cryptex1_properties(v7);
    uint64_t v7 = v6[13];
  }

  *(_OWORD *)(v7 + 40) = *(_OWORD *)(a1 + 40);
  *(void *)(v7 + 56) = *(void *)(a1 + 56);
  sub_10003A6E4((uint64_t)(v6 + 7), (int)"com.apple.security.cryptexd", "protex");
  cryptex_init(v6, 0LL, sub_10000F6D8, 0LL);
  return v6;
}

uint64_t sub_10000F6D8(uint64_t a1)
{
  __s1[0] = *(_OWORD *)"protex.XXXXXX";
  memset(&__s1[1], 0, 239);
  int v22 = -1;
  uint64_t v2 = sub_1000153AC(*(void *)(a1 + 88), (uint64_t)&unk_100055D38, (char *)__s1, &v22);
  if ((_DWORD)v2)
  {
    uint64_t v3 = v2;
    int v4 = *(const char **)(a1 + 56);
    int v5 = *__error();
    uint64_t v6 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = "[anonymous]";
      if (v4) {
        uint64_t v7 = v4;
      }
      *(_DWORD *)__int128 buf = 136446466;
      int v28 = v7;
      __int16 v29 = 1024;
      int v30 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to create staging directory: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v5;
  }

  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_DEBUG))
    {
      bzero(buf, 0x400uLL);
      if (!realpath_np(v22, buf))
      {
        int v8 = *(const char **)(a1 + 56);
        int v9 = *__error();
        int v10 = *(os_log_s **)(a1 + 72);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v11 = "[anonymous]";
          if (v8) {
            int v11 = v8;
          }
          *(_DWORD *)unint64_t v23 = 136446466;
          uint64_t v24 = v11;
          __int16 v25 = 2080;
          uint64_t v26 = buf;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}s: staging directory = %s",  v23,  0x16u);
        }

        *__error() = v9;
      }
    }

    os_log_type_t v12 = *(const char **)(a1 + 56);
    int v13 = *__error();
    int v14 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = "[anonymous]";
      if (v12) {
        uint64_t v15 = v12;
      }
      *(_DWORD *)__int128 buf = 136446466;
      int v28 = v15;
      __int16 v29 = 1024;
      int v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s: dirfd = %d", buf, 0x12u);
    }

    *__error() = v13;
    *(_DWORD *)(a1 + 112) = sub_10003A9F4(&v22);
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        id v16 = strdup((const char *)__s1);
        if (v16) {
          break;
        }
        __os_temporary_resource_shortage();
      }
    }

    else
    {
      id v16 = strdup((const char *)__s1);
      if (!v16) {
        sub_10003E9D0((const char *)__s1, v23, buf);
      }
    }

    uint64_t v3 = 0LL;
    *(void *)(a1 + 120) = v16;
  }

  if (v22 != -1 && close(v22) == -1) {
    sub_10003E3CC(v23, buf);
  }
  if ((_DWORD)v3)
  {
    int v17 = *(const char **)(a1 + 56);
    int v18 = *__error();
    int v19 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = "[anonymous]";
      if (v17) {
        id v20 = v17;
      }
      *(_DWORD *)__int128 buf = 136446466;
      int v28 = v20;
      __int16 v29 = 1024;
      int v30 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to make stage directory: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v18;
  }

  return cryptex_set_error(a1, v3);
}

uint64_t sub_10000FA4C(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_10003C818(a1, 0x28uLL);
  v6[3] = a2;
  v6[4] = a3;
  cryptex_async_f(a1, v6, sub_10000FA9C);
  return cryptex_activate(a1);
}

uint64_t sub_10000FA9C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = *a1;
  int error = cryptex_get_error(*a1);
  if (error)
  {
    int v4 = error;
    int v5 = *(const char **)(v2 + 56);
    int v6 = *__error();
    uint64_t v7 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = "[anonymous]";
      if (v5) {
        int v8 = v5;
      }
      *(_DWORD *)__int128 buf = 136446466;
      v126 = v8;
      __int16 v127 = 1024;
      LODWORD(v12_Block_object_dispose(va, 8) = v4;
      int v9 = "%{public}s: initialization failed: %{darwin.errno}d";
      goto LABEL_119;
    }

    goto LABEL_120;
  }

  v96 = v1;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  int v4 = -1;
  do
  {
    uint64_t v12 = *(void *)((char *)&cryptex_asset_types + v10);
    uint64_t v13 = *(void *)(*(void *)(v2 + 96) + v10 + 64);
    if (v13)
    {
      if (*(_UNKNOWN **)(v13 + 8) == &_cryptex_asset_type_im4m || (*(_BYTE *)(v2 + 80) & 1) == 0)
      {
        int v14 = *(const char **)(v2 + 56);
        int v15 = *__error();
        id v16 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v17 = "[anonymous]";
          if (v14) {
            int v17 = v14;
          }
          uint64_t v18 = *(void *)(*(void *)(v13 + 8) + 40LL);
          *(_DWORD *)__int128 buf = 136446466;
          v126 = v17;
          __int16 v127 = 2080;
          uint64_t v128 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s: copying asset: %s", buf, 0x16u);
        }

        *__error() = v15;
        uint64_t v19 = cryptex_asset_copy(v13);
        *(void *)&v99.st_dev = v19;
        int v20 = openat(*(_DWORD *)(v2 + 112), *(const char **)(*(void *)(v13 + 8) + 40LL), 514, 438LL);
        *(_DWORD *)v113 = v20;
        if (v20 < 0)
        {
          int v4 = *__error();
          __int128 v44 = *(const char **)(v2 + 56);
          int v45 = *__error();
          __int16 v46 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136446466;
            int v47 = "[anonymous]";
            if (v44) {
              int v47 = v44;
            }
            v126 = v47;
            __int16 v127 = 1024;
            LODWORD(v12_Block_object_dispose(va, 8) = v4;
            int v48 = v46;
            id v49 = "%{public}s: openat: %{darwin.errno}d";
            goto LABEL_49;
          }
        }

        else
        {
          int v21 = v20;
          if (lseek(*(_DWORD *)(v13 + 16), 0LL, 0) == -1) {
            sub_10003EAB4(&v112, buf);
          }
          if ((fcopyfile(*(_DWORD *)(v13 + 16), v21, 0LL, 0x100000Fu) & 0x80000000) == 0)
          {
            if (lseek(v21, 0LL, 0) == -1) {
              sub_10003EAB4(&v112, buf);
            }
            int v22 = *(os_log_s **)(v2 + 72);
            bzero(buf, 0x400uLL);
            memset(&v112, 0, sizeof(v112));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              if (fstat(v21, &v112) == -1)
              {
                int v56 = *__error();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  int v57 = *__error();
                  *(_DWORD *)v100 = 136315650;
                  v101 = "fd_copy";
                  __int16 v102 = 1024;
                  int v103 = v21;
                  __int16 v104 = 1024;
                  LODWORD(v105) = v57;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  v100,  0x18u);
                }

                *__error() = v56;
              }

              else
              {
                if (fcntl(v21, 50, buf))
                {
                  unint64_t v23 = __error();
                  uint64_t v24 = strerror(*v23);
                  snprintf((char *)buf, 0x400uLL, "[%s]", v24);
                }

                unint64_t v25 = ((unint64_t)v112.st_mode >> 12) ^ 8;
                uint64_t v26 = "[unknown]";
                if ((_DWORD)v25 != 15) {
                  uint64_t v26 = off_100055B38[v25];
                }
                __int16 v27 = (void *)os_flagset_copy_string(&unk_100055738, v112.st_flags);
                int v28 = *__error();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v100 = 136316418;
                  v101 = "fd_copy";
                  __int16 v102 = 1024;
                  int v103 = v21;
                  __int16 v104 = 2080;
                  v105 = v26;
                  __int16 v106 = 2048;
                  off_t st_size = v112.st_size;
                  __int16 v108 = 2080;
                  v109 = v27;
                  __int16 v110 = 2080;
                  v111 = buf;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  v100,  0x3Au);
                }

                *__error() = v28;
                free(v27);
              }
            }

            *(_DWORD *)(v19 + 16) = claimfd_np(v113, 0LL, 0LL);
            cryptex_core_set_asset(*(void *)(v2 + 104), &v99);
            int v4 = 0;
            uint64_t v19 = *(void *)&v99.st_dev;
LABEL_65:
            cryptex_asset_destroy(v19);
            if (v4)
            {
              v78 = *(const char **)(v2 + 56);
              int v88 = *__error();
              v89 = *(os_log_s **)(v2 + 72);
              if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              {
                v79 = "[anonymous]";
                if (v78) {
                  v79 = v78;
                }
                uint64_t v80 = *(void *)(v12 + 40);
                *(_DWORD *)__int128 buf = 136446722;
                v126 = v79;
                __int16 v127 = 2080;
                uint64_t v128 = v80;
                __int16 v129 = 1024;
                int v130 = v4;
                v81 = "%{public}s: copy asset: %s: %{darwin.errno}d";
                goto LABEL_112;
              }

              goto LABEL_114;
            }

LABEL_68:
            int v4 = 0;
            ++v11;
            goto LABEL_69;
          }

          int v4 = *__error();
          v50 = *(const char **)(v2 + 56);
          int v45 = *__error();
          uint64_t v51 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136446466;
            int v52 = "[anonymous]";
            if (v50) {
              int v52 = v50;
            }
            v126 = v52;
            __int16 v127 = 1024;
            LODWORD(v12_Block_object_dispose(va, 8) = v4;
            int v48 = v51;
            id v49 = "%{public}s: fcopyfile: %{darwin.errno}d";
LABEL_49:
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, v49, buf, 0x12u);
          }
        }

        *__error() = v45;
        goto LABEL_65;
      }

      bzero(&v112, 0x400uLL);
      bzero(v100, 0x400uLL);
      uint64_t v98 = 0LL;
      int v97 = -1;
      __int16 v34 = *(const char **)(v2 + 56);
      int v35 = *__error();
      NSFileAttributeKey v36 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        int v37 = "[anonymous]";
        if (v34) {
          int v37 = v34;
        }
        uint64_t v38 = *(void *)(*(void *)(v13 + 8) + 40LL);
        *(_DWORD *)__int128 buf = 136446466;
        v126 = v37;
        __int16 v127 = 2080;
        uint64_t v128 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "%{public}s: symlinking asset: %s",  buf,  0x16u);
      }

      *__error() = v35;
      int v39 = realpath_np(*(unsigned int *)(v13 + 16), &v112);
      if (v39)
      {
        int v4 = v39;
        int v40 = *(const char **)(v2 + 56);
        int v41 = *__error();
        __int128 v42 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136446466;
          __int128 v43 = "[anonymous]";
          if (v40) {
            __int128 v43 = v40;
          }
LABEL_55:
          v126 = v43;
          __int16 v127 = 1024;
          LODWORD(v12_Block_object_dispose(va, 8) = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%{public}s: realpath_np: %{darwin.errno}d",  buf,  0x12u);
          goto LABEL_56;
        }

        goto LABEL_56;
      }

      int v53 = realpath_np(*(unsigned int *)(v2 + 112), v100);
      if (v53)
      {
        int v4 = v53;
        os_log_type_t v54 = *(const char **)(v2 + 56);
        int v41 = *__error();
        __int128 v42 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136446466;
          __int128 v43 = "[anonymous]";
          if (v54) {
            __int128 v43 = v54;
          }
          goto LABEL_55;
        }

LABEL_56:
        uint64_t v55 = 0LL;
        *__error() = v41;
        goto LABEL_57;
      }

      __strcat_chk(v100, "/", 1024LL);
      __strncat_chk(v100, *(void *)(*(void *)(v13 + 8) + 40LL), 4LL, 1024LL);
      uint64_t v55 = cryptex_asset_copy(v13);
      uint64_t v98 = v55;
      if (symlink((const char *)&v112, (const char *)v100))
      {
        int v4 = *__error();
        v58 = *(const char **)(v2 + 56);
        int v59 = *__error();
        uint64_t v60 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136446466;
          id v61 = "[anonymous]";
          if (v58) {
            id v61 = v58;
          }
          v126 = v61;
          __int16 v127 = 1024;
          LODWORD(v12_Block_object_dispose(va, 8) = v4;
          __int16 v62 = v60;
          id v63 = "%{public}s: symlink: %{darwin.errno}d";
LABEL_76:
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, v63, buf, 0x12u);
        }
      }

      else
      {
        int v64 = open((const char *)v100, 0, 438LL);
        int v97 = v64;
        if ((v64 & 0x80000000) == 0)
        {
          int v65 = v64;
          if (lseek(v64, 0LL, 0) == -1) {
            sub_10003EAB4(&v99, buf);
          }
          v66 = *(os_log_s **)(v2 + 72);
          bzero(buf, 0x400uLL);
          memset(&v99, 0, sizeof(v99));
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            if (fstat(v65, &v99) == -1)
            {
              int v76 = *__error();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                int v77 = *__error();
                *(_DWORD *)v113 = 136315650;
                v114 = "fd_symlink";
                __int16 v115 = 1024;
                int v116 = v65;
                __int16 v117 = 1024;
                LODWORD(v11_Block_object_dispose(va, 8) = v77;
                _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  v113,  0x18u);
              }

              *__error() = v76;
            }

            else
            {
              if (fcntl(v65, 50, buf))
              {
                __int16 v67 = __error();
                uint64_t v68 = strerror(*v67);
                snprintf((char *)buf, 0x400uLL, "[%s]", v68);
              }

              unint64_t v69 = ((unint64_t)v99.st_mode >> 12) ^ 8;
              v70 = "[unknown]";
              if ((_DWORD)v69 != 15) {
                v70 = off_100055B38[v69];
              }
              v71 = (void *)os_flagset_copy_string(&unk_100055738, v99.st_flags);
              int v72 = *__error();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v113 = 136316418;
                v114 = "fd_symlink";
                __int16 v115 = 1024;
                int v116 = v65;
                __int16 v117 = 2080;
                v118 = v70;
                __int16 v119 = 2048;
                off_t v120 = v99.st_size;
                __int16 v121 = 2080;
                v122 = v71;
                __int16 v123 = 2080;
                v124 = buf;
                _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  v113,  0x3Au);
              }

              *__error() = v72;
              free(v71);
            }
          }

          *(_DWORD *)(v55 + 16) = claimfd_np(&v97, 0LL, 0LL);
          cryptex_core_set_asset(*(void *)(v2 + 104), &v98);
          int v4 = 0;
          uint64_t v55 = v98;
LABEL_57:
          cryptex_asset_destroy(v55);
          if (v97 != -1 && close(v97) == -1) {
            sub_10003E3CC(&v99, buf);
          }
          if (v4)
          {
            v87 = *(const char **)(v2 + 56);
            int v88 = *__error();
            v89 = *(os_log_s **)(v2 + 72);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              v91 = "[anonymous]";
              if (v87) {
                v91 = v87;
              }
              uint64_t v92 = *(void *)(v12 + 40);
              *(_DWORD *)__int128 buf = 136446722;
              v126 = v91;
              __int16 v127 = 2080;
              uint64_t v128 = v92;
              __int16 v129 = 1024;
              int v130 = v4;
              v81 = "%{public}s: symlink asset: %s: %{darwin.errno}d";
LABEL_112:
              v85 = v89;
              uint32_t v86 = 28;
LABEL_113:
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, v81, buf, v86);
            }

    *__error() = v21;
    int v9 = sub_100008BC0();
    goto LABEL_57;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = "[anonymous]";
    if (v4) {
      uint64_t v7 = v4;
    }
    *(_DWORD *)__int128 buf = 136446466;
    *(void *)&uint8_t buf[4] = v7;
    v70 = 1024;
    LODWORD(v71) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "%{public}s: msg recv failed: %{darwin.errno}d",  buf,  0x12u);
  }

  int v8 = 0LL;
LABEL_7:
  *__error() = v5;
  int v9 = sub_100008BC0();
  if (v3 == 36)
  {
LABEL_63:
    if (!v9) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }

LABEL_114:
            id v1 = v96;
            *__error() = v88;
            goto LABEL_115;
          }

          goto LABEL_68;
        }

        int v4 = *__error();
        BOOL v73 = *(const char **)(v2 + 56);
        int v59 = *__error();
        __int16 v74 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136446466;
          v75 = "[anonymous]";
          if (v73) {
            v75 = v73;
          }
          v126 = v75;
          __int16 v127 = 1024;
          LODWORD(v12_Block_object_dispose(va, 8) = v4;
          __int16 v62 = v74;
          id v63 = "%{public}s: open: %{darwin.errno}d";
          goto LABEL_76;
        }
      }

      *__error() = v59;
      goto LABEL_57;
    }

    __int16 v29 = *(const char **)(v2 + 56);
    int v30 = *__error();
    __int16 v31 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v32 = *(void *)(v12 + 40);
      __int16 v33 = "[anonymous]";
      if (v29) {
        __int16 v33 = v29;
      }
      *(_DWORD *)__int128 buf = 136446466;
      v126 = v33;
      __int16 v127 = 2080;
      uint64_t v128 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%{public}s: asset not present; skipping: %s",
        buf,
        0x16u);
    }

    *__error() = v30;
LABEL_69:
    v10 += 8LL;
  }

  while (v10 != 96);
  if (!v11)
  {
    v82 = *(const char **)(v2 + 56);
    int v88 = *__error();
    v83 = *(os_log_s **)(v2 + 72);
    int v4 = 2;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v84 = "[anonymous]";
      if (v82) {
        v84 = v82;
      }
      *(_DWORD *)__int128 buf = 136446466;
      v126 = v84;
      __int16 v127 = 1024;
      LODWORD(v12_Block_object_dispose(va, 8) = 2;
      v81 = "%{public}s: empty core: %{darwin.errno}d";
      v85 = v83;
      uint32_t v86 = 18;
      goto LABEL_113;
    }

    goto LABEL_114;
  }

  id v1 = v96;
  if (!v4) {
    goto LABEL_121;
  }
LABEL_115:
  v93 = *(const char **)(v2 + 56);
  int v6 = *__error();
  uint64_t v7 = *(os_log_s **)(v2 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v94 = "[anonymous]";
    if (v93) {
      v94 = v93;
    }
    *(_DWORD *)__int128 buf = 136446466;
    v126 = v94;
    __int16 v127 = 1024;
    LODWORD(v12_Block_object_dispose(va, 8) = v4;
    int v9 = "%{public}s: copy assets failed: %{darwin.errno}d";
LABEL_119:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
  }

LABEL_120:
  *__error() = v6;
LABEL_121:
  *((_DWORD *)v1 + 2) = v4;
  return cryptex_target_async_f(v2, v1, sub_10001089C);
}

void sub_10001089C(void **a1)
{
}

uint64_t sub_1000108D4(uint64_t result)
{
  switch(result)
  {
    case 0xE00002BD:
    case 0xE00002BE:
    case 0xE00002C8:
    case 0xE00002DE:
      uint64_t result = 12LL;
      break;
    case 0xE00002BF:
      uint64_t result = 72LL;
      break;
    case 0xE00002C0:
    case 0xE00002D7:
    case 0xE00002D9:
    case 0xE00002DA:
      uint64_t result = 19LL;
      break;
    case 0xE00002C1:
      uint64_t result = 1LL;
      break;
    case 0xE00002C2:
      uint64_t result = 22LL;
      break;
    case 0xE00002C3:
    case 0xE00002C4:
    case 0xE00002C5:
    case 0xE00002CC:
      uint64_t result = 35LL;
      break;
    case 0xE00002C6:
      uint64_t result = 94LL;
      break;
    case 0xE00002C7:
      uint64_t result = 45LL;
      break;
    case 0xE00002C9:
    case 0xE00002CA:
    case 0xE00002D3:
    case 0xE00002D4:
      uint64_t result = 5LL;
      break;
    case 0xE00002CB:
    case 0xE00002DC:
    case 0xE00002DF:
    case 0xE00002E0:
    case 0xE00002E3:
    case 0xE00002E4:
    case 0xE00002E5:
    case 0xE00002E6:
    case 0xE00002E7:
    case 0xE00002E8:
    case 0xE00002EA:
      goto LABEL_10;
    case 0xE00002CD:
      uint64_t result = 9LL;
      break;
    case 0xE00002CE:
    case 0xE00002CF:
    case 0xE00002E2:
      uint64_t result = 13LL;
      break;
    case 0xE00002D0:
      uint64_t result = 14LL;
      break;
    case 0xE00002D1:
    case 0xE00002E9:
      uint64_t result = 83LL;
      break;
    case 0xE00002D2:
    case 0xE00002D5:
      uint64_t result = 16LL;
      break;
    case 0xE00002D6:
      uint64_t result = 60LL;
      break;
    case 0xE00002D8:
      uint64_t result = 6LL;
      break;
    case 0xE00002DB:
      uint64_t result = 28LL;
      break;
    case 0xE00002DD:
      uint64_t result = 17LL;
      break;
    case 0xE00002E1:
      uint64_t result = 7LL;
      break;
    case 0xE00002EB:
      uint64_t result = 89LL;
      break;
    default:
      if ((_DWORD)result) {
LABEL_10:
      }
        uint64_t result = 104LL;
      break;
  }

  return result;
}

uint64_t sub_1000109AC(io_object_t *a1, const char *a2)
{
  io_iterator_t iterator = 0;
  uint64_t v2 = 2LL;
  if (a1 && a2)
  {
    if (!IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      io_object_t v6 = IOIteratorNext(iterator);
      if (v6)
      {
        io_object_t v7 = v6;
        while (!IOObjectConformsTo(v7, a2))
        {
          IOObjectRelease(v7);
          io_object_t v7 = IOIteratorNext(iterator);
          if (!v7)
          {
            uint64_t v2 = 2LL;
            goto LABEL_4;
          }
        }

        IOObjectRelease(*a1);
        uint64_t v2 = 0LL;
        *a1 = v7;
      }
    }

uint64_t (*sub_100010A68())(void *a1)
{
  return sub_10000D794;
}

xpc_type_t sub_100010A74(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (!*(void *)(a2 + 24))
  {
    *(void *)__int128 buf = 0LL;
    xpc_object_t v17 = 0LL;
    uint64_t v8 = session_activate_unpack(a2, &v17);
    if ((_DWORD)v8)
    {
      uint64_t v7 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to unpack",  v11,  2u);
      }

      sub_10003A0F8(a2, a3, v7);
      return (xpc_type_t)v7;
    }

    xpc_object_t v5 = v17;
    int v9 = (void *)cryptex_session_core_create_from_xpc(v17);
    uint64_t v7 = sub_10000D794(v9);
    if ((_DWORD)v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to add session core to session list",  v11,  2u);
      }

      uint64_t v10 = 0LL;
    }

    else
    {
      uint64_t v10 = (void *)cryptex_session_core_copy_xpc_object(v9);
      xpc_type_t result = xpc_get_type(v10);
      if (result != (xpc_type_t)&_xpc_type_dictionary) {
        goto LABEL_25;
      }
      *(void *)__int128 buf = v10;
      session_activate_reply_pack(buf, a3);
    }

    sub_10003A0F8(a2, a3, v7);
    if (v9) {
      os_release(v9);
    }
    if (v10) {
      os_release(v10);
    }
    goto LABEL_12;
  }

  xpc_object_t v5 = xpc_array_create(0LL, 0LL);
  xpc_type_t result = xpc_get_type(v5);
  if (result == (xpc_type_t)&_xpc_type_array)
  {
    xpc_object_t v17 = v5;
    uint64_t v7 = session_list_unpack(a2, v11);
    if ((_DWORD)v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "failed to unpack",  buf,  2u);
      }
    }

    else
    {
      *(void *)__int128 buf = _NSConcreteStackBlock;
      uint64_t v13 = 0x40000000LL;
      int v14 = sub_100010CCC;
      int v15 = &unk_100055BE0;
      xpc_object_t v16 = v5;
      sub_10000D3E0(buf);
      session_list_reply_pack(&v17, a3);
    }

    sub_10003A0F8(a2, a3, v7);
LABEL_12:
    if (v5) {
      os_release(v5);
    }
    return (xpc_type_t)v7;
  }

LABEL_25:
  __break(1u);
  return result;
}

void sub_100010CCC(uint64_t a1, uint64_t a2)
{
  int v4 = (void *)cryptex_session_core_copy_xpc_object(a2);
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);
  xpc_release(v4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a2 + 96);
    int v6 = 136315138;
    uint64_t v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "callback %s",  (uint8_t *)&v6,  0xCu);
  }

void sub_100010D98(void *a1)
{
  id v1 = a1;
  xpc_object_t xdict = xpc_dictionary_create_reply(v1);
  uint64_t int64 = xpc_dictionary_get_uint64(v1, "user");

  id v3 = sub_10001EC08(uint64);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4) {
    xpc_dictionary_set_value(xdict, "endpoint", v4);
  }
  xpc_dictionary_send_reply(xdict);
}

uint64_t sub_100010EA0(uint64_t a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___OS_codex);
  uint64_t result = _os_object_alloc(v2, a1);
  if (!result) {
    sub_10003EB24();
  }
  return result;
}

uint64_t sub_100010F5C(uint64_t a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___OS_daemon);
  uint64_t result = _os_object_alloc(v2, a1);
  if (!result) {
    sub_10003EBA0();
  }
  return result;
}

uint64_t sub_100011018(uint64_t a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___OS_proc);
  uint64_t result = _os_object_alloc(v2, a1);
  if (!result) {
    sub_10003EC1C();
  }
  return result;
}

uint64_t sub_1000110D4(uint64_t a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___OS_protex);
  uint64_t result = _os_object_alloc(v2, a1);
  if (!result) {
    sub_10003EC98();
  }
  return result;
}

uint64_t sub_100011190(uint64_t a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___OS_quire);
  uint64_t result = _os_object_alloc(v2, a1);
  if (!result) {
    sub_10003ED14();
  }
  return result;
}

uint64_t sub_10001124C(uint64_t a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___OS_resource);
  uint64_t result = _os_object_alloc(v2, a1);
  if (!result) {
    sub_10003ED90();
  }
  return result;
}

uint64_t sub_100011308(uint64_t a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___OS_view);
  uint64_t result = _os_object_alloc(v2, a1);
  if (!result) {
    sub_10003EE0C();
  }
  return result;
}

  ;
}

uint64_t sub_1000113B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(v8, v5, v6, 80LL, a5, v7, 16LL);
}

double sub_1000113CC(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

  ;
}

void sub_100011404(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 272);
  if (v2) {
    os_release(v2);
  }
  sub_10003A9CC(a1 + 16);
}

uint64_t sub_100011440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100011018(312LL);
  *(void *)(v4 + 40) = a2;
  __int128 v5 = *(_OWORD *)(a1 + 344);
  *(_OWORD *)(v4 + 280) = *(_OWORD *)(a1 + 328);
  *(_OWORD *)(v4 + 296) = v5;
  sub_10003A6E4(v4 + 16, (int)"com.apple.security.cryptexd", "proc");
  return v4;
}

uint64_t sub_1000114A4(uint64_t a1)
{
  kern_return_t v13;
  unsigned int v14;
  const char *v15;
  int v16;
  os_log_s *v17;
  const char *v18;
  os_log_s *v19;
  const char *v20;
  unsigned int v21;
  const char *v22;
  int v23;
  os_log_s *v24;
  unsigned int v25;
  const char *v26;
  int v27;
  const char *v28;
  int v29;
  os_log_s *v30;
  const char *v31;
  int *v32;
  int v33;
  const char *v34;
  int v35;
  os_log_s *v36;
  const char *v37;
  BOOL v38;
  kern_return_t v39;
  unsigned int v40;
  const char *v41;
  os_log_s *v42;
  const char *v43;
  int v44;
  const char *v45;
  int v46;
  os_log_s *v47;
  const char *v48;
  int v49;
  int *v50;
  char *v51;
  char *v52;
  const char *v53;
  int v54;
  os_log_s *v55;
  const char *v56;
  const char *v57;
  int v58;
  os_log_s *v59;
  const char *v60;
  const char *v62;
  int v63;
  const char *v64;
  os_log_s *v65;
  const char *v66;
  BOOL v67;
  char *v68;
  int v69;
  const char *v70;
  void *v71;
  void *v72;
  const char *v73;
  int v74;
  os_log_s *v75;
  const char *v76;
  char *v77;
  const char *v78;
  int v79;
  os_log_s *v80;
  const char *v81;
  const char *v82;
  char *v83;
  int *v84;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;
  mach_port_name_t tn;
  void *v88;
  void *v89;
  audit_token_t buf;
  _OWORD buffer[3];
  char v92[152];
  char __str[608];
  int v88 = 0LL;
  v89 = 0LL;
  bzero(__str, 0x260uLL);
  int v2 = proc_pidinfo(*(_DWORD *)(a1 + 300), 18, 0LL, (void *)(a1 + 80), 192);
  if (v2 != 192)
  {
    __int128 v44 = v2;
    uint64_t v4 = *__error();
    int v45 = *(const char **)(a1 + 16);
    __int16 v46 = *__error();
    int v47 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      int v48 = "[anonymous]";
      id v49 = *(_DWORD *)(a1 + 300);
      if (v45) {
        int v48 = v45;
      }
      LODWORD(buffer[0]) = 136446978;
      *(void *)((char *)buffer + 4) = v48;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v49;
      WORD1(buffer[1]) = 1024;
      DWORD1(buffer[1]) = v44;
      WORD4(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 10) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%{public}s: proc_pidinfo[%d]: ret = %d: %{darwin.errno}d",  (uint8_t *)buffer,  0x1Eu);
    }

    v50 = __error();
    uint64_t v51 = 0LL;
    goto LABEL_52;
  }

  v84 = (int *)(a1 + 280);
  __strlcpy_chk(a1 + 48, a1 + 128, 16LL, 16LL);
  uint64_t v3 = 38LL;
  snprintf(__str, 0x26uLL, "%s.%d@%d", (const char *)(a1 + 48), *(_DWORD *)(a1 + 300), *(_DWORD *)(a1 + 308));
  sub_10003A714(a1 + 16, __str);
  uint64_t v4 = 0xFFFFFFFFLL;
  int v5 = *(_DWORD *)(a1 + 96);
  uint64_t v6 = 1LL;
  while (1)
  {
    uint64_t v7 = v3;
    tn = 0;
    memset(v92, 0, 144);
    memset(buffer, 0, sizeof(buffer));
    memset(&task_info_out, 0, sizeof(task_info_out));
    task_info_outCnt = 8;
    uint64_t v8 = *(const char **)(a1 + 16);
    int v9 = *__error();
    uint64_t v10 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      buf.val[0] = 136446722;
      uint64_t v11 = "[anonymous]";
      if (v8) {
        uint64_t v11 = v8;
      }
      *(void *)&buf.val[1] = v11;
      LOWORD(buf.val[3]) = 2048;
      *(void *)((char *)&buf.val[3] + 2) = v6;
      HIWORD(buf.val[5]) = 1024;
      buf.val[6] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%{public}s: examining ancestor[%lu]: %d",  (uint8_t *)&buf,  0x1Cu);
    }

    *__error() = v9;
    int v12 = proc_pidinfo(v5, 18, 0LL, buffer, 192);
    if (v12 == 192)
    {
      if (v5)
      {
        uint64_t v13 = task_name_for_pid(mach_task_self_, v5, &tn);
        if (v13)
        {
          int v14 = v13;
          int v15 = *(const char **)(a1 + 16);
          xpc_object_t v16 = *__error();
          xpc_object_t v17 = *(os_log_s **)(a1 + 32);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            buf.val[0] = 136446722;
            uint64_t v18 = "[anonymous]";
            if (v15) {
              uint64_t v18 = v15;
            }
            *(void *)&buf.val[1] = v18;
            LOWORD(buf.val[3]) = 1024;
            *(unsigned int *)((char *)&buf.val[3] + 2) = v14;
            HIWORD(buf.val[4]) = 1024;
            buf.val[5] = 3;
            uint64_t v19 = v17;
            int v20 = "%{public}s: task_name_for_pid: %#x: %{darwin.errno}d";
LABEL_39:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&buf, 0x18u);
            goto LABEL_40;
          }

          goto LABEL_40;
        }

        int v39 = task_info(tn, 0xFu, (task_info_t)&task_info_out, &task_info_outCnt);
        if (v39)
        {
          int v40 = v39;
          int v41 = *(const char **)(a1 + 16);
          xpc_object_t v16 = *__error();
          __int128 v42 = *(os_log_s **)(a1 + 32);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            buf.val[0] = 136446722;
            __int128 v43 = "[anonymous]";
            if (v41) {
              __int128 v43 = v41;
            }
            *(void *)&buf.val[1] = v43;
            LOWORD(buf.val[3]) = 1024;
            *(unsigned int *)((char *)&buf.val[3] + 2) = v40;
            HIWORD(buf.val[4]) = 1024;
            buf.val[5] = 3;
            uint64_t v19 = v42;
            int v20 = "%{public}s: task_info: %#x: %{darwin.errno}d";
            goto LABEL_39;
          }

LABEL_40:
          *__error() = v16;
          uint64_t v4 = 3LL;
          __int16 v27 = 11;
          goto LABEL_41;
        }

        __int128 buf = task_info_out;
        __int16 v33 = audit_token_to_pidversion(&buf);
      }

      else
      {
        int v28 = *(const char **)(a1 + 16);
        __int16 v29 = *__error();
        int v30 = *(os_log_s **)(a1 + 32);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          __int16 v31 = "[anonymous]";
          if (v28) {
            __int16 v31 = v28;
          }
          buf.val[0] = 136446210;
          *(void *)&buf.val[1] = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "%{public}s: hit kernel_task; assuming ppid version of 0",
            (uint8_t *)&buf,
            0xCu);
        }

        uint64_t v32 = __error();
        __int16 v33 = 0;
        dirent *v32 = v29;
      }

      snprintf(&__str[v7], 0x26uLL, "%s.%d.%d", v92, v5, v33);
      __int16 v34 = *(const char **)(a1 + 16);
      int v35 = *__error();
      NSFileAttributeKey v36 = *(os_log_s **)(a1 + 32);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        buf.val[0] = 136446722;
        int v37 = "[anonymous]";
        if (v34) {
          int v37 = v34;
        }
        *(void *)&buf.val[1] = v37;
        LOWORD(buf.val[3]) = 2048;
        *(void *)((char *)&buf.val[3] + 2) = v6;
        HIWORD(buf.val[5]) = 2080;
        *(void *)&buf.val[6] = &__str[v7];
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "%{public}s: setting ancestor[%lu]: %s",  (uint8_t *)&buf,  0x20u);
      }

      *__error() = v35;
      uint64_t v38 = v5 == 0;
      int v5 = v5 ? LODWORD(buffer[1]) : 0;
      __int16 v27 = v38 ? 11 : 0;
    }

    else
    {
      int v21 = v12;
      uint64_t v4 = *__error();
      int v22 = *(const char **)(a1 + 16);
      unint64_t v23 = *__error();
      uint64_t v24 = *(os_log_s **)(a1 + 32);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        unint64_t v25 = *(_DWORD *)(a1 + 300);
        uint64_t v26 = "[anonymous]";
        if (v22) {
          uint64_t v26 = v22;
        }
        buf.val[0] = 136446978;
        *(void *)&buf.val[1] = v26;
        LOWORD(buf.val[3]) = 1024;
        *(unsigned int *)((char *)&buf.val[3] + 2) = v25;
        HIWORD(buf.val[4]) = 1024;
        buf.val[5] = v21;
        LOWORD(buf.val[6]) = 1024;
        *(unsigned int *)((char *)&buf.val[6] + 2) = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s: proc_pidinfo[%d]: ret = %d: %{darwin.errno}d",  (uint8_t *)&buf,  0x1Eu);
      }

      *__error() = v23;
      __int16 v27 = 6;
    }

        *__error() = v27;
        goto LABEL_41;
      }

      __int128 v42 = codex_install_unpack(a2, &v87);
      if (!(_DWORD)v42)
      {
        if (*((void *)&v88 + 1) >= 0xCuLL)
        {
          int v48 = (const char *)a1[7];
          id v49 = *__error();
          v50 = (os_log_s *)a1[9];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v51 = "[anonymous]";
            if (v48) {
              uint64_t v51 = v48;
            }
            *(_DWORD *)__int128 buf = 136446722;
            v93 = v51;
            v94 = 2048;
            v95 = (const char *)*((void *)&v88 + 1);
            v96 = 1024;
            LODWORD(v97) = 34;
            int v52 = "%{public}s: dmg type index invalid: %lld: %{darwin.errno}d";
LABEL_59:
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v52, buf, 0x1Cu);
            goto LABEL_60;
          }

          goto LABEL_60;
        }

        int v53 = v89;
        if ((unint64_t)v89 >= 3)
        {
          os_log_type_t v54 = (const char *)a1[7];
          id v49 = *__error();
          v50 = (os_log_s *)a1[9];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            uint64_t v55 = "[anonymous]";
            if (v54) {
              uint64_t v55 = v54;
            }
            *(_DWORD *)__int128 buf = 136446722;
            v93 = v55;
            v94 = 2048;
            v95 = (const char *)v89;
            v96 = 1024;
            LODWORD(v97) = 34;
            int v52 = "%{public}s: authentication type invalid: %lld: %{darwin.errno}d";
            goto LABEL_59;
          }

LABEL_54:
  int v52 = (char *)calloc(1uLL, 0x100uLL);
  if (!v52) {
    sub_10003EE88(&task_info_out, buffer);
  }
  uint64_t v51 = v52;
  do
  {
    snprintf(v51, 0x100uLL, "%s->%s", v51, &__str[v7]);
    v7 -= 38LL;
  }

  while (v7);
  int v53 = *(const char **)(a1 + 16);
  os_log_type_t v54 = *__error();
  uint64_t v55 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    int v56 = "[anonymous]";
    if (v53) {
      int v56 = v53;
    }
    LODWORD(buffer[0]) = 136446466;
    *(void *)((char *)buffer + 4) = v56;
    WORD6(buffer[0]) = 2080;
    *(void *)((char *)buffer + 14) = v51;
    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEBUG,  "%{public}s: ancestry = %s",  (uint8_t *)buffer,  0x16u);
  }

  *__error() = v54;
  uint64_t v4 = sub_100011F54(v84, 11LL, (int8x8_t **)&v89);
  int v57 = *(const char **)(a1 + 16);
  v58 = *__error();
  int v59 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      uint64_t v60 = "[anonymous]";
      if (v57) {
        uint64_t v60 = v57;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v60;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%{public}s: copy csblob [csid]: %{darwin.errno}d",  (uint8_t *)buffer,  0x12u);
    }

    *__error() = v58;
    goto LABEL_68;
  }

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    __int16 v62 = "[anonymous]";
    if (v57) {
      __int16 v62 = v57;
    }
    id v63 = *((_DWORD *)v89 + 1) - 8;
    LODWORD(buffer[0]) = 136446722;
    *(void *)((char *)buffer + 4) = v62;
    WORD6(buffer[0]) = 1040;
    *(_DWORD *)((char *)buffer + 14) = v63;
    WORD1(buffer[1]) = 2096;
    *(void *)((char *)&buffer[1] + 4) = (char *)v89 + 8;
    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEBUG,  "%{public}s: identity blob = %.*P",  (uint8_t *)buffer,  0x1Cu);
  }

  *__error() = v58;
  uint64_t v4 = sub_100011F54(v84, 7LL, (int8x8_t **)&v88);
  int v64 = *(const char **)(a1 + 16);
  __int16 v46 = *__error();
  int v65 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = "[anonymous]";
      if (v64) {
        v66 = v64;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v66;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "%{public}s: copy csblob [entitlements]: %{darwin.errno}d",  (uint8_t *)buffer,  0x12u);
    }

    v50 = __error();
LABEL_52:
    const char *v50 = v46;
    goto LABEL_68;
  }

  __int16 v67 = os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG);
  uint64_t v68 = (char *)v88;
  if (v67)
  {
    unint64_t v69 = *((_DWORD *)v88 + 1);
    v70 = "[anonymous]";
    if (v64) {
      v70 = v64;
    }
    LODWORD(buffer[0]) = 136446722;
    *(void *)((char *)buffer + 4) = v70;
    WORD6(buffer[0]) = 1040;
    *(_DWORD *)((char *)buffer + 14) = v69 - 8;
    WORD1(buffer[1]) = 2096;
    *(void *)((char *)&buffer[1] + 4) = (char *)v88 + 8;
    _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEBUG,  "%{public}s: entitlements blob = %.*P",  (uint8_t *)buffer,  0x1Cu);
  }

  *__error() = v46;
  v71 = (void *)xpc_create_from_plist(v68 + 8);
  int v72 = v71;
  if (!v71 || xpc_get_type(v71) != (xpc_type_t)&_xpc_type_dictionary)
  {
    BOOL v73 = *(const char **)(a1 + 16);
    __int16 v74 = *__error();
    v75 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      int v76 = "[anonymous]";
      if (v73) {
        int v76 = v73;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v76;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = 90;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_ERROR,  "%{public}s: entitlements not a dictionary: %{darwin.errno}d",  (uint8_t *)buffer,  0x12u);
    }

    *__error() = v74;
    uint64_t v4 = 90LL;
    if (!v72) {
      goto LABEL_68;
    }
LABEL_102:
    os_release(v72);
    goto LABEL_68;
  }

  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
  {
    int v77 = xpc_copy_description(v72);
    v78 = *(const char **)(a1 + 16);
    v79 = *__error();
    uint64_t v80 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      v81 = "[anonymous]";
      if (v78) {
        v81 = v78;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v81;
      WORD6(buffer[0]) = 2080;
      *(void *)((char *)buffer + 14) = v77;
      _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEBUG,  "%{public}s: entitlements = %s",  (uint8_t *)buffer,  0x16u);
    }

    *__error() = v79;
    free(v77);
  }

  *(void *)(a1 + 64) = v51;
  v82 = (char *)v89 + 8;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v83 = strdup(v82);
      if (v83) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    v83 = strdup(v82);
    if (!v83) {
      sub_10003EF2C(v82, &task_info_out, buffer);
    }
  }

  *(void *)(a1 + 72) = v83;
  uint64_t v51 = 0LL;
  uint64_t v4 = 0LL;
  *(void *)(a1 + 272) = os_retain(v72);
  if (v72) {
    goto LABEL_102;
  }
LABEL_68:
  free(v51);
  free(v88);
  free(v89);
  return v4;
}

uint64_t sub_100011F54(int *a1, uint64_t a2, int8x8_t **a3)
{
  *(void *)&__int128 v6 = *(void *)(a1 + 1);
  DWORD2(v6) = v6;
  HIDWORD(v6) = a1[4];
  int v16 = *a1;
  __int128 v17 = v6;
  unsigned int v15 = *(void *)(a1 + 5);
  uint64_t v18 = *(void *)(a1 + 5);
  int v19 = a1[7];
  uint64_t v7 = (int8x8_t *)malloc(0x408uLL);
  if (!v7) {
    sub_10003EFF0(&v20, v21);
  }
  uint64_t v8 = v7;
  if ((csops_audittoken(v15, a2, v7, 1032LL, &v16) & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v9 = *__error();
  if (v9)
  {
    if (v9 != 34) {
      goto LABEL_8;
    }
    size_t v10 = bswap32(v8->u32[1]);
    uint64_t v11 = (int8x8_t *)realloc(v8, v10);
    if (!v11)
    {
      int v12 = __error();
      goto LABEL_11;
    }

    uint64_t v8 = v11;
    if (csops_audittoken(a1[5], a2, v11, v10, &v16))
    {
LABEL_8:
      int v12 = __error();
      uint64_t v8 = 0LL;
LABEL_11:
      uint64_t v13 = *v12;
      goto LABEL_12;
    }
  }

  uint64_t v13 = 0LL;
  *uint64_t v8 = vrev32_s8(*v8);
  *a3 = v8;
  uint64_t v8 = 0LL;
LABEL_12:
  free(v8);
  return v13;
}

BOOL sub_1000120BC(uint64_t a1, const char *a2)
{
  return a2 && !xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 272), a2);
}

uint64_t sub_1000120E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(v8, v5, v6, 80LL, a5, v7, 16LL);
}

  ;
}

uint64_t sub_100012124(void *object, uint64_t a2, _BYTE *a3)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v6 = *(void *)(a2 + 24);
  if (v6 == 2)
  {
    uint64_t v8 = (dispatch_queue_t *)sub_100014D14();
    uint64_t v9 = daemon_open_mountable_unpack(a2, &v13);
    if ((_DWORD)v9)
    {
      uint64_t v7 = v9;
      if (!v8) {
        goto LABEL_11;
      }
    }

    else
    {
      uint64_t v11 = sub_10002A130(object, (_BYTE *)a2, a3);
      dispatch_async_f(v8[12], v11, (dispatch_function_t)sub_100012228);
      uint64_t v7 = 36LL;
    }

    os_release(v8);
    if (!object) {
      return v7;
    }
    goto LABEL_12;
  }

  if (v6 == 1)
  {
    uint64_t v7 = 78LL;
    if (!object) {
      return v7;
    }
    goto LABEL_12;
  }

  uint64_t v7 = daemon_version_unpack(a2, &v13);
  if (!(_DWORD)v7)
  {
    uint64_t v12 = *((void *)object + 7);
    daemon_version_reply_pack(&v12, a3);
  }

  sub_10003A0F8(a2, a3, v7);
LABEL_11:
  if (object) {
LABEL_12:
  }
    os_release(object);
  return v7;
}

void sub_100012228(void *a1)
{
  uint64_t v20 = a1;
  uint64_t v2 = *a1;
  uint64_t v3 = sub_100014D14();
  __int128 v44 = 0u;
  memset(v45, 0, sizeof(v45));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  *(_OWORD *)__str = 0u;
  int v18 = 0;
  int v19 = -1;
  uint64_t v4 = sub_100011440(a1[3], 0LL);
  int v5 = sub_1000114A4(v4);
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = (const char *)v3[7];
    int v8 = *__error();
    uint64_t v9 = (os_log_s *)v3[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      size_t v10 = "[anonymous]";
      if (v7) {
        size_t v10 = v7;
      }
      *(_DWORD *)__int128 buf = 136446466;
      int v22 = v10;
      __int16 v23 = 1024;
      LODWORD(v24) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to resolve proc: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v8;
  }

  else
  {
    BOOL v11 = sub_1000120BC(v4, "com.apple.private.security.cryptex.open-mountable");
    if (v11)
    {
      int v6 = v11;
      uint64_t v12 = *(const char **)(v2 + 16);
      int v13 = *__error();
      int v14 = *(os_log_s **)(v2 + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unsigned int v15 = "[anonymous]";
        if (v12) {
          unsigned int v15 = v12;
        }
        uint64_t v16 = *(void *)(v4 + 64);
        uint64_t v17 = *(void *)(v4 + 72);
        *(_DWORD *)__int128 buf = 136447234;
        int v22 = v15;
        __int16 v23 = 2080;
        uint64_t v24 = "com.apple.private.security.cryptex.install";
        __int16 v25 = 2080;
        uint64_t v26 = v16;
        __int16 v27 = 2080;
        uint64_t v28 = v17;
        __int16 v29 = 1024;
        int v30 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}s: proc not entitled for to open mountable: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d",  buf,  0x30u);
      }

      *__error() = v13;
    }

    else
    {
      snprintf(__str, 0xFFuLL, "%s.XXXXXX", (const char *)(v4 + 48));
      int v6 = sub_1000153AC((uint64_t)v3, (uint64_t)&unk_100055D80, __str, &v19);
      if (!v6)
      {
        int v18 = v19;
        daemon_open_mountable_reply_pack(&v18, a1[4]);
      }
    }
  }

  sub_10002A180((uint64_t *)&v20, v6);
  if (v4) {
    os_release((void *)v4);
  }
  if (v3) {
    os_release(v3);
  }
}

CFErrorRef sub_10001249C(void *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  *((void *)&v78 + 1) = 0LL;
  __int128 v79 = 0uLL;
  if (a1[1] > 0x1000uLL)
  {
    int v5 = (void *)a2[13];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR)) {
        uint64_t v6 = 3LL;
      }
      else {
        uint64_t v6 = 2LL;
      }
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 84;
      uint64_t v7 = v5;
    }

    else
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 84;
      uint64_t v7 = &_os_log_default;
      uint64_t v6 = 2LL;
    }

    unsigned int v15 = (char *)_os_log_send_and_compose_impl(v6, 0LL, 0LL, 0LL, &_mh_execute_header, v7, 16LL);
    CFErrorRef v16 = sub_10000A444("sm_bootstrap_service", "sm.c", 244, "com.apple.security.cryptex.posix", 84LL, 0LL, v15);
    free(v15);
    uint64_t v17 = 0LL;
    BOOL v11 = 0LL;
    goto LABEL_18;
  }

  size_t v10 = (void *)xpc_create_from_plist(*a1);
  BOOL v11 = v10;
  if (!v10 || xpc_get_type(v10) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v12 = (void *)a2[13];
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 22;
      int v14 = v12;
    }

    else
    {
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 22;
      int v14 = &_os_log_default;
      uint64_t v13 = 2LL;
    }

    int v18 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v14, 16LL);
    CFErrorRef v16 = sub_10000A444("sm_bootstrap_service", "sm.c", 251, "com.apple.security.cryptex.posix", 22LL, 0LL, v18);
    free(v18);
    uint64_t v17 = 0LL;
    goto LABEL_18;
  }

  int v20 = *__error();
  int v21 = (os_log_s *)a2[13];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "frobbing plist: %@", buf, 0xCu);
  }

  *__error() = v20;
  int v22 = (const char *)a2[1];
  __int128 v77 = *a2;
  char v75 = v77;
  unint64_t v23 = a2[11];
  *(void *)&__int128 v78 = v22;
  *(void *)&__int128 v79 = v23;
  int v74 = *((_DWORD *)a2 + 24);
  DWORD2(v7snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v74;
  *(void *)&__int128 xdict = a2[14];
  *((void *)&xdict + 1) = a2[13];
  __int128 v80 = xdict;
  uint64_t v81 = a3;
  uint64_t v24 = (char *)malloc(0x400uLL);
  if (!v24) {
    sub_10003F094(__str, buf);
  }
  uint64_t v17 = v24;
  snprintf(v24, 0x400uLL, "%s", v22);
  if (*((int *)a2 + 20) >= 1)
  {
    uint64_t v25 = 0LL;
    while (1)
    {
      *(void *)__int128 buf = 0LL;
      int v26 = asprintf((char **)buf, ":%s", (const char *)a2[v25 + 2]);
      __strlcat_chk(v17, *(void *)buf, 1024LL, 1024LL);
      free(*(void **)buf);
    }

    __int128 v40 = (void *)a2[13];
    if (v40)
    {
      if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR)) {
        uint64_t v41 = 3LL;
      }
      else {
        uint64_t v41 = 2LL;
      }
      *(_DWORD *)__str = 67109120;
      *(_DWORD *)&__str[4] = 22;
      __int128 v42 = v40;
    }

    else
    {
      *(_DWORD *)__str = 67109120;
      *(_DWORD *)&__str[4] = 22;
      __int128 v42 = &_os_log_default;
      uint64_t v41 = 2LL;
    }

    os_log_type_t v54 = (char *)_os_log_send_and_compose_impl(v41, 0LL, 0LL, 0LL, &_mh_execute_header, v42, 16LL);
    CFErrorRef v16 = sub_10000A444("sm_bootstrap_service", "sm.c", 275, "com.apple.security.cryptex.posix", 22LL, 0LL, v54);
    free(v54);
    int v53 = *(char **)buf;
    goto LABEL_69;
  }

LABEL_29:
  *((void *)&v78 + 1) = v17;
  xpc_object_t v27 = xpc_copy(v11);
  bzero(buf, 0x400uLL);
  bzero(__str, 0x400uLL);
  string = xpc_dictionary_get_string(v27, "Label");
  if (!string)
  {
    int v43 = *__error();
    __int128 v44 = (os_log_s *)*((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR))
    {
LABEL_53:
      *__error() = v43;
      if (v27) {
        os_release(v27);
      }
      __int16 v46 = (void *)a2[13];
      if (v46)
      {
        if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR)) {
          uint64_t v47 = 3LL;
        }
        else {
          uint64_t v47 = 2LL;
        }
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v89 = 1024;
        int v90 = 22;
        int v48 = v46;
      }

      else
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v89 = 1024;
        int v90 = 22;
        int v48 = &_os_log_default;
        uint64_t v47 = 2LL;
      }

      int v52 = (char *)_os_log_send_and_compose_impl(v47, 0LL, 0LL, 0LL, &_mh_execute_header, v48, 16LL);
      CFErrorRef v16 = sub_10000A444("sm_bootstrap_service", "sm.c", 286, "com.apple.security.cryptex.posix", 22LL, 0LL, v52);
      int v53 = v52;
LABEL_69:
      free(v53);
LABEL_18:
      free(v17);
      goto LABEL_19;
    }

    *(_WORD *)v82 = 0;
    int v45 = "missing label";
LABEL_52:
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v45, v82, 2u);
    goto LABEL_53;
  }

  __int16 v29 = string;
  sub_100013314((uint64_t)&v77, (uint64_t)"Label", string, buf);
  xpc_dictionary_set_string(v27, "Label", buf);
  __strlcpy_chk(a3, buf, 128LL, 128LL);
  int v30 = xpc_dictionary_get_string(v27, "Program");
  if (v30)
  {
    *((void *)&xdict + 1) = v29;
    __int16 v31 = buf;
    sub_10001342C((uint64_t)&v77, (uint64_t)"Program", v30, buf);
    xpc_dictionary_set_string(v27, "Program", buf);
    goto LABEL_32;
  }

  xpc_object_t array = xpc_dictionary_get_array(v27, "ProgramArguments");
  if (!array)
  {
    int v43 = *__error();
    __int128 v44 = (os_log_s *)*((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_WORD *)v82 = 0;
    int v45 = "missing argv";
    goto LABEL_52;
  }

  v50 = array;
  if (!xpc_array_get_count(array))
  {
    int v43 = *__error();
    __int128 v44 = (os_log_s *)*((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_WORD *)v82 = 0;
    int v45 = "empty argv";
    goto LABEL_52;
  }

  uint64_t v51 = xpc_array_get_string(v50, 0LL);
  if (!v51)
  {
    int v43 = *__error();
    __int128 v44 = (os_log_s *)*((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_WORD *)v82 = 0;
    int v45 = "bad argv0";
    goto LABEL_52;
  }

  __int16 v31 = v51;
  *((void *)&xdict + 1) = v29;
  if (*v51 == 47)
  {
    sub_10001342C((uint64_t)&v77, (uint64_t)"ProgramArguments", v51, buf);
    xpc_array_set_string(v50, 0LL, buf);
    __int16 v31 = buf;
  }

LABEL_32:
  __strlcpy_chk(a3 + 128, v31, 1024LL, 1024LL);
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v27, "EnvironmentVariables");
  if (!dictionary)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(v27, "EnvironmentVariables", empty);
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v27, "EnvironmentVariables");
    if (empty) {
      os_release(empty);
    }
  }

  xpc_dictionary_set_string(dictionary, "CRYPTEX_MOUNT_PATH", v22);
  xpc_object_t v34 = xpc_dictionary_get_dictionary(v27, "MachServices");
  if (v34)
  {
    xpc_object_t v35 = v34;
    __int128 v84 = v79;
    __int128 v85 = v80;
    uint64_t v86 = v81;
    *(_OWORD *)v82 = v77;
    __int128 v83 = v78;
    xpc_object_t v36 = xpc_copy(v34);
    *(void *)&v82[8] = v36;
    xpc_dictionary_apply_f(v35, v82, sub_100013634);
    xpc_dictionary_set_value(v27, "MachServices", v36);
    if (v36) {
      os_release(v36);
    }
  }

  *(_BYTE *)(a3 + 1152) = xpc_dictionary_get_dictionary(v27, "RemoteServices") != 0LL;
  if ((v75 & 8) != 0) {
    xpc_dictionary_set_string(v27, "_SubsystemRoot", v17);
  }
  if ((v75 & 0x40) != 0)
  {
    __int128 v37 = (const char *)sub_10000DCC4();
    snprintf(__str, 0x400uLL, "%s/%s", v22, v37);
    xpc_dictionary_set_string(dictionary, "PYTHONPATH", __str);
  }

  if ((void)xdict)
  {
    xpc_object_t v38 = xpc_dictionary_get_dictionary((xpc_object_t)xdict, "CRYPTEX_SESSION");
    xpc_object_t v39 = v38 ? xpc_copy(v38) : xpc_dictionary_create_empty();
    uint64_t v55 = v39;
    xpc_object_t v56 = xpc_dictionary_get_dictionary((xpc_object_t)xdict, *((const char **)&xdict + 1));
    sub_10003CB54((uint64_t)v55, v56);
    sub_10003CB54((uint64_t)v27, v55);
    if (v55) {
      os_release(v55);
    }
  }

  *((void *)&v77 + 1) = v27;
  if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_DEBUG))
  {
    int v57 = xpc_copy_description(v11);
    v58 = xpc_copy_description(v27);
    int v59 = *__error();
    uint64_t v60 = (os_log_s *)a2[13];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v57;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "frobbed initial plist: %s", buf, 0xCu);
    }

    *__error() = v59;
    int v61 = *__error();
    __int16 v62 = (os_log_s *)a2[13];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v58;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "frobbed final plist: %s", buf, 0xCu);
    }

    *__error() = v61;
    free(v58);
    free(v57);
  }

  if ((*a2 & 4) != 0)
  {
    int v65 = *__error();
    v66 = (os_log_s *)a2[13];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = a3;
      __int16 v67 = "dry run; skipping bootstrap: %s";
LABEL_98:
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, v67, buf, 0xCu);
    }

LABEL_99:
    CFErrorRef v16 = 0LL;
    *__error() = v65;
    goto LABEL_104;
  }

  if ((*a2 & 0x80) != 0)
  {
    if ((sub_10003BFF8(v27, "_LimitLoadFromBootMode", "rem") & 1) != 0)
    {
      int v63 = *__error();
      int v64 = (os_log_s *)a2[13];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEBUG,  "not injecting _LimitLoadToBootMode=>rem; _LimitLoadFromBootMode=>rem already exists",
          buf,
          2u);
      }

      *__error() = v63;
    }

    else
    {
      sub_10003BEE8(v27, "_LimitLoadToBootMode", "rem");
    }
  }

  CFErrorRef v68 = sub_100038630(v27, v74, a4);
  if (!v68)
  {
    int v65 = *__error();
    v66 = (os_log_s *)a2[13];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = a3;
      __int16 v67 = "bootstrapped plist: %s";
      goto LABEL_98;
    }

    goto LABEL_99;
  }

  CFErrorRef v69 = v68;
  v70 = (os_log_s *)a2[13];
  if (v70)
  {
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      uint64_t v71 = 3LL;
    }
    else {
      uint64_t v71 = 2LL;
    }
    *(_WORD *)__int128 buf = 0;
    int v72 = v70;
  }

  else
  {
    *(_WORD *)__int128 buf = 0;
    int v72 = (os_log_s *)&_os_log_default;
    uint64_t v71 = 2LL;
  }

  BOOL v73 = (char *)_os_log_send_and_compose_impl(v71, 0LL, 0LL, 0LL, &_mh_execute_header, v72, 16LL);
  CFErrorRef v16 = sub_10000A444("sm_bootstrap_service", "sm.c", 329, "com.apple.security.cryptex", 14LL, v69, v73);
  free(v73);
  CFRelease(v69);
LABEL_104:
  free(v17);
  if (v27) {
    os_release(v27);
  }
LABEL_19:
  if (v11) {
    os_release(v11);
  }
  return v16;
}

uint64_t sub_1000131E0(char *a1, uint64_t a2)
{
  CFStringRef v4 = sub_10000A17C(a1);
  if ((*(void *)a2 & 4) != 0)
  {
    int v6 = *__error();
    uint64_t v7 = *(os_log_s **)(a2 + 104);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    int v10 = 136315138;
    BOOL v11 = a1;
    int v8 = "dry run; skipping unbootstrap: %s";
  }

  else
  {
    uint64_t v5 = *(unsigned int *)(a2 + 96);
    if ((*(void *)a2 & 0x20) != 0) {
      sub_1000381C8(v5, (uint64_t)v4);
    }
    else {
      sub_1000383F0(v5, (uint64_t)v4, *(void **)(a2 + 104));
    }
    int v6 = *__error();
    uint64_t v7 = *(os_log_s **)(a2 + 104);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    int v10 = 136315138;
    BOOL v11 = a1;
    int v8 = "unbootstrapped plist: %s";
  }

  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v10, 0xCu);
LABEL_10:
  *__error() = v6;
  if (v4) {
    CFRelease(v4);
  }
  return 0LL;
}

int *sub_100013314(uint64_t a1, uint64_t a2, const char *a3, char *__str)
{
  if ((*(_BYTE *)a1 & 1) == 0) {
    return (int *)snprintf(__str, 0x80uLL, "%s", a3);
  }
  snprintf(__str, 0x80uLL, "%s.%#llx", a3, *(void *)(a1 + 32));
  int v9 = *__error();
  int v10 = *(os_log_s **)(a1 + 56);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v12 = a2;
    __int16 v13 = 2080;
    int v14 = a3;
    __int16 v15 = 2080;
    CFErrorRef v16 = __str;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s: %s -> %s", buf, 0x20u);
  }

  double result = __error();
  int *result = v9;
  return result;
}

int *sub_10001342C(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
  int v8 = *(const char **)(a1 + 16);
  if (v8[strlen(v8)] == 47 || *a3 == 47) {
    int v9 = (const char *)&unk_100048303;
  }
  else {
    int v9 = "/";
  }
  snprintf(__str, 0x400uLL, "%s%s%s", v8, v9, a3);
  memset(&v18, 0, sizeof(v18));
  int v10 = stat(__str, &v18);
  int v11 = *__error();
  uint64_t v12 = *(os_log_s **)(a1 + 56);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    int v14 = (char *)a3;
    if (v13)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Path not in cryptex, not frobnicate path",  buf,  2u);
      int v14 = (char *)a3;
    }
  }

  else
  {
    if (v13)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Path exists in cryptex, frobnicate path",  buf,  2u);
    }

    int v14 = __str;
  }

  *__error() = v11;
  strlcpy(a4, v14, 0x400uLL);
  int v15 = *__error();
  CFErrorRef v16 = *(os_log_s **)(a1 + 56);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v20 = a2;
    __int16 v21 = 2080;
    int v22 = a3;
    __int16 v23 = 2080;
    uint64_t v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: %s -> %s", buf, 0x20u);
  }

  double result = __error();
  int *result = v15;
  return result;
}

void sub_100013634(const char *a1, void *a2, uint64_t a3)
{
}

void sub_100013924(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2 == 2)
  {
    [*(id *)(a1 + 32) handlePublisherInitialBarrier];
  }

  else if (a2 == 1)
  {
    [*(id *)(a1 + 32) handlePublisherRemoveToken:a3];
  }

  else if (a2)
  {
    int v8 = *__error();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) log]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10[0] = 67109376;
      v10[1] = a2;
      __int16 v11 = 1024;
      int v12 = 22;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "Unexpected publisher action: %d: %{darwin.errno}d",  (uint8_t *)v10,  0xEu);
    }

    *__error() = v8;
  }

  else
  {
    [*(id *)(a1 + 32) handlePublisherAddToken:a3 descriptor:v7];
  }
}

id sub_100013A50(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handlePublisherError:a2];
}

void sub_100013AE0(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void))
{
}

void sub_100013B90(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100013C04;
  v5[3] = &unk_100055C88;
  CFStringRef v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  xpc_array_apply(a3, v5);
}

uint64_t sub_100013C04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  string = xpc_array_get_string(v4, 0LL);
  id v7 = xpc_array_get_string(v4, 1uLL);

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, @"Identifier");

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, @"Version");

  int v10 = *(void **)(a1 + 32);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  uint64_t v15 = *(void *)(a1 + 40);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  id v13 = [v10 broadcastEvent:1 forCryptex:v11 withInfo:v5 toClients:v12];

  return 1LL;
}

void sub_100014048(_Unwind_Exception *a1)
{
}

void sub_1000141F0(_Unwind_Exception *exception_object)
{
}

void sub_10001448C(_Unwind_Exception *a1)
{
}

void sub_1000148D0(_Unwind_Exception *a1)
{
}

id sub_10001494C()
{
  if (qword_10005A830 != -1) {
    dispatch_once(&qword_10005A830, &stru_100055CD0);
  }
  return (id)qword_10005A838;
}

void sub_10001498C(id a1)
{
  id v1 = -[EventServer initWithEventStream:]( objc_alloc(&OBJC_CLASS___EventServer),  "initWithEventStream:",  "com.apple.security.cryptex.events");
  uint64_t v2 = (void *)qword_10005A838;
  qword_10005A838 = (uint64_t)v1;
}

uint64_t sub_1000149C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 broadcastEvent:a2 forCryptex:v8 withInfo:a4]);

  if (v9)
  {
    int v10 = *__error();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 log]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134218754;
      uint64_t v15 = a2;
      __int16 v16 = 2080;
      uint64_t v17 = a3;
      __int16 v18 = 2112;
      int v19 = v9;
      __int16 v20 = 1024;
      int v21 = 72;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to broadcast event 0x%llx about cryptex '%s': %@: %{darwin.errno}d",  (uint8_t *)&v14,  0x26u);
    }

    *__error() = v10;
    uint64_t v12 = 72LL;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

uint64_t sub_100014B14()
{
  uint64_t v0 = sub_100014C24("system", 0LL);
  uint64_t v1 = sub_100008BDC();
  cryptex_set_target_queue(v0, v1);
  uint64_t result = cryptex_activate(v0);
  qword_10005A840 = v0;
  return result;
}

void sub_100014B6C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1360)) {
    sub_10003F170(&v4, v5);
  }
  uint64_t v2 = 0LL;
  uint64_t v3 = a1 + 88;
  do
  {
    close_drop_np(a1 + (*(void **)((char *)&off_100055CF0 + v2))[2], v3);
    v2 += 8LL;
  }

  while (v2 != 72);
  dispatch_release(*(dispatch_object_t *)(a1 + 104));
  dispatch_release(*(dispatch_object_t *)(a1 + 112));
  dispatch_release(*(dispatch_object_t *)(a1 + 96));
  sub_10003A9CC(a1 + 56);
}

uint64_t sub_100014C24(const char *a1, uint64_t a2)
{
  uint64_t v4 = sub_100010EA0(1424LL);
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 8_Block_object_dispose(va, 8) = v4;
  *(void *)(v4 + 96) = dispatch_queue_create("com.apple.security.cryptexd.codex.iodq", 0LL);
  *(void *)(v4 + 104) = dispatch_group_create();
  *(void *)(v4 + 112) = dispatch_group_create();
  sub_100038E94((_OWORD *)(v4 + 144));
  sub_100038E94((_OWORD *)(v4 + 448));
  sub_100038E94((_OWORD *)(v4 + 752));
  sub_100038E94((_OWORD *)(v4 + 1056));
  *(void *)(v4 + 120) = 0LL;
  *(void *)(v4 + 12_Block_object_dispose(va, 8) = v4 + 120;
  *(void *)(v4 + 136_Block_object_dispose(va, 8) = 0LL;
  *(void *)(v4 + 1376) = v4 + 1368;
  *(_DWORD *)(v4 + 1384) = -1;
  *(void *)(v4 + 1392) = -1LL;
  *(void *)(v4 + 1400) = -1LL;
  sub_10003A6E4(v4 + 56, (int)"com.apple.security.cryptexd", "codex");
  sub_10003A714(v4 + 56, a1);
  uint64_t v5 = sub_100008BDC();
  cryptex_init(v4, v5, sub_100014D20, 0LL);
  return v4;
}

void *sub_100014D14()
{
  return os_retain((void *)qword_10005A840);
}

uint64_t sub_100014D20(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 72; i += 8LL)
  {
    uint64_t v3 = *(uint64_t **)((char *)&off_100055CF0 + i);
    uint64_t v4 = sub_100008BC0();
    uint64_t v5 = v4;
    __int128 v44 = 0u;
    memset(v45, 0, sizeof(v45));
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    *(_OWORD *)__str = 0u;
    __int128 v32 = 0u;
    int v30 = -1;
    id v6 = (char *)v3[1];
    if (v6)
    {
      int v7 = *(_DWORD *)(a1 + 1384);
      uint64_t v8 = *v3;
      if ((*v3 & 2) != 0)
      {
        if ((v8 & 4) == 0)
        {
          if ((v8 & 1) != 0) {
            int v7 = v4[23];
          }
          else {
            int v7 = v4[22];
          }
        }
      }

      else if ((v8 & 1) != 0)
      {
        int v7 = *(_DWORD *)(a1 + 1388);
      }
    }

    else
    {
      int v7 = v4[22];
      id v6 = __str;
      snprintf(__str, 0xFFuLL, "codex.%s", *(const char **)(a1 + 56));
      if ((*(_BYTE *)v3 & 1) != 0)
      {
        int v7 = v5[23];
        id v6 = __str;
      }
    }

    int v9 = *(os_log_s **)(a1 + 72);
    bzero(v58, 0x400uLL);
    memset(&v57, 0, sizeof(v57));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v7, &v57) == -1)
      {
        int v15 = *__error();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v16 = *__error();
          *(_DWORD *)__int128 buf = 136315650;
          *(void *)&uint8_t buf[4] = "rootfd";
          __int16 v47 = 1024;
          int v48 = v7;
          __int16 v49 = 1024;
          LODWORD(v50) = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  buf,  0x18u);
        }

        *__error() = v15;
      }

      else
      {
        if (fcntl(v7, 50, v58))
        {
          int v10 = __error();
          __int16 v11 = strerror(*v10);
          snprintf((char *)v58, 0x400uLL, "[%s]", v11);
        }

        unint64_t v12 = ((unint64_t)v57.st_mode >> 12) ^ 8;
        id v13 = "[unknown]";
        if ((_DWORD)v12 != 15) {
          id v13 = off_1000561F0[v12];
        }
        int v14 = (void *)os_flagset_copy_string(&unk_100055DE0, v57.st_flags);
        int v29 = *__error();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 136316418;
          *(void *)&uint8_t buf[4] = "rootfd";
          __int16 v47 = 1024;
          int v48 = v7;
          __int16 v49 = 2080;
          v50 = v13;
          __int16 v51 = 2048;
          off_t st_size = v57.st_size;
          __int16 v53 = 2080;
          os_log_type_t v54 = v14;
          __int16 v55 = 2080;
          xpc_object_t v56 = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  buf,  0x3Au);
        }

        *__error() = v29;
        free(v14);
      }
    }

    int v17 = sub_10003AACC(v7, v6, 1049344, 0x1FFu, &v30);
    if (v17)
    {
      int v26 = v17;
      *(void *)__int128 buf = 0LL;
      memset(v58, 0, 80);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        uint64_t v27 = 3LL;
      }
      else {
        uint64_t v27 = 2LL;
      }
      v57.st_dev = 136315394;
      *(void *)&v57.st_mode = v6;
      WORD2(v57.st_ino) = 1024;
      *(_DWORD *)((char *)&v57.st_ino + 6) = v26;
      uint64_t v28 = _os_log_send_and_compose_impl(v27, buf, v58, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
      _os_crash_msg(*(void *)buf, v28);
      __break(1u);
    }

    *(_DWORD *)(a1 + v3[2]) = v30;
    if (v5) {
      os_release(v5);
    }
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 104));
  dispatch_group_notify_f( *(dispatch_group_t *)(a1 + 104),  *(dispatch_queue_t *)(a1 + 24),  (void *)a1,  (dispatch_function_t)sub_100017F34);
  sub_100018228(a1, &qword_100055D50);
  sub_100018228(a1, &qword_100055D98);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
  uint64_t v18 = 0LL;
  v57.st_dev = -1;
  do
  {
    uint64_t v19 = (*(void **)((char *)&off_100055CF0 + v18))[2];
    LODWORD(v58[0]) = *(_DWORD *)(a1 + v19);
    *(_DWORD *)(a1 + v1snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = claimfd_np(v58, a1 + 88, 7LL);
    v18 += 8LL;
  }

  while (v18 != 72);
  int v20 = sub_100015298(a1, (uint64_t)&unk_1000448D0, "lockdown", 0, 0LL, &v57);
  if (v20 != 2)
  {
    if (v20) {
      sub_10003F1EC(__str, v58);
    }
    *(void *)(a1 + 80) |= 4uLL;
    int v21 = *(const char **)(a1 + 56);
    int v22 = *__error();
    __int16 v23 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = "[anonymous]";
      if (v21) {
        uint64_t v24 = v21;
      }
      LODWORD(v58[0]) = 136446210;
      *(void *)((char *)v58 + 4) = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%{public}s: system codex is locked down",  (uint8_t *)v58,  0xCu);
    }

    *__error() = v22;
  }

  uint64_t result = v57.st_dev;
  if (v57.st_dev != -1)
  {
    uint64_t result = close(v57.st_dev);
    if ((_DWORD)result == -1) {
      sub_10003E3CC(__str, v58);
    }
  }

  return result;
}

uint64_t sub_100015298(uint64_t a1, uint64_t a2, char *a3, int a4, uint64_t a5, _DWORD *a6)
{
  int v14 = openat(*(_DWORD *)(a1 + *(void *)(a2 + 16)), a3, a4, a5);
  if (v14 < 0)
  {
    uint64_t v8 = *__error();
    int v9 = *(const char **)(a1 + 56);
    int v10 = *__error();
    __int16 v11 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = "[anonymous]";
      if (v9) {
        unint64_t v12 = v9;
      }
      *(_DWORD *)__int128 buf = 136446466;
      int v16 = v12;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s: openat: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v10;
  }

  else
  {
    uint64_t v8 = 0LL;
    *a6 = sub_10003A9F4(&v14);
  }

  return v8;
}

uint64_t sub_1000153AC(uint64_t a1, uint64_t a2, char *a3, _DWORD *a4)
{
  int v12 = -1;
  uint64_t v6 = sub_10003B9E0(*(_DWORD *)(a1 + *(void *)(a2 + 16)), a3, &v12);
  if ((_DWORD)v6)
  {
    int v7 = *(const char **)(a1 + 56);
    int v8 = *__error();
    int v9 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = "[anonymous]";
      if (v7) {
        int v10 = v7;
      }
      *(_DWORD *)__int128 buf = 136446466;
      int v14 = v10;
      __int16 v15 = 1024;
      int v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s: mkodtempat: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v8;
  }

  else
  {
    *a4 = sub_10003A9F4(&v12);
  }

  return v6;
}

void sub_1000154C4(void *a1, uint64_t a2, void *a3, int a4, void *a5, void *a6)
{
  int v39 = -1;
  uint64_t v38 = 0LL;
  int v12 = sub_10003C818(a1, 0x48uLL);
  v12[3] = os_retain((void *)a2);
  v12[6] = a5;
  v12[7] = a6;
  *((_DWORD *)v12 + 16) = a4;
  if (a3)
  {
    id v13 = os_retain(a3);
  }

  else
  {
    id v13 = (void *)cryptex_scrivener_create(*(void *)(a2 + 104), 0LL);
  }

  uint64_t v14 = *(void *)(a2 + 104);
  if (!*(void *)(v14 + 216) || cryptex_core_get_asset(v14, &_cryptex_asset_type_cx1p)) {
    goto LABEL_7;
  }
  uint64_t v22 = openat(*(_DWORD *)(a2 + 112), *((const char **)&_cryptex_asset_type_cx1p + 5), 514, 420LL);
  int v39 = v22;
  if ((v22 & 0x80000000) != 0)
  {
    int v30 = *__error();
    __int16 v31 = (const char *)a1[7];
    int v32 = *__error();
    __int128 v33 = (os_log_s *)a1[9];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    __int128 v34 = "[anonymous]";
    if (v31) {
      __int128 v34 = v31;
    }
    *(_DWORD *)__int128 buf = 136446466;
    __int128 v41 = v34;
    __int16 v42 = 1024;
    int v43 = v30;
    __int128 v35 = "%{public}s: openat: %{darwin.errno}d";
    goto LABEL_38;
  }

  int v23 = v22;
  int v24 = cryptex_core_cx1_write_to_file(*(void *)(*(void *)(a2 + 104) + 216LL), v22);
  if (v24)
  {
    int v25 = v24;
    int v26 = (const char *)a1[7];
    int v27 = *__error();
    uint64_t v28 = (os_log_s *)a1[9];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = "[anonymous]";
      if (v26) {
        int v29 = v26;
      }
      *(_DWORD *)__int128 buf = 136446466;
      __int128 v41 = v29;
      __int16 v42 = 1024;
      int v43 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}s: Failed to write Cryptex1 properties to file.: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v27;
LABEL_40:
    cryptex_target_async_f(a1, v12, sub_100015E3C);
    goto LABEL_19;
  }

  if (fchmod(v23, 0x124u))
  {
    int v30 = *__error();
    __int128 v36 = (const char *)a1[7];
    int v32 = *__error();
    __int128 v33 = (os_log_s *)a1[9];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    __int128 v37 = "[anonymous]";
    if (v36) {
      __int128 v37 = v36;
    }
    *(_DWORD *)__int128 buf = 136446466;
    __int128 v41 = v37;
    __int16 v42 = 1024;
    int v43 = v30;
    __int128 v35 = "%{public}s: fchmod: %{darwin.errno}d";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v35, buf, 0x12u);
LABEL_39:
    *__error() = v32;
    if (!v30) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }

  uint64_t v38 = cryptex_asset_new(&_cryptex_asset_type_cx1p, &v39);
  cryptex_core_set_asset(*(void *)(a2 + 104), &v38);
LABEL_7:
  cryptex_set_target_object(v13, a1);
  uint64_t asset = cryptex_core_get_asset(*(void *)(a2 + 104), &_cryptex_asset_type_im4m);
  int v16 = (const char *)a1[7];
  int v17 = *__error();
  int v18 = (os_log_s *)a1[9];
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (asset)
  {
    if (v19)
    {
      int v20 = "[anonymous]";
      if (v16) {
        int v20 = v16;
      }
      *(_DWORD *)__int128 buf = 136446210;
      __int128 v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}s: using existing im4m", buf, 0xCu);
    }

    *__error() = v17;
    cryptex_scrivener_read_signature(v13, v12, sub_1000158EC);
  }

  else
  {
    if (v19)
    {
      int v21 = "[anonymous]";
      if (v16) {
        int v21 = v16;
      }
      *(_DWORD *)__int128 buf = 136446210;
      __int128 v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}s: will personalize", buf, 0xCu);
    }

    *__error() = v17;
    cryptex_scrivener_sign(v13, v12, sub_1000158EC);
  }

  _OWORD v12[5] = (void *)sub_100015D20((uint64_t)a1, (uint64_t)"install");
  cryptex_activate(v13);
LABEL_19:
  if (v13) {
    os_release(v13);
  }
}

void sub_1000158EC(uint64_t a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  uint64_t v8 = *(void *)(a4[3] + 104);
  sub_100008BCC();
  int v9 = *__error();
  int v10 = *(os_log_s **)(v7 + 72);
  if (!a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "protex personalization [no error]", buf, 2u);
    }

    *__error() = v9;
    a4[2] = 0LL;
    if (!*(void *)(a2 + 264) || !cryptex_core_get_info_asset(v8)) {
      goto LABEL_22;
    }
    __s2 = 0LL;
    uint64_t v39 = 0LL;
    __int128 v37 = 0LL;
    int v11 = cryptex_core_parse_info_asset(v8, &__s2, &v37, 0LL);
    if (v11)
    {
      LODWORD(v12) = v11;
      id v13 = *(const char **)(a2 + 16);
      int v14 = *__error();
      __int16 v15 = *(os_log_s **)(a2 + 32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = "[anonymous]";
        if (v13) {
          int v16 = v13;
        }
        *(_DWORD *)__int128 buf = 136446466;
        __int128 v41 = v16;
        __int16 v42 = 1024;
        LODWORD(v43) = (_DWORD)v12;
        int v17 = "%{public}s: Failed to extract cryptex identifier and version.: %{darwin.errno}d";
        int v18 = v15;
        uint32_t v19 = 18;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      }
    }

    else
    {
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 264), "com.apple.CryptexIdentifier");
      int v12 = string;
      if (string)
      {
        if (!strcmp(string, __s2))
        {
          LODWORD(v12) = 0;
        }

        else
        {
          int v25 = *(const char **)(a2 + 16);
          int v26 = *__error();
          int v27 = *(os_log_s **)(a2 + 32);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = "[anonymous]";
            if (v25) {
              uint64_t v28 = v25;
            }
            *(_DWORD *)__int128 buf = 136446978;
            __int128 v41 = v28;
            __int16 v42 = 2080;
            int v43 = v12;
            __int16 v44 = 2080;
            int v45 = __s2;
            __int16 v46 = 1024;
            int v47 = 8;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s: im4m identifier mismatches cryptex (actual, expected): (%s, %s): %{darwin.errno}d",  buf,  0x26u);
          }

          *__error() = v26;
          LODWORD(v12) = 8;
        }
      }

      int v29 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 264), "com.apple.CryptexVersion");
      uint64_t v30 = cryptex_version_new(v29);
      uint64_t v39 = v30;
      if (!v30) {
        goto LABEL_16;
      }
      __int16 v31 = (const char **)v30;
      int v32 = *(const char **)(a2 + 16);
      int v14 = *__error();
      __int128 v33 = *(os_log_s **)(a2 + 32);
      LODWORD(v12) = 8;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __int128 v34 = "[anonymous]";
        if (v32) {
          __int128 v34 = v32;
        }
        __int128 v35 = *v31;
        __int128 v36 = *v37;
        *(_DWORD *)__int128 buf = 136446978;
        __int128 v41 = v34;
        __int16 v42 = 2080;
        int v43 = v35;
        __int16 v44 = 2080;
        int v45 = v36;
        __int16 v46 = 1024;
        int v47 = 8;
        int v17 = "%{public}s: im4m version mismatches cryptex (actual, expected): (%s, %s): %{darwin.errno}d";
        int v18 = v33;
        uint32_t v19 = 38;
        goto LABEL_14;
      }
    }

    *__error() = v14;
LABEL_16:
    cryptex_version_destroy(&v39);
    cryptex_version_destroy(&v37);
    free(__s2);
    if ((_DWORD)v12)
    {
      int v20 = *(const char **)(v7 + 56);
      int v21 = *__error();
      uint64_t v22 = *(os_log_s **)(v7 + 72);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = "[anonymous]";
        if (v20) {
          int v23 = v20;
        }
        *(_DWORD *)__int128 buf = 136446466;
        __int128 v41 = v23;
        __int16 v42 = 1024;
        LODWORD(v43) = (_DWORD)v12;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}s: Signature metadata does not match cryptex.: %{darwin.errno}d",  buf,  0x12u);
      }

      *__error() = v21;
    }

uint64_t sub_100015D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(const char **)(a1 + 56);
  int v5 = *__error();
  uint64_t v6 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    int v8 = *(_DWORD *)(a1 + 1360);
    if (v4) {
      uint64_t v7 = v4;
    }
    int v10 = 136446978;
    int v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = a2;
    __int16 v14 = 1024;
    int v15 = v8 - 1;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: activation: %s: %u -> %u",  (uint8_t *)&v10,  0x22u);
  }

  *__error() = v5;
  if (!*(_DWORD *)(a1 + 1360)) {
    sub_10003F268();
  }
  return os_transaction_create(a2);
}

void sub_100015E3C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(const void **)(a1 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  sub_100008BCC();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 56))(v2, v5, v3, v7);
  sub_10001AB3C((uint64_t)v2, v6);
  os_release(v4);
  sub_10003C8F0((void **)a1);
  if (v5) {
    os_release(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
}

CFIndex sub_100015EE4(uint64_t a1, int a2, void *a3)
{
  uint64_t v6 = *(const char **)(a1 + 56);
  int v7 = *__error();
  int v8 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      int v9 = v6;
    }
    else {
      int v9 = "[anonymous]";
    }
    int v20 = 136446210;
    int v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s: Waiting to search the codex for LaunchAgents",  (uint8_t *)&v20,  0xCu);
  }

  *__error() = v7;
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL);
  int v10 = *(const char **)(a1 + 56);
  int v11 = *__error();
  __int16 v12 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v10) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = "[anonymous]";
    }
    int v20 = 136446466;
    int v21 = v13;
    __int16 v22 = 1024;
    int v23 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%{public}s: Searching the codex for LaunchAgents - have uid of: %u.",  (uint8_t *)&v20,  0x12u);
  }

  uint64_t v14 = 0LL;
  *__error() = v11;
  while (1)
  {
    uint64_t v15 = *(void *)(a1 + 144 + 8 * v14);
    if (v15) {
      break;
    }
LABEL_15:
    if (++v14 == 37) {
      return 0LL;
    }
  }

  while (1)
  {
    __int16 v16 = sub_100030794((void *)(v15 - 80), a2, a3);
    if (v16) {
      break;
    }
    uint64_t v15 = *(void *)(v15 + 8);
    if (!v15) {
      goto LABEL_15;
    }
  }

  int v18 = v16;
  CFIndex v17 = sub_10000A5D8((CFIndex)v16);
  CFRelease(v18);
  return v17;
}

_DWORD *sub_100016094(uint64_t a1, int a2)
{
  uint64_t v4 = *(const char **)(a1 + 56);
  int v5 = *__error();
  uint64_t v6 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int v12 = 136446466;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: Searching the codex for LaunchAgents - have uid of: %u.",  (uint8_t *)&v12,  0x12u);
  }

  uint64_t result = __error();
  uint64_t v9 = 0LL;
  _DWORD *result = v5;
  uint64_t v10 = a1 + 144;
  do
  {
    for (uint64_t i = *(void *)(v10 + 8 * v9); i; uint64_t i = *(void *)(i + 8))
      uint64_t result = (_DWORD *)sub_100030B08((void *)(i - 80), a2);
    ++v9;
  }

  while (v9 != 37);
  return result;
}

uint64_t sub_1000161A8(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_10003C818(a1, 0x28uLL);
  v6[3] = a3;
  v6[4] = os_retain(a2);
  return cryptex_async_f(a1, v6, sub_100016200);
}

void sub_100016200(void **a1)
{
  uint64_t v2 = (os_log_t *)*a1;
  uint64_t v3 = (void (**)(void, void, void, void))a1[3];
  if ((*((_BYTE *)*a1 + 80) & 4) != 0)
  {
    os_log_t v5 = v2[9];
    if (v5)
    {
      if (os_log_type_enabled(v2[9], OS_LOG_TYPE_ERROR)) {
        uint64_t v6 = 3LL;
      }
      else {
        uint64_t v6 = 2LL;
      }
      os_log_t v7 = v5;
    }

    else
    {
      os_log_t v7 = (os_log_t)&_os_log_default;
      uint64_t v6 = 2LL;
    }

    int v8 = (char *)_os_log_send_and_compose_impl(v6, 0LL, 0LL, 0LL, &_mh_execute_header, v7, 16LL);
    CFErrorRef v9 = sub_10000A444( "_codex_install_cryptex_continue",  "codex.c",  2867,  "com.apple.security.cryptex.posix",  58LL,  0LL,  v8);
    free(v8);
    a1[2] = v9;
    ((void (**)(os_log_t *, void, CFErrorRef, void))v3)[5](v2, 0LL, v9, v3);
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v4 = sub_10000F614((uint64_t)a1[4], v2, 0LL);
    cryptex_set_target_object(v4, v2);
    sub_10000FA4C(v4, v3, sub_10001BB54);
  }

  os_release(a1[4]);
  sub_10003C8F0(a1);
  if (v4) {
    os_release(v4);
  }
}

uint64_t sub_100016418(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  CFErrorRef v9 = sub_10003C818(a1, 0x40uLL);
  a2[6] = 1LL;
  v9[3] = os_retain(a2);
  v9[4] = 0LL;
  v9[6] = a4;
  v9[7] = a5;
  _OWORD v9[5] = 0LL;
  return cryptex_async_f(a1, v9, sub_100016488);
}

void sub_100016488(os_log_t **a1)
{
  uint64_t v2 = *a1;
  if ((cryptex_core_is_cryptex1(a1[3]) & 1) != 0)
  {
    uint64_t v3 = (os_log_t *)sub_10000F614((uint64_t)a1[3], v2, 1LL);
    a1[4] = v3;
    cryptex_set_target_object(v3, v2);
    sub_10000FA4C(a1[4], a1, sub_10001BD20);
  }

  else
  {
    os_log_t v4 = v2[9];
    if (v4)
    {
      if (os_log_type_enabled(v2[9], OS_LOG_TYPE_ERROR)) {
        uint64_t v5 = 3LL;
      }
      else {
        uint64_t v5 = 2LL;
      }
      os_log_t v6 = v4;
    }

    else
    {
      os_log_t v6 = (os_log_t)&_os_log_default;
      uint64_t v5 = 2LL;
    }

    os_log_t v7 = (char *)_os_log_send_and_compose_impl(v5, 0LL, 0LL, 0LL, &_mh_execute_header, v6, 16LL);
    CFErrorRef v8 = sub_10000A444("_codex_mount_continue", "codex.c", 3028, "com.apple.security.cryptex.posix", 22LL, 0LL, v7);
    free(v7);
    if (v8)
    {
      a1[2] = (os_log_t *)v8;
      cryptex_target_async_f(v2, a1, sub_10001BF20);
    }
  }

uint64_t sub_10001669C(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = sub_10003C818(a1, 0xD0uLL);
  __int128 v11 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v10 + 15) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v10 + 17) = v11;
  *(_OWORD *)(v10 + 1snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = *(_OWORD *)(a3 + 128);
  __int128 v12 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v10 + 7) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v10 + snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v12;
  __int128 v13 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v10 + 11) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v10 + 13) = v13;
  __int128 v14 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v10 + 3) = *(_OWORD *)a3;
  v10[21] = *(void **)(a3 + 144);
  v10[22] = a2;
  *(_OWORD *)(v10 + 5) = v14;
  _BYTE v10[24] = a4;
  v10[25] = a5;
  v10[23] = 0LL;
  return cryptex_async_f(a1, v10, sub_100016738);
}

void sub_100016738(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 176);
  os_log_t v4 = sub_100017B18(*(void *)a1, *(char **)(a1 + 24), *(void *)(a1 + 40));
  uint64_t v5 = v4;
  if (v4)
  {
    if ((cryptex_core_is_cryptex1(v4[25]) & 1) != 0)
    {
      uint64_t cryptex1_properties = cryptex_core_get_cryptex1_properties(v5[25]);
      if (cryptex1_properties && *(_BYTE *)(cryptex1_properties + 64))
      {
        *(void *)(a1 + 184) = os_retain(v5);
        sub_10002F8FC((uint64_t)v5, (void *)(v3 & 1 | 2), (void *)a1, sub_10001C7F8);
LABEL_31:
        os_release(v5);
        return;
      }

      __int128 v13 = *(void **)(v2 + 72);
      if (v13)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v14 = 3LL;
        }
        else {
          uint64_t v14 = 2LL;
        }
        int v15 = v13;
      }

      else
      {
        int v15 = &_os_log_default;
        uint64_t v14 = 2LL;
      }

      __int16 v16 = (char *)_os_log_send_and_compose_impl(v14, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
      int v17 = 3156;
    }

    else
    {
      uint64_t v10 = *(void **)(v2 + 72);
      if (v10)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v11 = 3LL;
        }
        else {
          uint64_t v11 = 2LL;
        }
        __int128 v12 = v10;
      }

      else
      {
        __int128 v12 = &_os_log_default;
        uint64_t v11 = 2LL;
      }

      __int16 v16 = (char *)_os_log_send_and_compose_impl(v11, 0LL, 0LL, 0LL, &_mh_execute_header, v12, 16LL);
      int v17 = 3149;
    }

    CFIndex v18 = 22LL;
  }

  else
  {
    os_log_t v7 = *(void **)(v2 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      CFErrorRef v9 = v7;
    }

    else
    {
      CFErrorRef v9 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    __int16 v16 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 16LL);
    int v17 = 3143;
    CFIndex v18 = 2LL;
  }

  CFErrorRef v19 = sub_10000A444("_codex_unmount_continue", "codex.c", v17, "com.apple.security.cryptex.posix", v18, 0LL, v16);
  free(v16);
  if (v19)
  {
    *(void *)(a1 + 16) = v19;
    cryptex_target_async_f(v2, a1, sub_10001C9F4);
  }

  if (v5) {
    goto LABEL_31;
  }
}

void sub_100016BE8(dispatch_queue_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v8 = sub_10003C818(a1, 0x48uLL);
  void v8[4] = os_retain(a2);
  void v8[6] = a3;
  v8[7] = a4;
  dispatch_async_f(a1[12], v8, (dispatch_function_t)sub_100016C4C);
}

void sub_100016C4C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[4];
  __int128 v54 = 0u;
  memset(v55, 0, sizeof(v55));
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v49 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v42 = 0u;
  int v39 = -1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 96));
  snprintf(__str, 0xFFuLL, "%s.XXXXXX", *(const char **)(v3 + 208));
  if ((*(_BYTE *)(v3 + 176) & 0x10) != 0)
  {
    uint64_t v8 = *(void **)(v2 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      uint64_t v10 = *(const char **)(v2 + 56);
      if (!v10) {
        uint64_t v10 = "[anonymous]";
      }
      int v56 = 136446466;
      stat v57 = v10;
      __int16 v58 = 1024;
      int v59 = 45;
      uint64_t v11 = v8;
    }

    else
    {
      CFIndex v18 = *(const char **)(v2 + 56);
      if (!v18) {
        CFIndex v18 = "[anonymous]";
      }
      int v56 = 136446466;
      stat v57 = v18;
      __int16 v58 = 1024;
      int v59 = 45;
      uint64_t v11 = &_os_log_default;
      uint64_t v9 = 2LL;
    }

    CFErrorRef v19 = (char *)_os_log_send_and_compose_impl(v9, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
    int v20 = 1362;
    CFIndex v21 = 45LL;
    goto LABEL_45;
  }

  if (*(void *)(v3 + 480))
  {
    os_log_t v4 = *(void **)(v2 + 72);
    if (v4)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v5 = 3LL;
      }
      else {
        uint64_t v5 = 2LL;
      }
      os_log_t v6 = *(const char **)(v2 + 56);
      if (!v6) {
        os_log_t v6 = "[anonymous]";
      }
      int v56 = 136446466;
      stat v57 = v6;
      __int16 v58 = 1024;
      int v59 = 16;
      os_log_t v7 = v4;
    }

    else
    {
      __int16 v22 = *(const char **)(v2 + 56);
      if (!v22) {
        __int16 v22 = "[anonymous]";
      }
      int v56 = 136446466;
      stat v57 = v22;
      __int16 v58 = 1024;
      int v59 = 16;
      os_log_t v7 = &_os_log_default;
      uint64_t v5 = 2LL;
    }

    CFErrorRef v19 = (char *)_os_log_send_and_compose_impl(v5, 0LL, 0LL, 0LL, &_mh_execute_header, v7, 16LL);
    int v20 = 1369;
    CFIndex v21 = 16LL;
LABEL_45:
    CFErrorRef v31 = sub_10000A444("_codex_uninstall_continue", "codex.c", v20, "com.apple.security.cryptex.posix", v21, 0LL, v19);
    CFErrorRef v25 = 0LL;
    goto LABEL_46;
  }

  int v12 = sub_1000153AC(v2, (uint64_t)&unk_100055D68, __str, &v39);
  if (v12)
  {
    int v13 = v12;
    uint64_t v14 = *(void **)(v2 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 2LL;
      }
      __int16 v16 = *(const char **)(v2 + 56);
      if (!v16) {
        __int16 v16 = "[anonymous]";
      }
      int v56 = 136446466;
      stat v57 = v16;
      __int16 v58 = 1024;
      int v59 = v13;
      int v17 = v14;
    }

    else
    {
      uint64_t v30 = *(const char **)(v2 + 56);
      if (!v30) {
        uint64_t v30 = "[anonymous]";
      }
      int v56 = 136446466;
      stat v57 = v30;
      __int16 v58 = 1024;
      int v59 = v12;
      int v17 = &_os_log_default;
      uint64_t v15 = 2LL;
    }

    CFErrorRef v19 = (char *)_os_log_send_and_compose_impl(v15, 0LL, 0LL, 0LL, &_mh_execute_header, v17, 16LL);
    CFIndex v21 = v13;
    int v20 = 1380;
    goto LABEL_45;
  }

  int v23 = v39;
  CFErrorRef v24 = sub_10001CCF4(v2, *(_DWORD *)(v2 + 1396), *(char **)(v3 + 208), v39);
  if (v24)
  {
    CFErrorRef v25 = v24;
    int v26 = *(void **)(v2 + 72);
    if (v26)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v27 = 3LL;
      }
      else {
        uint64_t v27 = 2LL;
      }
      uint64_t v28 = *(const char **)(v2 + 56);
      if (!v28) {
        uint64_t v28 = "[anonymous]";
      }
      int v56 = 136446210;
      stat v57 = v28;
      int v29 = v26;
    }

    else
    {
      __int128 v36 = *(const char **)(v2 + 56);
      if (!v36) {
        __int128 v36 = "[anonymous]";
      }
      int v56 = 136446210;
      stat v57 = v36;
      int v29 = &_os_log_default;
      uint64_t v27 = 2LL;
    }

    CFErrorRef v19 = (char *)_os_log_send_and_compose_impl(v27, 0LL, 0LL, 0LL, &_mh_execute_header, v29, 16LL);
    int v37 = 1389;
  }

  else
  {
    CFErrorRef v25 = sub_10001CCF4(v2, *(_DWORD *)(v2 + 1408), *(char **)(v3 + 208), v23);
    if (!v25)
    {
      a1[2] = 0LL;
      goto LABEL_61;
    }

    int v32 = *(void **)(v2 + 72);
    if (v32)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v33 = 3LL;
      }
      else {
        uint64_t v33 = 2LL;
      }
      __int128 v34 = *(const char **)(v2 + 56);
      if (!v34) {
        __int128 v34 = "[anonymous]";
      }
      int v56 = 136446210;
      stat v57 = v34;
      __int128 v35 = v32;
    }

    else
    {
      uint64_t v38 = *(const char **)(v2 + 56);
      if (!v38) {
        uint64_t v38 = "[anonymous]";
      }
      int v56 = 136446210;
      stat v57 = v38;
      __int128 v35 = &_os_log_default;
      uint64_t v33 = 2LL;
    }

    CFErrorRef v19 = (char *)_os_log_send_and_compose_impl(v33, 0LL, 0LL, 0LL, &_mh_execute_header, v35, 16LL);
    int v37 = 1398;
  }

  CFErrorRef v31 = sub_10000A444("_codex_uninstall_continue", "codex.c", v37, "com.apple.security.cryptex", 4LL, v25, v19);
LABEL_46:
  free(v19);
  a1[2] = (uint64_t)v31;
  if (!v31)
  {
LABEL_61:
    cryptex_async_f(v2, a1, sub_10001CF60);
    goto LABEL_62;
  }

  cryptex_target_async_f(v2, a1, sub_10001CED8);
LABEL_62:
  if (v39 != -1 && close(v39) == -1) {
    sub_10003E3CC(&v40, &v56);
  }
  if (v25) {
    CFRelease(v25);
  }
}

void **sub_10001737C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v8 = sub_10003C818((void *)a1, 0x38uLL);
  v8[3] = os_retain(a2);
  _OWORD v8[5] = a3;
  void v8[6] = a4;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 112));
  return sub_10002BA74((uint64_t)a2, *(_DWORD *)(a1 + 1404), v8, sub_1000173EC);
}

void sub_1000173EC(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  sub_100008BCC();
  int v8 = *__error();
  uint64_t v9 = *(os_log_s **)(v7 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 208);
      int v14 = 136315394;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      int v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "quire mount: %s: %@", (uint8_t *)&v14, 0x16u);
    }

    *__error() = v8;
    a4[2] = (uint64_t)CFRetain(a3);
    cryptex_target_async_f(v7, a4, sub_10001D12C);
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 208);
      int v14 = 136315138;
      uint64_t v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "quire mount: %s [no error]",  (uint8_t *)&v14,  0xCu);
    }

    *__error() = v8;
    a4[2] = 0LL;
    uint64_t v12 = *(void *)(*(void *)(a1 + 200) + 216LL);
    if (v12) {
      int v13 = (void *)(4LL * *(unsigned __int8 *)(v12 + 64));
    }
    else {
      int v13 = 0LL;
    }
    sub_10002D87C(a1, *(unsigned int *)(v7 + 1420), v13, a4, sub_10001D1B8);
  }

uint64_t sub_100017570(uint64_t a1, void *a2, unint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = *(const char **)(a1 + 56);
  int v11 = *__error();
  uint64_t v12 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = "[anonymous]";
    if (v10) {
      int v13 = v10;
    }
    int v16 = 136446210;
    int v17 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%{public}s: codex_unbootstrap occuring.",  (uint8_t *)&v16,  0xCu);
  }

  *__error() = v11;
  int v14 = sub_10003C818((void *)a1, 0x38uLL);
  v14[3] = os_retain(a2);
  void v14[4] = (void *)a3;
  v14[5] = a4;
  v14[6] = a5;
  return sub_10002F418(a2, *(unsigned int *)(a1 + 1420), (void *)((a3 >> 1) & 1), v14, sub_100017690);
}

void **sub_100017690(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  uint64_t v8 = a4[4];
  sub_100008BCC();
  if (a3) {
    CFTypeRef v9 = CFRetain(a3);
  }
  else {
    CFTypeRef v9 = 0LL;
  }
  a4[2] = (uint64_t)v9;
  uint64_t v10 = *(const char **)(v7 + 56);
  int v11 = *__error();
  uint64_t v12 = *(os_log_s **)(v7 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = "[anonymous]";
    uint64_t v14 = *(void *)(a1 + 208);
    if (v10) {
      int v13 = v10;
    }
    *(_DWORD *)__int128 buf = 136446466;
    int v39 = v13;
    __int16 v40 = 2080;
    uint64_t v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: quire unbootstrap: %s", buf, 0x16u);
  }

  *__error() = v11;
  if ((*(_BYTE *)(a1 + 176) & 0x10) != 0 && (v8 & 2) == 0)
  {
    uint64_t v15 = *(void **)(a1 + 72);
    if (v15)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v16 = 3LL;
      }
      else {
        uint64_t v16 = 2LL;
      }
      int v17 = *(const char **)(a1 + 56);
      if (!v17) {
        int v17 = "[anonymous]";
      }
      *(_DWORD *)__int128 buf = 136446210;
      int v39 = v17;
      CFIndex v18 = v15;
    }

    else
    {
      CFErrorRef v24 = *(const char **)(a1 + 56);
      if (!v24) {
        CFErrorRef v24 = "[anonymous]";
      }
      *(_DWORD *)__int128 buf = 136446210;
      int v39 = v24;
      CFIndex v18 = &_os_log_default;
      uint64_t v16 = 2LL;
    }

    CFErrorRef v25 = (char *)_os_log_send_and_compose_impl(v16, 0LL, 0LL, 0LL, &_mh_execute_header, v18, 16LL);
    int v26 = 1491;
LABEL_38:
    CFErrorRef v28 = sub_10000A444("_codex_unbootstrap_continue", "codex.c", v26, "com.apple.security.cryptex", 4LL, 0LL, v25);
    free(v25);
    a4[2] = (uint64_t)v28;
    return (void **)cryptex_target_async_f(v7, a4, sub_10001D4AC);
  }

  if (*(void *)(a1 + 480))
  {
    CFErrorRef v19 = *(void **)(a1 + 72);
    if (v19)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v20 = 3LL;
      }
      else {
        uint64_t v20 = 2LL;
      }
      CFIndex v21 = *(const char **)(a1 + 56);
      if (!v21) {
        CFIndex v21 = "[anonymous]";
      }
      *(_DWORD *)__int128 buf = 136446210;
      int v39 = v21;
      __int16 v22 = v19;
    }

    else
    {
      uint64_t v27 = *(const char **)(a1 + 56);
      if (!v27) {
        uint64_t v27 = "[anonymous]";
      }
      *(_DWORD *)__int128 buf = 136446210;
      int v39 = v27;
      __int16 v22 = &_os_log_default;
      uint64_t v20 = 2LL;
    }

    CFErrorRef v25 = (char *)_os_log_send_and_compose_impl(v20, 0LL, 0LL, 0LL, &_mh_execute_header, v22, 16LL);
    int v26 = 1502;
    goto LABEL_38;
  }

  if ((v8 & 1) != 0)
  {
    uint64_t v30 = *(const char **)(v7 + 56);
    int v31 = *__error();
    int v32 = *(os_log_s **)(v7 + 72);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = "[anonymous]";
      if (v30) {
        uint64_t v33 = v30;
      }
      *(_DWORD *)__int128 buf = 136446210;
      int v39 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}s: will force unmount", buf, 0xCu);
    }

    *__error() = v31;
    uint64_t v23 = 1LL;
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  __int128 v34 = *(const char **)(v7 + 56);
  int v35 = *__error();
  __int128 v36 = *(os_log_s **)(v7 + 72);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    int v37 = "[anonymous]";
    if (v34) {
      int v37 = v34;
    }
    *(_DWORD *)__int128 buf = 136446210;
    int v39 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "%{public}s: _codex_unbootstrap_continue progressing to quire unmount",  buf,  0xCu);
  }

  *__error() = v35;
  return sub_10002F8FC(a1, (void *)v23, a4, sub_10001D530);
}

void *sub_100017B18(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100039028(a1 + 144, a2);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  else {
    return os_retain((void *)(v7 - 80));
  }
}

uint64_t sub_100017B88(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_10003C818(a1, 0x38uLL);
  v6[5] = a2;
  void v6[6] = a3;
  v6[4] = (void *)sub_100015D20((uint64_t)a1, (uint64_t)"barrier");
  return cryptex_async_f(a1, v6, sub_100017BE8);
}

void sub_100017BE8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[4];
  sub_100008BCC();
  os_log_t v4 = *(const char **)(v2 + 56);
  int v5 = *__error();
  uint64_t v6 = *(os_log_s **)(v2 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    if (v4) {
      uint64_t v7 = v4;
    }
    int v8 = 136446210;
    CFTypeRef v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: enqueuing barrier",  (uint8_t *)&v8,  0xCu);
  }

  *__error() = v5;
  a1[3] = 0LL;
  **(void **)(v2 + 1376) = a1;
  *(void *)(v2 + 1376) = a1 + 3;
  sub_10001AB3C(v2, v3);
}

uint64_t sub_100017CE0(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_10003C818(a1, 0x28uLL);
  v6[3] = a2;
  v6[4] = a3;
  return cryptex_async_f(a1, v6, sub_100017D28);
}

void sub_100017D28(_DWORD *a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = os_retain((void *)qword_10005A840);
  *(void *)(v2 + 80) |= 4uLL;
  if ((void *)v2 == v3)
  {
    int v4 = cryptex_signature_seal();
    if (v4)
    {
      int v5 = *(const char **)(v2 + 56);
      int v6 = *__error();
      uint64_t v7 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = "[anonymous]";
        if (v5) {
          int v8 = v5;
        }
        int v9 = 136446466;
        uint64_t v10 = v8;
        __int16 v11 = 1024;
        int v12 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to seal hash slot: %{darwin.errno}d",  (uint8_t *)&v9,  0x12u);
      }

      *__error() = v6;
    }
  }

  else
  {
    int v4 = 0;
  }

  a1[2] = v4;
  dispatch_async_f(*(dispatch_queue_t *)(v2 + 96), a1, (dispatch_function_t)sub_10001D890);
  if (v3) {
    os_release(v3);
  }
}

void sub_100017E68(void *a1, void *a2, void *a3)
{
  int v5 = sub_10003C818(a1, 0x40uLL);
  v5[6] = a2;
  v5[7] = a3;
  v5[4] = xpc_array_create(0LL, 0LL);
  int v6 = (dispatch_queue_s *)sub_100008BDC();
  dispatch_async_f(v6, v5, (dispatch_function_t)sub_100017EC0);
}

uint64_t sub_100017EC0(void **a1)
{
  return sub_100017B88(*a1, a1, sub_10001DB8C);
}

uint64_t sub_100017ED4(uint64_t result, uint64_t a2)
{
  unint64_t v3 = 0LL;
  uint64_t v4 = result + 144;
  while (1)
  {
    uint64_t v5 = *(void *)(v4 + 8 * v3);
    if (v5) {
      break;
    }
LABEL_5:
    if (v3++ >= 0x24) {
      return result;
    }
  }

  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5 - 80);
    if ((result & 1) == 0) {
      return result;
    }
    uint64_t v5 = *(void *)(v5 + 8);
    if (!v5) {
      goto LABEL_5;
    }
  }

void sub_100017F34(uint64_t a1)
{
  object = (char *)sub_100008BC0();
  uint64_t v2 = (uint64_t *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 120);
  if (v3)
  {
    do
    {
      uint64_t v4 = *(dispatch_group_s **)(v3 + 40);
      uint64_t v5 = *(const char **)(a1 + 56);
      int v6 = *__error();
      uint64_t v7 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = "[anonymous]";
        if (v5) {
          int v8 = v5;
        }
        *(_DWORD *)__int128 buf = 136446210;
        int v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: uncorking import", buf, 0xCu);
      }

      *__error() = v6;
      uint64_t v9 = *v2;
      if (*v2 == v3)
      {
        uint64_t v13 = *(void *)(v3 + 24);
        *uint64_t v2 = v13;
        uint64_t v12 = a1 + 120;
        if (v13) {
          goto LABEL_10;
        }
      }

      else
      {
        do
        {
          uint64_t v10 = v9;
          uint64_t v9 = *(void *)(v9 + 24);
        }

        while (v9 != v3);
        uint64_t v11 = *(void *)(v3 + 24);
        *(void *)(v10 + 24) = v11;
        uint64_t v12 = v10 + 24;
        if (v11) {
          goto LABEL_10;
        }
      }

      *(void *)(a1 + 12_Block_object_dispose(va, 8) = v12;
LABEL_10:
      *(void *)(v3 + 24) = -1LL;
      dispatch_group_leave(v4);
      uint64_t v3 = *v2;
    }

    while (*v2);
  }

  uint64_t v14 = (char *)*((void *)object + 37);
  if (v14)
  {
    do
    {
      uint64_t v15 = *(char **)v14;
      uint64_t v16 = sub_100017B18(a1, v14 + 8, 0LL);
      if (!v16)
      {
        int v17 = *(const char **)(a1 + 56);
        int v18 = *__error();
        CFErrorRef v19 = *(os_log_s **)(a1 + 72);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 136446466;
          uint64_t v20 = "[anonymous]";
          if (v17) {
            uint64_t v20 = v17;
          }
          int v29 = v20;
          __int16 v30 = 2080;
          int v31 = v14 + 8;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%{public}s: lingering forerunner: %s",  buf,  0x16u);
        }

        *__error() = v18;
      }

      CFIndex v21 = *(const char **)(a1 + 56);
      int v22 = *__error();
      uint64_t v23 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136446466;
        CFErrorRef v24 = "[anonymous]";
        if (v21) {
          CFErrorRef v24 = v21;
        }
        int v29 = v24;
        __int16 v30 = 2080;
        int v31 = v14 + 8;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%{public}s: removing forerunner: %s",  buf,  0x16u);
      }

      *__error() = v22;
      CFErrorRef v25 = (char *)*((void *)object + 37);
      int v26 = object + 296;
      while (v25 != v14)
      {
        int v26 = v25;
        CFErrorRef v25 = *(char **)v25;
      }

      *(void *)int v26 = *(void *)v14;
      free(v14);
      if (v16) {
        os_release(v16);
      }
      uint64_t v14 = v15;
    }

    while (v15);
  }

  sub_100006034();
  dispatch_async_f(*(dispatch_queue_t *)(a1 + 96), 0LL, (dispatch_function_t)sub_10001869C);
  *(void *)(a1 + 80) |= 2uLL;
  if (object) {
    os_release(object);
  }
}

uint64_t sub_100018228(uint64_t a1, void *a2)
{
  uint64_t v3 = dup_np(*(unsigned int *)(a1 + a2[2]));
  uint64_t v4 = fdopendir(v3);
  for (uint64_t i = readdir(v4); i; uint64_t i = readdir(v4))
  {
    d_name = i->d_name;
    if (strcmp(i->d_name, ".") && strcmp(d_name, ".."))
    {
      uint64_t v7 = *(const char **)(a1 + 56);
      int v8 = *__error();
      uint64_t v9 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136446466;
        uint64_t v10 = "[anonymous]";
        if (v7) {
          uint64_t v10 = v7;
        }
        __int16 v40 = v10;
        __int16 v41 = 2080;
        __int128 v42 = d_name;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s: importing pre-existing cryptex: %s",  buf,  0x16u);
      }

      *__error() = v8;
      uint64_t v11 = openat(v3, d_name, 1048832);
      if ((v11 & 0x80000000) != 0)
      {
        int v29 = *__error();
        __int16 v30 = *(const char **)(a1 + 56);
        int v31 = *__error();
        int v32 = *(os_log_s **)(a1 + 72);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136446722;
          uint64_t v33 = "[anonymous]";
          if (v30) {
            uint64_t v33 = v30;
          }
          __int16 v40 = v33;
          __int16 v41 = 2080;
          __int128 v42 = d_name;
          __int16 v43 = 1024;
          int v44 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to open cryptex: %s: %{darwin.errno}d",  buf,  0x1Cu);
        }

        *__error() = v31;
        if ((_DWORD)v11 != -1 && close(v11) == -1) {
LABEL_42:
        }
          sub_10003E3CC(&v38, buf);
      }

      else
      {
        uint64_t v12 = (void *)cryptex_core_create(0LL);
        int v13 = cryptex_core_set_assets_from_directory(v12, v11);
        if (v13)
        {
          int v14 = v13;
          uint64_t v15 = *(const char **)(a1 + 56);
          int v16 = *__error();
          int v17 = *(os_log_s **)(a1 + 72);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136446722;
            int v18 = "[anonymous]";
            if (v15) {
              int v18 = v15;
            }
            __int16 v40 = v18;
            __int16 v41 = 2080;
            __int128 v42 = d_name;
            __int16 v43 = 1024;
            int v44 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to create core from directory: %s: %{darwin.errno}d",  buf,  0x1Cu);
          }

          *__error() = v16;
          if (v14 == 2)
          {
            CFErrorRef v19 = *(const char **)(a1 + 56);
            int v20 = *__error();
            CFIndex v21 = *(os_log_s **)(a1 + 72);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 136446466;
              int v22 = "[anonymous]";
              if (v19) {
                int v22 = v19;
              }
              __int16 v40 = v22;
              __int16 v41 = 2080;
              __int128 v42 = d_name;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%{public}s: removing broken cryptex: %s",  buf,  0x16u);
            }

            *__error() = v20;
            int v23 = sub_10003AB68(v3, d_name);
            if (v23)
            {
              int v24 = v23;
              CFErrorRef v25 = *(const char **)(a1 + 56);
              int v26 = *__error();
              uint64_t v27 = *(os_log_s **)(a1 + 72);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 136446722;
                CFErrorRef v28 = "[anonymous]";
                if (v25) {
                  CFErrorRef v28 = v25;
                }
                __int16 v40 = v28;
                __int16 v41 = 2080;
                __int128 v42 = d_name;
                __int16 v43 = 1024;
                int v44 = v24;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to remove core directory: %s: %{darwin.errno}d",  buf,  0x1Cu);
              }

              *__error() = v26;
            }
          }
        }

        else
        {
          if ((*a2 & 1LL) != 0) {
            uint64_t v34 = 1LL;
          }
          else {
            uint64_t v34 = 2LL;
          }
          cryptex_core_set_nonce_persistence(v12, v34);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 104));
          int v35 = sub_10003C818((void *)a1, 0x98uLL);
          v35[17] = sub_100018774;
          sub_1000189A8(a1, v12, v35);
        }

        if (close(v11) == -1) {
          goto LABEL_42;
        }
        if (v12) {
          os_release(v12);
        }
      }
    }
  }

  uint64_t result = closedir(v4);
  if ((_DWORD)result == -1) {
    sub_10003E35C(&v38, buf);
  }
  return result;
}

void sub_10001869C()
{
  uint64_t v0 = sub_100008BC0();
  int v1 = openat(v0[23], "init", 2560, 438LL);
  if ((v1 & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v2 = *__error();
  if (v2) {
    BOOL v3 = v2 == 17;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    sub_10003F280(&v5, v6);
  }
  uint64_t v4 = (void *)*((void *)v0 + 41);
  if (v4) {
    os_release(v4);
  }
  *((void *)v0 + 41) = 0LL;
  if (v1 != -1 && close(v1) == -1) {
    sub_10003E3CC(&v5, v6);
  }
  os_release(v0);
}

void sub_100018774(uint64_t a1, void *a2, void *a3, const void *a4)
{
  if (a4)
  {
    uint64_t v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = *(const char **)(a1 + 56);
      if (!v9) {
        uint64_t v9 = "[anonymous]";
      }
      *(_DWORD *)__int128 buf = 136446210;
      int v20 = v9;
      uint64_t v10 = v7;
    }

    else
    {
      uint64_t v15 = *(const char **)(a1 + 56);
      if (!v15) {
        uint64_t v15 = "[anonymous]";
      }
      *(_DWORD *)__int128 buf = 136446210;
      int v20 = v15;
      uint64_t v10 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    int v16 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    CFErrorRef v17 = sub_10000A444("_codex_import_initial_continue", "codex.c", 1907, "com.apple.security.cryptex", 15LL, a4, v16);
    free(v16);
    int v18 = sub_10003C818((void *)a1, 0x20uLL);
    v18[3] = os_retain(a2);
    dispatch_async_f(*(dispatch_queue_t *)(a1 + 96), v18, (dispatch_function_t)sub_10001B1E0);
    if (v17) {
      CFRelease(v17);
    }
  }

  else
  {
    int v12 = *__error();
    int v13 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = (const char *)a3[26];
      *(_DWORD *)__int128 buf = 136315138;
      int v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "imported: %s [no error]", buf, 0xCu);
    }

    *__error() = v12;
    sub_10001737C(a1, a3, 0LL, sub_10001B0BC);
  }

void sub_1000189A8(uint64_t a1, void *a2, void *a3)
{
  int v6 = sub_100008BC0();
  sub_100008BCC();
  dispatch_group_t v7 = dispatch_group_create();
  dispatch_set_context(v7, a3);
  a3[4] = os_retain(a2);
  a3[5] = v7;
  uint64_t v8 = a2[21];
  uint64_t asset = cryptex_core_get_asset(a2, &_cryptex_asset_type_im4m);
  if (os_variant_allows_internal_security_policies("com.apple.security.cryptexd")
    && v8
    && (*(_BYTE *)(v8 + 40) & 4) != 0
    || asset
    && ((memset(&v44, 0, sizeof(v44)), !fstat(*(_DWORD *)(asset + 16), &v44)) ? (BOOL v10 = v44.st_size == 0) : (BOOL v10 = 0),
        v10 && os_variant_allows_internal_security_policies("com.apple.security.cryptexd")))
  {
    a2[5] |= 1uLL;
  }

  dispatch_group_enter(v7);
  else {
    BOOL v11 = 0LL;
  }
  int v12 = (void *)cryptex_magister_create(a2, v11);
  cryptex_set_target_object(v12, a1);
  image_uint64_t asset = cryptex_core_get_image_asset(a2);
  int v14 = cryptex_asset_evaluate(image_asset, v6 + 128);
  if (v14)
  {
    int v35 = v14;
    uint64_t v39 = 0LL;
    memset(&v44, 0, 80);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v36 = 3LL;
    }
    else {
      uint64_t v36 = 2LL;
    }
    uint64_t v37 = *(void *)(*(void *)(image_asset + 8) + 40LL);
    int v40 = 136315394;
    uint64_t v41 = v37;
    __int16 v42 = 1024;
    int v43 = v35;
    uint64_t v38 = _os_log_send_and_compose_impl(v36, &v39, &v44, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    _os_crash_msg(v39, v38);
    __break(1u);
  }

  info_uint64_t asset = cryptex_core_get_info_asset(a2);
  uint64_t v16 = info_asset;
  if ((*(_BYTE *)(v12[11] + 40LL) & 1) != 0)
  {
    if (!info_asset) {
      goto LABEL_36;
    }
    int v21 = sub_10003BB8C(*(_DWORD *)(info_asset + 16), a3 + 9);
    if (!v21) {
      goto LABEL_36;
    }
    int v22 = v21;
    uint64_t v39 = 0LL;
    memset(&v44, 0, 80);
    int v6 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v23 = 3LL;
    }
    else {
      uint64_t v23 = 2LL;
    }
    uint64_t v24 = *(void *)(*(void *)(v16 + 8) + 40LL);
    int v40 = 136315394;
    uint64_t v41 = v24;
    __int16 v42 = 1024;
    int v43 = v22;
    uint64_t v25 = _os_log_send_and_compose_impl(v23, &v39, &v44, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    _os_crash_msg(v39, v25);
    __break(1u);
    goto LABEL_30;
  }

  if (!cryptex_core_image_authapfs_enabled(a2))
  {
LABEL_30:
    dispatch_group_enter(v7);
    cryptex_magister_authenticate(v12, *(void *)(v12[11] + 176LL), a3, sub_100018EE0);
    if (v16)
    {
LABEL_23:
      dispatch_group_enter(v7);
      cryptex_magister_authenticate(v12, *(void *)(v16 + 8), a3, sub_100019040);
      goto LABEL_36;
    }

    goto LABEL_31;
  }

  CFErrorRef v17 = *(const char **)(a1 + 56);
  int v18 = *__error();
  CFErrorRef v19 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v20 = "[anonymous]";
    if (v17) {
      int v20 = v17;
    }
    v44.st_dev = 136446210;
    *(void *)&v44.st_mode = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%{public}s: AuthAPFS enabled, skip up-front dmg authentication.",  (uint8_t *)&v44,  0xCu);
  }

  *__error() = v18;
  if (v16) {
    goto LABEL_23;
  }
LABEL_31:
  int v26 = *(const char **)(a1 + 56);
  int v27 = *__error();
  CFErrorRef v28 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    int v29 = "[anonymous]";
    __darwin_ino64_t v30 = _cryptex_asset_type_c411[5];
    if (v26) {
      int v29 = v26;
    }
    v44.st_dev = 136446466;
    *(void *)&v44.st_mode = v29;
    WORD2(v44.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v44.st_ino + 6) = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "%{public}s: will use adhoc %s, skip authenticating it",  (uint8_t *)&v44,  0x16u);
  }

  *__error() = v27;
LABEL_36:
  if ((*(_BYTE *)(a1 + 80) & 2) == 0 && a3[18])
  {
    int v31 = *(const char **)(a1 + 56);
    int v32 = *__error();
    uint64_t v33 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = "[anonymous]";
      if (v31) {
        uint64_t v34 = v31;
      }
      v44.st_dev = 136446210;
      *(void *)&v44.st_mode = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%{public}s: corking import",  (uint8_t *)&v44,  0xCu);
    }

    *__error() = v32;
    a3[3] = 0LL;
    **(void **)(a1 + 12_Block_object_dispose(va, 8) = a3;
    *(void *)(a1 + 12_Block_object_dispose(va, 8) = a3 + 3;
    dispatch_group_enter(v7);
  }

  a3[16] = sub_100015D20(a1, (uint64_t)"import");
  dispatch_group_notify_f(v7, *(dispatch_queue_t *)(a1 + 32), a3, (dispatch_function_t)sub_10001919C);
  dispatch_group_leave(v7);
  cryptex_activate(v12);
  if (v7) {
    os_release(v7);
  }
  os_release(v12);
  if (v6) {
    os_release(v6);
  }
}

void sub_100018EE0(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  uint64_t v9 = (dispatch_group_s *)a5[5];
  int v10 = *__error();
  BOOL v11 = *(os_log_s **)(v8 + 72);
  if (a4)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a2 + 40);
      uint64_t v12 = *(void *)(a2 + 48);
      int v18 = 136315650;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s (%s) authentication: %@",  (uint8_t *)&v18,  0x20u);
    }

    *__error() = v10;
    CFTypeRef v14 = CFRetain(a4);
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a2 + 40);
      uint64_t v15 = *(void *)(a2 + 48);
      int v18 = 136315394;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      uint64_t v21 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s (%s) authentication [no error]",  (uint8_t *)&v18,  0x16u);
    }

    CFErrorRef v17 = __error();
    CFTypeRef v14 = 0LL;
    int *v17 = v10;
  }

  a5[7] = (uint64_t)v14;
  dispatch_group_leave(v9);
}

void sub_100019040(uint64_t a1, uint64_t a2, __n128 *a3, const void *a4, uint64_t *a5)
{
  uint64_t v9 = *a5;
  int v10 = (dispatch_group_s *)a5[5];
  int v11 = *__error();
  uint64_t v12 = *(os_log_s **)(v9 + 72);
  if (a4)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a2 + 40);
      int v15 = 136315394;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      int v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s authentication: %@", (uint8_t *)&v15, 0x16u);
    }

    *__error() = v11;
    a5[8] = (uint64_t)CFRetain(a4);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a2 + 40);
      int v15 = 136315138;
      uint64_t v16 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s authentication [no error]",  (uint8_t *)&v15,  0xCu);
    }

    *__error() = v11;
    a5[8] = 0LL;
    sub_10003C3C0((__n128 *)(a5 + 9), a3);
  }

  dispatch_group_leave(v10);
}

void sub_10001919C(uint64_t a1)
{
  int v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(const void **)(a1 + 48);
  uint64_t v4 = *(const void **)(a1 + 56);
  int v6 = *(const void **)(a1 + 64);
  uint64_t v159 = 0LL;
  memset(v158, 0, sizeof(v158));
  uint64_t v157 = 0LL;
  __int128 v156 = 0u;
  __int128 v154 = 0u;
  __int128 v155 = 0u;
  __int128 v152 = 0u;
  __int128 v153 = 0u;
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  __int128 v148 = 0u;
  *(_OWORD *)__int128 xdict = 0u;
  context = *(void **)(a1 + 144);
  CFTypeRef cf = v6;
  v147 = 0LL;
  BOOL v146 = 0;
  sub_100008BCC();
  sub_10003C3C0(v158, (__n128 *)(a1 + 72));
  if (v4)
  {
    dispatch_group_t v7 = (void *)*((void *)v2 + 9);
    if (v7)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = (const char *)*((void *)v2 + 7);
      int v10 = *(char **)(*(void *)(v3 + 176) + 40LL);
      if (!v9) {
        uint64_t v9 = "[anonymous]";
      }
      int buf = 136446466;
      v163 = v9;
      __int16 v164 = 2080;
      v165 = v10;
      int v11 = v7;
    }

    else
    {
      uint64_t v16 = "[anonymous]";
      if (*((void *)v2 + 7)) {
        uint64_t v16 = (const char *)*((void *)v2 + 7);
      }
      __int16 v17 = *(char **)(*(void *)(v3 + 176) + 40LL);
      int buf = 136446466;
      v163 = v16;
      __int16 v164 = 2080;
      v165 = v17;
      int v11 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    int v18 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
    uint64_t v19 = "com.apple.security.cryptex";
    int v20 = 614;
    CFIndex v21 = 14LL;
    __int16 v22 = v4;
LABEL_34:
    CFErrorRef v31 = sub_10000A444("_codex_import_core_continue", "codex.c", v20, v19, v21, v22, v18);
    free(v18);
    int v32 = 0LL;
LABEL_35:
    uint64_t v33 = 0LL;
LABEL_36:
    uint64_t v34 = 0LL;
    goto LABEL_37;
  }

  if (v5)
  {
    uint64_t v12 = (void *)*((void *)v2 + 9);
    if (v12)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      uint64_t v14 = (const char *)*((void *)v2 + 7);
      if (!v14) {
        uint64_t v14 = "[anonymous]";
      }
      int buf = 136446210;
      v163 = v14;
      int v15 = v12;
    }

    else
    {
      __darwin_ino64_t v30 = (const char *)*((void *)v2 + 7);
      if (!v30) {
        __darwin_ino64_t v30 = "[anonymous]";
      }
      int buf = 136446210;
      v163 = v30;
      int v15 = &_os_log_default;
      uint64_t v13 = 2LL;
    }

    int v18 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
    uint64_t v19 = "com.apple.security.cryptex";
    int v20 = 623;
    CFIndex v21 = 14LL;
    __int16 v22 = v5;
    goto LABEL_34;
  }

  info_uint64_t asset = cryptex_core_get_info_asset(v3);
  if (info_asset)
  {
    if (cf)
    {
      uint64_t v24 = info_asset;
      uint64_t v25 = (void *)*((void *)v2 + 9);
      if (v25)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
          uint64_t v26 = 3LL;
        }
        else {
          uint64_t v26 = 2LL;
        }
        int v27 = (const char *)*((void *)v2 + 7);
        CFErrorRef v28 = *(char **)(*(void *)(v24 + 8) + 40LL);
        if (!v27) {
          int v27 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v27;
        __int16 v164 = 2080;
        v165 = v28;
        int v29 = v25;
      }

      else
      {
        char v75 = "[anonymous]";
        if (*((void *)v2 + 7)) {
          char v75 = (const char *)*((void *)v2 + 7);
        }
        int v76 = *(char **)(*(void *)(info_asset + 8) + 40LL);
        int buf = 136446466;
        v163 = v75;
        __int16 v164 = 2080;
        v165 = v76;
        int v29 = &_os_log_default;
        uint64_t v26 = 2LL;
      }

      int v18 = (char *)_os_log_send_and_compose_impl(v26, 0LL, 0LL, 0LL, &_mh_execute_header, v29, 16LL);
      uint64_t v19 = "com.apple.security.cryptex";
      int v20 = 634;
      CFIndex v21 = 14LL;
      __int16 v22 = cf;
      goto LABEL_34;
    }

    v66 = (void *)xpc_create_from_plist(v158[0].n128_u64[0]);
    if (!v66)
    {
      __int128 v77 = (void *)*((void *)v2 + 9);
      if (v77)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
          uint64_t v78 = 3LL;
        }
        else {
          uint64_t v78 = 2LL;
        }
        __int128 v79 = (const char *)*((void *)v2 + 7);
        if (!v79) {
          __int128 v79 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v79;
        __int16 v164 = 1024;
        LODWORD(v165) = 212;
        __int128 v80 = v77;
      }

      else
      {
        v114 = (const char *)*((void *)v2 + 7);
        if (!v114) {
          v114 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v114;
        __int16 v164 = 1024;
        LODWORD(v165) = 212;
        __int128 v80 = &_os_log_default;
        uint64_t v78 = 2LL;
      }

      int v18 = (char *)_os_log_send_and_compose_impl(v78, 0LL, 0LL, 0LL, &_mh_execute_header, v80, 16LL);
      uint64_t v19 = "com.apple.security.cryptex.posix";
      int v20 = 642;
      CFIndex v21 = 212LL;
      __int16 v22 = 0LL;
      goto LABEL_34;
    }

    int v32 = v66;
    if (xpc_get_type(v66) != (xpc_type_t)&_xpc_type_dictionary)
    {
      __int16 v67 = xpc_copy_description(v32);
      CFErrorRef v68 = v67;
      CFErrorRef v69 = (void *)*((void *)v2 + 9);
      if (v69)
      {
        BOOL v70 = os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        uint64_t v71 = (const char *)*((void *)v2 + 7);
        if (v70) {
          uint64_t v72 = 3LL;
        }
        else {
          uint64_t v72 = 2LL;
        }
        int buf = 136446722;
        if (v71) {
          BOOL v73 = v71;
        }
        else {
          BOOL v73 = "[anonymous]";
        }
        v163 = v73;
        __int16 v164 = 2080;
        v165 = v68;
        __int16 v166 = 1024;
        LODWORD(v167) = 212;
        int v74 = v69;
      }

      else
      {
        stat v112 = "[anonymous]";
        if (*((void *)v2 + 7)) {
          stat v112 = (const char *)*((void *)v2 + 7);
        }
        int buf = 136446722;
        v163 = v112;
        __int16 v164 = 2080;
        v165 = v67;
        __int16 v166 = 1024;
        LODWORD(v167) = 212;
        int v74 = &_os_log_default;
        uint64_t v72 = 2LL;
      }

      v96 = (char *)_os_log_send_and_compose_impl(v72, 0LL, 0LL, 0LL, &_mh_execute_header, v74, 16LL);
      int v98 = 652;
      CFIndex v97 = 212LL;
LABEL_161:
      CFErrorRef v31 = sub_10000A444( "_codex_import_core_continue",  "codex.c",  v98,  "com.apple.security.cryptex.posix",  v97,  0LL,  v96);
      free(v96);
      v113 = v68;
LABEL_162:
      free(v113);
      goto LABEL_35;
    }

    if (!os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_DEBUG))
    {
      __int128 v53 = v32;
      __int128 v47 = context;
      if (context) {
        goto LABEL_114;
      }
      goto LABEL_76;
    }

    __int128 v54 = xpc_copy_description(v32);
    __int16 v106 = (const char *)*((void *)v2 + 7);
    int v107 = *__error();
    __int16 v108 = (os_log_s *)*((void *)v2 + 9);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
    {
      v109 = "[anonymous]";
      if (v106) {
        v109 = v106;
      }
      int buf = 136446466;
      v163 = v109;
      __int16 v164 = 2080;
      v165 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEBUG,  "%{public}s: importing Info.plist: %s",  (uint8_t *)&buf,  0x16u);
    }

    *__error() = v107;
    __int128 v53 = v32;
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    __int128 v47 = context;
  }

  else
  {
    uint64_t v38 = (const char *)*((void *)v2 + 7);
    int v39 = *__error();
    int v40 = (os_log_s *)*((void *)v2 + 9);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = "[anonymous]";
      if (v38) {
        uint64_t v41 = v38;
      }
      int buf = 136446210;
      v163 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "%{public}s: no Info.plist found in core, generating adhoc one",  (uint8_t *)&buf,  0xCu);
    }

    *__error() = v39;
    identifier = (const char *)cryptex_core_generate_identifier(v3);
    version = (char *)cryptex_core_generate_version(v3);
    v142 = (char *)identifier;
    xpc_object_t v44 = xpc_string_create(identifier);
    xpc_object_t v45 = xpc_string_create(version);
    __int128 keys = *(_OWORD *)off_1000561E0;
    values[0] = v44;
    values[1] = v45;
    xpc_object_t v46 = xpc_dictionary_create((const char *const *)&keys, values, 2uLL);
    __int128 v47 = context;
    if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_DEBUG))
    {
      __int128 v48 = version;
      v139 = xpc_copy_description(v46);
      __int128 v49 = (const char *)*((void *)v2 + 7);
      int v50 = *__error();
      __int128 v51 = (os_log_s *)*((void *)v2 + 9);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        __int128 v52 = "[anonymous]";
        if (v49) {
          __int128 v52 = v49;
        }
        int buf = 136446466;
        v163 = v52;
        __int16 v164 = 2080;
        v165 = v139;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEBUG,  "%{public}s: generated Info.plist: %s",  (uint8_t *)&buf,  0x16u);
      }

      *__error() = v50;
      free(v139);
      version = v48;
      __int128 v47 = context;
    }

    if (v45) {
      os_release(v45);
    }
    uint64_t v5 = 0LL;
    uint64_t v4 = 0LL;
    if (v44) {
      os_release(v44);
    }
    free(version);
    int v32 = 0LL;
    __int128 v53 = v46;
    __int128 v54 = v142;
  }

  free(v54);
  if (v47) {
    goto LABEL_114;
  }
LABEL_76:
  v138 = v53;
  v140 = v5;
  v141 = v4;
  __int16 v55 = sub_100008BC0();
  v143 = v55 + 37;
  object = v55;
  int v56 = (void *)v55[37];
  while (v56)
  {
    stat v57 = v32;
    __int16 v58 = (void *)*v56;
    int v59 = memcmp((const void *)(*(void *)(v3 + 160) + 112LL), (char *)v56 + 3335, 0x30uLL);
    if (!v59)
    {
      uint64_t v60 = (const char *)*((void *)v2 + 7);
      int v61 = *__error();
      __int16 v62 = (os_log_s *)*((void *)v2 + 9);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        int buf = 136446722;
        int v63 = "[anonymous]";
        if (v60) {
          int v63 = v60;
        }
        v163 = v63;
        __int16 v164 = 2080;
        v165 = (char *)(v56 + 1);
        __int16 v166 = 2080;
        v167 = (char *)v56 + 3383;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEBUG,  "%{public}s: found forerunner; will carry on the legacy: name = %s, hash = %s",
          (uint8_t *)&buf,
          0x20u);
      }

      *__error() = v61;
      int v64 = v143;
      for (uint64_t i = (void *)*v143; i != v56; uint64_t i = (void *)*i)
        int v64 = i;
      void *v64 = *v56;
      *int v56 = -1LL;
      __int128 v47 = v56;
    }

    int v56 = v58;
    int v32 = v57;
    if (!v59) {
      goto LABEL_111;
    }
  }

  __int128 v47 = 0LL;
LABEL_111:
  if (object) {
    os_release(object);
  }
  v147 = v47;
  uint64_t v5 = v140;
  uint64_t v4 = v141;
  __int128 v47 = context;
  __int128 v53 = v138;
LABEL_114:
  uint64_t v81 = *(void *)(v3 + 216);
  if (v81) {
    BOOL v82 = *(unsigned __int8 *)(v81 + 64) != 0;
  }
  else {
    BOOL v82 = 0;
  }
  int v83 = sub_10002AF2C(v53, &v147, (uint64_t)&v148, v82);
  if (v83)
  {
    int v84 = v83;
    __int128 v85 = xpc_copy_description(v53);
    CFErrorRef v68 = v85;
    uint64_t v86 = (void *)*((void *)v2 + 9);
    if (v86)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
        uint64_t v87 = 3LL;
      }
      else {
        uint64_t v87 = 2LL;
      }
      int v88 = (const char *)*((void *)v2 + 7);
      int buf = 136446722;
      if (!v88) {
        int v88 = "[anonymous]";
      }
      v163 = v88;
      __int16 v164 = 2080;
      v165 = v68;
      __int16 v166 = 1024;
      LODWORD(v167) = v84;
      __int16 v89 = v86;
    }

    else
    {
      v95 = (const char *)*((void *)v2 + 7);
      if (!v95) {
        v95 = "[anonymous]";
      }
      int buf = 136446722;
      v163 = v95;
      __int16 v164 = 2080;
      v165 = v85;
      __int16 v166 = 1024;
      LODWORD(v167) = v84;
      __int16 v89 = &_os_log_default;
      uint64_t v87 = 2LL;
    }

    v96 = (char *)_os_log_send_and_compose_impl(v87, 0LL, 0LL, 0LL, &_mh_execute_header, v89, 16LL);
    CFIndex v97 = v84;
    int v98 = 686;
    goto LABEL_161;
  }

  int v90 = sub_100017B18((uint64_t)v2, (char *)v148, 0LL);
  if (v90)
  {
    uint64_t v34 = v90;
    v47[4] = os_retain(v90);
    v91 = (void *)*((void *)v2 + 9);
    if (v91)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
        uint64_t v92 = 3LL;
      }
      else {
        uint64_t v92 = 2LL;
      }
      v93 = (const char *)*((void *)v2 + 7);
      if (!v93) {
        v93 = "[anonymous]";
      }
      int buf = 136446466;
      v163 = v93;
      __int16 v164 = 2080;
      v165 = (char *)v148;
      v94 = v91;
    }

    else
    {
      __int16 v110 = (const char *)*((void *)v2 + 7);
      if (!v110) {
        __int16 v110 = "[anonymous]";
      }
      int buf = 136446466;
      v163 = v110;
      __int16 v164 = 2080;
      v165 = (char *)v148;
      v94 = &_os_log_default;
      uint64_t v92 = 2LL;
    }

    v111 = (char *)_os_log_send_and_compose_impl(v92, 0LL, 0LL, 0LL, &_mh_execute_header, v94, 16LL);
    CFErrorRef v31 = sub_10000A444("_codex_import_core_continue", "codex.c", 696, "com.apple.security.cryptex", 17LL, 0LL, v111);
    free(v111);
    uint64_t v33 = 0LL;
    goto LABEL_37;
  }

  if (xpc_dictionary_get_array(xdict[1], "Dependencies"))
  {
    if (!v47)
    {
      __int16 v121 = (void *)*((void *)v2 + 9);
      if (v121)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
          uint64_t v122 = 3LL;
        }
        else {
          uint64_t v122 = 2LL;
        }
        __int16 v123 = (const char *)*((void *)v2 + 7);
        if (!v123) {
          __int16 v123 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v123;
        __int16 v164 = 1024;
        LODWORD(v165) = 45;
        v124 = v121;
      }

      else
      {
        v126 = (const char *)*((void *)v2 + 7);
        if (!v126) {
          v126 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v126;
        __int16 v164 = 1024;
        LODWORD(v165) = 45;
        v124 = &_os_log_default;
        uint64_t v122 = 2LL;
      }

      __int16 v127 = (char *)_os_log_send_and_compose_impl(v122, 0LL, 0LL, 0LL, &_mh_execute_header, v124, 16LL);
      uint64_t v128 = "com.apple.security.cryptex.posix";
      int v129 = 708;
      CFIndex v130 = 45LL;
      goto LABEL_204;
    }

    int v99 = sub_10002B438((uint64_t)&v148, *((unsigned int *)v47 + 16));
    if (v99)
    {
      int v100 = v99;
      v101 = xpc_copy_description(v53);
      CFErrorRef v68 = v101;
      __int16 v102 = (void *)*((void *)v2 + 9);
      if (v102)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
          uint64_t v103 = 3LL;
        }
        else {
          uint64_t v103 = 2LL;
        }
        __int16 v104 = (const char *)*((void *)v2 + 7);
        int buf = 136446722;
        if (!v104) {
          __int16 v104 = "[anonymous]";
        }
        v163 = v104;
        __int16 v164 = 2080;
        v165 = v68;
        __int16 v166 = 1024;
        LODWORD(v167) = v100;
        v105 = v102;
      }

      else
      {
        v125 = (const char *)*((void *)v2 + 7);
        if (!v125) {
          v125 = "[anonymous]";
        }
        int buf = 136446722;
        v163 = v125;
        __int16 v164 = 2080;
        v165 = v101;
        __int16 v166 = 1024;
        LODWORD(v167) = v100;
        v105 = &_os_log_default;
        uint64_t v103 = 2LL;
      }

      v96 = (char *)_os_log_send_and_compose_impl(v103, 0LL, 0LL, 0LL, &_mh_execute_header, v105, 16LL);
      CFIndex v97 = v100;
      int v98 = 720;
      goto LABEL_161;
    }
  }

  if ((_BYTE)v157)
  {
    int v115 = sub_10000F554(&v146);
    if (v115)
    {
      int v116 = v115;
      __int16 v117 = (void *)*((void *)v2 + 9);
      if (v117)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
          uint64_t v118 = 3LL;
        }
        else {
          uint64_t v118 = 2LL;
        }
        __int16 v119 = (const char *)*((void *)v2 + 7);
        if (!v119) {
          __int16 v119 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v119;
        __int16 v164 = 1024;
        LODWORD(v165) = v116;
        off_t v120 = v117;
      }

      else
      {
        v131 = (const char *)*((void *)v2 + 7);
        if (!v131) {
          v131 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v131;
        __int16 v164 = 1024;
        LODWORD(v165) = v115;
        off_t v120 = &_os_log_default;
        uint64_t v118 = 2LL;
      }

      __int16 v127 = (char *)_os_log_send_and_compose_impl(v118, 0LL, 0LL, 0LL, &_mh_execute_header, v120, 16LL);
      CFIndex v130 = v116;
      uint64_t v128 = "com.apple.security.cryptex.posix";
      int v129 = 729;
LABEL_204:
      CFErrorRef v31 = sub_10000A444("_codex_import_core_continue", "codex.c", v129, v128, v130, 0LL, v127);
      v113 = v127;
      goto LABEL_162;
    }

    if (!v146)
    {
      v132 = (void *)*((void *)v2 + 9);
      if (v132)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR)) {
          uint64_t v133 = 3LL;
        }
        else {
          uint64_t v133 = 2LL;
        }
        v134 = (const char *)*((void *)v2 + 7);
        if (!v134) {
          v134 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v134;
        __int16 v164 = 2082;
        v165 = (char *)v148;
        v135 = v132;
      }

      else
      {
        v136 = (const char *)*((void *)v2 + 7);
        if (!v136) {
          v136 = "[anonymous]";
        }
        int buf = 136446466;
        v163 = v136;
        __int16 v164 = 2082;
        v165 = (char *)v148;
        v135 = &_os_log_default;
        uint64_t v133 = 2LL;
      }

      __int16 v127 = (char *)_os_log_send_and_compose_impl(v133, 0LL, 0LL, 0LL, &_mh_execute_header, v135, 16LL);
      uint64_t v128 = "com.apple.security.cryptex";
      int v129 = 735;
      CFIndex v130 = 20LL;
      goto LABEL_204;
    }
  }

  if (xpc_dictionary_get_BOOL(xdict[1], "NoCode") || (*(_BYTE *)(v3 + 40) & 4) != 0) {
    sub_10002B814((uint64_t)&v148);
  }
  uint64_t v33 = (void *)sub_10002B820(v2, (void *)v3, (uint64_t *)&v148, 4LL);
  cryptex_set_target_object(v33, v2);
  cryptex_activate(v33);
  sub_10001A5FC((uint64_t)v2, v33);
  if (!v47)
  {
    CFErrorRef v31 = 0LL;
    goto LABEL_36;
  }

  CFErrorRef v31 = 0LL;
  uint64_t v34 = 0LL;
  v47[4] = os_retain(v33);
LABEL_37:
  sub_10003C5AC(v158);
  sub_10002AE08((uint64_t)&v148);
  int v35 = *(void **)(a1 + 32);
  uint64_t v37 = *(void **)(a1 + 128);
  uint64_t v36 = *(void (**)(void *, void, void *, CFErrorRef))(a1 + 136);
  if (v36) {
    v36(v2, *(void *)(a1 + 32), v33, v31);
  }
  sub_10001AB3C((uint64_t)v2, v37);
  sub_10003C8F0((void **)a1);
  if (v35) {
    os_release(v35);
  }
  if (context)
  {
    if (v31)
    {
      context[2] = CFRetain(v31);
      cryptex_target_async_f(v2, context, sub_100015E3C);
    }

    else
    {
      dispatch_async_f(*((dispatch_queue_t *)v2 + 12), context, (dispatch_function_t)sub_10001A780);
    }
  }

  free(v147);
  if (v34) {
    os_release(v34);
  }
  if (v33) {
    os_release(v33);
  }
  if (v32) {
    os_release(v32);
  }
  if (v31) {
    CFRelease(v31);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t sub_10001A5FC(uint64_t a1, void *a2)
{
  if (a2[26]) {
    uint64_t v4 = (const char *)a2[26];
  }
  else {
    uint64_t v4 = "unknown quire";
  }
  uint64_t v5 = *(const char **)(a1 + 56);
  int v6 = *__error();
  dispatch_group_t v7 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = "[anonymous]";
    uint64_t v9 = a2[26];
    if (v5) {
      uint64_t v8 = v5;
    }
    *(_DWORD *)int buf = 136446466;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    uint64_t v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: added cryptex: %s", buf, 0x16u);
  }

  *__error() = v6;
  sub_100038EFC(a1 + 144, (uint64_t)(a2 + 10));
  os_retain(a2);
  int v10 = calloc(1uLL, 0x30uLL);
  if (!v10) {
    sub_10003F2F0(&v14, buf);
  }
  uint64_t v11 = (uint64_t)v10;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v12 = strdup(v4);
      if (v12) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    uint64_t v12 = strdup(v4);
    if (!v12) {
      sub_10003F3B4(v4, &v14, buf);
    }
  }

  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = os_transaction_create(v12);
  sub_100038EC4(v11, *(char **)(v11 + 32));
  return sub_100038EFC(a1 + 1056, v11);
}

uint64_t sub_10001A780(void *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[4];
  uint64_t v4 = *(const char **)(a1[3] + 120LL);
  uint64_t v5 = *(const char **)(v3 + 208);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*a1 + 96LL));
  int v6 = *(const char **)(v2 + 56);
  int v7 = *__error();
  uint64_t v8 = *(os_log_s **)(v2 + 72);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = "[anonymous]";
    *(_DWORD *)int buf = 136446722;
    if (v6) {
      uint64_t v9 = v6;
    }
    __darwin_ino64_t v30 = v9;
    __int16 v31 = 2080;
    int v32 = v4;
    __int16 v33 = 2080;
    uint64_t v34 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s: renaming: src = %s, dst = %s",  buf,  0x20u);
  }

  *__error() = v7;
  uint64_t v10 = 1408LL;
  if (*(void *)(*(void *)(v3 + 200) + 48LL) > 1uLL) {
    uint64_t v10 = 1396LL;
  }
  if (renameat(*(_DWORD *)(v2 + 1392), v4, *(_DWORD *)(v2 + v10), v5))
  {
    int v11 = *__error();
    uint64_t v12 = *(void **)(v2 + 72);
    if (v12)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      uint64_t v14 = *(const char **)(v2 + 56);
      if (!v14) {
        uint64_t v14 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __darwin_ino64_t v30 = v14;
      __int16 v31 = 1024;
      LODWORD(v32) = v11;
      int v15 = v12;
    }

    else
    {
      __int16 v22 = *(const char **)(v2 + 56);
      if (!v22) {
        __int16 v22 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __darwin_ino64_t v30 = v22;
      __int16 v31 = 1024;
      LODWORD(v32) = v11;
      int v15 = &_os_log_default;
      uint64_t v13 = 2LL;
    }

    uint64_t v23 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
    int v24 = 1108;
    CFIndex v25 = v11;
LABEL_32:
    CFErrorRef v26 = sub_10000A444("_codex_install_continue4", "codex.c", v24, "com.apple.security.cryptex.posix", v25, 0LL, v23);
    free(v23);
    goto LABEL_33;
  }

  int v16 = sub_10001ADE8(v3, 2LL);
  if (v16)
  {
    int v17 = v16;
    uint64_t v18 = *(void **)(v2 + 72);
    if (v18)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v19 = 3LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
      int v20 = *(const char **)(v2 + 56);
      if (!v20) {
        int v20 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __darwin_ino64_t v30 = v20;
      __int16 v31 = 1024;
      LODWORD(v32) = v17;
      CFIndex v21 = v18;
    }

    else
    {
      int v27 = *(const char **)(v2 + 56);
      if (!v27) {
        int v27 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __darwin_ino64_t v30 = v27;
      __int16 v31 = 1024;
      LODWORD(v32) = v16;
      CFIndex v21 = &_os_log_default;
      uint64_t v19 = 2LL;
    }

    uint64_t v23 = (char *)_os_log_send_and_compose_impl(v19, 0LL, 0LL, 0LL, &_mh_execute_header, v21, 16LL);
    CFIndex v25 = v17;
    int v24 = 1115;
    goto LABEL_32;
  }

  CFErrorRef v26 = 0LL;
LABEL_33:
  a1[2] = v26;
  return cryptex_async_f(v2, a1, sub_10001AE98);
}

void sub_10001AB3C(uint64_t a1, void *a2)
{
  uint64_t v4 = os_transaction_copy_description(a2);
  uint64_t v5 = *(const char **)(a1 + 56);
  int v6 = *__error();
  int v7 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = "[anonymous]";
    int v9 = *(_DWORD *)(a1 + 1360);
    if (v5) {
      uint64_t v8 = v5;
    }
    *(_DWORD *)int buf = 136446978;
    int v29 = v8;
    __int16 v30 = 2080;
    uint64_t v31 = v4;
    __int16 v32 = 1024;
    int v33 = v9 + 1;
    __int16 v34 = 1024;
    int v35 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s: de-activation: %s: %u -> %u",  buf,  0x22u);
  }

  *__error() = v6;
  os_release(a2);
  int v10 = *(_DWORD *)(a1 + 1360);
  int v27 = (void *)v4;
  if (v10)
  {
    if (v10 == -1) {
      sub_10003F268();
    }
    goto LABEL_26;
  }

  int v11 = *(const char **)(a1 + 56);
  int v12 = *__error();
  uint64_t v13 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = "[anonymous]";
    if (v11) {
      uint64_t v14 = v11;
    }
    *(_DWORD *)int buf = 136446210;
    int v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s: quiesced", buf, 0xCu);
  }

  *__error() = v12;
  uint64_t v15 = *(void *)(a1 + 1368);
  if (v15)
  {
    int v16 = (uint64_t *)(a1 + 1368);
    do
    {
      uint64_t v17 = *(void *)(v15 + 40);
      uint64_t v18 = *(const char **)(a1 + 56);
      int v19 = *__error();
      int v20 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        CFIndex v21 = "[anonymous]";
        if (v18) {
          CFIndex v21 = v18;
        }
        *(_DWORD *)int buf = 136446210;
        int v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s: dispatching barrier", buf, 0xCu);
      }

      *__error() = v19;
      (*(void (**)(uint64_t, uint64_t))(v15 + 48))(a1, v17);
      uint64_t v22 = *(void *)(a1 + 1368);
      if (v22 == v15)
      {
        uint64_t v26 = *(void *)(v15 + 24);
        uint64_t *v16 = v26;
        uint64_t v25 = a1 + 1368;
        if (v26) {
          goto LABEL_22;
        }
      }

      else
      {
        do
        {
          uint64_t v23 = v22;
          uint64_t v22 = *(void *)(v22 + 24);
        }

        while (v22 != v15);
        uint64_t v24 = *(void *)(v15 + 24);
        *(void *)(v23 + 24) = v24;
        uint64_t v25 = v23 + 24;
        if (v24) {
          goto LABEL_22;
        }
      }

      *(void *)(a1 + 1376) = v25;
LABEL_22:
      *(void *)(v15 + 24) = -1LL;
      sub_10003C8F0((void **)v15);
      uint64_t v15 = *v16;
    }

    while (*v16);
  }

LABEL_26:
  free(v27);
}

  int v39 = 0LL;
  uint64_t v26 = [v16 submit:&v39];
  uint64_t v13 = v39;
  if ((v26 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = xpc_dictionary_get_string(v4, "Label");
      CFErrorRef v28 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
      int v29 = objc_claimAutoreleasedReturnValue([v28 UUIDString]);
      __int16 v30 = [v29 UTF8String];
      *(_DWORD *)int buf = 136315650;
      *(void *)__int128 v47 = v27;
      *(_WORD *)&v47[8] = 2080;
      *(void *)&v47[10] = v30;
      __int128 v48 = 1024;
      __int128 v49 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Submited job %s (UUID: %s) for uid %d",  buf,  0x1Cu);
    }

    int v12 = 0LL;
  }

  else
  {
    uint64_t v31 = &_os_log_default;
    __int16 v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v33 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
    if (v32) {
      __int16 v34 = 3LL;
    }
    else {
      __int16 v34 = 2LL;
    }
    *(_DWORD *)int buf = 138412546;
    *(void *)__int128 v47 = v33;
    *(_WORD *)&v47[8] = 1024;
    *(_DWORD *)&v47[10] = 22;
    int v35 = (char *)_os_log_send_and_compose_impl(v34, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);

    int v12 = sub_10000A444( "launchd_session_add_job",  "launchd_session.m",  421,  "com.apple.security.cryptex.posix",  22LL,  v13,  v35);
    free(v35);
  }

LABEL_35:
  return v12;
}

uint64_t sub_10001ADE8(uint64_t a1, uint64_t a2)
{
  id v4 = sub_10001494C();
  uint64_t v5 = sub_10000A2A0();
  int v6 = v5;
  int v7 = *(char ***)(a1 + 224);
  if (v7) {
    sub_10000A3AC(v5, @"Version", *v7);
  }
  uint64_t v8 = *(char **)(a1 + 208);
  if (v8) {
    sub_10000A3AC(v6, @"Identifier", v8);
  }
  else {
    uint64_t v8 = "name-unknown";
  }
  uint64_t v9 = sub_1000149C4(v4, a2, (uint64_t)v8, (uint64_t)v6);
  if (v6) {
    CFRelease(v6);
  }
  if (v4) {
    os_release(v4);
  }
  return v9;
}

uint64_t sub_10001AE98(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[2];
  sub_100008BCC();
  if (v4)
  {
    int v5 = *__error();
    int v6 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "installation failed; cleaning up quire: %@",
        (uint8_t *)&v8,
        0xCu);
    }

    *__error() = v5;
    sub_10001AF84(v2, v3);
  }

  return cryptex_target_async_f(v2, a1, sub_100015E3C);
}

void sub_10001AF84(uint64_t a1, void *a2)
{
  uint64_t v4 = (char *)a2[26];
  if (v4)
  {
    uint64_t v5 = sub_100039028(a1 + 1056, v4);
    if (v5)
    {
      int v6 = (void **)v5;
      sub_100039068(a1 + 1056, v5);
      free(v6[4]);
      v6[4] = 0LL;
      os_release(v6[5]);
      free(v6);
    }
  }

  int v7 = *(const char **)(a1 + 56);
  int v8 = *__error();
  uint64_t v9 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = "[anonymous]";
    uint64_t v11 = a2[26];
    if (v7) {
      int v10 = v7;
    }
    int v12 = 136446466;
    uint64_t v13 = v10;
    __int16 v14 = 2080;
    uint64_t v15 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s: removed cryptex: %s",  (uint8_t *)&v12,  0x16u);
  }

  *__error() = v8;
  sub_100039068(a1 + 144, (uint64_t)(a2 + 10));
  os_release(a2);
}

void sub_10001B0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *__error();
  int v7 = *(os_log_s **)(a1 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a2 + 208);
      int v14 = 136315394;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = a3;
      uint64_t v9 = "initial cryptex bootstrap: %s: %@";
      int v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a2 + 208);
    int v14 = 136315138;
    uint64_t v15 = v13;
    uint64_t v9 = "initial cryptex bootstrap: %s [no error]";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  *__error() = v6;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void sub_10001B1E0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[3];
  bzero(v45, 0x400uLL);
  __int128 v43 = 0u;
  memset(v44, 0, sizeof(v44));
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v38 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v31 = 0u;
  int v28 = -1;
  uint64_t asset = cryptex_core_get_asset(v2, &_cryptex_asset_type_root);
  if (!asset) {
    sub_10003F47C();
  }
  int v4 = realpath_np(*(unsigned int *)(asset + 16), v45);
  if (v4)
  {
    int v5 = v4;
    int v6 = *(const char **)(v1 + 56);
    int v7 = *__error();
    uint64_t v8 = *(os_log_s **)(v1 + 72);
    uint64_t v9 = "[anonymous]";
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v6) {
        int v10 = v6;
      }
      else {
        int v10 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v47 = v10;
      __int16 v48 = 1024;
      LODWORD(v4snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v5;
      os_log_type_t v11 = "%{public}s: realpath: %{darwin.errno}d";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      goto LABEL_15;
    }

    goto LABEL_15;
  }

  uint64_t v9 = basename(v45);
  snprintf(__str, 0xFFuLL, "%s.XXXXXX", v9);
  int v12 = sub_1000153AC(v1, (uint64_t)&unk_100055D68, __str, &v28);
  if (v12)
  {
    int v5 = v12;
    uint64_t v13 = *(const char **)(v1 + 56);
    int v7 = *__error();
    uint64_t v8 = *(os_log_s **)(v1 + 72);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v13) {
        int v14 = v13;
      }
      else {
        int v14 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v47 = v14;
      __int16 v48 = 1024;
      LODWORD(v4snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v5;
      os_log_type_t v11 = "%{public}s: mkodtempat: %{darwin.errno}d";
      goto LABEL_14;
    }

LABEL_15:
    *__error() = v7;
LABEL_16:
    uint64_t v15 = *(const char **)(v1 + 56);
    int v16 = *__error();
    uint64_t v17 = *(os_log_s **)(v1 + 72);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (v15) {
        uint64_t v18 = v15;
      }
      else {
        uint64_t v18 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446722;
      __int128 v47 = v18;
      __int16 v48 = 2080;
      __int128 v49 = v9;
      __int16 v50 = 1024;
      int v51 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to uninstall stale cryptex: %s: %{darwin.errno}d",  buf,  0x1Cu);
    }

    *__error() = v16;
    int v19 = v28;
    goto LABEL_22;
  }

  int v19 = v28;
  if (renameat(*(_DWORD *)(v1 + 1396), v9, v28, "uninstalled"))
  {
    int v5 = *__error();
    int v20 = *(const char **)(v1 + 56);
    int v21 = *__error();
    uint64_t v22 = *(os_log_s **)(v1 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      if (v20) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v47 = v23;
      __int16 v48 = 1024;
      LODWORD(v4snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}s: renameat: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v21;
    if (v5) {
      goto LABEL_16;
    }
  }

  uint64_t v24 = *(const char **)(v1 + 56);
  int v25 = *__error();
  uint64_t v26 = *(os_log_s **)(v1 + 72);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    if (v24) {
      int v27 = v24;
    }
    else {
      int v27 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446466;
    __int128 v47 = v27;
    __int16 v48 = 2080;
    __int128 v49 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%{public}s: uninstalled stale cryptex: %s",  buf,  0x16u);
  }

  *__error() = v25;
LABEL_22:
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 104));
  if (v19 != -1 && close(v19) == -1) {
    sub_10003E3CC(&v29, buf);
  }
}

void sub_10001B59C(void *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[3];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*a1 + 96LL));
  if (cryptex_core_get_asset(*(void *)(v3 + 104), &_cryptex_asset_type_im4m))
  {
    int v4 = *(const char **)(v2 + 56);
    int v5 = *__error();
    int v6 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = "[anonymous]";
      if (v4) {
        int v7 = v4;
      }
      *(_DWORD *)int buf = 136446210;
      __int128 v41 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: pre-canned manifest", buf, 0xCu);
    }

    *__error() = v5;
    a1[2] = 0LL;
    goto LABEL_7;
  }

  uint64_t v8 = *(void *)(*(void *)(v3 + 104) + 160LL);
  uint64_t v9 = *(const char **)(v2 + 56);
  int v10 = *__error();
  os_log_type_t v11 = *(os_log_s **)(v2 + 72);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = "[anonymous]";
    if (v9) {
      int v12 = v9;
    }
    *(_DWORD *)int buf = 136446210;
    __int128 v41 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: writing im4m to disk", buf, 0xCu);
  }

  *__error() = v10;
  uint64_t v13 = openat(*(_DWORD *)(v3 + 112), *((const char **)&_cryptex_asset_type_im4m + 5), 513, 438LL);
  int v35 = v13;
  if ((v13 & 0x80000000) != 0)
  {
    int v24 = *__error();
    int v25 = *(void **)(v2 + 72);
    if (v25)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v26 = 3LL;
      }
      else {
        uint64_t v26 = 2LL;
      }
      int v27 = *(const char **)(v2 + 56);
      if (!v27) {
        int v27 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v41 = v27;
      __int16 v42 = 1024;
      int v43 = v24;
      int v28 = v25;
    }

    else
    {
      __int128 v32 = *(const char **)(v2 + 56);
      if (!v32) {
        __int128 v32 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v41 = v32;
      __int16 v42 = 1024;
      int v43 = v24;
      int v28 = &_os_log_default;
      uint64_t v26 = 2LL;
    }

    __int128 v33 = (char *)_os_log_send_and_compose_impl(v26, 0LL, 0LL, 0LL, &_mh_execute_header, v28, 16LL);
    CFErrorRef v29 = sub_10000A444("_codex_install_continue2", "codex.c", 1161, "com.apple.security.cryptex.posix", v24, 0LL, v33);
    free(v33);
LABEL_44:
    if ((_DWORD)v13 == -1) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }

  if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_DEBUG))
  {
    bzero(buf, 0x400uLL);
    if (!realpath_np(v13, buf))
    {
      int v14 = *(const char **)(v2 + 56);
      int v15 = *__error();
      int v16 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = "[anonymous]";
        if (v14) {
          uint64_t v17 = v14;
        }
        *(_DWORD *)__int128 v36 = 136446466;
        __int128 v37 = v17;
        __int16 v38 = 2080;
        __int128 v39 = buf;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s: im4m path: %s", v36, 0x16u);
      }

      *__error() = v15;
    }
  }

  int v18 = cryptex_signature_write(v8, v13);
  if (!v18)
  {
    uint64_t v34 = cryptex_asset_new(&_cryptex_asset_type_im4m, &v35);
    cryptex_core_set_asset(*(void *)(v3 + 104), &v34);
    CFErrorRef v29 = 0LL;
    LODWORD(v13) = v35;
    goto LABEL_44;
  }

  int v19 = v18;
  int v20 = *(void **)(v2 + 72);
  if (v20)
  {
    if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
      uint64_t v21 = 3LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
    uint64_t v22 = *(const char **)(v2 + 56);
    if (!v22) {
      uint64_t v22 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446466;
    __int128 v41 = v22;
    __int16 v42 = 1024;
    int v43 = v19;
    uint64_t v23 = v20;
  }

  else
  {
    __int16 v30 = *(const char **)(v2 + 56);
    if (!v30) {
      __int16 v30 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446466;
    __int128 v41 = v30;
    __int16 v42 = 1024;
    int v43 = v18;
    uint64_t v23 = &_os_log_default;
    uint64_t v21 = 2LL;
  }

  __int128 v31 = (char *)_os_log_send_and_compose_impl(v21, 0LL, 0LL, 0LL, &_mh_execute_header, v23, 16LL);
  CFErrorRef v29 = sub_10000A444("_codex_install_continue2", "codex.c", 1179, "com.apple.security.cryptex.posix", v19, 0LL, v31);
  free(v31);
LABEL_45:
  if (close(v13) == -1) {
    sub_10003E3CC(v36, buf);
  }
LABEL_46:
  a1[2] = v29;
  if (!v29)
  {
LABEL_7:
    cryptex_async_f(v2, a1, sub_10001BB04);
    return;
  }

  cryptex_target_async_f(v2, a1, sub_100015E3C);
}

void sub_10001BB04(void **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[3];
  sub_100008BCC();
  int v4 = (void *)v3[13];
  int v5 = sub_10003C818(v2, 0x98uLL);
  v5[18] = a1;
  sub_1000189A8((uint64_t)v2, v4, v5);
}

void sub_10001BB54(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v7 = *a5;
  if (a4)
  {
    uint64_t v9 = *(void **)(v7 + 72);
    if (v9)
    {
      if (os_log_type_enabled(*(os_log_t *)(v7 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
      os_log_type_t v11 = v9;
    }

    else
    {
      os_log_type_t v11 = &_os_log_default;
      uint64_t v10 = 2LL;
    }

    int v12 = (char *)_os_log_send_and_compose_impl(v10, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
    CFErrorRef v13 = sub_10000A444( "_protex_stage_install_callback",  "codex.c",  2844,  "com.apple.security.cryptex.posix",  a4,  0LL,  v12);
    free(v12);
    a5[2] = (uint64_t)v13;
  }

  else if (!v7)
  {
    return;
  }

  int v14 = (void *)a5[5];
  if (v14) {
    sub_1000154C4((void *)v7, a1, 0LL, *((_DWORD *)a5 + 12), a5, v14);
  }
}

void sub_10001BD20(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v6 = *a5;
  if (a4)
  {
    uint64_t v8 = *(void **)(v6 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v6 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      uint64_t v10 = v8;
    }

    else
    {
      uint64_t v10 = &_os_log_default;
      uint64_t v9 = 2LL;
    }

    int v12 = (char *)_os_log_send_and_compose_impl(v9, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    CFErrorRef v13 = sub_10000A444("_codex_mount_continue2", "codex.c", 3001, "com.apple.security.cryptex.posix", a4, 0LL, v12);
    free(v12);
    if (v13)
    {
      a5[2] = (uint64_t)v13;
      cryptex_target_async_f(v6, a5, sub_10001BF20);
    }
  }

  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 104) + 216LL);
    if (v11) {
      *(_BYTE *)(v11 + 64) = 1;
    }
    cryptex_async_f(v6, a5, sub_10001BF9C);
  }

void sub_10001BF20(void **a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[5];
  ((void (*)(void *, void *, void *, void *))a1[7])(*a1, a1[5], a1[2], a1[6]);
  os_release(a1[3]);
  os_release(a1[4]);
  sub_10003C8F0(a1);
  if (v3) {
    os_release(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
}

void sub_10001BF9C(void **a1)
{
  uint64_t v2 = (uint64_t)*a1;
  uint64_t v3 = (uint64_t)a1[4];
  if ((*(_DWORD *)(v3 + 112) & 0x80000000) != 0)
  {
    CFIndex v4 = *__error();
    int v5 = *(void **)(v2 + 72);
    if (v5)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v6 = 3LL;
      }
      else {
        uint64_t v6 = 2LL;
      }
      __error();
      uint64_t v7 = v6;
      uint64_t v8 = v5;
    }

    else
    {
      __error();
      uint64_t v8 = &_os_log_default;
      uint64_t v7 = 2LL;
    }

    uint64_t v9 = (char *)_os_log_send_and_compose_impl(v7, 0LL, 0LL, 0LL, &_mh_execute_header, v8, 16LL);
    CFErrorRef v10 = sub_10000A444("_codex_mount_continue3", "codex.c", 2978, "com.apple.security.cryptex.posix", v4, 0LL, v9);
    free(v9);
    if (v10)
    {
      a1[2] = v10;
      cryptex_target_async_f(v2, a1, sub_10001BF20);
    }
  }

  else
  {
    sub_1000154C4(*a1, v3, 0LL, 0, a1, sub_10001C1BC);
  }

void sub_10001C1BC(uint64_t a1, void *a2, const __CFDictionary *a3, void *a4)
{
  if (a3 && (sub_10000A6D8(a3, @"com.apple.security.cryptex", 17LL) & 1) == 0)
  {
    uint64_t v11 = *(void **)(a1 + 72);
    if (v11)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v12 = 3LL;
      }
      else {
        uint64_t v12 = 2LL;
      }
      CFErrorRef v13 = v11;
    }

    else
    {
      CFErrorRef v13 = &_os_log_default;
      uint64_t v12 = 2LL;
    }

    uint64_t v17 = (char *)_os_log_send_and_compose_impl(v12, 0LL, 0LL, 0LL, &_mh_execute_header, v13, 16LL);
    int v18 = "com.apple.security.cryptex";
    int v19 = 2942;
    CFIndex v20 = 14LL;
    uint64_t v21 = a3;
LABEL_25:
    CFErrorRef v22 = sub_10000A444("_codex_mount_continue4", "codex.c", v19, v18, v20, v21, v17);
    free(v17);
    if (!v22) {
      return;
    }
    goto LABEL_26;
  }

  if (!a2)
  {
    int v14 = *(void **)(a1 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 2LL;
      }
      int v16 = v14;
    }

    else
    {
      int v16 = &_os_log_default;
      uint64_t v15 = 2LL;
    }

    uint64_t v17 = (char *)_os_log_send_and_compose_impl(v15, 0LL, 0LL, 0LL, &_mh_execute_header, v16, 16LL);
    int v18 = "com.apple.security.cryptex.posix";
    int v19 = 2948;
    CFIndex v20 = 2LL;
    uint64_t v21 = 0LL;
    goto LABEL_25;
  }

  if (!sub_10000A6D8(a3, @"com.apple.security.cryptex", 17LL))
  {
    sub_10001737C(a1, a2, a4, sub_10001C628);
    return;
  }

  uint64_t v8 = *(void **)(a1 + 72);
  if (v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    CFErrorRef v10 = v8;
  }

  else
  {
    CFErrorRef v10 = &_os_log_default;
    uint64_t v9 = 2LL;
  }

  uint64_t v23 = (char *)_os_log_send_and_compose_impl(v9, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
  CFErrorRef v22 = sub_10000A444("_codex_mount_continue4", "codex.c", 2955, "com.apple.security.cryptex", 1LL, 0LL, v23);
  free(v23);
  a4[5] = os_retain(a2);
  if (v22)
  {
LABEL_26:
    a4[2] = v22;
    cryptex_target_async_f(a1, a4, sub_10001BF20);
  }

void sub_10001C628(uint64_t a1, void *object, const void *a3, uint64_t a4)
{
  *(void *)(a4 + 40) = os_retain(object);
  if (a3
    && ((uint64_t v7 = *(void **)(a1 + 72)) == 0LL
      ? (void *)(v9 = &_os_log_default, uint64_t v8 = 2LL)
      : (!os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR) ? (uint64_t v8 = 2LL) : (uint64_t v8 = 3LL), v9 = v7),
        CFErrorRef v10 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 16LL),
        CFErrorRef v11 = sub_10000A444("_codex_mount_continue5", "codex.c", 2923, "com.apple.security.cryptex", 14LL, a3, v10),
        free(v10),
        v11))
  {
    *(void *)(a4 + 16) = CFRetain(v11);
    cryptex_target_async_f(a1, a4, sub_10001BF20);
    CFRelease(v11);
  }

  else
  {
    *(void *)(a4 + 16) = 0LL;
    cryptex_target_async_f(a1, a4, sub_10001BF20);
  }

void sub_10001C7F8(void *a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  sub_100008BCC();
  if (a3)
  {
    uint64_t v8 = *(void **)(v7 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v7 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      CFErrorRef v10 = v8;
    }

    else
    {
      CFErrorRef v10 = &_os_log_default;
      uint64_t v9 = 2LL;
    }

    CFErrorRef v11 = (char *)_os_log_send_and_compose_impl(v9, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    CFErrorRef v12 = sub_10000A444("_codex_unmount_continue2", "codex.c", 3109, "com.apple.security.cryptex", 2LL, a3, v11);
    free(v11);
    if (v12)
    {
      a4[2] = (uint64_t)CFRetain(v12);
      cryptex_target_async_f(v7, a4, sub_10001C9F4);
      CFRelease(v12);
    }
  }

  else
  {
    sub_10001CA68(v7, a1);
    sub_100016BE8((dispatch_queue_t *)v7, a1, a4, sub_10001CB5C);
  }

void sub_10001C9F4(void **a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[23];
  ((void (*)(void *, void *, void *, void *))a1[25])(*a1, a1[23], a1[2], a1[24]);
  sub_10002AE08((uint64_t)(a1 + 3));
  sub_10003C8F0(a1);
  if (v3) {
    os_release(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
}

void sub_10001CA68(uint64_t a1, void *a2)
{
  CFIndex v4 = *(const char **)(a1 + 56);
  int v5 = *__error();
  uint64_t v6 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    uint64_t v8 = a2[26];
    if (v4) {
      uint64_t v7 = v4;
    }
    int v9 = 136446466;
    CFErrorRef v10 = v7;
    __int16 v11 = 2080;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: deactivated cryptex: %s",  (uint8_t *)&v9,  0x16u);
  }

  *__error() = v5;
  sub_100039068(a1 + 448, (uint64_t)(a2 + 14));
  os_release(a2);
}

uint64_t sub_10001CB5C(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      int v9 = v7;
    }

    else
    {
      int v9 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    CFErrorRef v10 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 16LL);
    CFErrorRef v11 = sub_10000A444("_codex_unmount_continue3", "codex.c", 3084, "com.apple.security.cryptex", 2LL, a3, v10);
    free(v10);
    if (v11) {
      *(void *)(a4 + 16) = v11;
    }
  }

  return cryptex_target_async_f(a1, a4, sub_10001C9F4);
}

CFErrorRef sub_10001CCF4(uint64_t a1, int a2, char *a3, int a4)
{
  if ((renameat(a2, a3, a4, "uninstalled") & 0x80000000) == 0 || (*__error() | 2) == 2) {
    return 0LL;
  }
  CFIndex v7 = *__error();
  uint64_t v8 = *(void **)(a1 + 72);
  if (v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    __error();
    uint64_t v10 = v9;
    CFErrorRef v11 = v8;
  }

  else
  {
    __error();
    CFErrorRef v11 = &_os_log_default;
    uint64_t v10 = 2LL;
  }

  uint64_t v12 = (char *)_os_log_send_and_compose_impl(v10, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
  CFErrorRef v5 = sub_10000A444("_codex_uninstall_location", "codex.c", 1334, "com.apple.security.cryptex.posix", v7, 0LL, v12);
  free(v12);
  return v5;
}

void sub_10001CED8(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 32);
  CFIndex v4 = *(const void **)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 48);
  sub_100008BCC();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 56))(v2, v3, v4, v5);
  sub_10003C8F0((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
  if (v3) {
    os_release(v3);
  }
}

uint64_t sub_10001CF60(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[4];
  sub_100008BCC();
  sub_10001AF84(v2, v3);
  int v4 = sub_10001ADE8((uint64_t)v3, 4LL);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = *(void **)(v2 + 72);
    if (v6)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v7 = 3LL;
      }
      else {
        uint64_t v7 = 2LL;
      }
      uint64_t v8 = v6;
    }

    else
    {
      uint64_t v8 = &_os_log_default;
      uint64_t v7 = 2LL;
    }

    uint64_t v9 = (char *)_os_log_send_and_compose_impl(v7, 0LL, 0LL, 0LL, &_mh_execute_header, v8, 16LL);
    CFErrorRef v10 = sub_10000A444("_codex_uninstall_continue2", "codex.c", 1311, "com.apple.security.cryptex.posix", v5, 0LL, v9);
    free(v9);
    a1[2] = (uint64_t)v10;
  }

  return cryptex_target_async_f(v2, a1, sub_10001CED8);
}

void sub_10001D12C(uint64_t a1)
{
  uint64_t v2 = *(dispatch_group_t **)a1;
  int v4 = *(const void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  sub_100008BCC();
  dispatch_group_leave(v2[14]);
  (*(void (**)(dispatch_group_t *, void *, const void *, uint64_t))(a1 + 48))(v2, v3, v4, v5);
  sub_10003C8F0((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
  if (v3) {
    os_release(v3);
  }
}

uint64_t sub_10001D1B8(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  sub_100008BCC();
  uint64_t v8 = *(const char **)(v7 + 56);
  int v9 = *__error();
  CFErrorRef v10 = *(os_log_s **)(v7 + 72);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFErrorRef v11 = v8;
    }
    else {
      CFErrorRef v11 = "[anonymous]";
    }
    uint64_t v12 = *(void *)(a1 + 208);
    int v34 = 136446466;
    int v35 = v11;
    __int16 v36 = 2080;
    *(void *)__int128 v37 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s: quire bootstrap: %s",  (uint8_t *)&v34,  0x16u);
  }

  *__error() = v9;
  if (!a3)
  {
    CFErrorRef v13 = *(const char **)(v7 + 56);
    int v14 = *__error();
    uint64_t v15 = *(os_log_s **)(v7 + 72);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (v13) {
        int v16 = v13;
      }
      else {
        int v16 = "[anonymous]";
      }
      int v34 = 136446210;
      int v35 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s: _codex_bootstrap_continue2 bootstrap succeeded",  (uint8_t *)&v34,  0xCu);
    }

    *__error() = v14;
    uint64_t v17 = *(const char **)(v7 + 56);
    int v18 = *__error();
    int v19 = *(os_log_s **)(v7 + 72);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      if (v17) {
        CFIndex v20 = v17;
      }
      else {
        CFIndex v20 = "[anonymous]";
      }
      uint64_t v21 = *(void *)(a1 + 208);
      int v34 = 136446466;
      int v35 = v20;
      __int16 v36 = 2080;
      *(void *)__int128 v37 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%{public}s: activated cryptex: %s",  (uint8_t *)&v34,  0x16u);
    }

    *__error() = v18;
    CFErrorRef v22 = *(const char **)(v7 + 56);
    int v23 = *__error();
    int v24 = *(os_log_s **)(v7 + 72);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      if (v22) {
        int v25 = v22;
      }
      else {
        int v25 = "[anonymous]";
      }
      int v26 = *(_DWORD *)(a1 + 188);
      int v27 = *(_DWORD *)(a1 + 400);
      int v34 = 136446722;
      int v35 = v25;
      __int16 v36 = 1024;
      *(_DWORD *)__int128 v37 = v26;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "%{public}s: UID: %d\tFD: %d",  (uint8_t *)&v34,  0x18u);
    }

    *__error() = v23;
    sub_100038EFC(v7 + 448, a1 + 112);
    os_retain((void *)a1);
  }

  int v28 = *(const char **)(v7 + 56);
  int v29 = *__error();
  __int16 v30 = *(os_log_s **)(v7 + 72);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    if (v28) {
      __int128 v31 = v28;
    }
    else {
      __int128 v31 = "[anonymous]";
    }
    int v34 = 136446210;
    int v35 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "%{public}s: _codex_bootstrap_continue2 occured",  (uint8_t *)&v34,  0xCu);
  }

  *__error() = v29;
  if (a3) {
    CFTypeRef v32 = CFRetain(a3);
  }
  else {
    CFTypeRef v32 = 0LL;
  }
  a4[2] = (uint64_t)v32;
  return cryptex_target_async_f(v7, a4, sub_10001D12C);
}

void sub_10001D4AC(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  int v4 = *(const void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  sub_100008BCC();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 48))(v2, v3, v4, v5);
  sub_10003C8F0((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
  if (v3) {
    os_release(v3);
  }
}

void sub_10001D530(void *a1, uint64_t *a2, const void *a3, uint64_t *a4)
{
  uint64_t v8 = *a4;
  int v9 = (const void *)a4[2];
  uint64_t v10 = *a2;
  sub_100008BCC();
  int v11 = *__error();
  uint64_t v12 = *(os_log_s **)(v8 + 72);
  if (a3)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)int buf = 138412290;
    xpc_object_t v45 = a3;
    CFErrorRef v13 = "unmount: %@";
    int v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 12;
  }

  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    *(_WORD *)int buf = 0;
    CFErrorRef v13 = "unmount [no error]";
    int v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    uint32_t v16 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
LABEL_7:
  *__error() = v11;
  int v17 = *__error();
  int v18 = *(os_log_s **)(v8 + 72);
  if (v9)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)int buf = 138412290;
    xpc_object_t v45 = v9;
    int v19 = "forwarded unbootstrap: %@";
    CFIndex v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    uint32_t v22 = 12;
  }

  else
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    *(_WORD *)int buf = 0;
    int v19 = "forwarded unbootstrap [no error]";
    CFIndex v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    uint32_t v22 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
LABEL_13:
  *__error() = v17;
  if (v10)
  {
    *(void *)uint64_t v10 = *(void *)(v8 + 136);
    *(void *)(v8 + 136) = v10;
    *a2 = 0LL;
    bzero(buf, 0x400uLL);
    bzero(__str, 0x400uLL);
    uint64_t v23 = *(unsigned int *)(v10 + 12);
    if ((v23 & 0x80000000) != 0) {
      sub_10003F494(&v36, v37);
    }
    if (os_log_type_enabled(*(os_log_t *)(v8 + 72), OS_LOG_TYPE_DEBUG))
    {
      int v24 = realpath_np(v23, buf);
      if (v24)
      {
        int v25 = v24;
        int v26 = strerror(v24);
        snprintf((char *)buf, 0x400uLL, "[%d: %s]", v25, v26);
      }

      uint64_t v27 = *(unsigned int *)(v10 + 8);
      if ((v27 & 0x80000000) != 0)
      {
        strcpy(__str, "[none]");
      }

      else
      {
        int v28 = realpath_np(v27, __str);
        if (v28)
        {
          int v29 = v28;
          __int16 v30 = strerror(v28);
          snprintf(__str, 0x400uLL, "[%d: %s]", v29, v30);
        }
      }

      __int128 v31 = *(const char **)(v8 + 56);
      int v32 = *__error();
      __int128 v33 = *(os_log_s **)(v8 + 72);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        int v34 = "[anonymous]";
        *(_DWORD *)__int128 v37 = 136446722;
        if (v31) {
          int v34 = v31;
        }
        __int16 v38 = v34;
        __int16 v39 = 2080;
        __int128 v40 = buf;
        __int16 v41 = 2080;
        __int16 v42 = __str;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%{public}s: claimed quire husk: dev = %s, mnt = %s",  v37,  0x20u);
      }

      *__error() = v32;
    }
  }

  if (a3) {
    CFTypeRef v35 = CFRetain(a3);
  }
  else {
    CFTypeRef v35 = 0LL;
  }
  a4[2] = (uint64_t)v35;
  cryptex_target_async_f(v8, a4, sub_10001D4AC);
  if (v9) {
    CFRelease(v9);
  }
}

uint64_t sub_10001D890(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  int v3 = *(_DWORD *)(a1 + 8);
  int v19 = -1;
  if (v3)
  {
    int v4 = *(const char **)(v2 + 56);
    int v5 = *__error();
    uint64_t v6 = *(os_log_s **)(v2 + 72);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    uint64_t v7 = "[anonymous]";
    if (v4) {
      uint64_t v7 = v4;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v22 = v7;
    __int16 v23 = 1024;
    int v24 = v3;
    uint64_t v8 = "%{public}s: failed to lock down codex: %{darwin.errno}d";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
    goto LABEL_19;
  }

  int v9 = sub_100015298(v2, (uint64_t)&unk_1000448D0, "lockdown", 2560, 438LL, &v19);
  int v3 = v9;
  if ((v9 - 23) < 2)
  {
    CFErrorRef v13 = *(const char **)(v2 + 56);
    int v5 = *__error();
    uint64_t v6 = *(os_log_s **)(v2 + 72);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v14 = "[anonymous]";
    if (v13) {
      int v14 = v13;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v22 = v14;
    __int16 v23 = 1024;
    int v24 = v3;
    uint64_t v8 = "%{public}s: failed to write lockdown state cookie: %{darwin.errno}d";
    goto LABEL_18;
  }

  if (v9 == 17)
  {
    uint32_t v16 = *(const char **)(v2 + 56);
    int v5 = *__error();
    int v17 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = "[anonymous]";
      if (v16) {
        int v18 = v16;
      }
      *(_DWORD *)int buf = 136446210;
      uint32_t v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%{public}s: codex already locked down",  buf,  0xCu);
    }

    int v3 = 37;
  }

  else
  {
    if (v9) {
      sub_10003F510(&v20, buf);
    }
    uint64_t v10 = *(const char **)(v2 + 56);
    int v5 = *__error();
    int v11 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = "[anonymous]";
      if (v10) {
        uint64_t v12 = v10;
      }
      *(_DWORD *)int buf = 136446210;
      uint32_t v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}s: wrote lockdown state cookie",  buf,  0xCu);
    }

    int v3 = 0;
  }

void sub_10001DB40(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  sub_100008BCC();
  (*(void (**)(void *, uint64_t, uint64_t))(a1 + 32))(v2, v3, v4);
  sub_10003C8F0((void **)a1);
}

void sub_10001DB8C(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)a2[4];
  int v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  for (uint64_t i = 0LL; i != 37; ++i)
  {
    for (uint64_t j = *(void *)(a1 + 144 + 8 * i); j; uint64_t j = *(void *)(j + 8))
    {
      uint64_t v8 = sub_10003C818((void *)(j - 80), 0x40uLL);
      v8[3] = os_retain(v5);
      void v8[4] = os_retain(v4);
      dispatch_group_enter(v5);
      cryptex_async_f(j - 80, v8, sub_10001DC90);
    }
  }

  dispatch_group_notify_f(v5, *(dispatch_queue_t *)(a1 + 32), a2, (dispatch_function_t)sub_10001DD84);
  dispatch_group_leave(v5);
  if (v5) {
    os_release(v5);
  }
}

void sub_10001DC90(uint64_t *a1)
{
  uint64_t v2 = *a1;
  xpc_object_t v3 = xpc_array_create(0LL, 0LL);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 208));
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, **(const char ***)(v2 + 224));
  if (*(void *)(v2 + 408))
  {
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "[not mounted]");
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "[not mounted]");
    uint64_t v4 = v3;
    int v5 = "[not mounted]";
  }

  else
  {
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 424));
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 432));
    int v5 = *(const char **)(v2 + 416);
    uint64_t v4 = v3;
  }

  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, v5);
  int v6 = sub_10000A5D8(*(void *)(v2 + 408));
  xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, v6);
  a1[5] = (uint64_t)v3;
  uint64_t v7 = (dispatch_queue_s *)sub_100008BDC();
  dispatch_async_f(v7, a1, (dispatch_function_t)sub_10001DDC0);
}

void sub_10001DD84(void **a1)
{
}

void sub_10001DDC0(uint64_t a1)
{
  uint64_t v2 = *(dispatch_group_s **)(a1 + 24);
  xpc_object_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  xpc_array_append_value(v3, v4);
  dispatch_group_leave(v2);
  sub_10003C8F0((void **)a1);
  if (v4) {
    os_release(v4);
  }
  if (v3) {
    os_release(v3);
  }
  if (v2) {
    os_release(v2);
  }
}

void sub_10001DFB0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10005A850;
  qword_10005A850 = (uint64_t)v1;

  if (!qword_10005A850) {
    sub_10003F608(&v3, v4);
  }
}

void sub_10001E0E8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (!v3)
  {
    id v3 = [[CollationCore alloc] initWithID:*(unsigned int *)(a1 + 48)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

    if (*(_DWORD *)(a1 + 48))
    {
      int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_100057B88]);

      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10001E1F8;
      v7[3] = &unk_100056290;
      id v3 = v3;
      id v8 = v3;
      [v6 enumerateCollationElements:v7];
    }
  }
}

uint64_t sub_10001E1F8(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void sub_10001E2CC(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 48)));
  id v3 = sub_100030D38(*(void *)(a1 + 32));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = sub_100030D40(*(void *)(a1 + 32));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = _CFXPCCreateCFObjectFromXPCObject(v6);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  __int16 v55 = (void *)v7;
  int v56 = (void *)v2;
  uint64_t v10 = sub_100030D48(*(void *)(a1 + 32));
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)v11;
  CFErrorRef v13 = (void *)v4;
  if (v11)
  {
    uint64_t v14 = _CFXPCCreateCFObjectFromXPCObject(v11);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  uint32_t v16 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sub_100030D30(*(void *)(a1 + 32)));
  int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  int v18 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sub_100030D50(*(void *)(a1 + 32)));
  uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)sub_100030D58(*(void *)(a1 + 32)));
  uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
  id v22 = objc_alloc(&OBJC_CLASS___CollationElement);
  __int128 v52 = (void *)v19;
  __int128 v53 = (void *)v15;
  uint64_t v23 = v19;
  int v51 = (void *)v21;
  __int128 v54 = (void *)v9;
  int v24 = v13;
  id v25 = [v22 initWithBundle:v23 version:v21 atPath:v17 withScope:1 withCommand:v13 withCommandArgs:v9 withEnv:v15];
  int v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
  uint64_t v27 = v56;
  id v28 = (id)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v56]);

  int v29 = v55;
  if (!v28)
  {
    __int16 v30 = *(os_log_s **)(*(void *)(a1 + 40) + 8LL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10003F684(a1 + 48, v30, v31, v32, v33, v34, v35, v36);
    }
    id v28 = [[CollationCore alloc] initWithID:*(unsigned int *)(a1 + 48)];
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
    [v37 setObject:v28 forKeyedSubscript:v56];
  }

  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
  id v39 = [v38 count];

  if ((unint64_t)v39 >= 2)
  {
    __int128 v49 = v12;
    __int16 v50 = v24;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 keyEnumerator]);

    id v42 = [v41 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v58;
      do
      {
        for (uint64_t i = 0LL; i != v43; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v58 != v44) {
            objc_enumerationMutation(v41);
          }
          xpc_object_t v46 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
          if ([v46 intValue])
          {
            __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
            __int16 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v46]);

            [v48 appendCollationElement:v25];
          }
        }

        id v43 = [v41 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }

      while (v43);
    }

    int v29 = v55;
    uint64_t v27 = v56;
    uint64_t v12 = v49;
    int v24 = v50;
  }

  [v28 appendCollationElement:v25];
}

void sub_10001E70C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 48)));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v2]);
  if (!v3) {
    sub_10003F6F0(&v15, v16);
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10003F824(a1, (int *)(a1 + 48), v5);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 40)));
  unsigned __int8 v7 = [v4 removeCollationElementWithPath:v6];

  if ((v7 & 1) == 0) {
    sub_10003F80C();
  }
  if ([v4 isEmpty])
  {
    uint64_t v8 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10003F7A0(a1 + 48, v8, v9, v10, v11, v12, v13, v14);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v2];
  }
}

void sub_10001E938( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10001E950(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 64)));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:v3]);

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10001EA10;
    v5[3] = &unk_100056308;
    __int128 v6 = *(_OWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 56);
    [v4 enumerateElements:v5];
  }
}

BOOL sub_10001EA10(uint64_t a1, int a2, char *__s2, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v4 + 24)) {
    sub_10003F8B0(&v8, v9);
  }
  if (*(void *)(a1 + 48))
  {
    *(void *)&v9[0] = cryptex_version_new(a4);
    if ((cryptex_version_compare(*(void *)&v9[0], *(void *)(a1 + 48)) & 0x80000000) == 0) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
    cryptex_version_destroy(v9);
    return *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
  }

  else
  {
    BOOL result = 0LL;
    *(_BYTE *)(v4 + 24) = 1;
  }

  return result;
}

uint64_t sub_10001EB74(void *a1)
{
  id v1 = a1;
  sub_100030D28((uint64_t)v1);
  uint64_t v2 = +[CollationMap addEntryForUser:fromQuire:](&OBJC_CLASS___CollationMap, "addEntryForUser:fromQuire:", 0LL, v1);

  return v2;
}

id sub_10001EBB8(void *a1)
{
  id v1 = a1;
  sub_100030D28((uint64_t)v1);
  uint64_t v2 = sub_100030D30((uint64_t)v1);

  return (id)+[CollationMap removeEntryForUser:withValue:]( &OBJC_CLASS___CollationMap,  "removeEntryForUser:withValue:",  0LL,  v2);
}

id sub_10001EC08(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CollationMap getMap](&OBJC_CLASS___CollationMap, "getMap"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coll_map"));

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a1));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_100057B88]);
  }
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 createEndpoint]);

  return v6;
}

BOOL sub_10001ECB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0LL;
  if (a3)
  {
    uint64_t v4 = cryptex_version_new(a3);
    uint64_t v7 = v4;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  BOOL v5 = +[CollationMap lookupEntryForUser:withBundleID:minVersion:]( &OBJC_CLASS___CollationMap,  "lookupEntryForUser:withBundleID:minVersion:",  0LL,  a2,  v4);
  cryptex_version_destroy(&v7);
  return v5;
}

id sub_10001ED20()
{
  return +[CollationMap createCollationForUser:](&OBJC_CLASS___CollationMap, "createCollationForUser:", 0LL);
}

void sub_10001ED30( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001EE94(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10005A860;
  qword_10005A860 = (uint64_t)v1;

  if (!qword_10005A860) {
    sub_10003F9B0(&v3, v4);
  }
}

void sub_10001EF64(void *a1)
{
  id v1 = a1;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate(v1);
}

void sub_10001EF9C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    int v3 = *__error();
    id v6 = sub_10001F190();
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Received error from client: %s",  (uint8_t *)&v11,  0xCu);
    }

    goto LABEL_8;
  }

  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary)
  {
    int v3 = *__error();
    id v4 = sub_10001F190();
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Malformed message from client",  (uint8_t *)&v11,  2u);
    }

LABEL_8:
    *__error() = v3;
    goto LABEL_12;
  }

  uint64_t v7 = xpc_copy_description(v2);
  int v8 = *__error();
  id v9 = sub_10001F190();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    string = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "remote service msg recv: %s",  (uint8_t *)&v11,  0xCu);
  }

  *__error() = v8;
  sub_10001F1D0(v2);
  free(v7);
LABEL_12:
}

    *__error() = v5;
    id v9 = sub_10003D064(v1, 0LL, 22);
LABEL_9:
    uint64_t v10 = v9;
    goto LABEL_10;
  }

  string_ptr = xpc_string_get_string_ptr(v4);
  if (!strcmp(string_ptr, "get-nonce"))
  {
    uint64_t v15 = v1;
    *(void *)&v226 = 0LL;
    v225 = 0u;
    memset(buf, 0, sizeof(buf));
    v179 = 0LL;
    uint32_t v16 = sub_10003D8E8(v15, &v179);
    int v17 = v179;
    int v18 = v17;
    if (v16)
    {
      uint64_t v19 = sub_10001F190();
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (v20)
      {
        uint64_t v21 = sub_10001F190();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          uint64_t v23 = 3LL;
        }
        else {
          uint64_t v23 = 2LL;
        }
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v16;
        int v24 = (char *)_os_log_send_and_compose_impl(v23, 0LL, 0LL, 0LL, &_mh_execute_header, v22, 16LL);
      }

      else
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v16;
        int v24 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      }

      v66 = sub_10000A444( "_remote_service_get_nonce",  "sub_remote_service.m",  110,  "com.apple.security.cryptex.posix",  v16,  0LL,  v24);
      free(v24);
      __int16 v67 = sub_10003D7E8(v15, 0LL, v66);
      goto LABEL_62;
    }

    if (sub_10003CED0(v17, "nonce-domain", (const _xpc_type_s *)&_xpc_type_uint64))
    {
      uint64_t int64 = xpc_dictionary_get_uint64(v18, "nonce-domain");
      id v42 = sub_10000609C(uint64);
      if (!v42)
      {
        id v43 = sub_10001F190();
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

        if (v44)
        {
          xpc_object_t v45 = sub_10001F190();
          xpc_object_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            __int128 v47 = 3LL;
          }
          else {
            __int128 v47 = 2LL;
          }
          *(_DWORD *)block = 134217984;
          *(void *)&void block[4] = uint64;
          __int16 v48 = (char *)_os_log_send_and_compose_impl(v47, 0LL, 0LL, 0LL, &_mh_execute_header, v46, 16LL);
        }

        else
        {
          *(_DWORD *)block = 134217984;
          *(void *)&void block[4] = uint64;
          __int16 v48 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
        }

        v66 = sub_10000A444( "_remote_service_get_nonce",  "sub_remote_service.m",  126,  "com.apple.security.cryptex",  10LL,  0LL,  v48);
        free(v48);
        __int16 v67 = sub_10003D7E8(v15, 0LL, v66);
        goto LABEL_62;
      }
    }

    else
    {
      if (!sub_10003CED0(v18, "nonce-domain-handle", (const _xpc_type_s *)&_xpc_type_uint64))
      {
        uint64_t v87 = sub_10001F190();
        int v88 = (void *)objc_claimAutoreleasedReturnValue(v87);

        if (v88)
        {
          __int16 v89 = sub_10001F190();
          int v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
            v91 = 3LL;
          }
          else {
            v91 = 2LL;
          }
          *(_DWORD *)block = 136315394;
          *(void *)&void block[4] = "nonce-domain";
          *(_WORD *)&block[12] = 2080;
          *(void *)&block[14] = "nonce-domain-handle";
          uint64_t v92 = (char *)_os_log_send_and_compose_impl(v91, 0LL, 0LL, 0LL, &_mh_execute_header, v90, 16LL);
        }

        else
        {
          *(_DWORD *)block = 136315394;
          *(void *)&void block[4] = "nonce-domain";
          *(_WORD *)&block[12] = 2080;
          *(void *)&block[14] = "nonce-domain-handle";
          uint64_t v92 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
        }

        v66 = sub_10000A444( "_remote_service_get_nonce",  "sub_remote_service.m",  151,  "com.apple.security.cryptex",  11LL,  0LL,  v92);
        free(v92);
        __int16 v67 = sub_10003D7E8(v15, 0LL, v66);
        goto LABEL_62;
      }

      uint64_t v71 = xpc_dictionary_get_uint64(v18, "nonce-domain-handle");
      id v42 = img4_nonce_domain_get_from_handle();
      if (!v42)
      {
        uint64_t v133 = sub_10001F190();
        v134 = (void *)objc_claimAutoreleasedReturnValue(v133);

        if (v134)
        {
          v135 = sub_10001F190();
          v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
            v137 = 3LL;
          }
          else {
            v137 = 2LL;
          }
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v71;
          v138 = (char *)_os_log_send_and_compose_impl(v137, 0LL, 0LL, 0LL, &_mh_execute_header, v136, 16LL);
        }

        else
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v71;
          v138 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
        }

        v66 = sub_10000A444( "_remote_service_get_nonce",  "sub_remote_service.m",  141,  "com.apple.security.cryptex",  10LL,  0LL,  v138);
        free(v138);
        __int16 v67 = sub_10003D7E8(v15, 0LL, v66);
        goto LABEL_62;
      }
    }

    uint64_t v72 = img4_nonce_domain_copy_nonce(v42, buf);
    if (!v72)
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_data(empty, "nonce", buf, 0x38uLL);
      uint64_t v10 = sub_10003D7E8(v15, empty, 0LL);

LABEL_64:
      goto LABEL_10;
    }

    BOOL v73 = sub_10001F190();
    int v74 = (void *)objc_claimAutoreleasedReturnValue(v73);

    if (v74)
    {
      char v75 = sub_10001F190();
      int v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        __int128 v77 = 3LL;
      }
      else {
        __int128 v77 = 2LL;
      }
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&void block[4] = v72;
      uint64_t v78 = (char *)_os_log_send_and_compose_impl(v77, 0LL, 0LL, 0LL, &_mh_execute_header, v76, 16LL);
    }

    else
    {
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&void block[4] = v72;
      uint64_t v78 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    v66 = sub_10000A444( "_remote_service_get_nonce",  "sub_remote_service.m",  161,  "com.apple.security.cryptex.posix",  v72,  0LL,  v78);
    free(v78);
    __int16 v67 = sub_10003D7E8(v15, 0LL, v66);
LABEL_62:
    uint64_t v10 = v67;
    if (v66) {
      CFRelease(v66);
    }
    goto LABEL_64;
  }

  if (strcmp(string_ptr, "roll-nonce"))
  {
    if (strcmp(string_ptr, "install"))
    {
      if (strcmp(string_ptr, "uninstall"))
      {
        if (!strcmp(string_ptr, "copy-installed"))
        {
          sub_100020F84(v1);
          goto LABEL_12;
        }

        if (!strcmp(string_ptr, "read-personalization-id"))
        {
          sub_10002100C(v1);
          goto LABEL_12;
        }

        uint64_t v12 = *__error();
        uint64_t v13 = sub_10001F190();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136315138;
          *(void *)&uint8_t buf[4] = string_ptr;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unsupported routine: %s", buf, 0xCu);
        }

        *__error() = v12;
        id v9 = sub_10003D064(v1, 0LL, 45);
        goto LABEL_9;
      }

      *(void *)block = 0LL;
      *(void *)&block[8] = block;
      *(void *)&block[16] = 0x3032000000LL;
      v214 = sub_1000213AC;
      v215 = sub_1000213BC;
      v216 = 0LL;
      __int128 v58 = v1;
      v216 = v58;
      v179 = 0LL;
      v180 = (uint64_t)&v179;
      v181 = 0x3032000000LL;
      v182 = sub_1000213AC;
      v183 = sub_1000213BC;
      v184 = 0LL;
      v204 = 0LL;
      __int128 v59 = sub_10003D8E8(v58, &v204);
      __int128 v60 = v204;
      int v61 = v60;
      if (v59)
      {
        __int16 v62 = *__error();
        int v63 = sub_10001F190();
        int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v59;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "failed to get argv from request: %{darwin.errno}d",  buf,  8u);
        }

        *__error() = v62;
      }

      else
      {
        string = xpc_dictionary_get_string(v60, "remote-cryptex-identifier");
        v94 = xpc_dictionary_get_string(v61, "remote-cryptex-version");
        if (string)
        {
          if (v94) {
            v95 = cryptex_version_new(v94);
          }
          else {
            v95 = 0LL;
          }
          v143 = sub_100014D14();
          v144 = *(void **)(v180 + 40);
          *(void *)(v180 + 40) = v143;

          v145 = sub_100008BDC();
          BOOL v146 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v145);
          *(void *)int buf = _NSConcreteStackBlock;
          *(void *)&uint8_t buf[8] = 3221225472LL;
          *(void *)&uint8_t buf[16] = sub_1000231BC;
          *(void *)&_BYTE buf[24] = &unk_1000568C8;
          *(void *)&v226 = string;
          *((void *)&v226 + 1) = v95;
          *(void *)&v227 = 1LL;
          *(void *)&v225 = &v179;
          *((void *)&v225 + 1) = block;
          dispatch_async(v146, buf);

          int v65 = 0LL;
          goto LABEL_150;
        }

        v139 = *__error();
        v140 = sub_10001F190();
        v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
        if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136315394;
          *(void *)&uint8_t buf[4] = "remote-cryptex-identifier";
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = 22;
          _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_ERROR,  "required key missing or with wrong type: %s: %{darwin.errno}d",  buf,  0x12u);
        }

        *__error() = v139;
        __int128 v59 = 22;
      }

      int v65 = sub_10003D064(v58, 0LL, v59);
      sub_10002129C(v65);
LABEL_150:
      _Block_object_dispose(&v179, 8);

      _Block_object_dispose(block, 8);
      goto LABEL_12;
    }

    v191 = 0LL;
    v192 = &v191;
    v193 = 0x3032000000LL;
    v194 = sub_1000213AC;
    v195 = sub_1000213BC;
    v196 = 0LL;
    v178 = v1;
    if ((remote_service_install_request_valid() & 1) == 0)
    {
      CFErrorRef v68 = *__error();
      CFErrorRef v69 = sub_10001F190();
      BOOL v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = 22;
        _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "Invalid install request: %{darwin.errno}d",  buf,  8u);
      }

      __int16 v38 = 0LL;
      v175 = 0LL;
      __int128 xdict = 0LL;
      v172 = 0LL;
      v173 = 0LL;
      id v39 = 0LL;
      __int128 v40 = 0LL;
      *__error() = v68;
      uint64_t v33 = 22;
      goto LABEL_173;
    }

    v190 = 0LL;
    uint64_t v33 = sub_10003D8E8(v178, &v190);
    __int128 xdict = v190;
    if (v33)
    {
      uint64_t v34 = *__error();
      uint64_t v35 = sub_10001F190();
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "failed to get argv from request: %{darwin.errno}d",  buf,  8u);
      }

      __int128 v37 = __error();
      __int16 v38 = 0LL;
      v172 = 0LL;
      v173 = 0LL;
      id v39 = 0LL;
      __int128 v40 = 0LL;
      v175 = 0LL;
LABEL_172:
      *__int128 v37 = v34;
LABEL_173:
      __int128 v154 = sub_10003D064(v178, 0LL, v33);
      sub_10002129C(v154);
LABEL_174:
      _Block_object_dispose(&v191, 8);

      goto LABEL_12;
    }

    v96 = sub_100014D14();
    CFIndex v97 = (void *)v192[5];
    v192[5] = (uint64_t)v96;

    int v98 = xpc_dictionary_get_value(xdict, "image");
    v176 = (void *)objc_claimAutoreleasedReturnValue(v98);
    int64_t int64 = xpc_dictionary_get_int64(xdict, "image-type-index");
    int v99 = xpc_dictionary_get_value(xdict, "trustcache");
    v174 = (void *)objc_claimAutoreleasedReturnValue(v99);
    int v100 = xpc_dictionary_get_value(xdict, "im4m");
    v168 = (void *)objc_claimAutoreleasedReturnValue(v100);
    v101 = xpc_dictionary_get_value(xdict, "info");
    __int16 v166 = (void *)objc_claimAutoreleasedReturnValue(v101);
    __int16 v102 = xpc_dictionary_get_value(xdict, "volumehash");
    __int16 v164 = (void *)objc_claimAutoreleasedReturnValue(v102);
    uint64_t v103 = xpc_dictionary_get_uint64(xdict, "persistence");
    __int16 v104 = xpc_dictionary_get_uint64(xdict, "nonce-persistence");
    v105 = xpc_dictionary_get_uint64(xdict, "auth");
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "cryptex1-properties");
    int v107 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    __int16 v108 = (void *)v192[5];
    v179 = _NSConcreteStackBlock;
    v180 = 3221225472LL;
    v181 = (uint64_t)sub_1000213C4;
    v182 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000563B8;
    v186 = int64;
    __int16 v38 = v107;
    v183 = (void (*)(uint64_t))v38;
    v185 = &v191;
    v184 = v178;
    v187 = v105;
    v188 = v103;
    v189 = v104;
    v170 = v108;
    v172 = v176;
    v173 = v174;
    v175 = v168;
    id v39 = v166;
    __int128 v40 = v164;
    v109 = &v179;
    v236 = 0u;
    memset(v237, 0, sizeof(v237));
    v234 = 0u;
    v235 = 0u;
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    v228 = 0u;
    v229 = 0u;
    v226 = 0u;
    v227 = 0u;
    v225 = 0u;
    memset(buf, 0, sizeof(buf));
    v212 = -1;
    v210[0] = 0LL;
    v210[1] = v210;
    v210[2] = 0x2020000000LL;
    v211 = 0;
    v204 = 0LL;
    v205 = &v204;
    v206 = 0x3032000000LL;
    v207 = sub_1000213AC;
    v208 = sub_1000213BC;
    v209 = 0LL;
    v202[0] = 0LL;
    v202[1] = v202;
    v202[2] = 0x3032000000LL;
    v202[3] = sub_100021750;
    v202[4] = sub_100021778;
    v203 = 0LL;
    v167 = v109;
    v169 = v38;
    v203 = objc_retainBlock(v109);
    __int16 v110 = sub_100021780();
    v111 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v110);
    dispatch_assert_queue_V2(v111);

    __snprintf_chk((char *)buf, 0xFFuLL, 0, 0xFFuLL, "XXXXXX");
    sub_1000153AC((uint64_t)v170, (uint64_t)&unk_100055DB0, (char *)buf, &v212);
    stat v112 = openat(v212, *(const char **)(cryptex_asset_types[int64] + 40LL), 514, 438LL);
    if ((v112 & 0x80000000) != 0)
    {
      uint64_t v33 = *__error();
      __int16 v121 = *__error();
      v142 = sub_10001F190();
      __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_ERROR,  "failed to create file for image: %{darwin.errno}d",  block,  8u);
      }

      goto LABEL_167;
    }

    is_cryptex1 = cryptex_asset_type_is_cryptex1(cryptex_asset_types[int64]);
    v114 = is_cryptex1;
    if (is_cryptex1) {
      int v115 = &_cryptex_asset_type_gtgv;
    }
    else {
      int v115 = &_cryptex_asset_type_roothash;
    }
    v162 = v115;
    if (is_cryptex1) {
      int v116 = &_cryptex_asset_type_gtcd;
    }
    else {
      int v116 = &_cryptex_asset_type_ltrs;
    }
    v160 = v116;
    if (is_cryptex1) {
      __int16 v117 = &_cryptex_asset_type_ginf;
    }
    else {
      __int16 v117 = _cryptex_asset_type_c411;
    }
    v161 = v117;
    uint64_t v118 = (const char **)((char *)&_cryptex_asset_type_ltrs + 40);
    if (is_cryptex1) {
      uint64_t v118 = (const char **)((char *)&_cryptex_asset_type_gtcd + 40);
    }
    v165 = openat(v212, *v118, 514, 438LL);
    if ((v165 & 0x80000000) != 0)
    {
      uint64_t v33 = *__error();
      __int16 v121 = *__error();
      v147 = sub_10001F190();
      __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_ERROR,  "failed to create file for trust cache: %{darwin.errno}d",  block,  8u);
      }

      goto LABEL_167;
    }

    v163 = openat(v212, *((const char **)&_cryptex_asset_type_im4m + 5), 514, 438LL);
    if ((v163 & 0x80000000) != 0)
    {
      uint64_t v33 = *__error();
      __int16 v121 = *__error();
      __int128 v148 = sub_10001F190();
      __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v148);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_ERROR,  "failed to create file for im4m: %{darwin.errno}d",  block,  8u);
      }

      goto LABEL_167;
    }

    if (v39)
    {
      if (v114) {
        __int16 v119 = &_cryptex_asset_type_ginf;
      }
      else {
        __int16 v119 = _cryptex_asset_type_c411;
      }
      off_t v120 = openat(v212, (const char *)v119[5], 514, 438LL);
      if ((v120 & 0x80000000) != 0)
      {
        uint64_t v33 = *__error();
        __int16 v121 = *__error();
        uint64_t v122 = sub_10001F190();
        __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_ERROR,  "failed to create file for info: %{darwin.errno}d",  block,  8u);
        }

void sub_10001F170(_Unwind_Exception *a1)
{
}

id sub_10001F190()
{
  if (qword_10005A868 != -1) {
    dispatch_once(&qword_10005A868, &stru_100056390);
  }
  return (id)qword_10005A870;
}

void sub_10001F1D0(void *a1)
{
  id v1 = a1;
  xpc_object_t value = xpc_dictionary_get_value(v1, "routine");
  int v3 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v4 = v3;
  if (!v3)
  {
    int v5 = *__error();
    id v8 = sub_10001F190();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Malformed message from client: no routine key found",  buf,  2u);
    }

    goto LABEL_8;
  }

  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_string)
  {
    int v5 = *__error();
    id v6 = sub_10001F190();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Malformed message from client: routine is not a string",  buf,  2u);
    }

LABEL_167:
        *__error() = v121;
LABEL_168:
        _Block_object_dispose(v202, 8);

        _Block_object_dispose(&v204, 8);
        _Block_object_dispose(v210, 8);

        if (!v33)
        {
          __int128 v154 = 0LL;
          goto LABEL_174;
        }

        int v34 = *__error();
        id v152 = sub_10001F190();
        __int128 v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v153,  OS_LOG_TYPE_ERROR,  "file receive failed: %{darwin.errno}d",  buf,  8u);
        }

        __int128 v37 = __error();
        goto LABEL_172;
      }
    }

    else
    {
      uint64_t v120 = 0xFFFFFFFFLL;
    }

    if (v40)
    {
      if (v114) {
        v149 = (const char **)&_cryptex_asset_type_gtgv;
      }
      else {
        v149 = (const char **)&_cryptex_asset_type_roothash;
      }
      uint64_t v150 = openat(v212, v149[5], 514, 438LL);
      if ((v150 & 0x80000000) != 0)
      {
        int v33 = *__error();
        id v38 = v169;
        int v121 = *__error();
        id v151 = sub_10001F190();
        __int16 v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_ERROR,  "failed to create file for volume hash: %{darwin.errno}d",  block,  8u);
        }

        goto LABEL_167;
      }
    }

    else
    {
      uint64_t v150 = 0xFFFFFFFFLL;
    }

    dispatch_group_t v155 = dispatch_group_create();
    id v156 = v205[5];
    v205[5] = v155;

    dispatch_group_enter((dispatch_group_t)v205[5]);
    dispatch_group_enter((dispatch_group_t)v205[5]);
    v201[0] = _NSConcreteStackBlock;
    v201[1] = 3221225472LL;
    v201[2] = sub_1000217C0;
    v201[3] = &unk_1000563E0;
    v201[4] = v210;
    v201[5] = &v204;
    xpc_file_transfer_write_to_fd(v172, v112, v201);
    dispatch_group_enter((dispatch_group_t)v205[5]);
    v200[0] = _NSConcreteStackBlock;
    v200[1] = 3221225472LL;
    v200[2] = sub_1000218E0;
    v200[3] = &unk_1000563E0;
    v200[4] = v210;
    v200[5] = &v204;
    xpc_file_transfer_write_to_fd(v173, v165, v200);
    dispatch_group_enter((dispatch_group_t)v205[5]);
    v199[0] = _NSConcreteStackBlock;
    v199[1] = 3221225472LL;
    v199[2] = sub_100021A00;
    v199[3] = &unk_1000563E0;
    v199[4] = v210;
    v199[5] = &v204;
    xpc_file_transfer_write_to_fd(v175, v163, v199);
    if (v39)
    {
      dispatch_group_enter((dispatch_group_t)v205[5]);
      v198[0] = _NSConcreteStackBlock;
      v198[1] = 3221225472LL;
      v198[2] = sub_100021B20;
      v198[3] = &unk_1000563E0;
      v198[4] = v210;
      v198[5] = &v204;
      xpc_file_transfer_write_to_fd(v39, v120, v198);
    }

    if (v40)
    {
      dispatch_group_enter((dispatch_group_t)v205[5]);
      v197[0] = _NSConcreteStackBlock;
      v197[1] = 3221225472LL;
      v197[2] = sub_100021C40;
      v197[3] = &unk_1000563E0;
      v197[4] = v210;
      v197[5] = &v204;
      xpc_file_transfer_write_to_fd(v40, v150, v197);
    }

    uint64_t v157 = (dispatch_group_s *)v205[5];
    id v158 = sub_100021780();
    uint64_t v159 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v158);
    *(void *)block = _NSConcreteStackBlock;
    *(void *)&block[8] = 3221225472LL;
    *(void *)&block[16] = sub_100021D60;
    v214 = (uint64_t (*)(uint64_t, uint64_t))&unk_100056408;
    int v223 = v212;
    int64_t v219 = int64;
    v220 = v160;
    v215 = (void (*)(uint64_t))v39;
    v221 = v161;
    id v216 = v40;
    v217 = v202;
    v222 = v162;
    v218 = v210;
    dispatch_group_notify(v157, v159, block);

    id v38 = v169;
    dispatch_group_leave((dispatch_group_t)v205[5]);

    int v33 = 0;
    goto LABEL_168;
  }

  id v25 = v1;
  if (!sub_10003CED0(v25, "nonce-domain", (const _xpc_type_s *)&_xpc_type_uint64))
  {
    if (sub_10003CED0(v25, "nonce-domain-handle", (const _xpc_type_s *)&_xpc_type_uint64))
    {
      int v49 = xpc_dictionary_get_uint64(v25, "nonce-domain-handle");
      if (img4_nonce_domain_get_from_handle()) {
        goto LABEL_49;
      }
      id v127 = sub_10001F190();
      uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue(v127);

      if (v128)
      {
        id v129 = sub_10001F190();
        CFIndex v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
        if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
          uint64_t v131 = 3LL;
        }
        else {
          uint64_t v131 = 2LL;
        }
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v49;
        v132 = (char *)_os_log_send_and_compose_impl(v131, 0LL, 0LL, 0LL, &_mh_execute_header, v130, 16LL);
      }

      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v49;
        v132 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      }

      v124 = sub_10000A444( "_remote_service_roll_nonce",  "sub_remote_service.m",  211,  "com.apple.security.cryptex",  10LL,  0LL,  v132);
      free(v132);
      v125 = sub_10003D7E8(v25, 0LL, v124);
    }

    else
    {
      id v79 = sub_10001F190();
      __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(v79);

      if (v80)
      {
        id v81 = sub_10001F190();
        BOOL v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
          uint64_t v83 = 3LL;
        }
        else {
          uint64_t v83 = 2LL;
        }
        *(_DWORD *)int buf = 136315394;
        *(void *)&uint8_t buf[4] = "nonce-domain";
        *(_WORD *)&_BYTE buf[12] = 2080;
        *(void *)&buf[14] = "nonce-domain-handle";
        int v84 = (char *)_os_log_send_and_compose_impl(v83, 0LL, 0LL, 0LL, &_mh_execute_header, v82, 16LL);
      }

      else
      {
        *(_DWORD *)int buf = 136315394;
        *(void *)&uint8_t buf[4] = "nonce-domain";
        *(_WORD *)&_BYTE buf[12] = 2080;
        *(void *)&buf[14] = "nonce-domain-handle";
        int v84 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      }

      v124 = sub_10000A444( "_remote_service_roll_nonce",  "sub_remote_service.m",  221,  "com.apple.security.cryptex",  11LL,  0LL,  v84);
      free(v84);
      v125 = sub_10003D7E8(v25, 0LL, v124);
    }

LABEL_145:
    id v10 = v125;
    if (v124) {
      CFRelease(v124);
    }
    goto LABEL_147;
  }

  uint64_t v26 = xpc_dictionary_get_uint64(v25, "nonce-domain");
  if (!sub_10000609C(v26))
  {
    id v27 = sub_10001F190();
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (v28)
    {
      id v29 = sub_10001F190();
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        uint64_t v31 = 3LL;
      }
      else {
        uint64_t v31 = 2LL;
      }
      *(_DWORD *)int buf = 134217984;
      *(void *)&uint8_t buf[4] = v26;
      uint64_t v32 = (char *)_os_log_send_and_compose_impl(v31, 0LL, 0LL, 0LL, &_mh_execute_header, v30, 16LL);
    }

    else
    {
      *(_DWORD *)int buf = 134217984;
      *(void *)&uint8_t buf[4] = v26;
      uint64_t v32 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    v124 = sub_10000A444( "_remote_service_roll_nonce",  "sub_remote_service.m",  196,  "com.apple.security.cryptex",  10LL,  0LL,  v32);
    free(v32);
    v125 = sub_10003D7E8(v25, 0LL, v124);
    goto LABEL_145;
  }

LABEL_49:
  int v50 = img4_nonce_domain_roll_nonce();
  if (v50)
  {
    int v51 = v50;
    id v52 = sub_10001F190();
    __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

    if (v53)
    {
      id v54 = sub_10001F190();
      __int16 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        uint64_t v56 = 3LL;
      }
      else {
        uint64_t v56 = 2LL;
      }
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v51;
      __int128 v57 = (char *)_os_log_send_and_compose_impl(v56, 0LL, 0LL, 0LL, &_mh_execute_header, v55, 16LL);
    }

    else
    {
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v51;
      __int128 v57 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    v124 = sub_10000A444( "_remote_service_roll_nonce",  "sub_remote_service.m",  231,  "com.apple.security.cryptex.posix",  v51,  0LL,  v57);
    free(v57);
    v125 = sub_10003D7E8(v25, 0LL, v124);
    goto LABEL_145;
  }

  xpc_object_t v85 = xpc_dictionary_create_empty();
  uint64_t v86 = sub_10003D7E8(v25, v85, 0LL);

  id v10 = v86;
LABEL_147:

LABEL_10:
  if (v10)
  {
    sub_10002129C(v10);
  }

LABEL_12:
}

void sub_100020E58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38)
{
}

void sub_100020F54(id a1)
{
  os_log_t v1 = os_log_create("com.apple.libcryptex", "remote_service");
  uint64_t v2 = (void *)qword_10005A870;
  qword_10005A870 = (uint64_t)v1;
}

void sub_100020F84(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100008BDC();
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023698;
  block[3] = &unk_1000550D8;
  id v6 = v1;
  id v4 = v1;
  dispatch_async(v3, block);
}

void sub_10002100C(void *a1)
{
  id v1 = a1;
  memset(v18, 0, sizeof(v18));
  LOWORD(v18[0]) = 6;
  if (img4_chip_instantiate(&_img4_chip_cryptex1_generic, v18))
  {
    id v2 = sub_10001F190();
    int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

    if (v3)
    {
      id v4 = sub_10001F190();
      int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        uint64_t v6 = 3LL;
      }
      else {
        uint64_t v6 = 2LL;
      }
      *(_DWORD *)int buf = 67109120;
      LODWORD(v17) = 5;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl(v6, 0LL, 0LL, 0LL, &_mh_execute_header, v5, 16LL);
    }

    else
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v17) = 5;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    id v9 = sub_10000A444( "_remote_service_read_personalization_identifiers",  "sub_remote_service.m",  837,  "com.apple.security.cryptex.posix",  5LL,  0LL,  v7);
    free(v7);
LABEL_13:
    id v10 = 0LL;
    goto LABEL_14;
  }

  id v15 = 0LL;
  CFErrorRef v8 = sub_1000096F8((uint64_t)v18, &v15);
  id v9 = (__CFError *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v15;
  if (v9)
  {
    int v11 = *__error();
    id v12 = sub_10001F190();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      int v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to encode AppleImage4 chip instance.: %@",  buf,  0xCu);
    }

    *__error() = v11;
    goto LABEL_13;
  }

LABEL_14:
  uint64_t v14 = sub_10003D7E8(v1, v10, v9);
  sub_10002129C(v14);
}

void sub_100021280(_Unwind_Exception *a1)
{
}

void sub_10002129C(void *a1)
{
  id v1 = a1;
  id v2 = sub_100021780();
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  id v4 = xpc_copy_description(v1);
  int v5 = *__error();
  id v6 = sub_10001F190();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "remote service reply: %s", (uint8_t *)&v8, 0xCu);
  }

  *__error() = v5;
  xpc_dictionary_send_reply(v1);
  free(v4);
}

void sub_10002138C(_Unwind_Exception *a1)
{
}

uint64_t sub_1000213AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000213BC(uint64_t a1)
{
}

void sub_1000213C4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  int v40 = a4;
  int v41 = a3;
  int v38 = a6;
  int v39 = a5;
  int v37 = a7;
  if (a2)
  {
    int v8 = a2;
    int v9 = *__error();
    id v10 = sub_10001F190();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v43 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "file transfer failed: %{darwin.errno}d",  buf,  8u);
    }

    id v12 = 0LL;
LABEL_5:

    *__error() = v9;
    id v13 = sub_10003D064(*(void **)(a1 + 40), 0LL, v8);
    sub_10002129C(v13);
    goto LABEL_6;
  }

  id v12 = (id)cryptex_core_create(0LL);
  int v14 = cryptex_core_set_assets_from_fds(v12, *(void *)(a1 + 56), &v41, &v40, &v38, &v39, &v37);
  if (v14)
  {
    int v8 = v14;
    int v9 = *__error();
    id v15 = sub_10001F190();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v43 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "set assets to core from fds failed: %{darwin.errno}d",  buf,  8u);
    }

    goto LABEL_5;
  }

  id v13 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary(*(void *)(a1 + 32));
  if (v13) {
    cryptex_core_set_cryptex1_properties(v12);
  }
  int v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 80);
  id v20 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v21 = v16;
  id v12 = v12;
  if (v17 != 2)
  {
    if (v17 != 1)
    {
      int v30 = *__error();
      id v31 = sub_10001F190();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "using default signing service", buf, 2u);
      }

      id v29 = 0LL;
      *__error() = v30;
      goto LABEL_23;
    }

    int v22 = *__error();
    id v23 = sub_10001F190();
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "using supplemental signing service", buf, 2u);
    }

    *__error() = v22;
    id v25 = (void *)cryptex_host_create(0LL, 1LL);
    cryptex_core_attach_host(v12, v25);
  }

  int v26 = *__error();
  id v27 = sub_10001F190();
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "using NO signing service", buf, 2u);
  }

  *__error() = v26;
  id v29 = (void *)cryptex_host_create(0LL, 4LL);
  cryptex_core_attach_host(v12, v29);
LABEL_23:
  uint64_t v33 = v18 + 1;
  if (v19) {
    uint64_t v34 = 2LL;
  }
  else {
    uint64_t v34 = 1LL;
  }
  cryptex_core_set_install_persistence(v12, v33);
  cryptex_core_set_nonce_persistence(v12, v34);
  id v35 = v20;
  uint64_t v36 = sub_100037F1C(v35, 0LL, 0LL, 0, v21, sub_100022914);
  sub_1000161A8(v35, v12, v36);

LABEL_6:
}

id sub_100021750(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100021778(uint64_t a1)
{
}

id sub_100021780()
{
  if (qword_10005A878 != -1) {
    dispatch_once(&qword_10005A878, &stru_100056428);
  }
  return (id)qword_10005A880;
}

void sub_1000217C0(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_10001F190();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "image file transfer: %{darwin.errno}d",  (uint8_t *)v8,  8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "image file transfer [no error]",  (uint8_t *)v8,  2u);
    }

    *__error() = v4;
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_1000218E0(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_10001F190();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "trustcache file transfer: %{darwin.errno}d",  (uint8_t *)v8,  8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "trustcache file transfer [no error]",  (uint8_t *)v8,  2u);
    }

    *__error() = v4;
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_100021A00(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_10001F190();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "im4m file transfer: %{darwin.errno}d",  (uint8_t *)v8,  8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "im4m file transfer [no error]",  (uint8_t *)v8,  2u);
    }

    *__error() = v4;
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_100021B20(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_10001F190();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "info file transfer: %{darwin.errno}d",  (uint8_t *)v8,  8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "info file transfer [no error]",  (uint8_t *)v8,  2u);
    }

    *__error() = v4;
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_100021C40(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_10001F190();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "volume hash file transfer: %{darwin.errno}d",  (uint8_t *)v8,  8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "volume hash file transfer [no error]",  (uint8_t *)v8,  2u);
    }

    *__error() = v4;
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

uint64_t sub_100021D60(uint64_t a1)
{
  int v2 = openat(*(_DWORD *)(a1 + 96), *(const char **)(cryptex_asset_types[*(void *)(a1 + 64)] + 40LL), 0, 438LL);
  id v3 = sub_10001F190();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  bzero(__str, 0x400uLL);
  memset(&v63, 0, sizeof(v63));
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v2, &v63) == -1)
    {
      int v9 = *__error();
      id v10 = (os_log_s *)v4;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = *__error();
        *(_DWORD *)int buf = 136315650;
        int v65 = "imagefd_r";
        __int16 v66 = 1024;
        int v67 = v2;
        __int16 v68 = 1024;
        LODWORD(v6snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  buf,  0x18u);
      }

      *__error() = v9;
    }

    else
    {
      if (fcntl(v2, 50, __str))
      {
        id v5 = __error();
        id v6 = strerror(*v5);
        snprintf(__str, 0x400uLL, "[%s]", v6);
      }

      unint64_t v7 = ((unint64_t)v63.st_mode >> 12) ^ 8;
      if ((_DWORD)v7 == 15) {
        int v8 = "[unknown]";
      }
      else {
        int v8 = off_100056988[v7];
      }
      id v12 = (void *)os_flagset_copy_string(&unk_100056448, v63.st_flags);
      int v13 = *__error();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136316418;
        int v65 = "imagefd_r";
        __int16 v66 = 1024;
        int v67 = v2;
        __int16 v68 = 2080;
        id v69 = v8;
        __int16 v70 = 2048;
        off_t st_size = v63.st_size;
        __int16 v72 = 2080;
        id v73 = v12;
        __int16 v74 = 2080;
        id v75 = __str;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  buf,  0x3Au);
      }

      *__error() = v13;
      free(v12);
    }
  }

  int v14 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(void *)(a1 + 72) + 40LL), 514, 438LL);
  id v15 = sub_10001F190();
  id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  bzero(__str, 0x400uLL);
  memset(&v63, 0, sizeof(v63));
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v14, &v63) == -1)
    {
      int v21 = *__error();
      int v22 = (os_log_s *)v16;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = *__error();
        *(_DWORD *)int buf = 136315650;
        int v65 = "tcfd_r";
        __int16 v66 = 1024;
        int v67 = v14;
        __int16 v68 = 1024;
        LODWORD(v6snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  buf,  0x18u);
      }

      *__error() = v21;
    }

    else
    {
      if (fcntl(v14, 50, __str))
      {
        uint64_t v17 = __error();
        uint64_t v18 = strerror(*v17);
        snprintf(__str, 0x400uLL, "[%s]", v18);
      }

      unint64_t v19 = ((unint64_t)v63.st_mode >> 12) ^ 8;
      if ((_DWORD)v19 == 15) {
        id v20 = "[unknown]";
      }
      else {
        id v20 = off_100056988[v19];
      }
      int v24 = (void *)os_flagset_copy_string(&unk_100056448, v63.st_flags);
      int v25 = *__error();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136316418;
        int v65 = "tcfd_r";
        __int16 v66 = 1024;
        int v67 = v14;
        __int16 v68 = 2080;
        id v69 = v20;
        __int16 v70 = 2048;
        off_t st_size = v63.st_size;
        __int16 v72 = 2080;
        id v73 = v24;
        __int16 v74 = 2080;
        id v75 = __str;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  buf,  0x3Au);
      }

      *__error() = v25;
      free(v24);
    }
  }

  int v26 = openat(*(_DWORD *)(a1 + 96), *((const char **)&_cryptex_asset_type_im4m + 5), 514, 438LL);
  id v27 = sub_10001F190();
  id v28 = (id)objc_claimAutoreleasedReturnValue(v27);
  bzero(__str, 0x400uLL);
  memset(&v63, 0, sizeof(v63));
  if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v26, &v63) == -1)
    {
      int v33 = *__error();
      uint64_t v34 = (os_log_s *)v28;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v35 = *__error();
        *(_DWORD *)int buf = 136315650;
        int v65 = "im4mfd_r";
        __int16 v66 = 1024;
        int v67 = v26;
        __int16 v68 = 1024;
        LODWORD(v6snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  buf,  0x18u);
      }

      *__error() = v33;
    }

    else
    {
      if (fcntl(v26, 50, __str))
      {
        id v29 = __error();
        int v30 = strerror(*v29);
        snprintf(__str, 0x400uLL, "[%s]", v30);
      }

      unint64_t v31 = ((unint64_t)v63.st_mode >> 12) ^ 8;
      if ((_DWORD)v31 == 15) {
        uint64_t v32 = "[unknown]";
      }
      else {
        uint64_t v32 = off_100056988[v31];
      }
      uint64_t v36 = (void *)os_flagset_copy_string(&unk_100056448, v63.st_flags);
      int v37 = *__error();
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136316418;
        int v65 = "im4mfd_r";
        __int16 v66 = 1024;
        int v67 = v26;
        __int16 v68 = 2080;
        id v69 = v32;
        __int16 v70 = 2048;
        off_t st_size = v63.st_size;
        __int16 v72 = 2080;
        id v73 = v36;
        __int16 v74 = 2080;
        id v75 = __str;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v28,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  buf,  0x3Au);
      }

      *__error() = v37;
      free(v36);
    }
  }

  if (*(void *)(a1 + 32))
  {
    int v38 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(void *)(a1 + 80) + 40LL), 514, 438LL);
    id v39 = sub_10001F190();
    id v40 = (id)objc_claimAutoreleasedReturnValue(v39);
    bzero(__str, 0x400uLL);
    memset(&v63, 0, sizeof(v63));
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v38, &v63) == -1)
      {
        int v45 = *__error();
        xpc_object_t v46 = (os_log_s *)v40;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          int v47 = *__error();
          *(_DWORD *)int buf = 136315650;
          int v65 = "infofd_r";
          __int16 v66 = 1024;
          int v67 = v38;
          __int16 v68 = 1024;
          LODWORD(v6snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v47;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  buf,  0x18u);
        }

        *__error() = v45;
      }

      else
      {
        if (fcntl(v38, 50, __str))
        {
          int v41 = __error();
          uint64_t v42 = strerror(*v41);
          snprintf(__str, 0x400uLL, "[%s]", v42);
        }

        unint64_t v43 = ((unint64_t)v63.st_mode >> 12) ^ 8;
        if ((_DWORD)v43 == 15) {
          uint64_t v44 = "[unknown]";
        }
        else {
          uint64_t v44 = off_100056988[v43];
        }
        __int16 v48 = (void *)os_flagset_copy_string(&unk_100056448, v63.st_flags);
        int v49 = *__error();
        if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 136316418;
          int v65 = "infofd_r";
          __int16 v66 = 1024;
          int v67 = v38;
          __int16 v68 = 2080;
          id v69 = v44;
          __int16 v70 = 2048;
          off_t st_size = v63.st_size;
          __int16 v72 = 2080;
          id v73 = v48;
          __int16 v74 = 2080;
          id v75 = __str;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v40,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  buf,  0x3Au);
        }

        *__error() = v49;
        free(v48);
      }
    }
  }

  if (*(void *)(a1 + 40))
  {
    int v50 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(void *)(a1 + 88) + 40LL), 514, 438LL);
    id v51 = sub_10001F190();
    id v52 = (id)objc_claimAutoreleasedReturnValue(v51);
    bzero(__str, 0x400uLL);
    memset(&v63, 0, sizeof(v63));
    if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v50, &v63) == -1)
      {
        int v57 = *__error();
        id v58 = (os_log_s *)v52;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          int v59 = *__error();
          *(_DWORD *)int buf = 136315650;
          int v65 = "volhashfd_r";
          __int16 v66 = 1024;
          int v67 = v50;
          __int16 v68 = 1024;
          LODWORD(v6snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v59;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  buf,  0x18u);
        }

        *__error() = v57;
      }

      else
      {
        if (fcntl(v50, 50, __str))
        {
          __int128 v53 = __error();
          id v54 = strerror(*v53);
          snprintf(__str, 0x400uLL, "[%s]", v54);
        }

        unint64_t v55 = ((unint64_t)v63.st_mode >> 12) ^ 8;
        if ((_DWORD)v55 == 15) {
          uint64_t v56 = "[unknown]";
        }
        else {
          uint64_t v56 = off_100056988[v55];
        }
        id v60 = (void *)os_flagset_copy_string(&unk_100056448, v63.st_flags);
        int v61 = *__error();
        if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 136316418;
          int v65 = "volhashfd_r";
          __int16 v66 = 1024;
          int v67 = v50;
          __int16 v68 = 2080;
          id v69 = v56;
          __int16 v70 = 2048;
          off_t st_size = v63.st_size;
          __int16 v72 = 2080;
          id v73 = v60;
          __int16 v74 = 2080;
          id v75 = __str;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v52,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  buf,  0x3Au);
        }

        *__error() = v61;
        free(v60);
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
}

void sub_1000228D8(id a1)
{
  id v4 = sub_100008BC0();
  uint64_t v1 = sub_100008BF0((uint64_t)v4);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_10005A880;
  qword_10005A880 = v2;
}

void sub_100022914(void *a1, void *a2, void *a3, id *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  v20[3] = a4;
  id v10 = a4[7];
  if (v9)
  {
    int v11 = *__error();
    id v12 = sub_10001F190();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "installation failed: %@", buf, 0xCu);
    }

    *__error() = v11;
    id v14 = sub_100021780();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100022CDC;
    block[3] = &unk_100056850;
    id v17 = v10;
    id v18 = v9;
    unint64_t v19 = v20;
    dispatch_async(v15, block);
  }

  else
  {
    sub_10001737C((uint64_t)v7, v8, a4, sub_100022AF0);
  }

  _Block_object_dispose(v20, 8);
}

void sub_100022ACC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100022AF0(void *a1, void *a2, const void *a3, id *a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = a4;
  id v9 = a4[7];
  if (a3)
  {
    int v10 = *__error();
    id v11 = sub_10001F190();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      int v25 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "bootstrap failed, unbootstrapping: %@",  buf,  0xCu);
    }

    *__error() = v10;
    CFTypeRef v13 = CFRetain(a3);
    *(void *)(v21[3] + 16) = v13;
    sub_100017570((uint64_t)v7, v8, 1uLL, a4, sub_100022D2C);
  }

  else
  {
    id v14 = sub_100021780();
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100022E5C;
    block[3] = &unk_100056850;
    id v17 = v8;
    id v18 = v9;
    unint64_t v19 = &v20;
    dispatch_async(v15, block);
  }

  _Block_object_dispose(&v20, 8);
}

void sub_100022CB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100022CDC(uint64_t a1)
{
  id v2 = sub_10003D7E8(*(void **)(a1 + 32), 0LL, *(__CFError **)(a1 + 40));
  sub_10002129C(v2);
  sub_100037F94((uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
}

void sub_100022D2C(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a1;
  int v9 = *__error();
  id v10 = sub_10001F190();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if (a3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      uint64_t v18 = a3;
      CFTypeRef v13 = "unbootstrap: %@";
      id v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v17, v16);
    }
  }

  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    CFTypeRef v13 = "unbootstrap [no error]";
    id v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    uint32_t v16 = 2;
    goto LABEL_6;
  }

  *__error() = v9;
  sub_100016BE8(v8, v7, a4, sub_100022F30);
}

void sub_100022E5C(uint64_t a1)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v3 = *(id *)(a1 + 32);
  xpc_object_t v4 = xpc_dictionary_create_empty();
  uint64_t v5 = sub_100030D60((uint64_t)v3);

  xpc_dictionary_set_string(v4, "remote-cryptex-identifier", *(const char **)v5);
  xpc_dictionary_set_string(v4, "remote-cryptex-version", **(const char ***)(v5 + 16));
  xpc_dictionary_set_value(empty, "remote-cryptex", v4);
  id v6 = sub_10003D7E8(*(void **)(a1 + 40), empty, 0LL);
  sub_10002129C(v6);
  sub_100037F94((uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
}

void sub_100022F30(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  v22[3] = a4;
  id v9 = *(id *)(a4 + 56);
  if (a3)
  {
    int v10 = *__error();
    id v11 = sub_10001F190();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      uint64_t v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "uninstall: %@", buf, 0xCu);
    }

    *__error() = v10;
  }

  else
  {
    int v13 = *__error();
    id v14 = sub_10001F190();
    os_log_type_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "uninstall [no error]", buf, 2u);
    }

    *__error() = v13;
  }

  id v16 = sub_100021780();
  int v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002312C;
  v19[3] = &unk_100056878;
  id v20 = v9;
  int v21 = v22;
  id v18 = v9;
  dispatch_async(v17, v19);

  _Block_object_dispose(v22, 8);
}

void sub_100023108( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002312C(uint64_t a1)
{
  id v2 = *(__CFError **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) + 16LL);
  id v3 = sub_10003D7E8(*(void **)(a1 + 32), 0LL, v2);
  sub_10002129C(v3);
  sub_100037F94((uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));

  if (v2) {
    CFRelease(v2);
  }
}

void sub_1000231A0(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000231BC(uint64_t a1)
{
  id v2 = sub_100017B18( *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL),  *(char **)(a1 + 48),  *(void *)(a1 + 56));
  if (v2)
  {
    sub_100017570( *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL),  v2,  *(void *)(a1 + 64),  *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  sub_100023338);
  }

  else
  {
    int v3 = *__error();
    id v4 = sub_10001F190();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)int buf = 136315394;
      uint64_t v12 = v6;
      __int16 v13 = 1024;
      int v14 = 2;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "failed to find cryptex with identifier %s: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v3;
    id v7 = sub_100021780();
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100023474;
    v9[3] = &unk_1000568A0;
    v9[4] = *(void *)(a1 + 40);
    int v10 = 2;
    dispatch_async(v8, v9);
  }
}

void sub_100023338(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = a1;
  int v10 = *__error();
  id v11 = sub_10001F190();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  __int16 v13 = v12;
  if (a3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      uint64_t v19 = a3;
      int v14 = "unbootstrap: %@";
      os_log_type_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v18, v17);
    }
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v1_Block_object_dispose(va, 8) = 0;
    int v14 = "unbootstrap [no error]";
    os_log_type_t v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    uint32_t v17 = 2;
    goto LABEL_6;
  }

  *__error() = v10;
  sub_100016BE8(v9, v8, v7, sub_1000234B4);
}

void sub_100023474(uint64_t a1)
{
  id v1 = sub_10003D064(*(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), 0LL, *(_DWORD *)(a1 + 40));
  sub_10002129C(v1);
}

void sub_1000234B4(uint64_t a1, uint64_t a2, CFIndex a3, void *a4)
{
  if (a3)
  {
    int v6 = sub_10000A5D8(a3);
    int v7 = *__error();
    id v8 = sub_10001F190();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      CFIndex v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "uninstall: %@", buf, 0xCu);
    }
  }

  else
  {
    int v7 = *__error();
    id v10 = sub_10001F190();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "uninstall [no error]", buf, 2u);
    }

    int v6 = 0;
  }

  *__error() = v7;
  id v11 = sub_100021780();
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10002363C;
  v14[3] = &unk_1000568F0;
  id v15 = a4;
  int v16 = v6;
  id v13 = a4;
  dispatch_async(v12, v14);
}

void sub_10002363C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v4 = sub_10003D064(v2, empty, *(_DWORD *)(a1 + 40));

  sub_10002129C(v4);
}

void sub_100023698(uint64_t a1)
{
  id v2 = sub_100014D14();
  sub_100017B88(v2, *(id *)(a1 + 32), sub_1000236E4);
}

void sub_1000236E4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100023818;
  v15[3] = &unk_100056940;
  int v16 = v5;
  xpc_object_t v6 = xpc_array_create_empty();
  id v17 = v6;
  int v7 = v5;
  sub_100017ED4((uint64_t)v4, (uint64_t)v15);

  id v8 = sub_100021780();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000239DC;
  v12[3] = &unk_100056968;
  id v13 = v6;
  id v14 = v3;
  id v10 = v3;
  id v11 = v6;
  dispatch_group_notify(v7, v9, v12);

  dispatch_group_leave(v7);
}

uint64_t sub_100023818(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  xpc_object_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_1000238C4;
  id v9 = &unk_100056918;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v4 = v3;
  cryptex_async();

  return 1LL;
}

void sub_1000238C4(uint64_t a1)
{
  uint64_t v2 = sub_100030D60(*(void *)(a1 + 32));
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "remote-cryptex-identifier", *(const char **)v2);
  xpc_dictionary_set_string(empty, "remote-cryptex-version", **(const char ***)(v2 + 16));
  uint64_t v4 = sub_100008BDC();
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000239B0;
  block[3] = &unk_100056918;
  id v8 = *(id *)(a1 + 40);
  id v9 = empty;
  id v10 = *(id *)(a1 + 48);
  id v6 = empty;
  dispatch_async(v5, block);
}

void sub_1000239B0(uint64_t a1)
{
}

void sub_1000239DC(uint64_t a1)
{
  id empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(empty, "remote-cryptex-array", *(xpc_object_t *)(a1 + 32));
  uint64_t v2 = sub_10003D064(*(void **)(a1 + 40), empty, 0);
  sub_10002129C(v2);
}

uint64_t sub_100023A38(unsigned int *a1, CFTypeRef *a2)
{
  kern_return_t v32;
  kern_return_t v33;
  os_log_s *v34;
  int v35;
  os_log_s *v36;
  int v37;
  int v38;
  size_t outputStructCnt;
  int outputStruct;
  io_connect_t connect;
  uint64_t v42;
  char __s[1024];
  uint64_t inputStruct;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint8_t buf[88];
  connect = 0;
  id v60 = 0LL;
  int v59 = 0u;
  id v58 = 0u;
  int v57 = 0u;
  uint64_t v56 = 0u;
  unint64_t v55 = 0u;
  id v54 = 0u;
  __int128 v53 = 0u;
  id v52 = 0u;
  id v51 = 0u;
  int v50 = 0u;
  int v49 = 0u;
  __int16 v48 = 0u;
  int v47 = 0u;
  xpc_object_t v46 = 0u;
  int v45 = 0u;
  inputStruct = 0x1BEEFFEEDLL;
  outputStruct = 0;
  outputStructCnt = 4LL;
  bzero(__s, 0x400uLL);
  CFMutableDictionaryRef v4 = sub_10000A2A0();
  if (!v4) {
    sub_10003FA34(&v42, buf);
  }
  uint64_t v5 = v4;
  id v6 = (char *)*((void *)a1 + 1);
  if (v6)
  {
    CFStringRef v7 = sub_10000A17C(v6);
    id v8 = 0LL;
  }

  else
  {
    id v9 = CFUUIDCreate(0LL);
    if (!v9) {
      sub_10003FAB0(&v42, buf);
    }
    id v8 = v9;
    CFStringRef v7 = CFUUIDCreateString(0LL, v9);
    if (!v7) {
      sub_10003FB2C(&v42, buf);
    }
  }

  CFDictionarySetValue(v5, @"hdik-unique-identifier", v7);
  CFDictionarySetValue(v5, @"autodiskmount", kCFBooleanFalse);
  CFDictionarySetValue(v5, @"write-protected", kCFBooleanTrue);
  uint64_t v10 = realpath_np(*a1, __s);
  if ((_DWORD)v10)
  {
    uint64_t v11 = v10;
    int v12 = *__error();
    id v13 = (os_log_s *)*((void *)a1 + 259);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "realpath_np: %{darwin.errno}d", buf, 8u);
    }

    CFNumberRef v14 = 0LL;
    CFDataRef v15 = 0LL;
    int v16 = 0LL;
    io_service_t v17 = 0;
    *__error() = v12;
  }

  else
  {
    size_t v19 = strlen(__s);
    CFDataRef v20 = CFDataCreate(0LL, (const UInt8 *)__s, v19);
    if (!v20) {
      sub_10003FBA8(&v42, buf);
    }
    CFDataRef v15 = v20;
    CFDictionarySetValue(v5, @"image-path", v20);
    CFNumberRef v21 = sub_10000A0D4(*a1);
    if (!v21) {
      sub_10003FC24(&v42, buf);
    }
    CFNumberRef v14 = v21;
    CFDictionarySetValue(v5, @"image-fd", v21);
    int v22 = *__error();
    int v23 = (os_log_s *)*((void *)a1 + 259);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "attach args = %@", buf, 0xCu);
    }

    *__error() = v22;
    Data = CFPropertyListCreateData(0LL, v5, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
    if (!Data) {
      sub_10003FBA8(&v42, buf);
    }
    int v16 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    CFIndex Length = CFDataGetLength(v16);
    if (Length < 0) {
      sub_10003E43C();
    }
    *(void *)&int v45 = BytePtr;
    *((void *)&v45 + 1) = Length;
    id v27 = IOServiceMatching("IOHDIXController");
    io_service_t MatchingService = IOServiceGetMatchingService(0, v27);
    if (MatchingService)
    {
      io_service_t v17 = MatchingService;
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      {
        int v29 = *__error();
        int v30 = (os_log_s *)*((void *)a1 + 259);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = 5;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "IOServiceOpen: %{mach.errno}x", buf, 8u);
        }

        *__error() = v29;
        uint64_t v11 = 61LL;
      }

      else
      {
        uint64_t v32 = IOConnectCallStructMethod(connect, 0, &inputStruct, 0x100uLL, &outputStruct, &outputStructCnt);
        if (v32)
        {
          int v33 = v32;
          int v38 = *__error();
          uint64_t v34 = (os_log_s *)*((void *)a1 + 259);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "kIOHDIXControllerCreateDriveMethod: %{mach.errno}x",  buf,  8u);
          }

          *__error() = v38;
          uint64_t v11 = 83LL;
        }

        else
        {
          if (outputStructCnt != 4) {
            sub_10003FD18(&v42, buf);
          }
          int v35 = *__error();
          uint64_t v36 = (os_log_s *)*((void *)a1 + 259);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = outputStruct;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "drive number: %d", buf, 8u);
          }

          *__error() = v35;
          uint64_t v11 = 0LL;
          *a2 = CFRetain(v7);
        }
      }
    }

    else
    {
      int v37 = *__error();
      unint64_t v31 = (os_log_s *)*((void *)a1 + 259);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136315138;
        *(void *)&uint8_t buf[4] = "IOHDIXController";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "could not find %s", buf, 0xCu);
      }

      io_service_t v17 = 0;
      *__error() = v37;
      uint64_t v11 = 78LL;
    }
  }

  if (connect && IOServiceClose(connect)) {
    sub_10003FCA0(&v42, buf);
  }
  if (v17 - 1 <= 0xFFFFFFFD) {
    mach_right_send_release(v17);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(v5);
  return v11;
}

uint64_t sub_100024008(uint64_t a1, const void *a2, const char **a3, char *a4, char *a5)
{
  kern_return_t v13;
  int v14;
  os_log_s *v15;
  uint64_t v16;
  const char *v17;
  io_registry_entry_t v18;
  io_object_t v19;
  CFTypeRef v20;
  const void *v21;
  const char *v22;
  int v23;
  os_log_s *v24;
  int v25;
  unsigned int v26;
  int v27;
  os_log_s *v28;
  char *v29;
  char *v30;
  CFStringRef v31;
  const char **v33;
  unsigned int v34;
  IONotificationPort *notify;
  CFStringRef v36;
  CFTypeRef cf;
  io_iterator_t notification;
  uint8_t v39[4];
  const void *v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[31];
  notification = 0;
  uint64_t v36 = 0LL;
  CFTypeRef cf = 0LL;
  IONotificationPortRef v10 = IONotificationPortCreate(0);
  if (!v10) {
    sub_10003FDAC();
  }
  uint64_t v11 = v10;
  int v12 = IOServiceMatching("IOMedia");
  notify = v11;
  id v13 = IOServiceAddMatchingNotification(v11, "IOServiceMatched", v12, 0LL, 0LL, &notification);
  CFNumberRef v14 = *__error();
  CFDataRef v15 = *(os_log_s **)(a1 + 2072);
  if (v13)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 2072), OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "IOServiceAddMatchingNotification: %{mach.errno}x",  buf,  8u);
    }

    *__error() = v14;
    IONotificationPortDestroy(v11);
    int v16 = 0xFFFFFFFFLL;
    goto LABEL_36;
  }

  int v33 = a3;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 138412290;
    *(void *)&uint8_t buf[4] = a2;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "looking for drive: %@", buf, 0xCu);
  }

  uint64_t v34 = 2;
  *__error() = v14;
  io_service_t v17 = "/dev/";
  do
  {
    CFIndex v18 = IOIteratorNext(notification);
    if (!v18) {
      break;
    }
    size_t v19 = v18;
    id v54 = 0u;
    memset(v55, 0, sizeof(v55));
    id v52 = 0u;
    __int128 v53 = 0u;
    int v50 = 0u;
    id v51 = 0u;
    __int16 v48 = 0u;
    int v49 = 0u;
    int v47 = 0u;
    int v45 = 0u;
    xpc_object_t v46 = 0u;
    unint64_t v43 = 0u;
    uint64_t v44 = 0u;
    *(_OWORD *)int buf = 0u;
    uint64_t v42 = 0u;
    CFDataRef v20 = IORegistryEntrySearchCFProperty(v18, "IOService", @"hdik-unique-identifier", 0LL, 3u);
    if (v20)
    {
      CFNumberRef v21 = v20;
      int v22 = v17;
      int v23 = *__error();
      uint64_t v24 = *(os_log_s **)(a1 + 2072);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v39 = 138412290;
        id v40 = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "found property: %@", v39, 0xCu);
      }

      *__error() = v23;
      if (CFEqual(a2, v21))
      {
        io_service_t v17 = v22;
        if (IOObjectConformsTo(v19, "AppleAPFSVolume")
          || IOObjectConformsTo(v19, "AppleAPFSMedia")
          || IOObjectConformsTo(v19, "AppleAPFSContainerScheme")
          || IOObjectConformsTo(v19, "AppleAPFSContainer"))
        {
          int v25 = 9;
LABEL_22:
          CFRelease(v21);
          goto LABEL_23;
        }

        int v26 = sub_10002443C(*(os_log_s **)(a1 + 2072), v19, v33, &cf, &v36);
        if (!v26)
        {
          int v29 = sub_10000A190((const __CFString *)cf, (char *)buf, 255LL);
          if (!v29) {
            sub_10003FE3C();
          }
          snprintf(a4, 0x400uLL, "%s%s", v22, v29);
          int v30 = sub_10000A190(v36, (char *)buf, 255LL);
          if (!v30) {
            sub_10003FE3C();
          }
          snprintf(a5, 0x400uLL, "%s%s", v22, v30);
          uint64_t v34 = 0;
          int v25 = 10;
          goto LABEL_22;
        }

        uint64_t v34 = v26;
        id v27 = *__error();
        id v28 = *(os_log_s **)(a1 + 2072);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v39 = 67109120;
          LODWORD(v40) = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "failed to get device nodes: %{darwin.errno}d",  v39,  8u);
        }

        int v25 = 0;
        *__error() = v27;
      }

      else
      {
        int v25 = 9;
      }

      io_service_t v17 = v22;
      goto LABEL_22;
    }

    int v25 = 9;
LABEL_23:
    if (IOObjectRelease(v19)) {
      sub_10003FDC4(v39, buf);
    }
  }

  while (v25 != 10);
  unint64_t v31 = v36;
  IONotificationPortDestroy(notify);
  if (v31) {
    CFRelease(v31);
  }
  int v16 = v34;
LABEL_36:
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

uint64_t sub_10002443C(os_log_s *a1, io_object_t object, const char **a3, void *a4, void *a5)
{
  kern_return_t ParentEntry;
  kern_return_t v26;
  int v27;
  char v28;
  uint64_t v29;
  CFTypeRef v30;
  CFTypeRef v31;
  CFTypeID v32;
  CFTypeRef v33;
  CFBooleanRef v34;
  CFStringRef v35;
  void *v36;
  int v37;
  int v38;
  const char *v40;
  CFTypeRef v41;
  const char **v42;
  void *v43;
  CFTypeRef v44;
  io_object_t objecta;
  io_registry_entry_t entry;
  uint64_t v47;
  uint8_t buf[80];
  io_registry_entry_t v8 = object;
  if (IOObjectRetain(object)) {
    sub_10003FE84(&v47, buf);
  }
  entry = v8;
  if (IOObjectRetain(v8)) {
    sub_10003FE84(&v47, buf);
  }
  objecta = v8;
  if (sub_1000109AC(&objecta, "AppleAPFSContainerScheme")
    || sub_1000109AC(&objecta, "AppleAPFSMedia"))
  {
    IONotificationPortRef v10 = "hfs";
  }

  else
  {
    IONotificationPortRef v10 = "hfs";
    if (!sub_1000109AC(&objecta, "AppleAPFSContainer")
      && !sub_1000109AC(&objecta, "AppleAPFSVolume"))
    {
      IONotificationPortRef v10 = "apfs";
      io_registry_entry_t v8 = objecta;
    }
  }

  uint64_t v11 = kCFAllocatorDefault;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, @"BSD Name", kCFAllocatorDefault, 0);
  if (!CFProperty || (v13 = CFProperty, CFTypeID v14 = CFGetTypeID(CFProperty), v14 != CFStringGetTypeID())) {
    sub_10003FE54();
  }
  id v40 = v10;
  uint64_t v42 = a3;
  unint64_t v43 = a5;
  int v15 = *__error();
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "subdevice node = %@", buf, 0xCu);
  }

  int v41 = v13;
  uint64_t v44 = 0LL;
  *__error() = v15;
  CFBooleanRef v16 = kCFBooleanTrue;
  io_service_t v17 = @"Whole";
  do
  {
    CFIndex v18 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, v17, v11, 0);
    size_t v19 = v18;
    if (v18)
    {
      CFTypeID v20 = CFGetTypeID(v18);
      if (v20 == CFBooleanGetTypeID()) {
        CFNumberRef v21 = v19;
      }
      else {
        CFNumberRef v21 = 0LL;
      }
    }

    else
    {
      CFNumberRef v21 = 0LL;
    }

    int v22 = *__error();
    BOOL v23 = os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG);
    if (v21 == v16)
    {
      if (v23)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "found whole disk node", buf, 2u);
      }

      *__error() = v22;
      int v30 = IORegistryEntryCreateCFProperty(entry, @"BSD Name", v11, 0);
      if (v30)
      {
        unint64_t v31 = v30;
        uint64_t v32 = CFGetTypeID(v30);
        if (v32 == CFStringGetTypeID()) {
          int v33 = v31;
        }
        else {
          int v33 = 0LL;
        }
        if (!a4) {
LABEL_57:
        }
          sub_10003FE6C();
      }

      else
      {
        int v33 = 0LL;
        if (!a4) {
          goto LABEL_57;
        }
      }

      int v38 = *__error();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "devnode = %@", buf, 0xCu);
      }

      uint64_t v44 = v33;
      id v28 = 0;
      int v29 = 0LL;
      *__error() = v38;
      io_registry_entry_t v24 = entry;
    }

    else
    {
      if (v23)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "not whole disk node", buf, 2u);
      }

      *__error() = v22;
      io_registry_entry_t v24 = entry;
      ParentEntry = IORegistryEntryGetParentEntry(entry, "IOService", &entry);
      if (ParentEntry)
      {
        int v26 = ParentEntry;
        if (ParentEntry == -536870208)
        {
          id v27 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)int buf = 0;
            _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "found root node, stopping", buf, 2u);
          }

          id v28 = 0;
          *__error() = v27;
          int v29 = 2LL;
        }

        else
        {
          uint64_t v34 = v16;
          int v35 = v17;
          uint64_t v36 = a4;
          int v37 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v26;
            _os_log_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "IORegistryEntryGetParentEntry: %{mach.errno}x",  buf,  8u);
          }

          id v28 = 0;
          *__error() = v37;
          int v29 = 83LL;
          a4 = v36;
          io_service_t v17 = v35;
          CFBooleanRef v16 = v34;
          uint64_t v11 = kCFAllocatorDefault;
        }
      }

      else
      {
        int v29 = 35LL;
        id v28 = 1;
      }
    }

    if (v19) {
      CFRelease(v19);
    }
    if (v24 && IOObjectRelease(v24)) {
      sub_10003FDC4(&v47, buf);
    }
  }

  while ((v28 & 1) != 0);
  if (v21 == v16)
  {
    if (v42) {
      char *v42 = v40;
    }
    *a4 = v44;
    *unint64_t v43 = v41;
  }

  if (objecta && IOObjectRelease(objecta)) {
    sub_10003FDC4(&v47, buf);
  }
  return v29;
}

uint64_t sub_10002493C(int *a1, int a2, uint64_t a3)
{
  int v6 = *a1;
  os_log_t v7 = os_log_create("com.apple.libcryptex", "hdi");
  os_log_t v8 = v7;
  if (!*(void *)(a3 + 2072)) {
    *(void *)(a3 + 2072) = v7;
  }
  if ((*(_DWORD *)a3 & 0x80000000) != 0)
  {
    int v12 = -1;
  }

  else
  {
    uint64_t v9 = sub_1000259C4(a3);
    int v10 = *__error();
    uint64_t v11 = *(os_log_s **)(a3 + 2072);
    if ((_DWORD)v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "hdi_mount_slow: %{darwin.errno}d", buf, 8u);
      }

      *__error() = v10;
      goto LABEL_118;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      *(void *)&uint8_t buf[4] = a3 + 1048;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "attached as: %s", buf, 0xCu);
    }

    *__error() = v10;
    int v12 = *(_DWORD *)(a3 + 4);
  }

  CFTypeRef v13 = *(const char **)(a3 + 16);
  if (!v13)
  {
    int v14 = *__error();
    CFTypeID v20 = *(os_log_s **)(a3 + 2072);
    uint64_t v9 = 22LL;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)int buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = 22;
    io_service_t v17 = "FS type not specified: %{darwin.errno}d";
LABEL_110:
    CFIndex v18 = v20;
    uint32_t v19 = 8;
LABEL_111:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
LABEL_112:
    *__error() = v14;
    if ((v12 & 0x80000000) == 0)
    {
      if (ioctl(v12, 0x20006415uLL))
      {
        int v65 = *__error();
        __int16 v66 = *(os_log_s **)(a3 + 2072);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          int v67 = *__error();
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v67;
          _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "failed to clean up device: %{darwin.errno}d",  buf,  8u);
        }

        *__error() = v65;
      }

      *(_BYTE *)(a3 + 24) = 0;
      *(_BYTE *)(a3 + 104_Block_object_dispose(va, 8) = 0;
      *(_DWORD *)(a3 + 4) = -1;
    }

    goto LABEL_118;
  }

  if (!strcmp(*(const char **)(a3 + 16), "hfs"))
  {
    unsigned int v83 = v6;
    int v85 = v12;
    bzero(v96, 0x400uLL);
    uint64_t v90 = 511LL;
    uint64_t v87 = a3 + 1048;
    uid_t v88 = getuid();
    gid_t v89 = getgid();
    __int128 v91 = xmmword_1000448F0;
    uint64_t v92 = 0LL;
    int v21 = *__error();
    int v22 = *(os_log_s **)(a3 + 2072);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      *(void *)&uint8_t buf[4] = a3 + 1048;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "mounting device = %s", buf, 0xCu);
    }

    *__error() = v21;
    if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_DEBUG) && !realpath_np(v83, v96))
    {
      int v23 = *__error();
      io_registry_entry_t v24 = *(os_log_s **)(a3 + 2072);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136315138;
        *(void *)&uint8_t buf[4] = v96;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "mount point = %s", buf, 0xCu);
      }

      *__error() = v23;
    }

    if (gettimeofday(0LL, &v91) == -1) {
      sub_10003FEFC(&__buf, buf);
    }
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    __int128 v114 = 0u;
    __int128 v115 = 0u;
    __int128 v112 = 0u;
    __int128 v113 = 0u;
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v99 = 0u;
    memset(&__buf, 0, sizeof(__buf));
    int v25 = open((const char *)(a3 + 1048), 4);
    int v26 = v25;
    int v12 = v85;
    if (v25 < 0)
    {
      uint64_t v9 = *__error();
      goto LABEL_102;
    }

    if (pread(v25, &__buf, 0x200uLL, 1024LL) < 162)
    {
      uint64_t v9 = 96LL;
LABEL_103:
      if (close(v26) == -1) {
        sub_10003FFF4(&v142, buf);
      }
LABEL_104:
      int v63 = *__error();
      int v64 = *(os_log_s **)(a3 + 2072);
      if ((_DWORD)v9)
      {
        if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "could not get encoding: %{darwin.errno}d",  buf,  8u);
        }

        *__error() = v63;
      }

      else
      {
        int v69 = a2 | 0x100001;
        if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_DEBUG))
        {
          uint64_t v70 = *(void *)(a3 + 16);
          *(_DWORD *)int buf = 136315650;
          *(void *)&uint8_t buf[4] = v70;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v83;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v69;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEBUG,  "mount args: fs = %s, fd = %d, flags = %#x",  buf,  0x18u);
        }

        *__error() = v63;
        int v71 = *(os_log_s **)(a3 + 2072);
        bzero(buf, 0x400uLL);
        memset(&__buf, 0, sizeof(__buf));
        int v6 = v83;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          if (fstat(v83, &__buf) == -1)
          {
            int v76 = *__error();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              int v77 = *__error();
              v142.vfc_reserved1 = 136315650;
              *(void *)v142.vfc_name = "mntfd";
              *(_WORD *)&v142.vfc_name[8] = 1024;
              *(_DWORD *)&v142.vfc_name[10] = v83;
              *(_WORD *)&v142.vfc_name[14] = 1024;
              v142.vfc_typenum = v77;
              _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  (uint8_t *)&v142,  0x18u);
            }

            *__error() = v76;
          }

          else
          {
            if (fcntl(v83, 50, buf))
            {
              __int16 v72 = __error();
              id v73 = strerror(*v72);
              snprintf(buf, 0x400uLL, "[%s]", v73);
            }

            unint64_t v74 = ((unint64_t)__buf.st_mode >> 12) ^ 8;
            if ((_DWORD)v74 == 15) {
              id v75 = "[unknown]";
            }
            else {
              id v75 = off_100056E00[v74];
            }
            uint64_t v78 = (void *)os_flagset_copy_string(&unk_100056A00, __buf.st_flags);
            int v79 = *__error();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              v142.vfc_reserved1 = 136316418;
              *(void *)v142.vfc_name = "mntfd";
              *(_WORD *)&v142.vfc_name[8] = 1024;
              *(_DWORD *)&v142.vfc_name[10] = v83;
              *(_WORD *)&v142.vfc_name[14] = 2080;
              *(void *)&v142.vfc_typenum = v75;
              LOWORD(v142.vfc_flags) = 2048;
              *(void *)((char *)&v142.vfc_flags + 2) = __buf.st_size;
              HIWORD(v142.vfc_reserved3) = 2080;
              v143 = v78;
              __int16 v144 = 2080;
              uint64_t v145 = buf;
              _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  (uint8_t *)&v142,  0x3Au);
            }

            *__error() = v79;
            free(v78);
            int v6 = v83;
          }
        }

        if (!fmount("hfs", v6, v69, &v87)) {
          goto LABEL_142;
        }
        uint64_t v9 = *__error();
        int v80 = *__error();
        id v81 = *(os_log_s **)(a3 + 2072);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "fmount: %{darwin.errno}d", buf, 8u);
        }

        *__error() = v80;
        int v12 = v85;
        if (!(_DWORD)v9) {
          goto LABEL_142;
        }
      }

      int v14 = *__error();
      CFTypeID v20 = *(os_log_s **)(a3 + 2072);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_112;
      }
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      io_service_t v17 = "mount hfs failed: %{darwin.errno}d";
      goto LABEL_110;
    }

    unsigned int v34 = bswap32(LOWORD(__buf.st_dev));
    unsigned int v35 = HIWORD(v34);
    LOWORD(__buf.st_dev) = HIWORD(v34);
    LOWORD(__buf.st_lspare) = bswap32(LOWORD(__buf.st_lspare)) >> 16;
    unsigned int v36 = bswap32(HIDWORD(__buf.st_blocks));
    HIDWORD(__buf.st_blocks) = v36;
    if (v35 != 18475 && v35 != 18520)
    {
      int v40 = *__error();
      int v41 = *(os_log_s **)(a3 + 2072);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = LOWORD(__buf.st_dev);
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = LOWORD(__buf.st_lspare);
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "filesystem unsupported or corrupt: drSigWord = %#hx, drEmbedSigWord = %#hx",  buf,  0xEu);
      }

      *__error() = v40;
      uint64_t v9 = 92LL;
      goto LABEL_103;
    }

    if (v36 >> 8 == 6647395)
    {
      int v37 = v36;
      goto LABEL_93;
    }

    int v123 = 1;
    *(void *)id v122 = 3LL;
    memset(&v142, 0, sizeof(v142));
    int v95 = -1;
    size_t v94 = 4LL;
    if (getvfsbyname("hfs", &v142) == -1) {
      sub_10003FEFC(&v93, buf);
    }
    v122[1] = v142.vfc_typenum;
    if ((sysctl(v122, 3u, &v95, &v94, 0LL, 0LL) & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v42 = *__error();
    if (v42 && v42 != 45 && *__error()) {
      sub_1000400EC(&v93, buf);
    }
    int v37 = v95;
    if ((v95 + 1) > 1)
    {
LABEL_93:
      if (v37 == 4)
      {
LABEL_94:
        uint64_t v9 = 0LL;
        HIDWORD(v90) = v37;
      }

      else
      {
        unint64_t v58 = -1LL;
        int v59 = &qword_100044928;
        while (v58 != 36)
        {
          uint64_t v60 = *v59;
          v59 += 3;
          ++v58;
          if (v60 == v37)
          {
            if (v58 < 0x25) {
              goto LABEL_94;
            }
            break;
          }
        }

        int v61 = *__error();
        int v62 = *(os_log_s **)(a3 + 2072);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v37;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "unsupported encoding: %u", buf, 8u);
        }

        *__error() = v61;
        uint64_t v9 = 79LL;
        int v12 = v85;
      }

LABEL_102:
      if (v26 == -1) {
        goto LABEL_104;
      }
      goto LABEL_103;
    }

    bzero(buf, 0x400uLL);
    unint64_t v43 = getpwuid(0);
    if (!v43) {
      sub_100040070(v122, &v142);
    }
    snprintf(buf, 0x400uLL, "%s/%s", v43->pw_dir, "/.CFUserTextEncoding");
    int v44 = open(buf, 0);
    if ((v44 & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v37 = 0;
    int v45 = *__error();
    int v82 = v44;
    if (v45 > 3)
    {
      if (v45 != 4 && v45 != 13) {
        goto LABEL_76;
      }
    }

    else
    {
      if (!v45)
      {
LABEL_77:
        ssize_t v48 = read(v44, buf, 0x400uLL);
        if (v48)
        {
          if (v48 < 0)
          {
            int v53 = *__error();
            id v54 = *(os_log_s **)(a3 + 2072);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              int v55 = *__error();
              v142.vfc_reserved1 = 67109120;
              *(_DWORD *)v142.vfc_name = v55;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "error reading encoding file: %{darwin.errno}d",  (uint8_t *)&v142,  8u);
            }

            int v37 = 0;
            *__error() = v53;
          }

          else
          {
            buf[v48] = 0;
            int v49 = *__error();
            int v50 = *(os_log_s **)(a3 + 2072);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              v142.vfc_reserved1 = 136315138;
              *(void *)v142.vfc_name = buf;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEBUG,  "read encoding: %s",  (uint8_t *)&v142,  0xCu);
            }

            *__error() = v49;
            int v37 = strtol(buf, 0LL, 0);
          }
        }

        else
        {
          int v51 = *__error();
          id v52 = *(os_log_s **)(a3 + 2072);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v142.vfc_reserved1) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "encoding file empty",  (uint8_t *)&v142,  2u);
          }

          int v37 = 0;
          *__error() = v51;
        }

        goto LABEL_88;
      }

      if (v45 != 2)
      {
LABEL_76:
        if (*__error()) {
          sub_1000400EC(v122, &v142);
        }
        goto LABEL_77;
      }
    }

LABEL_88:
    int v56 = *__error();
    int v57 = *(os_log_s **)(a3 + 2072);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 67109120;
      *(_DWORD *)v142.vfc_name = v37;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "returning encoding: %u", (uint8_t *)&v142, 8u);
    }

    *__error() = v56;
    if (v82 != -1 && close(v82) == -1) {
      sub_10003FFF4(v122, &v142);
    }
    int v12 = v85;
    goto LABEL_93;
  }

  if (strcmp(v13, "apfs"))
  {
    int v14 = *__error();
    int v15 = *(os_log_s **)(a3 + 2072);
    uint64_t v9 = 22LL;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    uint64_t v16 = *(void *)(a3 + 16);
    *(_DWORD *)int buf = 136315394;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 22;
    io_service_t v17 = "Invalid FS type: %s: %{darwin.errno}d";
    CFIndex v18 = v15;
    uint32_t v19 = 18;
    goto LABEL_111;
  }

  __int128 v140 = 0u;
  memset(v141, 0, 48);
  __int128 v139 = 0u;
  __int128 v138 = 0u;
  __int128 v137 = 0u;
  __int128 v136 = 0u;
  __int128 v135 = 0u;
  __int128 v134 = 0u;
  __int128 v133 = 0u;
  __int128 v132 = 0u;
  __int128 v131 = 0u;
  __int128 v130 = 0u;
  __int128 v129 = 0u;
  __int128 v128 = 0u;
  __int128 v127 = 0u;
  __int128 v126 = 0u;
  __int128 v125 = 0u;
  *(_OWORD *)&uint8_t buf[8] = 0u;
  int v27 = *(_DWORD *)(a3 + 2092);
  int v28 = *(_DWORD *)(a3 + 2084);
  int v84 = *(_DWORD *)(a3 + 2096);
  int v86 = *(_DWORD *)(a3 + 2088);
  uint64_t v97 = 0LL;
  memset(v96, 0, sizeof(v96));
  memset(&__buf, 0, 56);
  int v29 = a2 | 0x100001;
  *(void *)int buf = a3 + 1048;
  v141[11] = getuid();
  v141[12] = getgid();
  *(_WORD *)&uint8_t buf[16] = 1;
  *(_DWORD *)&uint8_t buf[8] = v29;
  if (*(_BYTE *)(a3 + 2080))
  {
    uint64_t v30 = sub_10003BB8C(v27, v96);
    if ((_DWORD)v30)
    {
      uint64_t v9 = v30;
      int v31 = *__error();
      uint64_t v32 = *(os_log_s **)(a3 + 2072);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v142.vfc_reserved1 = 67109120;
        *(_DWORD *)v142.vfc_name = v9;
        int v33 = "Failed to read im4m.: %{darwin.errno}d";
LABEL_67:
        id v39 = v32;
        goto LABEL_68;
      }

      goto LABEL_69;
    }

    uint64_t v9 = sub_10003BB8C(v28, &__buf);
    int v31 = *__error();
    int v38 = *(os_log_s **)(a3 + 2072);
    if ((_DWORD)v9)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v142.vfc_reserved1 = 67109120;
        *(_DWORD *)v142.vfc_name = v9;
        int v33 = "Failed to read root volume hash.: %{darwin.errno}d";
        id v39 = v38;
LABEL_68:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v33, (uint8_t *)&v142, 8u);
        goto LABEL_69;
      }

      goto LABEL_69;
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 134217984;
      *(void *)v142.vfc_name = *((void *)&v96[0] + 1);
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "im4m len: %lu", (uint8_t *)&v142, 0xCu);
    }

    *__error() = v31;
    int v46 = *__error();
    int v47 = *(os_log_s **)(a3 + 2072);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 134217984;
      *(void *)v142.vfc_name = __buf.st_ino;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "im4p len: %lu", (uint8_t *)&v142, 0xCu);
    }

    *__error() = v46;
    *(_WORD *)&uint8_t buf[16] = 8;
    v141[9] = v86;
    v141[10] = v84;
    *(_OWORD *)&v141[5] = v96[0];
    *(void *)&v141[1] = *(void *)&__buf.st_dev;
    *(void *)&v141[3] = __buf.st_ino;
  }

  if (fmount("apfs", v6, v29, buf))
  {
    uint64_t v9 = *__error();
    int v31 = *__error();
    uint64_t v32 = *(os_log_s **)(a3 + 2072);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v142.vfc_reserved1 = 67109120;
      *(_DWORD *)v142.vfc_name = v9;
      int v33 = "fmount: %{darwin.errno}d";
      goto LABEL_67;
    }

            int v46 = *__error();
            int v47 = *__error();
            int v63 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              LODWORD(d_name) = v46;
              int v49 = buf;
              int v50 = v63;
              int v51 = "unlinkat: %{darwin.errno}d";
LABEL_90:
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v51, v49, 8u);
            }

            goto LABEL_91;
          }

          goto LABEL_71;
        }

        if (v40 != 16)
        {
          if (v40 != 21)
          {
            if (v40 != 66) {
              goto LABEL_88;
            }
            id v52 = *__error();
            int v53 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 136315138;
              d_name = v21->d_name;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "re-trying directory cleanup: %s",  buf,  0xCu);
            }

            *__error() = v52;
            ++v79;
          }

LABEL_69:
    *__error() = v31;
    goto LABEL_70;
  }

  uint64_t v9 = 0LL;
LABEL_70:
  sub_10003C5AC(v96);
  sub_10003C5AC(&__buf);
  if ((_DWORD)v9)
  {
    int v14 = *__error();
    CFTypeID v20 = *(os_log_s **)(a3 + 2072);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)int buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v9;
    io_service_t v17 = "mount apfs failed: %{darwin.errno}d";
    goto LABEL_110;
  }

LABEL_142:
  if (close(v6) == -1) {
    sub_10003FF78(v96, buf);
  }
  uint64_t v9 = 0LL;
  *a1 = -1;
LABEL_118:
  if (*(os_log_t *)(a3 + 2072) == v8) {
    *(void *)(a3 + 2072) = 0LL;
  }
  if (v8) {
    os_release(v8);
  }
  return v9;
}

uint64_t sub_1000259C4(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  bzero(v18, 0x400uLL);
  uint64_t v2 = sub_100023A38((unsigned int *)a1, &cf);
  if ((_DWORD)v2)
  {
    uint64_t v3 = v2;
    int v4 = *__error();
    uint64_t v5 = *(os_log_s **)(a1 + 2072);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "attach failed: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v4;
    CFTypeRef v6 = cf;
    if (!cf) {
      return v3;
    }
LABEL_13:
    CFRelease(v6);
    return v3;
  }

  CFTypeRef v6 = cf;
  uint64_t v7 = sub_100024008(a1, cf, (const char **)(a1 + 16), v18, (char *)(a1 + 1048));
  if ((_DWORD)v7)
  {
    uint64_t v3 = v7;
    int v8 = *__error();
    uint64_t v9 = *(os_log_s **)(a1 + 2072);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "could not find attached media: %{darwin.errno}d",  buf,  8u);
    }

    *__error() = v8;
    if (v6) {
      goto LABEL_13;
    }
  }

  else
  {
    int v10 = open(v18, 0);
    *(_DWORD *)(a1 + 4) = v10;
    if ((v10 & 0x80000000) == 0)
    {
      __strlcpy_chk(a1 + 24, v18, 1024LL, 1024LL);
      uint64_t v3 = 0LL;
      if (!v6) {
        return v3;
      }
      goto LABEL_13;
    }

    int v12 = *__error();
    CFTypeRef v13 = *(os_log_s **)(a1 + 2072);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)int buf = 67109120;
      int v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "open: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v12;
    uint64_t v3 = *__error();
    if (v6) {
      goto LABEL_13;
    }
  }

  return v3;
}

uint64_t sub_100025BDC(void *a1, void *a2, os_log_s *a3)
{
  kern_return_t v23;
  kern_return_t v24;
  int v25;
  io_registry_entry_t v26;
  io_object_t v27;
  CFStringRef v28;
  int v29;
  int v30;
  CFTypeRef v31;
  size_t v32;
  const char *f_mntfromname;
  char *v35;
  int v36;
  os_log_s *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  CFTypeRef cf;
  CFTypeRef v42;
  io_iterator_t notification;
  _OWORD v44[16];
  char v45[256];
  void v46[32];
  uint8_t buf[4];
  CFTypeRef v48;
  __int16 v49;
  CFTypeRef v50;
  notification = 0;
  unsigned int v6 = getfsstat(0LL, 0, 2);
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v13 = *__error();
    int v14 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v4_Block_object_dispose(va, 8) = v13;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }

    int v15 = __error();
    uint64_t v11 = 0LL;
    goto LABEL_18;
  }

  unsigned int v7 = v6;
  size_t v8 = v6;
  int is_multithreaded = _dispatch_is_multithreaded();
  int v10 = (statfs *)calloc(v8, 0x878uLL);
  uint64_t v11 = v10;
  if (is_multithreaded)
  {
    if (!v10)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v12 = (statfs *)calloc(v8, 0x878uLL);
      }

      while (!v12);
      uint64_t v11 = v12;
    }
  }

  else if (!v10)
  {
    sub_100040210(v46, buf);
  }

  if (getfsstat(v11, 2168 * v7, 2) < 0)
  {
    uint64_t v13 = *__error();
    int v14 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v4_Block_object_dispose(va, 8) = v13;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }

    int v15 = __error();
LABEL_18:
    int *v15 = v14;
    goto LABEL_61;
  }

  int v16 = _dispatch_is_multithreaded();
  int v17 = (char *)calloc(v8, 0xDFEuLL);
  CFIndex v18 = v17;
  if (v16)
  {
    if (!v17)
    {
      do
      {
        __os_temporary_resource_shortage();
        uint32_t v19 = (char *)calloc(v8, 0xDFEuLL);
      }

      while (!v19);
      CFIndex v18 = v19;
    }
  }

  else if (!v17)
  {
    sub_10004016C(v46, buf);
  }

  IONotificationPortRef v20 = IONotificationPortCreate(0);
  if (!v20) {
    sub_10003FDAC();
  }
  int v21 = v20;
  int v22 = IOServiceMatching("IOMedia");
  int v23 = IOServiceAddMatchingNotification(v21, "IOServiceMatched", v22, 0LL, 0LL, &notification);
  if (!v23)
  {
    int v38 = a1;
    id v39 = a2;
    int v40 = 0LL;
    while (1)
    {
      int v26 = IOIteratorNext(notification);
      if (!v26)
      {
        uint64_t v13 = 0LL;
        os_log_s *v38 = v18;
        *id v39 = v40;
        goto LABEL_60;
      }

      int v27 = v26;
      CFTypeRef cf = 0LL;
      int v42 = 0LL;
      memset(v46, 0, 255);
      memset(v45, 0, 255);
      memset(v44, 0, 255);
      int v28 = (const __CFString *)IORegistryEntrySearchCFProperty( v26,  "IOService",  @"hdik-unique-identifier",  0LL,  3u);
      if (!v28
        || IOObjectConformsTo(v27, "AppleAPFSVolume")
        || IOObjectConformsTo(v27, "AppleAPFSMedia")
        || IOObjectConformsTo(v27, "AppleAPFSContainerScheme")
        || IOObjectConformsTo(v27, "AppleAPFSContainer"))
      {
        goto LABEL_38;
      }

      int v29 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 138412290;
        ssize_t v48 = v28;
        _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "found property: %@", buf, 0xCu);
      }

      *__error() = v29;
      uint64_t v30 = sub_10002443C(a3, v27, 0LL, &v42, &cf);
      unsigned int v36 = *__error();
      if (v30) {
        break;
      }
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 138412546;
        ssize_t v48 = v42;
        int v49 = 2112;
        int v50 = cf;
        _os_log_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "found dev nodes: dev = %@, sub = %@",  buf,  0x16u);
      }

      *__error() = v36;
      if (!sub_10000A190((const __CFString *)v42, v45, 255LL)) {
        sub_10003FE3C();
      }
      int v31 = cf;
      if (v7)
      {
        int v37 = a3;
        uint64_t v32 = v8;
        f_mntfromname = v11->f_mntfromname;
        while (1)
        {
          bzero(buf, 0x400uLL);
          snprintf((char *)buf, 0x400uLL, "%s%s", "/dev/", (const char *)v44);
          f_mntfromname += 2168;
          if (!--v32)
          {
            a3 = v37;
            goto LABEL_38;
          }
        }

        a3 = v37;
        if (v11)
        {
          unsigned int v35 = &v18[3582 * v40];
          __strlcpy_chk(v35, v46, 510LL, 510LL);
          snprintf(v35 + 510, 0x400uLL, "%s%s", "/dev/", v45);
          snprintf(v35 + 1534, 0x400uLL, "%s%s", "/dev/", (const char *)v44);
          strlcpy(v35 + 2558, f_mntfromname - 1024, 0x400uLL);
          ++v40;
        }

        goto LABEL_38;
      }

LABEL_39:
      if (v31) {
        CFRelease(v31);
      }
      if (v42) {
        CFRelease(v42);
      }
      if (v28) {
        CFRelease(v28);
      }
      if (IOObjectRelease(v27)) {
        sub_10003FDC4(v46, buf);
      }
    }

    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v4_Block_object_dispose(va, 8) = v30;
      _os_log_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "failed to get device nodes: %{darwin.errno}d",  buf,  8u);
    }

    *__error() = v36;
LABEL_38:
    int v31 = cf;
    goto LABEL_39;
  }

  io_registry_entry_t v24 = v23;
  *__error() = 83;
  int v25 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 67109120;
    LODWORD(v4_Block_object_dispose(va, 8) = v24;
    _os_log_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "IOServiceAddMatchingNotification: %{mach.errno}x",  buf,  8u);
  }

  *__error() = v25;
  uint64_t v13 = 0xFFFFFFFFLL;
LABEL_60:
  IONotificationPortDestroy(v21);
LABEL_61:
  if (notification && IOObjectRelease(notification)) {
    sub_10003FDC4(v46, buf);
  }
  free(v11);
  return v13;
}

  ;
}

void sub_100026308(uint64_t a1)
{
}

uint64_t sub_100026344(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = sub_10001124C(232LL);
  *(void *)(v8 + 40) = a4;
  *(void *)(v8 + 64) = os_retain(a2);
  *(void *)(v8 + 4_Block_object_dispose(va, 8) = a1;
  if (_dispatch_is_multithreaded())
  {
    uint64_t v9 = strdup(a3);
    if (!v9)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v10 = strdup(a3);
      }

      while (!v10);
      uint64_t v9 = v10;
    }
  }

  else
  {
    uint64_t v9 = strdup(a3);
    if (!v9) {
      sub_10003E9D0(a3, &v14, v15);
    }
  }

  *(void *)(v8 + 72) = v9;
  *(_DWORD *)(v8 + 80) = -1;
  uint64_t v11 = strrchr(v9, 47);
  if (v11) {
    int v12 = v11 + 1;
  }
  else {
    int v12 = v9;
  }
  *(void *)(v8 + 56) = v12;
  sub_10003A6E4(v8 + 16, (int)"com.apple.security.cryptexd", "resource");
  sub_10003A714(v8 + 16, *(const char **)(v8 + 56));
  return v8;
}

uint64_t sub_100026470(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v5 = **(void **)(a1 + 48);
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t))qword_100056F98[v5];
  uint64_t v7 = openat(*(_DWORD *)(v3 + 56), *(const char **)(a1 + 72), a2 & 0xFFFFFFFC);
  int v34 = v7;
  if ((v7 & 0x80000000) == 0) {
    *__error() = 0;
  }
  if (*__error())
  {
    uint64_t v8 = *__error();
    uint64_t v9 = *(const char **)(a1 + 16);
    int v10 = *__error();
    uint64_t v11 = *(os_log_s **)(a1 + 32);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      *__error() = v10;
      goto LABEL_10;
    }

    int v12 = "[anonymous]";
    if (v9) {
      int v12 = v9;
    }
    uint64_t v13 = *(void *)(v4 + 8);
    uint64_t v14 = *(void *)(a1 + 72);
    *(_DWORD *)int buf = 136446978;
    int v37 = v12;
    __int16 v38 = 2080;
    uint64_t v39 = v13;
    __int16 v40 = 2080;
    uint64_t v41 = v14;
    __int16 v42 = 1024;
    int v43 = v8;
    int v15 = "%{public}s: failed to open %s resource: %s: %{darwin.errno}d";
    int v16 = v11;
    uint32_t v17 = 38;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_9;
  }

  uint32_t v19 = *(const char **)(a1 + 16);
  int v20 = *__error();
  int v21 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v22 = "[anonymous]";
    if (v19) {
      int v22 = v19;
    }
    uint64_t v23 = *(void *)(v4 + 8);
    uint64_t v24 = *(void *)(a1 + 72);
    *(_DWORD *)int buf = 136446722;
    int v37 = v22;
    __int16 v38 = 2080;
    uint64_t v39 = v23;
    __int16 v40 = 2080;
    uint64_t v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}s: opened %s resource: %s", buf, 0x20u);
  }

  *__error() = v20;
  if ((unint64_t)(v5 - 7) >= 0xFFFFFFFFFFFFFFFELL)
  {
    uint64_t v25 = v6(a1, v7);
    if ((_DWORD)v25)
    {
      uint64_t v8 = v25;
      int v26 = *(const char **)(a1 + 16);
      int v10 = *__error();
      int v27 = *(os_log_s **)(a1 + 32);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      int v28 = "[anonymous]";
      uint64_t v29 = *(void *)(a1 + 56);
      if (v26) {
        int v28 = v26;
      }
      *(_DWORD *)int buf = 136446722;
      int v37 = v28;
      __int16 v38 = 2080;
      uint64_t v39 = v29;
      __int16 v40 = 1024;
      LODWORD(v41) = v8;
      int v15 = "%{public}s: failed to validate resource: %s: %{darwin.errno}d";
      int v16 = v27;
      uint32_t v17 = 28;
      goto LABEL_8;
    }
  }

  if (fstat(v7, (stat *)(a1 + 88)))
  {
    uint64_t v8 = *__error();
    uint64_t v30 = *(const char **)(a1 + 16);
    int v31 = *__error();
    uint64_t v32 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v33 = "[anonymous]";
      if (v30) {
        int v33 = v30;
      }
      *(_DWORD *)int buf = 136446466;
      int v37 = v33;
      __int16 v38 = 1024;
      LODWORD(v3snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%{public}s: fstat: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v31;
  }

  else
  {
    uint64_t v8 = 0LL;
    *(_DWORD *)(a1 + 80) = sub_10003A9F4(&v34);
    LODWORD(v7) = v34;
  }

uint64_t sub_1000267BC(uint64_t a1, uint64_t a2)
{
  CFURLRef bundleURL = 0LL;
  uint64_t v3 = sub_10000A1C8(a2, &bundleURL);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(const char **)(a1 + 16);
    int v6 = *__error();
    uint64_t v7 = *(os_log_s **)(a1 + 32);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      CFBundleRef v10 = 0LL;
      *__error() = v6;
      goto LABEL_10;
    }

    uint64_t v8 = "[anonymous]";
    if (v5) {
      uint64_t v8 = v5;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v17 = v8;
    __int16 v18 = 1024;
    int v19 = v4;
    uint64_t v9 = "%{public}s: _CFURLCreateFromFileDescriptor: %{darwin.errno}d";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    goto LABEL_7;
  }

  CFBundleRef v11 = CFBundleCreate(kCFAllocatorDefault, bundleURL);
  if (!v11)
  {
    uint64_t v13 = *(const char **)(a1 + 16);
    int v6 = *__error();
    uint64_t v7 = *(os_log_s **)(a1 + 32);
    uint64_t v4 = 22LL;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v14 = "[anonymous]";
    if (v13) {
      uint64_t v14 = v13;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v17 = v14;
    __int16 v18 = 1024;
    int v19 = 22;
    uint64_t v9 = "%{public}s: failed to create bundle from resource: %{darwin.errno}d";
    goto LABEL_6;
  }

  CFBundleRef v10 = v11;
  uint64_t v4 = 0LL;
LABEL_10:
  if (bundleURL) {
    CFRelease(bundleURL);
  }
  if (v10) {
    CFRelease(v10);
  }
  return v4;
}

void sub_100026950(void *a1)
{
  id v1 = a1;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v1);
  uint64_t v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  string = xpc_dictionary_get_string(v1, "MOUNT_SUB_REQ");
  uint64_t v5 = string;
  if (!string) {
    goto LABEL_4;
  }
  if (strcmp(string, "REQ:MOUNT"))
  {
    if (strcmp(v5, "REQ:UNMOUNT"))
    {
LABEL_4:
      *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044CA8;
      pid_t pid = xpc_connection_get_pid(v3);
      proc_name(pid, buffer, 0x20u);
      id v7 = sub_100028DEC();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      if (v8)
      {
        id v9 = sub_100028DEC();
        CFBundleRef v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          uint64_t v11 = 3LL;
        }
        else {
          uint64_t v11 = 2LL;
        }
        if (v3) {
          pid_t v12 = xpc_connection_get_pid(v3);
        }
        else {
          pid_t v12 = -1;
        }
        LODWORD(v253[0]) = 136316162;
        *(void *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v12;
        WORD1(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 4) = v5;
        WORD6(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 14) = "MOUNT_SUB_REQ";
        WORD3(v253[2]) = 1024;
        DWORD2(v253[2]) = 22;
        uint64_t v37 = v11;
      }

      else
      {
        id v24 = &_os_log_default;
        if (v3) {
          pid_t v25 = xpc_connection_get_pid(v3);
        }
        else {
          pid_t v25 = -1;
        }
        LODWORD(v253[0]) = 136316162;
        *(void *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v25;
        WORD1(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 4) = v5;
        WORD6(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 14) = "MOUNT_SUB_REQ";
        WORD3(v253[2]) = 1024;
        DWORD2(v253[2]) = 22;
        CFBundleRef v10 = (os_log_s *)&_os_log_default;
        uint64_t v37 = 2LL;
      }

      int v43 = (char *)_os_log_send_and_compose_impl(v37, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);

      int v44 = sub_10000A444( "mount_sub_handle_request",  "sub_mount.m",  414,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v43);
      free(v43);
      sub_100028E2C(v1, v44, 0LL, 0LL, 0LL);
      goto LABEL_267;
    }

    id v26 = v1;
    xpc_connection_t v27 = xpc_dictionary_get_remote_connection(v26);
    int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    LOBYTE(v247) = 0;
    int v248 = -1;
    unsigned int v29 = sub_100029060(v28, (uint64_t)"com.apple.private.security.cryptex.unmount");
    if (v29)
    {
      v253[0] = *(_OWORD *)"unknown";
      v253[1] = unk_100044CA8;
      pid_t v30 = xpc_connection_get_pid((xpc_connection_t)v28);
      proc_name(v30, v253, 0x20u);
      id v31 = sub_100028DEC();
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      if (v32)
      {
        id v33 = sub_100028DEC();
        int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          uint64_t v35 = 3LL;
        }
        else {
          uint64_t v35 = 2LL;
        }
        if (v28) {
          pid_t v36 = xpc_connection_get_pid((xpc_connection_t)v28);
        }
        else {
          pid_t v36 = -1;
        }
        *(_DWORD *)__int128 buffer = 136315650;
        *(void *)&buffer[4] = v253;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v36;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v29;
        uint64_t v66 = v35;
      }

      else
      {
        id v57 = &_os_log_default;
        if (v28) {
          pid_t v58 = xpc_connection_get_pid((xpc_connection_t)v28);
        }
        else {
          pid_t v58 = -1;
        }
        *(_DWORD *)__int128 buffer = 136315650;
        *(void *)&buffer[4] = v253;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v58;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v29;
        int v34 = (os_log_s *)&_os_log_default;
        uint64_t v66 = 2LL;
      }

      __int128 v101 = (char *)_os_log_send_and_compose_impl(v66, 0LL, 0LL, 0LL, &_mh_execute_header, v34, 16LL);

      __int128 v102 = sub_10000A444( "mount_sub_unmount_cryptex",  "sub_mount.m",  359,  "com.apple.security.cryptex.posix",  v29,  0LL,  v101);
      __int128 v103 = v101;
      goto LABEL_90;
    }

    int v45 = xpc_dictionary_dup_fd(v26, "UNMOUNT:INFO_FD");
    int v248 = v45;
    if (v45 == -1)
    {
      *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044CA8;
      pid_t v67 = xpc_connection_get_pid((xpc_connection_t)v28);
      proc_name(v67, buffer, 0x20u);
      id v68 = sub_100028DEC();
      int v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

      if (v69)
      {
        id v70 = sub_100028DEC();
        int v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          uint64_t v72 = 3LL;
        }
        else {
          uint64_t v72 = 2LL;
        }
        if (v28) {
          pid_t v73 = xpc_connection_get_pid((xpc_connection_t)v28);
        }
        else {
          pid_t v73 = -1;
        }
        LODWORD(v253[0]) = 136315906;
        *(void *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v73;
        WORD1(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = 22;
        uint64_t v121 = v72;
      }

      else
      {
        id v116 = &_os_log_default;
        if (v28) {
          pid_t v117 = xpc_connection_get_pid((xpc_connection_t)v28);
        }
        else {
          pid_t v117 = -1;
        }
        LODWORD(v253[0]) = 136315906;
        *(void *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v117;
        WORD1(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = 22;
        int v71 = (os_log_s *)&_os_log_default;
        uint64_t v121 = 2LL;
      }

      __int128 v140 = (char *)_os_log_send_and_compose_impl(v121, 0LL, 0LL, 0LL, &_mh_execute_header, v71, 16LL);

      __int128 v102 = sub_10000A444( "mount_sub_unmount_cryptex",  "sub_mount.m",  367,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v140);
      __int128 v103 = v140;
LABEL_90:
      free(v103);
      int v45 = -1;
      if (!v102)
      {
LABEL_264:
        if (v45 == -1)
        {
LABEL_266:

          goto LABEL_267;
        }

LABEL_265:
        if (close(v45) == -1) {
          sub_100040358(buffer, v253);
        }
        goto LABEL_266;
      }

LABEL_263:
      sub_100029238(v26, v102);
      goto LABEL_264;
    }

    int v46 = sub_10003CE70(v26, "UNMOUNT:FORCE", (BOOL *)&v247);
    if (v46)
    {
      *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044CA8;
      pid_t v47 = xpc_connection_get_pid((xpc_connection_t)v28);
      proc_name(v47, buffer, 0x20u);
      id v48 = sub_100028DEC();
      int v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

      if (v49)
      {
        id v50 = sub_100028DEC();
        int v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          uint64_t v52 = 3LL;
        }
        else {
          uint64_t v52 = 2LL;
        }
        if (v28) {
          pid_t v53 = xpc_connection_get_pid((xpc_connection_t)v28);
        }
        else {
          pid_t v53 = -1;
        }
        LODWORD(v253[0]) = 136315906;
        *(void *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v53;
        WORD1(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 4) = "UNMOUNT:FORCE";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = v46;
        uint64_t v120 = v52;
      }

      else
      {
        id v113 = &_os_log_default;
        if (v28) {
          pid_t v114 = xpc_connection_get_pid((xpc_connection_t)v28);
        }
        else {
          pid_t v114 = -1;
        }
        LODWORD(v253[0]) = 136315906;
        *(void *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v114;
        WORD1(v253[1]) = 2080;
        *(void *)((char *)&v253[1] + 4) = "UNMOUNT:FORCE";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = v46;
        int v51 = (os_log_s *)&_os_log_default;
        uint64_t v120 = 2LL;
      }

      __int128 v135 = (char *)_os_log_send_and_compose_impl(v120, 0LL, 0LL, 0LL, &_mh_execute_header, v51, 16LL);

      CFErrorRef v136 = sub_10000A444( "mount_sub_unmount_cryptex",  "sub_mount.m",  375,  "com.apple.security.cryptex.posix",  v46,  0LL,  v135);
      goto LABEL_262;
    }

    unint64_t v85 = v247;
    id v241 = v26;
    xpc_connection_t v86 = xpc_dictionary_get_remote_connection(v241);
    uint64_t v87 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v86);
    uint64_t v260 = 0LL;
    __int128 v258 = 0u;
    __int128 v259 = 0u;
    __int128 v256 = 0u;
    __int128 v257 = 0u;
    __int128 v254 = 0u;
    __int128 v255 = 0u;
    memset(v253, 0, sizeof(v253));
    uint64_t v252 = 0LL;
    memset(v251, 0, sizeof(v251));
    v243 = sub_100014D14();
    int v88 = sub_10003BB8C(v45, v251);
    if (v88)
    {
      *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044CA8;
      pid_t v89 = xpc_connection_get_pid(v87);
      proc_name(v89, buffer, 0x20u);
      int v90 = *__error();
      id v91 = sub_100028DEC();
      uint64_t v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        if (v87) {
          pid_t v93 = xpc_connection_get_pid(v87);
        }
        else {
          pid_t v93 = -1;
        }
        *(_DWORD *)int buf = 136315650;
        *(void *)&uint8_t buf[4] = buffer;
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = v93;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v88;
        _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_ERROR,  "XPC client <process=%s pid=%d>: Failed to read cryptex info from disk.: %{darwin.errno}d",  buf,  0x18u);
      }

      id v124 = 0LL;
      id v147 = 0LL;
      *__error() = v90;
    }

    else
    {
      int v123 = (void *)xpc_create_from_plist(*(void *)&v251[0]);
      if (v123)
      {
        id v124 = v123;
        if (xpc_get_type(v124) == (xpc_type_t)&_xpc_type_dictionary)
        {
          int v88 = sub_10002AF2C(v124, 0LL, (uint64_t)v253, 1);
          if (v88)
          {
            id v148 = xpc_copy_description(v124);
            *(_OWORD *)int buf = *(_OWORD *)"unknown";
            *(_OWORD *)&uint8_t buf[16] = unk_100044CA8;
            pid_t v149 = xpc_connection_get_pid(v87);
            proc_name(v149, buf, 0x20u);
            int v240 = *__error();
            id v150 = sub_100028DEC();
            id v151 = (os_log_s *)objc_claimAutoreleasedReturnValue(v150);
            if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
            {
              if (v87) {
                pid_t v152 = xpc_connection_get_pid(v87);
              }
              else {
                pid_t v152 = -1;
              }
              *(_DWORD *)__int128 buffer = 136315906;
              *(void *)&buffer[4] = buf;
              *(_WORD *)&buffer[12] = 1024;
              *(_DWORD *)&buffer[14] = v152;
              *(_WORD *)&buffer[18] = 2080;
              *(void *)&buffer[20] = v148;
              *(_WORD *)&buffer[28] = 1024;
              *(_DWORD *)&buffer[30] = v88;
              _os_log_impl( (void *)&_mh_execute_header,  v151,  OS_LOG_TYPE_ERROR,  "XPC client <process=%s pid=%d>: Info.plist invalid contents: %s: %{darwin.errno}d",  buffer,  0x22u);
            }

            *__error() = v240;
            free(v148);
          }

          else
          {
            sub_1000293A0((uint64_t)buffer, v253);
            sub_10001669C(v243, (void *)v85, (uint64_t)buffer, v241, sub_100029428);
            int v88 = 0;
          }

          id v147 = v124;
          goto LABEL_248;
        }

        __int128 v125 = xpc_copy_description(v124);
        *(_OWORD *)int buf = *(_OWORD *)"unknown";
        *(_OWORD *)&uint8_t buf[16] = unk_100044CA8;
        pid_t v126 = xpc_connection_get_pid(v87);
        proc_name(v126, buf, 0x20u);
        int v127 = *__error();
        id v128 = sub_100028DEC();
        __int128 v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          if (v87) {
            pid_t v130 = xpc_connection_get_pid(v87);
          }
          else {
            pid_t v130 = -1;
          }
          *(_DWORD *)__int128 buffer = 136315906;
          *(void *)&buffer[4] = buf;
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = v130;
          *(_WORD *)&buffer[18] = 2080;
          *(void *)&buffer[20] = v125;
          *(_WORD *)&buffer[28] = 1024;
          *(_DWORD *)&buffer[30] = 212;
          _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_ERROR,  "XPC client <process=%s pid=%d>: Info.plist invalid root type: %s: %{darwin.errno}d",  buffer,  0x22u);
        }

        *__error() = v127;
        free(v125);
        id v147 = 0LL;
      }

      else
      {
        *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
        *(_OWORD *)&buffer[16] = unk_100044CA8;
        pid_t v142 = xpc_connection_get_pid(v87);
        proc_name(v142, buffer, 0x20u);
        int v143 = *__error();
        id v144 = sub_100028DEC();
        uint64_t v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
        if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
        {
          if (v87) {
            pid_t v146 = xpc_connection_get_pid(v87);
          }
          else {
            pid_t v146 = -1;
          }
          *(_DWORD *)int buf = 136315650;
          *(void *)&uint8_t buf[4] = buffer;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v146;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = 212;
          _os_log_impl( (void *)&_mh_execute_header,  v145,  OS_LOG_TYPE_ERROR,  "XPC client <process=%s pid=%d>: Failed to parse cryptex info: %{darwin.errno}d",  buf,  0x18u);
        }

        id v124 = 0LL;
        id v147 = 0LL;
        *__error() = v143;
      }

      int v88 = 212;
    }

LABEL_248:
    sub_10003C5AC(v251);
    sub_100029454((id *)v253);

    if (!v88) {
      goto LABEL_265;
    }
    v253[0] = *(_OWORD *)"unknown";
    v253[1] = unk_100044CA8;
    pid_t v210 = xpc_connection_get_pid((xpc_connection_t)v28);
    proc_name(v210, v253, 0x20u);
    id v211 = sub_100028DEC();
    int v212 = (void *)objc_claimAutoreleasedReturnValue(v211);

    if (v212)
    {
      id v213 = sub_100028DEC();
      v214 = (os_log_s *)objc_claimAutoreleasedReturnValue(v213);
      if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR)) {
        uint64_t v215 = 3LL;
      }
      else {
        uint64_t v215 = 2LL;
      }
      if (v28) {
        pid_t v216 = xpc_connection_get_pid((xpc_connection_t)v28);
      }
      else {
        pid_t v216 = -1;
      }
      *(_DWORD *)__int128 buffer = 136315650;
      *(void *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v216;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v88;
      uint64_t v219 = v215;
    }

    else
    {
      id v217 = &_os_log_default;
      if (v28) {
        pid_t v218 = xpc_connection_get_pid((xpc_connection_t)v28);
      }
      else {
        pid_t v218 = -1;
      }
      *(_DWORD *)__int128 buffer = 136315650;
      *(void *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v218;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v88;
      v214 = (os_log_s *)&_os_log_default;
      uint64_t v219 = 2LL;
    }

    __int128 v135 = (char *)_os_log_send_and_compose_impl(v219, 0LL, 0LL, 0LL, &_mh_execute_header, v214, 16LL);

    CFErrorRef v136 = sub_10000A444( "mount_sub_unmount_cryptex",  "sub_mount.m",  383,  "com.apple.security.cryptex.posix",  v88,  0LL,  v135);
LABEL_262:
    __int128 v102 = v136;
    free(v135);
    if (!v102) {
      goto LABEL_264;
    }
    goto LABEL_263;
  }

  id v13 = v1;
  *(_DWORD *)int buf = -1;
  int v247 = -1;
  int v248 = -1;
  int v245 = -1;
  int v246 = -1;
  xpc_connection_t v14 = xpc_dictionary_get_remote_connection(v13);
  int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unsigned int v16 = sub_100029060(v15, (uint64_t)"com.apple.private.security.cryptex.mount");
  if (v16)
  {
    v253[0] = *(_OWORD *)"unknown";
    v253[1] = unk_100044CA8;
    pid_t v17 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v17, v253, 0x20u);
    id v18 = sub_100028DEC();
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19)
    {
      id v20 = sub_100028DEC();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        uint64_t v22 = 3LL;
      }
      else {
        uint64_t v22 = 2LL;
      }
      if (v15) {
        pid_t v23 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v23 = -1;
      }
      *(_DWORD *)__int128 buffer = 136315650;
      *(void *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v23;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v16;
      uint64_t v56 = v22;
    }

    else
    {
      id v54 = &_os_log_default;
      if (v15) {
        pid_t v55 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v55 = -1;
      }
      *(_DWORD *)__int128 buffer = 136315650;
      *(void *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v55;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v16;
      int v21 = (os_log_s *)&_os_log_default;
      uint64_t v56 = 2LL;
    }

    id v81 = (char *)_os_log_send_and_compose_impl(v56, 0LL, 0LL, 0LL, &_mh_execute_header, v21, 16LL);

    CFErrorRef v82 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  182,  "com.apple.security.cryptex.posix",  v16,  0LL,  v81);
LABEL_76:
    unsigned int v83 = v82;
    int v84 = v81;
    goto LABEL_156;
  }

  *(_DWORD *)int buf = xpc_dictionary_dup_fd(v13, "MOUNT:DMG_FD");
  if ((*(_DWORD *)buf & 0x80000000) != 0)
  {
    *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044CA8;
    pid_t v59 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v59, buffer, 0x20u);
    id v60 = sub_100028DEC();
    int v61 = (void *)objc_claimAutoreleasedReturnValue(v60);

    if (v61)
    {
      id v62 = sub_100028DEC();
      int v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        uint64_t v64 = 3LL;
      }
      else {
        uint64_t v64 = 2LL;
      }
      if (v15) {
        pid_t v65 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v65 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v65;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:DMG_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      uint64_t v115 = v64;
    }

    else
    {
      id v104 = &_os_log_default;
      if (v15) {
        pid_t v105 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v105 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v105;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:DMG_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      int v63 = (os_log_s *)&_os_log_default;
      uint64_t v115 = 2LL;
    }

    __int128 v133 = (char *)_os_log_send_and_compose_impl(v115, 0LL, 0LL, 0LL, &_mh_execute_header, v63, 16LL);

    CFErrorRef v134 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  190,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v133);
    goto LABEL_155;
  }

  int v248 = xpc_dictionary_dup_fd(v13, "MOUNT:LTRS_FD");
  if (v248 < 0)
  {
    *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044CA8;
    pid_t v74 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v74, buffer, 0x20u);
    id v75 = sub_100028DEC();
    int v76 = (void *)objc_claimAutoreleasedReturnValue(v75);

    if (v76)
    {
      id v77 = sub_100028DEC();
      uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        uint64_t v79 = 3LL;
      }
      else {
        uint64_t v79 = 2LL;
      }
      if (v15) {
        pid_t v80 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v80 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v80;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:LTRS_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      uint64_t v122 = v79;
    }

    else
    {
      id v118 = &_os_log_default;
      if (v15) {
        pid_t v119 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v119 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v119;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:LTRS_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      uint64_t v78 = (os_log_s *)&_os_log_default;
      uint64_t v122 = 2LL;
    }

    __int128 v133 = (char *)_os_log_send_and_compose_impl(v122, 0LL, 0LL, 0LL, &_mh_execute_header, v78, 16LL);

    CFErrorRef v134 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  198,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v133);
    goto LABEL_155;
  }

  int v247 = xpc_dictionary_dup_fd(v13, "MOUNT:INFO_FD");
  if (v247 < 0)
  {
    *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044CA8;
    pid_t v94 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v94, buffer, 0x20u);
    id v95 = sub_100028DEC();
    v96 = (void *)objc_claimAutoreleasedReturnValue(v95);

    if (v96)
    {
      id v97 = sub_100028DEC();
      xpc_object_t v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        uint64_t v99 = 3LL;
      }
      else {
        uint64_t v99 = 2LL;
      }
      if (v15) {
        pid_t v100 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v100 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v100;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      uint64_t v137 = v99;
    }

    else
    {
      id v131 = &_os_log_default;
      if (v15) {
        pid_t v132 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v132 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v132;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      xpc_object_t v98 = (os_log_s *)&_os_log_default;
      uint64_t v137 = 2LL;
    }

    __int128 v133 = (char *)_os_log_send_and_compose_impl(v137, 0LL, 0LL, 0LL, &_mh_execute_header, v98, 16LL);

    CFErrorRef v134 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  206,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v133);
    goto LABEL_155;
  }

  int v246 = xpc_dictionary_dup_fd(v13, "MOUNT:IM4M_FD");
  if (v246 < 0)
  {
    *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044CA8;
    pid_t v106 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v106, buffer, 0x20u);
    id v107 = sub_100028DEC();
    __int128 v108 = (void *)objc_claimAutoreleasedReturnValue(v107);

    if (v108)
    {
      id v109 = sub_100028DEC();
      __int128 v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        uint64_t v111 = 3LL;
      }
      else {
        uint64_t v111 = 2LL;
      }
      if (v15) {
        pid_t v112 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v112 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v112;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:IM4M_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      uint64_t v141 = v111;
    }

    else
    {
      id v138 = &_os_log_default;
      if (v15) {
        pid_t v139 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v139 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v139;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:IM4M_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      __int128 v110 = (os_log_s *)&_os_log_default;
      uint64_t v141 = 2LL;
    }

    __int128 v133 = (char *)_os_log_send_and_compose_impl(v141, 0LL, 0LL, 0LL, &_mh_execute_header, v110, 16LL);

    CFErrorRef v134 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  214,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v133);
LABEL_155:
    unsigned int v83 = v134;
    int v84 = v133;
LABEL_156:
    free(v84);
    id v153 = 0LL;
    if (!v83) {
      goto LABEL_158;
    }
    goto LABEL_157;
  }

  int v245 = xpc_dictionary_dup_fd(v13, "MOUNT:VOLHASH_FD");
  if (v245 < 0)
  {
    v253[0] = *(_OWORD *)"unknown";
    v253[1] = unk_100044CA8;
    pid_t v38 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v38, v253, 0x20u);
    int v39 = *__error();
    id v40 = sub_100028DEC();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      if (v15) {
        pid_t v42 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v42 = -1;
      }
      *(_DWORD *)__int128 buffer = 136315650;
      *(void *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v42;
      *(_WORD *)&buffer[18] = 2080;
      *(void *)&buffer[20] = "MOUNT:VOLHASH_FD";
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "XPC client <process=%s pid=%d>: No value for optional key %s",  buffer,  0x1Cu);
    }

    *__error() = v39;
  }

  xpc_object_t value = xpc_dictionary_get_value(v13, "MOUNT:CX1_PROPERTIES");
  id v153 = (id)objc_claimAutoreleasedReturnValue(value);
  if (!v153)
  {
    *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044CA8;
    pid_t v167 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v167, buffer, 0x20u);
    id v168 = sub_100028DEC();
    id v169 = (void *)objc_claimAutoreleasedReturnValue(v168);

    if (v169)
    {
      id v170 = sub_100028DEC();
      v171 = (os_log_s *)objc_claimAutoreleasedReturnValue(v170);
      if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR)) {
        uint64_t v172 = 3LL;
      }
      else {
        uint64_t v172 = 2LL;
      }
      if (v15) {
        pid_t v173 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v173 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v173;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:CX1_PROPERTIES";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      uint64_t v200 = v172;
    }

    else
    {
      id v184 = &_os_log_default;
      if (v15) {
        pid_t v185 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v185 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v185;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:CX1_PROPERTIES";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v171 = (os_log_s *)&_os_log_default;
      uint64_t v200 = 2LL;
    }

    id v81 = (char *)_os_log_send_and_compose_impl(v200, 0LL, 0LL, 0LL, &_mh_execute_header, v171, 16LL);

    CFErrorRef v82 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  228,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v81);
    goto LABEL_76;
  }

  int64_t int64 = xpc_dictionary_get_int64(v13, "MOUNT:DMG_ASSET_IDX_INT64");
  int64_t v156 = int64;
  if (int64 != 5 && int64 != 9)
  {
    *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044CA8;
    pid_t v174 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v174, buffer, 0x20u);
    id v175 = sub_100028DEC();
    v176 = (void *)objc_claimAutoreleasedReturnValue(v175);

    if (v176)
    {
      id v177 = sub_100028DEC();
      id v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
      if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR)) {
        uint64_t v179 = 3LL;
      }
      else {
        uint64_t v179 = 2LL;
      }
      if (v15) {
        pid_t v180 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v180 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v180;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:DMG_ASSET_IDX_INT64";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      uint64_t v204 = v179;
    }

    else
    {
      id v201 = &_os_log_default;
      if (v15) {
        pid_t v202 = xpc_connection_get_pid((xpc_connection_t)v15);
      }
      else {
        pid_t v202 = -1;
      }
      LODWORD(v253[0]) = 136315906;
      *(void *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v202;
      WORD1(v253[1]) = 2080;
      *(void *)((char *)&v253[1] + 4) = "MOUNT:DMG_ASSET_IDX_INT64";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      id v178 = (os_log_s *)&_os_log_default;
      uint64_t v204 = 2LL;
    }

    id v209 = (char *)_os_log_send_and_compose_impl(v204, 0LL, 0LL, 0LL, &_mh_execute_header, v178, 16LL);

    unsigned int v83 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  240,  "com.apple.security.cryptex.posix",  22LL,  0LL,  v209);
    v208 = v209;
    goto LABEL_235;
  }

  id v157 = v13;
  id v158 = v153;
  v244 = sub_100014D14();
  memset(v253, 0, 32);
  xpc_dictionary_get_audit_token(v157, v253);
  *(_OWORD *)__int128 buffer = v253[0];
  *(_OWORD *)&buffer[16] = v253[1];
  uid_t v242 = audit_token_to_euid((audit_token_t *)buffer);
  id v153 = v158;
  uint64_t v159 = cryptex_core_create(0LL);
  v160 = (void *)v159;
  if (!v159)
  {
    int v181 = *__error();
    id v182 = sub_100028DEC();
    v183 = (os_log_s *)objc_claimAutoreleasedReturnValue(v182);
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      *(void *)__int128 buffer = 0xC04000100LL;
      _os_log_impl( (void *)&_mh_execute_header,  v183,  OS_LOG_TYPE_ERROR,  "Failed to create cryptex core.: %{darwin.errno}d",  buffer,  8u);
    }

    id v166 = 0LL;
    *__error() = v181;
    int v161 = 12;
    goto LABEL_200;
  }

  int v161 = cryptex_core_set_assets_from_fds(v159, v156, buf, &v248, &v247, &v246, &v245);
  if (v161)
  {
    int v162 = *__error();
    id v163 = sub_100028DEC();
    __int16 v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buffer = 67109120;
      *(_DWORD *)&buffer[4] = v161;
      _os_log_impl( (void *)&_mh_execute_header,  v164,  OS_LOG_TYPE_ERROR,  "Failed to set cryptex core assets.: %{darwin.errno}d",  buffer,  8u);
    }

    unsigned int v165 = __error();
    id v166 = 0LL;
  }

  else
  {
    int64_t v186 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary(v153);
    if (v186)
    {
      cryptex_core_set_cryptex1_properties(v160);
      id v166 = v160;

      int v161 = 0;
      goto LABEL_200;
    }

    int v162 = *__error();
    id v205 = sub_100028DEC();
    uint64_t v206 = (os_log_s *)objc_claimAutoreleasedReturnValue(v205);
    if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
    {
      *(void *)__int128 buffer = 67109120LL;
      _os_log_impl( (void *)&_mh_execute_header,  v206,  OS_LOG_TYPE_ERROR,  "Failed to parse Cryptex1 properties.: %{darwin.errno}d",  buffer,  8u);
    }

    unsigned int v165 = __error();
    id v166 = 0LL;
    int v161 = 0;
  }

  int *v165 = v162;
LABEL_200:

  uint64_t v187 = v166;
  if (v161)
  {
    int v188 = *__error();
    id v189 = sub_100028DEC();
    id v190 = (os_log_s *)objc_claimAutoreleasedReturnValue(v189);
    if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buffer = 67109120;
      *(_DWORD *)&buffer[4] = v161;
      _os_log_impl( (void *)&_mh_execute_header,  v190,  OS_LOG_TYPE_ERROR,  "Failed to initialize cryptex core.: %{darwin.errno}d",  buffer,  8u);
    }

    *__error() = v188;
  }

  else
  {
    sub_100016418(v244, v187, v242, v157, sub_1000291A0);
  }

  if (!v161) {
    goto LABEL_158;
  }
  v253[0] = *(_OWORD *)"unknown";
  v253[1] = unk_100044CA8;
  pid_t v191 = xpc_connection_get_pid((xpc_connection_t)v15);
  proc_name(v191, v253, 0x20u);
  id v192 = sub_100028DEC();
  uint64_t v193 = (void *)objc_claimAutoreleasedReturnValue(v192);

  if (v193)
  {
    id v194 = sub_100028DEC();
    v195 = (os_log_s *)objc_claimAutoreleasedReturnValue(v194);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR)) {
      uint64_t v196 = 3LL;
    }
    else {
      uint64_t v196 = 2LL;
    }
    if (v15) {
      pid_t v197 = xpc_connection_get_pid((xpc_connection_t)v15);
    }
    else {
      pid_t v197 = -1;
    }
    *(_DWORD *)__int128 buffer = 136315650;
    *(void *)&buffer[4] = v253;
    *(_WORD *)&buffer[12] = 1024;
    *(_DWORD *)&buffer[14] = v197;
    *(_WORD *)&buffer[18] = 1024;
    *(_DWORD *)&buffer[20] = v161;
    uint64_t v203 = v196;
  }

  else
  {
    id v198 = &_os_log_default;
    if (v15) {
      pid_t v199 = xpc_connection_get_pid((xpc_connection_t)v15);
    }
    else {
      pid_t v199 = -1;
    }
    *(_DWORD *)__int128 buffer = 136315650;
    *(void *)&buffer[4] = v253;
    *(_WORD *)&buffer[12] = 1024;
    *(_DWORD *)&buffer[14] = v199;
    *(_WORD *)&buffer[18] = 1024;
    *(_DWORD *)&buffer[20] = v161;
    v195 = (os_log_s *)&_os_log_default;
    uint64_t v203 = 2LL;
  }

  v207 = (char *)_os_log_send_and_compose_impl(v203, 0LL, 0LL, 0LL, &_mh_execute_header, v195, 16LL);

  unsigned int v83 = sub_10000A444( "mount_sub_mount_cryptex",  "sub_mount.m",  249,  "com.apple.security.cryptex.posix",  v161,  0LL,  v207);
  v208 = v207;
LABEL_235:
  free(v208);
  if (v83) {
LABEL_157:
  }
    sub_100028E2C(v13, v83, 0LL, 0LL, 0LL);
LABEL_158:

  if (v245 != -1 && close(v245) == -1)
  {
    *(void *)__int128 buffer = 0LL;
    __int128 v254 = 0u;
    __int128 v255 = 0u;
    memset(v253, 0, sizeof(v253));
    BOOL v220 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v221 = *__error();
    if (v220) {
      uint64_t v222 = 3LL;
    }
    else {
      uint64_t v222 = 2LL;
    }
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v221;
    uint64_t v223 = _os_log_send_and_compose_impl(v222, buffer, v253, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v224 = _os_crash_msg(*(void *)buffer, v223);
    sub_10003E7FC(v224);
  }

  if (v246 != -1 && close(v246) == -1)
  {
    *(void *)__int128 buffer = 0LL;
    __int128 v254 = 0u;
    __int128 v255 = 0u;
    memset(v253, 0, sizeof(v253));
    BOOL v225 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v226 = *__error();
    if (v225) {
      uint64_t v227 = 3LL;
    }
    else {
      uint64_t v227 = 2LL;
    }
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v226;
    uint64_t v228 = _os_log_send_and_compose_impl(v227, buffer, v253, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v229 = _os_crash_msg(*(void *)buffer, v228);
    sub_10003E7FC(v229);
  }

  if (v247 != -1 && close(v247) == -1)
  {
    *(void *)__int128 buffer = 0LL;
    __int128 v254 = 0u;
    __int128 v255 = 0u;
    memset(v253, 0, sizeof(v253));
    BOOL v230 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v231 = *__error();
    if (v230) {
      uint64_t v232 = 3LL;
    }
    else {
      uint64_t v232 = 2LL;
    }
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v231;
    uint64_t v233 = _os_log_send_and_compose_impl(v232, buffer, v253, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v234 = _os_crash_msg(*(void *)buffer, v233);
    sub_10003E7FC(v234);
  }

  if (v248 != -1 && close(v248) == -1)
  {
    *(void *)__int128 buffer = 0LL;
    __int128 v254 = 0u;
    __int128 v255 = 0u;
    memset(v253, 0, sizeof(v253));
    BOOL v235 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v236 = *__error();
    if (v235) {
      uint64_t v237 = 3LL;
    }
    else {
      uint64_t v237 = 2LL;
    }
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v236;
    uint64_t v238 = _os_log_send_and_compose_impl(v237, buffer, v253, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    uint64_t v239 = _os_crash_msg(*(void *)buffer, v238);
    sub_10003E7FC(v239);
  }

LABEL_267:
}

void sub_100028BD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, __int16 a14, char a15, char a16, __int16 a17, char a18, char a19, __int16 a20, unsigned int a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, char a42)
{
}

id sub_100028DEC()
{
  if (qword_10005A888 != -1) {
    dispatch_once(&qword_10005A888, &stru_100056FF8);
  }
  return (id)qword_10005A890;
}

void sub_100028E2C(void *a1, __CFError *a2, const char *a3, const char *a4, const char *a5)
{
  id v9 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v9);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v9);
  pid_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  if (a3) {
    xpc_dictionary_set_string(reply, "MOUNT:NAME_STR", a3);
  }
  if (a4) {
    xpc_dictionary_set_string(reply, "MOUNT:VERSION_STR", a4);
  }
  if (a5) {
    xpc_dictionary_set_string(reply, "MOUNT:MOUNTPATH_STR", a5);
  }
  if (a2)
  {
    xpc_object_t v13 = sub_10003D660(a2);
    xpc_dictionary_set_value(reply, "MOUNT:ERROR_DICT", v13);
  }

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = unk_100044CA8;
  pid_t pid = xpc_connection_get_pid(v12);
  proc_name(pid, buffer, 0x20u);
  int v15 = *__error();
  id v16 = sub_100028DEC();
  pid_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    if (v12) {
      pid_t v18 = xpc_connection_get_pid(v12);
    }
    else {
      pid_t v18 = -1;
    }
    int v19 = 136315650;
    id v20 = buffer;
    __int16 v21 = 1024;
    pid_t v22 = v18;
    __int16 v23 = 2114;
    xpc_object_t v24 = reply;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "XPC client <process=%s pid=%d>: Replying to mount client: %{public}@",  (uint8_t *)&v19,  0x1Cu);
  }

  *__error() = v15;
  xpc_dictionary_send_reply(reply);
}

uint64_t sub_100028FF8(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result != -1)
  {
    uint64_t result = close(result);
    if ((_DWORD)result == -1) {
      sub_1000403FC(&v2, v3);
    }
  }

  return result;
}

uint64_t sub_100029060(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (sub_1000294D4((uint64_t)v3, a2))
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = unk_100044CA8;
    pid_t pid = xpc_connection_get_pid(v3);
    proc_name(pid, buffer, 0x20u);
    int v6 = *__error();
    id v7 = sub_100028DEC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v3) {
        pid_t v9 = xpc_connection_get_pid(v3);
      }
      else {
        pid_t v9 = -1;
      }
      int v11 = 136315906;
      pid_t v12 = buffer;
      __int16 v13 = 1024;
      pid_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = a2;
      __int16 v17 = 1024;
      int v18 = 144;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "XPC client <process=%s pid=%d>: Client lacks entitlement '%s': %{darwin.errno}d",  (uint8_t *)&v11,  0x22u);
    }

    *__error() = v6;
    uint64_t v4 = 144LL;
  }

  return v4;
}

void sub_1000291A0(void *a1, void *a2, __CFError *a3, void *a4)
{
  id v13 = a1;
  id v7 = a2;
  uint64_t v8 = v7;
  if (!v7)
  {
    CFBundleRef v10 = 0LL;
    goto LABEL_5;
  }

  uint64_t v9 = sub_100030D60((uint64_t)v7);
  CFBundleRef v10 = (const char *)sub_100030D30((uint64_t)v8);
  if (!v9)
  {
LABEL_5:
    int v11 = 0LL;
    pid_t v12 = 0LL;
    goto LABEL_6;
  }

  int v11 = *(const char **)v9;
  pid_t v12 = **(const char ***)(v9 + 16);
LABEL_6:
  sub_100028E2C(a4, a3, v11, v12, v10);
}

void sub_100029238(void *a1, __CFError *a2)
{
  id v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v3);
  int v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  if (a2)
  {
    xpc_object_t v7 = sub_10003D660(a2);
    xpc_dictionary_set_value(reply, "UNMOUNT:ERROR_DICT", v7);
  }

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = unk_100044CA8;
  pid_t pid = xpc_connection_get_pid(v6);
  proc_name(pid, buffer, 0x20u);
  int v9 = *__error();
  id v10 = sub_100028DEC();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      pid_t v12 = xpc_connection_get_pid(v6);
    }
    else {
      pid_t v12 = -1;
    }
    int v13 = 136315650;
    pid_t v14 = buffer;
    __int16 v15 = 1024;
    pid_t v16 = v12;
    __int16 v17 = 2114;
    xpc_object_t v18 = reply;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "XPC client <process=%s pid=%d>: Replying to unmount client: %{public}@",  (uint8_t *)&v13,  0x1Cu);
  }

  *__error() = v9;
  xpc_dictionary_send_reply(reply);
}

id sub_1000293A0(uint64_t a1, __int128 *a2)
{
  __int128 v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((id *)a2 + 3);
  __int128 v5 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = v5;
  __int128 v7 = a2[5];
  __int128 v6 = a2[6];
  __int128 v8 = a2[4];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 64) = v8;
  *(void *)(a1 + 120) = *((id *)a2 + 15);
  *(void *)(a1 + 12_Block_object_dispose(va, 8) = *((id *)a2 + 16);
  id result = *((id *)a2 + 17);
  *(void *)(a1 + 136) = result;
  *(_WORD *)(a1 + 144) = *((_WORD *)a2 + 72);
  return result;
}

void sub_100029428(uint64_t a1, uint64_t a2, __CFError *a3, void *a4)
{
}

void sub_100029454(id *a1)
{
}

void sub_10002948C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.libcryptex", "mount_sub");
  uint64_t v2 = (void *)qword_10005A890;
  qword_10005A890 = (uint64_t)v1;
}

uint64_t sub_1000294BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _os_log_send_and_compose_impl(v8, v6, v7, 80LL, a5, a6, 16LL);
}

BOOL sub_1000294D4(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)xpc_connection_copy_entitlement_value();
  if (!v3) {
    return 0LL;
  }
  __int128 v4 = v3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_BOOL)
  {
    int v5 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Entitlement is not a BOOLean: %s",  (uint8_t *)&v8,  0xCu);
    }

    *__error() = v5;
  }

  BOOL value = xpc_BOOL_get_value(v4);

  return value;
}

void sub_1000295C4(_Unwind_Exception *exception_object)
{
}

void sub_1000295EC(uint64_t a1)
{
  uint64_t v2 = sub_100008BC0();
  object = 0LL;
  uint64_t v121 = 0LL;
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v92 = 0u;
  __int128 v91 = 0u;
  __int128 v90 = 0u;
  __int128 v89 = 0u;
  __int128 v88 = 0u;
  __int128 v87 = 0u;
  __int128 v86 = 0u;
  __int128 v85 = 0u;
  __int128 v84 = 0u;
  __int128 v83 = 0u;
  __int128 v82 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v77 = 0u;
  uint64_t v76 = 32LL;
  int v3 = xpc_pipe_receive(a1, &object, 0LL);
  __int128 v4 = (const char *)*((void *)v2 + 2);
  int v5 = *__error();
  uint64_t v6 = (os_log_s *)*((void *)v2 + 4);
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v10 = "[anonymous]";
      if (v4) {
        id v10 = v4;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v70 = 2112;
      int v71 = object;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: msg recv: %@", buf, 0x16u);
    }

    *__error() = v5;
    CFErrorRef v11 = sub_1000392C4((uint64_t)&v99, object, *((os_log_s **)v2 + 4));
    CFErrorRef v8 = v11;
    if (v11)
    {
      int v12 = sub_10000A5D8((CFIndex)v11);
      if (v12)
      {
        int v3 = v12;
        int v13 = (const char *)*((void *)v2 + 2);
        int v5 = *__error();
        pid_t v14 = (os_log_s *)*((void *)v2 + 4);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          goto LABEL_7;
        }
        __int16 v15 = "[anonymous]";
        if (v13) {
          __int16 v15 = v13;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&uint8_t buf[4] = v15;
        __int16 v70 = 1024;
        LODWORD(v71) = v3;
        pid_t v16 = "%{public}s: init msg failed: %{darwin.errno}d";
        __int16 v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_FAULT;
        uint32_t v19 = 18;
        goto LABEL_19;
      }
    }

    sub_100029E8C((uint64_t)&v99, (uint64_t)"received ipc");
    if ((unint64_t)v100 >= 4)
    {
      id v20 = (const char *)*((void *)v2 + 2);
      int v21 = *__error();
      pid_t v22 = (os_log_s *)*((void *)v2 + 4);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        __int16 v23 = "[anonymous]";
        if (v20) {
          __int16 v23 = v20;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&uint8_t buf[4] = v23;
        __int16 v70 = 2048;
        int v71 = (void *)v100;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "%{public}s: bad subsystem id: %llu",  buf,  0x16u);
      }

      int v3 = 72;
      goto LABEL_56;
    }

    sub_100039EA0(&v76, (uint64_t)&v99);
    xpc_object_t v24 = _NSGetMachExecuteHeader();
    *(void *)int buf = 0LL;
    pid_t v25 = getsectdatafromheader_64(v24, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
    id v26 = &v25[_dyld_get_image_slide(v24)];
    xpc_connection_t v27 = _NSGetMachExecuteHeader();
    *(void *)int buf = 0LL;
    int v28 = getsectdatafromheader_64(v27, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
    uint64_t image_slide = _dyld_get_image_slide(v27);
    if (v26 >= &v28[image_slide + *(void *)buf]) {
LABEL_29:
    }
      sub_1000404A0();
    while (1)
    {
      pid_t v30 = *(void **)v26;
      if ((void)v100 == **(void **)v26) {
        break;
      }
      v26 += 8;
      id v31 = _NSGetMachExecuteHeader();
      *(void *)int buf = 0LL;
      uint64_t v32 = getsectdatafromheader_64(v31, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
      uint64_t v33 = _dyld_get_image_slide(v31);
      if (v26 >= &v32[v33 + *(void *)buf]) {
        goto LABEL_29;
      }
    }

    int v34 = (const char *)*((void *)v2 + 2);
    int v35 = *__error();
    pid_t v36 = (os_log_s *)*((void *)v2 + 4);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v37 = "[anonymous]";
      pid_t v38 = (void *)v30[2];
      if (v34) {
        uint64_t v37 = v34;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v37;
      __int16 v70 = 2080;
      int v71 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s: found subsystem: %s", buf, 0x16u);
    }

    *__error() = v35;
    if (v30[1] == (void)v101)
    {
      if (*((void *)&v100 + 1) >= v30[5])
      {
        id v50 = (const char *)*((void *)v2 + 2);
        int v21 = *__error();
        uint64_t v64 = (os_log_s *)*((void *)v2 + 4);
        int v3 = 76;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          int v51 = "[anonymous]";
          if (v50) {
            int v51 = v50;
          }
          uint64_t v52 = (void *)v30[2];
          *(_DWORD *)int buf = 136446978;
          *(void *)&uint8_t buf[4] = v51;
          __int16 v70 = 2080;
          int v71 = v52;
          __int16 v72 = 2048;
          uint64_t v73 = *((void *)&v100 + 1);
          __int16 v74 = 1024;
          int v75 = 76;
          int v49 = "%{public}s: bad routine id: subsystem = %s, rpc = %llu: %{darwin.errno}d";
          goto LABEL_54;
        }
      }

      else
      {
        uint64_t v39 = ((uint64_t (*)(__int128 *))v30[3])(&v100);
        if (!v39)
        {
          pid_t v59 = (const char *)*((void *)v2 + 2);
          int v21 = *__error();
          id v60 = (os_log_s *)*((void *)v2 + 4);
          int v3 = 71;
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
            goto LABEL_56;
          }
          int v61 = "[anonymous]";
          id v62 = (void *)v30[2];
          if (v59) {
            int v61 = v59;
          }
          *(_DWORD *)int buf = 136446722;
          *(void *)&uint8_t buf[4] = v61;
          __int16 v70 = 2080;
          int v71 = v62;
          __int16 v72 = 1024;
          LODWORD(v73) = 71;
          int v49 = "%{public}s: no target %s object found: %{darwin.errno}d";
          pid_t v53 = v60;
          uint32_t v54 = 28;
          goto LABEL_55;
        }

        int v40 = ((uint64_t (*)(uint64_t, __int128 *, uint64_t *))v30[4])(v39, &v99, &v76);
        int v3 = v40;
        if (v40 == 36 || v40 == 0)
        {
          pid_t v42 = (const char *)*((void *)v2 + 2);
          int v5 = *__error();
          uint64_t v43 = (os_log_s *)*((void *)v2 + 4);
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_7;
          }
          int v44 = "[anonymous]";
          if (v42) {
            int v44 = v42;
          }
          int v45 = (void *)v30[2];
          *(_DWORD *)int buf = 136446978;
          *(void *)&uint8_t buf[4] = v44;
          __int16 v70 = 2080;
          int v71 = v45;
          __int16 v72 = 2048;
          uint64_t v73 = *((void *)&v100 + 1);
          __int16 v74 = 1024;
          int v75 = v3;
          pid_t v16 = "%{public}s: %s demux: routine = %llu: %{darwin.errno}d";
          __int16 v17 = v43;
          os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
          uint32_t v19 = 38;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
          goto LABEL_7;
        }

        int v63 = (const char *)*((void *)v2 + 2);
        int v21 = *__error();
        uint64_t v64 = (os_log_s *)*((void *)v2 + 4);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          uint64_t v66 = "[anonymous]";
          if (v63) {
            uint64_t v66 = v63;
          }
          pid_t v67 = (void *)v30[2];
          *(_DWORD *)int buf = 136446978;
          *(void *)&uint8_t buf[4] = v66;
          __int16 v70 = 2080;
          int v71 = v67;
          __int16 v72 = 2048;
          uint64_t v73 = *((void *)&v100 + 1);
          __int16 v74 = 1024;
          int v75 = v3;
          int v49 = "%{public}s: %s demux failed: routine = %llu: %{darwin.errno}d";
LABEL_54:
          pid_t v53 = v64;
          uint32_t v54 = 38;
LABEL_55:
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, v49, buf, v54);
        }
      }
    }

    else
    {
      int v46 = (const char *)*((void *)v2 + 2);
      int v21 = *__error();
      uint64_t v64 = (os_log_s *)*((void *)v2 + 4);
      int v3 = 74;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
      {
        pid_t v47 = "[anonymous]";
        if (v46) {
          pid_t v47 = v46;
        }
        id v48 = (void *)v30[2];
        *(_DWORD *)int buf = 136446978;
        *(void *)&uint8_t buf[4] = v47;
        __int16 v70 = 2080;
        int v71 = v48;
        __int16 v72 = 2048;
        uint64_t v73 = v101;
        __int16 v74 = 1024;
        int v75 = 74;
        int v49 = "%{public}s: bad target type: subsystem = %s, type = %llu: %{darwin.errno}d";
        goto LABEL_54;
      }
    }

LABEL_57:
  if ((v76 & 0x10) != 0) {
    goto LABEL_63;
  }
  pid_t v55 = (const char *)v9[2];
  int v56 = *__error();
  id v57 = (os_log_s *)v9[4];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
  {
    pid_t v58 = "[anonymous]";
    if (v55) {
      pid_t v58 = v55;
    }
    *(_DWORD *)int buf = 136446722;
    *(void *)&uint8_t buf[4] = v58;
    __int16 v70 = 2048;
    int v71 = (void *)v100;
    __int16 v72 = 1024;
    LODWORD(v73) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_FAULT,  "%{public}s: demux failed: subsystem = %llu: %{darwin.errno}d",  buf,  0x1Cu);
  }

  *__error() = v56;
  sub_10003A0F8((uint64_t)&v99, &v76, v3);
LABEL_64:
  os_release(v9);
LABEL_65:
  sub_10003A00C(&v76);
  sub_10003A00C(&v99);
  if (object) {
    os_release(object);
  }
  os_release(v2);
  if (v8) {
    CFRelease(v8);
  }
}

  int v44 = sub_10000A444("_quire_unmount_continue", "quire.c", v42, "com.apple.security.cryptex.posix", v41, 0LL, v40);
  free(v40);
  if (v44) {
    int v45 = (v2 & 2) == 0;
  }
  else {
    int v45 = 0;
  }
  if (v45)
  {
    if ((*(_DWORD *)(v3 + 404) & 0x80000000) != 0)
    {
      pid_t v47 = 0LL;
    }

    else
    {
      int v46 = calloc(1uLL, 0x10uLL);
      if (!v46) {
        sub_1000409E8();
      }
      pid_t v47 = v46;
      v46[3] = sub_10003A9F4((_DWORD *)(v3 + 404));
      v47[2] = sub_10003A9F4(v110);
    }

    v1[6] = v47;
  }

  else if (!v44)
  {
LABEL_62:
    v1[2] = 0LL;
    cryptex_target_async_f(v3, v1, sub_100030EF4);
    return;
  }

  v1[2] = CFRetain(v44);
  cryptex_target_async_f(v3, v1, sub_100030EF4);
  CFRelease(v44);
}

void sub_100029E8C(uint64_t a1, uint64_t a2)
{
  __int128 v4 = sub_100008BC0();
  xpc_object_t v24 = 0LL;
  int v5 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  if (os_log_type_enabled(*((os_log_t *)v4 + 4), OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = (void *)os_flagset_copy_string(&unk_100059FA0, *(void *)a1);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      if (v8 == 1)
      {
      }

      else if (v8 == 2)
      {
        xpc_object_t v24 = (char *)os_mach_port_copy_description(*(unsigned int *)(a1 + 40));
      }

      else if (asprintf(&v24, "[invalid target type: %#llx]", *(void *)(a1 + 32)) < 0)
      {
        sub_1000404B8(&v25, buf);
      }
    }

    else if (asprintf(&v24, "%#llx", *(void *)(a1 + 40)) < 0)
    {
      sub_1000404B8(&v25, buf);
    }

    uint64_t v7 = xpc_copy_description(*(xpc_object_t *)(a1 + 304));
    uint64_t v9 = (const char *)*((void *)v4 + 2);
    int v10 = *__error();
    CFErrorRef v11 = (os_log_s *)*((void *)v4 + 4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = "[anonymous]";
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(a1 + 24);
      if (v9) {
        int v12 = v9;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = *(_DWORD *)(a1 + 328);
      int v17 = *(_DWORD *)(a1 + 332);
      int v18 = *(_DWORD *)(a1 + 336);
      int v19 = *(_DWORD *)(a1 + 340);
      int v20 = *(_DWORD *)(a1 + 344);
      int v21 = *(_DWORD *)(a1 + 348);
      int v22 = *(_DWORD *)(a1 + 352);
      int v23 = *(_DWORD *)(a1 + 356);
      *(_DWORD *)int buf = 136450306;
      xpc_connection_t v27 = v12;
      __int16 v28 = 2080;
      uint64_t v29 = a2;
      __int16 v30 = 2048;
      uint64_t v31 = a1;
      __int16 v32 = 2080;
      uint64_t v33 = v6;
      __int16 v34 = 2048;
      uint64_t v35 = v13;
      __int16 v36 = 2048;
      uint64_t v37 = v14;
      __int16 v38 = 2048;
      uint64_t v39 = v15;
      __int16 v40 = 2080;
      uint64_t v41 = v24;
      __int16 v42 = 2080;
      uint64_t v43 = v7;
      __int16 v44 = 1024;
      int v45 = v16;
      __int16 v46 = 1024;
      int v47 = v17;
      __int16 v48 = 1024;
      int v49 = v18;
      __int16 v50 = 1024;
      int v51 = v19;
      __int16 v52 = 1024;
      int v53 = v20;
      __int16 v54 = 1024;
      int v55 = v21;
      __int16 v56 = 1024;
      int v57 = v22;
      __int16 v58 = 1024;
      int v59 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}s: invoke = %s [%p]\n invoke.flags = %s\n invoke.target.sub = %llu\n invoke.target.routine = %llu\n invoke.target.type = %llu\n invoke.target = %s\n invoke.argv = %s\n invoke.cred.auid = %u\n invoke.cred.euid = %u\n invoke.cred.egid = %u\n invoke.cred.ruid = %u\n invoke.cred.rgid = %u\n invoke.cred.pid_t pid = %u\n invoke.cred.asid = %u\n invoke.cred.pidvers = %u\n",  buf,  0x8Cu);
    }

    *__error() = v10;
    int v5 = v24;
  }

  free(v7);
  free(v5);
  free(v6);
  os_release(v4);
}

void **sub_10002A130(void *a1, _BYTE *a2, _BYTE *a3)
{
  int v5 = sub_10003C818(a1, 0x28uLL);
  v5[3] = sub_100039F44(a2);
  void v5[4] = sub_100039F44(a3);
  return v5;
}

void sub_10002A180(uint64_t *a1, int a2)
{
  uint64_t v3 = *a1;
  sub_10003A0F8(*(void *)(*a1 + 24), *(_BYTE **)(*a1 + 32), a2);
  sub_10003A00C(*(_BYTE **)(v3 + 24));
  sub_10003A00C(*(_BYTE **)(v3 + 32));
  sub_10003C8F0((void **)v3);
  *a1 = 0LL;
}

void sub_10002A1C8(uint64_t *a1, __CFError *a2)
{
  uint64_t v3 = *a1;
  sub_10003A2AC(*(void *)(*a1 + 24), *(void *)(*a1 + 32), a2);
  sub_10003A00C(*(_BYTE **)(v3 + 24));
  sub_10003A00C(*(_BYTE **)(v3 + 32));
  sub_10003C8F0((void **)v3);
  *a1 = 0LL;
}

uint64_t sub_10002A210(void *a1)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_string(a1, "SUBSYSTEM");
  if (result)
  {
    uint64_t v2 = (const char *)result;
    if (!strcmp((const char *)result, "CODEX"))
    {
      return 1LL;
    }

    else if (!strcmp(v2, "COLLATION"))
    {
      return 2LL;
    }

    else if (!strcmp(v2, "UPGRADE_WAIT"))
    {
      return 6LL;
    }

    else if (!strcmp(v2, "UPGRADE_LOCK"))
    {
      return 7LL;
    }

    else if (!strcmp(v2, "UPGRADE_ABORT"))
    {
      return 8LL;
    }

    else if (!strcmp(v2, "CRYPTEX"))
    {
      return 3LL;
    }

    else if (!strcmp(v2, "DAEMON"))
    {
      return 4LL;
    }

    else if (!strcmp(v2, "SESSION"))
    {
      return 5LL;
    }

    else if (!strcmp(v2, "MOUNT"))
    {
      return 9LL;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100040528((uint64_t)v2);
      }
      return 0LL;
    }
  }

  return result;
}

  ;
}

void start()
{
  uint64_t v0 = (void *)off_10005A3A0;
  v0[1] = dispatch_queue_create("com.apple.security.cryptexd.main", 0LL);
  sub_100008240();
  os_log_t v1 = sub_100008BC0();
  uint64_t v2 = _NSGetMachExecuteHeader();
  uint64_t size = 0LL;
  uint64_t v3 = getsectdatafromheader_64(v2, "__DATA_CONST", "__object_init", &size);
  __int128 v4 = (void (**)(void))&v3[_dyld_get_image_slide(v2)];
  int v5 = _NSGetMachExecuteHeader();
  uint64_t size = 0LL;
  uint64_t v6 = getsectdatafromheader_64(v5, "__DATA_CONST", "__object_init", &size);
  uint64_t image_slide = _dyld_get_image_slide(v5);
  if (v4 < (void (**)(void))&v6[image_slide + size])
  {
    do
    {
      uint64_t v8 = *v4++;
      v8();
      uint64_t v9 = _NSGetMachExecuteHeader();
      uint64_t size = 0LL;
      int v10 = getsectdatafromheader_64(v9, "__DATA_CONST", "__object_init", &size);
      uint64_t v11 = _dyld_get_image_slide(v9);
    }

    while (v4 < (void (**)(void))&v10[v11 + size]);
  }

  *v0 |= 1uLL;
  sub_100008BF8((uint64_t)v1);
  dispatch_main();
}

CFErrorRef sub_10002A49C(int a1, int a2, os_log_s *a3)
{
  kern_return_t v25;
  kern_return_t v26;
  uint64_t v27;
  os_log_s *v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  size_t v32;
  size_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  os_log_s *v39;
  int v41;
  uint64_t v42;
  os_log_s *v43;
  char *v44;
  _OWORD v45[3];
  uint64_t v46;
  _OWORD v47[3];
  uint64_t v48;
  _OWORD v49[3];
  uint64_t v50;
  io_connect_t connect;
  uint64_t v52;
  uint8_t buf[88];
  uint64_t v3 = a3;
  os_log_t v6 = 0LL;
  connect = 0;
  __int16 v50 = 0LL;
  memset(v49, 0, sizeof(v49));
  __int16 v48 = 0LL;
  memset(v47, 0, sizeof(v47));
  __int16 v46 = 0LL;
  memset(v45, 0, sizeof(v45));
  if (!a3)
  {
    os_log_t v6 = os_log_create("com.apple.libcryptex", "amfi");
    uint64_t v3 = v6;
  }

  uint64_t v7 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(0, v7);
  if (MatchingService)
  {
    io_service_t v9 = MatchingService;
    int v10 = sub_10003BB8C(a2, v47);
    if (v10)
    {
      int v11 = v10;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          uint64_t v12 = 3LL;
        }
        else {
          uint64_t v12 = 2LL;
        }
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v11;
        uint64_t v13 = v3;
      }

      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v10;
        uint64_t v13 = (os_log_s *)&_os_log_default;
        uint64_t v12 = 2LL;
      }

      int v21 = (char *)_os_log_send_and_compose_impl(v12, 0LL, 0LL, 0LL, &_mh_execute_header, v13, 16LL);
      CFIndex v22 = v11;
      int v23 = "com.apple.security.cryptex.posix";
      int v24 = 38;
LABEL_40:
      CFErrorRef v15 = sub_10000A444("amfi_load_trust_cache", "amfi.c", v24, v23, v22, 0LL, v21);
      free(v21);
      int v16 = 0LL;
      goto LABEL_41;
    }

    int v17 = sub_10003BB8C(a1, v49);
    if (v17)
    {
      int v18 = v17;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          uint64_t v19 = 3LL;
        }
        else {
          uint64_t v19 = 2LL;
        }
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v18;
        int v20 = v3;
      }

      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v17;
        int v20 = (os_log_s *)&_os_log_default;
        uint64_t v19 = 2LL;
      }

      int v21 = (char *)_os_log_send_and_compose_impl(v19, 0LL, 0LL, 0LL, &_mh_execute_header, v20, 16LL);
      CFIndex v22 = v18;
      int v23 = "com.apple.security.cryptex.posix";
      int v24 = 44;
      goto LABEL_40;
    }

    uint64_t v25 = IOServiceOpen(v9, mach_task_self_, 0, &connect);
    if (v25)
    {
      id v26 = v25;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          xpc_connection_t v27 = 3LL;
        }
        else {
          xpc_connection_t v27 = 2LL;
        }
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v26;
        __int16 v28 = v3;
      }

      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v25;
        __int16 v28 = (os_log_s *)&_os_log_default;
        xpc_connection_t v27 = 2LL;
      }

      int v21 = (char *)_os_log_send_and_compose_impl(v27, 0LL, 0LL, 0LL, &_mh_execute_header, v28, 16LL);
      int v23 = "com.apple.security.cryptex";
      int v24 = 50;
      CFIndex v22 = 34LL;
      goto LABEL_40;
    }

    uint64_t v29 = *((void *)&v47[0] + 1) + *((void *)&v49[0] + 1) + 16LL;
    __int16 v30 = mmap(0LL, v29, 3, 4098, -1, 0LL);
    if (v30 == (void *)-1LL)
    {
      uint64_t v41 = *__error();
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          __int16 v42 = 3LL;
        }
        else {
          __int16 v42 = 2LL;
        }
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v41;
        uint64_t v43 = v3;
      }

      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v41;
        uint64_t v43 = (os_log_s *)&_os_log_default;
        __int16 v42 = 2LL;
      }

      __int16 v44 = (char *)_os_log_send_and_compose_impl(v42, 0LL, 0LL, 0LL, &_mh_execute_header, v43, 16LL);
      CFErrorRef v15 = sub_10000A444("amfi_load_trust_cache", "amfi.c", 66, "com.apple.security.cryptex.posix", v41, 0LL, v44);
      int v16 = 0LL;
    }

    else
    {
      uint64_t v31 = v30;
      void *v30 = *((void *)&v47[0] + 1);
      v30[1] = *((void *)&v49[0] + 1);
      sub_10003C35C(v45, 0LL, (uint64_t)sub_10003C300, (uint64_t)v30, v29);
      int v16 = sub_10003C504((uint64_t)v45, "rw", 0x10uLL);
      __int16 v32 = fwrite(*(const void **)&v47[0], *((size_t *)&v47[0] + 1), 1uLL, v16);
      uint64_t v33 = fwrite(*(const void **)&v49[0], *((size_t *)&v49[0] + 1), 1uLL, v16);
      __int16 v34 = IOConnectCallMethod(connect, 7u, 0LL, 0, v31, v29, 0LL, 0LL, 0LL, 0LL);
      if (!(_DWORD)v34)
      {
        CFErrorRef v15 = 0LL;
        goto LABEL_58;
      }

      uint64_t v35 = v34;
      __int16 v36 = sub_1000108D4(v34);
      uint64_t v37 = v36;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          __int16 v38 = 3LL;
        }
        else {
          __int16 v38 = 2LL;
        }
        *(_DWORD *)int buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v35;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v37;
        uint64_t v39 = v3;
      }

      else
      {
        *(_DWORD *)int buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v35;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v36;
        uint64_t v39 = (os_log_s *)&_os_log_default;
        __int16 v38 = 2LL;
      }

      __int16 v44 = (char *)_os_log_send_and_compose_impl(v38, 0LL, 0LL, 0LL, &_mh_execute_header, v39, 16LL);
      CFErrorRef v15 = sub_10000A444("amfi_load_trust_cache", "amfi.c", 96, "com.apple.security.cryptex.posix", v37, 0LL, v44);
    }

    free(v44);
LABEL_58:
    if (connect && IOServiceClose(connect)) {
      sub_100040610(&v52, buf);
    }
    if (v9 != -1) {
      mach_right_send_release(v9);
    }
    goto LABEL_41;
  }

  int v14 = *__error();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "could not find AppleMobileFileIntegrity", buf, 2u);
  }

  CFErrorRef v15 = 0LL;
  int v16 = 0LL;
  *__error() = v14;
LABEL_41:
  sub_10003C5AC(v45);
  sub_10003C5AC(v49);
  sub_10003C5AC(v47);
  if (v6) {
    os_release(v6);
  }
  if (v16 && fclose(v16) == -1 && *__error()) {
    sub_1000405A4(&v52, buf);
  }
  return v15;
}

double sub_10002AC68(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

  ;
}

void sub_10002ACA8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 404);
  int v2 = *(_DWORD *)(a1 + 400);
  if ((v1 & 0x80000000) == 0 || (v2 & 0x80000000) == 0)
  {
    uint64_t v10 = 0LL;
    memset(v14, 0, sizeof(v14));
    int v6 = v2;
    int v7 = v1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    LODWORD(v11) = 67109376;
    HIDWORD(v11) = v7;
    __int16 v12 = 1024;
    int v13 = v6;
    uint64_t v9 = _os_log_send_and_compose_impl(v8, &v10, v14, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    _os_crash_msg(v10, v9);
    __break(1u);
LABEL_13:
    sub_1000406F4(&v11, v14);
  }

  if (*(_DWORD *)(a1 + 184)) {
    goto LABEL_13;
  }
  sub_10002AE08(a1 + 208);
  free(*(void **)(a1 + 360));
  os_release(*(void **)(a1 + 392));
  os_release(*(void **)(a1 + 200));
  __int128 v4 = *(const void **)(a1 + 408);
  if (v4) {
    CFRelease(v4);
  }
  int v5 = *(void **)(a1 + 192);
  if (v5) {
    xpc_release(v5);
  }
  sub_10002AEDC(a1);
  sub_10003A9CC(a1 + 56);
}

void sub_10002AE08(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(void **)a1;
    if (v2)
    {
      if (!*(void *)(a1 + 104)) {
        goto LABEL_7;
      }
      unint64_t v3 = 0LL;
      do
      {
        uint64_t v4 = a1 + 8 * v3;
        free(*(void **)(v4 + 40));
        *(void *)(v4 + 40) = 0LL;
        ++v3;
      }

      while (v3 < *(void *)(a1 + 104));
      int v2 = *(void **)a1;
      if (*(void *)a1)
      {
LABEL_7:
        free(v2);
        *(void *)a1 = 0LL;
      }

      if (*(void *)(a1 + 16))
      {
        cryptex_version_destroy(a1 + 16);
        *(void *)(a1 + 16) = 0LL;
      }

      int v5 = *(void **)(a1 + 24);
      if (v5)
      {
        os_release(v5);
        *(void *)(a1 + 24) = 0LL;
      }

      int v6 = *(void **)(a1 + 32);
      if (v6)
      {
        free(v6);
        *(void *)(a1 + 32) = 0LL;
      }

      int v7 = *(void **)(a1 + 128);
      if (v7)
      {
        xpc_release(v7);
        *(void *)(a1 + 12_Block_object_dispose(va, 8) = 0LL;
      }

      uint64_t v8 = *(void **)(a1 + 136);
      if (v8)
      {
        xpc_release(v8);
        *(void *)(a1 + 136) = 0LL;
      }

      uint64_t v9 = *(void **)(a1 + 120);
      if (v9)
      {
        xpc_release(v9);
        *(void *)(a1 + 120) = 0LL;
      }
    }
  }

void sub_10002AEDC(uint64_t a1)
{
  int v2 = *(void **)(a1 + 368);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 36_Block_object_dispose(va, 8) = 0LL;
  }

  free(*(void **)(a1 + 416));
  *(void *)(a1 + 416) = 0LL;
  free(*(void **)(a1 + 424));
  *(void *)(a1 + 424) = 0LL;
  free(*(void **)(a1 + 432));
  *(void *)(a1 + 432) = 0LL;
}

uint64_t sub_10002AF2C(void *a1, void *a2, uint64_t a3, int a4)
{
  uint64_t v8 = sub_100008BC0();
  if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = xpc_copy_description(a1);
    uint64_t v10 = (const char *)*((void *)v8 + 2);
    int v11 = *__error();
    __int16 v12 = (os_log_s *)*((void *)v8 + 4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = "[anonymous]";
      if (v10) {
        int v13 = v10;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&_BYTE buf[12] = 2080;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s: making attr from: %s", buf, 0x16u);
    }

    *__error() = v11;
    free(v9);
  }

  xpc_object_t v14 = sub_10003CA88((uint64_t)&off_100057018, a1);
  if (v14)
  {
    CFErrorRef v15 = v14;
    xpc_object_t v16 = sub_10003CA88((uint64_t)&off_100057038, a1);
    if (!v16)
    {
      uint64_t v25 = (const char *)*((void *)v8 + 2);
      int v26 = *__error();
      xpc_connection_t v27 = (os_log_s *)*((void *)v8 + 4);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = "[anonymous]";
        *(_DWORD *)int buf = 136446978;
        if (v25) {
          __int16 v28 = v25;
        }
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&_BYTE buf[12] = 2080;
        *(void *)&buf[14] = "CFBundleVersion";
        *(_WORD *)&buf[22] = 2112;
        uint64_t v41 = a1;
        LOWORD(v42) = 1024;
        *(_DWORD *)((char *)&v42 + 2) = 212;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s: missing key: %s: %@: %{darwin.errno}d",  buf,  0x26u);
      }

      *__error() = v26;
      uint64_t v24 = 212LL;
      goto LABEL_45;
    }

    int v17 = v16;
    xpc_object_t v18 = sub_10003CA88((uint64_t)&off_100057058, a1);
    if (v18)
    {
      uint64_t v19 = sub_100008BC0();
      *(void *)int buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 0x40000000LL;
      *(void *)&uint8_t buf[16] = sub_100030D68;
      uint64_t v41 = &unk_100057118;
      __int16 v42 = v19;
      uint64_t v43 = a3;
      xpc_array_apply(v18, buf);
      if (v19) {
        os_release(v19);
      }
    }

    xpc_string_get_string_ptr(v15);
    if (a4)
    {
      xpc_string_get_string_ptr(v17);
      asprintf((char **)a3, "%s-v%s");
    }

    else
    {
      asprintf((char **)a3, "%s");
    }

    string_ptr = sub_10003CA88((uint64_t)&off_100057078, a1);
    __int16 v30 = string_ptr;
    if (string_ptr) {
      string_ptr = (void *)xpc_string_get_string_ptr(string_ptr);
    }
    *(void *)(a3 + _Block_object_dispose(va, 8) = string_ptr;
    xpc_object_t v31 = sub_10003CA88((uint64_t)&off_100057098, a1);
    __int16 v32 = v31;
    if (v31)
    {
      if (xpc_get_type(v31) != (xpc_type_t)&_xpc_type_BOOL)
      {
        uint64_t v33 = (const char *)*((void *)v8 + 2);
        int v34 = *__error();
        uint64_t v35 = (os_log_s *)*((void *)v8 + 4);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          __int16 v36 = "[anonymous]";
          *(_DWORD *)int buf = 136446978;
          if (v33) {
            __int16 v36 = v33;
          }
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&_BYTE buf[12] = 2080;
          *(void *)&buf[14] = "DeveloperModeRequired";
          *(_WORD *)&buf[22] = 2112;
          uint64_t v41 = a1;
          LOWORD(v42) = 1024;
          *(_DWORD *)((char *)&v42 + 2) = 212;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}s: invalid value for key: %s: %@: %{darwin.errno}d",  buf,  0x26u);
        }

        *__error() = v34;
        os_release(v8);
        uint64_t v37 = 212LL;
LABEL_39:
        os_release(v32);
        uint64_t v24 = v37;
LABEL_40:
        if (v18) {
          os_release(v18);
        }
        if (v30) {
          os_release(v30);
        }
        uint64_t v8 = v17;
LABEL_45:
        os_release(v8);
        goto LABEL_46;
      }

      LOBYTE(v31) = xpc_BOOL_get_value(v32);
    }

    *(_BYTE *)(a3 + 144) = (_BYTE)v31;
    *(void *)(a3 + 120) = sub_10003CA88((uint64_t)&off_1000570B8, a1);
    *(void *)(a3 + 136) = sub_10003CA88((uint64_t)&off_1000570D8, a1);
    *(void *)(a3 + 12_Block_object_dispose(va, 8) = sub_10003CA88((uint64_t)&off_1000570F8, a1);
    __int16 v38 = xpc_string_get_string_ptr(v17);
    *(void *)(a3 + 16) = cryptex_version_new(v38);
    *(void *)(a3 + 24) = os_retain(a1);
    if (a2) {
      *(void *)(a3 + 32) = *a2;
    }
    else {
      a2 = (void *)(a3 + 32);
    }
    *a2 = 0LL;
    os_release(v8);
    uint64_t v37 = 0LL;
    uint64_t v24 = 0LL;
    if (!v32) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }

  int v20 = (const char *)*((void *)v8 + 2);
  int v21 = *__error();
  CFIndex v22 = (os_log_s *)*((void *)v8 + 4);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    int v23 = "[anonymous]";
    *(_DWORD *)int buf = 136446978;
    if (v20) {
      int v23 = v20;
    }
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&_BYTE buf[12] = 2080;
    *(void *)&buf[14] = "CFBundleIdentifier";
    *(_WORD *)&buf[22] = 2112;
    uint64_t v41 = a1;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = 212;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}s: missing key: %s: %@: %{darwin.errno}d",  buf,  0x26u);
  }

  *__error() = v21;
  uint64_t v24 = 212LL;
  CFErrorRef v15 = v8;
LABEL_46:
  os_release(v15);
  return v24;
}

uint64_t sub_10002B438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008BC0();
  int v5 = *(void **)(a1 + 24);
  if (!v5) {
    sub_10004077C(&v41, buf);
  }
  xpc_object_t array = xpc_dictionary_get_array(v5, "Dependencies");
  size_t count = xpc_array_get_count(array);
  if (count > 8)
  {
    uint64_t v8 = 59LL;
    if (!v4) {
      return v8;
    }
    goto LABEL_47;
  }

  size_t v9 = count;
  uint64_t v10 = sub_100008BC0();
  if (!array) {
    sub_100040804(&v41, buf);
  }
  int v11 = v10;
  xpc_type_t type = xpc_get_type(array);
  if (type != (const _xpc_type_s *)&_xpc_type_array) {
    sub_100040938(&v41, buf, type);
  }
  size_t v13 = xpc_array_get_count(array);
  if (v13)
  {
    size_t v14 = v13;
    uint64_t v39 = v4;
    __int16 v40 = v11;
    for (size_t i = 0LL; i != v14; ++i)
    {
      xpc_object_t dictionary = xpc_array_get_dictionary(array, i);
      if (!dictionary)
      {
        int v11 = v40;
        uint64_t v25 = (const char *)*((void *)v40 + 2);
        int v26 = *__error();
        xpc_connection_t v27 = (os_log_s *)*((void *)v40 + 4);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __int16 v28 = "[anonymous]";
          if (v25) {
            __int16 v28 = v25;
          }
          *(_DWORD *)int buf = 136446466;
          uint64_t v43 = v28;
          __int16 v44 = 2048;
          size_t v45 = i;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s: unable to parse dependency dictionary for element %lu in dependencies array from c411",  buf,  0x16u);
        }

        uint64_t v4 = v39;
        goto LABEL_36;
      }

      int v17 = dictionary;
      string = xpc_dictionary_get_string(dictionary, "CFBundleIdentifier");
      uint64_t v19 = xpc_dictionary_get_string(v17, "CFBundleVersion");
      if (!string)
      {
        uint64_t v8 = 22LL;
        goto LABEL_27;
      }

      int v20 = v19;
      if (!sub_10001ECB8(a2, (uint64_t)string, (uint64_t)v19))
      {
        uint64_t v29 = (const char *)*((void *)v40 + 2);
        int v26 = *__error();
        __int16 v30 = (os_log_s *)*((void *)v40 + 4);
        uint64_t v4 = v39;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          xpc_object_t v31 = "[anonymous]";
          if (v29) {
            xpc_object_t v31 = v29;
          }
          __int16 v32 = "unspecified";
          *(_DWORD *)int buf = 136446722;
          uint64_t v43 = v31;
          __int16 v44 = 2080;
          size_t v45 = (size_t)string;
          if (v20) {
            __int16 v32 = v20;
          }
          __int16 v46 = 2080;
          int v47 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}s: unable to satisfy dependency with bundleID : %s (min version : %s)",  buf,  0x20u);
        }

        int v11 = v40;
LABEL_36:
        *__error() = v26;
        uint64_t v8 = 22LL;
        goto LABEL_37;
      }
    }

    uint64_t v8 = 0LL;
LABEL_27:
    uint64_t v4 = v39;
    int v11 = v40;
    if (v40) {
      goto LABEL_37;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
    if (v11)
    {
LABEL_37:
      os_release(v11);
      if ((_DWORD)v8) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
  }

  if ((_DWORD)v8)
  {
LABEL_16:
    int v21 = (const char *)v4[2];
    int v22 = *__error();
    int v23 = (os_log_s *)v4[4];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = "[anonymous]";
      if (v21) {
        uint64_t v24 = v21;
      }
      *(_DWORD *)int buf = 136446466;
      uint64_t v43 = v24;
      __int16 v44 = 1024;
      LODWORD(v45) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}s: quire_evaluate_dependencies() failed: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v22;
LABEL_47:
    os_release(v4);
    return v8;
  }

LABEL_38:
  if (v9)
  {
    for (size_t j = 0LL; j != v9; ++j)
    {
      xpc_object_t v34 = xpc_array_get_dictionary(array, j);
      if (!v34) {
        sub_100040894();
      }
      uint64_t v35 = xpc_dictionary_get_string(v34, "CFBundleIdentifier");
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          __int16 v36 = strdup(v35);
          if (v36) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }

      else
      {
        __int16 v36 = strdup(v35);
        if (!v36) {
          sub_1000408AC();
        }
      }

      uint64_t v37 = *(void *)(a1 + 104);
      *(void *)(a1 + 8 * v37 + 40) = v36;
      *(void *)(a1 + 104) = v37 + 1;
    }
  }

  uint64_t v8 = 0LL;
  if (v4) {
    goto LABEL_47;
  }
  return v8;
}

uint64_t sub_10002B814(uint64_t result)
{
  *(_BYTE *)(result + 145) = 1;
  return result;
}

uint64_t sub_10002B820(void *a1, void *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8 = *a3;
  v29[0] = "cryptex";
  v29[1] = v8;
  size_t v9 = a3 + 2;
  v29[2] = *(void *)a3[2];
  __int16 v30 = "NODGST";
  uint64_t v10 = a2[20];
  if (v10) {
    __int16 v30 = (const char *)(v10 + 160);
  }
  uint64_t v11 = sub_100011190(488LL);
  *(void *)(v11 + 176) = a4;
  __int128 v12 = *((_OWORD *)a3 + 1);
  *(_OWORD *)(v11 + 20_Block_object_dispose(va, 8) = *(_OWORD *)a3;
  *(_OWORD *)(v11 + 224) = v12;
  __int128 v13 = *((_OWORD *)a3 + 5);
  __int128 v15 = *((_OWORD *)a3 + 2);
  __int128 v14 = *((_OWORD *)a3 + 3);
  *(_OWORD *)(v11 + 272) = *((_OWORD *)a3 + 4);
  *(_OWORD *)(v11 + 28_Block_object_dispose(va, 8) = v13;
  *(_OWORD *)(v11 + 240) = v15;
  *(_OWORD *)(v11 + 256) = v14;
  __int128 v17 = *((_OWORD *)a3 + 7);
  __int128 v16 = *((_OWORD *)a3 + 8);
  __int128 v18 = *((_OWORD *)a3 + 6);
  *(void *)(v11 + 352) = a3[18];
  *(_OWORD *)(v11 + 320) = v17;
  *(_OWORD *)(v11 + 336) = v16;
  *(_OWORD *)(v11 + 304) = v18;
  *(void *)(v11 + 392) = os_retain(a1);
  uint64_t v19 = os_retain(a2);
  *(void *)(v11 + 400) = -1LL;
  *(_DWORD *)(v11 + 18_Block_object_dispose(va, 8) = 0;
  *(void *)(v11 + 192) = 0LL;
  *(void *)(v11 + 200) = v19;
  *(void *)(v11 + 360) = cryptex_core_unparse_hdiid(v29);
  *(void *)(v11 + 384) = v11 + 376;
  int v20 = (void *)(v11 + 472);
  *(_OWORD *)(v11 + 36_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(v11 + 472) = 0u;
  if (a3[13])
  {
    unint64_t v21 = 0LL;
    do
    {
      int v22 = sub_100017B18((uint64_t)a1, (char *)a3[v21 + 5], 0LL);
      if (!v22) {
        sub_1000409D0();
      }
      int v23 = v22;
      uint64_t v24 = malloc(0x10uLL);
      if (!v24) {
        sub_1000409E8();
      }
      uint64_t v25 = v24;
      void *v24 = v23;
      os_retain(v23);
      v25[1] = *v20;
      *int v20 = v25;
      int v26 = malloc(0x10uLL);
      if (!v26) {
        sub_1000409E8();
      }
      xpc_connection_t v27 = v26;
      *int v26 = v11;
      os_retain((void *)v11);
      v27[1] = v23[60];
      v23[60] = v27;
      os_release(v23);
      ++v21;
    }

    while (v21 < a3[13]);
  }

  *a3 = 0LL;
  void *v9 = 0LL;
  v9[1] = 0LL;
  sub_10003A6E4(v11 + 56, (int)"com.apple.security.cryptexd", "quire");
  sub_10003A88C(v11 + 56, *(const char **)(v11 + 208));
  cryptex_init(v11, 0LL, 0LL, 0LL);
  sub_100038EC4(v11 + 80, *(char **)(v11 + 208));
  sub_100038EC4(v11 + 112, *(char **)(v11 + 208));
  sub_100038EC4(v11 + 144, *(char **)(v11 + 208));
  return v11;
}

void **sub_10002BA74(uint64_t a1, int a2, void *a3, void *a4)
{
  double result = sub_10003C818((void *)a1, 0x50uLL);
  *((_DWORD *)result + 11) = a2;
  result[7] = a3;
  result[8] = a4;
  if (!*(_DWORD *)(a1 + 184)) {
    return (void **)cryptex_async_f(a1, result, sub_10002BAF0);
  }
  result[3] = 0LL;
  **(void **)(a1 + 384) = result;
  *(void *)(a1 + 384) = result + 3;
  return result;
}

uint64_t sub_10002BAF0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 11);
  int v186 = -1;
  uint64_t v4 = *(const char **)(v2 + 240);
  if (!v4)
  {
    __int128 v203 = 0u;
    memset(v204, 0, sizeof(v204));
    __int128 v201 = 0u;
    __int128 v202 = 0u;
    __int128 v199 = 0u;
    __int128 v200 = 0u;
    __int128 v197 = 0u;
    __int128 v198 = 0u;
    __int128 v195 = 0u;
    __int128 v196 = 0u;
    __int128 v193 = 0u;
    __int128 v194 = 0u;
    __int128 v191 = 0u;
    __int128 v192 = 0u;
    *(_OWORD *)__str = 0u;
    if ((*(_DWORD *)(v2 + 400) & 0x80000000) == 0)
    {
      __int128 v14 = *(void **)(v2 + 72);
      if (v14)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v15 = 3LL;
        }
        else {
          uint64_t v15 = 2LL;
        }
        __int128 v16 = *(const char **)(v2 + 56);
        if (!v16) {
          __int128 v16 = "[anonymous]";
        }
        v211.st_dev = 136446466;
        *(void *)&v211.st_mode = v16;
        WORD2(v211.st_ino) = 1024;
        *(_DWORD *)((char *)&v211.st_ino + 6) = 37;
        __int128 v17 = v14;
      }

      else
      {
        __int16 v40 = *(const char **)(v2 + 56);
        if (!v40) {
          __int16 v40 = "[anonymous]";
        }
        v211.st_dev = 136446466;
        *(void *)&v211.st_mode = v40;
        WORD2(v211.st_ino) = 1024;
        *(_DWORD *)((char *)&v211.st_ino + 6) = 37;
        __int128 v17 = &_os_log_default;
        uint64_t v15 = 2LL;
      }

      uint64_t v41 = (char *)_os_log_send_and_compose_impl(v15, 0LL, 0LL, 0LL, &_mh_execute_header, v17, 16LL);
      __int16 v42 = "com.apple.security.cryptex.posix";
      int v43 = 576;
      CFIndex v44 = 37LL;
      goto LABEL_56;
    }

    if (*(void *)(v2 + 216))
    {
      __int16 v28 = *(const char **)(v2 + 56);
      int v29 = *__error();
      __int16 v30 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        xpc_object_t v31 = "[anonymous]";
        __darwin_ino64_t v32 = *(void *)(v2 + 216);
        if (v28) {
          xpc_object_t v31 = v28;
        }
        v211.st_dev = 136446466;
        *(void *)&v211.st_mode = v31;
        WORD2(v211.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v211.st_ino + 6) = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}s: custom mount path %s",  (uint8_t *)&v211,  0x16u);
      }

      *__error() = v29;
      if (**(_BYTE **)(v2 + 216) != 47)
      {
        __int128 v87 = *(void **)(v2 + 72);
        if (v87)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v88 = 3LL;
          }
          else {
            uint64_t v88 = 2LL;
          }
          __int128 v89 = *(const char **)(v2 + 56);
          if (!v89) {
            __int128 v89 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v89;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = 22;
          __int128 v90 = v87;
        }

        else
        {
          __int128 v117 = *(const char **)(v2 + 56);
          if (!v117) {
            __int128 v117 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v117;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = 22;
          __int128 v90 = &_os_log_default;
          uint64_t v88 = 2LL;
        }

        uint64_t v41 = (char *)_os_log_send_and_compose_impl(v88, 0LL, 0LL, 0LL, &_mh_execute_header, v90, 16LL);
        __int16 v42 = "com.apple.security.cryptex.posix";
        int v43 = 586;
        CFIndex v44 = 22LL;
        goto LABEL_56;
      }

      snprintf(__str, 0xFFuLL, "%s", *(const char **)(v2 + 216));
      int v33 = sub_10003BA38(__str, 0x1FFu, &v186);
      if (v33)
      {
        int v34 = v33;
        uint64_t v35 = *(void **)(v2 + 72);
        if (v35)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v36 = 3LL;
          }
          else {
            uint64_t v36 = 2LL;
          }
          uint64_t v37 = *(const char **)(v2 + 56);
          if (!v37) {
            uint64_t v37 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v37;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v34;
          __int16 v38 = v35;
        }

        else
        {
          __int128 v119 = *(const char **)(v2 + 56);
          if (!v119) {
            __int128 v119 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v119;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v33;
          __int16 v38 = &_os_log_default;
          uint64_t v36 = 2LL;
        }

        uint64_t v41 = (char *)_os_log_send_and_compose_impl(v36, 0LL, 0LL, 0LL, &_mh_execute_header, v38, 16LL);
        CFIndex v44 = v34;
        __int16 v42 = "com.apple.security.cryptex.posix";
        int v43 = 592;
        goto LABEL_56;
      }

      if (*(_BYTE *)(v2 + 353))
      {
        uint64_t v94 = 0LL;
        char v95 = 1;
        while (1)
        {
          char v96 = v95;
          char v95 = 0;
          uint64_t v94 = 1LL;
          if ((v96 & 1) == 0)
          {
            __int128 v97 = *(void **)(v2 + 72);
            if (v97)
            {
              if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
                uint64_t v98 = 3LL;
              }
              else {
                uint64_t v98 = 2LL;
              }
              __int128 v99 = *(const char **)(v2 + 56);
              __darwin_ino64_t v100 = *(void *)(v2 + 216);
              if (!v99) {
                __int128 v99 = "[anonymous]";
              }
              v211.st_dev = 136446466;
              *(void *)&v211.st_mode = v99;
              WORD2(v211.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&v211.st_ino + 6) = v100;
              __int128 v101 = v97;
            }

            else
            {
              int v162 = *(const char **)(v2 + 56);
              if (!v162) {
                int v162 = "[anonymous]";
              }
              __darwin_ino64_t v163 = *(void *)(v2 + 216);
              v211.st_dev = 136446466;
              *(void *)&v211.st_mode = v162;
              WORD2(v211.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&v211.st_ino + 6) = v163;
              __int128 v101 = &_os_log_default;
              uint64_t v98 = 2LL;
            }

            uint64_t v41 = (char *)_os_log_send_and_compose_impl(v98, 0LL, 0LL, 0LL, &_mh_execute_header, v101, 16LL);
            __int16 v42 = "com.apple.security.cryptex";
            int v43 = 606;
            CFIndex v44 = 2LL;
            goto LABEL_56;
          }
        }
      }
    }

    else
    {
      snprintf(__str, 0xFFuLL, "%s.XXXXXX", *(const char **)(v2 + 208));
      int v75 = sub_10003B9E0(v3, __str, &v186);
      if (v75)
      {
        int v76 = v75;
        __int128 v77 = *(void **)(v2 + 72);
        if (v77)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v78 = 3LL;
          }
          else {
            uint64_t v78 = 2LL;
          }
          __int128 v79 = *(const char **)(v2 + 56);
          if (!v79) {
            __int128 v79 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v79;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v76;
          __int128 v80 = v77;
        }

        else
        {
          __int128 v118 = *(const char **)(v2 + 56);
          if (!v118) {
            __int128 v118 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v118;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v75;
          __int128 v80 = &_os_log_default;
          uint64_t v78 = 2LL;
        }

        uint64_t v41 = (char *)_os_log_send_and_compose_impl(v78, 0LL, 0LL, 0LL, &_mh_execute_header, v80, 16LL);
        CFIndex v44 = v76;
        __int16 v42 = "com.apple.security.cryptex.posix";
        int v43 = 614;
        goto LABEL_56;
      }
    }

    int v188 = -1;
    uint64_t v102 = v186;
    bzero(&v211.st_uid, 0x828uLL);
    v211.st_ino = *(void *)(v2 + 360);
    *(_DWORD *)&v211.st_mode = -1;
    int v213 = -1;
    int v215 = -1;
    bzero(__s1, 0x400uLL);
    int v187 = -1;
    image_uint64_t asset = cryptex_core_get_image_asset(*(void *)(v2 + 200));
    v211.st_dev = *(_DWORD *)(image_asset + 16);
    if (cryptex_asset_type_is_cryptex1(*(void *)(image_asset + 8)))
    {
      uint64_t asset = cryptex_core_get_asset(*(void *)(v2 + 200), &_cryptex_asset_type_gtgv);
      if (!asset)
      {
        uint64_t v141 = *(void **)(v2 + 72);
        if (v141)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v142 = 3LL;
          }
          else {
            uint64_t v142 = 2LL;
          }
          int v143 = *(const char **)(v2 + 56);
          if (!v143) {
            int v143 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          pid_t v218 = v143;
          id v144 = v141;
        }

        else
        {
          id v148 = *(const char **)(v2 + 56);
          if (!v148) {
            id v148 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          pid_t v218 = v148;
          id v144 = &_os_log_default;
          uint64_t v142 = 2LL;
        }

        uint64_t v137 = (char *)_os_log_send_and_compose_impl(v142, 0LL, 0LL, 0LL, &_mh_execute_header, v144, 16LL);
        pid_t v139 = "com.apple.security.cryptex";
        int v140 = 212;
        CFIndex v138 = 15LL;
        goto LABEL_230;
      }

      uint64_t v105 = asset;
      uint64_t v106 = cryptex_core_get_asset(*(void *)(v2 + 200), &_cryptex_asset_type_im4m);
      if (v106 && (uint64_t v107 = v106, cryptex_asset_len(v106, v2 + 56) >= 1))
      {
        __int128 v108 = *(const char **)(v2 + 56);
        int v109 = *__error();
        __int128 v110 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          __int128 v111 = "[anonymous]";
          if (v108) {
            __int128 v111 = v108;
          }
          *(_DWORD *)int buf = 136446210;
          pid_t v218 = v111;
          _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "%{public}s: AuthAPFS enabled.", buf, 0xCu);
        }

        *__error() = v109;
        v212[1032] = 1;
        int v213 = *(_DWORD *)(v105 + 16);
        int v214 = *(_DWORD *)(*(void *)(v105 + 8) + 32LL);
        int v215 = *(_DWORD *)(v107 + 16);
        int v216 = 4;
        uint64_t v112 = *(void *)(*(void *)(v2 + 200) + 168LL);
        if (v112 && (*(_BYTE *)(v112 + 40) & 1) != 0)
        {
          __int128 v113 = *(const char **)(v2 + 56);
          int v114 = *__error();
          __int128 v115 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
          {
            __int128 v116 = "[anonymous]";
            if (v113) {
              __int128 v116 = v113;
            }
            *(_DWORD *)int buf = 136446210;
            pid_t v218 = v116;
            _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_INFO,  "%{public}s: AuthAPFS using supplemental auth environment.",  buf,  0xCu);
          }

          *__error() = v114;
          int v216 = 5;
        }
      }

      else
      {
        __int128 v120 = *(const char **)(v2 + 56);
        int v121 = *__error();
        uint64_t v122 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
        {
          int v123 = "[anonymous]";
          if (v120) {
            int v123 = v120;
          }
          *(_DWORD *)int buf = 136446210;
          pid_t v218 = v123;
          _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_INFO,  "%{public}s: AuthAPFS disabled because quire lacks an im4m.",  buf,  0xCu);
        }

        *__error() = v121;
      }
    }

    int v124 = realpath_np(v102, __s1);
    if (v124)
    {
      int v125 = v124;
      pid_t v126 = *(void **)(v2 + 72);
      if (v126)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v127 = 3LL;
        }
        else {
          uint64_t v127 = 2LL;
        }
        id v128 = *(const char **)(v2 + 56);
        if (!v128) {
          id v128 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        pid_t v218 = v128;
        __int16 v219 = 1024;
        LODWORD(v220) = v125;
        __int128 v129 = v126;
      }

      else
      {
        CFErrorRef v136 = *(const char **)(v2 + 56);
        if (!v136) {
          CFErrorRef v136 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        pid_t v218 = v136;
        __int16 v219 = 1024;
        LODWORD(v220) = v124;
        __int128 v129 = &_os_log_default;
        uint64_t v127 = 2LL;
      }

      uint64_t v137 = (char *)_os_log_send_and_compose_impl(v127, 0LL, 0LL, 0LL, &_mh_execute_header, v129, 16LL);
      CFIndex v138 = v125;
      pid_t v139 = "com.apple.security.cryptex.posix";
      int v140 = 238;
    }

    else
    {
      int v130 = sub_10002493C(&v186, 0, (uint64_t)&v211);
      if (!v130)
      {
        int v145 = sub_10003A9F4(&v211.st_mode);
        int v187 = v145;
        int v188 = open(__s1, 1048832);
        if ((v188 & 0x80000000) == 0)
        {
          *(_DWORD *)(v2 + 404) = sub_10003A9F4(&v187);
          *(_DWORD *)(v2 + 400) = sub_10003A9F4(&v188);
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              pid_t v146 = strdup(__s1);
              if (v146) {
                break;
              }
              __os_temporary_resource_shortage();
            }
          }

          else
          {
            pid_t v146 = strdup(__s1);
            if (!v146) {
              sub_1000408AC();
            }
          }

          *(void *)(v2 + 416) = v146;
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              v171 = strdup(v212);
              if (v171) {
                break;
              }
              __os_temporary_resource_shortage();
            }
          }

          else
          {
            v171 = strdup(v212);
            if (!v171) {
              sub_1000408AC();
            }
          }

          *(void *)(v2 + 432) = v171;
          if (_dispatch_is_multithreaded())
          {
            uint64_t v172 = strdup((const char *)&v211.st_rdev);
            if (!v172)
            {
              do
              {
                __os_temporary_resource_shortage();
                pid_t v173 = strdup((const char *)&v211.st_rdev);
              }

              while (!v173);
              uint64_t v172 = v173;
            }
          }

          else
          {
            uint64_t v172 = strdup((const char *)&v211.st_rdev);
            if (!v172) {
              sub_1000408AC();
            }
          }

          CFErrorRef v50 = 0LL;
          CFTypeRef v149 = 0LL;
          *(void *)(v2 + 424) = v172;
          int v145 = v187;
          goto LABEL_234;
        }

        int v164 = *__error();
        unsigned int v165 = *(void **)(v2 + 72);
        if (v165)
        {
          BOOL v166 = os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          pid_t v167 = *(const char **)(v2 + 56);
          if (v166) {
            uint64_t v168 = 3LL;
          }
          else {
            uint64_t v168 = 2LL;
          }
          *(_DWORD *)int buf = 136446722;
          if (v167) {
            id v169 = v167;
          }
          else {
            id v169 = "[anonymous]";
          }
          pid_t v218 = v169;
          __int16 v219 = 2080;
          BOOL v220 = __s1;
          __int16 v221 = 1024;
          int v222 = v164;
          id v170 = v165;
        }

        else
        {
          pid_t v174 = "[anonymous]";
          if (*(void *)(v2 + 56)) {
            pid_t v174 = *(const char **)(v2 + 56);
          }
          *(_DWORD *)int buf = 136446722;
          pid_t v218 = v174;
          __int16 v219 = 2080;
          BOOL v220 = __s1;
          __int16 v221 = 1024;
          int v222 = v164;
          id v170 = &_os_log_default;
          uint64_t v168 = 2LL;
        }

        id v175 = (char *)_os_log_send_and_compose_impl(v168, 0LL, 0LL, 0LL, &_mh_execute_header, v170, 16LL);
        CFErrorRef v50 = sub_10000A444("_quire_mount_hdi", "quire.c", 255, "com.apple.security.cryptex.posix", v164, 0LL, v175);
        free(v175);
        int v176 = unmount(__s1, 0x80000);
        if (v176)
        {
          int v177 = v176;
          id v178 = *(const char **)(v2 + 56);
          int v185 = *__error();
          uint64_t v179 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
          {
            pid_t v180 = "[anonymous]";
            *(_DWORD *)int buf = 136446722;
            if (v178) {
              pid_t v180 = v178;
            }
            pid_t v218 = v180;
            __int16 v219 = 2080;
            BOOL v220 = __s1;
            __int16 v221 = 1024;
            int v222 = v177;
            _os_log_impl( (void *)&_mh_execute_header,  v179,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to clean up mount point: %s: %{darwin.errno}d",  buf,  0x1Cu);
          }

          *__error() = v185;
        }

        if ((v145 & 0x80000000) == 0 && ioctl(v145, 0x20006415uLL, 0LL, 28))
        {
          int v181 = *(const char **)(v2 + 56);
          int v182 = *__error();
          v183 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
          {
            if (!v181) {
              int v181 = "[anonymous]";
            }
            int v184 = *__error();
            *(_DWORD *)int buf = 136446722;
            pid_t v218 = v181;
            __int16 v219 = 2080;
            BOOL v220 = v212;
            __int16 v221 = 1024;
            int v222 = v184;
            _os_log_impl( (void *)&_mh_execute_header,  v183,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to clean up device: %s: %{darwin.errno}d",  buf,  0x1Cu);
          }

          *__error() = v182;
        }

LABEL_231:
        if (v50) {
          CFTypeRef v149 = CFRetain(v50);
        }
        else {
          CFTypeRef v149 = 0LL;
        }
LABEL_234:
        *(void *)(v2 + 40_Block_object_dispose(va, 8) = v149;
        if (v145 != -1 && close(v145) == -1) {
          sub_100040A90(&v189, buf);
        }
        if (v188 != -1 && close(v188) == -1) {
          sub_100040A90(__s1, &v211);
        }
        if (v50)
        {
          id v150 = *(void **)(v2 + 72);
          if (v150)
          {
            if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
              uint64_t v151 = 3LL;
            }
            else {
              uint64_t v151 = 2LL;
            }
            pid_t v152 = *(const char **)(v2 + 56);
            if (!v152) {
              pid_t v152 = "[anonymous]";
            }
            v211.st_dev = 136446210;
            *(void *)&v211.st_mode = v152;
            id v153 = v150;
          }

          else
          {
            v160 = *(const char **)(v2 + 56);
            if (!v160) {
              v160 = "[anonymous]";
            }
            v211.st_dev = 136446210;
            *(void *)&v211.st_mode = v160;
            id v153 = &_os_log_default;
            uint64_t v151 = 2LL;
          }

          id v68 = (char *)_os_log_send_and_compose_impl(v151, 0LL, 0LL, 0LL, &_mh_execute_header, v153, 16LL);
          int v69 = 621;
          goto LABEL_100;
        }

        int v154 = sub_10001EB74((void *)v2);
        if (!v154)
        {
          CFErrorRef v45 = 0LL;
          goto LABEL_57;
        }

        int v155 = v154;
        int64_t v156 = *(void **)(v2 + 72);
        if (v156)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v157 = 3LL;
          }
          else {
            uint64_t v157 = 2LL;
          }
          id v158 = *(const char **)(v2 + 56);
          if (!v158) {
            id v158 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v158;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v155;
          uint64_t v159 = v156;
        }

        else
        {
          int v161 = *(const char **)(v2 + 56);
          if (!v161) {
            int v161 = "[anonymous]";
          }
          v211.st_dev = 136446466;
          *(void *)&v211.st_mode = v161;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v154;
          uint64_t v159 = &_os_log_default;
          uint64_t v157 = 2LL;
        }

        uint64_t v41 = (char *)_os_log_send_and_compose_impl(v157, 0LL, 0LL, 0LL, &_mh_execute_header, v159, 16LL);
        CFIndex v44 = v155;
        __int16 v42 = "com.apple.security.cryptex.posix";
        int v43 = 627;
LABEL_56:
        CFErrorRef v45 = sub_10000A444("_quire_mount_continue", "quire.c", v43, v42, v44, 0LL, v41);
        free(v41);
LABEL_57:
        a1[2] = (uint64_t)v45;
        goto LABEL_107;
      }

      int v131 = v130;
      pid_t v132 = *(void **)(v2 + 72);
      if (v132)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v133 = 3LL;
        }
        else {
          uint64_t v133 = 2LL;
        }
        CFErrorRef v134 = *(const char **)(v2 + 56);
        if (!v134) {
          CFErrorRef v134 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        pid_t v218 = v134;
        __int16 v219 = 1024;
        LODWORD(v220) = v131;
        __int128 v135 = v132;
      }

      else
      {
        id v147 = *(const char **)(v2 + 56);
        if (!v147) {
          id v147 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        pid_t v218 = v147;
        __int16 v219 = 1024;
        LODWORD(v220) = v130;
        __int128 v135 = &_os_log_default;
        uint64_t v133 = 2LL;
      }

      uint64_t v137 = (char *)_os_log_send_and_compose_impl(v133, 0LL, 0LL, 0LL, &_mh_execute_header, v135, 16LL);
      CFIndex v138 = v131;
      pid_t v139 = "com.apple.security.cryptex.posix";
      int v140 = 244;
    }

LABEL_230:
    CFErrorRef v50 = sub_10000A444("_quire_mount_hdi", "quire.c", v140, v139, v138, 0LL, v137);
    free(v137);
    int v145 = -1;
    goto LABEL_231;
  }

  LODWORD(v18snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = -1;
  int v5 = v4 + 2311;
  memset(&v211, 0, sizeof(v211));
  *(_DWORD *)int buf = open(v4 + 2311, 1048832);
  if ((*(_DWORD *)buf & 0x80000000) != 0)
  {
    int v18 = *__error();
    uint64_t v19 = *(void **)(v2 + 72);
    if (v19)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v20 = 3LL;
      }
      else {
        uint64_t v20 = 2LL;
      }
      unint64_t v21 = *(const char **)(v2 + 56);
      *(_DWORD *)__s1 = 136446722;
      if (!v21) {
        unint64_t v21 = "[anonymous]";
      }
      uint64_t v206 = v21;
      __int16 v207 = 2080;
      v208 = v5;
      __int16 v209 = 1024;
      int v210 = v18;
      int v22 = v19;
    }

    else
    {
      __int16 v46 = *(const char **)(v2 + 56);
      if (!v46) {
        __int16 v46 = "[anonymous]";
      }
      *(_DWORD *)__s1 = 136446722;
      uint64_t v206 = v46;
      __int16 v207 = 2080;
      v208 = v5;
      __int16 v209 = 1024;
      int v210 = v18;
      int v22 = &_os_log_default;
      uint64_t v20 = 2LL;
    }

    int v47 = (char *)_os_log_send_and_compose_impl(v20, 0LL, 0LL, 0LL, &_mh_execute_header, v22, 16LL);
    int v48 = 134;
    CFIndex v49 = v18;
  }

  else
  {
    int v6 = v4 + 263;
    int v7 = open(v4 + 263, 256);
    LODWORD(v18snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v7;
    if (v7 < 0)
    {
      int v23 = *__error();
      CFIndex v9 = v23;
      uint64_t v24 = *(void **)(v2 + 72);
      if (v24)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v25 = 3LL;
        }
        else {
          uint64_t v25 = 2LL;
        }
        int v26 = *(const char **)(v2 + 56);
        *(_DWORD *)__s1 = 136446722;
        if (!v26) {
          int v26 = "[anonymous]";
        }
        uint64_t v206 = v26;
        __int16 v207 = 2080;
        v208 = v6;
        __int16 v209 = 1024;
        int v210 = v23;
        xpc_connection_t v27 = v24;
      }

      else
      {
        int v55 = *(const char **)(v2 + 56);
        if (!v55) {
          int v55 = "[anonymous]";
        }
        *(_DWORD *)__s1 = 136446722;
        uint64_t v206 = v55;
        __int16 v207 = 2080;
        v208 = v6;
        __int16 v209 = 1024;
        int v210 = v23;
        xpc_connection_t v27 = &_os_log_default;
        uint64_t v25 = 2LL;
      }

      int v53 = (char *)_os_log_send_and_compose_impl(v25, 0LL, 0LL, 0LL, &_mh_execute_header, v27, 16LL);
      int v54 = 141;
      goto LABEL_71;
    }

    if (fstat(v7, &v211))
    {
      int v8 = *__error();
      CFIndex v9 = v8;
      uint64_t v10 = *(void **)(v2 + 72);
      if (v10)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v11 = 3LL;
        }
        else {
          uint64_t v11 = 2LL;
        }
        __int128 v12 = *(const char **)(v2 + 56);
        *(_DWORD *)__s1 = 136446722;
        if (!v12) {
          __int128 v12 = "[anonymous]";
        }
        uint64_t v206 = v12;
        __int16 v207 = 2080;
        v208 = v6;
        __int16 v209 = 1024;
        int v210 = v8;
        __int128 v13 = v10;
      }

      else
      {
        __int16 v52 = *(const char **)(v2 + 56);
        if (!v52) {
          __int16 v52 = "[anonymous]";
        }
        *(_DWORD *)__s1 = 136446722;
        uint64_t v206 = v52;
        __int16 v207 = 2080;
        v208 = v6;
        __int16 v209 = 1024;
        int v210 = v8;
        __int128 v13 = &_os_log_default;
        uint64_t v11 = 2LL;
      }

      int v53 = (char *)_os_log_send_and_compose_impl(v11, 0LL, 0LL, 0LL, &_mh_execute_header, v13, 16LL);
      int v54 = 148;
LABEL_71:
      CFErrorRef v50 = sub_10000A444("_quire_mount_forerunner", "quire.c", v54, "com.apple.security.cryptex.posix", v9, 0LL, v53);
      int v51 = v53;
      goto LABEL_72;
    }

    if ((v211.st_mode & 0xF000) == 0x6000)
    {
      *(_DWORD *)(v2 + 404) = sub_10003A9F4(&v189);
      *(_DWORD *)(v2 + 400) = sub_10003A9F4(buf);
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          uint64_t v39 = strdup(v4 + 2311);
          if (v39) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }

      else
      {
        uint64_t v39 = strdup(v4 + 2311);
        if (!v39) {
          sub_1000408AC();
        }
      }

      *(void *)(v2 + 416) = v39;
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          __int128 v91 = strdup(v4 + 1287);
          if (v91) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }

      else
      {
        __int128 v91 = strdup(v4 + 1287);
        if (!v91) {
          sub_1000408AC();
        }
      }

      *(void *)(v2 + 432) = v91;
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          __int128 v92 = strdup(v4 + 263);
          if (v92) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }

      else
      {
        __int128 v92 = strdup(v4 + 263);
        if (!v92) {
          sub_1000408AC();
        }
      }

      CFErrorRef v50 = 0LL;
      *(void *)(v2 + 424) = v92;
      *(void *)(v2 + 176) |= 1uLL;
      goto LABEL_73;
    }

    __int128 v81 = *(void **)(v2 + 72);
    if (v81)
    {
      BOOL v82 = os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      __int128 v83 = *(const char **)(v2 + 56);
      if (v82) {
        uint64_t v84 = 3LL;
      }
      else {
        uint64_t v84 = 2LL;
      }
      *(_DWORD *)__s1 = 136446722;
      if (v83) {
        __int128 v85 = v83;
      }
      else {
        __int128 v85 = "[anonymous]";
      }
      uint64_t v206 = v85;
      __int16 v207 = 2080;
      v208 = v4 + 263;
      __int16 v209 = 1024;
      int v210 = 19;
      __int128 v86 = v81;
    }

    else
    {
      __int128 v93 = "[anonymous]";
      if (*(void *)(v2 + 56)) {
        __int128 v93 = *(const char **)(v2 + 56);
      }
      *(_DWORD *)__s1 = 136446722;
      uint64_t v206 = v93;
      __int16 v207 = 2080;
      v208 = v4 + 263;
      __int16 v209 = 1024;
      int v210 = 19;
      __int128 v86 = &_os_log_default;
      uint64_t v84 = 2LL;
    }

    int v47 = (char *)_os_log_send_and_compose_impl(v84, 0LL, 0LL, 0LL, &_mh_execute_header, v86, 16LL);
    int v48 = 155;
    CFIndex v49 = 19LL;
  }

  CFErrorRef v50 = sub_10000A444("_quire_mount_forerunner", "quire.c", v48, "com.apple.security.cryptex.posix", v49, 0LL, v47);
  int v51 = v47;
LABEL_72:
  free(v51);
LABEL_73:
  free(*(void **)(v2 + 240));
  *(void *)(v2 + 240) = 0LL;
  if (v50) {
    CFTypeRef v56 = CFRetain(v50);
  }
  else {
    CFTypeRef v56 = 0LL;
  }
  *(void *)(v2 + 40_Block_object_dispose(va, 8) = v56;
  if ((_DWORD)v189 != -1 && close(v189) == -1) {
    sub_100040A90(__s1, &v211);
  }
  if (v50)
  {
    int v57 = *(void **)(v2 + 72);
    if (v57)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v58 = 3LL;
      }
      else {
        uint64_t v58 = 2LL;
      }
      int v59 = *(const char **)(v2 + 56);
      if (!v59) {
        int v59 = "[anonymous]";
      }
      v211.st_dev = 136446210;
      *(void *)&v211.st_mode = v59;
      id v60 = v57;
    }

    else
    {
      pid_t v67 = *(const char **)(v2 + 56);
      if (!v67) {
        pid_t v67 = "[anonymous]";
      }
      v211.st_dev = 136446210;
      *(void *)&v211.st_mode = v67;
      id v60 = &_os_log_default;
      uint64_t v58 = 2LL;
    }

    id v68 = (char *)_os_log_send_and_compose_impl(v58, 0LL, 0LL, 0LL, &_mh_execute_header, v60, 16LL);
    int v69 = 561;
LABEL_100:
    CFErrorRef v70 = sub_10000A444("_quire_mount_continue", "quire.c", v69, "com.apple.security.cryptex", 2LL, v50, v68);
    free(v68);
    a1[2] = (uint64_t)v70;
    cryptex_target_async_f(v2, a1, sub_100030EF4);
    CFRelease(v50);
    goto LABEL_108;
  }

  int v61 = sub_10001EB74((void *)v2);
  if (v61)
  {
    int v62 = v61;
    int v63 = *(void **)(v2 + 72);
    if (v63)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v64 = 3LL;
      }
      else {
        uint64_t v64 = 2LL;
      }
      pid_t v65 = *(const char **)(v2 + 56);
      if (!v65) {
        pid_t v65 = "[anonymous]";
      }
      v211.st_dev = 136446466;
      *(void *)&v211.st_mode = v65;
      WORD2(v211.st_ino) = 1024;
      *(_DWORD *)((char *)&v211.st_ino + 6) = v62;
      uint64_t v66 = v63;
    }

    else
    {
      __int16 v72 = *(const char **)(v2 + 56);
      if (!v72) {
        __int16 v72 = "[anonymous]";
      }
      v211.st_dev = 136446466;
      *(void *)&v211.st_mode = v72;
      WORD2(v211.st_ino) = 1024;
      *(_DWORD *)((char *)&v211.st_ino + 6) = v61;
      uint64_t v66 = &_os_log_default;
      uint64_t v64 = 2LL;
    }

    uint64_t v73 = (char *)_os_log_send_and_compose_impl(v64, 0LL, 0LL, 0LL, &_mh_execute_header, v66, 16LL);
    CFErrorRef v71 = sub_10000A444("_quire_mount_continue", "quire.c", 567, "com.apple.security.cryptex.posix", v62, 0LL, v73);
    free(v73);
  }

  else
  {
    CFErrorRef v71 = 0LL;
  }

  a1[2] = (uint64_t)v71;
LABEL_107:
  cryptex_target_async_f(v2, a1, sub_100030EF4);
LABEL_108:
  uint64_t result = v186;
  if (v186 != -1)
  {
    uint64_t result = close(v186);
    if ((_DWORD)result == -1) {
      sub_100040A90(__s1, &v211);
    }
  }

  return result;
}

void sub_10002D87C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  if ((~(_BYTE)a3 & 6) != 0)
  {
    __int128 v14 = sub_10003C818((void *)a1, 0x50uLL);
    v14[7] = a4;
    v14[8] = a5;
    *((_DWORD *)v14 + 10) = a2;
    uint64_t v15 = calloc(1uLL, 0x400uLL);
    if (!v15) {
      sub_100040B18(&v19, v20);
    }
    v14[6] = v15;
    v14[9] = a3;
    cryptex_async_f(a1, v14, sub_10002DADC);
  }

  else
  {
    int v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      CFIndex v9 = *(const char **)(a1 + 56);
      if (!v9) {
        CFIndex v9 = "[anonymous]";
      }
      LODWORD(v20[0]) = 136446210;
      *(void *)((char *)v20 + 4) = v9;
      uint64_t v10 = v7;
    }

    else
    {
      __int128 v16 = *(const char **)(a1 + 56);
      if (!v16) {
        __int128 v16 = "[anonymous]";
      }
      LODWORD(v20[0]) = 136446210;
      *(void *)((char *)v20 + 4) = v16;
      uint64_t v10 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    __int128 v17 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    CFErrorRef v18 = sub_10000A444("quire_bootstrap", "quire.c", 2894, "com.apple.security.cryptex", 11LL, 0LL, v17);
    free(v17);
    if (v18)
    {
      MEMORY[0x10] = CFRetain(v18);
      cryptex_target_async_f(a1, 0LL, sub_10002F3C0);
      CFRelease(v18);
    }
  }

void sub_10002DADC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[9];
  info_uint64_t asset = cryptex_core_get_info_asset(*(void *)(*a1 + 200));
  if ((*(_BYTE *)(*(void *)(v2 + 200) + 40LL) & 1) != 0 || (*(_BYTE *)(v2 + 176) & 4) == 0) {
    goto LABEL_3;
  }
  uint64_t v14 = info_asset;
  uint64_t v15 = *(const char **)(v2 + 56);
  int v16 = *__error();
  __int128 v17 = *(os_log_s **)(v2 + 72);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    CFErrorRef v18 = "[anonymous]";
    if (v15) {
      CFErrorRef v18 = v15;
    }
    *(_DWORD *)int buf = 136446210;
    *(void *)&uint8_t buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: locking signature digest", buf, 0xCu);
  }

  *__error() = v16;
  if (v14) {
    uint64_t v19 = *(unsigned int *)(v14 + 16);
  }
  else {
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  uint64_t v26 = cryptex_signature_lock(*(void *)(*(void *)(v2 + 200) + 160LL), v19);
  if (v26)
  {
    CFErrorRef v21 = (CFErrorRef)v26;
    xpc_connection_t v27 = *(void **)(v2 + 72);
    if (v27)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v28 = 3LL;
      }
      else {
        uint64_t v28 = 2LL;
      }
      int v29 = *(const char **)(v2 + 56);
      if (!v29) {
        int v29 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446210;
      *(void *)&uint8_t buf[4] = v29;
      __int16 v30 = v27;
    }

    else
    {
      __int16 v52 = *(const char **)(v2 + 56);
      if (!v52) {
        __int16 v52 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446210;
      *(void *)&uint8_t buf[4] = v52;
      __int16 v30 = &_os_log_default;
      uint64_t v28 = 2LL;
    }

    int v53 = (char *)_os_log_send_and_compose_impl(v28, 0LL, 0LL, 0LL, &_mh_execute_header, v30, 16LL);
    int v54 = 2310;
LABEL_71:
    CFIndex v55 = 36LL;
    goto LABEL_248;
  }

  uint64_t v31 = *(void *)(v2 + 200);
  if ((*(_BYTE *)(v31 + 40) & 1) == 0)
  {
    uint64_t v32 = *(void *)(v31 + 168);
    if (!v32 || (*(_BYTE *)(v32 + 40) & 1) == 0)
    {
      uint64_t v33 = v14 ? *(unsigned int *)(v14 + 16) : 0xFFFFFFFFLL;
      uint64_t v83 = cryptex_signature_lock_with_sep(*(void *)(v31 + 160), v33);
      if (v83)
      {
        CFErrorRef v21 = (CFErrorRef)v83;
        uint64_t v84 = *(void **)(v2 + 72);
        if (v84)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v85 = 3LL;
          }
          else {
            uint64_t v85 = 2LL;
          }
          __int128 v86 = *(const char **)(v2 + 56);
          if (!v86) {
            __int128 v86 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          *(void *)&uint8_t buf[4] = v86;
          __int128 v87 = v84;
        }

        else
        {
          __int128 v91 = *(const char **)(v2 + 56);
          if (!v91) {
            __int128 v91 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          *(void *)&uint8_t buf[4] = v91;
          __int128 v87 = &_os_log_default;
          uint64_t v85 = 2LL;
        }

        int v53 = (char *)_os_log_send_and_compose_impl(v85, 0LL, 0LL, 0LL, &_mh_execute_header, v87, 16LL);
        int v54 = 2320;
        goto LABEL_71;
      }
    }
  }

LABEL_3:
  if ((v3 & 2) != 0 || *(_BYTE *)(v2 + 353) || (uint64_t v20 = sub_100030F68(v2, a1)) == 0LL)
  {
    if ((v3 & 4) != 0 || (*(_BYTE *)(v2 + 176) & 0x10) != 0) {
      goto LABEL_243;
    }
    uint64_t v5 = *(void *)(v2 + 320);
    int v6 = *(const char **)(v2 + 56);
    int v7 = *__error();
    uint64_t v8 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFIndex v9 = "[anonymous]";
      if (v6) {
        CFIndex v9 = v6;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%{public}s: bootstrap contents bitmap before consolidating: 0x%04llX",  buf,  0x16u);
    }

    *__error() = v7;
    uint64_t v10 = _cryptex_content_type_jetsam_properties[2];
    uint64_t v11 = _cryptex_content_type_log_profile[2];
    uint64_t v12 = _cryptex_content_type_service[2] | v5 | v10 | _cryptex_content_type_feature_flags[2];
    uint64_t v153 = _cryptex_content_type_service[2];
    uint64_t v154 = v11;
    uint64_t v155 = _cryptex_content_type_feature_flags[2];
    if (*(_DWORD *)(v2 + 188)) {
      uint64_t v13 = v12 & ~(_cryptex_content_type_library[2] | _cryptex_content_type_executable[2] | _cryptex_content_type_factory[2] | v11);
    }
    else {
      uint64_t v13 = v12 | v11;
    }
    if (*(_BYTE *)(v2 + 353))
    {
      int v34 = *(const char **)(v2 + 56);
      int v35 = *__error();
      uint64_t v36 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = "[anonymous]";
        if (v34) {
          uint64_t v37 = v34;
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}s: No-code cryptex will not bootstrap any contents.",  buf,  0xCu);
      }

      uint64_t v13 = 0LL;
      *__error() = v35;
    }

    __int16 v38 = *(const char **)(v2 + 56);
    int v39 = *__error();
    __int16 v40 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = "[anonymous]";
      if (v38) {
        uint64_t v41 = v38;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "%{public}s: bootstrap contents bitmap after consolidating: 0x%04llX",  buf,  0x16u);
    }

    *__error() = v39;
    *(void *)(v2 + 320) = v13;
    if ((v13 & v10) != 0)
    {
      if (!*(void *)(v2 + 416)) {
        sub_100040C40(v159, buf);
      }
      int mounted_jetsam_properties = launch_load_mounted_jetsam_properties();
      if (mounted_jetsam_properties)
      {
        int v43 = mounted_jetsam_properties;
        CFIndex v44 = *(const char **)(v2 + 56);
        int v45 = *__error();
        __int16 v46 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          int v47 = "[anonymous]";
          if (v44) {
            int v47 = v44;
          }
          *(_DWORD *)int buf = 136446466;
          *(void *)&uint8_t buf[4] = v47;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to launch_load_mounted_jetsam_properties: %{darwin.errno}d",  buf,  0x12u);
        }

        *__error() = v45;
        int v48 = *(void **)(v2 + 72);
        if (v48)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v49 = 3LL;
          }
          else {
            uint64_t v49 = 2LL;
          }
          CFErrorRef v50 = *(const char **)(v2 + 56);
          if (!v50) {
            CFErrorRef v50 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446466;
          *(void *)&uint8_t buf[4] = v50;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v43;
          int v51 = v48;
        }

        else
        {
          int v75 = *(const char **)(v2 + 56);
          if (!v75) {
            int v75 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446466;
          *(void *)&uint8_t buf[4] = v75;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v43;
          int v51 = &_os_log_default;
          uint64_t v49 = 2LL;
        }

        int v76 = (char *)_os_log_send_and_compose_impl(v49, 0LL, 0LL, 0LL, &_mh_execute_header, v51, 16LL);
        CFIndex v77 = v43;
        int v78 = 2211;
        goto LABEL_185;
      }

      uint64_t v13 = *(void *)(v2 + 320);
    }

    if ((_cryptex_content_type_library[2] & v13) != 0)
    {
      v160 = 0LL;
      object = 0LL;
      uint64_t v157 = 0LL;
      *(void *)int buf = &v160;
      *(void *)&uint8_t buf[8] = &v157;
      *(void *)&uint8_t buf[16] = &object;
      v160 = (uint64_t *)sub_10000999C((uint64_t)&unk_1000554C8, *(unsigned int *)(v2 + 400), 0LL);
      uint64_t v157 = (void *)sub_10000999C((uint64_t)&unk_100055468, *(unsigned int *)(v2 + 400), 0LL);
      object = (void *)sub_10000999C((uint64_t)&unk_100055498, *(unsigned int *)(v2 + 400), 0LL);
      CFTypeRef v56 = *(const char **)(v2 + 56);
      int v57 = *__error();
      uint64_t v58 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        int v59 = "[anonymous]";
        if (v56) {
          int v59 = v56;
        }
        *(_DWORD *)uint64_t v159 = 136446210;
        *(void *)&v159[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%{public}s: iterating libraries", v159, 0xCu);
      }

      *__error() = v57;
      sub_1000319F4( v2,  (uint64_t)a1,  (uint64_t)&unk_100056E78,  (uint64_t **)buf,  3LL,  (void (*)(uint64_t, void *, uint64_t))sub_100031C04);
      sub_1000319F4( v2,  (uint64_t)a1,  (uint64_t)&unk_100056ED8,  (uint64_t **)buf,  3LL,  (void (*)(uint64_t, void *, uint64_t))sub_100031C04);
      sub_1000319F4( v2,  (uint64_t)a1,  (uint64_t)&unk_100056EF0,  (uint64_t **)buf,  3LL,  (void (*)(uint64_t, void *, uint64_t))sub_100031C04);
      if (object) {
        os_release(object);
      }
      if (v157) {
        os_release(v157);
      }
      if (v160) {
        os_release(v160);
      }
      uint64_t v13 = *(void *)(v2 + 320);
    }

    if ((_cryptex_content_type_executable[2] & v13) != 0)
    {
      v160 = 0LL;
      object = 0LL;
      uint64_t v157 = 0LL;
      *(void *)int buf = &v160;
      *(void *)&uint8_t buf[8] = &v157;
      *(void *)&uint8_t buf[16] = &object;
      v160 = (uint64_t *)sub_10000999C((uint64_t)&unk_1000554C8, *(unsigned int *)(v2 + 400), 0LL);
      uint64_t v157 = (void *)sub_10000999C((uint64_t)&unk_100055468, *(unsigned int *)(v2 + 400), 0LL);
      object = (void *)sub_10000999C((uint64_t)&unk_100055498, *(unsigned int *)(v2 + 400), 0LL);
      id v60 = *(const char **)(v2 + 56);
      int v61 = *__error();
      int v62 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        int v63 = "[anonymous]";
        if (v60) {
          int v63 = v60;
        }
        *(_DWORD *)uint64_t v159 = 136446210;
        *(void *)&v159[4] = v63;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%{public}s: iterating binaries", v159, 0xCu);
      }

      *__error() = v61;
      sub_1000319F4( v2,  (uint64_t)a1,  (uint64_t)&unk_100056E90,  (uint64_t **)buf,  3LL,  (void (*)(uint64_t, void *, uint64_t))sub_100031F40);
      if (object) {
        os_release(object);
      }
      if (v157) {
        os_release(v157);
      }
      if (v160) {
        os_release(v160);
      }
      uint64_t v13 = *(void *)(v2 + 320);
    }

    if ((_cryptex_content_type_factory[2] & v13) == 0)
    {
LABEL_156:
      if ((v13 & v154) != 0)
      {
        v160 = 0LL;
        uint64_t v157 = 0LL;
        *(void *)int buf = &v160;
        *(void *)&uint8_t buf[8] = &v157;
        v160 = (uint64_t *)sub_10000999C((uint64_t)&unk_1000554C8, *(unsigned int *)(v2 + 400), 0LL);
        uint64_t v157 = (void *)sub_10000999C((uint64_t)&unk_100055498, *(unsigned int *)(v2 + 400), 0LL);
        __int128 v99 = *(const char **)(v2 + 56);
        int v100 = *__error();
        __int128 v101 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v102 = "[anonymous]";
          if (v99) {
            uint64_t v102 = v99;
          }
          *(_DWORD *)uint64_t v159 = 136446210;
          *(void *)&v159[4] = v102;
          _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEBUG,  "%{public}s: iterating log_profiles",  v159,  0xCu);
        }

        *__error() = v100;
        sub_1000319F4( v2,  (uint64_t)a1,  (uint64_t)&unk_100056F08,  (uint64_t **)buf,  2LL,  (void (*)(uint64_t, void *, uint64_t))sub_100033A98);
        if (v157) {
          os_release(v157);
        }
        if (v160) {
          os_release(v160);
        }
        uint64_t v13 = *(void *)(v2 + 320);
      }

      if ((v13 & v155) != 0)
      {
        *(void *)uint64_t v159 = 0LL;
        v160 = (uint64_t *)v159;
        *(void *)uint64_t v159 = sub_10000999C((uint64_t)&unk_1000554C8, *(unsigned int *)(v2 + 400), 0LL);
        __int128 v103 = *(const char **)(v2 + 56);
        int v104 = *__error();
        uint64_t v105 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v106 = "[anonymous]";
          if (v103) {
            uint64_t v106 = v103;
          }
          *(_DWORD *)int buf = 136446210;
          *(void *)&uint8_t buf[4] = v106;
          _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEBUG,  "%{public}s: iterating feature_flag_domains",  buf,  0xCu);
        }

        *__error() = v104;
        uint64_t v107 = (const void *)sub_1000319F4( v2,  (uint64_t)a1,  (uint64_t)&unk_100056F50,  &v160,  1LL,  (void (*)(uint64_t, void *, uint64_t))sub_100033DF0);
        if (*(void *)v159) {
          os_release(*(void **)v159);
        }
        if (v107)
        {
          __int128 v108 = *(void **)(v2 + 72);
          if (v108)
          {
            if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
              uint64_t v109 = 3LL;
            }
            else {
              uint64_t v109 = 2LL;
            }
            __int128 v110 = *(const char **)(v2 + 56);
            if (!v110) {
              __int128 v110 = "[anonymous]";
            }
            *(_DWORD *)int buf = 136446210;
            *(void *)&uint8_t buf[4] = v110;
            __int128 v111 = v108;
          }

          else
          {
            pid_t v132 = *(const char **)(v2 + 56);
            if (!v132) {
              pid_t v132 = "[anonymous]";
            }
            *(_DWORD *)int buf = 136446210;
            *(void *)&uint8_t buf[4] = v132;
            __int128 v111 = &_os_log_default;
            uint64_t v109 = 2LL;
          }

          uint64_t v133 = (char *)_os_log_send_and_compose_impl(v109, 0LL, 0LL, 0LL, &_mh_execute_header, v111, 16LL);
          int v134 = 2249;
          goto LABEL_235;
        }

        uint64_t v13 = *(void *)(v2 + 320);
      }

      if ((v13 & v153) == 0) {
        goto LABEL_243;
      }
      v160 = 0LL;
      object = 0LL;
      uint64_t v157 = 0LL;
      *(void *)int buf = &v160;
      *(void *)&uint8_t buf[8] = &v157;
      *(void *)&uint8_t buf[16] = &object;
      v160 = (uint64_t *)sub_10000999C((uint64_t)&unk_1000554C8, *(unsigned int *)(v2 + 400), 0LL);
      uint64_t v157 = (void *)sub_10000999C((uint64_t)&unk_100055468, *(unsigned int *)(v2 + 400), 0LL);
      object = (void *)sub_10000999C((uint64_t)&unk_100055498, *(unsigned int *)(v2 + 400), 0LL);
      uint64_t v107 = sub_100034148(v2, 1LL);
      if (!v107)
      {
        __int128 v119 = *(const char **)(v2 + 56);
        int v120 = *__error();
        int v121 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v122 = "[anonymous]";
          if (v119) {
            uint64_t v122 = v119;
          }
          *(_DWORD *)uint64_t v159 = 136446210;
          *(void *)&v159[4] = v122;
          _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEBUG,  "%{public}s: iterating launch agents",  v159,  0xCu);
        }

        *__error() = v120;
        uint64_t v107 = (const void *)sub_1000099FC( (uint64_t)v160,  (uint64_t)&unk_100056EC0,  (uint64_t)a1,  (void (*)(uint64_t, void *, uint64_t))sub_1000343F0,  0);
        if (v107) {
          goto LABEL_211;
        }
        int v123 = *(const char **)(v2 + 56);
        int v124 = *__error();
        int v125 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
        {
          pid_t v126 = "[anonymous]";
          if (v123) {
            pid_t v126 = v123;
          }
          *(_DWORD *)uint64_t v159 = 136446210;
          *(void *)&v159[4] = v126;
          _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEBUG,  "%{public}s: iterating services",  v159,  0xCu);
        }

        *__error() = v124;
        uint64_t v107 = (const void *)sub_1000319F4( v2,  (uint64_t)a1,  (uint64_t)&unk_100056EA8,  (uint64_t **)buf,  3LL,  (void (*)(uint64_t, void *, uint64_t))sub_1000348D0);
        if (v107 || (uint64_t v107 = sub_100034148(v2, 0LL)) != 0LL)
        {
LABEL_211:
          CFTypeRef v127 = sub_100034148(v2, 0LL);
          if (v127) {
            CFRelease(v127);
          }
          goto LABEL_213;
        }

        int v143 = sub_100034E78(v2);
        if (!v143)
        {
LABEL_259:
          uint64_t v148 = v2 + 448;
          while (1)
          {
            uint64_t v148 = *(void *)v148;
            if (!v148) {
              break;
            }
            if (*(_BYTE *)(v148 + 1160))
            {
              CFTypeRef v149 = *(const char **)(v2 + 56);
              int v150 = *__error();
              uint64_t v151 = *(os_log_s **)(v2 + 72);
              if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
              {
                pid_t v152 = "[anonymous]";
                if (v149) {
                  pid_t v152 = v149;
                }
                *(_DWORD *)uint64_t v159 = 136446210;
                *(void *)&v159[4] = v152;
                _os_log_impl( (void *)&_mh_execute_header,  v151,  OS_LOG_TYPE_DEBUG,  "%{public}s: resetting remote devices for added remote services",  v159,  0xCu);
              }

              *__error() = v150;
              sub_100035594(v2);
              break;
            }
          }

          uint64_t v107 = 0LL;
          goto LABEL_213;
        }

        uint64_t v107 = v143;
        if (sub_10000A6D8(v143, @"com.apple.security.cryptex", 10LL))
        {
          id v144 = *(const char **)(v2 + 56);
          int v145 = *__error();
          pid_t v146 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
          {
            id v147 = "[anonymous]";
            if (v144) {
              id v147 = v144;
            }
            *(_DWORD *)uint64_t v159 = 136446210;
            *(void *)&v159[4] = v147;
            _os_log_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_INFO,  "%{public}s: Watchdog registration not supported on this device. Skipping.",  v159,  0xCu);
          }

          *__error() = v145;
          CFRelease(v107);
          goto LABEL_259;
        }
      }

LABEL_213:
      if (object) {
        os_release(object);
      }
      if (v157) {
        os_release(v157);
      }
      if (v160) {
        os_release(v160);
      }
      if (!v107) {
        goto LABEL_243;
      }
      id v128 = *(void **)(v2 + 72);
      if (v128)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v129 = 3LL;
        }
        else {
          uint64_t v129 = 2LL;
        }
        int v130 = *(const char **)(v2 + 56);
        if (!v130) {
          int v130 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&uint8_t buf[4] = v130;
        int v131 = v128;
      }

      else
      {
        __int128 v135 = *(const char **)(v2 + 56);
        if (!v135) {
          __int128 v135 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&uint8_t buf[4] = v135;
        int v131 = &_os_log_default;
        uint64_t v129 = 2LL;
      }

      uint64_t v133 = (char *)_os_log_send_and_compose_impl(v129, 0LL, 0LL, 0LL, &_mh_execute_header, v131, 16LL);
      int v134 = 2261;
LABEL_235:
      CFErrorRef v21 = sub_10000A444("_quire_bootstrap_contents", "quire.c", v134, "com.apple.security.cryptex", 14LL, v107, v133);
      free(v133);
      CFRelease(v107);
      if (v21) {
        goto LABEL_236;
      }
LABEL_243:
      cryptex_async_f(v2, a1, sub_10003163C);
      return;
    }

    uint64_t v64 = (void *)sub_10000999C((uint64_t)&unk_1000554F8, *(unsigned int *)(v2 + 400), 0LL);
    pid_t v65 = *(const char **)(v2 + 56);
    int v66 = *__error();
    pid_t v67 = *(os_log_s **)(v2 + 72);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    {
      id v68 = "[anonymous]";
      if (v65) {
        id v68 = v65;
      }
      *(_DWORD *)int buf = 136446210;
      *(void *)&uint8_t buf[4] = v68;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEBUG,  "%{public}s: iterating factory content",  buf,  0xCu);
    }

    *__error() = v66;
    sub_1000099FC( (uint64_t)v64,  (uint64_t)&unk_100056F20,  (uint64_t)a1,  (void (*)(uint64_t, void *, uint64_t))sub_1000322D4,  1);
    int v69 = *((_DWORD *)a1 + 2);
    if (v69)
    {
      CFErrorRef v70 = *(const char **)(v2 + 56);
      int v71 = *__error();
      __int16 v72 = *(os_log_s **)(v2 + 72);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        uint64_t v73 = "[anonymous]";
        if (v70) {
          uint64_t v73 = v70;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&uint8_t buf[4] = v73;
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = v69;
        __int16 v74 = "%{public}s: failed to bootstrap diags: %{darwin.errno}d";
LABEL_143:
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, v74, buf, 0x12u);
      }
    }

    else
    {
      sub_1000099FC( (uint64_t)v64,  (uint64_t)&unk_100056F38,  (uint64_t)a1,  (void (*)(uint64_t, void *, uint64_t))sub_100032FEC,  1);
      int v79 = *((_DWORD *)a1 + 2);
      if (v79)
      {
        __int128 v80 = *(const char **)(v2 + 56);
        int v71 = *__error();
        __int16 v72 = *(os_log_s **)(v2 + 72);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          __int128 v81 = "[anonymous]";
          if (v80) {
            __int128 v81 = v80;
          }
          *(_DWORD *)int buf = 136446466;
          *(void *)&uint8_t buf[4] = v81;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = v79;
          __int16 v74 = "%{public}s: failed to bootstrap luacore libraries: %{darwin.errno}d";
          goto LABEL_143;
        }
      }

      else
      {
        sub_1000099FC( (uint64_t)v64,  (uint64_t)&unk_100056F68,  (uint64_t)a1,  (void (*)(uint64_t, void *, uint64_t))sub_1000333A4,  1);
        int v88 = *((_DWORD *)a1 + 2);
        if (v88)
        {
          __int128 v89 = *(const char **)(v2 + 56);
          int v71 = *__error();
          __int16 v72 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            __int128 v90 = "[anonymous]";
            if (v89) {
              __int128 v90 = v89;
            }
            *(_DWORD *)int buf = 136446466;
            *(void *)&uint8_t buf[4] = v90;
            *(_WORD *)&_BYTE buf[12] = 1024;
            *(_DWORD *)&buf[14] = v88;
            __int16 v74 = "%{public}s: failed to bootstrap python libraries: %{darwin.errno}d";
            goto LABEL_143;
          }
        }

        else
        {
          sub_1000099FC( (uint64_t)v64,  (uint64_t)&unk_100056F80,  (uint64_t)a1,  (void (*)(uint64_t, void *, uint64_t))sub_1000336E0,  1);
          int v92 = *((_DWORD *)a1 + 2);
          if (!v92)
          {
LABEL_145:
            if (v64) {
              os_release(v64);
            }
            int v43 = *((_DWORD *)a1 + 2);
            if (v43)
            {
              char v95 = *(void **)(v2 + 72);
              if (v95)
              {
                if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
                  uint64_t v96 = 3LL;
                }
                else {
                  uint64_t v96 = 2LL;
                }
                __int128 v97 = *(const char **)(v2 + 56);
                if (!v97) {
                  __int128 v97 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446466;
                *(void *)&uint8_t buf[4] = v97;
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = v43;
                uint64_t v98 = v95;
              }

              else
              {
                uint64_t v112 = *(const char **)(v2 + 56);
                if (!v112) {
                  uint64_t v112 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446466;
                *(void *)&uint8_t buf[4] = v112;
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = v43;
                uint64_t v98 = &_os_log_default;
                uint64_t v96 = 2LL;
              }

              int v76 = (char *)_os_log_send_and_compose_impl(v96, 0LL, 0LL, 0LL, &_mh_execute_header, v98, 16LL);
              int v78 = 2232;
              CFIndex v77 = v43;
LABEL_185:
              sub_10000A444( "_quire_bootstrap_contents",  "quire.c",  v78,  "com.apple.security.cryptex.posix",  v77,  0LL,  v76);
              free(v76);
              __int128 v113 = *(void **)(v2 + 72);
              if (v113)
              {
                if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
                  uint64_t v114 = 3LL;
                }
                else {
                  uint64_t v114 = 2LL;
                }
                __int128 v115 = *(const char **)(v2 + 56);
                if (!v115) {
                  __int128 v115 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446466;
                *(void *)&uint8_t buf[4] = v115;
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = v43;
                __int128 v116 = v113;
              }

              else
              {
                __int128 v117 = *(const char **)(v2 + 56);
                if (!v117) {
                  __int128 v117 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446466;
                *(void *)&uint8_t buf[4] = v117;
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = v43;
                __int128 v116 = &_os_log_default;
                uint64_t v114 = 2LL;
              }

              __int128 v118 = (char *)_os_log_send_and_compose_impl(v114, 0LL, 0LL, 0LL, &_mh_execute_header, v116, 16LL);
              CFErrorRef v21 = sub_10000A444( "_quire_bootstrap_contents",  "quire.c",  2280,  "com.apple.security.cryptex.posix",  v43,  0LL,  v118);
              free(v118);
              if (!v21) {
                goto LABEL_243;
              }
LABEL_236:
              CFErrorRef v136 = *(void **)(v2 + 72);
              if (v136)
              {
                if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
                  uint64_t v137 = 3LL;
                }
                else {
                  uint64_t v137 = 2LL;
                }
                CFIndex v138 = *(const char **)(v2 + 56);
                if (!v138) {
                  CFIndex v138 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446210;
                *(void *)&uint8_t buf[4] = v138;
                pid_t v139 = v136;
              }

              else
              {
                int v140 = *(const char **)(v2 + 56);
                if (!v140) {
                  int v140 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446210;
                *(void *)&uint8_t buf[4] = v140;
                pid_t v139 = &_os_log_default;
                uint64_t v137 = 2LL;
              }

              int v53 = (char *)_os_log_send_and_compose_impl(v137, 0LL, 0LL, 0LL, &_mh_execute_header, v139, 16LL);
              int v54 = 2359;
              CFIndex v55 = 14LL;
              goto LABEL_248;
            }

            uint64_t v13 = *(void *)(v2 + 320);
            goto LABEL_156;
          }

          __int128 v93 = *(const char **)(v2 + 56);
          int v71 = *__error();
          __int16 v72 = *(os_log_s **)(v2 + 72);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            uint64_t v94 = "[anonymous]";
            if (v93) {
              uint64_t v94 = v93;
            }
            *(_DWORD *)int buf = 136446466;
            *(void *)&uint8_t buf[4] = v94;
            *(_WORD *)&_BYTE buf[12] = 1024;
            *(_DWORD *)&buf[14] = v92;
            __int16 v74 = "%{public}s: failed to bootstrap astro content: %{darwin.errno}d";
            goto LABEL_143;
          }
        }
      }
    }

    *__error() = v71;
    goto LABEL_145;
  }

  CFErrorRef v21 = v20;
  if ((sub_10000A6D8(v20, @"com.apple.security.cryptex.posix", 36LL) & 1) != 0)
  {
LABEL_250:
    cryptex_async_f(v2, a1, sub_10003163C);
    CFErrorRef v142 = v21;
    goto LABEL_251;
  }

  int v22 = *(void **)(v2 + 72);
  if (v22)
  {
    if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
      uint64_t v23 = 3LL;
    }
    else {
      uint64_t v23 = 2LL;
    }
    uint64_t v24 = *(const char **)(v2 + 56);
    if (!v24) {
      uint64_t v24 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446210;
    *(void *)&uint8_t buf[4] = v24;
    uint64_t v25 = v22;
  }

  else
  {
    BOOL v82 = *(const char **)(v2 + 56);
    if (!v82) {
      BOOL v82 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446210;
    *(void *)&uint8_t buf[4] = v82;
    uint64_t v25 = &_os_log_default;
    uint64_t v23 = 2LL;
  }

  int v53 = (char *)_os_log_send_and_compose_impl(v23, 0LL, 0LL, 0LL, &_mh_execute_header, v25, 16LL);
  int v54 = 2336;
  CFIndex v55 = 34LL;
LABEL_248:
  CFErrorRef v141 = sub_10000A444("_quire_bootstrap_continue", "quire.c", v54, "com.apple.security.cryptex", v55, v21, v53);
  free(v53);
  if (!v141) {
    goto LABEL_250;
  }
  a1[2] = (uint64_t)CFRetain(v141);
  cryptex_async_f(v2, a1, sub_10003163C);
  CFRelease(v21);
  CFErrorRef v142 = v141;
LABEL_251:
  CFRelease(v142);
}

void sub_10002F3C0(void **a1)
{
  uint64_t v2 = a1[2];
  ((void (*)(void *, void, void *, void *))a1[8])(*a1, 0LL, a1[2], a1[7]);
  free(a1[6]);
  sub_10003C8F0(a1);
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t sub_10002F418(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = sub_10003C818(a1, 0x50uLL);
  v10[7] = a4;
  v10[8] = a5;
  *((_DWORD *)v10 + 10) = a2;
  uint64_t v11 = calloc(1uLL, 0x400uLL);
  if (!v11) {
    sub_100040B18(&v13, v14);
  }
  v10[6] = v11;
  v10[9] = a3;
  return cryptex_async_f(a1, v10, sub_10002F4F0);
}

void sub_10002F4F0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 176);
  if ((v3 & 0x10) != 0 && (a1[9] & 1) == 0)
  {
    uint64_t v4 = *(void **)(v2 + 72);
    if (v4)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v5 = 3LL;
      }
      else {
        uint64_t v5 = 2LL;
      }
      int v6 = v4;
    }

    else
    {
      int v6 = &_os_log_default;
      uint64_t v5 = 2LL;
    }

    uint64_t v13 = (char *)_os_log_send_and_compose_impl(v5, 0LL, 0LL, 0LL, &_mh_execute_header, v6, 16LL);
    int v14 = 2388;
LABEL_27:
    CFIndex v15 = 4LL;
    goto LABEL_28;
  }

  if (*(void *)(v2 + 480))
  {
    int v7 = *(void **)(v2 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      CFIndex v9 = v7;
    }

    else
    {
      CFIndex v9 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    uint64_t v13 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 16LL);
    int v14 = 2397;
    goto LABEL_27;
  }

  if ((v3 & 2) != 0)
  {
    sub_100036214((void *)*a1);
    if (*(void *)(v2 + 448)) {
      sub_100035B40(v2);
    }
    sub_100035E40(v2);
    *(void *)(v2 + 176) &= ~2uLL;
    goto LABEL_30;
  }

  uint64_t v10 = *(void **)(v2 + 72);
  if (v10)
  {
    if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    uint64_t v12 = v10;
  }

  else
  {
    uint64_t v12 = &_os_log_default;
    uint64_t v11 = 2LL;
  }

  uint64_t v13 = (char *)_os_log_send_and_compose_impl(v11, 0LL, 0LL, 0LL, &_mh_execute_header, v12, 16LL);
  int v14 = 2407;
  CFIndex v15 = 18LL;
LABEL_28:
  CFErrorRef v16 = sub_10000A444("_quire_unbootstrap_continue", "quire.c", v14, "com.apple.security.cryptex", v15, 0LL, v13);
  free(v13);
  if (v16)
  {
    a1[2] = (uint64_t)CFRetain(v16);
    cryptex_target_async_f(v2, a1, sub_10002F3C0);
    CFRelease(v16);
    return;
  }

LABEL_30:
  a1[2] = 0LL;
  cryptex_target_async_f(v2, a1, sub_10002F3C0);
}

void **sub_10002F8FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t result = sub_10003C818((void *)a1, 0x50uLL);
  result[4] = a2;
  *((_DWORD *)result + 11) = -1;
  result[7] = a3;
  result[8] = a4;
  if (!*(_DWORD *)(a1 + 184)) {
    return (void **)cryptex_async_f(a1, result, sub_10002F980);
  }
  result[3] = 0LL;
  **(void **)(a1 + 384) = result;
  *(void *)(a1 + 384) = result + 3;
  return result;
}

void sub_10002F980(void *a1)
{
  int v1 = a1;
  uint64_t v2 = a1[4];
  uint64_t v3 = *a1;
  uint64_t v4 = *(const char **)(*a1 + 56LL);
  int v5 = *__error();
  int v6 = *(os_log_s **)(v3 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    *(_DWORD *)int buf = 136446210;
    __int128 v118 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: _quire_unmount_continue called.",  buf,  0xCu);
  }

  *__error() = v5;
  __int128 v110 = (int *)(v3 + 400);
  if ((*(_DWORD *)(v3 + 400) & 0x80000000) != 0)
  {
    uint64_t v31 = *(void **)(v3 + 72);
    if (v31)
    {
      if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v32 = 3LL;
      }
      else {
        uint64_t v32 = 2LL;
      }
      uint64_t v33 = *(const char **)(v3 + 56);
      if (!v33) {
        uint64_t v33 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v118 = v33;
      __int16 v119 = 1024;
      int v120 = 6;
      int v34 = v31;
    }

    else
    {
      int v43 = *(const char **)(v3 + 56);
      if (!v43) {
        int v43 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v118 = v43;
      __int16 v119 = 1024;
      int v120 = 6;
      int v34 = &_os_log_default;
      uint64_t v32 = 2LL;
    }

    __int16 v40 = (char *)_os_log_send_and_compose_impl(v32, 0LL, 0LL, 0LL, &_mh_execute_header, v34, 16LL);
    int v42 = 722;
    CFIndex v41 = 6LL;
  }

  else
  {
    if (*(void *)(v3 + 480)) {
      sub_100040CC8(v111, buf);
    }
    uint64_t v8 = *(void **)(v3 + 472);
    if (v8)
    {
      CFIndex v9 = (void *)(v3 + 472);
      do
      {
        uint64_t v10 = (void *)*v9;
        uint64_t v11 = (void *)(v3 + 472);
        if ((void *)*v9 != v8)
        {
          do
          {
            uint64_t v12 = v10;
            uint64_t v10 = (void *)v10[1];
          }

          while (v10 != v8);
          uint64_t v11 = v12 + 1;
        }

        int v14 = (void *)*v8;
        uint64_t v13 = (void *)v8[1];
        void *v11 = v13;
        v8[1] = -1LL;
        CFIndex v15 = (void *)v14[60];
        if (v15)
        {
          CFErrorRef v16 = v14 + 60;
          __int128 v17 = (void *)v14[60];
          while (*v17 != v3)
          {
            __int128 v17 = (void *)v17[1];
            if (!v17)
            {
              if (!v14) {
                goto LABEL_18;
              }
              goto LABEL_17;
            }
          }

          if (v15 != v17)
          {
            do
            {
              CFErrorRef v18 = v15;
              CFIndex v15 = (void *)v15[1];
            }

            while (v15 != v17);
            CFErrorRef v16 = v18 + 1;
            CFIndex v15 = v17;
          }

          void *v16 = v15[1];
          v17[1] = -1LL;
          os_release((void *)v3);
          free(v17);
          if (v14) {
            goto LABEL_17;
          }
        }

        else
        {
LABEL_17:
          os_release(v14);
        }

LABEL_18:
        free(v8);
        uint64_t v8 = v13;
      }

      while (v13);
    }

    sub_100036214((void *)v3);
    uint64_t v19 = v1[4];
    uint64_t v20 = *(unsigned int *)(v3 + 400);
    bzero(buf, 0x400uLL);
    int v21 = realpath_np(v20, buf);
    if (v21)
    {
      int v22 = v21;
      uint64_t v23 = *(const char **)(v3 + 56);
      int v24 = *__error();
      uint64_t v25 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = "[anonymous]";
        if (v23) {
          uint64_t v26 = v23;
        }
        *(_DWORD *)__int128 v111 = 136446466;
        uint64_t v112 = v26;
        __int16 v113 = 1024;
        LODWORD(v114) = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}s: could not resolve mount point for unmount: %{darwin.errno}d",  v111,  0x12u);
      }

      *__error() = v24;
      goto LABEL_31;
    }

    close_drop_np(v110, 0LL);
    int v35 = *(const char **)(v3 + 56);
    int v36 = *__error();
    uint64_t v37 = *(os_log_s **)(v3 + 72);
    char v108 = v2;
    uint64_t v109 = v1;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      __int16 v38 = "[anonymous]";
      if (v35) {
        __int16 v38 = v35;
      }
      *(_DWORD *)__int128 v111 = 136446466;
      uint64_t v112 = v38;
      __int16 v113 = 2080;
      uint64_t v114 = buf;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}s: unmounting: %s", v111, 0x16u);
    }

    unint64_t v48 = 0LL;
    *__error() = v36;
    while (1)
    {
      BOOL v49 = v48 != 0;
      char v50 = v19 & v49;
      else {
        int v51 = 0;
      }
      int v52 = *__error();
      if (v52 != 16) {
        break;
      }
      int v22 = *__error();
      int v53 = *(const char **)(v3 + 56);
      int v54 = *__error();
      CFIndex v55 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 v111 = 136446722;
        CFTypeRef v56 = "[anonymous]";
        if (v53) {
          CFTypeRef v56 = v53;
        }
        uint64_t v112 = v56;
        __int16 v113 = 2048;
        uint64_t v114 = (uint8_t *)v48;
        __int16 v115 = 2080;
        __int128 v116 = buf;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "%{public}s: mount busy [%lu]: %s",  v111,  0x20u);
      }

      *__error() = v54;
      usleep(0x3E8u);
      if (v22 == 16)
      {
        BOOL v57 = v48++ >= 4;
        if (!v57) {
          continue;
        }
      }

      goto LABEL_97;
    }

    if (v52)
    {
      int v22 = *__error();
      int v63 = *(const char **)(v3 + 56);
      int v64 = *__error();
      pid_t v65 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        if (!v63) {
          int v63 = "[anonymous]";
        }
        int v66 = *__error();
        *(_DWORD *)__int128 v111 = 136446466;
        uint64_t v112 = v63;
        __int16 v113 = 1024;
        LODWORD(v114) = v66;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "%{public}s: unmount: %{darwin.errno}d",  v111,  0x12u);
      }

      *__error() = v64;
LABEL_97:
      LOBYTE(v2) = v108;
      if (v22)
      {
        *__int128 v110 = open((const char *)buf, 1048832);
LABEL_31:
        xpc_connection_t v27 = *(void **)(v3 + 72);
        if (v27)
        {
          if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v28 = 3LL;
          }
          else {
            uint64_t v28 = 2LL;
          }
          int v29 = *(const char **)(v3 + 56);
          if (!v29) {
            int v29 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446466;
          __int128 v118 = v29;
          __int16 v119 = 1024;
          int v120 = v22;
          __int16 v30 = v27;
        }

        else
        {
          int v39 = *(const char **)(v3 + 56);
          if (!v39) {
            int v39 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446466;
          __int128 v118 = v39;
          __int16 v119 = 1024;
          int v120 = v22;
          __int16 v30 = &_os_log_default;
          uint64_t v28 = 2LL;
        }

        __int16 v40 = (char *)_os_log_send_and_compose_impl(v28, 0LL, 0LL, 0LL, &_mh_execute_header, v30, 16LL);
        CFIndex v41 = v22;
        int v42 = 733;
        goto LABEL_57;
      }
    }

    else
    {
      uint64_t v58 = *(const char **)(v3 + 56);
      int v59 = *__error();
      id v60 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        int v61 = (const char *)&unk_100048303;
        int v62 = "[anonymous]";
        if (v58) {
          int v62 = v58;
        }
        if ((v50 & 1) != 0) {
          int v61 = "force ";
        }
        *(_DWORD *)__int128 v111 = 136446466;
        uint64_t v112 = v62;
        __int16 v113 = 2080;
        uint64_t v114 = (uint8_t *)v61;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEBUG,  "%{public}s: %sunmount succeeded",  v111,  0x16u);
      }

      *__error() = v59;
    }

    uint64_t v67 = *(unsigned int *)(v3 + 404);
    if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_DEBUG))
    {
      bzero(buf, 0x400uLL);
      if (!realpath_np(v67, buf))
      {
        id v68 = *(const char **)(v3 + 56);
        int v69 = *__error();
        CFErrorRef v70 = *(os_log_s **)(v3 + 72);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 v111 = 136446722;
          int v71 = "[anonymous]";
          if (v68) {
            int v71 = v68;
          }
          uint64_t v112 = v71;
          __int16 v113 = 2080;
          uint64_t v114 = buf;
          __int16 v115 = 1024;
          LODWORD(v116) = v67;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEBUG,  "%{public}s: detaching: path = %s, fd = %d",  v111,  0x1Cu);
        }

        *__error() = v69;
      }
    }

    unint64_t v72 = 0LL;
    while (1)
    {
      if ((ioctl(v67, 0x20006415uLL, 0LL) & 0x80000000) == 0) {
        *__error() = 0;
      }
      int v73 = *__error();
      if (v73 != 16) {
        break;
      }
      int v74 = *__error();
      int v75 = *(const char **)(v3 + 56);
      int v76 = *__error();
      CFIndex v77 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        int v78 = "[anonymous]";
        if (v75) {
          int v78 = v75;
        }
        *(_DWORD *)int buf = 136446210;
        __int128 v118 = v78;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%{public}s: device busy", buf, 0xCu);
      }

      *__error() = v76;
      usleep(0x3E8u);
      uint64_t v79 = 0LL;
      if (v74 == 16)
      {
        BOOL v57 = v72++ >= 4;
        if (!v57) {
          continue;
        }
      }

      goto LABEL_124;
    }

    if (v73)
    {
      int v74 = *__error();
      int v92 = *(const char **)(v3 + 56);
      int v93 = *__error();
      uint64_t v94 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        char v95 = "[anonymous]";
        if (v92) {
          char v95 = v92;
        }
        *(_DWORD *)int buf = 136446466;
        __int128 v118 = v95;
        __int16 v119 = 1024;
        int v120 = v74;
        _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_ERROR,  "%{public}s: ioctl: DKIOCEJECT: %{darwin.errno}d",  buf,  0x12u);
      }

      *__error() = v93;
      LOBYTE(v2) = v108;
      int v1 = v109;
      if (v74) {
        goto LABEL_131;
      }
    }

    else
    {
      __int128 v80 = *(const char **)(v3 + 56);
      int v81 = *__error();
      BOOL v82 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v83 = "[anonymous]";
        if (v80) {
          uint64_t v83 = v80;
        }
        *(_DWORD *)int buf = 136446210;
        __int128 v118 = v83;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "%{public}s: detach succeeded", buf, 0xCu);
      }

      int v74 = 0;
      *__error() = v81;
      uint64_t v79 = v3 + 404;
LABEL_124:
      uint64_t v84 = *(const char **)(v3 + 56);
      int v85 = *__error();
      __int128 v86 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        __int128 v87 = "[anonymous]";
        if (v84) {
          __int128 v87 = v84;
        }
        *(_DWORD *)int buf = 136446210;
        __int128 v118 = v87;
        _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEBUG,  "%{public}s: Finished quire detach.",  buf,  0xCu);
      }

      *__error() = v85;
      LOBYTE(v2) = v108;
      int v1 = v109;
      if (v79) {
        close_drop_np(v3 + 404, 0LL);
      }
      if (v74)
      {
LABEL_131:
        int v88 = *(void **)(v3 + 72);
        if (v88)
        {
          if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v89 = 3LL;
          }
          else {
            uint64_t v89 = 2LL;
          }
          __int128 v90 = *(const char **)(v3 + 56);
          if (!v90) {
            __int128 v90 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446466;
          __int128 v118 = v90;
          __int16 v119 = 1024;
          int v120 = v74;
          __int128 v91 = v88;
        }

        else
        {
          uint64_t v102 = *(const char **)(v3 + 56);
          if (!v102) {
            uint64_t v102 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446466;
          __int128 v118 = v102;
          __int16 v119 = 1024;
          int v120 = v74;
          __int128 v91 = &_os_log_default;
          uint64_t v89 = 2LL;
        }

        __int16 v40 = (char *)_os_log_send_and_compose_impl(v89, 0LL, 0LL, 0LL, &_mh_execute_header, v91, 16LL);
        CFIndex v41 = v74;
        int v42 = 739;
        goto LABEL_57;
      }
    }

    unsigned int v96 = sub_10001EBB8((void *)v3);
    if (!v96)
    {
      sub_10002AEDC(v3);
      __int128 v103 = *(const char **)(v3 + 56);
      int v104 = *__error();
      uint64_t v105 = *(os_log_s **)(v3 + 72);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v106 = "[anonymous]";
        if (v103) {
          uint64_t v106 = v103;
        }
        *(_DWORD *)int buf = 136446210;
        __int128 v118 = v106;
        _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEBUG,  "%{public}s: Finished quire unmount.",  buf,  0xCu);
      }

      *__error() = v104;
      goto LABEL_62;
    }

    signed int v97 = v96;
    uint64_t v98 = *(void **)(v3 + 72);
    if (v98)
    {
      if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v99 = 3LL;
      }
      else {
        uint64_t v99 = 2LL;
      }
      int v100 = *(const char **)(v3 + 56);
      if (!v100) {
        int v100 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v118 = v100;
      __int16 v119 = 1024;
      int v120 = v97;
      __int128 v101 = v98;
    }

    else
    {
      uint64_t v107 = *(const char **)(v3 + 56);
      if (!v107) {
        uint64_t v107 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int128 v118 = v107;
      __int16 v119 = 1024;
      int v120 = v96;
      __int128 v101 = &_os_log_default;
      uint64_t v99 = 2LL;
    }

    __int16 v40 = (char *)_os_log_send_and_compose_impl(v99, 0LL, 0LL, 0LL, &_mh_execute_header, v101, 16LL);
    CFIndex v41 = v97;
    int v42 = 745;
  }

void *sub_100030794(void *a1, int a2, void *a3)
{
  int v6 = sub_10003C818(a1, 0x28uLL);
  *((_DWORD *)v6 + 6) = a2;
  v6[4] = a3;
  xpc_retain(a3);
  cryptex_sync_f(a1, v6, sub_100030800);
  int v7 = v6[2];
  sub_10003C8F0(v6);
  return v7;
}

void sub_100030800(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(const char **)(*(void *)a1 + 56LL);
  int v4 = *__error();
  int v5 = *(os_log_s **)(v2 + 72);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = "[anonymous]";
    int v7 = *(_DWORD *)(a1 + 24);
    if (v3) {
      int v6 = v3;
    }
    *(_DWORD *)int buf = 136446466;
    uint64_t v32 = v6;
    __int16 v33 = 1024;
    LODWORD(v34) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s: Launching Launch Agent quires for target user of: %u.",  buf,  0x12u);
  }

  *__error() = v4;
  uint64_t v8 = *(uint64_t **)(v2 + 456);
  if (v8)
  {
    while (1)
    {
      CFIndex v9 = (uint64_t *)*v8;
      uint64_t v10 = calloc(1uLL, 0x510uLL);
      if (!v10) {
        sub_100040D48(&v30, buf);
      }
      uint64_t v11 = v10;
      int v12 = *(_DWORD *)(a1 + 24);
      *((_DWORD *)v10 + 322) = v12;
      __int128 v13 = *(_OWORD *)(v8 + 11);
      __int128 v14 = *(_OWORD *)(v8 + 9);
      uint64_t v15 = v8[15];
      *((_OWORD *)v10 + 7snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = *(_OWORD *)(v8 + 13);
      __int128 v16 = *(_OWORD *)(v8 + 1);
      __int128 v17 = *(_OWORD *)(v8 + 3);
      __int128 v18 = *(_OWORD *)(v8 + 5);
      *((_OWORD *)v10 + 76) = *(_OWORD *)(v8 + 7);
      *((_OWORD *)v10 + 75) = v18;
      *((_OWORD *)v10 + 74) = v17;
      *((_OWORD *)v10 + 73) = v16;
      v10[160] = v15;
      *((_OWORD *)v10 + 77) = v14;
      *((_OWORD *)v10 + 7_Block_object_dispose(va, 8) = v13;
      *((_DWORD *)v10 + 316) = v12;
      v10[160] = *(void *)(a1 + 32);
      CFErrorRef v19 = sub_10001249C(v8 + 16, v10 + 146, (uint64_t)(v10 + 1), *(void *)(v2 + 368));
      if (v19) {
        break;
      }
      void *v11 = *(void *)(v2 + 464);
      *(void *)(v2 + 464) = v11;
      sub_1000355EC(v2);
      uint64_t v8 = v9;
      if (!v9) {
        goto LABEL_9;
      }
    }

    CFErrorRef v20 = v19;
    int v21 = *(void **)(v2 + 72);
    if (v21)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v22 = 3LL;
      }
      else {
        uint64_t v22 = 2LL;
      }
      uint64_t v23 = *(const char **)(v2 + 56);
      int v24 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)int buf = 136446722;
      if (!v23) {
        uint64_t v23 = "[anonymous]";
      }
      uint64_t v32 = v23;
      __int16 v33 = 2080;
      int v34 = v11 + 1;
      __int16 v35 = 1024;
      int v36 = v24;
      uint64_t v25 = v21;
    }

    else
    {
      uint64_t v26 = *(const char **)(v2 + 56);
      if (!v26) {
        uint64_t v26 = "[anonymous]";
      }
      int v27 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)int buf = 136446722;
      uint64_t v32 = v26;
      __int16 v33 = 2080;
      int v34 = v11 + 1;
      __int16 v35 = 1024;
      int v36 = v27;
      uint64_t v25 = &_os_log_default;
      uint64_t v22 = 2LL;
    }

    uint64_t v28 = (char *)_os_log_send_and_compose_impl(v22, 0LL, 0LL, 0LL, &_mh_execute_header, v25, 16LL);
    CFErrorRef v29 = sub_10000A444("_quire_attach_launch_agents", "quire.c", 937, "com.apple.security.cryptex", 21LL, v20, v28);
    free(v28);
    free(v11);
    *(void *)(a1 + 16) = v29;
    CFRelease(v20);
  }

  else
  {
LABEL_9:
    *(void *)(a1 + 16) = 0LL;
  }

uint64_t sub_100030B08(void *a1, int a2)
{
  int v4 = sub_10003C818(a1, 0x28uLL);
  *((_DWORD *)v4 + 6) = a2;
  return cryptex_async_f(a1, v4, sub_100030B44);
}

void sub_100030B44(void **a1)
{
  uint64_t v2 = *a1;
  if (*((_DWORD *)*a1 + 47))
  {
    uint64_t v3 = (const char *)v2[7];
    int v4 = *__error();
    int v5 = (os_log_s *)v2[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = "[anonymous]";
      if (v3) {
        int v6 = v3;
      }
      *(_DWORD *)int buf = 136446210;
      uint64_t v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s: Attempted to remove a Launch Agent that wasn't installed in a system cryptex.",  buf,  0xCu);
    }

    *__error() = v4;
  }

  else
  {
    int v7 = (char *)v2[58];
    if (v7)
    {
      do
      {
        uint64_t v8 = *(char **)v7;
        if (*((_DWORD *)v7 + 322) == *((_DWORD *)a1 + 6))
        {
          CFIndex v9 = (const char *)v2[7];
          int v10 = *__error();
          uint64_t v11 = (os_log_s *)v2[9];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = v2[52];
            __int128 v13 = "[anonymous]";
            if (v9) {
              __int128 v13 = v9;
            }
            *(_DWORD *)int buf = 136446466;
            uint64_t v15 = v13;
            __int16 v16 = 2080;
            uint64_t v17 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}s: Found a Launch Agent: %s - going to deactivate it.",  buf,  0x16u);
          }

          *__error() = v10;
          sub_1000363FC(v7, v2);
        }

        int v7 = v8;
      }

      while (v8);
    }
  }

  sub_10003C8F0(a1);
}

xpc_object_t sub_100030CF4(uint64_t a1, int a2, xpc_object_t object, uint64_t a4)
{
  *(_DWORD *)(a1 + 18_Block_object_dispose(va, 8) = a2;
  *(void *)(a1 + 192) = object;
  xpc_object_t result = xpc_retain(object);
  *(void *)(a1 + 36_Block_object_dispose(va, 8) = a4;
  return result;
}

uint64_t sub_100030D28(uint64_t a1)
{
  return *(unsigned int *)(a1 + 188);
}

uint64_t sub_100030D30(uint64_t a1)
{
  return *(void *)(a1 + 416);
}

const char *sub_100030D38(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 328));
}

uint64_t sub_100030D40(uint64_t a1)
{
  return *(void *)(a1 + 344);
}

uint64_t sub_100030D48(uint64_t a1)
{
  return *(void *)(a1 + 336);
}

uint64_t sub_100030D50(uint64_t a1)
{
  return *(void *)(a1 + 208);
}

uint64_t sub_100030D58(uint64_t a1)
{
  return *(void *)(a1 + 224);
}

uint64_t sub_100030D60(uint64_t a1)
{
  return a1 + 208;
}

uint64_t sub_100030D68(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  int v5 = (const char **)cryptex_content_type_parse();
  int v6 = *(const char **)(*(void *)(a1 + 32) + 16LL);
  int v7 = *__error();
  uint64_t v8 = *(os_log_s **)(*(void *)(a1 + 32) + 32LL);
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFIndex v9 = "[anonymous]";
      int v10 = *v5;
      if (v6) {
        CFIndex v9 = v6;
      }
      int v13 = 136446466;
      __int128 v14 = v9;
      __int16 v15 = 2080;
      __int16 v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%{public}s: populated content type to bootstrap: %s",  (uint8_t *)&v13,  0x16u);
    }

    *__error() = v7;
    *(void *)(*(void *)(a1 + 40) + 112LL) |= (unint64_t)v5[2];
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = "[anonymous]";
      int v13 = 136446722;
      if (v6) {
        uint64_t v11 = v6;
      }
      __int128 v14 = v11;
      __int16 v15 = 2080;
      __int16 v16 = string_ptr;
      __int16 v17 = 1024;
      int v18 = 22;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s: invalid content type %s: %{darwin.errno}d",  (uint8_t *)&v13,  0x1Cu);
    }

    *__error() = v7;
  }

  return 1LL;
}

void sub_100030EF4(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 56);
  int v6 = *(void **)(a1 + 48);
  int v4 = *(const void **)(a1 + 16);
  (*(void (**)(void *, void **, const void *, uint64_t))(a1 + 64))(v2, &v6, v4, v3);
  if (*(void *)(a1 + 48)) {
    BOOL v5 = v6 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    sub_100040DF0();
  }
  free(v6);
  sub_10003C8F0((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
}

CFErrorRef sub_100030F68(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 200) + 40LL);
  BOOL v5 = *(const char **)(a1 + 56);
  int v6 = *__error();
  int v7 = *(os_log_s **)(a1 + 72);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if ((v4 & 1) != 0)
  {
    if (v8)
    {
      uint64_t v26 = "[anonymous]";
      if (v5) {
        uint64_t v26 = v5;
      }
      *(_DWORD *)int buf = 136446210;
      CFTypeRef v56 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s: Running in debug mode, skip trust cache",  buf,  0xCu);
    }

    CFErrorRef v27 = 0LL;
    *__error() = v6;
  }

  else
  {
    if (v8)
    {
      CFIndex v9 = "[anonymous]";
      if (v5) {
        CFIndex v9 = v5;
      }
      *(_DWORD *)int buf = 136446210;
      CFTypeRef v56 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: loading trust cache", buf, 0xCu);
    }

    *__error() = v6;
    tc_uint64_t asset = cryptex_core_get_tc_asset(*(void *)(a1 + 200));
    uint64_t asset = cryptex_core_get_asset(*(void *)(a1 + 200), &_cryptex_asset_type_im4m);
    uint64_t v12 = sub_10002A49C(*(_DWORD *)(tc_asset + 16), *(_DWORD *)(asset + 16), *(os_log_s **)(a1 + 72));
    if (v12)
    {
      int v13 = v12;
      if (!sub_10000A6D8(v12, @"com.apple.security.cryptex.posix", 6LL))
      {
        uint64_t v28 = *(void **)(a1 + 72);
        if (v28)
        {
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
            uint64_t v29 = 3LL;
          }
          else {
            uint64_t v29 = 2LL;
          }
          uint64_t v30 = *(const char **)(a1 + 56);
          if (!v30) {
            uint64_t v30 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          CFTypeRef v56 = v30;
          uint64_t v31 = v28;
        }

        else
        {
          BOOL v45 = *(const char **)(a1 + 56);
          if (!v45) {
            BOOL v45 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          CFTypeRef v56 = v45;
          uint64_t v31 = &_os_log_default;
          uint64_t v29 = 2LL;
        }

        __int16 v46 = (char *)_os_log_send_and_compose_impl(v29, 0LL, 0LL, 0LL, &_mh_execute_header, v31, 16LL);
        CFErrorRef v27 = sub_10000A444( "_quire_bootstrap_load_trust_cache",  "quire.c",  1868,  "com.apple.security.cryptex",  34LL,  v13,  v46);
        free(v46);
        goto LABEL_61;
      }

      __int128 v14 = *(const char **)(a1 + 56);
      int v15 = *__error();
      __int16 v16 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = "[anonymous]";
        if (v14) {
          __int16 v17 = v14;
        }
        *(_DWORD *)int buf = 136446210;
        CFTypeRef v56 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to load trust cache: device is locked",  buf,  0xCu);
      }

      *__error() = v15;
      int v18 = MKBDeviceUnlockedSinceBoot();
      CFErrorRef v19 = *(const char **)(a1 + 56);
      int v20 = *__error();
      int v21 = *(os_log_s **)(a1 + 72);
      if (v18 < 0)
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        uint64_t v32 = "[anonymous]";
        if (v19) {
          uint64_t v32 = v19;
        }
        *(_DWORD *)int buf = 136446466;
        CFTypeRef v56 = v32;
        __int16 v57 = 1024;
        int v58 = v18;
        uint64_t v23 = "%{public}s: failed to get initial lock state: error = %d";
        int v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      }

      else
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        uint64_t v22 = "[anonymous]";
        if (v19) {
          uint64_t v22 = v19;
        }
        *(_DWORD *)int buf = 136446466;
        CFTypeRef v56 = v22;
        __int16 v57 = 1024;
        int v58 = v18;
        uint64_t v23 = "%{public}s: initial unlock state: %d";
        int v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
      }

      _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, 0x12u);
LABEL_35:
      *__error() = v20;
      dispatch_source_t v33 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_add,  0LL,  0LL,  *(dispatch_queue_t *)(a1 + 24));
      dispatch_set_context(v33, a2);
      dispatch_source_set_event_handler_f(v33, (dispatch_function_t)sub_100031798);
      a2[4] = os_retain(v33);
      uint64_t v34 = *(void *)(a1 + 24);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 0x40000000LL;
      v54[2] = sub_1000318FC;
      v54[3] = &unk_100057148;
      v54[4] = a1;
      v54[5] = v33;
      a2[3] = MKBEventsRegister(v34, v54);
      if (!v18 && MKBDeviceUnlockedSinceBoot() == 1)
      {
        __int16 v35 = *(const char **)(a1 + 56);
        int v36 = *__error();
        uint64_t v37 = *(os_log_s **)(a1 + 72);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          __int16 v38 = "[anonymous]";
          if (v35) {
            __int16 v38 = v35;
          }
          *(_DWORD *)int buf = 136446210;
          CFTypeRef v56 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "%{public}s: first unlock during race window; firing source",
            buf,
            0xCu);
        }

        *__error() = v36;
        dispatch_source_merge_data(v33, 1uLL);
      }

      int v39 = MKBGetDeviceLockState(0LL);
      if ((v39 - 1) >= 3)
      {
        int v40 = v39;
        if (v39)
        {
          if (v39 >= 1) {
            sub_100040E08(&v53, buf);
          }
          int v47 = *(const char **)(a1 + 56);
          int v48 = *__error();
          BOOL v49 = *(os_log_s **)(a1 + 72);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            char v50 = "[anonymous]";
            if (v47) {
              char v50 = v47;
            }
            *(_DWORD *)int buf = 136446466;
            CFTypeRef v56 = v50;
            __int16 v57 = 1024;
            int v58 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to get lock state to de-bounce keybag event race: int error = %d",  buf,  0x12u);
          }

          *__error() = v48;
        }

        else
        {
          CFIndex v41 = *(const char **)(a1 + 56);
          int v42 = *__error();
          int v43 = *(os_log_s **)(a1 + 72);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            CFErrorRef v44 = "[anonymous]";
            if (v41) {
              CFErrorRef v44 = v41;
            }
            *(_DWORD *)int buf = 136446210;
            CFTypeRef v56 = v44;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "%{public}s: device unlocked during race window; firing source",
              buf,
              0xCu);
          }

          *__error() = v42;
          dispatch_source_merge_data(v33, 1uLL);
        }
      }

      dispatch_activate(v33);
      *(_DWORD *)int buf = 67109120;
      LODWORD(v56) = 36;
      int v51 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      CFErrorRef v27 = sub_10000A444( "_quire_handle_device_lock",  "quire.c",  1813,  "com.apple.security.cryptex.posix",  36LL,  0LL,  v51);
      free(v51);
      if (v33) {
        os_release(v33);
      }
LABEL_61:
      CFRelease(v13);
      return v27;
    }

    return 0LL;
  }

  return v27;
}

uint64_t sub_10003163C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[2];
  uint64_t v4 = *(const char **)(*a1 + 56);
  int v5 = *__error();
  int v6 = *(os_log_s **)(v2 + 72);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v7)
    {
      BOOL v8 = "[anonymous]";
      if (v4) {
        BOOL v8 = v4;
      }
      int v11 = 136446210;
      uint64_t v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: unwinding after bootstrap failure",  (uint8_t *)&v11,  0xCu);
    }

    *__error() = v5;
    sub_100035B40(v2);
    sub_100035E40(v2);
  }

  else
  {
    if (v7)
    {
      CFIndex v9 = "[anonymous]";
      if (v4) {
        CFIndex v9 = v4;
      }
      int v11 = 136446210;
      uint64_t v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: quire bootstrap succeeded",  (uint8_t *)&v11,  0xCu);
    }

    *__error() = v5;
    *(void *)(v2 + 176) |= 2uLL;
  }

  return cryptex_target_async_f(v2, a1, sub_10002F3C0);
}

void sub_100031798(void *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (dispatch_source_s *)a1[4];
  uint64_t v4 = *(const char **)(*a1 + 56LL);
  int v5 = *__error();
  int v6 = *(os_log_s **)(v2 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = "[anonymous]";
    if (v4) {
      BOOL v7 = v4;
    }
    int v10 = 136446210;
    int v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: lock state source fired",  (uint8_t *)&v10,  0xCu);
  }

  *__error() = v5;
  BOOL v8 = (const __CFDictionary *)sub_100030F68(v2, a1);
  CFIndex v9 = v8;
  if (v8)
  {
    a1[2] = CFRetain(v9);
    BOOL v8 = (const __CFDictionary *)CFRetain(v9);
  }

  else
  {
    a1[2] = 0LL;
  }

  *(void *)(v2 + 40_Block_object_dispose(va, 8) = v8;
  cryptex_async_f(v2, a1, sub_10003163C);
LABEL_10:
  dispatch_source_cancel(v3);
  a1[4] = 0LL;
  MKBEventsUnregister(a1[3]);
  a1[3] = 0LL;
  if (v3) {
    os_release(v3);
  }
  if (v9) {
    CFRelease(v9);
  }
}

void sub_1000318FC(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(const char **)(*(void *)(a1 + 32) + 56LL);
  int v5 = *__error();
  int v6 = *(os_log_s **)(*(void *)(a1 + 32) + 72LL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = "[anonymous]";
    if (v4) {
      BOOL v7 = v4;
    }
    int v8 = 136446466;
    CFIndex v9 = v7;
    __int16 v10 = 1024;
    unsigned int v11 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: keybag event; firing source: event = %#x",
      (uint8_t *)&v8,
      0x12u);
  }

  *__error() = v5;
  if (a2 <= 1) {
    dispatch_source_merge_data(*(dispatch_source_t *)(a1 + 40), 1uLL);
  }
}

uint64_t sub_1000319F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, uint64_t a5, void (*a6)(uint64_t, void *, uint64_t))
{
  if (a5 >= 1)
  {
    uint64_t v7 = a5;
    uint64_t v10 = a2;
    uint64_t v12 = &unk_100055468;
    do
    {
      uint64_t v13 = **a4;
      __int128 v14 = *(void **)(v13 + 48);
      if (v14 == v12)
      {
        if ((os_variant_has_internal_content("com.apple.security.cryptexd") & 1) == 0)
        {
          uint64_t v15 = a3;
          __int16 v16 = a6;
          __int16 v17 = v12;
          int v18 = *(const char **)(a1 + 56);
          int v19 = *__error();
          int v20 = *(os_log_s **)(a1 + 72);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = "[anonymous]";
            if (v18) {
              int v21 = v18;
            }
            *(_DWORD *)int buf = 136446210;
            uint64_t v29 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}s: trying to bootstrap internal content on non internal system",  buf,  0xCu);
          }

          *__error() = v19;
          uint64_t v12 = v17;
          a6 = v16;
          a3 = v15;
          uint64_t v10 = a2;
        }

        __int128 v14 = *(void **)(v13 + 48);
      }

      if (v14 == &unk_100055498 && *(_DWORD *)(a1 + 188))
      {
        uint64_t v23 = *(const char **)(a1 + 56);
        int v24 = *__error();
        os_log_type_t v25 = *(os_log_s **)(a1 + 72);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = "[anonymous]";
          if (v23) {
            uint64_t v26 = v23;
          }
          *(_DWORD *)int buf = 136446210;
          uint64_t v29 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%{public}s: not bootstrapping platform content for session",  buf,  0xCu);
        }

        *__error() = v24;
      }

      else
      {
        uint64_t result = sub_1000099FC(v13, a3, v10, a6, 0);
        if (result) {
          return result;
        }
      }

      ++a4;
      --v7;
    }

    while (v7);
  }

  return 0LL;
}

CFErrorRef sub_100031C04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  bzero(v21, 0x400uLL);
  int v6 = realpath_np(*(unsigned int *)(a2 + 80), v21);
  if (v6)
  {
    int v7 = v6;
    int v8 = *(void **)(v5 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      uint64_t v10 = v8;
    }

    else
    {
      uint64_t v10 = &_os_log_default;
      uint64_t v9 = 2LL;
    }

    __int16 v16 = (char *)_os_log_send_and_compose_impl(v9, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    CFIndex v17 = v7;
    int v18 = 1427;
LABEL_18:
    CFErrorRef v19 = sub_10000A444("_quire_bootstrap_library", "quire.c", v18, "com.apple.security.cryptex.posix", v17, 0LL, v16);
    free(v16);
    return v19;
  }

  int v11 = sub_1000064FC((uint64_t)v21, *((unsigned int *)a3 + 10), *(const char **)(a2 + 72), 6);
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = *(void **)(v5 + 72);
    if (v13)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      uint64_t v15 = v13;
    }

    else
    {
      uint64_t v15 = &_os_log_default;
      uint64_t v14 = 2LL;
    }

    __int16 v16 = (char *)_os_log_send_and_compose_impl(v14, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
    CFIndex v17 = v12;
    int v18 = 1436;
    goto LABEL_18;
  }

  return 0LL;
}

CFErrorRef sub_100031F40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = _cryptex_content_type_factory[2] & *(void *)(*a3 + 320);
  int v7 = *(void **)(a1 + 48);
  BOOL v8 = v7 == &unk_100055468 || v7 == &unk_100055498;
  if (v8
    && (unsigned int v9 = sub_10000F064(*(void *)(v5 + 208), a3[6], *(void *)(a2 + 72), (uint64_t)"/", v6 != 0)) != 0)
  {
    signed int v10 = v9;
    int v11 = *(void **)(v5 + 72);
    if (v11)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v12 = 3LL;
      }
      else {
        uint64_t v12 = 2LL;
      }
      uint64_t v13 = v11;
    }

    else
    {
      uint64_t v13 = &_os_log_default;
      uint64_t v12 = 2LL;
    }

    uint64_t v15 = (char *)_os_log_send_and_compose_impl(v12, 0LL, 0LL, 0LL, &_mh_execute_header, v13, 16LL);
    CFErrorRef v14 = sub_10000A444("_quire_bootstrap_binary", "quire.c", 1523, "com.apple.security.cryptex.posix", v10, 0LL, v15);
    free(v15);
  }

  else
  {
    CFErrorRef v14 = 0LL;
  }

  unsigned int v16 = sub_10000F064(*(void *)(v5 + 208), a3[6], *(void *)(a2 + 72), a3[6], v6 != 0);
  if (v16)
  {
    signed int v17 = v16;
    int v18 = *(void **)(v5 + 72);
    if (v18)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v19 = 3LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
      int v20 = v18;
    }

    else
    {
      int v20 = &_os_log_default;
      uint64_t v19 = 2LL;
    }

    int v21 = (char *)_os_log_send_and_compose_impl(v19, 0LL, 0LL, 0LL, &_mh_execute_header, v20, 16LL);
    CFErrorRef v14 = sub_10000A444("_quire_bootstrap_binary", "quire.c", 1531, "com.apple.security.cryptex.posix", v17, 0LL, v21);
    free(v21);
  }

  return v14;
}

CFErrorRef sub_1000322D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  bzero(&v86, 0x878uLL);
  int v78 = 0;
  memset(v85, 0, 255);
  memset(v84, 0, 255);
  bzero(v83, 0x400uLL);
  bzero(from, 0x400uLL);
  bzero(to, 0x400uLL);
  bzero(__str, 0x400uLL);
  __big = 0LL;
  unsigned __int16 v76 = 0;
  uint64_t v5 = *(const char **)(v4 + 56);
  int v6 = *__error();
  int v7 = *(os_log_s **)(v4 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = "[anonymous]";
    if (v5) {
      BOOL v8 = v5;
    }
    int buf = 136446210;
    int v88 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s: bootstrapping diags",  (uint8_t *)&buf,  0xCu);
  }

  *__error() = v6;
  if (statfs("/", &v86))
  {
    int v9 = *__error();
    signed int v10 = *(const char **)(v4 + 56);
    int v11 = *__error();
    uint64_t v12 = *(os_log_s **)(v4 + 72);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      int v17 = -1;
      goto LABEL_13;
    }

    uint64_t v13 = "[anonymous]";
    if (v10) {
      uint64_t v13 = v10;
    }
    int buf = 136446466;
    int v88 = v13;
    __int16 v89 = 1024;
    LODWORD(v90) = v9;
    CFErrorRef v14 = "%{public}s: failed to statfs root path: %{darwin.errno}d";
    goto LABEL_10;
  }

  sscanf(v86.f_mntfromname, "/dev/disk%d", &v78);
  snprintf(v85, 0xFFuLL, "disk%d", v78);
  if (sub_10000E114((uint64_t)v85, 640LL))
  {
    int v19 = sub_10000E5C0(640, &__big, *(os_log_s **)(v4 + 72));
    if (v19)
    {
      int v9 = v19;
      int v20 = *(const char **)(v4 + 56);
      int v21 = *__error();
      uint64_t v22 = *(os_log_s **)(v4 + 72);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = "[anonymous]";
        if (v20) {
          uint64_t v23 = v20;
        }
        int buf = 136446466;
        int v88 = v23;
        __int16 v89 = 1024;
        LODWORD(v90) = v9;
        int v24 = "%{public}s: failed to copy diags volume formatter: %{darwin.errno}d";
LABEL_43:
        __int16 v35 = v22;
        uint32_t v36 = 18;
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&buf, v36);
        goto LABEL_45;
      }

      goto LABEL_45;
    }

    if (!strstr(__big, "cryptexd"))
    {
      dispatch_source_t v33 = *(const char **)(v4 + 56);
      int v21 = *__error();
      uint64_t v22 = *(os_log_s **)(v4 + 72);
      int v9 = 17;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = "[anonymous]";
        if (v33) {
          uint64_t v34 = v33;
        }
        int buf = 136446466;
        int v88 = v34;
        __int16 v89 = 1024;
        LODWORD(v90) = 17;
        int v24 = "%{public}s: diags volume already exists but not formatted by us: %{darwin.errno}d";
        goto LABEL_43;
      }

      goto LABEL_45;
    }

    if (access("/System/Volumes/Diags/AppleInternal/Diags", 1)
      || (snprintf(__str, 0x400uLL, "%s/.%s", "/System/Volumes/Diags/AppleInternal/Diags", *(const char **)(v4 + 208)),
          access(__str, 0)))
    {
      uint64_t v28 = *(const char **)(v4 + 56);
      int v21 = *__error();
      uint64_t v22 = *(os_log_s **)(v4 + 72);
      int v9 = 17;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = "[anonymous]";
        if (v28) {
          uint64_t v29 = v28;
        }
        int buf = 136446466;
        int v88 = v29;
        __int16 v89 = 1024;
        LODWORD(v90) = 17;
        int v24 = "%{public}s: diags volume already created by another cryptex install. please uninstall it first: %{darwin.errno}d";
        goto LABEL_43;
      }

LABEL_45:
      *__error() = v21;
      int v17 = -1;
      goto LABEL_46;
    }

    char v50 = *(const char **)(v4 + 56);
    int v51 = *__error();
    int v52 = *(os_log_s **)(v4 + 72);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v53 = "[anonymous]";
      if (v50) {
        uint64_t v53 = v50;
      }
      int buf = 136446210;
      int v88 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "%{public}s: diags volume already created",  (uint8_t *)&buf,  0xCu);
    }

    *__error() = v51;
    *(void *)(v4 + 176) |= 0x20uLL;
    if (unlink("/AppleInternal/Diags") && *__error() != 2)
    {
      int v9 = *__error();
      int v61 = *(const char **)(v4 + 56);
      int v11 = *__error();
      uint64_t v12 = *(os_log_s **)(v4 + 72);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v62 = "[anonymous]";
      if (v61) {
        int v62 = v61;
      }
      int buf = 136446466;
      int v88 = v62;
      __int16 v89 = 1024;
      LODWORD(v90) = v9;
      CFErrorRef v14 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
    }

    else
    {
      if (!symlink("/System/Volumes/Diags/AppleInternal/Diags", "/AppleInternal/Diags") || *__error() == 17)
      {
        CFErrorRef v18 = 0LL;
        goto LABEL_59;
      }

      int v9 = *__error();
      int v63 = *(const char **)(v4 + 56);
      int v11 = *__error();
      uint64_t v12 = *(os_log_s **)(v4 + 72);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v64 = "[anonymous]";
      if (v63) {
        int v64 = v63;
      }
      int buf = 136446466;
      int v88 = v64;
      __int16 v89 = 1024;
      LODWORD(v90) = v9;
      CFErrorRef v14 = "%{public}s: failed to create symlink for diags: %{darwin.errno}d";
    }

CFErrorRef sub_100032FEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  bzero(v38, 0x400uLL);
  int v5 = realpath_np(*(unsigned int *)(a2 + 80), v38);
  if (v5)
  {
    int v6 = v5;
    int v7 = *(void **)(v4 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      int v9 = *(const char **)(v4 + 56);
      uint64_t v10 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v9) {
        int v9 = "[anonymous]";
      }
      dispatch_source_t v33 = v9;
      __int16 v34 = 2080;
      uint64_t v35 = v10;
      __int16 v36 = 1024;
      int v37 = v6;
      int v11 = v7;
    }

    else
    {
      int v19 = *(const char **)(v4 + 56);
      if (!v19) {
        int v19 = "[anonymous]";
      }
      uint64_t v20 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      dispatch_source_t v33 = v19;
      __int16 v34 = 2080;
      uint64_t v35 = v20;
      __int16 v36 = 1024;
      int v37 = v5;
      int v11 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    int v21 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
    CFIndex v22 = v6;
    int v23 = 1566;
LABEL_22:
    CFErrorRef v24 = sub_10000A444( "_quire_bootstrap_luacore_lib",  "quire.c",  v23,  "com.apple.security.cryptex.posix",  v22,  0LL,  v21);
    free(v21);
    return v24;
  }

  if (access(*(const char **)(a2 + 72), 0))
  {
    int v12 = sub_1000060C8((uint64_t)v38, *(const char **)(a2 + 72), 6);
    if (!v12) {
      return 0LL;
    }
    int v13 = v12;
    CFErrorRef v14 = *(void **)(v4 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 2LL;
      }
      uint32_t v16 = *(const char **)(v4 + 56);
      uint64_t v17 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v16) {
        uint32_t v16 = "[anonymous]";
      }
      dispatch_source_t v33 = v16;
      __int16 v34 = 2080;
      uint64_t v35 = v17;
      __int16 v36 = 1024;
      int v37 = v13;
      CFErrorRef v18 = v14;
    }

    else
    {
      int v30 = *(const char **)(v4 + 56);
      if (!v30) {
        int v30 = "[anonymous]";
      }
      uint64_t v31 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      dispatch_source_t v33 = v30;
      __int16 v34 = 2080;
      uint64_t v35 = v31;
      __int16 v36 = 1024;
      int v37 = v12;
      CFErrorRef v18 = &_os_log_default;
      uint64_t v15 = 2LL;
    }

    int v21 = (char *)_os_log_send_and_compose_impl(v15, 0LL, 0LL, 0LL, &_mh_execute_header, v18, 16LL);
    CFIndex v22 = v13;
    int v23 = 1578;
    goto LABEL_22;
  }

  uint64_t v26 = *(const char **)(v4 + 56);
  int v27 = *__error();
  uint64_t v28 = *(os_log_s **)(v4 + 72);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = "[anonymous]";
    if (v26) {
      uint64_t v29 = v26;
    }
    *(_DWORD *)int buf = 136446210;
    dispatch_source_t v33 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}s: symlink exists, skipping", buf, 0xCu);
  }

  CFErrorRef v24 = 0LL;
  *__error() = v27;
  return v24;
}

CFErrorRef sub_1000333A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  bzero(v21, 0x400uLL);
  int v6 = realpath_np(*(unsigned int *)(a2 + 80), v21);
  if (v6)
  {
    int v7 = v6;
    uint64_t v8 = *(void **)(v5 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      uint64_t v10 = v8;
    }

    else
    {
      uint64_t v10 = &_os_log_default;
      uint64_t v9 = 2LL;
    }

    uint32_t v16 = (char *)_os_log_send_and_compose_impl(v9, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    CFIndex v17 = v7;
    int v18 = 1601;
LABEL_18:
    CFErrorRef v19 = sub_10000A444( "_quire_bootstrap_python_lib",  "quire.c",  v18,  "com.apple.security.cryptex.posix",  v17,  0LL,  v16);
    free(v16);
    return v19;
  }

  int v11 = sub_1000064FC((uint64_t)v21, *((unsigned int *)a3 + 10), *(const char **)(a2 + 72), 6);
  if (v11)
  {
    int v12 = v11;
    int v13 = *(void **)(v5 + 72);
    if (v13)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      uint64_t v15 = v13;
    }

    else
    {
      uint64_t v15 = &_os_log_default;
      uint64_t v14 = 2LL;
    }

    uint32_t v16 = (char *)_os_log_send_and_compose_impl(v14, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
    CFIndex v17 = v12;
    int v18 = 1610;
    goto LABEL_18;
  }

  return 0LL;
}

CFErrorRef sub_1000336E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  bzero(v38, 0x400uLL);
  int v5 = realpath_np(*(unsigned int *)(a2 + 80), v38);
  if (v5)
  {
    int v6 = v5;
    int v7 = *(void **)(v4 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = *(const char **)(v4 + 56);
      uint64_t v10 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v9) {
        uint64_t v9 = "[anonymous]";
      }
      dispatch_source_t v33 = v9;
      __int16 v34 = 2080;
      uint64_t v35 = v10;
      __int16 v36 = 1024;
      int v37 = v6;
      int v11 = v7;
    }

    else
    {
      CFErrorRef v19 = *(const char **)(v4 + 56);
      if (!v19) {
        CFErrorRef v19 = "[anonymous]";
      }
      uint64_t v20 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      dispatch_source_t v33 = v19;
      __int16 v34 = 2080;
      uint64_t v35 = v20;
      __int16 v36 = 1024;
      int v37 = v5;
      int v11 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    int v21 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v11, 16LL);
    CFIndex v22 = v6;
    int v23 = 1632;
LABEL_22:
    CFErrorRef v24 = sub_10000A444("_quire_bootstrap_astro", "quire.c", v23, "com.apple.security.cryptex.posix", v22, 0LL, v21);
    free(v21);
    return v24;
  }

  if (access(*(const char **)(a2 + 72), 0))
  {
    int v12 = sub_1000060C8((uint64_t)v38, *(const char **)(a2 + 72), 6);
    if (!v12) {
      return 0LL;
    }
    int v13 = v12;
    uint64_t v14 = *(void **)(v4 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 2LL;
      }
      uint32_t v16 = *(const char **)(v4 + 56);
      uint64_t v17 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v16) {
        uint32_t v16 = "[anonymous]";
      }
      dispatch_source_t v33 = v16;
      __int16 v34 = 2080;
      uint64_t v35 = v17;
      __int16 v36 = 1024;
      int v37 = v13;
      int v18 = v14;
    }

    else
    {
      int v30 = *(const char **)(v4 + 56);
      if (!v30) {
        int v30 = "[anonymous]";
      }
      uint64_t v31 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      dispatch_source_t v33 = v30;
      __int16 v34 = 2080;
      uint64_t v35 = v31;
      __int16 v36 = 1024;
      int v37 = v12;
      int v18 = &_os_log_default;
      uint64_t v15 = 2LL;
    }

    int v21 = (char *)_os_log_send_and_compose_impl(v15, 0LL, 0LL, 0LL, &_mh_execute_header, v18, 16LL);
    CFIndex v22 = v13;
    int v23 = 1644;
    goto LABEL_22;
  }

  uint64_t v26 = *(const char **)(v4 + 56);
  int v27 = *__error();
  uint64_t v28 = *(os_log_s **)(v4 + 72);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = "[anonymous]";
    if (v26) {
      uint64_t v29 = v26;
    }
    *(_DWORD *)int buf = 136446210;
    dispatch_source_t v33 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}s: symlink exists, skipping", buf, 0xCu);
  }

  CFErrorRef v24 = 0LL;
  *__error() = v27;
  return v24;
}

CFErrorRef sub_100033A98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  bzero(from, 0x400uLL);
  int v5 = realpath_np(*(unsigned int *)(a2 + 80), from);
  if (v5)
  {
    int v6 = v5;
    int v7 = *(void **)(v4 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = v7;
    }

    else
    {
      uint64_t v9 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    uint64_t v15 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 16LL);
    CFIndex v16 = v6;
    int v17 = 1478;
LABEL_18:
    CFErrorRef v18 = sub_10000A444( "_quire_bootstrap_log_plists",  "quire.c",  v17,  "com.apple.security.cryptex.posix",  v16,  0LL,  v15);
    free(v15);
    return v18;
  }

  if (copyfile(from, "/Library/Preferences/Logging/Subsystems/", 0LL, 0xE8008u))
  {
    CFIndex v10 = *__error();
    int v11 = *(void **)(v4 + 72);
    if (v11)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v12 = 3LL;
      }
      else {
        uint64_t v12 = 2LL;
      }
      __error();
      uint64_t v13 = v12;
      uint64_t v14 = v11;
    }

    else
    {
      __error();
      uint64_t v14 = &_os_log_default;
      uint64_t v13 = 2LL;
    }

    uint64_t v15 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v14, 16LL);
    int v17 = 1485;
    CFIndex v16 = v10;
    goto LABEL_18;
  }

  return 0LL;
}

CFErrorRef sub_100033DF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  bzero(from, 0x400uLL);
  int v5 = realpath_np(*(unsigned int *)(a2 + 80), from);
  if (v5)
  {
    int v6 = v5;
    int v7 = *(void **)(v4 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = v7;
    }

    else
    {
      uint64_t v9 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    uint64_t v15 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 16LL);
    CFIndex v16 = v6;
    int v17 = 2130;
LABEL_18:
    CFErrorRef v18 = sub_10000A444( "_quire_bootstrap_feature_flags_domain",  "quire.c",  v17,  "com.apple.security.cryptex.posix",  v16,  0LL,  v15);
    free(v15);
    return v18;
  }

  if (copyfile(from, "/Library/FeatureFlags/Domain/", 0LL, 0xE8008u))
  {
    CFIndex v10 = *__error();
    int v11 = *(void **)(v4 + 72);
    if (v11)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v12 = 3LL;
      }
      else {
        uint64_t v12 = 2LL;
      }
      __error();
      uint64_t v13 = v12;
      uint64_t v14 = v11;
    }

    else
    {
      __error();
      uint64_t v14 = &_os_log_default;
      uint64_t v13 = 2LL;
    }

    uint64_t v15 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v14, 16LL);
    int v17 = 2137;
    CFIndex v16 = v10;
    goto LABEL_18;
  }

  return 0LL;
}

CFTypeRef sub_100034148(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  if (_vproc_set_global_on_demand(a2))
  {
    uint64_t v4 = *(void **)(a1 + 72);
    if (v4)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v5 = 3LL;
      }
      else {
        uint64_t v5 = 2LL;
      }
      int v6 = *(const char **)(a1 + 56);
      if (!v6) {
        int v6 = "[anonymous]";
      }
      int v7 = "set";
      if (!v2) {
        int v7 = "clear";
      }
      *(_DWORD *)int buf = 136446466;
      CFIndex v22 = v6;
      __int16 v23 = 2080;
      CFErrorRef v24 = v7;
      uint64_t v8 = v4;
    }

    else
    {
      CFIndex v16 = *(const char **)(a1 + 56);
      if (!v16) {
        CFIndex v16 = "[anonymous]";
      }
      int v17 = "set";
      if (!v2) {
        int v17 = "clear";
      }
      *(_DWORD *)int buf = 136446466;
      CFIndex v22 = v16;
      __int16 v23 = 2080;
      CFErrorRef v24 = v17;
      uint64_t v8 = &_os_log_default;
      uint64_t v5 = 2LL;
    }

    CFErrorRef v18 = (char *)_os_log_send_and_compose_impl(v5, 0LL, 0LL, 0LL, &_mh_execute_header, v8, 16LL);
    CFErrorRef v19 = sub_10000A444( "_quire_globally_toggle_runatload_jobs",  "quire.c",  1188,  "com.apple.security.cryptex",  35LL,  0LL,  v18);
    free(v18);
    if (v19)
    {
      CFTypeRef v15 = CFRetain(v19);
      CFRelease(v19);
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t v9 = *(const char **)(a1 + 56);
    int v10 = *__error();
    int v11 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = "[anonymous]";
      if (v9) {
        uint64_t v12 = v9;
      }
      uint64_t v13 = "Unsuppressing";
      if (v2) {
        uint64_t v13 = "Suppressing";
      }
      *(_DWORD *)int buf = 136446722;
      CFIndex v22 = v12;
      uint64_t v14 = "setting";
      __int16 v23 = 2080;
      CFErrorRef v24 = v13;
      if (!v2) {
        uint64_t v14 = "clearing";
      }
      __int16 v25 = 2080;
      uint64_t v26 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}s: %s RunAtLoad jobs by %s global on-demand bit in launchd",  buf,  0x20u);
    }

    CFTypeRef v15 = 0LL;
    *__error() = v10;
  }

  return v15;
}

CFErrorRef sub_1000343F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  int v6 = calloc(1uLL, 0xC0uLL);
  if (!v6) {
    sub_100040E90(&v47, buf);
  }
  int v7 = (int *)v6;
  *((_OWORD *)v6 + _Block_object_dispose(va, 8) = 0u;
  uint64_t v8 = v6 + 16;
  v6[22] = 0LL;
  *((_OWORD *)v6 + snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = 0u;
  *((_OWORD *)v6 + 10) = 0u;
  uint64_t v9 = *(const char **)(v5 + 56);
  int v10 = *__error();
  int v11 = *(os_log_s **)(v5 + 72);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = "[anonymous]";
    uint64_t v13 = *(void *)(a2 + 56);
    if (v9) {
      uint64_t v12 = v9;
    }
    *(_DWORD *)int buf = 136446466;
    BOOL v49 = v12;
    __int16 v50 = 2080;
    uint64_t v51 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}s: _quire_bootstrap_agents: bootstrapping agent: %s",  buf,  0x16u);
  }

  *__error() = v10;
  int v14 = *(_DWORD *)(v5 + 188);
  if (v14)
  {
    uint64_t v15 = *(void *)(v5 + 192);
    if (v15) {
      uint64_t v16 = 40LL;
    }
    else {
      uint64_t v16 = 8LL;
    }
    if (!v15)
    {
      uint64_t v15 = 0LL;
      int v14 = 0;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = 8LL;
  }

  *((void *)v7 + 1) = 0LL;
  *((void *)v7 + 2) = *(void *)(v5 + 416);
  *((void *)v7 + 12) = 0LL;
  v7[26] = v14;
  *((void *)v7 + 14) = *(void *)(v5 + 72);
  *((void *)v7 + 15) = v15;
  int v17 = *(_DWORD *)(v5 + 176);
  CFErrorRef v18 = *(void **)(v5 + 472);
  if (v18)
  {
    uint64_t v19 = v7[22];
    uint64_t v20 = &v7[2 * v19 + 6];
    do
    {
      *(void *)uint64_t v20 = *(void *)(*v18 + 416LL);
      v20 += 2;
      CFErrorRef v18 = (void *)v18[1];
      LODWORD(v1snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v19 + 1;
    }

    while (v18);
    v7[22] = v19;
  }

  int v21 = *(const char **)(v5 + 56);
  int v22 = *__error();
  __int16 v23 = *(os_log_s **)(v5 + 72);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    CFErrorRef v24 = "[anonymous]";
    uint64_t v25 = *(void *)(a2 + 56);
    if (v21) {
      CFErrorRef v24 = v21;
    }
    *(_DWORD *)int buf = 136446466;
    BOOL v49 = v24;
    __int16 v50 = 2080;
    uint64_t v51 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrapping agent: %s", buf, 0x16u);
  }

  *__error() = v22;
  int v26 = sub_10003BB8C(*(_DWORD *)(a2 + 80), v8);
  if (v26)
  {
    int v27 = v26;
    uint64_t v28 = *(const char **)(v5 + 56);
    int v29 = *__error();
    int v30 = *(os_log_s **)(v5 + 72);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = "[anonymous]";
      if (v28) {
        uint64_t v31 = v28;
      }
      *(_DWORD *)int buf = 136446466;
      BOOL v49 = v31;
      __int16 v50 = 1024;
      LODWORD(v51) = v27;
      uint64_t v32 = "%{public}s: failed to read plist: %{darwin.errno}d";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v32, buf, 0x12u);
    }
  }

  else
  {
    *(void *)int v7 = *(void *)(v5 + 456);
    *(void *)(v5 + 456) = v7;
    *((void *)v7 + 1) = (16LL * (v17 & 1)) | v16;
    sub_1000355EC(v5);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 0x40000000LL;
    v46[2] = sub_100035624;
    v46[3] = &unk_100057168;
    v46[4] = v5;
    int v33 = sub_10000D5B8(v46, (uint64_t)a3);
    if (!v33) {
      return 0LL;
    }
    int v27 = v33;
    __int16 v34 = *(const char **)(v5 + 56);
    int v29 = *__error();
    int v30 = *(os_log_s **)(v5 + 72);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = "[anonymous]";
      if (v34) {
        uint64_t v35 = v34;
      }
      *(_DWORD *)int buf = 136446466;
      BOOL v49 = v35;
      __int16 v50 = 1024;
      LODWORD(v51) = v27;
      uint64_t v32 = "%{public}s: launchagent bootstrap failed: %{darwin.errno}d";
      goto LABEL_32;
    }
  }

  *__error() = v29;
  sub_10003C5AC(v8);
  free(v7);
  __int16 v36 = *(void **)(v5 + 72);
  if (v36)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR)) {
      uint64_t v37 = 3LL;
    }
    else {
      uint64_t v37 = 2LL;
    }
    uint64_t v38 = *(const char **)(v5 + 56);
    uint64_t v39 = *(void *)(a2 + 56);
    *(_DWORD *)int buf = 136446722;
    if (!v38) {
      uint64_t v38 = "[anonymous]";
    }
    BOOL v49 = v38;
    __int16 v50 = 2080;
    uint64_t v51 = v39;
    __int16 v52 = 1024;
    int v53 = v27;
    int v40 = v36;
  }

  else
  {
    CFIndex v41 = *(const char **)(v5 + 56);
    if (!v41) {
      CFIndex v41 = "[anonymous]";
    }
    uint64_t v42 = *(void *)(a2 + 56);
    *(_DWORD *)int buf = 136446722;
    BOOL v49 = v41;
    __int16 v50 = 2080;
    uint64_t v51 = v42;
    __int16 v52 = 1024;
    int v53 = v27;
    int v40 = &_os_log_default;
    uint64_t v37 = 2LL;
  }

  int v43 = (char *)_os_log_send_and_compose_impl(v37, 0LL, 0LL, 0LL, &_mh_execute_header, v40, 16LL);
  CFErrorRef v44 = sub_10000A444("_quire_bootstrap_agents", "quire.c", 1051, "com.apple.security.cryptex.posix", v27, 0LL, v43);
  free(v43);
  return v44;
}

CFErrorRef sub_1000348D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  uint64_t v51 = 0LL;
  memset(v50, 0, sizeof(v50));
  uint64_t v5 = *(const char **)(v4 + 56);
  int v6 = *__error();
  int v7 = *(os_log_s **)(v4 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = "[anonymous]";
    }
    uint64_t v9 = *(void *)(a2 + 56);
    LODWORD(buf[0]) = 136446466;
    *(void *)((char *)buf + 4) = v8;
    WORD2(buf[1]) = 2080;
    *(void *)((char *)&buf[1] + 6) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s: _quire_bootstrap_service: bootstrapping service: %s",  (uint8_t *)buf,  0x16u);
  }

  *__error() = v6;
  int v10 = *(_DWORD *)(v4 + 188);
  if (v10)
  {
    uint64_t v11 = *(void *)(v4 + 192);
    if (v11)
    {
      uint64_t v12 = 40LL;
      goto LABEL_12;
    }

    int v10 = 0;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v12 = 8LL;
LABEL_12:
  if ((_cryptex_content_type_factory[2] & *(void *)(v4 + 320)) != 0LL) {
    uint64_t v13 = v12 | 0x40;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v58 = 0LL;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  memset(buf, 0, sizeof(buf));
  buf[1] = *(void *)(v4 + 416);
  LODWORD(v5_Block_object_dispose(va, 8) = v10;
  uint64_t v59 = *(void *)(v4 + 72);
  uint64_t v60 = v11;
  int v14 = *(_DWORD *)(v4 + 176);
  uint64_t v15 = *(void **)(v4 + 472);
  if (v15)
  {
    uint64_t v16 = 0LL;
    do
    {
      buf[v16++ + 2] = *(void *)(*v15 + 416LL);
      uint64_t v15 = (void *)v15[1];
    }

    while (v15);
    LODWORD(v57) = v16;
  }

  unint64_t v17 = *(unsigned int *)(*(void *)(v4 + 200) + 40LL);
  CFErrorRef v18 = *(const char **)(v4 + 56);
  int v19 = *__error();
  uint64_t v20 = *(os_log_s **)(v4 + 72);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    if (v18) {
      int v21 = v18;
    }
    else {
      int v21 = "[anonymous]";
    }
    uint64_t v22 = *(void *)(a2 + 56);
    *(_DWORD *)int v61 = 136446466;
    int v62 = v21;
    __int16 v63 = 2080;
    uint64_t v64 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%{public}s: bootstrapping service: %s",  v61,  0x16u);
  }

  *__error() = v19;
  int v23 = sub_10003BB8C(*(_DWORD *)(a2 + 80), v50);
  if (v23)
  {
    int v24 = v23;
    uint64_t v25 = *(const char **)(v4 + 56);
    int v26 = *__error();
    int v27 = *(os_log_s **)(v4 + 72);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      if (v25) {
        uint64_t v28 = v25;
      }
      else {
        uint64_t v28 = "[anonymous]";
      }
      *(_DWORD *)int v61 = 136446466;
      int v62 = v28;
      __int16 v63 = 1024;
      LODWORD(v64) = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to read plist: %{darwin.errno}d",  v61,  0x12u);
    }

    *__error() = v26;
    sub_10003C5AC(v50);
    int v29 = *(void **)(v4 + 72);
    if (v29)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v30 = 3LL;
      }
      else {
        uint64_t v30 = 2LL;
      }
      uint64_t v31 = *(const char **)(v4 + 56);
      uint64_t v32 = *(void *)(a2 + 56);
      if (!v31) {
        uint64_t v31 = "[anonymous]";
      }
      *(_DWORD *)int v61 = 136446722;
      int v62 = v31;
      __int16 v63 = 2080;
      uint64_t v64 = v32;
      __int16 v65 = 1024;
      int v66 = v24;
      int v33 = v29;
    }

    else
    {
      uint64_t v42 = *(const char **)(v4 + 56);
      if (!v42) {
        uint64_t v42 = "[anonymous]";
      }
      uint64_t v43 = *(void *)(a2 + 56);
      *(_DWORD *)int v61 = 136446722;
      int v62 = v42;
      __int16 v63 = 2080;
      uint64_t v64 = v43;
      __int16 v65 = 1024;
      int v66 = v24;
      int v33 = &_os_log_default;
      uint64_t v30 = 2LL;
    }

    CFErrorRef v44 = (char *)_os_log_send_and_compose_impl(v30, 0LL, 0LL, 0LL, &_mh_execute_header, v33, 16LL);
    CFErrorRef v45 = sub_10000A444("_quire_bootstrap_service", "quire.c", 908, "com.apple.security.cryptex.posix", v24, 0LL, v44);
    free(v44);
  }

  else
  {
    buf[0] = ((16LL * (v14 & 1)) | v13) & 0xFFFFFFFFFFFFFF7FLL | (((v17 >> 1) & 1) << 7);
    __int16 v34 = calloc(1uLL, 0x490uLL);
    if (!v34) {
      sub_100040F38(&v52, v61);
    }
    uint64_t v35 = v34;
    CFErrorRef v36 = sub_10001249C(v50, buf, (uint64_t)(v34 + 1), *(void *)(v4 + 368));
    if (v36)
    {
      uint64_t v37 = *(void **)(v4 + 72);
      if (v37)
      {
        if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v38 = 3LL;
        }
        else {
          uint64_t v38 = 2LL;
        }
        uint64_t v39 = *(const char **)(v4 + 56);
        uint64_t v40 = *(void *)(a2 + 56);
        if (!v39) {
          uint64_t v39 = "[anonymous]";
        }
        *(_DWORD *)int v61 = 136446466;
        int v62 = v39;
        __int16 v63 = 2080;
        uint64_t v64 = v40;
        CFIndex v41 = v37;
      }

      else
      {
        int v46 = *(const char **)(v4 + 56);
        if (!v46) {
          int v46 = "[anonymous]";
        }
        uint64_t v47 = *(void *)(a2 + 56);
        *(_DWORD *)int v61 = 136446466;
        int v62 = v46;
        __int16 v63 = 2080;
        uint64_t v64 = v47;
        CFIndex v41 = &_os_log_default;
        uint64_t v38 = 2LL;
      }

      int v48 = (char *)_os_log_send_and_compose_impl(v38, 0LL, 0LL, 0LL, &_mh_execute_header, v41, 16LL);
      CFErrorRef v45 = sub_10000A444("_quire_bootstrap_service", "quire.c", 893, "com.apple.security.cryptex", 14LL, v36, v48);
      free(v48);
    }

    else
    {
      *uint64_t v35 = *(void *)(v4 + 448);
      *(void *)(v4 + 44_Block_object_dispose(va, 8) = v35;
      sub_1000355EC(v4);
      uint64_t v35 = 0LL;
      CFErrorRef v45 = 0LL;
    }

    sub_10003C5AC(v50);
    free(v35);
    if (v36) {
      CFRelease(v36);
    }
  }

  return v45;
}

CFErrorRef sub_100034E78(uint64_t a1)
{
  uint64_t v49 = 0LL;
  CFErrorRef v50 = 0LL;
  memset(v48, 0, sizeof(v48));
  CFTypeRef cf = 0LL;
  int v2 = 0LL;
  CFErrorRef v3 = 0LL;
  info_uint64_t asset = cryptex_core_get_info_asset(*(void *)(a1 + 200));
  if (!info_asset)
  {
    int v2 = 0LL;
    goto LABEL_12;
  }

  int v5 = sub_10003BB8C(*(_DWORD *)(info_asset + 16), v48);
  if (v5)
  {
    int v6 = v5;
    int v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = *(const char **)(a1 + 56);
      if (!v9) {
        uint64_t v9 = "[anonymous]";
      }
      int v51 = 136446466;
      uint64_t v52 = v9;
      __int16 v53 = 1024;
      int v54 = v6;
      int v10 = v7;
    }

    else
    {
      uint64_t v16 = *(const char **)(a1 + 56);
      if (!v16) {
        uint64_t v16 = "[anonymous]";
      }
      int v51 = 136446466;
      uint64_t v52 = v16;
      __int16 v53 = 1024;
      int v54 = v5;
      int v10 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    unint64_t v17 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    CFErrorRef v18 = sub_10000A444( "_quire_bootstrap_watchdog_registration",  "quire.c",  1222,  "com.apple.security.cryptex.posix",  v6,  0LL,  v17);
    free(v17);
    int v2 = 0LL;
LABEL_30:
    CFErrorRef v3 = 0LL;
    CFErrorRef v50 = v18;
    goto LABEL_31;
  }

  uint64_t v11 = (void *)xpc_create_from_plist(*(void *)&v48[0]);
  int v2 = v11;
  if (!v11 || xpc_get_type(v11) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v12 = *(void **)(a1 + 72);
    if (v12)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      int v14 = *(const char **)(a1 + 56);
      if (!v14) {
        int v14 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v14;
      uint64_t v15 = v12;
    }

    else
    {
      int v19 = *(const char **)(a1 + 56);
      if (!v19) {
        int v19 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v19;
      uint64_t v15 = &_os_log_default;
      uint64_t v13 = 2LL;
    }

    uint64_t v20 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
    CFErrorRef v18 = sub_10000A444( "_quire_bootstrap_watchdog_registration",  "quire.c",  1228,  "com.apple.security.cryptex",  11LL,  0LL,  v20);
    free(v20);
    goto LABEL_30;
  }

  int v23 = (__CFError *)sub_1000068C4(v2, &cf);
  if (v23)
  {
    CFErrorRef v3 = v23;
    int v24 = *(void **)(a1 + 72);
    if (v24)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v25 = 3LL;
      }
      else {
        uint64_t v25 = 2LL;
      }
      int v26 = *(const char **)(a1 + 56);
      if (!v26) {
        int v26 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v26;
      int v27 = v24;
    }

    else
    {
      __int16 v34 = *(const char **)(a1 + 56);
      if (!v34) {
        __int16 v34 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v34;
      int v27 = &_os_log_default;
      uint64_t v25 = 2LL;
    }

    uint64_t v35 = (char *)_os_log_send_and_compose_impl(v25, 0LL, 0LL, 0LL, &_mh_execute_header, v27, 16LL);
    CFErrorRef v36 = sub_10000A444( "_quire_bootstrap_watchdog_registration",  "quire.c",  1234,  "com.apple.security.cryptex",  11LL,  v3,  v35);
    free(v35);
    CFErrorRef v50 = v36;
    goto LABEL_31;
  }

  if (!cf || CFArrayGetCount((CFArrayRef)cf) < 1)
  {
LABEL_12:
    CFErrorRef v3 = 0LL;
LABEL_31:
    sub_10003C5AC(v48);
    CFErrorRef v21 = v50;
    goto LABEL_32;
  }

  uint64_t v28 = (const __CFArray *)sub_100007B80((void *)cf);
  CFErrorRef v29 = sub_100035688(a1, v28);
  if (v29)
  {
    CFErrorRef v3 = v29;
    uint64_t v30 = *(void **)(a1 + 72);
    if (v30)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v31 = 3LL;
      }
      else {
        uint64_t v31 = 2LL;
      }
      uint64_t v32 = *(const char **)(a1 + 56);
      if (!v32) {
        uint64_t v32 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v32;
      int v33 = v30;
    }

    else
    {
      CFIndex v41 = *(const char **)(a1 + 56);
      if (!v41) {
        CFIndex v41 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v41;
      int v33 = &_os_log_default;
      uint64_t v31 = 2LL;
    }

    uint64_t v42 = (char *)_os_log_send_and_compose_impl(v31, 0LL, 0LL, 0LL, &_mh_execute_header, v33, 16LL);
    int v43 = 1242;
    CFIndex v44 = 11LL;
  }

  else
  {
    CFErrorRef v3 = sub_100007CC8((void *)cf);
    if (!v3) {
      goto LABEL_78;
    }
    uint64_t v37 = *(void **)(a1 + 72);
    if (v37)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v38 = 3LL;
      }
      else {
        uint64_t v38 = 2LL;
      }
      uint64_t v39 = *(const char **)(a1 + 56);
      if (!v39) {
        uint64_t v39 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v39;
      uint64_t v40 = v37;
    }

    else
    {
      CFErrorRef v45 = *(const char **)(a1 + 56);
      if (!v45) {
        CFErrorRef v45 = "[anonymous]";
      }
      int v51 = 136446210;
      uint64_t v52 = v45;
      uint64_t v40 = &_os_log_default;
      uint64_t v38 = 2LL;
    }

    uint64_t v42 = (char *)_os_log_send_and_compose_impl(v38, 0LL, 0LL, 0LL, &_mh_execute_header, v40, 16LL);
    int v43 = 1248;
    CFIndex v44 = 33LL;
  }

  CFErrorRef v46 = sub_10000A444( "_quire_bootstrap_watchdog_registration",  "quire.c",  v43,  "com.apple.security.cryptex",  v44,  v3,  v42);
  free(v42);
  CFErrorRef v50 = v46;
LABEL_78:
  sub_10003C5AC(v48);
  CFErrorRef v21 = v50;
  if (v28) {
    CFRelease(v28);
  }
LABEL_32:
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v2) {
    os_release(v2);
  }
  return v21;
}

uint64_t sub_100035594(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_100035A30;
  v3[3] = &unk_100057188;
  v3[4] = a1;
  return remote_device_browse_present(0xFFFFLL, v1, v3);
}

void sub_1000355EC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a1 + 184) = v2 + 1;
  if (v2 == -1) {
    sub_100040FE0();
  }
}

void sub_100035624(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 48) == 3LL)
  {
    CFErrorRef v3 = sub_10003C818(*(void **)(a1 + 32), 0x50uLL);
    *((_DWORD *)v3 + 6) = *(_DWORD *)(a2 + 40);
    uint64_t v4 = *(void **)(a2 + 80);
    v3[4] = v4;
    xpc_retain(v4);
    sub_100030800((uint64_t)v3);
    sub_10003C8F0(v3);
  }

CFErrorRef sub_100035688(uint64_t a1, CFArrayRef theArray)
{
  size_t Count = CFArrayGetCount(theArray);
  if (Count)
  {
    CFIndex v5 = Count;
    int v6 = (const void **)calloc(Count, 8uLL);
    v21.location = 0LL;
    v21.length = v5;
    CFArrayGetValues(theArray, v21, v6);
    CFSetRef v7 = CFSetCreate(0LL, v6, v5, &kCFTypeSetCallBacks);
    if (CFSetGetCount(v7) == v5)
    {
      if (v5 < 1)
      {
        CFErrorRef v12 = 0LL;
      }

      else
      {
        CFIndex v8 = 0LL;
        while (2)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v8);
          int v10 = sub_10000A048(ValueAtIndex);
          uint64_t v11 = (const char *)(a1 + 448);
          do
          {
            uint64_t v11 = *(const char **)v11;
            if (!v11)
            {
              uint64_t v16 = *(void **)(a1 + 72);
              if (v16)
              {
                if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
                  uint64_t v17 = 3LL;
                }
                else {
                  uint64_t v17 = 2LL;
                }
                CFErrorRef v18 = v16;
              }

              else
              {
                CFErrorRef v18 = &_os_log_default;
                uint64_t v17 = 2LL;
              }

              uint64_t v20 = (char *)_os_log_send_and_compose_impl(v17, 0LL, 0LL, 0LL, &_mh_execute_header, v18, 16LL);
              CFErrorRef v12 = sub_10000A444( "_quire_validate_watchdog_service_labels",  "quire.c",  1168,  "com.apple.security.cryptex",  11LL,  0LL,  v20);
              free(v20);
              goto LABEL_29;
            }
          }

          while (strcmp(v11 + 8, v10));
          free(v10);
          CFErrorRef v12 = 0LL;
          if (++v8 != v5) {
            continue;
          }
          break;
        }
      }

      if (v7) {
        goto LABEL_23;
      }
    }

    else
    {
      uint64_t v13 = *(void **)(a1 + 72);
      if (v13)
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v14 = 3LL;
        }
        else {
          uint64_t v14 = 2LL;
        }
        uint64_t v15 = v13;
      }

      else
      {
        uint64_t v15 = &_os_log_default;
        uint64_t v14 = 2LL;
      }

      int v10 = (char *)_os_log_send_and_compose_impl(v14, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
      CFErrorRef v12 = sub_10000A444( "_quire_validate_watchdog_service_labels",  "quire.c",  1147,  "com.apple.security.cryptex",  11LL,  0LL,  v10);
LABEL_29:
      free(v10);
      if (v7) {
LABEL_23:
      }
        CFRelease(v7);
    }
  }

  else
  {
    CFErrorRef v12 = 0LL;
    int v6 = 0LL;
  }

  free(v6);
  return v12;
}

int *sub_100035A30(int *result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    uint64_t v4 = result;
    uint64_t result = (int *)remote_device_reset(a2);
    if ((result & 1) == 0)
    {
      int v5 = *__error();
      int v6 = *(const char **)(*((void *)v4 + 4) + 56LL);
      int v7 = *__error();
      CFIndex v8 = *(os_log_s **)(*((void *)v4 + 4) + 72LL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        if (!v6) {
          int v6 = "[anonymous]";
        }
        int v9 = 136446722;
        int v10 = v6;
        __int16 v11 = 2080;
        uint64_t name = remote_device_get_name(a2);
        __int16 v13 = 1024;
        int v14 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to reset remote device: %s: %{darwin.errno}d",  (uint8_t *)&v9,  0x1Cu);
      }

      uint64_t result = __error();
      _DWORD *result = v7;
    }
  }

  return result;
}

void sub_100035B40(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 188);
  BOOL v3 = v2 != 0;
  __int128 v27 = 0u;
  memset(v26, 0, sizeof(v26));
  *((void *)&v26[0] + 1) = *(void *)(a1 + 416);
  LODWORD(v27) = v2;
  *((void *)&v27 + 1) = *(void *)(a1 + 72);
  uint64_t v28 = 0LL;
  sub_1000355EC(a1);
  uint64_t v4 = *(char **)(a1 + 448);
  if (v4)
  {
    char v5 = 0;
    uint64_t v25 = 32LL * v3;
    int v6 = (void **)(a1 + 448);
    do
    {
      int v7 = *(const char **)(a1 + 56);
      int v8 = *__error();
      int v9 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = "[anonymous]";
        if (v7) {
          int v10 = v7;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&void buf[4] = v10;
        *(_WORD *)&_BYTE buf[12] = 2080;
        *(void *)&buf[14] = v4 + 8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s: unbootstrapping service: %s",  buf,  0x16u);
      }

      *__error() = v8;
      BOOL v11 = v4[1160] != 0;
      *(void *)&v26[0] = v25;
      int v12 = sub_1000131E0(v4 + 8, (uint64_t)v26);
      if (v12)
      {
        int v13 = v12;
        int v14 = *(const char **)(a1 + 56);
        int v15 = *__error();
        uint64_t v16 = *(os_log_s **)(a1 + 72);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446722;
          uint64_t v17 = "[anonymous]";
          if (v14) {
            uint64_t v17 = v14;
          }
          *(void *)&void buf[4] = v17;
          *(_WORD *)&_BYTE buf[12] = 2080;
          *(void *)&buf[14] = v4 + 8;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v30) = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to unbootstrap service: %s: %{darwin.errno}d",  buf,  0x1Cu);
        }

        *__error() = v15;
      }

      sub_100036148(a1);
      CFErrorRef v18 = *(char **)(a1 + 448);
      int v19 = (char *)(a1 + 448);
      while (v18 != v4)
      {
        int v19 = v18;
        CFErrorRef v18 = *(char **)v18;
      }

      v5 |= v11;
      *(void *)int v19 = *(void *)v4;
      free(v4);
      uint64_t v4 = (char *)*v6;
    }

    while (*v6);
    if ((v5 & 1) != 0)
    {
      uint64_t v20 = *(const char **)(a1 + 56);
      int v21 = *__error();
      uint64_t v22 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v23 = "[anonymous]";
        if (v20) {
          int v23 = v20;
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&void buf[4] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%{public}s: resetting remote devices for removed remote services",  buf,  0xCu);
      }

      *__error() = v21;
      uint64_t v24 = *(void *)(a1 + 24);
      *(void *)int buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 0x40000000LL;
      *(void *)&uint8_t buf[16] = sub_100035A30;
      uint64_t v30 = &unk_100057188;
      uint64_t v31 = a1;
      remote_device_browse_present(0xFFFFLL, v24, buf);
    }
  }

  sub_100036148(a1);
}

_DWORD *sub_100035E40(uint64_t a1)
{
  int v21 = 0;
  __int128 v39 = 0u;
  memset(v40, 0, sizeof(v40));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v32 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v27 = 0u;
  int v2 = *(const char **)(a1 + 56);
  int v3 = *__error();
  uint64_t v4 = *(os_log_s **)(a1 + 72);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    char v5 = "[anonymous]";
    if (v2) {
      char v5 = v2;
    }
    *(_DWORD *)int buf = 136446210;
    int v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s: unbootstrap diags", buf, 0xCu);
  }

  uint64_t result = __error();
  _DWORD *result = v3;
  if ((*(_BYTE *)(a1 + 176) & 0x20) != 0)
  {
    if (statfs("/", &v41))
    {
      int v7 = *__error();
      int v8 = *(const char **)(a1 + 56);
      int v9 = *__error();
      int v10 = *(os_log_s **)(a1 + 72);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        uint64_t result = __error();
        _DWORD *result = v9;
        return result;
      }

      BOOL v11 = "[anonymous]";
      if (v8) {
        BOOL v11 = v8;
      }
      *(_DWORD *)int buf = 136446466;
      int v23 = v11;
      __int16 v24 = 1024;
      int v25 = v7;
      int v12 = "%{public}s: failed to statfs root path: %{darwin.errno}d";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x12u);
      goto LABEL_12;
    }

    sscanf(v41.f_mntfromname, "/dev/disk%d", &v21);
    snprintf(__str, 0xFFuLL, "disk%d", v21);
    if (unlink("/AppleInternal/Diags") && *__error() != 2)
    {
      int v18 = *__error();
      int v19 = *(const char **)(a1 + 56);
      int v9 = *__error();
      int v10 = *(os_log_s **)(a1 + 72);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v20 = "[anonymous]";
      if (v19) {
        uint64_t v20 = v19;
      }
      *(_DWORD *)int buf = 136446466;
      int v23 = v20;
      __int16 v24 = 1024;
      int v25 = v18;
      int v12 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
      goto LABEL_11;
    }

    uint64_t result = (_DWORD *)sub_10000E964((uint64_t)__str, 640LL, *(os_log_s **)(a1 + 72));
    if ((_DWORD)result)
    {
      int v13 = (int)result;
      int v14 = *(const char **)(a1 + 56);
      int v15 = *__error();
      uint64_t v16 = *(os_log_s **)(a1 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = "[anonymous]";
        if (v14) {
          uint64_t v17 = v14;
        }
        *(_DWORD *)int buf = 136446466;
        int v23 = v17;
        __int16 v24 = 1024;
        int v25 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to delete diags volume: %{darwin.errno}d",  buf,  0x12u);
      }

      uint64_t result = __error();
      _DWORD *result = v15;
    }

    else
    {
      *(void *)(a1 + 176) &= ~0x20uLL;
    }
  }

  return result;
}

void sub_100036148(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a1 + 184) = v2 - 1;
  if (!v2) {
    sub_100040FE0();
  }
  if (v2 == 1)
  {
    uint64_t v3 = *(void *)(a1 + 376);
    if (v3)
    {
      uint64_t v4 = (uint64_t *)(a1 + 376);
      do
      {
        if ((*(_DWORD *)(v3 + 44) & 0x80000000) != 0) {
          sub_10002F980((void *)v3);
        }
        else {
          sub_10002BAF0((uint64_t *)v3);
        }
        uint64_t v5 = *v4;
        uint64_t v6 = *v4;
        if (*v4 == v3)
        {
          uint64_t v5 = *(void *)(v3 + 24);
          uint64_t *v4 = v5;
          if (!v5)
          {
            *(void *)(a1 + 384) = v4;
            *(void *)(v3 + 24) = -1LL;
            return;
          }
        }

        else
        {
          do
          {
            uint64_t v7 = v6;
            uint64_t v6 = *(void *)(v6 + 24);
          }

          while (v6 != v3);
          uint64_t v8 = *(void *)(v3 + 24);
          *(void *)(v7 + 24) = v8;
          uint64_t v9 = v7 + 24;
          if (!v8) {
            *(void *)(a1 + 384) = v9;
          }
        }

        *(void *)(v3 + 24) = -1LL;
        uint64_t v3 = v5;
      }

      while (v5);
    }
  }

uint64_t sub_100036214(void *a1)
{
  int v2 = (void *)a1[58];
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = (const char *)a1[7];
      int v5 = *__error();
      uint64_t v6 = (os_log_s *)a1[9];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = a1[52];
        if (v4) {
          uint64_t v8 = v4;
        }
        else {
          uint64_t v8 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        int v19 = v8;
        __int16 v20 = 2080;
        uint64_t v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: Found a Launch Agent while removing quire: %s - going to deactivate it.",  buf,  0x16u);
      }

      *__error() = v5;
      sub_1000363FC(v2, a1);
      int v2 = v3;
    }

    while (v3);
  }

  sub_1000355EC((uint64_t)a1);
  uint64_t v9 = (void *)a1[57];
  if (v9)
  {
    do
    {
      int v10 = (void *)a1[57];
      BOOL v11 = a1 + 57;
      while (v10 != v9)
      {
        BOOL v11 = v10;
        int v10 = (void *)*v10;
      }

      int v12 = (void *)*v9;
      void *v11 = *v9;
      void *v9 = -1LL;
      sub_10003C5AC(v9 + 16);
      free(v9);
      sub_100036148(a1);
      uint64_t v9 = v12;
    }

    while (v12);
  }

  int v13 = (const char *)a1[7];
  int v14 = *__error();
  int v15 = (os_log_s *)a1[9];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    if (v13) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446210;
    int v19 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s: Removed all launch agents.",  buf,  0xCu);
  }

  *__error() = v14;
  return sub_100036148(a1);
}

void sub_1000363FC(char *a1, void *a2)
{
  uint64_t v4 = a1 + 8;
  int v5 = sub_1000131E0(a1 + 8, (uint64_t)(a1 + 1168));
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = (const char *)a2[7];
    int v8 = *__error();
    uint64_t v9 = (os_log_s *)a2[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = "[anonymous]";
      int v13 = 136446722;
      if (v7) {
        int v10 = v7;
      }
      int v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = v4;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to unbootstrap agent: %s: %{darwin.errno}d",  (uint8_t *)&v13,  0x1Cu);
    }

    *__error() = v8;
  }

  BOOL v11 = (char *)a2[58];
  if (v11 == a1)
  {
    int v12 = (char *)(a2 + 58);
  }

  else
  {
    do
    {
      int v12 = v11;
      BOOL v11 = *(char **)v11;
    }

    while (v11 != a1);
  }

  *(void *)int v12 = *(void *)a1;
  *(void *)a1 = -1LL;
  sub_100036148((uint64_t)a2);
  free(a1);
}

  ;
}

uint64_t sub_100036564(int a1)
{
  int v2 = a1;
  uint64_t result = sysctlbyname("kern.proc_rsr_in_progress", 0LL, 0LL, &v2, 4uLL);
  if ((_DWORD)result) {
    return *__error();
  }
  return result;
}

uint64_t sub_1000365AC(void *a1, uint64_t a2, _BYTE *a3)
{
  __int16 v91 = 0LL;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  int v6 = (void *)sub_100011440(a2, 0LL);
  uint64_t v7 = sub_1000114A4((uint64_t)v6);
  if ((_DWORD)v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (const char *)a1[7];
    int v10 = *__error();
    BOOL v11 = (os_log_s *)a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = "[anonymous]";
      if (v9) {
        int v12 = v9;
      }
      *(_DWORD *)int buf = 136446466;
      __int16 v93 = v12;
      __int16 v94 = 1024;
      LODWORD(v95) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to resolve proc: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v10;
    goto LABEL_25;
  }

  unint64_t v13 = *(void *)(a2 + 24);
  if (v13 > 4)
  {
LABEL_24:
    uint64_t v8 = 22LL;
    goto LABEL_25;
  }

  int v14 = off_1000571D8[v13];
  __int16 v15 = (&off_100057228)[v13];
  uint64_t v8 = sub_1000120BC((uint64_t)v6, (&off_100057200)[v13]);
  uint64_t v16 = (const char *)a1[7];
  int v83 = *__error();
  __int16 v17 = (os_log_s *)a1[9];
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = "[anonymous]";
      uint64_t v19 = v6[8];
      uint64_t v20 = v6[9];
      if (v16) {
        int v18 = v16;
      }
      *(_DWORD *)int buf = 136447490;
      __int16 v93 = v18;
      __int16 v94 = 2080;
      char v95 = v14;
      __int16 v96 = 2080;
      signed int v97 = v15;
      __int16 v98 = 2080;
      uint64_t v99 = v19;
      __int16 v100 = 2080;
      uint64_t v101 = v20;
      __int16 v102 = 1024;
      int v103 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}s: proc not entitled for %s: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d",  buf,  0x3Au);
    }

    *__error() = v83;
    goto LABEL_25;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = "[anonymous]";
    if (v16) {
      uint64_t v21 = v16;
    }
    uint64_t v22 = v6[8];
    uint64_t v23 = v6[9];
    *(_DWORD *)int buf = 136447234;
    __int16 v93 = v21;
    __int16 v94 = 2080;
    char v95 = v14;
    __int16 v96 = 2080;
    signed int v97 = v15;
    __int16 v98 = 2080;
    uint64_t v99 = v22;
    __int16 v100 = 2080;
    uint64_t v101 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%{public}s: authorized proc for %s: entitlement = %s, proc = %s, signing id = %s",  buf,  0x34u);
  }

  *__error() = v83;
  uint64_t v8 = 45LL;
  switch(v13)
  {
    case 0uLL:
      __int16 v24 = (void *)sub_100011440(a2, 0LL);
      uint64_t v25 = sub_1000114A4((uint64_t)v24);
      if ((_DWORD)v25)
      {
        uint64_t v8 = v25;
        int v26 = (const char *)a1[7];
        int v27 = *__error();
        __int128 v28 = (os_log_s *)a1[9];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          __int128 v29 = "[anonymous]";
          if (v26) {
            __int128 v29 = v26;
          }
          *(_DWORD *)int buf = 136446466;
          __int16 v93 = v29;
          __int16 v94 = 1024;
          LODWORD(v95) = v8;
          __int128 v30 = "%{public}s: failed to resolve proc: %{darwin.errno}d";
          __int128 v31 = v28;
          uint32_t v32 = 18;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
          goto LABEL_40;
        }

        goto LABEL_40;
      }

      BOOL v36 = sub_1000120BC((uint64_t)v24, "com.apple.private.security.cryptex.install");
      if (v36)
      {
        uint64_t v8 = v36;
        __int128 v37 = (const char *)a1[7];
        int v27 = *__error();
        __int128 v38 = (os_log_s *)a1[9];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          __int128 v39 = "[anonymous]";
          if (v37) {
            __int128 v39 = v37;
          }
          uint64_t v40 = (char *)v24[8];
          uint64_t v41 = v24[9];
          *(_DWORD *)int buf = 136447234;
          __int16 v93 = v39;
          __int16 v94 = 2080;
          char v95 = "com.apple.private.security.cryptex.install";
          __int16 v96 = 2080;
          signed int v97 = v40;
          __int16 v98 = 2080;
          uint64_t v99 = v41;
          __int16 v100 = 1024;
          LODWORD(v101) = v8;
          __int128 v30 = "%{public}s: proc not entitled for install: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d";
          __int128 v31 = v38;
          uint32_t v32 = 48;
          goto LABEL_39;
        }

LABEL_60:
          *__error() = v49;
          uint64_t v8 = 34LL;
          goto LABEL_41;
        }

        __int128 v56 = (void *)cryptex_core_create(0LL);
        uint64_t v57 = cryptex_core_set_assets_from_fds( v56,  *((void *)&v88 + 1),  &v87,  (char *)&v87 + 4,  (char *)&v87 + 8,  (unint64_t)&v87 | 0xC,  &v88);
        if ((_DWORD)v57)
        {
          uint64_t v8 = v57;
          uint64_t v58 = (const char *)a1[7];
          int v59 = *__error();
          uint64_t v60 = (os_log_s *)a1[9];
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            int v61 = "[anonymous]";
            if (v58) {
              int v61 = v58;
            }
            *(_DWORD *)int buf = 136446466;
            __int16 v93 = v61;
            __int16 v94 = 1024;
            LODWORD(v95) = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "%{public}s: set assets to core from fds failed: %{darwin.errno}d",  buf,  0x12u);
          }

          *__error() = v59;
LABEL_105:
          if (v56) {
            os_release(v56);
          }
          goto LABEL_41;
        }

        int v62 = v91;
        if (cryptex_core_is_cryptex1(v56))
        {
          uint64_t v63 = cryptex_core_cx1_properties_create_with_xpc_dictionary(v62);
          if (!v63)
          {
            uint64_t v79 = (const char *)a1[7];
            int v80 = *__error();
            int v81 = (os_log_s *)a1[9];
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              BOOL v82 = "[anonymous]";
              if (v79) {
                BOOL v82 = v79;
              }
              *(_DWORD *)int buf = 136446466;
              __int16 v93 = v82;
              __int16 v94 = 1024;
              LODWORD(v95) = 22;
              _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to parse Cryptex1 properties.: %{darwin.errno}d",  buf,  0x12u);
            }

            id v68 = 0LL;
            *__error() = v80;
            uint64_t v8 = 22LL;
            goto LABEL_101;
          }

          uint64_t v64 = (void *)v63;
          cryptex_core_set_cryptex1_properties(v56);
        }

        else
        {
          uint64_t v64 = 0LL;
        }

        if (v53 == 2)
        {
          int v69 = (const char *)a1[7];
          int v85 = *__error();
          uint32_t v70 = (os_log_s *)a1[9];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            int v71 = "[anonymous]";
            if (v69) {
              int v71 = v69;
            }
            *(_DWORD *)int buf = 136446210;
            __int16 v93 = v71;
            _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEBUG,  "%{public}s: using NO signing service",  buf,  0xCu);
          }

          *__error() = v85;
          uint64_t v72 = 4LL;
        }

        else
        {
          if (v53 != 1)
          {
            if (v53)
            {
              id v68 = 0LL;
              uint64_t v8 = 22LL;
LABEL_94:
              if (v64) {
                os_release(v64);
              }
LABEL_101:
              if (v62) {
                os_release(v62);
              }
              if (v68) {
                os_release(v68);
              }
              goto LABEL_105;
            }

            __int16 v65 = (const char *)a1[7];
            int v84 = *__error();
            int v66 = (os_log_s *)a1[9];
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v67 = "[anonymous]";
              if (v65) {
                uint64_t v67 = v65;
              }
              *(_DWORD *)int buf = 136446210;
              __int16 v93 = v67;
              _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEBUG,  "%{public}s: using default signing service",  buf,  0xCu);
            }

            id v68 = 0LL;
            *__error() = v84;
LABEL_90:
            __int128 v76 = v90;
            v56[6] = *((void *)&v89 + 1);
            v56[7] = *((void *)&v76 + 1);
            if ((void)v76) {
              v56[5] |= 2uLL;
            }
            CFIndex v77 = sub_10002A130(a1, (_BYTE *)a2, a3);
            int v78 = sub_100037F1C(a1, v77, 0LL, 0, 0LL, sub_100036FB4);
            sub_1000161A8(a1, v56, v78);
            uint64_t v8 = 36LL;
            goto LABEL_94;
          }

          int v73 = (const char *)a1[7];
          int v86 = *__error();
          int v74 = (os_log_s *)a1[9];
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            int v75 = "[anonymous]";
            if (v73) {
              int v75 = v73;
            }
            *(_DWORD *)int buf = 136446210;
            __int16 v93 = v75;
            _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEBUG,  "%{public}s: using supplemental signing service",  buf,  0xCu);
          }

          *__error() = v86;
          uint64_t v72 = 1LL;
        }

        id v68 = (void *)cryptex_host_create(0LL, v72);
        cryptex_core_attach_host(v56, v68);
        goto LABEL_90;
      }

      uint64_t v8 = v42;
      int v43 = xpc_copy_description(*(xpc_object_t *)(a2 + 296));
      CFIndex v44 = (const char *)a1[7];
      int v45 = *__error();
      CFErrorRef v46 = (os_log_s *)a1[9];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = "[anonymous]";
        *(_DWORD *)int buf = 136446722;
        if (v44) {
          uint64_t v47 = v44;
        }
        __int16 v93 = v47;
        __int16 v94 = 2080;
        char v95 = v43;
        __int16 v96 = 1024;
        LODWORD(v97) = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%{public}s: failed to unpack ipc: %s: %{darwin.errno}d",  buf,  0x1Cu);
      }

      *__error() = v45;
      free(v43);
LABEL_41:
      if (v24) {
        os_release(v24);
      }
LABEL_25:
      if (v6) {
        os_release(v6);
      }
      if (a1) {
        os_release(a1);
      }
      return v8;
    case 1uLL:
      uint64_t v8 = codex_list_unpack(a2, &v87);
      if ((_DWORD)v8) {
        goto LABEL_25;
      }
      __int128 v35 = sub_10002A130(a1, (_BYTE *)a2, a3);
      sub_100017E68(a1, v35, sub_100037798);
LABEL_33:
      uint64_t v8 = 36LL;
      goto LABEL_25;
    case 2uLL:
      __int128 v34 = sub_10002A130(a1, (_BYTE *)a2, a3);
      sub_100017CE0(a1, v34, sub_1000377FC);
      goto LABEL_33;
    case 3uLL:
    case 4uLL:
      goto LABEL_25;
    default:
      goto LABEL_24;
  }

void sub_100036FB4(uint64_t a1, void *a2, const void *a3, uint64_t a4)
{
  uint64_t v29 = a4;
  if (a3)
  {
    uint64_t v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = *(const char **)(a1 + 56);
      if (!v9) {
        uint64_t v9 = "[anonymous]";
      }
      int v30 = 136446210;
      __int128 v31 = v9;
      int v10 = v7;
    }

    else
    {
      uint64_t v16 = *(const char **)(a1 + 56);
      if (!v16) {
        uint64_t v16 = "[anonymous]";
      }
      int v30 = 136446210;
      __int128 v31 = v16;
      int v10 = &_os_log_default;
      uint64_t v8 = 2LL;
    }

    __int16 v17 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v10, 16LL);
    int v18 = "com.apple.security.cryptex";
    int v19 = 171;
    CFIndex v20 = 14LL;
    uint64_t v21 = a3;
  }

  else
  {
    int v11 = *(_DWORD *)(a4 + 8);
    if (v11)
    {
      int v12 = *(void **)(a1 + 72);
      if (v12)
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v13 = 3LL;
        }
        else {
          uint64_t v13 = 2LL;
        }
        int v14 = *(const char **)(a1 + 56);
        if (!v14) {
          int v14 = "[anonymous]";
        }
        int v30 = 136446466;
        __int128 v31 = v14;
        __int16 v32 = 1024;
        int v33 = v11;
        __int16 v15 = v12;
      }

      else
      {
        int v26 = *(const char **)(a1 + 56);
        if (!v26) {
          int v26 = "[anonymous]";
        }
        int v30 = 136446466;
        __int128 v31 = v26;
        __int16 v32 = 1024;
        int v33 = v11;
        __int16 v15 = &_os_log_default;
        uint64_t v13 = 2LL;
      }

      __int16 v17 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v15, 16LL);
      int v18 = "com.apple.security.cryptex.posix";
      int v19 = 179;
      CFIndex v20 = v11;
      uint64_t v21 = 0LL;
    }

    else
    {
      if (!*(void *)(a4 + 16))
      {
        sub_10001737C(a1, a2, (void *)a4, sub_1000373B0);
        return;
      }

      uint64_t v22 = *(void **)(a1 + 72);
      if (v22)
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR)) {
          uint64_t v23 = 3LL;
        }
        else {
          uint64_t v23 = 2LL;
        }
        __int16 v24 = *(const char **)(a1 + 56);
        if (!v24) {
          __int16 v24 = "[anonymous]";
        }
        int v30 = 136446210;
        __int128 v31 = v24;
        uint64_t v25 = v22;
      }

      else
      {
        int v27 = *(const char **)(a1 + 56);
        if (!v27) {
          int v27 = "[anonymous]";
        }
        int v30 = 136446210;
        __int128 v31 = v27;
        uint64_t v25 = &_os_log_default;
        uint64_t v23 = 2LL;
      }

      __int16 v17 = (char *)_os_log_send_and_compose_impl(v23, 0LL, 0LL, 0LL, &_mh_execute_header, v25, 16LL);
      uint64_t v21 = *(const void **)(a4 + 16);
      int v18 = "com.apple.security.cryptex";
      int v19 = 187;
      CFIndex v20 = 4LL;
    }
  }

  __int128 v28 = sub_10000A444("_codex_rpc_install_continue2", "sub_codex.c", v19, v18, v20, v21, v17);
  free(v17);
  if (v28)
  {
    sub_10002A1C8((uint64_t *)(a4 + 24), v28);
    sub_100037F94(&v29);
    CFRelease(v28);
  }

void sub_1000373B0(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  __int16 v17 = a4;
  if (a3)
  {
    int v8 = *__error();
    uint64_t v9 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "bootstrap failed, unbootstrapping: %@",  (uint8_t *)buf,  0xCu);
    }

    *__error() = v8;
    a4[2] = (uint64_t)CFRetain(a3);
    sub_100017570(a1, (void *)a2, 1uLL, a4, sub_10003757C);
  }

  else
  {
    *(void *)&buf[0] = *(void *)(a2 + 208);
    *((void *)&buf[0] + 1) = **(void **)(a2 + 224);
    buf[1] = *(_OWORD *)(a2 + 424);
    uint64_t v25 = *(void *)(a2 + 416);
    int v10 = a4 + 3;
    codex_install_reply_pack(buf, *(void *)(a4[3] + 32));
    int v11 = *(const char **)(a1 + 56);
    int v12 = *__error();
    uint64_t v13 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = "[anonymous]";
      if (v11) {
        int v14 = v11;
      }
      uint64_t v15 = *(void *)(a2 + 208);
      uint64_t v16 = *(void *)(a2 + 416);
      *(_DWORD *)int v18 = 136446722;
      int v19 = v14;
      __int16 v20 = 2080;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      uint64_t v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}s: replying: uint64_t name = %s, mnt path = %s",  v18,  0x20u);
    }

    *__error() = v12;
    sub_10002A180(v10, 0);
    sub_100037F94((uint64_t *)&v17);
  }

void sub_10003757C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  int v8 = *__error();
  uint64_t v9 = *(os_log_s **)(a1 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = a3;
      int v10 = "unbootstrap: %@";
      int v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    int v10 = "unbootstrap [no error]";
    int v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    uint32_t v13 = 2;
    goto LABEL_6;
  }

  *__error() = v8;
  sub_100016BE8((dispatch_queue_t *)a1, a2, a4, sub_100037690);
}

void sub_100037690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a4;
  int v7 = *__error();
  int v8 = *(os_log_s **)(a1 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      uint64_t v15 = a3;
      uint64_t v9 = "uninstall: %@";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    uint64_t v9 = "uninstall [no error]";
    int v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    uint32_t v12 = 2;
    goto LABEL_6;
  }

  *__error() = v7;
  sub_10002A1C8((uint64_t *)(a4 + 24), *(__CFError **)(a4 + 16));
  sub_100037F94(&v13);
}

void sub_100037798(int a1, int a2, xpc_object_t object, uint64_t a4)
{
  uint64_t v7 = a4;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_array)
  {
    xpc_object_t v6 = object;
    codex_list_reply_pack(&v6, *(void *)(a4 + 32));
    sub_10002A180(&v7, 0);
  }

  else
  {
    __break(1u);
  }

void sub_1000377FC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v9 = a3;
  if (a2)
  {
    int v5 = *(const char **)(a1 + 56);
    int v6 = *__error();
    uint64_t v7 = *(os_log_s **)(a1 + 72);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = "[anonymous]";
      if (v5) {
        int v8 = v5;
      }
      *(_DWORD *)int buf = 136446466;
      os_log_type_t v11 = v8;
      __int16 v12 = 1024;
      int v13 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s: codex lockdown failed: %{darwin.errno}d",  buf,  0x12u);
    }

    *__error() = v6;
  }

  sub_10002A180(&v9, a2);
}

void sub_1000378E4(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v1);
    uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    string = xpc_dictionary_get_string(v2, "cryptex_name");
    if (string)
    {
      uint64_t v6 = (uint64_t)string;
      __int128 buffer = *(_OWORD *)"unknown";
      __int128 v27 = unk_100044CD5;
      pid_t pid = xpc_connection_get_pid(v4);
      proc_name(pid, &buffer, 0x20u);
      int v8 = *__error();
      id v9 = sub_100037B58();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        if (v4) {
          pid_t v11 = xpc_connection_get_pid(v4);
        }
        else {
          pid_t v11 = -1;
        }
        int v20 = 136315650;
        p___int128 buffer = &buffer;
        __int16 v22 = 1024;
        pid_t v23 = v11;
        __int16 v24 = 2080;
        uint64_t v25 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "XPC client <process=%s pid=%d>: Blocking client during upgrade for cryptex '%s'.",  (uint8_t *)&v20,  0x1Cu);
      }

      *__error() = v8;
      sub_100005F84(v6, (uint64_t)v2, (uint64_t)sub_100037B98);
    }

    else
    {
      __int128 buffer = *(_OWORD *)"unknown";
      __int128 v27 = unk_100044CD5;
      pid_t v15 = xpc_connection_get_pid(v4);
      proc_name(v15, &buffer, 0x20u);
      int v16 = *__error();
      id v17 = sub_100037B58();
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        if (v4) {
          pid_t v19 = xpc_connection_get_pid(v4);
        }
        else {
          pid_t v19 = -1;
        }
        int v20 = 136315394;
        p___int128 buffer = &buffer;
        __int16 v22 = 1024;
        pid_t v23 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "XPC client <process=%s pid=%d>: Client did not provide the name of a cryptex to block on.",  (uint8_t *)&v20,  0x12u);
      }

      *__error() = v16;
      sub_100037B98(v2, 0LL);
    }
  }

  else
  {
    int v12 = *__error();
    id v13 = sub_100037B58();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid input.", (uint8_t *)&buffer, 2u);
    }

    *__error() = v12;
  }
}

id sub_100037B58()
{
  if (qword_10005A8B0 != -1) {
    dispatch_once(&qword_10005A8B0, &stru_100057250);
  }
  return (id)qword_10005A8A8;
}

void sub_100037B98(xpc_object_t xdict, uint64_t a2)
{
  if (xdict)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
    int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    string = xpc_dictionary_get_string(xdict, "cryptex_name");
    if (!string) {
      goto LABEL_19;
    }
    uint64_t v7 = string;
    *(_OWORD *)__int128 buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044CD5;
    pid_t pid = xpc_connection_get_pid(v5);
    proc_name(pid, buffer, 0x20u);
    int v9 = *__error();
    id v10 = sub_100037B58();
    pid_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    int v12 = v11;
    if (a2)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        if (v5) {
          pid_t v13 = xpc_connection_get_pid(v5);
        }
        else {
          pid_t v13 = -1;
        }
        *(_DWORD *)__int128 v34 = 136315906;
        *(void *)&v34[4] = buffer;
        *(_WORD *)&v34[12] = 1024;
        *(_DWORD *)&v34[14] = v13;
        *(_WORD *)&v34[18] = 2080;
        *(void *)&v34[20] = v7;
        *(_WORD *)&v34[28] = 2112;
        *(void *)&v34[30] = a2;
        int v18 = "XPC client <process=%s pid=%d>: Upgrade for cryptex '%s' has finished.: %@";
        pid_t v19 = v12;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        uint32_t v21 = 38;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, v34, v21);
      }
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (v5) {
        pid_t v17 = xpc_connection_get_pid(v5);
      }
      else {
        pid_t v17 = -1;
      }
      *(_DWORD *)__int128 v34 = 136315650;
      *(void *)&v34[4] = buffer;
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = v17;
      *(_WORD *)&v34[18] = 2080;
      *(void *)&v34[20] = v7;
      int v18 = "XPC client <process=%s pid=%d>: Upgrade for cryptex '%s' has finished. [no error]";
      pid_t v19 = v12;
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      uint32_t v21 = 28;
      goto LABEL_17;
    }

    *__error() = v9;
LABEL_19:
    *(_OWORD *)__int128 v34 = *(_OWORD *)"unknown";
    *(_OWORD *)&v34[16] = unk_100044CD5;
    pid_t v22 = xpc_connection_get_pid(v5);
    proc_name(v22, v34, 0x20u);
    int v23 = *__error();
    id v24 = sub_100037B58();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    int v26 = v25;
    if (a2)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        if (v5) {
          pid_t v27 = xpc_connection_get_pid(v5);
        }
        else {
          pid_t v27 = -1;
        }
        *(_DWORD *)__int128 buffer = 136315650;
        *(void *)&buffer[4] = v34;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v27;
        *(_WORD *)&buffer[18] = 2112;
        *(void *)&buffer[20] = a2;
        uint64_t v29 = "XPC client <process=%s pid=%d>: Unblocking client.: %@";
        int v30 = v26;
        os_log_type_t v31 = OS_LOG_TYPE_ERROR;
        uint32_t v32 = 28;
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buffer, v32);
      }
    }

    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      if (v5) {
        pid_t v28 = xpc_connection_get_pid(v5);
      }
      else {
        pid_t v28 = -1;
      }
      *(_DWORD *)__int128 buffer = 136315394;
      *(void *)&buffer[4] = v34;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v28;
      uint64_t v29 = "XPC client <process=%s pid=%d>: Unblocking client. [no error]";
      int v30 = v26;
      os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
      uint32_t v32 = 18;
      goto LABEL_30;
    }

    *__error() = v23;
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    xpc_dictionary_send_reply(reply);

    goto LABEL_32;
  }

  int v14 = *__error();
  id v15 = sub_100037B58();
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid input.", v34, 2u);
  }

  *__error() = v14;
LABEL_32:
}

void sub_100037EEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.libcryptex", "upgrade_sub_trampoline");
  int v2 = (void *)qword_10005A8A8;
  qword_10005A8A8 = (uint64_t)v1;
}

void **sub_100037F1C(void *a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  pid_t v11 = sub_10003C818(a1, 0x40uLL);
  *((_DWORD *)v11 + 12) = a4;
  v11[3] = a2;
  void v11[4] = a3;
  if (a3) {
    os_retain(a3);
  }
  v11[7] = 0LL;
  if (a5) {
    v11[7] = xpc_retain(a5);
  }
  _OWORD v11[5] = a6;
  return v11;
}

void sub_100037F94(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*(void *)(*a1 + 24)) {
      sub_100040FF8();
    }
    uint64_t v3 = *(void **)(v2 + 32);
    if (v3)
    {
      os_release(v3);
      *(void *)(v2 + 32) = 0LL;
    }

    uint64_t v4 = *(void **)(v2 + 56);
    if (v4)
    {
      xpc_release(v4);
      *(void *)(v2 + 56) = 0LL;
    }

    sub_10003C8F0((void **)v2);
    *a1 = 0LL;
  }

id sub_100037FF0(uint64_t a1)
{
  if (a1)
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_100041010(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    return 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Using system domain",  v10,  2u);
    }

    return (id)objc_claimAutoreleasedReturnValue( +[OSLaunchdDomain currentDomain]( &OBJC_CLASS___OSLaunchdDomain,  "currentDomain"));
  }

uint64_t sub_100038080()
{
  return 0LL;
}

uint64_t sub_100038088(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[OSLaunchdDomain domainForRoleAccountUser:]( &OBJC_CLASS___OSLaunchdDomain,  "domainForRoleAccountUser:",  a1));
  if (v2)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100041108(a1, v4, v5, v6, v7, v8, v9, v10);
    }
    uint64_t v3 = 33LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109120;
    int v16 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Uncorking session for uid %d",  buf,  8u);
  }

  id v14 = 0LL;
  unsigned __int8 v11 = [v2 unpendLaunches:&v14];
  id v12 = v14;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100041088(v12);
    }
    uint64_t v3 = 22LL;
  }

  return v3;
}

uint64_t sub_1000381C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[OSLaunchdDomain domainForRoleAccountUser:]( &OBJC_CLASS___OSLaunchdDomain,  "domainForRoleAccountUser:",  a1));
  if (v4)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100041108(a1, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v5 = 33LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Shutting down process monitoring",  buf,  2u);
  }

  id v13 = +[OSLaunchdJob copyJobWithLabel:domain:](&OBJC_CLASS___OSLaunchdJob, "copyJobWithLabel:domain:", a2, v4);
  id v14 = v13;
  if (v13)
  {
    [v13 cancelMonitor];
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)int buf = 0;
    id v15 = "Shut down process monitoring";
  }

  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)int buf = 0;
    id v15 = "Couldn't find job to stop it from being monitored";
  }

  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
LABEL_14:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109120;
    int v21 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Closing domain for uid %d",  buf,  8u);
  }

  id v19 = 0LL;
  unsigned __int8 v16 = [v4 initiateRemoval:&v19];
  id v17 = v19;
  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100041174(v17);
    }
    uint64_t v5 = 22LL;
  }

  return v5;
}

uint64_t sub_1000383F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = sub_100037FF0(0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = *__error();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shutting down process monitoring", buf, 2u);
  }

  *__error() = v7;
  id v8 = +[OSLaunchdJob copyJobWithLabel:domain:](&OBJC_CLASS___OSLaunchdJob, "copyJobWithLabel:domain:", a2, v6);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 cancelMonitor];
    int v10 = *__error();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shut down process monitoring", buf, 2u);
    }

    *__error() = v10;
    id v18 = 0LL;
    [v9 remove:&v18];
    id v11 = v18;
    if (v11)
    {
      uint64_t v12 = v11;
      if ([v11 code] == (id)36)
      {
        int v13 = *__error();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removing launchd job", buf, 2u);
        }

        *__error() = v13;

        uint64_t v14 = 0LL;
      }

      else
      {
        uint64_t v14 = (uint64_t)[v12 code];
      }
    }

    else
    {
      int v16 = *__error();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removed launchd job", buf, 2u);
      }

      uint64_t v14 = 0LL;
      *__error() = v16;
    }
  }

  else
  {
    int v15 = *__error();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Couldn't find job to stop it from being monitored",  buf,  2u);
    }

    *__error() = v15;
    uint64_t v14 = 3LL;
  }

  return v14;
}

CFErrorRef sub_100038630(void *a1, int a2, uint64_t a3)
{
  id v4 = a1;
  xpc_object_t array = xpc_dictionary_get_array(v4, "_ManagedBy");
  uint64_t object = objc_claimAutoreleasedReturnValue(array);
  string = xpc_dictionary_get_string(v4, "_ManagedBy");
  id v7 = sub_100037FF0(0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    *(_DWORD *)int buf = 67109376;
    *(_DWORD *)uint64_t v47 = a2;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = 33;
    id v11 = (char *)_os_log_send_and_compose_impl(v10, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    CFErrorRef v12 = sub_10000A444( "launchd_session_add_job",  "launchd_session.m",  321,  "com.apple.security.cryptex.posix",  33LL,  0LL,  v11);
    free(v11);
    id v13 = 0LL;
    goto LABEL_35;
  }

  if (object | (unint64_t)string)
  {
    if (object)
    {
      xpc_object_t empty = xpc_copy((xpc_object_t)object);
    }

    else
    {
      xpc_object_t empty = xpc_array_create_empty();
      xpc_object_t v14 = xpc_string_create(string);
      xpc_array_append_value(empty, v14);
    }

    xpc_object_t v15 = xpc_string_create("com.apple.security.cryptexd");
    xpc_array_append_value(empty, v15);

    xpc_dictionary_set_value(v4, "_ManagedBy", empty);
  }

  else
  {
    xpc_dictionary_set_string(v4, "_ManagedBy", "com.apple.security.cryptexd");
  }

  sub_10003BEE8(v4, "_PersistToBootMode", "rem");
  id v16 = [[OSLaunchdJob alloc] initWithPlist:v4 domain:v8];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109378;
    *(_DWORD *)uint64_t v47 = a2;
    *(_WORD *)&v47[4] = 2112;
    *(void *)&v47[6] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Submitting job for uid %d : %@",  buf,  0x12u);
  }

  xpc_object_t value = xpc_dictionary_get_value(v4, "CryptexSessionKeystone");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (xpc_get_type(v18) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL v19 = xpc_dictionary_get_BOOL(v4, "CryptexSessionKeystone");
    goto LABEL_22;
  }

  if (xpc_get_type(v18) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v18
      && xpc_get_type(v18) != (xpc_type_t)&_xpc_type_null
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100041200();
    }

    BOOL v19 = 0;
LABEL_22:
    BOOL v20 = 0;
    uint64_t int64 = 0;
    if (!a3) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v4, "CryptexSessionKeystone");
  int v23 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  BOOL v20 = xpc_dictionary_get_BOOL(v23, "StopOnFailure");
  uint64_t int64 = xpc_dictionary_get_uint64(v23, "StopOnExitCode");

  BOOL v19 = 0;
  if (a3)
  {
LABEL_25:
    id v24 = sub_10000D894(a3);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100038C28;
    v40[3] = &unk_100057278;
    BOOL v43 = v19;
    char v44 = uint64;
    id v41 = v16;
    uint64_t v42 = a3;
    BOOL v45 = v20;
    [v41 monitorOnQueue:v25 withHandler:v40];
  }

void sub_100038BFC(_Unwind_Exception *a1)
{
}

void sub_100038C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)4)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastExitStatus]);
    unsigned __int16 v5 = (unsigned __int16)[v4 wait4Status];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handle]);
      id v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      int v14 = 136315650;
      id v15 = [v7 UTF8String];
      __int16 v16 = 1024;
      unsigned int v17 = (v5 & 0x7F) == 0;
      __int16 v18 = 1024;
      int v19 = HIBYTE(v5);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cryptex Session process (uuid %s) exited (%d) with code: %hhu",  (uint8_t *)&v14,  0x18u);
    }

    if (*(_BYTE *)(a1 + 48)
      || *(_BYTE *)(a1 + 49) && *(unsigned __int8 *)(a1 + 49) == HIBYTE(v5)
      || *(_BYTE *)(a1 + 50) && (v5 & 0xFF00) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = 2LL;
      uint64_t v10 = HIBYTE(v5);
LABEL_17:
      sub_10000D81C(v8, v9, v10);
    }
  }

  else if ([v3 state] == (id)3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handle]);
      id v12 = objc_claimAutoreleasedReturnValue([v11 UUIDString]);
      int v14 = 136315394;
      id v15 = [v12 UTF8String];
      __int16 v16 = 1024;
      unsigned int v17 = [v3 lastSpawnError];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cryptex Session process (uuid %s) failed to launch with lastSpawnError: %d",  (uint8_t *)&v14,  0x12u);
    }

    if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 50) || *(_BYTE *)(a1 + 49))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v10 = (int)[v3 lastSpawnError];
      uint64_t v8 = v13;
      uint64_t v9 = 1LL;
      goto LABEL_17;
    }
  }
}

void sub_100038E60( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100038E70( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

double sub_100038E94(_OWORD *a1)
{
  double result = 0.0;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

size_t sub_100038EC4(uint64_t a1, char *__s)
{
  size_t result = strlen(__s);
  *(_DWORD *)a1 |= 2u;
  *(void *)(a1 + 16) = __s;
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_100038EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = os_simple_hash(*(void *)(a2 + 16), *(void *)(a2 + 24));
  if ((*(_BYTE *)a2 & 2) == 0) {
    sub_100039104();
  }
  unint64_t v5 = v4;
  uint64_t result = sub_100038F9C(a1, *(const void **)(a2 + 16), *(void *)(a2 + 24));
  if (result) {
    sub_100039134();
  }
  *(void *)(a2 + _Block_object_dispose(va, 8) = *(void *)(a1 + 8 * (v5 % 0x25));
  *(void *)(a1 + 8 * (v5 % 0x25)) = a2;
  if ((*(_DWORD *)a2 & 1) != 0) {
    sub_10003911C();
  }
  *(_DWORD *)a2 |= 1u;
  ++*(void *)(a1 + 296);
  return result;
}

uint64_t sub_100038F9C(uint64_t a1, const void *a2, size_t a3)
{
  for (uint64_t i = *(void *)(a1 + 8 * (os_simple_hash(a2, a3) % 0x25uLL)); i; uint64_t i = *(void *)(i + 8))
  {
  }

  return i;
}

uint64_t sub_100039028(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  return sub_100038F9C(a1, __s, v4);
}

uint64_t sub_10003905C(uint64_t a1, uint64_t a2)
{
  return sub_100038F9C(a1, *(const void **)(a2 + 16), *(void *)(a2 + 24));
}

unint64_t sub_100039068(uint64_t a1, uint64_t a2)
{
  unint64_t result = os_simple_hash(*(void *)(a2 + 16), *(void *)(a2 + 24));
  unint64_t v5 = (uint64_t *)(a1 + 8 * (result % 0x25));
  uint64_t v6 = *v5;
  if (*v5 != a2)
  {
    do
    {
      uint64_t v7 = v6;
      uint64_t v6 = *(void *)(v6 + 8);
    }

    while (v6 != a2);
    unint64_t v5 = (uint64_t *)(v7 + 8);
  }

  uint64_t *v5 = *(void *)(a2 + 8);
  *(void *)(a2 + _Block_object_dispose(va, 8) = -1LL;
  if ((*(_DWORD *)a2 & 1) == 0) {
    sub_10003914C();
  }
  *(_DWORD *)a2 &= ~1u;
  --*(void *)(a1 + 296);
  return result;
}

void sub_100039104()
{
}

void sub_10003911C()
{
}

void sub_100039134()
{
}

void sub_10003914C()
{
}

void sub_100039164(uint64_t a1, xpc_object_t a2, void *a3)
{
  xpc_object_t v6 = xpc_array_create(0LL, 0LL);
  if (a2) {
    xpc_retain(a2);
  }
  else {
    a2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  xpc_dictionary_set_value(a2, "argv", v6);
  xpc_dictionary_set_uint64(a2, "subsystem", *(void *)(a1 + 16));
  xpc_dictionary_set_uint64(a2, "routine", *(void *)(a1 + 24));
  xpc_dictionary_set_uint64(a2, "target-type", *(void *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 32);
  switch(v7)
  {
    case 2LL:
      xpc_dictionary_set_mach_send(a2, "target", *(unsigned int *)(a1 + 40));
      break;
    case 1LL:
      xpc_dictionary_set_string(a2, "target", (const char *)(a1 + 40));
      break;
    case 0LL:
      xpc_dictionary_set_uint64(a2, "target", *(void *)(a1 + 40));
      break;
  }

  *(void *)a1 = 1LL;
  if (a3) {
    uint64_t v8 = os_retain(a3);
  }
  else {
    uint64_t v8 = &_os_log_default;
  }
  *(void *)(a1 + _Block_object_dispose(va, 8) = v8;
  *(void *)(a1 + 296) = a2;
  *(void *)(a1 + 304) = v6;
  *(_DWORD *)(a1 + 312) = -1;
  *(_OWORD *)(a1 + 32_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  if (v6) {
    os_release(v6);
  }
}

CFErrorRef sub_1000392C4(uint64_t a1, xpc_object_t xdict, os_log_s *a3)
{
  CFTypeRef cf = 0LL;
  memset(v45, 0, sizeof(v45));
  xpc_object_t value = xpc_dictionary_get_value(xdict, "argv");
  if (!value || (xpc_object_t v7 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_array))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      int v47 = 67109120;
      int v48 = 94;
      uint64_t v9 = a3;
    }

    else
    {
      int v47 = 67109120;
      int v48 = 94;
      uint64_t v9 = (os_log_s *)&_os_log_default;
      uint64_t v8 = 2LL;
    }

    uint64_t v10 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v9, 16LL);
    id v11 = "com.apple.security.cryptex.posix";
    int v12 = 105;
LABEL_10:
    CFIndex v13 = 94LL;
LABEL_11:
    CFTypeRef v14 = 0LL;
    goto LABEL_12;
  }

  xpc_object_t v17 = xpc_dictionary_get_value(xdict, "subsystem");
  if (!v17 || (__int16 v18 = v17, xpc_get_type(v17) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
        uint64_t v19 = 3LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
      int v47 = 67109120;
      int v48 = 94;
      BOOL v20 = a3;
    }

    else
    {
      int v47 = 67109120;
      int v48 = 94;
      BOOL v20 = (os_log_s *)&_os_log_default;
      uint64_t v19 = 2LL;
    }

    uint64_t v10 = (char *)_os_log_send_and_compose_impl(v19, 0LL, 0LL, 0LL, &_mh_execute_header, v20, 16LL);
    id v11 = "com.apple.security.cryptex.posix";
    int v12 = 113;
    goto LABEL_10;
  }

  xpc_object_t v21 = xpc_dictionary_get_value(xdict, "routine");
  if (!v21 || (pid_t v22 = v21, xpc_get_type(v21) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
        uint64_t v23 = 3LL;
      }
      else {
        uint64_t v23 = 2LL;
      }
      int v47 = 67109120;
      int v48 = 94;
      id v24 = a3;
    }

    else
    {
      int v47 = 67109120;
      int v48 = 94;
      id v24 = (os_log_s *)&_os_log_default;
      uint64_t v23 = 2LL;
    }

    uint64_t v10 = (char *)_os_log_send_and_compose_impl(v23, 0LL, 0LL, 0LL, &_mh_execute_header, v24, 16LL);
    id v11 = "com.apple.security.cryptex.posix";
    int v12 = 121;
    goto LABEL_10;
  }

  xpc_object_t v25 = xpc_dictionary_get_value(xdict, "target-type");
  if (!v25 || (unsigned __int8 v26 = v25, xpc_get_type(v25) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
        uint64_t v27 = 3LL;
      }
      else {
        uint64_t v27 = 2LL;
      }
      int v47 = 67109120;
      int v48 = 94;
      pid_t v28 = a3;
    }

    else
    {
      int v47 = 67109120;
      int v48 = 94;
      pid_t v28 = (os_log_s *)&_os_log_default;
      uint64_t v27 = 2LL;
    }

    uint64_t v10 = (char *)_os_log_send_and_compose_impl(v27, 0LL, 0LL, 0LL, &_mh_execute_header, v28, 16LL);
    id v11 = "com.apple.security.cryptex.posix";
    int v12 = 129;
    goto LABEL_10;
  }

  xpc_object_t v29 = xpc_dictionary_get_value(xdict, "target");
  uint64_t v30 = xpc_uint64_get_value(v26);
  if (v30 == 2)
  {
    if (xpc_get_type(v29) != (xpc_type_t)&_xpc_type_mach_send)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
          uint64_t v33 = 3LL;
        }
        else {
          uint64_t v33 = 2LL;
        }
        int v47 = 67109120;
        int v48 = 22;
        uint64_t v34 = a3;
      }

      else
      {
        int v47 = 67109120;
        int v48 = 22;
        uint64_t v34 = (os_log_s *)&_os_log_default;
        uint64_t v33 = 2LL;
      }

      uint64_t v10 = (char *)_os_log_send_and_compose_impl(v33, 0LL, 0LL, 0LL, &_mh_execute_header, v34, 16LL);
      id v11 = "com.apple.security.cryptex.posix";
      int v12 = 167;
      goto LABEL_100;
    }

    *(_DWORD *)(a1 + 40) = xpc_mach_send_copy_right(v29);
  }

  else if (v30 == 1)
  {
    if (xpc_get_type(v29) != (xpc_type_t)&_xpc_type_string)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
          uint64_t v35 = 3LL;
        }
        else {
          uint64_t v35 = 2LL;
        }
        int v47 = 67109120;
        int v48 = 22;
        BOOL v36 = a3;
      }

      else
      {
        int v47 = 67109120;
        int v48 = 22;
        BOOL v36 = (os_log_s *)&_os_log_default;
        uint64_t v35 = 2LL;
      }

      uint64_t v10 = (char *)_os_log_send_and_compose_impl(v35, 0LL, 0LL, 0LL, &_mh_execute_header, v36, 16LL);
      id v11 = "com.apple.security.cryptex.posix";
      int v12 = 148;
      goto LABEL_100;
    }

    if (xpc_string_get_length(v29) >= 0xFF)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
          uint64_t v39 = 3LL;
        }
        else {
          uint64_t v39 = 2LL;
        }
        int v47 = 67109120;
        int v48 = 22;
        uint64_t v40 = a3;
      }

      else
      {
        int v47 = 67109120;
        int v48 = 22;
        uint64_t v40 = (os_log_s *)&_os_log_default;
        uint64_t v39 = 2LL;
      }

      uint64_t v10 = (char *)_os_log_send_and_compose_impl(v39, 0LL, 0LL, 0LL, &_mh_execute_header, v40, 16LL);
      id v11 = "com.apple.security.cryptex.posix";
      int v12 = 156;
      goto LABEL_100;
    }

    string_ptr = xpc_string_get_string_ptr(v29);
    strlcpy((char *)(a1 + 40), string_ptr, 0xFFuLL);
  }

  else
  {
    if (v30)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
          uint64_t v37 = 3LL;
        }
        else {
          uint64_t v37 = 2LL;
        }
        int v47 = 67109120;
        int v48 = 22;
        __int128 v38 = a3;
      }

      else
      {
        int v47 = 67109120;
        int v48 = 22;
        __int128 v38 = (os_log_s *)&_os_log_default;
        uint64_t v37 = 2LL;
      }

      uint64_t v10 = (char *)_os_log_send_and_compose_impl(v37, 0LL, 0LL, 0LL, &_mh_execute_header, v38, 16LL);
      id v11 = "com.apple.security.cryptex.posix";
      int v12 = 175;
      goto LABEL_100;
    }

    if (xpc_get_type(v29) != (xpc_type_t)&_xpc_type_uint64)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
          uint64_t v31 = 3LL;
        }
        else {
          uint64_t v31 = 2LL;
        }
        int v47 = 67109120;
        int v48 = 22;
        BOOL v32 = a3;
      }

      else
      {
        int v47 = 67109120;
        int v48 = 22;
        BOOL v32 = (os_log_s *)&_os_log_default;
        uint64_t v31 = 2LL;
      }

      uint64_t v10 = (char *)_os_log_send_and_compose_impl(v31, 0LL, 0LL, 0LL, &_mh_execute_header, v32, 16LL);
      id v11 = "com.apple.security.cryptex.posix";
      int v12 = 139;
LABEL_100:
      CFIndex v13 = 22LL;
      goto LABEL_11;
    }

    *(void *)(a1 + 40) = xpc_uint64_get_value(v29);
  }

  if (sub_10003D148(xdict, "cferror", (CFErrorRef *)&cf))
  {
    *(void *)a1 = 1LL;
    if (a3) {
      uint64_t v42 = os_retain(a3);
    }
    else {
      uint64_t v42 = &_os_log_default;
    }
    *(void *)(a1 + _Block_object_dispose(va, 8) = v42;
    *(void *)(a1 + 16) = xpc_uint64_get_value(v18);
    *(void *)(a1 + 24) = xpc_uint64_get_value(v22);
    *(void *)(a1 + 32) = xpc_uint64_get_value(v26);
    *(void *)(a1 + 296) = xpc_retain(xdict);
    *(void *)(a1 + 304) = v7;
    xpc_dictionary_get_audit_token(xdict, v45);
    sub_100039DD8((uid_t *)(a1 + 328), v45);
    CFErrorRef v15 = 0LL;
    goto LABEL_13;
  }

  if (a3)
  {
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
      uint64_t v43 = 3LL;
    }
    else {
      uint64_t v43 = 2LL;
    }
    LOWORD(v47) = 0;
    char v44 = a3;
  }

  else
  {
    LOWORD(v47) = 0;
    char v44 = (os_log_s *)&_os_log_default;
    uint64_t v43 = 2LL;
  }

  uint64_t v10 = (char *)_os_log_send_and_compose_impl(v43, 0LL, 0LL, 0LL, &_mh_execute_header, v44, 16LL);
  CFTypeRef v14 = cf;
  id v11 = "com.apple.security.cryptex";
  int v12 = 181;
  CFIndex v13 = 16LL;
LABEL_12:
  CFErrorRef v15 = sub_10000A444("rpc_init_local", "rpc.c", v12, v11, v13, v14, v10);
  free(v10);
LABEL_13:
  if (cf) {
    CFRelease(cf);
  }
  return v15;
}

uint64_t sub_100039DD8(uid_t *a1, _OWORD *a2)
{
  __int128 v4 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v4;
  *a1 = audit_token_to_auid(&v13);
  __int128 v5 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v5;
  a1[1] = audit_token_to_euid(&v13);
  __int128 v6 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v6;
  a1[2] = audit_token_to_egid(&v13);
  __int128 v7 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v7;
  a1[3] = audit_token_to_ruid(&v13);
  __int128 v8 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v8;
  a1[4] = audit_token_to_rgid(&v13);
  __int128 v9 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v9;
  a1[5] = audit_token_to_pid(&v13);
  __int128 v10 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v10;
  a1[6] = audit_token_to_asid(&v13);
  __int128 v11 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v11;
  uint64_t result = audit_token_to_pidversion(&v13);
  a1[7] = result;
  return result;
}

void sub_100039EA0(void *a1, uint64_t a2)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a2 + 296));
  if (reply)
  {
    xpc_object_t v5 = reply;
    uint64_t v6 = 2LL;
  }

  else
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v6 = 10LL;
  }

  sub_100039164((uint64_t)a1, v5, *(void **)(a2 + 8));
  *a1 |= v6;
  *(void *)a2 |= 4uLL;
  if (v5) {
    os_release(v5);
  }
}

void *sub_100039F44(_BYTE *a1)
{
  if ((*a1 & 0x40) != 0) {
    sub_10003A5D8();
  }
  uint64_t v2 = calloc(1uLL, 0x168uLL);
  if (!v2) {
    sub_10003A4FC(&v5, v6);
  }
  id v3 = v2;
  memcpy(v2, a1, 0x168uLL);
  *v3 |= 0x40uLL;
  v3[37] = xpc_retain(*((xpc_object_t *)a1 + 37));
  *v3 |= 0x80uLL;
  if (*((void *)a1 + 4) == 2LL) {
    *((_DWORD *)a1 + 10) = mach_right_send_retain(*((unsigned int *)a1 + 10));
  }
  return v3;
}

void sub_10003A00C(_BYTE *a1)
{
  if ((*a1 & 1) != 0)
  {
    if (*((void *)a1 + 4) == 2LL) {
      mach_right_send_release(*((unsigned int *)a1 + 10));
    }
    xpc_release(*((xpc_object_t *)a1 + 37));
    os_release(*((void **)a1 + 1));
    if ((*a1 & 0x40) != 0) {
      free(a1);
    }
  }

BOOL sub_10003A06C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7];
}

void sub_10003A0F8(uint64_t a1, _BYTE *a2, int a3)
{
  if (a3 == 36)
  {
    if ((*(_BYTE *)a1 & 4) == 0) {
      sub_10003A5F0();
    }
    if ((*a2 & 0x80) == 0) {
      sub_10003A608();
    }
    int v6 = *__error();
    __int128 v7 = *(os_log_s **)(a1 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "reply in-progress", buf, 2u);
    }

    *__error() = v6;
  }

  else if (a3)
  {
    *(_DWORD *)int buf = 67109120;
    int v11 = a3;
    __int128 v8 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    __int128 v9 = sub_10000A444("rpc_reply", "rpc.c", 373, "com.apple.security.cryptex.posix", a3, 0LL, v8);
    free(v8);
    sub_10003A2AC(a1, (uint64_t)a2, v9);
    if (v9) {
      CFRelease(v9);
    }
  }

  else
  {
    sub_10003A2AC(a1, (uint64_t)a2, 0LL);
  }

void sub_10003A2AC(uint64_t a1, uint64_t a2, __CFError *a3)
{
  if ((*(void *)a2 & 8) == 0)
  {
    if ((*(void *)a2 & 0x10) != 0) {
      sub_10003A6CC();
    }
    int v6 = *__error();
    __int128 v7 = *(os_log_s **)(a1 + 8);
    if (a3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "sending reply: %@", buf, 0xCu);
      }

      *__error() = v6;
      *(void *)a2 |= 0x10uLL;
      xpc_object_t v8 = sub_10003D660(a3);
      xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 296), "cferror", v8);
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "sending reply [no error]", buf, 2u);
      }

      xpc_object_t v8 = 0LL;
      *__error() = v6;
      *(void *)a2 |= 0x10uLL;
    }

    int v11 = xpc_pipe_routine_reply(*(void *)(a2 + 296));
    if (v11 == 32)
    {
      int v12 = *__error();
      audit_token_t v13 = *(os_log_s **)(a1 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)int buf = 0;
      CFTypeRef v14 = "caller died";
    }

    else
    {
      if (v11) {
        sub_10003A620(&v15, buf);
      }
      int v12 = *__error();
      audit_token_t v13 = *(os_log_s **)(a1 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)int buf = 0;
      CFTypeRef v14 = "reply sent";
    }

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, buf, 2u);
LABEL_20:
    *__error() = v12;
    if (v8) {
      os_release(v8);
    }
    return;
  }

  int v9 = *__error();
  __int128 v10 = *(os_log_s **)(a1 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "fake reply, not sending", buf, 2u);
  }

  *__error() = v9;
}

void sub_10003A4FC(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  uint64_t v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_10003A5D8()
{
}

void sub_10003A5F0()
{
}

void sub_10003A608()
{
}

void sub_10003A620(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003A6CC()
{
}

os_log_t sub_10003A6E4(uint64_t a1, int a2, char *category)
{
  os_log_t result = os_log_create("com.apple.libcryptex", category);
  *(void *)(a1 + 16) = result;
  return result;
}

char *sub_10003A714(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(const char **)a1;
  int v5 = *__error();
  uint64_t v6 = *(os_log_s **)(a1 + 16);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      xpc_object_t v8 = *(const char **)a1;
      *(_DWORD *)int buf = 136446722;
      int v12 = v4;
      __int16 v13 = 2080;
      CFTypeRef v14 = v8;
      __int16 v15 = 2080;
      __int16 v16 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: changing name: %s -> %s",  buf,  0x20u);
    }

    *__error() = v5;
    free(*(void **)(a1 + 8));
  }

  else
  {
    if (v7)
    {
      *(_DWORD *)int buf = 136446466;
      int v12 = "[anonymous]";
      __int16 v13 = 2080;
      CFTypeRef v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", buf, 0x16u);
    }

    *__error() = v5;
  }

  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      os_log_t result = strdup(a2);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    os_log_t result = strdup(a2);
    if (!result) {
      sub_10003E9D0(a2, &v10, buf);
    }
  }

  *(void *)a1 = result;
  *(void *)(a1 + _Block_object_dispose(va, 8) = result;
  return result;
}

void sub_10003A88C(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(const char **)a1;
  int v5 = *__error();
  uint64_t v6 = *(os_log_s **)(a1 + 16);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      xpc_object_t v8 = *(const char **)a1;
      int v9 = 136446722;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      int v12 = v8;
      __int16 v13 = 2080;
      CFTypeRef v14 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: changing name: %s -> %s",  (uint8_t *)&v9,  0x20u);
    }

    *__error() = v5;
    free(*(void **)(a1 + 8));
  }

  else
  {
    if (v7)
    {
      int v9 = 136446466;
      uint64_t v10 = "[anonymous]";
      __int16 v11 = 2080;
      int v12 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s: setting name: %s",  (uint8_t *)&v9,  0x16u);
    }

    *__error() = v5;
  }

  *(void *)a1 = a2;
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
}

void sub_10003A9CC(uint64_t a1)
{
}

uint64_t sub_10003A9F4(_DWORD *a1)
{
  uint64_t v1 = *a1;
  *a1 = -1;
  return v1;
}

size_t sub_10003AA08(_BYTE *a1, char *__s)
{
  size_t result = strlen(__s);
  if (result)
  {
    size_t v5 = result;
    for (size_t i = 0LL; i < v5; i += 2LL)
    {
      char v9 = 0;
      *(_WORD *)__str = 0;
      __strlcpy_chk(__str, &__s[i], 3LL, 3LL);
      size_t result = strtoul(__str, 0LL, 16);
      if (result >= 0x100) {
        sub_10003C058(&v7, v10);
      }
      *a1++ = result;
    }
  }

  return result;
}

uint64_t sub_10003AACC(int a1, char *a2, int a3, mode_t a4, int *a5)
{
  int v8 = a3 | 0x100000;
  if ((a3 & 0x200) != 0)
  {
    if ((mkdirat(a1, a2, a4) & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v9 = *__error();
    if (v9 != 17 && v9 != 0)
    {
      int v11 = -1;
      goto LABEL_11;
    }

    v8 &= ~0x200u;
  }

  int v11 = openat(a1, a2, v8);
  if (v11 < 0)
  {
LABEL_11:
    uint64_t result = *__error();
    if ((_DWORD)result) {
      return result;
    }
  }

  uint64_t result = 0LL;
  *a5 = v11;
  return result;
}

uint64_t sub_10003AB68(uint64_t a1, const char *a2)
{
  int v3 = a1;
  if (a2)
  {
    int v4 = openat(a1, a2, 0x100000);
    uint64_t v5 = *__error();
    if (v4 < 0)
    {
      int v12 = *__error();
      __int16 v13 = os_log_create("com.apple.libcryptex", "utility");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        LODWORD(d_name) = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "openat: %{darwin.errno}d", buf, 8u);
      }

      *__error() = v12;
      return v5;
    }

    int v75 = v3;
    uint64_t v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      d_uint64_t name = (void *)a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "top-level directory: %s", buf, 0xCu);
    }

    *__error() = v5;
  }

  else
  {
    int v75 = a1;
    int v4 = dup_np(a1);
  }

  uint64_t v7 = os_log_create("com.apple.libcryptex", "utility");
  bzero(buf, 0x400uLL);
  memset(&v92, 0, sizeof(v92));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v4, &v92) == -1)
    {
      int v14 = *__error();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v15 = *__error();
        *(_DWORD *)int v80 = 136315650;
        int v81 = "subdirfd";
        __int16 v82 = 1024;
        int v83 = v4;
        __int16 v84 = 1024;
        LODWORD(v85) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  v80,  0x18u);
      }

      *__error() = v14;
    }

    else
    {
      if (fcntl(v4, 50, buf))
      {
        int v8 = __error();
        int v9 = strerror(*v8);
        snprintf((char *)buf, 0x400uLL, "[%s]", v9);
      }

      unint64_t v10 = ((unint64_t)v92.st_mode >> 12) ^ 8;
      if ((_DWORD)v10 == 15) {
        int v11 = "[unknown]";
      }
      else {
        int v11 = off_100057698[v10];
      }
      __int16 v16 = (void *)os_flagset_copy_string(&unk_100057298, v92.st_flags);
      int v17 = *__error();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int v80 = 136316418;
        int v81 = "subdirfd";
        __int16 v82 = 1024;
        int v83 = v4;
        __int16 v84 = 2080;
        int v85 = v11;
        __int16 v86 = 2048;
        off_t st_size = v92.st_size;
        __int16 v88 = 2080;
        __int128 v89 = v16;
        __int16 v90 = 2080;
        __int16 v91 = buf;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  v80,  0x3Au);
      }

      *__error() = v17;
      free(v16);
    }
  }

  __int128 v76 = (char *)a2;
  __int16 v18 = fdopendir(v4);
  if (!v18) {
    sub_10003C0D4(&v92, buf);
  }
  uint64_t v19 = v18;
  char v20 = 0;
  xpc_object_t v21 = 0LL;
  unsigned int v78 = -1;
  unint64_t v22 = 0LL;
  while (1)
  {
    char v23 = v20;
    if ((v20 & 1) == 0) {
      break;
    }
    int v24 = 128;
LABEL_29:
    int v26 = dirfd(v19);
    if (v22 >= 4) {
      sub_10003C150(&v92, buf);
    }
    int v27 = v26;
    char v20 = 0;
    if (strcmp(v21->d_name, "."))
    {
      char v20 = 0;
      if (strcmp(v21->d_name, ".."))
      {
        unint64_t v79 = v22;
        int v28 = *__error();
        xpc_object_t v29 = os_log_create("com.apple.libcryptex", "utility");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 136315138;
          d_uint64_t name = v21->d_name;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "removing: %s", buf, 0xCu);
        }

        *__error() = v28;
        uint64_t v30 = openat(v27, v21->d_name, 256);
        if ((v30 & 0x80000000) == 0) {
          *__error() = 0;
        }
        int v31 = *__error();
        if (v31 == 62)
        {
          int v38 = *__error();
          uint64_t v39 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int buf = 136315138;
            d_uint64_t name = v21->d_name;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%s is a symlink", buf, 0xCu);
          }

          *__error() = v38;
        }

        else
        {
          if (v31 == 2)
          {
            int v44 = *__error();
            BOOL v45 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 136315138;
              d_uint64_t name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "file disappeared: %s", buf, 0xCu);
            }

            unint64_t v22 = 0LL;
            char v20 = 0;
            *__error() = v44;
            int v43 = 9;
            goto LABEL_94;
          }

          if (v31)
          {
            int v46 = *__error();
            int v47 = *__error();
            int v48 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              LODWORD(d_name) = v46;
              int v49 = buf;
              CFErrorRef v50 = v48;
              int v51 = "openat: %{darwin.errno}d";
              goto LABEL_90;
            }

            goto LABEL_91;
          }

          BOOL v32 = os_log_create("com.apple.libcryptex", "utility");
          bzero(buf, 0x400uLL);
          memset(&v92, 0, sizeof(v92));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            if (fstat(v30, &v92) == -1)
            {
              int v64 = *__error();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                int v65 = *__error();
                *(_DWORD *)int v80 = 136315650;
                int v81 = "defd";
                __int16 v82 = 1024;
                int v83 = v30;
                __int16 v84 = 1024;
                LODWORD(v85) = v65;
                _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d",  v80,  0x18u);
              }

              *__error() = v64;
            }

            else
            {
              if (fcntl(v30, 50, buf))
              {
                uint64_t v33 = __error();
                uint64_t v34 = strerror(*v33);
                snprintf((char *)buf, 0x400uLL, "[%s]", v34);
              }

              unint64_t v35 = ((unint64_t)v92.st_mode >> 12) ^ 8;
              BOOL v36 = "[unknown]";
              if ((_DWORD)v35 != 15) {
                BOOL v36 = off_100057698[v35];
              }
              uint64_t v37 = (void *)os_flagset_copy_string(&unk_100057298, v92.st_flags);
              int v77 = *__error();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int v80 = 136316418;
                int v81 = "defd";
                __int16 v82 = 1024;
                int v83 = v30;
                __int16 v84 = 2080;
                int v85 = v36;
                __int16 v86 = 2048;
                off_t st_size = v92.st_size;
                __int16 v88 = 2080;
                __int128 v89 = v37;
                __int16 v90 = 2080;
                __int16 v91 = buf;
                _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s",  v80,  0x3Au);
              }

              *__error() = v77;
              free(v37);
            }
          }
        }

        if ((unlinkat(v27, v21->d_name, v24) & 0x80000000) == 0) {
          *__error() = 0;
        }
        int v40 = *__error();
        if (v40 <= 15)
        {
          if (!v40)
          {
            int v58 = *__error();
            int v59 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 136315138;
              d_uint64_t name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "removed: %s", buf, 0xCu);
            }

            unint64_t v22 = 0LL;
            char v20 = 0;
            int v43 = 0;
            *__error() = v58;
            goto LABEL_94;
          }

          if (v40 != 1)
          {
            if (v40 == 2)
            {
              int v41 = *__error();
              uint64_t v42 = os_log_create("com.apple.libcryptex", "utility");
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int buf = 136315138;
                d_uint64_t name = v21->d_name;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "file disappeared: %s", buf, 0xCu);
              }

              char v20 = 0;
              int v43 = 0;
              *__error() = v41;
              goto LABEL_93;
            }

LABEL_71:
          int v54 = *__error();
          __int128 v55 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int buf = 136315138;
            d_uint64_t name = v21->d_name;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "emptying subdirectory: %s", buf, 0xCu);
          }

          *__error() = v54;
          int v56 = sub_10003AB68(v30, 0LL);
          if (v56)
          {
            int v46 = v56;
            int v47 = *__error();
            uint64_t v57 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              LODWORD(d_name) = v46;
              int v49 = buf;
              CFErrorRef v50 = v57;
              int v51 = "emptydir [recurse]: %{darwin.errno}d";
              goto LABEL_90;
            }

            goto LABEL_91;
          }

          goto LABEL_87;
        }

        if ((v23 & 1) == 0 && v21->d_type != 4)
        {
          int v66 = *__error();
          int v67 = *__error();
          id v68 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 136315394;
            d_uint64_t name = v21->d_name;
            __int16 v95 = 1024;
            int v96 = v66;
            _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "file busy: %s: %{darwin.errno}d",  buf,  0x12u);
          }

          unsigned int v78 = v66;
          char v20 = 0;
          *__error() = v67;
          goto LABEL_92;
        }

        bzero(buf, 0x400uLL);
        int v60 = *__error();
        int v61 = os_log_create("com.apple.libcryptex", "utility");
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v92.st_dev = 136315138;
          *(void *)&v92.st_mode = v21->d_name;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEBUG,  "mount point; forcing unmount: %s",
            (uint8_t *)&v92,
            0xCu);
        }

        *__error() = v60;
        if (unmount((const char *)buf, 0x80000))
        {
          int v46 = *__error();
          int v47 = *__error();
          int v62 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v92.st_dev = 67109120;
            *(_DWORD *)&v92.st_mode = v46;
            int v49 = (uint8_t *)&v92;
            CFErrorRef v50 = v62;
            int v51 = "unmount + MNT_FORCE: %{darwin.errno}d";
            goto LABEL_90;
          }

LABEL_91:
          unsigned int v78 = v46;
          char v20 = 0;
          *__error() = v47;
LABEL_92:
          int v43 = 4;
          goto LABEL_93;
        }

LABEL_87:
        int v43 = 0;
        unsigned int v78 = 0;
        char v20 = 1;
LABEL_93:
        unint64_t v22 = v79;
LABEL_94:
        if ((_DWORD)v30 != -1 && close(v30) == -1) {
          sub_10003DCEC(&v92, buf);
        }
        if (v43 && v43 != 9)
        {
          uint64_t v5 = v78;
          goto LABEL_116;
        }
      }
    }
  }

  xpc_object_t v25 = readdir(v19);
  if (v25)
  {
    xpc_object_t v21 = v25;
    int v24 = 0;
    goto LABEL_29;
  }

  if (v76)
  {
    int v69 = unlinkat(v75, v76, 128);
    uint64_t v5 = *__error();
    if (v69)
    {
      int v70 = *__error();
      int v71 = os_log_create("com.apple.libcryptex", "utility");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        LODWORD(d_name) = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "unlinkat [top level]: %{darwin.errno}d",  buf,  8u);
      }

      goto LABEL_115;
    }

    int v73 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      d_uint64_t name = v76;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "removed top-level directory: %s", buf, 0xCu);
    }

    int v70 = v5;
  }

  else
  {
    int v70 = *__error();
    uint64_t v72 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "removed subdirectory", buf, 2u);
    }
  }

  uint64_t v5 = 0LL;
LABEL_115:
  *__error() = v70;
LABEL_116:
  if (closedir(v19) == -1) {
    sub_10003C1DC(&v92, buf);
  }
  return v5;
}

uint64_t sub_10003B9E0(int a1, char *a2, int *a3)
{
  uint64_t v5 = mkdtempat_np(a1, a2);
  if (!v5) {
    return *__error();
  }
  int v6 = openat(a1, v5, 1048832);
  if (v6 < 0) {
    return *__error();
  }
  int v7 = v6;
  uint64_t result = 0LL;
  *a3 = v7;
  return result;
}

uint64_t sub_10003BA38(const char *a1, mode_t a2, int *a3)
{
  if ((mkdir(a1, a2) & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v5 = *__error();
  if (v5) {
    BOOL v6 = v5 == 17;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    int v11 = __error();
    return *v11;
  }

  int v7 = opendir(a1);
  int v11 = __error();
  if (!v7) {
    return *v11;
  }
  int *v11 = 0;
  int v8 = readdir(v7);
  if (v8)
  {
    while (1)
    {
      d_uint64_t name = v8->d_name;
      if (strcmp(v8->d_name, "."))
      {
        if (strcmp(d_name, "..")) {
          break;
        }
      }

      int v8 = readdir(v7);
      if (!v8) {
        goto LABEL_13;
      }
    }

    uint64_t v10 = 17LL;
  }

  else
  {
LABEL_13:
    if (*__error() || (int v12 = open(a1, 1048832), v12 < 0))
    {
      uint64_t v10 = *__error();
    }

    else
    {
      uint64_t v10 = 0LL;
      *a3 = v12;
    }
  }

  if (closedir(v7) == -1) {
    sub_10003C1DC(&v14, v15);
  }
  return v10;
}

uint64_t sub_10003BB8C(int a1, void *a2)
{
  if (fstat(a1, &v20))
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    BOOL v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "stat: %{darwin.errno}d", buf, 8u);
    }

    off_t st_size = 0LL;
LABEL_5:
    int v8 = 0LL;
    *__error() = v5;
LABEL_6:
    if (!(_DWORD)v4) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }

  off_t st_size = v20.st_size;
  if (v20.st_size < 0) {
    sub_10003C2E4();
  }
  uint64_t v10 = malloc(v20.st_size);
  if (!v10)
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    int v15 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "malloc: %{darwin.errno}d", buf, 8u);
    }

    goto LABEL_5;
  }

  int v8 = v10;
  while (1)
  {
    ssize_t v11 = pread(a1, v8, st_size, 0LL);
    if ((v11 & 0x8000000000000000LL) == 0) {
      break;
    }
    int v12 = *__error();
    __int16 v13 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)int buf = 67109120;
      LODWORD(v22) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "pread: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v12;
    uint64_t v4 = *__error();
    if ((_DWORD)v4 != 4) {
      goto LABEL_6;
    }
  }

  ssize_t v16 = v11;
  int v17 = *__error();
  __int16 v18 = os_log_create("com.apple.libcryptex", "utility");
  uint64_t v19 = v18;
  if (v16 == st_size)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 134217984;
      off_t v22 = st_size;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "read %ld bytes", buf, 0xCu);
    }

    *__error() = v17;
LABEL_7:
    sub_10003C35C(a2, 0LL, (uint64_t)j__free, (uint64_t)v8, st_size);
    uint64_t v4 = 0LL;
    int v8 = 0LL;
    goto LABEL_8;
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 134218240;
    off_t v22 = v16;
    __int16 v23 = 2048;
    off_t v24 = st_size;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "truncated read: actual = %ld, expected = %lu",  buf,  0x16u);
  }

  *__error() = v17;
  uint64_t v4 = 5LL;
LABEL_8:
  free(v8);
  return v4;
}

uint64_t sub_10003BEE8(void *a1, const char *a2, const char *a3)
{
  if (xpc_dictionary_get_value(a1, a2)) {
    return 17LL;
  }
  xpc_dictionary_set_string(a1, a2, a3);
  return 0LL;
}

BOOL sub_10003BF38(void *a1, const char *a2)
{
  if (xpc_get_type(a1) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    return strcmp(a2, string_ptr) == 0;
  }

  else if (xpc_get_type(a1) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(a1))
  {
    size_t v7 = 0LL;
    do
    {
      xpc_object_t value = xpc_array_get_value(a1, v7);
      uint64_t v4 = sub_10003BF38(value, a2);
      if ((_DWORD)v4) {
        break;
      }
      ++v7;
    }

    while (v7 < xpc_array_get_count(a1));
  }

  else
  {
    return 0LL;
  }

  return v4;
}

xpc_object_t sub_10003BFF8(void *a1, const char *a2, const char *a3)
{
  xpc_object_t result = xpc_dictionary_get_value(a1, a2);
  if (result) {
    return (xpc_object_t)sub_10003BF38(result, a3);
  }
  return result;
}

uint64_t sub_10003C02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, a2, a3, 80LL, a5, v5, 16LL);
}

  ;
}

void sub_10003C058(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10003C02C(v4, (uint64_t)a1, (uint64_t)a2, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003C0D4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003C150(void *a1, _OWORD *a2)
{
  if (sub_100009634()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10003C02C(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003C1DC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003C258(void *a1, _OWORD *a2)
{
  if (sub_100009634()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10003C02C(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003C2E4()
{
}

uint64_t sub_10003C300(void *a1, size_t a2)
{
  uint64_t result = munmap(a1, a2);
  if ((_DWORD)result == -1) {
    sub_10003C5F0(&v3, v4);
  }
  return result;
}

void *sub_10003C35C(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *result = a4;
  result[1] = a5;
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  if (a5 < 0) {
    sub_10003C66C(&v5, v6);
  }
  return result;
}

double sub_10003C3C0(__n128 *a1, __n128 *a2)
{
  *(void *)&double result = sub_10003C3CC(a1, a2, 0LL, a2->n128_u64[1]).n128_u64[0];
  return result;
}

__n128 sub_10003C3CC(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a2->n128_u64[1];
  if (a4 + a3 > v4)
  {
    uint64_t v11 = 0LL;
    memset(v18, 0, sizeof(v18));
    unint64_t v8 = v4;
    int v12 = 134218496;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    uint64_t v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2048;
    unint64_t v17 = v8;
    uint64_t v10 = _os_log_send_and_compose_impl(v9, &v11, v18, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
    _os_crash_msg(v11, v10);
    __break(1u);
  }

  a1->n128_u64[0] = a2->n128_u64[0] + a3;
  a1->n128_u64[1] = a4;
  a1[1].n128_u64[0] = a2->n128_u64[0];
  a1[1].n128_u64[1] = a2->n128_u64[1];
  __n128 result = a2[2];
  a1[2] = result;
  a2[2].n128_u64[1] = 0LL;
  return result;
}

FILE *sub_10003C504(uint64_t a1, char *__mode, unint64_t a3)
{
  if ((a3 & 0x8000000000000000LL) != 0 || (size_t v5 = *(void *)(a1 + 8), v5 < a3)) {
    sub_10003C6F0();
  }
  uint64_t v6 = fmemopen(*(void **)a1, v5, __mode);
  if (!v6) {
    sub_10003C708(&v9, v10);
  }
  size_t v7 = v6;
  if (fseek(v6, a3, 0) == -1) {
    sub_10003C784(&v9, v10);
  }
  return v7;
}

void *sub_10003C5AC(void *result)
{
  if (result)
  {
    if (*result)
    {
      uint64_t v1 = (uint64_t (*)(void, void, void))result[5];
      if (v1)
      {
        if (result[6]) {
          sub_10003C800();
        }
        return (void *)v1(result[2], result[3], result[4]);
      }
    }
  }

  return result;
}

void sub_10003C5F0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003C66C(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000EBBC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003C6F0()
{
}

void sub_10003C708(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003C784(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003C800()
{
}

void **sub_10003C818(void *a1, size_t a2)
{
  if (a2 <= 0x17) {
    sub_10003C924(&v9, v10);
  }
  int is_multithreaded = _dispatch_is_multithreaded();
  uint64_t v5 = (void **)calloc(1uLL, a2);
  uint64_t v6 = v5;
  if (is_multithreaded)
  {
    if (!v5)
    {
      do
      {
        __os_temporary_resource_shortage();
        size_t v7 = (void **)calloc(1uLL, a2);
      }

      while (!v7);
      uint64_t v6 = v7;
    }
  }

  else if (!v5)
  {
    sub_10003C9BC(&v9, v10);
  }

  if (a1) {
    FILE *v6 = os_retain(a1);
  }
  return v6;
}

void sub_10003C8F0(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      os_release(v2);
    }
    free(a1);
  }

void sub_10003C924(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100009634()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10003C02C(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_10003C9BC(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100009634()) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  uint64_t v7 = sub_10003C02C(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

xpc_object_t sub_10003CA88(uint64_t a1, xpc_object_t object)
{
  if (*(_UNKNOWN **)a1 != &_xpc_type_array && *(void *)a1 != (void)&_xpc_type_dictionary) {
    sub_10003D970();
  }
  xpc_type_t type = xpc_get_type(object);
  if (type != *(xpc_type_t *)a1) {
    return 0LL;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    size_t v8 = *(void *)(a1 + 24);
    if (v8 >= xpc_array_get_count(object)) {
      return 0LL;
    }
    xpc_object_t value = xpc_array_get_value(object, *(void *)(a1 + 24));
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(object, *(const char **)(a1 + 16));
  }

  uint64_t v9 = value;
  if (!value || xpc_get_type(value) != *(xpc_type_t *)(a1 + 8)) {
    return 0LL;
  }
  return xpc_retain(v9);
}

uint64_t sub_10003CB54(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 0;
  if (xdict)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000LL;
    v4[2] = sub_10003CBF0;
    v4[3] = &unk_100057738;
    v4[4] = &v5;
    _OWORD v4[5] = a1;
    xpc_dictionary_apply(xdict, v4);
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_10003CBF0(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), a2);
  if (!value)
  {
LABEL_9:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), a2, a3);
    return 1LL;
  }

  xpc_object_t v7 = value;
  xpc_type_t type = xpc_get_type(value);
  if (type == xpc_get_type(a3))
  {
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000LL;
      applier[2] = sub_10003CD94;
      applier[3] = &unk_100057710;
      void applier[4] = v7;
      xpc_dictionary_apply(a3, applier);
      return 1LL;
    }

    goto LABEL_9;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 79;
  int v9 = *__error();
  if (qword_10005A8B8 != -1) {
    dispatch_once(&qword_10005A8B8, &stru_100057778);
  }
  uint64_t v10 = (os_log_s *)qword_10005A8C0;
  if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
  {
    int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    *(_DWORD *)int buf = 136315394;
    unint64_t v15 = a2;
    __int16 v16 = 1024;
    int v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Error merging override for key %s: %{darwin.errno}d",  buf,  0x12u);
  }

  * __error() = v9;
  return 1LL;
}

uint64_t sub_10003CD94(uint64_t a1, const char *a2, void *a3)
{
  return 1LL;
}

uint64_t sub_10003CDB0(void *a1, const char *a2, uint64_t *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2LL;
  }
  uint64_t v5 = value;
  uint64_t v7 = xpc_uint64_get_value(v5);
  uint64_t result = 0LL;
  *a3 = v7;
  return result;
}

uint64_t sub_10003CE10(void *a1, const char *a2, const char **a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2LL;
  }
  uint64_t v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_string) {
    return 79LL;
  }
  string_ptr = xpc_string_get_string_ptr(v5);
  uint64_t result = 0LL;
  *a3 = string_ptr;
  return result;
}

uint64_t sub_10003CE70(void *a1, const char *a2, BOOL *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2LL;
  }
  uint64_t v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_BOOL) {
    return 79LL;
  }
  BOOL v7 = xpc_BOOL_get_value(v5);
  uint64_t result = 0LL;
  *a3 = v7;
  return result;
}

uint64_t sub_10003CED0(void *a1, const char *a2, const _xpc_type_s *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value)
  {
    int v6 = *__error();
    if (qword_10005A8B8 != -1) {
      dispatch_once(&qword_10005A8B8, &stru_100057778);
    }
    uint64_t v11 = qword_10005A8C0;
    if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136315138;
    unint64_t v15 = a2;
    int v8 = "key %s doesn't exist";
    int v9 = (os_log_s *)v11;
    uint32_t v10 = 12;
    goto LABEL_11;
  }

  if (xpc_get_type(value) != a3)
  {
    int v6 = *__error();
    if (qword_10005A8B8 != -1) {
      dispatch_once(&qword_10005A8B8, &stru_100057778);
    }
    uint64_t v7 = qword_10005A8C0;
    if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136315394;
    unint64_t v15 = a2;
    __int16 v16 = 2080;
    uint64_t name = xpc_type_get_name(a3);
    int v8 = "key %s isn't of type %s";
    int v9 = (os_log_s *)v7;
    uint32_t v10 = 22;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v10);
LABEL_12:
    int v12 = __error();
    uint64_t result = 0LL;
    *int v12 = v6;
    return result;
  }

  return 1LL;
}

void *sub_10003D064(void *a1, void *a2, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  int v6 = reply;
  if (reply)
  {
    xpc_dictionary_set_uint64(reply, "error", a3);
    xpc_dictionary_set_value(v6, "argv", a2);
  }

  else
  {
    int v7 = *__error();
    if (qword_10005A8B8 != -1) {
      dispatch_once(&qword_10005A8B8, &stru_100057778);
    }
    int v8 = (os_log_s *)qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint32_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "failed to extract reply from request, the connection may have gone",  v10,  2u);
    }

    * __error() = v7;
  }

  return v6;
}

uint64_t sub_10003D148(void *a1, const char *a2, CFErrorRef *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2LL;
  }
  uint64_t v5 = value;
  if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary) {
    return sub_10003D1A4(v5, a3);
  }
  else {
    return 79LL;
  }
}

uint64_t sub_10003D1A4(void *a1, CFErrorRef *a2)
{
  xpc_object_t value = 0LL;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "cferr_userinfo");
  if (dictionary)
  {
    uint64_t v5 = dictionary;
    string = (char *)xpc_dictionary_get_string(a1, "cferr_domain");
    CFStringRef v7 = sub_10000A17C(string);
    if (v7)
    {
      int v8 = v7;
      int64_t int64 = xpc_dictionary_get_int64(a1, "cferr_code");
      xpc_object_t v10 = xpc_dictionary_get_dictionary(v5, "underlying_cferr");
      if (v10 && sub_10003D1A4(v10, &value))
      {
        int v11 = *__error();
        if (qword_10005A8B8 != -1) {
          dispatch_once(&qword_10005A8B8, &stru_100057778);
        }
        int v12 = (os_log_s *)qword_10005A8C0;
        if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)int buf = 67109120;
        int v31 = 22;
        uint64_t v13 = "Failed to unpack underlying error.: %{darwin.errno}d";
      }

      else
      {
        xpc_dictionary_set_value(v5, "underlying_cferr", 0LL);
        int v17 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject(v5);
        if (v17)
        {
          __int16 v18 = v17;
          MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v17);
          if (MutableCopy)
          {
            stat v20 = MutableCopy;
            if (value) {
              CFDictionarySetValue(MutableCopy, kCFErrorUnderlyingErrorKey, value);
            }
            CFErrorRef v21 = CFErrorCreate(0LL, v8, int64, v20);
            if (v21)
            {
              if (a2)
              {
                uint64_t v16 = 0LL;
                *a2 = v21;
              }

              else
              {
                CFRelease(v21);
                uint64_t v16 = 0LL;
              }
            }

            else
            {
              int v26 = *__error();
              if (qword_10005A8B8 != -1) {
                dispatch_once(&qword_10005A8B8, &stru_100057778);
              }
              int v27 = (os_log_s *)qword_10005A8C0;
              if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int buf = 67109120;
                int v31 = 12;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to create CFError.: %{darwin.errno}d",  buf,  8u);
              }

              * __error() = v26;
              uint64_t v16 = 12LL;
            }

            CFRelease(v20);
          }

          else
          {
            int v24 = *__error();
            if (qword_10005A8B8 != -1) {
              dispatch_once(&qword_10005A8B8, &stru_100057778);
            }
            xpc_object_t v25 = (os_log_s *)qword_10005A8C0;
            if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              int v31 = 12;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to create mutable dictionary.: %{darwin.errno}d",  buf,  8u);
            }

            * __error() = v24;
            uint64_t v16 = 12LL;
          }

          CFRelease(v18);
          goto LABEL_45;
        }

        int v11 = *__error();
        if (qword_10005A8B8 != -1) {
          dispatch_once(&qword_10005A8B8, &stru_100057778);
        }
        int v12 = (os_log_s *)qword_10005A8C0;
        if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          * __error() = v11;
          uint64_t v16 = 22LL;
LABEL_45:
          CFRelease(v8);
          goto LABEL_46;
        }

        *(_DWORD *)int buf = 67109120;
        int v31 = 22;
        uint64_t v13 = "Failed to convert CF to XPC.: %{darwin.errno}d";
      }

      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
      goto LABEL_31;
    }

    int v22 = *__error();
    if (qword_10005A8B8 != -1) {
      dispatch_once(&qword_10005A8B8, &stru_100057778);
    }
    __int16 v23 = (os_log_s *)qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v31 = 12;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to create string.: %{darwin.errno}d",  buf,  8u);
    }

    * __error() = v22;
    uint64_t v16 = 12LL;
  }

  else
  {
    int v14 = *__error();
    if (qword_10005A8B8 != -1) {
      dispatch_once(&qword_10005A8B8, &stru_100057778);
    }
    unint64_t v15 = (os_log_s *)qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v31 = 22;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CFError XPC dictionary is missing user info.: %{darwin.errno}d",  buf,  8u);
    }

    * __error() = v14;
    uint64_t v16 = 22LL;
  }

xpc_object_t sub_10003D660(__CFError *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v3 = CFErrorCopyUserInfo(a1);
  if (v3)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v3);
    if (!MutableCopy) {
      sub_10003D9A0();
    }
    uint64_t v5 = MutableCopy;
    CFDictionaryRemoveValue(MutableCopy, kCFErrorUnderlyingErrorKey);
    uint64_t v6 = _CFXPCCreateXPCObjectFromCFObject(v5);
    if (!v6) {
      sub_10003D9B8();
    }
    CFStringRef v7 = (void *)v6;
    if (CFDictionaryGetValue(v3, kCFErrorUnderlyingErrorKey))
    {
      int v8 = (void *)sub_10003D660();
      if (!v8) {
        sub_10003D9D0();
      }
      int v9 = v8;
      xpc_dictionary_set_value(v7, "underlying_cferr", v8);
    }

    else
    {
      int v9 = 0LL;
    }

    xpc_dictionary_set_value(v2, "cferr_userinfo", v7);
  }

  else
  {
    int v9 = 0LL;
    CFStringRef v7 = 0LL;
    uint64_t v5 = 0LL;
  }

  if (!CFErrorGetDomain(a1)) {
    sub_10003D988();
  }
  CFErrorDomain Domain = CFErrorGetDomain(a1);
  int v11 = sub_10000A048(Domain);
  xpc_dictionary_set_string(v2, "cferr_domain", v11);
  int64_t Code = CFErrorGetCode(a1);
  xpc_dictionary_set_int64(v2, "cferr_code", Code);
  free(v11);
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v7) {
    os_release(v7);
  }
  if (v9) {
    os_release(v9);
  }
  return v2;
}

void *sub_10003D7E8(void *a1, void *a2, __CFError *a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  uint64_t v6 = reply;
  if (reply)
  {
    xpc_dictionary_set_value(reply, "argv", a2);
    if (a3)
    {
      xpc_object_t v7 = sub_10003D660(a3);
      xpc_dictionary_set_value(v6, "cferr", v7);
      if (v7) {
        os_release(v7);
      }
    }
  }

  else
  {
    int v8 = *__error();
    if (qword_10005A8B8 != -1) {
      dispatch_once(&qword_10005A8B8, &stru_100057778);
    }
    int v9 = (os_log_s *)qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "failed to extract reply from request, the connection may have gone",  v11,  2u);
    }

    * __error() = v8;
  }

  return v6;
}

uint64_t sub_10003D8E8(void *a1, void *a2)
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "argv");
  uint64_t result = 0LL;
  *a2 = dictionary;
  return result;
}

void sub_10003D944(id a1)
{
  qword_10005A8C0 = (uint64_t)os_log_create("com.apple.libcryptex", "xpc");
}

void sub_10003D970()
{
}

void sub_10003D988()
{
}

void sub_10003D9A0()
{
}

void sub_10003D9B8()
{
}

void sub_10003D9D0()
{
}

void sub_10003D9E8(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100006090()) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  uint64_t v7 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003DAAC(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  sub_1000096CC(v5);
  uint64_t v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  sub_100009698(v6);
  __break(1u);
}

void sub_10003DB70(const char *a1)
{
  if (sub_100009634()) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  uint64_t v3 = __error();
  sub_1000096CC(v3);
  sub_100009604();
  uint64_t v6 = sub_1000095D8(v2, v1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009698(v6);
  __break(1u);
}

void sub_10003DBFC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003DC74(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003DCEC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003DD68(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003DDF0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003DE78(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003DEF0()
{
  _os_crash("unexpected failure: bogus return from getopt_long; forget to update the argument switch?");
  __break(1u);
}

void sub_10003DF08(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003DF84()
{
}

void sub_10003DF9C()
{
}

void sub_10003DFB4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E030(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003E0A8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E124(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003E19C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E218(void *a1, os_log_s *a2)
{
  int v3 = 136315138;
  string = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received error from client: %s",  (uint8_t *)&v3,  0xCu);
}

void sub_10003E2AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected subsystem message", v1, 2u);
}

void sub_10003E2EC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E35C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E3CC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E43C()
{
}

void sub_10003E454()
{
}

void sub_10003E46C(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003E518()
{
}

void sub_10003E530(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E5A4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E618(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E68C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003E700( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E734(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  __error();
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003E800(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  __error();
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003E8B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E8E8(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Unexpected command %llu",  (uint8_t *)&v2,  0xCu);
}

void sub_10003E95C(void *a1, _OWORD *a2)
{
  if (sub_100009634()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000EBBC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003E9D0(const char *a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = __error();
  strerror(*v6);
  uint64_t v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a2, v7);
  __break(1u);
}

void sub_10003EAB4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003EB24()
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100011380();
  uint64_t v7 = sub_1000113B0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003EBA0()
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100011380();
  uint64_t v7 = sub_1000113B0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003EC1C()
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100011380();
  uint64_t v7 = sub_1000113B0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003EC98()
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100011380();
  uint64_t v7 = sub_1000113B0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003ED14()
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100011380();
  uint64_t v7 = sub_1000113B0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003ED90()
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100011380();
  uint64_t v7 = sub_1000113B0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003EE0C()
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100011380();
  uint64_t v7 = sub_1000113B0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003EE88(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_100009640((os_log_s *)&_os_log_default);
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100012100();
  uint64_t v7 = sub_1000120E4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003EF2C(const char *a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = __error();
  sub_1000096CC(v6);
  sub_100012100();
  uint64_t v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003EFF0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_100009640((os_log_s *)&_os_log_default);
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_100012100();
  uint64_t v7 = sub_1000120E4(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_10003F094(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  uint64_t v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_10003F170(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003F1EC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003F268()
{
}

void sub_10003F280(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095BC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003F2F0(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  uint64_t v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  sub_100009698(v6);
  __break(1u);
}

void sub_10003F3B4(const char *a1, void *a2, _OWORD *a3)
{
  *a2 = 0LL;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = __error();
  strerror(*v6);
  uint64_t v9 = sub_1000095D8(v5, (uint64_t)a2, v7, v8, (uint64_t)&_mh_execute_header);
  sub_100009698(v9);
  __break(1u);
}

void sub_10003F47C()
{
}

void sub_10003F494(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003F510(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003F58C(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000A794(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003F608(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000A794(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003F684( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F6F0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003F7A0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F80C()
{
}

void sub_10003F824(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *a2;
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Collation: Removing path [%s] for user %d",  (uint8_t *)&v5,  0x12u);
}

void sub_10003F8B0(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000A794(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003F92C(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100006090()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000A794(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003F9B0(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100006090()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000A794(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FA34(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FAB0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FB2C(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FBA8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FC24(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FCA0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000EBBC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003FD18(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000EBBC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003FDAC()
{
}

void sub_10003FDC4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000EBBC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003FE3C()
{
}

void sub_10003FE54()
{
}

void sub_10003FE6C()
{
}

void sub_10003FE84(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000EBBC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10003FEFC(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  __error();
  sub_100009654();
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FF78(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  __error();
  sub_100009654();
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_10003FFF4(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  __error();
  sub_100009654();
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_100040070(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  __error();
  sub_100009654();
  uint64_t v6 = sub_10000A794(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_1000400EC(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000EBBC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10004016C(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  sub_1000262E4();
  uint64_t v7 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_100040210(void *a1, _OWORD *a2)
{
  if (sub_100006090()) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  strerror(*v5);
  sub_1000262E4();
  uint64_t v7 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_1000402B4(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_100009640((os_log_s *)&_os_log_default);
  __error();
  sub_100009654();
  uint64_t v7 = sub_1000294BC(v3, v4, v5, v6, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100040358(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_100009640((os_log_s *)&_os_log_default);
  __error();
  sub_100009654();
  uint64_t v7 = sub_1000294BC(v3, v4, v5, v6, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000403FC(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  __error();
  sub_100009654();
  uint64_t v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80LL, &_mh_execute_header, &_os_log_default, 16LL);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_1000404A0()
{
}

void sub_1000404B8(void *a1, _OWORD *a2)
{
  uint64_t v2 = __error();
  sub_1000096CC(v2);
  sub_10002A358();
  uint64_t v7 = sub_1000095BC(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009648(v7);
  __break(1u);
}

void sub_100040528(uint64_t a1)
{
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Subsystem unknown %s",  (uint8_t *)&v1,  0xCu);
}

void sub_1000405A4(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000EBBC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_100040610(void *a1, _OWORD *a2)
{
  if (sub_100009634()) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_10000EBBC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_100040688(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_10000EBBC(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_1000406F4(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_1000095D8(v5, (uint64_t)a1, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_10004077C(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100006080(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_100040804(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100006080(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_100040894()
{
}

void sub_1000408AC()
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v2 = 3LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  uint64_t v3 = __error();
  sub_1000096CC(v3);
  sub_100009604();
  uint64_t v6 = sub_1000095D8(v2, v0, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009698(v6);
  __break(1u);
}

void sub_100040938(void *a1, _OWORD *a2, const _xpc_type_s *a3)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  xpc_type_get_name(a3);
  uint64_t v8 = sub_1000095D8(v5, (uint64_t)a1, v6, v7, (uint64_t)&_mh_execute_header);
  sub_100009670(v8);
  __break(1u);
}

void sub_1000409D0()
{
}

void sub_1000409E8()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v3 = (uint64_t)v2;
  sub_1000095EC(v2, v0);
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  sub_1000096CC(v5);
  sub_100012100();
  uint64_t v7 = sub_100006080(v4, v3, v1, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_100040A90(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  __error();
  sub_100009654();
  uint64_t v6 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v5, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_100040B18(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  sub_1000096CC(v5);
  sub_100012100();
  uint64_t v7 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_100040BC0(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_100040C40(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_100006080(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_100009648(v6);
  __break(1u);
}

void sub_100040CC8(void *a1, _OWORD *a2)
{
  uint64_t v6 = sub_1000095D8(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_100040D48(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  sub_1000096CC(v5);
  sub_100012100();
  uint64_t v7 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_100040DF0()
{
}

void sub_100040E08(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  uint64_t v6 = sub_1000095D8(v5, (uint64_t)a1, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100009670(v6);
  __break(1u);
}

void sub_100040E90(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  sub_1000096CC(v5);
  sub_100012100();
  uint64_t v7 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_100040F38(void *a1, _OWORD *a2)
{
  if (sub_100009640((os_log_s *)&_os_log_default)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  uint64_t v5 = __error();
  sub_1000096CC(v5);
  sub_100012100();
  uint64_t v7 = sub_100006080(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009698(v7);
  __break(1u);
}

void sub_100040FE0()
{
}

void sub_100040FF8()
{
}

void sub_100041010( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041088(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100038E60( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Unpending failed: %@",  v3,  v4,  v5,  v6,  2u);

  sub_100038E80();
}

void sub_100041108( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041174(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Initiating removal for domain failed: %@",  (uint8_t *)&v2,  0xCu);

  sub_100038E80();
}

void sub_100041200()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Invalid type for CryptexSessionKeystone",  v0,  2u);
  sub_100038E8C();
}

id objc_msgSend_initWithBundle_version_atPath_withScope_withCommand_withCommandArgs_withEnv_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundle:version:atPath:withScope:withCommand:withCommandArgs:withEnv:");
}

id objc_msgSend_sessionAddCptxWithBundleID_withType_dmgFd_trustCacheFD_manifestFD_volumeHashFD_infoPlistFd_cx1Properties_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sessionAddCptxWithBundleID:withType:dmgFd:trustCacheFD:manifestFD:volumeHashFD:infoPlistFd:cx1Properties:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}