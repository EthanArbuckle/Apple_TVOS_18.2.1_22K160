@interface MADPhotosFaceFastPassProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADPhotosFaceFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (int)_requestAssetResource:(id)a3;
@end

@implementation MADPhotosFaceFastPassProcessingTask

- (MADPhotosFaceFastPassProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000C0A70;
  v19[3] = &unk_1001BADE0;
  id v10 = a5;
  id v20 = v10;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MADPhotosFaceFastPassProcessingTask;
  v11 = -[MADPhotosFaceFastPassProcessingTask initWithCompletionHandler:](&v18, "initWithCompletionHandler:", v19);
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_1001BCE50;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    dispatch_group_t v15 = dispatch_group_create();
    downloadGroup = v11->_downloadGroup;
    v11->_downloadGroup = (OS_dispatch_group *)v15;

    -[MADPhotosFaceFastPassProcessingTask setCancelBlock:](v11, "setCancelBlock:", v8);
  }

  return v11;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 andCompletionHandler:v10];

  return v11;
}

- (int)_requestAssetResource:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetLocalIdentifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Face-FP][Download][%@]",  v5));

  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v6;
      __int16 v39 = 2112;
      id v40 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Attempt to download resource: %@", buf, 0x16u);
    }
  }

  v14 = objc_alloc_init(&OBJC_CLASS___PHAssetResourceRequestOptions);
  -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v14, "setNetworkAccessAllowed:", 1LL);
  -[PHAssetResourceRequestOptions setDownloadPriority:](v14, "setDownloadPriority:", 0LL);
  -[PHAssetResourceRequestOptions setDownloadIntent:](v14, "setDownloadIntent:", 2LL);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000C0EB8;
  v35[3] = &unk_1001BC570;
  id v15 = v6;
  id v36 = v15;
  -[PHAssetResourceRequestOptions setProgressHandler:](v14, "setProgressHandler:", v35);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000C0F94;
  v33[3] = &unk_1001BCE78;
  id v16 = v15;
  id v34 = v16;
  v17 = objc_retainBlock(v33);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000C105C;
  v30[3] = &unk_1001BCEA0;
  id v18 = v16;
  id v31 = v18;
  v32 = self;
  v19 = objc_retainBlock(v30);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetResourceManager defaultManager](&OBJC_CLASS___PHAssetResourceManager, "defaultManager"));
  int v21 = [v20 requestFileURLForAssetResource:v4 options:v14 urlReceivedHandler:v17 completionHandler:v19];

  if (!v21)
  {
    uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v24 >= 3)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v18;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Failed to issue download request", buf, 0xCu);
      }
    }
  }

  return v21;
}

- (BOOL)run:(id *)a3
{
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 5)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"[Face-FP]";
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Running MADPhotosFaceFastPassTask ... ", buf, 0xCu);
    }
  }

  uint64_t v9 = VCPSignPostLog(v4);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v13 = VCPSignPostLog(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "MADPhotosFaceFastPassProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary systemPhotoLibraryURL](&OBJC_CLASS___PHPhotoLibrary, "systemPhotoLibraryURL"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 photoLibraryWithURL:v17]);

  if (!v18)
  {
    NSErrorUserInfoKey v243 = NSLocalizedDescriptionKey;
    v71 = (void *)objc_claimAutoreleasedReturnValue([0 photoLibraryURL]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 path]);
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to open Photo Library (%@)",  @"[Face-FP]",  v72));
    v244 = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v244,  &v243,  1LL));
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v74));

    uint64_t v77 = MediaAnalysisLogLevel(v75, v76);
    if ((int)v77 >= 3)
    {
      uint64_t v79 = VCPLogInstance(v77, v78);
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      os_log_type_t v81 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v80, v81))
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v82;
        _os_log_impl((void *)&_mh_execute_header, v80, v81, "%@", buf, 0xCu);
      }
    }

    if (!a3) {
      goto LABEL_43;
    }
LABEL_37:
    id v21 = v21;
    BOOL v70 = 0;
    id v24 = *a3;
    *a3 = v21;
LABEL_129:

    goto LABEL_130;
  }

  if ([v18 isReadyForAnalysisCPLInitialDownloadCompleted])
  {
    if ([v18 isCloudPhotoLibraryEnabled])
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPInternetReachability sharedInstance](&OBJC_CLASS___VCPInternetReachability, "sharedInstance"));
      [v19 hasWifiOrEthernetConnection];
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v20 pet];

    id v21 = (id)objc_claimAutoreleasedReturnValue([v18 librarySpecificFetchOptions]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(verifiedType = %ld) OR (verifiedType = %ld)",  1LL,  2LL));
    [v21 setPredicate:v22];

    [v21 setMinimumVerifiedFaceCount:1];
    [v21 setIncludedDetectionTypes:&off_1001C9180];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v23 addBreadcrumb:@"%@ Fetching verified persons with fetchOptions: %@", @"[Face-FP]", v21];

    id v24 = (id)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](&OBJC_CLASS___PHPerson, "fetchPersonsWithOptions:", v21));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v25 addBreadcrumb:@"%@ Fetched %lu verified persons", @"[Face-FP]", objc_msgSend(v24, "count")];

    if (![v24 count])
    {
      uint64_t v95 = MediaAnalysisLogLevel(0LL, v26);
      if ((int)v95 >= 5)
      {
        uint64_t v97 = VCPLogInstance(v95, v96);
        v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
        os_log_type_t v99 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v98, v99))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          _os_log_impl( (void *)&_mh_execute_header,  v98,  v99,  "%@ No verified person (with visible face); exit",
            buf,
            0xCu);
        }
      }

      v100 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[MADPhotosFaceFastPassProcessingTask completionHandler]( self,  "completionHandler"));
      v100[2](v100, 0LL, 0LL);

      BOOL v70 = 1;
      goto LABEL_129;
    }

    uint64_t v233 = 0LL;
    v234 = &v233;
    uint64_t v235 = 0x2050000000LL;
    v27 = (void *)qword_1001E6608;
    uint64_t v236 = qword_1001E6608;
    if (!qword_1001E6608)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1000C310C;
      uint64_t v238 = (uint64_t)&unk_1001B9F10;
      v239[0] = &v233;
      sub_1000C310C((uint64_t)buf);
      v27 = (void *)v234[3];
    }

    os_log_type_t v28 = v27;
    _Block_object_dispose(&v233, 8);
    id v29 = objc_alloc(v28);
    uint64_t v233 = 0LL;
    v234 = &v233;
    uint64_t v235 = 0x2050000000LL;
    v30 = (void *)qword_1001E6618;
    uint64_t v236 = qword_1001E6618;
    if (!qword_1001E6618)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1000C320C;
      uint64_t v238 = (uint64_t)&unk_1001B9F10;
      v239[0] = &v233;
      sub_1000C320C((uint64_t)buf);
      v30 = (void *)v234[3];
    }

    id v31 = v30;
    _Block_object_dispose(&v233, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 photos]);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vcp_visionCacheStorageDirectoryURL"));
    id v232 = 0LL;
    id v217 = [v29 initWithClient:v32 version:1 url:v33 error:&v232];
    id v215 = v232;

    if (!v217)
    {
      uint64_t v101 = MediaAnalysisLogLevel(v34, v35);
      if ((int)v101 < 3)
      {
        BOOL v70 = 0;
LABEL_128:

        goto LABEL_129;
      }

      uint64_t v103 = VCPLogInstance(v101, v102);
      v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
      os_log_type_t v105 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v104, v105))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v215;
        _os_log_impl((void *)&_mh_execute_header, v104, v105, "%@ Failed to load Gallery - %@", buf, 0x16u);
      }

      BOOL v70 = 0;
LABEL_127:

      goto LABEL_128;
    }

    uint64_t v36 = VCPSignPostLog(v34);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    os_signpost_id_t v38 = os_signpost_id_generate(v37);

    uint64_t v40 = VCPSignPostLog(v39);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    v42 = v41;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v42,  OS_SIGNPOST_INTERVAL_BEGIN,  v38,  "MADPhotosFaceFastPassProcessingTask_FaceCrop",  (const char *)&unk_100199097,  buf,  2u);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue([v217 gallery]);
    v211 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:andGallery:]( &OBJC_CLASS___MADPhotosFaceCropProcessingTask,  "taskWithPhotoLibrary:andGallery:",  v18,  v43));

    v231[0] = _NSConcreteStackBlock;
    v231[1] = 3221225472LL;
    v231[2] = sub_1000C2D2C;
    v231[3] = &unk_1001B9E98;
    v231[4] = self;
    [v211 setCancelBlock:v231];
    [v211 process];
    uint64_t v44 = (*((uint64_t (**)(double))self->_progressHandler + 2))(25.0);
    uint64_t v45 = VCPSignPostLog(v44);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    v47 = v46;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v38,  "MADPhotosFaceFastPassProcessingTask_FaceCrop",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v49 = VCPSignPostLog(v48);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    os_signpost_id_t v51 = os_signpost_id_generate(v50);

    uint64_t v53 = VCPSignPostLog(v52);
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    v55 = v54;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_BEGIN,  v51,  "MADPhotosFaceFastPassProcessingTask_KeyFace",  (const char *)&unk_100199097,  buf,  2u);
    }

    v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mad_allFacesFetchOptions"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v56 addBreadcrumb:@"%@ Fetching verified person faces with fetchOptions: %@", @"[Face-FP]", v214];

    v213 = (void *)objc_claimAutoreleasedReturnValue( +[PHFace fetchKeyFaceByPersonLocalIdentifierForPersons:options:]( &OBJC_CLASS___PHFace,  "fetchKeyFaceByPersonLocalIdentifierForPersons:options:",  v24,  v214));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v57 addBreadcrumb:@"%@ Fetched %lu verified person faces", @"[Face-FP]", objc_msgSend(v213, "count")];

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v58 addBreadcrumb:@"%@ Fetching assets by verified faces", @"[Face-FP]"];

    v59 = (void *)objc_claimAutoreleasedReturnValue([v213 allValues]);
    v212 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:]( &OBJC_CLASS___PHAsset,  "fetchAssetsGroupedByFaceUUIDForFaces:",  v59));

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v60 addBreadcrumb:@"%@ Fetched %lu assets by verified faces", @"[Face-FP]", objc_msgSend(v212, "count")];

    v229[0] = _NSConcreteStackBlock;
    v229[1] = 3221225472LL;
    v229[2] = sub_1000C2D34;
    v229[3] = &unk_1001BCEC8;
    id v210 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v230 = v210;
    [v212 enumerateKeysAndObjectsUsingBlock:v229];
    v61 = objc_alloc(&OBJC_CLASS___VCPMADQuickFaceIDAssetProcessingTask);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v18 photoLibraryURL]);
    v228[0] = _NSConcreteStackBlock;
    v228[1] = 3221225472LL;
    v228[2] = sub_1000C2D8C;
    v228[3] = &unk_1001B9E98;
    v228[4] = self;
    v209 = -[VCPMADQuickFaceIDAssetProcessingTask initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:]( v61,  "initWithLocalIdentifiers:fromPhotoLibraryWithURL:cancelBlock:progressHandler:completionHandler:",  v210,  v62,  v228,  0LL,  &stru_1001BCEE8);

    id v63 = -[VCPMADQuickFaceIDAssetProcessingTask run](v209, "run");
    if ((_DWORD)v63)
    {
      uint64_t v65 = MediaAnalysisLogLevel(v63, v64);
      if ((int)v65 < 3)
      {
        BOOL v70 = 0;
LABEL_126:

        v104 = (os_log_s *)v211;
        goto LABEL_127;
      }

      uint64_t v67 = VCPLogInstance(v65, v66);
      v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      os_log_type_t v69 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v68, v69))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v215;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  v69,  "%@ Failed to analyze key faces from assets  - %@",  buf,  0x16u);
      }

      BOOL v70 = 0;
LABEL_125:

      goto LABEL_126;
    }

    uint64_t v106 = VCPSignPostLog(v63);
    v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
    v108 = v107;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v108,  OS_SIGNPOST_INTERVAL_END,  v51,  "MADPhotosFaceFastPassProcessingTask_KeyFace",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v109 = (*((uint64_t (**)(double))self->_progressHandler + 2))(50.0);
    uint64_t v110 = VCPSignPostLog(v109);
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
    os_signpost_id_t spid = os_signpost_id_generate(v111);

    uint64_t v113 = VCPSignPostLog(v112);
    v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
    v115 = v114;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v114))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v115,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "MADPhotosFaceFastPassProcessingTask_UVCluster",  (const char *)&unk_100199097,  buf,  2u);
    }

    v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mad_unclusteredFacesFetchOptions"));
    v240[0] = PHFacePropertySetIdentifier;
    v240[1] = PHFacePropertySetCore;
    v240[2] = PHFacePropertySetClustering;
    v240[3] = PHFacePropertySetPersonBuilder;
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v240, 4LL));
    [v208 setFetchPropertySets:v116];

    v117 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v117 addBreadcrumb:@"%@ Fetching unclustered face assets with fetchOptions: %@", @"[Face-FP]", v208];

    v207 = (void *)objc_claimAutoreleasedReturnValue(+[PHFace fetchFacesWithOptions:](&OBJC_CLASS___PHFace, "fetchFacesWithOptions:", v208));
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
    [v118 addBreadcrumb:@"%@ Fetched %d unclustered face assets", @"[Face-FP]", objc_msgSend(v207, "count")];

    if ([v207 count])
    {
      v227[0] = _NSConcreteStackBlock;
      v227[1] = 3221225472LL;
      v227[2] = sub_1000C2D98;
      v227[3] = &unk_1001B9E98;
      v227[4] = self;
      p_isa = objc_retainBlock(v227);
      v121 = (void *)objc_claimAutoreleasedReturnValue(+[MADGDUtilities sharedInstance](&OBJC_CLASS___MADGDUtilities, "sharedInstance"));
      v122 = (void *)objc_claimAutoreleasedReturnValue([v217 gallery]);
      id v226 = v215;
      unsigned __int8 v123 = [v121 prepareClusteringWithFaces:v207 gallery:v122 cancelOrExtendTimeoutBlock:p_isa error:&v226];
      id v206 = v226;

      if ((v123 & 1) == 0)
      {
        uint64_t v184 = MediaAnalysisLogLevel(v124, v125);
        if ((int)v184 >= 3)
        {
          uint64_t v186 = VCPLogInstance(v184, v185);
          v187 = (os_log_s *)objc_claimAutoreleasedReturnValue(v186);
          os_log_type_t v188 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v187, v188))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = @"[Face-FP]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v206;
            _os_log_impl((void *)&_mh_execute_header, v187, v188, "%@ Failed to add faces to Gallery - %@", buf, 0x16u);
          }
        }

        BOOL v70 = 0;
        goto LABEL_124;
      }

      uint64_t v126 = MediaAnalysisLogLevel(v124, v125);
      if ((int)v126 >= 7)
      {
        uint64_t v128 = VCPLogInstance(v126, v127);
        v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
        os_log_type_t v130 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v129, v130))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          _os_log_impl((void *)&_mh_execute_header, v129, v130, "%@ Faces added to Gallery!", buf, 0xCu);
        }
      }
    }

    else
    {
      uint64_t v131 = MediaAnalysisLogLevel(0LL, v119);
      if ((int)v131 >= 6)
      {
        uint64_t v133 = VCPLogInstance(v131, v132);
        v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
        os_log_type_t v135 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v134, v135))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          _os_log_impl( (void *)&_mh_execute_header,  v134,  v135,  "%@ No face to add to Gallery; continuing to VU update ...",
            buf,
            0xCu);
        }
      }

      id v206 = v215;
    }

    v224[0] = _NSConcreteStackBlock;
    v224[1] = 3221225472LL;
    v224[2] = sub_1000C2DF0;
    v224[3] = &unk_1001BCF10;
    v224[4] = self;
    v225 = @"[Face-FP]";
    v216 = objc_retainBlock(v224);
    v136 = (void *)objc_claimAutoreleasedReturnValue([v217 gallery]);
    id v223 = v206;
    unsigned __int8 v137 = [v136 updateAndReturnError:&v223 progressHandler:v216];
    id v138 = v223;

    id v206 = v138;
    if ((v137 & 1) == 0)
    {
      uint64_t v179 = MediaAnalysisLogLevel(v139, v140);
      if ((int)v179 >= 3)
      {
        uint64_t v181 = VCPLogInstance(v179, v180);
        v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(v181);
        os_log_type_t v183 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v182, v183))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v138;
          _os_log_impl((void *)&_mh_execute_header, v182, v183, "%@ Failed to update Gallery - %@", buf, 0x16u);
        }

        BOOL v70 = 0;
        goto LABEL_121;
      }

      goto LABEL_122;
    }

    uint64_t v141 = MediaAnalysisLogLevel(v139, v140);
    if ((int)v141 >= 7)
    {
      uint64_t v143 = VCPLogInstance(v141, v142);
      v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
      os_log_type_t v145 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v144, v145))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        _os_log_impl((void *)&_mh_execute_header, v144, v145, "%@ Gallery updated!", buf, 0xCu);
      }
    }

    uint64_t v146 = VCPSignPostLog(v141);
    v147 = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);
    v148 = v147;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v148,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADPhotosFaceFastPassProcessingTask_UVCluster",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v149 = (*((uint64_t (**)(double))self->_progressHandler + 2))(75.0);
    uint64_t v150 = DeviceWithGreymatterSupport(v149);
    if (!(_DWORD)v150) {
      goto LABEL_117;
    }
    uint64_t v151 = VCPSignPostLog(v150);
    v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
    os_signpost_id_t v202 = os_signpost_id_generate(v152);

    uint64_t v154 = VCPSignPostLog(v153);
    v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
    v156 = v155;
    if (v202 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v155))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v156,  OS_SIGNPOST_INTERVAL_BEGIN,  v202,  "MADPhotosFaceFastPassProcessingTask_UVPersonalization",  (const char *)&unk_100199097,  buf,  2u);
    }

    v221[0] = _NSConcreteStackBlock;
    v221[1] = 3221225472LL;
    v221[2] = sub_1000C2F74;
    v221[3] = &unk_1001BCCA8;
    v221[4] = self;
    v222 = @"[Face-FP]";
    spida = objc_retainBlock(v221);
    id v220 = 0LL;
    v157 = (void *)objc_claimAutoreleasedReturnValue( +[MADVUWGalleryManager sharedGalleryForPhotoLibrary:]( &OBJC_CLASS___MADVUWGalleryManager,  "sharedGalleryForPhotoLibrary:",  v18));
    unsigned __int8 v203 = [v157 updatePlugin:1 progressHandler:spida error:&v220];
    id v158 = v220;
    v160 = v158;
    if ((v203 & 1) == 0)
    {
      uint64_t v189 = MediaAnalysisLogLevel(v158, v159);
      uint64_t v191 = VCPLogInstance(v189, v190);
      v177 = (os_log_s *)objc_claimAutoreleasedReturnValue(v191);
      os_log_type_t v192 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v177, v192))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v160;
        _os_log_impl( (void *)&_mh_execute_header,  v177,  v192,  "%@ Failed to update VUWGallery for Personalization plugin - %@",  buf,  0x16u);
      }

      goto LABEL_114;
    }

    uint64_t v161 = MediaAnalysisLogLevel(v158, v159);
    if ((int)v161 >= 6)
    {
      uint64_t v163 = VCPLogInstance(v161, v162);
      v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
      os_log_type_t v165 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v164, v165))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"[Face-FP]";
        _os_log_impl( (void *)&_mh_execute_header,  v164,  v165,  "%@ VUWGallery Personalization plugin updated!",  buf,  0xCu);
      }
    }

    uint64_t v166 = VCPSignPostLog(v161);
    v167 = (os_log_s *)objc_claimAutoreleasedReturnValue(v166);
    v168 = v167;
    if (v202 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v167))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v168,  OS_SIGNPOST_INTERVAL_END,  v202,  "MADPhotosFaceFastPassProcessingTask_UVPersonalization",  (const char *)&unk_100199097,  buf,  2u);
    }

    id v219 = v160;
    unsigned __int8 v169 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:forFeature:error:]( &OBJC_CLASS___BGSystemTaskCheckpoints,  "reportFeatureCheckpoint:forFeature:error:",  30LL,  802LL,  &v219);
    id v170 = v219;

    if ((v169 & 1) != 0)
    {
      id v173 = v170;
      uint64_t v174 = MediaAnalysisLogLevel(v171, v172);
      if ((int)v174 >= 5)
      {
        uint64_t v176 = VCPLogInstance(v174, v175);
        v177 = (os_log_s *)objc_claimAutoreleasedReturnValue(v176);
        os_log_type_t v178 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v177, v178))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 30LL;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v238 = 802LL;
          _os_log_impl((void *)&_mh_execute_header, v177, v178, "%@ Reported checkpoint %lu for %lu", buf, 0x20u);
        }

        v160 = v170;
LABEL_114:

        goto LABEL_116;
      }
    }

    else
    {
      id v173 = v170;
      uint64_t v193 = MediaAnalysisLogLevel(v171, v172);
      if ((int)v193 >= 3)
      {
        uint64_t v195 = VCPLogInstance(v193, v194);
        v177 = (os_log_s *)objc_claimAutoreleasedReturnValue(v195);
        os_log_type_t v196 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v177, v196))
        {
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = @"[Face-FP]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 30LL;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v238 = 802LL;
          LOWORD(v239[0]) = 2112;
          *(void *)((char *)v239 + 2) = v173;
          _os_log_impl( (void *)&_mh_execute_header,  v177,  v196,  "%@ Failed to report checkpoint %lu for %lu - %@",  buf,  0x2Au);
        }

        v160 = v173;
        goto LABEL_114;
      }
    }

    v160 = v173;
LABEL_116:

    if ((v203 & 1) != 0)
    {
LABEL_117:
      uint64_t v197 = (*((uint64_t (**)(double))self->_progressHandler + 2))(100.0);
      uint64_t v198 = VCPSignPostLog(v197);
      v199 = (os_log_s *)objc_claimAutoreleasedReturnValue(v198);
      v200 = v199;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v199))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v200,  OS_SIGNPOST_INTERVAL_END,  v11,  "MADPhotosFaceFastPassProcessingTask",  (const char *)&unk_100199097,  buf,  2u);
      }

      v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADPhotosFaceFastPassProcessingTask completionHandler](self, "completionHandler"));
      (*((void (**)(os_log_s *, void, void))v182 + 2))(v182, 0LL, 0LL);
      BOOL v70 = 1;
LABEL_121:

LABEL_123:
      p_isa = &v225->isa;
LABEL_124:

      id v215 = v206;
      v68 = (os_log_s *)v208;
      goto LABEL_125;
    }

- (void).cxx_destruct
{
}

@end