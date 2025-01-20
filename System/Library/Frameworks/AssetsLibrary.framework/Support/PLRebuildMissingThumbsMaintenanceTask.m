@interface PLRebuildMissingThumbsMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLRebuildMissingThumbsMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryServicesManager]);
  unsigned int v6 = [v5 isSyndicationPhotoLibrary];

  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 pathManager]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);

    if (+[PLThumbnailManager requiredThumbnailResetTypeWithPathManager:comparedToConfigPhase:]( &OBJC_CLASS___PLThumbnailManager,  "requiredThumbnailResetTypeWithPathManager:comparedToConfigPhase:",  v10,  2LL) == (id)1)
    {
      uint64_t Log = PLThumbnailsGetLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
        int v40 = 138412290;
        v41 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unsuppressing target thumbnail config for library: %@",  (uint8_t *)&v40,  0xCu);
      }

      uint64_t v17 = PLThumbnailsGetLog();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
        int v40 = 138412290;
        v41 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Marking assets as needing table thumb migration for library: %@",  (uint8_t *)&v40,  0xCu);
      }

      +[PLModelMigrator markAssetsWithThumbsForTableRebuildInContext:]( &OBJC_CLASS___PLModelMigrator,  "markAssetsWithThumbsForTableRebuildInContext:",  v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[PLThumbnailManager thumbnailConfigurationDictWithPathManager:]( &OBJC_CLASS___PLThumbnailManager,  "thumbnailConfigurationDictWithPathManager:",  v10));
      +[PLThumbnailManager markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:]( &OBJC_CLASS___PLThumbnailManager,  "markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:",  v20);
      +[PLThumbnailManager stampThumbnailConfiguration:toFile:withPathManager:]( &OBJC_CLASS___PLThumbnailManager,  "stampThumbnailConfiguration:toFile:withPathManager:",  v20,  1LL,  v10);
      +[PLThumbnailManager invalidateCachedConfig](&OBJC_CLASS___PLThumbnailManager, "invalidateCachedConfig");
      +[PLThumbnailManager removeThumbnailTablesUnsupportedOnly:withPathManager:]( &OBJC_CLASS___PLThumbnailManager,  "removeThumbnailTablesUnsupportedOnly:withPathManager:",  1LL,  v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 libraryID]);
      uint64_t v23 = PLDataStoreForClassIDAndLibraryID(1LL, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      [v24 invalidateThumbnailManager];
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v25 thumbnailManager]);

      if (([v20 wantsTableOnlyRebuild] & 1) == 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
        id v27 = +[PLTableThumbnailMigrator countOfAssetsPendingTableThumbRebuildInLibrary:]( &OBJC_CLASS___PLTableThumbnailMigrator,  "countOfAssetsPendingTableThumbRebuildInLibrary:",  v26);

        if (v27)
        {
          if (v27 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            [v20 reStampConfigAsNeedingTableThumbMigration];
            v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found assets awaiting table thumb migration yet config file is missing migration flag, Please file a Radar to Photos Backend Storage | All with 'cplctl diagnose' logs and relate to 73301366"));
            PLSimulateCrash(195887399LL, v28);
          }
        }
      }
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 thumbnailManager]);

    unsigned int v31 = [v30 wantsTableOnlyRebuild];
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    if (v31)
    {
      uint64_t v33 = PLThumbnailsGetLog();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      v35 = v34;
      if (v32)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          int v40 = 138412290;
          v41 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Queueing request to continue table thumb migration for library: %@",  (uint8_t *)&v40,  0xCu);
        }

        [v30 continueRebuildingTableThumbsInLibrary:v32];
      }

      else
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v40) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Cannot continue with rebuild thumbs task because there is no library",  (uint8_t *)&v40,  2u);
        }

        v32 = 0LL;
      }
    }

    else if ([v30 hasMissingThumbnailsInLibrary:v32] {
           && ([v30 isRebuildingThumbnails] & 1) == 0)
    }
    {
      unsigned __int8 v36 = [v30 hasExceededRebuildThumbnailRequestLimit];

      if ((v36 & 1) != 0)
      {
LABEL_29:

        goto LABEL_30;
      }

      uint64_t v37 = PLThumbnailsGetLog();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v40) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Found missing thumbnails in library, attempting repair",  (uint8_t *)&v40,  2u);
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
      [v30 rebuildAllMissingThumbnailsInLibrary:v32];
    }

    goto LABEL_29;
  }

  uint64_t v9 = PLBackendGetLog(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v40) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Rebuild missing thumbnails maintenance task is not supported for syndication library",  (uint8_t *)&v40,  2u);
  }

@end