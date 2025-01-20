@interface VCPPhotosAssetChangeManager
+ (id)managerForPhotoLibrary:(id)a3;
+ (signed)sensitivityFromAnalysis:(id)a3;
- (VCPPhotosAssetChangeManager)initWithPhotoLibrary:(id)a3;
- (id)matchPerson:(CGRect)a3 withPHFaces:(id)a4 withMinIOU:(float)a5 iou:(float *)a6;
- (int)associateTraitsForAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5;
- (int)associateTraitsForMovieAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5;
- (int)associateTraitsWithFaceTorspPrints:(id)a3 forAsset:(id)a4 withAnalysis:(id)a5 results:(id)a6;
- (int)publishPendingChanges;
- (int)updateAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5;
- (int)updateImageAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5;
- (int)updateLegacyAsset:(id)a3 withAnalysis:(id)a4;
- (int)updateMovieAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5;
- (void)dealloc;
@end

@implementation VCPPhotosAssetChangeManager

- (VCPPhotosAssetChangeManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VCPPhotosAssetChangeManager;
  v6 = -[VCPPhotosAssetChangeManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingChanges = v7->_pendingChanges;
    v7->_pendingChanges = (NSMutableArray *)v8;

    v7->_pendingResourceChangeCount = 0LL;
  }

  return v7;
}

+ (id)managerForPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

+ (signed)sensitivityFromAnalysis:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "vcp_results"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:MediaAnalysisSafetyResultsKey]);

  if (v4 && [v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MediaAnalysisResultSensitivityAttributeKey]);
      uint64_t v8 = v7;
      if (v7) {
        signed __int16 v9 = (unsigned __int16)[v7 intValue];
      }
      else {
        signed __int16 v9 = -1;
      }
    }

    else
    {
      signed __int16 v9 = -1;
    }
  }

  else
  {
    signed __int16 v9 = -1;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VCPPhotosAssetChangeManager;
  -[VCPPhotosAssetChangeManager dealloc](&v3, "dealloc");
}

- (id)matchPerson:(CGRect)a3 withPHFaces:(id)a4 withMinIOU:(float)a5 iou:(float *)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v11 = a4;
  v12 = 0LL;
  id v13 = [v11 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (!v13)
  {
    float v49 = 0.0;
    v43 = v11;
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v14 = *(void *)v53;
  float v49 = 0.0;
  CGFloat v48 = height;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v53 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
      [v16 bodyWidth];
      double v18 = v17;
      [v16 bodyHeight];
      if (v18 * v19 > 0.0)
      {
        [v16 bodyCenterX];
        double v21 = v20;
        [v16 bodyWidth];
        double v23 = v22;
        [v16 bodyCenterY];
        double v25 = v24;
        [v16 bodyHeight];
        double v27 = v26;
        [v16 bodyWidth];
        CGFloat v29 = v28;
        [v16 bodyHeight];
        v64.size.CGFloat height = v30;
        CGFloat v31 = v21 + v23 * -0.5;
        CGFloat v32 = v25 + v27 * -0.5;
        v61.origin.CGFloat x = x;
        v61.origin.CGFloat y = y;
        v61.size.CGFloat width = width;
        v61.size.CGFloat height = v48;
        v64.origin.CGFloat x = v31;
        v64.origin.CGFloat y = v32;
        v64.size.CGFloat width = v29;
        CGFloat v33 = v64.size.height;
        CGRect v62 = CGRectUnion(v61, v64);
        double v50 = v62.size.height;
        double v51 = v62.size.width;
        v62.origin.CGFloat x = x;
        v62.origin.CGFloat y = y;
        v62.size.CGFloat width = width;
        v62.size.CGFloat height = v48;
        v65.origin.CGFloat x = v31;
        v65.origin.CGFloat y = v32;
        v65.size.CGFloat width = v29;
        v65.size.CGFloat height = v33;
        CGRect v63 = CGRectIntersection(v62, v65);
        float v34 = v51 * v50;
        float v35 = 0.0;
        if (v34 != 0.0)
        {
          float v36 = v63.size.width * v63.size.height;
          float v35 = v36 / v34;
        }

        if (v35 > v49 && v35 > a5)
        {
          id v37 = v16;

          v12 = v37;
          float v49 = v35;
        }
      }
    }

    id v13 = [v11 countByEnumeratingWithState:&v52 objects:v60 count:16];
  }

  while (v13);

  if (v12)
  {
    uint64_t v40 = MediaAnalysisLogLevel(v38, v39);
    if ((int)v40 >= 7)
    {
      uint64_t v42 = VCPLogInstance(v40, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      os_log_type_t v44 = VCPLogToOSLogType[7];
      if (os_log_type_enabled((os_log_t)v43, v44))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
        *(_DWORD *)buf = 138412546;
        v57 = v45;
        __int16 v58 = 2048;
        double v59 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v43,  v44,  "   [%@] found matchPerson with iou %f",  buf,  0x16u);
      }

      goto LABEL_19;
    }
  }

- (int)associateTraitsForMovieAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5
{
  id v73 = a3;
  id v77 = a4;
  id v7 = a5;
  uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v9 >= 7)
  {
    uint64_t v11 = VCPLogInstance(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v73 localIdentifier]);
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "   [%@] Associate PHFace HAR result for movie asset",  (uint8_t *)&buf,  0xCu);
    }
  }

  uint64_t v110 = PHFacePropertySetClustering;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v110, 1LL));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "vcp_PHFaces:", v15));

  if (v70)
  {
    id v16 = [v70 count];
    int v17 = 0;
    if (v7 && v16)
    {
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      __int128 v98 = 0u;
      __int128 v99 = 0u;
      id v18 = v70;
      id v19 = [v18 countByEnumeratingWithState:&v98 objects:v109 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v99;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v99 != v20) {
              objc_enumerationMutation(v18);
            }
            [v7 setObject:&__NSArray0__struct forKeyedSubscript:*(void *)(*((void *)&v98 + 1) + 8 * (void)i)];
          }

          id v19 = [v18 countByEnumeratingWithState:&v98 objects:v109 count:16];
        }

        while (v19);
      }

      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      id obj = v18;
      id v22 = [obj countByEnumeratingWithState:&v94 objects:v108 count:16];
      int v17 = 0;
      if (v22)
      {
        uint64_t v75 = *(void *)v95;
        os_log_type_t type = VCPLogToOSLogType[7];
        uint64_t v69 = MediaAnalysisResultAttributesKey;
        uint64_t v68 = MediaAnalysisResultHumanActionsAttributeKey;
        *(void *)&__int128 v23 = 138413058LL;
        __int128 v67 = v23;
        do
        {
          double v24 = 0LL;
          int v25 = v17;
          id v76 = v22;
          do
          {
            int v78 = v25;
            if (*(void *)v95 != v75) {
              objc_enumerationMutation(obj);
            }
            v81 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)v24);
            context = objc_autoreleasePoolPush();
            double v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "vcp_queryActionResultForPHFace:", v81));
            v80 = v26;
            if (!v26)
            {
              uint64_t v32 = MediaAnalysisLogLevel(0LL, v27);
              if ((int)v32 >= 7)
              {
                uint64_t v34 = VCPLogInstance(v32, v33);
                float v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, type))
                {
                  float v36 = (void *)objc_claimAutoreleasedReturnValue([v73 localIdentifier]);
                  id v37 = (void *)objc_claimAutoreleasedReturnValue([v81 localIdentifier]);
                  LODWORD(buf.start.value) = 138412546;
                  *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v36;
                  LOWORD(buf.start.flags) = 2112;
                  *(void *)((char *)&buf.start.flags + 2) = v37;
                  _os_log_impl( (void *)&_mh_execute_header,  v35,  type,  "   [%@] No matched action for PHFace %@",  (uint8_t *)&buf,  0x16u);
                }

                int v31 = 7;
                goto LABEL_48;
              }

              int v31 = 7;
LABEL_49:
              int v17 = v78;
              goto LABEL_50;
            }

            double v28 = CMTimeRangeMakeFromDictionary(&buf, v26);
            CMTimeValue value = buf.start.value;
            CMTimeFlags flags = buf.start.flags;
            CMTimeScale timescale = buf.start.timescale;
            if ((buf.start.flags & 1) != 0)
            {
              int v17 = -18;
              int v31 = 10;
              CMTimeFlags v85 = buf.duration.flags;
              if ((buf.duration.flags & 1) != 0 && !buf.duration.epoch)
              {
                CMTimeValue v84 = buf.duration.value;
                if ((buf.duration.value & 0x8000000000000000LL) == 0)
                {
                  CMTimeEpoch epoch = buf.start.epoch;
                  CMTimeScale v82 = buf.duration.timescale;
                  uint64_t v38 = MediaAnalysisLogLevel(v28, v29);
                  if ((int)v38 >= 7)
                  {
                    uint64_t v40 = VCPLogInstance(v38, v39);
                    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                    if (os_log_type_enabled(v41, type))
                    {
                      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v73 localIdentifier]);
                      v43 = (void *)objc_claimAutoreleasedReturnValue([v81 localIdentifier]);
                      time.CMTimeValue value = value;
                      time.CMTimeScale timescale = timescale;
                      time.CMTimeFlags flags = flags;
                      time.CMTimeEpoch epoch = epoch;
                      CMTimeValue Seconds = CMTimeGetSeconds(&time);
                      rhs.CMTimeEpoch epoch = 0LL;
                      lhs.CMTimeValue value = value;
                      lhs.CMTimeScale timescale = timescale;
                      lhs.CMTimeFlags flags = flags;
                      lhs.CMTimeEpoch epoch = epoch;
                      rhs.CMTimeValue value = v84;
                      rhs.CMTimeScale timescale = v82;
                      rhs.CMTimeFlags flags = v85;
                      CMTimeAdd(&v92, &lhs, &rhs);
                      Float64 v45 = CMTimeGetSeconds(&v92);
                      LODWORD(buf.start.value) = v67;
                      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v42;
                      LOWORD(buf.start.flags) = 2112;
                      *(void *)((char *)&buf.start.flags + 2) = v43;
                      HIWORD(buf.start.epoch) = 2048;
                      buf.duration.CMTimeValue value = Seconds;
                      LOWORD(buf.duration.timescale) = 2048;
                      *(Float64 *)((char *)&buf.duration.timescale + 2) = v45;
                      _os_log_impl( (void *)&_mh_execute_header,  v41,  type,  "   [%@] Found match action for PHFace %@, at time [%f, %f]",  (uint8_t *)&buf,  0x2Au);
                    }
                  }

                  v46 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v69, v67));
                  v71 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v68]);

                  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                  __int128 v90 = 0u;
                  __int128 v91 = 0u;
                  __int128 v88 = 0u;
                  __int128 v89 = 0u;
                  float v35 = v71;
                  id v48 = -[os_log_s countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v88,  v104,  16LL);
                  if (v48)
                  {
                    uint64_t v49 = *(void *)v89;
                    while (2)
                    {
                      for (j = 0LL; j != v48; j = (char *)j + 1)
                      {
                        if (*(void *)v89 != v49) {
                          objc_enumerationMutation(v35);
                        }
                        double v51 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)j);
                        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", v51));
                        [v52 floatValue];
                        float v54 = v53;

                        id v55 = objc_alloc(&OBJC_CLASS___PHDetectionTrait);
                        LOWORD(v51) = (unsigned __int16)[v51 intValue];
                        v87.CMTimeValue value = value;
                        v87.CMTimeScale timescale = timescale;
                        v87.CMTimeFlags flags = flags;
                        v87.CMTimeEpoch epoch = epoch;
                        double v56 = CMTimeGetSeconds(&v87);
                        v86.CMTimeValue value = v84;
                        v86.CMTimeScale timescale = v82;
                        v86.CMTimeFlags flags = v85;
                        v86.CMTimeEpoch epoch = 0LL;
                        id v57 = [v55 initWithType:1 value:(__int16)v51 score:v54 startTime:v56 duration:CMTimeGetSeconds(&v86)];
                        if (!v57)
                        {

                          int v31 = 10;
                          int v78 = -18;
                          goto LABEL_47;
                        }

                        [v47 addObject:v57];
                      }

                      id v48 = -[os_log_s countByEnumeratingWithState:objects:count:]( v35,  "countByEnumeratingWithState:objects:count:",  &v88,  v104,  16LL);
                      if (v48) {
                        continue;
                      }
                      break;
                    }
                  }

                  if ([v47 count]) {
                    [v7 setObject:v47 forKeyedSubscript:v81];
                  }
                  int v31 = 0;
LABEL_47:

LABEL_48:
                  goto LABEL_49;
                }
              }
            }

            else
            {
              int v17 = -18;
              int v31 = 10;
            }

- (int)associateTraitsWithFaceTorspPrints:(id)a3 forAsset:(id)a4 withAnalysis:(id)a5 results:(id)a6
{
  id v9 = a3;
  id v76 = a4;
  id v10 = a5;
  v74 = v10;
  id v75 = a6;
  id v73 = v9;
  if (v10)
  {
    if (![v9 count])
    {
      LODWORD(v10) = 0;
      goto LABEL_56;
    }

    [v76 duration];
    LODWORD(v10) = 0;
    if (v75)
    {
      if (v11 > 0.0)
      {
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "vcp_actionsAggregated"));
        id v67 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (!v67)
        {
          LODWORD(v10) = 0;
          goto LABEL_55;
        }

        uint64_t v69 = *(void *)v83;
        uint64_t v68 = MediaAnalysisResultHumanActionsAttributeKey;
        uint64_t v63 = MediaAnalysisResultTorsoPrintAttributeKey;
        os_log_type_t type = VCPLogToOSLogType[4];
LABEL_7:
        uint64_t v72 = 0LL;
        while (1)
        {
          if (*(void *)v83 != v69) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v82 + 1) + 8 * v72);
          v70 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v12]);
          os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:v68]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);
          [v14 floatValue];
          float v16 = v15;

          if (v16 != 0.0) {
            break;
          }
          uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
          if ((int)v19 >= 4)
          {
            uint64_t v21 = VCPLogInstance(v19, v20);
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, type))
            {
              *(_WORD *)CMTimeRange buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  type,  "associateTraitsForMovieAsset : action with confidence of 0.0f",  buf,  2u);
            }

- (int)associateTraitsForAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v148 = a4;
  id v9 = a5;
  v146 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_PHFaces:", 0));
  v147 = v10;
  if (!v10)
  {
    int v12 = 0;
    goto LABEL_103;
  }

  id v11 = [v10 count];
  int v12 = 0;
  if (v9 && v11)
  {
    v134 = self;
    os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    __int128 v176 = 0u;
    __int128 v177 = 0u;
    id v14 = v147;
    id v15 = [v14 countByEnumeratingWithState:&v176 objects:v187 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v177;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v177 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v176 + 1) + 8LL * (void)i);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localIdentifier]);
          BOOL v20 = v19 == 0LL;

          if (!v20)
          {
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 localIdentifier]);
            [v13 setObject:v18 forKeyedSubscript:v21];
          }

          [v9 setObject:&__NSArray0__struct forKeyedSubscript:v18];
        }

        id v15 = [v14 countByEnumeratingWithState:&v176 objects:v187 count:16];
      }

      while (v15);
    }

    __int128 v174 = 0u;
    __int128 v175 = 0u;
    __int128 v172 = 0u;
    __int128 v173 = 0u;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "vcp_results"));
    id obj = (id)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:MediaAnalysisHumanActionClassificationResultsKey]);

    id v141 = [obj countByEnumeratingWithState:&v172 objects:v186 count:16];
    if (v141)
    {
      uint64_t v149 = *(void *)v173;
      uint64_t v151 = MediaAnalysisResultAttributesKey;
      uint64_t v143 = MediaAnalysisResultFaceIdentifierAttributeKey;
      os_log_type_t type = VCPLogToOSLogType[7];
      uint64_t v132 = MediaAnalysisResultHumanBoundsAttributeKey;
      uint64_t v135 = MediaAnalysisResultHumanActionsAttributeKey;
      os_log_type_t v127 = VCPLogToOSLogType[4];
      do
      {
        id v153 = 0LL;
        do
        {
          if (*(void *)v173 != v149) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v172 + 1) + 8LL * (void)v153);
          signed __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v151]);
          v155 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v143]);

          double v25 = v155;
          if (v155)
          {
            double v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v155]);
            BOOL v27 = v26 == 0LL;

            if (!v27) {
              goto LABEL_26;
            }
            double v28 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v151]);
            id v29 = (NSString *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v132]);
            NSRect v188 = NSRectFromString(v29);
            double x = v188.origin.x;
            double y = v188.origin.y;
            double width = v188.size.width;
            double height = v188.size.height;

            LODWORD(v34) = 1060320051;
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( -[VCPPhotosAssetChangeManager matchPerson:withPHFaces:withMinIOU:iou:]( v134,  "matchPerson:withPHFaces:withMinIOU:iou:",  v14,  0LL,  x,  y,  width,  height,  v34));
            double v25 = v155;
            if (v36)
            {
              id v37 = [v13 setObject:v36 forKeyedSubscript:v155];
              uint64_t v39 = MediaAnalysisLogLevel(v37, v38);
              if ((int)v39 >= 7)
              {
                uint64_t v41 = VCPLogInstance(v39, v40);
                id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, type))
                {
                  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v146 localIdentifier]);
                  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v36 localIdentifier]);
                  LODWORD(buf.start.value) = 138412802;
                  *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v43;
                  LOWORD(buf.start.flags) = 2112;
                  *(void *)((char *)&buf.start.flags + 2) = v44;
                  HIWORD(buf.start.epoch) = 2112;
                  buf.duration.CMTimeValue value = (CMTimeValue)v155;
                  _os_log_impl( (void *)&_mh_execute_header,  v42,  type,  "   [%@] Associated PHFace (%@) with HAR result localIdentifier (%@)",  (uint8_t *)&buf,  0x20u);
                }
              }

LABEL_26:
              CMTimeRangeMakeFromDictionary(&buf, (CFDictionaryRef)v23);
              float v45 = 0.0;
              if ((buf.start.flags & 1) != 0 && (buf.duration.flags & 1) != 0 && !buf.duration.epoch)
              {
                float v46 = 0.0;
                if ((buf.duration.value & 0x8000000000000000LL) == 0)
                {
                  CMTime time = buf.start;
                  double Seconds = CMTimeGetSeconds(&time);
                  CMTime duration = buf.duration;
                  float v46 = Seconds;
                  float v45 = CMTimeGetSeconds(&duration);
                }
              }

              else
              {
                float v46 = 0.0;
              }

              v139 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v155]);
              id v48 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v151]);
              v137 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v135]);

              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              __int128 v168 = 0u;
              __int128 v169 = 0u;
              __int128 v166 = 0u;
              __int128 v167 = 0u;
              id v50 = v137;
              id v51 = [v50 countByEnumeratingWithState:&v166 objects:v184 count:16];
              if (v51)
              {
                uint64_t v52 = *(void *)v167;
                double v53 = v46;
                double v54 = v45;
LABEL_34:
                uint64_t v55 = 0LL;
                while (1)
                {
                  if (*(void *)v167 != v52) {
                    objc_enumerationMutation(v50);
                  }
                  double v56 = *(void **)(*((void *)&v166 + 1) + 8 * v55);
                  os_log_type_t v57 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v56]);
                  [v57 floatValue];
                  float v59 = v58;

                  id v60 = objc_msgSend( [PHDetectionTrait alloc],  "initWithType:value:score:startTime:duration:",  1,  (__int16)objc_msgSend(v56, "intValue"),  v59,  v53,  v54);
                  if (!v60) {
                    break;
                  }
                  [v49 addObject:v60];

                  if (v51 == (id)++v55)
                  {
                    id v51 = [v50 countByEnumeratingWithState:&v166 objects:v184 count:16];
                    if (!v51) {
                      goto LABEL_40;
                    }
                    goto LABEL_34;
                  }
                }

LABEL_95:
                id v115 = [v9 removeAllObjects];
                uint64_t v117 = MediaAnalysisLogLevel(v115, v116);
                if ((int)v117 < 3)
                {
                  int v12 = -18;
                }

                else
                {
                  uint64_t v119 = VCPLogInstance(v117, v118);
                  v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
                  os_log_type_t v120 = VCPLogToOSLogType[3];
                  if (os_log_type_enabled(v114, v120))
                  {
                    v121 = (void *)objc_claimAutoreleasedReturnValue([v146 localIdentifier]);
                    LODWORD(buf.start.value) = 138412290;
                    *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v121;
                    _os_log_impl( (void *)&_mh_execute_header,  v114,  v120,  "   [%@] Failed to populate detection traits",  (uint8_t *)&buf,  0xCu);
                  }

                  int v12 = -18;
LABEL_101:
                }

                goto LABEL_103;
              }

- (int)updateImageAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v188 = a3;
  id v189 = a4;
  BOOL v183 = v5;
  if (v5 && objc_msgSend(v188, "vcp_isLivePhoto"))
  {
    uint64_t v7 = (uint64_t)+[PHAsset vcp_fullAnalysisImageOnlyTypes](&OBJC_CLASS___PHAsset, "vcp_fullAnalysisImageOnlyTypes");
    uint64_t v9 = v7;
    if (!v7)
    {
      uint64_t v10 = MediaAnalysisLogLevel(0LL, v8);
      if ((int)v10 >= 3)
      {
        uint64_t v12 = VCPLogInstance(v10, v11);
        os_log_type_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        os_log_type_t v14 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v13, v14))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v188 localIdentifier]);
          *(_DWORD *)CMTimeRange buf = 138412290;
          v217 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[%@] updateImageAsset : required types is MediaAnalysisTypeNone; skip",
            buf,
            0xCu);

          int v16 = 0;
LABEL_148:

          goto LABEL_149;
        }

        goto LABEL_38;
      }

      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v7 = (uint64_t)+[PHAsset vcp_fullAnalysisImageOnlyTypes](&OBJC_CLASS___PHAsset, "vcp_fullAnalysisImageOnlyTypes");
    uint64_t v9 = v7 | 8;
  }

  uint64_t v17 = MediaAnalysisLogLevel(v7, v8);
  if ((int)v17 >= 7)
  {
    uint64_t v19 = VCPLogInstance(v17, v18);
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v21 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v188 localIdentifier]);
      uint64_t v23 = MediaAnalysisTypeShortDescription(objc_msgSend(v189, "vcp_types"));
      id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
      unint64_t v25 = (unint64_t)objc_msgSend(v189, "vcp_types");
      uint64_t v26 = MediaAnalysisTypeShortDescription(v9);
      id v27 = (id)objc_claimAutoreleasedReturnValue(v26);
      unsigned int v28 = objc_msgSend(v188, "vcp_isLivePhoto");
      *(_DWORD *)CMTimeRange buf = 138413570;
      id v29 = @"NO";
      v217 = v22;
      __int16 v218 = 2112;
      __int16 v220 = 2048;
      if (v28) {
        id v30 = @"YES";
      }
      else {
        id v30 = @"NO";
      }
      uint64_t v219 = (uint64_t)v24;
      if (v5) {
        id v29 = @"YES";
      }
      unint64_t v221 = v25 & v9;
      __int16 v222 = 2112;
      id v223 = v27;
      __int16 v224 = 2112;
      v225 = v30;
      __int16 v226 = 2112;
      v227 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[%@] Update image asset with analysis type %@ (%llu), required type %@, isLivePhoto:%@, isImageOnly:%@",  buf,  0x3Eu);
    }
  }

  unint64_t v31 = (unint64_t)objc_msgSend(v189, "vcp_types");
  if ((v9 & ~v31) == 0)
  {
    uint64_t v33 = objc_alloc_init(&OBJC_CLASS___VCPImageChangeEntry);
    v186 = v33;
    -[VCPImageChangeEntry setAsset:](v33, "setAsset:", v188);
    -[VCPImageChangeEntry setImageOnly:](v33, "setImageOnly:", v183);
    if (((unint64_t)objc_msgSend(v189, "vcp_types") & 0x2000000000000) != 0)
    {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
      uint64_t v184 = objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:MediaAnalysisMiCaImageCaptionResultsKey]);

      uint64_t v47 = MediaAnalysisLogLevel(v45, v46);
      if ((int)v47 >= 7)
      {
        uint64_t v49 = VCPLogInstance(v47, v48);
        id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        os_log_type_t v51 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v188 localIdentifier]);
          *(_DWORD *)CMTimeRange buf = 138412546;
          v217 = v52;
          __int16 v218 = 2112;
          uint64_t v219 = v184;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  v51,  "[%@] Update Asset with MediaAnalysisMiCaImageCaptionResultsKey: %@",  buf,  0x16u);
        }
      }

      double v34 = (void *)v184;
    }

    else
    {
      double v34 = 0LL;
    }

    v185 = v34;
    if ([v34 count])
    {
      double v53 = (void *)objc_claimAutoreleasedReturnValue([v185 objectAtIndexedSubscript:0]);
      double v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:MediaAnalysisResultImageCaptionTextAttributeKey]);

      -[VCPImageChangeEntry setImageCaption:](v33, "setImageCaption:", v55);
    }

    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled")
      && ((unint64_t)objc_msgSend(v189, "vcp_types") & 0x1000000000000) != 0)
    {
      -[VCPImageChangeEntry setImageEmbeddingVersion:](v33, "setImageEmbeddingVersion:", 70LL);
    }

    if (!objc_msgSend(v188, "vcp_isLivePhoto") || -[VCPImageChangeEntry imageOnly](v33, "imageOnly"))
    {
LABEL_118:
      id v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
      v155 = (void *)objc_claimAutoreleasedReturnValue([v154 objectForKeyedSubscript:MediaAnalysisFaceResultsKey]);
      -[VCPImageChangeEntry setFaceCount:](v33, "setFaceCount:", [v155 count]);

      __int128 v156 = v186;
      if ((objc_msgSend(v189, "vcp_types") & 0x40000000) != 0)
      {
        v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        int v16 = -[VCPPhotosAssetChangeManager associateTraitsForAsset:withAnalysis:result:]( self,  "associateTraitsForAsset:withAnalysis:result:",  v188,  v189);
        if (v16)
        {
LABEL_146:

          goto LABEL_147;
        }

        -[VCPImageChangeEntry setHumanActions:](v186, "setHumanActions:", v181);

        __int128 v156 = v186;
      }

      if (v183 && (objc_msgSend(v188, "vcp_isLivePhoto") & 1) != 0
        || !objc_msgSend(v188, "mad_isEligibleForComputeSync"))
      {
LABEL_134:
        -[NSMutableArray addObject:](self->_pendingChanges, "addObject:", v156);
        int v16 = 0;
LABEL_147:

        os_log_type_t v13 = (os_log_s *)v186;
        goto LABEL_148;
      }

      uint64_t v157 = VCPSignPostLog( -[VCPImageChangeEntry setAnalysisStage:]( v156,  "setAnalysisStage:",  objc_msgSend(v188, "mad_analysisStageAfterCompletingAnalysis:", 1)));
      __int128 v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);
      os_signpost_id_t v159 = os_signpost_id_generate(v158);

      uint64_t v161 = VCPSignPostLog(v160);
      __int128 v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
      __int128 v163 = v162;
      if (v159 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v162))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v163,  OS_SIGNPOST_INTERVAL_BEGIN,  v159,  "VCPPhotosAssetChangeManager_Image_PackComputeSyncPayload",  (const char *)&unk_100199097,  buf,  2u);
      }

      __int128 v164 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProtoAssetAnalysis imageAnalysisComputeSyncPayloadFromLegacyDictionary:]( &OBJC_CLASS___VCPProtoAssetAnalysis,  "imageAnalysisComputeSyncPayloadFromLegacyDictionary:",  v189));
      uint64_t v165 = VCPSignPostLog(v164);
      __int128 v166 = (os_log_s *)objc_claimAutoreleasedReturnValue(v165);
      __int128 v167 = v166;
      if (v159 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v166))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v167,  OS_SIGNPOST_INTERVAL_END,  v159,  "VCPPhotosAssetChangeManager_Image_PackComputeSyncPayload",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v164)
      {
        v170 = (os_log_s *)objc_claimAutoreleasedReturnValue([v164 data]);
        -[VCPImageChangeEntry setComputeSyncPayload:](v186, "setComputeSyncPayload:", v170);
      }

      else
      {
        uint64_t v171 = MediaAnalysisLogLevel(v168, v169);
        uint64_t v173 = VCPLogInstance(v171, v172);
        v170 = (os_log_s *)objc_claimAutoreleasedReturnValue(v173);
        os_log_type_t v174 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v170, v174))
        {
          __int128 v175 = (void *)objc_claimAutoreleasedReturnValue([v188 localIdentifier]);
          *(_DWORD *)CMTimeRange buf = 138412290;
          v217 = v175;
          _os_log_impl( (void *)&_mh_execute_header,  v170,  v174,  "[%@] Failed to serialize image analysis results as compute sync payload",  buf,  0xCu);
        }
      }

LABEL_133:
      __int128 v156 = v186;
      goto LABEL_134;
    }

    if (((unint64_t)objc_msgSend(v189, "vcp_types", 0) & 0x200000000000) != 0)
    {
      os_log_type_t v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results", 0));
      uint64_t v180 = objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:MediaAnalysisMiCaVideoCaptionResultsKey]);

      uint64_t v60 = MediaAnalysisLogLevel(v58, v59);
      if ((int)v60 >= 7)
      {
        uint64_t v62 = VCPLogInstance(v60, v61);
        uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        os_log_type_t v64 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v63, v64))
        {
          id v65 = (void *)objc_claimAutoreleasedReturnValue([v188 localIdentifier]);
          *(_DWORD *)CMTimeRange buf = 138412546;
          v217 = v65;
          __int16 v218 = 2112;
          uint64_t v219 = v180;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  v64,  "[%@] Update Asset with MediaAnalysisMiCaVideoCaptionResultsKey: %@",  buf,  0x16u);
        }
      }

      double v56 = (void *)v180;
    }

    else
    {
      double v56 = 0LL;
    }

    if (objc_msgSend(v56, "count", v56))
    {
      id v66 = (void *)objc_claimAutoreleasedReturnValue([v181 objectAtIndexedSubscript:0]);
      id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);
      __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:MediaAnalysisResultVideoCaptionTextAttributeKey]);

      -[VCPImageChangeEntry setVideoCaption:](v33, "setVideoCaption:", v68);
    }

    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled")
      && ((unint64_t)objc_msgSend(v189, "vcp_types") & 0x80000000000) != 0)
    {
      -[VCPImageChangeEntry setVideoEmbeddingVersion:](v33, "setVideoEmbeddingVersion:", 70LL);
    }

    if ((objc_msgSend(v189, "vcp_types") & 0x40000) != 0)
    {
      os_log_type_t v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
      double v76 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:MediaAnalysisMovieSummaryResultsKey]);

      if ([v76 count])
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue([v76 objectAtIndexedSubscript:0]);
        v122 = v121;
        if (v121)
        {
          objc_msgSend(v121, "vcp_timerange");
        }

        else
        {
          __int128 v213 = 0u;
          __int128 v214 = 0u;
          __int128 v212 = 0u;
        }

        v211[0] = v212;
        v211[1] = v213;
        v211[2] = v214;
        -[VCPImageChangeEntry setSummaryTimeRange:](v33, "setSummaryTimeRange:", v211);

        uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue([v76 objectAtIndexedSubscript:0]);
        unsigned int v134 = objc_msgSend(v133, "vcp_flags");
        uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue([v76 objectAtIndexedSubscript:0]);
        objc_msgSend(v135, "vcp_quality");
        double v137 = v136 * (double)((v134 >> 19) & 1);
        *(float *)&double v137 = v137;
        -[VCPImageChangeEntry setAutoplayScore:](v33, "setAutoplayScore:", v137);

        if (!v33) {
          goto LABEL_144;
        }
        -[VCPImageChangeEntry summaryTimeRange](v33, "summaryTimeRange");
        if ((v218 & 1) == 0) {
          goto LABEL_144;
        }
        -[VCPImageChangeEntry summaryTimeRange](v33, "summaryTimeRange");
        if ((v210 & 1) == 0) {
          goto LABEL_144;
        }
        -[VCPImageChangeEntry summaryTimeRange](v33, "summaryTimeRange");
        if (v209) {
          goto LABEL_144;
        }
        -[VCPImageChangeEntry summaryTimeRange](v33, "summaryTimeRange");
        if (v208 < 0) {
          goto LABEL_144;
        }
        __int128 v206 = *(_OWORD *)&kCMTimeInvalid.value;
        CMTimeEpoch epoch = kCMTimeInvalid.epoch;
        -[VCPImageChangeEntry setKeyFrameTime:](v33, "setKeyFrameTime:", &v206);
        uint64_t v138 = (void *)objc_claimAutoreleasedReturnValue([v76 objectAtIndexedSubscript:0]);
        v139 = (void *)objc_claimAutoreleasedReturnValue([v138 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);

        if (![v139 count]
          || (uint64_t v140 = MediaAnalysisResultBestPlaybackCropAttributeKey,
              id v141 = (void *)objc_claimAutoreleasedReturnValue([v139 objectForKey:MediaAnalysisResultBestPlaybackCropAttributeKey]),
              BOOL v142 = v141 == 0LL,
              v141,
              v142))
        {
          -[VCPImageChangeEntry setBestPlaybackRect:]( v186,  "setBestPlaybackRect:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
        }

        else
        {
          uint64_t v143 = (NSString *)objc_claimAutoreleasedReturnValue([v139 objectForKey:v140]);
          NSRect v237 = NSRectFromString(v143);
          -[VCPImageChangeEntry setBestPlaybackRect:]( v186,  "setBestPlaybackRect:",  v237.origin.x,  v237.origin.y,  v237.size.width,  v237.size.height);
        }
      }

      else
      {
        __int128 v127 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
        v205[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
        v205[1] = v127;
        v205[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
        -[VCPImageChangeEntry setSummaryTimeRange:](v33, "setSummaryTimeRange:", v205);
        LODWORD(v128) = 0;
        -[VCPImageChangeEntry setAutoplayScore:](v33, "setAutoplayScore:", v128);
        __int128 v203 = *(_OWORD *)&kCMTimeInvalid.value;
        CMTimeEpoch v204 = kCMTimeInvalid.epoch;
        -[VCPImageChangeEntry setKeyFrameTime:](v33, "setKeyFrameTime:", &v203);
        -[VCPImageChangeEntry setBestPlaybackRect:]( v33,  "setBestPlaybackRect:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
      }

      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
      v130 = (void *)objc_claimAutoreleasedReturnValue([v129 objectForKeyedSubscript:MediaAnalysisAnimatedStickerResultsKey]);

      if ([v130 count])
      {
        id v131 = (void *)objc_claimAutoreleasedReturnValue([v130 objectAtIndexedSubscript:0]);
        uint64_t v132 = v131;
        if (v131)
        {
          objc_msgSend(v131, "vcp_timerange");
        }

        else
        {
          __int128 v201 = 0u;
          __int128 v202 = 0u;
          __int128 v200 = 0u;
        }

        v199[0] = v200;
        v199[1] = v201;
        v199[2] = v202;
        -[VCPImageChangeEntry setAnimatedStickerTimeRange:](v186, "setAnimatedStickerTimeRange:", v199);

        __int128 v176 = (void *)objc_claimAutoreleasedReturnValue([v130 objectAtIndexedSubscript:0]);
        objc_msgSend(v176, "vcp_quality");
        *(float *)&double v177 = v177;
        -[VCPImageChangeEntry setAnimatedStickerScore:](v186, "setAnimatedStickerScore:", v177);

        if (!v186
          || (-[VCPImageChangeEntry animatedStickerTimeRange](v186, "animatedStickerTimeRange"), (v218 & 1) == 0)
          || (-[VCPImageChangeEntry animatedStickerTimeRange](v186, "animatedStickerTimeRange"), (v210 & 1) == 0)
          || (-[VCPImageChangeEntry animatedStickerTimeRange](v186, "animatedStickerTimeRange"), v209)
          || (-[VCPImageChangeEntry animatedStickerTimeRange](v186, "animatedStickerTimeRange"), v208 < 0))
        {

          goto LABEL_144;
        }
      }

      else
      {
        __int128 v144 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
        v198[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
        v198[1] = v144;
        v198[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
        -[VCPImageChangeEntry setAnimatedStickerTimeRange:](v186, "setAnimatedStickerTimeRange:", v198);
        LODWORD(v145) = 0;
        -[VCPImageChangeEntry setAnimatedStickerScore:](v186, "setAnimatedStickerScore:", v145);
      }

      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
      v147 = (void *)objc_claimAutoreleasedReturnValue([v146 objectForKeyedSubscript:MediaAnalysisSettlingEffectsGatingResultsKey]);

      if ([v147 count])
      {
        uint64_t v149 = (void *)objc_claimAutoreleasedReturnValue([v147 objectAtIndexedSubscript:0]);
        objc_msgSend(v149, "vcp_quality");
        *(float *)&double v150 = v150;
        -[VCPImageChangeEntry setSettlingEffectScore:](v186, "setSettlingEffectScore:", v150);

        uint64_t v151 = (void *)objc_claimAutoreleasedReturnValue([v147 objectAtIndexedSubscript:0]);
        uint64_t v152 = (void *)objc_claimAutoreleasedReturnValue([v151 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);
        id v153 = (void *)objc_claimAutoreleasedReturnValue([v152 objectForKeyedSubscript:MediaAnalysisSettlingEffectsRankingLevelKey]);
        [v153 floatValue];
        -[VCPImageChangeEntry setSettlingEffectRankingScore:](v186, "setSettlingEffectRankingScore:");
      }

      else
      {
        LODWORD(v148) = 0;
        -[VCPImageChangeEntry setSettlingEffectScore:](v186, "setSettlingEffectScore:", v148);
        LODWORD(v179) = 0;
        -[VCPImageChangeEntry setSettlingEffectRankingScore:](v186, "setSettlingEffectRankingScore:", v179);
      }

      uint64_t v33 = v186;
    }

    else
    {
      __int128 v69 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
      v197[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
      v197[1] = v69;
      v197[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
      -[VCPImageChangeEntry setSummaryTimeRange:](v33, "setSummaryTimeRange:", v197);
      LODWORD(v70) = 0.5;
      -[VCPImageChangeEntry setAutoplayScore:](v33, "setAutoplayScore:", v70);
      __int128 v195 = *(_OWORD *)&kCMTimeInvalid.value;
      CMTimeEpoch v196 = kCMTimeInvalid.epoch;
      -[VCPImageChangeEntry setKeyFrameTime:](v33, "setKeyFrameTime:", &v195);
      -[VCPImageChangeEntry setBestPlaybackRect:]( v33,  "setBestPlaybackRect:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
      __int128 v71 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
      v194[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
      v194[1] = v71;
      v194[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
      -[VCPImageChangeEntry setAnimatedStickerTimeRange:](v33, "setAnimatedStickerTimeRange:", v194);
      LODWORD(v72) = 1050253722;
      -[VCPImageChangeEntry setAnimatedStickerScore:](v33, "setAnimatedStickerScore:", v72);
      LODWORD(v73) = -1.0;
      -[VCPImageChangeEntry setSettlingEffectScore:](v33, "setSettlingEffectScore:", v73);
      LODWORD(v74) = 0.5;
      -[VCPImageChangeEntry setSettlingEffectRankingScore:](v33, "setSettlingEffectRankingScore:", v74);
    }

    -[VCPImageChangeEntry bestPlaybackRect](v33, "bestPlaybackRect");
    if (!CGRectIsNull(v228))
    {
      -[VCPImageChangeEntry bestPlaybackRect](v33, "bestPlaybackRect");
      CGFloat x = v229.origin.x;
      CGFloat y = v229.origin.y;
      CGFloat width = v229.size.width;
      CGFloat height = v229.size.height;
      if (CGRectGetMinX(v229) < 0.0) {
        goto LABEL_145;
      }
      v230.origin.CGFloat x = x;
      v230.origin.CGFloat y = y;
      v230.size.CGFloat width = width;
      v230.size.CGFloat height = height;
      if (CGRectGetMinX(v230) > 1.0) {
        goto LABEL_145;
      }
      v231.origin.CGFloat x = x;
      v231.origin.CGFloat y = y;
      v231.size.CGFloat width = width;
      v231.size.CGFloat height = height;
      if (CGRectGetMinY(v231) < 0.0) {
        goto LABEL_145;
      }
      v232.origin.CGFloat x = x;
      v232.origin.CGFloat y = y;
      v232.size.CGFloat width = width;
      v232.size.CGFloat height = height;
      if (CGRectGetMinY(v232) > 1.0) {
        goto LABEL_145;
      }
      v233.origin.CGFloat x = x;
      v233.origin.CGFloat y = y;
      v233.size.CGFloat width = width;
      v233.size.CGFloat height = height;
      if (CGRectGetMaxX(v233) < 0.0) {
        goto LABEL_145;
      }
      v234.origin.CGFloat x = x;
      v234.origin.CGFloat y = y;
      v234.size.CGFloat width = width;
      v234.size.CGFloat height = height;
      if (CGRectGetMaxX(v234) > 1.0) {
        goto LABEL_145;
      }
      v235.origin.CGFloat x = x;
      v235.origin.CGFloat y = y;
      v235.size.CGFloat width = width;
      v235.size.CGFloat height = height;
      if (CGRectGetMaxY(v235) < 0.0) {
        goto LABEL_145;
      }
      v236.origin.CGFloat x = x;
      v236.origin.CGFloat y = y;
      v236.size.CGFloat width = width;
      v236.size.CGFloat height = height;
      if (CGRectGetMaxY(v236) > 1.0) {
        goto LABEL_145;
      }
    }

    double v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
    double v76 = (void *)objc_claimAutoreleasedReturnValue([v75 objectForKeyedSubscript:MediaAnalysisLivePhotoEffectsResultsKey]);

    if (![v76 count])
    {
LABEL_56:

      uint64_t v33 = v186;
LABEL_57:
      if ((objc_msgSend(v189, "vcp_types") & 0x200000) != 0)
      {
        -[VCPImageChangeEntry setAudioClassification:](v33, "setAudioClassification:", 0LL);
        __int128 v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
        id v82 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKeyedSubscript:MediaAnalysisApplauseResultsKey]);
        BOOL v83 = [v82 count] == 0;

        if (!v83) {
          -[VCPImageChangeEntry setAudioClassification:]( v186,  "setAudioClassification:",  -[VCPImageChangeEntry audioClassification](v186, "audioClassification") | 1);
        }
        uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
        uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:MediaAnalysisBabbleResultsKey]);
        BOOL v86 = [v85 count] == 0;

        if (!v86) {
          -[VCPImageChangeEntry setAudioClassification:]( v186,  "setAudioClassification:",  -[VCPImageChangeEntry audioClassification](v186, "audioClassification") | 2);
        }
        CMTime v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
        id v88 = (void *)objc_claimAutoreleasedReturnValue([v87 objectForKeyedSubscript:MediaAnalysisCheeringResultsKey]);
        BOOL v89 = [v88 count] == 0;

        if (!v89) {
          -[VCPImageChangeEntry setAudioClassification:]( v186,  "setAudioClassification:",  -[VCPImageChangeEntry audioClassification](v186, "audioClassification") | 4);
        }
        float v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
        float v91 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:MediaAnalysisLaughterResultsKey]);
        BOOL v92 = [v91 count] == 0;

        if (!v92) {
          -[VCPImageChangeEntry setAudioClassification:]( v186,  "setAudioClassification:",  -[VCPImageChangeEntry audioClassification](v186, "audioClassification") | 8);
        }
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
        __int128 v94 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:MediaAnalysisVoiceResultsKey]);
        BOOL v95 = [v94 count] == 0;

        if (!v95) {
          -[VCPImageChangeEntry setAudioClassification:]( v186,  "setAudioClassification:",  -[VCPImageChangeEntry audioClassification](v186, "audioClassification") | 0x10);
        }
        double v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
        double v97 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:MediaAnalysisMusicResultsKey]);
        BOOL v98 = [v97 count] == 0;

        if (!v98) {
          -[VCPImageChangeEntry setAudioClassification:]( v186,  "setAudioClassification:",  -[VCPImageChangeEntry audioClassification](v186, "audioClassification") | 0x20);
        }
        v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        id v99 = objc_msgSend( (id)objc_opt_class(PFSceneTaxonomy),  "mad_audioTaxonomy:useResultsKey:",  1,  1);
        __int128 v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
        __int128 v192 = 0u;
        __int128 v193 = 0u;
        __int128 v190 = 0u;
        __int128 v191 = 0u;
        BOOL v101 = (void *)objc_claimAutoreleasedReturnValue([v100 allKeys]);
        id v102 = [v101 countByEnumeratingWithState:&v190 objects:v215 count:16];
        if (v102)
        {
          uint64_t v103 = *(void *)v191;
          do
          {
            for (i = 0LL; i != v102; i = (char *)i + 1)
            {
              if (*(void *)v191 != v103) {
                objc_enumerationMutation(v101);
              }
              uint64_t v105 = *(void *)(*((void *)&v190 + 1) + 8LL * (void)i);
              float v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
              id v107 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKeyedSubscript:v105]);
              BOOL v108 = [v107 count] == 0;

              if (!v108)
              {
                id v109 = objc_alloc(&OBJC_CLASS___PHSceneClassification);
                uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue([v100 objectForKeyedSubscript:v105]);
                id v111 = objc_msgSend( v109,  "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:",  objc_msgSend(v110, "longLongValue"),  3,  1.0,  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height,  0.0,  2.0);

                if (v111) {
                  [v187 addObject:v111];
                }
              }
            }

            id v102 = [v101 countByEnumeratingWithState:&v190 objects:v215 count:16];
          }

          while (v102);
        }

        -[VCPImageChangeEntry setAudioClassifications:](v186, "setAudioClassifications:", v187);
        uint64_t v33 = v186;
      }

      if (((unint64_t)objc_msgSend(v189, "vcp_types") & 0x400000000) != 0)
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "vcp_results"));
        id v113 = (void *)objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:MediaAnalysisAudioQualityResultsKey]);

        if ([v113 count])
        {
          id v115 = (void *)objc_claimAutoreleasedReturnValue([v113 objectAtIndexedSubscript:0]);
          uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue([v115 objectForKeyedSubscript:MediaAnalysisResultQualityKey]);
          [v116 floatValue];
          float v118 = v117;

          LODWORD(v119) = 1.0;
          if (v118 < MediaAnalysisAudioQualityThreshold) {
            *(float *)&double v119 = 0.0;
          }
          -[VCPImageChangeEntry setAudioScore:](v186, "setAudioScore:", v119);
        }

        else
        {
          LODWORD(v114) = 0.5;
          -[VCPImageChangeEntry setAudioScore:](v186, "setAudioScore:", v114);
        }

        uint64_t v33 = v186;
      }

      -[VCPImageChangeEntry setScreenTimeDeviceImageSensitivity:]( v33,  "setScreenTimeDeviceImageSensitivity:",  [(id)objc_opt_class(self) sensitivityFromAnalysis:v189]);

      uint64_t v33 = v186;
      goto LABEL_118;
    }

    double v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectAtIndexedSubscript:0]);
    double v78 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);

    if (v78)
    {
      double v79 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKeyedSubscript:MediaAnalysisResultLoopSuggestionStateAttributeKey]);
      -[VCPImageChangeEntry setLoopSuggestionState:]( v186,  "setLoopSuggestionState:",  [v79 unsignedIntegerValue]);

      uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue( [v78 objectForKeyedSubscript:MediaAnalysisResultLongExposureSuggestionStateAttributeKey]);
      -[VCPImageChangeEntry setLongExposureSuggestionState:]( v186,  "setLongExposureSuggestionState:",  [v80 unsignedIntegerValue]);

      goto LABEL_56;
    }

- (int)updateMovieAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v383 = a3;
  id v7 = a4;
  v384 = v7;
  if (v5)
  {
    unint64_t v9 = (unint64_t)+[PHAsset vcp_fullAnalysisImageOnlyTypes]( &OBJC_CLASS___PHAsset,  "vcp_fullAnalysisImageOnlyTypes");
    uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v11 >= 7)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v14, v15))
      {
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v383 localIdentifier]);
        uint64_t v17 = MediaAnalysisTypeDescription(objc_msgSend(v384, "vcp_types"));
        id v18 = (id)objc_claimAutoreleasedReturnValue(v17);
        unint64_t v19 = (unint64_t)objc_msgSend(v384, "vcp_types");
        uint64_t v20 = MediaAnalysisTypeShortDescription(v9);
        os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)CMTimeRange buf = 138413314;
        *(void *)v448 = v16;
        *(_WORD *)&v448[8] = 2112;
        *(void *)&v448[10] = v18;
        __int16 v449 = 2048;
        *(void *)&double v450 = v19 & v9;
        __int16 v451 = 2112;
        id v452 = v21;
        __int16 v453 = 2112;
        v454 = @"YES";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[%@] Update movie asset with analysis type %@ (%llu), required type %@, imageOnly:%@",  buf,  0x34u);
      }
    }

    if (v9)
    {
      unint64_t v22 = (unint64_t)objc_msgSend(v384, "vcp_types");
      if ((v9 & ~v22) == 0)
      {
        log = objc_alloc_init(&OBJC_CLASS___VCPMovieChangeEntry);
        -[VCPMovieChangeEntry setAsset:](log, "setAsset:", v383);
        -[VCPMovieChangeEntry setImageOnly:](log, "setImageOnly:", 1LL);
        if (((unint64_t)objc_msgSend(v384, "vcp_types") & 0x2000000000000) != 0)
        {
          double v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v384, "vcp_results"));
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKeyedSubscript:MediaAnalysisMiCaImageCaptionResultsKey]);

          uint64_t v77 = MediaAnalysisLogLevel(v75, v76);
          if ((int)v77 >= 7)
          {
            uint64_t v79 = VCPLogInstance(v77, v78);
            uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
            os_log_type_t v81 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v80, v81))
            {
              id v82 = (void *)objc_claimAutoreleasedReturnValue([v383 localIdentifier]);
              *(_DWORD *)CMTimeRange buf = 138412546;
              *(void *)v448 = v82;
              *(_WORD *)&v448[8] = 2112;
              *(void *)&v448[10] = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v80,  v81,  "[%@] Update Asset with MediaAnalysisMiCaImageCaptionResultsKey: %@",  buf,  0x16u);
            }
          }
        }

        else
        {
          id v24 = 0LL;
        }

        if ([v24 count])
        {
          BOOL v83 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]);
          uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);
          uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:MediaAnalysisResultImageCaptionTextAttributeKey]);

          -[VCPMovieChangeEntry setImageCaption:](log, "setImageCaption:", v85);
        }

        if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled]( &OBJC_CLASS___VCPVideoCNNAnalyzer,  "isMUBackboneEnabled")
          && ((unint64_t)objc_msgSend(v384, "vcp_types") & 0x1000000000000) != 0)
        {
          -[VCPMovieChangeEntry setImageEmbeddingVersion:](log, "setImageEmbeddingVersion:", 70LL);
        }

        -[NSMutableArray addObject:](self->_pendingChanges, "addObject:", log);

LABEL_39:
        int v68 = 0;
        goto LABEL_74;
      }

      uint64_t v58 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v58 >= 3)
      {
        uint64_t v60 = VCPLogInstance(v58, v59);
        uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        os_log_type_t v62 = VCPLogToOSLogType[3];
        log = (VCPMovieChangeEntry *)v61;
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v383 localIdentifier]);
          uint64_t v64 = MediaAnalysisTypeDescription(objc_msgSend(v384, "vcp_types"));
          id v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
          uint64_t v66 = MediaAnalysisTypeDescription(v9);
          id v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
          *(_DWORD *)CMTimeRange buf = 138412802;
          *(void *)v448 = v63;
          *(_WORD *)&v448[8] = 2112;
          *(void *)&v448[10] = v65;
          __int16 v449 = 2112;
          double v450 = *(double *)&v67;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)log,  v62,  "[%@] updateMovieAsset : analysis types %@ does not include required types %@, skip",  buf,  0x20u);
        }

        goto LABEL_39;
      }
    }

    else
    {
      uint64_t v52 = MediaAnalysisLogLevel(v11, v12);
      if ((int)v52 >= 3)
      {
        uint64_t v54 = VCPLogInstance(v52, v53);
        uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        os_log_type_t v56 = VCPLogToOSLogType[3];
        log = (VCPMovieChangeEntry *)v55;
        if (os_log_type_enabled(v55, v56))
        {
          os_log_type_t v57 = (void *)objc_claimAutoreleasedReturnValue([v383 localIdentifier]);
          *(_DWORD *)CMTimeRange buf = 138412290;
          *(void *)v448 = v57;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)log,  v56,  "[%@] updateMovieAsset : required types is MediaAnalysisTypeNone; skip",
            buf,
            0xCu);
        }

        goto LABEL_39;
      }
    }

- (int)updateLegacyAsset:(id)a3 withAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend(v7, "vcp_types") & 0x40000) != 0)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___VCPLegacyChangeEntry);
    -[VCPLegacyChangeEntry setAsset:](v8, "setAsset:", v6);
    -[VCPLegacyChangeEntry setMediaAnalysisVersion:](v8, "setMediaAnalysisVersion:", objc_msgSend(v7, "vcp_version"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_results"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:MediaAnalysisMovieSummaryResultsKey]);

    if ([v10 count])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);

      if (![v12 count])
      {

LABEL_36:
        goto LABEL_37;
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
      os_log_type_t v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "vcp_timerange");
      }

      else
      {
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v55 = 0u;
      }

      v54[0] = v55;
      v54[1] = v56;
      v54[2] = v57;
      -[VCPLegacyChangeEntry setSummaryTimeRange:](v8, "setSummaryTimeRange:", v54);

      id v30 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
      unint64_t v31 = (unint64_t)objc_msgSend(v30, "vcp_flags");
      LODWORD(v32) = 0;
      if ((v31 & 0x80000) != 0) {
        *(float *)&double v32 = 1.0;
      }
      -[VCPLegacyChangeEntry setAutoplayScore:](v8, "setAutoplayScore:", v32);

      if (!v8
        || (-[VCPLegacyChangeEntry summaryTimeRange](v8, "summaryTimeRange"), (v60 & 1) == 0)
        || (-[VCPLegacyChangeEntry summaryTimeRange](v8, "summaryTimeRange"), (v53 & 1) == 0)
        || (-[VCPLegacyChangeEntry summaryTimeRange](v8, "summaryTimeRange"), v52))
      {

        goto LABEL_36;
      }

      -[VCPLegacyChangeEntry summaryTimeRange](v8, "summaryTimeRange");

      if (v51 < 0) {
        goto LABEL_36;
      }
    }

    else
    {
      __int128 v15 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
      v50[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
      v50[1] = v15;
      v50[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
      -[VCPLegacyChangeEntry setSummaryTimeRange:](v8, "setSummaryTimeRange:", v50);
      LODWORD(v16) = 0;
      -[VCPLegacyChangeEntry setAutoplayScore:](v8, "setAutoplayScore:", v16);
    }

    if (!objc_msgSend(v6, "mad_isEligibleForComputeSync"))
    {
LABEL_35:
      -[NSMutableArray addObject:](self->_pendingChanges, "addObject:", v8);
      goto LABEL_36;
    }

    -[VCPLegacyChangeEntry setAnalysisStage:]( v8,  "setAnalysisStage:",  objc_msgSend(v6, "mad_analysisStageAfterCompletingAnalysis:", 1));
    id v17 = [v6 isVideo];
    if ((_DWORD)v17)
    {
      uint64_t v18 = VCPSignPostLog(v17);
      unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_signpost_id_t v20 = os_signpost_id_generate(v19);

      uint64_t v22 = VCPSignPostLog(v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      id v24 = v23;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "VCPPhotosAssetChangeManager_LegacyMovie_PackComputeSyncPayload",  (const char *)&unk_100199097,  buf,  2u);
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProtoAssetAnalysis movieAnalysisComputeSyncPayloadFromLegacyDictionary:]( &OBJC_CLASS___VCPProtoAssetAnalysis,  "movieAnalysisComputeSyncPayloadFromLegacyDictionary:",  v7));
      uint64_t v26 = VCPSignPostLog(v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      unsigned int v28 = v27;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)CMTimeRange buf = 0;
        os_log_type_t v29 = "VCPPhotosAssetChangeManager_LegacyMovie_PackComputeSyncPayload";
LABEL_30:
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  v20,  v29,  (const char *)&unk_100199097,  buf,  2u);
      }
    }

    else
    {
      uint64_t v33 = VCPSignPostLog(v17);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      os_signpost_id_t v20 = os_signpost_id_generate(v34);

      uint64_t v36 = VCPSignPostLog(v35);
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      unint64_t v38 = v37;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v38,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "VCPPhotosAssetChangeManager_LegacyImage_PackComputeSyncPayload",  (const char *)&unk_100199097,  buf,  2u);
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProtoAssetAnalysis imageAnalysisComputeSyncPayloadFromLegacyDictionary:]( &OBJC_CLASS___VCPProtoAssetAnalysis,  "imageAnalysisComputeSyncPayloadFromLegacyDictionary:",  v7));
      uint64_t v39 = VCPSignPostLog(v25);
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      unsigned int v28 = v40;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)CMTimeRange buf = 0;
        os_log_type_t v29 = "VCPPhotosAssetChangeManager_LegacyImage_PackComputeSyncPayload";
        goto LABEL_30;
      }
    }

    if (v25)
    {
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 data]);
      -[VCPLegacyChangeEntry setComputeSyncPayload:](v8, "setComputeSyncPayload:", v43);
    }

    else
    {
      uint64_t v45 = MediaAnalysisLogLevel(v41, v42);
      uint64_t v47 = VCPLogInstance(v45, v46);
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      os_log_type_t v48 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v43, v48))
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v6 localIdentifier]);
        *(_DWORD *)CMTimeRange buf = 138412290;
        uint64_t v59 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  v48,  "[%@] Failed to serialize analysis results as compute sync payload",  buf,  0xCu);
      }
    }

LABEL_34:
    goto LABEL_35;
  }

- (int)updateAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 7)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    os_log_type_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v14, v15))
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
      id v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_typeDescription"));
      uint64_t v18 = MediaAnalysisTypeDescription(objc_msgSend(v9, "vcp_types"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      os_signpost_id_t v20 = (void *)v19;
      uint64_t v21 = @"NO";
      *(_DWORD *)__int128 v56 = 138413058;
      *(void *)&v56[4] = v16;
      if (v5) {
        uint64_t v21 = @"YES";
      }
      *(_WORD *)&v56[12] = 2112;
      *(void *)&v56[14] = v17;
      *(_WORD *)&v56[22] = 2112;
      uint64_t v57 = v19;
      __int16 v58 = 2112;
      uint64_t v59 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[%@] Updating asset (%@) with results %@ (imageOnly: %@)",  v56,  0x2Au);
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vcp_dateModified", *(_OWORD *)v56));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_modificationDate"));
  unsigned __int8 v24 = [v22 isEqualToDate:v23];

  if ((v24 & 1) == 0)
  {
    uint64_t v30 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v30 >= 3)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vcp_dateModified"));
        id v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vcp_modificationDate"));
        *(_DWORD *)__int128 v56 = 138412802;
        *(void *)&v56[4] = v35;
        *(_WORD *)&v56[12] = 2112;
        *(void *)&v56[14] = v36;
        *(_WORD *)&v56[22] = 2112;
        uint64_t v57 = (uint64_t)v37;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[%@] analysis vcp_dateModified: %@, but asset vcp_modificationDate: %@; skip updating ...",
          v56,
          0x20u);
      }
    }

    goto LABEL_32;
  }

  unsigned int v27 = objc_msgSend(v9, "vcp_version");
  int v28 = MediaAnalysisVersion;
  if (v27 == MediaAnalysisVersion || v5 && [v8 isVideo])
  {
    if ([v8 isVideo]) {
      unsigned int v29 = -[VCPPhotosAssetChangeManager updateMovieAsset:withAnalysis:imageOnly:]( self,  "updateMovieAsset:withAnalysis:imageOnly:",  v8,  v9,  v5);
    }
    else {
      unsigned int v29 = -[VCPPhotosAssetChangeManager updateImageAsset:withAnalysis:imageOnly:]( self,  "updateImageAsset:withAnalysis:imageOnly:",  v8,  v9,  v5);
    }
LABEL_23:
    int v43 = v29;
    if (v29) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }

  id v38 = objc_msgSend(v9, "vcp_version");
  if ((int)v38 < v28
    && (signed int v40 = objc_msgSend(v9, "vcp_version"),
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaAnalysisProperties]),
        BOOL v42 = (unint64_t)[v41 mediaAnalysisVersion] < v40,
        v41,
        v42))
  {
    if (([v8 isVideo] & 1) != 0 || objc_msgSend(v8, "vcp_isLivePhoto"))
    {
      unsigned int v29 = -[VCPPhotosAssetChangeManager updateLegacyAsset:withAnalysis:]( self,  "updateLegacyAsset:withAnalysis:",  v8,  v9);
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v44 = MediaAnalysisLogLevel(v38, v39);
    if ((int)v44 >= 7)
    {
      uint64_t v46 = VCPLogInstance(v44, v45);
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      os_log_type_t v48 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
        unsigned int v50 = objc_msgSend(v9, "vcp_version");
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaAnalysisProperties]);
        unsigned int v52 = [v51 mediaAnalysisImageVersion];
        char v53 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaAnalysisProperties]);
        unsigned int v54 = [v53 mediaAnalysisVersion];
        *(_DWORD *)__int128 v56 = 138413058;
        *(void *)&v56[4] = v49;
        *(_WORD *)&v56[12] = 1024;
        *(_DWORD *)&v56[14] = v50;
        *(_WORD *)&v56[18] = 1024;
        *(_DWORD *)&v56[20] = v52;
        LOWORD(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 2) = v54;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  v48,  "[%@] Nothing to update Photos analysis vcp_version %d, Photos mediaAnalysisImageVersion %d, mediaAnalysisVersion %d",  v56,  0x1Eu);
      }
    }
  }

- (int)publishPendingChanges
{
  id v3 = -[NSMutableArray count](self->_pendingChanges, "count");
  if (!v3) {
    return 0;
  }
  uint64_t v5 = MediaAnalysisLogLevel(v3, v4);
  if ((int)v5 >= 5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = -[NSMutableArray count](self->_pendingChanges, "count");
      uint64_t v11 = qos_class_self();
      uint64_t v12 = VCPMAQoSDescription(v11);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)CMTimeRange buf = 67109378;
      unsigned int v36 = v10;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "  Publishing PHAssetPropertySetMediaAnalysis for %d assets (QoS: %@)",  buf,  0x12u);
    }
  }

  os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v14,  "addBreadcrumb:",  @"[PhotosAssetChangeManager] Persisting %d assets to Photos",  -[NSMutableArray count](self->_pendingChanges, "count"));

  os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v15 enterKnownTimeoutRisk:1];

  uint64_t v17 = VCPSignPostLog(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v21 = VCPSignPostLog(v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = v22;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "VCPFullAnalysisPersistChanges",  (const char *)&unk_100199097,  buf,  2u);
  }

  photoLibrarCGFloat y = self->_photoLibrary;
  id v33 = 0LL;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000ED830;
  v34[3] = &unk_1001BA0C8;
  v34[4] = self;
  -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v34, &v33);
  id v25 = v33;
  uint64_t v26 = VCPSignPostLog(v25);
  unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  int v28 = v27;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  v19,  "VCPFullAnalysisPersistChanges",  (const char *)&unk_100199097,  buf,  2u);
  }

  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  [v29 exitKnownTimeoutRisk];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  objc_msgSend( v30,  "addBreadcrumb:",  @"[PhotosAssetChangeManager] Finished persisting %d assets to Photos",  -[NSMutableArray count](self->_pendingChanges, "count"));

  -[NSMutableArray removeAllObjects](self->_pendingChanges, "removeAllObjects");
  self->_pendingResourceChangeCount = 0LL;
  if (v25) {
    int v31 = -18;
  }
  else {
    int v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
}

@end