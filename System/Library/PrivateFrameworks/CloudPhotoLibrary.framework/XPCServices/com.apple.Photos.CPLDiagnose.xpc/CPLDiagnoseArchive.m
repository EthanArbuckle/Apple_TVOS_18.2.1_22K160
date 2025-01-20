@interface CPLDiagnoseArchive
- (CPLDiagnoseArchive)initWithPath:(id)a3 shouldCompress:(BOOL)a4;
- (int)addDirectoryToArchive:(id)a3 withDirName:(id)a4;
- (int)addFileToArchive:(id)a3 withFileName:(id)a4;
- (void)closeArchive;
@end

@implementation CPLDiagnoseArchive

- (CPLDiagnoseArchive)initWithPath:(id)a3 shouldCompress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLDiagnoseArchive;
  v7 = -[CPLDiagnoseArchive init](&v12, "init");
  if (v7)
  {
    v7->_archive = (archive *)archive_write_new();
    v7->_archiveFd = -1;
    if (v4) {
      archive_write_add_filter_gzip();
    }
    else {
      archive_write_add_filter_none();
    }
    archive_write_set_format_pax(v7->_archive);
    id v8 = v6;
    uint64_t v9 = open_dprotected_np((const char *)[v8 UTF8String], 514, 3, 0, 416);
    if ((v9 & 0x80000000) != 0) {
      uint64_t v9 = open_dprotected_np((const char *)[v8 UTF8String], 514, 2, 0, 416);
    }
    uint64_t v10 = archive_write_open_fd(v7->_archive, v9);
    if ((_DWORD)v10)
    {
      NSLog(@"Error creating archive at path %@ %d", v8, v10);

      v7 = 0LL;
    }

    else
    {
      v7->_archiveFd = v9;
    }
  }

  return v7;
}

- (int)addFileToArchive:(id)a3 withFileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 UTF8String];
  if (!v9)
  {
    NSLog(@"No filename!");
LABEL_7:
    LODWORD(v15) = -1;
    goto LABEL_8;
  }

  uint64_t v10 = v9;
  uint64_t v11 = stat(v9, &v26);
  uint64_t v12 = archive_entry_new(v11);
  if (!v12)
  {
    NSLog(@"archive_entry_new() failed!");
    goto LABEL_7;
  }

  uint64_t v13 = v12;
  archive_entry_copy_stat(v12, &v26);
  id v14 = v7;
  archive_entry_set_pathname(v13, [v14 UTF8String]);
  if (archive_write_header(self->_archive, v13))
  {
    ssize_t v15 = archive_errno(self->_archive);
    id v16 = [v14 UTF8String];
    uint64_t v17 = archive_error_string(self->_archive);
    NSLog(@"failed to write header for file, %s, status, %d, reason: %s", v16, v15, v17);
    archive_entry_free(v13);
    goto LABEL_8;
  }

  int v19 = open(v10, 0);
  if (v19 == -1)
  {
    v23 = __error();
    v24 = strerror(*v23);
    v25 = __error();
    NSLog(@"Error opening file %@:%s (%d)", v8, v24, *v25);
    archive_entry_free(v13);
    goto LABEL_7;
  }

  int v20 = v19;
  ssize_t v21 = read(v19, v27, 0x2000uLL);
  if (v21 < 1)
  {
LABEL_14:
    LODWORD(v15) = 0;
  }

  else
  {
    ssize_t v15 = v21;
    while (1)
    {
      uint64_t v22 = archive_write_data(self->_archive, v27, v15);
      if (v22 != v15) {
        break;
      }
      ssize_t v15 = read(v20, v27, 0x2000uLL);
      if (v15 <= 0) {
        goto LABEL_14;
      }
    }

    NSLog(@"Error writing file %@: request to write %ld bytes but wrote %ld bytes", v8, v15, v22);
    LODWORD(v15) = archive_errno(self->_archive);
  }

  archive_entry_free(v13);
  close(v20);
LABEL_8:

  return v15;
}

- (int)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v5 = a3;
  id v26 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentsOfDirectoryAtPath:v5 error:0]);

  if ([v7 count])
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      v24 = v7;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v14 = objc_autoreleasePoolPush();
          char v27 = 0;
          ssize_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v13]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v17 = [v16 fileExistsAtPath:v15 isDirectory:&v27];

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
            int v19 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByAppendingPathComponent:v18]);

            unsigned int v20 = v27
                ? -[CPLDiagnoseArchive addDirectoryToArchive:withDirName:]( self,  "addDirectoryToArchive:withDirName:",  v15,  v19)
                : -[CPLDiagnoseArchive addFileToArchive:withFileName:](self, "addFileToArchive:withFileName:", v15, v19);
            unsigned int v21 = v20;

            if (v21 == -30)
            {

              objc_autoreleasePoolPop(v14);
              int v22 = -30;
              goto LABEL_17;
            }
          }

          objc_autoreleasePoolPop(v14);
        }

        id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      int v22 = 0;
LABEL_17:
      id v7 = v24;
    }

    else
    {
      int v22 = 0;
    }
  }

  else
  {
    int v22 = 0;
  }

  return v22;
}

- (void)closeArchive
{
  int archiveFd = self->_archiveFd;
  if ((archiveFd & 0x80000000) == 0) {
    close(archiveFd);
  }
}

@end