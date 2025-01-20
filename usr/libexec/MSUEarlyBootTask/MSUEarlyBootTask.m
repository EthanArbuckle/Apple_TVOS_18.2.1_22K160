void MSUCleanupUUIDTextFolder(uint64_t a1)
{
  id v1;
  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", a1, 1LL));
}

void debug(char *a1, ...)
{
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
  mkdir("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", 0x1EDu);
  int v3 = MSUEarlyBootTaskSetupACLForPath(@"/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask");
  if ((v3 & 1) != 0)
  {
    debug("MSUEarlyBootTask: Set up ACL on log folder\n");
  }

  else
  {
    error("MSUEarlyBootTask: Failed to set up ACL on log folder\n");
    v4 = getpwnam("mobile");
    if (v4)
    {
      uid_t pw_uid = v4->pw_uid;
      gid_t pw_gid = v4->pw_gid;
    }

    else
    {
      gid_t pw_gid = 501;
      uid_t pw_uid = 501;
    }

    lchown("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", pw_uid, pw_gid);
    lchmod("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", 0x1EDu);
  }

  if (a1) {
    v7 = "a+";
  }
  else {
    v7 = "w+";
  }
  result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", v7);
  log_file = (uint64_t)result;
  if (v3)
  {
    fclose(result);
    if ((MSUEarlyBootTaskSetupACLForPath(@"/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log") & 1) != 0) {
      debug("MSUEarlyBootTas: Set up ACL on log file\n");
    }
    else {
      error("MSUEarlyBootTask: Failed to set up acl on log file\n");
    }
    result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", "a+");
    log_file = (uint64_t)result;
  }

  return result;
}

uint64_t MSUEarlyBootTaskSetupACLForPath(void *a1)
{
  id v1 = a1;
  char v18 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v2 fileExistsAtPath:v1 isDirectory:&v18])
  {
    int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributesOfItemAtPath:v1 error:0]);
    v4 = v3;
    if (!v3)
    {
      [v1 fileSystemRepresentation];
      error("Failed to read attributes of item at path: %s\n");
      goto LABEL_19;
    }

    NSFileAttributeType v5 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v3 fileType]);
    NSFileAttributeType v6 = v5;
    if (v5 == NSFileTypeDirectory)
    {
    }

    else
    {
      NSFileAttributeType v7 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v4 fileType]);

      if (v7 != NSFileTypeRegular)
      {
        memset(v19, 0, sizeof(v19));
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 fileType]);
        [v8 getCString:v19 maxLength:127 encoding:4];

        [v1 fileSystemRepresentation];
        error("File %s is a unsupported type(%s)");
LABEL_19:
        uint64_t v9 = 0LL;
LABEL_23:

        goto LABEL_24;
      }
    }

    if (v18)
    {
      uint64_t v9 = MSUEarlyBootTaskSetupACLForPath_dirAcl;
      if (!MSUEarlyBootTaskSetupACLForPath_dirAcl)
      {
        uint64_t v9 = (uint64_t)MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(1);
        MSUEarlyBootTaskSetupACLForPath_dirAcl = v9;
        if (!v9)
        {
LABEL_22:
          error("%s: Failed to alloc acl..bailing\n", "MSUEarlyBootTaskSetupACLForPath");
          goto LABEL_23;
        }
      }
    }

    else
    {
      uint64_t v9 = MSUEarlyBootTaskSetupACLForPath_fileAcl;
      if (!MSUEarlyBootTaskSetupACLForPath_fileAcl)
      {
        uint64_t v9 = (uint64_t)MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(0);
        MSUEarlyBootTaskSetupACLForPath_fileAcl = v9;
        if (!v9) {
          goto LABEL_22;
        }
      }
    }

    v10 = getpwnam("nobody");
    if (v10)
    {
      uid_t pw_uid = v10->pw_uid;
      gid_t pw_gid = v10->pw_gid;
      id v13 = v1;
      if (acl_set_link_np((const char *)[v13 fileSystemRepresentation], ACL_TYPE_EXTENDED, (acl_t)v9))
      {
        v14 = __error();
        v15 = strerror(*v14);
        error("%s: Call to acl_set_file failed(%s)\n", "MSUEarlyBootTaskSetupACLForPath", v15);
      }

      else
      {
        id v16 = v13;
        lchown((const char *)[v16 fileSystemRepresentation], pw_uid, pw_gid);
        lchmod((const char *)[v16 fileSystemRepresentation], 0);
      }

      uint64_t v9 = 1LL;
      goto LABEL_23;
    }

    error("%s: Failed to get uid to set up acl\n");
    goto LABEL_19;
  }

  uint64_t v9 = 1LL;
LABEL_24:

  return v9;
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

  id v1 = v0;
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

  NSFileAttributeType v6 = Mutable;
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
    uint64_t v9 = v8;
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
    uint64_t v9 = 0LL;
  }

  CFRelease(v1);
  CFRelease(v6);
  return v9;
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

  v4 = fts_open(v19, 20, 0LL);
  if (!v4)
  {
    __int128 v13 = __error();
    __int128 v14 = strerror(*v13);
    error("Failed to open source directory hierarchy: %s\n", v14);
    return *__error();
  }

  NSFileAttributeType v5 = v4;
  NSFileAttributeType v6 = fts_read(v4);
  if (!v6)
  {
LABEL_21:
    uint64_t v17 = 0LL;
    goto LABEL_22;
  }

  unsigned int v7 = v6;
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
    unsigned int v7 = fts_read(v5);
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
  NSFileAttributeType v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
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
        unsigned int v7 = v6;
        memset(v14, 0, sizeof(v14));
        size_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
        [v8 getCString:v14 maxLength:511 encoding:4];

        if (LOBYTE(v14[0])) {
          uint64_t v9 = (const char *)v14;
        }
        else {
          uint64_t v9 = "Unable to parse error reason";
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

int main(int argc, const char **argv, const char **envp)
{
  if (statfs("/", &v206)) {
    main_cold_1();
  }
  if ((v206.f_flags & 0x40000000) == 0)
  {
    int v3 = access("/usr/appleinternal/bin/snapshottool", 0);
    id v4 = "/usr/local/bin/snapshottool";
    if (!v3) {
      id v4 = "/usr/appleinternal/bin/snapshottool";
    }
    *(void *)&v232[0] = v4;
    *((void *)&v232[0] + 1) = "golive";
    *(void *)&v232[1] = "cryptexes";
    *((void *)&v232[1] + 1) = 0LL;
    execForMSUEarlyBootTask((const char **)v232);
  }

  NSFileAttributeType v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v196 = 0;
  puts("MSUEarlyBootTask: MSUEarlyBootTask running");
  time_t v195 = 0LL;
  time(&v195);
  id v6 = copy_path_for_booted_os_data();
  if (!v6)
  {
    printf("%s: Unable to get path for booted OS data\n", "main");
    goto LABEL_244;
  }

  unsigned int v7 = v6;
  size_t v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s", v6);
  if (&_os_variant_uses_ephemeral_storage)
  {
    int v9 = os_variant_uses_ephemeral_storage("com.apple.MobileSoftwareUpdate");
    if (v9) {
      uint64_t v10 = "MSUEarlyBootTask running in limited env";
    }
    else {
      uint64_t v10 = "MSUEarlyBootTask running in normal env";
    }
    puts(v10);
    if (v9)
    {
      printf("%s: MSUEarlyBootTask running in a limited environment and is not supported..Goodbye!\n", "main");
      goto LABEL_243;
    }
  }

  else
  {
    puts("MSUEarlyBootTask is running in normal env(default)");
  }

  printf("%s: Content from the ramdisk will be present at %s if it exists\n", "main", v7);
  double v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%s",  v8,  "EarlyBootTaskHasCompleted.txt");
  [v5 fileExistsAtPath:v8 isDirectory:&v196];
  if (!v196)
  {
    puts("MSUEarlyBootTask: I have nothing to do. Goodbye!!");

    goto LABEL_243;
  }

  id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%s",  v8,  "PluginHasCompleted.txt");
  if ([v5 fileExistsAtPath:v12])
  {
    init_log(1, 3);
    char v13 = ctime(&v195);
    debug( "MSUEarlyBootTask running. Found cookie written by DataMigrator indicating the first boot operations have already completed: %s\n",  v13);
    id v194 = 0LL;
    [v5 removeItemAtPath:v8 error:&v194];
    id v14 = v194;
    __int128 v15 = v14;
    if (v14)
    {
      memset(v232, 0, 512);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
      [v16 getCString:v232 maxLength:511 encoding:4];

      if (LOBYTE(v232[0])) {
        uint64_t v17 = (const char *)v232;
      }
      else {
        uint64_t v17 = "Unable to parse error reason";
      }
      error("%s: Failed to remove folder stashed by previous ramdisk : %s : Task exiting cleanly\n", "main", v17);
    }

    else
    {
      debug("%s: Successfully removed folder stashed by previous ramdisk\n", "main");
    }

    __int128 v19 = ctime(&v195);
    printf("%s: MSUDataMigrator has nothing more to do(%s)..Goodbye!!\n", "main", v19);

    goto LABEL_243;
  }

  init_log(0, 3);
  __int128 v18 = ctime(&v195);
  debug( "%s: MSUEarlyBootTask running..Found data created by previous ramdisk. Assuming first boot after update at time %s\n",  "main",  v18);
  debug("%s: MSUEarlyBootTask: Enabling vnode rapid aging\n", "main");
  *(void *)&v232[0] = 0x4400000001LL;
  v208.st_dev = 1;
  else {
    debug("%s: MSUEarlyBootTask: Successfully enabled rapid vnode aging\n", "main");
  }
  if ((MSUEarlyBootTaskSetupACLForPath(v8) & 1) != 0) {
    debug("MSUEarlyBootTask: Successfully set up ACL for folder stashed by ramdisk\n");
  }
  else {
    error("MSUEarlyBootTask: Failed to set up ACL for folder stashed by ramdisk\n");
  }

  __int128 v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%s",  v8,  "LOW_SPACE_CLEANUP_RUN.txt");
  __int128 v21 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%s",  v8,  "SYSTEM_APPS_STAGE_FAILED.txt");
  debug("MSUEarlyBootTasks: Cleaning up stale stashed paths\n");
  id v193 = 0LL;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( [v5 contentsOfDirectoryAtPath:@"/private/var/MobileSoftwareUpdate/" error:&v193]);
  id v23 = v193;
  v182 = v8;
  if (v23)
  {
    memset(v232, 0, 512);
    v183 = v23;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 description]);
    [v24 getCString:v232 maxLength:511 encoding:4];

    if (LOBYTE(v232[0])) {
      __int128 v25 = (const char *)v232;
    }
    else {
      __int128 v25 = "Unable to parse error reason";
    }
    error("%s: Failed to search for stale stashed folders: %s\n", "main", v25);
  }

  else
  {
    v173 = v21;
    v177 = v20;
    v179 = v7;
    __int128 v191 = 0u;
    __int128 v192 = 0u;
    __int128 v189 = 0u;
    __int128 v190 = 0u;
    v175 = v22;
    id v26 = v22;
    id v27 = [v26 countByEnumeratingWithState:&v189 objects:v205 count:16];
    if (v27)
    {
      id v28 = v27;
      v183 = 0LL;
      uint64_t v29 = *(void *)v190;
      __int128 v30 = &APFSOverProvModel_ptr;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v190 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void *)(*((void *)&v189 + 1) + 8LL * (void)i);
          bzero(v232, 0x400uLL);
          id v33 = [objc_alloc((Class)v30[22]) initWithFormat:@"%s/%@", "/private/var/MobileSoftwareUpdate/", v32];
          if ([v33 containsString:@"-MSUData"]
            && ([v33 isEqualToString:v182] & 1) == 0)
          {
            [v33 getCString:v232 maxLength:1023 encoding:1];
            debug("%s: Removing folder :%s:\n", "main", (const char *)v232);

            id v188 = 0LL;
            [v5 removeItemAtPath:v33 error:&v188];
            id v34 = v188;
            if (v34)
            {
              __int128 v231 = 0u;
              __int128 v230 = 0u;
              __int128 v229 = 0u;
              __int128 v228 = 0u;
              __int128 v227 = 0u;
              __int128 v226 = 0u;
              __int128 v225 = 0u;
              __int128 v224 = 0u;
              __int128 v223 = 0u;
              __int128 v222 = 0u;
              __int128 v221 = 0u;
              __int128 v220 = 0u;
              __int128 v219 = 0u;
              __int128 v218 = 0u;
              __int128 v217 = 0u;
              __int128 v216 = 0u;
              __int128 v215 = 0u;
              __int128 v214 = 0u;
              __int128 v213 = 0u;
              __int128 v212 = 0u;
              __int128 v211 = 0u;
              __int128 v210 = 0u;
              __int128 v209 = 0u;
              memset(&v208, 0, sizeof(v208));
              v183 = v34;
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 description]);
              [v35 getCString:&v208 maxLength:511 encoding:4];

              __int128 v36 = (const char *)&v208;
              if (!LOBYTE(v208.st_dev)) {
                __int128 v36 = "Unable to parse error reason";
              }
              error("%s: Failed to erase folder %s : %s\n", "main", (const char *)v232, v36);
            }

            else
            {
              v183 = 0LL;
            }

            __int128 v30 = &APFSOverProvModel_ptr;
          }
        }

        id v28 = [v26 countByEnumeratingWithState:&v189 objects:v205 count:16];
      }

      while (v28);
    }

    else
    {
      v183 = 0LL;
    }

    size_t v8 = v182;
    __int128 v21 = v173;
    __int128 v20 = v177;
    unsigned int v7 = v179;
    __int128 v22 = v175;
  }

  if ([v5 fileExistsAtPath:v11])
  {
    debug("EarlyBootTask has already completed but DataMigrator plugin has not been run for this build\n");

    goto LABEL_243;
  }

  v174 = v21;
  v176 = v22;
  v178 = v20;
  v180 = (char *)v7;
  MSUCleanupUUIDTextFolder((uint64_t)@"/");
  debug("%s: Running fixup var operations\n", "main");
  debug("entering %s\n", "update_var_directory_hierarchy");
  v181 = v5;
  if (mkdir("/private/var/MobileSoftwareUpdate/mnt1", 0x1C0u) && *__error() != 17)
  {
    __int128 v40 = __error();
    __int128 v41 = strerror(*v40);
    error("Failed to create system volume mount point at %s : %s\n", "/private/var/MobileSoftwareUpdate/mnt1", v41);
    goto LABEL_127;
  }

  debug("Created system mount point at %s\n", "/private/var/MobileSoftwareUpdate/mnt1");
  if ((v206.f_flags & 0x40000000) != 0)
  {
    __int128 v37 = v8;
    __int128 v39 = strrchr(v206.f_mntfromname, 64);
    if (v39) {
      f_mntfromname = v39 + 1;
    }
    else {
      f_mntfromname = v206.f_mntfromname;
    }
  }

  else
  {
    __int128 v37 = v8;
    f_mntfromname = v206.f_mntfromname;
  }

  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", f_mntfromname));
  if (!v42)
  {
    error("Failed to get bsd node for root dev...\n");
    goto LABEL_126;
  }

  if ((v206.f_flags & 0x40000000) == 0)
  {
    debug("System is currently rooted from a live filesystem\n");
    v43 = copy_root_snapshot_name_from_dt();
    if (!v43)
    {
      error("Failed to copy default boot snapshot name");

      size_t v8 = v37;
      goto LABEL_77;
    }

    v44 = v43;
    debug("Will attempt to mount snapshot %s at %s\n", v43, "/private/var/MobileSoftwareUpdate/mnt1");
    id v45 = v42;
    if (msuearlyboottask_mount_filesystem( (const char *)[v45 fileSystemRepresentation],  v44,  1))
    {
      free(v44);
      error("Failed to mount snapshot..\n");

LABEL_126:
      size_t v8 = v37;
      goto LABEL_127;
    }

    debug("Successfully mounted system snapshot..\n");
    msuearlyboottask_dump_mounted_filesystem_info();
    free(v44);
    goto LABEL_85;
  }

  debug("System is currently rooted from a snapshot\n");
  id v46 = v42;
  if (msuearlyboottask_mount_filesystem( (const char *)[v46 fileSystemRepresentation],  0,  0))
  {
    error("Failed to mount system volume..\n");
LABEL_125:

    goto LABEL_126;
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v206.f_mntfromname));
  v48 = v47;
  if (v47)
  {
    id v49 = v47;
    *(void *)&v208.st_dev = 0LL;
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"(.+@)?(\\/dev\\/.+$)",  1LL,  &v208));
    id v51 = *(id *)&v208.st_dev;
    v169 = v50;
    v171 = v49;
    if (v51)
    {
      bzero(v232, 0x400uLL);
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 description]);
      [v52 getCString:v232 maxLength:1024 encoding:4];

      if (LOBYTE(v232[0])) {
        v53 = (const char *)v232;
      }
      else {
        v53 = "Unknown";
      }
      error("Error %s encountered creating regular expression..\n", v53);
      v54 = &stru_100008688;
    }

    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstMatchInString:options:range:", v49, 0, 0, objc_msgSend(v49, "length")));
      v75 = v74;
      if (v74)
      {
        id v76 = [v74 rangeAtIndex:1];
        if (v77) {
          id v78 = v76;
        }
        else {
          id v78 = 0LL;
        }
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "substringWithRange:", v78, v77));
      }

      else
      {
        v54 = &stru_100008688;
      }

      NSFileAttributeType v5 = v181;
    }

    if (-[__CFString hasSuffix:](v54, "hasSuffix:", @"@"))
    {
      uint64_t v79 = objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v54, "substringToIndex:", (char *)-[__CFString length](v54, "length") - 1));

      v54 = (__CFString *)v79;
    }
  }

  else
  {
    error("could not create string from f_mntfromname %s\n", v206.f_mntfromname);
    v54 = &stru_100008688;
  }

  bzero(v232, 0x400uLL);
  -[__CFString getCString:maxLength:encoding:](v54, "getCString:maxLength:encoding:", v232, 1024LL, 4LL);
  int v80 = open("/private/var/MobileSoftwareUpdate/mnt1", 0);
  if (v80 < 0)
  {
    v83 = __error();
    strerror(*v83);
    error("Failed to open system volume mount point(%s): %s\n");
LABEL_124:

    goto LABEL_125;
  }

  int v81 = v80;
  debug("Reverting to snapshot(%s)\n", (const char *)v232);
  if (fs_snapshot_revert(v81, (const char *)v232, 0))
  {
    v82 = __error();
    strerror(*v82);
    error("revert snapshot operation failed: %s\n");
LABEL_148:

    close(v81);
    size_t v8 = v37;
    goto LABEL_127;
  }

  debug("Reverting system snapshot succeeded. Remounting.\n");
  if (close(v81))
  {
    v99 = __error();
    strerror(*v99);
    error("Unable to close dir(%s): %s\n");
    goto LABEL_148;
  }

  debug("Unmounting system volume..\n");
  msuearlyboottask_unmount_filesystem();
  debug("Remounting system volume at %s\n", "/private/var/MobileSoftwareUpdate/mnt1");
  if (msuearlyboottask_mount_filesystem( (const char *)[v46 fileSystemRepresentation], 0, 0))
  {
    error("Failed to mount system volume..\n");
    goto LABEL_124;
  }

  debug("Successfully re-mounted system volume...\n");
  msuearlyboottask_dump_mounted_filesystem_info();

LABEL_85:
  *(_OWORD *)v207 = off_100008418;
  v55 = fts_open(v207, 84, 0LL);
  if (!v55)
  {
    v72 = __error();
    v73 = strerror(*v72);
    error("unable to open restored /private/var: %s\n", v73);
    int fts_errno = -1;
    goto LABEL_169;
  }

  v56 = v55;
  v57 = v5;
  v58 = fts_read(v55);
  if (!v58)
  {
LABEL_106:
    if (*__error())
    {
      int fts_errno = *__error();
      v70 = __error();
      v71 = strerror(*v70);
      error("fts_read failed: %s\n", v71);
    }

    else
    {
      int fts_errno = 0;
    }

    goto LABEL_168;
  }

  v59 = v58;
  while (1)
  {
    int fts_info = v59->fts_info;
    if (fts_info == 1)
    {
      memset(&v208, 0, sizeof(v208));
      memcpy(v232, "/private/var", sizeof(v232));
      __strlcat_chk(v232, v59->fts_path + 50, 1024LL, 1024LL);
      if (lstat((const char *)v232, &v208))
      {
        if (*__error() == 2)
        {
          if (ramrod_create_directory_with_class( v232,  v59->fts_statp->st_mode,  v59->fts_statp->st_uid,  v59->fts_statp->st_gid,  -1,  0)) {
            error("ramrod_create_directory failed for %s\n");
          }
          else {
            debug("Successfully created directory %s\n");
          }
        }

        else
        {
          v68 = __error();
          strerror(*v68);
          debug("stat failed on %s: %s\n");
        }
      }

      else if ((v208.st_mode & 0xF000) == 0x4000)
      {
        int st_mode = v59->fts_statp->st_mode;
        if (v208.st_mode != st_mode)
        {
          debug("fixing permissions on %s: %o -> %o\n", (const char *)v232, v208.st_mode, st_mode);
          if (chmod((const char *)v232, v59->fts_statp->st_mode))
          {
            v62 = __error();
            v63 = strerror(*v62);
            error("unable to fix permissions: %s\n", v63);
          }
        }

        fts_statp = v59->fts_statp;
        uid_t st_uid = fts_statp->st_uid;
        gid_t st_gid = fts_statp->st_gid;
        if (*(void *)&v208.st_uid != __PAIR64__(st_gid, st_uid))
        {
          debug( "fixing ownership on %s: %d:%d -> %d:%d\n",  (const char *)v232,  v208.st_uid,  v208.st_gid,  st_uid,  st_gid);
          if (chown((const char *)v232, v59->fts_statp->st_uid, v59->fts_statp->st_gid))
          {
            v67 = __error();
            strerror(*v67);
            error("unable to fix ownership: %s\n");
          }
        }
      }

      else
      {
        debug("%s is a directory in the new image but not on the existing partition\n");
      }

      goto LABEL_105;
    }

    if (fts_info == 7) {
      break;
    }
LABEL_105:
    v59 = fts_read(v56);
    if (!v59) {
      goto LABEL_106;
    }
  }

  v108 = strerror(v59->fts_errno);
  error("fts_read error %d: %s\n", 7, v108);
  int fts_errno = v59->fts_errno;
  if (!fts_errno) {
    goto LABEL_106;
  }
LABEL_168:
  fts_close(v56);
  NSFileAttributeType v5 = v57;
LABEL_169:
  debug("Unmounting system volume from %s.\n", "/private/var/MobileSoftwareUpdate/mnt1");
  msuearlyboottask_unmount_filesystem();
  msuearlyboottask_dump_mounted_filesystem_info();

  size_t v8 = v37;
  if (!fts_errno)
  {
LABEL_77:
    debug("%s: Successfully completed fixup_var operations\n", "main");
    goto LABEL_128;
  }

LABEL_127:
  error("%s: Failed to fixup var(Not fatal)..\n", "main");
LABEL_128:
  v84 = &APFSOverProvModel_ptr;
  debug("%s: Checking for and creating overprovisioning file if needed\n", "main");
  int v85 = APFSOverProvModel();
  if (v85 != 1)
  {
    debug( "%s: APFS overprovisioning model is %d. Not reserving space for overprovisioning file \n",  "msu_reserve_space_for_overprovisioning",  v85);
LABEL_139:
    debug("%s: Succesfully handled checks for overprovisioning file/volume\n", "main");
    goto LABEL_175;
  }

  __int128 v202 = 0u;
  memset(&v203, 0, sizeof(v203));
  __int128 v201 = 0u;
  uint64_t v199 = 0LL;
  off_t v200 = 0LL;
  v237[0] = @"IOParentMatch";
  v235 = @"IOPropertyMatch";
  v233 = @"EmbeddedDeviceTypeRoot";
  v234 = &__kCFBooleanTrue;
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v234,  &v233,  1LL));
  v236 = v86;
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v236,  &v235,  1LL));
  v237[1] = @"IOPropertyMatch";
  v238[0] = v87;
  v238[1] = &off_1000087C0;
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v238,  v237,  2LL));

  if (!stat("/private/var/.overprovisioning_file", &v203))
  {
    debug("%s: Space already reserved for overprovisioning\n", "msu_reserve_space_for_overprovisioning");

    goto LABEL_139;
  }

  v89 = v88;
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v89);
  if (!MatchingService)
  {
    error("%s: Failed to get IOService for %s\n");
LABEL_142:

    goto LABEL_174;
  }

  io_registry_entry_t v91 = MatchingService;
  v92 = v11;
  v93 = v8;
  debug( "%s: Successfully obtained ioService for %s\n",  "msu_reserve_space_for_overprovisioning",  "EmbeddedDeviceTypeRoot");
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v91, @"BSD Name", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    double v11 = v92;
    v84 = &APFSOverProvModel_ptr;
    error("%s: no BSD device name for service %s");
    goto LABEL_142;
  }

  v95 = CFProperty;
  CFTypeID v96 = CFGetTypeID(CFProperty);
  if (v96 != CFStringGetTypeID())
  {
    error("%s: returnbed BSD device name for service %s is wrong type");
LABEL_145:
    int v97 = 5;
LABEL_172:
    CFRelease(v95);
    size_t v8 = v93;
    goto LABEL_173;
  }

  bzero(v232, 0x400uLL);
  if (!CFStringGetCString(v95, (char *)v232, 1023LL, 0x8000100u))
  {
    error("%s: failed to create C string from BSD name\n");
    goto LABEL_145;
  }

  bzero(&v208, 0x400uLL);
  snprintf((char *)&v208, 0x3FFuLL, "/dev/%s", (const char *)v232);
  debug( "%s: Full path to device node for service %s is :%s:\n",  "msu_reserve_space_for_overprovisioning",  "EmbeddedDeviceTypeRoot",  (const char *)&v208);
  bzero(v207, 0x400uLL);
  memset(&v204, 0, sizeof(v204));
  if (!stat((const char *)&v208, &v204))
  {
    if ((v204.st_mode & 0xF000) == 0x6000)
    {
      memset(buf, 0, sizeof(buf));
      devname_r(v204.st_rdev, 0x2000u, (char *)buf, 32);
      snprintf((char *)v207, 0x3FFuLL, "/dev/%s", (const char *)buf);
      goto LABEL_151;
    }

    error("%s: %s is not a block device\n", "msu_partition_raw_device_for_block_device", (const char *)&v208);
    int v97 = -1;
    goto LABEL_164;
  }

  int v97 = *__error();
  v98 = strerror(v97);
  error( "%s: unable to stat block device %s: %s\n",  "msu_partition_raw_device_for_block_device",  (const char *)&v208,  v98);
  if (v97)
  {
LABEL_164:
    error("%s: Failed to get raw device node for block device %s\n");
    goto LABEL_172;
  }

LABEL_151:
  int v100 = open((const char *)v207, 0);
  if (v100 == -1)
  {
    int v97 = *__error();
    v109 = __error();
    strerror(*v109);
    error("%s: Unable to open device: %s\n");
    goto LABEL_172;
  }

  int v101 = v100;
  int v198 = 0;
  uint64_t v197 = 0LL;
  if (ioctl(v100, 0x40046418uLL, &v198) == -1)
  {
    int v97 = *__error();
    v153 = __error();
    strerror(*v153);
    error("%s: unable to get DKIOCGETBLOCKSIZE: %s\n");
LABEL_248:
    int v106 = -1;
    goto LABEL_258;
  }

  if (ioctl(v101, 0x40086419uLL, &v197) == -1)
  {
    int v97 = *__error();
    v154 = __error();
    strerror(*v154);
    error("%s: unable to get DKIOCGETBLOCKCOUNT: %s \n");
    goto LABEL_248;
  }

  uint64_t v102 = v197 * v198;
  uint64_t v103 = v102 + 0x3FFFFFFF;
  if (v102 >= 0) {
    uint64_t v103 = v197 * v198;
  }
  debug("%s: device_size = %llu (%lld GB)\n", "msu_reserve_space_for_overprovisioning", v197 * v198, v103 >> 30);
  if (v102 <= 0x1900000063LL) {
    off_t v104 = v102 / 100;
  }
  else {
    off_t v104 = 0x40000000LL;
  }
  debug("%s: file_size = %llu (%lld GB)\n", "msu_reserve_space_for_overprovisioning", v104, v104 / 0x40000000);
  int v105 = open_dprotected_np("/private/var/.overprovisioning_file", 2562, 4, 0, 384LL);
  int v106 = v105;
  if (v105 == -1)
  {
    int v97 = *__error();
    v155 = __error();
    strerror(*v155);
    error("%s: Could not open %s with error %s\n");
    goto LABEL_257;
  }

  __int128 v201 = 0x30000000EuLL;
  *(void *)&__int128 v202 = v104;
  if (fcntl(v105, 42, &v201) != -1) {
    goto LABEL_161;
  }
  if (*__error() != 28)
  {
    if (!*__error()) {
      goto LABEL_161;
    }
    v158 = __error();
    v159 = strerror(*v158);
    error( "%s: fcntl(2) failed trying to allocate contiguous space all at once with error: %s",  "msu_reserve_space_for_overprovisioning",  v159);
    goto LABEL_265;
  }

  LODWORD(v201) = 10;
  if (fcntl(v106, 42, &v201) != -1) {
    goto LABEL_161;
  }
  if (*__error() == 28)
  {
    LODWORD(v201) = 8;
    if (fcntl(v106, 42, &v201) == -1)
    {
      int v97 = *__error();
      v156 = __error();
      strerror(*v156);
      error("%s: preallocation of %llu bytes failed with error: (%s). (Allocated %llu bytes)\n");
      goto LABEL_257;
    }

LABEL_161:
    if (ftruncate(v106, v104))
    {
      int v97 = *__error();
      v107 = __error();
      strerror(*v107);
      error("%s: failed to write to %s file to establish the size (%s).\n");
      goto LABEL_257;
    }

    if (fcntl(v106, 51, 0LL))
    {
      int v97 = *__error();
      v157 = __error();
      strerror(*v157);
      error("%s: failed to fullsync %s file with %s.\n");
      goto LABEL_257;
    }

    uint64_t v199 = 0LL;
    off_t v200 = v104;
    if (fcntl(v106, 100, &v199) == -1)
    {
      int v97 = *__error();
      v160 = __error();
      v161 = strerror(*v160);
      error("%s: F_TRIM_ACTIVE_FILE failed with: %s \n", "msu_reserve_space_for_overprovisioning", v161);
      close(v106);
      if (unlink("/private/var/.overprovisioning_file"))
      {
        v162 = __error();
        v163 = strerror(*v162);
        error( "%s: failed to unlink %s: %s \n",  "msu_reserve_space_for_overprovisioning",  "/private/var/.overprovisioning_file",  v163);
        int v97 = *__error();
      }

      int v106 = -1;
    }

    else
    {
LABEL_265:
      int v97 = 0;
    }
  }

  else
  {
    if (!*__error()) {
      goto LABEL_161;
    }
    int v97 = *__error();
    v164 = __error();
    strerror(*v164);
    error("%s: fcntl(2) failed trying to allocate contiguous space with error: %s");
  }

LABEL_257:
  NSFileAttributeType v5 = v181;
LABEL_258:
  CFRelease(v95);
  if ((v101 & 0x80000000) == 0) {
    close(v101);
  }
  size_t v8 = v93;
  if ((v106 & 0x80000000) == 0) {
    close(v106);
  }
LABEL_173:
  double v11 = v92;

  v84 = &APFSOverProvModel_ptr;
  if (!v97) {
    goto LABEL_139;
  }
LABEL_174:
  error("%s: Unable to reserve space for overprovisioning. Continuing anyways\n", "main");
LABEL_175:
  debug("%s: Checking if clearing out of FIPS data file is needed\n", "main");
  id v110 = [objc_alloc((Class)v84[22]) initWithFormat:@"%@/ClearFIPSDataFile.txt", v8];
  if ([v5 fileExistsAtPath:v110])
  {
    id v111 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", @"%s/db/FIPS/fips_data", "/private/var");
    if (![v5 fileExistsAtPath:v111])
    {
      debug("%s: Nothing to do since no FIPS data file present at %s/db/FIPS/fips_data\n", "main", "/private/var");
      v113 = v183;
      goto LABEL_184;
    }

    debug("%s: Clearing out FIPS data file\n", "main");

    id v187 = 0LL;
    [v5 removeItemAtPath:v111 error:&v187];
    id v112 = v187;
    if (v112)
    {
      memset(v232, 0, 512);
      v113 = v112;
      v114 = (void *)objc_claimAutoreleasedReturnValue([v112 description]);
      [v114 getCString:v232 maxLength:511 encoding:4];

      if (LOBYTE(v232[0])) {
        v115 = (const char *)v232;
      }
      else {
        v115 = "Unable to parse error reason";
      }
      v84 = &APFSOverProvModel_ptr;
      error("%s: Failed to clear fips data file: %s\n", "main", v115);
LABEL_184:
    }

    id v186 = 0LL;
    [v5 removeItemAtPath:v110 error:&v186];
    id v116 = v186;
    if (v116)
    {
      memset(v232, 0, 512);
      v183 = v116;
      v117 = (void *)objc_claimAutoreleasedReturnValue([v116 description]);
      [v117 getCString:v232 maxLength:511 encoding:4];

      if (LOBYTE(v232[0])) {
        v118 = (const char *)v232;
      }
      else {
        v118 = "Unable to parse error reason";
      }
      v84 = &APFSOverProvModel_ptr;
      error("%s: Failed to clear fips data cookie: %s\n", "main", v118);
    }

    else
    {
      v183 = 0LL;
    }
  }

  else
  {
    debug("%s: Clearing of FIPS data file not required.\n", "main");
    id v111 = 0LL;
  }

  id v119 = [objc_alloc((Class)v84[22]) initWithFormat:@"%@/MobileAsset/PreinstalledAssetsV2", v8];
  id v167 = objc_msgSend( objc_alloc((Class)v84[22]),  "initWithFormat:",  @"%s",  "/private/var/MobileAsset/PreinstalledAssetsV2");
  v168 = v119;
  if ((moveFolderContentsIfItExists(v119, v167) & 1) != 0) {
    debug("Done moving of preinstalled MobileAssets to data volume\n");
  }
  else {
    error("Failed to move preinstalled MobileAssets to data volume\n");
  }
  id v120 = [objc_alloc((Class)v84[22]) initWithFormat:@"%@/wireless/Library/Logs", v8];
  id v165 = objc_msgSend(objc_alloc((Class)v84[22]), "initWithFormat:", @"%s", "/private/var/wireless/Library");
  v166 = v120;
  if ((moveFolderContentsIfItExists(v120, v165) & 1) != 0) {
    debug("Done moving of Wireless/Library folder to data volume\n");
  }
  else {
    error("Failed to move Wireless/Library folder to data volume\n");
  }
  debug("Creating cookie file for earlyBootTaskHasCompletedOnce\n");
  v170 = v110;
  v172 = v111;
  v121 = v11;
  else {
    error("Failed to create earlyBootTaskHasCompletedOnceCookie\n");
  }
  v122 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/staged_system_apps",  v8);
  unsigned int v123 = [v5 fileExistsAtPath:v122];
  v124 = v122;
  v125 = -[NSString UTF8String](v124, "UTF8String");
  if (v125) {
    v126 = v125;
  }
  else {
    v126 = "(update volume MSUData staged_system_apps directory)";
  }
  v127 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s",  "/private/var/staged_system_apps");
  unsigned int v128 = [v5 fileExistsAtPath:v127];
  v129 = v127;
  v130 = -[NSString UTF8String](v129, "UTF8String");
  v131 = (char *)v130;
  if (v130) {
    v132 = v130;
  }
  else {
    v132 = "(data volume staged_system_apps directory)";
  }
  v133 = "does not exist";
  if (v128) {
    v134 = "exists";
  }
  else {
    v134 = "does not exist";
  }
  v135 = "Creating the latter.";
  if (v128) {
    v135 = "Clearing the latter.";
  }
  if (v123) {
    v133 = "exists";
  }
  v136 = "Skipping.";
  if (v123) {
    v136 = v135;
  }
  debug("%s: Datamigrator is supported on target. %s %s, and %s %s. %s\n", "main", v126, v133, v132, v134, v136);
  if (v123)
  {
    v137 = v121;
    if (v128)
    {

      id v185 = 0LL;
      [v181 removeItemAtPath:v129 error:&v185];
      id v138 = v185;
      v139 = &APFSOverProvModel_ptr;
      if (v138)
      {
        memset(v232, 0, 512);
        v183 = v138;
        v140 = (void *)objc_claimAutoreleasedReturnValue([v138 description]);
        [v140 getCString:v232 maxLength:511 encoding:4];

        if (LOBYTE(v232[0])) {
          v141 = (const char *)v232;
        }
        else {
          v141 = "Unable to parse error reason";
        }
        error("%s: Failed to remove %s on the data volume: %s. Skipping.\n", "main", v132, v141);
      }

      else
      {
        v183 = 0LL;
      }
    }

    else
    {
      v139 = &APFSOverProvModel_ptr;
    }

    v232[0] = (unint64_t)-[NSString fileSystemRepresentation]( v124, "fileSystemRepresentation");
    v142 = fts_open((char *const *)v232, 84, 0LL);
    if (v142)
    {
      v143 = v142;
      debug("Setting up ACL's for the staged_system_apps on update volume\n");
      v144 = fts_read(v143);
      if (v144)
      {
        v145 = v144;
        while (2)
        {
          v146 = objc_autoreleasePoolPush();
          switch(v145->fts_info)
          {
            case 1u:
            case 8u:
              v147 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v145->fts_path));
              MSUEarlyBootTaskSetupACLForPath(v147);

              goto LABEL_231;
            case 6u:
              goto LABEL_231;
            case 7u:
              v148 = strerror(v145->fts_errno);
              error("fts_read error %d: %s\n", 7, v148);
              error("Failed to setup ACL for staged system apps\n");
              objc_autoreleasePoolPop(v146);
              break;
            default:
              error("fts_read found unsupported file type: %d\n", v145->fts_info);
LABEL_231:
              objc_autoreleasePoolPop(v146);
              v145 = fts_read(v143);
              if (!v145) {
                break;
              }
              continue;
          }

          break;
        }
      }

      fts_close(v143);
      size_t v8 = v182;
      v139 = &APFSOverProvModel_ptr;
    }

    debug("Done setting up ACL's for staged_system_apps\n");
    if (v131)
    {
      NSFileAttributeType v5 = v181;
      if (ramrod_create_directory_with_class(v131, 509, 0x1F5u, 0x1F5u, 4, 1))
      {
        error("%s: Failed to create %s - ramrod_create_directory_with_class error %lld. Skipping\n");
      }

      else
      {
        debug("MSUEarlyBootTask: Created staged_system_apps folder. Updating permissions\n");
        v149 = (void *)objc_claimAutoreleasedReturnValue([v139[22] stringWithUTF8String:v131]);
        char v150 = MSUEarlyBootTaskSetupACLForPath(v149);

        if ((v150 & 1) != 0) {
          debug("Successfully setup ACL for staged_system_apps folder\n");
        }
        else {
          error("Failed to setup ACL for staged_system_apps folder\n");
        }
      }
    }

    else
    {
      error( "%s: Failed to create %s - path was NULL. Skipping.\n",  "main",  "(data volume staged_system_apps directory)");
      NSFileAttributeType v5 = v181;
    }
  }

  else
  {
    NSFileAttributeType v5 = v181;
    v137 = v121;
  }

  time_t v184 = 0LL;
  time(&v184);
  v151 = ctime(&v184);
  debug("Operations completed at %s\n", v151);
  flush_log();
  free(v180);

LABEL_243:
LABEL_244:

  return 0;
}

uint64_t execForMSUEarlyBootTask(const char **a1)
{
  pid_t v24 = 0;
  *(void *)id v26 = -1LL;
  if (pipe(v26))
  {
    v2 = *a1;
    int v3 = __error();
    id v4 = strerror(*v3);
    error("%s: pipe failed while preparing to execute %s: %s\n", "execForMSUEarlyBootTask", v2, v4);
    return 0xFFFFFFFFLL;
  }

  posix_spawn_file_actions_t v23 = 0LL;
  posix_spawn_file_actions_init(&v23);
  posix_spawn_file_actions_adddup2(&v23, v26[1], 1);
  posix_spawn_file_actions_addclose(&v23, v26[0]);
  uint64_t v6 = posix_spawn(&v24, *a1, &v23, 0LL, (char *const *)a1, 0LL);
  if ((_DWORD)v6)
  {
    uint64_t v5 = v6;
    unsigned int v7 = *a1;
    size_t v8 = strerror(v6);
    error("%s: posix_spawn %s failed: %s\n", "execForMSUEarlyBootTask", v7, v8);
    close(v26[0]);
    goto LABEL_5;
  }

  bzero(v25, 0x400uLL);
  int v10 = v26[0];
  close(v26[1]);
  v26[1] = -1;
  ssize_t v11 = read(v10, v25, 0x400uLL);
  if (v11 >= 1)
  {
    do
    {
      execlogfunction(v11, v12, v13, v14, v15, v16, v17, v18, v11);
      ssize_t v11 = read(v10, v25, 0x400uLL);
    }

    while (v11 > 0);
  }

  int v22 = 0;
  if (waitpid(v24, &v22, 0) == -1)
  {
    uint64_t v5 = *__error();
    __int128 v19 = *a1;
    __int128 v20 = __error();
    __int128 v21 = strerror(*v20);
    error("%s: waitpid failed for %s: %s\n", "execForMSUEarlyBootTask", v19, v21);
  }

  else
  {
    if ((v22 & 0x7F) == 0x7F)
    {
      printf("%s: %s was stopped by signal %d\n", "execForMSUEarlyBootTask", *a1, v22 >> 8);
    }

    else
    {
      if ((v22 & 0x7F) == 0)
      {
        uint64_t v5 = BYTE1(v22);
        goto LABEL_5;
      }

      error("%s: %s was terminated by signal %d\n", "execForMSUEarlyBootTask", *a1, v22 & 0x7F);
    }

    uint64_t v5 = 0xFFFFFFFFLL;
  }

LABEL_5:
  posix_spawn_file_actions_destroy(&v23);
  if (v26[1] != -1) {
    close(v26[1]);
  }
  return v5;
}

uint64_t ramrod_create_directory_with_class(_BYTE *a1, int a2, uid_t a3, gid_t a4, int a5, int a6)
{
  if (!a1 || *a1 != 47) {
    return 22LL;
  }
  bzero(&v26, 0x400uLL);
  uint64_t v12 = v27;
  __strlcpy_chk(&v26, a1, 1024LL, 1024LL);
  while (1)
  {
    uint64_t v13 = strchr(v12, 47);
    uint64_t v14 = v13;
    if (v13) {
      *uint64_t v13 = 0;
    }
    memset(&v25, 0, sizeof(v25));
    if (lstat(&v26, &v25))
    {
      if (*__error() != 2)
      {
        uint64_t v15 = *__error();
        uint64_t v16 = __error();
        strerror(*v16);
        error("lstat %s failed: %s\n");
        return v15;
      }

      if (a6) {
        error("creating directory (owner=%d group=%d mode=%o, class=%d) %s\n", a3, a4, a2, a5, &v26);
      }
      if (mkdir(&v26, a2 & 0x1FF))
      {
        uint64_t v15 = *__error();
        uint64_t v17 = __error();
        strerror(*v17);
        error("mkdir failed: %s\n");
        return v15;
      }

      if (chmod(&v26, a2))
      {
        uint64_t v15 = *__error();
        uint64_t v18 = __error();
        strerror(*v18);
        error("chmod failed: %s\n");
        return v15;
      }

      if (chown(&v26, a3, a4))
      {
        uint64_t v15 = *__error();
        __int128 v19 = __error();
        strerror(*v19);
        error("chown failed: %s\n");
        return v15;
      }

      if ((a5 & 0x80000000) == 0)
      {
        uint64_t v24 = 0LL;
        __int128 v23 = xmmword_100007C34;
        int v22 = a5;
        if (setattrlist(&v26, &v23, &v22, 4uLL, 0)) {
          break;
        }
      }
    }

    if (!v14) {
      return 0LL;
    }
    char *v14 = 47;
    uint64_t v12 = v14 + 1;
  }

  uint64_t v15 = *__error();
  __int128 v20 = __error();
  strerror(*v20);
  error("setattrlist failed: %s\n");
  return v15;
}

void execlogfunction( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  @"%.*s",  &a9);
  bzero(v10, 0x400uLL);
  -[NSString getCString:maxLength:encoding:](v9, "getCString:maxLength:encoding:", v10, 1023LL, 134217984LL);
  debug("MSUEarlyBootTaskExecLog: %s\n", v10);
}

uint64_t msuearlyboottask_mount_filesystem(const char *a1, const char *a2, int a3)
{
  if (!a1)
  {
    error("%s: Invalid arguments passed\n", "msuearlyboottask_mount_filesystem");
    return 0xFFFFFFFFLL;
  }

  debug( "%s: Attempting to mount %s at %s\n",  "msuearlyboottask_mount_filesystem",  a1,  "/private/var/MobileSoftwareUpdate/mnt1");
  uint64_t v13 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v10 = 0u;
  v9[0] = "/sbin/mount_apfs";
  v9[1] = "-o";
  v9[2] = "nobrowse";
  if (a3)
  {
    debug("%s: Mounting read-only\n", "msuearlyboottask_mount_filesystem");
    *(void *)&__int128 v10 = "-o";
    *((void *)&v10 + 1) = "rdonly";
    int v6 = 5;
    if (!a2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  int v6 = 3;
  if (a2)
  {
LABEL_7:
    debug("%s: Mounting snapshot %s\n", "msuearlyboottask_mount_filesystem", a2);
    int v8 = v6 + 1;
    v9[v6] = "-s";
    v6 += 2;
    v9[v8] = a2;
  }

LABEL_8:
  v9[v6] = a1;
  v9[v6 + 1] = "/private/var/MobileSoftwareUpdate/mnt1";
  v9[v6 + 2] = 0LL;
  return execForMSUEarlyBootTask(v9);
}

void msuearlyboottask_unmount_filesystem()
{
  int v0 = -3;
  do
  {
    if (!unmount("/private/var/MobileSoftwareUpdate/mnt1", 0x80000)) {
      break;
    }
    int v1 = *__error();
    BOOL v2 = v1 == 35 || v1 == 16;
    BOOL v3 = v2;
    if (v1 == 22)
    {
      debug( "MSUEarlyBootTask: Tried to unmount a volume at '%s' that wasn't mounted. Ignoring the error.\n",  "/private/var/MobileSoftwareUpdate/mnt1");
    }

    else
    {
      id v4 = __error();
      uint64_t v5 = strerror(*v4);
      error("MSUEarlyBootTask: error unmounting '%s': %s\n", "/private/var/MobileSoftwareUpdate/mnt1", v5);
      if (v1 == 35 || v1 == 16)
      {
        int v6 = strerror(v1);
        error( "Unmounting %s failed with %d: %s. Will retry in %d seconds",  "/private/var/MobileSoftwareUpdate/mnt1",  v1,  v6,  3);
        sleep(3u);
      }
    }
  }

  while (v0++ && v3);
}

void msuearlyboottask_dump_mounted_filesystem_info()
{
  BOOL v2 = 0LL;
  int v0 = getmntinfo(&v2, 2);
  debug("%s: %d filesystems are mounted\n", "msuearlyboottask_dump_mounted_filesystem_info", v0);
  if (v2)
  {
    if (v0 >= 1)
    {
      unint64_t v1 = v0 + 1LL;
      do
      {
        debug("%s is mounted at %s\n", v2[(v1 - 2)].f_mntfromname, v2[(v1 - 2)].f_mntonname);
        --v1;
      }

      while (v1 > 1);
    }
  }

  else
  {
    debug("Failed to get info regarding mounted filesystems\n");
  }

  debug("%s: *********DONE DUMPING MOUNTED FILESYSTEMS********\n", "msuearlyboottask_dump_mounted_filesystem_info");
}

acl_t MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(int a1)
{
  acl_t acl_p = acl_init(1);
  if (!acl_p)
  {
    id v4 = __error();
    uint64_t v5 = strerror(*v4);
    error("MSUEarlyBootTask: acl_init() failed: %s", v5);
    return 0LL;
  }

  if (a1) {
    acl_perm_t v2 = ACL_CHANGE_OWNER|ACL_WRITE_SECURITY|ACL_READ_SECURITY|ACL_WRITE_EXTATTRIBUTES|ACL_READ_EXTATTRIBUTES|ACL_WRITE_ATTRIBUTES|ACL_READ_ATTRIBUTES|ACL_DELETE_CHILD|ACL_ADD_SUBDIRECTORY|ACL_DELETE|ACL_SEARCH|ACL_ADD_FILE|ACL_LIST_DIRECTORY;
  }
  else {
    acl_perm_t v2 = ACL_CHANGE_OWNER|ACL_WRITE_SECURITY|ACL_READ_SECURITY|ACL_WRITE_EXTATTRIBUTES|ACL_READ_EXTATTRIBUTES|ACL_WRITE_ATTRIBUTES|ACL_READ_ATTRIBUTES|ACL_ADD_SUBDIRECTORY|ACL_DELETE|ACL_SEARCH|ACL_ADD_FILE|ACL_LIST_DIRECTORY;
  }
  acl_entry_t entry_p = 0LL;
  if (a1) {
    acl_flag_t v3 = ACL_ENTRY_DIRECTORY_INHERIT|ACL_ENTRY_FILE_INHERIT;
  }
  else {
    acl_flag_t v3 = ACL_ENTRY_INHERITED;
  }
  acl_flagset_t flagset_p = 0LL;
  acl_permset_t permset_p = 0LL;
  if (acl_create_entry(&acl_p, &entry_p))
  {
    error("MSUEarlyBootTask: Unable to create acl entry(%d)\n");
  }

  else
  {
    int v6 = (unsigned __int8 *)calloc(1uLL, 0x10uLL);
    if (v6)
    {
      unsigned int v7 = v6;
      int v8 = mbr_identifier_to_uuid(5, "systemusers", 0xBuLL, v6);
      if (v8)
      {
        strerror(v8);
        error("MSUEarlyBootTask: Failed to convert mbr identifier to uuid : %d (%s)\n");
      }

      else
      {
        int permset = acl_get_permset(entry_p, &permset_p);
        if (permset)
        {
          strerror(permset);
          error("acl_get_permset() failed: %d: %s\n");
        }

        else
        {
          int v10 = acl_add_perm(permset_p, v2);
          if (v10)
          {
            strerror(v10);
            error("acl_add_perm() failed to set perms %x: %d: %s\n");
          }

          else if (acl_set_permset(entry_p, permset_p))
          {
            strerror(0);
            error("acl_set_permset() failed: %d: %s");
          }

          else
          {
            int flagset_np = acl_get_flagset_np(entry_p, &flagset_p);
            if (flagset_np)
            {
              strerror(flagset_np);
              error("MSUEarlyBootTask: acl_get_flagset_np() failed: %d: %s");
            }

            else
            {
              int v12 = acl_add_flag_np(flagset_p, v3);
              if (v12)
              {
                strerror(v12);
                error("MSUEarlyBootTask: acl_add_flag_np() failed to set flags %x: %d %s\n");
              }

              else
              {
                int v13 = acl_set_flagset_np(entry_p, flagset_p);
                if (v13)
                {
                  strerror(v13);
                  error("acl_set_flagset_np() failed: %d: %s\n");
                }

                else
                {
                  int v14 = acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW);
                  if (v14)
                  {
                    strerror(v14);
                    error("acl_set_tag_type() failed: %d: %s");
                  }

                  else
                  {
                    int v15 = acl_set_qualifier(entry_p, v7);
                    if (!v15)
                    {
                      free(v7);
                      return acl_p;
                    }

                    strerror(v15);
                    error("acl_set_qualifier() failed: %d: %s");
                  }
                }
              }
            }
          }
        }
      }

      free(v7);
    }

    else
    {
      error("MSUEarlyBootTask: Unable to allocate nameUUID\n");
    }
  }

  error("MSUEarlyBootTask: Failed in call to MSUEarlyBootTaskCreateSystemUserACEInACL\n");
  acl_t result = acl_p;
  if (acl_p)
  {
    acl_free(acl_p);
    return 0LL;
  }

  return result;
}

uint64_t _partition_log( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_loggingPtr) {
    return _loggingPtr(result, &a9);
  }
  return result;
}

char *copy_root_snapshot_name_from_dt()
{
  char v26 = 0LL;
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
        char v26 = strndup(__s1a, Length);
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

void main_cold_1()
{
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}