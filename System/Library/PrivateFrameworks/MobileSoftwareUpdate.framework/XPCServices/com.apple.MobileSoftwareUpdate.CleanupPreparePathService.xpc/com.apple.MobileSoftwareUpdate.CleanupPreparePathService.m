CFTypeRef copy_nvram_variable_with_system_nvram_check(const __CFString *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFStringRef v7;
  CFTypeRef CFProperty;
  io_registry_entry_t v9;
  io_object_t v10;
  char v12;
  mach_port_t mainPort;
  mainPort = 0;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    v7 = @"Could not get master port\n";
  }

  else
  {
    v9 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v9)
    {
      v10 = v9;
      CFProperty = IORegistryEntryCreateCFProperty(v9, a1, kCFAllocatorDefault, 0);
      IOObjectRelease(v10);
      return CFProperty;
    }

    v7 = @"Could not get options entry from the device tree\n";
  }

  logfunction("", 1, v7, v2, v3, v4, v5, v6, v12);
  return 0LL;
}

CFTypeRef copy_nvram_variable(const __CFString *a1)
{
  return copy_nvram_variable_with_system_nvram_check(a1);
}

BOOL set_nvram_object( const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return set_nvram_object_with_system_nvram_check(a1, a2, 0LL, a4, a5, a6, a7, a8);
}

BOOL set_nvram_object_with_system_nvram_check( const __CFString *a1, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFStringRef v18;
  char v20;
  if (!a1)
  {
    v18 = @"Can't insert nil key into registry\n";
LABEL_10:
    logfunction("", 1, v18, a4, a5, a6, a7, a8, v20);
    return 0LL;
  }

  BOOL v8 = a2;
  if (!a2)
  {
    logfunction("", 1, @"Can't insert nil object into registry\n", a4, a5, a6, a7, a8, v20);
    return v8;
  }

  io_registry_entry_t v10 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
  if (!v10)
  {
    v18 = @"Failed to locate IODeviceTree options in IO registry\n";
    goto LABEL_10;
  }

  io_object_t v11 = v10;
  v12 = IORegistryEntrySetCFProperty(v10, a1, (CFTypeRef)v8);
  BOOL v8 = v12 == 0;
  if (v12) {
    logfunction("", 1, @"Failed to set key %@ in IO registry: %d\n", v13, v14, v15, v16, v17, (char)a1);
  }
  IOObjectRelease(v11);
  return v8;
}

uint64_t delete_nvram_variable(const __CFString *a1)
{
  return msu_delete_nvram_variable_if_exists(a1, &v2);
}

uint64_t msu_delete_nvram_variable_if_exists(const __CFString *a1, _BYTE *a2)
{
  __int128 v44 = 0u;
  __int128 v45 = 0u;
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
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  *(_OWORD *)buffer = 0u;
  __int128 v15 = 0u;
  BOOL v4 = msu_nvram_exists(a1);
  CFStringGetCString(a1, buffer, 511LL, 0x8000100u);
  if (!v4)
  {
    v12 = @"%s: NVRAM %s not found..Nothing to do\n\n";
    goto LABEL_5;
  }

  BOOL v10 = set_nvram_object_with_system_nvram_check(@"IONVRAM-DELETE-PROPERTY", (BOOL)a1, 0LL, v5, v6, v7, v8, v9);
  uint64_t v11 = 0LL;
  if (v10)
  {
    v12 = @"%s: Deleted value %s\n\n";
LABEL_5:
    uint64_t v11 = 1LL;
    logfunction("", 1, v12, v5, v6, v7, v8, v9, (char)"msu_delete_nvram_variable_if_exists");
  }

  *a2 = v4;
  return v11;
}

BOOL msu_nvram_exists(const __CFString *a1)
{
  CFTypeRef v1 = copy_nvram_variable_with_system_nvram_check(a1);
  CFTypeRef v2 = v1;
  if (v1) {
    CFRelease(v1);
  }
  return v2 != 0LL;
}

BOOL set_nvram_variable( char *cStr, BOOL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!cStr)
  {
    __int128 v23 = @"Can't set null key name into NVRAM\n";
LABEL_11:
    logfunction("", 1, v23, a4, a5, a6, a7, a8, v25);
    return 0LL;
  }

  BOOL v8 = a2;
  if (!a2)
  {
    logfunction("", 1, @"Can't set NULL value into NVRAM\n", a4, a5, a6, a7, a8, v25);
    return v8;
  }

  CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v9)
  {
    __int128 v23 = @"Failed to allocate string for key\n";
    goto LABEL_11;
  }

  BOOL v10 = v9;
  CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v8, 0x8000100u);
  if (!v11)
  {
    logfunction("", 1, @"Failed to allocate string for value\n", v12, v13, v14, v15, v16, v25);
    CFRelease(v10);
    return 0LL;
  }

  CFStringRef v17 = v11;
  BOOL v8 = set_nvram_object_with_system_nvram_check(v10, (BOOL)v11, 0LL, v12, v13, v14, v15, v16);
  if (!v8) {
    logfunction("", 1, @"Failed to set value into NVRAM\n", v18, v19, v20, v21, v22, v25);
  }
  CFRelease(v10);
  CFRelease(v17);
  return v8;
}

BOOL msu_sync_nvram( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    BOOL v8 = @"IONVRAM-FORCESYNCNOW-PROPERTY";
  }
  else {
    BOOL v8 = @"IONVRAM-SYNCNOW-PROPERTY";
  }
  return set_nvram_object_with_system_nvram_check(v8, (BOOL)v8, 0LL, a4, a5, a6, a7, a8);
}

int *logfunctionv(const char *a1, int a2, const __CFString *a3, va_list a4)
{
  int v8 = *__error();
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (a1) {
    CFStringRef v9 = a1;
  }
  else {
    CFStringRef v9 = "";
  }
  if (logfunctionv_onceToken != -1) {
    dispatch_once(&logfunctionv_onceToken, &__block_literal_global);
  }
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a3, a4);
  pthread_t v11 = pthread_self();
  uint64_t v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%08llx %s: %@", v11, v9, v10);
  CFRelease(v10);
  if (v12)
  {
    uint64_t v13 = __dst;
    if (CFStringGetCString(v12, __dst, 1024LL, 0x8000100u))
    {
      uint64_t v14 = 0LL;
    }

    else
    {
      CFIndex Length = CFStringGetLength(v12);
      CFIndex v17 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      uint64_t v14 = (char *)malloc(v17);
      CFStringGetCString(v12, v14, v17, 0x8000100u);
      uint64_t v13 = v14;
    }

    size_t v15 = strlen(v13);
    CFRelease(v12);
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    size_t v15 = 0LL;
  }

  uint64_t v18 = (os_log_s *)logfunctionv_logObject;
  if (logfunctionv_logObject
    || (uint64_t v18 = os_log_create("com.apple.MobileSoftwareUpdate", "Info"), (logfunctionv_logObject = (uint64_t)v18) != 0))
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }

  if (console_fd != -1) {
    write(console_fd, v13, v15);
  }
  if (a2)
  {
    openRestoreLogFile(0);
    writeToRestoreLogFile(v13, v15);
  }

  fprintf(__stderrp, "%s: %s", v9, v13);
  free(v14);
  result = __error();
  int *result = v8;
  return result;
}

void __logfunctionv_block_invoke(id a1)
{
  if (getenv("__OSINSTALL_ENVIRONMENT")) {
    console_fd = open("/dev/console", 131082);
  }
}

int *logfunction( const char *a1, int a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return logfunctionv(a1, a2, a3, &a9);
}

uint64_t msuSharedLogger()
{
  if (msuSharedLogger_pred != -1) {
    dispatch_once(&msuSharedLogger_pred, &__block_literal_global_0);
  }
  return msuSharedLogger___instance;
}

void __msuSharedLogger_block_invoke(id a1)
{
  msuSharedLogger___instance = (uint64_t)os_log_create("com.apple.MobileSoftwareUpdate", "cleanup");
}

uint64_t openRestoreLogFile(int a1)
{
  return openRestoreLogFileWithPath("/private/var/MobileSoftwareUpdate/restore.log", a1);
}

uint64_t openRestoreLogFileWithPath(const char *a1, int a2)
{
  uint64_t v2 = _restoreLogFD;
  if (_restoreLogFD < 0)
  {
    if (!a2 && _restoreLogFD == -2) {
      return 0xFFFFFFFFLL;
    }
    _restoreLogFD = -2;
    if (mkparentdir((uint64_t)a1, 0x1EDu))
    {
      __error();
      BOOL v4 = __error();
      strerror(*v4);
      uint64_t v5 = @"Could not create path %s: %s\n";
    }

    else
    {
      uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420LL);
      if ((v2 & 0x80000000) == 0) {
        goto LABEL_10;
      }
      if (*__error() == 13 || *__error() == 1)
      {
        if (unlink(a1) == -1 && *__error() != 2)
        {
          int v8 = __error();
          strerror(*v8);
          uint64_t v5 = @"Failed to unlink '%s': %s\n";
          goto LABEL_6;
        }

        uint64_t v2 = open_dprotected_np(a1, 522, 4, 0, 420LL);
        if ((v2 & 0x80000000) == 0)
        {
LABEL_10:
          atomic_store(0LL, &_restoreLogGrowth);
          _restoreLogFD = v2;
          rotateRestoreLogFD(v2);
          return v2;
        }
      }

      __error();
      uint64_t v7 = __error();
      strerror(*v7);
      uint64_t v5 = @"Could not open '%s': %s\n";
    }

LABEL_6:
    logfunction("", 0LL, v5);
    return 0xFFFFFFFFLL;
  }

  return v2;
}

int *rotateRestoreLogFD(int a1)
{
  if (fstat(a1, &v9)) {
    return __error();
  }
  flock(a1, 2);
  off_t st_size = v9.st_size;
  if (v9.st_size > 3145728)
  {
    BOOL v4 = malloc(0x100000uLL);
    ssize_t v5 = pread(a1, v4, 0x100000uLL, st_size - 0x100000);
    if (v5 >= 1 && (ssize_t v6 = v5, (v7 = (char *)memchr(v4, 10, v5)) != 0LL))
    {
      size_t v8 = (_BYTE *)v4 - (v7 + 1) + v6;
      pwrite(a1, v7 + 1, v8, 0LL);
    }

    else
    {
      size_t v8 = 0LL;
    }

    ftruncate(a1, v8);
    free(v4);
  }

  return (int *)flock(a1, 8);
}

uint64_t closeRestoreLogFile()
{
  uint64_t result = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0) {
    uint64_t result = close(_restoreLogFD);
  }
  atomic_store(0LL, &_restoreLogGrowth);
  _restoreLogFD = -2;
  return result;
}

uint64_t checkForRestoreLogFD( int a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (fstat(a1, &v70) != -1)
  {
    logfunction("", 0, @"found restore log (size = %llu)\n", v10, v11, v12, v13, v14, v70.st_size);
    size_t st_size = v70.st_size;
    if (v70.st_size < 3145728)
    {
      __int128 v43 = (char *)malloc(v70.st_size + 1);
      if (v43)
      {
        __int128 v27 = v43;
        ssize_t v44 = read(a1, v43, st_size);
        if ((v44 & 0x8000000000000000LL) == 0)
        {
          ssize_t v45 = v44;
LABEL_21:
          uint64_t result = 0LL;
          v27[v45] = 0;
          *a2 = v27;
          return result;
        }

        v48 = __error();
        char v68 = strerror(*v48);
        logfunction("", 0, @"unable to read from restore log file: %s\n", v49, v50, v51, v52, v53, v68);
        goto LABEL_28;
      }
    }

    else
    {
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      *(_OWORD *)__str = 0u;
      __int128 v72 = 0u;
      logfunction("", 0, @"restore log is suspiciously large - truncating\n", v15, v16, v17, v18, v19, v66);
      uint64_t v21 = (char *)malloc(0x300000uLL);
      if (v21)
      {
        __int128 v27 = v21;
        ssize_t v28 = read(a1, v21, 0x180000uLL);
        if ((v28 & 0x8000000000000000LL) == 0)
        {
          uint64_t v29 = v28;
          if (lseek(a1, v28 - 3145727, 2) < 0)
          {
            v47 = @"unable to seek in restore log file: %s\n";
            goto LABEL_27;
          }

          __int128 v30 = &v27[v29];
          ssize_t v31 = read(a1, &v27[v29], 3145727 - v29);
          if (v31 != -1)
          {
            int64_t v32 = v31;
            __int128 v33 = &v27[v29];
            do
            {
              if (v29 >= 1)
              {
                v27[v29 - 1] = 0;
                __int128 v34 = strrchr(v27, 10);
                if (v34) {
                  __int128 v35 = v34 + 1;
                }
                else {
                  __int128 v35 = v27;
                }
                *__int128 v35 = 0;
                uint64_t v29 = v35 - v27;
              }

              if (v32 < 1) {
                break;
              }
              __int128 v36 = (char *)memchr(v30, 10, v32);
              if (!v36)
              {
                int64_t v32 = 0LL;
                break;
              }

              __int128 v30 = v36 + 1;
              int64_t v32 = &v33[v32] - (v36 + 1);
              __int128 v33 = v36 + 1;
            }

            while (v36 + 1 - &v27[v29] < 160);
            snprintf( __str,  0xA0uLL,  "--------------------\n------ Truncated %lld bytes ------\n--------------------\n",  v70.st_size - (v29 + v32));
            v60 = &v27[v29];
            __int128 v61 = v78;
            *((_OWORD *)v60 + 6) = v77;
            *((_OWORD *)v60 + 7) = v61;
            __int128 v62 = v80;
            *((_OWORD *)v60 + 8) = v79;
            *((_OWORD *)v60 + 9) = v62;
            __int128 v63 = v74;
            *((_OWORD *)v60 + 2) = v73;
            *((_OWORD *)v60 + 3) = v63;
            __int128 v64 = v76;
            *((_OWORD *)v60 + 4) = v75;
            *((_OWORD *)v60 + 5) = v64;
            __int128 v65 = v72;
            *(_OWORD *)v60 = *(_OWORD *)__str;
            *((_OWORD *)v60 + 1) = v65;
            ssize_t v45 = strlen(__str) + v29;
            if (v32)
            {
              if (v30 > &v27[v45])
              {
                memmove(&v27[v45], v30, v32);
                v45 += v32;
              }
            }

            goto LABEL_21;
          }
        }

        v47 = @"unable to read from restore log file: %s\n";
LABEL_27:
        v54 = __error();
        char v69 = strerror(*v54);
        logfunction("", 0, v47, v55, v56, v57, v58, v59, v69);
LABEL_28:
        free(v27);
        return 0xFFFFFFFFLL;
      }
    }

    logfunction("", 0, @"unable to allocate memory to read restore log\n", v22, v23, v24, v25, v26, v66);
    return 0xFFFFFFFFLL;
  }

  __int128 v37 = __error();
  char v67 = strerror(*v37);
  logfunction("", 1, @"fstat on restore log failed: %s\n", v38, v39, v40, v41, v42, v67);
  return 0xFFFFFFFFLL;
}

size_t writeToRestoreLogFile(void *__buf, size_t __nbyte)
{
  size_t v2 = __nbyte;
  int v3 = _restoreLogFD;
  if ((_restoreLogFD & 0x80000000) == 0)
  {
    ssize_t v4 = write(_restoreLogFD, __buf, __nbyte);
    size_t v2 = v4;
    if (v4 >= 1)
    {
      do
      {
        unint64_t v5 = __ldxr(&_restoreLogGrowth);
        int64_t v6 = v5 + v4;
      }

      while (__stxr(v6, &_restoreLogGrowth));
      if (v6 > 0x10000)
      {
        do
          unint64_t v7 = __ldxr(&_restoreLogGrowth);
        while (__stxr(v7 - v6, &_restoreLogGrowth));
        rotateRestoreLogFD(v3);
      }
    }
  }

  return v2;
}

uint64_t submitRestoreLogFile(__CFError *a1, uint64_t a2, const char *a3, const char *a4)
{
  return submitRestoreLogFileToLogDir(a1, a2, a3, a4, 0LL);
}

uint64_t submitRestoreLogFileToLogDir( __CFError *a1, uint64_t a2, const char *a3, const char *a4, const __CFString *a5)
{
  v124 = 0LL;
  bzero(v138, 0x400uLL);
  if (a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = "/private/var/MobileSoftwareUpdate/restore.log";
  }
  int v11 = open(v10, 2);
  int v18 = v11;
  if (v11 == -1)
  {
    __int128 v27 = __error();
    strerror(*v27);
    logfunction("", 1, @"unable to open restore log (%s): %s (%d)\n", v28, v29, v30, v31, v32, (char)v10);
    uint64_t v25 = 0LL;
    goto LABEL_12;
  }

  int v19 = checkForRestoreLogFD(v11, &v124, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = v124;
  if (v19) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v124 == 0LL;
  }
  if (v26)
  {
    logfunction("", 1, @"unable to read from restore log file\n", v20, v21, v22, v23, v24, v115);
LABEL_12:
    __int128 v33 = 0LL;
    goto LABEL_43;
  }

  rotateRestoreLogFD(v18);
  __int128 v34 = (const __CFString *)MGCopyAnswer(@"SerialNumber", 0LL);
  __int128 v33 = v34;
  if (!v34)
  {
    v48 = @"failed to query device serial number\n";
LABEL_42:
    logfunction("", 1, v48, v35, v36, v37, v38, v39, v115);
LABEL_43:
    free(v25);
    uint64_t v50 = 0LL;
    CFStringRef v51 = 0LL;
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!v33) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }

  if (CFStringGetLength(v34) < 1)
  {
    uint64_t v49 = @"device has no serial number for scrubbing\n";
LABEL_23:
    logfunction("", 1, v49, v40, v41, v42, v43, v44, v115);
    goto LABEL_24;
  }

  *(_OWORD *)buffer = 0u;
  __int128 v140 = 0u;
  if (CFStringGetCString(v33, buffer, 32LL, 0x8000100u) != 1)
  {
    uint64_t v49 = @"unable to get c string for device serial number\n";
    goto LABEL_23;
  }

  ssize_t v45 = strcasestr(v25, buffer);
  if (v45)
  {
    v46 = v45;
    do
    {
      size_t v47 = strlen(buffer);
      memset(v46, 88, v47);
      v46 = strcasestr(v46, buffer);
    }

    while (v46);
  }

LABEL_24:
  if (_AMRRegexSubstitution(v25, "'[^\n]*' has been added", "'<<File name>>' has been added ")
    || _AMRRegexSubstitution( v25,  "verify_callback: '[^\n]*' did not verify and is not on the exception list.",  "verify_callback: '<<File name>>' did not verify and is not on the exception list.")
    || _AMRRegexSubstitution( v25,  "'[^\n]*' is on the exception list",  "'<<File name>>' is on the exception list")
    || _AMRRegexSubstitution(v25, "[:-][0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [0-9a-fA-F]{8}", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-] [a-zA-Z0-9]{18}[[:>:]]", "XXXX")
    || _AMRRegexSubstitution(v25, "[:-][a-zA-Z0-9]{8}[:-][a-zA-Z0-9]{16}", "XXXX")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{40}", "<<<<<<<<<<<<<<<<<<UDID>>>>>>>>>>>>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{20}", "<<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{19}", "<<<<<<<ICCID>>>>>>>")
    || _AMRRegexSubstitution(v25, "[0-9]{15}", "<<<<<IMEI>>>>>>")
    || _AMRRegexSubstitution(v25, "ecid=0x[0-9a-fA-F]*,", "ecid=0xXXXXXXXXXXX")
    || _AMRRegexSubstitution(v25, "ApECID[^\n]*value = [+-][0-9<>IMEI]*", "ApECID} = X {X")
    || _AMRRegexSubstitution(v25, "[0-9a-fA-F]{14}", "<<<<<MEID>>>>>")
    || _AMRRegexSubstitution(v25, "ChipSerialNo[^\n]*bytes = 0x[0-9a-fA-F]*}", "ChipSerialNo ")
    || _AMRRegexSubstitution(v25, "snum=0x[0-9a-fA-F]*,", "snum=0xXXXXXXXX")
    || _AMRRegexSubstitution(v25, "BbSNUM[^\n]*", "BbSNUM} = 0xXXXXXXXX }"))
  {
    goto LABEL_41;
  }

  err = a1;
  size_t v54 = strlen(v25);
  if (v54)
  {
    size_t v55 = v54;
    uint64_t v56 = v25;
    do
    {
      __darwin_ct_rune_t v57 = *v56;
      if (v57 < 0)
      {
        if (!__maskrune(*v56, 0x40000uLL))
        {
          __uint32_t v58 = __maskrune(v57, 0x4000uLL);
LABEL_60:
          if (!v58) {
            *uint64_t v56 = 46;
          }
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v57] & 0x40000) == 0)
      {
        __uint32_t v58 = _DefaultRuneLocale.__runetype[v57] & 0x4000;
        goto LABEL_60;
      }

      ++v56;
      --v55;
    }

    while (v55);
  }

  CFStringRef cf = CFStringCreateWithCString(kCFAllocatorDefault, v25, 0x8000100u);
  if (!cf)
  {
LABEL_41:
    v48 = @"failed to scrub log\n";
    goto LABEL_42;
  }

  theDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!theDict)
  {
    logfunction("", 1, @"failed to create crashReporterDictionary\n", v59, v60, v61, v62, v63, v115);
    char v67 = 0LL;
    char v68 = 0LL;
    char v69 = 0LL;
    v118 = 0LL;
LABEL_85:
    CFStringRef erra = 0LL;
    goto LABEL_103;
  }

  if (err)
  {
    __int128 v64 = CFErrorCopyUserInfo(err);
    if (v64)
    {
      __int128 v65 = v64;
      Value = (const __CFString *)CFDictionaryGetValue(v64, @"target_update");
      char Code = CFErrorGetCode(err);
      CFRelease(v65);
    }

    else
    {
      char Code = CFErrorGetCode(err);
      Value = 0LL;
    }
  }

  else
  {
    Value = 0LL;
    char Code = -1;
  }

  stat v70 = @"Unknown";
  if (!Value) {
    Value = @"Unknown";
  }
  uint64_t v71 = MGCopyAnswer(@"BuildVersion", 0LL);
  if (v71) {
    stat v70 = (const __CFString *)v71;
  }
  CFDictionarySetValue(theDict, @"itunes_version", v70);
  CFDictionarySetValue(theDict, @"restore_payload_version", Value);
  CFDictionarySetValue(theDict, @"restore_type", @"OTAUpdate");
  CFDictionarySetValue(theDict, @"name", @"iPhoneRestore");
  v118 = v70;
  CFDictionarySetValue(theDict, @"os_version", v70);
  CFDictionarySetValue(theDict, @"bug_type", @"183");
  CFStringRef erra = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%ld");
  if (!erra)
  {
    logfunction("", 1, @"failed to create CFString from %ld\n", v72, v73, v74, v75, v76, Code);
    char v67 = 0LL;
    char v68 = 0LL;
    char v69 = 0LL;
    goto LABEL_85;
  }

  CFDictionarySetValue(theDict, @"restore_error", erra);
  if (!a4)
  {
    Default = CFAllocatorGetDefault();
    char v68 = CFURLCreateWithFileSystemPath( Default,  @"/private/var/mobile/Library/Logs/CrashReporter",  kCFURLPOSIXPathStyle,  0);
    goto LABEL_87;
  }

  CFStringRef v77 = CFStringCreateWithCString(0LL, a4, 0x8000100u);
  if (!v77)
  {
    v112 = @"failed to create dataPartitionMountPointStr\n";
LABEL_99:
    logfunction("", 1, v112, v78, v79, v80, v81, v82, Code);
    char v67 = 0LL;
    char v68 = 0LL;
LABEL_102:
    char v69 = 0LL;
    goto LABEL_103;
  }

  v83 = v77;
  v84 = CFAllocatorGetDefault();
  v85 = CFURLCreateWithFileSystemPath(v84, v83, kCFURLPOSIXPathStyle, 0);
  CFRelease(v83);
  if (!v85)
  {
    v112 = @"failed to create mountPointURL\n";
    goto LABEL_99;
  }

  if (a5) {
    v86 = a5;
  }
  else {
    v86 = @"/mobile/Library/Logs/CrashReporter";
  }
  char v68 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v85, v86, 1u);
  CFRelease(v85);
  if (!v68)
  {
    v92 = @"mountPointURL CFURLCreateCopyAppendingPathComponent failed\n";
LABEL_101:
    logfunction("", 1, v92, v87, v88, v89, v90, v91, Code);
    char v67 = 0LL;
    goto LABEL_102;
  }

LABEL_87:
  uint64_t v137 = 0LL;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  *(_OWORD *)v125 = 0u;
  __int128 v126 = 0u;
  time_t v123 = 0LL;
  if (a2 <= 0) {
    a2 = time(0LL);
  }
  time_t v123 = a2;
  v94 = localtime(&v123);
  if (!v94)
  {
    v92 = @"localtime failed\n";
    goto LABEL_101;
  }

  if (!strftime(v125, 0xC8uLL, "%F-%H-%M-%S", v94))
  {
    v92 = @"strftime failed\n";
    goto LABEL_101;
  }

  v95 = CFAllocatorGetDefault();
  v116 = v125;
  char v69 = CFStringCreateWithFormat(v95, 0LL, @"OTAUpdate-%s.ips");
  if (!v69)
  {
    logfunction("", 1, @"failed to create crashReporterFileName\n", v96, v97, v98, v99, v100, (char)v125);
    char v67 = 0LL;
    goto LABEL_103;
  }

  v101 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v68, v69, 0);
  char v67 = v101;
  if (!v101)
  {
    v113 = @"failed to create log file name\n";
LABEL_116:
    logfunction("", 1, v113, v102, v103, v104, v105, v106, (char)v116);
LABEL_103:
    free(v25);
    CFRelease(cf);
    uint64_t v52 = 0xFFFFFFFFLL;
    if (!theDict) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }

  if (!CFURLGetFileSystemRepresentation(v101, 1u, v138, 1024LL))
  {
    LOBYTE(v116) = (_BYTE)v67;
    v113 = @"Could not get file path from %@\n";
    goto LABEL_116;
  }

  logfunction("", 1, @"Trying to write crashreporter log file %s\n", v102, v103, v104, v105, v106, (char)v138);
  if (store_ips_with_mode(theDict, cf, (const char *)v138))
  {
    logfunction("", 1, @"failed to create %s\n", v107, v108, v109, v110, v111, (char)v138);
    goto LABEL_103;
  }

  int v114 = ftruncate(v18, 0LL);
  if (a4 || v114) {
    unlink(v10);
  }
  free(v25);
  CFRelease(cf);
  uint64_t v52 = 0LL;
LABEL_104:
  CFRelease(theDict);
LABEL_105:
  if (v67) {
    CFRelease(v67);
  }
  if (v68) {
    CFRelease(v68);
  }
  if (v69) {
    CFRelease(v69);
  }
  uint64_t v50 = v118;
  CFStringRef v51 = erra;
  if (v33) {
LABEL_44:
  }
    CFRelease(v33);
LABEL_45:
  if (v50) {
    CFRelease(v50);
  }
  if (v51) {
    CFRelease(v51);
  }
  if (v18 != -1 && close(v18) == -1) {
    submitRestoreLogFileToLogDir_cold_1();
  }
  return v52;
}

uint64_t store_ips_with_mode(const __CFDictionary *a1, const __CFString *a2, const char *a3)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
  int v7 = open(a3, 1537);
  if (v7 != -1)
  {
    int v13 = v7;
    CFStringAppend(Mutable, @"{");
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)append_item_to_string, Mutable);
    CFStringTrim(Mutable, @",");
    CFStringAppend(Mutable, @"}\n");
    ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, Mutable, 0x8000100u, 0x3Fu);
    uint64_t v20 = ExternalRepresentation;
    if (!ExternalRepresentation) {
      goto LABEL_11;
    }
    size_t Length = CFDataGetLength(ExternalRepresentation);
    BytePtr = CFDataGetBytePtr(v20);
    if (write(v13, BytePtr, Length) != Length)
    {
      __int128 v34 = @"write hdr\n";
      goto LABEL_15;
    }

    CFRelease(v20);
    uint64_t v23 = CFStringCreateExternalRepresentation(0LL, a2, 0x8000100u, 0x3Fu);
    uint64_t v20 = v23;
    if (v23)
    {
      size_t v24 = CFDataGetLength(v23);
      uint64_t v25 = CFDataGetBytePtr(v20);
      if (write(v13, v25, v24) == v24)
      {
        BOOL v26 = getpwnam("mobile");
        if (v26)
        {
          if (!chown(a3, v26->pw_uid, v26->pw_gid))
          {
            uint64_t v33 = 0LL;
LABEL_17:
            close(v13);
            if (!Mutable) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }

          __int128 v27 = __error();
          strerror(*v27);
          logfunction("", 1, @"unable to chown file '%s': %s\n\n", v28, v29, v30, v31, v32, (char)a3);
LABEL_16:
          uint64_t v33 = 0xFFFFFFFFLL;
          goto LABEL_17;
        }

        __int128 v34 = @"unable to look up mobile user uid/gid. Defaulting to 501/501\n\n";
      }

      else
      {
        __int128 v34 = @"write payload\n";
      }
    }

    else
    {
LABEL_11:
      __int128 v34 = @"CFStringCreateExternalRepresentation\n";
    }

LABEL_15:
    logfunction("", 1, v34, v15, v16, v17, v18, v19, 164);
    goto LABEL_16;
  }

  logfunction("", 1, @"open\n", v8, v9, v10, v11, v12, 164);
  uint64_t v20 = 0LL;
  uint64_t v33 = 0xFFFFFFFFLL;
  if (Mutable) {
LABEL_18:
  }
    CFRelease(Mutable);
LABEL_19:
  if (v20) {
    CFRelease(v20);
  }
  return v33;
}

        unint64_t v5 = fts_read(v3);
      }

      while (v5);
    }

    fts_close(v3);
  }

  else
  {
    size_t v24 = __error();
    strerror(*v24);
    logfunction("", 1, @"Could not fts_open(3) path %s: %s\n", v25, v26, v27, v28, v29, (char)a1);
  }

  _cleanup_boot_environment_with_list(a1, (const char **)&off_100061070, 20LL);
  if ((booted_from_recoveryos() & 1) == 0) {
    _cleanup_boot_environment_with_list(a1, &v30, 1LL);
  }
}

int *fixCrashReporterDir( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (lstat("/private/var/mobile/Library/Logs/CrashReporter", &v50))
  {
    if (*__error() != 2) {
      return logfunction("", 1, @"%s failed to stat %s\n", v13, v14, v15, v16, v17, (char)"fixCrashReporterDir");
    }
    logfunction("", 1, @"%s could not find %s, continue\n", v13, v14, v15, v16, v17, (char)"fixCrashReporterDir");
  }

  else if ((v50.st_mode & 0xF000) == 0xA000)
  {
    return logfunction("", 1, @"%s - already fixed\n", v8, v9, v10, v11, v12, (char)"fixCrashReporterDir");
  }

  if (!lstat("/private/var/mobile/Library/Logs/CrashReporterTmp", &v50))
  {
    if ((v50.st_mode & 0xF000) == 0xA000)
    {
      logfunction( "",  1,  @"%s - tmp dir exist as link, unlink\n",  v19,  v20,  v21,  v22,  v23,  (char)"fixCrashReporterDir");
      unlink("/private/var/mobile/Library/Logs/CrashReporterTmp");
    }

    else
    {
      logfunction("", 1, @"%s - tmp dir exist, remove\n", v19, v20, v21, v22, v23, (char)"fixCrashReporterDir");
      removefile("/private/var/mobile/Library/Logs/CrashReporterTmp", 0LL, 1u);
    }
  }

  logfunction("", 1, @"%s create directory %s\n", v19, v20, v21, v22, v23, (char)"fixCrashReporterDir");
  int v24 = mkpath_np("/private/var/MobileSoftwareUpdate//mobile/Library/Logs", 0x1C0u);
  if (v24 && v24 != 17) {
    return logfunction( "",  1,  @"%s unable to create directory %s: %d\n",  v25,  v26,  v27,  v28,  v29,  (char)"fixCrashReporterDir");
  }
  logfunction("", 1, @"%s symlink %s to %s\n", v25, v26, v27, v28, v29, (char)"fixCrashReporterDir");
  if (symlink( "/private/var/MobileSoftwareUpdate//mobile/Library/Logs/CrashReporter",  "/private/var/mobile/Library/Logs/CrashReporterTmp"))
  {
    return logfunction( "",  1,  @"%s failed to symlink %s to %s\n",  v30,  v31,  v32,  v33,  v34,  (char)"fixCrashReporterDir");
  }

  logfunction("", 1, @"%s swap %s with %s\n", v30, v31, v32, v33, v34, (char)"fixCrashReporterDir");
  if (renamex_np( "/private/var/mobile/Library/Logs/CrashReporterTmp",  "/private/var/mobile/Library/Logs/CrashReporter",  2u))
  {
    logfunction( "",  1,  @"%s swap %s with %s failed with result:%d\n",  v35,  v36,  v37,  v38,  v39,  (char)"fixCrashReporterDir");
    return (int *)unlink("/private/var/mobile/Library/Logs/CrashReporterTmp");
  }

  else
  {
    logfunction("", 1, @"%s copy from %s to %s\n", v35, v36, v37, v38, v39, (char)"fixCrashReporterDir");
    if (copyfile( "/private/var/mobile/Library/Logs/CrashReporterTmp",  "/private/var/MobileSoftwareUpdate//mobile/Library/Logs/",  0LL,  0xC800Fu))
    {
      return logfunction( "",  1,  @"%s failed to copy from %s to %s\n",  v40,  v41,  v42,  v43,  v44,  (char)"fixCrashReporterDir");
    }

    else
    {
      logfunction("", 1, @"%s removing %s\n", v40, v41, v42, v43, v44, (char)"fixCrashReporterDir");
      if (removefile("/private/var/mobile/Library/Logs/CrashReporterTmp", 0LL, 1u)) {
        return logfunction( "",  1,  @"%s failed to remove %s\n",  v45,  v46,  v47,  v48,  v49,  (char)"fixCrashReporterDir");
      }
      else {
        return logfunction("", 1, @"%s is done\n", v45, v46, v47, v48, v49, (char)"fixCrashReporterDir");
      }
    }
  }
}

uint64_t _AMRRegexSubstitution(const char *a1, const char *a2, const char *a3)
{
  char v4 = (char)a2;
  memset(&v23, 0, sizeof(v23));
  if (regcomp(&v23, a2, 1))
  {
    logfunction("", 1, @"unable to compile regex '%s': %d\n", v6, v7, v8, v9, v10, v4);
    return 0xFFFFFFFFLL;
  }

  else
  {
    __pmatch.rm_so = 0LL;
    for (__pmatch.rm_eo = 0LL; ; a1 += __pmatch.rm_eo)
    {
      int v12 = regexec(&v23, a1, 1uLL, &__pmatch, 0);
      if (v12) {
        break;
      }
      size_t v18 = __pmatch.rm_eo - __pmatch.rm_so;
      int64_t v19 = strlen(a3);
      int v20 = LODWORD(__pmatch.rm_eo) - LODWORD(__pmatch.rm_so) - v19;
      if (v19 < __pmatch.rm_eo - __pmatch.rm_so) {
        size_t v18 = v19;
      }
      memcpy((void *)&a1[__pmatch.rm_so], a3, v18);
      if (v20 >= 1)
      {
        memset((void *)&a1[__pmatch.rm_so + v18], 62, v20);
        a1 += v20;
      }
    }

    if (v12 == 1)
    {
      uint64_t v11 = 0LL;
    }

    else
    {
      logfunction("", 1, @"regex matching failed for '%s': %d\n", v13, v14, v15, v16, v17, v4);
      uint64_t v11 = 0xFFFFFFFFLL;
    }

    regfree(&v23);
  }

  return v11;
}

void append_item_to_string(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
}

uint64_t MSUDemotionCleanup(CFErrorRef *a1)
{
  uint64_t v45 = 0LL;
  size_t v2 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  @"/private/var/MobileSoftwareUpdate/DemotionRecord.plist",  0LL,  &v45);
  if (v2)
  {
    id v6 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  2LL,  0LL,  &v45);
    if (!v6)
    {
      error_internal_CFStringRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  23LL,  v45,  0LL,  @"failed to deserialize demotion record",  v3,  v4,  v5,  v35);
      if (!a1) {
        goto LABEL_13;
      }
LABEL_12:
      *a1 = error_internal_cf;
      return 1LL;
    }
  }

  else
  {
    if ([v45 code] != (id)260)
    {
      error_internal_CFStringRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  23LL,  v45,  0LL,  @"failed to read demotion record",  v8,  v9,  v10,  v35);
      if (!a1)
      {
LABEL_13:
        CFRelease(error_internal_cf);
        return 1LL;
      }

      goto LABEL_12;
    }

    id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    if (!v6) {
      return 1LL;
    }
  }

  if (![v6 count]) {
    return 1LL;
  }
  if ((objc_msgSend( objc_msgSend(v6, "objectForKeyedSubscript:", @"iTunesStoreAutoUpdatesEnabled"),  "BOOLValue") & 1) != 0 || ((CFPreferencesSetValue( @"AutoUpdatesEnabled",  0,  @"com.apple.itunesstored",  @"mobile",  kCFPreferencesAnyHost),  CFPreferencesSynchronize(@"com.apple.itunesstored", @"mobile", kCFPreferencesAnyHost),  (uint64_t v11 = getpwnam("mobile")) == 0)
      ? (uid_t pw_uid = 501, pw_gid = 501)
      : (uid_t pw_uid = v11->pw_uid, pw_gid = v11->pw_gid),
        !chown("/private/var/mobile/Library/Preferences/com.apple.itunesstored.plist", pw_uid, pw_gid)))
  {
    uint64_t v45 = 0LL;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x2020000000LL;
    uint64_t v48 = 0LL;
    dispatch_queue_t object = dispatch_queue_create("com.apple.MobileSoftwareUpdate.ApplicationRestore", 0LL);
    uint64_t v21 = dispatch_group_create();
    id v37 = objc_alloc_init(&OBJC_CLASS___SSSoftwareLibrary);
    uint64_t v36 = a1;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id v22 = [v6 allKeys];
    id v23 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v27 = [v6 objectForKeyedSubscript:v26];
          uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0
            && ([v27 isEqualToArray:&off_10006C940] & 1) != 0)
          {
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472LL;
            v40[2] = __MSUDemotionCleanup_block_invoke;
            v40[3] = &unk_100061010;
            v40[4] = object;
            v40[5] = v26;
            v40[6] = v21;
            v40[7] = &v45;
            [v37 restoreDemotedApplicationWithBundleIdentifier:v26 options:0 completionBlock:v40];
            dispatch_group_enter(v21);
          }
        }

        id v23 = [v22 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }

      while (v23);
    }

    dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v21);
    dispatch_release(object);
    uint64_t v29 = (__CFError *)v46[3];
    if (v29)
    {
      if (v36)
      {
        uint64_t v14 = 0LL;
        *uint64_t v36 = v29;
LABEL_40:
        _Block_object_dispose(&v45, 8);
        return v14;
      }
    }

    else
    {
      uint64_t v39 = 0LL;
      if (-[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  @"/private/var/MobileSoftwareUpdate/DemotionRecord.plist",  &v39)
        || [v39 code] == (id)4)
      {
        uint64_t v14 = 1LL;
        goto LABEL_40;
      }

      CFErrorRef v33 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  23LL,  v39,  0LL,  @"failed to remove demotion record",  v30,  v31,  v32,  v35);
      if (v36)
      {
        uint64_t v14 = 0LL;
        *uint64_t v36 = v33;
        goto LABEL_40;
      }

      CFRelease(v33);
    }

    uint64_t v14 = 0LL;
    goto LABEL_40;
  }

  uint64_t v15 = __error();
  char v16 = strerror(*v15);
  CFErrorRef v20 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  23LL,  0LL,  0LL,  @"failed to chown(2) itunesstored prefs file: %s",  v17,  v18,  v19,  v16);
  if (a1)
  {
    uint64_t v14 = 0LL;
    *a1 = v20;
  }

  else
  {
    CFRelease(v20);
    return 0LL;
  }

  return v14;
}

void sub_10000725C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void __MSUDemotionCleanup_block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __MSUDemotionCleanup_block_invoke_2;
    block[3] = &unk_100060FE8;
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    block[4] = a3;
    block[5] = v6;
    block[6] = v4;
    dispatch_sync(v5, block);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

CFErrorRef __MSUDemotionCleanup_block_invoke_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v9) {
    CFRelease(v9);
  }
  CFErrorRef result = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  23LL,  *(const void **)(a1 + 32),  0LL,  @"failed to enqueue restore of application '%@': %@",  a6,  a7,  a8,  *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

uint64_t msu_partition_execution_logger(const char *a1, int a2)
{
  return fprintf(__stderrp, "%.*s\n", a2, a1);
}

void msu_partition_logger(uint64_t a1, va_list a2)
{
  if (a1)
  {
    uint64_t v3 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s\n", a1);
    logfunctionv("", 1, v3, a2);
    if (v3) {
      CFRelease(v3);
    }
  }

CFPropertyListRef load_plist_with_mutability_option(CFURLRef fileURL, CFOptionFlags a2)
{
  if (!fileURL) {
    return 0LL;
  }
  uint64_t v3 = CFReadStreamCreateWithFile(kCFAllocatorDefault, fileURL);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  if (CFReadStreamOpen(v3)) {
    CFPropertyListRef v5 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v4, 0LL, a2, 0LL, 0LL);
  }
  else {
    CFPropertyListRef v5 = 0LL;
  }
  CFReadStreamClose(v4);
  CFRelease(v4);
  return v5;
}

CFPropertyListRef load_dict(char *cStr)
{
  if (!cStr) {
    return 0LL;
  }
  CFTypeRef v1 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v1) {
    return 0LL;
  }
  size_t v2 = v1;
  uint64_t v3 = CFURLCreateWithFileSystemPath(0LL, v1, kCFURLPOSIXPathStyle, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    CFPropertyListRef plist_with_mutability_option = load_plist_with_mutability_option(v3, 0LL);
    CFRelease(v4);
  }

  else
  {
    CFPropertyListRef plist_with_mutability_option = 0LL;
  }

  CFRelease(v2);
  return plist_with_mutability_option;
}

uint64_t size_directory(char *a1)
{
  v6[0] = a1;
  v6[1] = 0LL;
  CFTypeRef v1 = fts_open(v6, 21, 0LL);
  if (!v1) {
    err(1, "fts_open(%s)");
  }
  size_t v2 = v1;
  uint64_t v3 = fts_read(v1);
  for (i = 0LL; v3; uint64_t v3 = fts_read(v2))
  {
    if (v3->fts_info == 8) {
      i += v3->fts_statp->st_blocks << 9;
    }
  }

  if (fts_close(v2)) {
    err(1, "fts_close(%s)");
  }
  return i;
}

uint64_t msu_execute_command_with_callback(char *const *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (const void **)v6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __msu_execute_command_with_callback_block_invoke;
  v16[3] = &__block_descriptor_48_e13_v24__0r_v8Q16l;
  v16[4] = a2;
  v16[5] = a3;
  ramrod_execute_config_set_output_block(v6, v16);
  uint64_t v14 = ramrod_execute_command_with_config(a1, v7, v8, v9, v10, v11, v12, v13);
  ramrod_execute_config_free(v7);
  return v14;
}

uint64_t __msu_execute_command_with_callback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

uint64_t execute_command(char *const *a1, uint64_t a2)
{
  return msu_execute_command_with_callback(a1, a2, 0LL);
}

uint64_t mkparentdir(uint64_t a1, mode_t a2)
{
  if (a1)
  {
    __strlcpy_chk(&v8, a1, 1024LL, 1024LL);
    if (v8 == 47) {
      uint64_t v4 = v9;
    }
    else {
      uint64_t v4 = &v8;
    }
    do
    {
      if (!*v4) {
        break;
      }
      CFPropertyListRef v5 = strchr(v4, 47);
      uint64_t v4 = v5;
      if (v5 > &v8)
      {
        memset(&v7, 0, sizeof(v7));
        *CFPropertyListRef v5 = 0;
        if (lstat(&v8, &v7) == -1 && mkdir(&v8, a2) == -1 && *__error() != 17) {
          return 0xFFFFFFFFLL;
        }
        *v4++ = 47;
      }
    }

    while (v4);
    return 0LL;
  }

  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }

CFErrorRef _vcreate_error_internal_with_userinfo_cf( const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, va_list a7)
{
  int v14 = *__error();
  if (a5) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, a5);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  char v16 = MutableCopy;
  if (MutableCopy)
  {
    CFStringRef v17 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a6, a7);
    if (v17)
    {
      CFStringRef v23 = v17;
      logfunction("", 1, @"%@ error %ld - %@\n", v18, v19, v20, v21, v22, (char)a1);
      CFDictionaryAddValue(v16, kCFErrorLocalizedDescriptionKey, v23);
      CFRelease(v23);
    }

    if (a3) {
      CFDictionaryAddValue(v16, kCFErrorUnderlyingErrorKey, a3);
    }
    if (a4) {
      CFDictionaryAddValue(v16, @"target_update", a4);
    }
    CFErrorRef v24 = CFErrorCreate(kCFAllocatorDefault, a1, a2, v16);
    CFRelease(v16);
  }

  else
  {
    CFErrorRef v24 = 0LL;
  }

  *__error() = v14;
  return v24;
}

CFErrorRef _create_error_internal_cf( const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, 0LL, a5, &a9);
}

CFDictionaryRef cferror_to_dictionary(__CFError *a1)
{
  return cferror_to_dictionary_embedded(a1, 0);
}

CFDictionaryRef cferror_to_dictionary_embedded(__CFError *a1, int a2)
{
  CFIndex valuePtr = CFErrorGetCode(a1);
  CFErrorDomain Domain = CFErrorGetDomain(a1);
  CFPropertyListRef v5 = CFErrorCopyUserInfo(a1);
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  if (!v6)
  {
    logfunction("", 1, @"could not create cfnumber\n", v7, v8, v9, v10, v11, v29);
    CFDictionaryRef v19 = 0LL;
    if (!v5) {
      return v19;
    }
    goto LABEL_22;
  }

  CFNumberRef v12 = v6;
  *(_OWORD *)keys = *(_OWORD *)off_100061050;
  __int128 v35 = *(_OWORD *)&off_100061060;
  values[0] = v6;
  values[1] = (void *)Domain;
  uint64_t v32 = v5;
  uint64_t v33 = 0LL;
  if (!v5)
  {
    int v14 = 0LL;
    CFIndex v20 = 2LL;
    if (!a2) {
      goto LABEL_17;
    }
    uint64_t v21 = &v32;
    uint64_t v22 = 3LL;
    goto LABEL_16;
  }

  Value = (__CFDictionary *)CFDictionaryGetValue(v5, kCFErrorUnderlyingErrorKey);
  int v14 = Value;
  if (Value)
  {
    CFTypeID v15 = CFGetTypeID(Value);
    if (v15 == CFErrorGetTypeID() && (uint64_t v16 = cferror_to_dictionary_embedded(v14, 0LL)) != 0)
    {
      CFStringRef v17 = (const void *)v16;
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v5);
      int v14 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, kCFErrorUnderlyingErrorKey, v17);
        uint64_t v32 = v14;
      }

      CFRelease(v17);
    }

    else
    {
      int v14 = 0LL;
    }
  }

  CFIndex v20 = 3LL;
  if ((a2 & 1) != 0)
  {
    uint64_t v21 = (CFBooleanRef *)&v33;
    uint64_t v22 = 4LL;
LABEL_16:
    keys[v20] = @"_MSU_Embedded_Error";
    *uint64_t v21 = kCFBooleanTrue;
    CFIndex v20 = v22;
  }

LABEL_17:
  CFDictionaryRef v19 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  (const void **)values,  v20,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v19) {
    logfunction("", 1, @"could not create cfdictionary\n", v23, v24, v25, v26, v27, v29);
  }
  if (v14) {
    CFRelease(v14);
  }
  CFRelease(v12);
  if (v5) {
LABEL_22:
  }
    CFRelease(v5);
  return v19;
}

    __int128 v35 = MSUBootFirmwareError(3LL, v63, (uint64_t)v69, v64, v65, v66, v67, v68, (uint64_t)v110);
    goto LABEL_18;
  }

  char v29 = -536870212;
  iBU_LOG_real( (uint64_t)@"Firmware payload %lul is larger than maximum payload size %d",  "-[IODualSPIWriter _writeFirmware:toHeader:withError:]",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v22);
  if (a5)
  {
    uint64_t v109 = [a3 length];
    __int128 v35 = MSUBootFirmwareError( 3LL,  0LL,  (uint64_t)@"Firmware payload %lul is larger than maximum payload size %d",  v30,  v31,  v32,  v33,  v34,  (uint64_t)v109);
LABEL_18:
    *a5 = v35;
  }

  return v29;
}

CFStringRef copy_dictionary_to_cferror(const void *a1)
{
  CFIndex valuePtr = 0LL;
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    uint64_t v21 = @"marshalled cferror is not a dictionary.\n";
LABEL_17:
    logfunction("", 1, v21, v3, v4, v5, v6, v7, v23);
    return 0LL;
  }

  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Code");
  if (!Value)
  {
    uint64_t v21 = @"marshalled cferror is incomplete. missing code.\n";
    goto LABEL_17;
  }

  if (!CFNumberGetValue(Value, kCFNumberCFIndexType, &valuePtr))
  {
    uint64_t v21 = @"code not convert cfnumber code to cfindex\n";
    goto LABEL_17;
  }

  int v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Domain");
  if (!v14)
  {
    logfunction("", 1, @"marshalled cferror is incomplete. missing domain.\n", v9, v10, v11, v12, v13, v23);
    return v14;
  }

  CFTypeID v15 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a1, @"UserInfo");
  if (!v15)
  {
    uint64_t v21 = @"marshalled cferror is incomplete. missing UserInfo.\n";
    goto LABEL_17;
  }

  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v15);
  if (!MutableCopy)
  {
    uint64_t v21 = @"code not create mutable copy of userInfo\n";
    goto LABEL_17;
  }

  CFStringRef v17 = MutableCopy;
  uint64_t v18 = CFDictionaryGetValue(MutableCopy, kCFErrorUnderlyingErrorKey);
  CFDictionaryRef v19 = (const void *)copy_dictionary_to_cferror(v18);
  if (v19)
  {
    CFIndex v20 = v19;
    CFDictionarySetValue(v17, kCFErrorUnderlyingErrorKey, v19);
    CFRelease(v20);
  }

  int v14 = (const __CFString *)CFErrorCreate(kCFAllocatorDefault, v14, valuePtr, v17);
  CFRelease(v17);
  return v14;
}

uint64_t calculate_snapshot_overhead(uint64_t a1)
{
  return (uint64_t)((double)a1 * 1.05 + 293601280.0);
}

BOOL write_SMC_key(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = IOServiceMatching("AppleSMC");
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
  io_object_t v11 = MatchingService;
  if (!&_SMCOpenConnection)
  {
    BOOL v12 = 1LL;
    logfunction("", 1, @"No SMC dylib. Bailing with success.\n", v6, v7, v8, v9, v10, v39);
    if (v11) {
      IOObjectRelease(v11);
    }
    return v12;
  }

  if (!(_DWORD)MatchingService)
  {
    logfunction("", 1, @"Couldn't find matching SMC service. Bailing.\n\n", v6, v7, v8, v9, v10, v39);
    return 0LL;
  }

  uint64_t v13 = SMCOpenConnection(MatchingService);
  if (!v13)
  {
    logfunction("", 1, @"Failed to open SMC connection. Bailing.\n\n", v14, v15, v16, v17, v18, v39);
    IOObjectRelease(v11);
    return 0LL;
  }

  uint64_t v19 = v13;
  v41[0] = 0LL;
  v41[1] = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v20 = SMCMakeUInt32Key(a1);
  if (SMCGetKeyInfo(v19, v20, v41))
  {
    logfunction("", 1, @"Couldn't retrieve SMC Key %s. Got SMC error: %d\n\n", v21, v22, v23, v24, v25, a1);
    BOOL v12 = 0LL;
  }

  else
  {
    int v26 = SMCWriteKeyWithKnownSize(v19, v20, HIDWORD(v42), a2);
    BOOL v12 = v26 == 0;
    if (v26) {
      logfunction("", 1, @"Writing SMC key %s as value %s failed with error %d\n\n", v27, v28, v29, v30, v31, a1);
    }
    int v32 = SMCReadKeyAsNumeric(v19, v20, v41, &v40);
    if (v32) {
      logfunction("", 1, @"SMCReadKeyAsNumeric() returned %d\n", v33, v34, v35, v36, v37, v32);
    }
    else {
      logfunction("", 1, @"Read (0x%jX) for key %s\n\n", v33, v34, v35, v36, v37, v40);
    }
  }

  IOObjectRelease(v11);
  SMCCloseConnection(v19);
  return v12;
}

void cleanup_boot_environment(char *a1)
{
  uint64_t v30 = "mobile";
  v32[0] = a1;
  v32[1] = 0LL;
  bzero(__str, 0x401uLL);
  CFTypeID v2 = fts_open(v32, 85, 0LL);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = fts_read(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        if (v5->fts_info != 8) {
          goto LABEL_15;
        }
        int v6 = strncmp(".patchd-dirty-", v5->fts_name, 0xEuLL);
        if (v6)
        {
          if (strncmp(".patchd-saved-", v5->fts_name, 0xEuLL)) {
            goto LABEL_15;
          }
        }

        snprintf(__str, 0x400uLL, "%s/patchd-%s.log", a1, (const char *)&v5[1].fts_cycle + 6);
        if (!access(__str, 0))
        {
          if (!v6) {
            goto LABEL_15;
          }
          if (unlink(__str)) {
            goto LABEL_13;
          }
          logfunction("", 1, @"Deleted %s\n", v12, v13, v14, v15, v16, (char)__str);
        }

        if (!unlink(v5->fts_path))
        {
          logfunction("", 1, @"Deleted %s\n", v7, v8, v9, v10, v11, (char)v5->fts_path);
          goto LABEL_15;
        }

        if (*__error() != 2)
        {
LABEL_13:
          int v17 = *__error();
          uint64_t v18 = __error();
          strerror(*v18);
          logfunction("", 1, @"Error %d (%s) deleting %s\n", v19, v20, v21, v22, v23, v17);
        }

void _cleanup_boot_environment_with_list(const char *a1, const char **a2, uint64_t a3)
{
  {
    snprintf(__str, 0x400uLL, "%s/%s", a1, *a2);
    if (removefile(__str, 0LL, 1u))
    {
      if (*__error() != 2)
      {
        int v11 = *__error();
        uint64_t v12 = __error();
        strerror(*v12);
        logfunction("", 1, @"Error %d (%s) deleting %s\n", v13, v14, v15, v16, v17, v11);
      }
    }

    else
    {
      logfunction("", 1, @"Deleted %s\n", v6, v7, v8, v9, v10, (char)__str);
    }

    ++a2;
  }

void sub_100008A78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

LABEL_13:
        uint64_t v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Purging is disabled\n";
        goto LABEL_14;
      }

      uint64_t v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging cannot proceed as MAAutoAsset class does respond to required selector (stagePurgeAll:)\n";
    }
  }

  else
  {
    uint64_t v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging cannot proceed as MAAutoAsset class does not exist\n";
  }

LABEL_14:
  logfunction("", 1, v10, v4, v5, v6, v7, v8, v12);
}

          uint64_t v42 = cf;
          if (a2 && !(_DWORD)v41 && cf)
          {
            __int128 v41 = 0LL;
            *a2 = CFRetain(cf);
            goto LABEL_21;
          }

          goto LABEL_22;
        }

        if (v147 && !strcmp(name, v147))
        {
          uint64_t v104 = &hardware_partition_node_path;
          goto LABEL_90;
        }

        if (v146 && !strcmp(name, v146))
        {
          uint64_t v104 = &scratch_partition_node_path;
          goto LABEL_90;
        }

        if (v145 && !strcmp(name, v145))
        {
          if (v155 != 1)
          {
            if (v155 == 2)
            {
              ramrod_log_msg( "Captured preboot partition on main OS container %d\n",  v57,  v58,  v59,  v60,  v61,  v62,  v63,  2);
              uint64_t v104 = &preboot_partition_device_node_path_0;
            }

            else
            {
              if (v155 != 3) {
                goto LABEL_160;
              }
              ramrod_log_msg( "Captured preboot partition on recovery container %d\n",  v57,  v58,  v59,  v60,  v61,  v62,  v63,  3);
              uint64_t v104 = &recovery_preboot_partition_device_node_path;
            }

            goto LABEL_90;
          }

          __int128 v129 = 1;
        }

        else
        {
          if (!v144 || strcmp(name, v144))
          {
            if (v143 && !strcmp(name, v143))
            {
              uint64_t v104 = &recovery_os_volume_device_node_path_0;
            }

            else
            {
              if (!v158 || system_device_node_path_0)
              {
                ramrod_log_msg("unexpected partition '%s' - skipping\n", v57, v58, v59, v60, v61, v62, v63, (char)name);
LABEL_160:
                theArray = 0LL;
                uint64_t v105 = 1;
                goto LABEL_92;
              }

              ramrod_log_msg( "looking for a system volume, and found unknown volume '%s'. using it as the system volume.\n",  v57,  v58,  v59,  v60,  v61,  v62,  v63,  (char)name);
LABEL_89:
              uint64_t v103 = 1;
              uint64_t v104 = &system_device_node_path_0;
            }

LABEL_8:
  logfunction("", 1, v22, v14, v15, v16, v17, v18, v30);
  return v23;
}

    uint64_t v12 = 0;
    uint64_t v10 = 1;
    goto LABEL_9;
  }

  uint64_t v12 = 1;
  uint64_t v10 = 1;
LABEL_9:
  objc_storeStrong(location, 0LL);
  return v12;
}

  uint64_t v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    uint64_t v13 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

  uint64_t v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  a4,  (uint64_t)a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    uint64_t v13 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_1000096A4(_Unwind_Exception *a1)
{
}

void sub_100009730(_Unwind_Exception *a1)
{
}

void sub_100009B18(_Unwind_Exception *a1)
{
}

NSString *fetch_string_sysctl()
{
  size_t __size = 0LL;
  if (sysctlbyname("kern.bootsessionuuid", 0LL, &__size, 0LL, 0LL)) {
    return 0LL;
  }
  if (!__size) {
    return 0LL;
  }
  v0 = malloc(__size);
  if (!v0) {
    return 0LL;
  }
  CFTypeRef v1 = v0;
  if (sysctlbyname("kern.bootsessionuuid", v0, &__size, 0LL, 0LL)) {
    CFTypeID v2 = 0LL;
  }
  else {
    CFTypeID v2 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v1, 4LL);
  }
  free(v1);
  return v2;
}

int *clear_apply_state()
{
  v0 = +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/last_update_result.plist");
  if (v0)
  {
    uint64_t v8 = v0;
    _clear_apply_state(v0);
    v0 = (NSMutableDictionary *)-[NSMutableDictionary writeToFile:atomically:]( v8,  "writeToFile:atomically:",  @"/private/var/MobileSoftwareUpdate/last_update_result.plist",  1LL);
  }

  if (msu_running_in_limited_environment((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7)) {
    return logfunction( "",  1,  @"%s: Running in recoveryOS..skipping cleanup of BootedOSState plist file\n",  v9,  v10,  v11,  v12,  v13,  (char)"clear_apply_state");
  }
  if ((msu_should_save_env_info_for_recovery() & 1) != 0) {
    return (int *)saveCurrentEnvInfoForNeRD(0LL);
  }
  return logfunction( "",  1,  @"%s: Not attempting to cleanup recoveryOS info since save_env_info is not set\n",  v15,  v16,  v17,  v18,  v19,  (char)"clear_apply_state");
}

id _clear_apply_state(void *a1)
{
  return [a1 removeObjectForKey:@"TargetVolumeGroupUUID"];
}

uint64_t process_update_result_state(char *a1, char *a2)
{
  uint64_t string_sysctl = (uint64_t)fetch_string_sysctl();
  if (string_sysctl)
  {
    uint64_t v5 = (void *)MGCopyAnswer(@"BootManifestHash", 0LL);
    if (v5)
    {
      uint64_t v6 = +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/MobileSoftwareUpdate/last_update_result.plist");
      if (!v6)
      {
        char v30 = 1;
        logfunction( "",  1,  @"%s: no update result file, assuming 1st boot after a restore\n",  v7,  v8,  v9,  v10,  v11,  (char)"process_update_result_state");
        uint64_t v12 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL);
        -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 0LL),  @"PreviousUpdateState");
        -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.0),  @"PreviousRestoreDate");
        clear_firmware_specific_data();
        uint64_t v31 = 0LL;
        char v32 = 0;
        if (!v12)
        {
          uint64_t string_sysctl = 1LL;
          goto LABEL_58;
        }

        goto LABEL_57;
      }

      uint64_t v12 = v6;
      id v13 = -[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"BootUUID");
      if (v13)
      {
        if (([v13 isEqualToString:string_sysctl] & 1) == 0)
        {
          logfunction( "",  1,  @"%s: Boot UUID is different - 1st run after reboot\n",  v19,  v20,  v21,  v22,  v23,  (char)"process_update_result_state");
          id v24 = -[NSMutableDictionary objectForKey:](v12, "objectForKey:", @"TargetOS");
          if (v24)
          {
            -[NSMutableDictionary objectForKey:](v12, "objectForKey:", @"SourceOS");
            char v93 = 1;
            logfunction( "",  1,  @"%s: Update attempted (%@ -> %@)\n",  v25,  v26,  v27,  v28,  v29,  (char)"process_update_result_state");
          }

          else
          {
            char v93 = 0;
          }

          uint64_t v31 = (const void *)MGGetStringAnswer(@"BuildVersion");
          id v33 = -[NSMutableDictionary objectForKey:](v12, "objectForKey:", @"TargetBootManifestHash");
          id v34 = -[NSMutableDictionary objectForKey:](v12, "objectForKey:", @"OriginalBootManifestHash");
          BOOL v40 = v34 == 0LL;
          if (v34)
          {
            if ([v34 isEqualToData:v5])
            {
              BOOL v40 = 1;
              if (!v33) {
                goto LABEL_16;
              }
              goto LABEL_23;
            }

            uint64_t v47 = @"%s: Boot manifest hash differs - in different OS\n";
          }

          else
          {
            uint64_t v47 = @"%s: No boot manifest hash in result state file - assuming same OS\n";
          }

          logfunction("", 1, v47, v35, v36, v37, v38, v39, (char)"process_update_result_state");
          if (!v33)
          {
LABEL_16:
            if (v24)
            {
              logfunction( "",  1,  @"%s: Update was attempted, but no %@ boot manifest hash is present - using target OS version instead\n",  v35,  v36,  v37,  v38,  v39,  (char)"process_update_result_state");
              if (!v31)
              {
                uint64_t v46 = @"%s: Couldn't fetch current OS version to compare with target OS version - assuming we are in the target OS (%@)\n";
                goto LABEL_32;
              }

              if ([v24 isEqualToString:v31])
              {
                uint64_t v46 = @"%s: in target OS [%@]\n";
LABEL_32:
                unsigned int v53 = 1;
                logfunction("", 1, v46, v41, v42, v43, v44, v45, (char)"process_update_result_state");
                goto LABEL_34;
              }

              logfunction( "",  1,  @"%s: in different OS than target (target: %@ - current: %@)\n",  v41,  v42,  v43,  v44,  v45,  (char)"process_update_result_state");
              unsigned int v53 = 0;
LABEL_34:
              unsigned int v87 = v53;
              BOOL v92 = v40;
              uint64_t v88 = v31;
              uint64_t v89 = string_sysctl;
              uint64_t v90 = v5;
              uint64_t v91 = a2;
              __int128 v94 = 0u;
              __int128 v95 = 0u;
              __int128 v96 = 0u;
              __int128 v97 = 0u;
              id v54 = [&off_10006C958 countByEnumeratingWithState:&v94 objects:v98 count:16];
              if (v54)
              {
                id v60 = v54;
                uint64_t v61 = *(void *)v95;
                do
                {
                  for (uint64_t i = 0LL; i != v60; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v95 != v61) {
                      objc_enumerationMutation(&off_10006C958);
                    }
                    uint64_t v63 = *(const __CFString **)(*((void *)&v94 + 1) + 8LL * (void)i);
                    __int128 v64 = (const __CFData *)copy_nvram_variable(v63);
                    -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v63);
                    if (v64)
                    {
                      __int128 v65 = objc_alloc(&OBJC_CLASS___NSString);
                      BytePtr = CFDataGetBytePtr(v64);
                      char v67 = -[NSString initWithBytes:length:encoding:]( v65,  "initWithBytes:length:encoding:",  BytePtr,  CFDataGetLength(v64),  4LL);
                      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v67, v63);

                      CFRelease(v64);
                    }
                  }

                  id v60 = [&off_10006C958 countByEnumeratingWithState:&v94 objects:v98 count:16];
                }

                while (v60);
              }

              if (v92)
              {
                logfunction( "",  1,  @"%s: Failed Backward - in original OS after update was attempted\n",  v55,  v56,  v57,  v58,  v59,  (char)"process_update_result_state");
                -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 2LL),  @"PreviousUpdateState");
                a2 = v91;
                uint64_t string_sysctl = v89;
                uint64_t v5 = v90;
                uint64_t v31 = v88;
                char v32 = v93;
              }

              else
              {
                a2 = v91;
                uint64_t string_sysctl = v89;
                uint64_t v5 = v90;
                uint64_t v31 = v88;
                char v32 = v93;
                if (v87)
                {
                  id v68 = -[NSMutableDictionary objectForKey:](v12, "objectForKey:", @"ota-result");
                  if (v68)
                  {
                    if (![v68 isEqualToString:@"success"])
                    {
                      logfunction( "",  1,  @"%s: Failed Forward - made it to the new OS with a failure indicated in NVRAM [%@]\n",  v74,  v75,  v76,  v77,  v78,  (char)"process_update_result_state");
                      -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 3LL),  @"PreviousUpdateState");
                      record_firmware_failures(v12);
                      goto LABEL_53;
                    }

                    logfunction( "",  1,  @"%s: Successful Update - made it to the new OS with success set in NVRAM\n",  v74,  v75,  v76,  v77,  v78,  (char)"process_update_result_state");
                  }

                  else
                  {
                    logfunction( "",  1,  @"%s: made it to the new OS, but there is no ota-result set.  Assuming success.\n",  v69,  v70,  v71,  v72,  v73,  (char)"process_update_result_state");
                  }

                  uint64_t v79 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
                  uint64_t v80 = @"PreviousUpdateState";
                }

                else
                {
                  logfunction( "",  1,  @"%s: OS is different than target OS for update - update must have failed into recovery with a subsequent restore\n",  v55,  v56,  v57,  v58,  v59,  (char)"process_update_result_state");
                  -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 0LL),  @"PreviousUpdateState");
                  uint64_t v79 = +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.0);
                  uint64_t v80 = @"PreviousRestoreDate";
                }

                -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v79, v80);
                clear_firmware_specific_data();
              }

LABEL_53:
              char v30 = !v92;
              _clear_apply_state(v12);
              -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.0),  @"PreviousUpdateDate");
              v98[0] = 0LL;
              if (![(id)string_sysctl writeToFile:@"/var/run/FirstBootAfterUpdate" atomically:1 encoding:4 error:v98]
                || v98[0])
              {
                logfunction( "",  1,  @"%s: Failed to write firstBootAfterUpdate cookie file to /var/run (%@)\n",  v81,  v82,  v83,  v84,  v85,  (char)"process_update_result_state");
              }

              else
              {
                logfunction( "",  1,  @"%s: Successfully wrote firstBootAfterUpdate cookie file to /var/run\n",  v81,  v82,  v83,  v84,  v85,  (char)"process_update_result_state");
              }

              goto LABEL_57;
            }

LABEL_27:
            if (v40)
            {
              char v30 = 0;
            }

            else
            {
              char v30 = 1;
              logfunction( "",  1,  @"%s: new OS booted without an update (%@) - tethered restore has been done\n",  v35,  v36,  v37,  v38,  v39,  (char)"process_update_result_state");
              -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 0LL),  @"PreviousUpdateState");
              -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.0),  @"PreviousRestoreDate");
              clear_firmware_specific_data();
            }

            char v32 = v93;
            goto LABEL_57;
          }

LABEL_23:
          unsigned int v53 = [v33 isEqualToData:v5];
          if (v53) {
            logfunction( "",  1,  @"%s: in target OS [%@] - target manifest hash matches current boot manifest hash\n",  v48,  v49,  v50,  v51,  v52,  (char)"process_update_result_state");
          }
          else {
            logfunction( "",  1,  @"%s: not in target OS - target manifest hash does not match current boot manifest hash\n",  v48,  v49,  v50,  v51,  v52,  (char)"process_update_result_state");
          }
          if (v24) {
            goto LABEL_34;
          }
          goto LABEL_27;
        }
      }

      else
      {
        logfunction( "",  1,  @"%s: No boot UUID in result state file - assuming same boot\n",  v14,  v15,  v16,  v17,  v18,  (char)"process_update_result_state");
      }

      uint64_t v31 = 0LL;
      char v32 = 0;
      char v30 = 0;
LABEL_57:
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", string_sysctl, @"BootUUID");
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v5, @"OriginalBootManifestHash");
      uint64_t string_sysctl = 1LL;
      -[NSMutableDictionary writeToFile:atomically:]( v12,  "writeToFile:atomically:",  @"/private/var/MobileSoftwareUpdate/last_update_result.plist",  1LL);
      goto LABEL_58;
    }

    uint64_t v31 = 0LL;
    char v32 = 0;
    char v30 = 0;
    uint64_t string_sysctl = 0LL;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v31 = 0LL;
    char v32 = 0;
    char v30 = 0;
  }

LABEL_58:
  if (a1) {
    *a1 = v32;
  }
  if (a2) {
    *a2 = v30;
  }
  if (v5) {

  }
  if (v31) {
    CFRelease(v31);
  }
  return string_sysctl;
}

void clear_firmware_specific_data()
{
  v0 = objc_opt_new(&OBJC_CLASS___NSFileManager);
  uint64_t v1 = -[NSFileManager enumeratorAtPath:]( v0,  "enumeratorAtPath:",  @"/private/var/MobileSoftwareUpdate//preserved_firmware/");
  uint64_t v2 = objc_autoreleasePoolPush();
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v1,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)i);
        id v8 = [@"/private/var/MobileSoftwareUpdate//preserved_firmware/" stringByAppendingPathComponent:v7];
        NSLog( @"[clear_firmware_specific_data] Removing %@ because we're in a state where we don't need to preserve it.",  v7);
        -[NSFileManager removeItemAtPath:error:](v0, "removeItemAtPath:error:", v8, 0LL);
      }

      id v4 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v1,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v4);
  }

  objc_autoreleasePoolPop(v2);
}

void record_firmware_failures(void *a1)
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___NSFileManager);
  id v3 = -[NSFileManager enumeratorAtPath:]( v2,  "enumeratorAtPath:",  @"/private/var/MobileSoftwareUpdate//preserved_firmware/");
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = objc_autoreleasePoolPush();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        NSLog( @"[record_firmware_failures] Found %@ updater data blob during a boot after fail-forward.",  v10);
        -[NSMutableArray addObject:](v4, "addObject:", v10);
      }

      id v7 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  objc_autoreleasePoolPop(v5);
  if (v4 && -[NSMutableArray count](v4, "count")) {
    [a1 setObject:v4 forKeyedSubscript:@"PreservedFirmware"];
  }
}

BOOL is_first_boot_cleanup_done()
{
  v0 = objc_autoreleasePoolPush();
  BOOL v1 = -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/var/run/FirstBootCleanupHandled");
  logfunction( "",  1,  @"%s: is first boot cleanup done: %@\n",  v2,  v3,  v4,  v5,  v6,  (char)"is_first_boot_cleanup_done");
  objc_autoreleasePoolPop(v0);
  return v1;
}

void sub_10000AF34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B164(_Unwind_Exception *a1)
{
}

void sub_10000B2F8(_Unwind_Exception *a1)
{
}

void sub_10000B52C(_Unwind_Exception *exception_object)
{
}

void sub_10000B604(_Unwind_Exception *a1)
{
}

void msu_process_dictionary_values_for_xpc_serialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_for_xpc_serialization(a2);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }

    CFRelease(v6);
  }

CFDictionaryRef msu_process_cf_object_for_xpc_serialization(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0LL;
        CFMutableDictionaryRef MutableCopy = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v8 = msu_process_cf_object_for_xpc_serialization(ValueAtIndex);
          if (v8)
          {
            __int128 v9 = (const void *)v8;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v9);
            CFRelease(v9);
          }

          ++v6;
        }

        while (v5 != v6);
        return MutableCopy;
      }
    }

    else if (v2 == CFErrorGetTypeID())
    {
      return cferror_to_dictionary_embedded((__CFError *)a1, 1);
    }

    return 0LL;
  }

  context = 0LL;
  CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)msu_process_dictionary_values_for_xpc_serialization,  &context);
  if (!context) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return MutableCopy;
}

void msu_merge_dictionary_values(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void msu_serialize_cf_object_into_xpc_dict( void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    CFDictionaryRef v11 = msu_process_cf_object_for_xpc_serialization(a3);
    if (v11)
    {
      CFDictionaryRef v12 = v11;
      __int128 v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(v11);
      CFRelease(v12);
      if (v13)
      {
LABEL_4:
        xpc_dictionary_set_value(a1, a2, v13);
        xpc_release(v13);
        return;
      }
    }

    else
    {
      __int128 v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
      if (v13) {
        goto LABEL_4;
      }
    }

    logfunction("", 1, @"could not create object for key %s:%@\n", v14, v15, v16, v17, v18, (char)a2);
  }

  else
  {
    logfunction( "",  1,  @"%s: API misuse - object is NULL\n",  a4,  a5,  a6,  a7,  a8,  (char)"msu_serialize_cf_object_into_xpc_dict");
  }

void msu_process_dictionary_values_from_xpc_deserialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_from_xpc_deserialization(a2);
  if (v5)
  {
    CFIndex v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }

    CFRelease(v6);
  }

CFStringRef msu_process_cf_object_from_xpc_deserialization(const void *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0LL;
        CFMutableDictionaryRef MutableCopy = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v9 = msu_process_cf_object_from_xpc_deserialization(ValueAtIndex);
          if (v9)
          {
            uint64_t v10 = (const void *)v9;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v10);
            CFRelease(v10);
          }

          ++v6;
        }

        while (v5 != v6);
        return (const __CFString *)MutableCopy;
      }
    }

    return 0LL;
  }

  if (CFDictionaryContainsKey((CFDictionaryRef)a1, @"_MSU_Embedded_Error")) {
    return copy_dictionary_to_cferror(a1);
  }
  context = 0LL;
  CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)msu_process_dictionary_values_from_xpc_deserialization,  &context);
  if (!context) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return (const __CFString *)MutableCopy;
}

CFStringRef msu_deserialize_cf_object_from_xpc_dict(void *a1, const char *a2)
{
  if (!xpc_dictionary_get_value(a1, a2)) {
    return 0LL;
  }
  CFTypeID v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v3 = msu_process_cf_object_from_xpc_deserialization(v2);
  if (v3)
  {
    uint64_t v4 = v3;
    CFRelease(v2);
    return v4;
  }

  return (const __CFString *)v2;
}

void handle_message( _xpc_connection_s *a1, xpc_object_t xdict, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  string = xpc_dictionary_get_string(xdict, "Command");
  if (!string)
  {
    logfunction("", 1, @"No command in request\n", v14, v15, v16, v17, v18, a9);
    return;
  }

  uint64_t v19 = string;
  uint64_t v23 = msu_deserialize_cf_object_from_xpc_dict(xdict, "CommandParameters");
  if (a4)
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = (uint64_t *)(a3 + 16);
    while (1)
    {
      size_t v26 = strlen((const char *)*(v25 - 2));
      ++v24;
      v25 += 3;
      if (a4 == v24) {
        goto LABEL_12;
      }
    }

    if ((msu_client_is_entitled(a1, *v25) & 1) == 0)
    {
      error_internal_CFStringRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Client does not have entitlement %s",  v27,  v28,  v29,  *v25);
LABEL_14:
      char v32 = error_internal_cf;
      msu_send_error(a1, 0LL, error_internal_cf, 0);
      if (v32) {
        CFRelease(v32);
      }
      goto LABEL_16;
    }

    char v30 = (void *)os_transaction_create("com.apple.MobileSoftwareUpdate.handle_message");
    ((void (*)(_xpc_connection_s *, xpc_object_t, const __CFString *))*(v25 - 1))(a1, xdict, v23);
    os_release(v30);
  }

  else
  {
    LODWORD(v24) = 0;
  }

  if ((_DWORD)v24 == a4)
  {
LABEL_12:
    error_internal_CFStringRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Unknown command '%s'",  v20,  v21,  v22,  (char)v19);
    goto LABEL_14;
  }

LABEL_16:
  if (v23) {
    CFRelease(v23);
  }
}

  CFIndex v5 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(v21, 0LL);
  return v5;
}

uint64_t msu_client_is_entitled(_xpc_connection_s *a1, uint64_t a2)
{
  if (!a2) {
    return 1LL;
  }
  char v2 = a2;
  uint64_t v4 = (void *)xpc_connection_copy_entitlement_value();
  if (v4)
  {
    CFIndex v5 = v4;
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_BOOL)
    {
      if (xpc_BOOL_get_value(v5))
      {
        uint64_t v12 = 1LL;
LABEL_17:
        xpc_release(v5);
        return v12;
      }

      CFDictionaryRef v11 = @"Value for entitlement '%s' is false\n";
    }

    else
    {
      CFDictionaryRef v11 = @"Entitlement '%s' is not a BOOLean\n";
    }

    logfunction("", 1, v11, v6, v7, v8, v9, v10, v2);
    uint64_t v12 = 0LL;
    goto LABEL_17;
  }

  pid_t pid = xpc_connection_get_pid(a1);
  bzero(buffer, 0x400uLL);
  __int128 v24 = 0u;
  memset(v25, 0, sizeof(v25));
  memset(&audittoken, 0, sizeof(audittoken));
  xpc_connection_get_audit_token(a1, &audittoken);
  if (proc_pidpath_audittoken(&audittoken, buffer, 0x400u) < 1)
  {
    int v21 = proc_pidinfo(pid, 13, 0LL, &v24, 64);
    uint64_t v20 = (const char *)v25;
    if (!v21) {
      uint64_t v20 = "<unknown>";
    }
  }

  else
  {
    uint64_t v14 = strrchr(buffer, 47);
    if (v14) {
      LOBYTE(v20) = (_BYTE)v14 + 1;
    }
    else {
      uint64_t v20 = buffer;
    }
  }

  logfunction("", 1, @"Client %s[%d] does not have the '%s' entitlement\n", v15, v16, v17, v18, v19, (char)v20);
  return 0LL;
}

void msu_send_error(_xpc_connection_s *a1, xpc_object_t original, __CFError *a3, int a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Error");
    if (a3)
    {
      CFDictionaryRef v9 = cferror_to_dictionary(a3);
      if (v9)
      {
        CFDictionaryRef v15 = v9;
        msu_serialize_cf_object_into_xpc_dict(v8, "ErrorInfo", v9, v10, v11, v12, v13, v14);
        CFRelease(v15);
      }
    }

    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
    if (a4) {
      submitRestoreLogFile(a3, 0LL, 0LL, 0LL);
    }
  }

void msu_send_status(_xpc_connection_s *a1, void *a2, void *a3)
{
}

void msu_send_status_with_reply(_xpc_connection_s *a1, xpc_object_t original, void *a3, uint64_t a4)
{
  if (original) {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  uint64_t v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_string(reply, "IPCStatus", "Complete");
    if (a3) {
      msu_serialize_cf_object_into_xpc_dict(v8, "Results", a3, v9, v10, v11, v12, v13);
    }
    if (a4) {
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v8);
    }
    xpc_connection_send_message(a1, v8);
    xpc_release(v8);
  }

CFPropertyListRef _MSUPreferencesCopyValueForDomain(const __CFString *a1, const __CFString *a2)
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(a1, a2);
  if (v4) {
    return v4;
  }
  if (_getManagedPreferencesDict_managedPreferencesOnce != -1) {
    dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_3);
  }
  if (_getManagedPreferencesDict__managedPreferencesCache)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, a1);
    if (Value)
    {
      CFPropertyListRef v4 = Value;
      CFRetain(Value);
      return v4;
    }
  }

  return CFPreferencesCopyValue(a1, a2, @"mobile", kCFPreferencesAnyHost);
}

uint64_t _MSUPreferencesGetAppBooleanValue(const __CFString *a1, _BYTE *a2)
{
  uint64_t v3 = (const __CFBoolean *)_MSUPreferencesCopyValueForDomain(a1, @"com.apple.MobileSoftwareUpdate");
  CFPropertyListRef v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    BOOL v6 = v5 == CFBooleanGetTypeID();
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  BOOL v6 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v6;
LABEL_4:
  if (v6)
  {
    uint64_t Value = CFBooleanGetValue(v4);
    if (!v4) {
      return Value;
    }
    goto LABEL_8;
  }

  uint64_t Value = 0LL;
  if (v4) {
LABEL_8:
  }
    CFRelease(v4);
  return Value;
}

uint64_t _MSUPreferencesGetAppBooleanValueWithDefaultValue(const __CFString *a1, unsigned int a2)
{
  char v4 = 0;
  LODWORD(result) = _MSUPreferencesGetAppBooleanValue(a1, &v4);
  if (v4) {
    return result;
  }
  else {
    return a2;
  }
}

void ___getManagedPreferencesDict_block_invoke(id a1)
{
  CFStringRef v1 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%@/%@.plist",  @"/Library/Managed Preferences/mobile",  @"com.apple.MobileSoftwareUpdate");
  if (v1)
  {
    CFStringRef v2 = v1;
    _getManagedPreferencesDict__managedPreferencesCache = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  v1);
    CFRelease(v2);
  }

int main(int argc, const char **argv, const char **envp)
{
  __int16 v160 = 0;
  logfunction("", 1, @"CleanupPreparePath main() started\n", v3, v4, v5, v6, v7, v146);
  set_partition_logging_function(msu_partition_logger);
  set_partition_execution_function(msu_execute_command_with_callback);
  set_partition_execution_logging_function(msu_partition_execution_logger);
  uint64_t is_recovery = os_variant_is_recovery(0LL);
  if ((_DWORD)is_recovery) {
    fixCrashReporterDir(is_recovery, v9, v10, v11, v12, v13, v14, v15);
  }
  if ((openRestoreLogFile(1) & 0x80000000) != 0) {
    logfunction("", 1, @"Could not open log file\n", v16, v17, v18, v19, v20, v147);
  }
  if (atexit((void (*)(void))closeRestoreLogFile))
  {
    int v21 = __error();
    char v22 = strerror(*v21);
    logfunction("", 1, @"Could not register aexit: %s\n", v23, v24, v25, v26, v27, v22);
  }

  ramrod_log_set_handler(_ramrod_log_handler);
  logfunction("", 1, @"Enabling vnode rapid aging\n", v28, v29, v30, v31, v32, v147);
  *(void *)v165 = 0x4400000001LL;
  int v159 = 1;
  if (sysctl(v165, 2u, 0LL, 0LL, &v159, 0LL)) {
    uint64_t v38 = @"Failed to enable vnode rapid aging\n";
  }
  else {
    uint64_t v38 = @"Successfully enabled rapid vnode aging\n\n";
  }
  logfunction("", 1, v38, v33, v34, v35, v36, v37, v148);
  process_update_result_state((char *)&v160 + 1, (char *)&v160);
  if (!HIBYTE(v160)) {
    goto LABEL_49;
  }
  BOOL boot_cleanup_done = is_first_boot_cleanup_done();
  if (!boot_cleanup_done)
  {
    int v52 = msu_running_in_limited_environment(boot_cleanup_done, v45, v46, v47, v48, v49, v50, v51);
    char v58 = v52;
    if (v52) {
      uint64_t v59 = @"First boot after update: Not clearing MobileAsset preference overrides since running in recovery OS\n";
    }
    else {
      uint64_t v59 = @"First boot after update: Clearing out old preference overrides\n";
    }
    logfunction("", 1, v59, v53, v54, v55, v56, v57, v149);
    CFPreferencesAppSynchronize(@"com.apple.MobileAsset");
    CFPreferencesAppSynchronize(@"com.apple.MobileSoftwareUpdate");
    id v60 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    logfunction( "",  1,  @"Platform requires that URLs are preserved after updates.\n",  v61,  v62,  v63,  v64,  v65,  v150);
    if (objc_opt_class(&OBJC_CLASS___SDBetaManager)
      && (objc_opt_respondsToSelector(&OBJC_CLASS___SDBetaManager, "_isEnrolledInBetaProgram") & 1) != 0)
    {
      if (+[SDBetaManager _isEnrolledInBetaProgram]( &OBJC_CLASS___SDBetaManager,  "_isEnrolledInBetaProgram")) {
        uint64_t v71 = @"Device is enrolled in a seeding program via +[SDBetaManager _isEnrolledInBetaProgram]; not resetting MobileAssetAssetAudience\n";
      }
      else {
        uint64_t v71 = @"Device is not enrolled in a seeding program via +[SDBetaManager _isEnrolledInBetaProgram]\n";
      }
    }

    else
    {
      uint64_t v71 = @"Device does not have the seeding framework installed via check +[SDBetaManager _isEnrolledInBetaProgram]\n";
    }

    logfunction("", 1, v71, v66, v67, v68, v69, v70, v151);
    if ((v58 & 1) == 0)
    {
      logfunction( "",  1,  @"Clearing out MobileAsset preference overrides: %@\n",  v72,  v73,  v74,  v75,  v76,  (char)v60);
      if (v60)
      {
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        id v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v60,  "countByEnumeratingWithState:objects:count:",  &v161,  v166,  16LL);
        if (v77)
        {
          id v78 = v77;
          uint64_t v79 = *(void *)v162;
          do
          {
            for (uint64_t i = 0LL; i != v78; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v162 != v79) {
                objc_enumerationMutation(v60);
              }
              uint64_t v81 = *(const __CFString **)(*((void *)&v161 + 1) + 8LL * (void)i);
              CFPreferencesSetValue(v81, 0LL, @"com.apple.MobileAsset", @"mobile", kCFPreferencesAnyHost);
              CFPreferencesSetValue(v81, 0LL, @"com.apple.MobileAsset", @"root", kCFPreferencesAnyHost);
            }

            id v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v60,  "countByEnumeratingWithState:objects:count:",  &v161,  v166,  16LL);
          }

          while (v78);
        }
      }
    }

    logfunction("", 1, @"Clearing out MobileSoftwareUpdate preference overrides\n", v72, v73, v74, v75, v76, v152);
    CFPreferencesSetValue( @"DisableSnapshotUpdate",  0LL,  @"com.apple.MobileSoftwareUpdate",  @"mobile",  kCFPreferencesAnyHost);
    CFPreferencesSetValue( @"DisableSnapshotUpdate",  0LL,  @"com.apple.MobileSoftwareUpdate",  @"root",  kCFPreferencesAnyHost);
    CFPreferencesAppSynchronize(@"com.apple.MobileAsset");
    CFPreferencesAppSynchronize(@"com.apple.MobileSoftwareUpdate");
    logfunction( "",  1,  @"First boot after update: Finished clearing preference overrides\n",  v82,  v83,  v84,  v85,  v86,  v153);
    logfunction("", 1, @"First boot after update: Purging brains\n", v87, v88, v89, v90, v91, v154);
    logfunction("", 1, @"in deleteV1AssetPath\n", v92, v93, v94, v95, v96, v155);
    v166[0] = 0LL;
    __int128 v97 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    if (-[NSFileManager fileExistsAtPath:]( v97,  "fileExistsAtPath:",  @"/var/MobileAsset/Assets/com_apple_MobileAsset_MobileSoftwareUpdate_UpdateBrain")
      && -[NSFileManager removeItemAtPath:error:]( v97,  "removeItemAtPath:error:",  @"/var/MobileAsset/Assets/com_apple_MobileAsset_MobileSoftwareUpdate_UpdateBrain",  v166))
    {
      logfunction("", 1, @"V1 assets folder successfully deleted\n", v98, v99, v100, v101, v102, v156);
    }

    logfunction("", 1, @"First boot after update: Done purging brains\n", v98, v99, v100, v101, v102, v156);
    uint64_t v103 = -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  @"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist");
    if ((_DWORD)v103)
    {
      logfunction( "",  1,  @"Located Pre-SoftwareUpdate Asset Staging state plist at path: %s\n",  v106,  v107,  v108,  v109,  v110,  (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist");
      v166[0] = 0LL;
      if (-[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  @"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist",  v166))
      {
        uint64_t v103 = (uint64_t)logfunction( "",  1,  @"Successfully removed Pre-SoftwareUpdate Asset Staging state plist at path: %s\n",  v111,  v112,  v113,  v114,  v115,  (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist");
      }

      else
      {
        uint64_t v103 = (uint64_t)logfunction( "",  1,  @"Failed to remove Pre-SoftwareUpdate Asset Staging state plist at path: %s, with error: %@\n",  v111,  v112,  v113,  v114,  v115,  (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist");
      }
    }

    MSUCleanupPreboot(v103, v104, v105, v106, v107, v108, v109, v110, v157);
    MSUCleanupDataVolume();
    v166[0] = 0LL;
    unsigned __int8 v116 = [@"SqueakyClean" writeToFile:@"/var/run/FirstBootCleanupHandled" atomically:1 encoding:4 error:v166];
    if ((v116 & (v166[0] == 0LL)) != 0) {
      v122 = @"Successfully wrote firstBootCleanupDone cookie to /var/run\n";
    }
    else {
      v122 = @"Failed to write firstBootCleanupDone cookie to /var/run\n";
    }
    logfunction("", 1, v122, v117, v118, v119, v120, v121, v158);
  }

  time_t v123 = (const __CFData *)copy_nvram_variable(@"usbcfw.version");
  if (!v123)
  {
LABEL_49:
    if ((_BYTE)v160)
    {
      logfunction("", 1, @"OSVersion changed. Notifying clients\n", v39, v40, v41, v42, v43, v149);
      uint64_t v129 = notify_post("com.apple.MobileSoftwareUpdate.OSVersionChanged");
      __int128 v130 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary(v129);
      if (v130)
      {
        __int128 v131 = v130;
        CFDictionaryGetValue(v130, _kCFSystemVersionProductVersionExtraKey);
        logfunction("", 1, @"%s: %i\n", v132, v133, v134, v135, v136, (char)"splat_installed");
        CFRelease(v131);
      }
    }

    conditionally_boot_efi_based_on_nvram();
    xpc_main((xpc_connection_handler_t)CleanupPreparePathService_event_handler);
  }

  v124 = v123;
  if (CFDataGetLength(v123) < 1)
  {
LABEL_48:
    CFRelease(v124);
    goto LABEL_49;
  }

  v125 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v124, 0x8000100u);
  CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  __int128 v127 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v127, @"IOClass", @"AppleUSBCController");
  CFDictionarySetValue(Mutable, @"IOPropertyMatch", v127);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, Mutable);
  if (MatchingService)
  {
    io_object_t v137 = MatchingService;
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( MatchingService,  @"Firmware Version",  kCFAllocatorDefault,  0);
    if (CFProperty)
    {
      v139 = CFProperty;
      if (CFStringGetLength(CFProperty) >= 1 && CFStringCompare(v139, v125, 0x40uLL)) {
        logfunction( "",  1,  @"USBC FW version in IORegistry (%@) != USBC FW version in nvram (%@)\n",  v140,  v141,  v142,  v143,  v144,  (char)v139);
      }
      CFRelease(v139);
    }

    IOObjectRelease(v137);
    if (!v127)
    {
LABEL_45:
      if (!v125)
      {
LABEL_47:
        delete_nvram_variable(@"usbcfw.version");
        goto LABEL_48;
      }

LABEL_46:
      CFRelease(v125);
      goto LABEL_47;
    }
  }

  else if (!v127)
  {
    goto LABEL_45;
  }

  CFRelease(v127);
  if (!v125) {
    goto LABEL_47;
  }
  goto LABEL_46;
}

int *_ramrod_log_handler( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return logfunction("", 1, @"%s\n", a4, a5, a6, a7, a8, a1);
}

void CleanupPreparePathService_event_handler(_xpc_connection_s *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __CleanupPreparePathService_event_handler_block_invoke;
  handler[3] = &unk_100061218;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  if (cleanup_service_queue_onceToken != -1) {
    dispatch_once(&cleanup_service_queue_onceToken, &__block_literal_global_197);
  }
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)cleanup_service_queue_service_queue);
  xpc_connection_resume(a1);
}

void conditionally_boot_efi_based_on_nvram()
{
  CFTypeRef v0 = copy_nvram_variable(@"auto-boot-x86-once");
  if (v0)
  {
    CFStringRef v1 = v0;
    char v8 = 1;
    else {
      logfunction("", 1, @"Failed to write AUPO to 1. Higher level OS will not boot.\n", v2, v3, v4, v5, v6, v7);
    }
    CFRelease(v1);
  }

void handle_MSUCleanupPreparePath(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  CFTypeRef cf = 0LL;
  uint64_t Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldPurge");
  char v7 = Value;
  if (Value)
  {
    CFTypeID v8 = CFGetTypeID(Value);
    LODWORD(v7) = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
  }

  uint64_t v9 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldPurgeStagedAssets");
  v12 = v9 && (uint64_t v10 = v9, v11 = CFGetTypeID(v9), v11 == CFBooleanGetTypeID()) && CFBooleanGetValue(v10) != 0;
  uint64_t v13 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldDisableAssetStaging");
  v16 = v13 && (v14 = v13, CFTypeID v15 = CFGetTypeID(v13), v15 == CFBooleanGetTypeID()) && CFBooleanGetValue(v14) != 0;
  uint64_t v17 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"ShouldResetAPFSReserve");
  v25 = !v17 || (uint64_t v23 = v17, v24 = CFGetTypeID(v17), v24 != CFBooleanGetTypeID()) || CFBooleanGetValue(v23) != 0;
  if (v12)
  {
    logfunction( "",  1,  @"CleanupPreparePathService: Purging Pre-Software Update Staged Assets\n",  v18,  v19,  v20,  v21,  v22,  v38);
    +[MSUAssetStager purgeStagedAssetsAsync](&OBJC_CLASS___MSUAssetStager, "purgeStagedAssetsAsync");
  }

  if (v16)
  {
    logfunction( "",  1,  @"CleanupPreparePathService: Disabling Pre-Software Update Asset Staging\n",  v18,  v19,  v20,  v21,  v22,  v38);
    uint64_t v31 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
    if (!v31) {
      logfunction("", 1, @"Failed to get buildVersion\n", v26, v27, v28, v29, v30, v39);
    }
    uint64_t v37 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
    if (!v37) {
      logfunction("", 1, @"Failed to get productVersion\n", v32, v33, v34, v35, v36, v39);
    }
    +[MSUAssetStager disableStagingForReason:buildVersion:osVersion:]( &OBJC_CLASS___MSUAssetStager,  "disableStagingForReason:buildVersion:osVersion:",  @"Disabling by request of Cleanup Prepare Path Service",  v31,  v37);
    if (v31) {

    }
    if (v37) {
  }
    }

  else {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void handle_MSUCleanupNVRAM(_xpc_connection_s *a1, void *a2)
{
  CFTypeRef cf = 0LL;
  if (os_variant_has_internal_content("com.apple.mobilesoftwareupdate"))
  {
    CFTypeRef v4 = copy_nvram_variable(@"ota-uuid");
    if (v4)
    {
      uint64_t v5 = v4;
      __int128 v7 = off_1000612B0;
      execute_command((char *const *)&v7, (uint64_t)handle_MSUCleanupLogger);
      CFRelease(v5);
    }
  }

  else {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void handle_MSUCleanupRecoveryOSSavedState( _xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v66 = 0LL;
  CFTypeID v11 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s/%s/%@");
  if (-[NSFileManager fileExistsAtPath:](v10, "fileExistsAtPath:", v11))
  {
    logfunction( "",  1,  @"Deleting RecoveryOS status file\n",  v12,  v13,  v14,  v15,  v16,  (char)"/private/var/MobileSoftwareUpdate/");
    -[NSFileManager removeItemAtPath:error:](v10, "removeItemAtPath:error:", v11, &v66);
    if (v66) {
      logfunction("", 1, @"Unable to delete RecoveryOS status file: %@\n", v17, v18, v19, v20, v21, (char)v66);
    }
  }

  else
  {
    logfunction( "",  1,  @"RecoveryOS status file not present(not an error)\n",  v12,  v13,  v14,  v15,  v16,  (char)"/private/var/MobileSoftwareUpdate/");
  }

  id v66 = 0LL;
  uint64_t v22 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s/%s/%s");
  if (-[NSFileManager fileExistsAtPath:](v10, "fileExistsAtPath:", v22))
  {
    logfunction( "",  1,  @"Deleting RecoveryOS connectivity data\n",  v23,  v24,  v25,  v26,  v27,  (char)"/private/var/MobileSoftwareUpdate/");
    -[NSFileManager removeItemAtPath:error:](v10, "removeItemAtPath:error:", v22, &v66);
    if (v66) {
      logfunction( "",  1,  @"Unable to delete RecoveryOS connectivity data file: %@\n",  v28,  v29,  v30,  v31,  v32,  (char)v66);
    }
  }

  else
  {
    logfunction( "",  1,  @"RecoveryOS connectivity data file not present\n",  v23,  v24,  v25,  v26,  v27,  (char)"/private/var/MobileSoftwareUpdate/");
  }

  char v38 = logfunction("", 1, @"Clearing out RecoveryOS logarchives\n", v33, v34, v35, v36, v37, v64);
  clear_recoveryos_logarchive_files((uint64_t)v38, v39, v40, v41, v42, v43, v44, v45);
  if (MGGetBoolAnswer(@"InternalBuild")
    && (AppIntegeruint64_t Value = CFPreferencesGetAppIntegerValue( @"NerdLogarchivePreservationTime",  @"com.apple.MobileSoftwareUpdate.CleanupPreparePathService",  0LL)) != 0)
  {
    CFIndex v52 = AppIntegerValue;
    -[NSNumber doubleValue]( +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", AppIntegerValue),  "doubleValue");
    logfunction( "",  1,  @"Overriding RecoveryOS logarchive preservation timeout to %f seconds\n",  v53,  v54,  v55,  v56,  v57,  v58);
    -[NSNumber doubleValue](+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v52), "doubleValue");
    int64_t v60 = (uint64_t)(v59 * 1000000000.0);
  }

  else
  {
    logfunction( "",  1,  @"Using default RecoveryOS logarchive preservation timeout\n",  v46,  v47,  v48,  v49,  v50,  v65);
    int64_t v60 = 1209600000000000LL;
  }

  dispatch_time_t v61 = dispatch_time(0LL, v60);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  dispatch_after(v61, global_queue, &__block_literal_global_4);
  msu_send_status(a1, a2, 0LL);
}

void handle_MSUCleanupLogs(_xpc_connection_s *a1, void *a2, CFDictionaryRef theDict)
{
  uint64_t valuePtr = 0x7FFFFFFFFFFFFFFFLL;
  CFTypeRef cf = 0LL;
  CFTypeRef v15 = 0LL;
  uint64_t Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"LogsRetention");
  if (Value && (CFTypeID v11 = Value, v12 = CFGetTypeID(Value), v12 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v11, kCFNumberSInt64Type, &valuePtr);
    time_t v13 = valuePtr;
  }

  else
  {
    logfunction("", 1, @"no valid retention\n", v6, v7, v8, v9, v10, v14);
    time_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else {
    msu_send_error(a1, a2, (__CFError *)cf, 1);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v15) {
    CFRelease(v15);
  }
}

int *handle_reboot_to_nerd( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (+[NeRDSPI setNVRAMForRebootToNerd](&OBJC_CLASS___NeRDSPI, "setNVRAMForRebootToNerd"))
  {
    logfunction("", 1, @"Rebooting now\n", v9, v10, v11, v12, v13, vars0a);
    else {
      char v14 = @"Initiated reboot into nerd\n";
    }
  }

  else
  {
    char v14 = @"Failed to set the needed NVRAM to reboot to NeRD\n";
  }

  return logfunction("", 1, v14, v9, v10, v11, v12, v13, a9);
}

int *handle_MSUCleanupLogger( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return logfunction("", 1, @"%s\n", a4, a5, a6, a7, a8, a1);
}

void __clear_recoveryos_saved_files_block_invoke(id a1)
{
  uint64_t v6 = logfunction("", 1, @"Timer fired for clearing RecoveryOS logarchive files\n", v1, v2, v3, v4, v5, vars0);
  clear_recoveryos_logarchive_files((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
}

void clear_recoveryos_logarchive_files( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s/%s",  "/private/var/MobileSoftwareUpdate/",  "Controller/NeRD");
  uint64_t v9 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  obj = -[NSFileManager enumeratorAtPath:](v9, "enumeratorAtPath:", v8);
  AppIntegeruint64_t Value = CFPreferencesGetAppIntegerValue( @"NerdLogarchivePreservationTime",  @"com.apple.MobileSoftwareUpdate.CleanupPreparePathService",  0LL);
  if (AppIntegerValue)
  {
    -[NSNumber doubleValue]( +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", AppIntegerValue),  "doubleValue");
    double v12 = v11;
  }

  else
  {
    double v12 = 1209600.0;
  }

  id v36 = 0LL;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v13 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        if (([v17 hasSuffix:@".logarchive"] & 1) != 0
          || [v17 hasSuffix:@".logarchive.zip"])
        {
          uint64_t v18 = -[NSString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", v17);
          -[NSDate timeIntervalSinceDate:]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceDate:",  -[NSDictionary objectForKey:]( -[NSFileManager attributesOfItemAtPath:error:](v9, "attributesOfItemAtPath:error:", v18, 0LL),  "objectForKey:",  NSFileCreationDate));
          if (v24 >= v12)
          {
            logfunction("", 1, @"Deleting %@\n", v19, v20, v21, v22, v23, (char)v17);
            -[NSFileManager removeItemAtPath:error:](v9, "removeItemAtPath:error:", v18, &v36);
            if (v36)
            {
              logfunction("", 1, @"Failed to delete %@ : %@\n", v25, v26, v27, v28, v29, (char)v17);

              id v36 = 0LL;
            }
          }

          else
          {
            logfunction( "",  1,  @"Skipping %@ since it is newer than the timeout\n",  v19,  v20,  v21,  v22,  v23,  (char)v17);
          }
        }
      }

      id v14 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
    }

    while (v14);
  }
}

void __cleanup_service_queue_block_invoke(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
  cleanup_service_queue_service_queue = (uint64_t)dispatch_queue_create( "com.apple.MobileSoftwareUpdate.CleanupPreparePathService.queue",  v1);
}

uint64_t get_snapshot_preparation_size(void *a1, char **a2, CFErrorRef *a3)
{
  id v6 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  uint64_t v7 = (NSNumber *)[a1 objectForKey:@"InstallationSize-Snapshot"];
  if (v7)
  {
    id v13 = v7;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setFormatterBehavior:]( v15,  "setFormatterBehavior:",  +[NSNumberFormatter defaultFormatterBehavior](&OBJC_CLASS___NSNumberFormatter, "defaultFormatterBehavior"));
      id v13 = -[NSNumberFormatter numberFromString:](v15, "numberFromString:", v13);
      uint64_t v16 = @"update_attributes[InstallationSize-Snapshot] (string)";
LABEL_10:
      uint64_t v48 = -[NSNumber longLongValue](v13, "longLongValue");
      [v6 add:v48 annotation:v16];
      uint64_t updated = cryptex_size_requirement_for_update_type(0, a1);
      __int128 v35 = &v48[updated];
      [v6 add:updated annotation:@"cryptex_size_requirement_for_update_type(msu_update_type_snapshot)"];
      uint64_t v36 = 1LL;
      logfunction( "",  1,  @"snapshot preparation size (mastered) : %lld (%lld MB)\n",  v50,  v51,  v52,  v53,  v54,  (char)v35);
      logfunction("", 1, @"\n%s():%@\n", v55, v56, v57, v58, v59, (char)"get_snapshot_preparation_size");
      goto LABEL_11;
    }

    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v13, v42) & 1) != 0)
    {
      uint64_t v16 = @"update_attributes[InstallationSize-Snapshot] (number)";
      goto LABEL_10;
    }

    logfunction( "",  1,  @"InstallationSize-Snapshot has invalid type in update attributes\n",  v43,  v44,  v45,  v46,  v47,  v65);
    error_internal_CFTypeRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Invalid update attributes: invalid type InstallationSize-Snapshot",  v61,  v62,  v63,  v69);
    if (a3)
    {
      __int128 v35 = 0LL;
      uint64_t v36 = 0LL;
      *a3 = error_internal_cf;
    }

    else
    {
      CFRelease(error_internal_cf);
      __int128 v35 = 0LL;
      uint64_t v36 = 0LL;
    }
  }

  else
  {
    logfunction( "",  1,  @"InstallationSize-Snapshot not present in update attributes\n",  v8,  v9,  v10,  v11,  v12,  v65);
    uint64_t v17 = (NSNumber *)[a1 objectForKey:@"ActualMinimumSystemPartition"];
    if (!v17)
    {
      logfunction( "",  1,  @"ActualMinimumSystemPartition not present in update attributes\n",  v18,  v19,  v20,  v21,  v22,  v66);
      uint64_t v17 = (NSNumber *)[a1 objectForKey:@"MinimumSystemPartition"];
      if (!v17)
      {
        logfunction( "",  1,  @"MinimumSystemPartition not present in update attributes. Using the default.\n",  v23,  v24,  v25,  v26,  v27,  v67);
        logfunction( "",  1,  @"*** Warning *** This is not a normal path *** Users shouldn't get here *** Engineers can\n",  v28,  v29,  v30,  v31,  v32,  v68);
        uint64_t v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2500LL);
      }
    }

    uint64_t v33 = calculate_snapshot_overhead(-[NSNumber longLongValue](v17, "longLongValue") << 20);
    uint64_t v34 = cryptex_size_requirement_for_update_type(0, a1);
    __int128 v35 = (char *)(v34 + v33);
    uint64_t v36 = 1LL;
    logfunction( "",  1,  @"snapshot preparation size (worst case) : %lld (%lld MB)\n",  v37,  v38,  v39,  v40,  v41,  v34 + v33);
  }

LABEL_11:
  if (a2) {
    *a2 = v35;
  }
  return v36;
}

  iBU_LOG_real( (uint64_t)@"Writing end_of_contents_bytes to firmware dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v14,  v15,  v16,  v17,  v18,  v19,  v140);
  if (-[DevNodeWriter writeData:withError:]( -[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"),  "writeData:withError:",  +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v157, 2LL),  &v155))
  {
    iBU_LOG_real( (uint64_t)@"Failed to write end-of-contents bytes to firmwareWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v24,  v25,  v26,  v27,  v28,  v29,  v141);
    if (a3)
    {
      __int128 v35 = v155;
      uint64_t v36 = @"Failed to write end-of-contents bytes to firmwareWriter.";
LABEL_21:
      uint64_t v51 = 3LL;
      goto LABEL_22;
    }

    return 0;
  }

  if (!-[DevNodeWriter finished](-[ASPStorageiBootUpdater firmwareWriter](self, "firmwareWriter"), "finished")) {
    iBU_LOG_real( (uint64_t)@"Failed to clean up firmwareWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v55,  v56,  v57,  v58,  v59,  v60,  v141);
  }
  if (sysctlbyname("debug.ASPFW", 0LL, 0LL, &v156, 4uLL)) {
    goto LABEL_27;
  }
  uint64_t v75 = -[NSArray count](-[MSUBootFirmwareUpdater bootBlockImages](self, "bootBlockImages"), "count");
  iBU_LOG_real( (uint64_t)@"Writing %lu firmware images to llb dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v76,  v77,  v78,  v79,  v80,  v81,  v75);
  char v149 = 0u;
  char v150 = 0u;
  char v147 = 0u;
  char v148 = 0u;
  uint64_t v82 = -[MSUBootFirmwareUpdater bootBlockImages](self, "bootBlockImages");
  uint64_t v83 = -[NSArray countByEnumeratingWithState:objects:count:]( v82,  "countByEnumeratingWithState:objects:count:",  &v147,  v158,  16LL);
  if (v83)
  {
    uint64_t v90 = v83;
    uint64_t v91 = 0;
    uint64_t v92 = *(void *)v148;
LABEL_31:
    uint64_t v93 = 0LL;
    while (1)
    {
      if (*(void *)v148 != v92) {
        objc_enumerationMutation(v82);
      }
      uint64_t v94 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:]( self,  "_encodeFirmware:withRestoreInfo:",  *(void *)(*((void *)&v147 + 1) + 8 * v93),  -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary"));
      if (!v94) {
        break;
      }
      uint64_t v101 = v94;
      if (-[DevNodeWriter writeData:withError:]( -[ASPStorageiBootUpdater llbWriter](self, "llbWriter"),  "writeData:withError:",  v94,  &v155))
      {
        iBU_LOG_real( (uint64_t)@"Failed to write boot block data to dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v102,  v103,  v104,  v105,  v106,  v107,  v143);
        if (a3) {
          *a3 = MSUBootFirmwareError( 3LL,  v155,  (uint64_t)@"Failed to write boot block data to dev node.",  v115,  v116,  v117,  v118,  v119,  v145);
        }

        return 0;
      }

      v91 += (unsigned __int16)[v101 length];

      if (v90 == (id)++v93)
      {
        uint64_t v90 = -[NSArray countByEnumeratingWithState:objects:count:]( v82,  "countByEnumeratingWithState:objects:count:",  &v147,  v158,  16LL);
        if (v90) {
          goto LABEL_31;
        }
        goto LABEL_40;
      }
    }

    iBU_LOG_real( (uint64_t)@"Got NULL data while wrapping boot-block IMG4 data.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v95,  v96,  v97,  v98,  v99,  v100,  v143);
    if (!a3) {
      return 0;
    }
    __int128 v35 = v155;
    uint64_t v36 = @"Got NULL data while wrapping boot-block IMG4 data.";
    goto LABEL_21;
  }

  uint64_t v91 = 0;
LABEL_40:
  iBU_LOG_real( (uint64_t)@"Writing end_of_contents_bytes to lldb dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v84,  v85,  v86,  v87,  v88,  v89,  v143);
  uint64_t v108 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v157, 2LL);
  if (-[DevNodeWriter writeData:withError:]( -[ASPStorageiBootUpdater llbWriter](self, "llbWriter"),  "writeData:withError:",  v108,  &v155))
  {
    iBU_LOG_real( (uint64_t)@"Failed to write end-of-contents bytes to llbWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v109,  v110,  v111,  v112,  v113,  v114,  v144);
    if (a3)
    {
      __int128 v35 = v155;
      uint64_t v36 = @"Failed to write end-of-contents bytes to llbWriter.";
      goto LABEL_21;
    }

    return 0;
  }

  uint64_t v120 = 4096LL - (((unsigned __int16)-[NSData length](v108, "length") + v91) & 0xFFF);
  uint64_t v121 = malloc(v120);
  bzero(v121, v120);
  iBU_LOG_real( (uint64_t)@"Writing final padding to llb dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v122,  v123,  v124,  v125,  v126,  v127,  v144);
  if (-[DevNodeWriter writeBytes:ofLength:withError:]( -[ASPStorageiBootUpdater llbWriter](self, "llbWriter"),  "writeBytes:ofLength:withError:",  v121,  v120,  &v155))
  {
    iBU_LOG_real( (uint64_t)@"Failed to write LLB to dev node.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v128,  v129,  v130,  v131,  v132,  v133,  v146);
    if (a3)
    {
      __int128 v35 = v155;
      uint64_t v36 = @"Failed to write LLB to dev node.";
      goto LABEL_21;
    }

    return 0;
  }

  if (!-[DevNodeWriter finished](-[ASPStorageiBootUpdater llbWriter](self, "llbWriter"), "finished")) {
    iBU_LOG_real( (uint64_t)@"Failed to clean up llbWriter.",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v134,  v135,  v136,  v137,  v138,  v139,  v146);
  }
  if (sysctlbyname("debug.ASPLLB", 0LL, 0LL, &v156, 4uLL))
  {
LABEL_27:
    uint64_t v61 = __error();
    strerror(*v61);
    iBU_LOG_real( (uint64_t)@"sysctlbyname('%s') failed with error: %s",  "-[ASPStorageiBootUpdater updateBootFirmwareWithError:]",  v62,  v63,  v64,  v65,  v66,  v67,  (uint64_t)"debug.ASPFW");
    if (a3)
    {
      char v68 = v155;
      char v69 = __error();
      strerror(*v69);
      uint64_t v52 = MSUBootFirmwareError( 1LL,  v68,  (uint64_t)@"sysctlbyname('%s') failed with error: %s",  v70,  v71,  v72,  v73,  v74,  (uint64_t)"debug.ASPFW");
      goto LABEL_23;
    }

    return 0;
  }

  return 1;
}

uint64_t cryptex_size_requirement_for_update_type(int a1, void *a2)
{
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v44 = 0LL;
  uint64_t v36 = __cryptex_size_requirement_for_update_type_block_invoke;
  uint64_t v37 = &unk_100061328;
  v35[1] = 3221225472LL;
  v35[0] = _NSConcreteStackBlock;
  id v38 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  uint64_t v39 = &v41;
  int v40 = a1;
  if (a2)
  {
    id v9 = [a2 objectForKeyedSubscript:@"CryptexSizeInfo"];
    if (!v9 || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v9, v10) & 1) == 0))
    {
      id v11 = [a2 objectForKeyedSubscript:@"ComboAsset"];
      if (!v11) {
        goto LABEL_31;
      }
      uint64_t v12 = MGCopyAnswer(@"BuildVersion", 0LL);
      __int128 v48 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v45 = 0u;
      id v13 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (!v13) {
        goto LABEL_31;
      }
      uint64_t v14 = *(void *)v46;
LABEL_7:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
        id v17 = [v16 objectForKeyedSubscript:@"PrerequisiteBuild"];
        if (v17)
        {
        }

        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v13) {
            goto LABEL_7;
          }
          goto LABEL_31;
        }
      }

      id v9 = [v16 objectForKeyedSubscript:@"CryptexSizeInfo"];
      if (!v9) {
        goto LABEL_31;
      }
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v9, v18) & 1) == 0) {
        goto LABEL_31;
      }
    }

    uint64_t v19 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"cryptex-system-arm64e",  @"cryptex-app",  0LL);
    if (v19)
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v9, v20) & 1) != 0)
      {
        __int128 v48 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v45 = 0u;
        id v21 = [v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v46;
          uint64_t v23 = -1LL;
          do
          {
            for (uint64_t i = 0LL; i != v21; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v46 != v22) {
                objc_enumerationMutation(v9);
              }
              uint64_t v25 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
              uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
              {
                id v27 = [v25 objectForKey:@"CryptexTag"];
                if (v27)
                {
                  if (-[NSArray containsObject:](v19, "containsObject:", v27)) {
                    v36((uint64_t)v35, (uint64_t)i + v23 + 1, (uint64_t)v27, v25);
                  }
                }
              }
            }

            id v21 = [v9 countByEnumeratingWithState:&v45 objects:v49 count:16];
            v23 += (uint64_t)i;
          }

          while (v21);
        }
      }
    }
  }

LABEL_31:
  logfunction("", 1, @"cryptex size requirement: %lld (%lld MB)\n", v4, v5, v6, v7, v8, v42[3]);
  logfunction("", 1, @"\n%s(%s):%@\n", v28, v29, v30, v31, v32, (char)"cryptex_size_requirement_for_update_type");
  uint64_t v33 = v42[3];
  _Block_object_dispose(&v41, 8);
  return v33;
}

void sub_10000DDAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t get_apfs_preallocate_min_is_allowed(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"SUDisableAPFSGetPreallocateMin"];
  if (!v1)
  {
    uint64_t v10 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is not expressly disallowed by asset attributes\n";
LABEL_8:
    uint64_t v9 = 1LL;
    logfunction("", 1, v10, v2, v3, v4, v5, v6, (char)v12);
    return v9;
  }

  uint64_t v7 = v1;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    uint64_t v12 = @"SUDisableAPFSGetPreallocateMin";
    uint64_t v10 = @"%@ property has an unexpected type\n";
    goto LABEL_8;
  }

  if (![v7 BOOLValue])
  {
    uint64_t v10 = @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is expressly allowed by asset attributes\n";
    goto LABEL_8;
  }

  logfunction( "",  1,  @"Use of APFSIOC_GET_PREALLOCATE_MIN_SPACE is disabled by asset attributes\n",  v2,  v3,  v4,  v5,  v6,  (char)v12);
  return 0LL;
}

unint64_t get_apfs_preallocate_min(unint64_t a1)
{
  uint64_t v2 = "/private/var/MobileSoftwareUpdate/.reserved";
  int v3 = open("/private/var/MobileSoftwareUpdate/.reserved", 1538, 438LL);
  if (v3 == -1)
  {
    if (*__error() != 1 && *__error() != 13
      || (uint64_t v2 = "/tmp/.reserved", v4 = open("/tmp/.reserved", 1538, 438LL), v4 == -1))
    {
      uint64_t v5 = __error();
      strerror(*v5);
      logfunction("", 1, @"open(%s) failed: (%s)\n", v6, v7, v8, v9, v10, (char)v2);
      return a1;
    }
  }

  else
  {
    int v4 = v3;
  }

  v19[0] = 0LL;
  v19[1] = a1;
  unint64_t v20 = 0LL;
  if (ffsctl(v4, 0xC0184A68uLL, v19, 0) == -1)
  {
    id v11 = __error();
    char v12 = strerror(*v11);
    logfunction("", 1, @"ffsctl() failed: (%s)\n", v13, v14, v15, v16, v17, v12);
  }

  else if (v20 > a1)
  {
    a1 = v20;
  }

  close(v4);
  unlink(v2);
  return a1;
}

uint64_t get_snapshot_apply_size(const __CFDictionary *a1, uint64_t *a2)
{
  return 1LL;
}

uint64_t get_snapshot_apply_and_reserve_sizes( const __CFDictionary *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  id v8 = +[MSULogAnnotatedSum sum](&OBJC_CLASS___MSULogAnnotatedSum, "sum");
  uint64_t v9 = 419430400LL;
  [v8 add:419430400 annotation:@"2*UPDATE_PARTITION_SIZE + UPDATE_APFS_RESERVE"];
  uint64_t valuePtr = 0LL;
  char v32 = 0;
  APFSShouldSealSystemVolume(&v32);
  if (v32)
  {
    uint64_t Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"SystemVolumeSealingOverhead");
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      logfunction("", 1, @"Sealing requires %d MiB overhead\n", v11, v12, v13, v14, v15, valuePtr);
      uint64_t v16 = valuePtr;
      valuePtr <<= 20;
      uint64_t v9 = (v16 << 20) + 419430400;
      [v8 add:valuePtr, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"update_attributes[%@]", @"SystemVolumeSealingOverhead") annotation];
    }

    else
    {
      uint64_t v9 = 419430400LL;
    }
  }

  if (get_apfs_preallocate_min_is_allowed(a1))
  {
    unint64_t v22 = v9 - 419430400;
    if (v9 - 419430400 >= 1)
    {
      logfunction("", 1, @"%llu MB reserve file will be needed (snapshot)\n", v17, v18, v19, v20, v21, v22 >> 20);
      unint64_t apfs_preallocate_min = get_apfs_preallocate_min(v9 - 419430400);
      unint64_t v24 = apfs_preallocate_min - v22;
      if (apfs_preallocate_min > v22)
      {
        logfunction( "",  1,  @"preallocating a %lld MB reserve file will require an additional %lld MB of free space\n",  v17,  v18,  v19,  v20,  v21,  v22 >> 20);
        v9 += v24;
        [v8 add:v24, +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"get_apfs_preallocate_min(%lld MB)", v22 >> 20, v24 >> 20) annotation];
        goto LABEL_11;
      }
    }
  }

  else
  {
    unint64_t v22 = 0LL;
  }

  unint64_t v24 = 0LL;
LABEL_11:
  logfunction("", 1, @"snapshot application size : %lld (%lld MB)\n", v17, v18, v19, v20, v21, v9);
  logfunction("", 1, @"\n%s():%@\n", v25, v26, v27, v28, v29, (char)"get_snapshot_apply_and_reserve_sizes");
  if (a2) {
    *a2 = v9;
  }
  if (a3) {
    *a3 = v22 & ~((uint64_t)v22 >> 63);
  }
  if (a4) {
    *a4 = v24;
  }
  return 1LL;
}

uint64_t booted_from_recoveryos()
{
  if (booted_from_recoveryos_onceToken != -1) {
    dispatch_once(&booted_from_recoveryos_onceToken, &__block_literal_global_5);
  }
  return booted_from_recoveryos_booted_from_recoveryos;
}

void __booted_from_recoveryos_block_invoke(id a1)
{
  id v1 = objc_autoreleasePoolPush();
  memset(v52, 0, sizeof(v52));
  id v50 = 0LL;
  int v9 = ramrod_probe_media((CFTypeRef *)&v50, v2, v3, v4, v5, v6, v7, v8);
  id v10 = v50;
  if (v9 == 1)
  {
    if (ramrod_get_system_partition_device_node((char *)v52, 0x20uLL) == 1)
    {
      bzero(&v51, 0x878uLL);
      if (statfs("/", &v51))
      {
        int v21 = *__error();
        logfunction("", 1, @"statfs(/) failed. errno=%d\n", v22, v23, v24, v25, v26, v21);
      }

      else
      {
        uint64_t v27 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v51.f_mntfromname);
        if (v27)
        {
          uint64_t v33 = v27;
          uint64_t v34 = +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"(.+@)?(\\/dev\\/.+$|^root_device$)",  1LL,  &v50);
          if (v50)
          {
            logfunction( "",  1,  @"could not create regular expression object with pattern %s\n",  v35,  v36,  v37,  v38,  v39,  (char)"(.+@)?(\\/dev\\/.+$|^root_device$)");
          }

          else
          {
            int v40 = -[NSRegularExpression firstMatchInString:options:range:]( v34,  "firstMatchInString:options:range:",  v33,  0LL,  0LL,  -[NSString length](v33, "length"));
            if (v40)
            {
              id v46 = -[NSTextCheckingResult rangeAtIndex:](v40, "rangeAtIndex:", 2LL);
              if (v47) {
                id v48 = v46;
              }
              else {
                id v48 = 0LL;
              }
              if (!-[NSString isEqualToString:]( -[NSString substringWithRange:](v33, "substringWithRange:", v48, v47),  "isEqualToString:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v52))) {
                booted_from_recoveryos_booted_from_recoveryos = 1;
              }
            }

            else
            {
              logfunction( "",  1,  @"f_mntfromname %@ has unrecognized pattern\n",  v41,  v42,  v43,  v44,  v45,  (char)v33);
            }
          }
        }

        else
        {
          logfunction( "",  1,  @"could not create string from f_mntfromname %s\n",  v28,  v29,  v30,  v31,  v32,  (char)v51.f_mntfromname);
        }
      }
    }

    else
    {
      logfunction("", 1, @"unable to find system volume\n", v16, v17, v18, v19, v20, v49);
    }
  }

  else
  {
    logfunction("", 1, @"Could not probe media: %@\n", v11, v12, v13, v14, v15, (char)v50);
  }

  objc_autoreleasePoolPop(v1);
}

uint64_t saveCurrentEnvInfoForNeRD(uint64_t a1)
{
  uint64_t v202 = 0LL;
  char v201 = 0;
  id v200 = 0LL;
  id v1 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  int v2 = MGGetBoolAnswer(@"InternalBuild");
  uint64_t v8 = MGCopyAnswer(@"BuildVersion", 0LL);
  if (!v8) {
    logfunction("", 1, @"Failed to get currentOSVersion\n", v3, v4, v5, v6, v7, v183);
  }
  v196 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  if (!v196) {
    logfunction("", 1, @"Failed to get currentProductVersion\n", v9, v10, v11, v12, v13, v183);
  }
  uint64_t v19 = (NSString *)MGCopyAnswer(@"ReleaseType", 0LL);
  if (!v19)
  {
    logfunction( "",  1,  @"currentOSType indicated as nil. Overriding it to be %@\n",  v14,  v15,  v16,  v17,  v18,  (char)@"BootedOSReleaseTypeUnknown");
    uint64_t v19 = -[NSString initWithString:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithString:",  @"BootedOSReleaseTypeUnknown");
  }

  v193 = -[NSLocale languageCode](+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"), "languageCode");
  if (v193)
  {
    if (!v2) {
      goto LABEL_16;
    }
  }

  else
  {
    logfunction("", 1, @"Failed to get device locale\n", v20, v21, v22, v23, v24, v183);
    if (!v2)
    {
LABEL_16:
      BOOL v191 = 0;
      goto LABEL_17;
    }
  }

  uint64_t v25 = (const __CFBoolean *)CFPreferencesCopyValue( @"SUDisableRedRingUI",  @"com.apple.nerd",  @"root",  kCFPreferencesAnyHost);
  if (!v25) {
    goto LABEL_16;
  }
  uint64_t v26 = v25;
  CFTypeID v27 = CFGetTypeID(v25);
  if (v27 != CFBooleanGetTypeID()) {
    goto LABEL_16;
  }
  int Value = CFBooleanGetValue(v26);
  BOOL v191 = Value != 0;
  uint64_t v34 = "FALSE(No effect)";
  if (Value) {
    uint64_t v34 = "TRUE";
  }
  logfunction("", 1, @"RedRingUIForceDisable is %s\n", v29, v30, v31, v32, v33, (char)v34);
LABEL_17:
  uint64_t v35 = (__CFString *)CFPreferencesCopyAppValue(@"EnableLiveAssetServerV2", @"com.apple.MobileAsset");
  v197 = v19;
  v198 = (void *)v8;
  if (!v35) {
    goto LABEL_34;
  }
  uint64_t v41 = v35;
  CFTypeID v42 = CFGetTypeID(v35);
  uint64_t v43 = v41;
  if (v42 != CFStringGetTypeID())
  {
    CFTypeID v45 = CFGetTypeID(v41);
    if (v45 == CFNumberGetTypeID())
    {
      uint64_t v43 = (__CFString *)-[__CFString stringValue](v41, "stringValue");
      CFRelease(v41);
      if (!v43) {
        goto LABEL_34;
      }
      goto LABEL_20;
    }

    CFTypeID v46 = CFGetTypeID(v41);
    if (v46 != CFBooleanGetTypeID())
    {
      CFRelease(v41);
      goto LABEL_34;
    }

    if (CFBooleanGetValue((CFBooleanRef)v41)) {
      uint64_t v43 = @"YES";
    }
    else {
      uint64_t v43 = @"NO";
    }
  }

  CFRelease(v41);
LABEL_20:
  if ((-[__CFString isEqual:](v43, "isEqual:", @"off") & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", @"false") & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", @"NO") & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", &__kCFBooleanFalse) & 1) != 0
    || (-[__CFString isEqual:](v43, "isEqual:", @"0") & 1) != 0)
  {
    char v190 = 0;
    uint64_t v44 = @"Pallas is disabled via default\n";
    goto LABEL_35;
  }

LABEL_34:
  char v190 = 1;
  uint64_t v44 = @"Pallas is enabled\n";
LABEL_35:
  logfunction("", 1, v44, v36, v37, v38, v39, v40, v183);
  uint64_t v52 = MAGetPallasAudience(@"com.apple.MobileAsset.SoftwareUpdate");
  if (!v52) {
    logfunction("", 1, @"Failed to get pallas audience\n", v47, v48, v49, v50, v51, v184);
  }
  CFPropertyListRef v53 = CFPreferencesCopyAppValue(@"MobileAssetTokenFile", @"com.apple.MobileAsset");
  uint64_t v54 = (void *)v53;
  if (v53)
  {
    CFTypeID v55 = CFGetTypeID(v53);
    if (v55 == CFStringGetTypeID())
    {
      if (!objc_msgSend(objc_msgSend(v54, "pathComponents"), "containsObject:", @".."))
      {
        uint64_t v61 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"/var/MobileSoftwareUpdate/%@",  v54);
        goto LABEL_42;
      }

      logfunction("", 1, @"Invalid value set for TokenFile default\n", v56, v57, v58, v59, v60, v184);
    }
  }

  uint64_t v61 = 0LL;
LABEL_42:
  CFPropertyListRef v62 = CFPreferencesCopyAppValue(@"MobileAssetTokenOverride", @"com.apple.MobileAsset");
  uint64_t v63 = (void *)v62;
  CFTypeRef cf = v54;
  if (v62)
  {
    CFTypeID v64 = CFGetTypeID(v62);
    if (v64 == CFStringGetTypeID())
    {
      if (!v61) {
        uint64_t v61 = -[NSString initWithString:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithString:",  @"/var/MobileSoftwareUpdate/MobileAsset/token.tok");
      }
      logfunction("", 1, @"Using %@ for token path\n", v65, v66, v67, v68, v69, (char)v61);
      uint64_t v199 = 0LL;
      else {
        logfunction("", 1, @"Failed to write token to file %@ : %@\n", v70, v71, v72, v73, v74, (char)v61);
      }
    }
  }

  uint64_t v75 = ASServerURLForAssetType(@"com.apple.MobileAsset.SoftwareUpdate", &v202);
  LOBYTE(v81) = v202;
  if (v202 || (uint64_t v82 = (void *)v75) == 0LL)
  {
    if (!v202) {
      uint64_t v81 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get update asset URL: %@\n", v76, v77, v78, v79, v80, (char)v81);
    uint64_t v82 = 0LL;
    uint64_t v202 = 0LL;
  }

  uint64_t v83 = ASServerURLForAssetType(@"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain", &v202);
  LOBYTE(v89) = v202;
  if (v202 || (uint64_t v90 = (void *)v83) == 0LL)
  {
    if (!v202) {
      uint64_t v89 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Brain asset URL: %@\n", v84, v85, v86, v87, v88, (char)v89);
    uint64_t v90 = 0LL;
    uint64_t v202 = 0LL;
  }

  uint64_t v91 = ASServerURLForAssetType(@"com.apple.MobileAsset.SoftwareUpdateDocumentation", &v202);
  LOBYTE(v97) = v202;
  if (v202 || (uint64_t v98 = (void *)v91) == 0LL)
  {
    if (!v202) {
      __int128 v97 = @"Unknown error";
    }
    logfunction("", 1, @"Failed to get Documentation asset URL: %@\n", v92, v93, v94, v95, v96, (char)v97);
    uint64_t v98 = 0LL;
    uint64_t v202 = 0LL;
  }

  v189 = v1;
  uint64_t v99 = ASServerURLForAssetType(@"com.apple.MobileAsset.WatchSoftwareUpdateDocumentation", &v202);
  LOBYTE(v105) = v202;
  if (v202 || (uint64_t v106 = (void *)v99) == 0LL)
  {
    if (!v202) {
      uint64_t v105 = @"Unknown error";
    }
    logfunction( "",  1,  @"Failed to get Watch Documentation asset URL: %@\n",  v100,  v101,  v102,  v103,  v104,  (char)v105);
    uint64_t v106 = 0LL;
    uint64_t v202 = 0LL;
  }

  [v82 absoluteString];
  [v90 absoluteString];
  [v98 absoluteString];
  [v106 absoluteString];
  logfunction( "",  1,  @"SU configuration:\n Asset Audience : %@\n SU Asset URL: %@\n Brain URL: %@\n Documentation URL: %@\n WatchDocumentation URL: %@\n",  v107,  v108,  v109,  v110,  v111,  v52);
  uint64_t v112 = (const __CFBoolean *)CFPreferencesCopyAppValue( @"RetainOriginalBootedOSState",  @"com.apple.MobileSoftwareUpdate");
  uint64_t v113 = v112;
  if (v112
    && (CFTypeID v114 = CFGetTypeID(v112), v114 == CFBooleanGetTypeID())
    && CFBooleanGetValue(v113)
    && (logfunction( "",  1,  @"default set for retaining original bootedOSState plist, will not remove unchanged properties\n",  v115,  v116,  v117,  v118,  v119,  (char)v185),  v185 = "/private/var/MobileSoftwareUpdate/",  (uint64_t v120 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s/%s/%s"))) != 0LL))
  {
    v192 = v120;
    __int128 v126 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v120);
  }

  else
  {
    __int128 v126 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v192 = 0LL;
  }

  if (v191) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", @"YES", @"RedRingDisabled");
  }
  if (v198) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v198, @"BootedOSVersion");
  }
  if (v197) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v197, @"BootedOSType");
  }
  if (v193) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v193, @"BootedOSLanguage");
  }
  if (v82) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v82 absoluteString],  @"BootedOSSUAssetURL");
  }
  if (v98) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v98 absoluteString],  @"BootedOSDocumentationURL");
  }
  if (v106) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v106 absoluteString],  @"BootedOSWatchDocumentationURL");
  }
  if (v90) {
    -[NSMutableDictionary setValue:forKey:]( v126,  "setValue:forKey:",  [v90 absoluteString],  @"BootedOSBrainURL");
  }
  if (v52) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v52, @"BootedOSAssetAudience");
  }
  if (v196) {
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v196, @"BootedOSProductVersion");
  }
  if ((v190 & 1) == 0)
  {
    logfunction( "",  1,  @"Updating BootedOSState to indicate pallas is disabled\n",  v121,  v122,  v123,  v124,  v125,  (char)v185);
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", @"YES", @"BootedOSHasPallasDisabled");
  }

  if (v61)
  {
    logfunction("", 1, @"Updating BootedOSState with token path\n", v121, v122, v123, v124, v125, (char)v185);
    -[NSMutableDictionary setValue:forKey:](v126, "setValue:forKey:", v61, @"BootedOSDawTokenPath");
  }

  if (a1) {
    -[NSMutableDictionary addEntriesFromDictionary:](v126, "addEntriesFromDictionary:");
  }
  logfunction("", 1, @"Dictionary is %@\n", v121, v122, v123, v124, v125, (char)v126);
  v186 = "/private/var/MobileSoftwareUpdate/";
  uint64_t v132 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s/%s");
  if (!v132)
  {
    __int128 v162 = @"Failed to allocate path string to save Booted OS state\n";
LABEL_113:
    logfunction("", 1, v162, v127, v128, v129, v130, v131, (char)v186);
    uint64_t v143 = 0LL;
    goto LABEL_123;
  }

  if (!-[NSFileManager fileExistsAtPath:isDirectory:](v189, "fileExistsAtPath:isDirectory:", v132, &v201))
  {
    logfunction( "",  1,  @"Creating directory(%@) to save current OS state\n",  v133,  v134,  v135,  v136,  v137,  (char)v132);
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v189,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v132,  1LL,  0LL,  &v200))
    {
      LOBYTE(v186) = (_BYTE)v200;
      __int128 v162 = @"Failed to create directory : %@\n";
      goto LABEL_113;
    }
  }

  LOBYTE(v187) = (_BYTE)v132;
  uint64_t v143 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@/%s");
  if (!v143)
  {
    __int128 v163 = @"Failed to allocate string to save the path for the state file\n";
LABEL_122:
    logfunction("", 1, v163, v138, v139, v140, v141, v142, (char)v187);
    goto LABEL_123;
  }

  logfunction("", 1, @"Saving env data to %@\n", v138, v139, v140, v141, v142, (char)v143);
  if ((-[NSMutableDictionary writeToFile:atomically:](v126, "writeToFile:atomically:", v143, 1LL) & 1) == 0)
  {
    __int128 v163 = @"Failed to write env data to file\n";
    goto LABEL_122;
  }

  logfunction("", 1, @"Updating file permissions\n", v138, v139, v140, v141, v142, (char)v187);
  uint64_t v144 = -[NSString UTF8String](v143, "UTF8String");
  if (!v144)
  {
    logfunction( "",  1,  @"%s: Failed to get c string representation of the bootedOSStateFile path to fixup permissions..Deleting the file\n",  v145,  v146,  v147,  v148,  v149,  (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }

  char v150 = v144;
  if (chmod(v144, 0x1F8u))
  {
    __error();
    char v151 = __error();
    strerror(*v151);
    logfunction( "",  1,  @"%s: Failed to chmod bootedOsStateFile at %@ errno=%d: (%s)..Deleting the file\n",  v152,  v153,  v154,  v155,  v156,  (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }

  __int128 v164 = getpwnam("mobile");
  if (!v164)
  {
    logfunction( "",  1,  @"%s: Failed to get uid/gid for mobile user to chown the bootedOSState file..Deleting the file at %@\n",  v165,  v166,  v167,  v168,  v169,  (char)"fixup_permissions_for_bootedos_state_file");
LABEL_120:
    logfunction( "",  1,  @"Failed to set permissions on BootedOSState file..Deleting it\n",  v157,  v158,  v159,  v160,  v161,  v188);
    uint64_t v199 = 0LL;
    -[NSFileManager removeItemAtPath:error:](v189, "removeItemAtPath:error:", v143, &v199);
    if (v199)
    {
      v187 = "saveCurrentEnvInfoForNeRD";
      __int128 v163 = @"%s: Failed to delete BootedOsState file at %@. Error: %@\n";
      goto LABEL_122;
    }

LABEL_123:
    uint64_t v181 = 0LL;
    goto LABEL_124;
  }

  if (chown(v150, v164->pw_uid, v164->pw_gid))
  {
    __error();
    v175 = __error();
    strerror(*v175);
    logfunction( "",  1,  @"%s: Failed to chown bootedOSStateFile at %@ errno=%d: (%s)..Deleting the file\n",  v176,  v177,  v178,  v179,  v180,  (char)"fixup_permissions_for_bootedos_state_file");
    goto LABEL_120;
  }

  uint64_t v181 = 1LL;
  logfunction( "",  1,  @"%s: Successfully fixed up permissions for %@\n",  v170,  v171,  v172,  v173,  v174,  (char)"fixup_permissions_for_bootedos_state_file");
LABEL_124:

  if (v63) {
    CFRelease(v63);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v181;
}

      if (v92)
      {
        asprintf(v131, "%s:%s %s", v80, v88, v92);
        goto LABEL_126;
      }

uint64_t msu_running_in_limited_environment( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (&_os_variant_uses_ephemeral_storage)
  {
    uint64_t v8 = os_variant_uses_ephemeral_storage("com.apple.MobileSoftwareUpdate");
    if ((_DWORD)v8) {
      uint64_t v9 = @"MSU running in limited env\n";
    }
    else {
      uint64_t v9 = @"MSU running in normal env\n";
    }
  }

  else
  {
    uint64_t v8 = 1LL;
    uint64_t v9 = @"MSU running in normal env(default)\n";
  }

  logfunction("", 1, v9, a4, a5, a6, a7, a8, v11);
  return v8;
}

uint64_t msu_should_save_env_info_for_recovery()
{
  return 1LL;
}

id __cryptex_size_requirement_for_update_type_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"update_attributes[%@][%lu(%@)]",  @"CryptexSizeInfo",  a2,  a3);
  id v7 = [a4 objectForKeyedSubscript:@"CryptexSize"];
  id v8 = [v7 unsignedLongLongValue];
  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += ((void)v8 << 20) / 5uLL + ((void)v8 << 20);
    [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSize"];
  }

  id v9 = [a4 objectForKeyedSubscript:@"ReversePatchSize"];
  id v10 = [v9 unsignedLongLongValue];
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += (void)v10 << 20;
    [*(id *)(a1 + 32) add:(void)v10 << 20, @"%@[%@]", v6, @"ReversePatchSize" annotationFormat];
  }

  id v11 = [a4 objectForKeyedSubscript:@"CryptexSizeDelta"];
  id result = [v11 unsignedLongLongValue];
  if (v11)
  {
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += (void)result << 20;
      return [*(id *)(a1 + 32) add:v6 annotationFormat:@"CryptexSizeDelta"];
    }
  }

  return result;
}

void MSUCleanupPreboot( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v9 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v10 = (const __CFData *)MGCopyAnswer(@"Qq9/Mya05P4ToEr1pMpGGg", 0LL);
  if (!v10)
  {
    CFTypeID v27 = @"Unable to query boot manifest hash\n";
LABEL_8:
    logfunction("", 1, v27, v11, v12, v13, v14, v15, a9);
    return;
  }

  uint64_t v16 = v10;
  CFTypeID v17 = CFGetTypeID(v10);
  if (v17 != CFDataGetTypeID())
  {
    CFTypeID v27 = @"Boot manifest hash is not CFData\n";
    goto LABEL_8;
  }

  uint64_t v18 = +[NSMutableString stringWithCapacity:]( &OBJC_CLASS___NSMutableString,  "stringWithCapacity:",  2 * CFDataGetLength(v16));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = __MSUCleanupPreboot_block_invoke;
  v49[3] = &unk_100061350;
  v49[4] = v18;
  -[__CFData enumerateByteRangesUsingBlock:](v16, "enumerateByteRangesUsingBlock:", v49);
  id v19 = [@"/private/preboot" stringByAppendingPathComponent:v18];
  uint64_t v20 = -[NSFileManager attributesOfItemAtPath:error:](v9, "attributesOfItemAtPath:error:", v19, 0LL);
  if (v20)
  {
    if (-[NSDictionary fileType](v20, "fileType") == NSFileTypeSymbolicLink)
    {
      uint64_t v26 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:]( v9,  "destinationOfSymbolicLinkAtPath:error:",  v19,  0LL);
      if (v26) {
        logfunction("", 1, @"Current manifest hash is a link to %@\n", v28, v29, v30, v31, v32, (char)v26);
      }
    }

    else
    {
      uint64_t v26 = 0LL;
    }

    uint64_t v33 = -[NSFileManager contentsOfDirectoryAtPath:error:]( v9,  "contentsOfDirectoryAtPath:error:",  @"/private/preboot",  0LL);
    bzero(&v50, 0x878uLL);
    if (statfs((const char *)[@"/private/preboot" fileSystemRepresentation], &v50))
    {
      int v34 = *__error();
      uint64_t v35 = __error();
      strerror(*v35);
      logfunction("", 1, @"Error %d (%s) statfs-ing %@\n", v36, v37, v38, v39, v40, v34);
    }

    else if ((v50.f_flags & 0x4001) == 1)
    {
      CFTypeRef cf = 0LL;
      if (ramrod_change_filesystem_permissions_opt_err( v50.f_mntfromname,  v50.f_mntonname,  0,  (CFErrorRef *)&cf)) {
        logfunction( "",  1,  @"Failed to upgrade preboot mount to read/write with error:%@\n",  v41,  v42,  v43,  v44,  v45,  (char)cf);
      }
      else {
        logfunction("", 1, @"Successfully upgraded preboot mount to read/write\n", v41, v42, v43, v44, v45, v46);
      }
      if (cf) {
        CFRelease(cf);
      }
    }

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = __MSUCleanupPreboot_block_invoke_2;
    v47[3] = &unk_100061378;
    v47[4] = @"/private/preboot";
    v47[5] = v9;
    v47[6] = v18;
    v47[7] = v26;
    -[NSArray enumerateObjectsUsingBlock:](v33, "enumerateObjectsUsingBlock:", v47);
  }

  else
  {
    logfunction("", 1, @"No preboot path found, skipping cleanup\n", v21, v22, v23, v24, v25, v46);
  }

  CFRelease(v16);
}

id *__MSUCleanupPreboot_block_invoke(id *result, uint64_t a2, uint64_t a3, int a4, _BYTE *a5)
{
  int v6 = a4;
  if (a4)
  {
    id v7 = result;
    id v8 = (unsigned __int8 *)(a2 + a3);
    do
    {
      unsigned int v9 = *v8++;
      id result = (id *)objc_msgSend(v7[4], "appendFormat:", @"%02X", v9);
      --v6;
    }

    while (v6);
  }

  *a5 = 0;
  return result;
}

int *__MSUCleanupPreboot_block_invoke_2(id *a1, void *a2)
{
  id v4 = [a1[4] stringByAppendingPathComponent:a2];
  id v5 = [a1[5] attributesOfItemAtPath:v4 error:0];
  if (v5
    && [v5 fileType] == NSFileTypeSymbolicLink
    && (id v14 = [a1[5] destinationOfSymbolicLinkAtPath:v4 error:0]) != 0
    && [v14 isEqualToString:a1[6]])
  {
    logfunction("", 1, @"Manifest hash %@ is linked to %@\n", v15, v16, v17, v18, v19, (char)a2);
    int v6 = a2;
  }

  else
  {
    int v6 = 0LL;
  }

  id result = (int *)[a1[6] isEqualToString:a2];
  if ((result & 1) == 0)
  {
    id result = (int *)[v6 isEqualToString:a2];
    if ((result & 1) == 0)
    {
      id result = (int *)[a1[7] isEqualToString:a2];
      if ((result & 1) == 0)
      {
        id result = (int *)[@"active" isEqualToString:a2];
        if ((result & 1) == 0)
        {
          id result = (int *)[@"cryptex1" isEqualToString:a2];
          if ((result & 1) == 0)
          {
            id result = (int *)[@"downlevel" isEqualToString:a2];
            if ((result & 1) == 0)
            {
              id result = (int *)[@"Cryptexes" isEqualToString:a2];
              if ((result & 1) == 0)
              {
                id result = (int *)[@".DarwinDepot" isEqualToString:a2];
                if ((result & 1) == 0)
                {
                  id result = (int *)[@".roots-installed" isEqualToString:a2];
                  if ((result & 1) == 0)
                  {
                    if (objc_msgSend( a1[5],  "removeItemAtPath:error:",  objc_msgSend(a1[4], "stringByAppendingPathComponent:", a2),  0)) {
                      uint64_t v13 = @"Removed preboot path %@\n";
                    }
                    else {
                      uint64_t v13 = @"Failed to remove preboot path %@\n";
                    }
                    return logfunction("", 1, v13, v8, v9, v10, v11, v12, (char)a2);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t MSUCleanupPreparePath_server( int a1, int a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    int v10 = DeleteUpgradeBootCommand();
    buffer[0] = 0;
    msu_delete_nvram_variable_if_exists(@"update-volume", buffer);
    int v11 = buffer[0] | v10;
    msu_delete_nvram_variable_if_exists(@"target-uuid", buffer);
    logfunction("", 1, @"Purging any suspended/pended update...\n", v14, v15, v16, v17, v18, v246);
    unlink("/private/var/MobileSoftwareUpdate/Update.plist");
    unlink("/private/var/MobileSoftwareUpdate/Preflight.plist");
    unlink("/private/var/MobileSoftwareUpdate/brain_path.plist");
    uint64_t v19 = clear_apply_state();
    MSUCleanupPreboot((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26, v247);
  }

  if (a2) {
    -[MSUFreeSpaceManager resetAPFSFreeBlocksThreshold:]( +[MSUFreeSpaceManager sharedInstance](&OBJC_CLASS___MSUFreeSpaceManager, "sharedInstance"),  "resetAPFSFreeBlocksThreshold:",  0LL);
  }
  else {
    logfunction("", 1, @"Not resetting APFS free blocks threshold\n", a4, a5, a6, a7, a8, v246);
  }
  bzero(buffer, 0x400uLL);
  char v27 = 1;
  logfunction("", 1, @"Cleaning up unused prepared updates\n", v28, v29, v30, v31, v32, v246);
  init_update_partition_with_reserve_and_reformat( 0LL,  "/private/var/MobileSoftwareUpdate/",  0LL,  v33,  v34,  v35,  v36,  v37);
  dict = (void *)load_dict("/private/var/MobileSoftwareUpdate/Update.plist");
  uint64_t v39 = (const __CFDictionary *)load_dict("/private/var/MobileSoftwareUpdate/Preflight.plist");
  uint64_t v40 = v39;
  if (!v39) {
    goto LABEL_22;
  }
  if (!dict
    || (id v41 = -[__CFDictionary objectForKeyedSubscript:]( v39,  "objectForKeyedSubscript:",  @"update-asset-attributes"),  v42 = [dict objectForKeyedSubscript:@"update-asset-attributes"],  v43 = objc_opt_class(NSDictionary),  (objc_opt_isKindOfClass(v41, v43) & 1) == 0)
    || (uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v42, v44) & 1) == 0)
    || (id v45 = [v41 objectForKeyedSubscript:@"UpdateUUID"],
        id v46 = [v42 objectForKeyedSubscript:@"UpdateUUID"],
        !v45)
    || !v46
    || ![v45 isEqual:v46])
  {
    int Value = (const __CFString *)CFDictionaryGetValue(v40, @"suspended-update-path");
    if (!Value || (CFPropertyListRef v53 = Value, v54 = CFGetTypeID(Value), v54 != CFStringGetTypeID()))
    {
      char v27 = 0;
      goto LABEL_22;
    }

    memset(&v264, 0, sizeof(v264));
    CFStringGetCString(v53, buffer, 1024LL, 0x8000100u);
    CFTypeID v55 = realpath_DARWIN_EXTSN(buffer, 0LL);
    if (v55)
    {
      uint64_t v56 = v55;
      if (stat(v55, &v264))
      {
        free(v56);
LABEL_113:
        uint64_t v56 = 0LL;
        int v62 = 0;
        goto LABEL_114;
      }

      int v62 = 1;
      logfunction("", 1, @"Preflighted update at %s\n", v57, v58, v59, v60, v61, (char)v56);
    }

    else
    {
      if (*__error() == 2)
      {
        logfunction( "",  1,  @"Preflighted update at %s has already been cleaned up\n",  v75,  v76,  v77,  v78,  v79,  (char)buffer);
        goto LABEL_113;
      }

      CFIndex v154 = *__error();
      uint64_t v155 = __error();
      strerror(*v155);
      error_internal_CFTypeRef cf = _create_error_internal_cf( kCFErrorDomainPOSIX,  v154,  0LL,  0LL,  @"Could not realpath(3) path %s: %s",  v156,  v157,  v158,  (char)buffer);
      if (!a3)
      {
        CFRelease(error_internal_cf);
        goto LABEL_113;
      }

      uint64_t v56 = 0LL;
      int v62 = 0;
      *a3 = error_internal_cf;
    }

LABEL_114:
    char v27 = 0;
    goto LABEL_23;
  }

  logfunction( "",  1,  @"Ignoring preflighted update, it appears to be the same as the suspended/pending update\n",  v47,  v48,  v49,  v50,  v51,  v248);
  CFRelease(v40);
  uint64_t v40 = 0LL;
LABEL_22:
  uint64_t v56 = 0LL;
  int v62 = 0;
LABEL_23:
  uint64_t v63 = 0LL;
  int v64 = 0;
  if (v56 || !dict) {
    goto LABEL_40;
  }
  uint64_t v65 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)dict, @"update-path");
  if ((!v65 || (uint64_t v66 = v65, v67 = CFGetTypeID(v65), v67 != CFStringGetTypeID()))
    && (uint64_t v66 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)dict, @"suspended-update-path")) == 0LL
    || (CFTypeID v68 = CFGetTypeID(v66), v68 != CFStringGetTypeID()))
  {
    int v64 = 0;
    uint64_t v63 = 0LL;
    uint64_t v56 = 0LL;
    goto LABEL_40;
  }

  memset(&v264, 0, sizeof(v264));
  CFStringGetCString(v66, buffer, 1024LL, 0x8000100u);
  uint64_t v69 = realpath_DARWIN_EXTSN(buffer, 0LL);
  uint64_t v56 = v69;
  if (!v69)
  {
    if (*__error() != 2)
    {
      CFIndex v160 = *__error();
      uint64_t v161 = __error();
      strerror(*v161);
      CFErrorRef v165 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v160,  0LL,  0LL,  @"Could not realpath(3) path %s: %s",  v162,  v163,  v164,  (char)buffer);
      if (a3) {
        *a3 = v165;
      }
      else {
        CFRelease(v165);
      }
      uint64_t v108 = 0LL;
      if ((v27 & 1) != 0) {
        goto LABEL_70;
      }
      goto LABEL_69;
    }

    logfunction("", 1, @"Update at %s has already been cleaned up\n", v80, v81, v82, v83, v84, (char)buffer);
    goto LABEL_38;
  }

  if (stat(v69, &v264))
  {
LABEL_38:
    int v64 = 0;
    goto LABEL_39;
  }

  if (CFDictionaryContainsKey((CFDictionaryRef)dict, @"suspended-update-path"))
  {
    int v64 = 1;
    logfunction("", 1, @"Suspended update at %s\n", v70, v71, v72, v73, v74, (char)v56);
LABEL_39:
    uint64_t v63 = 0LL;
    goto LABEL_40;
  }

  uint64_t v63 = (const __CFString *)copy_nvram_variable(@"boot-command");
  logfunction("", 1, @"boot-command: '%@'\n", v172, v173, v174, v175, v176, (char)v63);
  if (v63
    && (CFTypeID v177 = CFGetTypeID(v63), v177 == CFStringGetTypeID())
    && CFStringCompare(v63, @"upgrade", 0LL) == kCFCompareEqualTo)
  {
    int v64 = 1;
    logfunction("", 1, @"Pending update at %s\n", v178, v179, v180, v181, v182, (char)v56);
  }

  else
  {
    int v64 = 0;
  }

LABEL_40:
  uint64_t v85 = realpath_DARWIN_EXTSN("/private/var/MobileSoftwareUpdate/", 0LL);
  v256 = v85;
  if (v85)
  {
    v265[0] = v85;
    v265[1] = 0LL;
    char v86 = (char)v85;
    uint64_t v87 = fts_open(v265, 21, 0LL);
    if (v87)
    {
      uint64_t v88 = v87;
      CFTypeRef cf = v63;
      char v255 = v27;
      uint64_t v89 = fts_read(v87);
      int v90 = v62 | v64;
      v252 = v40;
      v253 = dict;
      if (v89)
      {
        uint64_t v91 = v89;
        uint64_t v92 = "";
        do
        {
          if (v91->fts_info == 1 && v91->fts_level >= 1)
          {
            if (!strncmp(v91->fts_name, "softwareupdate", 0xEuLL))
            {
              fts_path = v91->fts_path;
              if (!v90 || strcmp(v91->fts_path, v56))
              {
                logfunction(v92, 1, @"Removing update at %s\n", v93, v94, v95, v96, v97, (char)fts_path);
                if (removefile(v91->fts_path, 0LL, 1u))
                {
                  uint64_t v99 = v92;
                  CFIndex v100 = *__error();
                  uint64_t v101 = a3;
                  uint64_t v102 = v91->fts_path;
                  uint64_t v103 = __error();
                  char v249 = (char)v102;
                  strerror(*v103);
                  a3 = v101;
                  CFErrorRef v107 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v100,  0LL,  0LL,  @"Could not removefile(3) path %s: %s",  v104,  v105,  v106,  v249);
                  if (v101) {
                    CFErrorRef *v101 = v107;
                  }
                  else {
                    CFRelease(v107);
                  }
                  uint64_t v92 = v99;
                }
              }
            }

            fts_set(v88, v91, 4);
          }

          uint64_t v91 = fts_read(v88);
        }

        while (v91);
        fts_close(v88);
        uint64_t v40 = v252;
        dict = v253;
        if ((v90 & 1) != 0)
        {
LABEL_57:
          uint64_t v108 = 1LL;
          char v27 = v255;
          uint64_t v63 = cf;
          if (!v56) {
            goto LABEL_64;
          }
          goto LABEL_63;
        }
      }

      else
      {
        fts_close(v88);
        if ((v90 & 1) != 0) {
          goto LABEL_57;
        }
      }

      int v121 = DeleteUpgradeBootCommand();
      unsigned __int8 v258 = 0;
      msu_delete_nvram_variable_if_exists(@"target-uuid", &v258);
      char v27 = v255;
      if (v258 | v121) {
        msu_sync_nvram(1, v122, v123, v124, v125, v126, v127, v128);
      }
      if (!unlink("/private/var/MobileSoftwareUpdate/Update.plist")) {
        logfunction( "",  1,  @"Deleted Preflight.plist because no preflighted update was found\n",  v129,  v130,  v131,  v132,  v133,  v248);
      }
      if (!unlink("/private/var/MobileSoftwareUpdate/Preflight.plist")) {
        logfunction( "",  1,  @"Deleted Update.plist because no suspended (or pending) update was found\n",  v136,  v137,  v138,  v139,  v140,  v248);
      }
      uint64_t v63 = cf;
      if (!mount_update_partition_if_exists( "/private/var/MobileSoftwareUpdate/",  v134,  v135,  v136,  v137,  v138,  v139,  v140))
      {
        v265[0] = "/private/var/MobileSoftwareUpdate/";
        uint64_t v141 = fts_open(v265, 21, 0LL);
        if (v141)
        {
          uint64_t v142 = v141;
          uint64_t v143 = fts_read(v141);
          if (v143)
          {
            uint64_t v144 = v143;
            do
            {
              int fts_info = v144->fts_info;
              if (fts_info != 8)
              {
                if (fts_info == 1 && v144->fts_level >= 1) {
                  fts_set(v142, v144, 4);
                }
                goto LABEL_91;
              }

              if (!strncmp("patchd-", v144->fts_name, 7uLL))
              {
                __endptr[0] = 0LL;
                unint64_t v146 = strtoull(&v144->fts_name[7], __endptr, 10);
                int v147 = (int)__endptr[0];
                if (__endptr[0])
                {
                  uint64_t v148 = v146;
                  if (!strcmp(__endptr[0], ".log"))
                  {
                    bzero(&v264, 0x400uLL);
                    snprintf( (char *)&v264,  0x400uLL,  "%s%.*s",  ".patchd-saved-",  v147 - ((_DWORD)v144 + 111),  &v144->fts_name[7]);
                    if (!access((const char *)&v264, 0))
                    {
                      logfunction( "",  1,  @"Not saving log file %s\n",  v149,  v150,  v151,  v152,  v153,  (char)v144->fts_path);
LABEL_99:
                      unlink(v144->fts_path);
                      goto LABEL_91;
                    }

                    logfunction( "",  1,  @"Saving log file %s\n",  v149,  v150,  v151,  v152,  v153,  (char)v144->fts_path);
                  }
                }
              }

LABEL_91:
              uint64_t v144 = fts_read(v142);
            }

            while (v144);
          }

          fts_close(v142);
          char v27 = v255;
          uint64_t v63 = cf;
        }

        else
        {
          CFIndex v166 = *__error();
          uint64_t v167 = __error();
          strerror(*v167);
          CFErrorRef v171 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v166,  0LL,  0LL,  @"Could not fts_open(3) path %s: %s",  v168,  v169,  v170,  (char)"/private/var/MobileSoftwareUpdate/");
          if (a3) {
            *a3 = v171;
          }
          else {
            CFRelease(v171);
          }
        }
      }

      v250 = v56;
      v251 = a3;
      id v183 = [@"/private/var/MobileSoftwareUpdate/" stringByAppendingPathComponent:@"/mobile/Library/Logs/CrashReporter"];
      id v184 = [@"/private/var" stringByAppendingPathComponent:@"/mobile/Library/Logs/CrashReporter"];
      v185 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      if (os_variant_is_recovery(0LL))
      {
        logfunction( "",  1,  @"%s: Not preserving crash reporter logs on recoveryOS\n",  v186,  v187,  v188,  v189,  v190,  (char)"_migrate_ramdisk_logs");
      }

      else if (-[NSFileManager fileExistsAtPath:](v185, "fileExistsAtPath:", v183))
      {
        id v263 = 0LL;
        v196 = -[NSFileManager contentsOfDirectoryAtPath:error:](v185, "contentsOfDirectoryAtPath:error:", v183, &v263);
        obj = v196;
        if (!v196 || v263)
        {
          objc_msgSend(objc_msgSend(v263, "description"), "UTF8String");
          logfunction( "",  1,  @"%s: Failed to get list of crash logs: %s\n",  v214,  v215,  v216,  v217,  v218,  (char)"_migrate_ramdisk_logs");
        }

        else
        {
          __int128 v261 = 0u;
          __int128 v262 = 0u;
          *(_OWORD *)__endptr = 0u;
          __int128 v260 = 0u;
          id v197 = -[NSArray countByEnumeratingWithState:objects:count:]( v196,  "countByEnumeratingWithState:objects:count:",  __endptr,  &v264,  16LL);
          if (v197)
          {
            id v198 = v197;
            uint64_t v199 = *(void *)v260;
            do
            {
              for (uint64_t i = 0LL; i != v198; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v260 != v199) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v201 = *(void *)&__endptr[1][8 * (void)i];
                id v202 = [v183 stringByAppendingPathComponent:v201];
                id v203 = [v184 stringByAppendingPathComponent:v201];
                if (-[NSFileManager fileExistsAtPath:](v185, "fileExistsAtPath:", v203))
                {
                  -[NSFileManager removeItemAtPath:error:](v185, "removeItemAtPath:error:", v203, &v263);
                  if (v263)
                  {
                    objc_msgSend(objc_msgSend(v263, "description"), "UTF8String");
                    logfunction( "",  1,  @"%s: Failed to remove old log before overwriting: %s\n",  v204,  v205,  v206,  v207,  v208,  (char)"_migrate_ramdisk_logs");
                    id v263 = 0LL;
                  }
                }

                -[NSFileManager moveItemAtPath:toPath:error:](v185, "moveItemAtPath:toPath:error:", v202, v203, &v263);
                if (v263)
                {
                  [v202 fileSystemRepresentation];
                  objc_msgSend(objc_msgSend(v263, "description"), "UTF8String");
                  logfunction( "",  1,  @"%s: Failed to move CrashReporter log %s: %s\n",  v209,  v210,  v211,  v212,  v213,  (char)"_migrate_ramdisk_logs");
                  id v263 = 0LL;
                }
              }

              id v198 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __endptr,  &v264,  16LL);
            }

            while (v198);
          }
        }

        char v27 = v255;
        uint64_t v63 = cf;
      }

      else
      {
        logfunction( "",  1,  @"%s: No ramdisk created CrashReporter dir found\n",  v191,  v192,  v193,  v194,  v195,  (char)"_migrate_ramdisk_logs");
      }

      cleanup_boot_environment("/private/var/MobileSoftwareUpdate/");
      uint64_t v40 = v252;
      dict = v253;
      uint64_t v56 = v250;
      if (removefile("/private/var/mobile/MobileSoftwareUpdate/UpdateDownloads", 0LL, 1u) && *__error() != 2)
      {
        CFIndex v219 = *__error();
        v220 = __error();
        strerror(*v220);
        CFErrorRef v224 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v219,  0LL,  0LL,  @"Could not removefile(3) downloaded updates at %s: %s",  v221,  v222,  v223,  (char)"/private/var/mobile/MobileSoftwareUpdate/UpdateDownloads");
        if (!v251)
        {
          CFRelease(v224);
          char v231 = MSUDemotionCleanup(0LL);
          LOBYTE(v230) = 0;
          if ((v231 & 1) != 0) {
            goto LABEL_150;
          }
          goto LABEL_149;
        }

        CFErrorRef *v251 = v224;
      }

      if ((MSUDemotionCleanup(v251) & 1) != 0) {
        goto LABEL_150;
      }
      if (v251) {
        CFErrorRef v230 = *v251;
      }
      else {
        LOBYTE(v230) = 0;
      }
LABEL_149:
      logfunction("", 1, @"Warning: app demotion cleanup failed: %@\n", v225, v226, v227, v228, v229, (char)v230);
LABEL_150:
      v232 = copy_rooted_snapshot_name();
      if (v232)
      {
        v239 = v232;
        if (!mount_apfs_system_readwrite_with_revert( "/private/var/MobileSoftwareUpdate/mnt1",  v232,  v233,  v234,  v235,  v236,  v237,  v238))
        {
          v240 = copy_root_snapshot_name_from_dt();
          *(void *)&v264.st_dev = _NSConcreteStackBlock;
          v264.st_ino = 3221225472LL;
          *(void *)&v264.st_uid = __MSUCleanupPreparePath_block_invoke;
          *(void *)&v264.st_rdev = &__block_descriptor_40_e12_B20__0i8r_12l;
          v264.st_atimespec.tv_sec = (__darwin_time_t)v240;
          enumerate_apfs_snapshots("/private/var/MobileSoftwareUpdate/mnt1", (uint64_t)&v264);
          if (v240) {
            free(v240);
          }
          if (unmount("/private/var/MobileSoftwareUpdate/mnt1", 0))
          {
            v241 = __error();
            CFErrorRef v245 = _create_error_internal_cf( kCFErrorDomainPOSIX,  *v241,  0LL,  0LL,  @"Could not unmount live system volume",  v242,  v243,  v244,  v248);
            if (v251) {
              CFErrorRef *v251 = v245;
            }
            else {
              CFRelease(v245);
            }
          }
        }

        free(v239);
      }

      uint64_t v108 = 1LL;
      if (v250) {
        goto LABEL_63;
      }
      goto LABEL_64;
    }

    CFIndex v115 = *__error();
    uint64_t v116 = __error();
    strerror(*v116);
    CFErrorRef v114 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v115,  0LL,  0LL,  @"Could not fts_open(3) path %s: %s",  v117,  v118,  v119,  v86);
  }

  else
  {
    CFIndex v109 = *__error();
    uint64_t v110 = __error();
    strerror(*v110);
    CFErrorRef v114 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v109,  0LL,  0LL,  @"Could not realpath(3) path %s: %s",  v111,  v112,  v113,  (char)"/private/var/MobileSoftwareUpdate/");
  }

  if (a3)
  {
    uint64_t v108 = 0LL;
    *a3 = v114;
    if (!v56) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }

  CFRelease(v114);
  uint64_t v108 = 0LL;
  if (v56) {
LABEL_63:
  }
    free(v56);
LABEL_64:
  if (v256) {
    free(v256);
  }
  if (v63) {
    CFRelease(v63);
  }
  if ((v27 & 1) == 0) {
LABEL_69:
  }
    CFRelease(v40);
LABEL_70:
  if (dict) {
    CFRelease(dict);
  }
  return v108;
}

uint64_t MSUCleanupLogs_server(time_t a1, CFNumberRef *a2, CFErrorRef *a3)
{
  if (a1 < 0)
  {
    strerror(22);
    error_internal_CFTypeRef cf = _create_error_internal_cf( kCFErrorDomainPOSIX,  22LL,  0LL,  0LL,  @"retention value is negative: %lld (%s)",  v39,  v40,  v41,  a1);
  }

  else
  {
    v61[0] = "/private/var/MobileSoftwareUpdate/";
    v61[1] = 0LL;
    int v6 = fts_open(v61, 21, 0LL);
    if (v6)
    {
      id v7 = v6;
      time_t v8 = time(0LL);
      uint64_t v9 = fts_read(v7);
      if (!v9)
      {
        uint64_t v43 = 1LL;
        goto LABEL_40;
      }

      int v10 = v9;
      time_t v58 = v8;
      CFErrorRef v11 = 0LL;
      uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        int fts_info = v10->fts_info;
        if (fts_info == 8)
        {
          if (!strncmp("patchd-", v10->fts_name, 7uLL) || !strncmp("install-", v10->fts_name, 8uLL))
          {
            unint64_t fts_namelen = v10->fts_namelen;
            if (fts_namelen >= 4 && !strcmp(&v10->fts_name[fts_namelen - 4], ".log"))
            {
              fts_path = v10->fts_path;
              if (v58 - v10->fts_statp->st_birthtimespec.tv_sec <= a1)
              {
                logfunction( "",  1,  @"keep %s, age:%lld, retention:%lld\n",  v14,  v15,  v16,  v17,  v18,  (char)fts_path);
                uint64_t tv_sec = v59;
                if (v10->fts_statp->st_birthtimespec.tv_sec < v59) {
                  uint64_t tv_sec = v10->fts_statp->st_birthtimespec.tv_sec;
                }
                uint64_t v59 = tv_sec;
              }

              else if (unlink(fts_path))
              {
                uint64_t v25 = v10->fts_path;
                uint64_t v26 = __error();
                strerror(*v26);
                logfunction("", 1, @"failed to unlink %s: %s\n", v27, v28, v29, v30, v31, (char)v25);
                if (!v11)
                {
                  CFIndex v32 = *__error();
                  uint64_t v33 = v10->fts_path;
                  uint64_t v34 = __error();
                  strerror(*v34);
                  CFErrorRef v11 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v32,  0LL,  0LL,  @"Could not unlink path %s: %s",  v35,  v36,  v37,  (char)v33);
                }
              }

              else
              {
                logfunction( "",  1,  @"removed %s, age:%lld, retention:%lld\n",  v20,  v21,  v22,  v23,  v24,  (char)v10->fts_path);
              }
            }
          }
        }

        else if (fts_info == 1 && v10->fts_level >= 1)
        {
          fts_set(v7, v10, 4);
        }

        int v10 = fts_read(v7);
      }

      while (v10);
      if (v11)
      {
        if (a3)
        {
          uint64_t v43 = 0LL;
          *a3 = v11;
LABEL_40:
          fts_close(v7);
          return v43;
        }

        CFErrorRef v56 = v11;
      }

      else
      {
        uint64_t v43 = 1LL;
        if (!a2) {
          goto LABEL_40;
        }
        if (v59 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_40;
        }
        time_t valuePtr = v58 - v59;
        CFNumberRef v49 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        *a2 = v49;
        if (v49) {
          goto LABEL_40;
        }
        CFIndex v50 = *__error();
        uint64_t v51 = __error();
        char v52 = strerror(*v51);
        CFErrorRef v56 = _create_error_internal_cf( kCFErrorDomainPOSIX,  v50,  0LL,  0LL,  @"failed to create CFNumber: %s",  v53,  v54,  v55,  v52);
        if (a3)
        {
          *a3 = v56;
LABEL_39:
          uint64_t v43 = 0LL;
          goto LABEL_40;
        }
      }

      CFRelease(v56);
      goto LABEL_39;
    }

    CFIndex v44 = *__error();
    id v45 = __error();
    strerror(*v45);
    error_internal_CFTypeRef cf = _create_error_internal_cf( kCFErrorDomainPOSIX,  v44,  0LL,  0LL,  @"Could not fts_open(3) path %s: %s",  v46,  v47,  v48,  (char)"/private/var/MobileSoftwareUpdate/");
  }

  if (a3)
  {
    uint64_t v43 = 0LL;
    *a3 = error_internal_cf;
  }

  else
  {
    CFRelease(error_internal_cf);
    return 0LL;
  }

  return v43;
}

uint64_t DeleteUpgradeBootCommand()
{
  CFTypeRef v0 = (const __CFString *)copy_nvram_variable(@"boot-command");
  if (!v0) {
    return 0LL;
  }
  id v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 == CFStringGetTypeID() && CFStringCompare(v1, @"upgrade", 0LL) == kCFCompareEqualTo)
  {
    delete_nvram_variable(@"boot-command");
    uint64_t v3 = 1LL;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  CFRelease(v1);
  return v3;
}

uint64_t __MSUCleanupPreparePath_block_invoke(uint64_t a1, int a2, char *__s1)
{
  if (!strncmp(__s1, "com.apple.os.update-", 0x14uLL))
  {
    int v6 = *(const char **)(a1 + 32);
    if (v6 && !strcmp(__s1, v6))
    {
      logfunction("", 1, @"Skipping snapshot %s\n", v7, v8, v9, v10, v11, (char)__s1);
    }

    else if (fs_snapshot_delete(a2, __s1, 0))
    {
      uint64_t v17 = __error();
      strerror(*v17);
      logfunction("", 1, @"Unable to delete snapshot %s: %s\n", v18, v19, v20, v21, v22, (char)__s1);
    }

    else
    {
      logfunction("", 1, @"Successfully deleted snapshot %s\n", v12, v13, v14, v15, v16, (char)__s1);
    }
  }

  return 1LL;
}

uint64_t lzvn_decode_buffer(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (a3 <= a3 + a4 - 8) {
      __asm { BR              X17 }
    }

    __asm { BTI             j }

    return 0LL;
  }

  else
  {
    __asm { BTI             j }

    return 0LL;
  }

int32x4_t **lz4_encode_2gb( int32x4_t **result, uint64_t a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int32x4_t v7 = vdupq_n_s32(0xFFFFFFFF);
  uint64_t v8 = *result;
  uint64_t v9 = *a3;
  uint64_t v10 = (uint64_t)(*result)[-8].i64 + a2;
  uint64_t v11 = (uint64_t)&v9[a5 - 128];
  if (v11 >= (uint64_t)v9)
  {
    do
    {
      uint64_t v12 = v9;
      uint64_t v13 = &v9[-a4];
      while (1)
      {
        unint64_t v14 = *v12;
        uint64_t v15 = (int *)(a6 + 8LL * ((-1640531535 * *v12) >> 20));
        int v16 = *v15;
        int v17 = v15[1];
        *uint64_t v15 = (int)v13;
        v15[1] = v14;
        unint64_t v18 = v14 >> 8;
        uint64_t v19 = (int *)(a6 + 8LL * ((-1640531535 * (v14 >> 8)) >> 20));
        int v20 = *v19;
        int v21 = v19[1];
        *uint64_t v19 = (_DWORD)v13 + 1;
        v19[1] = v14 >> 8;
        if ((_DWORD)v14 == v17)
        {
          uint64_t v22 = ((_DWORD)v13 - v16);
        }

        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v24 = v13 + 1;
        unint64_t v25 = v14 >> 16;
        uint64_t v26 = (int *)(a6 + 8LL * ((-1640531535 * v25) >> 20));
        int v27 = *v26;
        int v28 = v26[1];
        *uint64_t v26 = (_DWORD)v24 + 1;
        v26[1] = v25;
        if ((_DWORD)v18 == v21)
        {
          uint64_t v22 = ((_DWORD)v24 - v20);
        }

        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v30 = v24 + 1;
        unint64_t v31 = v25 >> 8;
        CFIndex v32 = (int *)(a6 + 8LL * ((-1640531535 * (v25 >> 8)) >> 20));
        int v33 = *v32;
        int v34 = v32[1];
        *CFIndex v32 = (_DWORD)v30 + 1;
        v32[1] = v25 >> 8;
        if ((_DWORD)v25 == v28)
        {
          uint64_t v22 = ((_DWORD)v30 - v27);
        }

        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v36 = v30 + 1;
        unint64_t v37 = v25 >> 16;
        uint64_t v38 = (int *)(a6 + 8LL * ((-1640531535 * v37) >> 20));
        int v39 = *v38;
        int v40 = v38[1];
        *uint64_t v38 = (_DWORD)v36 + 1;
        v38[1] = v37;
        if ((_DWORD)v31 == v34)
        {
          uint64_t v22 = ((_DWORD)v36 - v33);
        }

        uint64_t v12 = (void *)((char *)v12 + 1);
        id v42 = v36 + 1;
        if ((_DWORD)v37 == v40)
        {
          uint64_t v22 = ((_DWORD)v42 - v39);
        }

        uint64_t v12 = (void *)((char *)v12 + 1);
        uint64_t v13 = v42 + 1;
      }

      CFIndex v44 = (char *)v12 + 4;
      id v45 = (void *)((char *)v12 - v22 + 4);
      while (1)
      {
        uint64_t v47 = *(void *)v44;
        v44 += 8;
        uint64_t v46 = v47;
        uint64_t v49 = *v45++;
        uint64_t v48 = v49;
        if (v46 != v49) {
          break;
        }
      }

      CFIndex v44 = &v44[(__clz(__rbit64(v46 ^ v48)) >> 3) - 8];
LABEL_38:
      CFIndex v50 = (char *)v12 - v22;
      while (1)
      {
        BOOL v51 = (uint64_t)v12 <= (uint64_t)v9 || (uint64_t)v50 <= a4;
        if (v51) {
          break;
        }
        int v53 = *((unsigned __int8 *)v12 - 1);
        uint64_t v12 = (void *)((char *)v12 - 1);
        int v52 = v53;
        int v54 = *--v50;
        if (v52 != v54)
        {
          uint64_t v12 = (void *)((char *)v12 + 1);
          break;
        }
      }

      unint64_t v55 = v44 - (char *)v12 - 4;
      uint64_t v56 = (char *)v12 - v9;
      unint64_t v57 = (char *)v12 - v9 + 3;
      unint64_t v58 = v10 - (void)v8 - v57;
      __int8 v59 = (v55 & 0xF) + 16 * v56;
      uint64_t v60 = (int32x4_t *)&v8->i8[1];
      if ((unint64_t)v56 >= 0xF)
      {
        v59 |= 0xF0u;
        unint64_t v61 = v56 - 15;
        BOOL v62 = v58-- != 0;
        if (!v62) {
          goto LABEL_92;
        }
        if (v61 >= 0xFF)
        {
          unint64_t v63 = v61 / 0xFFuLL;
          BOOL v62 = v58 >= v63;
          v58 -= v63;
          if (!v62) {
            goto LABEL_92;
          }
          LOBYTE(v61) = v61 + v63;
          do
          {
            *v60++ = v7;
            BOOL v51 = v63 > 0x10;
            v63 -= 16LL;
          }

          while (v51);
          uint64_t v60 = (int32x4_t *)((char *)v60 + v63);
        }

        v60->i8[0] = v61;
        uint64_t v60 = (int32x4_t *)((char *)v60 + 1);
      }

      do
      {
        int32x4_t v64 = *(int32x4_t *)v9;
        v9 += 16;
        *v60++ = v64;
        BOOL v51 = v56 <= 16;
        v56 -= 16LL;
      }

      while (!v51);
      uint64_t v65 = (__int16 *)((char *)v60->i16 + v56);
      *uint64_t v65 = v22;
      uint64_t v66 = (int32x4_t *)(v65 + 1);
      if (v55 >= 0xF)
      {
        v59 |= 0xFu;
        unint64_t v67 = v44 - (char *)v12 - 19;
        BOOL v62 = v58 != 0;
        unint64_t v68 = v58 - 1;
        if (!v62) {
          goto LABEL_92;
        }
        if (v67 >= 0xFF)
        {
          unint64_t v69 = v67 / 0xFFuLL;
          if (v68 < v69) {
            goto LABEL_92;
          }
          LOBYTE(v67) = v67 + v69;
          do
          {
            *v66++ = v7;
            BOOL v51 = v69 > 0x10;
            v69 -= 16LL;
          }

          while (v51);
          uint64_t v66 = (int32x4_t *)((char *)v66 + v69);
        }

        v66->i8[0] = v67;
        uint64_t v66 = (int32x4_t *)((char *)v66 + 1);
      }

      v8->i8[0] = v59;
      uint64_t v8 = v66;
      uint64_t v9 = v44;
    }

    while ((uint64_t)v44 < v11 && (uint64_t)v66 < v10);
  }

LABEL_74:
  if (a7) {
    goto LABEL_92;
  }
  uint64_t v71 = (char *)(v11 + 128);
  uint64_t v72 = v71 - v9;
  if (v71 == v9) {
    goto LABEL_92;
  }
  uint64_t v73 = v10 + 128 - (void)v8 - 1;
  BOOL v51 = v73 <= v72;
  uint64_t v74 = v73 - v72;
  if (v51) {
    goto LABEL_92;
  }
  if (v72 < 15)
  {
    v8->i8[0] = 16 * v72;
    uint64_t v8 = (int32x4_t *)((char *)v8 + 1);
    do
    {
LABEL_91:
      __int8 v81 = *v9++;
      v8->i8[0] = v81;
      uint64_t v8 = (int32x4_t *)((char *)v8 + 1);
    }

    while (v9 < v71);
    goto LABEL_92;
  }

  uint64_t v75 = v74 - 1;
  if (v75 >= 0)
  {
    v8->i8[0] = -16;
    uint64_t v76 = (int32x4_t *)&v8->i8[1];
    unsigned int v77 = v72 - 15;
    if ((unint64_t)(v72 - 15) >= 0xFF)
    {
      int64_t v78 = v77 / 0xFFuLL;
      if (v75 - v78 < 0)
      {
        uint64_t v8 = (int32x4_t *)((char *)v76 - 1);
        goto LABEL_92;
      }

      LOBYTE(v77) = v77 + v78;
      do
      {
        *v76++ = v7;
        BOOL v51 = v78 <= 16;
        v78 -= 16LL;
      }

      while (!v51);
      uint64_t v76 = (int32x4_t *)((char *)v76 + v78);
    }

    v76->i8[0] = v77;
    uint64_t v8 = (int32x4_t *)&v76->i8[1];
    uint64_t v79 = (unint64_t)v72 >> 4;
    do
    {
      int32x4_t v80 = *(int32x4_t *)v9;
      v9 += 16;
      *v8++ = v80;
      BOOL v51 = v79-- <= 1;
    }

    while (!v51);
    if (v9 < v71) {
      goto LABEL_91;
    }
  }

LABEL_92:
  int *result = v8;
  *a3 = v9;
  return result;
}

uint64_t lz4_decode_asm( int8x16_t **a1, unint64_t a2, unint64_t a3, unsigned __int8 **a4, unint64_t a5)
{
  id v5 = *a4;
  int v6 = *a1;
  while (1)
  {
    int32x4_t v7 = v6;
    uint64_t v8 = v5;
    unsigned int v10 = *v5;
    uint64_t v9 = v5 + 1;
    unint64_t v11 = (unint64_t)v10 >> 4;
    unint64_t v12 = (v10 & 0xF) + 4LL;
    if (v11 > 0xE)
    {
      while ((unint64_t)v9 < a5)
      {
        unsigned int v13 = *(unsigned __int8 *)v9;
        uint64_t v9 = (_OWORD *)((char *)v9 + 1);
        v11 += v13;
        if (v13 != 255LL)
        {
          unint64_t v14 = (int8x16_t *)v9;
          uint64_t v15 = v6;
          int v16 = (unsigned __int16 *)((char *)v9 + v11);
          int v17 = (int8x16_t *)((char *)v6 + v11);
          if ((unint64_t)v16 < a5 && (unint64_t)v17 < a3)
          {
            int8x16_t v19 = *v14;
            int8x16_t v20 = v14[1];
            unint64_t v18 = v14 + 2;
            *uint64_t v15 = v19;
            v15[1] = v20;
            int v21 = v15 + 2;
            do
            {
              int8x16_t v22 = *v18;
              int8x16_t v23 = v18[1];
              v18 += 2;
              *int v21 = v22;
              v21[1] = v23;
              v21 += 2;
            }

            while (v17 > v21);
            goto LABEL_13;
          }

          goto LABEL_36;
        }
      }

      break;
    }

    *int v6 = *(int8x16_t *)v9;
    int v16 = (unsigned __int16 *)((char *)v9 + v11);
    int v17 = (int8x16_t *)((char *)v6 + v11);
LABEL_13:
    unsigned int v25 = *v16;
    id v5 = (unsigned __int8 *)(v16 + 1);
    unint64_t v24 = v25;
    if (!v25 || (uint64_t v26 = (int8x16_t *)((char *)v17 - v24), (unint64_t)v17 - v24 < a2))
    {
      uint64_t v47 = -1LL;
      goto LABEL_37;
    }

    int v27 = v17;
    int v6 = (int8x16_t *)((char *)v17 + v12);
    if (v12 == 19)
    {
      while ((unint64_t)v5 < a5)
      {
        unsigned int v28 = *v5++;
        int v6 = (int8x16_t *)((char *)v6 + v28);
        if (v28 != 255LL)
        {
          goto LABEL_24;
        }
      }

      break;
    }

    if (v12 > 0x10)
    {
LABEL_24:
      if (v24 > 0x1F)
      {
        int8x16_t v36 = *v26;
        uint64_t v35 = v26 + 1;
        *int v27 = v36;
        unint64_t v37 = v27 + 1;
        do
        {
          int8x16_t v38 = *v35;
          int8x16_t v39 = v35[1];
          v35 += 2;
          *unint64_t v37 = v38;
          v37[1] = v39;
          v37 += 2;
        }

        while (v6 > v37);
      }

      else if (v24 > 0xF)
      {
        int8x16_t v41 = *v26;
        int v40 = v26 + 1;
        *int v27 = v41;
        id v42 = v27 + 1;
        do
        {
          int8x16_t v44 = *v40;
          uint64_t v43 = v40 + 1;
          *id v42 = v44;
          id v45 = v42 + 1;
          int8x16_t v46 = *v43;
          int v40 = v43 + 1;
          *id v45 = v46;
          id v42 = v45 + 1;
        }

        while (v6 > v42);
      }

      else
      {
        uint64_t v29 = (int8x16_t *)&qword_100011740[4 * v24];
        int8x16_t v30 = vqtbl1q_s8(*v26, *v29);
        int8x16_t v31 = vqtbl1q_s8(*v26, v29[1]);
        uint64_t v32 = *((unsigned __int8 *)qword_100011940 + v24);
        *int v27 = v30;
        v27[1] = v31;
        int v33 = (int8x16_t *)((char *)v27 + v32);
        do
        {
          *int v33 = v30;
          v33[1] = v31;
          int v34 = (int8x16_t *)((char *)v33 + v32);
          *int v34 = v30;
          v34[1] = v31;
          int v33 = (int8x16_t *)((char *)v34 + v32);
        }

        while (v6 > v33);
      }
    }

    else if (v24 <= 0xF)
    {
      *int v27 = vqtbl1q_s8(*v26, *(int8x16_t *)&qword_100011740[4 * v24]);
    }

    else
    {
      *int v27 = *v26;
    }
  }

LABEL_36:
  uint64_t v47 = 0LL;
LABEL_37:
  *a4 = v8;
  *a1 = v7;
  return v47;
}

uint64_t lzfse_decode_lmd(uint64_t a1)
{
  id v1 = *(void **)(a1 + 24);
  CFTypeID v2 = (uint64_t *)(*(void *)a1 + *(int *)(a1 + 120));
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(unsigned int *)(a1 + 112);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  unint64_t v6 = *(unsigned int *)(a1 + 88);
  unint64_t v7 = *(unsigned int *)(a1 + 92);
  unint64_t v8 = *(unsigned int *)(a1 + 96);
  unint64_t v9 = *(unsigned __int16 *)(a1 + 124);
  unint64_t v10 = *(unsigned __int16 *)(a1 + 126);
  unint64_t v11 = *(unsigned __int16 *)(a1 + 128);
  uint64_t v12 = *(void *)(a1 + 40) - (void)v1 - 32LL;
  unsigned int v13 = *(char **)(a1 + 80);
  if (v6 | v7) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 72))
  {
    while (1)
    {
      CFTypeID v2 = (uint64_t *)((char *)v2 - ((unint64_t)(63 - v4) >> 3));
      uint64_t v3 = *v2;
      unint64_t v14 = (unsigned __int8 *)(a1 + 136 + 8 * v9);
      uint64_t v15 = *v14;
      uint64_t v16 = v4 + ((63 - v4) & 0xFFFFFFFFFFFFFFF8LL) - v15;
      unint64_t v17 = (unint64_t)*v2 >> v16;
      unint64_t v18 = v17 & ~(-1LL << v15);
      LOBYTE(v15) = v14[1];
      unint64_t v9 = (v18 >> v15) + *((unsigned __int16 *)v14 + 1);
      unint64_t v6 = (v17 & ~(-1LL << v15)) + *((unsigned int *)v14 + 1);
      int8x16_t v19 = (unsigned __int8 *)(a1 + 648 + 8 * v10);
      uint64_t v20 = *v19;
      uint64_t v21 = v16 - v20;
      unint64_t v22 = (unint64_t)*v2 >> v21;
      unint64_t v23 = v22 & ~(-1LL << v20);
      LOBYTE(v20) = v19[1];
      unint64_t v10 = (v23 >> v20) + *((unsigned __int16 *)v19 + 1);
      unint64_t v7 = (v22 & ~(-1LL << v20)) + *((unsigned int *)v19 + 1);
      unint64_t v24 = (unsigned __int8 *)(a1 + 1160 + 8 * v11);
      uint64_t v25 = *v24;
      uint64_t v4 = v21 - v25;
      unint64_t v26 = (unint64_t)*v2 >> v4;
      unint64_t v27 = v26 & ~(-1LL << v25);
      LOBYTE(v25) = v24[1];
      unint64_t v11 = (v27 >> v25) + *((unsigned __int16 *)v24 + 1);
      uint64_t v28 = (v26 & ~(-1LL << v25)) + *((unsigned int *)v24 + 1);
      if (v28) {
        unint64_t v8 = v28;
      }
      --v5;
LABEL_7:
      if (v8 > (unint64_t)v1 + v6 - *(void *)(a1 + 32)
        || a1 + *(unsigned int *)(a1 + 7304) + 7308LL < (uint64_t)&v13[v6])
      {
        return -3LL;
      }

      BOOL v29 = v12 < (uint64_t)(v6 + v7);
      v12 -= v6 + v7;
      if (v29)
      {
        uint64_t v40 = v12 + v6 + v7 + 32;
        if (v6)
        {
          do
          {
            BOOL v41 = v40-- != 0;
            if (!v41) {
              goto LABEL_30;
            }
            char v42 = *v13++;
            *(_BYTE *)id v1 = v42;
            id v1 = (void *)((char *)v1 + 1);
          }

          while (--v6);
        }

        if (v7)
        {
          uint64_t v43 = (char *)v1 - v8;
          while (1)
          {
            BOOL v41 = v40-- != 0;
            if (!v41) {
              break;
            }
            char v44 = *v43++;
            *(_BYTE *)id v1 = v44;
            id v1 = (void *)((char *)v1 + 1);
            if (!--v7) {
              goto LABEL_28;
            }
          }

LABEL_30:
          *(void *)(a1 + 24) = v1;
          *(void *)(a1 + 120) = (char *)v2 - *(void *)a1;
          *(void *)(a1 + 104) = v3;
          *(_DWORD *)(a1 + 112) = v4;
          *(_DWORD *)(a1 + 72) = v5;
          *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = v6;
          *(_DWORD *)(a1 + 92) = v7;
          *(_DWORD *)(a1 + 96) = v8;
          *(_WORD *)(a1 + 124) = v9;
          *(_WORD *)(a1 + 126) = v10;
          *(_WORD *)(a1 + 12_Block_object_dispose(va, 8) = v11;
          *(void *)(a1 + 80) = v13;
          return -2LL;
        }

LABEL_28:
        uint64_t v12 = v40 - 32;
        if (!v5) {
          goto LABEL_29;
        }
      }

      else
      {
        do
        {
          uint64_t v30 = *(void *)v13;
          uint64_t v31 = *((void *)v13 + 1);
          v13 += 16;
          *id v1 = v30;
          v1[1] = v31;
          v1 += 2;
          BOOL v29 = v6 > 0x10;
          v6 -= 16LL;
        }

        while (v29);
        uint64_t v32 = (int8x16_t *)((char *)v1 + v6);
        v13 += v6;
        int v33 = (int8x16_t *)((char *)v32 - v8);
        if (v8 < 0x10)
        {
          int8x16_t v36 = (int8x16_t *)((char *)&unk_100057DE0 + 32 * v8);
          unint64_t v37 = byte_100057FE0[v8];
          int8x16_t v38 = vqtbl1q_s8(*v33, *v36);
          int8x16_t v39 = vqtbl1q_s8(*v33, v36[1]);
          do
          {
            *uint64_t v32 = v38;
            v32[1] = v39;
            uint64_t v32 = (int8x16_t *)((char *)v32 + v37);
            BOOL v29 = v7 > v37;
            v7 -= v37;
          }

          while (v29);
          id v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5) {
            goto LABEL_29;
          }
        }

        else
        {
          do
          {
            uint64_t v34 = v33->i64[0];
            uint64_t v35 = v33->i64[1];
            ++v33;
            v32->i64[0] = v34;
            v32->i64[1] = v35;
            ++v32;
            BOOL v29 = v7 > 0x10;
            v7 -= 16LL;
          }

          while (v29);
          id v1 = (uint64_t *)((char *)v32->i64 + v7);
          if (!v5) {
            goto LABEL_29;
          }
        }
      }
    }
  }

  else
  {
LABEL_29:
    *(void *)(a1 + 24) = v1;
    return 0LL;
  }

uint64_t lzfse_decode_literals( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, unint64_t a6, double a7)
{
  uint64_t v7 = LOWORD(a7);
  uint64_t v8 = WORD1(a7);
  uint64_t v9 = WORD2(a7);
  uint64_t v10 = HIWORD(a7);
  unint64_t v12 = *(void *)a4;
  int v13 = *(_DWORD *)(a4 + 8);
  unint64_t v14 = *a5;
  while (1)
  {
    unsigned int v15 = *(_DWORD *)(a2 + 4 * v7);
    unsigned int v16 = *(_DWORD *)(a2 + 4 * v8);
    unsigned int v17 = *(_DWORD *)(a2 + 4 * v9);
    unsigned int v18 = *(_DWORD *)(a2 + 4 * v10);
    *a1++ = (v16 & 0xFF00)
    unint64_t v19 = (63 - v13) & 0xFFFFFFF8;
    if (((63 - v13) & 0xFFFFFFF8) != 0) {
      break;
    }
LABEL_5:
    uint64_t v20 = v13 - v15;
    uint64_t v21 = v20 - v16;
    unint64_t v22 = v12 >> (v13 - v15);
    unint64_t v23 = v12 & qword_100011D20[v20];
    uint64_t v24 = v21 - v17;
    uint64_t v7 = v22 + HIWORD(v15);
    unint64_t v25 = v23 >> (v20 - v16);
    unint64_t v26 = v23 & qword_100011D20[v21];
    int v13 = v24 - v18;
    uint64_t v8 = v25 + HIWORD(v16);
    unint64_t v27 = v26 >> (v21 - v17);
    unint64_t v28 = v26 & qword_100011D20[v24];
    uint64_t v9 = v27 + HIWORD(v17);
    unint64_t v29 = v28 >> (v24 - v18);
    unint64_t v12 = v28 & qword_100011D20[v13];
    uint64_t v10 = v29 + HIWORD(v18);
    BOOL v30 = a3 <= 4;
    a3 -= 4LL;
    if (v30)
    {
      *(void *)a4 = v12;
      *(_DWORD *)(a4 + _Block_object_dispose(va, 8) = v13;
      *a5 = v14;
      return 0LL;
    }
  }

  unint64_t v14 = (void *)((char *)v14 - (v19 >> 3));
  if ((unint64_t)v14 >= a6)
  {
    v13 += v19;
    unint64_t v12 = (v12 << v19) | *v14 & qword_100011D20[v19];
    goto LABEL_5;
  }

  return -3LL;
}

uint64_t adler32_vec(uint64_t a1, uint64_t a2, uint8x16_t *a3, int a4)
{
  uint64_t v4 = a1 + (a2 << 32);
  if (a4 >= 5552)
  {
    int v5 = a4 - 5552;
    do
    {
      uint8x16_t v6 = *a3;
      uint16x8_t v7 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
      v6.i16[0] = vaddlvq_u8(*a3);
      v7.i32[0] = vaddlvq_u16(v7);
      ++a3;
      uint64_t v8 = (uint64_t)vadd_s32( (int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)),  vzip1_s32(*(int32x2_t *)v6.i8, *(int32x2_t *)v7.i8));
      int v9 = 173;
      do
      {
        uint8x16_t v10 = *a3;
        uint8x16_t v11 = a3[1];
        uint16x4_t v12 = (uint16x4_t)vshld_n_s64(v8, 0x25uLL);
        int32x2_t v13 = (int32x2_t)(v8 + *(void *)&v12);
        v10.i16[0] = vaddlvq_u8(*a3);
        v12.i16[0] = vaddlvq_u8(v11);
        uint16x8_t v14 = vmlal_high_u8( vmlal_u8( vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table),  *(uint8x8_t *)v11.i8,  (uint8x8_t)vec_table[2]),  v11,  *(uint8x16_t *)&vec_table[2]);
        v14.i32[0] = vaddlvq_u16(v14);
        a3 += 2;
        uint64_t v8 = (uint64_t)vadd_s32( v13,  vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v10.i8, v12), *(int32x2_t *)v14.i8));
        BOOL v15 = __OFSUB__(v9--, 1);
      }

      while (!((v9 < 0) ^ v15 | (v9 == 0)));
      uint64x2_t v16 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v8, (uint32x2_t)0x800780710000FFF1LL, 1), 0x2FuLL);
      v16.i32[1] = v16.i32[2];
      uint64_t v4 = (uint64_t)vmls_lane_s32((int32x2_t)v8, *(int32x2_t *)v16.i8, (int32x2_t)0x800780710000FFF1LL, 0);
      BOOL v15 = __OFSUB__(v5, 5552);
      v5 -= 5552;
    }

    while (v5 < 0 == v15);
    a4 = v5 + 5552;
  }

  BOOL v15 = __OFSUB__(a4, 32);
  for (int i = a4 - 32; i < 0 == v15; i -= 32)
  {
    uint8x16_t v18 = *a3;
    uint8x16_t v19 = a3[1];
    uint16x4_t v20 = (uint16x4_t)vshld_n_s64(v4, 0x25uLL);
    int32x2_t v21 = (int32x2_t)(v4 + *(void *)&v20);
    v18.i16[0] = vaddlvq_u8(*a3);
    v20.i16[0] = vaddlvq_u8(v19);
    uint16x8_t v22 = vmlal_high_u8( vmlal_u8( vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[0]), *a3, *(uint8x16_t *)vec_table),  *(uint8x8_t *)v19.i8,  (uint8x8_t)vec_table[2]),  v19,  *(uint8x16_t *)&vec_table[2]);
    v22.i32[0] = vaddlvq_u16(v22);
    a3 += 2;
    uint64_t v4 = (uint64_t)vadd_s32( v21,  vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v18.i8, v20), *(int32x2_t *)v22.i8));
    BOOL v15 = __OFSUB__(i, 32);
  }

  if ((i & 0x10) != 0)
  {
    uint8x16_t v23 = *a3;
    uint16x8_t v24 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)vec_table[2]), *a3, *(uint8x16_t *)&vec_table[2]);
    v23.i16[0] = vaddlvq_u8(*a3);
    v24.i32[0] = vaddlvq_u16(v24);
    ++a3;
    uint64_t v4 = (uint64_t)vadd_s32( (int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)),  vzip1_s32(*(int32x2_t *)v23.i8, *(int32x2_t *)v24.i8));
  }

  for (int j = i & 0xF; j; v4 += v26 + vshld_n_s64(v4 + v26, 0x20uLL))
  {
    unsigned int v26 = a3->u8[0];
    a3 = (uint8x16_t *)((char *)a3 + 1);
    --j;
  }

  uint64x2_t v27 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v4, (uint32x2_t)0x800780710000FFF1LL, 1), 0x2FuLL);
  v27.i32[1] = v27.i32[2];
  int32x2_t v28 = vmls_lane_s32((int32x2_t)v4, *(int32x2_t *)v27.i8, (int32x2_t)0x800780710000FFF1LL, 0);
  return (v28.i32[0] + (v28.i32[1] << 16));
}

uint64_t __os_log_helper_1_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

LABEL_52:
  unsigned int v17 = 0LL;
  objc_storeStrong(&v112, 0LL);
  objc_storeStrong(&v115, v17);
  objc_storeStrong(&v116, v17);
  objc_storeStrong(&v118, v17);
  objc_storeStrong(location, v17);
  return v125;
}

uint64_t __os_log_helper_1_2_3_8_32_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_100013D48(uint64_t a1)
{
  *(void *)(v1 - 336) = a1;
  _Unwind_Resume(*(_Unwind_Exception **)(v1 - 336));
}

_BYTE *__os_log_helper_1_0_0(_BYTE *result)
{
  int *result = 0;
  result[1] = 0;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  CFTypeID v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

uint64_t __os_log_helper_1_3_1_8_65(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 65;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t iterateSafely(io_iterator_t a1, int a2, id obj, void *a4)
{
  id v10 = a4;
  int v9 = "_Bool iterateSafely(io_iterator_t, int, void (^__strong)(io_object_t), void (^__strong)(void))";
  io_iterator_t v22 = a1;
  int v21 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v19 = 0LL;
  objc_storeStrong(&v19, v10);
  for (int i = 0; i < v21; ++i)
  {
    for (io_object_t j = 0; ; IOObjectRelease(j))
    {
      io_object_t j = IOIteratorNext(v22);
      if (!j) {
        break;
      }
      (*((void (**)(id, void))location + 2))(location, j);
    }

    if (IOIteratorIsValid(v22))
    {
      char v23 = 1;
      int v16 = 1;
      goto LABEL_10;
    }

    IOIteratorReset(v22);
    (*((void (**)(void))v19 + 2))();
  }

  uint64_t v15 = _os_log_pack_size(18LL);
  uint64_t v8 = v15;
  uint16x8_t v14 = &v5;
  unint64_t v7 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v13 = v8;
  uint64_t v12 = (uint64_t)&v5 - v7;
  uint64_t v11 = _os_log_pack_fill( (char *)&v5 - v7,  v15,  0LL,  &_mh_execute_header,  "%s : IOIterator was still invalid after attempting %d times",  v5,  v6);
  __os_log_helper_1_2_2_8_32_4_0(v11, (uint64_t)v9, v21);
  _LPLogPack(1, v12);
  char v23 = 0;
  int v16 = 1;
LABEL_10:
  int v5 = 0LL;
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&location, v5);
  return v23 & 1;
}

uint64_t _is_running_in_ramdisk()
{
  predicate = (dispatch_once_t *)&_is_running_in_ramdisk_onceToken;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &__block_literal_global_153);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return _is_running_in_ramdisk_is_ramdisk & 1;
}

uint64_t _lp2_delete_directory_contents(const char *a1)
{
  int v33 = a1;
  uint64_t v15 = &v32;
  unsigned int v32 = 0;
  removefile_state_t v31 = removefile_state_alloc();
  removefile_state_set(v31, 1u, _lp2_delete_directory_contents_confirm);
  removefile_state_set(v31, 2u, &v32);
  removefile_state_set(v31, 3u, _lp2_delete_directory_contents_error);
  removefile_state_set(v31, 4u, &v32);
  uint64_t v30 = _os_log_pack_size(12LL);
  uint64_t v14 = v30;
  unint64_t v29 = v5;
  unint64_t v13 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v28 = v14;
  uint64x2_t v27 = &v5[-v13];
  uint64_t v26 = _os_log_pack_fill(&v5[-v13], v30, 0LL, &_mh_execute_header, "Deleting contents of %{private}s...");
  __os_log_helper_1_3_1_8_33(v26, (uint64_t)v33);
  _LPLogPack(1, (uint64_t)v27);
  if (removefile(v33, v31, 3u))
  {
    if (!v32) {
      unsigned int v32 = *__error();
    }
  }

  else
  {
    unsigned int v32 = _lp2_reset_directory_metadata(v33);
    if (v32)
    {
      uint64_t v25 = 0LL;
      uint64_t v25 = _os_log_pack_size(22LL);
      uint64_t v10 = v25;
      uint16x8_t v24 = v5;
      unint64_t v9 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      __chkstk_darwin();
      uint64_t v23 = v10;
      io_iterator_t v22 = &v5[-v9];
      uint64_t v21 = _os_log_pack_fill(&v5[-v9], v25, 0LL, &_mh_execute_header, "Could not reset metadata on %{private}s: %s");
      uint64_t v12 = v21;
      uint64_t v11 = v33;
      uint64_t v1 = strerror(v32);
      __os_log_helper_1_3_2_8_33_8_32(v12, (uint64_t)v11, (uint64_t)v1);
      _LPLogPack(1, (uint64_t)v22);
    }
  }

  uint64_t v20 = 0LL;
  uint64_t v20 = _os_log_pack_size(28LL);
  uint64_t v7 = v20;
  id v19 = v5;
  unint64_t v6 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v18 = v7;
  unsigned int v17 = &v5[-v6];
  uint64_t v2 = _os_log_pack_fill(&v5[-v6], v20, 0LL, &_mh_execute_header, "Deleting contents of %{private}s %s (result: %d).");
  uint64_t v16 = v2;
  int v8 = 1;
  if (v32) {
    uint64_t v3 = "failed";
  }
  else {
    uint64_t v3 = "succeeded";
  }
  __os_log_helper_1_3_3_8_33_8_32_4_0(v2, (uint64_t)v33, (uint64_t)v3, v32);
  _LPLogPack(v8, (uint64_t)v17);
  removefile_state_free(v31);
  return v32;
}

uint64_t __os_log_helper_1_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_33_8_33(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 33;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t _execForLibpartition(char *const *a1)
{
  uint64_t v60 = (const char **)a1;
  unsigned int v59 = -1;
  pid_t v58 = 0;
  *(void *)BOOL v62 = -1LL;
  if (pipe(v62))
  {
    uint64_t v32 = _os_log_pack_size(22LL);
    uint64_t v10 = v32;
    removefile_state_t v31 = &v7;
    unint64_t v9 = (v32 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    __chkstk_darwin();
    uint64_t v30 = v10;
    uint64_t v29 = (uint64_t)&v7 - v9;
    uint64_t v28 = _os_log_pack_fill( (char *)&v7 - v9,  v32,  0LL,  &_mh_execute_header,  "pipe failed while preparing to execute %s: %s",  v7,  v8);
    uint64_t v12 = v28;
    uint64_t v11 = *v60;
    uint64_t v4 = __error();
    int v5 = strerror(*v4);
    __os_log_helper_1_2_2_8_32_8_32(v12, (uint64_t)v11, (uint64_t)v5);
    _LPLogPack(1, v29);
  }

  else
  {
    uint64_t v26 = &v57;
    uint64_t v27 = 0LL;
    posix_spawn_file_actions_t v57 = 0LL;
    uint64_t v25 = &v56;
    posix_spawnattr_t v56 = 0LL;
    posix_spawn_file_actions_init(&v57);
    posix_spawn_file_actions_adddup2(&v57, v62[1], 1);
    posix_spawn_file_actions_addclose(&v57, v62[0]);
    posix_spawnattr_init(&v56);
    posix_spawnattr_setflags(&v56, 0x4000);
    unsigned int v59 = posix_spawn(&v58, *v60, &v57, 0LL, (char *const *)v60, 0LL);
    if (v59)
    {
      uint64_t v37 = _os_log_pack_size(22LL);
      uint64_t v14 = v37;
      int8x16_t v36 = &v7;
      unint64_t v13 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      __chkstk_darwin();
      uint64_t v35 = v14;
      uint64_t v34 = (uint64_t)&v7 - v13;
      uint64_t v33 = _os_log_pack_fill((char *)&v7 - v13, v37, 0LL, &_mh_execute_header, "posix_spawn %s failed: %s", v7, v8);
      uint64_t v16 = v33;
      uint64_t v15 = *v60;
      uint64_t v3 = strerror(v59);
      __os_log_helper_1_2_2_8_32_8_32(v16, (uint64_t)v15, (uint64_t)v3);
      _LPLogPack(1, v34);
      close(v62[0]);
    }

    else
    {
      bzero(v61, 0x400uLL);
      ssize_t v55 = 0LL;
      int v54 = v62[0];
      close(v62[1]);
      v62[1] = -1;
      while (1)
      {
        ssize_t v55 = read(v54, v61, 0x400uLL);
        if (v55 <= 0) {
          break;
        }
        execlogfunction(@"%.*s", v55, v61);
      }

      int v53 = 0;
      if (waitpid(v58, &v53, 0) == -1)
      {
        unsigned int v59 = *__error();
        uint64_t v42 = _os_log_pack_size(22LL);
        uint64_t v18 = v42;
        BOOL v41 = &v7;
        unint64_t v17 = (v42 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        __chkstk_darwin();
        uint64_t v40 = v18;
        uint64_t v39 = (uint64_t)&v7 - v17;
        uint64_t v38 = _os_log_pack_fill((char *)&v7 - v17, v42, 0LL, &_mh_execute_header, "waitpid failed for %s: %s", v7, v8);
        uint64_t v20 = v38;
        id v19 = *v60;
        uint64_t v1 = __error();
        uint64_t v2 = strerror(*v1);
        __os_log_helper_1_2_2_8_32_8_32(v20, (uint64_t)v19, (uint64_t)v2);
        _LPLogPack(1, v39);
      }

      else if ((v53 & 0x7F) != 0)
      {
        if ((v53 & 0x7F) == 0x7F || (v53 & 0x7F) == 0)
        {
          uint64_t v47 = _os_log_pack_size(18LL);
          uint64_t v22 = v47;
          int8x16_t v46 = &v7;
          unint64_t v21 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          __chkstk_darwin();
          uint64_t v45 = v22;
          uint64_t v44 = (uint64_t)&v7 - v21;
          uint64_t v43 = _os_log_pack_fill( (char *)&v7 - v21,  v47,  0LL,  &_mh_execute_header,  "%s was stopped by signal %d",  v7,  (_DWORD)v8);
          __os_log_helper_1_2_2_8_32_4_0(v43, (uint64_t)*v60, v53 >> 8);
          _LPLogPack(1, v44);
          unsigned int v59 = -1;
        }

        else
        {
          uint64_t v52 = _os_log_pack_size(18LL);
          uint64_t v24 = v52;
          BOOL v51 = &v7;
          unint64_t v23 = (v52 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          __chkstk_darwin();
          uint64_t v50 = v24;
          uint64_t v49 = (uint64_t)&v7 - v23;
          uint64_t v48 = _os_log_pack_fill( (char *)&v7 - v23,  v52,  0LL,  &_mh_execute_header,  "%s was terminated by signal %d",  v7,  (_DWORD)v8);
          __os_log_helper_1_2_2_8_32_4_0(v48, (uint64_t)*v60, v53 & 0x7F);
          _LPLogPack(1, v49);
          unsigned int v59 = -1;
        }
      }

      else
      {
        unsigned int v59 = BYTE1(v53);
      }
    }

    posix_spawnattr_destroy(&v56);
    posix_spawn_file_actions_destroy(&v57);
    if (v62[1] != -1) {
      close(v62[1]);
    }
  }

  return v59;
}

uint64_t __os_log_helper_1_2_3_8_64_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose(va, 8) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_64_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_64_8_65_8_65(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 65;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_64_8_65(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_64_8_32_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_32_8_65(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_32_8_65_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 65;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_2_8_32_8_33(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 33;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_2_2_4_0_8_32(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + _Block_object_dispose(va, 8) = 32;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

void ___is_running_in_ramdisk_block_invoke(id a1)
{
  v1[2] = (size_t)a1;
  v1[1] = (size_t)a1;
  bzero(__big, 0x400uLL);
  v1[0] = 1024LL;
  if (!sysctlbyname("kern.bootargs", __big, v1, 0LL, 0LL))
  {
    if (strstr(__big, "-restore")) {
      _is_running_in_ramdisk_is_ramdisk = 1;
    }
  }

uint64_t _lp2_delete_directory_contents_confirm()
{
  return 0LL;
}

uint64_t _lp2_delete_directory_contents_error(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  unint64_t v17 = a3;
  uint64_t v16 = a3;
  int v15 = 0;
  int v15 = *__error();
  *uint64_t v16 = v15;
  uint64_t v14 = _os_log_pack_size(22LL);
  uint64_t v7 = v14;
  unint64_t v13 = &v5;
  unint64_t v6 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v12 = v7;
  uint64_t v11 = (uint64_t)&v5 - v6;
  uint64_t v10 = _os_log_pack_fill( (char *)&v5 - v6,  v14,  0LL,  &_mh_execute_header,  "Could not removefile(3) path %{private}s: %s");
  uint64_t v9 = v10;
  uint64_t v8 = v18;
  uint64_t v3 = strerror(v15);
  __os_log_helper_1_3_2_8_33_8_32(v9, v8, (uint64_t)v3);
  _LPLogPack(1, v11);
  return 2LL;
}

uint64_t __os_log_helper_1_3_1_8_33(uint64_t result, uint64_t a2)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t _lp2_reset_directory_metadata(const char *a1)
{
  unsigned int v4 = 0;
  int from_fd = -1;
  strcpy(path, ".XXXXXXXX");
  int dfd = open(a1, 1048832);
  if (dfd == -1)
  {
    unsigned int v4 = *__error();
  }

  else
  {
    int from_fd = mkstempsat_np(dfd, path, 8);
    if (from_fd == -1 || unlinkat(dfd, path, 0) || fcopyfile(from_fd, dfd, 0LL, 5u)) {
      unsigned int v4 = *__error();
    }
  }

  if (from_fd != -1) {
    close(from_fd);
  }
  if (dfd != -1) {
    close(dfd);
  }
  return v4;
}

uint64_t __os_log_helper_1_3_2_8_33_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_1_3_3_8_33_8_32_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void execlogfunction(id obj, ...)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  va_copy((va_list)&v11[1], va);
  uint64_t v1 = objc_alloc(&OBJC_CLASS___NSString);
  v11[0] = -[NSString initWithFormat:arguments:](v1, "initWithFormat:arguments:", location, va);
  uint64_t v10 = _os_log_pack_size(12LL);
  uint64_t v5 = v10;
  uint64_t v9 = &v2;
  unint64_t v4 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin();
  uint64_t v8 = v5;
  uint64_t v7 = (uint64_t)&v2 - v4;
  uint64_t v6 = _os_log_pack_fill((char *)&v2 - v4, v10, 0LL, &_mh_execute_header, "%@");
  __os_log_helper_1_2_1_8_64(v6, (uint64_t)v11[0]);
  _LPLogPack(3, v7);
  id v3 = 0LL;
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&location, v3);
}

uint64_t __os_log_helper_1_2_2_8_32_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id _LPLogObject()
{
  predicate = (dispatch_once_t *)&_LPLogObject_onceToken;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &__block_literal_global_7);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)_LPLogObject_obj;
}

void _LPLogPack(int a1, uint64_t a2)
{
  if (sLogLevel >= a1)
  {
    id v3 = _LPLogObject();
    unint64_t v4 = (char *)os_log_pack_compose(a2);

    if ((sLogToStandardOut & 1) != 0) {
      fprintf(__stdoutp, "%s\n", v4);
    }
    if ((sLogToOSLog & 1) != 0)
    {
      id v2 = _LPLogObject();
      os_log_pack_send(a2);
    }

    if ((sLogToConsole & 1) != 0) {
      dprintf(sConsoleFD, "%s\n", v4);
    }
    free(v4);
  }

uint64_t __os_log_helper_1_2_4_8_32_8_64_4_0_8_32(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 2_Block_object_dispose(va, 8) = 32;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_1_3_4_8_32_8_32_8_33_8_65( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)id result = 3;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 33;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 65;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_4_0_8_32(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose(va, 8) = 32;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_1_2_3_8_32_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)id result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

LABEL_10:
  unint64_t v4 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v15, 0LL);
  return v4;
}

  return v12;
}

  unint64_t v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    unint64_t v13 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 32);
  id v3 = (id *)(a1 + 32);
  *id v3 = 0LL;
  objc_storeStrong(v3, v2);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

uint64_t UMEventCleanupNVRAMInternal(uint64_t a1, unint64_t a2, _BYTE *a3, CFTypeRef *a4)
{
  if (a2)
  {
    unint64_t v6 = 0LL;
    CFErrorRef v7 = 0LL;
    char v8 = 0;
    unsigned int v9 = 1;
    char v10 = 1;
    do
    {
      char v22 = 0;
      char v16 = msu_delete_nvram_variable_if_exists(*(const __CFString **)(a1 + 8 * v6), &v22);
      if ((v16 & 1) == 0 && (v10 & 1) != 0)
      {
        logfunction("", 1, @"clearing NVRAM variable failed\n", v11, v12, v13, v14, v15, v19);
        CFErrorRef v7 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainMach, 5LL, 0LL);
        char v10 = 0;
      }

      if (v22) {
        char v17 = v16;
      }
      else {
        char v17 = 0;
      }
      v8 |= v17;
      unint64_t v6 = v9++;
    }

    while (v6 < a2);
  }

  else
  {
    char v8 = 0;
    CFErrorRef v7 = 0LL;
    char v10 = 1;
  }

  if (a3) {
    *a3 = v8 & 1;
  }
  if (v7)
  {
    if (a4) {
      *a4 = CFRetain(v7);
    }
    CFRelease(v7);
  }

  return v10 & 1;
}

uint64_t UMEventCleanupAllNVRAM(int a1, void *a2)
{
  unsigned __int8 v23 = 0;
  CFTypeRef cf = 0LL;
  int v4 = UMEventCleanupNVRAMInternal((uint64_t)off_100061768, 0x1EuLL, &v23, &cf);
  unsigned __int8 v21 = 0;
  id v20 = 0LL;
  unsigned int v10 = -[UMEventCheckpoint cleanupCheckpointsNvramReturnDirty:error:]( +[UMEventCheckpoint sharedInstance](&OBJC_CLASS___UMEventCheckpoint, "sharedInstance"),  "cleanupCheckpointsNvramReturnDirty:error:",  &v21,  &v20);
  if (a1 && v23 | v21)
  {
    logfunction("", 1, @"Force syncing NVRAM because values were cleaned up\n", v5, v6, v7, v8, v9, (char)v20);
    msu_sync_nvram(1, v11, v12, v13, v14, v15, v16, v17);
  }

  if (a2)
  {
    if (cf)
    {
      CFTypeRef v18 = CFRetain(cf);
    }

    else
    {
      if (!v20) {
        return v4 & v10;
      }
      CFTypeRef v18 = v20;
    }

    *a2 = v18;
  }

  if (cf) {
    CFRelease(cf);
  }
  if (v20) {

  }
  return v4 & v10;
}

uint64_t _longFromNVRAMVar(NSString *a1)
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(a1, v2) & 1) != 0)
  {
    a1 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a1, 4LL);
  }

  else
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(a1, v3) & 1) == 0) {
      return 0LL;
    }
  }

  if (a1) {
    return -[NSString longLongValue](a1, "longLongValue");
  }
  return 0LL;
}

void __copy_helper_block_e8_32o(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32o(uint64_t a1)
{
}

void _log( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a2, &a9);
  logfunction("", 1, @"%@\n", v10, v11, v12, v13, v14, (char)v9);
}

LABEL_45:
  _log( (uint64_t)v45,  (uint64_t)@"[%s] (%@) - %@\n",  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)"-[UMEventRecorder _recordEvent:getPowerLog:information:callback:]");
  -[UMEventRecorder _saveEvent:](self, "_saveEvent:", v17);
  if (a6) {
    (*((void (**)(id, void *))a6 + 2))(a6, v17);
  }
}

      ssize_t v55 = *(_DWORD *)(a1 + 1480);
      if (!v55)
      {
        ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"checkpoint_nvram_remove_lost");
        ssize_t v55 = *(_DWORD *)(a1 + 1480);
      }

      *(_DWORD *)(a1 + 1480) = v55 + 1;
LABEL_48:
      posix_spawnattr_t v56 = 24LL;
      if (!*(_BYTE *)(a1 + 104)) {
        posix_spawnattr_t v56 = 12LL;
      }
      if (((0x1001100uLL >> v56) & 1) == 0) {
        goto LABEL_63;
      }
      posix_spawn_file_actions_t v57 = a1 + 16 * v56;
      pid_t v58 = *(void *)(v57 + 1496);
      if (!v58) {
        goto LABEL_63;
      }
      unsigned int v59 = *((_DWORD *)v17 + 14) | 0x11030000;
      if (*(_DWORD *)v58 == v59)
      {
        uint64_t v60 = 0LL;
LABEL_57:
        unint64_t v63 = (void *)(v58 + 16 * v60);
        int32x4_t v64 = (void *)v63[1];
        if (v64) {
          free(v64);
        }
        *unint64_t v63 = 0LL;
        v63[1] = 0LL;
        if (v60 <= 6)
        {
          uint64_t v65 = 16 * v60;
          do
          {
            *(_OWORD *)(v58 + v65) = *(_OWORD *)(v58 + v65 + 16);
            v65 += 16LL;
          }

          while (v65 != 112);
        }

        *(void *)(v58 + 112) = 0LL;
        *(void *)(v58 + 120) = 0LL;
        *(_BYTE *)(v57 + 1492) = 1;
      }

      else
      {
        uint64_t v60 = 0LL;
        unint64_t v61 = (int *)(v58 + 16);
        while (v60 != 7)
        {
          ++v60;
          BOOL v62 = *v61;
          v61 += 4;
          if (v62 == v59) {
            goto LABEL_57;
          }
        }

void __copy_helper_block_e8_32o40o(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32o40o(uint64_t a1)
{
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
}

void __copy_helper_block_e8_32o40o48o56o64o72o80b(uint64_t a1, const void **a2)
{
}

void __destroy_helper_block_e8_32o40o48o56o64o72o80b(const void **a1)
{
}

void __copy_helper_block_e8_32o40o48o56o64b(uint64_t a1, const void **a2)
{
}

void __destroy_helper_block_e8_32o40o48o56o64b(const void **a1)
{
}

void __copy_helper_block_e8_32o40o48o(uint64_t a1, const void **a2)
{
}

void __destroy_helper_block_e8_32o40o48o(const void **a1)
{
}

uint64_t AMRestorePartitionFWCopyTagData( const __CFURL *a1, const __CFString *a2, CFTypeRef *a3, off_t *a4, CFTypeRef *a5, off_t *a6)
{
  uint64_t v34 = a1;
  CFStringRef v33 = a2;
  uint64_t v32 = a3;
  removefile_state_t v31 = a4;
  uint64_t v30 = a5;
  uint64_t v29 = a6;
  unsigned int v28 = 99;
  CFStringRef theString2 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v24 = 0LL;
  CFIndex v25 = 0LL;
  int v23 = -1;
  size_t v22 = 0LL;
  bzero(v35, 0x1C8uLL);
  int v21 = 0;
  id v20 = 0LL;
  bytes = 0LL;
  int v18 = -1;
  off_t v17 = -1LL;
  off_t v16 = 0LL;
  off_t v15 = 0LL;
  char v14 = 0;
  if (v34)
  {
    int v18 = _AMRestorePartitionOpenFileWithURL(v34, 0);
    if (v18)
    {
      size_t __size = 0x8000LL;
      id v20 = malloc(0x8000uLL);
      if (v20)
      {
        CFIndex length = 0LL;
        while (1)
        {
          CFIndex length = read(v18, v20, __size);
          if (!length) {
            break;
          }
          uint64_t v24 = v20;
          CFIndex v25 = length;
          size_t v22 = 0LL;
          int v23 = Img4DecodeParseLengthFromBuffer(v20, length, &v22);
          if (v23 || !v22)
          {
            AMSupportLogInternal(6LL, "AMRestorePartitionFWCopyTagData", "No more segments. (derstat=%d)", v23);
            break;
          }

          ++v21;
          bytes = (UInt8 *)malloc(v22);
          if (!bytes)
          {
            fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "IMG4buffer",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  115,  0LL);
            AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "failed to allocate IMG4buffer");
            goto LABEL_55;
          }

          off_t v17 = lseek(v18, v16, 0);
          if (v17 != v16)
          {
            fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "fstatus == filePos",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  118,  0LL);
            uint64_t v6 = __error();
            AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Unable to rewind to start of IMG4 segment lseek=%ll, errno=%d.",  v17,  *v6);
            goto LABEL_55;
          }

          CFIndex length = read(v18, bytes, v22);
          if (!length)
          {
            fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "bytesRead > 0",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  122,  0LL);
            uint64_t v7 = __error();
            AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "0 bytes read, IMG4 image hit end of block device? - fail errno=%d..",  *v7);
            goto LABEL_55;
          }

          if (length != v22)
          {
            fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "bytesRead == derLen",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  123,  0LL);
            AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Bytes read didn't match derLen.");
            goto LABEL_55;
          }

          uint64_t v24 = bytes;
          CFIndex v25 = length;
          int v23 = Img4DecodeInit(bytes, v22, v35);
          if (v23)
          {
            AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Item %02d, der.length=%8d, Bad Img4 inside valid DER sequence. (derstat=%d)",  v21,  v25,  v23);
          }

          else
          {
            AMSupportSafeRelease(theString2);
            CFStringRef theString2 = CFStringCreateWithBytes(kCFAllocatorDefault, v36, v37, 0x8000100u, 0);
            AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Item %02d, offset=%8d, der.length=%8d, img4Tag=[%@]",  v21,  v16,  v25,  theString2);
            if (v33 && CFStringCompare(v33, theString2, 0LL) == kCFCompareEqualTo)
            {
              AMSupportLogInternal( 6LL,  "AMRestorePartitionFWCopyTagData",  "   ^^ Found requested tag.",  v21,  v25,  theString2);
              if (v30)
              {
                if (!cf)
                {
                  CFTypeRef cf = CFDataCreate(kCFAllocatorDefault, bytes, length);
                  if (!cf)
                  {
                    fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "Img4Data",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  142,  0LL);
                    AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Failed to allocate Img4Data");
                    goto LABEL_55;
                  }
                }
              }

              off_t v15 = v16;
              char v14 = 1;
            }
          }

          v16 += v22;
          AMSupportSafeFree(bytes);
          bytes = 0LL;
        }

        if (v21 > 0)
        {
          if (v21 <= 32)
          {
            off_t v17 = lseek(v18, v16, 0);
            if (v17 == v16)
            {
              __int16 v11 = -1;
              CFIndex length = read(v18, &v11, 2uLL);
              if (length == 2)
              {
                BOOL v10 = 0;
                if (!(_BYTE)v11) {
                  BOOL v10 = HIBYTE(v11) == 0;
                }
                if (!v10)
                {
                  fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "(terminator[0]==0) && (terminator[1]==0)",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  173,  0LL);
                  AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Invalid termination bytes: [0x%02x, 0x%02x]",  v11,  HIBYTE(v11));
                }

                else
                {
                  unsigned int v28 = 0;
                  if (v33 && (v14 & 1) == 0) {
                    unsigned int v28 = 8;
                  }
                  if (v29) {
                    *uint64_t v29 = v16;
                  }
                  if (v31) {
                    *removefile_state_t v31 = v15;
                  }
                  if (v32 && theString2) {
                    *uint64_t v32 = CFRetain(theString2);
                  }
                  if (v30 && cf) {
                    *uint64_t v30 = CFRetain(cf);
                  }
                }
              }

              else
              {
                fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "bytesRead == 2",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  170,  0LL);
                AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Failed to read terminator bytes.");
              }
            }

            else
            {
              fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "fstatus == filePos",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  167,  0LL);
              uint64_t v8 = __error();
              AMSupportLogInternal( 3LL,  "AMRestorePartitionFWCopyTagData",  "Unable to seek to terminator segment errno=%d.",  *v8);
            }
          }

          else
          {
            fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "DERcount <= kAMRestorePartitionFWMaxSegments",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  163,  0LL);
            AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Too Many DER segments!");
          }
        }

        else
        {
          fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "DERcount > 0",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  161,  0LL);
          AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "No DER segments found.");
        }
      }

      else
      {
        fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "DERbuffer",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  87,  0LL);
        AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "failed to allocate DER chunk buffer");
      }
    }

    else
    {
      fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "file",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  79,  0LL);
      AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "Unable to open inURL %@", v34);
    }
  }

  else
  {
    fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "inURL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  75,  0LL);
    AMSupportLogInternal(3LL, "AMRestorePartitionFWCopyTagData", "inURL is NULL");
  }

LABEL_55:
  if (v18 > 0) {
    close(v18);
  }
  AMSupportSafeFree(v20);
  AMSupportSafeFree(bytes);
  AMSupportSafeRelease(theString2);
  AMSupportSafeRelease(cf);
  return v28;
}

uint64_t _AMRestorePartitionOpenFileWithURL(const __CFURL *a1, int a2)
{
  int v5 = -1;
  bzero(v8, 0x400uLL);
  if (CFURLGetFileSystemRepresentation(a1, 1u, (UInt8 *)v8, 1024LL))
  {
    int v5 = open(v8, a2);
    if (v5 > 0)
    {
      if (fcntl(v5, 48, 1LL))
      {
        fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "fcntl(fp, 48, 1) == 0",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  50,  0LL);
        int v5 = -1;
        AMSupportLogInternal(3LL, "_AMRestorePartitionOpenFileWithURL", "Unable to set F_NOCACHE on firmware storage");
      }
    }

    else
    {
      fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "fp > 0",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/libusbrestore/AMRestorePartition.c",  48,  0LL);
      uint64_t v2 = __error();
      uint64_t v3 = strerror(*v2);
      AMSupportLogInternal(3LL, "_AMRestorePartitionOpenFileWithURL", "open() returned %d, %s", v5, v3);
    }
  }

  else
  {
    AMSupportLogInternal( 3LL,  "_AMRestorePartitionOpenFileWithURL",  "failed to convert url to file system representation");
    AMSupportLogInternal(7LL, "_AMRestorePartitionOpenFileWithURL", "%@", a1);
  }

  return v5;
}

void *set_partition_logging_function(void *result)
{
  _loggingPtr = result;
  return result;
}

void *set_partition_execution_logging_function(void *result)
{
  _executionLoggingPtr = result;
  return result;
}

void *set_partition_execution_function(void *result)
{
  _executeCommandPtr = result;
  return result;
}

uint64_t _partition_log( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_loggingPtr) {
    return _loggingPtr(result, &a9);
  }
  return result;
}

uint64_t create_update_partition_folder_hierarchy( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = a1;
  unsigned int v26 = 0;
  if (a1)
  {
    _partition_log( (uint64_t)"%s: Creating folder hierarchy for update partition",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"create_update_partition_folder_hierarchy");
    for (int i = 0; (unint64_t)i < 3; ++i)
    {
      uint64_t v14 = 3LL * i;
      __int128 v23 = *(_OWORD *)&(&UPDATE_DIR_LIST)[v14];
      uint64_t v24 = (&UPDATE_DIR_LIST)[v14 + 2];
      create_folder_at_mount_point_for_dir_list_entry((uint64_t)&v23, v27);
    }

    create_hardware_folder_hierarchy_at_mount_point(v27, 1LL, v8, v9, v10, v11, v12, v13);
    _partition_log( (uint64_t)"%s: Done creating folder hierarchy for update partition",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)"create_update_partition_folder_hierarchy");
  }

  else
  {
    _partition_log( (uint64_t)"%s: Invalid mount point passed",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"create_update_partition_folder_hierarchy");
    return 1;
  }

  return v26;
}

uint64_t create_folder_at_mount_point_for_dir_list_entry(uint64_t a1, const char *a2)
{
  uint64_t v47 = a1;
  int8x16_t v46 = a2;
  uint64_t v45 = 0LL;
  unsigned __int8 v44 = 1;
  asprintf(&v45, "%s/%s", a2, *(const char **)a1);
  if (v45)
  {
    if (mkdir(v45, *(_WORD *)(a1 + 8)) && *__error() != 17)
    {
      uint64_t v38 = v45;
      __error();
      _partition_log((uint64_t)"failed to mkdir %s with errno=%d", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v38);
      unsigned __int8 v44 = 0;
    }

    else
    {
      if (chmod(v45, *(_WORD *)(a1 + 8)))
      {
        BOOL v41 = v45;
        __error();
        _partition_log((uint64_t)"Failed to chmod %s 0%o with errno=%d", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v41);
        unsigned __int8 v44 = 0;
      }

      *__error() = 0;
      uint64_t v43 = getpwnam(*(const char **)(a1 + 16));
      if (v43)
      {
        if (chown(v45, v43->pw_uid, v43->pw_gid))
        {
          uint64_t v40 = v45;
          __error();
          _partition_log( (uint64_t)"failed to chown %s %d:%d with errno=%d",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v40);
          unsigned __int8 v44 = 0;
        }
      }

      else
      {
        uint64_t v39 = *(void *)(a1 + 16);
        __error();
        _partition_log((uint64_t)"failed to getpwnam for %s with errno=%d", v23, v24, v25, v26, v27, v28, v29, v39);
        unsigned __int8 v44 = 0;
      }
    }

    free(v45);
  }

  else
  {
    _partition_log((uint64_t)"failed to allocate path string for %s/%s", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v46);
    return 0;
  }

  return v44;
}

uint64_t create_hardware_folder_hierarchy_at_mount_point( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a1;
  char v42 = a2;
  unsigned int v41 = 0;
  if (a1)
  {
    _partition_log((uint64_t)"Creating hardware folder hierarchy\n", a2, a3, a4, a5, a6, a7, a8, v31);
    bzero(v44, 0x400uLL);
    if (v42)
    {
      _partition_log((uint64_t)"Creating root folder", v8, v9, v10, v11, v12, v13, v14, v32);
      char folder_at_mount_point_for_dir_list_entry = 0;
      __int128 v38 = HARDWARE_DIR_LIST;
      uint64_t v39 = off_1000745D8[0];
      char folder_at_mount_point_for_dir_list_entry = create_folder_at_mount_point_for_dir_list_entry((uint64_t)&v38, v43);
      if (!folder_at_mount_point_for_dir_list_entry)
      {
        _partition_log( (uint64_t)"Failed to create root hardware folder %s under %s",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  HARDWARE_DIR_LIST);
        return -1;
      }

      _partition_log( (uint64_t)"Successfully created root Hardware folder. Proceeding to create the rest of the folder hierarchy",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v33);
      __snprintf_chk(v44, 0x3FFuLL, 0, 0x400uLL, "%s/%s", v43, HARDWARE_DIR_LIST);
    }

    else
    {
      _partition_log((uint64_t)"Skipping creation of root folder.\n", v8, v9, v10, v11, v12, v13, v14, v32);
      __snprintf_chk(v44, 0x3FFuLL, 0, 0x400uLL, "%s", v43);
    }

    for (int i = 1; (unint64_t)i < 2; ++i)
    {
      char v36 = 0;
      uint64_t v22 = 24LL * i;
      __int128 v34 = *(_OWORD *)((char *)&HARDWARE_DIR_LIST + v22);
      uint64_t v35 = *(void *)((char *)&HARDWARE_DIR_LIST + v22 + 16);
      char v36 = create_folder_at_mount_point_for_dir_list_entry((uint64_t)&v34, v44);
      if (v36)
      {
        _partition_log( (uint64_t)"Successfully created %s under %s with permissions 0%o for user %s",  v23,  v24,  v25,  v26,  v27,  v28,  v29,  *((void *)&HARDWARE_DIR_LIST + 3 * i));
      }

      else
      {
        _partition_log( (uint64_t)"Failed to create %s under %s with permissions 0%o for user %s",  v23,  v24,  v25,  v26,  v27,  v28,  v29,  *((void *)&HARDWARE_DIR_LIST + 3 * i));
        unsigned int v41 = -1;
      }
    }
  }

  else
  {
    _partition_log( (uint64_t)"Invalid mountPoint passed to %s",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"create_hardware_folder_hierarchy_at_mount_point");
    return -1;
  }

  return v41;
}

uint64_t init_update_partition_with_reserve_and_reformat( unint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v130 = a1;
  uint64_t v129 = a2;
  char v128 = a3 & 1;
  int allocated_empty_file = 0;
  uint64_t v126 = off_100074698;
  char v125 = 1;
  if ((a3 & 1) != 0) {
    a1 = _unmount_filesystem(v129);
  }
  if (!partition_probe_media(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8))
  {
    _partition_log((uint64_t)"media probe failed probe the media", v8, v9, v10, v11, v12, v13, v14, v118);
    return 1;
  }

  if ((is_device_formatted_for_apfs() & 1) != 0)
  {
    uint64_t v126 = &apfs_container_device_node_path;
    if (update_device_node_path)
    {
      if ((v128 & 1) != 0)
      {
        int allocated_empty_file = delete_apfs_partition(5u, 0LL, v16, v17, v18, v19, v20, v21);
        if (allocated_empty_file)
        {
          _partition_log((uint64_t)"failed to delete update filesystem", v22, v23, v24, v25, v26, v27, v28, v118);
          return 1;
        }

        _partition_log((uint64_t)"delete update filesystem succeeded", v22, v23, v24, v25, v26, v27, v28, v118);
      }

      else
      {
        _partition_log((uint64_t)"not deleting existing update filesystem", v15, v16, v17, v18, v19, v20, v21, v118);
        char v125 = 0;
      }
    }
  }

  else if (!*off_100074698)
  {
LABEL_13:
    _partition_log((uint64_t)"media probe failed to find update partition", v15, v16, v17, v18, v19, v20, v21, v118);
    return 1;
  }

  if ((v125 & 1) != 0)
  {
    int v121 = off_1000746A8;
    char v29 = is_device_formatted_for_apfs();
    int allocated_empty_file = format_partition((uint64_t)v126, v121, 0LL, 0, 0, v29 & 1);
    if (allocated_empty_file)
    {
      _partition_log((uint64_t)"formatting update partition failed", v30, v31, v32, v33, v34, v35, v36, v118);
      return 1;
    }

    uint64_t v37 = is_device_formatted_for_apfs();
  }

  bzero(&v133, 0x878uLL);
  if (statfs(v129, &v133))
  {
    _partition_log( (uint64_t)"statfs-ing %s failed - creating new mount point",  v45,  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)v129);
    mkdir(v129, 0x1C0u);
  }

  __s2 = realpath_DARWIN_EXTSN(v129, 0LL);
  if (__s2)
  {
    BOOL v123 = strcmp(v133.f_mntonname, __s2) == 0;
    free(__s2);
    if (v123 || !_mount_filesystem(off_100074698, v129))
    {
      if (create_update_partition_folder_hierarchy(v129, v60, v61, v62, v63, v64, v65, v66)) {
        _partition_log( (uint64_t)"Failed to create folder hierarchy on update volume",  v67,  v68,  v69,  v70,  v71,  v72,  v73,  v118);
      }
      if ((is_device_formatted_for_apfs() & 1) != 0)
      {
        bzero(v132, 0x400uLL);
        v132[0] = 0;
        __strlcat_chk(v132, v129, 1024LL);
        __strlcat_chk(v132, "/.reserved", 1024LL);
        if (v130)
        {
          _partition_log( (uint64_t)"creating %lld MB reserve file at %s",  v74,  v75,  v76,  v77,  v78,  v79,  v80,  v130 / 0x100000);
          int allocated_empty_file = create_allocated_empty_file(v130, v132);
          if (allocated_empty_file == 28)
          {
            int v122 = 3;
            if (fsctl(v129, 0x80044101uLL, &v122, 0))
            {
              uint64_t v120 = v129;
              uint64_t v102 = __error();
              strerror(*v102);
              _partition_log( (uint64_t)"first preallocation attempt failed, and full sync of volume %s failed: %s",  v103,  v104,  v105,  v106,  v107,  v108,  v109,  (uint64_t)v120);
            }

            else
            {
              _partition_log( (uint64_t)"first preallocation attempt failed, but full sync of volume %s was successful",  v88,  v89,  v90,  v91,  v92,  v93,  v94,  (uint64_t)v129);
            }

            _partition_log((uint64_t)"re-trying reserve file creation", v95, v96, v97, v98, v99, v100, v101, v119);
            int allocated_empty_file = create_allocated_empty_file(v130, v132);
          }

          if (allocated_empty_file)
          {
            _partition_log( (uint64_t)"reserving %llu bytes failed with errno=%d",  v81,  v82,  v83,  v84,  v85,  v86,  v87,  v130);
            return 1;
          }
        }

        else if (!unlink(v132))
        {
          _partition_log((uint64_t)"existing reserved file deleted", v110, v111, v112, v113, v114, v115, v116, v118);
        }
      }

      return 0;
    }

    _partition_log((uint64_t)"mounting update partition filesystem failed", v60, v61, v62, v63, v64, v65, v66, v118);
    return 1;
  }

  else
  {
    uint64_t v52 = __error();
    strerror(*v52);
    _partition_log((uint64_t)"Could not realpath(3) path %s: %s", v53, v54, v55, v56, v57, v58, v59, (uint64_t)v129);
    return 1;
  }

uint64_t _unmount_filesystem(const char *a1)
{
  unsigned int v41 = 1;
  __s2 = 0LL;
  bzero(&v45, 0x878uLL);
  if (statfs(a1, &v45))
  {
    uint64_t v1 = __error();
    strerror(*v1);
    _partition_log((uint64_t)"statfs %s failed: %s", v2, v3, v4, v5, v6, v7, v8, (uint64_t)a1);
  }

  else
  {
    __s2 = realpath_DARWIN_EXTSN(a1, 0LL);
    if (!__s2)
    {
      __error();
      uint64_t v9 = __error();
      strerror(*v9);
      _partition_log((uint64_t)"realpath %s failed: %d %s", v10, v11, v12, v13, v14, v15, v16, (uint64_t)a1);
    }

    if (!strcmp(v45.f_mntonname, __s2))
    {
      unsigned int v41 = unmount(__s2, 0x80000);
      if (!v41) {
        goto LABEL_12;
      }
      if (*__error() == 1)
      {
        v43[0] = "/sbin/umount";
        v43[1] = "-f";
        __int128 v44 = (unint64_t)__s2;
        unsigned int v41 = _execute_command((uint64_t)v43);
      }

      if (v41)
      {
        __error();
        uint64_t v31 = __error();
        strerror(*v31);
        _partition_log((uint64_t)"error unmounting '%s': %d %s", v32, v33, v34, v35, v36, v37, v38, (uint64_t)a1);
        debugMounts();
      }

      else
      {
LABEL_12:
        _partition_log( (uint64_t)"file system at %s successfully unmounted",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (uint64_t)a1);
      }
    }

    else
    {
      _partition_log((uint64_t)"no file system mounted at %s", v17, v18, v19, v20, v21, v22, v23, (uint64_t)a1);
      unsigned int v41 = 0;
    }
  }

  if (__s2) {
    free(__s2);
  }
  return v41;
}

uint64_t partition_probe_media( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v11 = 0;
  unsigned __int8 should_retry = 1;
  for (int i = 0; i < 3; ++i)
  {
    unsigned __int8 should_retry = _partition_probe_media_should_retry(&v11, a2, a3, a4, a5, a6, a7, a8);
    if (should_retry == 1 || !should_retry && !v11) {
      break;
    }
  }

  return should_retry;
}

uint64_t is_device_formatted_for_apfs()
{
  return using_APFS & 1;
}

uint64_t delete_apfs_partition( unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = _partition_log((uint64_t)"entering %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)"delete_apfs_partition");
  if (partition_probe_media(v8, v9, v10, v11, v12, v13, v14, v15))
  {
    if (a2) {
      _unmount_filesystem(a2);
    }
    if (a1 <= 7uLL) {
      __asm { BR              X8 }
    }

    _partition_log( (uint64_t)"%s : Deleting partition at slice %d is not allowed as path is NULL\n",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"delete_apfs_partition");
  }

  else
  {
    _partition_log( (uint64_t)"%s : partition_probe_media() failed for partition at index %u, mountpoint %s\n",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"delete_apfs_partition");
  }

  return 1LL;
}

uint64_t format_partition(uint64_t a1, const char *a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)uint64_t v38 = 0LL;
  char v31 = 48;
  if (a6)
  {
    int v26 = 1;
    __b[0] = (uint64_t)"/sbin/newfs_apfs";
    if (!strcmp(a2, "System"))
    {
      char v31 = 115;
    }

    else if (!strcmp(a2, "Data"))
    {
      char v31 = 100;
    }

    else if (!strcmp(a2, "User"))
    {
      char v31 = 117;
    }

    else if (!strcmp(a2, "Preboot"))
    {
      char v31 = 98;
    }

    else if (!strcmp(a2, "Baseband Data"))
    {
      char v31 = 97;
    }

    else if (!strcmp(a2, "Logs"))
    {
      char v31 = 105;
    }

    else if (!strcmp(a2, "xART"))
    {
      char v31 = 120;
    }

    else if (!strcmp(a2, "Scratch"))
    {
      char v31 = 110;
    }

    else if (!strcmp(a2, "Hardware"))
    {
      char v31 = 104;
    }

    else if (!strcmp(a2, "Update"))
    {
      char v31 = 112;
    }

    else if (!strcmp(a2, "Recovery"))
    {
      char v31 = 114;
    }

    if (v31 != 48)
    {
      __b[1] = (uint64_t)"-o";
      __snprintf_chk(v38, 8uLL, 0, 8uLL, "role=%c", v31);
      int v26 = 3;
      __b[2] = (uint64_t)v38;
    }

    uint64_t v13 = v26;
    int v27 = v26 + 1;
    __b[v13] = (uint64_t)"-A";
  }

  else
  {
    __b[0] = (uint64_t)"/sbin/newfs_hfs";
    int v27 = 2;
    __b[1] = (uint64_t)"-s";
    if (a4)
    {
      int v27 = 3;
      __b[2] = (uint64_t)"-J";
    }
  }

  uint64_t v14 = v27;
  int v28 = v27 + 1;
  __b[v14] = (uint64_t)"-v";
  uint64_t v15 = v28;
  int v29 = v28 + 1;
  __b[v15] = (uint64_t)a2;
  if (a5 == 1)
  {
    uint64_t v16 = v29++;
    __b[v16] = (uint64_t)"-P";
  }

  __b[v29] = a1;
  __b[v29 + 1] = 0LL;
  for (int i = 0; __b[i]; ++i)
    _partition_log((uint64_t)"%s ", v6, v7, v8, v9, v10, v11, v12, __b[i]);
  _partition_log((uint64_t)"\n", v6, v7, v8, v9, v10, v11, v12, v25);
  unsigned int v32 = _execute_command((uint64_t)__b);
  if (v32) {
    _partition_log((uint64_t)"%s returned %d", v17, v18, v19, v20, v21, v22, v23, __b[0]);
  }
  return v32;
}

uint64_t _mount_filesystem(const char *a1, const char *a2)
{
  uint64_t v10 = "hfs";
  __b[0] = "/sbin/mount";
  __b[1] = "-t";
  __b[2] = v10;
  __b[3] = "-o";
  __b[4] = "nobrowse";
  __b[5] = a1;
  __b[6] = a2;
  __b[7] = 0LL;
  mkdir(a2, 0x1C0u);
  unsigned int v11 = _execute_command((uint64_t)__b);
  if (v11) {
    _partition_log((uint64_t)"mounting %s at %s failed: %d", v2, v3, v4, v5, v6, v7, v8, (uint64_t)a1);
  }
  return v11;
}

uint64_t create_allocated_empty_file(uint64_t a1, const char *a2)
{
  uint64_t v44 = a1;
  uint64_t v43 = a2;
  unsigned int v42 = 1;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  unlink(a2);
  int v39 = open(v43, 2562, 384LL);
  if (v39 == -1)
  {
    unsigned int v42 = *__error();
    _partition_log((uint64_t)"Could not open %s with error %d", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v43);
  }

  else
  {
    __int128 v40 = 0x30000000CuLL;
    *(void *)&__int128 v41 = v44;
    if (fcntl(v39, 42, &v40) == -1)
    {
      unsigned int v42 = *__error();
      _partition_log((uint64_t)"preallocation of %llu bytes failed: %d", v16, v17, v18, v19, v20, v21, v22, v44);
    }

    else if (*((uint64_t *)&v41 + 1) >= v44)
    {
      if (ftruncate(v39, v44) == -1)
      {
        unsigned int v42 = *__error();
        _partition_log( (uint64_t)"failed to write to %s file to establish the size (%d).",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)v43);
      }

      else
      {
        unsigned int v42 = 0;
      }
    }

    else
    {
      unsigned int v42 = 28;
      _partition_log( (uint64_t)"failed to allocate all %llu bytes for %s. only allocatedf %llu bytes",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v44);
      if (unlink(v43) == -1)
      {
        uint64_t v38 = v43;
        __error();
        _partition_log((uint64_t)"failed to unlink %s: %d", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v38);
      }
    }
  }

  if (v39 != -1) {
    close(v39);
  }
  return v42;
}

uint64_t mount_update_partition_if_exists( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v59 = a1;
  uint64_t v8 = _partition_log((uint64_t)"entering %s\n", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"mount_update_partition_if_exists");
  if (partition_probe_media(v8, v9, v10, v11, v12, v13, v14, v15))
  {
    if (update_device_node_path)
    {
      uint64_t v58 = 0LL;
      uint64_t v57 = realpath_DARWIN_EXTSN(v59, 0LL);
      if (v57)
      {
        int v55 = getmntinfo_r_np(&v58, 2);
        if (v55 > 0)
        {
          for (int i = 0; i < v55; ++i)
          {
            if (!strcmp(v58[i].f_mntfromname, &update_device_node_path))
            {
              if (!strcmp(v58[i].f_mntonname, v57))
              {
                _partition_log((uint64_t)"Update partition is already mounted\n", v37, v38, v39, v40, v41, v42, v43, v53);
                unsigned int v56 = 0;
                goto LABEL_20;
              }

              _partition_log( (uint64_t)"unmounting %s at %s",  v37,  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)v58[i].f_mntfromname);
              _unmount_filesystem(v58[i].f_mntonname);
              break;
            }
          }

          unsigned int v56 = _mount_filesystem(&update_device_node_path, v57);
          if (v56) {
            uint64_t v51 = "Failed to mount";
          }
          else {
            uint64_t v51 = "Successfully mounted";
          }
          _partition_log((uint64_t)"%s update partition at %s", v44, v45, v46, v47, v48, v49, v50, (uint64_t)v51);
        }

        else
        {
          _partition_log( (uint64_t)"Failed to get mount info for all mounted file systems",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v53);
          unsigned int v56 = *__error();
        }

LABEL_20:
        if (v58) {
          free(v58);
        }
        free(v57);
        return v56;
      }

      else
      {
        __error();
        _partition_log((uint64_t)"Failed to realpath(%s). errno=%d", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v59);
        return -1;
      }
    }

    else
    {
      _partition_log( (uint64_t)"%s : no device node found for update partition\n",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"mount_update_partition_if_exists");
      return -1;
    }
  }

  else
  {
    _partition_log( (uint64_t)"%s : partition_probe_media() failed.\n",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)"mount_update_partition_if_exists");
    return -1;
  }

      uint64_t v84 = -536870167;
      if (!v6) {
        return v84;
      }
      goto LABEL_21;
    }

    uint64_t v11 = [v6 objectAtIndex:0];
    uint64_t v12 = [v6 objectAtIndex:1];
    uint64_t v91 = 0LL;
    [v11 invalidate];
    iBU_LOG_real( (uint64_t)v7,  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)v11);
    [v12 invalidate];
    iBU_LOG_real( (uint64_t)v8,  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v19,  v20,  v21,  v22,  v23,  v24,  (uint64_t)v12);
    iBU_LOG_real( (uint64_t)v9,  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v25,  v26,  v27,  v28,  v29,  v30,  v86);
    [v11 setAsFirstGeneration];
    if (!-[IODualSPIWriter _writeFirmware:toHeader:withError:]( self,  "_writeFirmware:toHeader:withError:",  v4,  v11,  &v91)) {
      break;
    }
    uint64_t v37 = [v11 startLocation];
    iBU_LOG_real( (uint64_t)@"Failed to write firmware images to header0 at offset 0x%x. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)v37);
LABEL_13:
    -[IODualSPIWriter markHeaderAsInvalid:](self, "markHeaderAsInvalid:", v12);
    uint64_t v74 = v10 + 1;
    uint64_t v75 = v10 - 1;
    uint64_t v10 = (v10 + 1);
    if (v75 >= 0x1F)
    {
      uint64_t v76 = a4;
      if (a4)
      {
        uint64_t v77 = (v74 - 1);
        goto LABEL_18;
      }

      goto LABEL_20;
    }
  }

  uint64_t v44 = v9;
  uint64_t v45 = v8;
  uint64_t v46 = v7;
  iBU_LOG_real( (uint64_t)@"Erasing header1.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v31,  v32,  v33,  v34,  v35,  v36,  v87);
  uint64_t v47 = -[IODualSPIWriter eraseBytes:ofLength:withError:]( self,  "eraseBytes:ofLength:withError:",  [v12 startLocation],  objc_msgSend(v12, "length"),  &v91);
  uint64_t v48 = [v12 startLocation];
  if (v47)
  {
    iBU_LOG_real( (uint64_t)@"Failed to erase header1 at offset 0x%x. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v49,  v50,  v51,  v52,  v53,  v54,  (uint64_t)v48);
LABEL_12:
    uint64_t v7 = v46;
    uint64_t v8 = v45;
    uint64_t v9 = v44;
    uint64_t v4 = a3;
    goto LABEL_13;
  }

  iBU_LOG_real( (uint64_t)@"Successfully wrote header1 at offset 0x%x.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v49,  v50,  v51,  v52,  v53,  v54,  (uint64_t)v48);
  if (!-[IOServiceWriter shouldCommit](self, "shouldCommit")) {
    goto LABEL_24;
  }
  iBU_LOG_real( (uint64_t)@"Committing header0 to the first partition.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v55,  v56,  v57,  v58,  v59,  v60,  v88);
  uint64_t v61 = -[IODualSPIWriter _commitHeader:withError:](self, "_commitHeader:withError:", v11, &v91);
  uint64_t v62 = [v11 startLocation];
  if (v61)
  {
    iBU_LOG_real( (uint64_t)@"Failed to commit header0 at offset 0x%x to the first partition. Invalidating this header, then trying again with a different header.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v63,  v64,  v65,  v66,  v67,  v68,  (uint64_t)v62);
    uint64_t v12 = v11;
    goto LABEL_12;
  }

  iBU_LOG_real( (uint64_t)@"Successfully committed header0 at offset 0x%x.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v63,  v64,  v65,  v66,  v67,  v68,  (uint64_t)v62);
LABEL_24:
  iBU_LOG_real( (uint64_t)@"Successfully wrote firmware after %d retries.",  "-[IODualSPIWriter writeFirstGenerationFirmware:withError:]",  v55,  v56,  v57,  v58,  v59,  v60,  v10);
  uint64_t v84 = 0;
  if (v6) {
LABEL_21:
  }

  return v84;
}

  if (!*(_DWORD *)(a1 + 96)) {
    checkpoint_outcome_init(a1, v11, a3, a4, a5, a6, a7, a8);
  }
  return v11;
}

uint64_t enumerate_apfs_snapshots(char *a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v25 = a2;
  unsigned int v24 = 0;
  int v23 = open(a1, 0x100000);
  if (v23 >= 0)
  {
    memset(&v22, 0, sizeof(v22));
    bzero(v28, 0x400uLL);
    v22.bitmapcount = 5;
    v22.commonattr = -1610612735;
    int v21 = fs_snapshot_list(v23, &v22, v28, 0x400uLL, 0);
    if (v21 >= 0)
    {
      if (v21)
      {
        uint64_t v20 = (unsigned int *)v28;
        while (1)
        {
          int v16 = v21--;
          if (v16 <= 0) {
            break;
          }
          uint64_t v19 = v20;
          uint64_t v20 = (unsigned int *)((char *)v20 + *v20);
          uint64_t v18 = v19 + 6;
          unsigned int v24 = 0;
          if ((v19[1] & 0x20000000) != 0)
          {
            unsigned int v24 = *v18;
            _partition_log( (uint64_t)"%s : Error in reading attributes for directory entry %d",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"enumerate_apfs_snapshots");
            break;
          }

          if ((v19[1] & 1) != 0
            && ((*(uint64_t (**)(uint64_t, void, char *))(v25 + 16))( v25,  v23,  (char *)v18 + (int)*v18) & 1) == 0)
          {
            _partition_log( (uint64_t)"%s : caller cancelled on snapshot %s",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"enumerate_apfs_snapshots");
            break;
          }
        }

        close(v23);
        return v24;
      }

      else
      {
        _partition_log( (uint64_t)"%s : No snapshots to enumerate on %s",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"enumerate_apfs_snapshots");
        close(v23);
        return 0;
      }
    }

    else
    {
      _partition_log( (uint64_t)"%s : fs_snapshot_list failed with error %d",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"enumerate_apfs_snapshots");
      close(v23);
      return 1;
    }
  }

  else
  {
    unsigned int v24 = *__error();
    _partition_log( (uint64_t)"%s : Unable to open %s: %d",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (uint64_t)"enumerate_apfs_snapshots");
    return v24;
  }

BOOL is_storage_apfs( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

BOOL is_mountpoint_apfs(const char *a1)
{
  BOOL v10 = 0;
  if (a1)
  {
    BOOL v10 = 0;
    if (!statfs(a1, &v12)) {
      return strncmp(v12.f_fstypename, "apfs", 0x10uLL) == 0;
    }
  }

  return v10;
}

uint64_t _partition_wait_for_device( const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v87 = 0;
  io_object_t v86 = 0;
  io_registry_entry_t whole_child = 0;
  CFProperty = 0LL;
  _partition_log( (uint64_t)"entering %s: '%s'\n",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"_partition_wait_for_device");
  if (a1)
  {
    if (a2)
    {
      embedded_storage_service_query_dict = _partition_create_embedded_storage_service_query_dict(a1);
      if (embedded_storage_service_query_dict)
      {
        io_object_t v86 = _partition_wait_for_io_service_matching_dict(embedded_storage_service_query_dict, 0x1Eu);
        if (v86)
        {
          io_registry_entry_t whole_child = _partition_find_whole_child(v86);
          if (whole_child)
          {
            CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( whole_child,  @"BSD Name",  kCFAllocatorDefault,  0);
            if (CFProperty)
            {
              CFTypeID v81 = CFGetTypeID(CFProperty);
              if (v81 == CFStringGetTypeID())
              {
                __strlcpy_chk(a2, "/dev/", a3, -1LL);
                buffer = (char *)&a2[strlen(a2)];
                size_t v50 = strlen(a2);
                if (CFStringGetCString(CFProperty, buffer, a3 - v50, 0x8000100u))
                {
                  _partition_log( (uint64_t)"Using device path %s for %s\n",  v51,  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)a2);
                  int v82 = 10;
                  while (1)
                  {
                    BOOL v79 = 0;
                    if (!v87)
                    {
                      int v65 = v82--;
                      BOOL v79 = v65 > 0;
                    }

                    if (!v79) {
                      break;
                    }
                    if (access(a2, 0))
                    {
                      if (*__error() != 2)
                      {
                        uint64_t v66 = __error();
                        strerror(*v66);
                        _partition_log( (uint64_t)"stat error while waiting for device '%s': %s\n",  v67,  v68,  v69,  v70,  v71,  v72,  v73,  (uint64_t)a2);
                        break;
                      }

                      sleep(3u);
                    }

                    else
                    {
                      unsigned __int8 v87 = 1;
                    }
                  }

                  if (!v87) {
                    _partition_log((uint64_t)"timeout waiting for %s", v58, v59, v60, v61, v62, v63, v64, (uint64_t)a1);
                  }
                }

                else
                {
                  _partition_log( (uint64_t)"failed to create C string from BSD name",  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v75);
                }
              }

              else
              {
                _partition_log( (uint64_t)"returnbed BSD device name for service %s is wrong type",  v43,  v44,  v45,  v46,  v47,  v48,  v49,  (uint64_t)a1);
              }
            }

            else
            {
              _partition_log( (uint64_t)"no BSD device name for service %s",  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)a1);
            }
          }

          else
          {
            fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "service != IO_OBJECT_NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2885,  0LL);
          }
        }

        else
        {
          fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "root_service != IO_OBJECT_NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2882,  0LL);
          _partition_log((uint64_t)"failed to lookup IO service for %s", v29, v30, v31, v32, v33, v34, v35, (uint64_t)a1);
        }
      }

      else
      {
        fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "match_dict != NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2878,  0LL);
        _partition_log((uint64_t)"failed to allocate device lookup dict", v22, v23, v24, v25, v26, v27, v28, v78);
      }
    }

    else
    {
      fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "path != NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2874,  0LL);
      _partition_log((uint64_t)"path argument is NULL", v15, v16, v17, v18, v19, v20, v21, v77);
    }
  }

  else
  {
    fprintf( __stderrp,  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "service_type != NULL",  "",  "/Library/Caches/com.apple.xbs/Sources/PurpleRestore_libpartition/ramrod/partition.c",  2873,  0LL);
    _partition_log((uint64_t)"type argument is NULL", v8, v9, v10, v11, v12, v13, v14, v76);
  }

  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (whole_child) {
    IOObjectRelease(whole_child);
  }
  if (v86) {
    IOObjectRelease(v86);
  }
  return v87;
}

uint64_t _execute_command(uint64_t a1)
{
  return _execute_command_with_callback(a1, (uint64_t)_partition_execution_log, 0LL);
}

uint64_t mount_apfs_system_readwrite_with_revert( const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v95 = a1;
  uint64_t v94 = a2;
  int v93 = -1;
  int v92 = -1;
  uint64_t v91 = 0LL;
  partition_probe_media((uint64_t)a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  if (!system_device_node_path)
  {
    _partition_log((uint64_t)"system volume device node not found", v8, v9, v10, v11, v12, v13, v14, v87);
    return 2;
  }

  uint64_t v91 = &system_device_node_path;
  uint64_t v90 = 0LL;
  int v93 = getmntinfo_r_np(&v90, 2);
  if (v93 <= 0)
  {
    _partition_log( (uint64_t)"Failed to get mount info for all mounted file systems",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v87);
    int v93 = *__error();
    goto LABEL_26;
  }

  for (int i = 0; i < v93; ++i)
  {
    if (!strcmp(v90[i].f_mntfromname, v91))
    {
      _partition_log((uint64_t)"unmounting %s at %s", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v90[i].f_mntfromname);
      _unmount_filesystem(v90[i].f_mntonname);
      break;
    }
  }

  free(v90);
  int v93 = _mount_filesystem(v91, v95);
  if (v93)
  {
    _partition_log( (uint64_t)"system volume device node %s could not be mounted read/write at %s",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)v91);
    goto LABEL_26;
  }

  if (!is_mountpoint_apfs(v95))
  {
    _partition_log((uint64_t)"media is not apfs managed: unsupported operation", v36, v37, v38, v39, v40, v41, v42, v87);
    return 45;
  }

  if (!v94) {
    goto LABEL_25;
  }
  int v92 = open(v95, 0x100000);
  if (v92 < 0)
  {
    int v93 = *__error();
    _partition_log( (uint64_t)"%s : Unable to open %s: %d",  v43,  v44,  v45,  v46,  v47,  v48,  v49,  (uint64_t)"mount_apfs_system_readwrite_with_revert");
    goto LABEL_26;
  }

  int v93 = fs_snapshot_revert(v92, v94, 0);
  if (v93)
  {
    int v93 = *__error();
    uint64_t v88 = v93;
    strerror(v93);
    _partition_log((uint64_t)"revert snapshot operation failed: %d %s", v57, v58, v59, v60, v61, v62, v63, v88);
    goto LABEL_26;
  }

  _partition_log( (uint64_t)"reverting system volume to snapshot %s succeeded. remounting...",  v50,  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)v94);
  if (close(v92))
  {
    int v93 = *__error();
    strerror(v93);
    _partition_log( (uint64_t)"%s: Unable to close directory: %d %s\n",  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)"mount_apfs_system_readwrite_with_revert");
    goto LABEL_26;
  }

  int v92 = -1;
  int v93 = _unmount_filesystem(v95);
  if (v93)
  {
    _partition_log( (uint64_t)"system volume device node %s could not be unmounted from %s",  v71,  v72,  v73,  v74,  v75,  v76,  v77,  (uint64_t)v91);
    goto LABEL_26;
  }

  int v93 = _mount_filesystem(v91, v95);
  if (v93)
  {
    _partition_log( (uint64_t)"system volume device node %s could not be re-mounted read/write at %s",  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)v91);
  }

  else
  {
LABEL_25:
    _partition_log( (uint64_t)"mounting system volume read/write at %s succeeded.",  v36,  v37,  v38,  v39,  v40,  v41,  v42,  (uint64_t)v95);
    int v93 = 0;
  }

LABEL_26:
  if (v92 != -1 && close(v92))
  {
    __error();
    uint64_t v78 = __error();
    strerror(*v78);
    _partition_log( (uint64_t)"%s: Unable to close directory: %d %s\n",  v79,  v80,  v81,  v82,  v83,  v84,  v85,  (uint64_t)"mount_apfs_system_readwrite_with_revert");
  }

  return v93;
}

char *copy_rooted_snapshot_name()
{
  uint64_t v21 = 0LL;
  if (is_mountpoint_apfs("/"))
  {
    bzero(&v25, 0x878uLL);
    if (statfs("/", &v25))
    {
      _partition_log((uint64_t)"statfs of root failed", v7, v8, v9, v10, v11, v12, v13, v15);
      return 0LL;
    }

    else
    {
      size_t v20 = strlen(v25.f_mntfromname);
      size_t v19 = strlen(&system_device_node_path);
      if (v20 > v19 + 1
        && v25.f_mntfromname[v20 - v19 - 1] == 64
        && !strcmp(&v25.f_mntfromname[v20 - v19], &system_device_node_path))
      {
        asprintf(&v21, "%.*s", v20 - v19 - 1, v25.f_mntfromname);
      }

      if (!v21)
      {
        bsdName = v25.f_mntfromname;
        if (strnstr(v25.f_mntfromname, "/dev/", 5uLL) == v25.f_mntfromname) {
          bsdName = &v25.f_mntfromname[5];
        }
        matching = IOBSDNameMatching(kIOMasterPortDefault, 0, bsdName);
        io_service_t object = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
        if (object)
        {
          if (IOObjectConformsTo(object, "AppleAPFSSnapshot"))
          {
            bzero(v23, 0x120uLL);
            v23[0] = 0LL;
            if (!fsctl("/", 0xC1204A43uLL, v23, 0))
            {
              if (strlen(v24)) {
                uint64_t v21 = strdup(v24);
              }
            }
          }
        }

        IOObjectRelease(object);
      }

      return v21;
    }
  }

  else
  {
    _partition_log((uint64_t)"media is not apfs managed: unsupported operation", v0, v1, v2, v3, v4, v5, v6, v15);
    return 0LL;
  }

char *copy_root_snapshot_name_from_dt()
{
  uint64_t v26 = 0LL;
  io_registry_entry_t v28 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (v28)
  {
    CFTypeRef cf = IORegistryEntryCreateCFProperty(v28, @"root-snapshot-name", kCFAllocatorDefault, 0);
    if (cf)
    {
      CFTypeID v25 = CFGetTypeID(cf);
      if (v25 == CFDataGetTypeID())
      {
        __s1a = (char *)CFDataGetBytePtr((CFDataRef)cf);
        size_t Length = CFDataGetLength((CFDataRef)cf);
        uint64_t v26 = strndup(__s1a, Length);
      }

      else
      {
        _partition_log( (uint64_t)"device tree root-snapshot-name type mismatch",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)__s1);
      }
    }

    else
    {
      _partition_log( (uint64_t)"unable to look up root-snapshot-name on chosen node",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)__s1);
    }

    IOObjectRelease(v28);
    if (cf) {
      CFRelease(cf);
    }
    return v26;
  }

  else
  {
    _partition_log((uint64_t)"uanble to find chosen node", v0, v1, v2, v3, v4, v5, v6, (uint64_t)__s1);
    return 0LL;
  }

uint64_t _partition_probe_media_should_retry( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v102 = a1;
  unsigned __int8 v101 = 0;
  char v100 = 0;
  unsigned int CFProperties = 0;
  io_iterator_t iterator = 0;
  io_service_t service = 0;
  io_object_t object = 0;
  CFDictionaryRef matching = 0LL;
  CFTypeRef cf = 0LL;
  storage_device_node_path = 0;
  apfs_container_device_node_path = 0;
  system_device_node_path = 0;
  data_device_node_path = 0;
  user_device_node_path = 0;
  baseband_data_partition_device_node_path = 0;
  update_device_node_path = 0;
  scratch_device_node_path = 0;
  xart_device_node_path = 0;
  apfs_recovery_os_container_device_node_path = 0;
  recovery_os_volume_device_node_path = 0;
  preboot_partition_device_node_path = 0;
  iboot_system_container_device_node_path = 0;
  using_LwVM = 0;
  using_APFS = 0;
  if (_partition_wait_for_device( "EmbeddedDeviceTypeRoot",  &storage_device_node_path,  32LL,  a4,  a5,  a6,  a7,  a8))
  {
    int v93 = 0LL;
    _partition_log( (uint64_t)"entering %s.",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"_partition_probe_media_should_retry");
    CFDictionaryRef matching = IOBSDNameMatching(kIOMasterPortDefault, 0, &algn_100074CE1[4]);
    io_service_t service = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
    if (!service)
    {
      _partition_log( (uint64_t)"unable to find service for %s",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)&algn_100074CE1[4]);
      unsigned __int8 v101 = 1;
      goto LABEL_89;
    }

    IOServiceWaitQuiet(service, 0LL);
    unsigned int CFProperties = IORegistryEntryCreateIterator(service, "IOService", 1u, &iterator);
    if (CFProperties)
    {
      _partition_log( (uint64_t)"unable to create child iterator: 0c%.8x",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  CFProperties);
      goto LABEL_89;
    }

    while (1)
    {
      while (1)
      {
        io_object_t object = IOIteratorNext(iterator);
        if (!object)
        {
          unsigned __int8 v101 = 1;
          goto LABEL_89;
        }

        if (IOObjectConformsTo(object, "IOMedia")) {
          break;
        }
LABEL_85:
        if (object) {
          IOObjectRelease(object);
        }
      }

      memset(__b, 0, sizeof(__b));
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      IORegistryEntryGetName(object, __b);
      unsigned int CFProperties = IORegistryEntryCreateCFProperties(object, (CFMutableDictionaryRef *)&cf, kCFAllocatorDefault, 0);
      if (CFProperties)
      {
LABEL_12:
        _partition_log( (uint64_t)"unable to get properies for media registry entry: 0x%.8x",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  CFProperties);
        goto LABEL_89;
      }

      if (!v100)
      {
        CFTypeRef cf1 = CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
        if (cf1)
        {
          if (CFEqual(cf1, @"disk0s1s1")) {
            char v100 = 1;
          }
        }
      }

      CFTypeRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"Content Hint");
      if (Value && CFEqual(Value, @"LightweightVolumeManager_Media"))
      {
        using_LwVM = 1;
      }

      else
      {
        if (!Value
          || !CFEqual(Value, @"7C3457EF-0000-11AA-AA11-00306543ECAC")
          && !CFEqual(Value, @"52637672-7900-11AA-AA11-00306543ECAC")
          && !CFEqual(Value, @"69646961-6700-11AA-AA11-00306543ECAC")
          && !CFEqual(Value, @"EF57347C-0000-11AA-AA11-00306543ECAC"))
        {
          if (!strcmp(__b, off_100074608) || strstr(__b, "OS"))
          {
            uint64_t v87 = &system_device_node_path;
            if (!v100)
            {
              _partition_log( (uint64_t)"found system volume not at disk0s1s1: %s\n",  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)__b);
              char v100 = 1;
            }
          }

          else if (!strcmp(__b, off_100074648))
          {
            uint64_t v87 = &data_device_node_path;
          }

          else if (!strcmp(__b, off_100074668))
          {
            uint64_t v87 = &user_device_node_path;
          }

          else if (!strcmp(__b, off_100074688))
          {
            uint64_t v87 = &baseband_data_partition_device_node_path;
          }

          else if (!strcmp(__b, off_1000746A8))
          {
            uint64_t v87 = &update_device_node_path;
          }

          else if (!v100 || system_device_node_path)
          {
            if (!strcmp(__b, off_1000746C8))
            {
              uint64_t v87 = &scratch_device_node_path;
            }

            else if (!strcmp(__b, off_100074628))
            {
              uint64_t v87 = &xart_device_node_path;
            }

            else if (!strcmp(__b, off_100074708))
            {
              uint64_t v87 = &recovery_os_volume_device_node_path;
            }

            else if (!strcmp(__b, off_1000746E8))
            {
              uint64_t v87 = &preboot_partition_device_node_path;
            }

            else
            {
              _partition_log( (uint64_t)"unexpected partition '%s' - skipping",  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)__b);
              uint64_t v87 = 0LL;
            }
          }

          else
          {
            _partition_log( (uint64_t)"looking for a system volume, and found unknown volume '%s'. using it as the system volume.\n",  v64,  v65,  v66,  v67,  v68,  v69,  v70,  (uint64_t)__b);
            uint64_t v87 = &system_device_node_path;
          }

          if (v87 && *v87)
          {
            _partition_log( (uint64_t)"encountered second '%s' partition; original was '%s'",
              v64,
              v65,
              v66,
              v67,
              v68,
              v69,
              v70,
              (uint64_t)__b);
            goto LABEL_89;
          }

          while (1)
          {
            BOOLean = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Leaf");
            if (BOOLean)
            {
              if (CFBooleanGetValue(BOOLean) == 1) {
                break;
              }
            }

            IOObjectRelease(object);
            CFRelease(cf);
            CFTypeRef cf = 0LL;
            while (1)
            {
              io_object_t object = IOIteratorNext(iterator);
              if (!object || IOObjectConformsTo(object, "IOMedia")) {
                break;
              }
              IOObjectRelease(object);
            }

            if (!object)
            {
              _partition_log( (uint64_t)"ran out of registry entries without finding a leaf media object",  v71,  v72,  v73,  v74,  v75,  v76,  v77,  v86);
              goto LABEL_89;
            }

            unsigned int CFProperties = IORegistryEntryCreateCFProperties( object,  (CFMutableDictionaryRef *)&cf,  kCFAllocatorDefault,  0);
            if (CFProperties) {
              goto LABEL_12;
            }
          }

          if (v87)
          {
            cf1b = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
            if (!cf1b)
            {
              _partition_log((uint64_t)"leaf media object with no bsd name", v78, v79, v80, v81, v82, v83, v84, v86);
              goto LABEL_89;
            }

            *(_OWORD *)uint64_t v103 = 0u;
            __int128 v104 = 0u;
            CFStringGetCString(cf1b, v103, 32LL, 0x8000100u);
            __snprintf_chk(v87, 0x20uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%s%s", "/dev/", v103);
          }

          goto LABEL_85;
        }

        cf1a = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"BSD Name");
        if (!cf1a)
        {
          _partition_log((uint64_t)"APFS Container object with no bsd name", v36, v37, v38, v39, v40, v41, v42, v86);
          goto LABEL_89;
        }

        memset(buffer, 0, sizeof(buffer));
        CFStringGetCString(cf1a, (char *)buffer, 32LL, 0x8000100u);
        if (CFEqual(Value, @"7C3457EF-0000-11AA-AA11-00306543ECAC") == 1)
        {
          if (strstr(__b, "RecoveryOSContainer"))
          {
            int v93 = &apfs_recovery_os_container_device_node_path;
            __snprintf_chk( &apfs_recovery_os_container_device_node_path,  0x20uLL,  0,  0xFFFFFFFFFFFFFFFFLL,  "%s%s",  "/dev/",  (const char *)buffer);
          }

          else if (!strcmp(__b, "iBootSystemContainer"))
          {
            int v93 = &iboot_system_container_device_node_path;
            __snprintf_chk( &iboot_system_container_device_node_path,  0x20uLL,  0,  0xFFFFFFFFFFFFFFFFLL,  "%s%s",  "/dev/",  (const char *)buffer);
          }

          else
          {
            int v93 = &apfs_container_device_node_path;
            __snprintf_chk( &apfs_container_device_node_path,  0x20uLL,  0,  0xFFFFFFFFFFFFFFFFLL,  "%s%s",  "/dev/",  (const char *)buffer);
          }

          _partition_log((uint64_t)"APFS Container '%s' %s\n", v43, v44, v45, v46, v47, v48, v49, (uint64_t)__b);
        }

        else if (CFEqual(Value, @"EF57347C-0000-11AA-AA11-00306543ECAC") == 1)
        {
          if (v93 && *v93)
          {
            _partition_log( (uint64_t)"Found synthesized APFS container. Using %s instead of %s\n",  v50,  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)buffer);
            __snprintf_chk(v93, 0x20uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%s%s", "/dev/", (const char *)buffer);
            int v93 = 0LL;
          }

          else
          {
            _partition_log( (uint64_t)"found synthesized container without original device node\n",  v50,  v51,  v52,  v53,  v54,  v55,  v56,  v86);
          }
        }

        if (v93 && !*v93)
        {
          __snprintf_chk(v93, 0x20uLL, 0, 0xFFFFFFFFFFFFFFFFLL, "%s%s", "/dev/", (const char *)buffer);
          _partition_log((uint64_t)"APFS Container '%s' %s\n", v57, v58, v59, v60, v61, v62, v63, (uint64_t)__b);
        }

        using_APFS = 1;
        IOObjectRelease(object);
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }
    }
  }

  _partition_log( (uint64_t)"Unable to find storage device node for service named: %s",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"EmbeddedDeviceTypeRoot");
LABEL_89:
  if (iterator)
  {
    if (!IOIteratorIsValid(iterator))
    {
      unsigned __int8 v101 = 0;
      if (v102) {
        *uint64_t v102 = 1;
      }
    }
  }

  if (object) {
    IOObjectRelease(object);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (service) {
    IOObjectRelease(service);
  }
  return v101;
}

uint64_t get_main_container_space_info( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v63 = a1;
  uint64_t v62 = (void *)a2;
  uint64_t v61 = (void *)a3;
  uint64_t v60 = (void *)a4;
  uint64_t v59 = (void *)a5;
  unsigned int SpaceInfo = 0;
  uint64_t v57 = 0LL;
  uint64_t v56 = 0LL;
  uint64_t v55 = 0LL;
  uint64_t v54 = 0LL;
  uint64_t v53 = 0LL;
  _partition_log((uint64_t)"entering %s\n", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"get_main_container_space_info");
  if (apfs_container_device_node_path)
  {
    uint64_t v52 = 0LL;
    uint64_t v51 = 0LL;
    unsigned int SpaceInfo = APFSContainerGetSpaceInfo(&apfs_container_device_node_path, &v52, &v51);
    if (SpaceInfo)
    {
      _partition_log( (uint64_t)"APFSContainerGetSpaceInfo failed with result:%d",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  SpaceInfo);
    }

    else
    {
      uint64_t v57 = v51;
      uint64_t v53 = v52;
    }
  }

  else
  {
    _partition_log( (uint64_t)"No container device found, can't retrieve space info",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v44);
  }

  if (system_device_node_path)
  {
    uint64_t v50 = 0LL;
    uint64_t v49 = 0LL;
    unsigned int SpaceInfo = APFSVolumeGetSpaceInfo(&system_device_node_path, &v49, &v50);
    if (SpaceInfo) {
      _partition_log( (uint64_t)"APFSVolumeGetSpaceInfo for system volume failed with result:%d",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  SpaceInfo);
    }
    else {
      uint64_t v56 = v50;
    }
  }

  else
  {
    _partition_log((uint64_t)"No system device found, can't retrieve space info", v15, v16, v17, v18, v19, v20, v21, v44);
  }

  if (data_device_node_path)
  {
    uint64_t v48 = 0LL;
    uint64_t v47 = 0LL;
    unsigned int SpaceInfo = APFSVolumeGetSpaceInfo(&data_device_node_path, &v47, &v48);
    if (SpaceInfo) {
      _partition_log( (uint64_t)"APFSVolumeGetSpaceInfo for data volume failed with result:%d",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  SpaceInfo);
    }
    else {
      uint64_t v55 = v48;
    }
  }

  else
  {
    _partition_log((uint64_t)"No data device found, can't retrieve space info", v22, v23, v24, v25, v26, v27, v28, v44);
  }

  if (preboot_partition_device_node_path)
  {
    uint64_t v46 = 0LL;
    uint64_t v45 = 0LL;
    uint64_t result = APFSVolumeGetSpaceInfo(&preboot_partition_device_node_path, &v45, &v46);
    unsigned int SpaceInfo = result;
    if ((_DWORD)result) {
      uint64_t result = _partition_log( (uint64_t)"APFSVolumeGetSpaceInfo for preboot volume failed with result:%d",  v37,  v38,  v39,  v40,  v41,  v42,  v43,  SpaceInfo);
    }
    else {
      uint64_t v54 = v46;
    }
  }

  else
  {
    uint64_t result = _partition_log( (uint64_t)"No preboot device found, can't retrieve space info",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v44);
  }

  if (v63) {
    *uint64_t v63 = v56;
  }
  if (v62) {
    *uint64_t v62 = v55;
  }
  if (v61) {
    *uint64_t v61 = v54;
  }
  if (v60) {
    void *v60 = v57;
  }
  if (v59) {
    *uint64_t v59 = v53;
  }
  return result;
}

uint64_t _execute_command_with_callback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_executeCommandPtr) {
    return _executeCommandPtr(a1, a2, a3);
  }
  else {
    return -1;
  }
}

uint64_t _partition_execution_log(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (_executionLoggingPtr) {
    return _executionLoggingPtr(result, a2, a3);
  }
  return result;
}

uint64_t is_volume_apfs(const char *a1)
{
  uint64_t v20 = a1;
  Boolean v19 = 0;
  if (strnstr(a1, "/dev/", 5uLL) == a1) {
    uint64_t v20 = a1 + 5;
  }
  CFDictionaryRef matching = IOBSDNameMatching(kIOMasterPortDefault, 0, v20);
  io_service_t entry = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  if (entry)
  {
    CFTypeRef cf1 = IORegistryEntryCreateCFProperty(entry, @"Content Hint", kCFAllocatorDefault, 0);
    if (cf1)
    {
      Boolean v19 = CFEqual(cf1, @"41504653-0000-11AA-AA11-00306543ECAC");
      CFRelease(cf1);
    }

    else
    {
      _partition_log((uint64_t)"unable to find content hint for %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v20);
    }

    IOObjectRelease(entry);
    return v19;
  }

  else
  {
    _partition_log((uint64_t)"unable to find service for %s", v1, v2, v3, v4, v5, v6, v7, (uint64_t)v20);
    return 0;
  }

uint64_t debugMounts()
{
  __int128 v1 = off_100061AE8;
  return _execute_command((uint64_t)&v1);
}

__CFDictionary *_partition_create_embedded_storage_service_query_dict(const char *a1)
{
  theDict = 0LL;
  CFMutableStringRef Mutable = 0LL;
  CFStringRef key = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
  if (key)
  {
    theDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (theDict)
    {
      CFDictionaryAddValue(theDict, key, kCFBooleanTrue);
      CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (Mutable) {
        CFDictionaryAddValue(Mutable, @"IOPropertyMatch", theDict);
      }
    }
  }

  if (key) {
    CFRelease(key);
  }
  if (theDict) {
    CFRelease(theDict);
  }
  return Mutable;
}

uint64_t _partition_wait_for_io_service_matching_dict(const void *a1, unsigned int a2)
{
  LODWORD(v13) = 0;
  do
  {
    else {
      unsigned int v11 = 3;
    }
    CFRetain(a1);
    HIDWORD(v13) = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)a1);
    if (!HIDWORD(v13))
    {
      theString = CFCopyDescription(a1);
      CStringPtr = CFStringGetCStringPtr(theString, 0);
      _partition_log( (uint64_t)"waiting for matching IOKit service: %s\n",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)CStringPtr);
      sleep(v11);
      LODWORD(v13) = v13 + v11;
      CFRelease(theString);
    }
  }

  while (v13 < a2);
  CFRelease(a1);
  return HIDWORD(v13);
}

uint64_t _partition_find_whole_child(io_object_t a1)
{
  HIDWORD(v44) = a1;
  LODWORD(v44) = 0;
  IOObjectRetain(a1);
  while (1)
  {
    io_object_t v43 = 0;
    io_iterator_t iterator = 0;
    unsigned int v41 = 0;
    if (IORegistryEntryGetChildIterator(HIDWORD(v44), "IOService", &iterator))
    {
      _partition_log((uint64_t)"Could not create child iterator", v1, v2, v3, v4, v5, v6, v7, v37);
      goto LABEL_21;
    }

    while (1)
    {
      io_object_t object = IOIteratorNext(iterator);
      if (!object) {
        break;
      }
      ++v41;
      if (v43) {
        IOObjectRelease(object);
      }
      else {
        io_object_t v43 = object;
      }
    }

    IOObjectRelease(iterator);
    if (v41 != 1) {
      break;
    }
    IOObjectRelease(HIDWORD(v44));
    HIDWORD(v44) = v43;
    io_object_t v43 = 0;
    if (IOObjectConformsTo(HIDWORD(v44), "IOMedia"))
    {
      CFTypeRef cf = IORegistryEntryCreateCFProperty(HIDWORD(v44), @"Whole", kCFAllocatorDefault, 0);
      if (cf)
      {
        CFTypeID v38 = CFGetTypeID(cf);
        if (v38 == CFBooleanGetTypeID())
        {
          if (CFBooleanGetValue((CFBooleanRef)cf)) {
            uint64_t v44 = HIDWORD(v44);
          }
          else {
            _partition_log((uint64_t)"Expected Whole=true", v29, v30, v31, v32, v33, v34, v35, v37);
          }
        }

        else
        {
          _partition_log((uint64_t)"Expected Whole to be BOOLean", v22, v23, v24, v25, v26, v27, v28, v37);
        }

        CFRelease(cf);
      }

      else
      {
        _partition_log((uint64_t)"Did not find Whole property on IOMedia class", v15, v16, v17, v18, v19, v20, v21, v37);
      }

      goto LABEL_21;
    }
  }

  if (v43)
  {
    IOObjectRelease(v43);
    io_object_t v43 = 0;
  }

  _partition_log((uint64_t)"Found %d child nodes (expected 1)", v8, v9, v10, v11, v12, v13, v14, v41);
LABEL_21:
  if (HIDWORD(v44)) {
    IOObjectRelease(HIDWORD(v44));
  }
  return v44;
}

void sub_1000311BC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t __os_cleanup_iorelease(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      __os_cleanup_iorelease_cold_1(&v2, v3);
    }
  }

  return result;
}

uint64_t _ioreg_property_is_nonzero(char *a1, const __CFString *a2)
{
  uint64_t v4 = (const __CFData *)_ioreg_copy_property(a1, a2);
  if (v4)
  {
    uint64_t v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFDataGetTypeID()
      || (BytePtr = CFDataGetBytePtr(v5), (size_t Length = CFDataGetLength(v5)) != 0)
      && (Length > 4 || !memcmp(BytePtr, &_ioreg_property_is_nonzero_kZeroBytes, Length)))
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = "NO";
    }

    else
    {
      uint64_t v9 = 1LL;
      uint64_t v10 = "YES";
    }

    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, v10, v5);
    CFRelease(v5);
  }

  else
  {
    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, "NO", 0LL);
    return 0LL;
  }

  return v9;
}

BOOL _ioreg_property_exists(const __CFString *a1)
{
  CFTypeRef v2 = _ioreg_copy_property("IODeviceTree:/defaults", a1);
  CFTypeRef v3 = v2;
  if (v2)
  {
    CFRelease(v2);
    uint64_t v4 = "YES";
  }

  else
  {
    uint64_t v4 = "NO";
  }

  ramrod_log_msg_cf(@"Boot Firmware Updater: property_exists(%s, %@) = %s\n", "IODeviceTree:/defaults", a1, v4);
  return v3 != 0LL;
}

void sub_100031A50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

CFTypeRef _ioreg_copy_property(char *path, const __CFString *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3) {
    return 0LL;
  }
  io_object_t v4 = v3;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
  IOObjectRelease(v4);
  return CFProperty;
}

uint64_t MSUBootFirmwareFindNamespace(io_registry_entry_t a1, uint64_t a2)
{
  uint64_t entryID = 0LL;
  IORegistryEntryGetRegistryEntryID(a1, &entryID);
  IOServiceWaitQuiet(a1, 0LL);
  v12[0] = @"IOParentMatch";
  CFMutableDictionaryRef v4 = IORegistryEntryIDMatching(entryID);
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  v12[1] = @"IOPropertyMatch";
  v13[0] = v5;
  uint64_t v10 = a2;
  uint64_t v11 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  v13[1] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL);
  CFTypeID v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL);
  if (v6) {
    uint64_t v7 = (const __CFDictionary *)CFRetain(v6);
  }
  else {
    uint64_t v7 = 0LL;
  }
  return IOServiceGetMatchingService(kIOMasterPortDefault, v7);
}

LABEL_29:
  AMSupportSafeRelease(v10);
  AMSupportSafeRelease(URLFromString);
  AMSupportSafeRelease(v20);
  AMSupportSafeRelease(theData);
  AMSupportSafeRelease(Mutable);
  return v53;
}

LABEL_21:
    uint64_t v26 = 0;
    goto LABEL_22;
  }

  uint64_t v53 = v47;
  uint64_t v54 = CFDataGetBytePtr(a3);
  memmove(v53, v54, v46);
  if (IOConnectCallStructMethod( -[IOServiceWriter serviceConnect](-[IMG3NorUpdater writer](self, "writer"), "serviceConnect"),  !v8,  v53,  v46,  0LL,  0LL))
  {
    if (a6)
    {
      CFTypeID v38 = MSUBootFirmwareError( 3LL,  0LL,  (uint64_t)@"%s returned an error when writing img3 object",  v55,  v56,  v57,  v58,  v59,  (uint64_t)"AppleImage3NORAccess");
      goto LABEL_9;
    }

    return 0;
  }

  munmap(v53, v46);
  uint64_t v26 = 1;
LABEL_22:
  if (v65) {
    image3Discard(&v65);
  }
  return v26;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _os_log_send_and_compose_impl(a1, v6, v5, 80LL, a5, v7, 16LL);
}

BOOL OUTLINED_FUNCTION_1()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void sub_10003405C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t __os_cleanup_iorelease_0(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      __os_cleanup_iorelease_cold_1_0(&v2, v3);
    }
  }

  return result;
}

void sub_100034444( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t __os_cleanup_ioclose(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOServiceClose(result);
    if ((_DWORD)result) {
      __os_cleanup_ioclose_cold_1(&v2, v3);
    }
  }

  return result;
}

double OUTLINED_FUNCTION_3(void *a1, _OWORD *a2)
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

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  return _os_crash_msg(*v1, a1);
}

void iBU_LOG_real( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a1, &a9);
  uint64_t v11 = v10;
  if (_loggingPtr_0)
  {
    uint64_t v12 = -[NSString UTF8String](v10, "UTF8String");
    _loggingPtr_0("%s: %s\n", a2, v12);
  }

  else
  {
    NSLog(@"%s: %@", a2, v10);
  }
}

NSError *MSUBootFirmwareError( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", a3, &a9);
  if (a2)
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    uint64_t v20 = v11;
    uint64_t v21 = a2;
    uint64_t v12 = &v20;
    uint64_t v13 = &v18;
    uint64_t v14 = 2LL;
  }

  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v17 = v11;
    uint64_t v12 = &v17;
    uint64_t v13 = &v16;
    uint64_t v14 = 1LL;
  }

  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MSUFirmwareUpdaterErrorDomain",  a1,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v13,  v14,  &a9,  v16,  v17,  v18,  v19,  v20,  v21));
}

BOOL _is_firmware_info_entry(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"low-level-fw-device-info", 0LL, 0);
  CFTypeRef v2 = CFProperty;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 != 0LL;
}

void sub_100037C94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
}

uint64_t __os_cleanup_iorelease_1(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    if ((_DWORD)result) {
      __os_cleanup_iorelease_cold_1_1(&v2, v3);
    }
  }

  return result;
}

void sub_100037DB8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

void image3Discard(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      if (*(void *)v2)
      {
        if ((*(_BYTE *)(v2 + 10) & 4) != 0)
        {
          image3Free(*(void **)v2);
          uint64_t v2 = *a1;
        }
      }

      image3Free((void *)v2);
      *a1 = 0LL;
    }
  }

uint64_t image3InstantiateNew(void *a1, size_t a2, unsigned int a3)
{
  uint64_t v6 = image3Malloc(0x28uLL);
  if (!v6) {
    return 12LL;
  }
  uint64_t v7 = v6;
  if (a2 <= 0x14) {
    a2 = 20LL;
  }
  uint64_t v8 = image3Malloc(a2);
  *uint64_t v7 = v8;
  if (!v8)
  {
    image3Free(v7);
    return 12LL;
  }

  *uint64_t v8 = 0LL;
  v8[1] = 0LL;
  *((_DWORD *)v8 + 4) = 0;
  uint64_t v9 = (_DWORD *)*v7;
  *uint64_t v9 = 1231906611;
  v9[4] = a3;
  v7[2] = a2;
  v7[3] = 0xFFFFFFFF00000000LL;
  *((_DWORD *)v7 + 2) = 0x40000;
  v7[4] = 0LL;
  if (a3 == 1667592820 || (uint64_t v10 = image3SetTagUnsignedNumber((char **)v7, 1415139397, a3), !(_DWORD)v10))
  {
    uint64_t v11 = 0LL;
    *a1 = v7;
  }

  else
  {
    uint64_t v11 = v10;
    image3Free((void *)*v7);
    image3Free(v7);
  }

  return v11;
}

uint64_t image3SetTagUnsignedNumber(char **a1, int a2, unint64_t a3)
{
  int v7 = 0;
  unint64_t v6 = 0LL;
  if (HIDWORD(a3))
  {
    unint64_t v6 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v6;
    size_t v4 = 8LL;
  }

  else
  {
    int v7 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v7;
    size_t v4 = 4LL;
  }

  return image3SetTagStructure(a1, a2, v3, v4, 0);
}

uint64_t image3Finalize(uint64_t a1, char **a2, void *a3, int a4, uint64_t a5)
{
  unint64_t v18 = 0LL;
  int8x16_t v19 = 0uLL;
  int v20 = 0;
  v16[0] = 0LL;
  v16[1] = 0LL;
  int v17 = 0;
  if (!a4) {
    goto LABEL_8;
  }
  uint64_t result = image3AdvanceCursorWithZeroPad((char **)a1, (56 - *(_DWORD *)(a1 + 24)) & 0x3F);
  if (!(_DWORD)result)
  {
    uint64_t v10 = *(char **)a1;
    unsigned int v11 = *(_DWORD *)(a1 + 24);
    *((_DWORD *)v10 + 3) = v11 + a5;
    uint64_t v12 = v10 + 12;
    CC_LONG v13 = v11 + 8;
    if (a5)
    {
      unint64_t v18 = __PAIR64__(v11, a5);
      image3SHA1Partial(v12, v13, &v19);
    }

    else
    {
      image3SHA1Generate(v12, v13, (unsigned __int8 *)v16);
    }

    uint64_t result = image3PKISignHash();
    if (!(_DWORD)result)
    {
      *(_DWORD *)(a1 + 8) |= 0x20000u;
LABEL_8:
      uint64_t result = 0LL;
      uint64_t v14 = *(char **)a1;
      *((_DWORD *)v14 + 2) = *(_DWORD *)(a1 + 24);
      uint64_t v15 = (*(_DWORD *)(a1 + 24) + 20);
      *((_DWORD *)v14 + 1) = v15;
      *a2 = v14;
      *a3 = v15;
    }
  }

  return result;
}

uint64_t image3AdvanceCursorWithZeroPad(char **a1, int a2)
{
  if ((*((_BYTE *)a1 + 10) & 2) != 0) {
    return 30LL;
  }
  uint64_t v4 = *((int *)a1 + 6);
  uint64_t v3 = *((int *)a1 + 7);
  LODWORD(v5) = v4 + a2;
  *((_DWORD *)a1 + 6) = v4 + a2;
  unint64_t v6 = *a1;
  if ((_DWORD)v3 != -1)
  {
    *(_DWORD *)&v6[v3 + 24] = v5 - v3;
    LODWORD(v5) = *((_DWORD *)a1 + 6);
  }

  uint64_t v5 = (int)v5;
  unint64_t v7 = (int)v5 + 20LL;
  unint64_t v6 = (char *)realloc(v6, (int)v5 + 20LL);
  if (v6)
  {
    *a1 = v6;
    a1[2] = (char *)v7;
    uint64_t v5 = *((int *)a1 + 6);
LABEL_7:
    bzero(&v6[v4 + 20], v5 - v4);
    uint64_t result = 0LL;
    *((_DWORD *)*a1 + 2) = *((_DWORD *)a1 + 6);
    return result;
  }

  return 12LL;
}

uint64_t image3SetTagStructure(char **a1, int a2, void *__src, size_t __n, int a5)
{
  if ((*((_BYTE *)a1 + 10) & 2) != 0) {
    return 30LL;
  }
  if (a5)
  {
    uint64_t v9 = *((int *)a1 + 7);
    int v10 = (a5 + *((_DWORD *)a1 + 6) / a5 * a5 - *((_DWORD *)a1 + 6)) % a5 + *((_DWORD *)a1 + 6);
    *((_DWORD *)a1 + 6) = v10;
    unsigned int v11 = *a1;
    if ((_DWORD)v9 != -1) {
      *(_DWORD *)&v11[v9 + 24] = v10 - v9;
    }
  }

  else
  {
    unsigned int v11 = *a1;
  }

  if ((__n & 0xF) != 0) {
    size_t v13 = 16 - (__n & 0xF);
  }
  else {
    size_t v13 = 0LL;
  }
  uint64_t v14 = *((int *)a1 + 6);
  size_t v15 = __n + v13 + v14 + 32;
  if (v15 > (unint64_t)a1[2])
  {
    unsigned int v11 = (char *)realloc(v11, __n + v13 + v14 + 32);
    if (!v11) {
      return 12LL;
    }
    *a1 = v11;
    a1[2] = (char *)v15;
    uint64_t v14 = *((int *)a1 + 6);
  }

  NSErrorUserInfoKey v16 = &v11[v14];
  if ((((_DWORD)v13 + (_DWORD)__n) & 3) != 0) {
    int v17 = ((v13 + __n) & 0xFFFFFFFC) + 16;
  }
  else {
    int v17 = v13 + __n + 12;
  }
  *((_DWORD *)v16 + 5) = a2;
  *((_DWORD *)v16 + 6) = v17;
  *((_DWORD *)v16 + 7) = __n;
  memcpy(v16 + 32, __src, __n);
  bzero(&v16[__n + 32], v13);
  uint64_t result = 0LL;
  int v18 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 7) = v18;
  int v19 = *((_DWORD *)v16 + 6) + v18;
  *((_DWORD *)a1 + 6) = v19;
  *((_DWORD *)*a1 + 2) = v19;
  return result;
}

uint64_t image3InstantiateFromBuffer(void *a1, _DWORD *a2, unint64_t a3, char a4)
{
  if (a3 < 0x14) {
    return 22LL;
  }
  if (*a2 != 1231906611) {
    return 22LL;
  }
  unint64_t v6 = a2[2];
  int v10 = image3Malloc(0x28uLL);
  if (!v10) {
    return 12LL;
  }
  unsigned int v11 = v10;
  *((_DWORD *)v10 + 2) = 1;
  v10[4] = 0LL;
  if (a2[3])
  {
    *((_DWORD *)v10 + 2) = 131073;
    if ((a4 & 1) == 0)
    {
      *int v10 = a2;
      v10[2] = a3;
LABEL_21:
      uint64_t result = 0LL;
      *a1 = v11;
      return result;
    }

    goto LABEL_19;
  }

  *((_DWORD *)v10 + 6) = a2[2];
  *((_DWORD *)v10 + 7) = -1;
  unsigned int v12 = a2[2];
  if (!v12)
  {
LABEL_19:
    size_t v16 = a2[2] + 20LL;
    id v11[2] = v16;
    int v17 = image3Malloc(v16);
    *unsigned int v11 = v17;
    if (v17)
    {
      memcpy(v17, a2, v11[2]);
      *((_DWORD *)v11 + 2) |= 0x40000u;
      goto LABEL_21;
    }

    image3Free(v11);
    return 12LL;
  }

  unsigned int v13 = 0;
  while (1)
  {
    unsigned int v14 = v13;
    unsigned int v15 = *(_DWORD *)((char *)a2 + v13 + 24);
    v13 += v15;
    if (v13 > v12 || v15 <= 0xB) {
      break;
    }
    if (v13 == v12)
    {
      *((_DWORD *)v10 + 7) = v14;
      goto LABEL_19;
    }
  }

  image3Free(v10);
  return 22LL;
}

uint64_t image3GetTagStruct(uint64_t a1, int a2, void *a3, void *a4, int a5)
{
  uint64_t v5 = *(unsigned int *)(*(void *)a1 + 8LL);
  if (!(_DWORD)v5) {
    return 2LL;
  }
  unint64_t v6 = (_DWORD *)(*(void *)a1 + 20LL);
  unint64_t v7 = (unint64_t)v6 + v5;
  while (1)
  {
    uint64_t v8 = v6 + 3;
    uint64_t v9 = v6[2];
    if (a2 == -1 || *v6 == a2) {
      break;
    }
LABEL_9:
    unint64_t v10 = v6[1];
    if (v9 + 12 > v10) {
      return 22LL;
    }
    unint64_t v6 = (_DWORD *)((char *)v6 + v10);
  }

  if (a5)
  {
    --a5;
    goto LABEL_9;
  }

  if (a4)
  {
    if (*a4 && *a4 != v9) {
      return 22LL;
    }
    *a4 = v9;
  }

  uint64_t result = 0LL;
  *a3 = v8;
  return result;
}

uint64_t image3GetTagUnsignedNumber(uint64_t a1, int a2, void *a3, int a4)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = image3GetTagStruct(a1, a2, &v8, &v7, a4);
  if (!(_DWORD)result)
  {
    if (v7 == 8)
    {
      uint64_t v6 = *(void *)v8;
      goto LABEL_6;
    }

    if (v7 == 4)
    {
      uint64_t v6 = *v8;
LABEL_6:
      uint64_t result = 0LL;
      *a3 = v6;
      return result;
    }

    return 22LL;
  }

  return result;
}

void __copy_helper_block_e8_32o40b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32o40b(uint64_t a1)
{
}

uint64_t wait_for_io_service_matching_dict(CFTypeRef cf, unsigned int a2)
{
  unsigned int v4 = 0;
  do
  {
    CFRetain(cf);
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)cf);
    if ((_DWORD)MatchingService) {
      break;
    }
    unsigned int v6 = a2 - v4 >= 3 ? 3 : a2 - v4;
    uint64_t v7 = CFCopyDescription(cf);
    char CStringPtr = CFStringGetCStringPtr(v7, 0);
    ramrod_log_msg("waiting for matching IOKit service: %s\n", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
    sleep(v6);
    v4 += v6;
    CFRelease(v7);
  }

  while (v4 < a2);
  CFRelease(cf);
  return MatchingService;
}

uint64_t wait_for_io_service_matching_resource_with_timeout(const char *a1, unsigned int a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOResources");
  if (v4)
  {
    uint64_t v12 = v4;
    CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v13)
    {
      CFStringRef v21 = v13;
      CFDictionarySetValue(v12, @"IOResourceMatch", v13);
      CFRelease(v21);
      return wait_for_io_service_matching_dict(v12, a2);
    }

    ramrod_log_msg("unable to convert resource name to CFString\n", v14, v15, v16, v17, v18, v19, v20, v23);
  }

  else
  {
    ramrod_log_msg("unable to create matching dictionary for resource '%s'\n", v5, v6, v7, v8, v9, v10, v11, (char)a1);
  }

  return 0LL;
}

__CFDictionary *create_embedded_storage_service_query_dict(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v1) {
    return 0LL;
  }
  CFStringRef v2 = v1;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableDictionaryRef v4 = Mutable;
    CFDictionaryAddValue(Mutable, v2, kCFBooleanTrue);
    uint64_t v5 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v6 = v5;
    if (v5) {
      CFDictionaryAddValue(v5, @"IOPropertyMatch", v4);
    }
    CFRelease(v2);
  }

  else
  {
    uint64_t v6 = 0LL;
    CFMutableDictionaryRef v4 = (__CFDictionary *)v2;
  }

  CFRelease(v4);
  return v6;
}

BOOL ramrod_check_NVRAM_access()
{
  io_object_t v0 = wait_for_io_service_matching_resource_with_timeout("IONVRAM", 0);
  io_object_t v1 = v0;
  if (v0) {
    IOObjectRelease(v0);
  }
  return v1 != 0;
}

uint64_t ramrod_delete_NVRAM_variable()
{
  return 1LL;
}

uint64_t ramrod_copy_NVRAM_variable()
{
  return 0LL;
}

uint64_t image3SHA1Generate(const void *a1, CC_LONG a2, unsigned __int8 *a3)
{
  return CC_SHA1_Final(a3, &v7);
}

uint64_t image3PKISignHash()
{
  return 0xFFFFFFFFLL;
}

int8x16_t image3SHA1Partial(const void *a1, CC_LONG a2, int8x16_t *a3)
{
  int8x16_t result = vrev32q_s8(*(int8x16_t *)&v7.h0);
  *a3 = result;
  a3[1].i32[0] = bswap32(v7.h4);
  return result;
}

uint64_t ramrod_ticket_create_img3(CFDataRef *a1, CFErrorRef *a2)
{
  uint64_t v28 = 0LL;
  if (!_ticket || _ticket_is_img3 != 1) {
    return 1LL;
  }
  CFIndex v29 = 0LL;
  uint64_t v30 = 0LL;
  if (image3InstantiateNew(&v28, 0LL, 0x53434142u))
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to create img3 ticket",  v4,  v5,  v6,  (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "failed to create img3\n";
LABEL_10:
    ramrod_log_msg(v14, v7, v8, v9, v10, v11, v12, v13, v27);
LABEL_11:
    uint64_t v15 = 0LL;
    goto LABEL_12;
  }

  uint64_t v16 = v28;
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)_ticket);
  size_t Length = CFDataGetLength((CFDataRef)_ticket);
  if (image3SetTagStructure(v16, 1145132097, BytePtr, Length, 32))
  {
    uint64_t v14 = "failed to create data tag for ticket";
    goto LABEL_10;
  }

  if (image3Finalize((uint64_t)v28, (char **)&v30, &v29, 0, 0LL))
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to create CFData for img3 ticket",  v19,  v20,  v21,  (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "could not finalize ticket img3";
    goto LABEL_10;
  }

  CFDataRef v23 = CFDataCreate(kCFAllocatorDefault, v30, v29);
  if (!v23)
  {
    ramrod_create_error_cf( a2,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to create CFData for img3 ticket",  v24,  v25,  v26,  (char)"ramrod_ticket_create_img3");
    goto LABEL_11;
  }

  *a1 = v23;
  uint64_t v15 = 1LL;
LABEL_12:
  if (v28) {
    image3Discard((uint64_t *)&v28);
  }
  return v15;
}

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      ssize_t v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1) {
        break;
      }
      v7 += v8;
      if (v7 == a2) {
        return 0LL;
      }
    }

    return *__error();
  }

  return result;
}

uint64_t ramrod_remove_log_fd_no_locking(int a1)
{
  int valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  int v1 = fstat(a1, &v16);
  BOOL v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  uint64_t v3 = &log_fds;
  if (v2) {
    uint64_t v3 = &log_fds_fileonly;
  }
  uint64_t v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "can't remove logging fd since none were added";
    size_t v14 = 45LL;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }

  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "failed to convert fd to number";
    size_t v14 = 30LL;
    goto LABEL_13;
  }

  CFNumberRef v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    uint64_t v7 = __error();
    uint64_t v8 = *v7;
    uint64_t v9 = __stderrp;
    int v10 = valuePtr;
    uint64_t v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  __int128 context = 0u;
  *(_OWORD *)theArray = 0u;
  int valuePtr = -1;
  pthread_mutex_lock(&log_fds_mutex);
  if (a1 && __PAIR128__(log_fds, log_fds_fileonly) != 0)
  {
    *(void *)&__int128 context = a1;
    *((void *)&context + 1) = a2;
    theArray[0] = 0LL;
    LOBYTE(theArray[1]) = 0;
    if (log_fds) {
      CFSetApplyFunction((CFSetRef)log_fds, (CFSetApplierFunction)ramrod_log_to_fd_set_applier, &context);
    }
    ramrod_log_msg_to_all_fds_bytes_to_sync += a2;
    if (ramrod_log_msg_to_all_fds_bytes_to_sync)
    {
      LOBYTE(theArray[1]) = 1;
      ramrod_log_msg_to_all_fds_bytes_to_sync = 0LL;
    }

    if (log_fds_fileonly) {
      CFSetApplyFunction((CFSetRef)log_fds_fileonly, (CFSetApplierFunction)ramrod_log_to_fd_set_applier, &context);
    }
    if (theArray[0])
    {
      CFIndex Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0LL; i != v5; ++i)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr)) {
            ramrod_remove_log_fd_no_locking(valuePtr);
          }
          else {
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
          }
        }
      }

      CFRelease(theArray[0]);
    }
  }

  pthread_mutex_unlock(&log_fds_mutex);
  return 0LL;
}

void ramrod_log_to_fd_set_applier(const void *a1, uint64_t a2)
{
  int valuePtr = -1;
  if (!a1)
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "NULL fd num in fd set, weird.\n";
    size_t v7 = 30LL;
LABEL_11:
    fwrite(v6, v7, 1uLL, v5);
    return;
  }

  if (!a2)
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "Missing logging context.\n";
    size_t v7 = 25LL;
    goto LABEL_11;
  }

  if (*(void *)a2)
  {
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
    {
      if (ramrod_log_msg_to_fd(*(void *)a2, *(void *)(a2 + 8), valuePtr))
      {
        fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
        CFMutableStringRef Mutable = *(__CFArray **)(a2 + 16);
        if (!Mutable)
        {
          CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeArrayCallBacks);
          *(void *)(a2 + 16) = Mutable;
        }

        CFArrayAppendValue(Mutable, a1);
      }

      else if (*(_BYTE *)(a2 + 24))
      {
        fsync(valuePtr);
      }
    }

    else
    {
      fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
    }
  }

void *ramrod_log_set_handler(void *result)
{
  _log_handler = result;
  return result;
}

void ramrod_log_msg( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_log_msg_cf(CFStringRef format, ...)
{
  int v1 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, format, va);
  if (!v1)
  {
    ramrod_log_msg("(Failed to format log message)\n", v2, v3, v4, v5, v6, v7, v8, v30);
    return;
  }

  uint64_t v9 = v1;
  char CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
  if (CStringPtr)
  {
    char v30 = (char)CStringPtr;
    uint64_t v18 = "%s";
  }

  else
  {
    CFIndex Length = CFStringGetLength(v9);
    CFIndex v20 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v21 = (char *)malloc(v20);
    if (v21)
    {
      uint64_t v22 = v21;
      if (CFStringGetCString(v9, v21, v20, 0x8000100u)) {
        ramrod_log_msg("%s", v23, v24, v25, v26, v27, v28, v29, (char)v22);
      }
      else {
        ramrod_log_msg("(Failed to alloc and convert log message)\n", v23, v24, v25, v26, v27, v28, v29, v30);
      }
      free(v22);
      goto LABEL_12;
    }

    uint64_t v18 = "(Failed to alloc and convert log message)\n";
  }

  ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v30);
LABEL_12:
  CFRelease(v9);
}

void do_ramrod_log_msg(int a1, const char *a2, va_list a3)
{
  __s = 0LL;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&log_mutex);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (_log_handler) {
        _log_handler(__s);
      }
    }

    size_t v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!_log_buffermsgs) {
      goto LABEL_23;
    }
    uint64_t v5 = (char *)log_buffer;
    if (!log_buffer)
    {
      uint64_t v5 = (char *)malloc(0x100000uLL);
      log_buffer = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000LL);
LABEL_23:
        pthread_mutex_unlock(&log_mutex);
        goto LABEL_24;
      }

      log_buffer_head = (uint64_t)v5;
      log_buffer_tail = (uint64_t)v5;
    }

    char v6 = *__s;
    if (*__s)
    {
      uint64_t v7 = v5 + 0x100000;
      uint64_t v8 = (char *)log_buffer_tail;
      uint64_t v9 = log_buffer_head;
      int v10 = __s + 1;
      do
      {
        *uint64_t v8 = v6;
        if (v8 + 1 == v7) {
          uint64_t v8 = v5;
        }
        else {
          ++v8;
        }
        log_buffer_tail = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7) {
            uint64_t v9 = (uint64_t)v5;
          }
          else {
            uint64_t v9 = (uint64_t)(v8 + 1);
          }
          log_buffer_head = v9;
        }

        int v11 = *v10++;
        char v6 = v11;
      }

      while (v11);
    }

    goto LABEL_23;
  }

  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

CFStringRef checkpoint_nvram_encode_unknown()
{
  return CFStringCreateWithFormat(0LL, 0LL, @"UNKNOWN");
}

CFStringRef checkpoint_nvram_encode_string(uint64_t a1, const char **a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = *a2;
  if (!*a2) {
    return 0LL;
  }
  size_t v3 = strlen(*a2);
  if (v3 > 0x100) {
    return CFStringCreateWithFormat(0LL, 0LL, @"~%s", &v2[v3 - 255]);
  }
  else {
    return CFStringCreateWithFormat(0LL, 0LL, @"%s", v2);
  }
}

CFStringRef checkpoint_nvram_encode_id_string(uint64_t a1, unsigned int *a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v3 = *((void *)a2 + 1);
  if (!v3) {
    return 0LL;
  }
  size_t v4 = strlen(*((const char **)a2 + 1));
  if (v4 > 0xF2) {
    return CFStringCreateWithFormat(0LL, 0LL, @"{0x%08X:~%s}", *a2, v4 + v3 - 241);
  }
  else {
    return CFStringCreateWithFormat(0LL, 0LL, @"{0x%08X:%s}", *a2, v3);
  }
}

CFStringRef checkpoint_nvram_encode_long(uint64_t a1, void *a2)
{
  if (a2) {
    return CFStringCreateWithFormat(0LL, 0LL, @"%ld", *a2);
  }
  else {
    return 0LL;
  }
}

CFStringRef checkpoint_nvram_encode_by_boot(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    uint64_t v16 = 0LL;
    asprintf(&v16, "{");
    uint64_t v8 = v16;
    if (v16)
    {
      uint64_t v9 = 0LL;
      int v15 = 0;
      char v10 = 1;
      do
      {
        char v11 = v10;
        uint64_t v12 = (const char *)*((void *)&v2->isa + v9);
        if (v12)
        {
          uint64_t v8 = checkpoint_append_and_free_key_v(v8, checkpoint_boot_type_name[v9], v12, &v15);
          uint64_t v16 = v8;
        }

        char v10 = 0;
        uint64_t v9 = 1LL;
      }

      while ((v11 & 1) != 0);
      uint64_t v16 = checkpoint_append_and_free(v8, "}", (uint64_t)v12, v3, v4, v5, v6, v7, v14);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v16);
      if (v16) {
        free(v16);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0LL;
    asprintf(&v14, "{");
    uint64_t v8 = v14;
    if (v14)
    {
      uint64_t v9 = 0LL;
      int v13 = 0;
      do
      {
        char v10 = *(const char **)((char *)&v2->info + v9);
        if (v10)
        {
          uint64_t v8 = checkpoint_append_and_free_id_v(v8, *(_DWORD *)((char *)&v2->isa + v9), v10, &v13);
          char v14 = v8;
        }

        v9 += 16LL;
      }

      while (v9 != 128);
      char v14 = checkpoint_append_and_free(v8, "}", (uint64_t)v10, v3, v4, v5, v6, v7, v12);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id_int(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0LL;
    asprintf(&v14, "{");
    if (v14)
    {
      uint64_t v9 = 0LL;
      int v13 = 0;
      do
      {
        if (*(_DWORD *)((char *)&v2->isa + v9))
        {
          char v12 = 0LL;
          asprintf(&v12, "%d", *(_DWORD *)((char *)&v2->isa + v9 + 4));
          uint64_t v3 = v12;
          if (v12)
          {
            char v14 = checkpoint_append_and_free_id_v(v14, *(_DWORD *)((char *)&v2->isa + v9), v12, &v13);
            if (v12) {
              free(v12);
            }
          }
        }

        v9 += 8LL;
      }

      while (v9 != 64);
      char v14 = checkpoint_append_and_free(v14, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v11);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id_try(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    uint64_t v19 = 0LL;
    asprintf(&v19, "{");
    if (v19)
    {
      uint64_t v9 = 0LL;
      int v18 = 0;
      p_info = &v2->info;
      do
      {
        char v11 = (int *)v2 + 18 * v9;
        if (*v11)
        {
          uint64_t v22 = 0LL;
          asprintf(&v22, "{");
          if (v22)
          {
            uint64_t v12 = 0LL;
            int v21 = 0;
            do
            {
              int v13 = (const char *)p_info[v12];
              if (v13)
              {
                CFIndex v20 = 0LL;
                asprintf(&v20, "%s", v13);
                uint64_t v3 = v20;
                if (v20)
                {
                  uint64_t v22 = checkpoint_append_and_free_try_v(v22, v12, v20, &v21);
                  if (v20) {
                    free(v20);
                  }
                }
              }

              ++v12;
            }

            while (v12 != 8);
            char v14 = checkpoint_append_and_free(v22, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
            if (v14)
            {
              int v15 = v14;
              uint64_t v19 = checkpoint_append_and_free_id_v(v19, *v11, v14, &v18);
              free(v15);
            }
          }
        }

        ++v9;
        p_info += 9;
      }

      while (v9 != 8);
      uint64_t v19 = checkpoint_append_and_free(v19, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v19);
      if (v19) {
        free(v19);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFStringRef checkpoint_nvram_encode_by_id_try_int(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    int v18 = 0LL;
    asprintf(&v18, "{");
    if (v18)
    {
      uint64_t v9 = 0LL;
      int v17 = 0;
      CFStringRef v10 = v2;
      do
      {
        char v11 = (int *)v2 + 11 * v9;
        if (*v11)
        {
          int v21 = 0LL;
          asprintf(&v21, "{");
          if (v21)
          {
            uint64_t v12 = 0LL;
            int v20 = 0;
            do
            {
              if (*((_BYTE *)&v10[1].isa + v12 + 4))
              {
                uint64_t v19 = 0LL;
                asprintf(&v19, "%d", *((_DWORD *)&v10->isa + v12 + 1));
                uint64_t v3 = v19;
                if (v19)
                {
                  int v21 = checkpoint_append_and_free_try_v(v21, v12, v19, &v20);
                  if (v19) {
                    free(v19);
                  }
                }
              }

              ++v12;
            }

            while (v12 != 8);
            int v13 = checkpoint_append_and_free(v21, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
            if (v13)
            {
              char v14 = v13;
              int v18 = checkpoint_append_and_free_id_v(v18, *v11, v13, &v17);
              free(v14);
            }
          }
        }

        ++v9;
        CFStringRef v10 = (CFStringRef)((char *)v10 + 44);
      }

      while (v9 != 8);
      int v18 = checkpoint_append_and_free(v18, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
      CFStringRef v2 = CFStringCreateWithFormat(0LL, 0LL, @"%s", v18);
      if (v18) {
        free(v18);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

uint64_t checkpoint_nvram_is_available( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v10 = *(_DWORD *)(a1 + 664);
  if (!v10) {
    goto LABEL_160;
  }
  if (v10 == 1)
  {
    uint64_t v11 = 1LL;
    goto LABEL_20;
  }

  uint64_t v11 = 0LL;
  if (a2)
  {
    if (v10 == 2)
    {
LABEL_160:
      if (ramrod_check_NVRAM_access())
      {
        if (*(_BYTE *)(a1 + 2272))
        {
          if (!*(_BYTE *)(a1 + 2273))
          {
LABEL_24:
            int v17 = *(_DWORD *)(a1 + 664);
            if (*(_BYTE *)(a1 + 669))
            {
LABEL_149:
              uint64_t v11 = 1LL;
              *(_DWORD *)(a1 + 664) = 1;
              if (!v8)
              {
                if (v17) {
                  checkpoint_history_add(a1, 2, 1, 0, 256, "NVRAM access has become available", 0, 0, 0LL);
                }
                else {
                  checkpoint_history_add(a1, 2, 1, 0, 256, "NVRAM access available on initial check", 0, 0, 0LL);
                }
              }

              goto LABEL_20;
            }

            BOOL v18 = *(_DWORD *)a1 == 1 && v17 == 2;
            uint64_t v19 = 8LL;
            if (v18) {
              uint64_t v19 = 400LL;
            }
            uint64_t v20 = a1 + v19;
            int v21 = (void *)(v20 + 664);
            if (*(_BYTE *)(v20 + 668)) {
              ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n",  v12,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_handle_first_available");
            }
            else {
              checkpoint_nvram_collect((int *)a1, (uint64_t)v21, a3, a4, a5, a6, a7, a8);
            }
            if (*(_DWORD *)a1 == 1)
            {
              int v29 = *(_DWORD *)(a1 + 88);
              if (*(_DWORD *)(a1 + 96))
              {
                if (v29 == 2) {
                  uint64_t v39 = (unsigned int *)&checkpoint_nvram_ota_monitor_aware_awoken;
                }
                else {
                  uint64_t v39 = (unsigned int *)&checkpoint_nvram_restore_monitor_aware_awoken;
                }
              }

              else
              {
                if (v29 == 2)
                {
                  int v31 = checkpoint_nvram_check_collection( a1,  (uint64_t)v21,  checkpoint_nvram_ota_monitor_aware_init,  v24,  v25,  v26,  v27,  v28);
                  checkpoint_nvram_delete_var_if_matches(a1, (uint64_t)v21);
                  goto LABEL_53;
                }

                uint64_t v39 = (unsigned int *)&checkpoint_nvram_restore_monitor_aware_init;
              }

              int v31 = checkpoint_nvram_check_collection(a1, (uint64_t)v21, v39, v24, v25, v26, v27, v28);
LABEL_53:
              uint64_t v43 = v21[6];
              if (!v43)
              {
LABEL_110:
                if (!(_DWORD)v43 && v31 && !*(_BYTE *)(a1 + 106) && !*(_BYTE *)(a1 + 100) && !*(_BYTE *)(a1 + 104)) {
                  checkpoint_nvram_store_anomaly( a1,  v32,  "[monitor_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
LABEL_116:
                if (*(_BYTE *)(a1 + 104))
                {
                  if (v17 == 2)
                  {
                    uint64_t v73 = 0LL;
                    uint64_t v74 = (void *)(a1 + 1496);
                    uint64_t v75 = &dword_100061B78;
LABEL_119:
                    uint64_t v76 = *v75;
                    if (v73 != v76)
                    {
                      uint64_t v77 = a1 + 16LL * (int)v76;
                      *(_BYTE *)(v77 + 1492) = *((_BYTE *)v74 - 4);
                      *((_BYTE *)v74 - 4) = 0;
                      uint64_t v78 = *v74;
                      *uint64_t v74 = *(void *)(v77 + 1496);
                      *(void *)(v77 + 1496) = v78;
                    }

                    while (v73 != 47)
                    {
                      v74 += 2;
                      v75 += 8;
                      ++v73;
                      if (*(_BYTE *)(a1 + 104)) {
                        goto LABEL_119;
                      }
                    }
                  }
                }

                else if (*(_DWORD *)a1 != 1 && *(_DWORD *)(a1 + 88) == 2)
                {
                  ramrod_log_msg("%s\n", v32, v33, v34, v35, v36, v37, v38, (char)"void clear_stale_ota_nvram(void)");
                  checkpoint_nvram_delete_var_raw(@"boot-breadcrumbs");
                  checkpoint_nvram_delete_var_raw(@"OTA-pre-conversion");
                  checkpoint_nvram_delete_var_raw(@"OTA-post-conversion");
                  checkpoint_nvram_delete_var_raw(@"ota-conv-panic-indicator");
                  checkpoint_nvram_delete_var_raw(@"OTA-fsck-metrics");
                  checkpoint_nvram_delete_var_raw(@"OTA-sealvolume-metrics");
                  checkpoint_nvram_delete_var_raw(@"OTA-migrator-metrics");
                  for (uint64_t i = 0LL; i != 28; ++i)
                  {
                    uint64_t v80 = (const __CFString **)&checkpoint_nvram_map[4 * dword_100058998[i]];
                    checkpoint_nvram_delete_var_raw(v80[1]);
                    checkpoint_nvram_delete_var_raw(*v80);
                  }
                }

                if (*(_DWORD *)(a1 + 96))
                {
                  if (*(_BYTE *)(a1 + 101))
                  {
                    if (*(_BYTE *)(a1 + 104))
                    {
                      if (*(_BYTE *)(a1 + 106))
                      {
                        unsigned int v81 = 9;
                      }

                      else if (*(_BYTE *)(a1 + 105))
                      {
                        unsigned int v81 = 12;
                      }

                      else if (*(_BYTE *)(a1 + 100))
                      {
                        unsigned int v81 = 10;
                      }

                      else
                      {
                        unsigned int v81 = 11;
                      }
                    }

                    else if (*(_BYTE *)(a1 + 103))
                    {
                      unsigned int v81 = 10;
                    }

                    else
                    {
                      unsigned int v81 = 3;
                    }
                  }

                  else if (*(_BYTE *)(a1 + 102))
                  {
                    if (*(_BYTE *)(a1 + 104)) {
                      unsigned int v81 = 7;
                    }
                    else {
                      unsigned int v81 = 6;
                    }
                  }

                  else
                  {
                    unsigned int v81 = 2;
                  }

                  checkpoint_outcome_progress(a1, v81, v33, v34, v35, v36, v37, v38);
                }

                else
                {
                  checkpoint_outcome_init(a1, 1, v33, v34, v35, v36, v37, v38);
                }

                *(_BYTE *)(a1 + 669) = 1;
                goto LABEL_149;
              }

              unsigned int outcome_type = checkpoint_get_outcome_type(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
              if (outcome_type < 0x22)
              {
                uint64_t v52 = &checkpoint_outcome_attributes[3 * outcome_type];
              }

              else
              {
                ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n",  v45,  v46,  v47,  v48,  v49,  v50,  v51,  (char)"checkpoint_get_outcome_attributes");
                uint64_t v52 = checkpoint_outcome_attributes;
              }

              uint64_t v53 = (const __CFString *)v21[6];
              bzero(v83, 0x400uLL);
              if (*v52 == 2)
              {
                int v54 = *((unsigned __int8 *)v52 + 8);
                if (*((_BYTE *)v52 + 8)) {
                  *(_BYTE *)(a1 + 106) = 1;
                }
                if (*((_BYTE *)v52 + 7))
                {
                  int v31 = 0;
                  *(_BYTE *)(a1 + 102) = 1;
                }

                if (!*((_BYTE *)v52 + 5))
                {
                  if (!*((_BYTE *)v52 + 4) || !*((_BYTE *)v52 + 6))
                  {
                    LODWORD(v43) = 0;
                    goto LABEL_110;
                  }

                  if (v54)
                  {
                    LODWORD(v43) = 0;
                    *(_BYTE *)(a1 + 101) = 1;
                    goto LABEL_110;
                  }

                  uint64_t v43 = v21[8];
                  if (!v43) {
                    goto LABEL_110;
                  }
LABEL_98:
                  uint64_t v69 = (const __CFString *)v21[7];
                  *(_BYTE *)(a1 + 101) = 1;
                  if (v69 && CFStringCompare(v69, @"true", 0LL) == kCFCompareEqualTo)
                  {
                    *(_BYTE *)(a1 + 100) = 1;
                    LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                    if (!*((_BYTE *)v52 + 5))
                    {
                      *(_BYTE *)(a1 + 103) = 1;
                      goto LABEL_110;
                    }

                    LODWORD(v43) = 0;
                    goto LABEL_65;
                  }

                  goto LABEL_100;
                }

                if (v54)
                {
                  LODWORD(v43) = 0;
                  *(_BYTE *)(a1 + 101) = 1;
LABEL_65:
                  *(_WORD *)(a1 + 104) = 257;
                  goto LABEL_110;
                }

                uint64_t v43 = v21[8];
                if (v43) {
                  goto LABEL_98;
                }
              }

              else
              {
                LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                if (!*((_BYTE *)v52 + 5)) {
                  goto LABEL_110;
                }
                if (!v21[8])
                {
                  checkpoint_get_nvram_value_string(v53, v83);
                  checkpoint_nvram_store_anomaly(a1, v71, "[monitor_aware]outcome=%s(reboot_retry_not_in_zone)");
                  goto LABEL_102;
                }

                uint64_t v55 = (const __CFString *)v21[7];
                if (!v55 || CFStringCompare(v55, @"true", 0LL))
                {
LABEL_100:
                  checkpoint_get_nvram_value_string(v53, v83);
                  checkpoint_nvram_store_anomaly(a1, v70, "[monitor_aware]outcome=%s(reboot_retry_disabled)");
LABEL_102:
                  LODWORD(v43) = 1;
                  goto LABEL_110;
                }

                LODWORD(v43) = 0;
              }

              *(_BYTE *)(a1 + 104) = 1;
              goto LABEL_110;
            }

            char v30 = (const __CFString *)v21[7];
            if (v30 && CFStringCompare(v30, @"true", 0LL) == kCFCompareEqualTo) {
              *(_BYTE *)(a1 + 100) = 1;
            }
            else {
              ramrod_log_msg("AP nonce will not be touched\n", v22, v23, v24, v25, v26, v27, v28, v82);
            }
            int v40 = *(_DWORD *)(a1 + 88);
            if (*(_DWORD *)(a1 + 96))
            {
              if (v40 == 2)
              {
                int v41 = checkpoint_nvram_check_collection( a1,  (uint64_t)v21,  checkpoint_nvram_ota_engine_aware_step,  v24,  v25,  v26,  v27,  v28);
                checkpoint_nvram_delete_var_if_matches(a1, (uint64_t)v21);
                goto LABEL_72;
              }

              uint64_t v42 = (unsigned int *)&checkpoint_nvram_restore_engine_aware_step;
            }

            else if (v40 == 2)
            {
              uint64_t v42 = (unsigned int *)&checkpoint_nvram_ota_engine_aware_init;
            }

            else
            {
              uint64_t v42 = (unsigned int *)&checkpoint_nvram_restore_engine_aware_init;
            }

            int v41 = checkpoint_nvram_check_collection(a1, (uint64_t)v21, v42, v24, v25, v26, v27, v28);
LABEL_72:
            if (!v21[6])
            {
              *(_BYTE *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              if (*(_DWORD *)(a1 + 88) == 2)
              {
                if (v21[8]) {
                  checkpoint_nvram_delete_var(a1, 7LL, 0LL, 0LL, v35, v36, v37, v38);
                }
                uint64_t v65 = (const __CFString *)v21[3];
                if (v65 && CFStringCompare(v65, @"recover", 0LL)) {
                  checkpoint_nvram_delete_var(a1, 2LL, 1LL, 0LL, v35, v36, v37, v38);
                }
                if (v21[4]) {
                  checkpoint_nvram_delete_var(a1, 3LL, 1LL, 0LL, v35, v36, v37, v38);
                }
              }

              goto LABEL_105;
            }

            unsigned int v56 = checkpoint_get_outcome_type(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
            if (v56 < 0x22)
            {
              uint64_t v64 = &checkpoint_outcome_attributes[3 * v56];
            }

            else
            {
              ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n",  v57,  v58,  v59,  v60,  v61,  v62,  v63,  (char)"checkpoint_get_outcome_attributes");
              uint64_t v64 = checkpoint_outcome_attributes;
            }

            uint64_t v66 = (const __CFString *)v21[6];
            bzero(v83, 0x400uLL);
            if (*v64 != 1)
            {
              if (*((_BYTE *)v64 + 6))
              {
                if (v21[8])
                {
                  checkpoint_reboot_retry_chassis_aware((_BYTE *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
                }

                else
                {
                  checkpoint_get_nvram_value_string(v66, v83);
                  checkpoint_nvram_store_anomaly( a1,  v72,  "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)",  v83);
                }
              }

              *(_BYTE *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              goto LABEL_105;
            }

            uint64_t v67 = v21[8];
            if (*((_BYTE *)v64 + 5))
            {
              if (!v67)
              {
                checkpoint_get_nvram_value_string(v66, v83);
                checkpoint_nvram_store_anomaly( a1,  v68,  "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)",  v83);
LABEL_105:
                if (v41 && !*(_BYTE *)(a1 + 104)) {
                  checkpoint_nvram_store_anomaly( a1,  v32,  "[chassis_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
                goto LABEL_116;
              }
            }

            else if (!v67)
            {
              goto LABEL_105;
            }

            checkpoint_reboot_retry_chassis_aware((_BYTE *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
            goto LABEL_105;
          }
        }

        else
        {
          checkpoint_nvram_collect_var(a1, 1u, 0x2Fu, (const __CFString **)(a1 + 1056));
          if (!*(void *)(a1 + 1056))
          {
            *(_BYTE *)(a1 + 2272) = 1;
            goto LABEL_24;
          }

          if (*(_DWORD *)a1 == 2) {
            checkpoint_nvram_delete_var(a1, 47LL, 0LL, 0LL, a5, a6, a7, a8);
          }
          *(_BYTE *)(a1 + 2273) = 1;
          *(_BYTE *)(a1 + 66_Block_object_dispose(va, 8) = 0;
          int v13 = (const __CFString **)(a1 + 992);
          uint64_t v14 = -4LL;
          do
            checkpoint_nvram_collect_var(a1, 1u, v14 + 43, v13++);
          while (!__CFADD__(v14++, 1LL));
          *(_BYTE *)(a1 + 2272) = 1;
        }
      }

      *(_DWORD *)(a1 + 664) = 2;
      if (!v8) {
        checkpoint_history_add(a1, 2, 1, 0, 256, "NVRAM access is not currently available", 0, 0, 0LL);
      }
      uint64_t v11 = 0LL;
    }
  }

void *checkpoint_history_add( uint64_t a1, int a2, int a3, int a4, int a5, const char *a6, int a7, int a8, const void *a9)
{
  int v17 = calloc(1uLL, 0x78uLL);
  if (!v17) {
    return v17;
  }
  unint64_t v130 = 0LL;
  asprintf(&v130, "%s", a6);
  if (!v130)
  {
    free(v17);
    return 0LL;
  }

  *((_DWORD *)v17 + 2) = a2;
  v17[2] = time(0LL);
  gettimeofday((timeval *)(v17 + 3), 0LL);
  *((_DWORD *)v17 + 10) = getpid();
  *((_DWORD *)v17 + 11) = getppid();
  *((_DWORD *)v17 + 12) = a3;
  *((_DWORD *)v17 + 13) = a4;
  *((_DWORD *)v17 + 14) = a5;
  v17[8] = v130;
  *((_DWORD *)v17 + 1_Block_object_dispose(va, 8) = a7;
  *((_DWORD *)v17 + 19) = a8;
  if (a9)
  {
    v17[10] = a9;
    CFRetain(a9);
    a5 = *((_DWORD *)v17 + 14);
  }

  *((_DWORD *)v17 + 22) = a5 | (*((_DWORD *)v17 + 2) << 16) | 0x11000000;
  *(void *)uint64_t v134 = 0x1500000001LL;
  v131[0] = 0LL;
  v131[1] = 0LL;
  size_t v132 = 16LL;
  if (sysctl(v134, 2u, v131, &v132, 0LL, 0LL)) {
    uint64_t v25 = -1LL;
  }
  else {
    uint64_t v25 = v17[2] - (unint64_t)v131[0];
  }
  int v26 = *((_DWORD *)v17 + 2);
  switch(v26)
  {
    case 1:
      checkpoint_nvram_store_by_id(a1, 10LL, *((unsigned int *)v17 + 22), (const char *)v17[8], v21, v22, v23, v24);
      goto LABEL_69;
    case 2:
      goto LABEL_69;
    case 3:
      if (!*((_DWORD *)v17 + 18))
      {
        uint64_t v38 = 23LL;
        if (!*(_BYTE *)(a1 + 104)) {
          uint64_t v38 = 11LL;
        }
        int v39 = *(_DWORD *)(a1 + 1472) + 1;
        *(_DWORD *)(a1 + 1472) = v39;
        uint64_t v40 = *((unsigned int *)v17 + 22);
        int v41 = *(int **)(a1 + 16 * v38 + 1496);
        if (!v41) {
          goto LABEL_28;
        }
        unint64_t v42 = 0LL;
        do
        {
          int v44 = *v41;
          v41 += 2;
          int v43 = v44;
          if (v42 > 6) {
            break;
          }
          ++v42;
        }

        while (v43);
        if (!v43)
        {
          *(v41 - 2) = v40;
          *(v41 - 1) = v39;
          *(_BYTE *)(a1 + 16 * v38 + 1492) = 1;
        }

        else
        {
LABEL_28:
          int v45 = *(_DWORD *)(a1 + 1476);
          if (!v45)
          {
            ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  v18,  v40,  v20,  v21,  v22,  v23,  v24,  (char)"checkpoint_nvram_store_lost");
            int v45 = *(_DWORD *)(a1 + 1476);
            uint64_t v40 = *((unsigned int *)v17 + 22);
          }

          *(_DWORD *)(a1 + 1476) = v45 + 1;
        }

        checkpoint_nvram_store_by_id(a1, 12LL, v40, (const char *)v17[8], v21, v22, v23, v24);
      }

      goto LABEL_68;
    case 4:
    case 7:
      goto LABEL_15;
    case 5:
      goto LABEL_13;
    case 6:
      checkpoint_nvram_store_by_id_try( a1,  14LL,  *((unsigned int *)v17 + 22),  *((unsigned int *)v17 + 18),  (const char *)v17[8],  v22,  v23,  v24);
      goto LABEL_69;
    default:
      if (v26 == 32)
      {
LABEL_15:
        checkpoint_nvram_store_by_id_try_int( a1,  13LL,  *((_DWORD *)v17 + 14) | 0x11070000u,  *((unsigned int *)v17 + 18),  *((unsigned int *)v17 + 19),  v22,  v23,  v24);
        uint64_t v28 = (__CFError *)v17[10];
        if (v28)
        {
          CFIndex Code = CFErrorGetCode(v28);
          CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)v17[10]);
          int v31 = checkpoint_cferror_alloc_string((CFErrorRef)v17[10]);
          checkpoint_nvram_store_by_id_try_int( a1,  15LL,  *((unsigned int *)v17 + 22),  *((unsigned int *)v17 + 18),  Code,  v32,  v33,  v34);
          if (Domain)
          {
            bzero(buffer, 0x400uLL);
            CFStringGetCString(Domain, (char *)buffer, 1024LL, 0x8000100u);
            checkpoint_nvram_store_by_id_try( a1,  16LL,  *((unsigned int *)v17 + 22),  *((unsigned int *)v17 + 18),  (const char *)buffer,  v35,  v36,  v37);
          }

          if (v31)
          {
            checkpoint_nvram_store_by_id(a1, 17LL, *((unsigned int *)v17 + 22), v31, v21, v22, v23, v24);
            free(v31);
          }
        }

        goto LABEL_68;
      }

      if (v26 != 33) {
        goto LABEL_69;
      }
LABEL_13:
      uint64_t v20 = *((unsigned int *)v17 + 18);
      int v27 = *((_DWORD *)v17 + 14);
      if ((_DWORD)v20)
      {
        checkpoint_nvram_store_by_id_try_int(a1, 13LL, v27 | 0x11070000u, v20, 0LL, v22, v23, v24);
        goto LABEL_68;
      }

      uint64_t v46 = 23LL;
      if (!*(_BYTE *)(a1 + 104)) {
        uint64_t v46 = 11LL;
      }
      uint64_t v47 = a1 + 16 * v46;
      uint64_t v48 = *(void **)(v47 + 1496);
      if (!v48) {
        goto LABEL_45;
      }
      int v49 = v27 | 0x11030000;
      if (*(_DWORD *)v48 == v49)
      {
        uint64_t v50 = 0LL;
        void *v48 = 0LL;
LABEL_37:
        uint64_t v51 = v50;
        do
        {
          v48[v51] = v48[v51 + 1];
          ++v51;
        }

        while (v51 != 7);
        goto LABEL_39;
      }

      uint64_t v52 = v48 + 1;
      unint64_t v53 = -1LL;
      while (v53 != 6)
      {
        int v54 = *v52;
        v52 += 2;
        ++v53;
        if (v54 == v49)
        {
          *((void *)v52 - 1) = 0LL;
          if (v53 <= 5)
          {
            uint64_t v50 = v53 + 1;
            goto LABEL_37;
          }

LABEL_39:
          v48[7] = 0LL;
          *(_BYTE *)(v47 + 1492) = 1;
          goto LABEL_48;
        }
      }

LABEL_63:
        int v66 = *(_DWORD *)(a1 + 1480);
        if (!v66)
        {
          ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"checkpoint_nvram_remove_lost");
          int v66 = *(_DWORD *)(a1 + 1480);
        }

        *(_DWORD *)(a1 + 1480) = v66 + 1;
      }

LABEL_68:
      checkpoint_nvram_store_long(a1, 18LL, v25, v20, v21, v22, v23, v24);
      checkpoint_nvram_store_long(a1, 21LL, (uint64_t)*((double *)v17 + 14), v67, v68, v69, v70, v71);
LABEL_69:
      *int v17 = 0LL;
      **(void **)(a1 + 192) = v17;
      *(void *)(a1 + 192) = v17;
      unsigned int v72 = *(_DWORD *)(a1 + 200) + 1;
      *(_DWORD *)(a1 + 200) = v72;
      if (v72 >= 0x201)
      {
        uint64_t v73 = (void **)(a1 + 184);
        do
        {
          uint64_t v74 = *v73;
          uint64_t v75 = (void *)**v73;
          *uint64_t v73 = v75;
          if (!v75) {
            *(void *)(a1 + 192) = v73;
          }
          *(_DWORD *)(a1 + 200) = v72 - 1;
          uint64_t v76 = (void *)v74[8];
          if (v76)
          {
            free(v76);
            v74[8] = 0LL;
          }

          uint64_t v77 = (const void *)v74[10];
          if (v77) {
            CFRelease(v77);
          }
          free(v74);
          unsigned int v72 = *(_DWORD *)(a1 + 200);
        }

        while (v72 > 0x200);
      }

      memset(buffer, 0, 56);
      v131[0] = 0LL;
      gmtime_r(v17 + 2, buffer);
      uint64_t v78 = *((unsigned int *)v17 + 2);
      else {
        uint64_t v79 = checkpoint_history_type_name[v78];
      }
      asprintf( v131,  "[%02u:%02u:%02u.%04u-GMT]{%u>%u} CHECKPOINT %s",  buffer[0].tm_hour,  buffer[0].tm_min,  buffer[0].tm_sec,  *((_DWORD *)v17 + 8) / 1000,  *((_DWORD *)v17 + 11),  *((_DWORD *)v17 + 10),  v79);
      uint64_t v80 = v131[0];
      *(void *)&buffer[0].tm_sec = 0LL;
      if (*((_DWORD *)v17 + 19))
      {
        asprintf((char **)buffer, "(FAILURE:%d) ");
      }

      else
      {
        unsigned int v87 = *((_DWORD *)v17 + 2);
        if (v87 <= 0x1C && ((1 << v87) & 0x18000080) != 0) {
          asprintf((char **)buffer, "(SUCCESS) ", v127);
        }
        else {
          asprintf((char **)buffer, " ", v127);
        }
      }

      uint64_t v88 = *(char **)&buffer[0].tm_sec;
      if (!v80 || !*(void *)&buffer[0].tm_sec) {
        goto LABEL_149;
      }
      *(void *)&buffer[0].tm_sec = 0LL;
      if (*((_DWORD *)v17 + 14))
      {
        int v89 = *((_DWORD *)v17 + 2);
        if (v89 == 28 || v89 == 1)
        {
          asprintf((char **)buffer, "[0x%04X] %s");
        }

        else if (*((_DWORD *)v17 + 12) == 1)
        {
          asprintf((char **)buffer, "%s");
        }

        else
        {
          asprintf((char **)buffer, "%s:[0x%04X] %s");
        }

        uint64_t v90 = *(char **)&buffer[0].tm_sec;
      }

      else
      {
        uint64_t v90 = 0LL;
      }

      v131[0] = 0LL;
      int v91 = *((_DWORD *)v17 + 2);
      if (v91 == 28)
      {
        *(void *)&buffer[0].tm_sec = 0LL;
        if (!*((_DWORD *)v17 + 19))
        {
          asprintf((char **)buffer, "... %s");
          goto LABEL_122;
        }

        uint64_t v94 = checkpoint_nvram_copy_encode_c_string(a1, 9LL, v81, v82, v83, v84, v85, v86);
        char v100 = checkpoint_nvram_copy_string(a1, a1 + 1064, 12LL, v95, v96, v97, v98, v99);
        unsigned __int8 v101 = v100;
        uint64_t v102 = *(unsigned int *)(a1 + 108);
        else {
          uint64_t v103 = checkpoint_failure_type_name[v102];
        }
        if (v94)
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s] %s", v103, v94);
            uint64_t v112 = v94;
            goto LABEL_121;
          }

          asprintf((char **)buffer, "[%s] %s %s", v103, v100, v94);
          free(v94);
        }

        else
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s]");
LABEL_122:
            int v92 = *(char **)&buffer[0].tm_sec;
            if (v90) {
              goto LABEL_106;
            }
            goto LABEL_123;
          }

          asprintf((char **)buffer, "[%s] %s", v103, v100);
        }

        uint64_t v112 = v101;
LABEL_121:
        free(v112);
        goto LABEL_122;
      }

      if (v91 == 27)
      {
        int v92 = checkpoint_nvram_copy_encode_c_string(a1, 13LL, v81, v82, v83, v84, v85, v86);
        int v93 = strcmp(v92, "{}");
        if (v92 && !v93)
        {
          free(v92);
          if (!v90) {
            goto LABEL_125;
          }
LABEL_108:
          asprintf(v131, "%s:%s%s", v80, v88, v90);
          char v111 = 0;
          int v92 = 0LL;
          goto LABEL_127;
        }
      }

      else
      {
        int v92 = checkpoint_cferror_alloc_string((CFErrorRef)v17[10]);
      }

      if (v90)
      {
LABEL_106:
        if (v92)
        {
          asprintf(v131, "%s:%s%s %s", v80, v88, v90, v92);
          char v111 = 0;
          goto LABEL_127;
        }

        goto LABEL_108;
      }

LABEL_125:
      asprintf(v131, "%s:%s", v80, v88);
      int v92 = 0LL;
LABEL_126:
      char v111 = 1;
LABEL_127:
      char v113 = (char)v131[0];
      if (v131[0])
      {
        char v129 = v111;
        if (*((_DWORD *)v17 + 2) == 28)
        {
          if (*(_DWORD *)(a1 + 88) == 2) {
            int v114 = 1;
          }
          else {
            int v114 = 3;
          }
        }

        else
        {
          int v114 = 1;
        }

        while (1)
        {
          ramrod_log_msg("%s\n", v104, v105, v106, v107, v108, v109, v110, v113);
          if (*((_DWORD *)v17 + 2) == 28) {
            ramrod_log_msg( "\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n",  v115,  v116,  v117,  v118,  v119,  v120,  v121,  v128);
          }
          if (v114 < 2) {
            break;
          }
          --v114;
          sleep(1u);
        }

        int v122 = v131[0];
        BOOL v123 = calloc(1uLL, 0x10uLL);
        if (v123)
        {
          uint64_t v124 = v123;
          v123[1] = v122;
          if (*(_DWORD *)a1 == 1)
          {
            *BOOL v123 = 0LL;
            **(void **)(a1 + 480) = v123;
            *(void *)(a1 + 480) = v123;
          }

          else
          {
            pthread_mutex_lock((pthread_mutex_t *)(a1 + 232));
            int v125 = *(_DWORD *)a1;
            void *v124 = 0LL;
            **(void **)(a1 + 480) = v124;
            *(void *)(a1 + 480) = v124;
            if (v125 != 1) {
              pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232));
            }
          }

          *(_BYTE *)(a1 + 20_Block_object_dispose(va, 8) = 1;
          char v111 = v129;
        }

        else if (v122)
        {
          free(v122);
        }
      }

      if ((v111 & 1) == 0) {
        free(v90);
      }
      if (v92) {
        free(v92);
      }
LABEL_149:
      if (v80) {
        free(v80);
      }
      if (v88) {
        free(v88);
      }
      return v17;
  }

void checkpoint_nvram_collect( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a2 + 4))
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_collect");
    return;
  }

  int v10 = (const __CFString **)(a2 + 8);
  for (uint64_t i = 1LL; i != 49; ++i)
  {
    checkpoint_nvram_collect_var((uint64_t)a1, *(_DWORD *)a2, i - 1, v10);
    int v16 = *a1;
    if ((i - 40) <= 3 && v16 == 2)
    {
      if (*(void *)(a2 + 8 * i)) {
        goto LABEL_12;
      }
    }

    else if ((i - 44) <= 3 && v16 == 2)
    {
      int v17 = *(const __CFString **)(a2 + 8 * i);
      if (v17)
      {
        bzero(v23, 0x400uLL);
        checkpoint_get_nvram_value_string(v17, v23);
        checkpoint_nvram_store_string((uint64_t)a1, (i - 5), v23, v18, v19, v20, v21, v22);
LABEL_12:
        checkpoint_nvram_delete_var((uint64_t)a1, i - 1, 0LL, 0LL, v12, v13, v14, v15);
      }
    }

    ++v10;
  }

  *(_BYTE *)(a2 + 4) = 1;
}

uint64_t checkpoint_get_outcome_type( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = checkpoint_nvram_copy_string(a1, a2, 5LL, a4, a5, a6, a7, a8);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0LL;
  do
  {
    else {
      uint64_t v11 = 0LL;
    }
    if ((_DWORD)v11) {
      break;
    }
  }

  while (v10++ < 0x21);
  free(v9);
  return v11;
}

void checkpoint_nvram_store_anomaly(uint64_t a1, uint64_t a2, char *a3, ...)
{
  v8[0] = 0LL;
  va_copy((va_list)&v8[1], va);
  vasprintf(v8, a3, va);
  if (v8[0])
  {
    checkpoint_history_add(a1, 30, 1, 0, 260, v8[0], 0, 0, 0LL);
    checkpoint_nvram_store_by_id(a1, 8LL, *(unsigned int *)(a1 + 120), v8[0], v4, v5, v6, v7);
    if (v8[0])
    {
      free(v8[0]);
      v8[0] = 0LL;
    }
  }

  ++*(_DWORD *)(a1 + 120);
}

void checkpoint_outcome_progress( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 96);
  uint64_t v9 = (uint64_t)*(&checkpoint_outcome_progress_table + v8);
  if (*(_DWORD *)(v9 + 4LL * a2))
  {
    *(_DWORD *)(a1 + 92) = v8;
    uint64_t v12 = *(unsigned int *)(v9 + 4LL * a2);
    *(_DWORD *)(a1 + 96) = v12;
    else {
      uint64_t v13 = checkpoint_outcome_names[v12];
    }
    checkpoint_nvram_store_string(a1, 5LL, v13, a4, a5, a6, a7, a8);
    checkpoint_log_progress(a1, a2);
  }

void checkpoint_nvram_delete_var( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 < 0x30)
  {
    uint64_t v9 = &checkpoint_nvram_map[4 * a2];
    if ((_DWORD)a3 || (*((_DWORD *)v9 + 6) - 5) < 0xFFFFFFFD)
    {
      bzero(buffer, 0x400uLL);
      if (*(_DWORD *)(a1 + 88) == 1) {
        unint64_t v10 = (CFStringRef *)v9;
      }
      else {
        unint64_t v10 = (CFStringRef *)(v9 + 1);
      }
      uint64_t v11 = *v10;
      CFStringGetCString(*v10, buffer, 1024LL, 0x8000100u);
      checkpoint_nvram_delete_var_raw(v11);
    }

    else
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of BOOT-CONTROL NVRAM ID %u\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_delete_var");
    }
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of NVRAM ID %u\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_delete_var");
  }

char *checkpoint_get_nvram_value_string(const __CFString *a1, char *a2)
{
  if (a1) {
    CFStringGetCString(a1, a2, 1024LL, 0x8000100u);
  }
  else {
    bzero(a2, 0x400uLL);
  }
  return a2;
}

void checkpoint_nvram_store_string( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }

  uint64_t v10 = a2;
LABEL_7:
  if (((0xFFFC000000FEuLL >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void ***)(a1 + 16 * v10 + 1496);
    if (v11)
    {
      if (*v11)
      {
        free(*v11);
        *uint64_t v11 = 0LL;
      }

      checkpoint_nvram_store_set_string(a1 + 1456, (char **)v11, a3, a4, a5, a6, a7, a8);
      *(_BYTE *)(a1 + 16 * v10 + 1492) = 1;
      return;
    }
  }

LABEL_12:
  int v12 = *(_DWORD *)(a1 + 1476);
  if (!v12)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    int v12 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v12 + 1;
}

void checkpoint_access_obtain( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 != 1) {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
    }
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_access_obtain");
  }

void checkpoint_access_yield( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 != 1) {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    }
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_access_yield");
  }

char *checkpoint_cferror_alloc_string(CFErrorRef err)
{
  if (!err) {
    return 0LL;
  }
  int v1 = err;
  CFStringRef v2 = 0LL;
  unsigned int v3 = 0;
  do
  {
    uint64_t v4 = CFErrorCopyUserInfo(v1);
    CFStringRef v2 = checkpoint_append_and_free(v2, "[%d]", v5, v6, v7, v8, v9, v10, v3);
    if (!v4) {
      break;
    }
    char v22 = 0;
    CFTypeRef Value = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedRecoverySuggestionKey);
    int v12 = checkpoint_cferror_append(v2, (char)"RS", Value, &v22);
    uint64_t v13 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedDescriptionKey);
    uint64_t v14 = checkpoint_cferror_append(v12, (char)"LD", v13, &v22);
    uint64_t v15 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorDescriptionKey);
    int v16 = checkpoint_cferror_append(v14, (char)"D", v15, &v22);
    int v17 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedFailureReasonKey);
    CFStringRef v2 = checkpoint_cferror_append(v16, (char)"FR", v17, &v22);
    int v1 = (__CFError *)CFDictionaryGetValue(v4, kCFErrorUnderlyingErrorKey);
    CFRelease(v4);
    if (!v1) {
      break;
    }
  }

  while (v3++ < 0xF);
  size_t v19 = strlen(v2);
  if (v19 >= 0xF3)
  {
    uint64_t v21 = 0LL;
    asprintf(&v21, "%s", &v2[v19 - 242]);
    if (v2) {
      free(v2);
    }
    return v21;
  }

  return v2;
}

uint64_t checkpoint_closure_context_get_step_desc(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t checkpoint_closure_context_should_retry(uint64_t result)
{
  if (result)
  {
    int v1 = *(_DWORD *)(result + 40);
    *(_DWORD *)(result + 40) = v1 + 1;
    return !*(_BYTE *)(result + 11) && v1 < *(_DWORD *)(*(void *)result + 28LL);
  }

  return result;
}

uint64_t checkpoint_closure_context_handle_simulator_actions( uint64_t *a1, uint64_t a2, int *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n",  a2,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_actions");
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n",  a2,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_actions");
  }

  return a2;
}

uint64_t checkpoint_simulator_action( uint64_t a1, uint64_t a2, uint64_t a3, int *a4, const void **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a3;
  unsigned int v13 = a3;
  checkpoint_access_obtain(a1, a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  checkpoint_simulator_configure(a1, v14, v15, v16, v17, v18, v19, v20);
  if (!*(_DWORD *)(a1 + 2276) || !*(void *)(a1 + 2288)) {
    goto LABEL_14;
  }
  CFStringRef v28 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
  if (Count < 1)
  {
    BOOL v36 = 0;
    if (!v28) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  CFIndex v30 = Count;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), 0LL);
  if (CFStringCompare(v28, ValueAtIndex, 0LL) == kCFCompareEqualTo)
  {
    BOOL v36 = 1;
    if (!v28) {
      goto LABEL_10;
    }
LABEL_9:
    CFRelease(v28);
    goto LABEL_10;
  }

  CFIndex v32 = 1LL;
  do
  {
    CFIndex v33 = v32;
    if (v30 == v32) {
      break;
    }
    uint64_t v34 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v32);
    CFComparisonResult v35 = CFStringCompare(v28, v34, 0LL);
    CFIndex v32 = v33 + 1;
  }

  while (v35);
  BOOL v36 = v33 < v30;
  if (v28) {
    goto LABEL_9;
  }
LABEL_10:
  if (!v36)
  {
LABEL_14:
    checkpoint_access_yield(a1, v21, v22, v23, v24, v25, v26, v27);
    BOOL v38 = 0;
    goto LABEL_15;
  }

  int v37 = *(_DWORD *)(a1 + 2284);
  if (v37)
  {
    if (!v13) {
      *(_DWORD *)(a1 + 2284) = v37 - 1;
    }
    goto LABEL_14;
  }

  if (v13) {
    checkpoint_history_add( a1,  *(_DWORD *)(a1 + 2276),  1,  0,  *(_DWORD *)a2,  *(const char **)(a2 + 8),  *(_DWORD *)(a1 + 2280),  *a4,  *a5);
  }
  checkpoint_access_yield(a1, v21, v22, v23, v24, v25, v26, v27);
  BOOL v38 = 0;
  int v47 = 0;
  switch(*(_DWORD *)(a1 + 2276))
  {
    case 9:
      goto LABEL_80;
    case 0xA:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        *a4 = 181;
        ramrod_create_error_cf( (CFErrorRef *)a5,  @"CheckpointErrorDomain",  181LL,  0LL,  @"checkpoint simulator error",  v44,  v45,  v46,  v92);
      }

      goto LABEL_76;
    case 0xB:
      goto LABEL_76;
    case 0xC:
      goto LABEL_76;
    case 0xD:
      goto LABEL_76;
    case 0xE:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        for (uint64_t i = 0LL; ; i += 4LL)
          ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator signal executing after dereference of %p [%d]\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      }

      goto LABEL_76;
    case 0xF:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        while (1)
          ;
      }

      goto LABEL_76;
    case 0x10:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        memset(&v94, 0, sizeof(v94));
        v93.__sig = 0LL;
        *(void *)v93.__opaque = 0LL;
        pthread_mutexattr_init(&v93);
        pthread_mutex_init(&v94, &v93);
        pthread_mutex_lock(&v94);
        pthread_mutex_lock(&v94);
      }

      goto LABEL_76;
    case 0x11:
      mach_port_t v49 = mach_host_self();
      int v50 = 0;
      goto LABEL_45;
    case 0x12:
      mach_port_t v49 = mach_host_self();
      int v50 = 4096;
LABEL_45:
      host_reboot(v49, v50);
LABEL_76:
      BOOL v38 = 0;
      goto LABEL_77;
    case 0x13:
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator PAUSE not supported\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x14:
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator RESUME not supported\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x15:
      __break(1u);
LABEL_50:
      BOOL v38 = v10 == 0;
LABEL_77:
      int v47 = v13;
LABEL_78:
      if (!v13) {
        goto LABEL_80;
      }
      unsigned int v13 = v47;
      if (!v47) {
        goto LABEL_80;
      }
      goto LABEL_15;
    case 0x16:
      goto LABEL_50;
    case 0x17:
      BOOL v38 = 0;
      int v51 = *(unsigned __int8 *)(a1 + 2275);
      if (v51 == v10) {
        int v47 = 0;
      }
      else {
        int v47 = v10;
      }
      if (v13 || v51 != v10) {
        goto LABEL_78;
      }
      if (!*a4)
      {
        ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator to ignore error on step %s, but step was successful\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
        goto LABEL_70;
      }

      ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s result: %d\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      *a4 = 0;
      if (!*a5)
      {
LABEL_70:
        BOOL v38 = 0;
        int v47 = 0;
        goto LABEL_80;
      }

      uint64_t v52 = checkpoint_cferror_alloc_string((CFErrorRef)*a5);
      if (v52)
      {
        unint64_t v60 = v52;
        ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s error: %s\n",  v53,  v54,  v55,  v56,  v57,  v58,  v59,  (char)"checkpoint_simulator_action");
        free(v60);
      }

      CFRelease(*a5);
      BOOL v38 = 0;
      int v47 = 0;
      *a5 = 0LL;
LABEL_80:
      int v90 = *(_DWORD *)(a1 + 2280);
      if (v90)
      {
        int v91 = v90 - 1;
        *(_DWORD *)(a1 + 2280) = v91;
        if (!v91) {
          *(_DWORD *)(a1 + 2276) = 0;
        }
      }

      unsigned int v13 = v47;
LABEL_15:
      if (v10) {
        return v13;
      }
      else {
        return v38;
      }
    case 0x18:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        checkpoint_simulator_jetsam();
        ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): returned from checkpoint jetsam attempt; continuing engine\n",
          v61,
          v62,
          v63,
          v64,
          v65,
          v66,
          v67,
          (char)"checkpoint_simulator_action");
      }

      goto LABEL_76;
    case 0x19:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        int v68 = fork();
        if (v68 < 1)
        {
          if (!v68)
          {
            checkpoint_simulator_jetsam();
            exit(0);
          }

          __error();
          ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): error %d attempting to fork jetsam child\n",  v76,  v77,  v78,  v79,  v80,  v81,  v82,  (char)"checkpoint_simulator_action");
        }

        else
        {
          LODWORD(v94.__sig) = 0;
          if (waitpid(v68, (int *)&v94, 0) < 0)
          {
            __error();
            ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): error %d waiting for jetsam child\n",  v83,  v84,  v85,  v86,  v87,  v88,  v89,  (char)"checkpoint_simulator_action");
          }

          else if ((v94.__sig & 0x7F) == 0x7F)
          {
            ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): unexpected status of jetsam child: %d\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (char)"checkpoint_simulator_action");
          }

          else if ((v94.__sig & 0x7F) != 0)
          {
            ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child signalled: %d\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (char)"checkpoint_simulator_action");
          }

          else
          {
            ramrod_log_msg( "CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child exited: %d\n",  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (char)"checkpoint_simulator_action");
          }
        }
      }

      goto LABEL_76;
    default:
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): unknown simulator command ignored\n",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"checkpoint_simulator_action");
      BOOL v38 = 0;
      int v47 = 1;
      goto LABEL_78;
  }

uint64_t checkpoint_closure_context_handle_simulator_match_name( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_match_name");
  }

  else
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_closure_context_handle_simulator_match_name");
  }

  return 0LL;
}

uint64_t checkpoint_simulator_action_match( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 2276))
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
    CFIndex v32 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
    if (Count < 1)
    {
LABEL_6:
      uint64_t v35 = 0LL;
    }

    else
    {
      CFIndex v33 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v33);
        if (CFStringCompare(v32, ValueAtIndex, 0LL) == kCFCompareEqualTo) {
          break;
        }
        if (Count == ++v33) {
          goto LABEL_6;
        }
      }

      uint64_t v35 = 1LL;
    }

    checkpoint_access_yield(a1, v25, v26, v27, v28, v29, v30, v31);
    if (v32) {
      CFRelease(v32);
    }
  }

  else
  {
    checkpoint_access_yield(a1, v17, v18, v19, v20, v21, v22, v23);
    return 0LL;
  }

  return v35;
}

char *checkpoint_append_and_free_key_v(char *a1, const char *a2, const char *a3, int *a4)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  asprintf(&v12, "%s:%s", a2, a3);
  uint64_t v6 = v12;
  if (!v12) {
    return a1;
  }
  if (!a1) {
    return v12;
  }
  size_t v7 = strlen(a1);
  size_t v8 = strlen(v12);
  uint64_t v9 = 1LL;
  if (*a4 > 0) {
    uint64_t v9 = 2LL;
  }
  if (v8 + v7 + v9 >= 0x81)
  {
    uint64_t v11 = a1;
LABEL_13:
    free(v6);
    return v11;
  }

  if (*a4 <= 0) {
    asprintf(&v11, "%s%s");
  }
  else {
    asprintf(&v11, "%s;%s");
  }
  ++*a4;
  free(a1);
  uint64_t v6 = v12;
  if (v12) {
    goto LABEL_13;
  }
  return v11;
}

char *checkpoint_append_and_free( char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = 0LL;
  v12[0] = 0LL;
  v12[1] = &a9;
  vasprintf(v12, a2, &a9);
  if (!v12[0]) {
    return a1;
  }
  if (!a1) {
    return v12[0];
  }
  asprintf(&v11, "%s%s", a1, v12[0]);
  if (v11) {
    free(a1);
  }
  else {
    uint64_t v11 = a1;
  }
  if (v12[0])
  {
    free(v12[0]);
    v12[0] = 0LL;
  }

  return v11;
}

char *checkpoint_append_and_free_id_v(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0LL;
  asprintf(&v8, "0x%08X", a2);
  if (v8)
  {
    a1 = checkpoint_append_and_free_key_v(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }

  return a1;
}

char *checkpoint_append_and_free_try_v(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0LL;
  asprintf(&v8, "%d", a2);
  if (v8)
  {
    a1 = checkpoint_append_and_free_key_v(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }

  return a1;
}

void checkpoint_outcome_init( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)a1 == 1)
  {
    if (a2)
    {
      if (*(_BYTE *)(a1 + 104))
      {
        int v9 = 17;
        goto LABEL_14;
      }

      BOOL v10 = *(_BYTE *)(a1 + 101) == 0;
      int v9 = 5;
    }

    else
    {
      BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
      int v9 = 1;
    }
  }

  else if (a2)
  {
    if (*(_BYTE *)(a1 + 104))
    {
      int v9 = 19;
      goto LABEL_14;
    }

    BOOL v10 = *(_BYTE *)(a1 + 101) == 0;
    int v9 = 7;
  }

  else
  {
    BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
    int v9 = 3;
  }

  if (!v10) {
    ++v9;
  }
LABEL_14:
  *(_DWORD *)(a1 + 96) = v9;
  checkpoint_nvram_store_string(a1, 5LL, checkpoint_outcome_names[v9], a4, a5, a6, a7, a8);
  checkpoint_log_progress(a1, 1);
}

void checkpoint_nvram_collect_var(uint64_t a1, unsigned int a2, unsigned int a3, const __CFString **a4)
{
  CFTypeRef cf = 0LL;
  bzero(buffer, 0x400uLL);
  bzero(v46, 0x400uLL);
  if (a3 < 0x30)
  {
    if (*(_DWORD *)(a1 + 88) == 1) {
      uint64_t v16 = &checkpoint_nvram_map[4 * a3];
    }
    else {
      uint64_t v16 = &checkpoint_nvram_map[4 * a3 + 1];
    }
    CFStringGetCString(*v16, buffer, 1024LL, 0x8000100u);
    uint64_t v17 = (const __CFString *)ramrod_copy_NVRAM_variable();
    if (!v17) {
      return;
    }
    uint64_t v15 = v17;
    CFTypeID v18 = CFGetTypeID(v17);
    if (v18 == CFStringGetTypeID())
    {
      CFStringGetCString(v15, v46, 1024LL, 0x8000100u);
      *a4 = v15;
      uint64_t v15 = 0LL;
      goto LABEL_22;
    }

    if (v18 == CFNumberGetTypeID())
    {
      LODWORD(valuePtr) = 0;
      if (!CFNumberGetValue((CFNumberRef)v15, kCFNumberIntType, &valuePtr))
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): number that is not an int %s\n";
        goto LABEL_29;
      }

      uint64_t v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", valuePtr);
      if (!v26)
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): failed to get valid number for %s\n";
LABEL_29:
        ramrod_log_msg(v27, v19, v20, v21, v22, v23, v24, v25, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }

    else
    {
      if (v18 != CFDataGetTypeID())
      {
        ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): unsupported nvram variable type for %s\n",  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }

      uint64_t v26 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)v15, 0x8000100u);
      if (!v26)
      {
        ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): failed to get string from data %s\n",  v35,  v36,  v37,  v38,  v39,  v40,  v41,  (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }

    uint64_t v42 = v26;
    CFStringGetCString(v26, v46, 1024LL, 0x8000100u);
    *a4 = v42;
LABEL_22:
    int valuePtr = 0LL;
    if (a2 > 2) {
      uint64_t v43 = "Unknown";
    }
    else {
      uint64_t v43 = checkpoint_nvram_collection_name[a2];
    }
    asprintf(&valuePtr, "%s NVRAM variable: %s=%s", v43, buffer, v46);
    if (valuePtr)
    {
      checkpoint_history_add(a1, 2, 1, 0, 257, valuePtr, 0, 0, 0LL);
      free(valuePtr);
    }

    goto LABEL_3;
  }

  ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable id=%u\n",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (char)"checkpoint_nvram_collect_var");
  uint64_t v15 = 0LL;
LABEL_3:
  if (cf) {
    CFRelease(cf);
  }
  if (v15) {
    CFRelease(v15);
  }
}

uint64_t checkpoint_nvram_check_collection( uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10 = *a3;
  if (*a3)
  {
    unsigned __int8 v11 = 0;
    char v12 = 0;
    uint64_t v13 = a3 + 2;
    do
    {
      uint64_t v14 = v10;
      *((_BYTE *)v38 + v10) = 1;
      if (*(void *)(a2 + 8LL * v10 + 8))
      {
        if (*((_BYTE *)v13 - 3)) {
          unsigned __int8 v11 = 1;
        }
        if (*((_BYTE *)v13 - 2)) {
          char v12 = 1;
        }
        if (*((_BYTE *)v13 - 1))
        {
          uint64_t v15 = v10 <= 0x2F && (LODWORD(checkpoint_nvram_map[4 * v10 + 3]) - 2) < 3;
          checkpoint_nvram_delete_var(a1, v10, v15, 1LL, a5, a6, a7, a8);
        }
      }

      else if (*((_BYTE *)v13 - 4))
      {
        bzero(buffer, 0x400uLL);
        checkpoint_get_nvram_name_string(a1, v14, buffer, v16, v17, v18, v19, v20);
        checkpoint_nvram_store_anomaly(a1, v21, "[check_collection]%s(does_not_exist)", buffer);
      }

      unsigned int v22 = *v13;
      v13 += 2;
      unsigned int v10 = v22;
    }

    while (v22);
  }

  else
  {
    char v12 = 0;
    unsigned __int8 v11 = 0;
  }

  uint64_t v23 = 0LL;
  uint64_t v24 = a2 + 16;
  do
  {
    if (!*((_BYTE *)v38 + v23 + 1) && *(void *)(v24 + 8 * v23))
    {
      bzero(buffer, 0x400uLL);
      bzero(v36, 0x400uLL);
      checkpoint_get_nvram_name_string(a1, (v23 + 1), buffer, v25, v26, v27, v28, v29);
      checkpoint_get_nvram_value_string(*(const __CFString **)(v24 + 8 * v23), v36);
      checkpoint_nvram_store_anomaly(a1, v30, "[check_collection]%s=%s(exists_when_not_expected)", buffer, v36);
      checkpoint_nvram_delete_var(a1, (v23 + 1), 0LL, 1LL, v31, v32, v33, v34);
    }

    ++v23;
  }

  while (v23 != 47);
  if (v12) {
    checkpoint_history_add(a1, 2, 1, 0, 262, "Old restore failure indication(s)", 0, 0, 0LL);
  }
  return v11;
}

void checkpoint_nvram_delete_var_if_matches(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(const __CFString **)(a2 + 24);
  if (v3)
  {
    if (CFStringCompare(v3, @"upgrade", 0LL) == kCFCompareEqualTo) {
      checkpoint_nvram_delete_var(a1, 2LL, 1LL, 0LL, v4, v5, v6, v7);
    }
  }

char *checkpoint_get_nvram_name_string( uint64_t a1, uint64_t a2, char *buffer, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 0x30)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  (uint64_t)buffer,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_get_nvram_name");
    LODWORD(a2) = 0;
  }

  if (*(_DWORD *)(a1 + 88) == 1) {
    unsigned int v10 = &checkpoint_nvram_map[4 * a2];
  }
  else {
    unsigned int v10 = &checkpoint_nvram_map[4 * a2 + 1];
  }
  CFStringGetCString(*v10, buffer, 1024LL, 0x8000100u);
  return buffer;
}

void checkpoint_reboot_retry_chassis_aware( _BYTE *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1[100])
  {
    a1[104] = 1;
    a1[101] = 1;
    ramrod_log_msg("AP nonce will not be touched\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }

  else
  {
    bzero(v12, 0x400uLL);
    checkpoint_get_nvram_value_string(a2, v12);
    checkpoint_nvram_store_anomaly( (uint64_t)a1,  v11,  "[reboot_retry_chassis]outcome=%s(pre_existing_reboot_retry_disabled)",  v12);
  }

void checkpoint_nvram_delete_var_raw(const __CFString *a1)
{
}

void checkpoint_log_progress(uint64_t a1, int a2)
{
  uint64_t v7 = 0LL;
  uint64_t v3 = *(unsigned int *)(a1 + 92);
  else {
    uint64_t v4 = checkpoint_outcome_names[v3];
  }
  uint64_t v5 = *(unsigned int *)(a1 + 96);
  else {
    uint64_t v6 = checkpoint_outcome_names[v5];
  }
  asprintf(&v7, "%s (%s) -> (%s)", checkpoint_progress_names[a2], v4, v6);
  if (v7)
  {
    checkpoint_history_add(a1, 29, 1, 0, 260, v7, 0, 0, 0LL);
    if (v7) {
      free(v7);
    }
  }

uint64_t checkpoint_nvram_alloc_encode( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      LODWORD(a2) = 0;
      goto LABEL_7;
    }

    LODWORD(a2) = checkpoint_nvram_map[4 * a2 + 2];
  }

  if (a2 < 0x30)
  {
LABEL_7:
    uint64_t v10 = a2;
    uint64_t v9 = HIDWORD(checkpoint_nvram_map[4 * a2 + 2]);
    return ((uint64_t (*)(uint64_t, void))checkpoint_nvram_encoder[v9])( a1,  *(void *)(a1 + 16 * v10 + 1496));
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = a2;
  return ((uint64_t (*)(uint64_t, void))checkpoint_nvram_encoder[v9])(a1, *(void *)(a1 + 16 * v10 + 1496));
}

void checkpoint_nvram_store_by_id( uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v11 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }

  uint64_t v11 = a2;
LABEL_7:
  if (((0x20420400uLL >> v11) & 1) != 0)
  {
    a2 = *(void *)(a1 + 16 * v11 + 1496);
    if (a2) {
      goto LABEL_21;
    }
  }

  if (((0x1001100uLL >> v11) & 1) != 0)
  {
    uint64_t v12 = *(void *)(a1 + 16 * v11 + 1496);
    if (v12)
    {
      unint64_t v13 = 0LL;
      a2 = v12 - 16;
      do
      {
        int v15 = *(_DWORD *)(a2 + 16);
        a2 += 16LL;
        int v14 = v15;
        if (v15) {
          BOOL v16 = v13 >= 7;
        }
        else {
          BOOL v16 = 1;
        }
        ++v13;
      }

      while (!v16);
      if (!v14)
      {
LABEL_21:
        *(_DWORD *)a2 = v9;
        checkpoint_nvram_store_set_string(a1 + 1456, (char **)(a2 + 8), a4, (uint64_t)a4, a5, a6, a7, a8);
        *(_BYTE *)(a1 + 16 * v11 + 1492) = 1;
        return;
      }
    }
  }

LABEL_18:
  int v17 = *(_DWORD *)(a1 + 1476);
  if (!v17)
  {
    ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  a2,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
    int v17 = *(_DWORD *)(a1 + 1476);
  }

  *(_DWORD *)(a1 + 1476) = v17 + 1;
}

void checkpoint_nvram_store_long( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }

  uint64_t v10 = a2;
LABEL_7:
  if (((0x3C03C0000uLL >> v10) & 1) != 0)
  {
    uint64_t v11 = a1 + 16 * v10;
    uint64_t v12 = *(uint64_t **)(v11 + 1496);
    if (v12)
    {
      uint64_t *v12 = a3;
      *(_BYTE *)(v11 + 1492) = 1;
      return;
    }
  }

void checkpoint_nvram_store_by_id_try_int( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  int v9 = a4;
  int v10 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }

  uint64_t v12 = a2;
LABEL_7:
  if (((0xA00A000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0LL;
      BOOL v16 = 0LL;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 11;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }

      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 11;
      }
      if (v16)
      {
        *BOOL v16 = v10;
        v16[v9 + 1] = v8;
        *((_BYTE *)v16 + v9 + 36) = 1;
        *(_BYTE *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }

void checkpoint_nvram_store_by_id_try( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a4;
  int v10 = a3;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  (uint64_t)a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0LL;
      goto LABEL_7;
    }

    a2 = LODWORD(checkpoint_nvram_map[4 * a2 + 2]);
  }

  uint64_t v12 = a2;
LABEL_7:
  if (((0x14014000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0LL;
      BOOL v16 = 0LL;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 18;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }

      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 18;
      }
      if (v16)
      {
        *BOOL v16 = v10;
        checkpoint_nvram_store_set_string(a1 + 1456, (char **)&v16[2 * v9 + 2], a5, a4, (uint64_t)a5, a6, a7, a8);
        *(_BYTE *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }

void checkpoint_nvram_store_set_string( uint64_t a1, char **a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (*a2)
    {
      free(*a2);
      *a2 = 0LL;
    }

    if (a3) {
      asprintf(a2, "%s", a3);
    }
  }

  else
  {
    int v11 = *(_DWORD *)(a1 + 20);
    if (!v11)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n",  0LL,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_store_lost");
      int v11 = *(_DWORD *)(a1 + 20);
    }

    *(_DWORD *)(a1 + 20) = v11 + 1;
  }

char *checkpoint_nvram_copy_encode_c_string( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (char *)checkpoint_nvram_alloc_encode(a1, a2, a3, a4, a5, a6, a7, a8);
  int v10 = 0LL;
  if (result)
  {
    int v9 = (const __CFString *)result;
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v9, buffer, 1024LL, 0x8000100u);
    asprintf(&v10, "%s", buffer);
    CFRelease(v9);
    return v10;
  }

  return result;
}

char *checkpoint_nvram_copy_string( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = 0LL;
  if (*(_BYTE *)(a1 + 104))
  {
    if (a3 > 0x2F)
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"checkpoint_nvram_adjust_id");
      LODWORD(a3) = 0;
    }

    else
    {
      LODWORD(a3) = checkpoint_nvram_map[4 * a3 + 2];
    }
  }

  int v9 = *(const __CFString **)(a2 + 8LL * a3 + 8);
  if (!v9) {
    return 0LL;
  }
  bzero(buffer, 0x400uLL);
  CFStringGetCString(v9, buffer, 1024LL, 0x8000100u);
  asprintf(&v11, "%s", buffer);
  return v11;
}

char *checkpoint_cferror_append(char *a1, char a2, const __CFString *a3, _BYTE *a4)
{
  if (a3)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(a3, buffer, 1024LL, 0x8000100u);
    if (*a4) {
      int v14 = "|%s(%s)";
    }
    else {
      int v14 = "%s(%s)";
    }
    a1 = checkpoint_append_and_free(a1, v14, v8, v9, v10, v11, v12, v13, a2);
    *a4 = 1;
  }

  return a1;
}

void checkpoint_simulator_configure( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_BYTE *)(a1 + 2274) && checkpoint_nvram_is_available(a1, 0, 0LL, a4, a5, a6, a7, a8))
  {
    uint64_t v9 = *(const __CFString **)(a1 + 992);
    if (!v9) {
      goto LABEL_23;
    }
    bzero(&v28[4], 0x3FCuLL);
    *(_DWORD *)(a1 + 2276) = 0;
    *(void *)(a1 + 228_Block_object_dispose(va, 8) = 0LL;
    bzero(v30, 0x3FBuLL);
    strcpy(__s, "SIM_");
    size_t v10 = strlen(__s);
    CFStringGetCString(v9, &__s[v10], 1024 - v10, 0x8000100u);
    strcpy(v28, "SIM");
    size_t v11 = strlen(v28);
    CFStringGetCString(*(CFStringRef *)(a1 + 992), &v28[v11], 1024 - v11, 0x8000100u);
    uint64_t v12 = 0LL;
    while (1)
    {
      uint64_t v13 = checkpoint_history_type_name[v12];
      if (!strncasecmp(__s, v13, 0x400uLL))
      {
        *(_DWORD *)(a1 + 2276) = v12;
        goto LABEL_11;
      }

      if (!strncasecmp(v28, v13, 0x400uLL)) {
        break;
      }
      if (++v12 == 34)
      {
        LODWORD(v12) = *(_DWORD *)(a1 + 2276);
        goto LABEL_11;
      }
    }

    *(_DWORD *)(a1 + 2276) = v12;
    *(_BYTE *)(a1 + 2275) = 1;
LABEL_11:
    if (!(_DWORD)v12) {
      goto LABEL_23;
    }
    BOOL v20 = *(const __CFString **)(a1 + 1016);
    if (v20)
    {
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v20, @",");
      *(void *)(a1 + 228_Block_object_dispose(va, 8) = ArrayBySeparatingStrings;
      if (ArrayBySeparatingStrings)
      {
        CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
        if (Count >= 1)
        {
          CFIndex v23 = Count;
          for (CFIndex i = 0LL; i != v23; ++i)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), i);
            CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          }
        }

        uint64_t v26 = *(const __CFString **)(a1 + 1000);
        if (v26) {
          *(_DWORD *)(a1 + 2280) = CFStringGetIntValue(v26);
        }
        uint64_t v27 = *(const __CFString **)(a1 + 1008);
        if (v27) {
          *(_DWORD *)(a1 + 2284) = CFStringGetIntValue(v27);
        }
        goto LABEL_23;
      }
    }

    else
    {
      ramrod_log_msg( "CHECKPOINT_INTERNAL_ERROR(%s): simulator command without stepName\n",  0LL,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"checkpoint_simulator_configure");
    }

    *(_DWORD *)(a1 + 2276) = 0;
LABEL_23:
    *(_BYTE *)(a1 + 2274) = 1;
  }

void *checkpoint_simulator_jetsam()
{
  uint64_t v5 = 0LL;
  io_object_t v0 = &v5;
  size_t v1 = 0x100000LL;
  do
  {
    CFStringRef v2 = malloc(v1);
    os_log_s *v0 = v2;
    if (v2)
    {
      bzero(v2, v1);
      io_object_t v0 = (void **)*v0;
    }

    else
    {
      v1 >>= 1;
    }
  }

  while ((int)v1 > 4095);
  uint64_t result = v5;
  if (v5)
  {
    do
    {
      uint64_t v4 = (void *)*result;
      free(result);
      uint64_t result = v4;
    }

    while (v4);
  }

  return result;
}

double ramrod_execute_config_alloc()
{
  io_object_t v0 = calloc(1uLL, 0x28uLL);
  v0[14] = 0;
  double result = NAN;
  *((void *)v0 + 4) = 0x7FFFFFFF000000B4LL;
  return result;
}

void ramrod_execute_config_free(const void **a1)
{
}

void ramrod_execute_config_set_output_block(uint64_t a1, void *aBlock)
{
  uint64_t v3 = _Block_copy(aBlock);
  _Block_release(*(const void **)(a1 + 16));
  *(void *)(a1 + 16) = v3;
}

uint64_t ramrod_execute_command_with_config( char *const *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  pid_t v123 = 0;
  ramrod_log_msg("entering ramrod_execute_command_with_config: %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)*a1);
  *(void *)char v129 = -1LL;
  *(void *)unint64_t v130 = -1LL;
  ramrod_log_msg("executing %s", v10, v11, v12, v13, v14, v15, v16, (char)*a1);
  uint64_t v24 = (char *)*((void *)a1 + 1);
  if (v24)
  {
    uint64_t v25 = 2LL;
    do
    {
      ramrod_log_msg(" %s", v17, v18, v19, v20, v21, v22, v23, (char)v24);
      uint64_t v24 = a1[v25++];
    }

    while (v24);
  }

  ramrod_log_msg("\n", v17, v18, v19, v20, v21, v22, v23, v120);
  if (pipe(v130) == -1)
  {
    uint64_t v37 = *a1;
    uint64_t v38 = __error();
    strerror(*v38);
    ramrod_log_msg("pipe failed while preparing to execute %s: %s\n", v39, v40, v41, v42, v43, v44, v45, (char)v37);
    int v46 = 0;
    unsigned int v47 = -1;
    goto LABEL_43;
  }

  if (pipe(v129) == -1)
  {
    uint64_t v48 = *a1;
    mach_port_t v49 = __error();
    strerror(*v49);
    ramrod_log_msg("pipe failed while preparing to execute %s: %s\n", v50, v51, v52, v53, v54, v55, v56, (char)v48);
    uint64_t v35 = 0xFFFFFFFFLL;
    int v36 = -1;
  }

  else
  {
    char v121 = 1;
    fcntl(v129[1], 73);
    posix_spawn_file_actions_t v125 = 0LL;
    posix_spawn_file_actions_init(&v125);
    posix_spawn_file_actions_adddup2(&v125, v129[0], 0);
    posix_spawn_file_actions_adddup2(&v125, v130[1], 1);
    posix_spawn_file_actions_adddup2(&v125, 2, 2);
    posix_spawnattr_t v124 = 0LL;
    posix_spawnattr_init(&v124);
    posix_spawnattr_setflags(&v124, 0x4000);
    if (*((_DWORD *)a2 + 6)) {
      posix_spawnattr_set_qos_clamp_np(&v124);
    }
    if (*a2) {
      (*(void (**)(void, posix_spawn_file_actions_t *))(*a2 + 16LL))(*a2, &v125);
    }
    int v26 = posix_spawn(&v123, *(const char **)a1, &v125, &v124, a1, 0LL);
    if (v26)
    {
      uint64_t v27 = *a1;
      strerror(v26);
      ramrod_log_msg("posix_spawn %s failed: %s\n", v28, v29, v30, v31, v32, v33, v34, (char)v27);
      close(v130[0]);
      close(v129[1]);
      uint64_t v35 = 0xFFFFFFFFLL;
      int v36 = -1;
    }

    else
    {
      uint64_t v35 = v129[1];
      int v36 = v130[0];
      pid_t v58 = v123;
      if (v123 != -1)
      {
        uint64_t v59 = realpath_DARWIN_EXTSN(*(const char **)a1, 0LL);
        if (v59)
        {
          unint64_t v60 = v59;
          bzero(v132, 0x400uLL);
          uint64_t v61 = basename_r(v60, v132);
          if (v61
            && ((uint64_t v62 = v61, v128 = 256LL, _get_image_exec_options_bootargs)
             || !sysctlbyname("kern.bootargs", &_get_image_exec_options_bootargs, &v128, 0LL, 0LL))
            && (bzero(__str, 0x400uLL),
                uint64_t v126 = 0LL,
                uint64_t v127 = 0LL,
                snprintf( __str,  0x3FFuLL,  "\\bramrod_exec-\\Q%s\\E=((0[0-7]+)|(([+-])?[[:digit:]]+)|(0[xX][[:xdigit:]]+))",  v62),  _find_tagged_regex(&_get_image_exec_options_bootargs, v128, __str, &v127, &v126)))
          {
            ramrod_log_msg( "found ramrod_execute_command option in boot-args: ramrod_exec-%s=%.*s\n",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  (char)v62);
            unsigned int v70 = strtol(v127, 0LL, 0);
            free(v60);
            int v78 = v70 & 0x1F;
            if ((v70 & 0x1F) != 0)
            {
              ramrod_log_msg( "sending signal %d to process %d in %d millisecond(s)...\n",  v71,  v72,  v73,  v74,  v75,  v76,  v77,  v78);
              usleep(1000 * (unsigned __int16)(v70 >> 8));
              if (kill(v58, v78) == -1)
              {
                __error();
                ramrod_log_msg( "could not send signal %d to process %d: error %d\n",  v79,  v80,  v81,  v82,  v83,  v84,  v85,  v78);
              }
            }
          }

          else
          {
            free(v60);
          }
        }
      }
    }

    posix_spawnattr_destroy(&v124);
    posix_spawn_file_actions_destroy(&v125);
    close(v129[0]);
  }

  close(v130[1]);
  int v46 = 0;
  unsigned int v47 = -1;
  if (v36 != -1 && (_DWORD)v35 != -1)
  {
    bzero(v132, 0x400uLL);
    uint64_t v57 = a2[1];
    if (v57) {
      int v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 16))(v57, v35);
    }
    else {
      int v46 = 0;
    }
    close(v35);
    ssize_t v86 = read(v36, v132, 0x3FFuLL);
    if (v86 >= 1)
    {
      for (ssize_t i = v86; i > 0; ssize_t i = read(v36, v132, 0x3FFuLL))
      {
        v132[i] = 0;
        uint64_t v94 = a2[2];
        if (v94) {
          (*(void (**)(uint64_t, char *))(v94 + 16))(v94, v132);
        }
      }
    }

    ramrod_log_msg("waiting for child to exit\n", v87, i, v89, v90, v91, v92, v93, v121);
    *(_DWORD *)__str = 0;
    if (waitpid(v123, (int *)__str, 0) == -1)
    {
      uint64_t v109 = *a1;
      uint64_t v110 = __error();
      strerror(*v110);
      ramrod_log_msg("waitpid failed for %s: %s\n", v111, v112, v113, v114, v115, v116, v117, (char)v109);
    }

    else
    {
      ramrod_log_msg("child exited\n", v95, v96, v97, v98, v99, v100, v101, v122);
      if ((__str[0] & 0x7F) == 0x7F)
      {
        ramrod_log_msg("%s was stopped by signal %d\n", v102, v103, v104, v105, v106, v107, v108, (char)*a1);
      }

      else
      {
        if ((__str[0] & 0x7F) == 0)
        {
          ramrod_log_msg("exit status: %d\n", v102, v103, v104, v105, v106, v107, v108, __str[1]);
          unsigned int v47 = __str[1];
LABEL_42:
          close(v36);
          goto LABEL_43;
        }

        ramrod_log_msg("%s was terminated by signal %d\n", v102, v103, v104, v105, v106, v107, v108, (char)*a1);
      }
    }

    unsigned int v47 = -1;
    goto LABEL_42;
  }

LABEL_43:
  if (v46) {
    BOOL v118 = v47 == 0;
  }
  else {
    BOOL v118 = 0;
  }
  if (v118) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v47;
  }
}

uint64_t _ramrod_execute_command_with_input_data_output_block( char *const *a1, uint64_t a2, uint64_t a3, char a4, const void *a5)
{
  uint64_t v10 = calloc(1uLL, 0x28uLL);
  *((_WORD *)v10 + 14) = 0;
  v10[4] = 0x7FFFFFFF000000B4LL;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472LL;
  aBlock[2] = ___ramrod_execute_command_with_input_data_output_block_block_invoke;
  aBlock[3] = &__block_descriptor_33_e10_i16__0__v8l;
  char v24 = a4;
  uint64_t v11 = _Block_copy(aBlock);
  _Block_release((const void *)*v10);
  *uint64_t v10 = v11;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = ___ramrod_execute_command_with_input_data_output_block_block_invoke_2;
  v22[3] = &__block_descriptor_48_e8_i12__0i8l;
  v22[4] = a2;
  v22[5] = a3;
  uint64_t v12 = _Block_copy(v22);
  _Block_release((const void *)v10[1]);
  v10[1] = v12;
  uint64_t v13 = _Block_copy(a5);
  _Block_release((const void *)v10[2]);
  v10[2] = v13;
  uint64_t v20 = ramrod_execute_command_with_config(a1, v10, v14, v15, v16, v17, v18, v19);
  ramrod_execute_config_free((const void **)v10);
  return v20;
}

uint64_t __ramrod_execute_command_with_callback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

void log_output_buf( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t wait_for_device( char *a1, char *a2, size_t a3, CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    ssize_t v86 = @"%s: type argument is NULL";
LABEL_53:
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 3LL, 0LL, v86, v11, v12, v13, (char)"wait_for_device");
    return 0LL;
  }

  if (!a2)
  {
    ssize_t v86 = @"%s: path argument is NULL";
    goto LABEL_53;
  }

  embedded_storage_service_query_dict = create_embedded_storage_service_query_dict(a1);
  if (!embedded_storage_service_query_dict)
  {
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: failed to allocate device lookup dict",  v15,  v16,  v17,  (char)"wait_for_device");
    return 0LL;
  }

  io_object_t v18 = wait_for_io_service_matching_dict(embedded_storage_service_query_dict, 0x1Eu);
  if (!v18)
  {
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  4LL,  0LL,  @"%s: failed to lookup IO service for %s",  v19,  v20,  v21,  (char)"wait_for_device");
    return 0LL;
  }

  io_object_t v22 = v18;
  IOObjectRetain(v18);
  io_registry_entry_t v23 = v22;
  do
  {
    iterator.io_object_t st_dev = 0;
    if (IORegistryEntryGetChildIterator(v23, "IOService", (io_iterator_t *)&iterator))
    {
      uint64_t v44 = "Could not create child iterator\n";
LABEL_22:
      ramrod_log_msg(v44, v24, v25, v26, v27, v28, v29, v30, v87);
      io_object_t st_dev = 0;
      goto LABEL_23;
    }

    io_object_t v31 = IOIteratorNext(iterator.st_dev);
    int v32 = 0;
    if (!v31)
    {
      io_object_t st_dev = iterator.st_dev;
LABEL_21:
      IOObjectRelease(st_dev);
      char v87 = v32;
      uint64_t v44 = "Found %d child nodes (expected 1)\n";
      goto LABEL_22;
    }

    io_object_t st_dev = 0;
    do
    {
      if (st_dev) {
        IOObjectRelease(v31);
      }
      else {
        io_object_t st_dev = v31;
      }
      io_object_t v31 = IOIteratorNext(iterator.st_dev);
      ++v32;
    }

    while (v31);
    IOObjectRelease(iterator.st_dev);
    if (v32 != 1) {
      goto LABEL_21;
    }
    IOObjectRelease(v23);
    io_registry_entry_t v23 = st_dev;
  }

  while (!IOObjectConformsTo(st_dev, "IOMedia"));
  CFTypeRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(st_dev, @"Whole", kCFAllocatorDefault, 0);
  uint64_t v42 = CFProperty;
  if (CFProperty)
  {
    CFTypeID v43 = CFGetTypeID(CFProperty);
    if (v43 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v42))
      {
        io_registry_entry_t v23 = 0;
        goto LABEL_49;
      }

      uint64_t v71 = "Expected Whole=true\n";
    }

    else
    {
      uint64_t v71 = "Expected Whole to be BOOLean\n";
    }
  }

  else
  {
    uint64_t v71 = "Did not find Whole property on IOMedia class\n";
  }

  ramrod_log_msg(v71, v35, v36, v37, v38, v39, v40, v41, v87);
  io_registry_entry_t v23 = st_dev;
  io_object_t st_dev = 0;
LABEL_49:
  CFRelease(v42);
  if (v23) {
LABEL_23:
  }
    IOObjectRelease(v23);
  if (st_dev)
  {
    uint64_t v48 = (const __CFString *)IORegistryEntryCreateCFProperty(st_dev, @"BSD Name", kCFAllocatorDefault, 0);
    if (v48)
    {
      uint64_t v52 = v48;
      CFTypeID v53 = CFGetTypeID(v48);
      if (v53 == CFStringGetTypeID())
      {
        strlcpy(a2, "/dev/", a3);
        size_t v57 = strlen(a2);
        if (CFStringGetCString(v52, &a2[v57], a3 - v57, 0x8000100u))
        {
          ramrod_log_msg("Using device path %s for %s\n", v58, v59, v60, v61, v62, v63, v64, (char)a2);
          int v65 = -10;
          while (1)
          {
            memset(&iterator, 0, sizeof(iterator));
            if (!stat(a2, &iterator))
            {
              uint64_t v70 = 1LL;
              goto LABEL_43;
            }

            if (*__error() != 2) {
              break;
            }
            sleep(3u);
            if (__CFADD__(v65++, 1)) {
              goto LABEL_41;
            }
          }

          uint64_t v72 = __error();
          strerror(*v72);
          ramrod_log_msg("stat error while waiting for device '%s': %s\n", v73, v74, v75, v76, v77, v78, v79, (char)a2);
          CFIndex v80 = *__error();
          uint64_t v81 = __error();
          strerror(*v81);
          ramrod_create_error_cf( a4,  kCFErrorDomainPOSIX,  v80,  0LL,  @"%s: stat error while waiting for device '%s': %s",  v82,  v83,  v84,  (char)"wait_for_device");
LABEL_41:
          ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  4LL,  0LL,  @"%s: timeout waiting for %s",  v66,  v67,  v68,  (char)"wait_for_device");
        }

        else
        {
          ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  5LL,  0LL,  @"%s: failed to create C string from BSD name",  v62,  v63,  v64,  (char)"wait_for_device");
        }
      }

      else
      {
        ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  3LL,  0LL,  @"%s: returnbed BSD device name for service %s is wrong type",  v54,  v55,  v56,  (char)"wait_for_device");
      }

      uint64_t v70 = 0LL;
LABEL_43:
      CFRelease(v52);
    }

    else
    {
      ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  4LL,  0LL,  @"%s: no BSD device name for service %s",  v49,  v50,  v51,  (char)"wait_for_device");
      uint64_t v70 = 0LL;
    }

    IOObjectRelease(st_dev);
  }

  else
  {
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  4LL,  0LL,  @"%s: failed to lookup whole node for IO service for %s",  v45,  v46,  v47,  (char)"wait_for_device");
    uint64_t v70 = 0LL;
  }

  IOObjectRelease(v22);
  return v70;
}

uint64_t ramrod_probe_media( CFTypeRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _last_ramrod_probe_func = (uint64_t)ramrod_probe_media;
  return ramrod_probe_media_internal(3LL, a1, a3, a4, a5, a6, a7, a8);
}

uint64_t ramrod_probe_media_internal( uint64_t a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  io_object_t v40;
  uint64_t v41;
  CFTypeRef v42;
  io_object_t v44;
  char v45;
  kern_return_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  kern_return_t v50;
  BOOL v51;
  CFStringRef Value;
  CFStringRef v53;
  CFTypeID v54;
  size_t v55;
  const void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const void *v64;
  CFStringRef v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  char *v104;
  char v105;
  CFBooleanRef v106;
  io_object_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  kern_return_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  CFNumberRef v124;
  CFStringRef v125;
  __CFArray *v126;
  CFStringRef v127;
  CFStringRef v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  CFStringRef v133;
  CFIndex v134;
  CFStringRef v135;
  int v136;
  CFStringRef v137;
  CFStringRef v138;
  const char *v139;
  char *v140;
  char *theArray;
  __CFArray *theArraya;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  char *__s2;
  int v155;
  uint64_t v156;
  char *v157;
  int v158;
  CFMutableDictionaryRef properties;
  io_iterator_t iterator;
  CFTypeRef cf;
  char buffer[16];
  __int128 v163;
  io_name_t name;
  CFTypeRef cf = 0LL;
  stat iterator = 0;
  ramrod_log_msg("entering %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)"ramrod_probe_media_internal");
  storage_device_node_path_0 = 0;
  apfs_container_device_node_path_0 = 0;
  apfs_recovery_os_container_device_node_path_0 = 0;
  system_device_node_path_0 = 0;
  data_device_node_path_0 = 0;
  user_device_node_path_0 = 0;
  update_device_node_path_0 = 0;
  baseband_data_partition_device_node_path_0 = 0;
  log_partition_device_node_path = 0;
  xart_partition_node_path = 0;
  hardware_partition_node_path = 0;
  scratch_partition_node_path = 0;
  preboot_partition_device_node_path_0 = 0;
  recovery_os_volume_device_node_path_0 = 0;
  iboot_system_container_device_node_path_0 = 0;
  recovery_preboot_partition_device_node_path = 0;
  isc_preboot_partition_device_node_path = 0;
  isc_recovery_os_volume_device_node_path = 0;
  paired_recovery_os_volume_device_node_path = 0;
  if (additional_encrypted_volume_node_paths)
  {
    CFRelease((CFTypeRef)additional_encrypted_volume_node_paths);
    additional_encrypted_volume_node_paths = 0LL;
  }

  if (additional_eds_volume_node_paths)
  {
    CFRelease((CFTypeRef)additional_eds_volume_node_paths);
    additional_eds_volume_node_paths = 0LL;
  }

  CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf( (CFErrorRef *)&cf,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to allocate array for additional eds volumes",  v10,  v11,  v12,  (char)"ramrod_probe_media_internal");
    CFMutableArrayRef v18 = 0LL;
    goto LABEL_12;
  }

  CFMutableArrayRef v18 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!v18)
  {
    ramrod_create_error_cf( (CFErrorRef *)&cf,  @"RamrodErrorDomain",  6LL,  0LL,  @"%s: unable to allocate array for additional encrypted volumes",  v15,  v16,  v17,  (char)"ramrod_probe_media_internal");
    goto LABEL_12;
  }

  using_LwVM_0 = 0;
  using_APFS_0 = 0;
  if (!wait_for_device( "EmbeddedDeviceTypeRoot",  &storage_device_node_path_0,  0x20uLL,  (CFErrorRef *)&cf,  v14,  v15,  v16,  v17))
  {
    ramrod_log_msg( "Unable to find storage device node for service named: %s",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (char)"EmbeddedDeviceTypeRoot");
LABEL_12:
    uint64_t v40 = 0;
    io_registry_entry_t v35 = 0;
    goto LABEL_13;
  }

  uint64_t v26 = IOBSDNameMatching(kIOMasterPortDefault, 0, byte_100074DC7);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v26);
  io_registry_entry_t v35 = MatchingService;
  if (!MatchingService)
  {
    ramrod_log_msg("unable to find service for %s\n", v28, v29, v30, v31, v32, v33, v34, (char)byte_100074DC7);
LABEL_19:
    uint64_t v40 = 0;
    goto LABEL_20;
  }

  IOServiceWaitQuiet(MatchingService, 0LL);
  uint64_t v36 = IORegistryEntryCreateIterator(v35, "IOService", 1u, &iterator);
  if (v36)
  {
    ramrod_create_error_cf( (CFErrorRef *)&cf,  kCFErrorDomainMach,  v36,  0LL,  @"%s: unable to create child iterator",  v37,  v38,  v39,  (char)"ramrod_probe_media_internal");
    uint64_t v40 = 0;
LABEL_13:
    uint64_t v41 = 0LL;
    goto LABEL_14;
  }

  uint64_t v156 = a1;
  uint64_t v44 = IOIteratorNext(iterator);
  if (v44)
  {
    uint64_t v40 = v44;
    __s2 = 0LL;
    uint64_t v155 = 0;
    uint64_t v157 = 0LL;
    uint64_t v143 = 0LL;
    uint64_t v144 = 0LL;
    uint64_t v145 = 0LL;
    unint64_t v146 = 0LL;
    int v147 = 0LL;
    uint64_t v148 = 0LL;
    uint64_t v149 = 0LL;
    uint64_t v150 = 0LL;
    uint64_t v151 = 0LL;
    uint64_t v152 = 0LL;
    uint64_t v153 = 0LL;
    uint64_t v45 = 0;
    while (1)
    {
      if (!IOObjectConformsTo(v40, "IOMedia"))
      {
        if (IOObjectConformsTo(v40, "IOPartitionScheme"))
        {
          if (IOObjectConformsTo(v40, "IOGUIDPartitionScheme"))
          {
            ramrod_log_msg("device partitioning scheme is GPT\n", v96, v97, v98, v99, v100, v101, v102, (char)v139);
            uint64_t v153 = "Data";
            __s2 = "System";
            uint64_t v151 = "Update";
            uint64_t v152 = "User";
            uint64_t v149 = "Logs";
            uint64_t v150 = "Baseband Data";
            int v147 = "Hardware";
            uint64_t v148 = "xART";
            unint64_t v146 = "Scratch";
          }

          else
          {
            if (!IOObjectConformsTo(v40, "AppleAPFSContainer"))
            {
              ramrod_create_error_cf( (CFErrorRef *)&cf,  kCFErrorDomainMach,  -536870201LL,  0LL,  @"%s: unrecognized partitioning scheme",  v119,  v120,  v121,  (char)"ramrod_probe_media_internal");
              goto LABEL_13;
            }

            ramrod_log_msg("device is APFS formatted\n", v115, v116, v117, v118, v119, v120, v121, (char)v139);
            uint64_t v153 = "Data";
            __s2 = "System";
            uint64_t v151 = "Update";
            uint64_t v152 = "User";
            uint64_t v149 = "Logs";
            uint64_t v150 = "Baseband Data";
            int v147 = "Hardware";
            uint64_t v148 = "xART";
            uint64_t v145 = "Preboot";
            unint64_t v146 = "Scratch";
            uint64_t v143 = "Recovery";
            uint64_t v144 = "iSCPreboot";
          }
        }

        goto LABEL_129;
      }

      properties = 0LL;
      memset(name, 0, sizeof(name));
      uint64_t v46 = IORegistryEntryGetName(v40, name);
      if (v46)
      {
        statfs v133 = kCFErrorDomainMach;
        uint64_t v134 = v46;
        uint64_t v135 = @"%s: unable to get name for media registry entry";
        goto LABEL_174;
      }

      uint64_t v50 = IORegistryEntryCreateCFProperties(v40, &properties, kCFAllocatorDefault, 0);
      if (v50)
      {
        statfs v133 = kCFErrorDomainMach;
        uint64_t v134 = v50;
        uint64_t v135 = @"%s: unable to get properties for media registry entry";
LABEL_174:
        ramrod_create_error_cf( (CFErrorRef *)&cf,  v133,  v134,  0LL,  v135,  v47,  v48,  v49,  (char)"ramrod_probe_media_internal");
LABEL_175:
        uint64_t v136 = 1;
        goto LABEL_179;
      }

      if (v45)
      {
        uint64_t v51 = 1;
      }

      else
      {
        *(_OWORD *)buffer = 0u;
        uint64_t v163 = 0u;
        CFTypeRef Value = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
        if (Value)
        {
          CFTypeID v53 = Value;
          uint64_t v54 = CFGetTypeID(Value);
          uint64_t v51 = v54 == CFStringGetTypeID()
             && CFStringGetCString(v53, buffer, 32LL, 0x600u)
             && (uint64_t v55 = strlen(byte_100074DC7), !strncmp(buffer, byte_100074DC7, v55))
             && strcmp("s1s1", &buffer[v55]) == 0;
        }

        else
        {
          uint64_t v51 = 0;
        }
      }

      uint64_t v158 = v51;
      uint64_t v56 = CFDictionaryGetValue(properties, @"Content Hint");
      if (!v56)
      {
LABEL_83:
        if (__s2 && (!strcmp(name, __s2) || strstr(name, "OS") || strstr(name, "System")))
        {
          if (!v158)
          {
            uint64_t v140 = name;
            ramrod_log_msg( "found system volume not at %ss1s1: %s\n",  v57,  v58,  v59,  v60,  v61,  v62,  v63,  (char)&storage_device_node_path_0);
          }

          goto LABEL_89;
        }

        uint64_t v103 = v158;
        if (v153 && !strcmp(name, v153))
        {
          uint64_t v104 = &data_device_node_path_0;
          goto LABEL_90;
        }

        if (v152 && !strcmp(name, v152))
        {
          uint64_t v104 = &user_device_node_path_0;
          goto LABEL_90;
        }

        if (v151 && !strcmp(name, v151))
        {
          uint64_t v104 = &update_device_node_path_0;
          goto LABEL_90;
        }

        if (v150 && !strcmp(name, v150))
        {
          uint64_t v104 = &baseband_data_partition_device_node_path_0;
          goto LABEL_90;
        }

        if (v149 && !strcmp(name, v149))
        {
          uint64_t v104 = &log_partition_device_node_path;
          goto LABEL_90;
        }

        if (v148 && !strcmp(name, v148))
        {
          if (!xart_partition_node_path || !ramrod_should_have_xart_partition())
          {
            uint64_t v105 = 0;
            theArray = &xart_partition_node_path;
            goto LABEL_92;
          }

          uint64_t v137 = kCFErrorDomainMach;
LABEL_183:
          uint64_t v138 = @"%s: encountered second '%s' partition; original was '%s'";
LABEL_184:
          ramrod_create_error_cf( (CFErrorRef *)&cf,  v137,  -536870911LL,  0LL,  v138,  v61,  v62,  v63,  (char)"ramrod_probe_media_internal");
LABEL_178:
          uint64_t v136 = 0;
LABEL_179:
          uint64_t v41 = 0LL;
          if (v156 >= 1 && v136)
          {
            sleep(1u);
            uint64_t v41 = ramrod_probe_media_internal(v156 - 1, 0LL);
          }

LABEL_90:
            if (*v104)
            {
              uint64_t v137 = kCFErrorDomainMach;
              goto LABEL_183;
            }

            theArray = v104;
            LOBYTE(v15_Block_object_dispose(va, 8) = v103;
            uint64_t v105 = 0;
LABEL_92:
            while (1)
            {
              uint64_t v106 = (const __CFBoolean *)CFDictionaryGetValue(properties, @"Leaf");
              if (v106)
              {
                if (CFBooleanGetValue(v106) == 1) {
                  break;
                }
              }

              IOObjectRelease(v40);
              CFRelease(properties);
              uint64_t v107 = IOIteratorNext(iterator);
              if (!v107)
              {
LABEL_176:
                ramrod_create_error_cf( (CFErrorRef *)&cf,  kCFErrorDomainMach,  -536870911LL,  0LL,  @"%s: ran out of registry entries without finding a leaf media object",  v108,  v109,  v110,  (char)"ramrod_probe_media_internal");
                uint64_t v136 = 0;
                uint64_t v40 = 0;
                goto LABEL_179;
              }

              uint64_t v40 = v107;
              while (!IOObjectConformsTo(v40, "IOMedia"))
              {
                IOObjectRelease(v40);
                uint64_t v40 = IOIteratorNext(iterator);
                if (!v40) {
                  goto LABEL_176;
                }
              }

              uint64_t v111 = IORegistryEntryCreateCFProperties(v40, &properties, kCFAllocatorDefault, 0);
              if (v111)
              {
                ramrod_create_error_cf( (CFErrorRef *)&cf,  kCFErrorDomainMach,  v111,  0LL,  @"%s: unable to get properties for media registry entry",  v112,  v113,  v114,  (char)"ramrod_probe_media_internal");
                goto LABEL_178;
              }
            }

            if ((v105 & 1) != 0)
            {
              if (CFDictionaryGetValue(properties, @"Encrypted") == kCFBooleanTrue)
              {
                char v122 = (char *)CFDictionaryGetValue(properties, @"BSD Name");
                if (v122)
                {
                  pid_t v123 = v122;
                  *(_WORD *)buffer = 0;
                  posix_spawnattr_t v124 = (const __CFNumber *)CFDictionaryGetValue(properties, @"RoleValue");
                  if (v124) {
                    CFNumberGetValue(v124, kCFNumberSInt16Type, buffer);
                  }
                  else {
                    posix_spawn_file_actions_t v125 = @"Found additional encrypted volume at %@\n";
                  }
                  else {
                    uint64_t v126 = v18;
                  }
                  theArraya = v126;
                  ramrod_log_msg_cf(v125, v123, v140);
                  uint64_t v139 = "/dev/";
                  uint64_t v140 = v123;
                  uint64_t v127 = CFStringCreateWithFormat(0LL, 0LL, @"%s%@");
                  CFArrayAppendValue(theArraya, v127);
                  CFRelease(v127);
                }
              }
            }

            else
            {
              size_t v128 = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
              if (!v128)
              {
                uint64_t v137 = kCFErrorDomainMach;
                uint64_t v138 = @"%s: leaf media object with no bsd name";
                goto LABEL_184;
              }

              *(_OWORD *)buffer = 0u;
              uint64_t v163 = 0u;
              CFStringGetCString(v128, buffer, 32LL, 0x8000100u);
              snprintf(theArray, 0x20uLL, "%s%s", "/dev/", buffer);
            }

            CFRelease(properties);
            uint64_t v45 = v158;
LABEL_129:
            IOObjectRelease(v40);
            goto LABEL_78;
          }

          char v129 = v155;
        }

        ramrod_log_msg("Captured preboot partition on ISC %d\n", v57, v58, v59, v60, v61, v62, v63, v129);
        uint64_t v104 = &isc_preboot_partition_device_node_path;
        goto LABEL_90;
      }

      uint64_t v64 = v56;
      if (!CFEqual(v56, @"LightweightVolumeManager_Media")) {
        break;
      }
      using_LwVM_0 = 1;
LABEL_77:
      uint64_t v45 = v158;
      CFRelease(properties);
LABEL_78:
      uint64_t v40 = IOIteratorNext(iterator);
      if (!v40) {
        goto LABEL_166;
      }
    }

    if (!CFEqual(v64, @"7C3457EF-0000-11AA-AA11-00306543ECAC")
      && !CFEqual(v64, @"52637672-7900-11AA-AA11-00306543ECAC")
      && !CFEqual(v64, @"69646961-6700-11AA-AA11-00306543ECAC")
      && !CFEqual(v64, @"EF57347C-0000-11AA-AA11-00306543ECAC"))
    {
      goto LABEL_83;
    }

    int v65 = (const __CFString *)CFDictionaryGetValue(properties, @"BSD Name");
    if (!v65)
    {
      ramrod_log_msg("APFS Container object with no bsd name", v66, v67, v68, v69, v70, v71, v72, (char)v139);
      goto LABEL_178;
    }

    *(_OWORD *)buffer = 0u;
    uint64_t v163 = 0u;
    CFStringGetCString(v65, buffer, 32LL, 0x8000100u);
    if (CFEqual(v64, @"7C3457EF-0000-11AA-AA11-00306543ECAC") == 1)
    {
      if (strstr(name, "RecoveryOSContainer"))
      {
        uint64_t v155 = 3;
        uint64_t v73 = &apfs_recovery_os_container_device_node_path_0;
      }

      else
      {
        if (*(void *)name ^ 0x737953746F6F4269LL | *(void *)&name[8] ^ 0x61746E6F436D6574LL | *(void *)&name[13] ^ 0x72656E6961746ELL) {
          uint64_t v73 = &apfs_container_device_node_path_0;
        }
        else {
          uint64_t v73 = &iboot_system_container_device_node_path_0;
        }
        if (*(void *)name ^ 0x737953746F6F4269LL | *(void *)&name[8] ^ 0x61746E6F436D6574LL | *(void *)&name[13] ^ 0x72656E6961746ELL) {
          uint64_t v81 = 2;
        }
        else {
          uint64_t v81 = 1;
        }
        uint64_t v155 = v81;
      }

      snprintf(v73, 0x20uLL, "%s%s", "/dev/", buffer);
      uint64_t v140 = v73;
      ramrod_log_msg("APFS Container '%s' %s\n", v82, v83, v84, v85, v86, v87, v88, (char)name);
LABEL_73:
      uint64_t v157 = v73;
      if (!*v73)
      {
        snprintf(v73, 0x20uLL, "%s%s", "/dev/", buffer);
        uint64_t v140 = v73;
        ramrod_log_msg("APFS Container '%s' %s\n", v89, v90, v91, v92, v93, v94, v95, (char)name);
      }

      goto LABEL_76;
    }

    if (CFEqual(v64, @"EF57347C-0000-11AA-AA11-00306543ECAC") == 1)
    {
      if (v157 && *v157)
      {
        ramrod_log_msg( "Found synthesized APFS container. Using %s instead of %s\n",  v74,  v75,  v76,  v77,  v78,  v79,  v80,  (char)buffer);
        snprintf(v157, 0x20uLL, "%s%s", "/dev/", buffer);
        uint64_t v157 = 0LL;
        goto LABEL_76;
      }

      ramrod_log_msg( "found synthesized container without original device node\n",  v74,  v75,  v76,  v77,  v78,  v79,  v80,  (char)v139);
    }

    uint64_t v73 = v157;
    if (v157) {
      goto LABEL_73;
    }
    uint64_t v157 = 0LL;
LABEL_76:
    using_APFS_0 = 1;
    IOObjectRelease(v40);
    goto LABEL_77;
  }

LABEL_166:
  if (!IOIteratorIsValid(iterator))
  {
    ramrod_create_error_cf( (CFErrorRef *)&cf,  kCFErrorDomainMach,  -536870165LL,  0LL,  @"%s: media iterator invalidated",  v130,  v131,  v132,  (char)"ramrod_probe_media_internal");
    uint64_t v40 = 0;
    goto LABEL_175;
  }

  if (CFArrayGetCount(v18) >= 1) {
    additional_encrypted_volume_node_paths = (uint64_t)CFRetain(v18);
  }
  if (CFArrayGetCount(Mutable) < 1) {
    goto LABEL_19;
  }
  uint64_t v40 = 0;
  additional_eds_volume_node_paths = (uint64_t)CFRetain(Mutable);
LABEL_20:
  uint64_t v41 = 1LL;
LABEL_21:
  uint64_t v42 = cf;
LABEL_22:
  if (v42) {
    CFRelease(v42);
  }
  if (v40) {
    IOObjectRelease(v40);
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (v35) {
    IOObjectRelease(v35);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v41;
}

uint64_t ramrod_get_system_partition_device_node(char *a1, size_t __size)
{
  if (!system_device_node_path_0) {
    return 0LL;
  }
  strlcpy(a1, &system_device_node_path_0, __size);
  return 1LL;
}

uint64_t ramrod_hardware_partition_supports_bics()
{
  return ramrod_get_gestalt_BOOLean_answer((uint64_t)@"SupportsBurninMitigation");
}

uint64_t ramrod_get_gestalt_BOOLean_answer(uint64_t a1)
{
  size_t v1 = (const __CFBoolean *)MGCopyAnswer(a1, 0LL);
  if (!v1) {
    return 0LL;
  }
  CFStringRef v2 = v1;
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 == CFBooleanGetTypeID()) {
    uint64_t Value = CFBooleanGetValue(v2);
  }
  else {
    uint64_t Value = 0LL;
  }
  CFRelease(v2);
  return Value;
}

uint64_t ramrod_should_have_xart_partition()
{
  uint64_t v7 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/xART");
  if ((_DWORD)v7)
  {
    ramrod_log_msg("IODeviceTree:/arm-io/sep/iop-sep-nub/xART found\n", v0, v1, v2, v3, v4, v5, v6, v47);
    IOObjectRelease(v7);
    uint64_t v7 = 1LL;
  }

  io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen/has-xart");
  if (v8)
  {
    io_object_t v16 = v8;
    ramrod_log_msg("IODeviceTree:/chosen/has-xart found\n", v9, v10, v11, v12, v13, v14, v15, v47);
    IOObjectRelease(v16);
    uint64_t v7 = 1LL;
  }

  io_registry_entry_t v17 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/defaults");
  if (!v17)
  {
    ramrod_log_msg("Failed to read IODeviceTree:/defaults\n", v18, v19, v20, v21, v22, v23, v24, v47);
    goto LABEL_22;
  }

  io_object_t v25 = v17;
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v17, @"has-xart", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    uint64_t v27 = CFProperty;
    CFTypeID v28 = CFGetTypeID(CFProperty);
    if (v28 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue(v27, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr) {
        uint64_t v36 = "IODeviceTree:/defaults/has-xart found\n";
      }
      else {
        uint64_t v36 = "IODeviceTree:/defaults/has-xart found but is zero\n";
      }
      if (valuePtr) {
        uint64_t v7 = 1LL;
      }
      else {
        uint64_t v7 = v7;
      }
    }

    else
    {
      CFTypeID v44 = CFGetTypeID(v27);
      if (v44 != CFDataGetTypeID()) {
        goto LABEL_20;
      }
      *(_DWORD *)buffer = 0;
      if (CFDataGetLength(v27) == 4)
      {
        v50.id location = 0LL;
        v50.CFIndex length = 4LL;
        CFDataGetBytes(v27, v50, buffer);
        if (*(_DWORD *)buffer)
        {
          ramrod_log_msg("IODeviceTree:/defaults/has-xart found\n", v29, v30, v31, v32, v33, v34, v35, v47);
          uint64_t v7 = 1LL;
          goto LABEL_20;
        }

        uint64_t v36 = "IODeviceTree:/defaults/has-xart found but is zero\n";
      }

      else
      {
        uint64_t v36 = "IODeviceTree:/defaults/has-xart found but is not int sized\n";
      }
    }

    ramrod_log_msg(v36, v29, v30, v31, v32, v33, v34, v35, v47);
LABEL_20:
    CFRelease(v27);
  }

  IOObjectRelease(v25);
LABEL_22:
  if ((_DWORD)v7) {
    uint64_t v45 = "We should have an xART partition.\n";
  }
  else {
    uint64_t v45 = "We should not have an xART partition.\n";
  }
  ramrod_log_msg(v45, v37, v38, v39, v40, v41, v42, v43, v47);
  return v7;
}

uint64_t ramrod_change_filesystem_permissions_opt_err(char *a1, char *a2, int a3, CFErrorRef *a4)
{
  char v5 = (char)a1;
  v20[0] = "/sbin/mount";
  v20[1] = "-u";
  uint64_t v6 = "-r";
  if (!a3) {
    uint64_t v6 = "-w";
  }
  v20[2] = v6;
  v20[3] = a1;
  v20[4] = a2;
  v20[5] = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = __ramrod_execute_command_with_callback_block_invoke;
  v19[3] = &__block_descriptor_48_e13_v24__0r_v8Q16l;
  v19[4] = log_output_buf;
  v19[5] = 0LL;
  uint64_t v14 = _ramrod_execute_command_with_input_data_output_block(v20, 0LL, 0LL, 1, v19);
  if ((_DWORD)v14)
  {
    ramrod_log_msg( "Failed to change permissions on %s mounted at %s to %s. Error: %d.\n",  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v5);
    ramrod_create_error_cf( a4,  @"RamrodErrorDomain",  7LL,  0LL,  @"%s: Failed to change permissions on %s mounted at %s to %s. Error: %d.\n",  v15,  v16,  v17,  (char)"ramrod_change_filesystem_permissions_opt_err");
  }

  else
  {
    ramrod_log_msg("Changed permissions on %s mounted at %s to %s\n", v7, v8, v9, v10, v11, v12, v13, v5);
  }

  return v14;
}

BOOL _find_tagged_regex(const char *a1, regoff_t a2, char *a3, void *a4, void *a5)
{
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  memset(&v20, 0, sizeof(v20));
  int v9 = regcomp(&v20, a3, 265);
  if (v9)
  {
    __int128 v27 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v23 = 0uLL;
    __int128 v24 = 0uLL;
    regmatch_t __pmatch = (regmatch_t)0LL;
    __int128 v22 = 0uLL;
    regerror(v9, &v20, (char *)&__pmatch, 0x80uLL);
    ramrod_log_msg("regcomp failed: %s\n", v13, v14, v15, v16, v17, v18, v19, (char)&__pmatch);
    return 0LL;
  }

  else
  {
    __int128 v29 = 0uLL;
    __int128 v30 = 0uLL;
    __int128 v27 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v23 = 0uLL;
    __int128 v24 = 0uLL;
    __pmatch.rm_so = 0LL;
    __int128 v22 = 0uLL;
    __pmatch.rm_eo = a2;
    int v10 = regexec(&v20, a1, 0xAuLL, &__pmatch, 7);
    BOOL v11 = v10 == 0;
    if (!v10)
    {
      if (a4) {
        *a4 = &a1[v22];
      }
      if (a5) {
        *a5 = *((void *)&v22 + 1) - v22;
      }
    }

    regfree(&v20);
  }

  return v11;
}

uint64_t ___ramrod_execute_command_with_input_data_output_block_block_invoke( uint64_t a1, posix_spawn_file_actions_t *a2)
{
  if (*(_BYTE *)(a1 + 32)) {
    posix_spawn_file_actions_adddup2(a2, 1, 2);
  }
  return 0LL;
}

uint64_t ___ramrod_execute_command_with_input_data_output_block_block_invoke_2(uint64_t a1, int __fd)
{
  int64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 1)
  {
    uint64_t v4 = *(char **)(a1 + 32);
    while (1)
    {
      ssize_t v5 = write(__fd, v4, v2);
      if (v5 == -1) {
        break;
      }
      v4 += v5;
      BOOL v6 = v2 <= v5;
      v2 -= v5;
      if (v6) {
        return 0LL;
      }
    }

    uint64_t v7 = __error();
    char v8 = strerror(*v7);
    ramrod_log_msg("write failed for subprocess: %s\n", v9, v10, v11, v12, v13, v14, v15, v8);
  }

  return 0LL;
}

void ramrod_create_error_cf( CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_create_error_internal_va( CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, a5, a6);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }

      if (a4) {
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      }
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }

void submitRestoreLogFileToLogDir_cold_1()
{
  uint64_t v0 = __error();
  uint64_t v1 = _os_assert_log(*v0);
  _os_crash(v1);
  __break(1u);
}

void __os_cleanup_iorelease_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (OUTLINED_FUNCTION_1()) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  uint64_t v7 = OUTLINED_FUNCTION_0(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void __os_cleanup_iorelease_cold_1_0(void *a1, _OWORD *a2)
{
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  OUTLINED_FUNCTION_4(v6);
  __break(1u);
}

void __os_cleanup_ioclose_cold_1(void *a1, _OWORD *a2)
{
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  OUTLINED_FUNCTION_4(v6);
  __break(1u);
}

void __os_cleanup_iorelease_cold_1_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = OUTLINED_FUNCTION_0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

id objc_msgSend__copyUnsubmittedEventsFromDirectory_skipEventsIfPreviouslySubmittedAndWithinBackoffTime_previouslySubmittedEventSkipped_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_copyUnsubmittedEventsFromDirectory:skipEventsIfPreviouslySubmittedAndWithinBackoffTime:previouslySubmittedEventSkipped:");
}

id objc_msgSend__isEnabledWithAdditionalIndicators_options_updateAttributes_snapshotPrepare_splat_sfr_purging_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_isEnabledWithAdditionalIndicators:options:updateAttributes:snapshotPrepare:splat:sfr:purging:");
}

id objc_msgSend_stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageDetermineAllAvailableSync:forTargetBuildVersion:totalExpectedBytes:error:");
}

id objc_msgSend_writer(void *a1, const char *a2, ...)
{
  return [a1 writer];
}