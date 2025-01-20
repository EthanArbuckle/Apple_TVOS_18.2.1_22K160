@interface MADGDUtilities
+ (MADGDUtilities)sharedInstance;
+ (id)fetchKeyFaceLocalIdentifiersForPhotoLibrary:(id)a3;
+ (unint64_t)clusterFaceCountThreshold;
- (BOOL)_addFacesWithFaceBatch:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)_removeObservationIDs:(id)a3 fromGallery:(id)a4;
- (BOOL)_resetObservationIDForFaces:(id)a3 fromPhotoLibrary:(id)a4;
- (BOOL)prepareClusteringWithFaces:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)removeObservationsWithAssetLocalIdentifiers:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)syncVisualUnderstandingService:(id)a3 withPhotosLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5;
- (BOOL)updatePersonWithPhotosLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 keyFaceLocalIdentifiers:(id)a9 cancelOrExtendTimeoutBlock:(id)a10 error:(id *)a11;
- (BOOL)updatePersonWithSyndicationLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 cancelOrExtendTimeoutBlock:(id)a9 error:(id *)a10;
- (MADGDUtilities)init;
- (int)_fetchChangedPersonSinceChangeToken:(id)a3 photosLibrary:(id)a4 changedPersonLocalIdentifiers:(id *)a5 latestChangeToken:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7;
- (void)_dedupeGraphVerifiedPersonsForPerson:(id)a3 photoLibrary:(id)a4;
- (void)_deleteUnverifiedPersonsWithZeroFaces:(id)a3;
- (void)flush;
@end

@implementation MADGDUtilities

- (MADGDUtilities)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MADGDUtilities;
  v2 = -[MADGDUtilities init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("MADGDUtilities", v4);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

+ (MADGDUtilities)sharedInstance
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[VCPSharedInstanceManager sharedManager](&OBJC_CLASS___VCPSharedInstanceManager, "sharedManager"));
  v4 = (objc_class *)objc_opt_class(a1);
  dispatch_queue_t v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 sharedInstanceWithIdentifier:v6 andCreationBlock:&stru_1001BDBD0]);

  return (MADGDUtilities *)v7;
}

+ (unint64_t)clusterFaceCountThreshold
{
  return 20000LL;
}

- (void)flush
{
}

- (BOOL)_removeObservationIDs:(id)a3 fromGallery:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 7)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 134217984;
      id v30 = [v5 count];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[GallerySync] Removing %lu observation(s) from Gallery",  buf,  0xCu);
    }
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100110148;
  v27[3] = &unk_1001BDC18;
  id v13 = v5;
  id v28 = v13;
  v14 = objc_retainBlock(v27);
  id v26 = 0LL;
  unsigned __int8 v15 = [v6 mutateAndReturnError:&v26 handler:v14];

  id v16 = v26;
  v18 = v16;
  if ((v15 & 1) == 0)
  {
    uint64_t v19 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v19 >= 3)
    {
      uint64_t v21 = VCPLogInstance(v19, v20);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        id v24 = [v13 count];
        *(_DWORD *)buf = 134218242;
        id v30 = v24;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[GallerySync] Failed to remove %lu observation from Gallery %@",  buf,  0x16u);
      }
    }
  }

  return v15;
}

- (BOOL)_resetObservationIDForFaces:(id)a3 fromPhotoLibrary:(id)a4
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001105BC;
  v19[3] = &unk_1001BC6A0;
  id v5 = a3;
  id v20 = v5;
  id v18 = 0LL;
  unsigned __int8 v6 = [a4 performChangesAndWait:v19 error:&v18];
  id v7 = v18;
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((v6 & 1) != 0)
  {
    if ((int)v9 >= 7)
    {
      uint64_t v11 = VCPLogInstance(v9, v10);
      os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      os_log_type_t v13 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v12, v13))
      {
        id v14 = [v5 count];
        *(_DWORD *)buf = 134217984;
        id v22 = v14;
        unsigned __int8 v15 = "[GallerySync] Reset %lu vuObservationID(s) in Photos";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v15, buf, 0xCu);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if ((int)v9 >= 3)
  {
    uint64_t v16 = VCPLogInstance(v9, v10);
    os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v13 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      unsigned __int8 v15 = "[GallerySync] Failed to reset vuObservationID in Photos - %@";
      goto LABEL_8;
    }

- (int)_fetchChangedPersonSinceChangeToken:(id)a3 photosLibrary:(id)a4 changedPersonLocalIdentifiers:(id *)a5 latestChangeToken:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v36 = a7;
  id v13 = objc_alloc_init(&OBJC_CLASS___PHPersistentChangeFetchRequest);
  [v13 setMaximumChangeThreshold:10000];
  [v13 setToken:v11];
  id v55 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 fetchPersistentChangesWithRequest:v13 error:&v55]);
  id v15 = v55;
  uint64_t v17 = v15;
  if (v15)
  {
    uint64_t v18 = MediaAnalysisLogLevel(v15, v16);
    if ((int)v18 >= 3)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        os_log_type_t v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v17 description]);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"[GallerySync][PersonChangeToken]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v57 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "%@ Failed to fetch Photos changes since %@ (%@); falling back to full scan",
          buf,
          0x20u);
      }
    }

    int v24 = -23801;
  }

  else
  {
    id v25 = [v14 changeCount];
    if (v25)
    {
      uint64_t v27 = MediaAnalysisLogLevel(v25, v26);
      if ((int)v27 >= 6)
      {
        uint64_t v29 = VCPLogInstance(v27, v28);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        os_log_type_t v31 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v30, v31))
        {
          unsigned int v32 = [v14 changeCount];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"[GallerySync][PersonChangeToken]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@ Evaluating %d changes", buf, 0x12u);
        }
      }

      uint64_t v51 = 0LL;
      v52 = &v51;
      uint64_t v53 = 0x2020000000LL;
      int v54 = 0;
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v57 = sub_100110B70;
      v58 = sub_100110B80;
      id v59 = 0LL;
      uint64_t v45 = 0LL;
      v46 = &v45;
      uint64_t v47 = 0x3032000000LL;
      v48 = sub_100110B70;
      v49 = sub_100110B80;
      id v50 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_100110B88;
      v39[3] = &unk_1001BDC40;
      v40 = @"[GallerySync][PersonChangeToken]";
      id v41 = v36;
      v42 = &v51;
      v43 = buf;
      v44 = &v45;
      [v14 enumeratePHChangesWithBlock:v39];
      int v24 = *((_DWORD *)v52 + 6);
      if (!v24)
      {
        if (a5) {
          *a5 = (id) v46[5];
        }
        v33 = (void *)v46[5];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100110E00;
        v37[3] = &unk_1001BDC68;
        v38 = @"[GallerySync][PersonChangeToken]";
        [v33 enumerateObjectsUsingBlock:v37];
        if (a6) {
          *a6 = *(id *)(*(void *)&buf[8] + 40LL);
        }
      }

      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v51, 8);
    }

    else
    {
      int v24 = 0;
    }
  }

  return v24;
}

- (void)_deleteUnverifiedPersonsWithZeroFaces:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    uint64_t v7 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v7 >= 6)
    {
      uint64_t v9 = VCPLogInstance(v7, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      os_log_type_t v11 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138412546;
        v37 = @"[GallerySync][RemoveUnverifiedPerson]";
        __int16 v38 = 2048;
        id v39 = [v4 count];
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ Deleting %lu 0-face unverified persons", buf, 0x16u);
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibrary]);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100111170;
    v33[3] = &unk_1001BDC90;
    id v14 = v4;
    id v34 = v14;
    SEL v35 = a2;
    id v32 = 0LL;
    unsigned __int8 v15 = [v13 performChangesAndWait:v33 error:&v32];
    id v16 = v32;

    uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
    if ((v15 & 1) != 0)
    {
      if ((int)v19 >= 7)
      {
        uint64_t v21 = VCPLogInstance(v19, v20);
        os_log_type_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        os_log_type_t v23 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v22, v23))
        {
          id v24 = [v14 count];
          *(_DWORD *)buf = 138412546;
          v37 = @"[GallerySync][RemoveUnverifiedPerson]";
          __int16 v38 = 2048;
          id v39 = v24;
          id v25 = "%@ Deleted %lu 0-face unverified persons";
          uint64_t v26 = v22;
          os_log_type_t v27 = v23;
          uint32_t v28 = 22;
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
          goto LABEL_14;
        }

        goto LABEL_14;
      }
    }

    else if ((int)v19 >= 3)
    {
      uint64_t v29 = VCPLogInstance(v19, v20);
      os_log_type_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v30))
      {
        id v31 = [v14 count];
        *(_DWORD *)buf = 138412802;
        v37 = @"[GallerySync][RemoveUnverifiedPerson]";
        __int16 v38 = 2048;
        id v39 = v31;
        __int16 v40 = 2112;
        id v41 = v16;
        id v25 = "%@ Failed to delete %lu 0-face unverified persons - %@";
        uint64_t v26 = v22;
        os_log_type_t v27 = v30;
        uint32_t v28 = 32;
        goto LABEL_13;
      }

- (BOOL)syncVisualUnderstandingService:(id)a3 withPhotosLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vcp_description"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[GallerySync] Syncing VU Service w PL %@",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v13 addBreadcrumb:@"%@", v12];

  operationQueue = (dispatch_queue_s *)self->_operationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011139C;
  block[3] = &unk_1001BDE20;
  id v20 = v9;
  uint64_t v21 = self;
  id v23 = v10;
  id v24 = &v25;
  id v22 = v8;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(operationQueue, block);
  LOBYTE(v10) = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return (char)v10;
}

- (BOOL)_addFacesWithFaceBatch:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibrary]);

  int v54 = v10;
  if (v13)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vcp_description"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[GalleryAddFace][%@]",  v16));

    uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
    if ((int)v20 >= 6)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412546;
        id v66 = v17;
        __int16 v67 = 2048;
        id v68 = [v9 count];
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ Adding %lu faces to Gallery", buf, 0x16u);
      }
    }

    v52 = a6;
    uint64_t v64 = PHAssetPropertySetImport;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:]( &OBJC_CLASS___PHAsset,  "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:",  v9,  v25));
    if ([v26 count])
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v13 librarySpecificFetchOptions]);
      char v28 = (void *)objc_claimAutoreleasedReturnValue([v26 allValues]);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[PHMoment fetchMomentUUIDByAssetUUIDForAssets:options:]( &OBJC_CLASS___PHMoment,  "fetchMomentUUIDByAssetUUIDForAssets:options:",  v28,  v27));
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_100118AA0;
    v56[3] = &unk_1001BDE70;
    id v40 = v13;
    id v57 = v40;
    id v58 = v9;
    id v53 = v11;
    id v63 = v11;
    id v36 = v17;
    id v59 = v36;
    id v38 = v26;
    id v60 = v38;
    id v41 = v29;
    id v61 = v41;
    id v62 = v10;
    v42 = objc_retainBlock(v56);
    id v55 = 0LL;
    unsigned __int8 v39 = [v40 performCancellableChangesAndWait:v42 error:&v55];
    id v43 = v55;
    uint64_t v45 = v43;
    if ((v39 & 1) == 0)
    {
      uint64_t v46 = MediaAnalysisLogLevel(v43, v44);
      if ((int)v46 >= 3)
      {
        uint64_t v48 = VCPLogInstance(v46, v47);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        os_log_type_t type = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v49, type))
        {
          *(_DWORD *)buf = 138412546;
          id v66 = v36;
          __int16 v67 = 2112;
          id v68 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  type,  "%@ Failed to update face ObservationIDs from Gallery to Photos - %@",  buf,  0x16u);
        }
      }

      if (v52) {
        id *v52 = [v45 copy];
      }
    }

    id v11 = v53;
  }

  else
  {
    uint64_t v30 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v30 >= 3)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v33, v34))
      {
        SEL v35 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
        *(_DWORD *)buf = 138412290;
        id v66 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "[GalleryAddFace] Nil photo library for face %@", buf, 0xCu);
      }
    }

    if (!a6)
    {
      unsigned __int8 v39 = 0;
      goto LABEL_24;
    }

    NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
    id v36 = (id)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    v37 = a6;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[GalleryAddFace] Nil photo library for face %@",  v36));
    v70 = v25;
    id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
    unsigned __int8 v39 = 0;
    id *v37 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v38));
  }

LABEL_24:
  return v39;
}

- (BOOL)prepareClusteringWithFaces:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100110B70;
  os_log_type_t v34 = sub_100110B80;
  id v35 = 0LL;
  operationQueue = (dispatch_queue_s *)self->_operationQueue;
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = sub_100119FC0;
  id v23 = &unk_1001BDE98;
  id v14 = v10;
  id v24 = v14;
  uint64_t v25 = self;
  id v15 = v11;
  id v26 = v15;
  id v16 = v12;
  id v27 = v16;
  char v28 = &v30;
  uint64_t v29 = &v36;
  dispatch_sync(operationQueue, &v20);
  if (a6)
  {
    id v17 = (void *)v31[5];
    if (v17) {
      *a6 = objc_msgSend(v17, "copy", v20, v21, v22, v23, v24, v25, v26);
    }
  }

  char v18 = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

- (BOOL)removeObservationsWithAssetLocalIdentifiers:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  operationQueue = (dispatch_queue_s *)self->_operationQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10011A478;
  v15[3] = &unk_1001BDEC0;
  id v16 = v9;
  id v17 = v10;
  char v18 = &v20;
  uint64_t v19 = a6;
  id v12 = v10;
  id v13 = v9;
  dispatch_sync(operationQueue, v15);
  LOBYTE(operationQueue) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)operationQueue;
}

- (void)_dedupeGraphVerifiedPersonsForPerson:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mad_allPersonsFetchOptions"));
  id v94 = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v94, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PHPerson fetchPersonsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHPerson,  "fetchPersonsWithLocalIdentifiers:options:",  v8,  v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  if (v10)
  {
    id v13 = [v10 verifiedType];
    if (v13 == (id)1 || (id v13 = [v10 verifiedType], v13 == (id)2))
    {
      uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
      if ((int)v15 >= 7)
      {
        uint64_t v17 = VCPLogInstance(v15, v16);
        char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        os_log_type_t v19 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          id v90 = v5;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "[VUDedupe] Checking person %@", buf, 0xCu);
        }
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mad_allFacesFetchOptions"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(trainingType = %d) || (trainingType = %d)",  1LL,  5LL));
      [v20 setInternalPredicate:v21];

      v93[0] = PHFacePropertySetIdentifier;
      v93[1] = PHFacePropertySetPersonBuilder;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 2LL));
      [v20 setFetchPropertySets:v22];

      char v23 = (void *)objc_claimAutoreleasedReturnValue( +[PHFace fetchFacesForPerson:options:]( &OBJC_CLASS___PHFace,  "fetchFacesForPerson:options:",  v10,  v20));
      if (![v23 count])
      {
        uint64_t v55 = MediaAnalysisLogLevel(0LL, v24);
        if ((int)v55 < 3)
        {
LABEL_48:

          goto LABEL_49;
        }

        uint64_t v57 = VCPLogInstance(v55, v56);
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        os_log_type_t v58 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v25, v58))
        {
          *(_DWORD *)buf = 138412290;
          id v90 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  v58,  "[VUDedupe] Person has no training face %@; ignoring",
            buf,
            0xCu);
        }

- (BOOL)updatePersonWithPhotosLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 keyFaceLocalIdentifiers:(id)a9 cancelOrExtendTimeoutBlock:(id)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  char v51 = 0;
  queue = (dispatch_queue_s *)self->_operationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011B3F8;
  block[3] = &unk_1001BDF38;
  uint64_t v46 = &v48;
  uint64_t v47 = a11;
  id v37 = v19;
  id v38 = v20;
  id v39 = v21;
  id v40 = v17;
  id v41 = v22;
  id v42 = v18;
  id v43 = v23;
  uint64_t v44 = self;
  id v45 = v24;
  id v25 = v23;
  id v26 = v18;
  id v27 = v22;
  id v28 = v17;
  id v29 = v21;
  id v30 = v20;
  id v31 = v19;
  id v32 = v24;
  dispatch_sync(queue, block);
  char v33 = *((_BYTE *)v49 + 24);

  _Block_object_dispose(&v48, 8);
  return v33;
}

- (BOOL)updatePersonWithSyndicationLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 cancelOrExtendTimeoutBlock:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  operationQueue = (dispatch_queue_s *)self->_operationQueue;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10011DF04;
  v29[3] = &unk_1001BDF60;
  id v30 = v16;
  id v31 = v17;
  id v32 = v19;
  id v33 = v18;
  uint64_t v36 = &v38;
  id v37 = a10;
  id v34 = v15;
  id v35 = v20;
  id v22 = v15;
  id v23 = v18;
  id v24 = v19;
  id v25 = v17;
  id v26 = v16;
  id v27 = v20;
  dispatch_sync(operationQueue, v29);
  LOBYTE(operationQueue) = *((_BYTE *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  return (char)operationQueue;
}

+ (id)fetchKeyFaceLocalIdentifiersForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v29 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:",  0,  &off_1001C93D8));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](&OBJC_CLASS___PHPerson, "fetchPersonsWithOptions:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mad_allFacesFetchOptions"));
  [v5 setIncludeNonvisibleFaces:0];
  id v28 = (void *)v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PHFace fetchKeyFaceByPersonLocalIdentifierForPersons:options:]( &OBJC_CLASS___PHFace,  "fetchKeyFaceByPersonLocalIdentifierForPersons:options:",  v4,  v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v27 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_autoreleasePoolPush();
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 localIdentifier]);

        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 localIdentifier]);
          [v7 addObject:v16];
        }

        objc_autoreleasePoolPop(v14);
      }

      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v10);
  }

  uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
  if ((int)v19 >= 7)
  {
    uint64_t v21 = VCPLogInstance(v19, v20);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    os_log_type_t v23 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = [v7 count];
      id v25 = [v28 count];
      *(_DWORD *)buf = 134218240;
      id v35 = v24;
      __int16 v36 = 2048;
      id v37 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[Fetch KeyFaces] Fetched %lu key face(s) for %lu verified person(s)",  buf,  0x16u);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end