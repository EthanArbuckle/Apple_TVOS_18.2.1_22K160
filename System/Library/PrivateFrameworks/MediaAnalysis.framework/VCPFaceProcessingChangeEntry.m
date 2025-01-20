@interface VCPFaceProcessingChangeEntry
+ (id)entryWithAsset:(id)a3 andAnalysis:(id)a4;
- (VCPFaceProcessingChangeEntry)init;
- (VCPFaceProcessingChangeEntry)initWithAsset:(id)a3 andAnalysis:(id)a4;
- (void)_persist:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4;
- (void)publish:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4;
@end

@implementation VCPFaceProcessingChangeEntry

- (VCPFaceProcessingChangeEntry)init
{
  return 0LL;
}

- (VCPFaceProcessingChangeEntry)initWithAsset:(id)a3 andAnalysis:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VCPFaceProcessingChangeEntry;
  v9 = -[VCPFaceProcessingChangeEntry init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_analysis, a4);
  }

  return v10;
}

+ (id)entryWithAsset:(id)a3 andAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithAsset:v6 andAnalysis:v7];

  return v8;
}

- (void)_persist:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4
{
  BOOL v110 = a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
  v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[FacePersist][%@]",  v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset photoLibrary](self->_asset, "photoLibrary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 librarySpecificFetchOptions]);

  v121 = v6;
  [v6 setIncludeNonvisibleFaces:1];
  [v6 setIncludeTorsoOnlyDetectionData:1];
  [v6 setIncludedDetectionTypes:&off_1001C90F0];
  uint64_t v139 = PHFacePropertySetIdentifier;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v139, 1LL));
  [v6 setFetchPropertySets:v7];

  uint64_t v8 = MediaAnalysisFaceResultsKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_analysis,  "objectForKeyedSubscript:",  MediaAnalysisFaceResultsKey));
  v106 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:VCPFacesToDelete]);

  v105 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceUtils phFacesFromVCPPhotosFaces:withFetchOptions:]( &OBJC_CLASS___VCPFaceUtils,  "phFacesFromVCPPhotosFaces:withFetchOptions:",  v106,  v121));
  id v10 = [v105 count];
  if (v10)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v10, v11);
    if ((int)v12 >= 7)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138412546;
        v132 = v116;
        __int16 v133 = 2048;
        v134 = (const __CFString *)[v105 count];
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Faces To Delete - %lu", buf, 0x16u);
      }
    }

    v128[0] = _NSConcreteStackBlock;
    v128[1] = 3221225472LL;
    v128[2] = sub_1000ADE2C;
    v128[3] = &unk_1001BCA70;
    id v129 = v116;
    [v105 enumerateObjectsUsingBlock:v128];
    +[PHFaceChangeRequest deleteFaces:](&OBJC_CLASS___PHFaceChangeRequest, "deleteFaces:", v105);
  }

  id v112 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v118 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetChangeRequest changeRequestForAsset:]( &OBJC_CLASS___PHAssetChangeRequest,  "changeRequestForAsset:",  self->_asset));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_analysis, "objectForKeyedSubscript:", v8));
  v103 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:VCPFacesToPersist]);

  uint64_t v20 = MediaAnalysisLogLevel(v18, v19);
  if ((int)v20 >= 7)
  {
    uint64_t v22 = VCPLogInstance(v20, v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (const __CFString *)[v103 count];
      *(_DWORD *)buf = 138412546;
      v132 = v116;
      __int16 v133 = 2048;
      v134 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ Faces To Insert/Update - %lu", buf, 0x16u);
    }
  }

  v107 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  id obj = v103;
  id v26 = [obj countByEnumeratingWithState:&v124 objects:v138 count:16];
  if (!v26)
  {
    char v113 = 0;
    uint64_t v117 = 0LL;
    uint64_t v108 = 0LL;
    uint64_t v109 = 0LL;
    uint64_t v111 = 0LL;
    goto LABEL_89;
  }

  char v113 = 0;
  uint64_t v117 = 0LL;
  uint64_t v108 = 0LL;
  uint64_t v109 = 0LL;
  uint64_t v111 = 0LL;
  uint64_t v122 = *(void *)v125;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v115 = VCPLogToOSLogType[3];
  do
  {
    id v123 = v26;
    for (i = 0LL; i != v123; i = (char *)i + 1)
    {
      if (*(void *)v125 != v122) {
        objc_enumerationMutation(obj);
      }
      v28 = *(void **)(*((void *)&v124 + 1) + 8LL * (void)i);
      if (_os_feature_enabled_impl("MediaAnalysis", "FCPeople"))
      {
        id v29 = [v28 algorithmVersion];
        uint64_t v30 = _os_feature_enabled_impl("MediaAnalysis", "VisualUnderstandingService");
        uint64_t v32 = 11LL;
        if ((_DWORD)v30) {
          uint64_t v32 = 14LL;
        }
        if (v29 == (id)v32)
        {
          uint64_t v33 = MediaAnalysisLogLevel(v30, v31);
          if ((int)v33 >= 7)
          {
            uint64_t v35 = VCPLogInstance(v33, v34);
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, type))
            {
              v37 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              v132 = v116;
              __int16 v133 = 2112;
              v134 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, type, "%@ Marking asset contains FC face %@", buf, 0x16u);
            }
          }

          char v113 = 1;
        }
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue([v28 localIdentifier]);

      if (!v38)
      {
        v43 = 0LL;
        uint64_t v39 = objc_claimAutoreleasedReturnValue( +[PHFaceChangeRequest creationRequestForFace]( &OBJC_CLASS___PHFaceChangeRequest,  "creationRequestForFace"));
        v42 = (void *)v39;
        if (!v39) {
          goto LABEL_42;
        }
LABEL_30:
        +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:]( &OBJC_CLASS___VCPFaceUtils,  "assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:",  v28,  v42);
        unsigned int v44 = [v28 detectionType];
        if (v44 != 1)
        {
          if (v38)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset photoLibrary](self->_asset, "photoLibrary"));
            unsigned __int8 v53 = objc_msgSend(v52, "mad_useVUGallery");

            BOOL v54 = 0;
            BOOL v51 = 0;
            v55 = @"Pet";
            if ((v53 & 1) != 0) {
              goto LABEL_59;
            }
            goto LABEL_60;
          }

          BOOL v51 = 0;
          BOOL v54 = 0;
          v55 = @"Pet";
          goto LABEL_64;
        }

        [v28 centerX];
        if (v45 == 0.0 && ([v28 centerY], v46 == 0.0) && (objc_msgSend(v28, "size"), v47 == 0.0))
        {
          [v28 bodyCenterX];
          if (v48 == 0.0
            && ([v28 bodyCenterY], v49 == 0.0)
            && ([v28 bodyWidth], v50 == 0.0))
          {
            [v28 bodyHeight];
            BOOL v51 = v87 != 0.0;
          }

          else
          {
            BOOL v51 = 1;
          }
        }

        else
        {
          BOOL v51 = 0;
        }

        [v28 centerX];
        if (v59 == 0.0 && ([v28 centerY], v60 == 0.0) && (objc_msgSend(v28, "size"), v61 == 0.0)
          || ([v28 bodyCenterX], v62 != 0.0)
          || ([v28 bodyCenterY], v63 != 0.0)
          || ([v28 bodyWidth], v64 != 0.0))
        {
          BOOL v66 = 0;
          BOOL v54 = 0;
          v55 = @"Face";
          if (!v51) {
            goto LABEL_56;
          }
        }

        else
        {
          [v28 bodyHeight];
          BOOL v66 = v65 == 0.0;
          BOOL v54 = v66;
          v55 = @"Face";
          if (!v51)
          {
LABEL_56:
            if (v38)
            {
              if (!v51 || v110)
              {
LABEL_59:
                v67 = (void *)objc_claimAutoreleasedReturnValue([v43 localIdentifier]);
                [v112 addObject:v67];
              }

- (void)publish:(id *)a3 scheduleTorsoOnlyPHFace:(BOOL)a4
{
}

- (void).cxx_destruct
{
}

@end