void sub_10000289C(id a1)
{
  NSString *v1;
  uint64_t v2;
  void *v3;
  v1 = NSTemporaryDirectory();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_1000666D0;
  qword_1000666D0 = v2;
}
}

void sub_1000043D0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000043E4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_100004420( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_10000445C(id a1)
{
  return a1;
}

id getPIDsAndProcNames(FILE *a1)
{
  int v2 = proc_listpids(1u, 0, 0LL, 0);
  if (v2 <= 0)
  {
    v14 = __error();
    v15 = strerror(*v14);
    if (fprintf(a1, "Error: Failed to fetch bytes for pids with proc_listpids for PROC_ALL_PIDS: %s\n", v15) == -1)
    {
      __error();
      if ((byte_1000666E7 & 1) == 0)
      {
        byte_1000666E7 = 1;
        id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v18 = shared_filesystem_metadata_snapshot_service_log_handle();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002B630();
    }
    goto LABEL_29;
  }

  int v3 = v2;
  v4 = calloc(v2, 1uLL);
  if (!v4)
  {
    v20 = __error();
    v21 = strerror(*v20);
    if (fprintf(a1, "Error: Failed to allocate memory to read pids into: %s\n", v21) == -1)
    {
      __error();
      if ((byte_1000666E8 & 1) == 0)
      {
        byte_1000666E8 = 1;
        id v22 = shared_filesystem_metadata_snapshot_service_log_handle();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v24 = shared_filesystem_metadata_snapshot_service_log_handle();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002B69C();
    }
LABEL_29:

LABEL_30:
    id v25 = 0LL;
    return v25;
  }

  v5 = v4;
  int v6 = proc_listpids(1u, 0, v4, v3);
  if (v6 < 1)
  {
LABEL_7:
    v8 = __error();
    v9 = strerror(*v8);
    if (fprintf(a1, "Error: Failed to fetch pids: %s\n", v9) == -1)
    {
      __error();
      if ((byte_1000666E9 & 1) == 0)
      {
        byte_1000666E9 = 1;
        id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v12 = shared_filesystem_metadata_snapshot_service_log_handle();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002B708();
    }

    free(v5);
    goto LABEL_30;
  }

  unsigned int v7 = v6;
  while ((unint64_t)v7 + 4 >= v3)
  {
    int v3 = v7 + 128;
    v5 = realloc(v5, (int)(v7 + 128));
    unsigned int v7 = proc_listpids(1u, 0, v5, v7 + 128);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v7 >= 4)
  {
    uint64_t v28 = v7 >> 2;
    v29 = (unsigned int *)v5;
    do
    {
      unsigned int v31 = *v29++;
      unsigned int v30 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v31));
      if (!proc_name(v31, buffer, 0x20u))
      {
        v33 = __error();
        v34 = strerror(*v33);
        if (fprintf(a1, "Error: Failed to get proc_name for pid %d: %s\n", v30, v34) == -1)
        {
          v35 = __error();
          if ((byte_1000666EA & 1) == 0)
          {
            int v36 = *v35;
            byte_1000666EA = 1;
            id v37 = shared_filesystem_metadata_snapshot_service_log_handle();
            v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              unsigned int v55 = v36;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
            }
          }
        }

        id v39 = shared_filesystem_metadata_snapshot_service_log_handle();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v50 = __error();
          v51 = strerror(*v50);
          *(_DWORD *)buf = 67109378;
          unsigned int v55 = v30;
          __int16 v56 = 2080;
          v57 = v51;
          _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Error: Failed to get proc_name for pid %d: %s",  buf,  0x12u);
        }

        if (snprintf((char *)buffer, 0x20uLL, "UNKNOWN_PROCESS_%d", v30) < 0)
        {
          v41 = __error();
          v42 = strerror(*v41);
          if (fprintf(a1, "Error: Failed to sprintf procname for pid %d: %s\n", v30, v42) == -1)
          {
            v43 = __error();
            if ((byte_1000666EB & 1) == 0)
            {
              int v44 = *v43;
              byte_1000666EB = 1;
              id v45 = shared_filesystem_metadata_snapshot_service_log_handle();
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                unsigned int v55 = v44;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
              }
            }
          }

          id v47 = shared_filesystem_metadata_snapshot_service_log_handle();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v52 = __error();
            v53 = strerror(*v52);
            *(_DWORD *)buf = 67109378;
            unsigned int v55 = v30;
            __int16 v56 = 2080;
            v57 = v53;
            _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "Error: Failed to sprintf procname for pid %d: %s",  buf,  0x12u);
          }

          buffer[0] = *(_OWORD *)"UKNOWN_PROCESS";
          buffer[1] = unk_10002FA50;
        }
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", buffer));
      [v27 setObject:v49 forKeyedSubscript:v32];

      --v28;
    }

    while (v28);
  }

  free(v5);
  id v25 = [v27 copy];

  return v25;
}

void addEntryForPath(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v20 = a1;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v20]);

  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v9 setObject:v12 forKeyedSubscript:v20];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v20]);
    [v14 setObject:v13 forKeyedSubscript:@"Processes"];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v20]);
    [v16 setObject:v15 forKeyedSubscript:@"VnodeSize"];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", a3));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v20]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Processes"]);
  [v19 setObject:v10 forKeyedSubscript:v17];
}

void populateTextFiles(uint64_t a1, void *a2, void *a3, FILE *a4)
{
  id v7 = a2;
  id v8 = a3;
  if ((_DWORD)a1)
  {
    uint64_t v9 = 0LL;
    int v10 = 10000;
    while (1)
    {
      uint64_t v11 = proc_pidinfo(a1, 8, v9, &buffer, 1272);
      uint64_t v12 = v11;
      if (v11 > 0x4F7)
      {
        if (v44[0])
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v44));
          id v22 = v21;
          if (!v42) {
            addEntryForPath(v21, v43, a1, v7, v8);
          }
        }

        uint64_t v9 = v41 + v40;
      }

      else
      {
        v13 = __error();
        v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: Too few bytes returned by proc_pidinfo(PROC_PIDREGIONPATHINFO) for %@[%d] (expected %lu, got %d): %s",  v7,  a1,  1272LL,  v12,  strerror(*v13));
        id v15 = objc_claimAutoreleasedReturnValue(v14);
        if (fprintf(a4, "%s\n", (const char *)[v15 UTF8String]) == -1)
        {
          id v16 = __error();
          if ((byte_1000666EE & 1) == 0)
          {
            int v34 = *v16;
            byte_1000666EE = 1;
            id v17 = shared_filesystem_metadata_snapshot_service_log_handle();
            id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v37 = v34;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
            }
          }
        }

        id v19 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10002B774((int)&v35, v15);
        }

        addEntryForPath(v15, 0LL, a1, v7, v8);
      }

      if (!--v10) {
        goto LABEL_38;
      }
    }

    if (*__error() != 3 && *__error() != 22)
    {
      v27 = __error();
      uint64_t v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: proc_pidinfo(PROC_PIDREGIONPATHINFO) error for %@[%d]: %s",  v7,  a1,  strerror(*v27));
      id v29 = objc_claimAutoreleasedReturnValue(v28);
      if (fprintf(a4, "%s\n", (const char *)[v29 UTF8String]) == -1)
      {
        __error();
        if ((byte_1000666ED & 1) == 0)
        {
          byte_1000666ED = 1;
          id v30 = shared_filesystem_metadata_snapshot_service_log_handle();
          unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v32 = shared_filesystem_metadata_snapshot_service_log_handle();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_10002B414(v29);
      }

      addEntryForPath(v29, 0LL, a1, v7, v8);
    }
  }

  else
  {
    if (fprintf(a4, "%s\n", "Warn: Skipping mapped files for kernel_task [0]") == -1)
    {
      __error();
      if ((byte_1000666EC & 1) == 0)
      {
        byte_1000666EC = 1;
        id v23 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v25 = shared_filesystem_metadata_snapshot_service_log_handle();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int buffer = 136315138;
      id v39 = "Warn: Skipping mapped files for kernel_task [0]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buffer, 0xCu);
    }
  }

LABEL_38:
}

void populateFDs(uint64_t a1, void *a2, void *a3, FILE *a4)
{
  id v7 = a2;
  id v8 = a3;
  if ((_DWORD)a1)
  {
    uint64_t v9 = proc_pidinfo(a1, 2, 0LL, buffer, 232);
    if ((int)v9 <= 0)
    {
      if (*__error() != 1 && *__error() != 3)
      {
        v67 = __error();
        v68 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: Error getting PID information with proc_pidinfo(PROC_PIDTASKALLINFO) for %@[%d]: %s",  v7,  a1,  strerror(*v67));
        id v13 = objc_claimAutoreleasedReturnValue(v68);
        if (fprintf(a4, "%s\n", (const char *)[v13 UTF8String]) == -1)
        {
          __error();
          if ((byte_1000666F0 & 1) == 0)
          {
            byte_1000666F0 = 1;
            id v69 = shared_filesystem_metadata_snapshot_service_log_handle();
            v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
              sub_10002B480();
            }
          }
        }

        id v71 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_74;
        }
        goto LABEL_73;
      }
    }

    else
    {
      uint64_t v10 = v9;
      if (v9 <= 0xE7)
      {
        uint64_t v11 = __error();
        uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: Too few bytes returned by proc_pidinfo(PROC_PIDTASKALLINFO) for %@[%d] (expected %lu, got %d): %s",  v7,  a1,  232LL,  v10,  strerror(*v11));
        id v13 = objc_claimAutoreleasedReturnValue(v12);
        if (fprintf(a4, "%s\n", (const char *)[v13 UTF8String]) == -1)
        {
          __error();
          if ((byte_1000666F1 & 1) == 0)
          {
            byte_1000666F1 = 1;
            id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
            id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
              sub_10002B480();
            }
          }
        }

        id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_74;
        }
        goto LABEL_73;
      }
    }

    int v22 = __count;
    if ((int)__count <= 0)
    {
      id v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Error: No open files for %@[%d]", v7, a1));
      if (fprintf(a4, "%s\n", (const char *)[v13 UTF8String]) == -1)
      {
        __error();
        if ((byte_1000666F2 & 1) == 0)
        {
          byte_1000666F2 = 1;
          id v59 = shared_filesystem_metadata_snapshot_service_log_handle();
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v61 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_74;
      }
    }

    else
    {
      id v23 = calloc(__count, 8uLL);
      if (v23)
      {
        v78 = v23;
        int v24 = proc_pidinfo(a1, 1, 0LL, v23, 8 * v22);
        if (v24 <= 0)
        {
          if (*__error() != 3)
          {
            v72 = __error();
            v73 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: Failed to read fdinfo for %@[%d]: %s",  v7,  a1,  strerror(*v72));
            id v13 = objc_claimAutoreleasedReturnValue(v73);
            if (fprintf(a4, "%s\n", (const char *)[v13 UTF8String]) == -1)
            {
              __error();
              if ((byte_1000666F4 & 1) == 0)
              {
                byte_1000666F4 = 1;
                id v74 = shared_filesystem_metadata_snapshot_service_log_handle();
                v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
                if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
                  sub_10002B480();
                }
              }
            }

            id v76 = shared_filesystem_metadata_snapshot_service_log_handle();
            v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              sub_10002B414(v13);
            }

            free(v78);
            goto LABEL_75;
          }
        }

        else if (v24 >= 8)
        {
          uint64_t v25 = v24 >> 3;
          v26 = v78 + 1;
          v27 = &AnalyticsSendEventLazy_ptr;
          while (*v26 != 1)
          {
LABEL_51:
            v26 += 2;
            if (!--v25) {
              goto LABEL_78;
            }
          }

          uint64_t v28 = *(v26 - 1);
          uint64_t v29 = proc_pidfdinfo(a1, *(v26 - 1), 2, buf, 1200);
          if ((int)v29 <= 0)
          {
            id v45 = (uint8_t *)"UNKNOWN_VNODE_PATH_(revoked)";
            if (*__error() != 2)
            {
              v46 = v27[42];
              id v47 = __error();
              id v48 = [v46 stringWithFormat:@"Error: Failed to read proc_pidfdinfo(PROC_PIDFDVNODEPATHINFO) for %@[%d]: %s", v7, a1, strerror(*v47)];
              id v49 = objc_claimAutoreleasedReturnValue(v48);
              if (fprintf(a4, "%s\n", (const char *)[v49 UTF8String]) == -1)
              {
                v50 = __error();
                if ((byte_1000666F5 & 1) == 0)
                {
                  v51 = v27;
                  int v52 = *v50;
                  byte_1000666F5 = 1;
                  id v53 = shared_filesystem_metadata_snapshot_service_log_handle();
                  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v80 = 67109120;
                    int v81 = v52;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v80,  8u);
                  }

                  v27 = v51;
                }
              }

              id v55 = shared_filesystem_metadata_snapshot_service_log_handle();
              __int16 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                sub_10002B774((int)&v82, v49);
              }

              id v45 = v80;
              bzero(v80, 0x401uLL);
              __strncat_chk(v80, "UKNOWN_VNODE_PATH_", 18LL, 1025LL);
              v57 = __error();
              v58 = strerror(*v57);
              __strncat_chk(v80, v58, 1006LL, 1025LL);
            }

            __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v27[42] stringWithFormat:@"%@:%d:%s", v7, a1, v45]);
            uint64_t v43 = v42;
            uint64_t v44 = 0LL;
          }

          else
          {
            uint64_t v30 = v29;
            if (v29 <= 0x4AF)
            {
              unsigned int v31 = v27;
              id v32 = v27[42];
              v33 = __error();
              id v34 = [v32 stringWithFormat:@"Error: Too few bytes returned by proc_pidinfo(PROC_PIDFDVNODEPATHINFO) for fd %d for %@[%d] (expected %lu, got %d): %s", v28, v7, a1, 1200, v30, strerror(*v33)];
              id v35 = objc_claimAutoreleasedReturnValue(v34);
              if (fprintf(a4, "%s\n", (const char *)[v35 UTF8String]) == -1)
              {
                int v36 = __error();
                if ((byte_1000666F6 & 1) == 0)
                {
                  int v37 = *v36;
                  byte_1000666F6 = 1;
                  id v38 = shared_filesystem_metadata_snapshot_service_log_handle();
                  id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v80 = 67109120;
                    int v81 = v37;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v80,  8u);
                  }
                }
              }

              id v40 = shared_filesystem_metadata_snapshot_service_log_handle();
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                sub_10002B774((int)&v79, v35);
              }

              v27 = v31;
            }

            __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27[42], "stringWithFormat:", @"%s", &v87));
            uint64_t v43 = v42;
            if (v85) {
              goto LABEL_50;
            }
            uint64_t v44 = v86;
          }

          addEntryForPath(v42, v44, a1, v7, v8);
LABEL_50:

          goto LABEL_51;
        }

LABEL_78:
        free(v78);
        goto LABEL_76;
      }

      v62 = __error();
      v63 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: Failed to allocate memory for fdinfos for %@[%d]: %s",  v7,  a1,  strerror(*v62));
      id v13 = objc_claimAutoreleasedReturnValue(v63);
      if (fprintf(a4, "%s\n", (const char *)[v13 UTF8String]) == -1)
      {
        __error();
        if ((byte_1000666F3 & 1) == 0)
        {
          byte_1000666F3 = 1;
          id v64 = shared_filesystem_metadata_snapshot_service_log_handle();
          v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v66 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_74;
      }
    }

LABEL_73:
    sub_10002B414(v13);
LABEL_74:

LABEL_75:
    goto LABEL_76;
  }

  if (fprintf(a4, "%s\n", "Warn: Skipping reading fds for kernel_task [0]") == -1)
  {
    __error();
    if ((byte_1000666EF & 1) == 0)
    {
      byte_1000666EF = 1;
      id v18 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v84 = "Warn: Skipping reading fds for kernel_task [0]";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

LABEL_76:
}

id unlinkedOpenFiles(FILE *a1)
{
  if (fprintf(a1, "Info: Fetching unlinked-but-open files\n") == -1)
  {
    __error();
    if ((byte_1000666F7 & 1) == 0)
    {
      byte_1000666F7 = 1;
      id v2 = shared_filesystem_metadata_snapshot_service_log_handle();
      int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v4 = shared_filesystem_metadata_snapshot_service_log_handle();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Info: Fetching unlinked-but-open files",  buf,  2u);
  }

  id PIDsAndProcNames = getPIDsAndProcNames(a1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(PIDsAndProcNames);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_100005BF8;
  id v18 = &unk_100060748;
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v20 = a1;
  id v8 = v19;
  [v7 enumerateKeysAndObjectsUsingBlock:&v15];
  if (fprintf(a1, "Info: Finished fetching unlinked-but-open files\n") == -1)
  {
    __error();
    if ((byte_1000666F9 & 1) == 0)
    {
      byte_1000666F9 = 1;
      id v9 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Info: Finished fetching unlinked-but-open files",  buf,  2u);
  }

  fflush(a1);
  int v22 = @"UnlinkedOpenFiles";
  id v23 = v8;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL,  v15,  v16,  v17,  v18));

  return v13;
}

void sub_100005BF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 intValue];
  if ((_DWORD)v6)
  {
    uint64_t v7 = (uint64_t)v6;
    populateTextFiles((uint64_t)v6, v5, *(void **)(a1 + 32), *(FILE **)(a1 + 40));
    populateFDs(v7, v5, *(void **)(a1 + 32), *(FILE **)(a1 + 40));
  }

  else
  {
    if (fprintf(*(FILE **)(a1 + 40), "%s\n", "Warn: Skipping looking for unlinked-but-open files for kernel_task [0]") == -1)
    {
      __error();
      if ((byte_1000666F8 & 1) == 0)
      {
        byte_1000666F8 = 1;
        id v8 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "Warn: Skipping looking for unlinked-but-open files for kernel_task [0]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
}

void sub_100005D4C(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

id sub_100005D54(int a1, id a2)
{
  return a2;
}

  ;
}

char *sub_100005D74(int *a1)
{
  return strerror(*a1);
}

int *sub_100005D7C()
{
  return __error();
}

id shared_filesystem_metadata_snapshot_service_log_handle()
{
  if (qword_100066708 != -1) {
    dispatch_once(&qword_100066708, &stru_100060768);
  }
  return (id)qword_100066700;
}

void sub_100005DC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.diskspacediagnostics", "FilesystemMetadataSnapshotService");
  id v2 = (void *)qword_100066700;
  qword_100066700 = (uint64_t)v1;
}

void sub_100006320( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21)
{
}

id cacheDeleteItemizedPurgeable(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    v11[0] = v1;
    v10[0] = @"CACHE_DELETE_VOLUME";
    v10[1] = @"CACHE_DELETE_URGENCY";
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", dword_10002FA64[i]));
    v10[2] = @"CACHE_DELETE_NO_CACHE";
    v11[1] = v4;
    v11[2] = &__kCFBooleanTrue;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

    id v6 = (void *)CacheDeleteCopyItemizedPurgeableSpaceWithInfo(v5);
    uint64_t v7 = "CacheDeleteUrgencySpecialCase";
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    [v2 setObject:v6 forKeyedSubscript:v8];
  }

  return v2;
}

id cacheDeleteAvailable(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  for (uint64_t i = 0LL; i != 3; ++i)
  {
    id v4 = (void *)CacheDeleteCopyAvailableSpaceForVolume(v1, dword_10002FA7C[i], 0LL);
    if (i == 1) {
      id v5 = "CacheDeleteAvailableSpaceClassUserInitiated";
    }
    else {
      id v5 = "CacheDeleteAvailableSpaceClassEssential";
    }
    if (i * 4) {
      id v6 = v5;
    }
    else {
      id v6 = "CacheDeleteAvailableSpaceClassSpeculative";
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    [v2 setObject:v4 forKeyedSubscript:v7];
  }

  return v2;
}

id cacheDeleteInfo(void *a1)
{
  v9[0] = a1;
  v8[0] = @"CACHE_DELETE_VOLUME";
  v8[1] = @"CACHE_DELETE_ITEMIZED_PURGEABLE";
  id v1 = a1;
  id v2 = cacheDeleteItemizedPurgeable(v1);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[1] = v3;
  v8[2] = @"CacheDeleteAvailable";
  id v4 = cacheDeleteAvailable(v1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[2] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));

  return v6;
}

uint64_t edit_pathname(uint64_t a1, uint64_t a2)
{
  int v3 = (unsigned __int8 *)archive_entry_pathname(a2);
  int v4 = *v3;
  if (v4 == 92 || v4 == 47)
  {
    int v5 = v3[1];
    if (v5 == 92 || v5 == 47)
    {
      int v6 = v3[2];
      if (v6 == 63 || v6 == 46)
      {
        int v7 = v3[3];
        if (v7 == 92 || v7 == 47)
        {
          if (v6 == 63
            && (v3[4] | 0x20) == 0x75
            && (v3[5] | 0x20) == 0x6E
            && (v3[6] | 0x20) == 0x63
            && ((int v8 = v3[7], v8 == 92) || v8 == 47))
          {
            v3 += 8;
          }

          else
          {
            v3 += 4;
          }
        }
      }
    }
  }

  LOBYTE(v9) = *v3;
  do
  {
    id v10 = v3;
    unsigned int v11 = (v9 & 0xDF) - 65;
    uint64_t v12 = v3;
    if (v11 <= 0x19) {
      uint64_t v12 = &v3[2 * (v3[1] == 58)];
    }
    while (1)
    {
      int v3 = v12;
      int v9 = *v12;
      if (v9 != 92 && v9 != 47) {
        break;
      }
      uint64_t v12 = v3 + 1;
      if (v3[1] == 46 && v3[2] == 46)
      {
        int v15 = v3[3];
        id v13 = v3 + 3;
        int v14 = v15;
        if (v15 == 92) {
          uint64_t v12 = v13;
        }
        if (v14 == 47) {
          uint64_t v12 = v13;
        }
      }
    }
  }

  while (v10 != v3);
  if (v9) {
    uint64_t v16 = (const char *)v10;
  }
  else {
    uint64_t v16 = ".";
  }
  if (v16 != (const char *)archive_entry_pathname(a2))
  {
    id v17 = strdup(v16);
    archive_entry_copy_pathname(a2, v17);
    free(v17);
  }

  return 0LL;
}

uint64_t archive_snapshot_directory(uint64_t a1)
{
  uint64_t v2 = archive_write_new();
  if (archive_write_set_format_by_name(v2, "ustar"))
  {
    int v3 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "ustar";
      __int16 v64 = 2080;
      uint64_t v65 = archive_error_string(v2);
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Can't use format %s: %s\n", buf, 0x16u);
    }

    int v4 = *(FILE **)(a1 + 24);
    int v5 = (const char *)archive_error_string(v2);
    fprintf(v4, "Can't use format %s: %s\n", "ustar", v5);
  }

  archive_write_set_bytes_per_block(v2, 10240LL);
  if (archive_write_add_filter_gzip(v2))
  {
    int v6 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unsupported compression option\n", buf, 2u);
    }

    fwrite("Unsupported compression option\n", 0x1FuLL, 1uLL, *(FILE **)(a1 + 24));
  }

  if (archive_write_open_filename(v2, *(void *)(a1 + 8)))
  {
    int v7 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = archive_error_string(v2);
      *(_DWORD *)buf = 136315138;
      v63 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
    }
  }

  int v9 = *(FILE **)(a1 + 24);
  id v10 = (const char *)archive_error_string(v2);
  fprintf(v9, "%s\n", v10);
  unsigned int v11 = malloc(0x10000uLL);
  *(void *)(a1 + 56) = v11;
  if (!v11)
  {
    uint64_t v12 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "cannot allocate memory\n", buf, 2u);
    }
  }

  size_t v13 = fwrite("cannot allocate memory\n", 0x17uLL, 1uLL, *(FILE **)(a1 + 24));
  uint64_t v14 = archive_entry_linkresolver_new(v13);
  *(void *)(a1 + 48) = v14;
  if (!v14)
  {
    int v15 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "cannot create link resolver\n", buf, 2u);
    }
  }

  fwrite("cannot create link resolver\n", 0x1CuLL, 1uLL, *(FILE **)(a1 + 24));
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = archive_format(v2);
  uint64_t v18 = archive_entry_linkresolver_set_strategy(v16, v17);
  uint64_t disk_new = archive_read_disk_new(v18);
  *(void *)(a1 + 40) = disk_new;
  if (!disk_new)
  {
    id v20 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Cannot create read_disk object\n", buf, 2u);
    }
  }

  fwrite("Cannot create read_disk object\n", 0x1FuLL, 1uLL, *(FILE **)(a1 + 24));
  archive_read_disk_set_standard_lookup(*(void *)(a1 + 40));
  v21 = *(const char **)(a1 + 16);
  uint64_t v59 = 0LL;
  uint64_t v60 = 0LL;
  int v22 = tree_open(v21);
  if (v22)
  {
    uint64_t v23 = (uint64_t)v22;
    int v24 = tree_next((uint64_t)v22);
    if (v24)
    {
      int v25 = v24;
      while (1)
      {
        v26 = (char *)tree_current_path(v23);
        if (v25 == -2)
        {
          v27 = *(os_log_s **)(a1 + 32);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v63 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: Unable to continue traversing directory tree\n",  buf,  0xCu);
          }

          fprintf(*(FILE **)(a1 + 24), "%s: Unable to continue traversing directory tree\n", v26);
          goto LABEL_55;
        }

        fprintf(*(FILE **)(a1 + 24), "%s: Unable to continue traversing directory tree\n", v26);
        if (v25 == 1) {
          break;
        }
        if (v25 == -1)
        {
          uint64_t v28 = *(os_log_s **)(a1 + 32);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v63 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s: Couldn't visit directory\n",  buf,  0xCu);
          }

          fprintf(*(FILE **)(a1 + 24), "%s: Couldn't visit directory\n");
LABEL_54:
          *(_DWORD *)a1 = 1;
        }

LABEL_55:
        int v25 = tree_next(v23);
        if (!v25) {
          goto LABEL_56;
        }
      }

      uint64_t v29 = tree_current_lstat(v23);
      if (v29)
      {
        uint64_t v30 = v29;
        int is_physical_dir = tree_current_is_physical_dir(v23);
        archive_read_disk_set_symlink_physical(*(void *)(a1 + 40));
        uint64_t v32 = archive_entry_free(v60);
        uint64_t v60 = archive_entry_new(v32);
        archive_entry_set_pathname(v60, v26);
        uint64_t v33 = v60;
        uint64_t v34 = tree_current_access_path(v23);
        archive_entry_copy_sourcepath(v33, v34);
        int disk_entry_from_file = archive_read_disk_entry_from_file(*(void *)(a1 + 40), v60, 0xFFFFFFFFLL, v30);
        if (disk_entry_from_file)
        {
          int v36 = *(os_log_s **)(a1 + 32);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = archive_error_string(*(void *)(a1 + 40));
            *(_DWORD *)buf = 136315138;
            v63 = (const char *)v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
          }
        }

        id v38 = *(FILE **)(a1 + 24);
        id v39 = (const char *)archive_error_string(*(void *)(a1 + 40));
        uint64_t v40 = fprintf(v38, "%s\n", v39);
        if (disk_entry_from_file >= -20)
        {
          if (is_physical_dir) {
            tree_descend(v23);
          }
          edit_pathname(v40, v60);
          uint64_t v41 = (char *)archive_entry_pathname(v60);
          __int16 v42 = basename(v41);
          uint64_t v43 = (const char *)archive_entry_sourcepath(v60);
          if (strncmp(v42, "._", 2uLL))
          {
            if (copyfile(v43, 0LL, 0LL, 0xD0005u))
            {
              strcpy(v61, "/tmp/tar.md.XXXXXX");
              int v44 = mkstemp(v61);
              if ((v44 & 0x80000000) == 0)
              {
                int v45 = v44;
                if (fcntl(v44, 50, buf) != -1)
                {
                  v46 = dirname(v26);
                  asprintf(&v58, "%s/._%s", v46, v42);
                  copyfile(v43, (const char *)buf, 0LL, 0x4C0005u);
                  uint64_t v47 = stat((const char *)buf, &v57);
                  uint64_t v48 = archive_entry_new(v47);
                  archive_entry_set_pathname(v48, v58);
                  archive_entry_copy_sourcepath(v48, buf);
                  archive_read_disk_entry_from_file(*(void *)(a1 + 40), v48, 0xFFFFFFFFLL, &v57);
                  sub_1000070C4(a1, v2, v48);
                  archive_entry_free(v48);
                  unlink((const char *)buf);
                  free(v58);
                }

                close(v45);
              }
            }

            archive_entry_linkify(*(void *)(a1 + 48), &v60, &v59);
            for (uint64_t i = v60; i; v60 = i)
            {
              sub_1000070C4(a1, v2, i);
              archive_entry_free(v60);
              uint64_t i = v59;
              uint64_t v59 = 0LL;
            }
          }
        }

        goto LABEL_55;
      }

      v50 = *(os_log_s **)(a1 + 32);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v63 = v26;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s: Cannot stat\n", buf, 0xCu);
      }

      fprintf(*(FILE **)(a1 + 24), "%s: Cannot stat\n");
      goto LABEL_54;
    }

LABEL_56:
    archive_entry_free(v60);
    tree_close(v23);
  }

  else
  {
    v51 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v63 = v21;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%s: Cannot open\n", buf, 0xCu);
    }

    fprintf(*(FILE **)(a1 + 24), "%s: Cannot open\n", v21);
    *(_DWORD *)a1 = 1;
  }

  while (1)
  {
    *(void *)&v57.st_dev = 0LL;
    archive_entry_linkify(*(void *)(a1 + 48), &v57, v61);
    if (!*(void *)&v57.st_dev) {
      break;
    }
    sub_1000070C4(a1, v2, *(uint64_t *)&v57.st_dev);
    archive_entry_free(*(void *)&v57.st_dev);
  }

  if (archive_write_close(v2))
  {
    int v52 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v53 = archive_error_string(v2);
      *(_DWORD *)buf = 136315138;
      v63 = (const char *)v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
    }

    v54 = *(FILE **)(a1 + 24);
    id v55 = (const char *)archive_error_string(v2);
    fprintf(v54, "%s\n", v55);
    *(_DWORD *)a1 = 1;
  }

  free(*(void **)(a1 + 56));
  archive_entry_linkresolver_free(*(void *)(a1 + 48));
  *(void *)(a1 + 48) = 0LL;
  archive_read_free(*(void *)(a1 + 40));
  *(void *)(a1 + 40) = 0LL;
  return archive_write_free(v2);
}

uint64_t sub_1000070C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (archive_entry_size(a3) < 1)
  {
    int v7 = -1;
  }

  else
  {
    int v6 = (const char *)archive_entry_sourcepath(a3);
    int v7 = open(v6, 0);
    if (v7 == -1)
    {
      uint64_t v8 = *(os_log_s **)(a1 + 32);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = __error();
        id v10 = strerror(*v9);
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = (uint64_t)v6;
        __int16 v33 = 2080;
        uint64_t v34 = (uint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: could not open file: %s\n", buf, 0x16u);
      }

      unsigned int v11 = *(FILE **)(a1 + 24);
      uint64_t v12 = __error();
      size_t v13 = strerror(*v12);
      return fprintf(v11, "%s: could not open file: %s\n", v6, v13);
    }
  }

  uint64_t result = archive_write_header(a2, a3);
  int v15 = result;
  if ((_DWORD)result)
  {
    uint64_t v16 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v32 = archive_entry_pathname(a3);
      __int16 v33 = 2080;
      uint64_t v34 = archive_error_string(a2);
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: %s\n", buf, 0x16u);
    }

    uint64_t v17 = *(FILE **)(a1 + 24);
    uint64_t v18 = (const char *)archive_entry_pathname(a3);
    id v19 = (const char *)archive_error_string(a2);
    uint64_t result = fprintf(v17, "%s: %s\n", v18, v19);
    if (v15 == -30) {
LABEL_29:
    }
      exit(1);
  }

  if (v7 < 0 || v15 < -20)
  {
LABEL_19:
    if (v7 < 0) {
      return result;
    }
    return close(v7);
  }

  if (archive_entry_size(a3) < 1) {
    return close(v7);
  }
  ssize_t v20 = read(v7, *(void **)(a1 + 56), 0x10000uLL);
  if (v20 < 1) {
    return close(v7);
  }
  unint64_t v21 = v20;
  while (1)
  {
    unint64_t v22 = archive_write_data(a2, *(void *)(a1 + 56), v21);
    if ((v22 & 0x8000000000000000LL) != 0)
    {
      v27 = *(os_log_s **)(a1 + 32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = archive_error_string(a2);
        *(_DWORD *)buf = 136315138;
        uint64_t v32 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
      }

      uint64_t v29 = *(FILE **)(a1 + 24);
      uint64_t v30 = (const char *)archive_error_string(a2);
      fprintf(v29, "%s\n", v30);
      goto LABEL_29;
    }

    if (v22 < v21) {
      break;
    }
    uint64_t result = read(v7, *(void **)(a1 + 56), 0x10000uLL);
    unint64_t v21 = result;
    if (result <= 0) {
      goto LABEL_19;
    }
  }

  uint64_t v23 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = archive_entry_pathname(a3);
    *(_DWORD *)buf = 136315138;
    uint64_t v32 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s: Truncated write; file may have grown while being archived.\n",
      buf,
      0xCu);
  }

  int v25 = *(FILE **)(a1 + 24);
  v26 = (const char *)archive_entry_pathname(a3);
  uint64_t result = fprintf(v25, "%s: Truncated write; file may have grown while being archived.\n", v26);
  if ((v7 & 0x80000000) == 0) {
    return close(v7);
  }
  return result;
}

LABEL_42:
    id v39 = 0LL;
LABEL_43:
    uint64_t v40 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v95 = v39;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Validated options: %{public}@", buf, 0xCu);
    }

    goto LABEL_62;
  }

  int v9 = @"FilesystemMetadatSnapshotOptionShouldHashVolumeListings";
  if (![v5 count]) {
    goto LABEL_36;
  }
  v72 = a4;
  v73 = v8;
  v93[0] = @"FilesystemMetadatSnapshotOptionMountPointsAllowListArray";
  v93[1] = @"FilesystemMetadatSnapshotOptionShouldHashVolumeListings";
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 2LL));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

  int v81 = 0u;
  char v82 = 0u;
  char v79 = 0u;
  v80 = 0u;
  size_t v13 = v12;
  uint64_t v14 = -[__CFString countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v79,  v92,  16LL);
  if (v14)
  {
    int v15 = v14;
    uint64_t v16 = *(void *)v80;
    while (2)
    {
      for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v80 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)i);
        if ((-[os_log_s containsObject:](v10, "containsObject:", v18) & 1) == 0)
        {
          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported snapshot option key '%@'",  v18));
          uint64_t v41 = objc_alloc(&OBJC_CLASS___NSError);
          v90 = NSLocalizedDescriptionKey;
          v91 = v22;
          __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
          uint64_t v43 = -[NSError initWithDomain:code:userInfo:]( v41,  "initWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65541LL,  v42);

          int v44 = shared_filesystem_metadata_snapshot_service_log_handle();
          int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_10002B83C();
          }

          uint64_t v8 = v73;
          if (v72) {
            int *v72 = v43;
          }
          id v19 = v13;
          goto LABEL_61;
        }
      }

      int v15 = -[__CFString countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v79,  v92,  16LL);
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v19 = @"FilesystemMetadatSnapshotOptionMountPointsAllowListArray";
  ssize_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
  unint64_t v21 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v19]);
  unint64_t v22 = (void *)v21;
  if (v21)
  {
    if ((objc_opt_isKindOfClass(v21, v20) & 1) == 0)
    {
      v46 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected type for snapshot option key %@; unexpected type %@, expected %@",
              v19,
              objc_opt_class(v22),
              v20);
      uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);
      uint64_t v48 = objc_alloc(&OBJC_CLASS___NSError);
      __int16 v85 = NSLocalizedDescriptionKey;
      uint64_t v86 = v47;
      id v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
      v50 = -[NSError initWithDomain:code:userInfo:]( v48,  "initWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65541LL,  v49);

      v51 = shared_filesystem_metadata_snapshot_service_log_handle();
      int v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_10002B83C();
      }

      uint64_t v8 = v73;
      if (v72) {
        int *v72 = v50;
      }
      uint64_t v43 = (NSError *)v47;
LABEL_60:

LABEL_61:
      id v39 = 0LL;
      goto LABEL_62;
    }

    v68 = v19;
    uint64_t v23 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v74 = objc_opt_class(&OBJC_CLASS___NSString);
    v75 = 0u;
    id v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    id v69 = v22;
    uint64_t v24 = v22;
    int v25 = -[NSError countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v75,  v89,  16LL);
    if (v25)
    {
      v26 = v25;
      v27 = *(void *)v76;
      id v71 = v24;
      while (2)
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v76 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)j);
          if ((objc_opt_isKindOfClass(v29, v74) & 1) == 0)
          {
            v70 = v23;
            id v19 = v68;
            uint64_t v53 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected type for array element for snapshot option key %@; unexpected type %@, expected %@",
                    v68,
                    objc_opt_class(v29),
                    v74);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            id v55 = objc_alloc(&OBJC_CLASS___NSError);
            uint64_t v87 = NSLocalizedDescriptionKey;
            v88 = v54;
            __int16 v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
            stat v57 = -[NSError initWithDomain:code:userInfo:]( v55,  "initWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65541LL,  v56);

            v58 = shared_filesystem_metadata_snapshot_service_log_handle();
            uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
              sub_10002B83C();
            }

            unint64_t v22 = v69;
            uint64_t v43 = v70;
            if (v72) {
              int *v72 = v57;
            }

            uint64_t v8 = v73;
            v50 = v71;
            goto LABEL_60;
          }

          uint64_t v30 = v29;
          if ((unint64_t)[v30 length] >= 2
            && [v30 hasSuffix:@"/"])
          {
            unsigned int v31 = v9;
            uint64_t v32 = v5;
            __int16 v33 = v23;
            uint64_t v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "substringToIndex:", (char *)objc_msgSend( v30,  "length") - 1));

            uint64_t v30 = (id)v34;
            uint64_t v23 = v33;
            int v5 = v32;
            int v9 = v31;
            uint64_t v24 = v71;
          }

          -[NSError addObject:](v23, "addObject:", v30);
        }

        v26 = -[NSError countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v75,  v89,  16LL);
        if (v26) {
          continue;
        }
        break;
      }
    }

    id v19 = v68;
    if (-[NSError count](v23, "count")) {
      [v73 setObject:v23 forKeyedSubscript:v68];
    }

    unint64_t v22 = v69;
  }

  int v9 = v9;
  id v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
  int v36 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);
  uint64_t v37 = (void *)v36;
  if (!v36)
  {
LABEL_34:

    uint64_t v8 = v73;
    goto LABEL_36;
  }

  if ((objc_opt_isKindOfClass(v36, v35) & 1) != 0)
  {
    [v73 setObject:v37 forKeyedSubscript:v9];
    goto LABEL_34;
  }

  id v61 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected type for snapshot option key %@; unexpected type %@, expected %@",
          v9,
          objc_opt_class(v37),
          v35);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  v63 = objc_alloc(&OBJC_CLASS___NSError);
  v83 = NSLocalizedDescriptionKey;
  v84 = v62;
  __int16 v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
  uint64_t v65 = -[NSError initWithDomain:code:userInfo:]( v63,  "initWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65541LL,  v64);

  id v66 = shared_filesystem_metadata_snapshot_service_log_handle();
  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
    sub_10002B83C();
  }

  if (v72) {
    int *v72 = v65;
  }

  id v39 = 0LL;
  uint64_t v8 = v73;
LABEL_62:

  return v39;
}

void sub_100007EA8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v16 = 0LL;
    int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 executeWithError:&v16]);
    id v4 = v16;
  }

  else
  {
    id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002B908(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    id v4 = 0LL;
    int v3 = 0LL;
  }

  id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Replying with archive path: %@ and error: %@",  buf,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100007FD4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100007FE4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100008040(id a1)
{
  id v1 = (void *)qword_100066718;
  qword_100066718 = (uint64_t)&stru_100060838;
}

DSSnapshotFileManager *__cdecl sub_100008058(id a1, DSSnapshotRequest *a2)
{
  uint64_t v2 = a2;
  id v3 = -[DSSnapshotFileManager initForSnapshotRequest:]( objc_alloc(&OBJC_CLASS___DSSnapshotFileManager),  "initForSnapshotRequest:",  v2);

  return (DSSnapshotFileManager *)v3;
}

void sub_1000080E0(id a1)
{
  id v1 = (void *)qword_100066728;
  qword_100066728 = (uint64_t)&stru_100060898;
}

DSVolumeManager *__cdecl sub_1000080F8(id a1, DSSnapshotRequest *a2)
{
  uint64_t v2 = a2;
  id v3 = -[DSVolumeManager initForSnapshotRequest:]( objc_alloc(&OBJC_CLASS___DSVolumeManager),  "initForSnapshotRequest:",  v2);

  return (DSVolumeManager *)v3;
}

void sub_100009640( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

void sub_10000966C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_autoreleasePoolPush();
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Fetching APFS snapshot info for %{public}@",  buf,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = objc_claimAutoreleasedReturnValue([v3 mountPoint]);
  uint64_t v10 = (const char *)[v9 UTF8String];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) snapshotFileManager]);
  id v12 = snapshotsInfo(v10, (FILE *)[v11 sharedLogFile]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v8 addEntriesFromDictionary:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v14 timeIntervalSinceDate:v7];
  double v16 = v15;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) snapshotFileManager]);
  LODWORD(v13) = fprintf( (FILE *)[v17 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] APFS Snapshot info",  v16);

  if ((_DWORD)v13 == -1)
  {
    __error();
    if ((byte_10006673C & 1) == 0)
    {
      byte_10006673C = 1;
      id v18 = shared_filesystem_metadata_snapshot_service_log_handle();
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
  unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "[Metadata] APFS Snapshot info";
    __int16 v27 = 2048;
    double v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v16
  unint64_t v22 = *(void **)(a1 + 40);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "__miscProgress"));
  LODWORD(v24) = 10.0;
  objc_msgSend(v22, "__incrementProgress:byPercent:", v23, v24);

  objc_autoreleasePoolPop(v4);
}

void sub_10000A120( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A1A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000A1B8(uint64_t a1)
{
}

void sub_10000A1C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

LABEL_14:
    uint64_t v14 = v14;
    __int16 v19 = 0;
    *a4 = v14;
    goto LABEL_17;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  uint64_t v16 = (FILE *)[v15 sharedLogFile];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest beginDate](self, "beginDate"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 description]);
  LODWORD(v16) = fprintf(v16, "Started snapshotting at %s\n", (const char *)[v18 UTF8String]);

  if ((_DWORD)v16 == -1)
  {
    __error();
    __int16 v19 = 1;
    if ((byte_100066747 & 1) == 0)
    {
      byte_100066747 = 1;
      unsigned int v31 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  else
  {
    __int16 v19 = 1;
  }

                                            sub_10002AA48(v16, "", v19, v18);
                                          }

  if (v21) {
    sub_10002B258((uint64_t)v21);
  }
  return v19;
}

LABEL_17:
  return v19;
}

                                        v8 += v14;
                                        v11 -= v14;
                                        goto LABEL_2;
                                      }

                                      if (v12 == 1105)
                                      {
                                        if ((_DWORD)v14 != 14) {
                                          sub_100014184( "ASPFTLParseBufferToCxt: hostReadSequential(1105): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                        }
                                        else {
                                          id v20 = v14;
                                        }
                                        if ((sub_100023E58(a1, "hostReadSequential_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                        {
                                          unint64_t v22 = "ASPFTLParseBufferToCxt: hostReadSequential(1105): Cannot add 14 elements to context";
                                          goto LABEL_2247;
                                        }

                                        goto LABEL_14;
                                      }

                                      if (v12 != 1106) {
                                        goto LABEL_2110;
                                      }
                                      if ((_DWORD)v14 != 14) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: GCReadSequential(1106): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        id v20 = v14;
                                      }
                                      if ((sub_100023E58(a1, "GCReadSequential_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                      {
LABEL_14:
                                        uint64_t v10 = v20 + v10;
                                        goto LABEL_17;
                                      }

                                      unint64_t v22 = "ASPFTLParseBufferToCxt: GCReadSequential(1106): Cannot add 14 elements to context";
LABEL_2247:
                                      sub_100014184(v22, a2, a3, a4, a5, a6, a7, a8, v23);
                                      return v10;
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  }

LABEL_20:
  return v16;
}
      }
    }

    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  }

  while (v7);

  if ((v8 & 1) != 0)
  {
    -[DSSnapshotRequestTelemetryReporter setSnapshotPowerAssertionsDidTimeOut:]( self->__telemetryReporter,  "setSnapshotPowerAssertionsDidTimeOut:",  1LL);
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v21 timeIntervalSinceDate:self->_beginDate];
    uint64_t v23 = v22;

    double v24 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      sub_10002BDC0(self, (os_log_s *)v5, v23);
    }
    goto LABEL_26;
  }

Class sub_10000CD34(uint64_t a1)
{
  id v3 = 0LL;
  if (!qword_100066758)
  {
    __int128 v4 = off_100060930;
    uint64_t v5 = 0LL;
    qword_100066758 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_100066758) {
    sub_10002BF60(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("ATConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10002BFDC();
  }
  qword_100066750 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000CE10( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000CE24(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_10000CE2C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10000CE40( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10000CE50(uint64_t result, float a2)
{
  *id v3 = a2;
  *uint64_t v2 = result;
  return result;
}

id sub_10000D3AC(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _eventDictionary]);
  id v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002C054(v1, (uint64_t)v2, v4);
  }

  return v2;
}

void sub_10000D53C(id a1)
{
  *(double *)&qword_100066760 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

void sub_10000DB6C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"/"));
  uint64_t v2 = (void *)qword_100066770;
  qword_100066770 = v1;
}

LABEL_26:
            uint64_t v12 = (unsigned int *)((char *)v12 + v17);
            if (!--v14) {
              goto LABEL_4;
            }
          }

          uint64_t v15 = (int *)(v12 + 6);
          if ((v18 & 1) == 0) {
            goto LABEL_14;
          }
LABEL_13:
          id v20 = v15 + 2;
          unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  (char *)v15 + *v15,  v35));
          unint64_t v22 = objc_claimAutoreleasedReturnValue([v41 stringByAppendingPathComponent:v21]);

          uint64_t v15 = v20;
          uint64_t v11 = (id)v22;
          goto LABEL_14;
        }
      }

      __int16 v33 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10002C330();
      }

LABEL_37:
      free(v37);
      close(v38);

      uint64_t v5 = v36;
      uint64_t v6 = v39;
    }
  }

  else
  {
    uint64_t v29 = shared_filesystem_metadata_snapshot_service_log_handle();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10002C248(v5);
    }
  }
}

void sub_1000105C0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  uint64_t v10 = strdup((const char *)[v9 UTF8String]);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _pathRepresentationForListing:v10 isDirectory:0]);
    free(v11);
    if (!v12)
    {
      v26 = *(FILE **)(a1 + 40);
      id v27 = v9;
      if (fprintf(v26, "Failed to get hashed path for %s (isDir: 0)\n", (const char *)[v27 UTF8String]) == -1)
      {
        __error();
        if ((byte_100066796 & 1) == 0)
        {
          byte_100066796 = 1;
          id v28 = shared_filesystem_metadata_snapshot_service_log_handle();
          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v30 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10002C9A8(v27, v17);
      }
      goto LABEL_21;
    }

    uint64_t v13 = *(FILE **)(a1 + 48);
    uint64_t v14 = (const char *)[v8 UTF8String];
    id v15 = v12;
    if (fprintf(v13, "%s\t%llu\t%s\n", v14, a4, (const char *)[v15 UTF8String]) == -1)
    {
      __error();
      if ((byte_100066797 & 1) == 0)
      {
        byte_100066797 = 1;
        id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
LABEL_21:

        id v15 = v12;
      }
    }
  }

  else
  {
    uint64_t v18 = *(FILE **)(a1 + 40);
    id v19 = v9;
    id v20 = (const char *)[v19 UTF8String];
    unint64_t v21 = __error();
    unint64_t v22 = strerror(*v21);
    if (fprintf(v18, "Failed to strdup() string %s with error %s\n", v20, v22) == -1)
    {
      __error();
      if ((byte_100066795 & 1) == 0)
      {
        byte_100066795 = 1;
        id v23 = shared_filesystem_metadata_snapshot_service_log_handle();
        double v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v25 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v15 = (id)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_10002C934(v19);
    }
  }
}

void sub_100010840(uint64_t a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  if (a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _pathRepresentationForListing:*(void *)(*(void *)(a1 + 40) + 48) isDirectory:1]);
    id v9 = v8;
    if (v8)
    {
      if (fprintf( *(FILE **)(a1 + 56), "%s\t%d\n", (const char *)[v8 UTF8String], a4) != -1) {
        goto LABEL_15;
      }
      __error();
      if ((byte_100066799 & 1) != 0) {
        goto LABEL_15;
      }
      byte_100066799 = 1;
      id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }

    else
    {
      uint64_t v12 = *(FILE **)(a1 + 48);
      id v13 = v7;
      if (fprintf(v12, "Failed to get hashed path for %s (isDir: 1)\n", (const char *)[v13 UTF8String]) == -1)
      {
        __error();
        if ((byte_100066798 & 1) == 0)
        {
          byte_100066798 = 1;
          id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002CA1C(v13, v11);
      }
    }

LABEL_15:
  }
}

void sub_1000109C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (fprintf(*(FILE **)(a1 + 32), "%llu\t%llu\t%llu\t%u\n", a2, a3, a4, a5) == -1)
  {
    __error();
    if ((byte_1000667A5 & 1) == 0)
    {
      byte_1000667A5 = 1;
      id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

void sub_100010A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (fprintf(*(FILE **)(a1 + 32), "%llu\t%llu\t%llu\t%llu\n", a2, a3, a4, a5) == -1)
  {
    __error();
    if ((byte_1000667AB & 1) == 0)
    {
      byte_1000667AB = 1;
      id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

void sub_100011364(id a1)
{
  uint64_t v1 = (void *)qword_1000667B0;
  qword_1000667B0 = (uint64_t)&stru_100060A98;
}

BOOL sub_10001137C(id a1, statfs **a2, int *a3, id *a4)
{
  int v7 = getmntinfo_r_np(a2, 2);
  *a3 = v7;
  if (!v7)
  {
    int v8 = *__error();
    id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get volume info: %s.",  strerror(v8));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v8,  0LL));
    id v12 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002CA90(v11, v13);
    }

    if (a4)
    {
      v16[0] = NSUnderlyingErrorKey;
      v16[1] = NSLocalizedDescriptionKey;
      v17[0] = v11;
      v17[1] = v10;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65538LL,  v14));
    }

    *a3 = -1;
    if (a2) {
      *a2 = 0LL;
    }
  }

  return 1;
}

void sub_100011564(id a1)
{
  uint64_t v1 = (void *)qword_1000667C0;
  qword_1000667C0 = (uint64_t)&stru_100060AF8;
}

unint64_t sub_10001157C(id a1, statfs *a2)
{
  v11[2] = 0LL;
  v11[0] = 5LL;
  v11[1] = 2155872256LL;
  memset(v10, 0, 12);
  f_mntonname = a2->f_mntonname;
  if (!getattrlist(a2->f_mntonname, v11, v10, 0xCuLL, 0)) {
    return *(void *)((char *)v10 + 4);
  }
  int v4 = *__error();
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10002CB10();
  }

  if (v4 != 45) {
    return -1LL;
  }
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    id v13 = f_mntonname;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Falling back to using statfs to calculate used bytes for volume at %{public}s",  buf,  0xCu);
  }

  return (a2->f_blocks - a2->f_bfree) * a2->f_bsize;
}

LABEL_32:
  return v15;
}

void sub_100012110(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10001211C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

int *sub_100012130()
{
  return __error();
}

  ;
}

  ;
}

void sub_10001219C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DSPreferences);
  uint64_t v2 = (void *)qword_1000667D0;
  qword_1000667D0 = (uint64_t)v1;
}

void sub_1000122D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id *sub_1000122E8(id *result, int a2)
{
  if (*(_DWORD *)(*((void *)result[5] + 1) + 24LL) == a2) {
    return (id *)[result[4] refreshPreferences];
  }
  return result;
}

_OWORD *tree_open(const char *a1)
{
  uint64_t v2 = malloc(0x188uLL);
  *uint64_t v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[18] = 0u;
  v2[19] = 0u;
  v2[20] = 0u;
  v2[21] = 0u;
  v2[22] = 0u;
  v2[23] = 0u;
  *((void *)v2 + 4_Block_object_dispose(va, 8) = 0LL;
  double v3 = sub_100012530(v2, a1);
  uint64_t v4 = *(void *)v2;
  *(_DWORD *)(*(void *)v2 + 56LL) = 38;
  *(_DWORD *)(v4 + 60) = open(".", 0, v3);
  ++*((_DWORD *)v2 + 23);
  *((void *)v2 + 2) = 0LL;
  return v2;
}

double sub_100012530(void *a1, const char *a2)
{
  uint64_t v4 = malloc(0x40uLL);
  id v5 = v4;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  v4[6] = 0LL;
  uint64_t v6 = (_DWORD *)a1[1];
  v4[1] = *a1;
  v4[2] = v6;
  if (v6) {
    *(_DWORD *)uint64_t v4 = *v6 + 1;
  }
  *a1 = v4;
  id v7 = strdup(a2);
  double result = NAN;
  v5[7] = -4294967240LL;
  uint64_t v9 = a1[9];
  v5[3] = v7;
  v5[4] = v9;
  return result;
}

uint64_t tree_next(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 36) == -2) {
    sub_10002CCEC();
  }
  while (1)
  {
    while (1)
    {
      uint64_t v2 = *(void *)a1;
      if (!*(void *)a1)
      {
        uint64_t result = 0LL;
        goto LABEL_13;
      }

      if (!*(void *)(a1 + 16)) {
        break;
      }
LABEL_10:
      uint64_t result = sub_100012734(a1);
      if ((_DWORD)result) {
        return result;
      }
    }

    int v3 = *(_DWORD *)(v2 + 56);
    if ((v3 & 4) != 0)
    {
      *(void *)(a1 + _Block_object_dispose(va, 8) = v2;
      id v5 = *(const char **)(v2 + 24);
      size_t v6 = strlen(v5);
      sub_100012830(a1, v5, v6);
      *(_DWORD *)(*(void *)a1 + 56LL) &= ~4u;
      uint64_t result = 1LL;
      goto LABEL_13;
    }

    if ((v3 & 8) != 0) {
      break;
    }
    if ((v3 & 0x10) != 0)
    {
      *(_DWORD *)(v2 + 56) = v3 & 0xFFFFFFEF;
      goto LABEL_10;
    }

    if ((v3 & 0x20) != 0)
    {
      unsigned int v14 = sub_1000129B0((uint64_t *)a1);
      sub_100012938((uint64_t *)a1);
      if (v14) {
        uint64_t result = v14;
      }
      else {
        uint64_t result = 3LL;
      }
      goto LABEL_13;
    }

    sub_100012938((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) &= 0xFFFFFFCF;
  }

  *(void *)(a1 + _Block_object_dispose(va, 8) = v2;
  id v7 = *(const char **)(v2 + 24);
  size_t v8 = strlen(v7);
  sub_100012830(a1, v7, v8);
  uint64_t v9 = *(void *)a1;
  int v10 = *(_DWORD *)(*(void *)a1 + 56LL);
  *(_DWORD *)(*(void *)a1 + 56LL) = v10 & 0xFFFFFFF7;
  if ((v10 & 2) != 0)
  {
    int v11 = open(".", 0);
    uint64_t v9 = *(void *)a1;
    *(_DWORD *)(*(void *)a1 + 60LL) = v11;
    int v12 = *(_DWORD *)(a1 + 92);
    int v13 = *(_DWORD *)(a1 + 96);
    *(_DWORD *)(a1 + 92) = v12 + 1;
    if (v12 >= v13) {
      *(_DWORD *)(a1 + 96) = v12 + 1;
    }
  }

  *(void *)(a1 + 72) = *(void *)(a1 + 80);
  if (chdir(*(const char **)(v9 + 24)))
  {
    sub_100012938((uint64_t *)a1);
    *(_DWORD *)(a1 + 40) = *__error();
    uint64_t result = 0xFFFFFFFFLL;
  }

  else
  {
    ++*(_DWORD *)(a1 + 88);
    uint64_t result = 2LL;
  }

LABEL_13:
  *(_DWORD *)(a1 + 36) = result;
  return result;
}

uint64_t sub_100012734(uint64_t a1)
{
  uint64_t v2 = *(DIR **)(a1 + 16);
  if (v2 || (uint64_t v2 = opendir("."), (*(void *)(a1 + 16) = v2) != 0LL))
  {
    int v3 = readdir(v2);
    *(void *)(a1 + 24) = v3;
    if (!v3)
    {
LABEL_11:
      closedir(*(DIR **)(a1 + 16));
      uint64_t result = 0LL;
      *(void *)(a1 + 16) = 0LL;
      return result;
    }

    uint64_t v4 = v3;
    while (1)
    {
      size_t v5 = strlen(v4->d_name);
      *(_DWORD *)(a1 + 32) &= 0xFFFFFFCF;
      if (v4->d_name[0] != 46) {
        break;
      }
      if (v4->d_name[1] == 46)
      {
        if (v4->d_name[2]) {
          break;
        }
      }

      else if (v4->d_name[1])
      {
        break;
      }

      uint64_t v4 = readdir(*(DIR **)(a1 + 16));
      *(void *)(a1 + 24) = v4;
      if (!v4) {
        goto LABEL_11;
      }
    }

    sub_100012830(a1, v4->d_name, v5);
    uint64_t result = 1LL;
  }

  else
  {
    unsigned int v7 = sub_1000129B0((uint64_t *)a1);
    sub_100012938((uint64_t *)a1);
    int v8 = *__error();
    if (v7) {
      uint64_t result = v7;
    }
    else {
      uint64_t result = 0xFFFFFFFFLL;
    }
    *(_DWORD *)(a1 + 40) = v8;
  }

  *(_DWORD *)(a1 + 36) = result;
  return result;
}

char *sub_100012830(uint64_t a1, const char *a2, unint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    *(_BYTE *)(v5 + *(void *)(a1 + 72)) = 0;
  }
  size_t v6 = a3 != 0;
  while (a3 >= 2)
  {
    unint64_t v7 = a3 - 1;
    int v8 = a2[--a3];
    if (v8 != 47)
    {
      size_t v6 = v7 + 1;
      break;
    }
  }

  unint64_t v9 = v6 + *(void *)(a1 + 72) + 1;
  size_t v10 = *(void *)(a1 + 56);
  if (v10 >= v9)
  {
    int v11 = *(char **)(a1 + 48);
  }

  else
  {
    if (v10 <= 0x3FF)
    {
      size_t v10 = 1024LL;
      *(void *)(a1 + 56) = 1024LL;
    }

    if (v10 < v9)
    {
      do
        v10 *= 2LL;
      while (v10 < v9);
      *(void *)(a1 + 56) = v10;
    }

    int v11 = (char *)realloc(*(void **)(a1 + 48), v10);
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = v11;
  }

  if (!v11) {
    abort();
  }
  uint64_t v12 = *(void *)(a1 + 72);
  int v13 = &v11[v12];
  *(void *)(a1 + 80) = v12 + v6;
  if (v12 && *(v13 - 1) != 47)
  {
    *v13++ = 47;
    ++*(void *)(a1 + 80);
  }

  uint64_t result = strncpy(v13, a2, v6);
  result[v6] = 0;
  *(void *)(a1 + 64) = result;
  return result;
}

void sub_100012938(uint64_t *a1)
{
  uint64_t v1 = a1[6];
  if (v1) {
    *(_BYTE *)(v1 + a1[9]) = 0;
  }
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (*a1 == v2 && v2 != 0) {
    a1[1] = *(void *)(v3 + 16);
  }
  *a1 = *(void *)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 32);
  a1[9] = v5;
  uint64_t v6 = a1[6];
  if (v6)
  {
    unint64_t v7 = (unsigned __int8 *)(v6 + v5);
    do
    {
      a1[8] = (uint64_t)v7;
      int v8 = *v7++;
    }

    while (v8 == 47);
  }

  free(*(void **)(v3 + 24));
  free((void *)v3);
}

uint64_t sub_1000129B0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  --*((_DWORD *)a1 + 22);
  if ((*(_BYTE *)(v2 + 56) & 2) != 0)
  {
    if (fchdir(*(_DWORD *)(v2 + 60)))
    {
      *((_DWORD *)a1 + 10) = *__error();
      uint64_t v3 = 4294967294LL;
    }

    else
    {
      uint64_t v3 = 0LL;
    }

    close(*(_DWORD *)(v2 + 60));
    --*((_DWORD *)a1 + 23);
  }

  else if (chdir(".."))
  {
    *((_DWORD *)a1 + 10) = *__error();
    return 4294967294LL;
  }

  else
  {
    return 0LL;
  }

  return v3;
}

void tree_descend(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 36) == 1)
  {
    if (tree_current_is_physical_dir(a1))
    {
      int v2 = 1;
    }

    else
    {
      int v2 = 2;
    }

    sub_100012530((void *)a1, *(const char **)(a1 + 64));
    *(_DWORD *)(*(void *)a1 + 56LL) |= v2;
  }

uint64_t tree_current_is_physical_dir(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 32) & 0x10) != 0 && (*(_WORD *)(tree_current_stat(a1) + 4) & 0xF000) != 0x4000) {
    return 0LL;
  }
  uint64_t result = tree_current_lstat(a1);
  if (result) {
    return (*(_WORD *)(result + 4) & 0xF000) == 0x4000;
  }
  return result;
}

uint64_t tree_current_is_dir(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 32) & 0x20) == 0) {
    goto LABEL_5;
  }
  if ((*(_WORD *)(tree_current_lstat(a1) + 4) & 0xF000) == 0x4000) {
    return 1LL;
  }
  if ((*(_WORD *)(tree_current_lstat(a1) + 4) & 0xF000) != 0xA000) {
    return 0LL;
  }
LABEL_5:
  uint64_t result = tree_current_stat(a1);
  if (result) {
    return (*(_WORD *)(result + 4) & 0xF000) == 0x4000;
  }
  return result;
}

uint64_t tree_current_stat(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 32) & 0x10) == 0)
  {
    *(_DWORD *)(a1 + 32) |= 0x10u;
  }

  return a1 + 248;
}

uint64_t tree_current_access_path(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t tree_current_lstat(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 32) & 0x20) == 0)
  {
    *(_DWORD *)(a1 + 32) |= 0x20u;
  }

  return a1 + 104;
}

uint64_t tree_current_path(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

void tree_close(uint64_t a1)
{
  while (*(void *)a1)
    sub_100012938((uint64_t *)a1);
  free(*(void **)(a1 + 48));
  free((void *)a1);
}

BOOL hasSnapshotCapability(const char *a1, FILE *a2)
{
  __int128 v19 = xmmword_10002FB38;
  uint64_t v20 = 0LL;
  int v18 = 0;
  memset(v17, 0, sizeof(v17));
  int v4 = getattrlist(a1, &v19, v17, 0x24uLL, 0);
  if (v4 < 0)
  {
    uint64_t v6 = __error();
    unint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: Could not fetch attributes for volume at %s: %s",  a1,  strerror(*v6));
    id v8 = objc_claimAutoreleasedReturnValue(v7);
    if (fprintf(a2, "%s\n", (const char *)[v8 UTF8String]) == -1)
    {
      __error();
      if ((byte_1000667E0 & 1) == 0)
      {
        byte_1000667E0 = 1;
        id v9 = shared_filesystem_metadata_snapshot_service_log_handle();
        size_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002CD18(v8);
    }

    goto LABEL_19;
  }

  if ((BYTE10(v17[0]) & 2) != 0)
  {
    if (fprintf(a2, "Info: Volume at %s has snapshot capabilities\n", a1) == -1)
    {
      __error();
      if ((byte_1000667E1 & 1) == 0)
      {
        byte_1000667E1 = 1;
        id v13 = shared_filesystem_metadata_snapshot_service_log_handle();
        unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v8 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Info: Volume at %s has snapshot capabilities",  buf,  0xCu);
    }

LABEL_19:
    BOOL v5 = v4 >= 0;
    return v5;
  }

  return 0LL;
}

id snapshotsInfo(const char *a1, FILE *a2)
{
  id v82 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = open(a1, 0, 0LL);
  if (v4 < 0)
  {
    v67 = __error();
    v68 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: Could not open directory %s: %s",  a1,  strerror(*v67));
    id v69 = objc_claimAutoreleasedReturnValue(v68);
    if (fprintf(a2, "%s\n", (const char *)[v69 UTF8String]) == -1)
    {
      __error();
      if ((byte_1000667E2 & 1) == 0)
      {
        byte_1000667E2 = 1;
        id v70 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v72 = shared_filesystem_metadata_snapshot_service_log_handle();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v97 = 136315138;
      v98 = (const char *)[v69 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%s", v97, 0xCu);
    }

LABEL_95:
    close(v4);
    goto LABEL_96;
  }

  if (hasSnapshotCapability(a1, a2))
  {
    int v81 = a1;
    *(_OWORD *)&v87.bitmapcount = xmmword_10002FB50;
    *(void *)&v87.fileattr = 0x800000000LL;
    BOOL v5 = (const char *)fs_snapshot_list(v4, &v87, v97, 0x400uLL, 0);
    if ((v5 & 0x80000000) == 0)
    {
      v80 = a2;
      int v79 = v4;
      do
      {
        if (!(_DWORD)v5) {
          goto LABEL_94;
        }
        uint64_t v6 = v97;
        do
        {
          uint64_t v8 = *(unsigned int *)v6;
          int v7 = *((_DWORD *)v6 + 1);
          int v9 = *((_DWORD *)v6 + 5);
          if ((v7 & 0x20000000) == 0)
          {
            size_t v10 = (int *)(v6 + 24);
            if ((v7 & 1) == 0) {
              goto LABEL_68;
            }
LABEL_20:
            int v84 = (int)v5;
            BOOL v5 = (char *)v10 + *v10;
            if (fprintf(a2, "Info: Found snapshot '%s'\n", v5) == -1)
            {
              int v18 = __error();
              if ((byte_1000667E6 & 1) == 0)
              {
                int v19 = *v18;
                byte_1000667E6 = 1;
                id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
                unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v19;
                  _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
                }
              }
            }

            id v22 = shared_filesystem_metadata_snapshot_service_log_handle();
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = v5;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Info: Found snapshot '%s'",  buf,  0xCu);
            }

            *(_OWORD *)buf = 0u;
            memset(v96, 0, sizeof(v96));
            if ((v7 & 0x20) != 0)
            {
              __int16 v33 = (uint8_t *)*((void *)v10 + 1);
              uint64_t v86 = (uint64_t)v33;
              if (fprintf(a2, "Info: Snapshot '%s' has xid %lld\n", v5, v33) == -1)
              {
                uint64_t v34 = __error();
                if ((byte_1000667E7 & 1) == 0)
                {
                  int v35 = *v34;
                  byte_1000667E7 = 1;
                  id v36 = shared_filesystem_metadata_snapshot_service_log_handle();
                  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v91 = 67109120;
                    LODWORD(v92) = v35;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v91,  8u);
                  }

                  __int16 v33 = (uint8_t *)v86;
                }
              }

              id v38 = shared_filesystem_metadata_snapshot_service_log_handle();
              id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v91 = 136315394;
                v92 = v5;
                __int16 v93 = 2048;
                v94 = v33;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Info: Snapshot '%s' has xid %lld",  v91,  0x16u);
              }

              double v24 = (uint64_t *)(v10 + 4);

              if ((v7 & 0x200) == 0) {
                goto LABEL_46;
              }
LABEL_29:
              uint64_t v26 = *v24;
              v24 += 2;
              id v25 = (uint8_t *)v26;
              if (fprintf(a2, "Info: Snapshot '%s' has creation timestamp of %ld\n", v5, v26) == -1)
              {
                id v27 = __error();
                if ((byte_1000667E8 & 1) == 0)
                {
                  int v28 = *v27;
                  byte_1000667E8 = 1;
                  id v29 = shared_filesystem_metadata_snapshot_service_log_handle();
                  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v91 = 67109120;
                    LODWORD(v92) = v28;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v91,  8u);
                  }
                }
              }

              id v31 = shared_filesystem_metadata_snapshot_service_log_handle();
              uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v91 = 136315394;
                v92 = v5;
                __int16 v93 = 2048;
                v94 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Info: Snapshot '%s' has creation timestamp of %ld",  v91,  0x16u);
              }

              if ((v7 & 0x800000) != 0)
              {
LABEL_47:
                memset(uu2, 0, sizeof(uu2));
                *(_OWORD *)uu2 = *(_OWORD *)v24;
                if (uuid_compare(byte_10002FB68, uu2))
                {
                  uuid_unparse(uu2, (char *)buf);
                  if (fprintf(a2, "Info: Snapshot '%s' has uuid %s\n", v5, (const char *)buf) == -1)
                  {
                    uint64_t v40 = __error();
                    if ((byte_1000667E9 & 1) == 0)
                    {
                      int v41 = *v40;
                      byte_1000667E9 = 1;
                      id v42 = shared_filesystem_metadata_snapshot_service_log_handle();
                      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)v91 = 67109120;
                        LODWORD(v92) = v41;
                        _os_log_fault_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v91,  8u);
                      }
                    }
                  }

                  id v44 = shared_filesystem_metadata_snapshot_service_log_handle();
                  int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v91 = 136315394;
                    v92 = v5;
                    __int16 v93 = 2080;
                    v94 = buf;
                    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Info: Snapshot '%s' has uuid %s",  v91,  0x16u);
                  }
                }

                v24 += 2;
              }
            }

            else
            {
              double v24 = (uint64_t *)(v10 + 2);
              uint64_t v86 = -1LL;
              if ((v7 & 0x200) != 0) {
                goto LABEL_29;
              }
LABEL_46:
              id v25 = 0LL;
              if ((v7 & 0x800000) != 0) {
                goto LABEL_47;
              }
            }

            uint64_t v85 = v8;
            if ((v9 & 8) != 0)
            {
              uint64_t v46 = *v24;
              if (fprintf(a2, "Info: Snapshot '%s' has size %lld\n", v5, v46) == -1)
              {
                uint64_t v47 = __error();
                if ((byte_1000667EA & 1) == 0)
                {
                  int v48 = *v47;
                  byte_1000667EA = 1;
                  id v49 = shared_filesystem_metadata_snapshot_service_log_handle();
                  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v91 = 67109120;
                    LODWORD(v92) = v48;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v91,  8u);
                  }
                }
              }

              id v51 = shared_filesystem_metadata_snapshot_service_log_handle();
              int v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v91 = 136315394;
                v92 = v5;
                __int16 v93 = 2048;
                v94 = (uint8_t *)v46;
                _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Info: Snapshot '%s' has size %lld",  v91,  0x16u);
              }
            }

            else
            {
              uint64_t v46 = -1LL;
            }

            v88[0] = @"SnapshotSize";
            v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v46));
            v89[0] = v83;
            v88[1] = @"SnapshotPath";
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v81));
            v89[1] = v53;
            v88[2] = @"SnapshotName";
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
            v89[2] = v54;
            v88[3] = @"SnapshotXID";
            id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v86));
            v89[3] = v55;
            v88[4] = @"SnapshotUUID";
            __int16 v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
            v89[4] = v56;
            v88[5] = @"SnapshotCtime";
            stat v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v25));
            v89[5] = v57;
            v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  6LL));
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s [xid:%lld]",  v5,  v86));
            [v82 setObject:v58 forKeyedSubscript:v59];

            a2 = v80;
            LODWORD(v5) = v84;
            uint64_t v8 = v85;
            goto LABEL_68;
          }

          int v11 = *((_DWORD *)v6 + 6);
          if (!v11)
          {
            size_t v10 = (int *)(v6 + 28);
            if ((v7 & 1) == 0) {
              goto LABEL_68;
            }
            goto LABEL_20;
          }

          if (fprintf(a2, "Error: Error reading attributes for directory entry: %d\n", *((_DWORD *)v6 + 6)) == -1)
          {
            uint64_t v12 = __error();
            if ((byte_1000667E5 & 1) == 0)
            {
              int v13 = *v12;
              byte_1000667E5 = 1;
              id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
              id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v13;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
              }
            }
          }

          id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Error: Error reading attributes for directory entry: %d",  buf,  8u);
          }

LABEL_68:
          v6 += v8;
          LODWORD(v5) = (_DWORD)v5 - 1;
        }

        while ((_DWORD)v5);
        *(_OWORD *)&v87.bitmapcount = xmmword_10002FB50;
        *(void *)&v87.fileattr = 0x800000000LL;
        int v4 = v79;
        BOOL v5 = (const char *)fs_snapshot_list(v79, &v87, v97, 0x400uLL, 0);
      }

      while ((v5 & 0x80000000) == 0);
    }

    uint64_t v60 = __error();
    id v61 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error: fs_snapshot_list failed (returned %d): %s",  v5,  strerror(*v60));
    id v62 = objc_claimAutoreleasedReturnValue(v61);
    if (fprintf(a2, "%s\n", (const char *)[v62 UTF8String]) == -1)
    {
      __error();
      if ((byte_1000667E4 & 1) == 0)
      {
        byte_1000667E4 = 1;
        id v63 = shared_filesystem_metadata_snapshot_service_log_handle();
        __int16 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v65 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_10002CD18(v62);
    }
  }

  else
  {
    if (fprintf(a2, "Warn: Volume at %s does not support snapshots\n", a1) == -1)
    {
      __error();
      if ((byte_1000667E3 & 1) == 0)
      {
        byte_1000667E3 = 1;
        id v74 = shared_filesystem_metadata_snapshot_service_log_handle();
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v76 = shared_filesystem_metadata_snapshot_service_log_handle();
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v97 = 136315138;
      v98 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "Warn: Volume at %s does not support snapshots",  v97,  0xCu);
    }
  }

LABEL_94:
  if (v4) {
    goto LABEL_95;
  }
LABEL_96:
  fflush(a2);
  return v82;
}

CFDictionaryRef indirectionTableStatistics()
{
  return ASP_GetIndirectionTableStatistics();
}

id apfsVolumeInfo(FILE *a1)
{
  kern_return_t v7;
  kern_return_t v8;
  int *v9;
  int v10;
  id v11;
  os_log_s *v12;
  id v13;
  os_log_s *v14;
  kern_return_t v15;
  kern_return_t v16;
  int *v17;
  int v18;
  id v19;
  os_log_s *v20;
  id v21;
  os_log_s *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int *v28;
  int v29;
  id v30;
  os_log_s *v31;
  id v32;
  os_log_s *v33;
  void *v34;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;
  CFStringRef v38;
  void *v39;
  void v40[2];
  void v41[2];
  uint8_t buf[4];
  int v43;
  __int16 v44;
  char *v45;
  io_name_t name;
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v3 = IOServiceMatching("AppleAPFSVolume");
  int v4 = &AnalyticsSendEventLazy_ptr;
  if (v3)
  {
    IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
    io_object_t v5 = IOIteratorNext(existing);
    if (v5)
    {
      io_registry_entry_t v6 = v5;
      do
      {
        int v7 = IORegistryEntryGetName(v6, name);
        if (v7)
        {
          uint64_t v8 = v7;
          if (fprintf(a1, "Warn: 0x%08x: Could not get name for io_registry_entry_t 0x%x\n", v7, v6) == -1)
          {
            int v9 = __error();
            if ((byte_1000667EC & 1) == 0)
            {
              size_t v10 = *v9;
              byte_1000667EC = 1;
              int v11 = shared_filesystem_metadata_snapshot_service_log_handle();
              uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                uint64_t v43 = v10;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
              }

              int v4 = &AnalyticsSendEventLazy_ptr;
            }
          }

          int v13 = shared_filesystem_metadata_snapshot_service_log_handle();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            uint64_t v43 = v8;
            id v44 = 1024;
            LODWORD(v45) = v6;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Warn: 0x%08x: Could not get name for io_registry_entry_t 0x%x",  buf,  0xEu);
          }

          strcpy(name, "UNKNOWN");
        }

        properties = 0LL;
        id v15 = IORegistryEntryCreateCFProperties(v6, &properties, kCFAllocatorDefault, 0);
        if (v15)
        {
          id v16 = v15;
          if (fprintf(a1, "Error: 0x%08x: Could not get properties for io_registry_entry_t %s\n", v15, name) == -1)
          {
            uint64_t v17 = __error();
            if ((byte_1000667ED & 1) == 0)
            {
              int v18 = *v17;
              byte_1000667ED = 1;
              int v19 = shared_filesystem_metadata_snapshot_service_log_handle();
              id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                uint64_t v43 = v18;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
              }

              int v4 = &AnalyticsSendEventLazy_ptr;
            }
          }

          unint64_t v21 = shared_filesystem_metadata_snapshot_service_log_handle();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109378;
            uint64_t v43 = v16;
            id v44 = 2080;
            int v45 = name;
            _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Error: 0x%08x: Could not get properties for io_registry_entry_t %s",  buf,  0x12u);
          }
        }

        else
        {
          id v23 = objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKey:]( properties, "objectForKey:", @"BSD Name"));
          snprintf(name, 0x80uLL, "%s_%s", name, (const char *)[v23 UTF8String]);

          v40[0] = @"BSD Name";
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](properties, "objectForKey:", @"BSD Name"));
          v40[1] = @"FormattedBy";
          v41[0] = v24;
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](properties, "objectForKey:"));
          v41[1] = v25;
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4[31] dictionaryWithObjects:v41 forKeys:v40 count:2]);

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", name));
          if (objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v26])) {
            sub_10002CE80();
          }

          id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", name));
          [v2 setObject:v22 forKeyedSubscript:v27];

          CFRelease(properties);
        }

        io_registry_entry_t v6 = IOIteratorNext(existing);
      }

      while (v6);
    }

    IOObjectRelease(existing);
  }

  else
  {
    if (fprintf(a1, "Error: Could not create matching dictionary for %s\n", "AppleAPFSVolume") == -1)
    {
      int v28 = __error();
      if ((byte_1000667EB & 1) == 0)
      {
        id v29 = *v28;
        byte_1000667EB = 1;
        id v30 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          sub_10002CE0C(v29, v31);
        }
      }
    }

    uint64_t v32 = shared_filesystem_metadata_snapshot_service_log_handle();
    __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10002CD8C(v33);
    }
  }

  id v38 = @"AppleAPFSVolume";
  id v39 = v2;
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v4[31] dictionaryWithObjects:&v39 forKeys:&v38 count:1]);

  return v34;
}

id enter_sandbox()
{
  if ((_set_user_dir_suffix("com.apple.FilesystemMetadataSnapshotService") & 1) == 0)
  {
    id v1 = shared_filesystem_metadata_snapshot_service_log_handle();
    int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10002CF18();
    }

    exit(1);
  }

  return NSTemporaryDirectory();
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100014164( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100014184( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!qword_1000667F0)
  {
    qword_1000667F0 = (uint64_t)calloc(0x400uLL, 1uLL);
    vsnprintf(__str, 0x400uLL, a1, &a9);
    snprintf((char *)qword_1000667F0, 0x400uLL, "%s", __str);
  }

uint64_t sub_10001423C(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 36) = -1;
  if (a3 < 8) {
    return 0LL;
  }
  unsigned int v6 = a3 >> 3;
  while (2)
  {
    unint64_t v9 = *a2;
    uint64_t v8 = a2 + 1;
    int v7 = v9;
    unint64_t v10 = HIDWORD(v9);
    unsigned int v11 = v6 - 1;
    if (v9 <= 0x30000000 && v11 >= v10)
    {
      uint64_t v13 = (v7 - 1);
      if (v13 <= 0x47) {
        __asm { BR              X10 }
      }

      uint64_t v17 = (v7 - 73);
      if (v17 <= 0x46) {
        __asm { BR              X10 }
      }

      switch(v7)
      {
        case 144:
          uint64_t v18 = *v8;
          int v19 = "numMemExtreme";
          goto LABEL_13;
        case 145:
          uint64_t v18 = *v8;
          int v19 = "maxMemExtremeDuration";
          goto LABEL_13;
        case 146:
          uint64_t v18 = *v8;
          int v19 = "memExtremeDuration";
          goto LABEL_13;
        case 147:
          uint64_t v18 = *v8;
          int v19 = "bandGetsExtreme";
          goto LABEL_13;
        case 148:
          uint64_t v18 = *v8;
          int v19 = "bandGetsLow";
          goto LABEL_13;
        case 149:
          uint64_t v18 = *v8;
          int v19 = "numHostChoke";
          goto LABEL_13;
        case 152:
          uint64_t v18 = *v8;
          int v19 = "AbortSkip_ProgramError";
          goto LABEL_13;
        case 153:
          uint64_t v18 = *v8;
          int v19 = "AbortSkip_ReadErrorOpenBand";
          goto LABEL_13;
        case 154:
          uint64_t v18 = *v8;
          int v19 = "AbortSkip_FailedRebuildingParity";
          goto LABEL_13;
        case 155:
          uint64_t v18 = *v8;
          int v19 = "AbortPad_OpenRefreshBand";
          goto LABEL_13;
        case 156:
          uint64_t v18 = *v8;
          int v19 = "AbortPad_CloseBands";
          goto LABEL_13;
        case 157:
          uint64_t v18 = *v8;
          int v19 = "AbortPad_SetPhoto";
          goto LABEL_13;
        case 158:
          uint64_t v18 = *v8;
          int v19 = "AbortPad_GcNoSource";
          goto LABEL_13;
        case 159:
          uint64_t v18 = *v8;
          int v19 = "AbortPad_Format";
          goto LABEL_13;
        case 160:
          uint64_t v18 = *v8;
          int v19 = "nandDiscoveryDuration";
          goto LABEL_13;
        case 161:
          uint64_t v18 = *v8;
          int v19 = "coreCCEnableDuration";
          goto LABEL_13;
        case 163:
          uint64_t v18 = *v8;
          int v19 = "coreOpenDuration";
          goto LABEL_13;
        case 164:
          uint64_t v18 = *v8;
          int v19 = "coreWritableDuration";
          goto LABEL_13;
        case 165:
          uint64_t v18 = *v8;
          int v19 = "coreClogLoadDuration";
          goto LABEL_13;
        case 167:
          uint64_t v18 = *v8;
          int v19 = "bulkPFail";
          goto LABEL_13;
        case 169:
          uint64_t v18 = *v8;
          int v19 = "bulkRFail";
          goto LABEL_13;
        case 172:
          uint64_t v18 = *v8;
          int v19 = "raidSmartErrors";
          goto LABEL_13;
        case 182:
          uint64_t v18 = *v8;
          int v19 = "internalUeccs";
          goto LABEL_13;
        case 183:
          uint64_t v18 = *v8;
          int v19 = "e2eFail";
          goto LABEL_13;
        case 184:
          uint64_t v18 = *v8;
          int v19 = "TempSensorMax";
          goto LABEL_13;
        case 185:
          uint64_t v18 = *v8;
          int v19 = "TempSensorMin";
          goto LABEL_13;
        case 186:
          uint64_t v18 = *v8;
          int v19 = "powerUpFromDDR";
          goto LABEL_13;
        case 187:
          uint64_t v18 = *v8;
          int v19 = "numMemLow";
          goto LABEL_13;
        case 188:
          uint64_t v18 = *v8;
          int v19 = "maxMemLowDuration";
          goto LABEL_13;
        case 189:
          uint64_t v18 = *v8;
          int v19 = "memLowDuration";
          goto LABEL_13;
        case 190:
          uint64_t v18 = *v8;
          int v19 = "numFences";
          goto LABEL_13;
        case 191:
          uint64_t v18 = *v8;
          int v19 = "hostPassiveIO";
          goto LABEL_13;
        case 192:
          uint64_t v18 = *v8;
          int v19 = "odtsMax";
          goto LABEL_13;
        case 193:
          uint64_t v18 = *v8;
          int v19 = "defragMFromOrphans";
          goto LABEL_13;
        case 194:
          uint64_t v18 = *v8;
          int v19 = "defragMFromFragments";
          goto LABEL_13;
        case 195:
          uint64_t v18 = *v8;
          int v19 = "defragMTime";
          goto LABEL_13;
        case 196:
          uint64_t v18 = *v8;
          int v19 = "defragMMaxTime";
          goto LABEL_13;
        case 197:
          uint64_t v18 = *v8;
          int v19 = "raidFailedLbaMismatch";
          goto LABEL_13;
        case 198:
          uint64_t v18 = *v8;
          int v19 = "numSyscfgWrites";
          goto LABEL_13;
        case 199:
          uint64_t v18 = *v8;
          int v19 = "indmbUnitsXfer";
          goto LABEL_13;
        case 200:
          uint64_t v18 = *v8;
          int v19 = "indmbUnitsCache";
          goto LABEL_13;
        case 201:
          uint64_t v18 = *v8;
          int v19 = "indmbUnitsInd";
          goto LABEL_13;
        case 202:
          uint64_t v18 = *v8;
          int v19 = "wcacheFS_Mbytes";
          goto LABEL_13;
        case 203:
          uint64_t v18 = *v8;
          int v19 = "wcacheDS_Mbytes";
          goto LABEL_13;
        case 204:
          uint64_t v18 = *v8;
          int v19 = "powerOnSeconds";
          goto LABEL_13;
        case 205:
          uint64_t v18 = *v8;
          int v19 = "numUnknownTokenHostRead";
          goto LABEL_13;
        case 206:
          uint64_t v18 = *v8;
          int v19 = "numUnmmapedTokenHostRead";
          goto LABEL_13;
        case 207:
          id v20 = "numOfThrottlingEntriesPerLevel";
          uint64_t v21 = a1;
          int v22 = 207;
LABEL_85:
          id v14 = v8;
          unsigned int v15 = 16;
          goto LABEL_12;
        case 208:
          uint64_t v18 = *v8;
          int v19 = "wcacheFS_MbytesMin";
          goto LABEL_13;
        case 209:
          uint64_t v18 = *v8;
          int v19 = "wcacheFS_MbytesMax";
          goto LABEL_13;
        case 210:
          uint64_t v18 = *v8;
          int v19 = "prepareForShutdownFailCounter";
          goto LABEL_13;
        case 211:
          uint64_t v18 = *v8;
          int v19 = "lpsrEntry";
          goto LABEL_13;
        case 212:
          uint64_t v18 = *v8;
          int v19 = "lpsrExit";
          goto LABEL_13;
        case 213:
          id v20 = "crcInternalReadFail";
          uint64_t v21 = a1;
          int v22 = 213;
LABEL_23:
          id v14 = v8;
          unsigned int v15 = 8;
          goto LABEL_12;
        case 214:
          uint64_t v18 = *v8;
          int v19 = "wcacheFSEvictCnt";
          goto LABEL_13;
        case 215:
          uint64_t v18 = *v8;
          int v19 = "wcacheFSEvictSize";
          goto LABEL_13;
        case 216:
          uint64_t v18 = *v8;
          int v19 = "wcacheFSWr";
          goto LABEL_13;
        case 217:
          uint64_t v18 = *v8;
          int v19 = "wcacheDSWr";
          goto LABEL_13;
        case 218:
          id v20 = "wcacheFSEvictSizeLogDist";
          uint64_t v21 = a1;
          int v22 = 218;
LABEL_11:
          id v14 = v8;
          unsigned int v15 = 10;
          goto LABEL_12;
        case 219:
          uint64_t v18 = *v8;
          int v19 = "prepareForShutdownTimeoutCounter";
          goto LABEL_13;
        case 220:
          uint64_t v18 = *v8;
          int v19 = "prepareForShutdownCancelCounter";
          goto LABEL_13;
        case 221:
          uint64_t v18 = *v8;
          int v19 = "RD_openBandCount";
          goto LABEL_13;
        case 222:
          uint64_t v18 = *v8;
          int v19 = "RD_openBandNops";
          goto LABEL_13;
        case 223:
          uint64_t v18 = *v8;
          int v19 = "RD_closedBandEvictCount";
LABEL_13:
          id v16 = (void *)a1;
          goto LABEL_14;
        default:
          switch(v7)
          {
            case 224:
              uint64_t v18 = *v8;
              int v19 = "RD_closedBandEvictSectors";
              goto LABEL_13;
            case 225:
              uint64_t v18 = *v8;
              int v19 = "RD_closedBandFragmentCount";
              goto LABEL_13;
            case 226:
              uint64_t v18 = *v8;
              int v19 = "RD_closedBandFragmentSectors";
              goto LABEL_13;
            case 227:
              id v20 = "wcacheFSOverWrLogSizeCnts";
              uint64_t v21 = a1;
              int v22 = 227;
              goto LABEL_11;
            case 228:
              id v20 = "wcacheFSOverWrSizeByFlow";
              uint64_t v21 = a1;
              int v22 = 228;
              goto LABEL_22;
            case 229:
              id v20 = "indmbXferCountTo";
              uint64_t v21 = a1;
              int v22 = 229;
              goto LABEL_20;
            case 230:
              id v20 = "indmbAccumulatedTimeBetweenXfers";
              uint64_t v21 = a1;
              int v22 = 230;
LABEL_20:
              id v14 = v8;
              unsigned int v15 = 2;
              goto LABEL_12;
            case 231:
              uint64_t v18 = *v8;
              int v19 = "maxGracefulBootTimeMs";
              goto LABEL_13;
            case 232:
              uint64_t v18 = *v8;
              int v19 = "maxUngracefulBootTimeMs";
              goto LABEL_13;
            case 233:
              uint64_t v18 = *v8;
              int v19 = "averageGracefulBootTimeMs";
              goto LABEL_13;
            case 234:
              uint64_t v18 = *v8;
              int v19 = "averageUngracefulBootTimeMs";
              goto LABEL_13;
            case 235:
              id v20 = "gracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 235;
              goto LABEL_23;
            case 236:
              id v20 = "ungracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 236;
              goto LABEL_23;
            case 237:
              id v20 = "CalibrationCount";
              uint64_t v21 = a1;
              int v22 = 237;
              goto LABEL_22;
            case 238:
              uint64_t v18 = *v8;
              int v19 = "CalibrationLastTmp";
              goto LABEL_13;
            case 239:
              uint64_t v18 = *v8;
              int v19 = "CalibrationMaxTmp";
              goto LABEL_13;
            case 240:
              uint64_t v18 = *v8;
              int v19 = "CalibrationMinTmp";
              goto LABEL_13;
            case 241:
              uint64_t v18 = *v8;
              int v19 = "ungracefulBootWorstIndicator";
              goto LABEL_13;
            case 242:
              uint64_t v18 = *v8;
              int v19 = "metaMismatchReread";
              goto LABEL_13;
            case 243:
              uint64_t v18 = *v8;
              int v19 = "numS3SleepOps";
              goto LABEL_13;
            case 244:
              uint64_t v18 = *v8;
              int v19 = "odtsCurrent";
              goto LABEL_13;
            case 245:
              uint64_t v18 = *v8;
              int v19 = "prefetchReads";
              goto LABEL_13;
            case 246:
              uint64_t v18 = *v8;
              int v19 = "prefetchHits";
              goto LABEL_13;
            case 247:
              uint64_t v18 = *v8;
              int v19 = "prefetchWritesInvalidation";
              goto LABEL_13;
            case 248:
              uint64_t v18 = *v8;
              int v19 = "indmbUnitsTotal";
              goto LABEL_13;
            case 249:
              uint64_t v18 = *v8;
              int v19 = "selfThrottlingEngage";
              goto LABEL_13;
            case 250:
              uint64_t v18 = *v8;
              int v19 = "selfThrottlingDisengage";
              goto LABEL_13;
            case 252:
              uint64_t v18 = *v8;
              int v19 = "AbortSkip_WlpMode";
              goto LABEL_13;
            case 253:
              uint64_t v18 = *v8;
              int v19 = "hostWritesWlpMode";
              goto LABEL_13;
            case 254:
              uint64_t v18 = *v8;
              int v19 = "numClogDoubleUnc";
              goto LABEL_13;
            case 256:
              uint64_t v18 = *v8;
              int v19 = "AbortPad_WlpMode";
              goto LABEL_13;
            case 257:
              uint64_t v18 = *v8;
              int v19 = "bonfireIntermediateBandErases";
              goto LABEL_13;
            case 258:
              uint64_t v18 = *v8;
              int v19 = "bonfireUserBandErases";
              goto LABEL_13;
            case 259:
              uint64_t v18 = *v8;
              int v19 = "bonfireIntermediateBandProgs";
              goto LABEL_13;
            case 260:
              uint64_t v18 = *v8;
              int v19 = "bonfireUserBandProgs";
              goto LABEL_13;
            case 261:
              uint64_t v18 = *v8;
              int v19 = "bonfireIntermediatePageReads";
              goto LABEL_13;
            case 262:
              uint64_t v18 = *v8;
              int v19 = "bonfireUserPageReads";
              goto LABEL_13;
            case 263:
              uint64_t v18 = *v8;
              int v19 = "refreshUtil00";
              goto LABEL_13;
            case 264:
              uint64_t v18 = *v8;
              int v19 = "failToReadUtil00";
              goto LABEL_13;
            case 265:
              id v20 = "readCountHisto";
              uint64_t v21 = a1;
              int v22 = 265;
LABEL_19:
              id v14 = v8;
              unsigned int v15 = 5;
              goto LABEL_12;
            case 266:
              id v20 = "readAmpHisto";
              uint64_t v21 = a1;
              int v22 = 266;
              goto LABEL_85;
            case 267:
              uint64_t v18 = *v8;
              int v19 = "totalReadAmp";
              goto LABEL_13;
            case 268:
              id v20 = "nvmeModeSelect";
              uint64_t v21 = a1;
              int v22 = 268;
              goto LABEL_22;
            case 269:
              id v20 = "numBootBlockRefreshSuccess";
              uint64_t v21 = a1;
              int v22 = 269;
              goto LABEL_23;
            case 270:
              id v20 = "numBootBlockRefreshFail";
              uint64_t v21 = a1;
              int v22 = 270;
              goto LABEL_23;
            case 271:
              uint64_t v18 = *v8;
              int v19 = "numUnsupportedAsi";
              goto LABEL_13;
            case 272:
              uint64_t v18 = *v8;
              int v19 = "NumTerminatedProgramSegs";
              goto LABEL_13;
            case 273:
              uint64_t v18 = *v8;
              int v19 = "indParityPagesDrops";
              goto LABEL_13;
            case 274:
              uint64_t v18 = *v8;
              int v19 = "indFlowPrograms";
              goto LABEL_13;
            case 277:
              id v20 = "powerBudgetSelect";
              uint64_t v21 = a1;
              int v22 = 277;
LABEL_22:
              id v14 = v8;
              unsigned int v15 = 4;
              goto LABEL_12;
            case 279:
              uint64_t v18 = *v8;
              int v19 = "RxBurnNandWrites";
              goto LABEL_13;
            case 280:
              id v20 = "E2EDPErrorCounters";
              uint64_t v21 = a1;
              int v22 = 280;
LABEL_153:
              id v14 = v8;
              unsigned int v15 = 12;
              goto LABEL_12;
            case 281:
              uint64_t v18 = *v8;
              int v19 = "wcacheSectorsMax";
              goto LABEL_13;
            case 282:
              uint64_t v18 = *v8;
              int v19 = "wcacheSectorsMin";
              goto LABEL_13;
            case 283:
              uint64_t v18 = *v8;
              int v19 = "wcacheSectorsCur";
              goto LABEL_13;
            case 284:
              uint64_t v18 = *v8;
              int v19 = "wcacheDS_SectorsMax";
              goto LABEL_13;
            case 285:
              uint64_t v18 = *v8;
              int v19 = "wcacheDS_SectorsMin";
              goto LABEL_13;
            case 286:
              uint64_t v18 = *v8;
              int v19 = "wcacheDS_SectorsCur";
              goto LABEL_13;
            case 287:
              uint64_t v18 = *v8;
              int v19 = "wcacheFS_Reads";
              goto LABEL_13;
            case 288:
              uint64_t v18 = *v8;
              int v19 = "wcacheDS_Reads";
              goto LABEL_13;
            case 289:
              id v20 = "mspBootBlockReadFail";
              uint64_t v21 = a1;
              int v22 = 289;
              goto LABEL_155;
            case 290:
              id v20 = "mspBootBlockProgFail";
              uint64_t v21 = a1;
              int v22 = 290;
              goto LABEL_155;
            case 291:
              id v20 = "mspBootBlockEraseFail";
              uint64_t v21 = a1;
              int v22 = 291;
              goto LABEL_155;
            case 292:
              uint64_t v18 = *v8;
              int v19 = "bandsRefreshedOnError";
              goto LABEL_13;
            default:
              switch(v7)
              {
                case 298:
                  id v20 = "perHostReads";
                  uint64_t v21 = a1;
                  int v22 = 298;
                  goto LABEL_20;
                case 299:
                  id v20 = "perHostReadXacts";
                  uint64_t v21 = a1;
                  int v22 = 299;
                  goto LABEL_20;
                case 300:
                  id v20 = "perHostWrites";
                  uint64_t v21 = a1;
                  int v22 = 300;
                  goto LABEL_20;
                case 301:
                  id v20 = "perHostWriteXacts";
                  uint64_t v21 = a1;
                  int v22 = 301;
                  goto LABEL_20;
                case 302:
                  id v20 = "perHostNumFlushes";
                  uint64_t v21 = a1;
                  int v22 = 302;
                  goto LABEL_20;
                case 303:
                  id v20 = "perHostNumFences";
                  uint64_t v21 = a1;
                  int v22 = 303;
                  goto LABEL_20;
                case 304:
                  id v20 = "commitPadSectorsPerFlow";
                  uint64_t v21 = a1;
                  int v22 = 304;
                  goto LABEL_11;
                case 305:
                  id v20 = "wcacheDSOverWrLogSizeCnts";
                  uint64_t v21 = a1;
                  int v22 = 305;
                  goto LABEL_11;
                case 306:
                  id v20 = "wcacheDSOverWrSizeByFlow";
                  uint64_t v21 = a1;
                  int v22 = 306;
                  goto LABEL_22;
                case 307:
                  id v20 = "CmdRaisePrioiryEvents";
                  uint64_t v21 = a1;
                  int v22 = 307;
                  goto LABEL_11;
                case 308:
                  uint64_t v18 = *v8;
                  int v19 = "utilNumVerification";
                  goto LABEL_13;
                case 309:
                  uint64_t v18 = *v8;
                  int v19 = "utilRefreshes";
                  goto LABEL_13;
                case 310:
                  uint64_t v18 = *v8;
                  int v19 = "utilBDRErrors";
                  goto LABEL_13;
                case 311:
                  uint64_t v18 = *v8;
                  int v19 = "indBandsPerFlow";
                  goto LABEL_13;
                case 312:
                  uint64_t v18 = *v8;
                  int v19 = "secsPerIndFlow";
                  goto LABEL_13;
                case 313:
                  uint64_t v18 = *v8;
                  int v19 = "indDecodedECC";
                  goto LABEL_13;
                case 314:
                  id v20 = "numBootBlockValidateSuccess";
                  uint64_t v21 = a1;
                  int v22 = 314;
                  goto LABEL_23;
                case 315:
                  id v20 = "numBootBlockValidateFail";
                  uint64_t v21 = a1;
                  int v22 = 315;
                  goto LABEL_23;
                case 316:
                  id v20 = "clogPagesFillingPercentage";
                  uint64_t v21 = a1;
                  int v22 = 316;
                  goto LABEL_22;
                case 317:
                  uint64_t v18 = *v8;
                  int v19 = "bdrCalTimeAccFactor";
                  goto LABEL_13;
                case 318:
                  uint64_t v18 = *v8;
                  int v19 = "bootChainRdError";
                  goto LABEL_13;
                case 319:
                  uint64_t v18 = *v8;
                  int v19 = "bootChainBlankError";
                  goto LABEL_13;
                case 320:
                  uint64_t v18 = *v8;
                  int v19 = "bootChainRefreshError";
                  goto LABEL_13;
                case 321:
                  uint64_t v18 = *v8;
                  int v19 = "bootChainVersionError";
                  goto LABEL_13;
                case 322:
                  uint64_t v18 = *v8;
                  int v19 = "mspBootBlockMismatch";
                  goto LABEL_13;
                case 323:
                  uint64_t v18 = *v8;
                  int v19 = "mspBootBlockMismatchErr";
                  goto LABEL_13;
                case 324:
                  id v20 = "bitflipAddr";
                  uint64_t v21 = a1;
                  int v22 = 324;
                  goto LABEL_19;
                case 325:
                  id v20 = "bitflipCount";
                  uint64_t v21 = a1;
                  int v22 = 325;
                  goto LABEL_19;
                case 326:
                  id v20 = "bitflipDupes";
                  uint64_t v21 = a1;
                  int v22 = 326;
                  goto LABEL_19;
                case 327:
                  id v20 = "bandsMaxTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 327;
                  goto LABEL_196;
                case 328:
                  id v20 = "bandsMinTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 328;
                  goto LABEL_196;
                case 329:
                  id v20 = "bandsLifeTimeTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 329;
LABEL_196:
                  id v14 = v8;
                  unsigned int v15 = 30;
                  goto LABEL_12;
                case 330:
                  id v20 = "bandsDeltaTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 330;
                  id v14 = v8;
                  unsigned int v15 = 22;
                  goto LABEL_12;
                case 331:
                  id v20 = "bandsCrossTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 331;
                  id v14 = v8;
                  unsigned int v15 = 45;
                  goto LABEL_12;
                case 332:
                  id v20 = "wcacheWaitLogMs";
                  uint64_t v21 = a1;
                  int v22 = 332;
                  goto LABEL_11;
                case 333:
                  id v20 = "wcacheDS_segsSortedLogSize";
                  uint64_t v21 = a1;
                  int v22 = 333;
                  goto LABEL_11;
                case 334:
                  uint64_t v18 = *v8;
                  int v19 = "numFirmwareWrites";
                  goto LABEL_13;
                case 335:
                  uint64_t v18 = *v8;
                  int v19 = "numBisWrites";
                  goto LABEL_13;
                case 336:
                  uint64_t v18 = *v8;
                  int v19 = "numBootChainUpdates";
                  goto LABEL_13;
                case 337:
                  uint64_t v18 = *v8;
                  int v19 = "cntCalTimeWentBackWard";
                  goto LABEL_13;
                case 338:
                  uint64_t v18 = *v8;
                  int v19 = "indBoRecoveries";
                  goto LABEL_13;
                case 340:
                  uint64_t v18 = *v8;
                  int v19 = "numCrossTempUecc";
                  goto LABEL_13;
                case 341:
                  uint64_t v18 = *v8;
                  int v19 = "latencyMonitorError";
                  goto LABEL_13;
                case 343:
                  uint64_t v18 = *v8;
                  int v19 = "utilUeccReads";
                  goto LABEL_13;
                case 344:
                  uint64_t v18 = *v8;
                  int v19 = "numOfAvoidedGCDueToTemp";
                  goto LABEL_13;
                case 345:
                  uint64_t v18 = *v8;
                  int v19 = "forceShutdowns";
                  goto LABEL_13;
                case 346:
                  uint64_t v18 = *v8;
                  int v19 = "gcSlcDestinations";
                  goto LABEL_13;
                case 347:
                  uint64_t v18 = *v8;
                  int v19 = "indReplayExtUsed";
                  goto LABEL_13;
                case 348:
                  uint64_t v18 = *v8;
                  int v19 = "defectsPerPackageOverflow";
                  goto LABEL_13;
                case 349:
                  uint64_t v18 = *v8;
                  int v19 = "RxBurnIntBandsProgrammed";
                  goto LABEL_13;
                case 350:
                  uint64_t v18 = *v8;
                  int v19 = "RxBurnUsrBandsProgrammed";
                  goto LABEL_13;
                case 351:
                  uint64_t v18 = *v8;
                  int v19 = "RxBurnIntNandWrites";
                  goto LABEL_13;
                case 352:
                  uint64_t v18 = *v8;
                  int v19 = "RxBurnUsrNandWrites";
                  goto LABEL_13;
                case 353:
                  uint64_t v18 = *v8;
                  int v19 = "clogLastStripeUeccs";
                  goto LABEL_13;
                case 354:
                  uint64_t v18 = *v8;
                  int v19 = "GC_MidDestSrcSwitchSLC2TLC";
                  goto LABEL_13;
                case 355:
                  uint64_t v18 = *v8;
                  int v19 = "GC_MidDestSrcSwitchTLC2SLC";
                  goto LABEL_13;
                case 356:
                  uint64_t v18 = *v8;
                  int v19 = "nvme_stats_shutdown_count_host0_normal";
                  goto LABEL_13;
                case 357:
                  uint64_t v18 = *v8;
                  int v19 = "nvme_stats_shutdown_count_host1_normal";
                  goto LABEL_13;
                case 358:
                  uint64_t v18 = *v8;
                  int v19 = "nvme_stats_shutdown_count_host0_s2r";
                  goto LABEL_13;
                case 359:
                  uint64_t v18 = *v8;
                  int v19 = "nvme_stats_shutdown_count_host1_s2r";
                  goto LABEL_13;
                case 360:
                  id v20 = "gcPDusterIntrSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 360;
                  goto LABEL_85;
                case 361:
                  id v20 = "gcPDusterUserSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 361;
                  goto LABEL_85;
                case 362:
                  uint64_t v18 = *v8;
                  int v19 = "raidFailedReadParity";
                  goto LABEL_13;
                case 364:
                  uint64_t v18 = *v8;
                  int v19 = "lhotNumSkipes";
                  goto LABEL_13;
                default:
                  switch(v7)
                  {
                    case 365:
                      uint64_t v18 = *v8;
                      int v19 = "lhotNumIsHotCalls";
                      goto LABEL_13;
                    case 366:
                      uint64_t v18 = *v8;
                      int v19 = "lhotFullLap";
                      goto LABEL_13;
                    case 367:
                      uint64_t v18 = *v8;
                      int v19 = "lhotSkipPrecent";
                      goto LABEL_13;
                    case 368:
                      uint64_t v18 = *v8;
                      int v19 = "eraseSuspendEvents";
                      goto LABEL_13;
                    case 369:
                      uint64_t v18 = *v8;
                      int v19 = "eraseSuspendedStatuses";
                      goto LABEL_13;
                    case 370:
                      uint64_t v18 = *v8;
                      int v19 = "eraseSuspendedBands";
                      goto LABEL_13;
                    case 371:
                      uint64_t v18 = *v8;
                      int v19 = "eraseSuspendSituationsBelowThreshold";
                      goto LABEL_13;
                    case 372:
                      uint64_t v18 = *v8;
                      int v19 = "eraseSuspendSituationsAboveThreshold";
                      goto LABEL_13;
                    case 373:
                      uint64_t v18 = *v8;
                      int v19 = "eraseSuspendReadChainsProcessed";
                      goto LABEL_13;
                    case 374:
                      uint64_t v18 = *v8;
                      int v19 = "bdrLastDoneHr";
                      goto LABEL_13;
                    case 375:
                      uint64_t v18 = *v8;
                      int v19 = "bdrBackupThreshHrs";
                      goto LABEL_13;
                    case 376:
                      uint64_t v18 = *v8;
                      int v19 = "clogPortableProgBufs";
                      goto LABEL_13;
                    case 377:
                      uint64_t v18 = *v8;
                      int v19 = "clogPortableDropBufs";
                      goto LABEL_13;
                    case 378:
                      uint64_t v18 = *v8;
                      int v19 = "clogPortablePadSectors";
                      goto LABEL_13;
                    case 379:
                      uint64_t v18 = *v8;
                      int v19 = "numRetiredBlocks";
                      goto LABEL_13;
                    case 381:
                      uint64_t v18 = *v8;
                      int v19 = "numRefreshOnErrNandRefreshPerf";
                      goto LABEL_13;
                    case 382:
                      uint64_t v18 = *v8;
                      int v19 = "raidReconstructReads";
                      goto LABEL_13;
                    case 383:
                      uint64_t v18 = *v8;
                      int v19 = "gcReadsNoBlog";
                      goto LABEL_13;
                    case 384:
                      uint64_t v18 = *v8;
                      int v19 = "AbortSkip_MPBXReadVerifyClosedBand";
                      goto LABEL_13;
                    case 385:
                      uint64_t v18 = *v8;
                      int v19 = "openBandReadFail";
                      goto LABEL_13;
                    case 386:
                      uint64_t v18 = *v8;
                      int v19 = "AbortSkip_MPBXReadVerifyOpenBand";
                      goto LABEL_13;
                    case 387:
                      uint64_t v18 = *v8;
                      int v19 = "AbortSkip_MBPXFailedRebuildingParity";
                      goto LABEL_13;
                    case 388:
                      uint64_t v18 = *v8;
                      int v19 = "raidSuccessfulPMXReconstructionInternal";
                      goto LABEL_13;
                    case 389:
                      uint64_t v18 = *v8;
                      int v19 = "raidSuccessfulPMXReconstructionHost";
                      goto LABEL_13;
                    case 390:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedPMXReconstructionInternal";
                      goto LABEL_13;
                    case 391:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedPMXReconstructionHost";
                      goto LABEL_13;
                    case 392:
                      uint64_t v18 = *v8;
                      int v19 = "raidSuccessfulRMXReconstructionInternal";
                      goto LABEL_13;
                    case 393:
                      uint64_t v18 = *v8;
                      int v19 = "raidSuccessfulRMXReconstructionHost";
                      goto LABEL_13;
                    case 394:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedRMXReconstructionInternal";
                      goto LABEL_13;
                    case 395:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedRMXReconstructionHost";
                      goto LABEL_13;
                    case 396:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedReadParityInternal";
                      goto LABEL_13;
                    case 397:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedReadQParityInternal";
                      goto LABEL_13;
                    case 398:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedReadQParity";
                      goto LABEL_13;
                    case 399:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedReadQCopy";
                      goto LABEL_13;
                    case 400:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedReconstructionQParity";
                      goto LABEL_13;
                    case 401:
                      uint64_t v18 = *v8;
                      int v19 = "offlineBlocksCnt";
                      goto LABEL_13;
                    case 402:
                      uint64_t v18 = *v8;
                      int v19 = "bork0Revectors";
                      goto LABEL_13;
                    case 403:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedReadBlog";
                      goto LABEL_13;
                    case 404:
                      uint64_t v18 = *v8;
                      int v19 = "numReliabilityRefreshes";
                      goto LABEL_13;
                    case 405:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedReadQCopyInternal";
                      goto LABEL_13;
                    case 406:
                      id v20 = "raidReconstructSuccessFlow";
                      uint64_t v21 = a1;
                      int v22 = 406;
                      goto LABEL_19;
                    case 407:
                      id v20 = "raidReconstructFailFlow";
                      uint64_t v21 = a1;
                      int v22 = 407;
                      goto LABEL_19;
                    case 408:
                      uint64_t v18 = *v8;
                      int v19 = "raidReconstructFailP";
                      goto LABEL_13;
                    case 409:
                      uint64_t v18 = *v8;
                      int v19 = "raidReconstructFailQ";
                      goto LABEL_13;
                    case 410:
                      uint64_t v18 = *v8;
                      int v19 = "raidReconstructFailUECC";
                      goto LABEL_13;
                    case 411:
                      uint64_t v18 = *v8;
                      int v19 = "raidReconstructFailUnsupp";
                      goto LABEL_13;
                    case 412:
                      uint64_t v18 = *v8;
                      int v19 = "raidUECCOpenBand";
                      goto LABEL_13;
                    case 414:
                      uint64_t v18 = *v8;
                      int v19 = "ueccReads";
                      goto LABEL_13;
                    case 416:
                      uint64_t v18 = *v8;
                      int v19 = "raidSuccessfulVerify";
                      goto LABEL_13;
                    case 417:
                      uint64_t v18 = *v8;
                      int v19 = "raidFailedVerify";
                      goto LABEL_13;
                    case 418:
                      uint64_t v18 = *v8;
                      int v19 = "numBandsVerified";
                      goto LABEL_13;
                    case 419:
                      uint64_t v18 = *v8;
                      int v19 = "cache_heads";
                      goto LABEL_13;
                    case 420:
                      uint64_t v18 = *v8;
                      int v19 = "AbortSkip_RMXtoMPBX";
                      goto LABEL_13;
                    case 421:
                      uint64_t v18 = *v8;
                      int v19 = "s3eFwVer";
                      goto LABEL_13;
                    case 422:
                      uint64_t v18 = *v8;
                      int v19 = "readVerifyNative";
                      goto LABEL_13;
                    case 423:
                      uint64_t v18 = *v8;
                      int v19 = "reducedReadVerifyNative";
                      goto LABEL_13;
                    case 424:
                      uint64_t v18 = *v8;
                      int v19 = "readVerifySlc";
                      goto LABEL_13;
                    case 425:
                      uint64_t v18 = *v8;
                      int v19 = "reducedReadVerifySlc";
                      goto LABEL_13;
                    case 426:
                      uint64_t v18 = *v8;
                      int v19 = "RxBurnEvictions";
                      goto LABEL_13;
                    case 427:
                      uint64_t v18 = *v8;
                      int v19 = "directToTLCBands";
                      goto LABEL_13;
                    case 428:
                      uint64_t v18 = *v8;
                      int v19 = "nandDesc";
                      goto LABEL_13;
                    case 429:
                      uint64_t v18 = *v8;
                      int v19 = "fwUpdatesPercentUsed";
                      goto LABEL_13;
                    case 430:
                      uint64_t v18 = *v8;
                      int v19 = "slcPercentUsed";
                      goto LABEL_13;
                    case 431:
                      uint64_t v18 = *v8;
                      int v19 = "percentUsed";
                      goto LABEL_13;
                    default:
                      switch(v7)
                      {
                        case 432:
                          uint64_t v18 = *v8;
                          int v19 = "hostAutoWrites";
                          goto LABEL_13;
                        case 433:
                          uint64_t v18 = *v8;
                          int v19 = "hostAutoWriteXacts";
                          goto LABEL_13;
                        case 434:
                          uint64_t v18 = *v8;
                          int v19 = "gcDestDynamic";
                          goto LABEL_13;
                        case 435:
                          uint64_t v18 = *v8;
                          int v19 = "gcDestStatic";
                          goto LABEL_13;
                        case 436:
                          uint64_t v18 = *v8;
                          int v19 = "gcDestWearlevel";
                          goto LABEL_13;
                        case 437:
                          uint64_t v18 = *v8;
                          int v19 = "gcDestParity";
                          goto LABEL_13;
                        case 438:
                          uint64_t v18 = *v8;
                          int v19 = "AbortSkip_Format";
                          goto LABEL_13;
                        case 440:
                          uint64_t v18 = *v8;
                          int v19 = "raidSLCPadding";
                          goto LABEL_13;
                        case 441:
                          uint64_t v18 = *v8;
                          int v19 = "raidGCBands";
                          goto LABEL_13;
                        case 442:
                          uint64_t v18 = *v8;
                          int v19 = "raidGCSectors";
                          goto LABEL_13;
                        case 443:
                          uint64_t v18 = *v8;
                          int v19 = "raidGCPadding";
                          goto LABEL_13;
                        case 444:
                          uint64_t v18 = *v8;
                          int v19 = "raidSLCBandsPerHostFlow";
                          goto LABEL_13;
                        case 445:
                          uint64_t v18 = *v8;
                          int v19 = "raidSLCSecsPerHostFlow";
                          goto LABEL_13;
                        case 446:
                          uint64_t v18 = *v8;
                          int v19 = "rxBurnMinCycleRuns";
                          goto LABEL_13;
                        case 447:
                          uint64_t v18 = *v8;
                          int v19 = "clogNumFastCxt";
                          goto LABEL_13;
                        case 448:
                          uint64_t v18 = *v8;
                          int v19 = "clogNumRapidReboots";
                          goto LABEL_13;
                        case 449:
                          uint64_t v18 = *v8;
                          int v19 = "clogFastCxtAbvThr";
                          goto LABEL_13;
                        case 450:
                          uint64_t v18 = *v8;
                          int v19 = "rxBurnDiffModeRuns";
                          goto LABEL_13;
                        case 452:
                          uint64_t v18 = *v8;
                          int v19 = "indReadVerifyFail";
                          goto LABEL_13;
                        case 453:
                          id v20 = "numOfThrottlingEntriesPerReadLevel";
                          uint64_t v21 = a1;
                          int v22 = 453;
                          goto LABEL_85;
                        case 454:
                          id v20 = "numOfThrottlingEntriesPerWriteLevel";
                          uint64_t v21 = a1;
                          int v22 = 454;
                          goto LABEL_85;
                        case 456:
                          id v20 = "slcFifoDepth";
                          uint64_t v21 = a1;
                          int v22 = 456;
                          goto LABEL_11;
                        case 457:
                          uint64_t v18 = *v8;
                          int v19 = "wcacheSectorsDirtyIdle";
                          goto LABEL_13;
                        case 458:
                          uint64_t v18 = *v8;
                          int v19 = "wcacheDS_SectorsDirtyIdle";
                          goto LABEL_13;
                        case 459:
                          uint64_t v18 = *v8;
                          int v19 = "wcacheFS_MbytesDirtyIdle";
                          goto LABEL_13;
                        case 460:
                          id v20 = "CacheDepthVsThroughput";
                          uint64_t v21 = a1;
                          int v22 = 460;
                          id v14 = v8;
                          unsigned int v15 = 256;
                          goto LABEL_12;
                        case 461:
                          uint64_t v18 = *v8;
                          int v19 = "directToTLCSectors";
                          goto LABEL_13;
                        case 462:
                          uint64_t v18 = *v8;
                          int v19 = "fallbackToWaterfall";
                          goto LABEL_13;
                        case 463:
                          id v20 = "balanceProportionBucketsHistogram";
                          uint64_t v21 = a1;
                          int v22 = 463;
LABEL_320:
                          id v14 = v8;
                          unsigned int v15 = 11;
                          goto LABEL_12;
                        case 464:
                          uint64_t v18 = *v8;
                          int v19 = "lockToTlc";
                          goto LABEL_13;
                        case 465:
                          id v20 = "burstSizeHistogram";
                          uint64_t v21 = a1;
                          int v22 = 465;
                          goto LABEL_11;
                        case 466:
                          id v20 = "qosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 466;
                          goto LABEL_342;
                        case 467:
                          id v20 = "maxQosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 467;
                          goto LABEL_22;
                        case 468:
                          id v20 = "wcacheDirtyAtFlush";
                          uint64_t v21 = a1;
                          int v22 = 468;
                          goto LABEL_85;
                        case 469:
                          id v20 = "raidReconstructSuccessPartition";
                          uint64_t v21 = a1;
                          int v22 = 469;
                          goto LABEL_20;
                        case 470:
                          id v20 = "raidReconstructFailPartition";
                          uint64_t v21 = a1;
                          int v22 = 470;
                          goto LABEL_20;
                        case 471:
                          uint64_t v18 = *v8;
                          int v19 = "raidUncleanBootBandFail";
                          goto LABEL_13;
                        case 472:
                          uint64_t v18 = *v8;
                          int v19 = "raidReconstructFailBandFlowHost";
                          goto LABEL_13;
                        case 473:
                          uint64_t v18 = *v8;
                          int v19 = "raidReconstructFailBandFlowGC";
                          goto LABEL_13;
                        case 476:
                          id v20 = "raidSuccessfulRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 476;
                          goto LABEL_20;
                        case 477:
                          id v20 = "raidFailedRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 477;
                          goto LABEL_20;
                        case 481:
                          id v20 = "skinnyBandErases_481";
                          uint64_t v21 = a1;
                          int v22 = 481;
                          goto LABEL_155;
                        case 483:
                          uint64_t v18 = *v8;
                          int v19 = "tlcOverHeatWaterfall";
                          goto LABEL_13;
                        case 484:
                          uint64_t v18 = *v8;
                          int v19 = "skinnyCyclesConvert";
                          goto LABEL_13;
                        case 485:
                          uint64_t v18 = *v8;
                          int v19 = "non_proportional_directToTLCSectors";
                          goto LABEL_13;
                        case 486:
                          uint64_t v18 = *v8;
                          int v19 = "maxFailedFastCxtSync";
                          goto LABEL_13;
                        case 487:
                          uint64_t v18 = *v8;
                          int v19 = "numFormatUserArea";
                          goto LABEL_13;
                        case 488:
                          uint64_t v18 = *v8;
                          int v19 = "clogFastCxtSyncAborted";
                          goto LABEL_13;
                        case 489:
                          id v20 = "clogOccupationSectors";
                          uint64_t v21 = a1;
                          int v22 = 489;
                          goto LABEL_19;
                        case 490:
                          id v20 = "bdrTmpHist";
                          uint64_t v21 = a1;
                          int v22 = 490;
LABEL_342:
                          id v14 = v8;
                          unsigned int v15 = 64;
                          goto LABEL_12;
                        case 491:
                          uint64_t v18 = *v8;
                          int v19 = "numFWUpdates";
                          goto LABEL_13;
                        case 492:
                          uint64_t v18 = *v8;
                          int v19 = "numClogLoadFails";
                          goto LABEL_13;
                        case 493:
                          uint64_t v18 = *v8;
                          int v19 = "rxBurnNumForcedDiffMode";
                          goto LABEL_13;
                        case 494:
                          uint64_t v18 = *v8;
                          int v19 = "RD_numSaves";
                          goto LABEL_13;
                        case 495:
                          uint64_t v18 = *v8;
                          int v19 = "eanCompressWrites";
                          goto LABEL_13;
                        case 496:
                          uint64_t v18 = *v8;
                          int v19 = "eanHostWrites";
                          goto LABEL_13;
                        case 497:
                          uint64_t v18 = *v8;
                          int v19 = "bandPreErases";
                          goto LABEL_13;
                        case 498:
                          uint64_t v18 = *v8;
                          int v19 = "eanHostUnmaps";
                          goto LABEL_13;
                        case 499:
                          uint64_t v18 = *v8;
                          int v19 = "eanHostFlushes";
                          goto LABEL_13;
                        case 500:
                          uint64_t v18 = *v8;
                          int v19 = "eanFastWrites";
                          goto LABEL_13;
                        case 501:
                          uint64_t v18 = *v8;
                          int v19 = "autowriteDS2FSCollisions";
                          goto LABEL_13;
                        case 502:
                          uint64_t v18 = *v8;
                          int v19 = "autowriteWaitTransferTaskBlocks";
                          goto LABEL_13;
                        case 503:
                          id v20 = "avgCycle";
                          uint64_t v21 = a1;
                          int v22 = 503;
                          goto LABEL_20;
                        case 504:
                          uint64_t v18 = *v8;
                          int v19 = "RD_DeferredClearsOverflowCnt";
                          goto LABEL_13;
                        default:
                          switch(v7)
                          {
                            case 505:
                              uint64_t v18 = *v8;
                              int v19 = "maxVerticsInBand";
                              goto LABEL_13;
                            case 506:
                              uint64_t v18 = *v8;
                              int v19 = "numVertics";
                              goto LABEL_13;
                            case 507:
                              uint64_t v18 = *v8;
                              int v19 = "exceededCVertics";
                              goto LABEL_13;
                            case 510:
                              uint64_t v18 = *v8;
                              int v19 = "raidReconstructFailMismatch";
                              goto LABEL_13;
                            case 511:
                              id v20 = "mspbootBlockRefreshCnt";
                              uint64_t v21 = a1;
                              int v22 = 511;
                              goto LABEL_155;
                            case 516:
                              id v20 = "mspBootBlockRefreshTime";
                              uint64_t v21 = a1;
                              int v22 = 516;
                              goto LABEL_155;
                            case 517:
                              uint64_t v18 = *v8;
                              int v19 = "mspBootBlockCountPerMsp";
                              goto LABEL_13;
                            case 518:
                              uint64_t v18 = *v8;
                              int v19 = "skinnyRevectorSLC";
                              goto LABEL_13;
                            case 519:
                              uint64_t v18 = *v8;
                              int v19 = "skinnyRevectorTLC";
                              goto LABEL_13;
                            case 520:
                              uint64_t v18 = *v8;
                              int v19 = "perfSetupAttempts";
                              goto LABEL_13;
                            case 521:
                              uint64_t v18 = *v8;
                              int v19 = "perfSetupSuccesses";
                              goto LABEL_13;
                            case 522:
                              uint64_t v18 = *v8;
                              int v19 = "perfWriteAttempts";
                              goto LABEL_13;
                            case 523:
                              uint64_t v18 = *v8;
                              int v19 = "perfWriteSuccesses";
                              goto LABEL_13;
                            case 524:
                              uint64_t v18 = *v8;
                              int v19 = "perfReadAttempts";
                              goto LABEL_13;
                            case 525:
                              uint64_t v18 = *v8;
                              int v19 = "perfReadSuccesses";
                              goto LABEL_13;
                            case 526:
                              uint64_t v18 = *v8;
                              int v19 = "perfCleanupAttempts";
                              goto LABEL_13;
                            case 527:
                              uint64_t v18 = *v8;
                              int v19 = "perfCleanupSuccesses";
                              goto LABEL_13;
                            case 530:
                              uint64_t v18 = *v8;
                              int v19 = "firstFailedDieId";
                              goto LABEL_13;
                            case 531:
                              uint64_t v18 = *v8;
                              int v19 = "numDieFailures";
                              goto LABEL_13;
                            case 532:
                              uint64_t v18 = *v8;
                              int v19 = "spareAvailablePercent";
                              goto LABEL_13;
                            case 533:
                              uint64_t v18 = *v8;
                              int v19 = "dataFabricErr";
                              goto LABEL_13;
                            case 534:
                              uint64_t v18 = *v8;
                              int v19 = "downlinkFabricErr";
                              goto LABEL_13;
                            case 535:
                              uint64_t v18 = *v8;
                              int v19 = "prpAccTimeoutErr";
                              goto LABEL_13;
                            case 537:
                              uint64_t v18 = *v8;
                              int v19 = "uplinkFabricErr";
                              goto LABEL_13;
                            case 538:
                              uint64_t v18 = *v8;
                              int v19 = "skinnyBandsGBB";
                              goto LABEL_13;
                            case 539:
                              uint64_t v18 = *v8;
                              int v19 = "AbortPad_GcMustPadBand";
                              goto LABEL_13;
                            case 540:
                              uint64_t v18 = *v8;
                              int v19 = "AbortPad_GcMustPadSkinny";
                              goto LABEL_13;
                            case 541:
                              uint64_t v18 = *v8;
                              int v19 = "bdrHostPingInitial";
                              goto LABEL_13;
                            case 542:
                              uint64_t v18 = *v8;
                              int v19 = "bdrHostPingMoreNeeded";
                              goto LABEL_13;
                            case 543:
                              uint64_t v18 = *v8;
                              int v19 = "bandParityAllocationFailed";
                              goto LABEL_13;
                            case 544:
                              uint64_t v18 = *v8;
                              int v19 = "fastHwBurstToSlc";
                              goto LABEL_13;
                            case 545:
                              uint64_t v18 = *v8;
                              int v19 = "slowHwToTlc";
                              goto LABEL_13;
                            case 546:
                              id v20 = "slcDemandBurstSizeDetected";
                              uint64_t v21 = a1;
                              int v22 = 546;
                              goto LABEL_11;
                            case 547:
                              id v20 = "slcDemandBurstDur";
                              uint64_t v21 = a1;
                              int v22 = 547;
                              goto LABEL_11;
                            case 548:
                              uint64_t v18 = *v8;
                              int v19 = "fastHwToTlcBurst";
                              goto LABEL_13;
                            case 549:
                              id v20 = "slcDemandBurstSizeSlc";
                              uint64_t v21 = a1;
                              int v22 = 549;
                              goto LABEL_11;
                            case 551:
                              id v20 = "balanceProportionBucketsHistogramTlc";
                              uint64_t v21 = a1;
                              int v22 = 551;
                              goto LABEL_320;
                            case 553:
                              uint64_t v18 = *v8;
                              int v19 = "slowHwFlushToSlc";
                              goto LABEL_13;
                            case 557:
                              uint64_t v18 = *v8;
                              int v19 = "slowHwToSlc";
                              goto LABEL_13;
                            case 558:
                              uint64_t v18 = *v8;
                              int v19 = "flushNwToSlc";
                              goto LABEL_13;
                            case 559:
                              uint64_t v18 = *v8;
                              int v19 = "flushNwToTlc";
                              goto LABEL_13;
                            case 560:
                              uint64_t v18 = *v8;
                              int v19 = "oslcHw";
                              goto LABEL_13;
                            case 561:
                              uint64_t v18 = *v8;
                              int v19 = "oslcTransitions";
                              goto LABEL_13;
                            case 563:
                              uint64_t v18 = *v8;
                              int v19 = "slcDemandFlushCount";
                              goto LABEL_13;
                            case 564:
                              uint64_t v18 = *v8;
                              int v19 = "slcDemandBurstCount";
                              goto LABEL_13;
                            case 565:
                              uint64_t v18 = *v8;
                              int v19 = "oslcBaseAvgPE";
                              goto LABEL_13;
                            case 566:
                              uint64_t v18 = *v8;
                              int v19 = "raidReconstructFailNoSPBX";
                              goto LABEL_13;
                            case 567:
                              uint64_t v18 = *v8;
                              int v19 = "raidReconstructFailDouble";
                              goto LABEL_13;
                            case 568:
                              uint64_t v18 = *v8;
                              int v19 = "oslcFastWAmpUOnOff";
                              goto LABEL_13;
                            case 569:
                              uint64_t v18 = *v8;
                              int v19 = "oslcSlowWAmpUOnOff";
                              goto LABEL_13;
                            case 570:
                              uint64_t v18 = *v8;
                              int v19 = "raidReconstructFailInvalid";
                              goto LABEL_13;
                            case 572:
                              uint64_t v18 = *v8;
                              int v19 = "oslcLastWAmpUx10";
                              goto LABEL_13;
                            case 573:
                              uint64_t v18 = *v8;
                              int v19 = "raidFailedReadNoBlog";
                              goto LABEL_13;
                            case 574:
                              uint64_t v18 = *v8;
                              int v19 = "raidReconstructFailBlank";
                              goto LABEL_13;
                            case 575:
                              uint64_t v18 = *v8;
                              int v19 = "oslcHotTLCOnOff";
                              goto LABEL_13;
                            case 576:
                              uint64_t v18 = *v8;
                              int v19 = "gcVPackDestinations";
                              goto LABEL_13;
                            case 581:
                              uint64_t v18 = *v8;
                              int v19 = "averageTLCPECycles";
                              goto LABEL_13;
                            case 582:
                              uint64_t v18 = *v8;
                              int v19 = "averageSLCPECycles";
                              goto LABEL_13;
                            case 583:
                              uint64_t v18 = *v8;
                              int v19 = "numAtomicBoots";
                              goto LABEL_13;
                            case 584:
                              uint64_t v18 = *v8;
                              int v19 = "clogMinorMismatch";
                              goto LABEL_13;
                            case 586:
                              uint64_t v18 = *v8;
                              int v19 = "raidExpectedFailRMXReconstructionInternal";
                              goto LABEL_13;
                            case 587:
                              uint64_t v18 = *v8;
                              int v19 = "raidExpectedFailRMXReconstructionHost";
                              goto LABEL_13;
                            case 588:
                              uint64_t v18 = *v8;
                              int v19 = "oslcGCinvalidations";
                              goto LABEL_13;
                            case 589:
                              uint64_t v18 = *v8;
                              int v19 = "oslcGCActivateReason";
                              goto LABEL_13;
                            default:
                              switch(v7)
                              {
                                case 590:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcLowCleanBandsUOnOff";
                                  goto LABEL_13;
                                case 591:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcTooManyGCMustOnOff";
                                  goto LABEL_13;
                                case 592:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcBaseHostWrites";
                                  goto LABEL_13;
                                case 593:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcBaseBandErases";
                                  goto LABEL_13;
                                case 594:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcBdrBands";
                                  goto LABEL_13;
                                case 595:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcBdrValid";
                                  goto LABEL_13;
                                case 596:
                                  uint64_t v18 = *v8;
                                  int v19 = "unexpectedBlanksInternal";
                                  goto LABEL_13;
                                case 597:
                                  uint64_t v18 = *v8;
                                  int v19 = "unexpectedBlanksOnRV";
                                  goto LABEL_13;
                                case 601:
                                  uint64_t v18 = *v8;
                                  int v19 = "waterfallLockSectors";
                                  goto LABEL_13;
                                case 602:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcGCActiveWrites";
                                  goto LABEL_13;
                                case 603:
                                  uint64_t v18 = *v8;
                                  int v19 = "chipIdTemperatureSample";
                                  goto LABEL_13;
                                case 604:
                                  uint64_t v18 = *v8;
                                  int v19 = "gcVPackWrites";
                                  goto LABEL_13;
                                case 605:
                                  id v20 = "gcActiveReasons";
                                  uint64_t v21 = a1;
                                  int v22 = 605;
                                  goto LABEL_11;
                                case 606:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanMaxInitTimeMs";
                                  goto LABEL_13;
                                case 607:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanMinToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 608:
                                  uint64_t v18 = *v8;
                                  int v19 = "skinnyAPGMRetire";
                                  goto LABEL_13;
                                case 609:
                                  uint64_t v18 = *v8;
                                  int v19 = "unexpectedBlanksHost";
                                  goto LABEL_13;
                                case 610:
                                  id v20 = "pcieAerCounters";
                                  uint64_t v21 = a1;
                                  int v22 = 610;
                                  goto LABEL_342;
                                case 611:
                                  uint64_t v18 = *v8;
                                  int v19 = "fastHwToTlcBalance";
                                  goto LABEL_13;
                                case 612:
                                  uint64_t v18 = *v8;
                                  int v19 = "perfOSLCRuns";
                                  goto LABEL_13;
                                case 613:
                                  uint64_t v18 = *v8;
                                  int v19 = "slcDemandBurstWritesInGC";
                                  goto LABEL_13;
                                case 614:
                                  uint64_t v18 = *v8;
                                  int v19 = "slcDemandBurstWritesInTT";
                                  goto LABEL_13;
                                case 615:
                                  uint64_t v18 = *v8;
                                  int v19 = "slcDemandBurstWritesInNRP";
                                  goto LABEL_13;
                                case 616:
                                  uint64_t v18 = *v8;
                                  int v19 = "perfTotalDmaMb";
                                  goto LABEL_13;
                                case 617:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanAvgInitTimeMs";
                                  goto LABEL_13;
                                case 618:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanAvgToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 619:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanMaxBootReadTimeMs";
                                  goto LABEL_13;
                                case 620:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanAvgBootReadTimeMs";
                                  goto LABEL_13;
                                case 621:
                                  id v20 = "eanBootReadsHist";
                                  uint64_t v21 = a1;
                                  int v22 = 621;
                                  goto LABEL_11;
                                case 622:
                                  uint64_t v18 = *v8;
                                  int v19 = "maxBgInitTimeMs";
                                  goto LABEL_13;
                                case 623:
                                  uint64_t v18 = *v8;
                                  int v19 = "avgBgInitTimeMs";
                                  goto LABEL_13;
                                case 624:
                                  id v20 = "clogFailReason";
                                  uint64_t v21 = a1;
                                  int v22 = 624;
                                  goto LABEL_85;
                                case 625:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanMinBootReadMBPerSec";
                                  goto LABEL_13;
                                case 626:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanAvgBootReadMBPerSec";
                                  goto LABEL_13;
                                case 627:
                                  uint64_t v18 = *v8;
                                  int v19 = "minSkinnyPECycles";
                                  goto LABEL_13;
                                case 628:
                                  uint64_t v18 = *v8;
                                  int v19 = "maxSkinnyPECycles";
                                  goto LABEL_13;
                                case 629:
                                  uint64_t v18 = *v8;
                                  int v19 = "averageSkinnyPECycles";
                                  goto LABEL_13;
                                case 630:
                                  id v20 = "raidSuccessfulRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 630;
                                  goto LABEL_463;
                                case 631:
                                  id v20 = "raidFailedRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 631;
                                  goto LABEL_463;
                                case 632:
                                  id v20 = "eanFirstReadMode";
                                  uint64_t v21 = a1;
                                  int v22 = 632;
LABEL_463:
                                  id v14 = v8;
                                  unsigned int v15 = 6;
                                  goto LABEL_12;
                                case 635:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcHwGC";
                                  goto LABEL_13;
                                case 636:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcHwTT";
                                  goto LABEL_13;
                                case 637:
                                  uint64_t v18 = *v8;
                                  int v19 = "oslcHwNRP";
                                  goto LABEL_13;
                                case 638:
                                  id v20 = "oslcDemandBurstSize";
                                  uint64_t v21 = a1;
                                  int v22 = 638;
                                  goto LABEL_11;
                                case 639:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidReconstructSuccessBandFlowOslc";
                                  goto LABEL_13;
                                case 640:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidReconstructFailBandFlowOslc";
                                  goto LABEL_13;
                                case 641:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidFailSectors";
                                  goto LABEL_13;
                                case 642:
                                  uint64_t v18 = *v8;
                                  int v19 = "eanFailSectors";
                                  goto LABEL_13;
                                case 643:
                                  uint64_t v18 = *v8;
                                  int v19 = "bdrTimeMode";
                                  goto LABEL_13;
                                case 644:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidParityNotSavedP";
                                  goto LABEL_13;
                                case 645:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidParityNotSavedQ";
                                  goto LABEL_13;
                                case 646:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidParityInvalid";
                                  goto LABEL_13;
                                case 647:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidParityUnknown";
                                  goto LABEL_13;
                                case 648:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidParityUnmapped";
                                  goto LABEL_13;
                                case 649:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidParityGCUnc";
                                  goto LABEL_13;
                                case 657:
                                  uint64_t v18 = *v8;
                                  int v19 = "AbortSkip_MPBXProbational";
                                  goto LABEL_13;
                                case 659:
                                  uint64_t v18 = *v8;
                                  int v19 = "raidVerificationReads";
                                  goto LABEL_13;
                                case 666:
                                  uint64_t v18 = *v8;
                                  int v19 = "nofDies";
                                  goto LABEL_13;
                                case 671:
                                  uint64_t v18 = *v8;
                                  int v19 = "skinnyBandsNum";
                                  goto LABEL_13;
                                case 672:
                                  uint64_t v18 = *v8;
                                  int v19 = "skinnyBandsNumDips";
                                  goto LABEL_13;
                                case 674:
                                  id v20 = "oslcNoVotesHw";
                                  uint64_t v21 = a1;
                                  int v22 = 674;
                                  goto LABEL_23;
                                case 675:
                                  uint64_t v18 = *v8;
                                  int v19 = "totalLbas";
                                  goto LABEL_13;
                                case 676:
                                  uint64_t v18 = *v8;
                                  int v19 = "bdrHostPingExtra";
                                  goto LABEL_13;
                                case 677:
                                  uint64_t v18 = *v8;
                                  int v19 = "magazineInstanceMeta";
                                  goto LABEL_13;
                                default:
                                  switch(v7)
                                  {
                                    case 680:
                                      id v20 = "magazineFWVersion";
                                      uint64_t v21 = a1;
                                      int v22 = 680;
                                      goto LABEL_21;
                                    case 681:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidReconstructFailPMXUnsup";
                                      goto LABEL_13;
                                    case 682:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidReconstructFailBMXUnsup";
                                      goto LABEL_13;
                                    case 683:
                                      uint64_t v18 = *v8;
                                      int v19 = "iBootNANDResets";
                                      goto LABEL_13;
                                    case 684:
                                      uint64_t v18 = *v8;
                                      int v19 = "pcieClkreqHighTimeout";
                                      goto LABEL_13;
                                    case 687:
                                      id v20 = "cbdrInitSent";
                                      uint64_t v21 = a1;
                                      int v22 = 687;
LABEL_21:
                                      id v14 = v8;
                                      unsigned int v15 = 3;
                                      goto LABEL_12;
                                    case 688:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrPauseSent";
                                      goto LABEL_13;
                                    case 689:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrResumeSent";
                                      goto LABEL_13;
                                    case 690:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrGetResultSent";
                                      goto LABEL_13;
                                    case 691:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrEarlyExits";
                                      goto LABEL_13;
                                    case 694:
                                      id v20 = "cbdrRefreshGrades";
                                      uint64_t v21 = a1;
                                      int v22 = 694;
                                      goto LABEL_11;
                                    case 695:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrNotEnoughReads";
                                      goto LABEL_13;
                                    case 696:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrAborts";
                                      goto LABEL_13;
                                    case 697:
                                      uint64_t v18 = *v8;
                                      int v19 = "TurboRaidHostClassifications";
                                      goto LABEL_13;
                                    case 698:
                                      uint64_t v18 = *v8;
                                      int v19 = "TurboRaidInternalClassifications";
                                      goto LABEL_13;
                                    case 699:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrFullyDone";
                                      goto LABEL_13;
                                    case 702:
                                      id v20 = "vcurve";
                                      uint64_t v21 = a1;
                                      int v22 = 702;
                                      goto LABEL_155;
                                    case 703:
                                      id v20 = "injDepth";
                                      uint64_t v21 = a1;
                                      int v22 = 703;
                                      goto LABEL_153;
                                    case 704:
                                      uint64_t v18 = *v8;
                                      int v19 = "logical_disk_occupied_promiles";
                                      goto LABEL_13;
                                    case 711:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidPrevFailedReconstructSkip";
                                      goto LABEL_13;
                                    case 712:
                                      uint64_t v18 = *v8;
                                      int v19 = "TurboRaidSuccessfulHostAuxReads";
                                      goto LABEL_13;
                                    case 713:
                                      uint64_t v18 = *v8;
                                      int v19 = "TurboRaidSuccessfulInternalAuxReads";
                                      goto LABEL_13;
                                    case 714:
                                      uint64_t v18 = *v8;
                                      int v19 = "turboRaidClassificationReliabilityHost";
                                      goto LABEL_13;
                                    case 715:
                                      uint64_t v18 = *v8;
                                      int v19 = "turboRaidClassificationReliabilityInternal";
                                      goto LABEL_13;
                                    case 716:
                                      uint64_t v18 = *v8;
                                      int v19 = "turboRaidClassificationQualityHost";
                                      goto LABEL_13;
                                    case 717:
                                      uint64_t v18 = *v8;
                                      int v19 = "turboRaidClassificationQualityInternal";
                                      goto LABEL_13;
                                    case 719:
                                      uint64_t v18 = *v8;
                                      int v19 = "skinnyBandErases";
                                      goto LABEL_13;
                                    case 721:
                                      uint64_t v18 = *v8;
                                      int v19 = "gcPDusterDestinations";
                                      goto LABEL_13;
                                    case 722:
                                      uint64_t v18 = *v8;
                                      int v19 = "gcPDusterWrites";
                                      goto LABEL_13;
                                    case 730:
                                      uint64_t v18 = *v8;
                                      int v19 = "rvFails";
                                      goto LABEL_13;
                                    case 737:
                                      uint64_t v18 = *v8;
                                      int v19 = "TurboRaidFailedHostAuxReads";
                                      goto LABEL_13;
                                    case 738:
                                      uint64_t v18 = *v8;
                                      int v19 = "TurboRaidFailedInternalAuxReads";
                                      goto LABEL_13;
                                    case 741:
                                      uint64_t v18 = *v8;
                                      int v19 = "autoSkipTriggers";
                                      goto LABEL_13;
                                    case 742:
                                      uint64_t v18 = *v8;
                                      int v19 = "autoSkipPlanes";
                                      goto LABEL_13;
                                    case 744:
                                      id v20 = "raidReconstructDurationHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 744;
                                      goto LABEL_23;
                                    case 745:
                                      id v20 = "failsOnReconstructHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 745;
                                      goto LABEL_23;
                                    case 746:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_userFlattenExcessive";
                                      goto LABEL_13;
                                    case 747:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_IntFlattenExcessive";
                                      goto LABEL_13;
                                    case 748:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_userFlattenBalance";
                                      goto LABEL_13;
                                    case 749:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_intFlattenBalance";
                                      goto LABEL_13;
                                    case 750:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_formatVertExcessive";
                                      goto LABEL_13;
                                    case 751:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_formatVertBalance";
                                      goto LABEL_13;
                                    case 753:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrNumSlowRefreshes";
                                      goto LABEL_13;
                                    case 754:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrNumFastRefreshes";
                                      goto LABEL_13;
                                    case 755:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrTotalRefreshValidity";
                                      goto LABEL_13;
                                    case 756:
                                      id v20 = "cbdrRefreshedAges";
                                      uint64_t v21 = a1;
                                      int v22 = 756;
                                      goto LABEL_545;
                                    case 758:
                                      uint64_t v18 = *v8;
                                      int v19 = "cbdrSkippedBlocks";
                                      goto LABEL_13;
                                    case 759:
                                      id v20 = "cbdrScanPct";
                                      uint64_t v21 = a1;
                                      int v22 = 759;
                                      goto LABEL_19;
                                    case 760:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidSuccessfulBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 761:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidSuccessfulBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 762:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidFailedBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 763:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidFailedBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 764:
                                      uint64_t v18 = *v8;
                                      int v19 = "ricSPRVFail";
                                      goto LABEL_13;
                                    case 765:
                                      uint64_t v18 = *v8;
                                      int v19 = "ricMPRVFail";
                                      goto LABEL_13;
                                    case 767:
                                      id v20 = "cbdrRefreshGradesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 767;
                                      goto LABEL_11;
                                    case 768:
                                      id v20 = "cbdrRefreshedAgesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 768;
LABEL_545:
                                      id v14 = v8;
                                      unsigned int v15 = 9;
                                      goto LABEL_12;
                                    case 769:
                                      id v20 = "cbdrScanPctSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 769;
                                      goto LABEL_19;
                                    case 770:
                                      id v20 = "cpuBurstLength";
                                      uint64_t v21 = a1;
                                      int v22 = 770;
                                      goto LABEL_23;
                                    case 771:
                                      uint64_t v18 = *v8;
                                      int v19 = "autoSkipRaidRecoFail";
                                      goto LABEL_13;
                                    case 772:
                                      id v20 = "dmReasonsSlc";
                                      uint64_t v21 = a1;
                                      int v22 = 772;
                                      goto LABEL_155;
                                    case 773:
                                      id v20 = "dmReasonsTlc";
                                      uint64_t v21 = a1;
                                      int v22 = 773;
                                      goto LABEL_155;
                                    case 774:
                                      uint64_t v18 = *v8;
                                      int v19 = "raidReconstructFailBMXAbort";
                                      goto LABEL_13;
                                    case 775:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_fatBindingNoBlocks";
                                      goto LABEL_13;
                                    case 776:
                                      uint64_t v18 = *v8;
                                      int v19 = "bandKill_fatBindingFewBlocks";
                                      goto LABEL_13;
                                    default:
                                      switch(v7)
                                      {
                                        case 777:
                                          uint64_t v18 = *v8;
                                          int v19 = "numBadBootBlocks";
                                          goto LABEL_13;
                                        case 778:
                                          uint64_t v18 = *v8;
                                          int v19 = "snapshotCPUHigh";
                                          goto LABEL_13;
                                        case 779:
                                          uint64_t v18 = *v8;
                                          int v19 = "snapshotCPULow";
                                          goto LABEL_13;
                                        case 780:
                                          uint64_t v18 = *v8;
                                          int v19 = "gcWithoutBMs";
                                          goto LABEL_13;
                                        case 781:
                                          id v20 = "gcSearchTimeHistory";
                                          uint64_t v21 = a1;
                                          int v22 = 781;
                                          goto LABEL_11;
                                        case 785:
                                          id v20 = "gcSearchPortion";
                                          uint64_t v21 = a1;
                                          int v22 = 785;
                                          goto LABEL_85;
                                        case 786:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidReconstructFailBmxMp";
                                          goto LABEL_13;
                                        case 787:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidReconstructFailBmx";
                                          goto LABEL_13;
                                        case 788:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidReconstructFailBMXUECC";
                                          goto LABEL_13;
                                        case 789:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidReconstructFailBMXBlank";
                                          goto LABEL_13;
                                        case 790:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidPrevFailedReconstructBmxMpSkip";
                                          goto LABEL_13;
                                        case 792:
                                          uint64_t v18 = *v8;
                                          int v19 = "numTLCFatBands";
                                          goto LABEL_13;
                                        case 793:
                                          uint64_t v18 = *v8;
                                          int v19 = "fatValidity";
                                          goto LABEL_13;
                                        case 794:
                                          uint64_t v18 = *v8;
                                          int v19 = "fatTotal";
                                          goto LABEL_13;
                                        case 798:
                                          id v20 = "raidBMXFailP";
                                          uint64_t v21 = a1;
                                          int v22 = 798;
                                          goto LABEL_22;
                                        case 799:
                                          id v20 = "raidBMXFailUECC";
                                          uint64_t v21 = a1;
                                          int v22 = 799;
                                          goto LABEL_22;
                                        case 804:
                                          id v20 = "raidBMXFailNoSPBX";
                                          uint64_t v21 = a1;
                                          int v22 = 804;
                                          goto LABEL_22;
                                        case 806:
                                          id v20 = "raidBMXFailBlank";
                                          uint64_t v21 = a1;
                                          int v22 = 806;
                                          goto LABEL_22;
                                        case 809:
                                          id v20 = "raidBMXFailUnsup";
                                          uint64_t v21 = a1;
                                          int v22 = 809;
                                          goto LABEL_22;
                                        case 811:
                                          id v20 = "raidBMXFailMpSkip";
                                          uint64_t v21 = a1;
                                          int v22 = 811;
                                          goto LABEL_22;
                                        case 812:
                                          id v20 = "raidBMXFailAbort";
                                          uint64_t v21 = a1;
                                          int v22 = 812;
                                          goto LABEL_22;
                                        case 813:
                                          uint64_t v18 = *v8;
                                          int v19 = "TurboRaidIsEnabled";
                                          goto LABEL_13;
                                        case 814:
                                          id v20 = "raidBMXFailOther";
                                          uint64_t v21 = a1;
                                          int v22 = 814;
                                          goto LABEL_22;
                                        case 815:
                                          id v20 = "raidBMXSuccess";
                                          uint64_t v21 = a1;
                                          int v22 = 815;
                                          goto LABEL_22;
                                        case 816:
                                          uint64_t v18 = *v8;
                                          int v19 = "skinnyBandsExtraDip";
                                          goto LABEL_13;
                                        case 821:
                                          uint64_t v18 = *v8;
                                          int v19 = "writeAmp";
                                          goto LABEL_13;
                                        case 822:
                                          uint64_t v18 = *v8;
                                          int v19 = "ricMaxClogOnlyPages";
                                          goto LABEL_13;
                                        case 823:
                                          id v20 = "readClassifyStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 823;
                                          goto LABEL_21;
                                        case 824:
                                          id v20 = "readWithAuxStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 824;
                                          goto LABEL_11;
                                        case 825:
                                          id v20 = "readReconstructStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 825;
                                          goto LABEL_11;
                                        case 826:
                                          uint64_t v18 = *v8;
                                          int v19 = "bdrBackupChecks";
                                          goto LABEL_13;
                                        case 827:
                                          uint64_t v18 = *v8;
                                          int v19 = "ricExceedClogOnlyPagesTH";
                                          goto LABEL_13;
                                        case 828:
                                          uint64_t v18 = *v8;
                                          int v19 = "numDipFailures";
                                          goto LABEL_13;
                                        case 831:
                                          uint64_t v18 = *v8;
                                          int v19 = "prefetchNextRange";
                                          goto LABEL_13;
                                        case 862:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidSuccessfulSkip";
                                          goto LABEL_13;
                                        case 863:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidFailedSkip";
                                          goto LABEL_13;
                                        case 864:
                                          uint64_t v18 = *v8;
                                          int v19 = "raidSkipAttempts";
                                          goto LABEL_13;
                                        case 865:
                                          id v20 = "timeOfThrottlingPerLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 865;
                                          goto LABEL_85;
                                        case 866:
                                          id v20 = "timeOfThrottlingPerReadLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 866;
                                          goto LABEL_85;
                                        case 867:
                                          id v20 = "timeOfThrottlingPerWriteLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 867;
                                          goto LABEL_85;
                                        case 868:
                                          id v20 = "dmReasonsSlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 868;
                                          goto LABEL_155;
                                        case 869:
                                          id v20 = "dmReasonsTlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 869;
                                          goto LABEL_155;
                                        case 870:
                                          id v20 = "dmReasonsSlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 870;
                                          goto LABEL_155;
                                        case 871:
                                          id v20 = "dmReasonsTlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 871;
                                          goto LABEL_155;
                                        case 876:
                                          id v20 = "dmReasonsSlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 876;
                                          goto LABEL_155;
                                        case 877:
                                          id v20 = "dmReasonsTlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 877;
                                          goto LABEL_155;
                                        case 883:
                                          uint64_t v18 = *v8;
                                          int v19 = "clogEmptyProgramms";
                                          goto LABEL_13;
                                        case 884:
                                          uint64_t v18 = *v8;
                                          int v19 = "oslcHwCloseBand";
                                          goto LABEL_13;
                                        case 891:
                                          id v20 = "turboRaidSuccessAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 891;
                                          goto LABEL_20;
                                        case 892:
                                          id v20 = "turboRaidFailAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 892;
                                          goto LABEL_20;
                                        case 893:
                                          id v20 = "turboRaidClassifyQualPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 893;
                                          goto LABEL_20;
                                        case 894:
                                          id v20 = "turboRaidClassifyRelPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 894;
                                          goto LABEL_20;
                                        case 895:
                                          uint64_t v18 = *v8;
                                          int v19 = "IND_pool_freeMinSilo";
                                          goto LABEL_13;
                                        case 896:
                                          uint64_t v18 = *v8;
                                          int v19 = "autoSweepBlocks";
                                          goto LABEL_13;
                                        case 897:
                                          id v20 = "wcWrFragSizes";
                                          uint64_t v21 = a1;
                                          int v22 = 897;
                                          goto LABEL_85;
                                        case 898:
                                          id v20 = "indStateAcrossGcDidNoL";
                                          uint64_t v21 = a1;
                                          int v22 = 898;
                                          goto LABEL_85;
                                        case 899:
                                          id v20 = "indStateAcrossGcDidL";
                                          uint64_t v21 = a1;
                                          int v22 = 899;
                                          goto LABEL_85;
                                        case 900:
                                          uint64_t v18 = *v8;
                                          int v19 = "turboRaidNoClassifyDueToWasRetire";
                                          goto LABEL_13;
                                        case 901:
                                          uint64_t v18 = *v8;
                                          int v19 = "turboRaidNoClassifyDueToOpenBand";
                                          goto LABEL_13;
                                        case 902:
                                          uint64_t v18 = *v8;
                                          int v19 = "turboRaidNoClassifyDueToQualityBlock";
                                          goto LABEL_13;
                                        case 903:
                                          uint64_t v18 = *v8;
                                          int v19 = "turboRaidGbbOpenBand";
                                          goto LABEL_13;
                                        case 904:
                                          uint64_t v18 = *v8;
                                          int v19 = "turboRaidGbbShouldRetireOnRefresh";
                                          goto LABEL_13;
                                        case 905:
                                          id v20 = "turboRaidRelPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 905;
                                          goto LABEL_85;
                                        case 906:
                                          id v20 = "turboRaidRelBetweenRefreshesPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 906;
                                          goto LABEL_85;
                                        default:
                                          if (v7 <= 1039)
                                          {
                                            switch(v7)
                                            {
                                              case 907:
                                                id v20 = "turboRaidMaxRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 907;
                                                goto LABEL_85;
                                              case 908:
                                                id v20 = "turboRaidMinRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 908;
                                                goto LABEL_85;
                                              case 909:
                                              case 910:
                                              case 911:
                                              case 912:
                                              case 913:
                                              case 914:
                                              case 915:
                                              case 916:
                                              case 917:
                                              case 924:
                                              case 925:
                                              case 926:
                                              case 927:
                                              case 928:
                                              case 929:
                                              case 936:
                                              case 941:
                                              case 945:
                                              case 946:
                                              case 947:
                                              case 949:
                                              case 950:
                                              case 952:
                                              case 954:
                                              case 955:
                                              case 956:
                                              case 957:
                                              case 958:
                                              case 959:
                                              case 960:
                                              case 963:
                                              case 964:
                                              case 965:
                                              case 966:
                                              case 968:
                                              case 969:
                                              case 970:
                                                goto LABEL_696;
                                              case 918:
                                                id v20 = "turboRaidMaxCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 918;
                                                goto LABEL_85;
                                              case 919:
                                                id v20 = "turboRaidMinCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 919;
                                                goto LABEL_85;
                                              case 920:
                                                id v20 = "turboRaidAuxPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 920;
                                                goto LABEL_85;
                                              case 921:
                                                id v20 = "turboRaidAuxBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 921;
                                                goto LABEL_85;
                                              case 922:
                                                uint64_t v18 = *v8;
                                                int v19 = "turboRaidRelLockMark";
                                                goto LABEL_13;
                                              case 923:
                                                uint64_t v18 = *v8;
                                                int v19 = "turboRaidAuxLockMark";
                                                goto LABEL_13;
                                              case 930:
                                                id v20 = "turboRaidMaxCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 930;
                                                goto LABEL_85;
                                              case 931:
                                                id v20 = "turboRaidMinCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 931;
                                                goto LABEL_85;
                                              case 932:
                                                id v20 = "turboRaidLastRelPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 932;
                                                goto LABEL_85;
                                              case 933:
                                                id v20 = "turboRaidRelQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 933;
                                                goto LABEL_85;
                                              case 934:
                                                id v20 = "turboRaidLastAuxPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 934;
                                                goto LABEL_85;
                                              case 935:
                                                id v20 = "turboRaidAuxQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 935;
                                                goto LABEL_85;
                                              case 937:
                                                uint64_t v18 = *v8;
                                                int v19 = "turboRaidPEFailAfterRel";
                                                goto LABEL_13;
                                              case 938:
                                                uint64_t v18 = *v8;
                                                int v19 = "turboRaidPEFailAfterAux";
                                                goto LABEL_13;
                                              case 939:
                                                uint64_t v18 = *v8;
                                                int v19 = "dvfmVotesCPU";
                                                goto LABEL_13;
                                              case 940:
                                                uint64_t v18 = *v8;
                                                int v19 = "dvfmVotesBandwidth";
                                                goto LABEL_13;
                                              case 942:
                                                uint64_t v18 = *v8;
                                                int v19 = "maxSLCEndurance";
                                                goto LABEL_13;
                                              case 943:
                                                uint64_t v18 = *v8;
                                                int v19 = "maxMixedEndurance";
                                                goto LABEL_13;
                                              case 944:
                                                uint64_t v18 = *v8;
                                                int v19 = "maxNativeEndurance";
                                                goto LABEL_13;
                                              case 948:
                                                id v20 = "assertHistory";
                                                uint64_t v21 = a1;
                                                int v22 = 948;
                                                id v14 = v8;
                                                unsigned int v15 = 40;
                                                goto LABEL_12;
                                              case 951:
                                                uint64_t v18 = *v8;
                                                int v19 = "asp3Support";
                                                goto LABEL_13;
                                              case 953:
                                                uint64_t v18 = *v8;
                                                int v19 = "numCrossTempRaidUecc";
                                                goto LABEL_13;
                                              case 961:
                                                uint64_t v18 = *v8;
                                                int v19 = "osBuildStr";
                                                goto LABEL_13;
                                              case 962:
                                                uint64_t v18 = *v8;
                                                int v19 = "raidConfig";
                                                goto LABEL_13;
                                              case 967:
                                                id v20 = "indTrimFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 967;
                                                goto LABEL_153;
                                              case 971:
                                                id v20 = "indUsedFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 971;
                                                goto LABEL_153;
                                              default:
                                                switch(v7)
                                                {
                                                  case 996:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "clogFindFail";
                                                    goto LABEL_14;
                                                  case 997:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "clogFindBlank";
                                                    goto LABEL_14;
                                                  case 998:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "clogFindUnc";
                                                    goto LABEL_14;
                                                  case 999:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "clogFindUnexpected";
                                                    goto LABEL_14;
                                                  case 1001:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1001;
                                                    id v20 = "clogReplayFailReason";
                                                    goto LABEL_23;
                                                  case 1002:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "clogReplayTransientError";
                                                    goto LABEL_14;
                                                  case 1003:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "clogReplaySpfError";
                                                    goto LABEL_14;
                                                  case 1015:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1015;
                                                    id v20 = "eanEarlyBootUeccPage";
                                                    goto LABEL_22;
                                                  case 1016:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "eanEarlyBootNumUeccPages";
                                                    goto LABEL_14;
                                                  case 1017:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "eanEarlyBootUeccMultiplane";
                                                    goto LABEL_14;
                                                  default:
                                                    goto LABEL_696;
                                                }
                                            }
                                          }

                                          if (v7 <= 1137)
                                          {
                                            if (v7 > 1104)
                                            {
                                              if (v7 > 1115)
                                              {
                                                if (v7 == 1116)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1116;
                                                  id v20 = "gcwamp";
LABEL_155:
                                                  id v14 = v8;
                                                  unsigned int v15 = 32;
                                                  goto LABEL_12;
                                                }

                                                if (v7 == 1137)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  int v19 = "numOfToUnhappySwitches";
                                                  goto LABEL_14;
                                                }
                                              }

                                              else
                                              {
                                                if (v7 == 1105)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1105;
                                                  id v20 = "hostReadSequential";
                                                  goto LABEL_703;
                                                }

                                                if (v7 == 1106)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1106;
                                                  id v20 = "GCReadSequential";
LABEL_703:
                                                  id v14 = v8;
                                                  unsigned int v15 = 14;
                                                  goto LABEL_12;
                                                }
                                              }
                                            }

                                            else
                                            {
                                              if (v7 <= 1041)
                                              {
                                                uint64_t v21 = a1;
                                                if (v7 == 1040)
                                                {
                                                  int v22 = 1040;
                                                  id v20 = "bandsAgeBinsV2";
                                                }

                                                else
                                                {
                                                  int v22 = 1041;
                                                  id v20 = "bandsAgeBinsSnapshot";
                                                }

                                                id v14 = v8;
                                                unsigned int v15 = 31;
                                                goto LABEL_12;
                                              }

                                              if (v7 == 1042)
                                              {
                                                uint64_t v21 = a1;
                                                int v22 = 1042;
                                                id v20 = "bandsAgeBinsReadSectors";
                                                id v14 = v8;
                                                unsigned int v15 = 15;
LABEL_12:
                                                sub_100018DB8(v21, v22, v20, v14, v15);
                                                goto LABEL_15;
                                              }

                                              if (v7 == 1080)
                                              {
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                int v19 = "raidForceClogLoad";
                                                goto LABEL_14;
                                              }
                                            }

LABEL_696:
                                            switch(v7)
                                            {
                                              case 1196:
                                                uint64_t v21 = a1;
                                                int v22 = 1196;
                                                id v20 = "poDetectGBBedTotalCost";
                                                goto LABEL_19;
                                              case 1197:
                                                uint64_t v21 = a1;
                                                int v22 = 1197;
                                                id v20 = "poDetectGBBedAge";
                                                goto LABEL_11;
                                              case 1198:
                                                uint64_t v21 = a1;
                                                int v22 = 1198;
                                                id v20 = "poDetectPERemovalMostSevereCost";
                                                goto LABEL_21;
                                              case 1199:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                int v19 = "poDetectCurrentSize";
                                                goto LABEL_14;
                                              case 1200:
                                              case 1203:
                                              case 1204:
                                              case 1205:
                                              case 1206:
                                              case 1207:
                                              case 1208:
                                              case 1209:
                                              case 1210:
                                              case 1212:
                                              case 1213:
                                              case 1214:
                                              case 1219:
                                              case 1220:
                                              case 1221:
                                              case 1222:
                                              case 1223:
                                                break;
                                              case 1201:
                                                uint64_t v21 = a1;
                                                int v22 = 1201;
                                                id v20 = "gcVerticalSuccssfulAlignments";
                                                goto LABEL_22;
                                              case 1202:
                                                uint64_t v21 = a1;
                                                int v22 = 1202;
                                                id v20 = "gcVerticalNoAlignmentDueToMissingSegs";
                                                goto LABEL_22;
                                              case 1211:
                                                uint64_t v21 = a1;
                                                int v22 = 1211;
                                                id v20 = "forcedAllocationSmallEraseQ";
                                                goto LABEL_716;
                                              case 1215:
                                                uint64_t v21 = a1;
                                                int v22 = 1215;
                                                id v20 = "hostWritesPerThrottleZone";
                                                goto LABEL_19;
                                              case 1216:
                                                uint64_t v21 = a1;
                                                int v22 = 1216;
                                                id v20 = "tlcWLPerDipAvgPEC";
                                                goto LABEL_716;
                                              case 1217:
                                                uint64_t v21 = a1;
                                                int v22 = 1217;
                                                id v20 = "tlcWLPerDipMaxPEC";
                                                goto LABEL_716;
                                              case 1218:
                                                uint64_t v21 = a1;
                                                int v22 = 1218;
                                                id v20 = "tlcWLPerDipMinPEC";
                                                goto LABEL_716;
                                              case 1224:
                                                uint64_t v21 = a1;
                                                int v22 = 1224;
                                                id v20 = "apfsValidLbaOvershoot";
                                                id v14 = v8;
                                                unsigned int v15 = 20;
                                                goto LABEL_12;
                                              default:
                                                switch(v7)
                                                {
                                                  case 1232:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "eanFastSize";
                                                    goto LABEL_14;
                                                  case 1233:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "eanNumSlcEvictions";
                                                    goto LABEL_14;
                                                  case 1234:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "eanNumForcedCompress";
                                                    goto LABEL_14;
                                                  case 1235:
                                                  case 1236:
                                                  case 1237:
                                                  case 1238:
                                                  case 1239:
                                                  case 1240:
                                                  case 1242:
                                                  case 1243:
                                                  case 1245:
                                                    goto LABEL_15;
                                                  case 1241:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1241;
                                                    id v20 = "s2rTimeHisto";
                                                    goto LABEL_11;
                                                  case 1244:
                                                    uint64_t v18 = *v8;
                                                    id v16 = (void *)a1;
                                                    int v19 = "calendarTimeWentBackward";
                                                    goto LABEL_14;
                                                  case 1246:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1246;
                                                    id v20 = "bandsUeccCrossTempHisto";
                                                    goto LABEL_23;
                                                  default:
                                                    if (v7 != 1190) {
                                                      goto LABEL_15;
                                                    }
                                                    uint64_t v21 = a1;
                                                    int v22 = 1190;
                                                    id v20 = "powerDownTime";
                                                    break;
                                                }

                                                goto LABEL_153;
                                            }
                                          }

                                          else
                                          {
                                            switch(v7)
                                            {
                                              case 1147:
                                                uint64_t v21 = a1;
                                                int v22 = 1147;
                                                id v20 = "gc_concurrent_dw_gc12";
                                                goto LABEL_716;
                                              case 1148:
                                                uint64_t v21 = a1;
                                                int v22 = 1148;
                                                id v20 = "gc_concurrent_dw_gc1";
                                                goto LABEL_716;
                                              case 1149:
                                                uint64_t v21 = a1;
                                                int v22 = 1149;
                                                id v20 = "gc_concurrent_dw_gc2";
LABEL_716:
                                                id v14 = v8;
                                                unsigned int v15 = 24;
                                                goto LABEL_12;
                                              case 1150:
                                              case 1151:
                                              case 1152:
                                              case 1153:
                                              case 1154:
                                              case 1155:
                                              case 1156:
                                              case 1159:
                                              case 1160:
                                              case 1161:
                                              case 1162:
                                              case 1163:
                                              case 1164:
                                              case 1165:
                                              case 1166:
                                              case 1167:
                                              case 1170:
                                              case 1173:
                                              case 1174:
                                              case 1175:
                                              case 1176:
                                              case 1177:
                                              case 1178:
                                                goto LABEL_696;
                                              case 1157:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                int v19 = "eanMaxForceROTimeMs";
                                                break;
                                              case 1158:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                int v19 = "eanMaxForceRORecoTimeMs";
                                                break;
                                              case 1168:
                                                uint64_t v21 = a1;
                                                int v22 = 1168;
                                                id v20 = "poDetectPERemovalTotalCost";
                                                goto LABEL_20;
                                              case 1169:
                                                uint64_t v21 = a1;
                                                int v22 = 1169;
                                                id v20 = "poDetectEmptySpotRemovalTotalCost";
                                                goto LABEL_20;
                                              case 1171:
                                                uint64_t v21 = a1;
                                                int v22 = 1171;
                                                id v20 = "poDetectEmptySpotRemovalAge";
                                                goto LABEL_11;
                                              case 1172:
                                                uint64_t v21 = a1;
                                                int v22 = 1172;
                                                id v20 = "poDetectGBBedMostSevereCost";
                                                goto LABEL_21;
                                              case 1179:
                                                uint64_t v21 = a1;
                                                int v22 = 1179;
                                                id v20 = "gc_cur_dw_gc1";
                                                goto LABEL_22;
                                              case 1180:
                                                uint64_t v21 = a1;
                                                int v22 = 1180;
                                                id v20 = "gc_cur_dw_gc2";
                                                goto LABEL_22;
                                              case 1181:
                                                uint64_t v21 = a1;
                                                int v22 = 1181;
                                                id v20 = "gc_cur_dw_gc3";
                                                goto LABEL_22;
                                              case 1182:
                                                uint64_t v21 = a1;
                                                int v22 = 1182;
                                                id v20 = "gc_tot_dw_gc1";
                                                goto LABEL_22;
                                              case 1183:
                                                uint64_t v21 = a1;
                                                int v22 = 1183;
                                                id v20 = "gc_tot_dw_gc2";
                                                goto LABEL_22;
                                              case 1184:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                int v19 = "unhappy_state";
                                                break;
                                              case 1185:
                                                uint64_t v18 = *v8;
                                                id v16 = (void *)a1;
                                                int v19 = "unhappy_level";
                                                break;
                                              default:
                                                if (v7 == 1138)
                                                {
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  int v19 = "numOfToHappySwitches";
                                                }

                                                else
                                                {
                                                  if (v7 != 1189) {
                                                    goto LABEL_696;
                                                  }
                                                  uint64_t v18 = *v8;
                                                  id v16 = (void *)a1;
                                                  int v19 = "lastLbaFormatTime";
                                                }

                                                break;
                                            }

LABEL_15:
                                          a2 = &v8[v10];
                                          unsigned int v6 = v11 - v10;
                                          if (v11 != (_DWORD)v10) {
                                            continue;
                                          }
                                          uint64_t result = 1LL;
                                          break;
                                      }

                                      break;
                                  }

                                  break;
                              }

                              break;
                          }

                          break;
                      }

                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }
    }

    else
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 32) = 0;
    }

    return result;
  }

                                        sub_100014184(v19, a2, a3, a4, a5, a6, a7, a8, v23);
                                        goto LABEL_16;
                                      }

                                      if (v12 <= 1104)
                                      {
                                        if (v12 <= 1041)
                                        {
                                          if (v12 == 1040)
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): (#31) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              id v20 = v14;
                                            }
                                            if ((sub_100023E58(a1, "bandsAgeBinsV2_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): Cannot add 31 elements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          else
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): (#31) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              id v20 = v14;
                                            }
                                            if ((sub_100023E58(a1, "bandsAgeBinsSnapshot_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): Cannot add 31 el"
                                                    "ements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1042)
                                        {
                                          if ((_DWORD)v14 != 15) {
                                            sub_100014184( "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): (#15) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            id v20 = v14;
                                          }
                                          if ((sub_100023E58(a1, "bandsAgeBinsReadSectors_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): Cannot add 15 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1080)
                                        {
                                          if ((sub_100023E58(a1, "raidForceClogLoad", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                          {
                                            int v19 = "ASPFTLParseBufferToCxt: raidForceClogLoad(1080) cannot add 1 element to context";
                                            goto LABEL_15;
                                          }

uint64_t sub_100018DB8(uint64_t result, int a2, const char *a3, uint64_t *a4, unsigned int a5)
{
  int v7 = (void *)result;
  uint64_t v8 = *a4;
  if (a2 <= 44)
  {
    switch(a2)
    {
      case 4:
        *(void *)(result + 72) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
        goto LABEL_41;
      case 7:
        *(void *)(result + 64) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 12:
        *(void *)(result + 144) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 13:
        *(void *)(result + 152) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 17:
        *(void *)(result + 8_Block_object_dispose(va, 8) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 18:
        *(void *)(result + 104) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 19:
        *(void *)(result + 96) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 20:
        *(void *)(result + 112) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      default:
        if (a2 != 28) {
          goto LABEL_41;
        }
        *(void *)(result + 16_Block_object_dispose(va, 8) = v8;
        if (!a5) {
          return result;
        }
        goto LABEL_42;
    }
  }

  switch(a2)
  {
    case '-':
      *(void *)(result + 176) = v8;
      if (a5) {
        goto LABEL_42;
      }
      return result;
    case '.':
    case '/':
    case '6':
    case '7':
      goto LABEL_41;
    case '0':
      *(void *)(result + 80) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '1':
      *(_DWORD *)(result + 56) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '2':
      *(_DWORD *)(result + 52) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '3':
      *(_DWORD *)(result + 4_Block_object_dispose(va, 8) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '4':
      *(_DWORD *)(result + 44) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '5':
      *(_DWORD *)(result + 32) = v8;
      goto LABEL_41;
    case '8':
      *(void *)(result + 160) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    default:
      if (a2 != 265) {
        goto LABEL_41;
      }
      if (a5)
      {
        uint64_t v9 = a5;
        unint64_t v10 = (void *)(result + 184);
        unsigned int v11 = a4;
        do
        {
          uint64_t v12 = *v11++;
          *v10++ = v12;
          --v9;
        }

        while (v9);
LABEL_41:
        if (a5)
        {
LABEL_42:
          if (a5 == 1)
          {
            return sub_10002AA48((void *)result, "", a3, v8);
          }

          else
          {
            uint64_t v13 = 0LL;
            uint64_t v14 = a5;
            do
            {
              snprintf(__str, 0x64uLL, "%d", v13);
              __str[100] = 0;
              uint64_t result = sub_10002AA48(v7, a3, __str, a4[v13++]);
            }

            while (v14 != v13);
          }
        }
      }

      return result;
  }

double sub_100019000(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)v2[14];
      free(v2);
      int v2 = v3;
    }

    while (v3);
  }

  int v4 = *(void **)(a1 + 16);
  if (v4)
  {
    do
    {
      io_object_t v5 = (void *)v4[14];
      free(v4);
      int v4 = v5;
    }

    while (v5);
  }

  double result = 0.0;
  *(_OWORD *)(a1 + 20_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_100019070( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unint64_t *)a2;
  uint64_t v10 = 0LL;
  unsigned int v11 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v25 = 0u;
  do
  {
LABEL_2:
    if (!v11) {
      return v10;
    }
    unint64_t v13 = *v8++;
    int v12 = v13;
    unint64_t v14 = HIDWORD(v13);
    --v11;
  }

  while (!HIDWORD(v13));
  uint64_t v17 = (v12 - 1);
  if (v17 <= 0x47) {
    __asm { BR              X9 }
  }

  uint64_t v18 = (v12 - 73);
  if (v18 <= 0x46) {
    __asm { BR              X9 }
  }

  switch(v12)
  {
    case 144:
      int v19 = "ASPFTLParseBufferToCxt: numMemExtreme(144) cannot add 1 element to context";
      goto LABEL_15;
    case 145:
      int v19 = "ASPFTLParseBufferToCxt: maxMemExtremeDuration(145) cannot add 1 element to context";
      goto LABEL_15;
    case 146:
      int v19 = "ASPFTLParseBufferToCxt: memExtremeDuration(146) cannot add 1 element to context";
      goto LABEL_15;
    case 147:
      int v19 = "ASPFTLParseBufferToCxt: bandGetsExtreme(147) cannot add 1 element to context";
      goto LABEL_15;
    case 148:
      int v19 = "ASPFTLParseBufferToCxt: bandGetsLow(148) cannot add 1 element to context";
      goto LABEL_15;
    case 149:
      int v19 = "ASPFTLParseBufferToCxt: numHostChoke(149) cannot add 1 element to context";
      goto LABEL_15;
    case 152:
      int v19 = "ASPFTLParseBufferToCxt: AbortSkip_ProgramError(152) cannot add 1 element to context";
      goto LABEL_15;
    case 153:
      int v19 = "ASPFTLParseBufferToCxt: AbortSkip_ReadErrorOpenBand(153) cannot add 1 element to context";
      goto LABEL_15;
    case 154:
      int v19 = "ASPFTLParseBufferToCxt: AbortSkip_FailedRebuildingParity(154) cannot add 1 element to context";
      goto LABEL_15;
    case 155:
      int v19 = "ASPFTLParseBufferToCxt: AbortPad_OpenRefreshBand(155) cannot add 1 element to context";
      goto LABEL_15;
    case 156:
      int v19 = "ASPFTLParseBufferToCxt: AbortPad_CloseBands(156) cannot add 1 element to context";
      goto LABEL_15;
    case 157:
      int v19 = "ASPFTLParseBufferToCxt: AbortPad_SetPhoto(157) cannot add 1 element to context";
      goto LABEL_15;
    case 158:
      int v19 = "ASPFTLParseBufferToCxt: AbortPad_GcNoSource(158) cannot add 1 element to context";
      goto LABEL_15;
    case 159:
      int v19 = "ASPFTLParseBufferToCxt: AbortPad_Format(159) cannot add 1 element to context";
      goto LABEL_15;
    case 160:
      int v19 = "ASPFTLParseBufferToCxt: nandDiscoveryDuration(160) cannot add 1 element to context";
      goto LABEL_15;
    case 161:
      int v19 = "ASPFTLParseBufferToCxt: coreCCEnableDuration(161) cannot add 1 element to context";
      goto LABEL_15;
    case 163:
      int v19 = "ASPFTLParseBufferToCxt: coreOpenDuration(163) cannot add 1 element to context";
      goto LABEL_15;
    case 164:
      int v19 = "ASPFTLParseBufferToCxt: coreWritableDuration(164) cannot add 1 element to context";
      goto LABEL_15;
    case 165:
      int v19 = "ASPFTLParseBufferToCxt: coreClogLoadDuration(165) cannot add 1 element to context";
      goto LABEL_15;
    case 167:
      int v19 = "ASPFTLParseBufferToCxt: bulkPFail(167) cannot add 1 element to context";
      goto LABEL_15;
    case 169:
      int v19 = "ASPFTLParseBufferToCxt: bulkRFail(169) cannot add 1 element to context";
      goto LABEL_15;
    case 172:
      int v19 = "ASPFTLParseBufferToCxt: raidSmartErrors(172) cannot add 1 element to context";
      goto LABEL_15;
    case 182:
      int v19 = "ASPFTLParseBufferToCxt: internalUeccs(182) cannot add 1 element to context";
      goto LABEL_15;
    case 183:
      int v19 = "ASPFTLParseBufferToCxt: e2eFail(183) cannot add 1 element to context";
      goto LABEL_15;
    case 184:
      int v19 = "ASPFTLParseBufferToCxt: TempSensorMax(184) cannot add 1 element to context";
      goto LABEL_15;
    case 185:
      int v19 = "ASPFTLParseBufferToCxt: TempSensorMin(185) cannot add 1 element to context";
      goto LABEL_15;
    case 186:
      int v19 = "ASPFTLParseBufferToCxt: powerUpFromDDR(186) cannot add 1 element to context";
      goto LABEL_15;
    case 187:
      int v19 = "ASPFTLParseBufferToCxt: numMemLow(187) cannot add 1 element to context";
      goto LABEL_15;
    case 188:
      int v19 = "ASPFTLParseBufferToCxt: maxMemLowDuration(188) cannot add 1 element to context";
      goto LABEL_15;
    case 189:
      int v19 = "ASPFTLParseBufferToCxt: memLowDuration(189) cannot add 1 element to context";
      goto LABEL_15;
    case 190:
      int v19 = "ASPFTLParseBufferToCxt: numFences(190) cannot add 1 element to context";
      goto LABEL_15;
    case 191:
      int v19 = "ASPFTLParseBufferToCxt: hostPassiveIO(191) cannot add 1 element to context";
      goto LABEL_15;
    case 192:
      int v19 = "ASPFTLParseBufferToCxt: odtsMax(192) cannot add 1 element to context";
      goto LABEL_15;
    case 193:
      int v19 = "ASPFTLParseBufferToCxt: defragMFromOrphans(193) cannot add 1 element to context";
      goto LABEL_15;
    case 194:
      int v19 = "ASPFTLParseBufferToCxt: defragMFromFragments(194) cannot add 1 element to context";
      goto LABEL_15;
    case 195:
      int v19 = "ASPFTLParseBufferToCxt: defragMTime(195) cannot add 1 element to context";
      goto LABEL_15;
    case 196:
      int v19 = "ASPFTLParseBufferToCxt: defragMMaxTime(196) cannot add 1 element to context";
      goto LABEL_15;
    case 197:
      int v19 = "ASPFTLParseBufferToCxt: raidFailedLbaMismatch(197) cannot add 1 element to context";
      goto LABEL_15;
    case 198:
      int v19 = "ASPFTLParseBufferToCxt: numSyscfgWrites(198) cannot add 1 element to context";
      goto LABEL_15;
    case 199:
      int v19 = "ASPFTLParseBufferToCxt: indmbUnitsXfer(199) cannot add 1 element to context";
      goto LABEL_15;
    case 200:
      int v19 = "ASPFTLParseBufferToCxt: indmbUnitsCache(200) cannot add 1 element to context";
      goto LABEL_15;
    case 201:
      int v19 = "ASPFTLParseBufferToCxt: indmbUnitsInd(201) cannot add 1 element to context";
      goto LABEL_15;
    case 202:
      int v19 = "ASPFTLParseBufferToCxt: wcacheFS_Mbytes(202) cannot add 1 element to context";
      goto LABEL_15;
    case 203:
      int v19 = "ASPFTLParseBufferToCxt: wcacheDS_Mbytes(203) cannot add 1 element to context";
      goto LABEL_15;
    case 204:
      int v19 = "ASPFTLParseBufferToCxt: powerOnSeconds(204) cannot add 1 element to context";
      goto LABEL_15;
    case 205:
      int v19 = "ASPFTLParseBufferToCxt: numUnknownTokenHostRead(205) cannot add 1 element to context";
      goto LABEL_15;
    case 206:
      int v19 = "ASPFTLParseBufferToCxt: numUnmmapedTokenHostRead(206) cannot add 1 element to context";
      goto LABEL_15;
    case 207:
      if ((_DWORD)v14 != 16) {
        sub_100014184( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): Cannot add 16 elements to context";
      goto LABEL_2247;
    case 208:
      int v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMin(208) cannot add 1 element to context";
      goto LABEL_15;
    case 209:
      int v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMax(209) cannot add 1 element to context";
      goto LABEL_15;
    case 210:
      int v19 = "ASPFTLParseBufferToCxt: prepareForShutdownFailCounter(210) cannot add 1 element to context";
      goto LABEL_15;
    case 211:
      int v19 = "ASPFTLParseBufferToCxt: lpsrEntry(211) cannot add 1 element to context";
      goto LABEL_15;
    case 212:
      int v19 = "ASPFTLParseBufferToCxt: lpsrExit(212) cannot add 1 element to context";
      goto LABEL_15;
    case 213:
      if ((_DWORD)v14 != 8) {
        sub_100014184( "ASPFTLParseBufferToCxt: crcInternalReadFail(213): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: crcInternalReadFail(213): Cannot add 8 elements to context";
      goto LABEL_2247;
    case 214:
      int v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictCnt(214) cannot add 1 element to context";
      goto LABEL_15;
    case 215:
      int v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictSize(215) cannot add 1 element to context";
      goto LABEL_15;
    case 216:
      int v19 = "ASPFTLParseBufferToCxt: wcacheFSWr(216) cannot add 1 element to context";
      goto LABEL_15;
    case 217:
      int v19 = "ASPFTLParseBufferToCxt: wcacheDSWr(217) cannot add 1 element to context";
      goto LABEL_15;
    case 218:
      if ((_DWORD)v14 != 10) {
        sub_100014184( "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): Cannot add 10 elements to context";
      goto LABEL_2247;
    case 219:
      int v19 = "ASPFTLParseBufferToCxt: prepareForShutdownTimeoutCounter(219) cannot add 1 element to context";
      goto LABEL_15;
    case 220:
      int v19 = "ASPFTLParseBufferToCxt: prepareForShutdownCancelCounter(220) cannot add 1 element to context";
      goto LABEL_15;
    case 221:
      int v19 = "ASPFTLParseBufferToCxt: RD_openBandCount(221) cannot add 1 element to context";
      goto LABEL_15;
    case 222:
      int v19 = "ASPFTLParseBufferToCxt: RD_openBandNops(222) cannot add 1 element to context";
      goto LABEL_15;
    case 223:
      int v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictCount(223) cannot add 1 element to context";
      goto LABEL_15;
    default:
      switch(v12)
      {
        case 224:
          int v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictSectors(224) cannot add 1 element to context";
          goto LABEL_15;
        case 225:
          int v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentCount(225) cannot add 1 element to context";
          goto LABEL_15;
        case 226:
          int v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentSectors(226) cannot add 1 element to context";
          goto LABEL_15;
        case 227:
          if ((_DWORD)v14 != 10) {
            sub_100014184( "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): Cannot add 10 elements to context";
          goto LABEL_2247;
        case 228:
          if ((_DWORD)v14 != 4) {
            sub_100014184( "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 229:
          if ((_DWORD)v14 != 2) {
            sub_100014184( "ASPFTLParseBufferToCxt: indmbXferCountTo(229): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbXferCountTo(229): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 230:
          if ((_DWORD)v14 != 2) {
            sub_100014184( "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 231:
          int v19 = "ASPFTLParseBufferToCxt: maxGracefulBootTimeMs(231) cannot add 1 element to context";
          goto LABEL_15;
        case 232:
          int v19 = "ASPFTLParseBufferToCxt: maxUngracefulBootTimeMs(232) cannot add 1 element to context";
          goto LABEL_15;
        case 233:
          int v19 = "ASPFTLParseBufferToCxt: averageGracefulBootTimeMs(233) cannot add 1 element to context";
          goto LABEL_15;
        case 234:
          int v19 = "ASPFTLParseBufferToCxt: averageUngracefulBootTimeMs(234) cannot add 1 element to context";
          goto LABEL_15;
        case 235:
          if ((_DWORD)v14 != 8) {
            sub_100014184( "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 236:
          if ((_DWORD)v14 != 8) {
            sub_100014184( "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 237:
          if ((_DWORD)v14 != 4) {
            sub_100014184( "ASPFTLParseBufferToCxt: CalibrationCount(237): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: CalibrationCount(237): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 238:
          int v19 = "ASPFTLParseBufferToCxt: CalibrationLastTmp(238) cannot add 1 element to context";
          goto LABEL_15;
        case 239:
          int v19 = "ASPFTLParseBufferToCxt: CalibrationMaxTmp(239) cannot add 1 element to context";
          goto LABEL_15;
        case 240:
          int v19 = "ASPFTLParseBufferToCxt: CalibrationMinTmp(240) cannot add 1 element to context";
          goto LABEL_15;
        case 241:
          int v19 = "ASPFTLParseBufferToCxt: ungracefulBootWorstIndicator(241) cannot add 1 element to context";
          goto LABEL_15;
        case 242:
          int v19 = "ASPFTLParseBufferToCxt: metaMismatchReread(242) cannot add 1 element to context";
          goto LABEL_15;
        case 243:
          int v19 = "ASPFTLParseBufferToCxt: numS3SleepOps(243) cannot add 1 element to context";
          goto LABEL_15;
        case 244:
          int v19 = "ASPFTLParseBufferToCxt: odtsCurrent(244) cannot add 1 element to context";
          goto LABEL_15;
        case 245:
          int v19 = "ASPFTLParseBufferToCxt: prefetchReads(245) cannot add 1 element to context";
          goto LABEL_15;
        case 246:
          int v19 = "ASPFTLParseBufferToCxt: prefetchHits(246) cannot add 1 element to context";
          goto LABEL_15;
        case 247:
          int v19 = "ASPFTLParseBufferToCxt: prefetchWritesInvalidation(247) cannot add 1 element to context";
          goto LABEL_15;
        case 248:
          int v19 = "ASPFTLParseBufferToCxt: indmbUnitsTotal(248) cannot add 1 element to context";
          goto LABEL_15;
        case 249:
          int v19 = "ASPFTLParseBufferToCxt: selfThrottlingEngage(249) cannot add 1 element to context";
          goto LABEL_15;
        case 250:
          int v19 = "ASPFTLParseBufferToCxt: selfThrottlingDisengage(250) cannot add 1 element to context";
          goto LABEL_15;
        case 252:
          int v19 = "ASPFTLParseBufferToCxt: AbortSkip_WlpMode(252) cannot add 1 element to context";
          goto LABEL_15;
        case 253:
          int v19 = "ASPFTLParseBufferToCxt: hostWritesWlpMode(253) cannot add 1 element to context";
          goto LABEL_15;
        case 254:
          int v19 = "ASPFTLParseBufferToCxt: numClogDoubleUnc(254) cannot add 1 element to context";
          goto LABEL_15;
        case 256:
          int v19 = "ASPFTLParseBufferToCxt: AbortPad_WlpMode(256) cannot add 1 element to context";
          goto LABEL_15;
        case 257:
          int v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandErases(257) cannot add 1 element to context";
          goto LABEL_15;
        case 258:
          int v19 = "ASPFTLParseBufferToCxt: bonfireUserBandErases(258) cannot add 1 element to context";
          goto LABEL_15;
        case 259:
          int v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandProgs(259) cannot add 1 element to context";
          goto LABEL_15;
        case 260:
          int v19 = "ASPFTLParseBufferToCxt: bonfireUserBandProgs(260) cannot add 1 element to context";
          goto LABEL_15;
        case 261:
          int v19 = "ASPFTLParseBufferToCxt: bonfireIntermediatePageReads(261) cannot add 1 element to context";
          goto LABEL_15;
        case 262:
          int v19 = "ASPFTLParseBufferToCxt: bonfireUserPageReads(262) cannot add 1 element to context";
          goto LABEL_15;
        case 263:
          int v19 = "ASPFTLParseBufferToCxt: refreshUtil00(263) cannot add 1 element to context";
          goto LABEL_15;
        case 264:
          int v19 = "ASPFTLParseBufferToCxt: failToReadUtil00(264) cannot add 1 element to context";
          goto LABEL_15;
        case 265:
          if ((_DWORD)v14 != 5) {
            sub_100014184( "ASPFTLParseBufferToCxt: readCountHisto(265): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readCountHisto(265): Cannot add 5 elements to context";
          goto LABEL_2247;
        case 266:
          if ((_DWORD)v14 != 16) {
            sub_100014184( "ASPFTLParseBufferToCxt: readAmpHisto(266): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readAmpHisto(266): Cannot add 16 elements to context";
          goto LABEL_2247;
        case 267:
          int v19 = "ASPFTLParseBufferToCxt: totalReadAmp(267) cannot add 1 element to context";
          goto LABEL_15;
        case 268:
          if ((_DWORD)v14 != 4) {
            sub_100014184( "ASPFTLParseBufferToCxt: nvmeModeSelect(268): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: nvmeModeSelect(268): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 269:
          if ((_DWORD)v14 != 8) {
            sub_100014184( "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 270:
          if ((_DWORD)v14 != 8) {
            sub_100014184( "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 271:
          int v19 = "ASPFTLParseBufferToCxt: numUnsupportedAsi(271) cannot add 1 element to context";
          goto LABEL_15;
        case 272:
          int v19 = "ASPFTLParseBufferToCxt: NumTerminatedProgramSegs(272) cannot add 1 element to context";
          goto LABEL_15;
        case 273:
          int v19 = "ASPFTLParseBufferToCxt: indParityPagesDrops(273) cannot add 1 element to context";
          goto LABEL_15;
        case 274:
          int v19 = "ASPFTLParseBufferToCxt: indFlowPrograms(274) cannot add 1 element to context";
          goto LABEL_15;
        case 277:
          if ((_DWORD)v14 != 4) {
            sub_100014184( "ASPFTLParseBufferToCxt: powerBudgetSelect(277): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: powerBudgetSelect(277): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 279:
          int v19 = "ASPFTLParseBufferToCxt: RxBurnNandWrites(279) cannot add 1 element to context";
          goto LABEL_15;
        case 280:
          if ((_DWORD)v14 != 12) {
            sub_100014184( "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): Cannot add 12 elements to context";
          goto LABEL_2247;
        case 281:
          int v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMax(281) cannot add 1 element to context";
          goto LABEL_15;
        case 282:
          int v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMin(282) cannot add 1 element to context";
          goto LABEL_15;
        case 283:
          int v19 = "ASPFTLParseBufferToCxt: wcacheSectorsCur(283) cannot add 1 element to context";
          goto LABEL_15;
        case 284:
          int v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMax(284) cannot add 1 element to context";
          goto LABEL_15;
        case 285:
          int v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMin(285) cannot add 1 element to context";
          goto LABEL_15;
        case 286:
          int v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsCur(286) cannot add 1 element to context";
          goto LABEL_15;
        case 287:
          int v19 = "ASPFTLParseBufferToCxt: wcacheFS_Reads(287) cannot add 1 element to context";
          goto LABEL_15;
        case 288:
          int v19 = "ASPFTLParseBufferToCxt: wcacheDS_Reads(288) cannot add 1 element to context";
          goto LABEL_15;
        case 289:
          if ((_DWORD)v14 != 32) {
            sub_100014184( "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 290:
          if ((_DWORD)v14 != 32) {
            sub_100014184( "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 291:
          if ((_DWORD)v14 != 32) {
            sub_100014184( "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 292:
          int v19 = "ASPFTLParseBufferToCxt: bandsRefreshedOnError(292) cannot add 1 element to context";
          goto LABEL_15;
        default:
          switch(v12)
          {
            case 298:
              if ((_DWORD)v14 != 2) {
                sub_100014184( "ASPFTLParseBufferToCxt: perHostReads(298): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReads(298): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 299:
              if ((_DWORD)v14 != 2) {
                sub_100014184( "ASPFTLParseBufferToCxt: perHostReadXacts(299): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReadXacts(299): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 300:
              if ((_DWORD)v14 != 2) {
                sub_100014184( "ASPFTLParseBufferToCxt: perHostWrites(300): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWrites(300): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 301:
              if ((_DWORD)v14 != 2) {
                sub_100014184( "ASPFTLParseBufferToCxt: perHostWriteXacts(301): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWriteXacts(301): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 302:
              if ((_DWORD)v14 != 2) {
                sub_100014184( "ASPFTLParseBufferToCxt: perHostNumFlushes(302): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFlushes(302): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 303:
              if ((_DWORD)v14 != 2) {
                sub_100014184( "ASPFTLParseBufferToCxt: perHostNumFences(303): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFences(303): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 304:
              if ((_DWORD)v14 != 10) {
                sub_100014184( "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 305:
              if ((_DWORD)v14 != 10) {
                sub_100014184( "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 306:
              if ((_DWORD)v14 != 4) {
                sub_100014184( "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 307:
              if ((_DWORD)v14 != 10) {
                sub_100014184( "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 308:
              int v19 = "ASPFTLParseBufferToCxt: utilNumVerification(308) cannot add 1 element to context";
              goto LABEL_15;
            case 309:
              int v19 = "ASPFTLParseBufferToCxt: utilRefreshes(309) cannot add 1 element to context";
              goto LABEL_15;
            case 310:
              int v19 = "ASPFTLParseBufferToCxt: utilBDRErrors(310) cannot add 1 element to context";
              goto LABEL_15;
            case 311:
              int v19 = "ASPFTLParseBufferToCxt: indBandsPerFlow(311) cannot add 1 element to context";
              goto LABEL_15;
            case 312:
              int v19 = "ASPFTLParseBufferToCxt: secsPerIndFlow(312) cannot add 1 element to context";
              goto LABEL_15;
            case 313:
              int v19 = "ASPFTLParseBufferToCxt: indDecodedECC(313) cannot add 1 element to context";
              goto LABEL_15;
            case 314:
              if ((_DWORD)v14 != 8) {
                sub_100014184( "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 315:
              if ((_DWORD)v14 != 8) {
                sub_100014184( "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 316:
              if ((_DWORD)v14 != 4) {
                sub_100014184( "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 317:
              int v19 = "ASPFTLParseBufferToCxt: bdrCalTimeAccFactor(317) cannot add 1 element to context";
              goto LABEL_15;
            case 318:
              int v19 = "ASPFTLParseBufferToCxt: bootChainRdError(318) cannot add 1 element to context";
              goto LABEL_15;
            case 319:
              int v19 = "ASPFTLParseBufferToCxt: bootChainBlankError(319) cannot add 1 element to context";
              goto LABEL_15;
            case 320:
              int v19 = "ASPFTLParseBufferToCxt: bootChainRefreshError(320) cannot add 1 element to context";
              goto LABEL_15;
            case 321:
              int v19 = "ASPFTLParseBufferToCxt: bootChainVersionError(321) cannot add 1 element to context";
              goto LABEL_15;
            case 322:
              int v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatch(322) cannot add 1 element to context";
              goto LABEL_15;
            case 323:
              int v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatchErr(323) cannot add 1 element to context";
              goto LABEL_15;
            case 324:
              if ((_DWORD)v14 != 5) {
                sub_100014184( "ASPFTLParseBufferToCxt: bitflipAddr(324): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipAddr(324): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 325:
              if ((_DWORD)v14 != 5) {
                sub_100014184( "ASPFTLParseBufferToCxt: bitflipCount(325): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipCount(325): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 326:
              if ((_DWORD)v14 != 5) {
                sub_100014184( "ASPFTLParseBufferToCxt: bitflipDupes(326): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipDupes(326): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 327:
              if ((_DWORD)v14 != 30) {
                sub_100014184( "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 328:
              if ((_DWORD)v14 != 30) {
                sub_100014184( "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 329:
              if ((_DWORD)v14 != 30) {
                sub_100014184( "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 330:
              if ((_DWORD)v14 != 22) {
                sub_100014184( "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): (#22) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): Cannot add 22 elements to context";
              goto LABEL_2247;
            case 331:
              if ((_DWORD)v14 != 45) {
                sub_100014184( "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): (#45) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): Cannot add 45 elements to context";
              goto LABEL_2247;
            case 332:
              if ((_DWORD)v14 != 10) {
                sub_100014184( "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 333:
              if ((_DWORD)v14 != 10) {
                sub_100014184( "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 334:
              int v19 = "ASPFTLParseBufferToCxt: numFirmwareWrites(334) cannot add 1 element to context";
              goto LABEL_15;
            case 335:
              int v19 = "ASPFTLParseBufferToCxt: numBisWrites(335) cannot add 1 element to context";
              goto LABEL_15;
            case 336:
              int v19 = "ASPFTLParseBufferToCxt: numBootChainUpdates(336) cannot add 1 element to context";
              goto LABEL_15;
            case 337:
              int v19 = "ASPFTLParseBufferToCxt: cntCalTimeWentBackWard(337) cannot add 1 element to context";
              goto LABEL_15;
            case 338:
              int v19 = "ASPFTLParseBufferToCxt: indBoRecoveries(338) cannot add 1 element to context";
              goto LABEL_15;
            case 340:
              int v19 = "ASPFTLParseBufferToCxt: numCrossTempUecc(340) cannot add 1 element to context";
              goto LABEL_15;
            case 341:
              int v19 = "ASPFTLParseBufferToCxt: latencyMonitorError(341) cannot add 1 element to context";
              goto LABEL_15;
            case 343:
              int v19 = "ASPFTLParseBufferToCxt: utilUeccReads(343) cannot add 1 element to context";
              goto LABEL_15;
            case 344:
              int v19 = "ASPFTLParseBufferToCxt: numOfAvoidedGCDueToTemp(344) cannot add 1 element to context";
              goto LABEL_15;
            case 345:
              int v19 = "ASPFTLParseBufferToCxt: forceShutdowns(345) cannot add 1 element to context";
              goto LABEL_15;
            case 346:
              int v19 = "ASPFTLParseBufferToCxt: gcSlcDestinations(346) cannot add 1 element to context";
              goto LABEL_15;
            case 347:
              int v19 = "ASPFTLParseBufferToCxt: indReplayExtUsed(347) cannot add 1 element to context";
              goto LABEL_15;
            case 348:
              int v19 = "ASPFTLParseBufferToCxt: defectsPerPackageOverflow(348) cannot add 1 element to context";
              goto LABEL_15;
            case 349:
              int v19 = "ASPFTLParseBufferToCxt: RxBurnIntBandsProgrammed(349) cannot add 1 element to context";
              goto LABEL_15;
            case 350:
              int v19 = "ASPFTLParseBufferToCxt: RxBurnUsrBandsProgrammed(350) cannot add 1 element to context";
              goto LABEL_15;
            case 351:
              int v19 = "ASPFTLParseBufferToCxt: RxBurnIntNandWrites(351) cannot add 1 element to context";
              goto LABEL_15;
            case 352:
              int v19 = "ASPFTLParseBufferToCxt: RxBurnUsrNandWrites(352) cannot add 1 element to context";
              goto LABEL_15;
            case 353:
              int v19 = "ASPFTLParseBufferToCxt: clogLastStripeUeccs(353) cannot add 1 element to context";
              goto LABEL_15;
            case 354:
              int v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchSLC2TLC(354) cannot add 1 element to context";
              goto LABEL_15;
            case 355:
              int v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchTLC2SLC(355) cannot add 1 element to context";
              goto LABEL_15;
            case 356:
              int v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_normal(356) cannot add 1 element to context";
              goto LABEL_15;
            case 357:
              int v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_normal(357) cannot add 1 element to context";
              goto LABEL_15;
            case 358:
              int v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_s2r(358) cannot add 1 element to context";
              goto LABEL_15;
            case 359:
              int v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_s2r(359) cannot add 1 element to context";
              goto LABEL_15;
            case 360:
              if ((_DWORD)v14 != 16) {
                sub_100014184( "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 361:
              if ((_DWORD)v14 != 16) {
                sub_100014184( "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 362:
              int v19 = "ASPFTLParseBufferToCxt: raidFailedReadParity(362) cannot add 1 element to context";
              goto LABEL_15;
            case 364:
              int v19 = "ASPFTLParseBufferToCxt: lhotNumSkipes(364) cannot add 1 element to context";
              goto LABEL_15;
            default:
              switch(v12)
              {
                case 365:
                  int v19 = "ASPFTLParseBufferToCxt: lhotNumIsHotCalls(365) cannot add 1 element to context";
                  goto LABEL_15;
                case 366:
                  int v19 = "ASPFTLParseBufferToCxt: lhotFullLap(366) cannot add 1 element to context";
                  goto LABEL_15;
                case 367:
                  int v19 = "ASPFTLParseBufferToCxt: lhotSkipPrecent(367) cannot add 1 element to context";
                  goto LABEL_15;
                case 368:
                  int v19 = "ASPFTLParseBufferToCxt: eraseSuspendEvents(368) cannot add 1 element to context";
                  goto LABEL_15;
                case 369:
                  int v19 = "ASPFTLParseBufferToCxt: eraseSuspendedStatuses(369) cannot add 1 element to context";
                  goto LABEL_15;
                case 370:
                  int v19 = "ASPFTLParseBufferToCxt: eraseSuspendedBands(370) cannot add 1 element to context";
                  goto LABEL_15;
                case 371:
                  int v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsBelowThreshold(371) cannot add 1 element to context";
                  goto LABEL_15;
                case 372:
                  int v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsAboveThreshold(372) cannot add 1 element to context";
                  goto LABEL_15;
                case 373:
                  int v19 = "ASPFTLParseBufferToCxt: eraseSuspendReadChainsProcessed(373) cannot add 1 element to context";
                  goto LABEL_15;
                case 374:
                  int v19 = "ASPFTLParseBufferToCxt: bdrLastDoneHr(374) cannot add 1 element to context";
                  goto LABEL_15;
                case 375:
                  int v19 = "ASPFTLParseBufferToCxt: bdrBackupThreshHrs(375) cannot add 1 element to context";
                  goto LABEL_15;
                case 376:
                  int v19 = "ASPFTLParseBufferToCxt: clogPortableProgBufs(376) cannot add 1 element to context";
                  goto LABEL_15;
                case 377:
                  int v19 = "ASPFTLParseBufferToCxt: clogPortableDropBufs(377) cannot add 1 element to context";
                  goto LABEL_15;
                case 378:
                  int v19 = "ASPFTLParseBufferToCxt: clogPortablePadSectors(378) cannot add 1 element to context";
                  goto LABEL_15;
                case 379:
                  int v19 = "ASPFTLParseBufferToCxt: numRetiredBlocks(379) cannot add 1 element to context";
                  goto LABEL_15;
                case 381:
                  int v19 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshPerf(381) cannot add 1 element to context";
                  goto LABEL_15;
                case 382:
                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructReads(382) cannot add 1 element to context";
                  goto LABEL_15;
                case 383:
                  int v19 = "ASPFTLParseBufferToCxt: gcReadsNoBlog(383) cannot add 1 element to context";
                  goto LABEL_15;
                case 384:
                  int v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyClosedBand(384) cannot add 1 element to context";
                  goto LABEL_15;
                case 385:
                  int v19 = "ASPFTLParseBufferToCxt: openBandReadFail(385) cannot add 1 element to context";
                  goto LABEL_15;
                case 386:
                  int v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyOpenBand(386) cannot add 1 element to context";
                  goto LABEL_15;
                case 387:
                  int v19 = "ASPFTLParseBufferToCxt: AbortSkip_MBPXFailedRebuildingParity(387) cannot add 1 element to context";
                  goto LABEL_15;
                case 388:
                  int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionInternal(388) cannot add 1 element to context";
                  goto LABEL_15;
                case 389:
                  int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionHost(389) cannot add 1 element to context";
                  goto LABEL_15;
                case 390:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionInternal(390) cannot add 1 element to context";
                  goto LABEL_15;
                case 391:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionHost(391) cannot add 1 element to context";
                  goto LABEL_15;
                case 392:
                  int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionInternal(392) cannot add 1 element to context";
                  goto LABEL_15;
                case 393:
                  int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionHost(393) cannot add 1 element to context";
                  goto LABEL_15;
                case 394:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionInternal(394) cannot add 1 element to context";
                  goto LABEL_15;
                case 395:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionHost(395) cannot add 1 element to context";
                  goto LABEL_15;
                case 396:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedReadParityInternal(396) cannot add 1 element to context";
                  goto LABEL_15;
                case 397:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParityInternal(397) cannot add 1 element to context";
                  goto LABEL_15;
                case 398:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParity(398) cannot add 1 element to context";
                  goto LABEL_15;
                case 399:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopy(399) cannot add 1 element to context";
                  goto LABEL_15;
                case 400:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedReconstructionQParity(400) cannot add 1 element to context";
                  goto LABEL_15;
                case 401:
                  int v19 = "ASPFTLParseBufferToCxt: offlineBlocksCnt(401) cannot add 1 element to context";
                  goto LABEL_15;
                case 402:
                  int v19 = "ASPFTLParseBufferToCxt: bork0Revectors(402) cannot add 1 element to context";
                  goto LABEL_15;
                case 403:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedReadBlog(403) cannot add 1 element to context";
                  goto LABEL_15;
                case 404:
                  int v19 = "ASPFTLParseBufferToCxt: numReliabilityRefreshes(404) cannot add 1 element to context";
                  goto LABEL_15;
                case 405:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopyInternal(405) cannot add 1 element to context";
                  goto LABEL_15;
                case 406:
                  if ((_DWORD)v14 != 5) {
                    sub_100014184( "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 407:
                  if ((_DWORD)v14 != 5) {
                    sub_100014184( "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 408:
                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailP(408) cannot add 1 element to context";
                  goto LABEL_15;
                case 409:
                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailQ(409) cannot add 1 element to context";
                  goto LABEL_15;
                case 410:
                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUECC(410) cannot add 1 element to context";
                  goto LABEL_15;
                case 411:
                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUnsupp(411) cannot add 1 element to context";
                  goto LABEL_15;
                case 412:
                  int v19 = "ASPFTLParseBufferToCxt: raidUECCOpenBand(412) cannot add 1 element to context";
                  goto LABEL_15;
                case 414:
                  int v19 = "ASPFTLParseBufferToCxt: ueccReads(414) cannot add 1 element to context";
                  goto LABEL_15;
                case 416:
                  int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulVerify(416) cannot add 1 element to context";
                  goto LABEL_15;
                case 417:
                  int v19 = "ASPFTLParseBufferToCxt: raidFailedVerify(417) cannot add 1 element to context";
                  goto LABEL_15;
                case 418:
                  int v19 = "ASPFTLParseBufferToCxt: numBandsVerified(418) cannot add 1 element to context";
                  goto LABEL_15;
                case 419:
                  int v19 = "ASPFTLParseBufferToCxt: cache_heads(419) cannot add 1 element to context";
                  goto LABEL_15;
                case 420:
                  int v19 = "ASPFTLParseBufferToCxt: AbortSkip_RMXtoMPBX(420) cannot add 1 element to context";
                  goto LABEL_15;
                case 421:
                  int v19 = "ASPFTLParseBufferToCxt: s3eFwVer(421) cannot add 1 element to context";
                  goto LABEL_15;
                case 422:
                  int v19 = "ASPFTLParseBufferToCxt: readVerifyNative(422) cannot add 1 element to context";
                  goto LABEL_15;
                case 423:
                  int v19 = "ASPFTLParseBufferToCxt: reducedReadVerifyNative(423) cannot add 1 element to context";
                  goto LABEL_15;
                case 424:
                  int v19 = "ASPFTLParseBufferToCxt: readVerifySlc(424) cannot add 1 element to context";
                  goto LABEL_15;
                case 425:
                  int v19 = "ASPFTLParseBufferToCxt: reducedReadVerifySlc(425) cannot add 1 element to context";
                  goto LABEL_15;
                case 426:
                  int v19 = "ASPFTLParseBufferToCxt: RxBurnEvictions(426) cannot add 1 element to context";
                  goto LABEL_15;
                case 427:
                  int v19 = "ASPFTLParseBufferToCxt: directToTLCBands(427) cannot add 1 element to context";
                  goto LABEL_15;
                case 428:
                  int v19 = "ASPFTLParseBufferToCxt: nandDesc(428) cannot add 1 element to context";
                  goto LABEL_15;
                case 429:
                  int v19 = "ASPFTLParseBufferToCxt: fwUpdatesPercentUsed(429) cannot add 1 element to context";
                  goto LABEL_15;
                case 430:
                  int v19 = "ASPFTLParseBufferToCxt: slcPercentUsed(430) cannot add 1 element to context";
                  goto LABEL_15;
                case 431:
                  int v19 = "ASPFTLParseBufferToCxt: percentUsed(431) cannot add 1 element to context";
                  goto LABEL_15;
                default:
                  switch(v12)
                  {
                    case 432:
                      int v19 = "ASPFTLParseBufferToCxt: hostAutoWrites(432) cannot add 1 element to context";
                      goto LABEL_15;
                    case 433:
                      int v19 = "ASPFTLParseBufferToCxt: hostAutoWriteXacts(433) cannot add 1 element to context";
                      goto LABEL_15;
                    case 434:
                      int v19 = "ASPFTLParseBufferToCxt: gcDestDynamic(434) cannot add 1 element to context";
                      goto LABEL_15;
                    case 435:
                      int v19 = "ASPFTLParseBufferToCxt: gcDestStatic(435) cannot add 1 element to context";
                      goto LABEL_15;
                    case 436:
                      int v19 = "ASPFTLParseBufferToCxt: gcDestWearlevel(436) cannot add 1 element to context";
                      goto LABEL_15;
                    case 437:
                      int v19 = "ASPFTLParseBufferToCxt: gcDestParity(437) cannot add 1 element to context";
                      goto LABEL_15;
                    case 438:
                      int v19 = "ASPFTLParseBufferToCxt: AbortSkip_Format(438) cannot add 1 element to context";
                      goto LABEL_15;
                    case 440:
                      int v19 = "ASPFTLParseBufferToCxt: raidSLCPadding(440) cannot add 1 element to context";
                      goto LABEL_15;
                    case 441:
                      int v19 = "ASPFTLParseBufferToCxt: raidGCBands(441) cannot add 1 element to context";
                      goto LABEL_15;
                    case 442:
                      int v19 = "ASPFTLParseBufferToCxt: raidGCSectors(442) cannot add 1 element to context";
                      goto LABEL_15;
                    case 443:
                      int v19 = "ASPFTLParseBufferToCxt: raidGCPadding(443) cannot add 1 element to context";
                      goto LABEL_15;
                    case 444:
                      int v19 = "ASPFTLParseBufferToCxt: raidSLCBandsPerHostFlow(444) cannot add 1 element to context";
                      goto LABEL_15;
                    case 445:
                      int v19 = "ASPFTLParseBufferToCxt: raidSLCSecsPerHostFlow(445) cannot add 1 element to context";
                      goto LABEL_15;
                    case 446:
                      int v19 = "ASPFTLParseBufferToCxt: rxBurnMinCycleRuns(446) cannot add 1 element to context";
                      goto LABEL_15;
                    case 447:
                      int v19 = "ASPFTLParseBufferToCxt: clogNumFastCxt(447) cannot add 1 element to context";
                      goto LABEL_15;
                    case 448:
                      int v19 = "ASPFTLParseBufferToCxt: clogNumRapidReboots(448) cannot add 1 element to context";
                      goto LABEL_15;
                    case 449:
                      int v19 = "ASPFTLParseBufferToCxt: clogFastCxtAbvThr(449) cannot add 1 element to context";
                      goto LABEL_15;
                    case 450:
                      int v19 = "ASPFTLParseBufferToCxt: rxBurnDiffModeRuns(450) cannot add 1 element to context";
                      goto LABEL_15;
                    case 452:
                      int v19 = "ASPFTLParseBufferToCxt: indReadVerifyFail(452) cannot add 1 element to context";
                      goto LABEL_15;
                    case 453:
                      if ((_DWORD)v14 != 16) {
                        sub_100014184( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 454:
                      if ((_DWORD)v14 != 16) {
                        sub_100014184( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 456:
                      if ((_DWORD)v14 != 10) {
                        sub_100014184( "ASPFTLParseBufferToCxt: slcFifoDepth(456): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: slcFifoDepth(456): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 457:
                      int v19 = "ASPFTLParseBufferToCxt: wcacheSectorsDirtyIdle(457) cannot add 1 element to context";
                      goto LABEL_15;
                    case 458:
                      int v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsDirtyIdle(458) cannot add 1 element to context";
                      goto LABEL_15;
                    case 459:
                      int v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesDirtyIdle(459) cannot add 1 element to context";
                      goto LABEL_15;
                    case 460:
                      if ((_DWORD)v14 != 256) {
                        sub_100014184( "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): (#256) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): Cannot add 256 elements to context";
                      goto LABEL_2247;
                    case 461:
                      int v19 = "ASPFTLParseBufferToCxt: directToTLCSectors(461) cannot add 1 element to context";
                      goto LABEL_15;
                    case 462:
                      int v19 = "ASPFTLParseBufferToCxt: fallbackToWaterfall(462) cannot add 1 element to context";
                      goto LABEL_15;
                    case 463:
                      if ((_DWORD)v14 != 11) {
                        sub_100014184( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): (#11) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): Cannot add 11 elements to context";
                      goto LABEL_2247;
                    case 464:
                      int v19 = "ASPFTLParseBufferToCxt: lockToTlc(464) cannot add 1 element to context";
                      goto LABEL_15;
                    case 465:
                      if ((_DWORD)v14 != 10) {
                        sub_100014184( "ASPFTLParseBufferToCxt: burstSizeHistogram(465): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: burstSizeHistogram(465): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 466:
                      if ((_DWORD)v14 != 64) {
                        sub_100014184( "ASPFTLParseBufferToCxt: qosDirectToTLC(466): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: qosDirectToTLC(466): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 467:
                      if ((_DWORD)v14 != 4) {
                        sub_100014184( "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): Cannot add 4 elements to context";
                      goto LABEL_2247;
                    case 468:
                      if ((_DWORD)v14 != 16) {
                        sub_100014184( "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 469:
                      if ((_DWORD)v14 != 2) {
                        sub_100014184( "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 470:
                      if ((_DWORD)v14 != 2) {
                        sub_100014184( "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 471:
                      int v19 = "ASPFTLParseBufferToCxt: raidUncleanBootBandFail(471) cannot add 1 element to context";
                      goto LABEL_15;
                    case 472:
                      int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowHost(472) cannot add 1 element to context";
                      goto LABEL_15;
                    case 473:
                      int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowGC(473) cannot add 1 element to context";
                      goto LABEL_15;
                    case 476:
                      if ((_DWORD)v14 != 2) {
                        sub_100014184( "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 477:
                      if ((_DWORD)v14 != 2) {
                        sub_100014184( "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 481:
                      if ((_DWORD)v14 != 32) {
                        sub_100014184( "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): Cannot add 32 elements to context";
                      goto LABEL_2247;
                    case 483:
                      int v19 = "ASPFTLParseBufferToCxt: tlcOverHeatWaterfall(483) cannot add 1 element to context";
                      goto LABEL_15;
                    case 484:
                      int v19 = "ASPFTLParseBufferToCxt: skinnyCyclesConvert(484) cannot add 1 element to context";
                      goto LABEL_15;
                    case 485:
                      int v19 = "ASPFTLParseBufferToCxt: non_proportional_directToTLCSectors(485) cannot add 1 element to context";
                      goto LABEL_15;
                    case 486:
                      int v19 = "ASPFTLParseBufferToCxt: maxFailedFastCxtSync(486) cannot add 1 element to context";
                      goto LABEL_15;
                    case 487:
                      int v19 = "ASPFTLParseBufferToCxt: numFormatUserArea(487) cannot add 1 element to context";
                      goto LABEL_15;
                    case 488:
                      int v19 = "ASPFTLParseBufferToCxt: clogFastCxtSyncAborted(488) cannot add 1 element to context";
                      goto LABEL_15;
                    case 489:
                      if ((_DWORD)v14 != 5) {
                        sub_100014184( "ASPFTLParseBufferToCxt: clogOccupationSectors(489): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: clogOccupationSectors(489): Cannot add 5 elements to context";
                      goto LABEL_2247;
                    case 490:
                      if ((_DWORD)v14 != 64) {
                        sub_100014184( "ASPFTLParseBufferToCxt: bdrTmpHist(490): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: bdrTmpHist(490): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 491:
                      int v19 = "ASPFTLParseBufferToCxt: numFWUpdates(491) cannot add 1 element to context";
                      goto LABEL_15;
                    case 492:
                      int v19 = "ASPFTLParseBufferToCxt: numClogLoadFails(492) cannot add 1 element to context";
                      goto LABEL_15;
                    case 493:
                      int v19 = "ASPFTLParseBufferToCxt: rxBurnNumForcedDiffMode(493) cannot add 1 element to context";
                      goto LABEL_15;
                    case 494:
                      int v19 = "ASPFTLParseBufferToCxt: RD_numSaves(494) cannot add 1 element to context";
                      goto LABEL_15;
                    case 495:
                      int v19 = "ASPFTLParseBufferToCxt: eanCompressWrites(495) cannot add 1 element to context";
                      goto LABEL_15;
                    case 496:
                      int v19 = "ASPFTLParseBufferToCxt: eanHostWrites(496) cannot add 1 element to context";
                      goto LABEL_15;
                    case 497:
                      int v19 = "ASPFTLParseBufferToCxt: bandPreErases(497) cannot add 1 element to context";
                      goto LABEL_15;
                    case 498:
                      int v19 = "ASPFTLParseBufferToCxt: eanHostUnmaps(498) cannot add 1 element to context";
                      goto LABEL_15;
                    case 499:
                      int v19 = "ASPFTLParseBufferToCxt: eanHostFlushes(499) cannot add 1 element to context";
                      goto LABEL_15;
                    case 500:
                      int v19 = "ASPFTLParseBufferToCxt: eanFastWrites(500) cannot add 1 element to context";
                      goto LABEL_15;
                    case 501:
                      int v19 = "ASPFTLParseBufferToCxt: autowriteDS2FSCollisions(501) cannot add 1 element to context";
                      goto LABEL_15;
                    case 502:
                      int v19 = "ASPFTLParseBufferToCxt: autowriteWaitTransferTaskBlocks(502) cannot add 1 element to context";
                      goto LABEL_15;
                    case 503:
                      if ((_DWORD)v14 != 2) {
                        sub_100014184( "ASPFTLParseBufferToCxt: avgCycle(503): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: avgCycle(503): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 504:
                      int v19 = "ASPFTLParseBufferToCxt: RD_DeferredClearsOverflowCnt(504) cannot add 1 element to context";
                      goto LABEL_15;
                    default:
                      switch(v12)
                      {
                        case 505:
                          int v19 = "ASPFTLParseBufferToCxt: maxVerticsInBand(505) cannot add 1 element to context";
                          goto LABEL_15;
                        case 506:
                          int v19 = "ASPFTLParseBufferToCxt: numVertics(506) cannot add 1 element to context";
                          goto LABEL_15;
                        case 507:
                          int v19 = "ASPFTLParseBufferToCxt: exceededCVertics(507) cannot add 1 element to context";
                          goto LABEL_15;
                        case 510:
                          int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailMismatch(510) cannot add 1 element to context";
                          goto LABEL_15;
                        case 511:
                          if ((_DWORD)v14 != 32) {
                            sub_100014184( "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 516:
                          if ((_DWORD)v14 != 32) {
                            sub_100014184( "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 517:
                          int v19 = "ASPFTLParseBufferToCxt: mspBootBlockCountPerMsp(517) cannot add 1 element to context";
                          goto LABEL_15;
                        case 518:
                          int v19 = "ASPFTLParseBufferToCxt: skinnyRevectorSLC(518) cannot add 1 element to context";
                          goto LABEL_15;
                        case 519:
                          int v19 = "ASPFTLParseBufferToCxt: skinnyRevectorTLC(519) cannot add 1 element to context";
                          goto LABEL_15;
                        case 520:
                          int v19 = "ASPFTLParseBufferToCxt: perfSetupAttempts(520) cannot add 1 element to context";
                          goto LABEL_15;
                        case 521:
                          int v19 = "ASPFTLParseBufferToCxt: perfSetupSuccesses(521) cannot add 1 element to context";
                          goto LABEL_15;
                        case 522:
                          int v19 = "ASPFTLParseBufferToCxt: perfWriteAttempts(522) cannot add 1 element to context";
                          goto LABEL_15;
                        case 523:
                          int v19 = "ASPFTLParseBufferToCxt: perfWriteSuccesses(523) cannot add 1 element to context";
                          goto LABEL_15;
                        case 524:
                          int v19 = "ASPFTLParseBufferToCxt: perfReadAttempts(524) cannot add 1 element to context";
                          goto LABEL_15;
                        case 525:
                          int v19 = "ASPFTLParseBufferToCxt: perfReadSuccesses(525) cannot add 1 element to context";
                          goto LABEL_15;
                        case 526:
                          int v19 = "ASPFTLParseBufferToCxt: perfCleanupAttempts(526) cannot add 1 element to context";
                          goto LABEL_15;
                        case 527:
                          int v19 = "ASPFTLParseBufferToCxt: perfCleanupSuccesses(527) cannot add 1 element to context";
                          goto LABEL_15;
                        case 530:
                          int v19 = "ASPFTLParseBufferToCxt: firstFailedDieId(530) cannot add 1 element to context";
                          goto LABEL_15;
                        case 531:
                          int v19 = "ASPFTLParseBufferToCxt: numDieFailures(531) cannot add 1 element to context";
                          goto LABEL_15;
                        case 532:
                          int v19 = "ASPFTLParseBufferToCxt: spareAvailablePercent(532) cannot add 1 element to context";
                          goto LABEL_15;
                        case 533:
                          int v19 = "ASPFTLParseBufferToCxt: dataFabricErr(533) cannot add 1 element to context";
                          goto LABEL_15;
                        case 534:
                          int v19 = "ASPFTLParseBufferToCxt: downlinkFabricErr(534) cannot add 1 element to context";
                          goto LABEL_15;
                        case 535:
                          int v19 = "ASPFTLParseBufferToCxt: prpAccTimeoutErr(535) cannot add 1 element to context";
                          goto LABEL_15;
                        case 537:
                          int v19 = "ASPFTLParseBufferToCxt: uplinkFabricErr(537) cannot add 1 element to context";
                          goto LABEL_15;
                        case 538:
                          int v19 = "ASPFTLParseBufferToCxt: skinnyBandsGBB(538) cannot add 1 element to context";
                          goto LABEL_15;
                        case 539:
                          int v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadBand(539) cannot add 1 element to context";
                          goto LABEL_15;
                        case 540:
                          int v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadSkinny(540) cannot add 1 element to context";
                          goto LABEL_15;
                        case 541:
                          int v19 = "ASPFTLParseBufferToCxt: bdrHostPingInitial(541) cannot add 1 element to context";
                          goto LABEL_15;
                        case 542:
                          int v19 = "ASPFTLParseBufferToCxt: bdrHostPingMoreNeeded(542) cannot add 1 element to context";
                          goto LABEL_15;
                        case 543:
                          int v19 = "ASPFTLParseBufferToCxt: bandParityAllocationFailed(543) cannot add 1 element to context";
                          goto LABEL_15;
                        case 544:
                          int v19 = "ASPFTLParseBufferToCxt: fastHwBurstToSlc(544) cannot add 1 element to context";
                          goto LABEL_15;
                        case 545:
                          int v19 = "ASPFTLParseBufferToCxt: slowHwToTlc(545) cannot add 1 element to context";
                          goto LABEL_15;
                        case 546:
                          if ((_DWORD)v14 != 10) {
                            sub_100014184( "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 547:
                          if ((_DWORD)v14 != 10) {
                            sub_100014184( "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 548:
                          int v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBurst(548) cannot add 1 element to context";
                          goto LABEL_15;
                        case 549:
                          if ((_DWORD)v14 != 10) {
                            sub_100014184( "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 551:
                          if ((_DWORD)v14 != 11) {
                            sub_100014184( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): (#11) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): Cannot add 11 elements to context";
                          goto LABEL_2247;
                        case 553:
                          int v19 = "ASPFTLParseBufferToCxt: slowHwFlushToSlc(553) cannot add 1 element to context";
                          goto LABEL_15;
                        case 557:
                          int v19 = "ASPFTLParseBufferToCxt: slowHwToSlc(557) cannot add 1 element to context";
                          goto LABEL_15;
                        case 558:
                          int v19 = "ASPFTLParseBufferToCxt: flushNwToSlc(558) cannot add 1 element to context";
                          goto LABEL_15;
                        case 559:
                          int v19 = "ASPFTLParseBufferToCxt: flushNwToTlc(559) cannot add 1 element to context";
                          goto LABEL_15;
                        case 560:
                          int v19 = "ASPFTLParseBufferToCxt: oslcHw(560) cannot add 1 element to context";
                          goto LABEL_15;
                        case 561:
                          int v19 = "ASPFTLParseBufferToCxt: oslcTransitions(561) cannot add 1 element to context";
                          goto LABEL_15;
                        case 563:
                          int v19 = "ASPFTLParseBufferToCxt: slcDemandFlushCount(563) cannot add 1 element to context";
                          goto LABEL_15;
                        case 564:
                          int v19 = "ASPFTLParseBufferToCxt: slcDemandBurstCount(564) cannot add 1 element to context";
                          goto LABEL_15;
                        case 565:
                          int v19 = "ASPFTLParseBufferToCxt: oslcBaseAvgPE(565) cannot add 1 element to context";
                          goto LABEL_15;
                        case 566:
                          int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailNoSPBX(566) cannot add 1 element to context";
                          goto LABEL_15;
                        case 567:
                          int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailDouble(567) cannot add 1 element to context";
                          goto LABEL_15;
                        case 568:
                          int v19 = "ASPFTLParseBufferToCxt: oslcFastWAmpUOnOff(568) cannot add 1 element to context";
                          goto LABEL_15;
                        case 569:
                          int v19 = "ASPFTLParseBufferToCxt: oslcSlowWAmpUOnOff(569) cannot add 1 element to context";
                          goto LABEL_15;
                        case 570:
                          int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailInvalid(570) cannot add 1 element to context";
                          goto LABEL_15;
                        case 572:
                          int v19 = "ASPFTLParseBufferToCxt: oslcLastWAmpUx10(572) cannot add 1 element to context";
                          goto LABEL_15;
                        case 573:
                          int v19 = "ASPFTLParseBufferToCxt: raidFailedReadNoBlog(573) cannot add 1 element to context";
                          goto LABEL_15;
                        case 574:
                          int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBlank(574) cannot add 1 element to context";
                          goto LABEL_15;
                        case 575:
                          int v19 = "ASPFTLParseBufferToCxt: oslcHotTLCOnOff(575) cannot add 1 element to context";
                          goto LABEL_15;
                        case 576:
                          int v19 = "ASPFTLParseBufferToCxt: gcVPackDestinations(576) cannot add 1 element to context";
                          goto LABEL_15;
                        case 581:
                          int v19 = "ASPFTLParseBufferToCxt: averageTLCPECycles(581) cannot add 1 element to context";
                          goto LABEL_15;
                        case 582:
                          int v19 = "ASPFTLParseBufferToCxt: averageSLCPECycles(582) cannot add 1 element to context";
                          goto LABEL_15;
                        case 583:
                          int v19 = "ASPFTLParseBufferToCxt: numAtomicBoots(583) cannot add 1 element to context";
                          goto LABEL_15;
                        case 584:
                          int v19 = "ASPFTLParseBufferToCxt: clogMinorMismatch(584) cannot add 1 element to context";
                          goto LABEL_15;
                        case 586:
                          int v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionInternal(586) cannot add 1 element to context";
                          goto LABEL_15;
                        case 587:
                          int v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionHost(587) cannot add 1 element to context";
                          goto LABEL_15;
                        case 588:
                          int v19 = "ASPFTLParseBufferToCxt: oslcGCinvalidations(588) cannot add 1 element to context";
                          goto LABEL_15;
                        case 589:
                          int v19 = "ASPFTLParseBufferToCxt: oslcGCActivateReason(589) cannot add 1 element to context";
                          goto LABEL_15;
                        default:
                          switch(v12)
                          {
                            case 590:
                              int v19 = "ASPFTLParseBufferToCxt: oslcLowCleanBandsUOnOff(590) cannot add 1 element to context";
                              goto LABEL_15;
                            case 591:
                              int v19 = "ASPFTLParseBufferToCxt: oslcTooManyGCMustOnOff(591) cannot add 1 element to context";
                              goto LABEL_15;
                            case 592:
                              int v19 = "ASPFTLParseBufferToCxt: oslcBaseHostWrites(592) cannot add 1 element to context";
                              goto LABEL_15;
                            case 593:
                              int v19 = "ASPFTLParseBufferToCxt: oslcBaseBandErases(593) cannot add 1 element to context";
                              goto LABEL_15;
                            case 594:
                              int v19 = "ASPFTLParseBufferToCxt: oslcBdrBands(594) cannot add 1 element to context";
                              goto LABEL_15;
                            case 595:
                              int v19 = "ASPFTLParseBufferToCxt: oslcBdrValid(595) cannot add 1 element to context";
                              goto LABEL_15;
                            case 596:
                              int v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksInternal(596) cannot add 1 element to context";
                              goto LABEL_15;
                            case 597:
                              int v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksOnRV(597) cannot add 1 element to context";
                              goto LABEL_15;
                            case 601:
                              int v19 = "ASPFTLParseBufferToCxt: waterfallLockSectors(601) cannot add 1 element to context";
                              goto LABEL_15;
                            case 602:
                              int v19 = "ASPFTLParseBufferToCxt: oslcGCActiveWrites(602) cannot add 1 element to context";
                              goto LABEL_15;
                            case 603:
                              int v19 = "ASPFTLParseBufferToCxt: chipIdTemperatureSample(603) cannot add 1 element to context";
                              goto LABEL_15;
                            case 604:
                              int v19 = "ASPFTLParseBufferToCxt: gcVPackWrites(604) cannot add 1 element to context";
                              goto LABEL_15;
                            case 605:
                              if ((_DWORD)v14 != 10) {
                                sub_100014184( "ASPFTLParseBufferToCxt: gcActiveReasons(605): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: gcActiveReasons(605): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 606:
                              int v19 = "ASPFTLParseBufferToCxt: eanMaxInitTimeMs(606) cannot add 1 element to context";
                              goto LABEL_15;
                            case 607:
                              int v19 = "ASPFTLParseBufferToCxt: eanMinToFirstReadTimeMs(607) cannot add 1 element to context";
                              goto LABEL_15;
                            case 608:
                              int v19 = "ASPFTLParseBufferToCxt: skinnyAPGMRetire(608) cannot add 1 element to context";
                              goto LABEL_15;
                            case 609:
                              int v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksHost(609) cannot add 1 element to context";
                              goto LABEL_15;
                            case 610:
                              if ((_DWORD)v14 != 64) {
                                sub_100014184( "ASPFTLParseBufferToCxt: pcieAerCounters(610): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: pcieAerCounters(610): Cannot add 64 elements to context";
                              goto LABEL_2247;
                            case 611:
                              int v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBalance(611) cannot add 1 element to context";
                              goto LABEL_15;
                            case 612:
                              int v19 = "ASPFTLParseBufferToCxt: perfOSLCRuns(612) cannot add 1 element to context";
                              goto LABEL_15;
                            case 613:
                              int v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInGC(613) cannot add 1 element to context";
                              goto LABEL_15;
                            case 614:
                              int v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInTT(614) cannot add 1 element to context";
                              goto LABEL_15;
                            case 615:
                              int v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInNRP(615) cannot add 1 element to context";
                              goto LABEL_15;
                            case 616:
                              int v19 = "ASPFTLParseBufferToCxt: perfTotalDmaMb(616) cannot add 1 element to context";
                              goto LABEL_15;
                            case 617:
                              int v19 = "ASPFTLParseBufferToCxt: eanAvgInitTimeMs(617) cannot add 1 element to context";
                              goto LABEL_15;
                            case 618:
                              int v19 = "ASPFTLParseBufferToCxt: eanAvgToFirstReadTimeMs(618) cannot add 1 element to context";
                              goto LABEL_15;
                            case 619:
                              int v19 = "ASPFTLParseBufferToCxt: eanMaxBootReadTimeMs(619) cannot add 1 element to context";
                              goto LABEL_15;
                            case 620:
                              int v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadTimeMs(620) cannot add 1 element to context";
                              goto LABEL_15;
                            case 621:
                              if ((_DWORD)v14 != 10) {
                                sub_100014184( "ASPFTLParseBufferToCxt: eanBootReadsHist(621): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanBootReadsHist(621): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 622:
                              int v19 = "ASPFTLParseBufferToCxt: maxBgInitTimeMs(622) cannot add 1 element to context";
                              goto LABEL_15;
                            case 623:
                              int v19 = "ASPFTLParseBufferToCxt: avgBgInitTimeMs(623) cannot add 1 element to context";
                              goto LABEL_15;
                            case 624:
                              if ((_DWORD)v14 != 16) {
                                sub_100014184( "ASPFTLParseBufferToCxt: clogFailReason(624): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: clogFailReason(624): Cannot add 16 elements to context";
                              goto LABEL_2247;
                            case 625:
                              int v19 = "ASPFTLParseBufferToCxt: eanMinBootReadMBPerSec(625) cannot add 1 element to context";
                              goto LABEL_15;
                            case 626:
                              int v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadMBPerSec(626) cannot add 1 element to context";
                              goto LABEL_15;
                            case 627:
                              int v19 = "ASPFTLParseBufferToCxt: minSkinnyPECycles(627) cannot add 1 element to context";
                              goto LABEL_15;
                            case 628:
                              int v19 = "ASPFTLParseBufferToCxt: maxSkinnyPECycles(628) cannot add 1 element to context";
                              goto LABEL_15;
                            case 629:
                              int v19 = "ASPFTLParseBufferToCxt: averageSkinnyPECycles(629) cannot add 1 element to context";
                              goto LABEL_15;
                            case 630:
                              if ((_DWORD)v14 != 6) {
                                sub_100014184( "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 631:
                              if ((_DWORD)v14 != 6) {
                                sub_100014184( "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 632:
                              if ((_DWORD)v14 != 6) {
                                sub_100014184( "ASPFTLParseBufferToCxt: eanFirstReadMode(632): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanFirstReadMode(632): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 635:
                              int v19 = "ASPFTLParseBufferToCxt: oslcHwGC(635) cannot add 1 element to context";
                              goto LABEL_15;
                            case 636:
                              int v19 = "ASPFTLParseBufferToCxt: oslcHwTT(636) cannot add 1 element to context";
                              goto LABEL_15;
                            case 637:
                              int v19 = "ASPFTLParseBufferToCxt: oslcHwNRP(637) cannot add 1 element to context";
                              goto LABEL_15;
                            case 638:
                              if ((_DWORD)v14 != 10) {
                                sub_100014184( "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 639:
                              int v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessBandFlowOslc(639) cannot add 1 element to context";
                              goto LABEL_15;
                            case 640:
                              int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowOslc(640) cannot add 1 element to context";
                              goto LABEL_15;
                            case 641:
                              int v19 = "ASPFTLParseBufferToCxt: raidFailSectors(641) cannot add 1 element to context";
                              goto LABEL_15;
                            case 642:
                              int v19 = "ASPFTLParseBufferToCxt: eanFailSectors(642) cannot add 1 element to context";
                              goto LABEL_15;
                            case 643:
                              int v19 = "ASPFTLParseBufferToCxt: bdrTimeMode(643) cannot add 1 element to context";
                              goto LABEL_15;
                            case 644:
                              int v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedP(644) cannot add 1 element to context";
                              goto LABEL_15;
                            case 645:
                              int v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedQ(645) cannot add 1 element to context";
                              goto LABEL_15;
                            case 646:
                              int v19 = "ASPFTLParseBufferToCxt: raidParityInvalid(646) cannot add 1 element to context";
                              goto LABEL_15;
                            case 647:
                              int v19 = "ASPFTLParseBufferToCxt: raidParityUnknown(647) cannot add 1 element to context";
                              goto LABEL_15;
                            case 648:
                              int v19 = "ASPFTLParseBufferToCxt: raidParityUnmapped(648) cannot add 1 element to context";
                              goto LABEL_15;
                            case 649:
                              int v19 = "ASPFTLParseBufferToCxt: raidParityGCUnc(649) cannot add 1 element to context";
                              goto LABEL_15;
                            case 657:
                              int v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXProbational(657) cannot add 1 element to context";
                              goto LABEL_15;
                            case 659:
                              int v19 = "ASPFTLParseBufferToCxt: raidVerificationReads(659) cannot add 1 element to context";
                              goto LABEL_15;
                            case 666:
                              int v19 = "ASPFTLParseBufferToCxt: nofDies(666) cannot add 1 element to context";
                              goto LABEL_15;
                            case 671:
                              int v19 = "ASPFTLParseBufferToCxt: skinnyBandsNum(671) cannot add 1 element to context";
                              goto LABEL_15;
                            case 672:
                              int v19 = "ASPFTLParseBufferToCxt: skinnyBandsNumDips(672) cannot add 1 element to context";
                              goto LABEL_15;
                            case 674:
                              if ((_DWORD)v14 != 8) {
                                sub_100014184( "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): Cannot add 8 elements to context";
                              goto LABEL_2247;
                            case 675:
                              int v19 = "ASPFTLParseBufferToCxt: totalLbas(675) cannot add 1 element to context";
                              goto LABEL_15;
                            case 676:
                              int v19 = "ASPFTLParseBufferToCxt: bdrHostPingExtra(676) cannot add 1 element to context";
                              goto LABEL_15;
                            case 677:
                              int v19 = "ASPFTLParseBufferToCxt: magazineInstanceMeta(677) cannot add 1 element to context";
                              goto LABEL_15;
                            default:
                              switch(v12)
                              {
                                case 680:
                                  if ((_DWORD)v14 != 3) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: magazineFWVersion(680): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: magazineFWVersion(680): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 681:
                                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailPMXUnsup(681) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 682:
                                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUnsup(682) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 683:
                                  int v19 = "ASPFTLParseBufferToCxt: iBootNANDResets(683) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 684:
                                  int v19 = "ASPFTLParseBufferToCxt: pcieClkreqHighTimeout(684) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 687:
                                  if ((_DWORD)v14 != 3) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cbdrInitSent(687): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrInitSent(687): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 688:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrPauseSent(688) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 689:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrResumeSent(689) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 690:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrGetResultSent(690) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 691:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrEarlyExits(691) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 694:
                                  if ((_DWORD)v14 != 10) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 695:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrNotEnoughReads(695) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 696:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrAborts(696) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 697:
                                  int v19 = "ASPFTLParseBufferToCxt: TurboRaidHostClassifications(697) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 698:
                                  int v19 = "ASPFTLParseBufferToCxt: TurboRaidInternalClassifications(698) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 699:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrFullyDone(699) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 702:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: vcurve(702): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: vcurve(702): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 703:
                                  if ((_DWORD)v14 != 12) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: injDepth(703): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: injDepth(703): Cannot add 12 elements to context";
                                  goto LABEL_2247;
                                case 704:
                                  int v19 = "ASPFTLParseBufferToCxt: logical_disk_occupied_promiles(704) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 711:
                                  int v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructSkip(711) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 712:
                                  int v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulHostAuxReads(712) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 713:
                                  int v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulInternalAuxReads(713) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 714:
                                  int v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityHost(714) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 715:
                                  if ((sub_100023E58( a1,  "turboRaidClassificationReliabilityInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  int v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityInternal(715) cannot a"
                                        "dd 1 element to context";
                                  goto LABEL_15;
                                case 716:
                                  int v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityHost(716) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 717:
                                  int v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityInternal(717) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 719:
                                  int v19 = "ASPFTLParseBufferToCxt: skinnyBandErases(719) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 721:
                                  int v19 = "ASPFTLParseBufferToCxt: gcPDusterDestinations(721) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 722:
                                  int v19 = "ASPFTLParseBufferToCxt: gcPDusterWrites(722) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 730:
                                  int v19 = "ASPFTLParseBufferToCxt: rvFails(730) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 737:
                                  int v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedHostAuxReads(737) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 738:
                                  int v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedInternalAuxReads(738) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 741:
                                  int v19 = "ASPFTLParseBufferToCxt: autoSkipTriggers(741) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 742:
                                  int v19 = "ASPFTLParseBufferToCxt: autoSkipPlanes(742) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 744:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): (#8) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 745:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 746:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenExcessive(746) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 747:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_IntFlattenExcessive(747) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 748:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenBalance(748) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 749:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_intFlattenBalance(749) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 750:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertExcessive(750) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 751:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertBalance(751) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 753:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrNumSlowRefreshes(753) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 754:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrNumFastRefreshes(754) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 755:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrTotalRefreshValidity(755) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 756:
                                  if ((_DWORD)v14 != 9) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 758:
                                  int v19 = "ASPFTLParseBufferToCxt: cbdrSkippedBlocks(758) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 759:
                                  if ((_DWORD)v14 != 5) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cbdrScanPct(759): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPct(759): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 760:
                                  if ((sub_100023E58( a1,  "raidSuccessfulBMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionInternal(760) cannot add "
                                        "1 element to context";
                                  goto LABEL_15;
                                case 761:
                                  int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionHost(761) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 762:
                                  int v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionInternal(762) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 763:
                                  int v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionHost(763) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 764:
                                  int v19 = "ASPFTLParseBufferToCxt: ricSPRVFail(764) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 765:
                                  int v19 = "ASPFTLParseBufferToCxt: ricMPRVFail(765) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 767:
                                  if ((_DWORD)v14 != 10) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 768:
                                  if ((_DWORD)v14 != 9) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 769:
                                  if ((_DWORD)v14 != 5) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 770:
                                  if ((_DWORD)v14 != 8) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: cpuBurstLength(770): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cpuBurstLength(770): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 771:
                                  int v19 = "ASPFTLParseBufferToCxt: autoSkipRaidRecoFail(771) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 772:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsSlc(772): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc(772): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 773:
                                  if ((_DWORD)v14 != 32) {
                                    sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsTlc(773): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc(773): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 774:
                                  int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXAbort(774) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 775:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingNoBlocks(775) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 776:
                                  int v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingFewBlocks(776) cannot add 1 element to context";
                                  goto LABEL_15;
                                default:
                                  switch(v12)
                                  {
                                    case 777:
                                      int v19 = "ASPFTLParseBufferToCxt: numBadBootBlocks(777) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 778:
                                      int v19 = "ASPFTLParseBufferToCxt: snapshotCPUHigh(778) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 779:
                                      int v19 = "ASPFTLParseBufferToCxt: snapshotCPULow(779) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 780:
                                      int v19 = "ASPFTLParseBufferToCxt: gcWithoutBMs(780) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 781:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 785:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: gcSearchPortion(785): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchPortion(785): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 786:
                                      int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmxMp(786) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 787:
                                      int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmx(787) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 788:
                                      int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUECC(788) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 789:
                                      int v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXBlank(789) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 790:
                                      int v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructBmxMpSkip(790) cannot add 1"
                                            " element to context";
                                      goto LABEL_15;
                                    case 792:
                                      int v19 = "ASPFTLParseBufferToCxt: numTLCFatBands(792) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 793:
                                      int v19 = "ASPFTLParseBufferToCxt: fatValidity(793) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 794:
                                      int v19 = "ASPFTLParseBufferToCxt: fatTotal(794) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 798:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailP(798): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailP(798): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 799:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 804:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 806:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 809:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 811:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 812:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 813:
                                      int v19 = "ASPFTLParseBufferToCxt: TurboRaidIsEnabled(813) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 814:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXFailOther(814): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailOther(814): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 815:
                                      if ((_DWORD)v14 != 4) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: raidBMXSuccess(815): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXSuccess(815): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 816:
                                      int v19 = "ASPFTLParseBufferToCxt: skinnyBandsExtraDip(816) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 821:
                                      int v19 = "ASPFTLParseBufferToCxt: writeAmp(821) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 822:
                                      int v19 = "ASPFTLParseBufferToCxt: ricMaxClogOnlyPages(822) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 823:
                                      if ((_DWORD)v14 != 3) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): (#3) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): Cannot add 3 elements to context";
                                      goto LABEL_2247;
                                    case 824:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): (#10) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 825:
                                      if ((_DWORD)v14 != 10) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): Cannot add 10 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 826:
                                      int v19 = "ASPFTLParseBufferToCxt: bdrBackupChecks(826) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 827:
                                      int v19 = "ASPFTLParseBufferToCxt: ricExceedClogOnlyPagesTH(827) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 828:
                                      int v19 = "ASPFTLParseBufferToCxt: numDipFailures(828) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 831:
                                      int v19 = "ASPFTLParseBufferToCxt: prefetchNextRange(831) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 862:
                                      int v19 = "ASPFTLParseBufferToCxt: raidSuccessfulSkip(862) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 863:
                                      int v19 = "ASPFTLParseBufferToCxt: raidFailedSkip(863) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 864:
                                      int v19 = "ASPFTLParseBufferToCxt: raidSkipAttempts(864) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 865:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): (#16) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 866:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): Cannot add 16 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 867:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): Cannot add 16 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 868:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 869:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 870:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 871:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 876:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 877:
                                      if ((_DWORD)v14 != 32) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 883:
                                      int v19 = "ASPFTLParseBufferToCxt: clogEmptyProgramms(883) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 884:
                                      int v19 = "ASPFTLParseBufferToCxt: oslcHwCloseBand(884) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 891:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): (#2) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 892:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): (#2) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 893:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): Cannot add 2 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 894:
                                      if ((_DWORD)v14 != 2) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): Cannot add 2 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 895:
                                      int v19 = "ASPFTLParseBufferToCxt: IND_pool_freeMinSilo(895) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 896:
                                      int v19 = "ASPFTLParseBufferToCxt: autoSweepBlocks(896) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 897:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: wcWrFragSizes(897): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: wcWrFragSizes(897): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 898:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 899:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 900:
                                      int v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToWasRetire(900) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 901:
                                      int v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToOpenBand(901) cannot add 1 e"
                                            "lement to context";
                                      goto LABEL_15;
                                    case 902:
                                      if ((sub_100023E58( a1,  "turboRaidNoClassifyDueToQualityBlock",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      int v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToQualityBlock(902) cannot add"
                                            " 1 element to context";
                                      goto LABEL_15;
                                    case 903:
                                      int v19 = "ASPFTLParseBufferToCxt: turboRaidGbbOpenBand(903) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 904:
                                      int v19 = "ASPFTLParseBufferToCxt: turboRaidGbbShouldRetireOnRefresh(904) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 905:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 906:
                                      if ((_DWORD)v14 != 16) {
                                        sub_100014184( "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): (#16) cfg e lements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((sub_100023E58( a1,  "turboRaidRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): Cannot ad"
                                            "d 16 elements to context";
                                      goto LABEL_2247;
                                    default:
                                      if (v12 <= 1039)
                                      {
                                        switch(v12)
                                        {
                                          case 907:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "turboRaidMaxRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 908:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "turboRaidMinRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 909:
                                          case 910:
                                          case 911:
                                          case 912:
                                          case 913:
                                          case 914:
                                          case 915:
                                          case 916:
                                          case 917:
                                          case 924:
                                          case 925:
                                          case 926:
                                          case 927:
                                          case 928:
                                          case 929:
                                          case 936:
                                          case 941:
                                          case 945:
                                          case 946:
                                          case 947:
                                          case 949:
                                          case 950:
                                          case 952:
                                          case 954:
                                          case 955:
                                          case 956:
                                          case 957:
                                          case 958:
                                          case 959:
                                          case 960:
                                          case 963:
                                          case 964:
                                          case 965:
                                          case 966:
                                          case 968:
                                          case 969:
                                          case 970:
                                            goto LABEL_2110;
                                          case 918:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "turboRaidMaxCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 919:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "turboRaidMinCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 920:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 921:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "turboRaidAuxBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): Can"
                                                  "not add 16 elements to context";
                                            goto LABEL_2247;
                                          case 922:
                                            int v19 = "ASPFTLParseBufferToCxt: turboRaidRelLockMark(922) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 923:
                                            int v19 = "ASPFTLParseBufferToCxt: turboRaidAuxLockMark(923) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 930:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "turboRaidMaxCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 931:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "turboRaidMinCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 932:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 933:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 934:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 935:
                                            if ((_DWORD)v14 != 16) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 937:
                                            int v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterRel(937) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 938:
                                            int v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterAux(938) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 939:
                                            int v19 = "ASPFTLParseBufferToCxt: dvfmVotesCPU(939) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 940:
                                            int v19 = "ASPFTLParseBufferToCxt: dvfmVotesBandwidth(940) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 942:
                                            int v19 = "ASPFTLParseBufferToCxt: maxSLCEndurance(942) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 943:
                                            int v19 = "ASPFTLParseBufferToCxt: maxMixedEndurance(943) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 944:
                                            int v19 = "ASPFTLParseBufferToCxt: maxNativeEndurance(944) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 948:
                                            if ((_DWORD)v14 != 40) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: assertHistory(948): (#40) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: assertHistory(948): Cannot add 40 elements to context";
                                            goto LABEL_2247;
                                          case 951:
                                            int v19 = "ASPFTLParseBufferToCxt: asp3Support(951) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 953:
                                            int v19 = "ASPFTLParseBufferToCxt: numCrossTempRaidUecc(953) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 961:
                                            int v19 = "ASPFTLParseBufferToCxt: osBuildStr(961) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 962:
                                            int v19 = "ASPFTLParseBufferToCxt: raidConfig(962) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 967:
                                            if ((_DWORD)v14 != 12) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: indTrimFrags(967): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indTrimFrags(967): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          case 971:
                                            if ((_DWORD)v14 != 12) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: indUsedFrags(971): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indUsedFrags(971): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 996:
                                                int v19 = "ASPFTLParseBufferToCxt: clogFindFail(996) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 997:
                                                int v19 = "ASPFTLParseBufferToCxt: clogFindBlank(997) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 998:
                                                int v19 = "ASPFTLParseBufferToCxt: clogFindUnc(998) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 999:
                                                int v19 = "ASPFTLParseBufferToCxt: clogFindUnexpected(999) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1001:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_100014184( "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): (#8) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): Cannot add 8 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1002:
                                                int v19 = "ASPFTLParseBufferToCxt: clogReplayTransientError(1002) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1003:
                                                int v19 = "ASPFTLParseBufferToCxt: clogReplaySpfError(1003) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1015:
                                                if ((_DWORD)v14 != 4) {
                                                  sub_100014184( "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): (#4) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): Cannot add 4 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1016:
                                                int v19 = "ASPFTLParseBufferToCxt: eanEarlyBootNumUeccPages(1016) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1017:
                                                if ((sub_100023E58( a1,  "eanEarlyBootUeccMultiplane",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                int v19 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccMultiplane(1017) cannot ad"
                                                      "d 1 element to context";
                                                goto LABEL_15;
                                              default:
                                                goto LABEL_2110;
                                            }
                                        }
                                      }

                                      if (v12 > 1137)
                                      {
                                        switch(v12)
                                        {
                                          case 1147:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): (#24) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): Cannot add 24 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1148:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1149:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1150:
                                          case 1151:
                                          case 1152:
                                          case 1153:
                                          case 1154:
                                          case 1155:
                                          case 1156:
                                          case 1159:
                                          case 1160:
                                          case 1161:
                                          case 1162:
                                          case 1163:
                                          case 1164:
                                          case 1165:
                                          case 1166:
                                          case 1167:
                                          case 1170:
                                          case 1173:
                                          case 1174:
                                          case 1175:
                                          case 1176:
                                          case 1177:
                                          case 1178:
                                            goto LABEL_2110;
                                          case 1157:
                                            int v19 = "ASPFTLParseBufferToCxt: eanMaxForceROTimeMs(1157) cannot add 1 element to context";
                                            break;
                                          case 1158:
                                            int v19 = "ASPFTLParseBufferToCxt: eanMaxForceRORecoTimeMs(1158) cannot add 1 element to context";
                                            break;
                                          case 1168:
                                            if ((_DWORD)v14 != 2) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): (#2) cfg eleme nts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): Cannot add 2"
                                                  " elements to context";
                                            goto LABEL_2247;
                                          case 1169:
                                            if ((_DWORD)v14 != 2) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): (#2) cf g elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "poDetectEmptySpotRemovalTotalCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): Canno"
                                                  "t add 2 elements to context";
                                            goto LABEL_2247;
                                          case 1171:
                                            if ((_DWORD)v14 != 10) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): (#10) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "poDetectEmptySpotRemovalAge_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): Cannot add "
                                                  "10 elements to context";
                                            goto LABEL_2247;
                                          case 1172:
                                            if ((_DWORD)v14 != 3) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): (#3) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "poDetectGBBedMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): Cannot add "
                                                  "3 elements to context";
                                            goto LABEL_2247;
                                          case 1179:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1180:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1181:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1182:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1183:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1184:
                                            int v19 = "ASPFTLParseBufferToCxt: unhappy_state(1184) cannot add 1 element to context";
                                            break;
                                          case 1185:
                                            int v19 = "ASPFTLParseBufferToCxt: unhappy_level(1185) cannot add 1 element to context";
                                            break;
                                          default:
                                            if (v12 != 1138)
                                            {
                                              if (v12 != 1189) {
                                                goto LABEL_2110;
                                              }
                                              if ((sub_100023E58(a1, "lastLbaFormatTime", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                              {
                                                int v19 = "ASPFTLParseBufferToCxt: lastLbaFormatTime(1189) cannot add 1 element to context";
                                                break;
                                              }

                                              goto LABEL_16;
                                            }

                                            int v19 = "ASPFTLParseBufferToCxt: numOfToHappySwitches(1138) cannot add 1 element to context";
                                            break;
                                        }

LABEL_16:
                                          uint64_t v10 = (v10 + 1);
                                          goto LABEL_17;
                                        }

                                        goto LABEL_2110;
                                      }

                                      if (v12 > 1115)
                                      {
                                        if (v12 == 1116)
                                        {
                                          if ((_DWORD)v14 != 32) {
                                            sub_100014184( "ASPFTLParseBufferToCxt: gcwamp(1116): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            unsigned int v20 = v14;
                                          }
                                          if ((sub_100023E58(a1, "gcwamp_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: gcwamp(1116): Cannot add 32 elements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1137)
                                        {
                                          int v19 = "ASPFTLParseBufferToCxt: numOfToUnhappySwitches(1137) cannot add 1 element to context";
                                          goto LABEL_15;
                                        }

LABEL_2110:
                                        switch(v12)
                                        {
                                          case 1196:
                                            if ((_DWORD)v14 != 5) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): Cannot add 5 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1197:
                                            if ((_DWORD)v14 != 10) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): Cannot add 10 elements to context";
                                            goto LABEL_2247;
                                          case 1198:
                                            if ((_DWORD)v14 != 3) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "poDetectPERemovalMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): Cannot "
                                                  "add 3 elements to context";
                                            goto LABEL_2247;
                                          case 1199:
                                            int v19 = "ASPFTLParseBufferToCxt: poDetectCurrentSize(1199) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1200:
                                          case 1203:
                                          case 1204:
                                          case 1205:
                                          case 1206:
                                          case 1207:
                                          case 1208:
                                          case 1209:
                                          case 1210:
                                          case 1212:
                                          case 1213:
                                          case 1214:
                                          case 1219:
                                          case 1220:
                                          case 1221:
                                          case 1222:
                                          case 1223:
LABEL_2242:
                                            else {
                                              snprintf(__str, 0x20uLL, "Stat_%d_");
                                            }
                                            if ((sub_100023E58(a1, __str, (uint64_t)v8, 8u, v14) & 1) == 0)
                                            {
                                              sub_100014184( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
                                              return v10;
                                            }

                                            uint64_t v10 = (v10 + v14);
                                            break;
                                          case 1201:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): (#4) cfg el ements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "gcVerticalSuccssfulAlignments_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): Cannot ad"
                                                  "d 4 elements to context";
                                            goto LABEL_2247;
                                          case 1202:
                                            if ((_DWORD)v14 != 4) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "gcVerticalNoAlignmentDueToMissingSegs_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): C"
                                                  "annot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1211:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): (#24) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((sub_100023E58( a1,  "forcedAllocationSmallEraseQ_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): Cannot add "
                                                  "24 elements to context";
                                            goto LABEL_2247;
                                          case 1215:
                                            if ((_DWORD)v14 != 5) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): (#5) cfg elemen ts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): Cannot add 5 "
                                                  "elements to context";
                                            goto LABEL_2247;
                                          case 1216:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1217:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1218:
                                            if ((_DWORD)v14 != 24) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1224:
                                            if ((_DWORD)v14 != 20) {
                                              sub_100014184( "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): (#20) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): Cannot add 20 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 1232:
                                                int v19 = "ASPFTLParseBufferToCxt: eanFastSize(1232) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1233:
                                                int v19 = "ASPFTLParseBufferToCxt: eanNumSlcEvictions(1233) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1234:
                                                int v19 = "ASPFTLParseBufferToCxt: eanNumForcedCompress(1234) cannot add 1 el"
                                                      "ement to context";
                                                goto LABEL_15;
                                              case 1235:
                                              case 1236:
                                              case 1237:
                                              case 1238:
                                              case 1239:
                                              case 1240:
                                              case 1242:
                                              case 1243:
                                              case 1245:
                                                goto LABEL_2242;
                                              case 1241:
                                                if ((_DWORD)v14 != 10) {
                                                  sub_100014184( "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): Cannot add 10 elements to context";
                                                goto LABEL_2247;
                                              case 1244:
                                                int v19 = "ASPFTLParseBufferToCxt: calendarTimeWentBackward(1244) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1246:
                                                if ((_DWORD)v14 != 8) {
                                                  sub_100014184( "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): (#8) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((sub_100023E58( a1,  "bandsUeccCrossTempHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): Cannot add "
                                                      "8 elements to context";
                                                goto LABEL_2247;
                                              default:
                                                if (v12 != 1190) {
                                                  goto LABEL_2242;
                                                }
                                                if ((_DWORD)v14 != 12) {
                                                  sub_100014184( "ASPFTLParseBufferToCxt: powerDownTime(1190): (#12) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: powerDownTime(1190): Cannot add 12 elements to context";
                                                break;
                                            }

                                            goto LABEL_2247;
                                        }

uint64_t sub_100023E58(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v14 = 0LL;
  uint64_t v5 = 1LL;
  if (a4 && a5)
  {
    if (a5 == 1)
    {
      if (a4 <= 8)
      {
        __memmove_chk(&v14, a3, a4, 8LL);
        return sub_10002A8EC(a1, "", a2, v14);
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      int v11 = 0;
      int v12 = 0;
      do
      {
        uint64_t v14 = 0LL;
        if (a4 <= 8)
        {
          __memmove_chk(&v14, a3 + v11 * a4, a4, 8LL);
          snprintf(__str, 0x64uLL, "%d", v11);
          __str[100] = 0;
          uint64_t v5 = sub_10002A8EC(a1, a2, __str, v14) & v5;
        }

        else
        {
          uint64_t v5 = 0LL;
        }

        int v11 = (unsigned __int16)++v12;
      }

      while ((unsigned __int16)v12 < a5);
    }
  }

  return v5;
}

uint64_t sub_100023FB8(uint64_t a1, unint64_t *a2, unsigned int a3)
{
  uint64_t v5 = 0LL;
  unsigned int v6 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v22 = 0u;
LABEL_2:
  int v7 = -v6;
  while (v7)
  {
    unint64_t v9 = *a2++;
    unsigned int v8 = v9;
    unint64_t v10 = HIDWORD(v9);
    ++v7;
    if (HIDWORD(v9))
    {
      if (v8 != 0xFFFF && v8 <= 0x30000000 && -v7 >= v10)
      {
        else {
          snprintf(__str, 0x20uLL, "Stat_%d_");
        }
        if ((sub_100023E58(a1, __str, (uint64_t)a2, 8u, v10) & 1) != 0)
        {
          uint64_t v5 = (v5 + v10);
          a2 += v10;
          unsigned int v6 = -v7 - v10;
          goto LABEL_2;
        }

        sub_100014184( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v8);
      }

      return v5;
    }
  }

  return v5;
}

uint64_t sub_1000240E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  unint64_t v9 = "ASPMSPParseBufferToCxt: Passed in invalid buffer or empty buffer";
  if (!a2) {
    goto LABEL_1981;
  }
  unsigned int v10 = a3;
  if (!(_DWORD)a3) {
    goto LABEL_1981;
  }
  uint64_t v11 = a2;
  uint64_t v8 = 0LL;
  uint64_t v13 = &jpt_100028234;
  uint64_t v14 = "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): Error adding 4 elements to context";
  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_5(4256): Error adding 10 elements to context";
  while (1)
  {
    do
    {
      if (!v10) {
        return v8;
      }
      uint64_t v15 = (unsigned __int16 *)v11;
      uint64_t v16 = *(unsigned __int16 *)(v11 + 2);
      v11 += 4LL;
      v10 -= 4;
    }

    while (!(_DWORD)v16);
    int v17 = *v15;
    if (v17 != 12286) {
      break;
    }
LABEL_461:
    v11 += v16;
    v10 -= v16;
  }

  switch(v17)
  {
    case 4096:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4097:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4098:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4099:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4100:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4101:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4102:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4103:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4104:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4105:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4106:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4107:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4108:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4109:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4110:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4111:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4112:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4113:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4114:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4115:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4116:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4117:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4118:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4119:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4120:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_100014184( "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4121:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 16) {
        sub_100014184( "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): cfg 4 elements; (4*4) cfg by"
      }
          "tes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): Error adding 4 elements to context";
      goto LABEL_1981;
    case 4122:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4123:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4124:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4125:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4126:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4127:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_100014184( "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4128:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        sub_100014184( "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4129:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4130:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4131:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4132:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4133:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4134:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        sub_100014184( "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4135:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readZeroPage(4135): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readZeroPage(4135): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4136:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readErasedPage(4136): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readErasedPage(4136): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4137:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readFail(4137): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readFail(4137): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4138:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 20) {
        sub_100014184( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): Error adding 5 elements to context";
      goto LABEL_1981;
    case 4139:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 12) {
        sub_100014184( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): cfg 3 elements; (3*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): Error adding 3 elements to context";
      goto LABEL_1981;
    case 4140:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4141:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4142:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4143:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4144:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4145:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4146:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4147:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4148:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4149:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4150:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4151:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4152:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4153:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4154:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4155:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4156:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4157:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): cfg 1 elements; (1*4) cfg bytes != "
      }
          "(%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4158:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4159:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      if (sub_100023E58(a1, "readAlgoPassWithFS14BitAfterAcq", v11, 4u, v21))
      {
LABEL_460:
        uint64_t v8 = v8 + v21;
        uint64_t v13 = v20;
        uint64_t v14 = v19;
        goto LABEL_461;
      }

      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): Error adding 1 elements to context";
LABEL_1981:
      sub_100014184(v9, a2, a3, a4, a5, a6, a7, a8, v24);
      return v8;
    default:
      switch(v17)
      {
        case 4160:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4161:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4162:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4163:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4196:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4197:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4198:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage100(4198): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage100(4198): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4199:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage101(4199): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage101(4199): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4200:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage100(4200): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage100(4200): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4201:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage102(4201): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage102(4201): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4202:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage101(4202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage101(4202): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4203:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4204:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4205:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4206:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage102(4206): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage102(4206): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4207:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage103(4207): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage103(4207): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4208:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage104(4208): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage104(4208): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4209:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage105(4209): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage105(4209): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4210:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage106(4210): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage106(4210): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4211:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4212:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4213:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage103(4213): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage103(4213): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4214:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage104(4214): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage104(4214): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4215:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage107(4215): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage107(4215): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4216:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage108(4216): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage108(4216): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4217:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4218:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4219:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4220:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4221:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4222:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4223:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4224:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4225:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4226:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4227:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4228:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4229:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4230:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4231:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4232:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4233:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4234:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4235:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4236:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4237:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4238:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage109(4238): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage109(4238): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4239:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStage110(4239): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage110(4239): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4240:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4241:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4242:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4243:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4244:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4245:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4246:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4247:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4248:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4249:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4250:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4251:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            sub_100014184( "ASPMSPParseBufferToCxt: cbdr_outlier(4251): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_outlier(4251): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4252:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100014184( "ASPMSPParseBufferToCxt: cbdr_step_1(4252): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_1(4252): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4253:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100014184( "ASPMSPParseBufferToCxt: cbdr_step_2(4253): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_2(4253): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4254:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100014184( "ASPMSPParseBufferToCxt: cbdr_step_3(4254): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_3(4254): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4255:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            sub_100014184( "ASPMSPParseBufferToCxt: cbdr_step_4(4255): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_4(4255): Error adding 10 elements to context";
          goto LABEL_1981;
        default:
          switch(v17)
          {
            case 12288:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12289:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage200(12289): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage200(12289): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12290:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage201(12290): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage201(12290): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12291:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12292:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage202(12292): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage202(12292): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12293:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage203(12293): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage203(12293): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12294:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12295:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12296:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage204(12296): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage204(12296): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12297:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage205(12297): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage205(12297): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12298:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage206(12298): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage206(12298): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12299:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage207(12299): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage207(12299): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12300:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage208(12300): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage208(12300): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12301:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage209(12301): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage209(12301): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12302:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage200(12302): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage200(12302): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12303:
              if ((_DWORD)v16 != 32) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage201(12303): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage201(12303): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12304:
              if ((_DWORD)v16 != 32) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage202(12304): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage202(12304): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12305:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage210(12305): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage210(12305): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12306:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage211(12306): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage211(12306): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12307:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage203(12307): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage203(12307): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12308:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage204(12308): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage204(12308): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12309:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage205(12309): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage205(12309): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12310:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage206(12310): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage206(12310): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12311:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage207(12311): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage207(12311): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12312:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage208(12312): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage208(12312): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12313:
              if ((_DWORD)v16 != 32) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage209(12313): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage209(12313): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12314:
              if ((_DWORD)v16 != 32) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage210(12314): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage210(12314): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12315:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage212(12315): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage212(12315): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12316:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: initialReadStage213(12316): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage213(12316): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12317:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage211(12317): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage211(12317): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12318:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage212(12318): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage212(12318): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12319:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage213(12319): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage213(12319): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12320:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage214(12320): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage214(12320): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12321:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: readStage215(12321): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage215(12321): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12322:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12323:
              if ((_DWORD)v16 != 8) {
                sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): Error adding 1 elements to context";
              goto LABEL_1981;
            default:
              switch(v17)
              {
                case 4256:
                  if ((_DWORD)v16 != 40) {
                    sub_100014184( "ASPMSPParseBufferToCxt: cbdr_step_5(4256): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  goto LABEL_1372;
                case 4257:
                  if ((_DWORD)v16 != 40) {
                    sub_100014184( "ASPMSPParseBufferToCxt: cbdr_step_6(4257): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_6(4257): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4258:
                  if ((_DWORD)v16 != 40) {
                    sub_100014184( "ASPMSPParseBufferToCxt: cbdr_step_7(4258): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_7(4258): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4259:
                  if ((_DWORD)v16 != 80) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): Error adding 20 elements to context";
                  goto LABEL_1981;
                case 4260:
                  if ((_DWORD)v16 != 32) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): Error adding 8 elements to context";
                  goto LABEL_1981;
                case 4261:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4262:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4263:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4264:
                  if ((_DWORD)v16 != 16) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4265:
                  if ((_DWORD)v16 != 16) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4266:
                  if ((_DWORD)v16 != 16) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4267:
                  if ((_DWORD)v16 != 16) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4268:
                  if ((_DWORD)v16 != 16) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4269:
                  if ((_DWORD)v16 != 40) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4270:
                  if ((_DWORD)v16 != 40) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4271:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4272:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4273:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4274:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4275:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4276:
                  if ((_DWORD)v16 != 16) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4277:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4278:
                  if ((_DWORD)v16 != 4) {
                    sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): Error adding 1 elements to context";
                  goto LABEL_1981;
                default:
                  switch(v17)
                  {
                    case 4164:
                      if ((_DWORD)v16 != 4) {
                        sub_100014184( "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): cfg 1 elements; (1*4) cfg byte"
                      }
                          "s != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): Error adding 1 elements to context";
                      goto LABEL_1981;
                    case 4165:
                      if ((_DWORD)v16 != 60) {
                        sub_100014184( "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4166:
                      if ((_DWORD)v16 != 80) {
                        sub_100014184( "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): Error adding 20 elements to context";
                      goto LABEL_1981;
                    case 4167:
                      if ((_DWORD)v16 != 60) {
                        sub_100014184( "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4168:
                      if ((_DWORD)v16 != 80) {
                        sub_100014184( "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): Error adding 20 elements to context";
                      goto LABEL_1981;
                    default:
                      if (v17 <= 12323)
                      {
                        switch(v17)
                        {
                          case 8193:
                            if ((_DWORD)v16 != 20) {
                              sub_100014184( "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): Error adding 5 elements to context";
                            break;
                          case 8194:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: num_zq_failures(8194): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_zq_failures(8194): Error adding 1 elements to context";
                            break;
                          case 8195:
                            if ((_DWORD)v16 != 64) {
                              sub_100014184( "ASPMSPParseBufferToCxt: lower_die_temperature(8195): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8195): Error adding 16 elements to context";
                            break;
                          case 8196:
                            if ((_DWORD)v16 != 64) {
                              sub_100014184( "ASPMSPParseBufferToCxt: higher_die_temperature(8196): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8196): Error adding 16 elements to context";
                            break;
                          case 8197:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): cfg 1 elements; (1*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): Error adding 1 elements to context";
                            break;
                          case 8198:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): Error adding 1 elements to context";
                            break;
                          case 8199:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: device_config(8199): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: device_config(8199): Error adding 1 elements to context";
                            break;
                          case 8200:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): Error adding 1 elements to context";
                            break;
                          case 8201:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): Error adding 1 elements to context";
                            break;
                          case 8202:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: fw_updates(8202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: fw_updates(8202): Error adding 1 elements to context";
                            break;
                          case 8203:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): Error adding 1 elements to context";
                            break;
                          case 8204:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): Error adding 1 elements to context";
                            break;
                          case 8205:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): Error adding 1 elements to context";
                            break;
                          case 8206:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): Error adding 1 elements to context";
                            break;
                          case 8207:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): Error adding 1 elements to context";
                            break;
                          case 8208:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): Error adding 1 elements to context";
                            break;
                          case 8209:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_block_refresh(8209): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_refresh(8209): Error adding 1 elements to context";
                            break;
                          case 8210:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): Error adding 1 elements to context";
                            break;
                          case 8211:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): Error adding 1 elements to context";
                            break;
                          case 8212:
                            if ((_DWORD)v16 != 16) {
                              sub_100014184( "ASPMSPParseBufferToCxt: open_blocks_hist(8212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8212): Error adding 4 elements to context";
                            break;
                          case 8213:
                            if ((_DWORD)v16 != 24) {
                              sub_100014184( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): Error adding 6 elements to context";
                            break;
                          case 8214:
                            if ((_DWORD)v16 != 20) {
                              sub_100014184( "ASPMSPParseBufferToCxt: active_time_hist(8214): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8214): Error adding 5 elements to context";
                            break;
                          case 8215:
                            if ((_DWORD)v16 != 8) {
                              sub_100014184( "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): Error adding 2 elements to context";
                            break;
                          case 8216:
                            if ((_DWORD)v16 != 8) {
                              sub_100014184( "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): Error adding 2 elements to context";
                            break;
                          case 8217:
                            if ((_DWORD)v16 != 20) {
                              sub_100014184( "ASPMSPParseBufferToCxt: auto_skip(8217): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: auto_skip(8217): Error adding 5 elements to context";
                            break;
                          case 8218:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): Error adding 1 elements to context";
                            break;
                          case 8219:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): cfg 1 elements; (1*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): Error adding 1 elements to context";
                            break;
                          case 8220:
                            if ((_DWORD)v16 != 28) {
                              sub_100014184( "ASPMSPParseBufferToCxt: open_blocks_hist(8220): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8220): Error adding 7 elements to context";
                            break;
                          case 8221:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): Error adding 1 elements to context";
                            break;
                          case 8222:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): cfg 1 elements; (1*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): Error adding 1 elements to context";
                            break;
                          case 8223:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): cfg 1 elements; (1*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): Error adding 1 elements to context";
                            break;
                          case 8224:
                            if ((_DWORD)v16 != 32) {
                              sub_100014184( "ASPMSPParseBufferToCxt: active_time_hist(8224): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8224): Error adding 8 elements to context";
                            break;
                          case 8225:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): cfg 1 elements; (1*4)"
                            }
                                " cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): Error adding 1 elements to context";
                            break;
                          case 8226:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): cfg 1 elements; (1"
                            }
                                "*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): Error adding 1 el"
                                 "ements to context";
                            break;
                          case 8227:
                            if ((_DWORD)v16 != 28) {
                              sub_100014184( "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): cfg 7 elements; (7*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): Error adding 7 elements to context";
                            break;
                          case 8228:
                            if ((_DWORD)v16 != 16) {
                              sub_100014184( "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): cfg 4 elements; (4*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): Error adding 4 elements to context";
                            break;
                          case 8229:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: max_heap_usage(8229): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage(8229): Error adding 1 elements to context";
                            break;
                          case 8230:
                            if ((_DWORD)v16 != 24) {
                              sub_100014184( "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): cfg 6 elements; (6*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): Error adding 6 elements to context";
                            break;
                          case 8231:
                            if ((_DWORD)v16 != 64) {
                              sub_100014184( "ASPMSPParseBufferToCxt: lower_die_temperature(8231): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8231): Error adding 16 elements to context";
                            break;
                          case 8232:
                            if ((_DWORD)v16 != 64) {
                              sub_100014184( "ASPMSPParseBufferToCxt: higher_die_temperature(8232): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8232): Error adding 16 elements to context";
                            break;
                          case 8233:
                            if ((_DWORD)v16 != 24) {
                              sub_100014184( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): Error adding 6 elements to context";
                            break;
                          case 8234:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): Error adding 1 elements to context";
                            break;
                          case 8235:
                            if ((_DWORD)v16 != 28) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): cfg 7 elements; (7*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): Error adding 7 elements to context";
                            break;
                          case 8236:
                            if ((_DWORD)v16 != 28) {
                              sub_100014184( "ASPMSPParseBufferToCxt: boot_time_low_power(8236): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_low_power(8236): Error adding 7 elements to context";
                            break;
                          case 8237:
                            if ((_DWORD)v16 != 40) {
                              sub_100014184( "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): cfg 10 elements; (10*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): Error adding 10 elements to context";
                            break;
                          case 8238:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): Error adding 1 elements to context";
                            break;
                          case 8239:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): Error adding 1 elements to context";
                            break;
                          case 8240:
                            if ((_DWORD)v16 != 20) {
                              sub_100014184( "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): cfg 5 elements; (5*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): Error adding 5 elements to context";
                            break;
                          case 8241:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: num_pg_regrets(8241): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_regrets(8241): Error adding 1 elements to context";
                            break;
                          case 8242:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): Error adding 1 elements to context";
                            break;
                          case 8243:
                            if ((_DWORD)v16 != 4) {
                              sub_100014184( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): Error adding 1 elements to context";
                            break;
                          case 8244:
                            if ((_DWORD)v16 != 20) {
                              sub_100014184( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): cfg 5 elements; (5*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): Error adding 5 elements to context";
                            break;
                          default:
                            switch(v17)
                            {
                              case 4279:
                                if ((_DWORD)v16 != 16) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = v14;
                                break;
                              case 4280:
                                if ((_DWORD)v16 != 16) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): cfg 4 elements; (4*4) cfg bytes != ("
                                }
                                    "%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): Error adding 4 elements to context";
                                break;
                              case 4281:
                                if ((_DWORD)v16 != 40) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): cfg 10 elements; (10*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): Error adding 10 elements to context";
                                break;
                              case 4282:
                                if ((_DWORD)v16 != 60) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: slip_bch(4282): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: slip_bch(4282): Error adding 15 elements to context";
                                break;
                              case 4283:
                                if ((_DWORD)v16 != 40) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: read_fail(4283): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: read_fail(4283): Error adding 10 elements to context";
                                break;
                              case 4284:
                                if ((_DWORD)v16 != 40) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: tr_read_fail(4284): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_read_fail(4284): Error adding 10 elements to context";
                                break;
                              case 4285:
                                if ((_DWORD)v16 != 40) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): cfg 10 elements; (10*4) cfg bytes "
                                }
                                    "!= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): Error adding 10 elements to context";
                                break;
                              case 4286:
                                if ((_DWORD)v16 != 20) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): cfg 5 elements; (5*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): Error adding 5 elements to context";
                                break;
                              case 4287:
                                if ((_DWORD)v16 != 4) {
                                  sub_100014184( "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): cfg 1 elements; (1*4) cfg bytes !="
                                }
                                    " (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): Error adding 1 elements to context";
                                break;
                              default:
                                goto LABEL_1404;
                            }

                            goto LABEL_1981;
                        }

                        goto LABEL_1981;
                      }

                      switch(v17)
                      {
                        case 12326:
                          if ((_DWORD)v16 != 8) {
                            sub_100014184( "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100023E58(a1, "initialReadStageParameter2", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12325:
                          if ((_DWORD)v16 != 8) {
                            sub_100014184( "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100023E58(a1, "initialReadStageParameter1", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12324:
                          if ((_DWORD)v16 != 8) {
                            sub_100014184( "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): cfg 1 elements; (1*8) cfg bytes !"
                          }
                              "= (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!sub_100023E58(a1, "dspExceptionParameter144", v11, 8u, v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        default:
LABEL_1404:
                          switch(v17)
                          {
                            case 8245:
                              if ((_DWORD)v16 != 4) {
                                sub_100014184( "ASPMSPParseBufferToCxt: spi_num_uses(8245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: spi_num_uses(8245): Error adding 1 elements to context";
                              break;
                            case 8246:
                              if ((_DWORD)v16 != 20) {
                                sub_100014184( "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): cfg 5 elements; (5*4) cfg bytes !"
                              }
                                  "= (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): Error adding 5 elements to context";
                              break;
                            case 8247:
                              if ((_DWORD)v16 != 36) {
                                sub_100014184( "ASPMSPParseBufferToCxt: rd_window_dist(8247): cfg 9 elements; (9*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist(8247): Error adding 9 elements to context";
                              break;
                            case 8248:
                              if ((_DWORD)v16 != 36) {
                                sub_100014184( "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): cfg 9 elements; (9*4) cfg "
                              }
                                  "bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): Error adding 9 elements to context";
                              break;
                            case 8249:
                              if ((_DWORD)v16 != 8) {
                                sub_100014184( "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): cfg 2 elements; (2*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): Error adding 2 elements to context";
                              break;
                            case 8250:
                              if ((_DWORD)v16 != 120) {
                                sub_100014184( "ASPMSPParseBufferToCxt: lower_die_temperature(8250): cfg 30 elements; (30*4) cfg bytes"
                              }
                                  " != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8250): Error adding 30 elements to context";
                              break;
                            case 8251:
                              if ((_DWORD)v16 != 120) {
                                sub_100014184( "ASPMSPParseBufferToCxt: higher_die_temperature(8251): cfg 30 elements; (30*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8251): Error adding 30 elements to context";
                              break;
                            case 8252:
                              if ((_DWORD)v16 != 36) {
                                sub_100014184( "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): cfg 9 elements; (9*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): Error adding 9 elements to context";
                              break;
                            case 8253:
                              if ((_DWORD)v16 != 16) {
                                sub_100014184( "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): cfg 4 elements; (4*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): Error adding 4 elements to context";
                              break;
                            case 8254:
                              if ((_DWORD)v16 != 4) {
                                sub_100014184( "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): cfg 1 elements; (1*4) cfg bytes !="
                              }
                                  " (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): Error adding 1 elements to context";
                              break;
                            case 8255:
                              if ((_DWORD)v16 != 4) {
                                sub_100014184( "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): cfg 1 elements; (1*4) cfg b"
                              }
                                  "ytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): Error adding 1 elements to context";
                              break;
                            case 8256:
                              if ((_DWORD)v16 != 4) {
                                sub_100014184( "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): cfg 1 elements; (1*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): Error adding 1 elements to context";
                              break;
                            case 8257:
                              if ((_DWORD)v16 != 8) {
                                sub_100014184( "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): cfg 2 elements; (2*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): Error adding 2 elements to context";
                              break;
                            default:
                              switch(v17)
                              {
                                case 16384:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: fw_version_identifier(16384): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: fw_version_identifier(16384): Error adding 1 elements to context";
                                  break;
                                case 16385:
                                  if ((_DWORD)v16 != 40) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): cfg 5 elements; (5*8) cfg b"
                                  }
                                      "ytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): Error adding 5 elements to context";
                                  break;
                                case 16386:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): cfg 1 elements;"
                                  }
                                      " (1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_100023E58( a1,  "number_gracefull_read_terminations",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): Error adding 1"
                                       " elements to context";
                                  break;
                                case 16387:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): Error adding 1 elements to context";
                                  break;
                                case 16388:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: num_pg_events(16388): cfg 1 elements; (1*8) cfg bytes != ("
                                  }
                                      "%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_events(16388): Error adding 1 elements to context";
                                  break;
                                case 16389:
                                  if ((_DWORD)v16 != 128) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: algo_queue_depth(16389): cfg 16 elements; (16*8) cfg bytes"
                                  }
                                      " != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: algo_queue_depth(16389): Error adding 16 elements to context";
                                  break;
                                case 16390:
                                  if ((_DWORD)v16 != 128) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): cfg 16 elements; (16*8) cfg byt"
                                  }
                                      "es != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): Error adding 16 elements to context";
                                  break;
                                case 16391:
                                  if ((_DWORD)v16 != 48) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): cfg 6 elements; (6*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): Error adding 6 elements to context";
                                  break;
                                case 16392:
                                  if ((_DWORD)v16 != 48) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): cfg 6 elements; (6*8) cf"
                                  }
                                      "g bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): Error adding 6 elements to context";
                                  break;
                                case 16393:
                                  if ((_DWORD)v16 != 8) {
                                    sub_100014184( "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): cfg 1 elements; "
                                  }
                                      "(1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (sub_100023E58( a1,  "num_idle_die_read_cache_terminate",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): Error adding 1 "
                                       "elements to context";
                                  break;
                                default:
                                  goto LABEL_1373;
                              }

                              goto LABEL_1981;
                          }

                          goto LABEL_1981;
                      }

LABEL_1372:
                      uint64_t v8 = v8 + v22;
LABEL_1373:
                      uint64_t v13 = &jpt_100028234;
                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }

      goto LABEL_461;
  }

uint64_t sub_10002A8EC(uint64_t result, const char *a2, const char *a3, uint64_t a4)
{
  if (result)
  {
    int v7 = (void *)result;
    uint64_t v8 = (char *)calloc(1uLL, 0x78uLL);
    unint64_t v9 = calloc(1uLL, 0x78uLL);
    unsigned int v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = v7[1];
      if (v11 && (uint64_t v12 = v7[3]) != 0)
      {
        *(void *)(v11 + 112) = v9;
        uint64_t v13 = (char **)(v12 + 112);
      }

      else
      {
        *int v7 = v9;
        uint64_t v13 = (char **)(v7 + 2);
      }

      __int16 *v13 = v8;
      v7[1] = v9;
      v7[3] = v8;
      *((void *)v8 + 14) = 0LL;
      *((void *)v9 + 14) = 0LL;
      snprintf(v9, 0x63uLL, "%s%s", a2, a3);
      v10[99] = 0;
      snprintf(v8, 0x63uLL, "%llu", a4);
      v8[99] = 0;
      *((void *)v8 + 13) = a4;
      return 1LL;
    }

    else
    {
      if (v8) {
        free(v8);
      }
      if (v10) {
        free(v10);
      }
      return 0LL;
    }
  }

  return result;
}

double sub_10002A9F0(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(void **)a1;
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)v2[14];
        free(v2);
        int v2 = v3;
      }

      while (v3);
    }

    int v4 = *(void **)(a1 + 16);
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)v4[14];
        free(v4);
        int v4 = v5;
      }

      while (v5);
    }

    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return result;
}

uint64_t sub_10002AA48(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc(0x78uLL);
  unint64_t v9 = malloc(0x78uLL);
  unsigned int v10 = v9;
  uint64_t v11 = a1[1];
  if (v11 && (uint64_t v12 = a1[3]) != 0)
  {
    *(void *)(v11 + 112) = v9;
    uint64_t v13 = (char **)(v12 + 112);
  }

  else
  {
    *a1 = v9;
    uint64_t v13 = (char **)(a1 + 2);
  }

  __int16 *v13 = v8;
  a1[1] = v9;
  a1[3] = v8;
  *((void *)v8 + 14) = 0LL;
  v9[14] = 0LL;
  snprintf((char *)v9, 0x63uLL, "%s%s", a2, a3);
  *((_BYTE *)v10 + 99) = 0;
  uint64_t result = snprintf(v8, 0x63uLL, "%llu", a4);
  v8[99] = 0;
  *((void *)v8 + 13) = a4;
  return result;
}

CFDictionaryRef ASP_GetIndirectionTableStatistics()
{
  uint64_t v16 = IND_POOL_KEY[0];
  uint64_t v12 = 0LL;
  v0 = (const __CFDictionary *)sub_10002B078(10, &v12);
  CFDictionaryRef v1 = v0;
  if (v0)
  {
    float v13 = 0.0;
    keys[0] = IND_POOL_SIZE_KEY[0];
    keys[1] = IND_POOL_FREE_KEY[0];
    keys[2] = IND_POOL_FULL_KEY;
    if ((v12 & 0xFFFFFFF8) != 0)
    {
      int v2 = 0;
      int v3 = 0;
      unint64_t v4 = 0LL;
      unint64_t v5 = 0LL;
      unsigned int v6 = v0;
      do
      {
        unint64_t v9 = *(void *)v6;
        int v7 = (unint64_t *)((char *)v6 + 8);
        unint64_t v8 = v9;
        if ((_DWORD)v9 == 12)
        {
          unint64_t v4 = *v7;
          int v3 = 1;
        }

        else if ((_DWORD)v8 == 13)
        {
          unint64_t v5 = *v7;
          int v2 = 1;
        }

        if ((v3 & v2 & 1) != 0) {
          break;
        }
        unsigned int v6 = (const __CFDictionary *)&v7[HIDWORD(v8)];
      }

      while (v6 < (char *v0 + (v12 & 0xFFFFFFF8)));
      unint64_t v14 = v4;
      unint64_t valuePtr = v5;
      if (v5) {
        float v13 = 1.0 - (float)((float)v4 / (float)v5);
      }
    }

    else
    {
      unint64_t v14 = 0LL;
      unint64_t valuePtr = 0LL;
    }

    values = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
    CFTypeRef cf = CFNumberCreate(0LL, kCFNumberSInt64Type, &v14);
    CFTypeRef v19 = CFNumberCreate(0LL, kCFNumberFloat32Type, &v13);
    CFDictionaryRef v10 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)&values,  3LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFRelease(values);
    CFRelease(cf);
    CFRelease(v19);
    free(v1);
    keys[0] = v10;
    CFDictionaryRef v1 = CFDictionaryCreate( 0LL,  (const void **)&v16,  (const void **)keys,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFRelease(keys[0]);
  }

  return v1;
}

void *sub_10002ACF8(char **a1, int a2, int a3, int a4, void *a5, char a6, char a7)
{
  float v13 = a1;
  unsigned int v21 = 0LL;
  *a5 = 0LL;
  if (!a1 && (!sub_10002B110(&v21) || (float v13 = v21) == 0LL || !*((_DWORD *)v21 + 4)))
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
LABEL_11:
    CFTypeRef v19 = 0LL;
    goto LABEL_14;
  }

  int v14 = a3;
  unsigned int v15 = sub_10002AE94((uint64_t)v13, a2, a3, a4, a7);
  if (!v15)
  {
    fprintf(__stderrp, "failed to get data size for cmd option %d\n", a2);
    goto LABEL_11;
  }

  uint64_t v16 = v15;
  size_t v17 = (vm_page_size + v15 - 1) / vm_page_size * vm_page_size;
  uint64_t v18 = valloc(v17);
  CFTypeRef v19 = v18;
  if (v18)
  {
    bzero(v18, v17);
    if ((sub_10002AF58((uint64_t)v13, a2, v14, a4, v19, v17, a6, a7) & 1) != 0)
    {
      *a5 = v16;
    }

    else
    {
      free(v19);
      CFTypeRef v19 = 0LL;
      *a5 = 0LL;
    }
  }

  else
  {
    fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
  }

uint64_t sub_10002AE94(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v7;
  uint64_t result;
  size_t outputStructCnt;
  unsigned int outputStruct;
  _DWORD inputStruct[3];
  uint64_t v12;
  int v13;
  float v13 = 0;
  uint64_t v12 = 0LL;
  outputStructCnt = 4LL;
  inputStruct[0] = a2;
  inputStruct[1] = a3 | 1;
  inputStruct[2] = a4;
  int v7 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  &outputStruct,  &outputStructCnt);
  if (v7)
  {
    if ((a5 & 1) == 0) {
      fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v7);
    }
    return 0LL;
  }

  else
  {
    uint64_t result = outputStruct;
    if (!outputStruct && (a5 & 1) == 0)
    {
      fprintf(__stderrp, "SizeOnly for tunnel command 0x%x returned 0\n", a2);
      return outputStruct;
    }
  }

  return result;
}

uint64_t sub_10002AF58(uint64_t a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  kern_return_t v15;
  size_t v16;
  _DWORD inputStruct[3];
  uint64_t v19;
  int v20;
  size_t outputStructCnt;
  LOBYTE(v9) = a7;
  outputStructCnt = a6;
  unsigned int v20 = 0;
  CFTypeRef v19 = 0LL;
  while (1)
  {
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    inputStruct[2] = a4;
    unsigned int v15 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  outputStruct,  &outputStructCnt);
    if (v15 != -536870211) {
      break;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    if ((a8 & 1) == 0) {
      fprintf(__stderrp, "CoreDebugTunnel 0x%x returned kIOReturnNoMemory\n", a2);
    }
    uint64_t v16 = outputStructCnt;
    outputStructCnt = vm_page_size;
    uint64_t v9 = 1LL;
    if (vm_page_size == v16) {
      return v9;
    }
  }

  if (!v15) {
    return 1LL;
  }
LABEL_10:
  if ((a8 & 1) == 0) {
    fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v15);
  }
  return 0LL;
}

void *sub_10002B078(int a1, void *a2)
{
  return sub_10002ACF8(0LL, a1, 0, 0, a2, 0, 0);
}

void *sub_10002B098()
{
  return &unk_1000662F8;
}

void *sub_10002B0A4()
{
  return &unk_100066300;
}

void *sub_10002B0B0()
{
  return &unk_100066308;
}

void *sub_10002B0BC()
{
  return &unk_100066318;
}

void *sub_10002B0C8()
{
  return &unk_100066320;
}

void *sub_10002B0D4()
{
  return &unk_100066328;
}

void *sub_10002B0E0()
{
  return &unk_100066330;
}

void *sub_10002B0EC()
{
  return &unk_100066338;
}

void *sub_10002B0F8()
{
  return &unk_100066310;
}

void *sub_10002B104()
{
  return &unk_100066340;
}

char *sub_10002B110(char ***a1)
{
  io_connect_t connect = 0;
  *a1 = 0LL;
  int v2 = pthread_mutex_trylock(&stru_100066348);
  if (v2)
  {
    if (v2 != 16
      || (syslog(4, "Warning: NANDInfo: NANDExporter: serializeAccess already locked. waiting for lock !\n"),
          pthread_mutex_lock(&stru_100066348)))
    {
      int v3 = __error();
      syslog(3, "Error: NANDInfo: NANDExporter: pthread_mutex_trylock() (%d) failed \n", *v3);
      return 0LL;
    }
  }

  syslog(5, "NANDInfo: NANDExporter object locked ! \n");
  unint64_t v5 = &off_100066388;
  uint64_t result = off_100066388;
  if (!off_100066388)
  {
LABEL_11:
    io_object_t v8 = 0;
    goto LABEL_12;
  }

  while (1)
  {
    unsigned int v6 = IOServiceMatching(result);
    if (!v6) {
      goto LABEL_10;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService) {
      goto LABEL_10;
    }
    io_object_t v8 = MatchingService;
    if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
      break;
    }
    IOServiceClose(connect);
    io_connect_t connect = 0;
    IOObjectRelease(v8);
LABEL_10:
    uint64_t v9 = v5[21];
    v5 += 21;
    uint64_t result = (char *)v9;
    if (!v9) {
      goto LABEL_11;
    }
  }

  syslog(5, "NANDInfo: findNandExporter_tunnel: Controller found: %s\n", *v5);
  uint64_t result = (char *)1;
LABEL_12:
  *((_DWORD *)v5 + 4) = connect;
  *((_DWORD *)v5 + 5) = v8;
  *a1 = v5;
  return result;
}

uint64_t sub_10002B258(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 16) = 0;
  }

  io_object_t v3 = *(_DWORD *)(a1 + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 20) = 0;
  }

  syslog(5, "NANDInfo: NANDExporter object unlocked ! \n");
  return pthread_mutex_unlock(&stru_100066348);
}

void sub_10002B2AC(void *a1)
{
  CFDictionaryRef v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100004408();
  sub_1000043D0((void *)&_mh_execute_header, v2, v3, "Failed to create readme file %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002B324(void *a1)
{
  CFDictionaryRef v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100004408();
  sub_1000043D0( (void *)&_mh_execute_header,  v2,  v3,  "Failed to create shared directories map file %@",  v4,  v5,  v6,  v7,  v8);

  sub_1000043F4();
}

void sub_10002B39C(void *a1)
{
  CFDictionaryRef v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100004408();
  sub_1000043D0( (void *)&_mh_execute_header,  v2,  v3,  "Failed to open log file; logging will be redirected to stderr %@",
    v4,
    v5,
    v6,
    v7,
    v8);

  sub_1000043F4();
}

void sub_10002B414(void *a1)
{
}

void sub_10002B480()
{
}

void sub_10002B4E0(void *a1, void *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  [v3 UTF8String];
  id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
  [v4 UTF8String];
  sub_100004444();
  sub_100004420((void *)&_mh_execute_header, v5, v6, "Failed to save metadata to file, %s:\n%s", v7, v8, v9, v10, v11);

  sub_100004434();
}

void sub_10002B588(void *a1, id *a2)
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 _workingDirectoryPath]);
  [v3 UTF8String];
  id v4 = objc_claimAutoreleasedReturnValue([*a2 localizedDescription]);
  [v4 UTF8String];
  sub_100004444();
  sub_100004420((void *)&_mh_execute_header, v5, v6, "Failed to delete directory %s: %s", v7, v8, v9, v10, v11);

  sub_100004434();
}

void sub_10002B630()
{
  v0 = sub_100005D7C();
  sub_100005D74(v0);
  sub_100004408();
  sub_1000043D0( (void *)&_mh_execute_header,  v1,  v2,  "Error: Failed to fetch bytes for pids with proc_listpids for PROC_ALL_PIDS: %s",  v3,  v4,  v5,  v6,  v7);
  sub_1000043F4();
}

void sub_10002B69C()
{
  v0 = sub_100005D7C();
  sub_100005D74(v0);
  sub_100004408();
  sub_1000043D0( (void *)&_mh_execute_header,  v1,  v2,  "Error: Failed to allocate memory to read pids into: %s",  v3,  v4,  v5,  v6,  v7);
  sub_1000043F4();
}

void sub_10002B708()
{
  v0 = sub_100005D7C();
  sub_100005D74(v0);
  sub_100004408();
  sub_1000043D0((void *)&_mh_execute_header, v1, v2, "Error: Failed to fetch pids: %s", v3, v4, v5, v6, v7);
  sub_1000043F4();
}

void sub_10002B774(int a1, void *a2)
{
  id v5 = objc_msgSend(sub_100005D54(a1, a2), "UTF8String");
  *(_DWORD *)uint64_t v4 = 136315138;
  *uint64_t v3 = v5;
  sub_100005D4C((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s", v4);
  sub_100005D68();
}

void sub_10002B7C4(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to compress %s", (uint8_t *)&v3, 0xCu);
}

void sub_10002B83C()
{
}

void sub_10002B89C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Dispatching for snapshot request execution",  v1,  2u);
  sub_100004400();
}

void sub_10002B8D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B908( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B938(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_10000CE2C(a1, a2), "progress");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000CE50((uint64_t)v5, 5.7779e-34);
  sub_10000CE24((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Exported progress: %@", v3);

  sub_100005D68();
}

void sub_10002B990(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 progress]);
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "Exported progress: %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002BA08(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "__miscProgress"));
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "Misc progress: %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002BA80(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "__spaceAttributionProgress"));
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "SpaceAttribution progress: %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002BAF8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "__archivingProgress"));
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "Archving progress: %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002BB70(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "__cacheDeleteProgress"));
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "CacheDelete progress: %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002BBE8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "__atcProgress"));
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "ATC progress: %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002BC60( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BCD4()
{
  __assert_rtn( "-[DSSnapshotRequest __createSnapshotFileManagerUsingProvider:error:]",  "DSSnapshotRequest.m",  462,  "_snapshotFileManager == nil");
}

void sub_10002BCFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BD70()
{
  __assert_rtn( "-[DSSnapshotRequest __createPreSnapshotVolumeManagerUsingProvider:error:]",  "DSSnapshotRequest.m",  532,  "self._volumeManager == nil");
}

void sub_10002BD98()
{
  __assert_rtn( "-[DSSnapshotRequest __releasePowerAssertions]",  "DSSnapshotRequest.m",  651,  "___powerAssertionIDs != nil");
}

void sub_10002BDC0(void *a1, os_log_s *a2, double a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "__powerAssertionIDs"));
  sub_100004408();
  __int16 v7 = 2048;
  uint64_t v8 = 0x409C200000000000LL;
  __int16 v9 = 2048;
  double v10 = a3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "FilesystemMetadataSnapshot power assertion(s) timed out: %@. Assertion taken for %f sec, snapshot duration: %f sec",  v6,  0x20u);
}

void sub_10002BE78()
{
}

void sub_10002BED8()
{
}

void sub_10002BF38()
{
  __assert_rtn( "-[DSSnapshotRequest __createPowerAssertions]",  "DSSnapshotRequest.m",  688,  "___powerAssertionIDs == nil");
}

void sub_10002BF60(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *AirTrafficLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DSSnapshotRequest.m",  40,  @"%s",  *a1);

  __break(1u);
}

void sub_10002BFDC()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getATConnectionClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"DSSnapshotRequest.m",  41,  @"Unable to find class %s",  "ATConnection");

  __break(1u);
}

void sub_10002C054(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "__eventName"));
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Payload for %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10002C104()
{
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Using safe string '%{public}@' for '%{public}s'",  v2,  0x16u);
  sub_100007FF4();
}

void sub_10002C180()
{
}

void sub_10002C1E4()
{
}

void sub_10002C248(void *a1)
{
  uint64_t v1 = sub_100012130();
  sub_100005D74(v1);
  sub_1000120F8();
  sub_100004420( (void *)&_mh_execute_header,  v2,  v3,  "Failed to allocate buffer for processing attribution tags in directory %s with error %s",  v4,  v5,  v6,  v7,  v8);
  sub_1000043F4();
}

void sub_10002C2BC(void *a1)
{
  uint64_t v1 = sub_100012130();
  sub_100005D74(v1);
  sub_1000120F8();
  sub_100004420((void *)&_mh_execute_header, v2, v3, "Couldn't open directory %s with error %s", v4, v5, v6, v7, v8);
  sub_1000043F4();
}

void sub_10002C330()
{
  uint64_t v0 = sub_100005D7C();
  sub_100005D74(v0);
  sub_1000120F8();
  sub_100004420( (void *)&_mh_execute_header,  v1,  v2,  "getattrlistbulk on path %@ failed with error %s",  v3,  v4,  v5,  v6,  v7);
  sub_1000043F4();
}

void sub_10002C39C(void *a1, os_log_s *a2)
{
}

void sub_10002C410(void *a1)
{
  uint64_t v1 = sub_100012130();
  sub_100005D74(v1);
  sub_1000120F8();
  sub_100004420( (void *)&_mh_execute_header,  v2,  v3,  "APFSIOC_DIR_STATS_OP failed for %s with error %s",  v4,  v5,  v6,  v7,  v8);
  sub_1000043F4();
}

void sub_10002C484(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = 160000LL;
  sub_100012110((void *)&_mh_execute_header, a1, a3, "can't malloc %llu bytes", (uint8_t *)&v3);
  sub_100007FF4();
}

void sub_10002C4F8()
{
  uint64_t v0 = sub_100005D7C();
  sub_100005D74(v0);
  sub_1000120F8();
  sub_100004420( (void *)&_mh_execute_header,  v1,  v2,  "APFSIOC_GET_SHARED_EXTENTS failed for %s with error %s",  v3,  v4,  v5,  v6,  v7);
  sub_1000043F4();
}

void sub_10002C564(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 512;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Can't malloc %u buffers to collect purgeable files data",  (uint8_t *)v1,  8u);
  sub_100004400();
}

void sub_10002C5DC()
{
  uint64_t v0 = sub_100005D7C();
  sub_100005D74(v0);
  sub_1000120F8();
  sub_100004420( (void *)&_mh_execute_header,  v1,  v2,  "APFSIOC_PURGEABLE_GET_BULK_INFO failed for %s with error %s",  v3,  v4,  v5,  v6,  v7);
  sub_1000043F4();
}

void sub_10002C648()
{
}

void sub_10002C6B4()
{
}

void sub_10002C720(void *a1, os_log_s *a2)
{
}

void sub_10002C794(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 progress]);
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "Listing progress: %@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002C80C(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 progress]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Listing progress: %@", a1, 0xCu);
}

void sub_10002C880(uint64_t *a1, int __errnum, os_log_s *a3)
{
  uint64_t v4 = *a1;
  int v5 = 136315650;
  uint64_t v6 = v4;
  __int16 v7 = 1024;
  int v8 = __errnum;
  __int16 v9 = 2080;
  double v10 = strerror(__errnum);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "fstatat() failed for [parent] file at %s/..: %d (%s)",  (uint8_t *)&v5,  0x1Cu);
}

void sub_10002C934(void *a1)
{
  uint64_t v1 = sub_100012130();
  sub_100005D74(v1);
  sub_1000120F8();
  sub_100004420((void *)&_mh_execute_header, v2, v3, "Failed to strdup() string %s with error %s", v4, v5, v6, v7, v8);
  sub_1000043F4();
}

void sub_10002C9A8(void *a1, os_log_s *a2)
{
}

void sub_10002CA1C(void *a1, os_log_s *a2)
{
}

void sub_10002CA90(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100004408();
  sub_100012110((void *)&_mh_execute_header, a2, v4, "%{public}@", v5);

  sub_1000043F4();
}

void sub_10002CB10()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Failed to get used bytes for volume at %{public}s, using getattrlist(): %{darwin.errno}d",  v2,  0x12u);
  sub_100007FF4();
}

void sub_10002CB8C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  int v4 = @"StatFS provider cannot be nil";
  sub_100012110((void *)&_mh_execute_header, a1, a3, "%@", (uint8_t *)&v3);
  sub_100007FF4();
}

void sub_10002CC00(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  int v4 = @"Used bytes provider cannot be nil";
  sub_100012110((void *)&_mh_execute_header, a1, a3, "%@", (uint8_t *)&v3);
  sub_100007FF4();
}

void sub_10002CC74(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 volumesForSnapshotting]);
  sub_100004408();
  sub_10000CE10((void *)&_mh_execute_header, v2, v3, "Volumes for snapshotting: %{public}@", v4, v5, v6, v7, v8);

  sub_1000043F4();
}

void sub_10002CCEC()
{
}

void sub_10002CD18(void *a1)
{
}

void sub_10002CD8C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "AppleAPFSVolume";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error: Could not create matching dictionary for %s",  (uint8_t *)&v1,  0xCu);
}

void sub_10002CE0C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  (uint8_t *)v2,  8u);
}

void sub_10002CE80()
{
}

void sub_10002CEA8(void *a1)
{
}

void sub_10002CF18()
{
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}