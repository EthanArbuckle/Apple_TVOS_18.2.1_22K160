@interface MADVectorDatabaseUtilities
+ (int)_deepSyncWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 error:(id *)a5;
+ (int)_updateWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6;
+ (int)syncWithPhotoLibrary:(id)a3 ignoreExpiration:(BOOL)a4 threshold:(double)a5 cancelBlock:(id)a6 error:(id *)a7;
+ (int)updateWithAssetsEmbeddings:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6;
@end

@implementation MADVectorDatabaseUtilities

+ (int)updateWithAssetsEmbeddings:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (unsigned int (**)(void))a5;
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu assets",  [v9 count]));
  uint64_t v13 = MediaAnalysisLogLevel(v51, v12);
  if ((int)v13 >= 5)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v51;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[VSKDBUtil] Updating with %@", buf, 0xCu);
    }
  }

  if (v11 && v11[2](v11))
  {
    if (!a6)
    {
      int v20 = -128;
      goto LABEL_31;
    }

    NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[VSKDBUtil] Cancelled during updateWithAssetsEmbeddings"));
    v58 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v19));
    int v20 = -128;
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v21 pet];

    uint64_t v22 = mach_absolute_time();
    uint64_t v23 = VCPSignPostLog(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_signpost_id_t v25 = os_signpost_id_generate(v24);

    uint64_t v27 = VCPSignPostLog(v26);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    v29 = v28;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v51;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "MADVectorDatabaseUtilities_updateWithAssetsEmbeddings",  "%@",  buf,  0xCu);
    }

    id v30 = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:]( &OBJC_CLASS___MADVectorDatabaseManager,  "sharedDatabaseWithPhotoLibrary:",  v10));
    id v52 = 0LL;
    unsigned int v31 = [v18 insertOrReplaceAssetsEmbeddings:v9 error:&v52];
    id v32 = v52;
    v19 = v32;
    if (v31)
    {
      uint64_t v34 = MediaAnalysisLogLevel(v32, v33);
      id v10 = v30;
      if ((int)v34 >= 3)
      {
        uint64_t v36 = VCPLogInstance(v34, v35);
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        os_log_type_t v38 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v37, v38))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v51;
          __int16 v55 = 2112;
          v56 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "[VSKDBUtil] Failed to update embeddings for %@; skipping - %@",
            buf,
            0x16u);
        }
      }

      if (a6)
      {
        id v10 = v30;
        *a6 = [v19 copy];
      }

      int v20 = -18;
    }

    else
    {
      uint64_t v39 = VCPSignPostLog(v32);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      v41 = v40;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v51;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v41,  OS_SIGNPOST_INTERVAL_END,  v25,  "MADVectorDatabaseUtilities_updateWithAssetsEmbeddings",  "%@",  buf,  0xCu);
      }

      if (v22)
      {
        uint64_t v44 = mach_absolute_time();
        uint64_t v42 = VCPPerformance_LogMeasurement("MADVectorDatabaseUtilities_updateWithAssetsEmbeddings", v44 - v22);
      }

      uint64_t v45 = MediaAnalysisLogLevel(v42, v43);
      if ((int)v45 < 6)
      {
        int v20 = 0;
        id v10 = v30;
      }

      else
      {
        id v10 = v30;
        uint64_t v47 = VCPLogInstance(v45, v46);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        os_log_type_t v49 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v51;
          _os_log_impl((void *)&_mh_execute_header, v48, v49, "[VSKDBUtil] Updated vectorDatabase with %@", buf, 0xCu);
        }

        int v20 = 0;
      }
    }
  }

LABEL_31:
  return v20;
}

+ (int)_updateWithLocalIdentifiers:(id)a3 photoLibrary:(id)a4 cancelBlock:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v156 = a4;
  id v9 = a5;
  v157 = v8;
  v155 = v9;
  v158 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu localIdentifiers",  [v8 count]));
  uint64_t v11 = MediaAnalysisLogLevel(v158, v10);
  if ((int)v11 >= 5)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 138412290;
      v182 = v158;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[VSKDBUtil] Updating with %@", buf, 0xCu);
    }

    id v9 = v155;
  }

  if (!v9 || !(*((unsigned int (**)(id))v9 + 2))(v9))
  {
    os_log_type_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v17 pet];

    uint64_t v19 = VCPSignPostLog(v18);
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    uint64_t v23 = VCPSignPostLog(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_signpost_id_t v25 = v24;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 138412290;
      v182 = v158;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "MADVectorDatabaseUtilities_Update_FetchProperties",  "%@",  buf,  0xCu);
    }

    v162 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v156));
    v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v26 = objc_msgSend(v162, "queryHeadersForAssets:analyses:", v8);
    int v16 = (int)v26;
    if ((_DWORD)v26)
    {
      uint64_t v28 = MediaAnalysisLogLevel(v26, v27);
      if ((int)v28 >= 3)
      {
        uint64_t v30 = VCPLogInstance(v28, v29);
        unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        os_log_type_t v32 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 138412290;
          v182 = v158;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "[VSKDBUtil] Failed to fetch analysis properties for %@",  buf,  0xCu);
        }
      }

      if (!a6) {
        goto LABEL_114;
      }
      NSErrorUserInfoKey v186 = NSLocalizedDescriptionKey;
      v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[VSKDBUtil] Failed to fetch analysis properties for %@",  v158));
      v187 = v166;
      v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v187,  &v186,  1LL));
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v16));
      goto LABEL_113;
    }

    uint64_t v33 = VCPSignPostLog(v26);
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v35 = v34;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_DWORD *)buf = 138412290;
      v182 = v158;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_END,  v21,  "MADVectorDatabaseUtilities_Update_FetchProperties",  "%@",  buf,  0xCu);
    }

    v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v176 = 0u;
    __int128 v177 = 0u;
    __int128 v174 = 0u;
    __int128 v175 = 0u;
    id v36 = v8;
    id v37 = [v36 countByEnumeratingWithState:&v174 objects:v185 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v175;
      int v39 = MediaAnalysisEmbeddingForwardCompatibleVersion;
      os_log_type_t type = VCPLogToOSLogType[5];
      os_log_type_t v159 = VCPLogToOSLogType[3];
      os_log_type_t v40 = VCPLogToOSLogType[4];
      do
      {
        for (i = 0LL; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v175 != v38) {
            objc_enumerationMutation(v36);
          }
          uint64_t v42 = *(void **)(*((void *)&v174 + 1) + 8LL * (void)i);
          uint64_t v43 = objc_autoreleasePoolPush();
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v167 objectForKeyedSubscript:v42]);
          uint64_t v46 = v44;
          if (!v44)
          {
            uint64_t v58 = MediaAnalysisLogLevel(0LL, v45);
            uint64_t v60 = VCPLogInstance(v58, v59);
            id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v52, v40))
            {
              *(_DWORD *)buf = 138412290;
              v182 = v42;
              v54 = v52;
              os_log_type_t v55 = v40;
              v56 = "[VSKDBUtil][%@] No analysis record";
              goto LABEL_35;
            }

+ (int)_deepSyncWithPhotoLibrary:(id)a3 cancelBlock:(id)a4 error:(id *)a5
{
  id v180 = a3;
  v191 = (unsigned int (**)(void))a4;
  uint64_t v7 = MediaAnalysisLogLevel(v191, v6);
  if ((int)v7 >= 6)
  {
    uint64_t v9 = VCPLogInstance(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      v225 = @"[VSKDBUtil][DeepSync]";
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ Starting ...", buf, 0xCu);
    }
  }

  v184 = (void *)objc_claimAutoreleasedReturnValue( +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:]( &OBJC_CLASS___MADVectorDatabaseManager,  "sharedDatabaseWithPhotoLibrary:",  v180));
  NSErrorUserInfoKey v179 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v180));
  uint64_t v185 = mach_absolute_time();
  uint64_t v12 = VCPSignPostLog(v185);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  os_signpost_id_t spid = os_signpost_id_generate(v13);

  uint64_t v15 = VCPSignPostLog(v14);
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  os_log_type_t v17 = v16;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "MADVectorDatabaseUtilities_DeepSync_VSKLoop",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v215 = 0LL;
  id v194 = [v184 assetCountWithError:&v215];
  id v188 = v215;
  uint64_t v18 = objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v180,  1LL));
  __int16 v183 = (void *)v18;
  if (v194)
  {
    unint64_t v19 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v186 = VCPLogToOSLogType[3];
    do
    {
      int v20 = objc_autoreleasePoolPush();
      if (v191 && v191[2]())
      {
        if (!a5)
        {
          int v198 = -128;
          int v23 = 1;
          goto LABEL_38;
        }

        NSErrorUserInfoKey v231 = NSLocalizedDescriptionKey;
        os_signpost_id_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Cancelled during looping VSKDB",  @"[VSKDBUtil][DeepSync]"));
        v232 = v21;
        id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v232,  &v231,  1LL));
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v22));
        int v198 = -128;
        int v23 = 1;
      }

      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
        [v24 pet];

        os_signpost_id_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        id v214 = v188;
        os_signpost_id_t v25 = (void *)objc_claimAutoreleasedReturnValue([v184 fetchAllAssetsWithLimit:1000 offset:v19 error:&v214]);
        id v196 = v214;

        __int128 v212 = 0u;
        __int128 v213 = 0u;
        __int128 v210 = 0u;
        __int128 v211 = 0u;
        id v22 = v25;
        id v26 = [v22 countByEnumeratingWithState:&v210 objects:v230 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v211;
          do
          {
            for (i = 0LL; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v211 != v27) {
                objc_enumerationMutation(v22);
              }
              uint64_t v29 = *(void **)(*((void *)&v210 + 1) + 8LL * (void)i);
              uint64_t v30 = objc_autoreleasePoolPush();
              unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mad_photosLocalIdentifier"));
              [v21 addObject:v31];

              objc_autoreleasePoolPop(v30);
            }

            id v26 = [v22 countByEnumeratingWithState:&v210 objects:v230 count:16];
          }

          while (v26);
        }

        os_log_type_t v32 = (void *)objc_claimAutoreleasedReturnValue([v21 allObjects]);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v32,  v183));

        id v34 = [v33 count];
        if (v34 == [v21 count]) {
          goto LABEL_35;
        }
        for (unint64_t j = 0LL; ; ++j)
        {
          id v36 = [v33 count];
          uint64_t v38 = objc_autoreleasePoolPush();
          int v39 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndexedSubscript:j]);
          os_log_type_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 localIdentifier]);
          [v21 removeObject:v40];

          objc_autoreleasePoolPop(v38);
        }

        uint64_t v41 = MediaAnalysisLogLevel(v36, v37);
        if ((int)v41 >= 6)
        {
          uint64_t v43 = VCPLogInstance(v41, v42);
          uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, type))
          {
            id v45 = [v21 count];
            *(_DWORD *)buf = 138412802;
            v225 = @"[VSKDBUtil][DeepSync]";
            __int16 v226 = 2048;
            id v227 = v45;
            __int16 v228 = 2112;
            v229 = v21;
            _os_log_impl((void *)&_mh_execute_header, v44, type, "%@ Deleting %lu assets from VSKDB ... %@", buf, 0x20u);
          }
        }

        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v21 allObjects]);
        unsigned int v47 = [v184 removeEmbeddingsWithLocalIdentifiers:v46 error:a5];

        if (!v47)
        {
LABEL_35:
          int v23 = 0;
        }

        else
        {
          uint64_t v50 = MediaAnalysisLogLevel(v48, v49);
          if ((int)v50 >= 3)
          {
            uint64_t v52 = VCPLogInstance(v50, v51);
            unsigned int v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, v186))
            {
              *(_DWORD *)buf = 138412290;
              v225 = @"[VSKDBUtil][DeepSync]";
              _os_log_impl( (void *)&_mh_execute_header,  v53,  v186,  "%@ Failed to remove embeddings from VSKDB",  buf,  0xCu);
            }
          }

          int v23 = 1;
          int v198 = v47;
        }

        id v188 = v196;
      }

LABEL_38:
      objc_autoreleasePoolPop(v20);
      if (v23) {
        goto LABEL_152;
      }
      v19 += 1000LL;
    }

    while (v19 < (unint64_t)v194);
  }

  uint64_t v54 = VCPSignPostLog(v18);
  os_log_type_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
  v56 = v55;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v56,  OS_SIGNPOST_INTERVAL_END,  spid,  "MADVectorDatabaseUtilities_DeepSync_VSKLoop",  (const char *)&unk_100199097,  buf,  2u);
  }

  if (v185)
  {
    uint64_t v59 = mach_absolute_time();
    uint64_t v57 = VCPPerformance_LogMeasurement("MADVectorDatabaseUtilities_DeepSync_VSKLoop", v59 - v185);
  }

  uint64_t v60 = MediaAnalysisLogLevel(v57, v58);
  if ((int)v60 >= 7)
  {
    uint64_t v62 = VCPLogInstance(v60, v61);
    uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    os_log_type_t v64 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v63, v64))
    {
      *(_DWORD *)buf = 138412290;
      v225 = @"[VSKDBUtil][DeepSync]";
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "%@ Stage 1 - VSKLoop finished", buf, 0xCu);
    }
  }

  uint64_t v175 = mach_absolute_time();
  uint64_t v65 = VCPSignPostLog(v175);
  v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
  os_signpost_id_t v176 = os_signpost_id_generate(v66);

  uint64_t v68 = VCPSignPostLog(v67);
  unint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
  id v70 = v69;
  if (v176 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v70,  OS_SIGNPOST_INTERVAL_BEGIN,  v176,  "MADVectorDatabaseUtilities_DeepSync_MALoop",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue( +[VCPAnalyzedAssets assetsFromPhotoLibrary:]( &OBJC_CLASS___VCPAnalyzedAssets,  "assetsFromPhotoLibrary:",  v180));
  unint64_t v192 = 0LL;
  os_signpost_id_t spida = -1LL;
  os_log_type_t v195 = VCPLogToOSLogType[3];
  os_log_type_t v178 = VCPLogToOSLogType[6];
  while (1)
  {
    id v72 = [v71 count];
    v187 = objc_autoreleasePoolPush();
    if (!v191 || !v191[2]())
    {
      uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v75 pet];

      v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      os_signpost_id_t v76 = spida;
      while (1)
      {
        id v77 = [v71 count];
        else {
          unint64_t v78 = (unint64_t)v77;
        }
        if (++v76 >= v78)
        {
          id v208 = v188;
          v182 = (void *)objc_claimAutoreleasedReturnValue([v184 fetchAssetsWithLocalIdentifiers:v197 error:&v208]);
          id v181 = v208;

          os_signpost_id_t v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
          __int128 v206 = 0u;
          __int128 v207 = 0u;
          __int128 v204 = 0u;
          __int128 v205 = 0u;
          id v73 = v182;
          id v91 = [v73 countByEnumeratingWithState:&v204 objects:v219 count:16];
          if (v91)
          {
            uint64_t v92 = *(void *)v205;
            do
            {
              for (k = 0LL; k != v91; k = (char *)k + 1)
              {
                if (*(void *)v205 != v92) {
                  objc_enumerationMutation(v73);
                }
                v94 = *(void **)(*((void *)&v204 + 1) + 8LL * (void)k);
                v95 = objc_autoreleasePoolPush();
                v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "mad_photosLocalIdentifier"));
                [v90 addObject:v96];

                objc_autoreleasePoolPop(v95);
              }

              id v91 = [v73 countByEnumeratingWithState:&v204 objects:v219 count:16];
            }

            while (v91);
          }

          id v97 = [v90 count];
          if (v97 == [v197 count])
          {
            int v74 = 0;
          }

          else
          {
            id v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v197));
            __int128 v202 = 0u;
            __int128 v203 = 0u;
            __int128 v200 = 0u;
            __int128 v201 = 0u;
            id v99 = v90;
            id v100 = [v99 countByEnumeratingWithState:&v200 objects:v218 count:16];
            if (v100)
            {
              uint64_t v101 = *(void *)v201;
              do
              {
                for (m = 0LL; m != v100; m = (char *)m + 1)
                {
                  if (*(void *)v201 != v101) {
                    objc_enumerationMutation(v99);
                  }
                  uint64_t v103 = *(void *)(*((void *)&v200 + 1) + 8LL * (void)m);
                  os_log_type_t v104 = objc_autoreleasePoolPush();
                  [v98 removeObject:v103];
                  objc_autoreleasePoolPop(v104);
                }

                id v100 = [v99 countByEnumeratingWithState:&v200 objects:v218 count:16];
              }

              while (v100);
            }

            uint64_t v107 = MediaAnalysisLogLevel(v105, v106);
            if ((int)v107 >= 6)
            {
              uint64_t v109 = VCPLogInstance(v107, v108);
              uint64_t v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
              if (os_log_type_enabled(v110, v178))
              {
                id v111 = [v98 count];
                *(_DWORD *)buf = 138412802;
                v225 = @"[VSKDBUtil][DeepSync]";
                __int16 v226 = 2048;
                id v227 = v111;
                __int16 v228 = 2112;
                v229 = v98;
                _os_log_impl( (void *)&_mh_execute_header,  v110,  v178,  "%@ Inserting %lu assets from MADB ... %@",  buf,  0x20u);
              }
            }

            if ([v98 count]
              && (os_signpost_id_t v112 = (void *)objc_opt_class(a1),
                  uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue([v98 allObjects]),
                  unsigned int v114 = [v112 _updateWithLocalIdentifiers:v113 photoLibrary:v180 cancelBlock:v191 error:a5],  v113,  v114))
            {
              uint64_t v117 = MediaAnalysisLogLevel(v115, v116);
              if ((int)v117 >= 3)
              {
                uint64_t v119 = VCPLogInstance(v117, v118);
                uint64_t v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
                if (os_log_type_enabled(v120, v195))
                {
                  id v121 = [v98 count];
                  *(_DWORD *)buf = 138412546;
                  v225 = @"[VSKDBUtil][DeepSync]";
                  __int16 v226 = 2048;
                  id v227 = v121;
                  _os_log_impl( (void *)&_mh_execute_header,  v120,  v195,  "%@ Failed to update vector database with %lu localIdentifiers",  buf,  0x16u);
                }
              }

              int v74 = 1;
              int v198 = v114;
            }

            else
            {
              int v74 = 0;
            }
          }

          id v188 = v181;
          goto LABEL_108;
        }

        id v79 = objc_autoreleasePoolPush();
        id v209 = 0LL;
        unsigned int v80 = [v71 next:&v209];
        id v81 = v209;
        uint64_t v83 = v81;
        if (v80)
        {
          uint64_t v84 = MediaAnalysisLogLevel(v81, v82);
          if ((int)v84 >= 3)
          {
            uint64_t v86 = VCPLogInstance(v84, v85);
            uint64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v87, v195))
            {
              *(_DWORD *)buf = 138412290;
              v225 = @"[VSKDBUtil][DeepSync]";
              _os_log_impl((void *)&_mh_execute_header, v87, v195, "%@ Failed to query next asset", buf, 0xCu);
            }
          }

          if (!a5)
          {
            int v198 = -18;
            goto LABEL_75;
          }

          NSErrorUserInfoKey v220 = NSLocalizedDescriptionKey;
          uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to query next asset",  @"[VSKDBUtil][DeepSync]"));
          v221 = v88;
          v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v221,  &v220,  1LL));
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v89));

          int v198 = -18;
        }

        else
        {
          uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue([v81 localIdentifier]);
          [v197 addObject:v88];
        }

LABEL_75:
        objc_autoreleasePoolPop(v79);
        if (v80)
        {
          int v74 = 1;
          goto LABEL_109;
        }
      }
    }

    if (a5)
    {
      NSErrorUserInfoKey v222 = NSLocalizedDescriptionKey;
      v197 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Cancelled during looping MADB",  @"[VSKDBUtil][DeepSync]"));
      v223 = v197;
      id v73 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v223,  &v222,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v73));
      int v198 = -128;
      int v74 = 1;
LABEL_108:

LABEL_109:
    }

    else
    {
      int v198 = -128;
      int v74 = 1;
    }

    objc_autoreleasePoolPop(v187);
    v192 += 1000LL;
    spida += 1000LL;
    if (v74) {
      goto LABEL_151;
    }
  }

  uint64_t v122 = VCPSignPostLog(v72);
  uint64_t v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
  v124 = v123;
  if (v176 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v123))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v124,  OS_SIGNPOST_INTERVAL_END,  v176,  "MADVectorDatabaseUtilities_DeepSync_MALoop",  (const char *)&unk_100199097,  buf,  2u);
  }

  if (v175)
  {
    uint64_t v127 = mach_absolute_time();
    uint64_t v125 = VCPPerformance_LogMeasurement("MADVectorDatabaseUtilities_DeepSync_MALoop", v127 - v175);
  }

  uint64_t v128 = MediaAnalysisLogLevel(v125, v126);
  if ((int)v128 >= 7)
  {
    uint64_t v130 = VCPLogInstance(v128, v129);
    id v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
    os_log_type_t v132 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v131, v132))
    {
      *(_DWORD *)buf = 138412290;
      v225 = @"[VSKDBUtil][DeepSync]";
      _os_log_impl((void *)&_mh_execute_header, v131, v132, "%@ Stage 2 - MALoop finished", buf, 0xCu);
    }
  }

  uint64_t v133 = mach_absolute_time();
  uint64_t v134 = VCPSignPostLog(v133);
  v135 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
  os_signpost_id_t v136 = os_signpost_id_generate(v135);

  uint64_t v138 = VCPSignPostLog(v137);
  uint64_t v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
  uint64_t v140 = v139;
  if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v139))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v140,  OS_SIGNPOST_INTERVAL_BEGIN,  v136,  "MADVectorDatabaseUtilities_DeepSync_BuildDB",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v141 = [v184 rebuildWithForce:1 cancelBlock:v191 extendTimeoutBlock:&stru_1001BD3F8 error:a5];
  int v198 = (int)v141;
  if (!(_DWORD)v141)
  {
    uint64_t v148 = VCPSignPostLog(v141);
    uint64_t v149 = (os_log_s *)objc_claimAutoreleasedReturnValue(v148);
    uint64_t v150 = v149;
    if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v149))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v150,  OS_SIGNPOST_INTERVAL_END,  v136,  "MADVectorDatabaseUtilities_DeepSync_BuildDB",  (const char *)&unk_100199097,  buf,  2u);
    }

    os_log_type_t v153 = v178;
    if (v133)
    {
      uint64_t v154 = mach_absolute_time();
      uint64_t v151 = VCPPerformance_LogMeasurement("MADVectorDatabaseUtilities_DeepSync_BuildDB", v154 - v133);
    }

    uint64_t v155 = MediaAnalysisLogLevel(v151, v152);
    if ((int)v155 >= 7)
    {
      uint64_t v157 = VCPLogInstance(v155, v156);
      v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);
      os_log_type_t v159 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v158, v159))
      {
        *(_DWORD *)buf = 138412290;
        v225 = @"[VSKDBUtil][DeepSync]";
        _os_log_impl((void *)&_mh_execute_header, v158, v159, "%@ Stage 3 - Rebuild finished", buf, 0xCu);
      }

      os_log_type_t v153 = v178;
    }

    uint64_t v160 = MediaAnalysisLogLevel(v155, v156);
    if ((int)v160 >= 6)
    {
      uint64_t v162 = VCPLogInstance(v160, v161);
      os_log_type_t v163 = (os_log_s *)objc_claimAutoreleasedReturnValue(v162);
      if (os_log_type_enabled(v163, v153))
      {
        *(_DWORD *)buf = 138412290;
        v225 = @"[VSKDBUtil][DeepSync]";
        _os_log_impl((void *)&_mh_execute_header, v163, v153, "%@ Finished ...", buf, 0xCu);
      }
    }

    v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v164 timeIntervalSinceReferenceDate];
    unsigned int v166 = [v179 setValue:(uint64_t)v165 forKey:@"VectorDatabaseDeepSyncTimestamp"];

    id v167 = [v179 commit];
    if (!(v166 | v167))
    {
      int v198 = 0;
      goto LABEL_151;
    }

    uint64_t v169 = MediaAnalysisLogLevel(v167, v168);
    if ((int)v169 >= 3)
    {
      uint64_t v171 = VCPLogInstance(v169, v170);
      id v172 = (os_log_s *)objc_claimAutoreleasedReturnValue(v171);
      if (os_log_type_enabled(v172, v195))
      {
        *(_DWORD *)buf = 138412290;
        v225 = @"[VSKDBUtil][DeepSync]";
        _os_log_impl((void *)&_mh_execute_header, v172, v195, "%@ Failed to persist deep sync date", buf, 0xCu);
      }
    }

    if (!a5)
    {
      int v198 = -18;
      goto LABEL_151;
    }

    NSErrorUserInfoKey v216 = NSLocalizedDescriptionKey;
    id v146 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed to persist deep sync date",  @"[VSKDBUtil][DeepSync]"));
    v217 = v146;
    id v173 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v217,  &v216,  1LL));
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v173));

    int v198 = -18;
    goto LABEL_148;
  }

  uint64_t v143 = MediaAnalysisLogLevel(v141, v142);
  if ((int)v143 >= 3)
  {
    uint64_t v145 = VCPLogInstance(v143, v144);
    id v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(v145);
    if (os_log_type_enabled(v146, v195))
    {
      id v147 = *a5;
      *(_DWORD *)buf = 138412546;
      v225 = @"[VSKDBUtil][DeepSync]";
      __int16 v226 = 2112;
      id v227 = v147;
      _os_log_impl((void *)&_mh_execute_header, v146, v195, "%@ Failed to build VSKDB - %@", buf, 0x16u);
    }

+ (int)syncWithPhotoLibrary:(id)a3 ignoreExpiration:(BOOL)a4 threshold:(double)a5 cancelBlock:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = +[VCPVideoCNNAnalyzer isMUBackboneEnabled](&OBJC_CLASS___VCPVideoCNNAnalyzer, "isMUBackboneEnabled");
  if ((v13 & 1) != 0)
  {
    uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
    if ((int)v15 >= 6)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_log_type_t v19 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        int v74 = @"[VSKDBUtil][Sync]";
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Starting ...", buf, 0xCu);
      }
    }

    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v11));
    id v21 = [v20 valueForKey:@"VectorDatabaseDeepSyncTimestamp"];
    if (v21) {
      id v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)v21));
    }
    else {
      id v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    }
    id v22 = [v70 timeIntervalSinceNow];
    if (v29 >= -2592000.0 || v9)
    {
      uint64_t v35 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v35 >= 6)
      {
        uint64_t v37 = VCPLogInstance(v35, v36);
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        os_log_type_t v39 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v38, v39))
        {
          os_log_type_t v40 = @"NO";
          *(_DWORD *)buf = 138412802;
          int v74 = @"[VSKDBUtil][Sync]";
          __int16 v75 = 2112;
          double v76 = *(double *)&v70;
          if (v9) {
            os_log_type_t v40 = @"YES";
          }
          __int16 v77 = 2112;
          double v78 = *(double *)&v40;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  v39,  "%@ Most recent deep-sync at %@ (ignore expiration: %@)",  buf,  0x20u);
        }
      }

      id v72 = 0LL;
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:]( &OBJC_CLASS___MADVectorDatabaseManager,  "sharedDatabaseWithPhotoLibrary:",  v11));
      id v41 = [v67 embeddingCountWithError:&v72];
      id v42 = v72;
      id v71 = v42;
      uint64_t v43 = (char *)[v67 assetCountWithError:&v71];
      id v68 = v71;

      uint64_t v44 = (char *)[v20 countOfAssetsWithMediaAnalysisResultsType:73];
      id v45 = [v20 countOfAssetsWithMediaAnalysisResultsType:82];
      id v47 = v45;
      else {
        uint64_t v48 = (uint64_t)v43;
      }
      if (v43 - &v44[(void)v45] >= 0) {
        uint64_t v49 = v43 - &v44[(void)v45];
      }
      else {
        uint64_t v49 = &v44[(void)v45] - v43;
      }
      uint64_t v50 = MediaAnalysisLogLevel(v45, v46);
      double v52 = (double)v49 / (double)v48;
      if ((int)v50 >= 6)
      {
        uint64_t v53 = VCPLogInstance(v50, v51);
        uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        os_log_type_t v55 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v54, v55))
        {
          *(_DWORD *)buf = 138413570;
          int v74 = @"[VSKDBUtil][Sync]";
          __int16 v75 = 2048;
          double v76 = *(double *)&v41;
          __int16 v77 = 2048;
          double v78 = *(double *)&v43;
          __int16 v79 = 2048;
          unsigned int v80 = v44;
          __int16 v81 = 2048;
          id v82 = v47;
          __int16 v83 = 2048;
          double v84 = v52 * 100.0;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "%@ vdb-embeddings: %ld, vdb-assets: %ld, madb-assetsWithImageEmbeddings: %ld, madb-assetsWithVideoEmbeddings : %ld -> (difference: %.2f%%)",  buf,  0x3Eu);
        }
      }

      if (v52 <= a5)
      {
        uint64_t v61 = MediaAnalysisLogLevel(v50, v51);
        if ((int)v61 >= 6)
        {
          uint64_t v63 = VCPLogInstance(v61, v62);
          os_log_type_t v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          os_log_type_t v65 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v64, v65))
          {
            *(_DWORD *)buf = 138412290;
            int v74 = @"[VSKDBUtil][Sync]";
            _os_log_impl((void *)&_mh_execute_header, v64, v65, "%@ Finished", buf, 0xCu);
          }
        }

        int v28 = 0;
      }

      else
      {
        uint64_t v56 = MediaAnalysisLogLevel(v50, v51);
        if ((int)v56 >= 5)
        {
          uint64_t v58 = VCPLogInstance(v56, v57);
          uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          os_log_type_t v60 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v59, v60))
          {
            *(_DWORD *)buf = 138412802;
            int v74 = @"[VSKDBUtil][Sync]";
            __int16 v75 = 2048;
            double v76 = v52 * 100.0;
            __int16 v77 = 2048;
            double v78 = a5 * 100.0;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  v60,  "%@ Database content is different significantly %.2f%% (>%.2f%%)",  buf,  0x20u);
          }
        }

        int v28 = [(id)objc_opt_class(a1) _deepSyncWithPhotoLibrary:v11 cancelBlock:v12 error:a7];
      }
    }

    else
    {
      uint64_t v30 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v30 >= 5)
      {
        uint64_t v32 = VCPLogInstance(v30, v31);
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        os_log_type_t v34 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138412546;
          int v74 = @"[VSKDBUtil][Sync]";
          __int16 v75 = 2112;
          double v76 = *(double *)&v70;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "%@ Best-By date expired (%@)", buf, 0x16u);
        }
      }

      int v28 = [(id)objc_opt_class(a1) _deepSyncWithPhotoLibrary:v11 cancelBlock:v12 error:a7];
    }

LABEL_50:
    goto LABEL_51;
  }

  uint64_t v24 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v24 >= 7)
  {
    uint64_t v26 = VCPLogInstance(v24, v25);
    int v20 = (void *)objc_claimAutoreleasedReturnValue(v26);
    os_log_type_t v27 = VCPLogToOSLogType[7];
    if (os_log_type_enabled((os_log_t)v20, v27))
    {
      *(_DWORD *)buf = 138412290;
      int v74 = @"[VSKDBUtil][Sync]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  v27,  "%@ Embedding generation disabled, skip deep sync",  buf,  0xCu);
    }

    int v28 = 0;
    goto LABEL_50;
  }

  int v28 = 0;
LABEL_51:

  return v28;
}

@end