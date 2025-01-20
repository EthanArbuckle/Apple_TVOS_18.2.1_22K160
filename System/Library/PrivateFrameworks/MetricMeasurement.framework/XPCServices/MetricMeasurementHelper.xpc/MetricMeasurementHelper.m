int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  os_log_s *v5;
  void *v6;
  void *v7;
  void *v8;
  ServiceDelegate *v9;
  void *v10;
  int v12;
  void *v13;
  unsetenv("TMPDIR");
  _set_user_dir_suffix("com.apple.MetricMeasurementHelper");
  v3 = objc_autoreleasePoolPush();
  v4 = _MXMGetLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 infoDictionary]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CFBundleName"]);
    v12 = 138412290;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting %@.", (uint8_t *)&v12, 0xCu);
  }

  v9 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v10 setDelegate:v9];
  objc_autoreleasePoolPop(v3);
  [v10 resume];

  return 0;
}

LABEL_23:
  return v10;
}

    v12 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }

  v3 = v2;
  v4 = v2;
  v5 = malloc(v2);
  if (!v5)
  {
    v26 = _MXMGetLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v23 = "Failed to allocate buffer";
      v24 = v20;
      v25 = 2;
      goto LABEL_22;
    }

    goto LABEL_23;
  }

  v6 = v5;
  memset(v5, 255, v4);
  v7 = proc_listpids(1u, 0, v6, v3);
  v8 = _MXMGetLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v29 = v1;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Searching for procName: %@", buf, 0xCu);
  }

  if (v7 < 4)
  {
LABEL_15:
    v12 = 0xFFFFFFFFLL;
  }

  else
  {
    else {
      v10 = (unint64_t)v7 >> 2;
    }
    v11 = (int *)v6;
    while (1)
    {
      v13 = *v11++;
      v12 = v13;
      if (v13 >= 1)
      {
        v14 = _fullProcessNameForPid(v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = _MXMGetLog();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v29 = v15;
          *(_WORD *)&v29[8] = 1024;
          *(_DWORD *)&v29[10] = v12;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Checking %@ (%d)", buf, 0x12u);
        }

        v18 = [v15 isEqualToString:v1];
        if ((v18 & 1) != 0) {
          break;
        }
      }

      if (!--v10) {
        goto LABEL_15;
      }
    }
  }

  free(v6);
  v19 = _MXMGetLog();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v29 = v12;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = v1;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Found pid (%d) for process name: %@", buf, 0x12u);
  }

uint64_t uncache_regular_file(int a1, size_t a2)
{
  if (!a2) {
    return 0LL;
  }
  v3 = mmap(0LL, a2, 1, 1, a1, 0LL);
  if (v3 == (void *)-1LL)
  {
    sub_100008980();
  }

  else
  {
    v4 = v3;
    if (msync(v3, a2, 18) != -1)
    {
      munmap(v4, a2);
      return 0LL;
    }

    uint64_t v6 = _MXMGetLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error while trying to uncache: msync", v8, 2u);
    }

    munmap(v4, a2);
  }

  return 1LL;
}

uint64_t uncache_dir2(DIR *a1)
{
  int v2 = open(".", 0);
  if (v2 == -1)
  {
    uint64_t v12 = _MXMGetLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__str = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error while trying to uncache: open(., ...)",  __str,  2u);
    }

    return 1LL;
  }

  int v3 = v2;
  int v4 = dirfd(a1);
  if (fchdir(v4) == -1)
  {
    uint64_t v14 = _MXMGetLog();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      goto LABEL_28;
    }

    *(_WORD *)__str = 0;
    v16 = "Error while trying to uncache: fchdir(dirfd(dirp))";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, v16, __str, 2u);
    goto LABEL_27;
  }

  v5 = (dirent *)malloc(0x418uLL);
  int v6 = readdir_r(a1, v5, &v20);
  BOOL v7 = v6 == 0;
  if (!v6 && v20 == v5)
  {
    do
    {
      if (strcmp(".", v5->d_name))
      {
        if (strcmp("..", v5->d_name))
        {
          ssize_t v8 = getxattr(v5->d_name, "com.apple.ResourceFork", 0LL, 0LL, 0, 32);
          if (v8 != -1)
          {
            ssize_t v9 = v8;
            snprintf((char *)__str, 0x400uLL, "%s/..namedfork/rsrc", v5->d_name);
          }
        }
      }

      int v10 = readdir_r(a1, v5, &v20);
      BOOL v7 = v10 == 0;
    }

    while (!v10 && v20 == v5);
  }

  if (v7)
  {
    free(v5);
    if (fchdir(v3) != -1)
    {
      close(v3);
      return 0LL;
    }

    uint64_t v19 = _MXMGetLog();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)__str = 0;
    v16 = "Error while trying to uncache: fchdir(oldcwdfd)";
    goto LABEL_26;
  }

  uint64_t v17 = _MXMGetLog();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__str = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Error while trying to uncache: readdir_r",  __str,  2u);
  }

LABEL_23:
  free(v5);
  fchdir(v3);
LABEL_28:
  close(v3);
  return 1LL;
}

uint64_t uncache_filename(const char *a1, size_t a2)
{
  int v4 = open(a1, 0);
  if (v4 == -1)
  {
    uint64_t v10 = _MXMGetLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28.st_dev) = 0;
      uint64_t v12 = "Error while trying to uncache: open";
      v13 = (uint8_t *)&v28;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    }

LABEL_13:
    return 1LL;
  }

  int v5 = v4;
  if (fstat(v4, &v28) == -1)
  {
    uint64_t v14 = _MXMGetLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Error while trying to uncache: fstat";
      v13 = buf;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  int v6 = v28.st_mode & 0xF000;
  if (v6 == 0x8000)
  {
    if (a2) {
      size_t st_size = a2;
    }
    else {
      size_t st_size = v28.st_size;
    }
    goto LABEL_27;
  }

  if (v6 != 0x4000)
  {
    uint64_t v19 = _MXMGetLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v28.st_mode;
      v21 = "Cannot uncache file of mode 0%o";
      v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
      uint32_t v24 = 8;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, v24);
    }

LABEL_26:
    goto LABEL_27;
  }

  BOOL v7 = opendir(a1);
  if (!v7)
  {
    uint64_t v25 = _MXMGetLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Error while trying to uncache: opendir";
      v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 2;
      goto LABEL_25;
    }

    goto LABEL_26;
  }

  ssize_t v8 = v7;
  int v9 = uncache_dir2(v7);
  closedir(v8);
  if (v9)
  {
LABEL_27:
    uint64_t v26 = _MXMGetLog();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = a1;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Uncache failed with filepath: %s", buf, 0xCu);
    }

    close(v5);
    return 1LL;
  }

LABEL_18:
  close(v5);
  uint64_t v16 = _MXMGetLog();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = a1;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Uncached filename: %s", buf, 0xCu);
  }

  return 0LL;
}

uint64_t _uncacheFilepath(void *a1)
{
  id v1 = a1;
  uncache_filename((const char *)[v1 UTF8String], 0);

  return 0LL;
}

void sub_100005314( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = _MXMGetLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Exception caught while trying to uncache: %@",  (uint8_t *)&a9,  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1000052DCLL);
  }

  _Unwind_Resume(exception_object);
}

uint64_t _MXMGetLog()
{
  if (qword_100011C18 != -1) {
    dispatch_once(&qword_100011C18, &stru_10000C480);
  }
  return qword_100011C10;
}

void sub_1000053EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.metricmeasurement", "Default");
  int v2 = (void *)qword_100011C10;
  qword_100011C10 = (uint64_t)v1;
}

uint64_t _MXMGetInstrumentsLog()
{
  if (qword_100011C28 != -1) {
    dispatch_once(&qword_100011C28, &stru_10000C4A0);
  }
  return qword_100011C20;
}

void sub_10000545C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.metricmeasurement", "PointsOfInterest");
  int v2 = (void *)qword_100011C20;
  qword_100011C20 = (uint64_t)v1;
}

void sub_100005FE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_10000600C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000601C(uint64_t a1)
{
}

void sub_100006024(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  clock_gettime(_CLOCK_REALTIME, &v15);
  double v9 = (double)(v15.tv_sec - *(void *)(a1 + 56));
  [*(id *)(a1 + 32) add:a4];
  unsigned int v10 = [*(id *)(a1 + 32) checkQuiesced:v9];
  char v11 = 0;
  if (v8) {
    goto LABEL_10;
  }
  if (v10)
  {
    uint64_t v12 = _MXMGetLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    char v11 = 1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Successfully quiesced within: %f", buf, 0xCu);
    }

LABEL_9:
LABEL_10:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v11;
    [v7 cancel];
    goto LABEL_11;
  }

  if (*(double *)(a1 + 72) <= v9)
  {
    uint64_t v14 = _MXMGetLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Timed out: %f", buf, 0xCu);
    }

    char v11 = 0;
    goto LABEL_9;
  }

LABEL_11:
}

LABEL_39:
          continue;
        }

        v31 = _MXMGetLog();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v26 filepath]);
          *(_DWORD *)buf = 138412290;
          v55 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Attempting to uncache filepath: %@",  buf,  0xCu);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue([v26 filepath]);
        v35 = _uncacheFilepath(v34);

        if (v35)
        {
          v36 = _MXMGetLog();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v26 filepath]);
            *(_DWORD *)buf = 138412290;
            v55 = v38;
            v39 = v37;
            v40 = "Failed to uncache filepath: %@";
            goto LABEL_38;
          }

          goto LABEL_39;
        }
      }

      os_log_type_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v45,  v56,  16LL);
      if (!v23)
      {
LABEL_42:

        id v7 = v42;
        int v5 = v44;
        break;
      }
    }
  }

          continue;
        }

        v31 = _MXMGetLog();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v26 processName]);
          *(_DWORD *)buf = 138412290;
          v55 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Attempting to terminate process with name: %@",  buf,  0xCu);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue([v26 processName]);
        v35 = _terminateProcess(v34);

        if ((v35 & 1) == 0)
        {
          v36 = _MXMGetLog();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v26 processName]);
            *(_DWORD *)buf = 138412290;
            v55 = v38;
            v39 = v37;
            v40 = "Failed to terminate process name: %@";
            goto LABEL_38;
          }

          goto LABEL_39;
        }
      }

      os_log_type_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v45,  v56,  16LL);
      if (!v23)
      {
LABEL_42:

        id v7 = v42;
        int v5 = v44;
        break;
      }
    }
  }

LABEL_43:
  v6[2](v6, 1LL, v11);
}

  v6[2](v6, 1LL, v11);
}

LABEL_19:
  return v10;
}

void sub_10000721C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100007244(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v17 = 0LL;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  double v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  char v11 = sub_1000073A4;
  uint64_t v12 = &unk_10000C518;
  timespec v15 = &v17;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v13 = v4;
  id v14 = *(id *)(a1 + 32);
  int v16 = *(_DWORD *)(a1 + 64);
  sysmon_table_apply(v3, &v9);
  objc_msgSend(*(id *)(a1 + 32), "logTopUsageProcesses:", v4, v9, v10, v11, v12);
  [*(id *)(a1 + 32) convertToPercent:*(unsigned int *)(a1 + 64) ncpus:v18[3]];
  double v6 = 100.0 - v5;
  uint64_t v7 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id, void, double))(v7 + 16))(v7, WeakRetained, *(void *)(a1 + 40), v6);

  _Block_object_dispose(&v17, 8);
}

void sub_100007388( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000073A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_1000074E8;
  v21 = sub_1000074F8;
  id v22 = 0LL;
  uint64_t v13 = 0LL;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_100007500;
  double v9 = &unk_10000C4F0;
  uint64_t v10 = &v17;
  char v11 = &v13;
  uint64_t v12 = *(void *)(a1 + 48);
  sysmon_row_apply();
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) convertToPercent:*(unsigned int *)(a1 + 56) ncpus:v14[3]];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setValue:v5 forKey:v18[5]];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_1000074C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000074E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000074F8(uint64_t a1)
{
}

void sub_100007500(void *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 51)
  {
    xpc_object_t xdouble = v5;
    BOOL v10 = xpc_get_type(v5) == (xpc_type_t)&_xpc_type_double;
    id v5 = xdouble;
    if (v10)
    {
      double value = xpc_double_get_value(xdouble);
      id v5 = xdouble;
      *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = value;
    }
  }

  else if (a2 == 13)
  {
    xpc_object_t xdoublea = v5;
    id v6 = xpc_to_foundation(v5);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = *(void *)(a1[4] + 8LL);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v5 = xdoublea;
  }
}

id xpc_to_foundation(void *a1)
{
  id v1 = a1;
  xpc_type_t type = xpc_get_type(v1);
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    id v4 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  xpc_array_get_count(v1));
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472LL;
    applier[2] = sub_100007D2C;
    applier[3] = &unk_10000C5A8;
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    id v19 = v5;
    xpc_array_apply(v1, applier);
    id v6 = v19;
  }

  else
  {
    if (type == (xpc_type_t)&_xpc_type_BOOL)
    {
      uint64_t v7 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", xpc_BOOL_get_value(v1));
      uint64_t v3 = objc_claimAutoreleasedReturnValue(v7);
LABEL_19:
      id v5 = (id)v3;
      goto LABEL_20;
    }

    if (type == (xpc_type_t)&_xpc_type_date)
    {
      int64_t value = xpc_date_get_value(v1);
      unsigned int v9 = dword_100011C34;
      if (!dword_100011C34)
      {
        mach_timebase_info((mach_timebase_info_t)&dword_100011C30);
        unsigned int v9 = dword_100011C34;
      }

      double v10 = (double)(value * (unint64_t)dword_100011C30 / v9) / 1000000000.0;
LABEL_18:
      uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
      goto LABEL_19;
    }

    if (type != (xpc_type_t)&_xpc_type_dictionary)
    {
      if (type != (xpc_type_t)&_xpc_type_double)
      {
        if (type == (xpc_type_t)&_xpc_type_int64)
        {
          uint64_t v13 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v1));
          uint64_t v3 = objc_claimAutoreleasedReturnValue(v13);
        }

        else if (type == (xpc_type_t)&_xpc_type_string)
        {
          id v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v1));
          uint64_t v3 = objc_claimAutoreleasedReturnValue(v14);
        }

        else if (type == (xpc_type_t)&_xpc_type_uint64)
        {
          uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_uint64_get_value(v1));
          uint64_t v3 = objc_claimAutoreleasedReturnValue(v15);
        }

        else
        {
          uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        }

        goto LABEL_19;
      }

      double v10 = xpc_double_get_value(v1);
      goto LABEL_18;
    }

    char v11 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  xpc_dictionary_get_count(v1));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100007D7C;
    v16[3] = &unk_10000C5D0;
    id v5 = (id)objc_claimAutoreleasedReturnValue(v11);
    id v17 = v5;
    xpc_dictionary_apply(v1, v16);
    id v6 = v17;
  }

LABEL_20:
  return v5;
}

int64_t sub_100007A68(id a1, id a2, id a3)
{
  id v4 = a3;
  [a2 doubleValue];
  double v6 = v5;
  [v4 doubleValue];
  double v8 = v7;

  return v6 < v8;
}
}

double MachAbsoluteTimeToTimeInterval(uint64_t a1)
{
  unsigned int v2 = dword_100011C34;
  if (!dword_100011C34)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_100011C30);
    unsigned int v2 = dword_100011C34;
  }

  return (double)((unint64_t)dword_100011C30 * a1 / v2) / 1000000000.0;
}

uint64_t sub_100007D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = xpc_to_foundation(a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [*(id *)(a1 + 32) setObject:v6 atIndexedSubscript:a2];

  return 1LL;
}

uint64_t sub_100007D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = xpc_to_foundation(a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  double v7 = *(void **)(a1 + 32);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v7 setObject:v6 forKeyedSubscript:v8];

  return 1LL;
}

id _fullProcessNameForPid(int a1)
{
  if (a1 < 1 || (bzero(buffer, 0x1000uLL), proc_pidpath(a1, buffer, 0x1000u) < 1))
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    buffer[4095] = 0;
    unsigned int v2 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", basename(buffer));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }

  return v3;
}

uint64_t _processIdentifierWithProcessName(void *a1)
{
  id v1 = a1;
  *__error() = 0;
  unsigned int v2 = proc_listpids(1u, 0, 0LL, 0);
  if ((v2 & 0x80000000) != 0)
  {
    uint64_t v21 = _MXMGetLog();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v22 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v29 = v22;
      os_log_type_t v23 = "Failed to read pids: %d";
      uint32_t v24 = v20;
      uint32_t v25 = 8;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, v23, buf, v25);
    }

LABEL_24:
  return v12;
}

uint64_t _terminateProcess(void *a1)
{
  id v1 = a1;
  if ((os_variant_allows_internal_security_policies("com.apple.metricmeasurement") & 1) != 0)
  {
    uint64_t v2 = _MXMGetLog();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "AppleInternal policies must be enabled for successful process termination.",  buf,  2u);
    }

    uint64_t v4 = 0LL;
    goto LABEL_20;
  }

  uint64_t v5 = _processIdentifierWithProcessName(v1);
  if ((int)v5 >= 1)
  {
    int v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  v5));
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v7));

    id v8 = [objc_alloc_init(RBSTerminateContext) initWithExplanation:@"Terminating process between performance test iterations via MetricMeasurement"];
    [v8 setReportType:0];
    id v9 = [[RBSTerminateRequest alloc] initWithPredicate:v3 context:v8];
    unint64_t v10 = v9;
    if (v9)
    {
      id v19 = 0LL;
      unsigned __int8 v11 = [v9 execute:&v19];
      uint64_t v12 = (os_log_s *)v19;
      uint64_t v13 = _MXMGetLog();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = v14;
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v1;
          __int16 v22 = 1024;
          int v23 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Successfully terminated process with name: %@ (%d)",  buf,  0x12u);
        }

        uint64_t v4 = 1LL;
        goto LABEL_19;
      }

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v1;
        __int16 v22 = 1024;
        int v23 = v6;
        __int16 v24 = 2112;
        uint32_t v25 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error occurred when trying to terminate process with name: %@ (%d). Error: %@",  buf,  0x1Cu);
      }
    }

    else
    {
      uint64_t v17 = _MXMGetLog();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v1;
        __int16 v22 = 1024;
        int v23 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to create RBSTerminateRequest for process name: %@ (%d)",  buf,  0x12u);
      }
    }

    uint64_t v4 = 0LL;
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v16 = _MXMGetLog();
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v4 = 1LL;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Unable to find process ID for process name: %@. Skipping termination.",  buf,  0xCu);
  }

LABEL_20:
  return v4;
}

void sub_100008980()
{
  uint64_t v0 = _MXMGetLog();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error while trying to uncache: mmap", v2, 2u);
  }
}

id objc_msgSend_wait_sema(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wait_sema");
}