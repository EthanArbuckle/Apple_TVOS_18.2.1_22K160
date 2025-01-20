@interface PLPhotoSharingPlugin
+ (id)MSASPersonIDForPollingTriggeredByPushNotification;
+ (id)delegatePluginForPersonID:(id)a3;
+ (void)didFindDeletedAlbumWithGUID:(id)a3 inviterAddress:(id)a4;
+ (void)didFindNewAlbum:(id)a3;
- (MSASServerSideModel)model;
- (NSString)personID;
- (PLPhotoLibrary)photoLibrary;
- (PLPhotoSharingPlugin)init;
- (id)albumTitleAndGUID:(id)a3;
- (void)MSASModel:(id)a3 didDeleteAllCommentsForAssetCollection:(id)a4 inAlbum:(id)a5;
- (void)MSASModel:(id)a3 didDeleteAllContentsOfAlbum:(id)a4;
- (void)MSASModel:(id)a3 didFindAccessControlChange:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindAlbumMetadataChange:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindAssetCollectionChange:(id)a4 inAlbum:(id)a5;
- (void)MSASModel:(id)a3 didFindCommentChange:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedAlbum:(id)a4;
- (void)MSASModel:(id)a3 didFindDeletedAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFindDeletedInvitation:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindGlobalResetSyncInfo:(id)a4;
- (void)MSASModel:(id)a3 didFindInvitationChange:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindLastViewedCommentDate:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didFindNewAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewAlbum:(id)a4;
- (void)MSASModel:(id)a3 didFindNewAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFindNewInvitation:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFinishAddingAlbum:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishAddingAssetCollection:(id)a4 toAlbum:(id)a5 error:(id)a6;
- (void)MSASModel:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishDeletingAlbum:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishModifyingAlbumMetadata:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6;
- (void)MSASModel:(id)a3 didFinishSendingInvitationByPhone:(id)a4 toAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASModel:(id)a3 didMarkAlbum:(id)a4 asHavingUnreadContent:(BOOL)a5;
- (void)MSASModel:(id)a3 didMarkAssetCollection:(id)a4 asHavingUnreadComments:(BOOL)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didRequestDerivativesForAssetCollections:(id)a4 specifications:(id)a5 info:(id)a6 completionBlock:(id)a7;
- (void)MSASModel:(id)a3 didSubscribeToAlbum:(id)a4;
- (void)MSASModel:(id)a3 didUnsubscribeFromAlbum:(id)a4;
- (void)MSASModel:(id)a3 didUpdateUnviewedAssetCollectionCount:(int)a4 forAlbum:(id)a5;
- (void)MSASModelDidDeleteAllAlbumsInAlbumList:(id)a3;
- (void)MSASModelDidReceiveNewServerSideConfiguration:(id)a3;
- (void)MSASModelWillBeForgotten:(id)a3;
- (void)dealloc;
- (void)setModel:(id)a3;
- (void)setPersonID:(id)a3;
@end

@implementation PLPhotoSharingPlugin

- (PLPhotoSharingPlugin)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PLPhotoSharingPlugin;
  v2 = -[PLPhotoSharingPlugin init](&v12, "init");
  if (v2)
  {
    +[PLPhotoLibraryPathManager enableMultiLibraryMode]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "enableMultiLibraryMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoSharingPlugin photoLibrary](v2, "photoLibrary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 assetsdClient]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryClient]);
    id v11 = 0LL;
    unsigned __int8 v6 = [v5 openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:0 error:&v11];
    id v7 = v11;

    if ((v6 & 1) == 0)
    {
      uint64_t Log = PLPhotoSharingGetLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "failed to open library: %@", buf, 0xCu);
      }
    }
  }

  return v2;
}

- (void)dealloc
{
  uint32_t v3 = notify_cancel(self->_pushTimerStartToken);
  if (v3)
  {
    uint32_t v4 = v3;
    uint64_t Log = PLPhotoSharingGetLog();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v14 = v4;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_ERROR,  "notify_cancel() failed for kMSASFileTransferPushTimerDidStartNotification. (%d)",  buf,  8u);
    }
  }

  uint32_t v7 = notify_cancel(self->_pushTimerEndToken);
  if (v7)
  {
    uint32_t v8 = v7;
    uint64_t v9 = PLPhotoSharingGetLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v14 = v8;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "notify_cancel() failed for kMSASFileTransferPushTimerDidEndNotification. (%d)",  buf,  8u);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoSharingPlugin model](self, "model"));
  [v11 removeObserver:self];

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PLPhotoSharingPlugin;
  -[PLPhotoSharingPlugin dealloc](&v12, "dealloc");
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)+[PLPhotoLibrary cloudSharingPhotoLibrary]( &OBJC_CLASS___PLPhotoLibrary,  "cloudSharingPhotoLibrary");
}

- (void)MSASModelWillBeForgotten:(id)a3
{
  uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 personID]);
  if (v3)
  {
    uint64_t Log = PLPhotoSharingGetLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint32_t v7 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "MSASModelWillBeForgotten personID %@", (uint8_t *)&v6, 0xCu);
    }

    [(id)qword_117D8 removeObjectForKey:v3];
  }
}

- (void)MSASModelDidDeleteAllAlbumsInAlbumList:(id)a3
{
  uint64_t Log = PLPhotoSharingGetLog(self, a2, a3);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v7 = (void *)objc_opt_class(self);
    id v8 = v7;
    uint64_t v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412546;
    objc_super v12 = v7;
    __int16 v13 = 2112;
    uint32_t v14 = v10;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v11, 0x16u);
  }

  +[PLPhotoSharingHelper resetAllLocalState](&OBJC_CLASS___PLPhotoSharingHelper, "resetAllLocalState");
}

- (void)MSASModel:(id)a3 didFindNewAlbum:(id)a4
{
  id v6 = a4;
  uint64_t Log = PLPhotoSharingGetLog(v6, v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (void *)objc_opt_class(self);
    id v12 = v11;
    __int16 v13 = NSStringFromSelector(a2);
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v15 = 138412802;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v15, 0x20u);
  }

  +[PLPhotoSharingHelper updateLocalAlbumMetadataForMSASAlbum:info:]( &OBJC_CLASS___PLPhotoSharingHelper,  "updateLocalAlbumMetadataForMSASAlbum:info:",  v6,  0LL);
}

- (void)MSASModel:(id)a3 didFindDeletedAlbum:(id)a4
{
  id v6 = a4;
  uint64_t Log = PLPhotoSharingGetLog(v6, v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (void *)objc_opt_class(self);
    id v12 = v11;
    __int16 v13 = NSStringFromSelector(a2);
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138412802;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v14;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v17, 0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 GUID]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v15));
  +[PLPhotoSharingHelper deleteLocalAlbumsForMSASAlbumsWithGUIDs:]( &OBJC_CLASS___PLPhotoSharingHelper,  "deleteLocalAlbumsForMSASAlbumsWithGUIDs:",  v16);
}

- (void)MSASModel:(id)a3 didFindAlbumMetadataChange:(id)a4 info:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t Log = PLPhotoSharingGetLog(v9, v10, v11);
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v14 = (void *)objc_opt_class(self);
    id v15 = v14;
    v16 = NSStringFromSelector(a2);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v18 = 138412802;
    __int16 v19 = v14;
    __int16 v20 = 2112;
    __int16 v21 = v17;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v18, 0x20u);
  }

  +[PLPhotoSharingHelper updateLocalAlbumMetadataForMSASAlbum:info:]( &OBJC_CLASS___PLPhotoSharingHelper,  "updateLocalAlbumMetadataForMSASAlbum:info:",  v8,  v9);
}

- (void)MSASModel:(id)a3 didSubscribeToAlbum:(id)a4
{
  id v6 = a4;
  uint64_t Log = PLPhotoSharingGetLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_opt_class(self);
    id v10 = v9;
    uint64_t v11 = NSStringFromSelector(a2);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412802;
    v16 = v9;
    __int16 v17 = 2112;
    int v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v13 = PLPhotoSharingGetLog();
  uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v15, 2u);
  }
}

- (void)MSASModel:(id)a3 didUnsubscribeFromAlbum:(id)a4
{
  id v6 = a4;
  uint64_t Log = PLPhotoSharingGetLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_opt_class(self);
    id v10 = v9;
    uint64_t v11 = NSStringFromSelector(a2);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412802;
    v16 = v9;
    __int16 v17 = 2112;
    int v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v13 = PLPhotoSharingGetLog();
  uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v15, 2u);
  }
}

- (void)MSASModel:(id)a3 didFinishAddingAlbum:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t Log = PLPhotoSharingGetLog(v9, v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v14 = (void *)objc_opt_class(self);
    id v15 = v14;
    v16 = NSStringFromSelector(a2);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v18 = 138413058;
    __int16 v19 = v14;
    __int16 v20 = 2112;
    __int16 v21 = v17;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ error:%@", (uint8_t *)&v18, 0x2Au);
  }

  +[PLPhotoSharingHelper sendPendingInvitationsForNewlyCreatedAlbum:]( &OBJC_CLASS___PLPhotoSharingHelper,  "sendPendingInvitationsForNewlyCreatedAlbum:",  v8);
}

- (void)MSASModel:(id)a3 didFinishModifyingAlbumMetadata:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t Log = PLPhotoSharingGetLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_opt_class(self);
    id v13 = v12;
    uint32_t v14 = NSStringFromSelector(a2);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = 138413058;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v15;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ error:%@", (uint8_t *)&v16, 0x2Au);
  }
}

- (void)MSASModel:(id)a3 didFinishDeletingAlbum:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t Log = PLPhotoSharingGetLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_opt_class(self);
    id v13 = v12;
    uint32_t v14 = NSStringFromSelector(a2);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = 138413058;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v15;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ error:%@", (uint8_t *)&v16, 0x2Au);
  }
}

- (void)MSASModel:(id)a3 didFindNewAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v44 = a5;
  id v10 = a6;
  uint64_t Log = PLPhotoSharingGetLog(v10, v11, v12);
  uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_opt_class(self);
    id v16 = v15;
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"GUID"]);
    *(_DWORD *)buf = 138413058;
    v51 = v15;
    __int16 v52 = 2112;
    v53 = v17;
    __int16 v54 = 2112;
    id v55 = v44;
    __int16 v56 = 2112;
    id v57 = v10;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ MSASModel:didFindNewAssetCollections:%@ inAlbum:%@ info:%@",  buf,  0x2Au);
  }

  v43 = v10;

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v19 = v9;
  id v20 = [v19 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v46;
    uint64_t v23 = kPLJustEnqueuedAssetCollectionKey;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        id v25 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 metadata]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v23]);

        if (v27)
        {
          uint64_t v31 = PLPhotoSharingGetLog(v28, v29, v30);
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue([v25 GUID]);
            *(_DWORD *)buf = 138412290;
            v51 = v33;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "we just enqueued collection GUID %@, skipping", buf, 0xCu);
          }
        }

        else
        {
          [v18 addObject:v25];
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 GUID]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v44 GUID]);
          +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:]( &OBJC_CLASS___PLPhotoSharingHelper,  "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:",  v32,  v34,  v25,  200LL,  0LL);
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v21);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoSharingHelper sharingPersonID](&OBJC_CLASS___PLPhotoSharingHelper, "sharingPersonID"));
  uint64_t v38 = PLPhotoSharingGetLog(v35, v36, v37);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForKey:@"GUID"]);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v44 GUID]);
    *(_DWORD *)buf = 138412802;
    v51 = v40;
    __int16 v52 = 2112;
    v53 = v41;
    __int16 v54 = 2112;
    id v55 = v35;
    _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_DEFAULT,  " calling PLCloudSharedAssetSaveJob processMetadataFromClientProcessForAssetCollections:%@ inAlbum:%@ personID:%@",  buf,  0x20u);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoSharingHelper sharingPersonID](&OBJC_CLASS___PLPhotoSharingHelper, "sharingPersonID"));
  +[PLCloudSharedAssetSaveJob processMetadataForAssetCollections:inAlbum:personID:info:]( &OBJC_CLASS___PLCloudSharedAssetSaveJob,  "processMetadataForAssetCollections:inAlbum:personID:info:",  v18,  v44,  v42,  v43);
}

- (void)MSASModel:(id)a3 didFindAssetCollectionChange:(id)a4 inAlbum:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t Log = PLPhotoSharingGetLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_opt_class(self);
    id v13 = v12;
    uint32_t v14 = NSStringFromSelector(a2);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v18 = 138413058;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v15;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ album %@", (uint8_t *)&v18, 0x2Au);
  }

  uint64_t v16 = PLPhotoSharingGetLog();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v18, 2u);
  }
}

- (void)MSASModel:(id)a3 didDeleteAllContentsOfAlbum:(id)a4
{
  id v6 = a4;
  uint64_t Log = PLPhotoSharingGetLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_opt_class(self);
    id v10 = v9;
    uint64_t v11 = NSStringFromSelector(a2);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412802;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    int v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v13 = PLPhotoSharingGetLog();
  uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v15, 2u);
  }
}

- (void)MSASModel:(id)a3 didFindDeletedAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t Log = PLPhotoSharingGetLog(v12, v13, v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = (void *)objc_opt_class(self);
    id v18 = v17;
    __int16 v19 = NSStringFromSelector(a2);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    int v34 = 138413314;
    v35 = v17;
    __int16 v36 = 2112;
    uint64_t v37 = v20;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2112;
    id v41 = v11;
    __int16 v42 = 2112;
    id v43 = v12;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ album %@ info %@", (uint8_t *)&v34, 0x34u);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:kMSASInfoEventIsDueToAlbumDeletionKey]);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);

  if (v22 && !v21)
  {
    uint64_t v26 = PLPhotoSharingGetLog(v23, v24, v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
      int v34 = 138412290;
      v35 = v28;
      _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "about to PLCloudSharedAssetSaveJob deleteCloudSharedAssetsWithCloudGUIDs %@",  (uint8_t *)&v34,  0xCu);
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v29));
    +[PLCloudSharedAssetSaveJob deleteCloudSharedAssetsWithCloudGUIDs:info:]( &OBJC_CLASS___PLCloudSharedAssetSaveJob,  "deleteCloudSharedAssetsWithCloudGUIDs:info:",  v30,  v12);

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v11 GUID]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:]( &OBJC_CLASS___PLPhotoSharingHelper,  "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:",  v31,  v32,  v33,  300LL,  0LL);
  }
}

- (void)MSASModel:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 assetCollectionGUID]);
  id v16 = (id)objc_claimAutoreleasedReturnValue([v10 focusAssetCollectionGUID]);
  __int16 v19 = v16;
  if (v16)
  {
    id v16 = [v16 isEqualToString:v15];
    char v20 = (char)v16;
  }

  else
  {
    char v20 = 0;
  }

  uint64_t Log = PLPhotoSharingGetLog(v16, v17, v18);
  __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v78 = (os_log_s *)objc_opt_class(self);
    __int16 v79 = 2112;
    v80 = v15;
    __int16 v81 = 2112;
    v82 = (os_log_s *)v11;
    __int16 v83 = 2112;
    id v84 = v12;
    __int16 v85 = 2112;
    id v86 = v13;
    uint64_t v23 = v78;
    _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ MSASModel:didFinishRetrievingAsset:(collectionGUID:%@)%@ inAlbum:%@ error:%@",  buf,  0x34u);
  }

  if (v15)
  {
    char v73 = v20;
    v27 = (char *)[v11 mediaAssetType];
    if (v27 == (_BYTE *)&dword_0 + 2) {
      uint64_t v28 = 220LL;
    }
    else {
      uint64_t v28 = 221LL;
    }
    id v75 = v13;
    v74 = v14;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v12 GUID]);
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:]( &OBJC_CLASS___PLPhotoSharingHelper,  "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:",  v15,  v29,  v11,  v28,  v13);

    uint64_t v14 = v74;
    if (v74)
    {
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 assetCollectionWithGUID:v15]);
      if (!v35)
      {
        uint64_t v49 = PLPhotoSharingGetLog(0LL, v33, v34);
        __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v15;
          _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_ERROR,  "ERROR: unable to find asset collection for GUID %@, skipping saving",  buf,  0xCu);
        }

        goto LABEL_33;
      }

      __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PLCloudSharedAssetSaveJob pathForInFlightAssetCollectionWithGUID:mediaAssetType:]( &OBJC_CLASS___PLCloudSharedAssetSaveJob,  "pathForInFlightAssetCollectionWithGUID:mediaAssetType:",  v15,  v27));
      if (!v38)
      {
        uint64_t v50 = PLPhotoSharingGetLog(0LL, v36, v37);
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v78 = (os_log_s *)v11;
          _os_log_impl( &dword_0,  v51,  OS_LOG_TYPE_ERROR,  "ERROR : couldn't create a path to store inflight file for %@",  buf,  0xCu);
        }

        goto LABEL_32;
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v39 = [v70 fileExistsAtPath:v38];
      if ((_DWORD)v39)
      {
        uint64_t v42 = PLPhotoSharingGetLog(v39, v40, v41);
        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v38;
          _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_DEFAULT,  "Inflight file already exists at %@. We have re-downloaded the same asset.",  buf,  0xCu);
        }

        v69 = 0LL;
      }

      else
      {
        __int16 v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v74,  0LL));
        v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v38,  0LL));
        id v76 = 0LL;
        unsigned __int8 v71 = +[PLFileUtilities copyItemAtURL:toURL:error:]( &OBJC_CLASS___PLFileUtilities,  "copyItemAtURL:toURL:error:",  v52,  v53,  &v76);
        v69 = (os_log_s *)v76;

        if ((v71 & 1) == 0)
        {
          uint64_t v66 = PLPhotoSharingGetLog(v54, v55, v56);
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
          v72 = v67;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v14 = v74;
            v78 = (os_log_s *)v74;
            __int16 v79 = 2112;
            v80 = v38;
            __int16 v81 = 2112;
            v51 = v69;
            v82 = v69;
            _os_log_impl( &dword_0,  v67,  OS_LOG_TYPE_ERROR,  "ERROR : couldn't copy MMCS transient file %@ to inflight file %@: %@",  buf,  0x20u);
            id v13 = v75;
            goto LABEL_31;
          }

- (void)MSASModel:(id)a3 didFinishAddingAssetCollection:(id)a4 toAlbum:(id)a5 error:(id)a6
{
  id v9 = (PLPhotoSharingPlugin *)a4;
  id v10 = (PLPhotoSharingPlugin *)a5;
  id v11 = (PLPhotoSharingPlugin *)a6;
  uint64_t Log = PLPhotoSharingGetLog(v11, v12, v13);
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412802;
    uint64_t v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFinishAddingAssetCollection:%@ toAlbum:%@ error:%@",  (uint8_t *)&v22,  0x20u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v9));
  +[PLPhotoSharingHelper writeUploadDebugBreadcrumbForAssetCollections:state:error:]( &OBJC_CLASS___PLPhotoSharingHelper,  "writeUploadDebugBreadcrumbForAssetCollections:state:error:",  v16,  199LL,  v11);

  if (v11)
  {
    uint64_t v20 = PLPhotoSharingGetLog(v17, v18, v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138413058;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      v27 = v10;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%@ Failed to add asset collection %@ toAlbum:%@ error:%@",  (uint8_t *)&v22,  0x2Au);
    }
  }

  else
  {
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PLPhotoSharingHelper sharingPersonID](&OBJC_CLASS___PLPhotoSharingHelper, "sharingPersonID"));
    +[PLCloudSharedAssetSaveJob replaceRecentlyUploadedOriginalWithDerivativeForCollection:inAlbum:personID:]( &OBJC_CLASS___PLCloudSharedAssetSaveJob,  "replaceRecentlyUploadedOriginalWithDerivativeForCollection:inAlbum:personID:",  v9,  v10,  v21);
  }
}

- (void)MSASModel:(id)a3 didRequestDerivativesForAssetCollections:(id)a4 specifications:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  id v62 = a3;
  id v11 = (NSMutableArray *)a4;
  uint64_t v12 = (NSMutableArray *)a5;
  id v13 = a6;
  v60 = (void (**)(id, id, id, void *))a7;
  uint64_t Log = PLPhotoSharingGetLog(v60, v14, v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v84 = v11;
    __int16 v85 = 2112;
    id v86 = v12;
    __int16 v87 = 2112;
    id v88 = v13;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didRequestDerivativesForAssetCollections:%@ \n specifications:%@ \n info %@",  buf,  0x20u);
  }

  v61 = v13;

  +[PLPhotoSharingHelper writeUploadDebugBreadcrumbForAssetCollections:state:error:]( &OBJC_CLASS___PLPhotoSharingHelper,  "writeUploadDebugBreadcrumbForAssetCollections:state:error:",  v11,  110LL,  0LL);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  uint64_t v68 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v11);
  v67 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_6D88;
  v80[3] = &unk_C230;
  id v22 = v20;
  uint64_t v23 = v19;
  id v65 = v22;
  id v81 = v22;
  id v64 = v21;
  id v82 = v64;
  -[NSMutableArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v80);
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  obj = v11;
  v63 = v19;
  id v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v76,  v92,  16LL);
  if (v71)
  {
    uint64_t v70 = *(void *)v77;
    uint64_t v66 = kPLJustEnqueuedAssetCollectionKey;
    do
    {
      for (i = 0LL; i != v71; i = (char *)i + 1)
      {
        if (*(void *)v77 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
        unsigned int v26 = objc_msgSend(v25, "isPhotoIris", v60);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 assets]);
        id v28 = [v27 count];

        if (!v26)
        {
          uint64_t v41 = PLPhotoSharingGetLog(v29, v30, v31);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "Warning: got an MSASCollection with more than one asset, will select last one",  buf,  2u);
          }

- (void)MSASModel:(id)a3 didFindNewInvitation:(id)a4 info:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t Log = PLPhotoSharingGetLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFindNewInvitation:%@ with infoDict:%@",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)MSASModel:(id)a3 didFindDeletedInvitation:(id)a4 info:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t Log = PLPhotoSharingGetLog(v7, v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFindDeletedInvitation:%@ with infoDict:%@",  (uint8_t *)&v13,  0x16u);
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v6));
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingInvitationRelationships:changeType:info:]( &OBJC_CLASS___PLCloudSharingInvitationChangeJob,  "saveServerStateLocallyForSharingInvitationRelationships:changeType:info:",  v12,  2LL,  v7);
}

- (void)MSASModel:(id)a3 didFindInvitationChange:(id)a4 info:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t Log = PLPhotoSharingGetLog(v7, v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFindInvitationChange:%@ with infoDict:%@",  (uint8_t *)&v13,  0x16u);
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v6));
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingInvitationRelationships:changeType:info:]( &OBJC_CLASS___PLCloudSharingInvitationChangeJob,  "saveServerStateLocallyForSharingInvitationRelationships:changeType:info:",  v12,  3LL,  v7);
}

- (void)MSASModel:(id)a3 didFindNewAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t Log = PLPhotoSharingGetLog(v10, v11, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFindNewAccessControls:%@ inAlbum:%@ with infoDict:%@",  (uint8_t *)&v15,  0x20u);
  }

  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingACLRelationships:changeType:info:]( &OBJC_CLASS___PLCloudSharingInvitationChangeJob,  "saveServerStateLocallyForSharingACLRelationships:changeType:info:",  v8,  1LL,  v10);
}

- (void)MSASModel:(id)a3 didFindAccessControlChange:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t Log = PLPhotoSharingGetLog(v10, v11, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFindAccessControlChange:%@ inAlbum:%@ with infoDict:%@",  (uint8_t *)&v16,  0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8));
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingACLRelationships:changeType:info:]( &OBJC_CLASS___PLCloudSharingInvitationChangeJob,  "saveServerStateLocallyForSharingACLRelationships:changeType:info:",  v15,  3LL,  v10);
}

- (void)MSASModel:(id)a3 didFindDeletedAccessControl:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t Log = PLPhotoSharingGetLog(v10, v11, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFindDeletedAccessControl:%@ inAlbum:%@ with infoDict:%@",  (uint8_t *)&v16,  0x20u);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v8));
  +[PLCloudSharingInvitationChangeJob saveServerStateLocallyForSharingACLRelationships:changeType:info:]( &OBJC_CLASS___PLCloudSharingInvitationChangeJob,  "saveServerStateLocallyForSharingACLRelationships:changeType:info:",  v15,  2LL,  v10);
}

- (void)MSASModel:(id)a3 didFinishSendingInvitationByPhone:(id)a4 toAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t Log = PLPhotoSharingGetLog(v13, v14, v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138413058;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "MSASModel:didFinishSendingInvitationByPhone:%@ inAlbum:%@ info:%@ error:%@",  (uint8_t *)&v18,  0x2Au);
  }

  if (v13)
  {
    +[PLPhotoSharingHelper savePhoneInvitationFailuresForPhoneNumber:inAlbum:]( &OBJC_CLASS___PLPhotoSharingHelper,  "savePhoneInvitationFailuresForPhoneNumber:inAlbum:",  v10,  v11);
    notify_post(PLFindPhoneInvitationFailureNotification);
  }
}

- (void)MSASModel:(id)a3 didDeleteAllCommentsForAssetCollection:(id)a4 inAlbum:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t Log = PLPhotoSharingGetLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "didDeleteAllCommentsForAssetCollection %@ inAlbum: %@",  (uint8_t *)&v12,  0x16u);
  }

  uint64_t v10 = PLPhotoSharingGetLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v12, 2u);
  }
}

- (void)MSASModel:(id)a3 didFindDeletedComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t Log = PLPhotoSharingGetLog(v13, v14, v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v11 GUID]);
    int v25 = 138413058;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "didFindDeletedComments %@ forAssetCollection:%@ inAlbum: %@ info:%@",  (uint8_t *)&v25,  0x2Au);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:kMSASInfoEventIsDueToAssetCollectionDeletionKey]);
  if (!v19)
  {
    uint64_t v23 = PLPhotoSharingGetLog(v20, v21, v22);
    __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v10;
      _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "about to PLCloudSharedCommentsJob locallyProcessDeletedComments %@",  (uint8_t *)&v25,  0xCu);
    }

    +[PLCloudSharedCommentsJob locallyProcessDeletedComments:info:]( &OBJC_CLASS___PLCloudSharedCommentsJob,  "locallyProcessDeletedComments:info:",  v10,  v13);
  }
}

- (void)MSASModel:(id)a3 didFindNewComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t Log = PLPhotoSharingGetLog(v13, v14, v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v11 GUID]);
    int v21 = 138413058;
    id v22 = v10;
    __int16 v23 = 2112;
    __int16 v24 = v18;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "didFindNewComments %@ forAssetCollection:%@ inAlbum: %@ info:%@",  (uint8_t *)&v21,  0x2Au);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 GUID]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 GUID]);
  +[PLCloudSharedCommentsJob locallyProcessAddedComments:assetGUID:albumGUID:info:]( &OBJC_CLASS___PLCloudSharedCommentsJob,  "locallyProcessAddedComments:assetGUID:albumGUID:info:",  v10,  v19,  v20,  v13);
}

- (void)MSASModel:(id)a3 didFindCommentChange:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t Log = PLPhotoSharingGetLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "didFindCommentChange %@ inAssetCollection:%@ inAlbum: %@",  (uint8_t *)&v15,  0x20u);
  }

  uint64_t v13 = PLPhotoSharingGetLog();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "===== IMPLEMENT ME =====", (uint8_t *)&v15, 2u);
  }
}

- (void)MSASModel:(id)a3 didMarkAlbum:(id)a4 asHavingUnreadContent:(BOOL)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_6C08;
  v9[3] = &unk_C258;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotoSharingPlugin photoLibrary](self, "photoLibrary"));
  BOOL v13 = a5;
  id v12 = self;
  id v7 = v11;
  id v8 = v10;
  [v7 performBlockAndWait:v9];
}

- (void)MSASModel:(id)a3 didUpdateUnviewedAssetCollectionCount:(int)a4 forAlbum:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_6A80;
  v9[3] = &unk_C280;
  id v10 = a5;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotoSharingPlugin photoLibrary](self, "photoLibrary"));
  int v13 = a4;
  id v12 = self;
  id v7 = v11;
  id v8 = v10;
  [v7 performBlockAndWait:v9];
}

- (void)MSASModel:(id)a3 didMarkAssetCollection:(id)a4 asHavingUnreadComments:(BOOL)a5 inAlbum:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_68BC;
  v14[3] = &unk_C2A8;
  id v15 = v9;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotoSharingPlugin photoLibrary](self, "photoLibrary"));
  BOOL v19 = a5;
  __int16 v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v16;
  id v13 = v9;
  [v12 performBlockAndWait:v14];
}

- (void)MSASModel:(id)a3 didFindLastViewedCommentDate:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_66D8;
  v16[3] = &unk_C2D0;
  id v17 = v10;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[PLPhotoSharingPlugin photoLibrary](self, "photoLibrary"));
  id v19 = v9;
  id v20 = self;
  id v21 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v18;
  id v15 = v10;
  [v14 performBlockAndWait:v16];
}

- (void)MSASModel:(id)a3 didFindGlobalResetSyncInfo:(id)a4
{
  id v5 = a4;
  uint64_t Log = PLPhotoSharingGetLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = (id)objc_opt_class(self);
    __int16 v11 = 2112;
    id v12 = v5;
    id v8 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%@: didFindGlobalResetSyncInfo %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)MSASModel:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t Log = PLPhotoSharingGetLog(v8, v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = (id)objc_opt_class(self);
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    id v13 = v16;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: didFinishCheckingForChangesInfo %@ Error %@",  (uint8_t *)&v15,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoSharingHelper sharingPersonID](&OBJC_CLASS___PLPhotoSharingHelper, "sharingPersonID"));
  +[PLCloudSharedAssetSaveJob downloadPendingAssetsForPersonID:info:]( &OBJC_CLASS___PLCloudSharedAssetSaveJob,  "downloadPendingAssetsForPersonID:info:",  v14,  v7);
}

- (void)MSASModelDidReceiveNewServerSideConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t Log = PLPhotoSharingGetLog(v3, v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 serverSideConfiguration]);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "(server-configuration) MSASModelDidReceiveNewServerSideConfiguration %@",  (uint8_t *)&v9,  0xCu);
  }

  +[PLPhotoSharingHelper updateSharedAlbumsCachedServerConfigurationLimits]( &OBJC_CLASS___PLPhotoSharingHelper,  "updateSharedAlbumsCachedServerConfigurationLimits");
}

- (id)albumTitleAndGUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMSASAlbumMetadataNameKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 GUID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@ %@)", v5, v6));

  return v7;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
}

- (MSASServerSideModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)delegatePluginForPersonID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([(id)qword_117D8 objectForKey:v5]);
    int v9 = (PLPhotoSharingPlugin *)v6;
    if (!v6)
    {
      int v9 = objc_alloc_init(&OBJC_CLASS___PLPhotoSharingPlugin);
      -[PLPhotoSharingPlugin setPersonID:](v9, "setPersonID:", v5);
      uint64_t v10 = (void *)qword_117D8;
      if (!qword_117D8)
      {
        __int16 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v12 = (void *)qword_117D8;
        qword_117D8 = (uint64_t)v11;

        uint64_t v10 = (void *)qword_117D8;
      }

      [v10 setObject:v9 forKey:v5];
      id v13 = -[MSASServerSideModel initWithPersonID:]( objc_alloc(&OBJC_CLASS___MSASServerSideModel),  "initWithPersonID:",  v5);
      -[PLPhotoSharingPlugin setModel:](v9, "setModel:", v13);
      -[MSASServerSideModel addObserver:](v13, "addObserver:", v9);
    }

    uint64_t Log = PLPhotoSharingGetLog(v6, v7, v8);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "delegatePluginForPersonID returning plugin %@ for personID %@",  (uint8_t *)&v19,  0x16u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PLPhotoSharingPlugin model](v9, "model"));
  }

  else
  {
    uint64_t v17 = PLPhotoSharingGetLog(0LL, v3, v4);
    int v9 = (PLPhotoSharingPlugin *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_0,  (os_log_t)v9,  OS_LOG_TYPE_ERROR,  "delegatePluginForPersonID invoked with nil personID",  (uint8_t *)&v19,  2u);
    }

    id v16 = 0LL;
  }

  return v16;
}

+ (id)MSASPersonIDForPollingTriggeredByPushNotification
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoSharingHelper sharingPersonID](&OBJC_CLASS___PLPhotoSharingHelper, "sharingPersonID"));
  uint64_t Log = PLPhotoSharingGetLog(v3, v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class(a1);
    __int16 v12 = 2112;
    id v13 = v3;
    id v8 = v11;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ : MSASPersonIDForPollingTriggeredByPushNotification returning %@",  (uint8_t *)&v10,  0x16u);
  }

  return v3;
}

+ (void)didFindNewAlbum:(id)a3
{
  id v5 = a3;
  uint64_t Log = PLPhotoSharingGetLog(v5, v6, v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_opt_class(a1);
    id v11 = v10;
    __int16 v12 = NSStringFromSelector(a2);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v21 = 138412802;
    id v22 = v10;
    __int16 v23 = 2112;
    __int16 v24 = v13;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)&v21, 0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager systemLibraryURL]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "systemLibraryURL"));
  unsigned __int8 v15 = +[PLPhotoSharingHelper sharedStreamsExplictlyDisabledForPhotoLibraryURL:]( &OBJC_CLASS___PLPhotoSharingHelper,  "sharedStreamsExplictlyDisabledForPhotoLibraryURL:",  v14);

  if ((v15 & 1) != 0)
  {
    uint64_t v19 = PLPhotoSharingGetLog(v16, v17, v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "Ignoring new album because shared streams has been explicitly disabled by user",  (uint8_t *)&v21,  2u);
    }
  }

  else
  {
    +[PLPhotoSharingHelper updateLocalAlbumMetadataForMSASAlbum:info:]( &OBJC_CLASS___PLPhotoSharingHelper,  "updateLocalAlbumMetadataForMSASAlbum:info:",  v5,  0LL);
  }
}

+ (void)didFindDeletedAlbumWithGUID:(id)a3 inviterAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Log = PLPhotoSharingGetLog(v7, v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = (id)objc_opt_class(a1);
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    id v12 = v14;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ deleting album with GUID %@ inviterAddress %@",  (uint8_t *)&v13,  0x20u);
  }

  +[PLPhotoSharingHelper deleteLocalAlbumsForMSASAlbumsWithGUID:inviterAddress:]( &OBJC_CLASS___PLPhotoSharingHelper,  "deleteLocalAlbumsForMSASAlbumsWithGUID:inviterAddress:",  v6,  v7);
}

@end