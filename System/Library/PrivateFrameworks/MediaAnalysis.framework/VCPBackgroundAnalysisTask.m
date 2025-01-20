@interface VCPBackgroundAnalysisTask
- (VCPBackgroundAnalysisTask)init;
- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6;
- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5;
@end

@implementation VCPBackgroundAnalysisTask

- (VCPBackgroundAnalysisTask)init
{
  return 0LL;
}

- (unint64_t)possibleAnalysisForAsset:(id)a3 withResources:(id)a4 forLocalResourcesOnly:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (unint64_t)objc_msgSend(v7, "vcp_fullAnalysisTypesForResources:", v8);
  if (!a5
    && (![v7 isPhoto]
     || objc_msgSend(v8, "vcp_hasLocalPhoto:", objc_msgSend(v7, "hasAdjustments"))))
  {
    v9 |= (unint64_t)objc_msgSend(v7, "vcp_fullAnalysisTypes") & 0xFFFFFFFFFFEFFFFFLL;
  }

  return v9;
}

- (unint64_t)missingAnalysisForAsset:(id)a3 withExistingComputeSyncAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  context = objc_autoreleasePoolPush();
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"  [%@][ComputeSync]",  v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vcp_modificationDate"));

  if (!v14)
  {
    uint64_t v56 = MediaAnalysisLogLevel(v15, v16);
    if ((int)v56 >= 5)
    {
      uint64_t v58 = VCPLogInstance(v56, v57);
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      os_log_type_t v60 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v59, v60))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  v60,  "%@ Asset missing modification date; skipping analysis with Compute Sync results",
          buf,
          0xCu);
      }
    }

    goto LABEL_33;
  }

  unint64_t v17 = -[VCPBackgroundAnalysisTask possibleAnalysisForAsset:withResources:forLocalResourcesOnly:]( self,  "possibleAnalysisForAsset:withResources:forLocalResourcesOnly:",  v10,  v11,  v6);
  unint64_t v19 = v17;
  if ((v17 & 0x40000) != 0)
  {
    id v20 = StripMovieCurationResultsForEligibleAsset(v10, *a4, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = *a4;
    *a4 = v21;
  }

  unint64_t v23 = v19 & 0xFFFFFFFFDFFFFFFFLL;
  if (*a4)
  {
    uint64_t v24 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v24 >= 7)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = MediaAnalysisTypeShortDescription(objc_msgSend(*a4, "vcp_types"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138412546;
        v75 = v13;
        __int16 v76 = 2112;
        v77 = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "%@ Existing analysis: %@", buf, 0x16u);
      }
    }

    unsigned int v31 = objc_msgSend(*a4, "vcp_degraded");
    id v32 = [v10 mediaType];
    v33 = (id *)&OBJC_CLASS___VCPPhotoAnalyzer_ptr;
    if (v32 != (id)1) {
      v33 = (id *)&OBJC_CLASS___VCPMovieAnalyzer_ptr;
    }
    unsigned int v34 = [*v33 canAnalyzeUndegraded:v10 withResources:v11];
    id v35 = objc_msgSend(v10, "vcp_isAnalysisValid:", *a4);
    if ((v35 & 1) != 0)
    {
      if (v31 & v34) != 1 || (id v37 = objc_msgSend(v10, "vcp_isPano"), (v37))
      {
        unint64_t v39 = (unint64_t)objc_msgSend(*a4, "vcp_types");
        uint64_t v40 = MediaAnalysisTypesUpdatedSince(objc_msgSend(*a4, "vcp_version"), v10);
        unint64_t v42 = v23 & v40 & v39;
        unint64_t v43 = (v39 ^ v19) & v23;
        if (v42 | v43)
        {
          if ((v31 | v34) == 1)
          {
            if (v42)
            {
              uint64_t v40 = MediaAnalysisLogLevel(v40, v41);
              if ((int)v40 >= 6)
              {
                uint64_t v44 = VCPLogInstance(v40, v41);
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                os_log_type_t v46 = VCPLogToOSLogType[6];
                if (os_log_type_enabled(v45, v46))
                {
                  uint64_t v47 = MediaAnalysisTypeShortDescription(v42);
                  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
                  *(_DWORD *)buf = 138412546;
                  v75 = v13;
                  __int16 v76 = 2112;
                  v77 = v48;
                  _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "%@ Analysis version outdated; re-doing updated analyses (%@) with Compute Sync results",
                    buf,
                    0x16u);
                }
              }
            }

            if (v43)
            {
              uint64_t v49 = MediaAnalysisLogLevel(v40, v41);
              if ((int)v49 >= 6)
              {
                uint64_t v51 = VCPLogInstance(v49, v50);
                v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
                os_log_type_t v53 = VCPLogToOSLogType[6];
                if (os_log_type_enabled(v52, v53))
                {
                  uint64_t v54 = MediaAnalysisTypeShortDescription(v43);
                  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
                  *(_DWORD *)buf = 138412546;
                  v75 = v13;
                  __int16 v76 = 2112;
                  v77 = v55;
                  _os_log_impl( (void *)&_mh_execute_header,  v52,  v53,  "%@ Analysis incomplete; performing missing analysis (%@) with Compute Sync results",
                    buf,
                    0x16u);
                }
              }
            }

            unint64_t v23 = v42 | v43;
          }

          goto LABEL_39;
        }

- (unint64_t)missingAnalysisForAsset:(id)a3 existingAnalysis:(id *)a4 resources:(id)a5 forLocalResourcesOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v98 = a5;
  context = objc_autoreleasePoolPush();
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"  [%@]", v11));
  uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v14 >= 7)
  {
    uint64_t v16 = VCPLogInstance(v14, v15);
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    os_log_type_t v18 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 138412290;
      v101 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Processing", buf, 0xCu);
    }
  }

  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vcp_modificationDate"));
  BOOL v20 = v19 == 0LL;

  if (!v20)
  {
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v23));

    id v25 = [v24 getBlacklistCountForLocalIdentifier:v11];
    if ((int)v25 < MediaAnalysisBlacklistThreshold)
    {
      unint64_t v27 = -[VCPBackgroundAnalysisTask possibleAnalysisForAsset:withResources:forLocalResourcesOnly:]( self,  "possibleAnalysisForAsset:withResources:forLocalResourcesOnly:",  v10,  v98,  v6);
      id v99 = 0LL;
      [v24 analysisForAsset:v11 analysis:&v99];
      id v28 = v99;
      v96 = (os_log_s *)v99;
      objc_storeStrong(a4, v28);
      if ((v27 & 0x40000) != 0)
      {
        id v31 = StripMovieCurationResultsForEligibleAsset(v10, *a4, v12);
        id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        id v33 = *a4;
        *a4 = v32;
      }

      unint64_t v34 = v27 & 0xFFFFFFFFDFFFFFFFLL;
      if (!*a4) {
        goto LABEL_53;
      }
      uint64_t v35 = MediaAnalysisLogLevel(v29, v30);
      if ((int)v35 >= 7)
      {
        uint64_t v37 = VCPLogInstance(v35, v36);
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        os_log_type_t v39 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v38, v39))
        {
          uint64_t v40 = MediaAnalysisTypeShortDescription(objc_msgSend(*a4, "vcp_types"));
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
          *(_DWORD *)buf = 138412546;
          v101 = v12;
          __int16 v102 = 2112;
          v103 = v41;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@ Existing analysis: %@", buf, 0x16u);
        }
      }

      unsigned int v42 = objc_msgSend(*a4, "vcp_degraded");
      id v43 = [v10 mediaType];
      uint64_t v44 = (id *)&OBJC_CLASS___VCPPhotoAnalyzer_ptr;
      if (v43 != (id)1) {
        uint64_t v44 = (id *)&OBJC_CLASS___VCPMovieAnalyzer_ptr;
      }
      unsigned int v45 = [*v44 canAnalyzeUndegraded:v10 withResources:v98];
      id v46 = objc_msgSend(v10, "vcp_isAnalysisValid:", *a4);
      if ((v46 & 1) == 0)
      {
        uint64_t v78 = MediaAnalysisLogLevel(v46, v47);
        if ((int)v78 >= 5)
        {
          uint64_t v80 = VCPLogInstance(v78, v79);
          v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
          os_log_type_t v82 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v81, v82))
          {
            *(_DWORD *)buf = 138412290;
            v101 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v81,  v82,  "%@ Asset has been modified; discarding MA DB results",
              buf,
              0xCu);
          }
        }

        [v24 deleteAnalysisForAsset:v11];
        id v83 = *a4;
        *a4 = 0LL;

        goto LABEL_53;
      }

      if ((v42 & v45) == 1)
      {
        id v48 = objc_msgSend(v10, "vcp_isPano");
        if ((v48 & 1) == 0)
        {
          uint64_t v91 = MediaAnalysisLogLevel(v48, v49);
          if ((int)v91 >= 6)
          {
            uint64_t v93 = VCPLogInstance(v91, v92);
            v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
            os_log_type_t v95 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v94, v95))
            {
              *(_DWORD *)buf = 138412290;
              v101 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v94,  v95,  "%@ Undegraded asset available; re-analyzing with MA DB results",
                buf,
                0xCu);
            }
          }

          goto LABEL_53;
        }
      }

      unint64_t v50 = (unint64_t)objc_msgSend(*a4, "vcp_types");
      uint64_t v51 = MediaAnalysisTypesUpdatedSince(objc_msgSend(*a4, "vcp_version"), v10);
      unint64_t v53 = v34 & v51 & v50;
      unint64_t v54 = (v50 ^ v27) & v34;
      unint64_t v55 = v53;
      if (v53 | v54)
      {
        if ((v42 | v45) != 1)
        {
LABEL_53:

          goto LABEL_54;
        }

        unint64_t v56 = v53;
        if (v53)
        {
          uint64_t v51 = MediaAnalysisLogLevel(v51, v52);
          if ((int)v51 >= 6)
          {
            uint64_t v57 = VCPLogInstance(v51, v52);
            uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
            os_log_type_t v59 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v58, v59))
            {
              uint64_t v60 = MediaAnalysisTypeShortDescription(v55);
              uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
              *(_DWORD *)buf = 138412546;
              v101 = v12;
              __int16 v102 = 2112;
              v103 = v61;
              _os_log_impl( (void *)&_mh_execute_header,  v58,  v59,  "%@ Analysis version outdated; re-doing updated analyses (%@) with MA DB results",
                buf,
                0x16u);
            }
          }
        }

        if (!v54 || (uint64_t v62 = MediaAnalysisLogLevel(v51, v52), (int)v62 < 6))
        {
LABEL_52:
          unint64_t v34 = v56 | v54;
          goto LABEL_53;
        }

        uint64_t v64 = VCPLogInstance(v62, v63);
        os_log_type_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        os_log_type_t v66 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v65, v66))
        {
          uint64_t v67 = MediaAnalysisTypeShortDescription(v54);
          uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
          *(_DWORD *)buf = 138412546;
          v101 = v12;
          __int16 v102 = 2112;
          v103 = v68;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  v66,  "%@ Analysis incomplete; performing missing analysis (%@) with MA DB results",
            buf,
            0x16u);
        }
      }

      else
      {
        id v84 = objc_msgSend(*a4, "vcp_version");
        unint64_t v56 = v55;
        uint64_t v86 = MediaAnalysisLogLevel(v84, v85);
        uint64_t v88 = VCPLogInstance(v86, v87);
        os_log_type_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        os_log_type_t v89 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v65, v89))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  v89,  "%@ Analysis complete and up-to-date with MA DB results",  buf,  0xCu);
        }
      }

      goto LABEL_52;
    }

    uint64_t v73 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v73 >= 5)
    {
      uint64_t v75 = VCPLogInstance(v73, v74);
      __int16 v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      os_log_type_t v77 = VCPLogToOSLogType[5];
      v96 = v76;
      if (os_log_type_enabled(v76, v77))
      {
        *(_DWORD *)buf = 138412290;
        v101 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v76,  v77,  "%@ Asset blacklisted - skipping analysis with MA DB results",  buf,  0xCu);
      }

      unint64_t v34 = 0LL;
      goto LABEL_53;
    }

@end