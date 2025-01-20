@interface MSDFileArchiver
- (BOOL)compressContent:(id)a3 toPath:(id)a4;
@end

@implementation MSDFileArchiver

- (BOOL)compressContent:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  id v8 = v5;
  v9 = (char *)[v8 fileSystemRepresentation];
  id v10 = v6;
  id v11 = [v10 fileSystemRepresentation];
  if (v7)
  {
    if (v9)
    {
      id v12 = v11;
      if (v11)
      {
        v13 = (void *)archive_write_new();
        archive_write_set_format_zip();
        if (archive_write_open_filename(v13, v12))
        {
          free(v13);
          id v40 = sub_100021D84();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_100029654();
          }

          BOOL v18 = 0;
          goto LABEL_36;
        }

        uint64_t disk_new = archive_read_disk_new();
        archive_read_disk_set_standard_lookup();
        v51[0] = v9;
        v51[1] = 0LL;
        v14 = fts_open(v51, 84, 0LL);
        if (v14)
        {
          id v47 = v10;
          id v15 = objc_claimAutoreleasedReturnValue([v7 stringByDeletingLastPathComponent]);
          int v16 = strlen((const char *)[v15 fileSystemRepresentation]);

          v17 = fts_read(v14);
          BOOL v18 = 1;
          if (v17)
          {
            v19 = v17;
            id v46 = v8;
            uint64_t v20 = v16 + 1;
            while (1)
            {
              unsigned int fts_info = v19->fts_info;
              if (fts_info > 0xE) {
                goto LABEL_13;
              }
              int v22 = 1 << fts_info;
              if ((v22 & 0x4266) == 0) {
                break;
              }
LABEL_10:
              v19 = fts_read(v14);
              if (!v19)
              {
                BOOL v18 = 1;
                id v8 = v46;
                id v10 = v47;
                uint64_t v31 = disk_new;
                goto LABEL_29;
              }
            }

            if ((v22 & 0x490) != 0)
            {
              id v32 = sub_100021D84();
              v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                sub_100029624();
              }
              uint64_t v26 = 0LL;
LABEL_26:
              id v8 = v46;
              id v10 = v47;
              uint64_t v31 = disk_new;
              goto LABEL_27;
            }

@end