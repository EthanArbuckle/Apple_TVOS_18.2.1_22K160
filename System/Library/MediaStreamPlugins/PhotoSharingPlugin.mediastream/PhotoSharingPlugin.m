LABEL_30:
          v14 = v74;
          v13 = v75;
          v51 = v69;
LABEL_31:

LABEL_32:
LABEL_33:

          goto LABEL_34;
        }
      }

      v72 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 GUID]);
      v59 = PLPhotoSharingGetLog(v72, v57, v58);
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue([v12 GUID]);
        *(_DWORD *)buf = 138413058;
        v78 = v38;
        v79 = 2112;
        v80 = v15;
        v81 = 2112;
        v82 = v72;
        v83 = 2112;
        v84 = v61;
        _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_DEFAULT,  "about to PLCloudSharedAssetSaveJob saveCloudSharedAssetAtPath %@ collectionGUID %@  guidOfCurrentAssetInCollec tion %@ albumGUID %@",  buf,  0x2Au);
      }

      v62 = [v11 mediaAssetType];
      v63 = v38;
      v64 = (void *)objc_claimAutoreleasedReturnValue([v12 GUID]);
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoSharingHelper sharingPersonID](&OBJC_CLASS___PLPhotoSharingHelper, "sharingPersonID"));
      LOBYTE(v68) = v73;
      +[PLCloudSharedAssetSaveJob saveCloudSharedAssetAtPath:forAssetCollection:mediaAssetType:albumGUID:personID:info:shouldPrioritize:]( &OBJC_CLASS___PLCloudSharedAssetSaveJob,  "saveCloudSharedAssetAtPath:forAssetCollection:mediaAssetType:albumGUID:personID:info:shouldPrioritize:",  v63,  v35,  v62,  v64,  v65,  0LL,  v68);

      v38 = v63;
      goto LABEL_30;
    }

    v48 = PLPhotoSharingGetLog(v30, v31, v32);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v45 = "ERROR: asset path is nil";
      v46 = v35;
      v47 = 2;
      goto LABEL_21;
    }
  }

  else
  {
    v44 = PLPhotoSharingGetLog(v24, v25, v26);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v78 = 0LL;
      v45 = "ERROR: can't proceed because we don't have an assetCollection for collectionGUID %@";
      v46 = v35;
      v47 = 12;
LABEL_21:
      _os_log_impl(&dword_0, v46, OS_LOG_TYPE_ERROR, v45, buf, v47);
    }
  }

LABEL_34:
}

LABEL_23:
LABEL_24:
          v42 = (void *)objc_claimAutoreleasedReturnValue([v25 assets]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v42 lastObject]);

          goto LABEL_25;
        }

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 assets]);
        v33 = -[os_log_s countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v72,  v91,  16LL);
        if (!v33) {
          goto LABEL_23;
        }
        v34 = v33;
        v35 = v12;
        v36 = 0LL;
        v37 = *(void *)v73;
        do
        {
          for (j = 0LL; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v73 != v37) {
              objc_enumerationMutation(v32);
            }
            v39 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)j);
            if (([v39 isVideo] & 1) == 0)
            {
              v40 = v39;

              v36 = v40;
            }
          }

          v34 = -[os_log_s countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v72,  v91,  16LL);
        }

        while (v34);

        v12 = v35;
        v23 = v63;
        if (!v36) {
          goto LABEL_24;
        }
LABEL_25:
        v43 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v36 path]);
        v44 = -[NSFileManager fileExistsAtPath:](v23, "fileExistsAtPath:", v43);
        if (v44)
        {
          [v25 setMetadataValue:0 forKey:v66];
          v47 = [v25 isVideo];
          v48 = [v25 isVideo] | v26;
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          if (v48 == 1)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoSharingHelper videoDerivativesForAssetCollection:withSpecifications:]( &OBJC_CLASS___PLPhotoSharingHelper,  "videoDerivativesForAssetCollection:withSpecifications:",  v25,  v64));
            if ([v50 count]) {
              [v49 addObjectsFromArray:v50];
            }
          }

          if ((v47 & 1) == 0)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoSharingHelper derivativesForMasterAsset:withSpecifications:]( &OBJC_CLASS___PLPhotoSharingHelper,  "derivativesForMasterAsset:withSpecifications:",  v36,  v65));
            if ([v51 count]) {
              [v49 addObjectsFromArray:v51];
            }
          }

          if ([v49 count]) {
            [v25 setAssets:v49];
          }
        }

        else
        {
          v52 = PLPhotoSharingGetLog(v44, v45, v46);
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v43;
            _os_log_impl( &dword_0,  v53,  OS_LOG_TYPE_DEFAULT,  "Master asset at path %@ no longer exists, skipping",  buf,  0xCu);
          }

          -[NSMutableArray addObject:](v67, "addObject:", v25);
          -[NSMutableArray removeObject:](v68, "removeObject:", v25);
        }
      }

      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v76,  v92,  16LL);
    }

    while (v71);
  }

  v57 = PLPhotoSharingGetLog(v54, v55, v56);
  v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138413058;
    v84 = v68;
    v85 = 2112;
    v86 = v67;
    v87 = 2112;
    v88 = v61;
    v89 = 2048;
    v90 = v59 - Current;
    _os_log_impl( &dword_0,  v58,  OS_LOG_TYPE_DEFAULT,  "about to call completionBlock with computedAssetCollections %@ rejectedAssetCollections %@ info %@ elapsed time %f",  buf,  0x2Au);
  }

  v60[2](v60, v68, v67, v61);
  +[PLPhotoSharingHelper writeUploadDebugBreadcrumbForAssetCollections:state:error:]( &OBJC_CLASS___PLPhotoSharingHelper,  "writeUploadDebugBreadcrumbForAssetCollections:state:error:",  v68,  120LL,  0LL);
}

void sub_66D8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) GUID]);
  v30 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:]( &OBJC_CLASS___PLManagedAsset,  "cloudSharedAssetsWithGUIDs:inLibrary:",  v3,  *(void *)(a1 + 40)));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudLastViewedCommentDate]);
  v7 = v6;
  if (v5)
  {
    id v8 = [v6 timeIntervalSinceDate:*(void *)(a1 + 48)];
    if (fabs(v11) > 1.0)
    {
      uint64_t Log = PLPhotoSharingGetLog(v8, v9, v10);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_opt_class(*(void *)(a1 + 56));
        uint64_t v15 = *(void *)(a1 + 48);
        v16 = *(void **)(a1 + 32);
        id v17 = v14;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 GUID]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) albumTitleAndGUID:*(void *)(a1 + 64)]);
        int v20 = 138413314;
        v21 = v14;
        __int16 v22 = 2112;
        v23 = v7;
        __int16 v24 = 2112;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        v27 = v18;
        __int16 v28 = 2112;
        v29 = v19;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "%@(Last-viewed management): currentLastViewedCommentDate %@ didFindLastViewedCommentDate %@ forAssetCollection:%@ inAlbum:%@",  (uint8_t *)&v20,  0x34u);
      }

      +[PLCloudSharingViewedStateChangeJob setLastViewedCommentDate:forAssetCollection:inAlbum:]( &OBJC_CLASS___PLCloudSharingViewedStateChangeJob,  "setLastViewedCommentDate:forAssetCollection:inAlbum:",  *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(void *)(a1 + 64));
    }
  }
}

void sub_68BC(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) GUID]);
  uint64_t v25 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:]( &OBJC_CLASS___PLManagedAsset,  "cloudSharedAssetsWithGUIDs:inLibrary:",  v3,  *(void *)(a1 + 40)));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  if (v5)
  {
    id v6 = [v5 cloudHasUnseenComments];
    if (*(unsigned __int8 *)(a1 + 64) != (_DWORD)v6)
    {
      uint64_t Log = PLPhotoSharingGetLog(v6, v7, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = (void *)objc_opt_class(*(void *)(a1 + 48));
        v12 = *(void **)(a1 + 32);
        id v13 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 GUID]);
        int v15 = *(unsigned __int8 *)(a1 + 64);
        v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) albumTitleAndGUID:*(void *)(a1 + 56)]);
        int v17 = 138413058;
        v18 = v11;
        __int16 v19 = 2112;
        int v20 = v14;
        __int16 v21 = 1024;
        int v22 = v15;
        __int16 v23 = 2112;
        __int16 v24 = v16;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%@(Last-viewed management): didMarkAssetCollection %@ asHavingUnreadComments:%i inAlbum:%@",  (uint8_t *)&v17,  0x26u);
      }

      +[PLCloudSharingViewedStateChangeJob markAssetCollection:asHavingUnreadComments:inAlbum:]( &OBJC_CLASS___PLCloudSharingViewedStateChangeJob,  "markAssetCollection:asHavingUnreadComments:inAlbum:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 64),  *(void *)(a1 + 56));
    }
  }
}

void sub_6A80(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) GUID]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:]( &OBJC_CLASS___PLCloudSharedAlbum,  "cloudSharedAlbumWithGUID:inLibrary:",  v2,  *(void *)(a1 + 40)));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 unseenAssetsCount]);
    id v6 = [v5 integerValue];
    id v7 = (id)*(int *)(a1 + 56);

    if (v6 != v7)
    {
      uint64_t Log = PLPhotoSharingGetLog(v8, v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_opt_class(*(void *)(a1 + 48));
        int v14 = *(_DWORD *)(a1 + 56);
        int v15 = *(void **)(a1 + 48);
        uint64_t v16 = *(void *)(a1 + 32);
        id v17 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v15 albumTitleAndGUID:v16]);
        int v19 = 138412802;
        int v20 = v13;
        __int16 v21 = 1024;
        int v22 = v14;
        __int16 v23 = 2112;
        __int16 v24 = v18;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%@(Last-viewed management): didUpdateUnviewedAssetCollectionCount %i forAlbum:%@",  (uint8_t *)&v19,  0x1Cu);
      }

      +[PLCloudSharingViewedStateChangeJob updateUnviewedAssetCollectionCount:forAlbum:]( &OBJC_CLASS___PLCloudSharingViewedStateChangeJob,  "updateUnviewedAssetCollectionCount:forAlbum:",  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 32));
    }
  }
}

void sub_6C08(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) GUID]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:]( &OBJC_CLASS___PLCloudSharedAlbum,  "cloudSharedAlbumWithGUID:inLibrary:",  v2,  *(void *)(a1 + 40)));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 hasUnseenContent]);
    unsigned int v6 = [v5 BOOLValue];
    int v7 = *(unsigned __int8 *)(a1 + 56);

    if (v7 != v6)
    {
      uint64_t Log = PLPhotoSharingGetLog(v8, v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_opt_class(*(void *)(a1 + 48));
        int v14 = *(void **)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = v13;
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 albumTitleAndGUID:v15]);
        int v18 = *(unsigned __int8 *)(a1 + 56);
        int v19 = 138412802;
        int v20 = v13;
        __int16 v21 = 2112;
        int v22 = v17;
        __int16 v23 = 1024;
        int v24 = v18;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%@(Last-viewed management): didMarkAlbum %@ asHavingUnreadContent:%i",  (uint8_t *)&v19,  0x1Cu);
      }

      +[PLCloudSharingViewedStateChangeJob markAlbum:asHavingUnseenContent:]( &OBJC_CLASS___PLCloudSharingViewedStateChangeJob,  "markAlbum:asHavingUnseenContent:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 56));
    }
  }
}

void sub_6D88(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MSImageScalingSpecification);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
LABEL_5:
    [v5 addObject:v3];
    goto LABEL_9;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MSVideoDerivativeSpecification);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v3, v6);
  if ((isKindOfClass & 1) != 0)
  {
    v5 = *(void **)(a1 + 40);
    goto LABEL_5;
  }

  uint64_t Log = PLPhotoSharingGetLog(isKindOfClass, v8, v9);
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Unknown derivative specification: %@", (uint8_t *)&v12, 0xCu);
  }

LABEL_9:
}

id objc_msgSend_replaceRecentlyUploadedOriginalWithDerivativeForCollection_inAlbum_personID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceRecentlyUploadedOriginalWithDerivativeForCollection:inAlbum:personID:");
}

id objc_msgSend_saveCloudSharedAssetAtPath_forAssetCollection_mediaAssetType_albumGUID_personID_info_shouldPrioritize_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "saveCloudSharedAssetAtPath:forAssetCollection:mediaAssetType:albumGUID:personID:info:shouldPrioritize:");
}

id objc_msgSend_writeUploadDebugBreadcrumbForAssetCollections_state_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUploadDebugBreadcrumbForAssetCollections:state:error:");
}