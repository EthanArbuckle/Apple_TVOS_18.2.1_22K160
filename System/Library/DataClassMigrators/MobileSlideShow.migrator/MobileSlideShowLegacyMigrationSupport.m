@interface MobileSlideShowLegacyMigrationSupport
+ (BOOL)requiresLegacyMigrationForLibraryURL:(id)a3;
- (BOOL)_migrateCameraRollFiles;
- (BOOL)_migrateMetadataFilesToPhotoData;
- (BOOL)performMigration;
- (MobileSlideShowLegacyMigrationSupport)initWithLibraryURL:(id)a3;
- (PLPhotoLibraryPathManager)pathManager;
- (void)_generateMigrationFilegroupsAndOptions;
- (void)_migrateAssetsdPreferencesDomain;
- (void)_removeOldLargeThubnails;
@end

@implementation MobileSlideShowLegacyMigrationSupport

- (MobileSlideShowLegacyMigrationSupport)initWithLibraryURL:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MobileSlideShowLegacyMigrationSupport;
  v5 = -[MobileSlideShowLegacyMigrationSupport init](&v15, "init");
  if (v5)
  {
    v6 = -[PLPhotoLibraryPathManager initWithLibraryURL:]( objc_alloc(&OBJC_CLASS___PLPhotoLibraryPathManager),  "initWithLibraryURL:",  v4);
    pathManager = v5->_pathManager;
    v5->_pathManager = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    fileGroupsToMigrate = v5->_fileGroupsToMigrate;
    v5->_fileGroupsToMigrate = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    fileGroupProcessingOptions = v5->_fileGroupProcessingOptions;
    v5->_fileGroupProcessingOptions = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    strayFileGroups = v5->_strayFileGroups;
    v5->_strayFileGroups = v12;
  }

  return v5;
}

- (BOOL)performMigration
{
  if (-[MobileSlideShowLegacyMigrationSupport _migrateCameraRollFiles](self, "_migrateCameraRollFiles")) {
    BOOL v3 = -[MobileSlideShowLegacyMigrationSupport _migrateMetadataFilesToPhotoData]( self,  "_migrateMetadataFilesToPhotoData");
  }
  else {
    BOOL v3 = 0;
  }
  -[MobileSlideShowLegacyMigrationSupport _removeOldLargeThubnails](self, "_removeOldLargeThubnails");
  return v3;
}

- (void)_migrateAssetsdPreferencesDomain
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"DCFLastDirectoryNumber", @"assetsd");
  if (v2)
  {
    BOOL v3 = v2;
    CFPreferencesSetAppValue(@"DCFLastDirectoryNumber", v2, @"com.apple.assetsd");
    CFPreferencesAppSynchronize(@"com.apple.assetsd");
    CFPreferencesSetAppValue(@"DCFLastDirectoryNumber", 0LL, @"assetsd");
    CFPreferencesAppSynchronize(@"assetsd");
    CFRelease(v3);
  }

- (void)_generateMigrationFilegroupsAndOptions
{
  CFPropertyListRef v2 = self;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileSlideShowLegacyMigrationSupport pathManager](self, "pathManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 photoDirectoryWithType:4]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PLFileUtilities fileManager](&OBJC_CLASS___PLFileUtilities, "fileManager"));
  if ([v5 fileExistsAtPath:v4])
  {
    int v39 = MGGetBoolAnswer(@"ipad");
    v32 = v4;
    id v31 = [[PLPhotoDCIMDirectory alloc] initWithDCIMPath:v4];
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v31 dcfDirectories]);
    id v35 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (!v35) {
      goto LABEL_44;
    }
    uint64_t v34 = *(void *)v50;
    v38 = v5;
    while (1)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v6;
        v7 = *(void **)(*((void *)&v49 + 1) + 8 * v6);
        context = objc_autoreleasePoolPush();
        [v7 setConsiderInvalidFileGroups:1];
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fileGroups]);
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v40 = v8;
        id v42 = [v40 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v42)
        {
          uint64_t v41 = *(void *)v46;
          do
          {
            for (i = 0LL; i != v42; i = (char *)i + 1)
            {
              if (*(void *)v46 != v41) {
                objc_enumerationMutation(v40);
              }
              v10 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
              v11 = objc_autoreleasePoolPush();
              unsigned int v12 = [v10 hasVideoFile];
              if ((v12 & 1) != 0) {
                uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 pathForVideoFile]);
              }
              else {
                uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 pathForFullSizeImage]);
              }
              v14 = (void *)v13;
              objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v10 pathForThumbnailFile]);
              v44 = (void *)objc_claimAutoreleasedReturnValue([v10 pathForPrebakedThumbnail]);
              unsigned int v16 = [v10 hasObsoleteFiles];
              unsigned int v17 = [v5 fileExistsAtPath:v14];
              if ((v17 & 1) == 0 && !v16)
              {
                -[NSMutableArray addObject:](v2->_strayFileGroups, "addObject:", v10);
                goto LABEL_40;
              }

              if (v16) {
                int v18 = 16;
              }
              else {
                int v18 = 0;
              }
              if (v17) {
                int v19 = v18;
              }
              else {
                int v19 = v18 | 0x20;
              }
              v43 = v11;
              if (v12)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue([v10 pathForVideoPreviewFile]);
                unsigned int v21 = [v5 fileExistsAtPath:v20];

                if (v21) {
                  v19 |= 8u;
                }
              }

              else
              {
                unsigned int v21 = 0;
              }

              if (v39)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue([v10 pathForPrebakedWildcatThumbnailsFile]);
                unsigned int v23 = [v5 fileExistsAtPath:v22];
                v24 = v2;
                unsigned int v25 = v23;

                BOOL v26 = v25 == 0;
                CFPropertyListRef v2 = v24;
                if (v26) {
                  v19 |= 4u;
                }
              }

              v11 = v43;
              if ((v12 & 1) == 0)
              {
                v5 = v38;
                unsigned int v27 = [v38 fileExistsAtPath:v15];
LABEL_39:
                uint64_t v28 = v19 | v27 ^ 1;
                -[NSMutableArray addObject:](v2->_fileGroupsToMigrate, "addObject:", v10);
                fileGroupProcessingOptions = v2->_fileGroupProcessingOptions;
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v28));
                -[NSMutableArray addObject:](fileGroupProcessingOptions, "addObject:", v30);

                v11 = v43;
                goto LABEL_40;
              }

              v5 = v38;
              unsigned int v27 = [v38 fileExistsAtPath:v15];
              if (v21) {
                goto LABEL_39;
              }
LABEL_40:
              [v10 setWriteIsPending:1];

              objc_autoreleasePoolPop(v11);
            }

            id v42 = [v40 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }

          while (v42);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v6 = v37 + 1;
      }

      while ((id)(v37 + 1) != v35);
      id v35 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (!v35)
      {
LABEL_44:

        id v4 = v32;
        break;
      }
    }
  }
}

- (BOOL)_migrateCameraRollFiles
{
  id v31 = self;
  BOOL v3 = (char *)-[NSMutableArray count](self->_fileGroupsToMigrate, "count");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLFileUtilities fileManager](&OBJC_CLASS___PLFileUtilities, "fileManager"));
  v30 = v3;
  if ((uint64_t)v3 >= 1)
  {
    uint64_t v6 = 0LL;
    *(void *)&__int128 v5 = 138543618LL;
    __int128 v29 = v5;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v31->_fileGroupsToMigrate, "objectAtIndex:", v6, v29));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v31->_fileGroupProcessingOptions, "objectAtIndex:", v6));
      unsigned __int8 v9 = [v8 intValue];

      [v7 createMetadataDirectoryIfNecessary];
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 pathForContainingDirectory]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 pathForThumbnailFile]);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 thumbnailFilename]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v12]);

      NSFileAttributeKey v42 = NSFileProtectionKey;
      NSFileProtectionType v43 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      id v36 = 0LL;
      objc_super v15 = v4;
      unsigned __int8 v16 = [v4 setAttributes:v14 ofItemAtPath:v13 error:&v36];
      id v17 = v36;

      if ((v16 & 1) == 0 && [v17 code] != &dword_4)
      {
        uint64_t Log = PLMigrationGetLog();
        int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v29;
          int v39 = v13;
          __int16 v40 = 2114;
          id v41 = v17;
          _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_ERROR,  "Unable to assign data protection to %{public}@: %{public}@",  buf,  0x16u);
        }
      }

      id v4 = v15;
      [v15 moveItemAtPath:v13 toPath:v11 error:0];
      if ((v9 & 0x10) != 0) {
        [v7 deleteObsoleteFiles];
      }
      if ((v9 & 0x20) != 0) {
        [v7 deleteFiles];
      }
      else {
        [v7 setWriteIsPending:0];
      }

      ++v6;
    }

    while (v30 != v6);
  }

  strayFileGroups = v31->_strayFileGroups;
  if (strayFileGroups)
  {
    unsigned int v21 = v4;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    v22 = strayFileGroups;
    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          unsigned int v27 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          [v27 deleteFiles];
          [v27 setWriteIsPending:0];
        }

        id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
      }

      while (v24);
    }

    id v4 = v21;
  }

  return 1;
}

- (BOOL)_migrateMetadataFilesToPhotoData
{
  CFPropertyListRef v2 = (void *)objc_claimAutoreleasedReturnValue(-[MobileSlideShowLegacyMigrationSupport pathManager](self, "pathManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 photoDirectoryWithType:1]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"DCIM"]);
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"PhotoData/MISC"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"PhotoData"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Photos/Videos"]);
  v146 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@".MISC"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"Videos"]);
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[PLFileUtilities fileManager](&OBJC_CLASS___PLFileUtilities, "fileManager"));
  v142 = v6;
  if (([v145 fileExistsAtPath:v6] & 1) == 0)
  {
    id v175 = 0LL;
    unsigned __int8 v9 = +[PLFileUtilities createDirectoryAtPath:error:]( &OBJC_CLASS___PLFileUtilities,  "createDirectoryAtPath:error:",  v6,  &v175);
    id v10 = v175;
    if ((v9 & 1) == 0)
    {
      uint64_t Log = PLMigrationGetLog();
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v183 = v142;
        __int16 v184 = 2114;
        id v185 = v10;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_ERROR,  "Unable to create directory: %{public}@, reason: %{public}@",  buf,  0x16u);
      }
    }
  }

  uint64_t v13 = v145;
  if (([v145 fileExistsAtPath:v146] & 1) != 0
    || ([v145 fileExistsAtPath:v8] & 1) == 0)
  {
    v140 = v4;
    v141 = v5;
    v134 = v8;
    if (![v145 fileExistsAtPath:v146])
    {
LABEL_42:
      id v167 = 0LL;
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v13 contentsOfDirectoryAtPath:v4 error:&v167]);
      id v132 = v167;
      v133 = v36;
      if (v132)
      {
        uint64_t v37 = PLMigrationGetLog();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v183 = v4;
          _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_ERROR,  "Failed to enumerate %{public}@. No *APPLE or *IMPRT directories will be migrated.",  buf,  0xCu);
        }

        LODWORD(v14) = 1;
        goto LABEL_90;
      }

      v130 = v3;
      __int128 v165 = 0u;
      __int128 v166 = 0u;
      __int128 v163 = 0u;
      __int128 v164 = 0u;
      v38 = v36;
      id v39 = -[os_log_s countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v163,  v181,  16LL);
      if (!v39)
      {
        LODWORD(v14) = 1;
        goto LABEL_90;
      }

      id v40 = v39;
      v128 = v7;
      uint64_t v143 = *(void *)v164;
      while (1)
      {
        for (i = 0LL; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v164 != v143) {
            objc_enumerationMutation(v38);
          }
          NSFileAttributeKey v42 = *(void **)(*((void *)&v163 + 1) + 8LL * (void)i);
          [v42 rangeOfString:@"APPLE"];
          if (!v43)
          {
            [v42 rangeOfString:@"IMPRT"];
            if (!v44) {
              continue;
            }
          }

          __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v42]);
          __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 stringByAppendingPathComponent:@".MISC"]);

          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v142 stringByAppendingPathComponent:v42]);
          __int128 v48 = v145;
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v145 contentsOfDirectoryAtPath:v46 error:0]);
          if ([v145 fileExistsAtPath:v46] && objc_msgSend(v49, "count"))
          {
            if ([v145 fileExistsAtPath:v47])
            {
              id v161 = 0LL;
              unsigned __int8 v50 = [v145 removeItemAtPath:v47 error:&v161];
              id v51 = v161;
              __int128 v52 = v51;
              if ((v50 & 1) != 0)
              {

                __int128 v48 = v145;
                goto LABEL_58;
              }

              __int128 v5 = v141;
              if (v51)
              {
                uint64_t v70 = PLMigrationGetLog();
                v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v183 = v47;
                  __int16 v184 = 2114;
                  id v185 = v46;
                  __int16 v186 = 2114;
                  id v187 = v52;
                  v67 = v66;
                  v68 = "Failed to delete existing %{public}@ [Migration will skip %{public}@.] Error: %{public}@";
                  uint32_t v69 = 32;
LABEL_78:
                  _os_log_impl(&dword_0, v67, OS_LOG_TYPE_ERROR, v68, buf, v69);
                }

                goto LABEL_79;
              }

              goto LABEL_80;
            }

- (void)_removeOldLargeThubnails
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLFileUtilities fileManager](&OBJC_CLASS___PLFileUtilities, "fileManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileSlideShowLegacyMigrationSupport pathManager](self, "pathManager"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 photoDirectoryWithType:28]);

  id v21 = (void *)v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL));
  NSURLResourceKey v33 = NSURLNameKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  v20 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:1 errorHandler:0]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        unsigned int v23 = 7;
        if (+[PLModelMigrator shouldImportAssetsFromDCIMSubDirectoryAtURL:assetsKind:]( &OBJC_CLASS___PLModelMigrator,  "shouldImportAssetsFromDCIMSubDirectoryAtURL:assetsKind:",  v14,  &v23)) {
          BOOL v15 = v23 > 1;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          id v22 = 0LL;
          unsigned __int8 v16 = [v3 removeItemAtURL:v14 error:&v22];
          id v17 = v22;
          if ((v16 & 1) == 0)
          {
            uint64_t Log = PLMigrationGetLog();
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v29 = v14;
              __int16 v30 = 2112;
              id v31 = v17;
              _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_ERROR,  "Could not remove the old large thumbnails directory %@. Error: %@",  buf,  0x16u);
            }
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v11);
  }
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void).cxx_destruct
{
}

+ (BOOL)requiresLegacyMigrationForLibraryURL:(id)a3
{
  return 0;
}

@end