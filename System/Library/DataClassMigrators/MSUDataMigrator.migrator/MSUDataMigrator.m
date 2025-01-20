void debug(char *a1, ...)
{
  va_list va;
  va_start(va, a1);
  debugv((uint64_t)a1, (uint64_t)va);
}

void debugv(uint64_t a1, uint64_t a2)
{
  if (log_file)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"HH:mm:ss");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v4));
    v7 = objc_alloc(&OBJC_CLASS___NSString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
    v9 = -[NSString initWithFormat:arguments:](v7, "initWithFormat:arguments:", v8, a2);

    bzero(v11, 0x400uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v6, v9));
    [v10 getCString:v11 maxLength:1023 encoding:4];

    fputs(v11, (FILE *)log_file);
  }
}

void error(char *a1, ...)
{
  if (serialLogLevel) {
    vfprintf(__stderrp, a1, va);
  }
  debugv((uint64_t)a1, (uint64_t)va);
}

FILE *init_log(int a1, int a2)
{
  serialLogLevel = a2;
  if (a1) {
    v2 = "a+";
  }
  else {
    v2 = "w+";
  }
  result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", v2);
  log_file = (uint64_t)result;
  return result;
}

uint64_t flush_log()
{
  uint64_t result = log_file;
  if (log_file)
  {
    fflush((FILE *)log_file);
    return fclose((FILE *)log_file);
  }

  return result;
}

char *copy_path_for_booted_os_data()
{
  v0 = (const __CFData *)MGCopyAnswer(@"BootManifestHash", 0LL);
  if (!v0)
  {
    printf("%s: Failed to query gestalt for the BootManifestHash\n", "copy_path_for_booted_os_data");
    return 0LL;
  }

  v1 = v0;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  *(_OWORD *)buffer = 0u;
  __int128 v12 = 0u;
  CFIndex Length = CFDataGetLength(v0);
  BytePtr = CFDataGetBytePtr(v1);
  if (!BytePtr)
  {
    printf("%s: Failed to get byte pointer from bootManifestHash data returned by gestalt\n");
LABEL_12:
    CFRelease(v1);
    return 0LL;
  }

  v4 = BytePtr;
  CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
  if (!Mutable)
  {
    printf("%s: Failed to create bootManifestHashString\n");
    goto LABEL_12;
  }

  v6 = Mutable;
  if (Length >= 1)
  {
    do
    {
      unsigned int v7 = *v4++;
      CFStringAppendFormat(v6, 0LL, @"%02x", v7);
      --Length;
    }

    while (Length);
  }

  CFStringGetCString(v6, buffer, 512LL, 0x8000100u);
  if (buffer[0])
  {
    v8 = (char *)malloc(0x400uLL);
    v9 = v8;
    if (v8)
    {
      bzero(v8, 0x400uLL);
      snprintf(v9, 0x3FFuLL, "%s/%s-MSUData", "/private/var/MobileSoftwareUpdate/", buffer);
    }

    else
    {
      printf( "%s: Failed to allocate memory for storing the path to the bootedOSData folder\n",  "copy_path_for_booted_os_data");
    }
  }

  else
  {
    printf("%s: Failed to get C string representation of bootManifestHash\n", "copy_path_for_booted_os_data");
    v9 = 0LL;
  }

  CFRelease(v1);
  CFRelease(v6);
  return v9;
}

uint64_t delete_folder_contents(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  bzero(v59, 0x400uLL);
  if (v1)
  {
    id v25 = 0LL;
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentsOfDirectoryAtPath:v1 error:&v25]);
    id v4 = v25;
    [v1 getCString:v59 maxLength:1023 encoding:1];
    if (v4)
    {
      __int128 v57 = 0uLL;
      __int128 v58 = 0uLL;
      __int128 v55 = 0uLL;
      __int128 v56 = 0uLL;
      __int128 v53 = 0uLL;
      __int128 v54 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v49 = 0uLL;
      __int128 v50 = 0uLL;
      __int128 v47 = 0uLL;
      __int128 v48 = 0uLL;
      __int128 v45 = 0uLL;
      __int128 v46 = 0uLL;
      __int128 v43 = 0uLL;
      __int128 v44 = 0uLL;
      __int128 v41 = 0uLL;
      __int128 v42 = 0uLL;
      __int128 v39 = 0uLL;
      __int128 v40 = 0uLL;
      __int128 v37 = 0uLL;
      __int128 v38 = 0uLL;
      __int128 v35 = 0uLL;
      __int128 v36 = 0uLL;
      __int128 v33 = 0uLL;
      __int128 v34 = 0uLL;
      __int128 v31 = 0uLL;
      __int128 v32 = 0uLL;
      __int128 v29 = 0uLL;
      __int128 v30 = 0uLL;
      __int128 v27 = 0uLL;
      __int128 v28 = 0uLL;
      v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
      [v5 getCString:&v27 maxLength:511 encoding:4];

      if ((_BYTE)v27) {
        v6 = (const char *)&v27;
      }
      else {
        v6 = "Unable to parse error reason";
      }
      error("%s: Failed to search folder %s: %s\n", "delete_folder_contents", v59, v6);

      uint64_t v7 = 9LL;
    }

    else
    {
      __int128 v23 = 0uLL;
      __int128 v24 = 0uLL;
      __int128 v21 = 0uLL;
      __int128 v22 = 0uLL;
      id obj = v3;
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v7 = 0LL;
        v10 = 0LL;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);

            __int128 v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%@",  v1,  v13);
            id v20 = 0LL;
            [v2 removeItemAtPath:v14 error:&v20];
            id v15 = v20;
            v10 = v15;
            if (v15)
            {
              __int128 v57 = 0u;
              __int128 v58 = 0u;
              __int128 v55 = 0u;
              __int128 v56 = 0u;
              __int128 v53 = 0u;
              __int128 v54 = 0u;
              __int128 v51 = 0u;
              __int128 v52 = 0u;
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              __int128 v47 = 0u;
              __int128 v48 = 0u;
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              __int128 v43 = 0u;
              __int128 v44 = 0u;
              __int128 v41 = 0u;
              __int128 v42 = 0u;
              __int128 v39 = 0u;
              __int128 v40 = 0u;
              __int128 v37 = 0u;
              __int128 v38 = 0u;
              __int128 v35 = 0u;
              __int128 v36 = 0u;
              __int128 v33 = 0u;
              __int128 v34 = 0u;
              __int128 v31 = 0u;
              __int128 v32 = 0u;
              __int128 v29 = 0u;
              __int128 v30 = 0u;
              __int128 v27 = 0u;
              __int128 v28 = 0u;
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
              [v16 getCString:&v27 maxLength:511 encoding:4];

              if ((_BYTE)v27) {
                __int128 v17 = (const char *)&v27;
              }
              else {
                __int128 v17 = "Unable to parse error reason";
              }
              error("%s: Failed to delete %s: %s\n", "delete_folder_contents", v59, v17);
              uint64_t v7 = 9LL;
            }
          }

          id v9 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        }

        while (v9);
      }

      else
      {
        uint64_t v7 = 0LL;
      }
    }
  }

  else
  {
    error("%s: Invalid argument passed as folderpath\n", "delete_folder_contents");
    uint64_t v7 = 22LL;
  }

  return v7;
}

void reset_msu_earlyboottask_usage_stats()
{
  totalDataMoved = 0LL;
  totalTimeSpentInFileMoves = 0LL;
}

void print_msu_earlyboottask_usage_stats()
{
}

uint64_t move_directory_hierarchy(char *a1, const char *a2)
{
  v19[0] = a1;
  v19[1] = 0LL;
  if (!a1 || !a2)
  {
    error("Invalid argument passed to %s", "move_directory_hierarchy");
    return 22LL;
  }

  id v4 = fts_open(v19, 20, 0LL);
  if (!v4)
  {
    uint64_t v13 = __error();
    __int128 v14 = strerror(*v13);
    error("Failed to open source directory hierarchy: %s\n", v14);
    return *__error();
  }

  v5 = v4;
  v6 = fts_read(v4);
  if (!v6)
  {
LABEL_21:
    uint64_t v17 = 0LL;
    goto LABEL_22;
  }

  uint64_t v7 = v6;
  while (1)
  {
    if (v7->fts_info == 7)
    {
      error("Got error while traversing source directory %s", a1);
      goto LABEL_21;
    }

    bzero(__str, 0x400uLL);
    size_t v8 = strlen(a1);
    snprintf(__str, 0x3FFuLL, "%s%s", a2, &v7->fts_path[v8]);
    int fts_info = v7->fts_info;
    if (copyfile(v7->fts_path, __str, 0LL, 0x12C000Fu))
    {
      uint64_t v17 = *__error();
      error("Failed to recreate symlink %s at %s: %d\n");
      goto LABEL_22;
    }

LABEL_16:
    uint64_t v7 = fts_read(v5);
    if (!v7) {
      goto LABEL_21;
    }
  }

  if (fts_info != 8)
  {
    if (fts_info == 1 && copyfile(v7->fts_path, __str, 0LL, 7u))
    {
      __int128 v16 = __error();
      uint64_t v17 = *v16;
      error("Failed to recreate folder %s at %s: %d\n", v7->fts_path, __str, *v16);
      goto LABEL_22;
    }

    goto LABEL_16;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v11 = v10;
  if (!copyfile(v7->fts_path, __str, 0LL, 0x13C000Fu))
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    totalDataMoved += v7->fts_statp->st_size;
    *(double *)&totalTimeSpentInFileMoves = v12 - v11 + *(double *)&totalTimeSpentInFileMoves;
    goto LABEL_16;
  }

  uint64_t v17 = *__error();
  error("Failed to move regular file %s to %s: %d\n");
LABEL_22:
  fts_close(v5);
  return v17;
}

uint64_t moveFolderContentsIfItExists(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (v3 && v4)
  {
    bzero(v16, 0x400uLL);
    bzero(v15, 0x400uLL);
    [v3 getCString:v16 maxLength:1023 encoding:4];
    [v4 getCString:v15 maxLength:1023 encoding:4];
    if (!v16[0] || !v15[0]) {
      error("%s: Unable to convert source/destination paths to C strings", "moveFolderContentsIfItExists");
    }
    debug("%s: Checking for source folder at: %s\n", "moveFolderContentsIfItExists", v16);
    [v5 fileExistsAtPath:v3 isDirectory:&v13];
    if (!v13)
    {
      debug("%s: Source folder %s does not exist\n");
      goto LABEL_18;
    }

    debug("%s: Folder exists..Attempting to move to %s\n", "moveFolderContentsIfItExists", v15);
    if ((move_directory_hierarchy(v16, v15) & 0x80000000) == 0)
    {
      id v12 = 0LL;
      [v5 removeItemAtPath:v3 error:&v12];
      id v6 = v12;
      if (v6)
      {
        uint64_t v7 = v6;
        memset(v14, 0, sizeof(v14));
        size_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
        [v8 getCString:v14 maxLength:511 encoding:4];

        if (LOBYTE(v14[0])) {
          id v9 = (const char *)v14;
        }
        else {
          id v9 = "Unable to parse error reason";
        }
        error("%s: Failed to remove %s folder(%s)\n", "moveFolderContentsIfItExists", v16, v9);

        goto LABEL_14;
      }

      debug("%s: Successfully moved %s to %s\n");
LABEL_18:
      uint64_t v10 = 1LL;
      goto LABEL_19;
    }

    error("%s: Failed to move folder contents\n");
  }

  else
  {
    error("%s: Invalid arguments passed to source/destination");
  }

LABEL_14:
  uint64_t v10 = 0LL;
LABEL_19:

  return v10;
}

LABEL_24:
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v10[8] date]);
        [v28 timeIntervalSinceDate:v39];
        __int128 v30 = v29;

        debug( "App Migration Stats:\n \tNum apps: %d\n \tTotal Time: %f seconds \n \tAverage Time: %f seconds \n \tLongest Time: %s (%f seconds)\n",  v27,  v30,  v30 / (double)v27,  v57,  v15);
        print_msu_earlyboottask_usage_stats();
        __int128 v47 = 0LL;
        v2 = v43;
        id v6 = v40;
        [v43 removeItemAtPath:v40 error:&v47];
        __int128 v31 = v47;
        __int128 v32 = v31;
        if (v31)
        {
          memset(v53, 0, sizeof(v53));
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v31 description]);
          [v33 getCString:v53 maxLength:511 encoding:4];

          if (LOBYTE(v53[0])) {
            __int128 v34 = (const char *)v53;
          }
          else {
            __int128 v34 = "Unable to parse error reason";
          }
          id v4 = (char *)v42;
          error( "%s: Failed to remove %s folder(%s). Writing cookie file for earlyBootTask\n",  "-[MSUDataMigrator performMigration]",  v42,  v34);
          __int128 v35 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%s",  v40,  "PluginHasCompleted.txt");
          [v43 createFileAtPath:v35 contents:0 attributes:0];
        }

        else
        {
          id v4 = (char *)v42;
          debug( "%s: Successfully cleared out stashed data folder(%s) created by the ramdisk\n",  "-[MSUDataMigrator performMigration]",  v42);
        }

        v5 = v41;
        debug("MobileSoftwareUpdate DataMigrator plugin completed successfully\n");
        flush_log();

        goto LABEL_31;
      }

      debug("MobileSoftwareUpdate DataMigrator plugin has nothing to do since no folder found at %s..Exiting\n", v4);
    }

    flush_log();
LABEL_31:
    free(v4);

    goto LABEL_32;
  }

  error("Unable to get path for stashed booted os data\n");
  flush_log();
LABEL_32:

  return 1;
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}