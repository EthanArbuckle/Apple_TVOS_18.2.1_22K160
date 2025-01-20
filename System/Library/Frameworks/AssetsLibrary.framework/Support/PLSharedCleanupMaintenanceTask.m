@interface PLSharedCleanupMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLSharedCleanupMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100003FF0;
  v18 = &unk_1000211F0;
  v19 = self;
  id v6 = v4;
  id v20 = v6;
  [v5 performTransaction:&v15 withPriority:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryServicesManager](self, "libraryServicesManager", v15, v16, v17, v18, v19));
  unsigned int v8 = [v7 isSystemPhotoLibrary];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    +[PLPhotoSharingHelper pruneCloudSharingContentIfNecessaryInLibrary:]( &OBJC_CLASS___PLPhotoSharingHelper,  "pruneCloudSharingContentIfNecessaryInLibrary:",  v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pathManager]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 libraryURL]);
    unsigned int v13 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:]( &OBJC_CLASS___PLPhotoSharingHelper,  "sharedStreamsEnabledForPhotoLibraryURL:",  v12);

    if (v13) {
      +[PLPhotoSharingHelper pollForAlbumListUpdatesIfNecessary]( &OBJC_CLASS___PLPhotoSharingHelper,  "pollForAlbumListUpdatesIfNecessary");
    }
  }

  return 1;
}

@end