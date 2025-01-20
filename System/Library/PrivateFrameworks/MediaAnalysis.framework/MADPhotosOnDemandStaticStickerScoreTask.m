@interface MADPhotosOnDemandStaticStickerScoreTask
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADPhotosOnDemandStaticStickerScoreTask)initWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)publishResults:(id)a3;
@end

@implementation MADPhotosOnDemandStaticStickerScoreTask

- (MADPhotosOnDemandStaticStickerScoreTask)initWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000EDCC0;
  v34[3] = &unk_1001BADE0;
  id v11 = a5;
  id v35 = v11;
  v12 = objc_retainBlock(v34);
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MADPhotosOnDemandStaticStickerScoreTask;
  v13 = -[MADPhotosOnDemandStaticStickerScoreTask initWithCompletionHandler:](&v33, "initWithCompletionHandler:", v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_photoLibrary, a3);
    v14->_targetResultCount = 10LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:VCPMediaAnalysisService_TargetResultCount]);
    if (v15)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v15, v16);
      if ((isKindOfClass & 1) != 0)
      {
        v14->_targetResultCount = (unint64_t)[v15 unsignedIntegerValue];
      }

      else
      {
        uint64_t v19 = MediaAnalysisLogLevel(isKindOfClass, v18);
        if ((int)v19 >= 4)
        {
          uint64_t v21 = VCPLogInstance(v19, v20);
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          os_log_type_t v23 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v22, v23))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[Sticker] Unexpected target result count type (%@); ignoring",
              buf,
              0xCu);
          }
        }
      }
    }

    dispatch_semaphore_t v24 = dispatch_semaphore_create(1LL);
    publishSemaphore = v14->_publishSemaphore;
    v14->_publishSemaphore = (OS_dispatch_semaphore *)v24;

    dispatch_group_t v26 = dispatch_group_create();
    publishGroup = v14->_publishGroup;
    v14->_publishGroup = (OS_dispatch_group *)v26;

    dispatch_queue_attr_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v28);
    dispatch_queue_t v30 = dispatch_queue_create("publishQueue", v29);
    publishQueue = v14->_publishQueue;
    v14->_publishQueue = (OS_dispatch_queue *)v30;
  }

  return v14;
}

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v8 options:v9 completionHandler:v10];

  return v11;
}

- (void)publishResults:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_publishSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  publishGroup = self->_publishGroup;
  publishQueue = (dispatch_queue_s *)self->_publishQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000EDE10;
  v8[3] = &unk_1001B9E70;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async((dispatch_group_t)publishGroup, publishQueue, v8);
}

- (BOOL)run:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v4 timeIntervalSince1970];
  double v6 = v5;

  v137 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  self->_photoLibrary,  12LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
  v151 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v151, 1LL));
  [v137 setSortDescriptors:v8];

  [v137 setFetchLimit:10 * self->_targetResultCount];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v137));
  v133 = objc_alloc_init(&OBJC_CLASS___VNSession);
  v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v10 = 0LL;
  uint64_t v129 = 0LL;
  unint64_t v140 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v131 = VCPLogToOSLogType[6];
  os_log_type_t v11 = VCPLogToOSLogType[4];
  os_log_type_t v12 = v11;
  while (v10 < (unint64_t)objc_msgSend(v9, "count", v127))
  {
    v13 = objc_autoreleasePoolPush();
    os_log_type_t v11 = v12;
    if ((-[MADPhotosOnDemandStaticStickerScoreTask isCanceled](self, "isCanceled") & 1) != 0
      || (unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_publishFailed), (v14 & 1) != 0)
      || v140 >= self->_targetResultCount)
    {
      int v33 = 2;
      goto LABEL_19;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v15 pet];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v10]);
    uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v18 >= 7)
    {
      uint64_t v20 = VCPLogInstance(v18, v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, type))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v148 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, type, "[Sticker][%@] Evaluating asset...", buf, 0xCu);
      }
    }

    v139 = (void *)objc_claimAutoreleasedReturnValue([v16 visualSearchProperties]);
    id v23 = [v139 stickerAlgorithmVersion];
    if (v23 == (id)1)
    {
      uint64_t v25 = MediaAnalysisLogLevel(1LL, v24);
      if ((int)v25 >= 7)
      {
        uint64_t v27 = VCPLogInstance(v25, v26);
        dispatch_queue_attr_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, type))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
          [v139 stickerConfidenceScore];
          *(_DWORD *)buf = 138412546;
          v148 = v29;
          __int16 v149 = 2048;
          double v150 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  type,  "[Sticker][%@] Asset already processed (confidence: %0.3f)",  buf,  0x16u);
        }
      }

      [v139 stickerConfidenceScore];
      unint64_t v32 = v140;
      if (v31 >= 0.2) {
        unint64_t v32 = v140 + 1;
      }
      unint64_t v140 = v32;
      int v33 = 4;
      goto LABEL_72;
    }

    uint64_t v34 = MediaAnalysisLogLevel(v23, v24);
    if ((int)v34 >= 6)
    {
      uint64_t v36 = VCPLogInstance(v34, v35);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, v131))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
        *(_DWORD *)buf = 138412290;
        v148 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, v131, "[Sticker][%@] Processing asset...", buf, 0xCu);
      }
    }

    v134 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v16));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "vcp_thumbnailResource"));
    v135 = v39;
    if (v39)
    {
      id v41 = [v39 isLocallyAvailable];
      if ((v41 & 1) != 0)
      {
        uint64_t v43 = VCPSignPostLog(v41);
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        os_signpost_id_t v45 = os_signpost_id_generate(v44);

        uint64_t v47 = VCPSignPostLog(v46);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        v49 = v48;
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  OS_SIGNPOST_INTERVAL_BEGIN,  v45,  "MADStickerScore_Decode",  (const char *)&unk_100199097,  buf,  2u);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[VCPImageManager sharedImageManager](&OBJC_CLASS___VCPImageManager, "sharedImageManager"));
        v51 = (void *)objc_claimAutoreleasedReturnValue([v135 privateFileURL]);
        id v142 = [v50 pixelBufferWithFormat:875704422 fromImageURL:v51 flushCache:0 orientation:&v143];

        uint64_t v53 = VCPSignPostLog(v52);
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        v55 = v54;
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_END,  v45,  "MADStickerScore_Decode",  (const char *)&unk_100199097,  buf,  2u);
        }

        v56 = objc_alloc(&OBJC_CLASS___VNImageRequestHandler);
        v127 = -[VNImageRequestHandler initWithCVPixelBuffer:orientation:options:session:]( v56,  "initWithCVPixelBuffer:orientation:options:session:",  v142,  v143,  &__NSDictionary0__struct,  v133);
        id v130 = objc_alloc_init(&OBJC_CLASS___VNGenerateInstanceMaskGatingRequest);
        uint64_t HasANE = DeviceHasANE();
        if ((_DWORD)HasANE)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[VNProcessingDevice defaultANEDevice](&OBJC_CLASS___VNProcessingDevice, "defaultANEDevice"));
          [v130 setProcessingDevice:v58];
        }

        uint64_t v59 = VCPSignPostLog(HasANE);
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        os_signpost_id_t v61 = os_signpost_id_generate(v60);

        uint64_t v63 = VCPSignPostLog(v62);
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        v65 = v64;
        if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v65,  OS_SIGNPOST_INTERVAL_BEGIN,  v61,  "MADStickerScore_PerformRequests",  (const char *)&unk_100199097,  buf,  2u);
        }

        id v146 = v130;
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v146, 1LL));
        id v141 = 0LL;
        unsigned __int8 v67 = -[VNImageRequestHandler performRequests:error:](v127, "performRequests:error:", v66, &v141);
        id v128 = v141;

        uint64_t v69 = VCPSignPostLog(v68);
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        v71 = v70;
        if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v71,  OS_SIGNPOST_INTERVAL_END,  v61,  "MADStickerScore_PerformRequests",  (const char *)&unk_100199097,  buf,  2u);
        }

        if ((v67 & 1) != 0)
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue([v130 results]);
          BOOL v75 = [v74 count] == 0;

          if (!v75)
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue([v130 results]);
            v79 = (void *)objc_claimAutoreleasedReturnValue([v78 firstObject]);
            [v79 confidence];
            float v81 = v80;

            uint64_t v84 = MediaAnalysisLogLevel(v82, v83);
            double v86 = v81;
            if ((int)v84 >= 6)
            {
              uint64_t v87 = VCPLogInstance(v84, v85);
              v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v88, v131))
              {
                v89 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
                *(_DWORD *)buf = 138412546;
                v148 = v89;
                __int16 v149 = 2048;
                double v150 = v86;
                _os_log_impl((void *)&_mh_execute_header, v88, v131, "[Sticker][%@] Confidence: %0.3f", buf, 0x16u);
              }
            }

            unint64_t v90 = v140;
            if (v86 >= 0.2) {
              unint64_t v90 = v140 + 1;
            }
            unint64_t v140 = v90;
            v91 = -[MADPhotosStickerScoreResult initWithAsset:stickerScore:]( objc_alloc(&OBJC_CLASS___MADPhotosStickerScoreResult),  "initWithAsset:stickerScore:",  v16,  v86);
            [v138 addObject:v91];

            ++v129;
            if ((unint64_t)[v138 count] >= 0x64)
            {
              -[MADPhotosOnDemandStaticStickerScoreTask publishResults:](self, "publishResults:", v138);
              int v33 = 0;
              v92 = (os_log_s *)v138;
              v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              goto LABEL_67;
            }

            int v33 = 0;
LABEL_70:

            sub_10000421C((const void **)&v142);
            goto LABEL_71;
          }

          uint64_t v107 = MediaAnalysisLogLevel(v76, v77);
          if ((int)v107 >= 4)
          {
            uint64_t v109 = VCPLogInstance(v107, v108);
            v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
            if (os_log_type_enabled(v92, v12))
            {
              v110 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              v148 = v110;
              _os_log_impl( (void *)&_mh_execute_header,  v92,  v12,  "[Sticker][%@] Vision request produced no observations",  buf,  0xCu);
            }

            goto LABEL_66;
          }
        }

        else
        {
          uint64_t v102 = MediaAnalysisLogLevel(v72, v73);
          if ((int)v102 >= 4)
          {
            uint64_t v104 = VCPLogInstance(v102, v103);
            v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
            if (os_log_type_enabled(v92, v12))
            {
              v105 = (void *)objc_claimAutoreleasedReturnValue([v16 localIdentifier]);
              double v106 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v128 description]));
              *(_DWORD *)buf = 138412546;
              v148 = v105;
              __int16 v149 = 2112;
              double v150 = v106;
              _os_log_impl( (void *)&_mh_execute_header,  v92,  v12,  "[Sticker][%@] Vision request failed (%@)",  buf,  0x16u);
            }

- (void).cxx_destruct
{
}

@end