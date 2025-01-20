@interface MSDHSnapshottedDataSaver
- (BOOL)adjustContentUnder:(id)a3 userHomePath:(id)a4;
- (BOOL)canDeviceHaveEnoughSpaceForItemDomainWithSize:(int64_t)a3;
- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3;
- (id)generateItemDomainsToBeSheltered;
- (id)originalPathFor:(id)a3;
- (int64_t)getFileSizeForItemAtPath:(id)a3;
- (void)moveBluetoothFilesToDataShelter;
- (void)movePreservedFilesToDataShelter:(id)a3 removeFilesOnSuccess:(BOOL)a4;
- (void)moveSecondPartyAppFilesToDataShelter;
- (void)rescueDataBasedOnItemDomains:(id)a3;
- (void)rescueDataToShelterFromSnapshottedVolumes;
@end

@implementation MSDHSnapshottedDataSaver

- (void)rescueDataToShelterFromSnapshottedVolumes
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSDHSnapshottedDataSaver generateItemDomainsToBeSheltered](self, "generateItemDomainsToBeSheltered"));
  -[MSDHSnapshottedDataSaver rescueDataBasedOnItemDomains:](self, "rescueDataBasedOnItemDomains:", v3);
}

- (void)rescueDataBasedOnItemDomains:(id)a3
{
  id v54 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = sub_100021D84();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v86 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Rescuing needed files to data shelter at %{public}@",  buf,  0xCu);
  }

  if ([v4 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"])
  {
    id v83 = 0LL;
    unsigned __int8 v7 = [v4 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" error:&v83];
    id v8 = v83;
    id v9 = v8;
    if ((v7 & 1) == 0)
    {
      id v53 = sub_100021D84();
      obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        sub_100026BC8(v9, obj);
      }
      goto LABEL_73;
    }

    id v10 = v8;
  }

  else
  {
    id v10 = 0LL;
  }

  -[MSDHSnapshottedDataSaver moveBluetoothFilesToDataShelter](self, "moveBluetoothFilesToDataShelter");
  -[MSDHSnapshottedDataSaver moveSecondPartyAppFilesToDataShelter](self, "moveSecondPartyAppFilesToDataShelter");
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  obj = (os_log_s *)v54;
  id v58 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v79,  v93,  16LL);
  if (v58)
  {
    uint64_t v57 = *(void *)v80;
    v55 = self;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v80 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v11;
        v12 = *(void **)(*((void *)&v79 + 1) + 8 * v11);
        context = objc_autoreleasePoolPush();
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        id v62 = v12;
        id v13 = [v62 countByEnumeratingWithState:&v75 objects:v92 count:16];
        if (v13)
        {
          id v14 = v13;
          v15 = 0LL;
          uint64_t v16 = *(void *)v76;
          while (2)
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v76 != v16) {
                objc_enumerationMutation(v62);
              }
              v18 = *(const __CFString **)(*((void *)&v75 + 1) + 8LL * (void)i);
              if ([v4 fileExistsAtPath:v18])
              {
                int64_t v19 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:](self, "getFileSizeForItemAtPath:", v18);
                if (v19 < 0)
                {
                  id v35 = sub_100021D84();
                  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v86 = v18;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Failed to get file size for item: %{public}@",  buf,  0xCu);
                  }

                  goto LABEL_54;
                }

                v15 = (const __CFString *)((char *)v15 + v19);
              }
            }

            id v14 = [v62 countByEnumeratingWithState:&v75 objects:v92 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        else
        {
          v15 = 0LL;
        }

        id v20 = sub_100021D84();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v86 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Total free disk space needed for current item domain: %{public, iec-bytes}llu",  buf,  0xCu);
        }

        if (-[MSDHSnapshottedDataSaver canDeviceHaveEnoughSpaceForItemDomainWithSize:]( self,  "canDeviceHaveEnoughSpaceForItemDomainWithSize:",  v15))
        {
          __int128 v72 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          __int128 v69 = 0u;
          id v62 = v62;
          id v22 = [v62 countByEnumeratingWithState:&v69 objects:v91 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v70;
            v25 = v10;
            while (2)
            {
              for (j = 0LL; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v70 != v24) {
                  objc_enumerationMutation(v62);
                }
                v27 = *(const __CFString **)(*((void *)&v69 + 1) + 8LL * (void)j);
                v28 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:v27]);
                v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 stringByDeletingLastPathComponent]);
                unsigned __int8 v30 = [v4 fileExistsAtPath:v27];
                id v31 = sub_100021D84();
                v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
                if ((v30 & 1) != 0)
                {
                  if (v33)
                  {
                    *(_DWORD *)buf = 138543362;
                    v86 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  ">>> Copying item from: '%{public}@'",  buf,  0xCu);
                  }

                  id v68 = v25;
                  unsigned __int8 v34 = [v4 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v68];
                  id v10 = v68;

                  if ((v34 & 1) == 0)
                  {
                    id v37 = sub_100021D84();
                    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      v39 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
                      *(_DWORD *)buf = 138543618;
                      v86 = v29;
                      __int16 v87 = 2114;
                      v88 = v39;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Failed to create parent folder %{public}@ with error - %{public}@",  buf,  0x16u);
                    }

                    goto LABEL_52;
                  }

                  if (([v4 cloneFile:v27 to:v28 expectingHash:0 correctOwnership:0] & 1) == 0)
                  {
                    id v40 = sub_100021D84();
                    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      v47 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
                      *(_DWORD *)buf = 138543874;
                      v86 = v27;
                      __int16 v87 = 2114;
                      v88 = v28;
                      __int16 v89 = 2114;
                      v90 = v47;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Failed to copy item from %{public}@ to %{public}@ with error - %{public}@",  buf,  0x20u);
                    }

- (id)generateItemDomainsToBeSheltered
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v5 = v4;
  if (v4 && [v4 count]) {
    [v3 addObject:v5];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  @"/private/var/mobile/Library/AggregateDictionary"));
  [v3 addObject:v6];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( [v2 contentsOfDirectoryAtPath:@"/private/var/mobile/Library/Logs/CrashReporter" error:0]);
  id v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v24 = v5;
    v25 = v2;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self BEGINSWITH 'log-aggregated-'"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self CONTAINS 'Analytics-'"));
    id v23 = (void *)v9;
    v31[0] = v9;
    v31[1] = v22;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredArrayUsingPredicate:v11]);

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:*(void *)(*((void *)&v26 + 1) + 8 * (void)v17)]);
          int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v18));
          [v3 addObject:v19];

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v15);
    }

    id v5 = v24;
    v2 = v25;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v20 addObject:@"/private/var/db/diagnostics"];
  [v20 addObject:@"/private/var/db/uuidtext"];
  [v3 addObject:v20];

  return v3;
}

- (int64_t)getFileSizeForItemAtPath:(id)a3
{
  id v3 = a3;
  if (stat((const char *)[v3 fileSystemRepresentation], &v13))
  {
    id v9 = sub_100021D84();
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100026D20();
    }
    goto LABEL_9;
  }

  int v4 = v13.st_mode & 0xF000;
  if (v4 == 0x8000)
  {
    off_t st_size = v13.st_size;
    goto LABEL_11;
  }

  if (v4 != 0x4000)
  {
    id v6 = sub_100021D84();
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100026C48();
    }
LABEL_9:

LABEL_10:
    off_t st_size = -1LL;
    goto LABEL_11;
  }

  v12[0] = 0LL;
  v12[1] = 0LL;
  if (dirstat_np([v3 fileSystemRepresentation], 0, v12, 16))
  {
    id v10 = sub_100021D84();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100026CAC();
    }

    goto LABEL_10;
  }

  off_t st_size = v12[0];
LABEL_11:

  return st_size;
}

- (BOOL)canDeviceHaveEnoughSpaceForItemDomainWithSize:(int64_t)a3
{
  int v4 = (void *)MGCopyAnswer(@"DiskUsage", 0LL);
  id v5 = v4;
  if (!v4)
  {
    id v15 = sub_100021D84();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100026D94(v6, v16, v17);
    }
    goto LABEL_15;
  }

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMGQDiskUsageAmountDataAvailable]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kMGQDiskUsageAmountDataReserved]);
  id v8 = sub_100021D84();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v6) {
    BOOL v11 = v7 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100026DCC(v10, v18, v19);
    }

LABEL_15:
    BOOL v13 = 0;
    goto LABEL_9;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134218496;
    id v21 = -[os_log_s longLongValue](v6, "longLongValue");
    __int16 v22 = 2048;
    id v23 = [v7 longLongValue];
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "dataAvailable:  %lld - dataReserved:  %lld - itemDomainSize:  %lld",  (uint8_t *)&v20,  0x20u);
  }

  v12 = (char *)-[os_log_s longLongValue](v6, "longLongValue");
  BOOL v13 = (uint64_t)v12 > (uint64_t)((char *)[v7 longLongValue] + a3);

LABEL_9:
  return v13;
}

- (void)moveBluetoothFilesToDataShelter
{
}

- (void)moveSecondPartyAppFilesToDataShelter
{
}

- (void)movePreservedFilesToDataShelter:(id)a3 removeFilesOnSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (char *)a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = sub_100021D84();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v74 = v5;
    __int16 v75 = 1024;
    LODWORD(v76) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Preserving files from %{public}@ - removeFilesOnSuccess:  %{BOOLean}d",  buf,  0x12u);
  }

  BOOL v57 = v4;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL));
  v82[0] = NSURLIsRegularFileKey;
  v82[1] = NSURLIsDirectoryKey;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 2LL));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( [v6 enumeratorAtURL:v9 includingPropertiesForKeys:v10 options:0 errorHandler:&stru_100044BF8]);

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id obj = v11;
  id v62 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (!v62)
  {
    int v38 = 0;
    id v13 = 0LL;
    goto LABEL_40;
  }

  id v58 = v5;
  id v13 = 0LL;
  v60 = v6;
  uint64_t v61 = *(void *)v70;
  *(void *)&__int128 v12 = 136315906LL;
  __int128 v56 = v12;
  do
  {
    id v14 = 0LL;
    do
    {
      if (*(void *)v70 != v61) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)v14);
      id v67 = 0LL;
      id v68 = 0LL;
      unsigned __int8 v16 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v68, NSURLIsRegularFileKey, &v67, v56);
      id v17 = v68;
      id v18 = v67;

      if ((v16 & 1) == 0)
      {
        id v40 = sub_100021D84();
        unsigned __int8 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v44 = (char *)objc_claimAutoreleasedReturnValue([v15 path]);
          v45 = (char *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
          *(_DWORD *)buf = 138543618;
          v74 = v44;
          __int16 v75 = 2114;
          __int128 v76 = v45;
          _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "getResourceValue NSURLIsRegularFileKey failed for %{public}@ with error %{public}@",  buf,  0x16u);
        }

        __int128 v26 = 0LL;
        int64_t v25 = 0LL;
        __int16 v24 = 0LL;
        id v20 = 0LL;
        goto LABEL_33;
      }

      id v65 = 0LL;
      id v66 = 0LL;
      unsigned __int8 v19 = [v15 getResourceValue:&v66 forKey:NSURLIsDirectoryKey error:&v65];
      id v20 = v66;
      id v13 = v65;

      if ((v19 & 1) != 0)
      {
        if (([v17 BOOLValue] & 1) == 0 && !objc_msgSend(v20, "BOOLValue")
          || (id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 path]),
              unsigned int v22 = +[MSDXattr isContentRoot:](&OBJC_CLASS___MSDXattr, "isContentRoot:", v21),
              v21,
              !v22))
        {
          __int128 v26 = 0LL;
          int64_t v25 = 0LL;
          __int16 v24 = 0LL;
LABEL_22:
          int v38 = 0;
          int v39 = 1;
          goto LABEL_23;
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", objc_msgSend(v58, "length")));

        int64_t v25 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:v24]);
        __int128 v26 = (char *)objc_claimAutoreleasedReturnValue([v25 stringByDeletingLastPathComponent]);
        if (([v60 fileExistsAtPath:v26] & 1) == 0)
        {
          id v64 = v13;
          unsigned __int8 v27 = [v60 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v64];
          id v18 = v64;

          if ((v27 & 1) == 0)
          {
            id v42 = sub_100021D84();
            unsigned __int8 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              uint64_t v43 = (char *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
              *(_DWORD *)buf = 138543618;
              v74 = v26;
              __int16 v75 = 2114;
              __int128 v76 = v43;
              _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Failed to create parent folder %{public}@. Error: %{public}@",  buf,  0x16u);
            }

            goto LABEL_33;
          }

          id v13 = v18;
        }

        id v28 = sub_100021D84();
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v30 = (char *)objc_claimAutoreleasedReturnValue([v15 path]);
          *(_DWORD *)buf = 136315650;
          v74 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
          __int16 v75 = 2114;
          __int128 v76 = v30;
          __int16 v77 = 2114;
          __int128 v78 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s - Clone item %{public}@ ==> %{public}@",  buf,  0x20u);
        }

        id v31 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
        unsigned __int8 v32 = [v60 cloneFile:v31 to:v25 expectingHash:0 correctOwnership:0];

        if ((v32 & 1) != 0) {
          goto LABEL_22;
        }
        id v33 = sub_100021D84();
        unsigned __int8 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = (char *)objc_claimAutoreleasedReturnValue([v15 path]);
          v36 = __error();
          id v37 = strerror(*v36);
          *(_DWORD *)buf = v56;
          v74 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
          __int16 v75 = 2114;
          __int128 v76 = v35;
          __int16 v77 = 2114;
          __int128 v78 = v25;
          __int16 v79 = 2080;
          __int128 v80 = v37;
          _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s - Failed to clone item %{public}@ ==> %{public}@ - Error:  %s",  buf,  0x2Au);
        }
      }

      else
      {
        id v41 = sub_100021D84();
        unsigned __int8 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v46 = (char *)objc_claimAutoreleasedReturnValue([v15 path]);
          v47 = (char *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
          *(_DWORD *)buf = 138543618;
          v74 = v46;
          __int16 v75 = 2114;
          __int128 v76 = v47;
          _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "getResourceValue NSURLIsDirectoryKey failed for %{public}@ with error %{public}@",  buf,  0x16u);
        }

        __int128 v26 = 0LL;
        int64_t v25 = 0LL;
        __int16 v24 = 0LL;
      }

      id v18 = v13;
LABEL_33:

      int v39 = 0;
      int v38 = 6;
      id v13 = v18;
LABEL_23:

      if (!v39) {
        goto LABEL_38;
      }
      id v14 = (char *)v14 + 1;
    }

    while (v62 != v14);
    id v48 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
    id v62 = v48;
  }

  while (v48);
  int v38 = 0;
LABEL_38:
  id v5 = v58;
  id v6 = v60;
LABEL_40:

  if (v38 || !v57)
  {
    id v52 = v13;
  }

  else
  {
    id v49 = sub_100021D84();
    id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v74 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Remove preserved files from:  %{public}@",  buf,  0xCu);
    }

    id v63 = v13;
    unsigned __int8 v51 = [v6 removeItemAtPath:v5 error:&v63];
    id v52 = v63;

    if ((v51 & 1) == 0)
    {
      id v53 = sub_100021D84();
      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue([v52 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        v74 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
        __int16 v75 = 2114;
        __int128 v76 = v5;
        __int16 v77 = 2114;
        __int128 v78 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%s - Failed to remove preserved files from:  %{public}@ - Error:  %{public}@",  buf,  0x20u);
      }
    }
  }
}

- (BOOL)adjustContentUnder:(id)a3 userHomePath:(id)a4
{
  id v5 = a3;
  id v64 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  else {
    BOOL v7 = 1;
  }
  id v8 = &selRef_orPredicateWithSubpredicates_;
  id v66 = v6;
  if (v7)
  {
    id v9 = 0LL;
    id v10 = 0LL;
    BOOL v11 = 0LL;
    __int128 v12 = 0LL;
    goto LABEL_40;
  }

  id v77 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 contentsOfDirectoryAtPath:v5 error:&v77]);
  id v14 = v77;
  id v15 = v14;
  if (!v13)
  {
    id v57 = sub_100021D84();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100026E84();
    }
    id v48 = 0LL;
    id v9 = 0LL;
    id v20 = 0LL;
    BOOL v11 = 0LL;
    goto LABEL_76;
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v16 = v13;
  id v17 = [v16 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (!v17)
  {
    id v9 = 0LL;
    id v20 = 0LL;
    BOOL v11 = 0LL;
    goto LABEL_39;
  }

  id v19 = v17;
  id v9 = 0LL;
  id v20 = 0LL;
  BOOL v11 = 0LL;
  uint64_t v65 = *(void *)v74;
  *(void *)&__int128 v18 = 136315906LL;
  __int128 v61 = v18;
  id obj = v16;
  do
  {
    id v21 = 0LL;
    do
    {
      unsigned int v22 = v11;
      id v23 = v9;
      if (*(void *)v74 != v65) {
        objc_enumerationMutation(obj);
      }
      id v24 = v5;
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "stringByAppendingPathComponent:",  *(void *)(*((void *)&v73 + 1) + 8 * (void)v21),  v61));

      id v72 = v15;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v66 attributesOfItemAtPath:v11 error:&v72]);
      id v25 = v72;

      if (!v9)
      {
        id v53 = sub_100021D84();
        id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_10002700C();
        }
        goto LABEL_64;
      }

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v9 fileType]);
      unsigned int v27 = [v26 isEqualToString:NSFileTypeSymbolicLink];

      if (v27)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:v64]);
        if (!v28 || [v11 caseInsensitiveCompare:v28])
        {

LABEL_32:
          id v15 = v25;
          goto LABEL_33;
        }

        id v29 = sub_100021D84();
        unsigned __int8 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v80 = (const char *)v28;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Found wormhole in staging to user volume: %@",  buf,  0xCu);
        }
      }

      if (!+[MSDXattr isNotExtracted:](&OBJC_CLASS___MSDXattr, "isNotExtracted:", v11))
      {
        -[MSDHSnapshottedDataSaver adjustContentUnder:userHomePath:](self, "adjustContentUnder:userHomePath:", v11, v64);
        goto LABEL_32;
      }

      uint64_t v31 = objc_claimAutoreleasedReturnValue(-[MSDHSnapshottedDataSaver originalPathFor:](self, "originalPathFor:", v11));

      id v32 = sub_100021D84();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v80 = (const char *)v11;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%@ is not extracted (under a content root), should use the original content.",  buf,  0xCu);
      }

      id v71 = v25;
      unsigned __int8 v34 = [v66 removeItemAtPath:v11 error:&v71];
      id v35 = v71;

      if ((v34 & 1) == 0)
      {
        id v55 = sub_100021D84();
        id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_100027094();
        }
        id v20 = (void *)v31;
        id v25 = v35;
LABEL_64:
        v47 = (os_log_s *)obj;

        id v48 = 0LL;
        BOOL v49 = 0;
        id v15 = v25;
        id v5 = v24;
        goto LABEL_65;
      }

      if ([v66 fileExistsAtPath:v31])
      {
        id v70 = v35;
        unsigned __int8 v36 = [v66 moveItemAtPath:v31 toPath:v11 error:&v70];
        id v15 = v70;

        if ((v36 & 1) == 0)
        {
          id v37 = sub_100021D84();
          int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            int v39 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
            *(_DWORD *)buf = v61;
            __int128 v80 = "-[MSDHSnapshottedDataSaver adjustContentUnder:userHomePath:]";
            __int16 v81 = 2112;
            uint64_t v82 = v31;
            __int16 v83 = 2112;
            v84 = v11;
            __int16 v85 = 2112;
            v86 = v39;
            _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s: Could not move item %@ to %@.  Error:  %@",  buf,  0x2Au);
          }
        }

        id v20 = (void *)v31;
      }

      else
      {
        id v20 = (void *)v31;
        id v15 = v35;
      }

- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - fullPath:  %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 1;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v19 = sub_10000908C;
  id v20 = sub_10000909C;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 pathComponents]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000090A4;
  v10[3] = &unk_100044BB8;
  __int128 v12 = buf;
  id v8 = v6;
  id v11 = v8;
  id v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v10];

  LOBYTE(v7) = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

- (id)originalPathFor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByStandardizingPath]);
    id v7 = [v3 rangeOfString:v6];
    uint64_t v9 = v8;
  }

  else
  {
    id v7 = v4;
    uint64_t v9 = v5;
  }

  if (v7)
  {
    id v12 = sub_100021D84();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000272E0();
    }

    id v10 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:v9]);
  }

  return v10;
}

@end