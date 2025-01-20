@interface VCPResumePausedAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (int)mainInternal;
@end

@implementation VCPResumePausedAnalysisTask

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

- (int)mainInternal
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Checking for paused analysis...", (uint8_t *)&buf, 2u);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPausedAnalysis persistedPausedAnalysisFromPhotoLibrary:]( &OBJC_CLASS___VCPPausedAnalysis,  "persistedPausedAnalysisFromPhotoLibrary:",  v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 asset]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
    uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
    if ((int)v13 >= 5)
    {
      uint64_t v15 = VCPLogInstance(v13, v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      os_log_type_t v17 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v16, v17))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "  [%@] Resuming Movie Analysis", (uint8_t *)&buf, 0xCu);
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v18));

    unsigned int v20 = [v19 addAssetToBlacklist:v11];
    int v21 = v20;
    if (v20 == -108 || v20 == -36 || v20 == -23) {
      goto LABEL_40;
    }
    unsigned int v22 = [v19 commit];
    if (v22 == -108 || v22 == -36)
    {
      int v23 = v22;
    }

    else
    {
      int v23 = v22;
      if (v22 != -23) {
        int v23 = v21;
      }
    }

    if (v22 == -108 || v22 == -36 || v22 == -23)
    {
      int v21 = v23;
LABEL_40:

      goto LABEL_41;
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v95 = 0x3032000000LL;
    v96 = sub_10011F434;
    v97 = sub_10011F444;
    id v98 = (id)objc_claimAutoreleasedReturnValue([v9 analysis]);
    id v25 = *(id *)(*((void *)&buf + 1) + 40LL);
    if (v25)
    {
      id v25 = objc_msgSend(v25, "vcp_syncPoint");
      if ((v92.flags & 1) != 0)
      {
        id v26 = objc_msgSend(v10, "vcp_isAnalysisValid:", *(void *)(*((void *)&buf + 1) + 40));
        if ((v26 & 1) != 0)
        {
          id v28 = objc_alloc(&OBJC_CLASS___VCPMovieAnalyzer);
          id v29 = [v28 initWithPHAsset:v10 withPausedAnalysis:*(void *)(*((void *)&buf + 1) + 40) forAnalysisTypes:VCPMAFullAnalysisTypesMovie];
          v88[0] = _NSConcreteStackBlock;
          v88[1] = 3221225472LL;
          v88[2] = sub_10011F44C;
          v88[3] = &unk_1001BBF78;
          p___int128 buf = &buf;
          id v30 = v29;
          id v89 = v30;
          v90 = self;
          v85 = objc_retainBlock(v88);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADQoSManager sharedManager](&OBJC_CLASS___VCPMADQoSManager, "sharedManager"));
          [v31 runBlock:v85 withTaskID:1];

          id v32 = [v30 status];
          if (v32 != (id)4)
          {
            if (v32 == (id)3)
            {
              uint64_t v58 = MediaAnalysisLogLevel(3LL, v33);
              if ((int)v58 >= 3)
              {
                uint64_t v60 = VCPLogInstance(v58, v59);
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                os_log_type_t v62 = VCPLogToOSLogType[3];
                if (os_log_type_enabled(v61, v62))
                {
                  LODWORD(v99.value) = 138412290;
                  *(CMTimeValue *)((char *)&v99.value + 4) = (CMTimeValue)v11;
                  _os_log_impl((void *)&_mh_execute_header, v61, v62, "  [%@] Analysis failed", (uint8_t *)&v99, 0xCu);
                }
              }
            }

            else if (v32 == (id)2)
            {
              unsigned int v34 = [v19 storeAnalysisForAsset:v10 analysis:*(void *)(*((void *)&buf + 1) + 40)];
              if (v34 == -108 || v34 == -36)
              {
                int v21 = v34;
              }

              else
              {
                int v21 = v34;
                if (v34 != -23) {
                  int v21 = v23;
                }
              }

              if (v34 == -108 || v34 == -36 || v34 == -23) {
                goto LABEL_104;
              }
              unsigned int v63 = [v19 removeLocalIdentifierFromBlacklist:v11];
              if (v63 == -108 || v63 == -36)
              {
                int v64 = v63;
              }

              else
              {
                int v64 = v63;
                if (v63 != -23) {
                  int v64 = v21;
                }
              }

              if (v63 == -108 || v63 == -36 || v63 == -23)
              {
                int v21 = v64;
                goto LABEL_104;
              }

              unsigned int v80 = [v19 commit];
              if (v80 == -108 || v80 == -36)
              {
                int v21 = v80;
              }

              else
              {
                int v21 = v80;
                if (v80 != -23) {
                  int v21 = v64;
                }
              }

              if (v80 == -108 || v80 == -36 || v80 == -23) {
                goto LABEL_104;
              }
              if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled"))
              {
                v81 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
                v82 = (void *)objc_claimAutoreleasedReturnValue( +[VSKAsset mad_assetsWithLocalIdentifier:mediaAnalysisResults:]( &OBJC_CLASS___VSKAsset,  "mad_assetsWithLocalIdentifier:mediaAnalysisResults:",  v81,  *(void *)(*((void *)&buf + 1) + 40LL)));

                if ([v82 count])
                {
                  v83 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
                  v87[0] = _NSConcreteStackBlock;
                  v87[1] = 3221225472LL;
                  v87[2] = sub_10011F540;
                  v87[3] = &unk_1001B9E98;
                  v87[4] = self;
                  +[MADVectorDatabaseUtilities updateWithAssetsEmbeddings:photoLibrary:cancelBlock:error:]( &OBJC_CLASS___MADVectorDatabaseUtilities,  "updateWithAssetsEmbeddings:photoLibrary:cancelBlock:error:",  v82,  v83,  v87,  0LL);
                }
              }
            }

            int v21 = 0;
LABEL_104:

            goto LABEL_39;
          }

          v49 = *(void **)(*((void *)&buf + 1) + 40LL);
          if (!v49) {
            goto LABEL_103;
          }
          id v50 = objc_msgSend(v49, "vcp_syncPoint");
          if ((v86.flags & 1) == 0)
          {
            uint64_t v52 = MediaAnalysisLogLevel(v50, v51);
            if ((int)v52 >= 4)
            {
              uint64_t v54 = VCPLogInstance(v52, v53);
              v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
              os_log_type_t v56 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v55, v56))
              {
                LODWORD(v99.value) = 138412290;
                *(CMTimeValue *)((char *)&v99.value + 4) = (CMTimeValue)v11;
                v57 = "  [%@] Failed to resume paused analysis (non-fatal)";
LABEL_101:
                _os_log_impl((void *)&_mh_execute_header, v55, v56, v57, (uint8_t *)&v99, 0xCu);
                goto LABEL_102;
              }

              goto LABEL_102;
            }

            goto LABEL_103;
          }

          CMTime v99 = v92;
          CMTime time2 = v86;
          uint64_t v65 = CMTimeCompare(&v99, &time2);
          if ((v65 & 0x80000000) != 0)
          {
            unsigned int v75 = [v19 decrementBlacklistCountForLocalIdentifier:v11];
            if (v75 == -108 || v75 == -36)
            {
              unsigned int v76 = v75;
            }

            else
            {
              unsigned int v76 = v75;
              if (v75 != -23) {
                unsigned int v76 = v23;
              }
            }

            if (v75 == -108 || v75 == -36 || v75 == -23)
            {
              int v21 = v76;
              goto LABEL_104;
            }

            unsigned int v84 = [v19 commit];
            if (v84 == -108 || v84 == -36)
            {
              int v21 = v84;
            }

            else
            {
              int v21 = v84;
              if (v84 != -23) {
                int v21 = v76;
              }
            }

            if (v84 == -108 || v84 == -36 || v84 == -23) {
              goto LABEL_104;
            }
          }

          else
          {
            uint64_t v67 = MediaAnalysisLogLevel(v65, v66);
            if ((int)v67 >= 5)
            {
              uint64_t v69 = VCPLogInstance(v67, v68);
              v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
              os_log_type_t v71 = VCPLogToOSLogType[5];
              if (os_log_type_enabled(v70, v71))
              {
                LODWORD(v99.value) = 138412290;
                *(CMTimeValue *)((char *)&v99.value + 4) = (CMTimeValue)v11;
                _os_log_impl( (void *)&_mh_execute_header,  v70,  v71,  "  [%@] Pause/resume made no progress",  (uint8_t *)&v99,  0xCu);
              }
            }

            id v72 = [v19 getBlacklistCountForLocalIdentifier:v11];
            if ((int)v72 >= MediaAnalysisBlacklistThreshold)
            {
              uint64_t v77 = MediaAnalysisLogLevel(v72, v73);
              if ((int)v77 >= 4)
              {
                uint64_t v79 = VCPLogInstance(v77, v78);
                v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
                os_log_type_t v56 = VCPLogToOSLogType[4];
                if (os_log_type_enabled(v55, v56))
                {
                  LODWORD(v99.value) = 138412290;
                  *(CMTimeValue *)((char *)&v99.value + 4) = (CMTimeValue)v11;
                  v57 = "  [%@] Asset blacklisted; discarding paused analysis";
                  goto LABEL_101;
                }

@end