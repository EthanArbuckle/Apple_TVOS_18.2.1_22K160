@interface OSASubmitter
+ (id)extractAuthenticatedBlob:(id)a3 error:(id *)a4;
+ (id)submissionPathsWithHomeDirectory:(id)a3;
- (BOOL)allowUnsignedBlobs;
- (BOOL)cheaterTaskingWithSets:(id)a3 usingConfig:(id)a4 resultsCallback:(id)a5;
- (BOOL)submitLogsUsingPolicy:(id)a3 resultsCallback:(id)a4;
- (BOOL)taskingNeedsRefreshForRouting:(id)a3 at:(double)a4;
- (NSArray)internalWhitelist;
- (NSDictionary)launchInfo;
- (NSString)connectionType;
- (NSURL)submissionURL;
- (OSASubmitter)init;
- (id)applyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6;
- (id)getAdditionalRequestHeaders;
- (id)locateLog:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7;
- (id)primarySubmissionPaths;
- (id)processJob:(id)a3 forRouting:(id)a4 including:(id)a5 usingConfig:(id)a6 taskings:(id)a7 summarize:(id)a8 additionalRequestHeaders:(id)a9;
- (id)processSubmissionJobs:(id)a3 usingConfig:(id)a4 summarize:(id)a5;
- (id)taskingLastSuccessfulRequest;
- (void)getAdditionalRequestHeaders;
- (void)prefaceSubmission:(id)a3 withData:(id)a4 usingArchive:(id)a5 andHeaders:(id)a6;
- (void)prepConfig:(id)a3;
- (void)setAllowUnsignedBlobs:(BOOL)a3;
- (void)setConnectionType:(id)a3;
- (void)setInternalWhitelist:(id)a3;
- (void)setLaunchInfo:(id)a3;
- (void)updateTaskingLastSuccessfulRequest:(id)a3 at:(double)a4;
@end

@implementation OSASubmitter

- (OSASubmitter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OSASubmitter;
  v2 = -[OSASubmitter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    connectionType = v2->_connectionType;
    v2->_connectionType = (NSString *)@"proxied";
  }

  return v3;
}

- (NSURL)submissionURL
{
  return 0LL;
}

- (void)prefaceSubmission:(id)a3 withData:(id)a4 usingArchive:(id)a5 andHeaders:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v10 objectForKeyedSubscript:@"content"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v13 length])
  {
    v14 = objc_alloc(&OBJC_CLASS___OSAEphemeralLog);
    [v10 objectForKeyedSubscript:@"metadata"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[OSAEphemeralLog initWithData:andMetadata:](v14, "initWithData:andMetadata:", v13, v15);

    if (v16)
    {
      uint64_t v17 = objc_msgSend(v11, "copyDeflatedDataFromStream:withCap:", -[OSAEphemeralLog stream](v16, "stream"), 4096);
      if (v17)
      {
        v18 = (void *)v17;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v18 length];
          v20 = -[OSAEphemeralLog metaData](v16, "metaData");
          *(_DWORD *)buf = 134218242;
          uint64_t v27 = v19;
          __int16 v28 = 2112;
          v29 = v20;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "preface payload %ld, metadata: %@",  buf,  0x16u);
        }

        v21 = (void *)[v12 mutableCopy];
        v22 = -[OSAEphemeralLog metaData](v16, "metaData");
        [v21 addEntriesFromDictionary:v22];

        objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v18, "length"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 setValue:v23 forKey:@"length"];

        [v21 setValue:@"deflate" forKey:@"compression"];
        uint64_t v25 = 0LL;
        [MEMORY[0x1896078D8] dataWithJSONObject:v21 options:0 error:&v25];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 appendData:v24];
        [v9 appendBytes:"\n" length:1];
        [v9 appendData:v18];
        [v9 appendBytes:"\n" length:1];
        -[OSAEphemeralLog closeFileStream](v16, "closeFileStream");
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = 4096;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Submission archive too big (> %u) for submission with preface",  buf,  8u);
      }
    }
  }
}

- (id)getAdditionalRequestHeaders
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x189611B08] fastLane];
  if (v3 >= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:@"x-fast-lane"];
  }

  if ([v2 count] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[OSASubmitter getAdditionalRequestHeaders].cold.1((uint64_t)v2);
  }
  return v2;
}

- (id)processSubmissionJobs:(id)a3 usingConfig:(id)a4 summarize:(id)a5
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = v9;
  id v88 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  self->_unsigned int jobCount = 0;
  unint64_t v13 = 0x189603000uLL;
  [MEMORY[0x189603FC8] dictionary];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 identifier];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setObject:v15 forKeyedSubscript:@"name"];

  unint64_t v16 = 0x189603000uLL;
  [MEMORY[0x189603FA8] array];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[OSASubmitter getAdditionalRequestHeaders](v10, "getAdditionalRequestHeaders");
  v92 = objc_alloc_init(&OBJC_CLASS___OSAStreamDeflater);
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  id obj = v8;
  v93 = v10;
  uint64_t v77 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
  if (v77)
  {
    uint64_t v78 = *(void *)v106;
    id v85 = v11;
    v76 = v14;
    while (2)
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v106 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v80 = v17;
        v18 = *(void **)(*((void *)&v105 + 1) + 8 * v17);
        [v18 objectForKey:@"routing"];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 objectForKeyedSubscript:@"<inactive>"];
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v109[0] = @"<inactive>";
          [v18 objectForKeyedSubscript:@"<inactive>"];
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          v109[1] = @"routing";
          v110[0] = v21;
          v110[1] = v19;
          [MEMORY[0x189603F68] dictionaryWithObjects:v110 forKeys:v109 count:2];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v84 addObject:v22];
        }

        else
        {
          v83 = v18;
          [v18 objectForKey:@"logs"];
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:0x80000];
          objc_msgSend(*(id *)(v16 + 4008), "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v19;
          unsigned int v25 = ([v19 isEqualToString:@"anon"] & 1) != 0
             || ([v19 isEqualToString:@"beta"] & 1) != 0
             || [v19 isEqualToString:@"session"];
          else {
            uint64_t v26 = v25;
          }
          [v11 assembleMetadataAt:v26 withOptions:Current];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v83 objectForKey:@"submission_info"];
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v27;
          [v27 setValue:v28 forKey:@"submission_info"];

          [*(id *)(v13 + 4040) dictionary];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v83 objectForKeyedSubscript:@"<metadata>"];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v31 = (void *)MEMORY[0x189607968];
            [v83 objectForKeyedSubscript:@"<metadata>"];
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "numberWithBool:", objc_msgSend(v32, "BOOLValue"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v29 setObject:v33 forKeyedSubscript:@"<metadata>"];

            id v10 = v93;
          }

          v97 = v29;
          __int128 v103 = 0u;
          __int128 v104 = 0u;
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          id v21 = v23;
          uint64_t v98 = [v21 countByEnumeratingWithState:&v101 objects:v113 count:16];
          if (v98)
          {
            uint64_t v96 = *(void *)v102;
            id v94 = v21;
            do
            {
              for (uint64_t i = 0LL; i != v98; ++i)
              {
                if (*(void *)v102 != v96) {
                  objc_enumerationMutation(v94);
                }
                v35 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                v36 = (void *)MEMORY[0x1895B84F4]();
                id v100 = 0LL;
                v37 = v24;
                v38 = -[OSASubmitter locateLog:forRouting:usingConfig:options:error:]( v10,  "locateLog:forRouting:usingConfig:options:error:",  v35,  v24,  v11,  v97,  &v100);
                id v39 = v100;
                id v40 = v35;
                if (getxattr((const char *)[v40 UTF8String], "DoNotSubmit", 0, 0, 0, 0) < 1)
                {
                  if (v38)
                  {
                    uint64_t v41 = -[OSAStreamDeflater copyDeflatedDataFromStream:withCap:]( v92,  "copyDeflatedDataFromStream:withCap:",  [v38 stream],  10477568);
                    if (v41)
                    {
                      v42 = (void *)v41;
                      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
                      {
                        uint64_t v57 = [v42 length];
                        [v38 metaData];
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        *(void *)v112 = v40;
                        *(_WORD *)&v112[8] = 2048;
                        *(void *)&v112[10] = v57;
                        *(_WORD *)&v112[18] = 2112;
                        *(void *)&v112[20] = v58;
                        _os_log_debug_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "'%@' payload %ld, metadata: %@",  buf,  0x20u);
                      }

                      v43 = (void *)[v87 mutableCopy];
                      [v38 metaData];
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      [v43 addEntriesFromDictionary:v44];

                      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v42, "length"));
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      [v43 setValue:v45 forKey:@"length"];

                      [v43 setValue:@"deflate" forKey:@"compression"];
                      id v99 = 0LL;
                      [MEMORY[0x1896078D8] dataWithJSONObject:v43 options:0 error:&v99];
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      id v90 = v99;
                      v91 = v46;
                      uint64_t v47 = [v46 length];
                      uint64_t v48 = [v42 length];
                      v49 = v86;
                      if ([v86 length]
                        && (unint64_t)(v47 + v48 + [v86 length] + 2) > 0x80000)
                      {
                        v50 = -[OSASubmitter processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:]( v93,  "processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:",  v86,  v37,  v95,  v85,  v82,  v88,  v81);
                        [v84 addObject:v50];
                        [v50 objectForKeyedSubscript:@"complete"];
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        char v89 = [v51 BOOLValue];

                        v49 = v86;
                      }

                      else
                      {
                        char v89 = 1;
                      }

                      if (![v49 length])
                      {
                        [v83 objectForKeyedSubscript:@"<preface>"];
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        -[OSASubmitter prefaceSubmission:withData:usingArchive:andHeaders:]( v93,  "prefaceSubmission:withData:usingArchive:andHeaders:",  v49,  v55,  v92,  v87);
                      }

                      [v49 appendData:v91];
                      [v49 appendBytes:"\n" length:1];
                      [v49 appendData:v42];
                      [v49 appendBytes:"\n" length:1];
                      [v38 closeFileStream];
                      [v95 addObject:v38];

                      id v11 = v85;
                      id v10 = v93;
                      if ((v89 & 1) == 0)
                      {

                        objc_autoreleasePoolPop(v36);
                        id v21 = v94;

                        v24 = v37;
                        goto LABEL_57;
                      }
                    }

                    else
                    {
                      if (-[OSAStreamDeflater capViolation](v92, "capViolation"))
                      {
                        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v112 = 10485760;
                          *(_WORD *)&v112[4] = 2112;
                          *(void *)&v112[6] = v40;
                          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Submission archive too big (> %u) for submission with file %@",  buf,  0x12u);
                        }

                        AnalyticsSendEvent();
                      }

                      [v38 bugType];
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      [v88 _recordRetirement:v56 reason:@"rejected-capviolation"];

                      [v38 retire:"rejected-capviolation"];
                    }
                  }

                  else if ([v39 code] == 2)
                  {
                    [v39 userInfo];
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    [v52 objectForKeyedSubscript:@"bug_type"];
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    [v39 localizedDescription];
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    [v88 _recordRetirement:v53 reason:v54];

                    id v10 = v93;
                  }
                }

                else
                {
                  [v95 addObject:v38];
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(void *)v112 = v40;
                    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Skipping DoNotSubmit tagged report at %{public}@",  buf,  0xCu);
                  }
                }

                objc_autoreleasePoolPop(v36);
                v24 = v37;
              }

              id v21 = v94;
              uint64_t v98 = [v94 countByEnumeratingWithState:&v101 objects:v113 count:16];
            }

            while (v98);
          }
          v59 = -[OSASubmitter processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:]( v10,  "processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:",  v86,  v24,  v95,  v11,  v82,  v88,  v81);
          [v84 addObject:v59];
          [v59 objectForKeyedSubscript:@"complete"];
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          char v61 = [v60 BOOLValue];

          if ((v61 & 1) == 0)
          {
LABEL_57:
            v14 = v76;
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int jobCount = v93->_jobCount;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v112 = jobCount;
              _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Submission aborted after %u jobs",  buf,  8u);
            }

            uint64_t v63 = 0LL;
            goto LABEL_61;
          }

          v14 = v76;
          id v10 = v93;
          unint64_t v13 = 0x189603000LL;
          unint64_t v16 = 0x189603000LL;
          uint64_t v19 = v24;
          v22 = v86;
        }

        uint64_t v17 = v80 + 1;
      }

      while (v80 + 1 != v77);
      uint64_t v62 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
      uint64_t v63 = 1LL;
      uint64_t v77 = v62;
      if (v62) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v63 = 1LL;
  }

- (void)prepConfig:(id)a3
{
}

- (id)locateLog:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11 = (objc_class *)MEMORY[0x189611AF0];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  unint64_t v16 = (void *)[[v11 alloc] initWithPath:v15 forRouting:v14 usingConfig:v13 options:v12 error:a7];

  return v16;
}

- (id)applyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6
{
  v19[4] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  else {
    [MEMORY[0x189611B10] applyTasking:v9 taskId:v10 fromBlob:v12];
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v10 isEqualToString:@"-1"] & 1) == 0)
  {
    v18[0] = @"action";
    v18[1] = @"routing";
    v19[0] = @"received";
    v19[1] = v9;
    v19[2] = v10;
    v18[2] = @"taskId";
    v18[3] = @"blob";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:4];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v16 = (void *)[v15 mutableCopy];

    AnalyticsSendEvent();
  }

  return v13;
}

- (id)processJob:(id)a3 forRouting:(id)a4 including:(id)a5 usingConfig:(id)a6 taskings:(id)a7 summarize:(id)a8 additionalRequestHeaders:(id)a9
{
  uint64_t v241 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v188 = a8;
  id v19 = a9;
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  double v21 = v20;
  if ((([v15 isEqualToString:@"da3"] & 1) != 0
     || ([v15 isEqualToString:@"awd"] & 1) != 0
     || [v15 isEqualToString:@"ca1"])
    && ([v18 objectForKeyedSubscript:v15],
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        !v22))
  {
    v24 = self;
    if ([v15 isEqualToString:@"awd"]) {
      [v17 awdReporterKey];
    }
    else {
      [v17 crashReporterKey];
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[OSASubmitter processJob:forRouting:including:usingConfig:taskings:summarize:additionalRequestHeaders:].cold.1( (uint64_t)v15,  (uint64_t)v23,  v25,  v26,  v27,  v28,  v29,  v30);
    }
  }

  else
  {
    v23 = 0LL;
    v24 = self;
  }

  v183 = v18;
  v184 = v23;
  v186 = v14;
  if ([v15 isEqualToString:@"ca1"])
  {
    id v31 = v19;
    v32 = (void *)objc_opt_new();
    __int128 v210 = 0u;
    __int128 v211 = 0u;
    __int128 v212 = 0u;
    __int128 v213 = 0u;
    id v33 = v16;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v210 objects:v240 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v211;
      do
      {
        for (uint64_t i = 0LL; i != v35; ++i)
        {
          if (*(void *)v211 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v210 + 1) + 8 * i) filepath];
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 addObject:v38];
        }

        uint64_t v35 = [v33 countByEnumeratingWithState:&v210 objects:v240 count:16];
      }

      while (v35);
    }

    id v39 = (void *)MEMORY[0x189611B00];
    uint64_t v40 = *MEMORY[0x189611BC0];
    uint64_t v238 = *MEMORY[0x189611BC8];
    v239 = v32;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v239 forKeys:&v238 count:1];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 recordEvent:v40 with:v41];

    id v18 = v183;
    v23 = v184;
    id v19 = v31;
    v24 = self;
    id v14 = v186;
  }

  v24->_int64_t responseCode = 0LL;
  if (![v14 length]
    && (!v23 || !-[OSASubmitter taskingNeedsRefreshForRouting:at:](v24, "taskingNeedsRefreshForRouting:at:", v15, v21)))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v17 identifier];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v233 = v60;
      __int16 v234 = 2112;
      *(void *)v235 = v15;
      _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "nothing to do for %@-%@", buf, 0x16u);
    }

    v215[0] = MEMORY[0x189604A88];
    v214[0] = @"complete";
    v214[1] = @"logCount";
    uint64_t v61 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v214[2] = @"routing";
    v185 = (void *)v61;
    v215[1] = v61;
    v215[2] = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:v215 forKeys:v214 count:3];
    id v192 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_125;
  }

  ++v24->_jobCount;
  v42 = (void *)NSString;
  [v17 identifier];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 stringWithFormat:@"job_%@-%u-%@", v43, v24->_jobCount, v15];
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)NSString;
  [v17 productVersion];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 releaseType];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [v44 stringWithFormat:@"%@-%@", v45, v46];

  v237[0] = @"application/vnd.apple.ips";
  v236[0] = @"Content-Type";
  v236[1] = @"x-hardware-model";
  [v17 modelCode];
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  v237[1] = v48;
  v236[2] = @"x-os-version";
  [v17 buildVersion];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v237[2] = v49;
  v236[3] = @"x-os-train";
  [v17 osTrain];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v237[3] = v50;
  v236[4] = @"x-target-audience";
  [v17 targetAudience];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v237[4] = v51;
  v176 = (void *)v47;
  v237[5] = v47;
  v236[5] = @"x-product-release";
  v236[6] = @"x-routing";
  v237[6] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v237 forKeys:v236 count:7];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)[v52 mutableCopy];

  [v17 currentTaskingIDByRouting];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = [v54 objectForKeyedSubscript:v15];

  if (v184) {
    BOOL v56 = v55 == 0;
  }
  else {
    BOOL v56 = 1;
  }
  int v57 = !v56;
  int v173 = v57;
  if (v56)
  {
    [v53 setObject:@"NO" forKeyedSubscript:@"x-tasking-requested"];
    v59 = self;
    v58 = v53;
  }

  else
  {
    [v53 setObject:@"YES" forKeyedSubscript:@"x-tasking-requested"];
    [v53 setObject:v184 forKeyedSubscript:@"x-crashreporter-key"];
    v58 = v53;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v233 = v15;
      __int16 v234 = 2114;
      *(void *)v235 = v184;
      *(_WORD *)&v235[8] = 2114;
      *(void *)&v235[10] = v55;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Requesting tasking for routing %{public}@ using key %{public}@ with task_id %{public}@",  buf,  0x20u);
    }

    [v53 setObject:v55 forKeyedSubscript:@"x-task-id"];
    v59 = self;
  }

  uint64_t v62 = v186;
  id v177 = v19;
  [v58 addEntriesFromDictionary:v19];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = [v186 length];
    uint64_t v64 = [v16 count];
    *(_DWORD *)buf = 138412802;
    id v233 = v185;
    __int16 v234 = 2048;
    *(void *)v235 = v63;
    *(_WORD *)&v235[8] = 2048;
    *(void *)&v235[10] = v64;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "'%@' posting content of %lu bytes from %lu logs",  buf,  0x20u);
  }

  v179 = (void *)v55;
  id v181 = v17;
  if ([v15 isEqualToString:@"ca1"])
  {
    v65 = v58;
    v66 = (void *)objc_opt_new();
    __int128 v206 = 0u;
    __int128 v207 = 0u;
    __int128 v208 = 0u;
    __int128 v209 = 0u;
    id v67 = v16;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v206 objects:v231 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v207;
      do
      {
        for (uint64_t j = 0LL; j != v69; ++j)
        {
          if (*(void *)v207 != v70) {
            objc_enumerationMutation(v67);
          }
          [*(id *)(*((void *)&v206 + 1) + 8 * j) filepath];
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          [v66 addObject:v72];
        }

        uint64_t v69 = [v67 countByEnumeratingWithState:&v206 objects:v231 count:16];
      }

      while (v69);
    }

    v73 = (void *)MEMORY[0x189611B00];
    uint64_t v74 = *MEMORY[0x189611BA8];
    uint64_t v75 = *MEMORY[0x189611BB8];
    v230[0] = v66;
    uint64_t v76 = *MEMORY[0x189611BB0];
    v229[0] = v75;
    v229[1] = v76;
    uint64_t v62 = v186;
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v186, "length"));
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
    v230[1] = v77;
    [MEMORY[0x189603F68] dictionaryWithObjects:v230 forKeys:v229 count:2];
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    [v73 recordEvent:v74 with:v78];

    id v17 = v181;
    v59 = self;
    v58 = v65;
  }

  double Current = CFAbsoluteTimeGetCurrent();
  v178 = v58;
  -[OSASubmitter postContent:withHeaders:](v59, "postContent:withHeaders:", v62, v58);
  double v80 = CFAbsoluteTimeGetCurrent() - Current;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int64_t responseCode = v59->_responseCode;
    uint64_t v82 = -[NSData length](v59->_responseData, "length");
    *(_DWORD *)buf = 138412802;
    id v233 = v185;
    __int16 v234 = 1024;
    *(_DWORD *)v235 = responseCode;
    *(_WORD *)&v235[4] = 2048;
    *(void *)&v235[6] = v82;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "'%@' server responded %d with %lu-byte payload",  buf,  0x1Cu);
  }

  [v17 modelCode];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189611B08] sharedInstance];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  [v84 modelCode];
  id v85 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = [v83 isEqualToString:v85] ^ 1;

  v227[0] = @"response";
  [MEMORY[0x189607968] numberWithInteger:v59->_responseCode];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  connectionType = v59->_connectionType;
  v228[0] = v87;
  v228[1] = connectionType;
  v227[1] = @"connection";
  v227[2] = @"routing";
  v228[2] = v15;
  v227[3] = @"bytes";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v62, "length"));
  char v89 = (void *)objc_claimAutoreleasedReturnValue();
  v228[3] = v89;
  v227[4] = @"logs";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  id v90 = (void *)objc_claimAutoreleasedReturnValue();
  v228[4] = v90;
  v227[5] = @"seconds";
  [MEMORY[0x189607968] numberWithDouble:v80];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v228[5] = v91;
  v227[6] = @"proxied";
  v92 = v16;
  uint64_t v93 = v86;
  [MEMORY[0x189607968] numberWithBool:v86];
  id v94 = (void *)objc_claimAutoreleasedReturnValue();
  v228[6] = v94;
  [MEMORY[0x189603F68] dictionaryWithObjects:v228 forKeys:v227 count:7];
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  uint64_t v96 = self;
  v180 = (void *)objc_opt_new();
  int64_t v97 = self->_responseCode;
  BOOL v98 = v97 == 200;
  if (v97 == 304) {
    BOOL v98 = 1;
  }
  BOOL v175 = v98;
  id v189 = v15;
  id v99 = v92;
  v182 = v92;
  int64_t v174 = self->_responseCode;
  if (v97 != 304 && v97 != 200)
  {
    v124 = (void *)MEMORY[0x189611B00];
    uint64_t v125 = *MEMORY[0x189611B90];
    uint64_t v221 = *MEMORY[0x189611B88];
    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = v126;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v222 forKeys:&v221 count:1];
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    [v124 recordEvent:v125 with:v127];

    unint64_t v113 = 0x189611000LL;
    v112 = v99;
    goto LABEL_99;
  }

  __int128 v204 = 0u;
  __int128 v205 = 0u;
  __int128 v202 = 0u;
  __int128 v203 = 0u;
  id obj = v92;
  uint64_t v100 = [obj countByEnumeratingWithState:&v202 objects:v226 count:16];
  if (v100)
  {
    uint64_t v101 = v100;
    uint64_t v102 = *(void *)v203;
    do
    {
      for (uint64_t k = 0LL; k != v101; ++k)
      {
        if (*(void *)v203 != v102) {
          objc_enumerationMutation(obj);
        }
        __int128 v104 = *(void **)(*((void *)&v202 + 1) + 8 * k);
        v224[0] = @"bugType";
        uint64_t v105 = [v104 bugType];
        __int128 v106 = (void *)v105;
        uint64_t v107 = (uint64_t)v189;
        if (v105) {
          uint64_t v107 = v105;
        }
        v225[0] = v107;
        v224[1] = @"proxied";
        [MEMORY[0x189607968] numberWithBool:v93];
        __int128 v108 = (void *)objc_claimAutoreleasedReturnValue();
        v224[2] = @"logCount";
        v225[1] = v108;
        v225[2] = &unk_18A166948;
        [MEMORY[0x189603F68] dictionaryWithObjects:v225 forKeys:v224 count:3];
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();
      }

      uint64_t v101 = [obj countByEnumeratingWithState:&v202 objects:v226 count:16];
    }

    while (v101);
  }

  __int128 v200 = 0u;
  __int128 v201 = 0u;
  __int128 v198 = 0u;
  __int128 v199 = 0u;
  uint64_t v96 = self;
  v110 = self->_responseHeaders;
  uint64_t v111 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v110,  "countByEnumeratingWithState:objects:count:",  &v198,  v223,  16LL);
  v112 = v92;
  unint64_t v113 = 0x189611000uLL;
  if (!v111) {
    goto LABEL_97;
  }
  uint64_t v114 = v111;
  uint64_t v115 = *(void *)v199;
  while (2)
  {
    for (uint64_t m = 0LL; m != v114; ++m)
    {
      if (*(void *)v199 != v115) {
        objc_enumerationMutation(v110);
      }
      v117 = *(void **)(*((void *)&v198 + 1) + 8 * m);
      if (![v117 compare:@"x-task-id" options:1])
      {
        if (v179) {
          [v180 setObject:v179 forKeyedSubscript:@"lastId"];
        }
        uint64_t v96 = self;
        int64_t v118 = self->_responseCode;
        v119 = v183;
        if (v118 == 304)
        {
          [v180 setObject:@"affirmed" forKeyedSubscript:@"action"];
          [v180 setObject:v179 forKeyedSubscript:@"taskId"];
          [v180 removeObjectForKey:@"lastId"];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v233 = v189;
            v121 = (os_log_s *)MEMORY[0x1895F8DA0];
            v122 = "device is already in the correct %@ investigation";
            os_log_type_t v123 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_82;
          }

- (BOOL)cheaterTaskingWithSets:(id)a3 usingConfig:(id)a4 resultsCallback:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_opt_new();
  -[OSASubmitter processSubmissionJobs:usingConfig:summarize:]( self,  "processSubmissionJobs:usingConfig:summarize:",  v10,  v9,  v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    v8[2](v8, v12);
  }
  if (v12)
  {
    [v12 objectForKeyedSubscript:@"complete"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = [v13 BOOLValue];
  }

  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)submitLogsUsingPolicy:(id)a3 resultsCallback:(id)a4
{
  v169[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v116 = (void *)objc_opt_new();
  uint64_t v111 = (void *)objc_opt_new();
  unint64_t v8 = 0x189611000uLL;
  [MEMORY[0x189611B08] sharedInstance];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 appleInternal];

  if (v10)
  {
    [MEMORY[0x189611B08] sharedInstance];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 pathDiagnostics];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      id v13 = (void *)MEMORY[0x189611AF0];
      uint64_t v168 = *MEMORY[0x189611C20];
      v169[0] = v12;
      [MEMORY[0x189603F68] dictionaryWithObjects:v169 forKeys:&v168 count:1];
      char v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 iterateLogsWithOptions:v14 usingBlock:&__block_literal_global];
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Not clearing past submission artifacts because path is not available.",  buf,  2u);
    }
  }

  id v15 = (void *)MEMORY[0x189611AF0];
  [MEMORY[0x189611B08] sharedInstance];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 pathSubmission];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 scanProxies:v17];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ([MEMORY[0x189611AF0] isDataVaultEnabled])
  {
    [MEMORY[0x189611B08] sharedInstance];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 pathSubmissionDataVault];
    double v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      [MEMORY[0x189611AF0] scanProxies:v20];
      double v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v18 arrayByAddingObjectsFromArray:v21];

      id v18 = (void *)v22;
    }

    else
    {
      BOOL v23 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v23) {
        -[OSASubmitter submitLogsUsingPolicy:resultsCallback:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }

  if ([v6 ignoreProxies])
  {
    id v31 = &unk_18A166C40;
  }

  else
  {
    [&unk_18A166C58 arrayByAddingObjectsFromArray:v18];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  __int128 v148 = 0u;
  __int128 v149 = 0u;
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  id obj = v31;
  uint64_t v125 = v6;
  unint64_t v113 = v7;
  uint64_t v115 = [obj countByEnumeratingWithState:&v146 objects:v167 count:16];
  v110 = v18;
  if (!v115)
  {
    LOBYTE(v47) = 1;
    goto LABEL_96;
  }

  uint64_t v114 = *(void *)v147;
  uint64_t v126 = *MEMORY[0x189611BA0];
  uint64_t v127 = *MEMORY[0x189611B98];
  os_log_type_t v123 = self;
  do
  {
    uint64_t v32 = 0LL;
    do
    {
      if (*(void *)v147 != v114) {
        objc_enumerationMutation(obj);
      }
      uint64_t v119 = v32;
      id v33 = *(void **)(*((void *)&v146 + 1) + 8 * v32);
      context = (void *)MEMORY[0x1895B84F4]();
      if ([v33 length])
      {
        [v33 lastPathComponent];
        v122 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v166 = v33;
        [MEMORY[0x189603F18] arrayWithObjects:&v166 count:1];
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        -[OSASubmitter primarySubmissionPaths](self, "primarySubmissionPaths");
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = @"Primary";
      }

      __int128 v144 = 0u;
      __int128 v145 = 0u;
      __int128 v142 = 0u;
      __int128 v143 = 0u;
      id v128 = v34;
      uint64_t v35 = [v128 countByEnumeratingWithState:&v142 objects:v165 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v143;
        do
        {
          for (uint64_t i = 0LL; i != v36; ++i)
          {
            if (*(void *)v143 != v37) {
              objc_enumerationMutation(v128);
            }
            -[OSASubmitter prepConfig:](self, "prepConfig:", *(void *)(*((void *)&v142 + 1) + 8 * i));
          }

          uint64_t v36 = [v128 countByEnumeratingWithState:&v142 objects:v165 count:16];
        }

        while (v36);
      }

      if ([v33 length])
      {
        uint64_t v39 = [objc_alloc(MEMORY[0x189611AF8]) initFromPath:v33];
      }

      else
      {
        uint64_t v39 = [*(id *)(v8 + 2824) sharedInstance];
      }

      uint64_t v40 = (__CFString *)v39;
      uint64_t v41 = (__CFString *)v122;
      v42 = (os_log_s *)MEMORY[0x1895F8DA0];
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v162 = v122;
        _os_log_impl(&dword_187E6F000, v42, OS_LOG_TYPE_DEFAULT, "----- '%{public}@' -----", buf, 0xCu);
      }

      if (v40)
      {
        int64_t v118 = v40;
        [v6 buildSubmissionTemplateForConfig:v40];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (__CFString *)[v43 copy];

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v162 = v118;
          __int16 v163 = 2112;
          v164 = v44;
          _os_log_debug_impl(&dword_187E6F000, v42, OS_LOG_TYPE_DEBUG, "config: %@\npolicy: %@", buf, 0x16u);
        }

        v45 = (void *)MEMORY[0x189611AF0];
        [v6 scanOptions];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v44;
        if ([v45 scanLogs:v44 from:v128 options:v46])
        {

          goto LABEL_45;
        }

        char v48 = [v6 hasTasking];

        if ((v48 & 1) != 0)
        {
LABEL_45:
          [*(id *)(v8 + 2824) sharedInstance];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (os_log_s *)[v49 logDomain];

          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            [*(id *)(v8 + 2824) sharedInstance];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            int v52 = [v51 optInApple];
            *(_DWORD *)buf = 138543618;
            v53 = @"OUT";
            if (v52) {
              v53 = @"IN";
            }
            v162 = v122;
            __int16 v163 = 2112;
            v164 = v53;
            _os_log_impl( &dword_187E6F000,  v50,  OS_LOG_TYPE_DEFAULT,  "Initiating submission for '%{public}@' optIn: %@",  buf,  0x16u);
          }

          __int128 v140 = 0u;
          __int128 v141 = 0u;
          __int128 v138 = 0u;
          __int128 v139 = 0u;
          v54 = v44;
          uint64_t v55 = -[__CFString countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v138,  v160,  16LL);
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v139;
            do
            {
              for (uint64_t j = 0LL; j != v56; ++j)
              {
                if (*(void *)v139 != v57) {
                  objc_enumerationMutation(v54);
                }
                v59 = *(void **)(*((void *)&v138 + 1) + 8 * j);
                [v59 objectForKeyedSubscript:@"routing"];
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                int v61 = [v60 isEqualToString:@"ca1"];

                if (v61)
                {
                  uint64_t v62 = (void *)MEMORY[0x189611B00];
                  uint64_t v158 = v126;
                  uint64_t v63 = [v59 objectForKeyedSubscript:@"logs"];
                  uint64_t v64 = (void *)v63;
                  uint64_t v65 = MEMORY[0x189604A58];
                  if (v63) {
                    uint64_t v65 = v63;
                  }
                  uint64_t v159 = v65;
                  [MEMORY[0x189603F68] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  [v62 recordEvent:v127 with:v66];
                }
              }

              uint64_t v56 = -[__CFString countByEnumeratingWithState:objects:count:]( v54,  "countByEnumeratingWithState:objects:count:",  &v138,  v160,  16LL);
            }

            while (v56);
          }

          -[OSASubmitter processSubmissionJobs:usingConfig:summarize:]( self,  "processSubmissionJobs:usingConfig:summarize:",  v54,  v118,  v111);
          id v67 = (void *)objc_claimAutoreleasedReturnValue();
          [v67 objectForKeyedSubscript:@"complete"];
          uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v47 = [v68 BOOLValue];

          v120 = v67;
          if (!self->_dryRun)
          {
            __int128 v136 = 0u;
            __int128 v137 = 0u;
            __int128 v134 = 0u;
            __int128 v135 = 0u;
            [v67 objectForKeyedSubscript:@"jobs"];
            uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v70 = [v69 countByEnumeratingWithState:&v134 objects:v157 count:16];
            if (v70)
            {
              uint64_t v71 = v70;
              uint64_t v72 = *(void *)v135;
              do
              {
                for (uint64_t k = 0LL; k != v71; ++k)
                {
                  if (*(void *)v135 != v72) {
                    objc_enumerationMutation(v69);
                  }
                  uint64_t v74 = *(void **)(*((void *)&v134 + 1) + 8 * k);
                  [v74 objectForKeyedSubscript:@"<inactive>"];
                  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v75)
                  {
                    [v74 objectForKeyedSubscript:@"routing"];
                    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
                    [v125 registerRouting:v76 result:v47];
                  }
                }

                uint64_t v71 = [v69 countByEnumeratingWithState:&v134 objects:v157 count:16];
              }

              while (v71);
            }

            goto LABEL_86;
          }
        }

        else
        {
          uint64_t v77 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v162 = v122;
            _os_log_impl( &dword_187E6F000,  v77,  OS_LOG_TYPE_DEFAULT,  "No logs/tasking found for submission from '%{public}@'",  buf,  0xCu);
          }

          [MEMORY[0x189603FC8] dictionary];
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = -[__CFString identifier](v118, "identifier");
          [v78 setObject:v79 forKeyedSubscript:@"name"];

          [v78 setObject:@"empty" forKeyedSubscript:@"result"];
          uint64_t v69 = (void *)objc_opt_new();
          v120 = v78;
          [v78 setObject:v69 forKeyedSubscript:@"jobs"];
          __int128 v132 = 0u;
          __int128 v133 = 0u;
          __int128 v130 = 0u;
          __int128 v131 = 0u;
          v124 = v44;
          uint64_t v80 = -[__CFString countByEnumeratingWithState:objects:count:]( v124,  "countByEnumeratingWithState:objects:count:",  &v130,  v156,  16LL);
          if (v80)
          {
            uint64_t v81 = v80;
            uint64_t v82 = *(void *)v131;
            do
            {
              for (uint64_t m = 0LL; m != v81; ++m)
              {
                if (*(void *)v131 != v82) {
                  objc_enumerationMutation(v124);
                }
                v84 = *(void **)(*((void *)&v130 + 1) + 8 * m);
                [v84 objectForKeyedSubscript:@"routing"];
                id v85 = (void *)objc_claimAutoreleasedReturnValue();
                [v84 objectForKeyedSubscript:@"<inactive>"];
                uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();

                if (v86)
                {
                  v152[0] = @"<inactive>";
                  [v84 objectForKeyedSubscript:@"<inactive>"];
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v152[1] = @"routing";
                  v153[0] = v87;
                  v153[1] = v85;
                  [MEMORY[0x189603F68] dictionaryWithObjects:v153 forKeys:v152 count:2];
                  id v88 = (void *)objc_claimAutoreleasedReturnValue();
                  [v69 addObject:v88];
                }

                else
                {
                  if (!v123->_dryRun) {
                    [v125 registerRouting:v85 result:1];
                  }
                  v154[0] = @"logCount";
                  v154[1] = @"routing";
                  v155[0] = &unk_18A166960;
                  v155[1] = v85;
                  [MEMORY[0x189603F68] dictionaryWithObjects:v155 forKeys:v154 count:2];
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  [v69 addObject:v87];
                }
              }

              uint64_t v81 = -[__CFString countByEnumeratingWithState:objects:count:]( v124,  "countByEnumeratingWithState:objects:count:",  &v130,  v156,  16LL);
            }

            while (v81);
          }

          LODWORD(v47) = 1;
          self = v123;
LABEL_86:
        }

        id v6 = v125;
        v7 = v113;
        unint64_t v8 = 0x189611000LL;
        uint64_t v41 = (__CFString *)v122;
        uint64_t v40 = v118;

        goto LABEL_88;
      }

      v150[0] = @"name";
      v150[1] = @"result";
      v151[0] = v122;
      v151[1] = @"skipped - no metadata for proxy device";
      [MEMORY[0x189603F68] dictionaryWithObjects:v151 forKeys:v150 count:2];
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v162 = v122;
        _os_log_impl( &dword_187E6F000,  v42,  OS_LOG_TYPE_DEFAULT,  "No submission parameters found from '%{public}@'",  buf,  0xCu);
      }

      LODWORD(v47) = 1;
LABEL_88:
      [v116 addObject:v120];
      if (v7) {
        v7[2](v7, v120, v40);
      }

      objc_autoreleasePoolPop(context);
      if (!(_DWORD)v47) {
        goto LABEL_96;
      }
      uint64_t v32 = v119 + 1;
    }

    while (v119 + 1 != v115);
    uint64_t v115 = [obj countByEnumeratingWithState:&v146 objects:v167 count:16];
  }

  while (v115);
  LOBYTE(v47) = 1;
LABEL_96:

  if (!self->_dryRun) {
    [v6 persist];
  }
  [*(id *)(v8 + 2824) sharedInstance];
  char v89 = (void *)objc_claimAutoreleasedReturnValue();
  int v90 = [v89 appleInternal];

  if (v90)
  {
    launchInfo = self->_launchInfo;
    if (launchInfo) {
      uint64_t v92 = -[NSDictionary mutableCopy](launchInfo, "mutableCopy");
    }
    else {
      uint64_t v92 = objc_opt_new();
    }
    uint64_t v93 = (void *)v92;
    char v129 = v47;
    -[NSDictionary objectForKeyedSubscript:](self->_launchInfo, "objectForKeyedSubscript:", @"time");
    id v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v94)
    {
      [MEMORY[0x189603F50] date];
      id v94 = (void *)objc_claimAutoreleasedReturnValue();
      [v93 setObject:v94 forKeyedSubscript:@"time"];
    }

    [*(id *)(v8 + 2824) sharedInstance];
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    [v95 pathDiagnostics];
    uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v97 = (void *)NSString;
    OSANSDateFormat();
    BOOL v98 = (void *)objc_claimAutoreleasedReturnValue();
    [v97 stringWithFormat:@"submission-%@", v98];
    id v99 = (void *)objc_claimAutoreleasedReturnValue();
    [v96 stringByAppendingPathComponent:v99];
    unint64_t v100 = v8;
    uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();
    [v101 stringByAppendingPathExtension:@"results"];
    uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();

    [v93 setObject:v116 forKeyedSubscript:@"submissions"];
    [v93 setObject:v111 forKeyedSubscript:@"retirement-summary"];
    -[OSASubmitter submissionURL](self, "submissionURL");
    __int128 v103 = (void *)objc_claimAutoreleasedReturnValue();
    [v103 absoluteString];
    __int128 v104 = (void *)objc_claimAutoreleasedReturnValue();
    [v93 setObject:v104 forKeyedSubscript:@"url"];

    [v93 setObject:self->_connectionType forKeyedSubscript:@"connection"];
    [*(id *)(v100 + 2824) sharedInstance];
    uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
    [v105 buildVersion];
    __int128 v106 = (void *)objc_claimAutoreleasedReturnValue();
    [v93 setObject:v106 forKeyedSubscript:@"version"];

    if ([v93 writeToFile:v102 atomically:1])
    {
      id v6 = v125;
      v7 = v113;
      LOBYTE(v47) = v129;
    }

    else
    {
      id v6 = v125;
      v7 = v113;
      LOBYTE(v47) = v129;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "failed to write results file, saving as txt",  buf,  2u);
      }

      uint64_t v107 = [v102 stringByAppendingPathExtension:@"txt"];

      [v93 description];
      __int128 v108 = (void *)objc_claimAutoreleasedReturnValue();
      [v108 writeToFile:v107 atomically:1 encoding:4 error:0];

      uint64_t v102 = (void *)v107;
    }

    id v18 = v110;
  }

  return v47;
}

void __54__OSASubmitter_submitLogsUsingPolicy_resultsCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 pathExtension];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v3 isEqualToString:@"ips"] & 1) != 0
    || [v3 isEqualToString:@"diagnostics"])
  {
    [MEMORY[0x1896078A8] defaultManager];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 removeItemAtURL:v2 error:0];
  }

  else
  {
    [MEMORY[0x1896078A8] defaultManager];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 path];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0LL;
    [v5 attributesOfItemAtPath:v6 error:&v11];
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      [v4 fileModificationDate];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 timeIntervalSinceNow];
      double v9 = fabs(v8);

      if (v9 > 604800.0)
      {
        [MEMORY[0x1896078A8] defaultManager];
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 removeItemAtURL:v2 error:0];
      }
    }
  }

LABEL_5:
}

- (BOOL)taskingNeedsRefreshForRouting:(id)a3 at:(double)a4
{
  id v6 = a3;
  v7 = -[OSASubmitter taskingLastSuccessfulRequest](self, "taskingLastSuccessfulRequest");
  double v8 = v7;
  if (v7)
  {
    [v7 objectForKeyedSubscript:v6];
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      [v8 objectForKeyedSubscript:v6];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 doubleValue];
      double v12 = v11;
    }

    else
    {
      double v12 = 0.0;
    }
  }

  else
  {
    double v12 = 0.0;
  }

  double v13 = a4 - v12;
  if (v13 >= 43200.0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[OSASubmitter taskingNeedsRefreshForRouting:at:].cold.1((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
  }

  return v13 >= 43200.0;
}

+ (id)submissionPathsWithHomeDirectory:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([MEMORY[0x189611AF0] isDataVaultEnabled])
  {
    [MEMORY[0x189611B08] sharedInstance];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 pathSubmissionDataVault];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v5 length])
    {
      [v3 addObject:v5];
    }

    else
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v6) {
        -[OSASubmitter submitLogsUsingPolicy:resultsCallback:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }

  [MEMORY[0x189611B08] sharedInstance];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 pathSubmission];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v15 length])
  {
    [v3 addObject:v15];
  }

  else
  {
    BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v16) {
      +[OSASubmitter submissionPathsWithHomeDirectory:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  [MEMORY[0x189603F18] arrayWithArray:v3];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)primarySubmissionPaths
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"legacy-homePath"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[OSASubmitter submissionPathsWithHomeDirectory:](&OBJC_CLASS___OSASubmitter, "submissionPathsWithHomeDirectory:", v3);
  return v4;
}

+ (id)extractAuthenticatedBlob:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t ApplePinned = SecPolicyCreateApplePinned();
  if (ApplePinned)
  {
    uint64_t v7 = (const void *)ApplePinned;
    SecTrustRef trust = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v8 = SecCMSVerifyCopyDataAndAttributes();
    if ((_DWORD)v8)
    {
      uint64_t v9 = objc_msgSend( NSString,  "stringWithFormat:",  @"Could not extract signature from blob, error %d",  v8);
      uint64_t v10 = (__CFString *)v9;
      if (a4)
      {
        uint64_t v11 = (void *)MEMORY[0x189607870];
        uint64_t v23 = *MEMORY[0x1896075E0];
        uint64_t v24 = v9;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 errorWithDomain:@"OSASubmitter" code:1 userInfo:v12];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v10;
        _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v13 = 0LL;
    }

    else
    {
      if (SecTrustEvaluateWithError(trust, &error))
      {
        uint64_t v13 = v20;
      }

      else
      {
        CFErrorRef v16 = error;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = (const __CFString *)v16;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Signature on blob is not trusted, %@",  buf,  0xCu);
        }

        if (a4) {
          *a4 = v16;
        }

        uint64_t v13 = 0LL;
      }

      CFRelease(trust);
    }

    CFRelease(v7);
  }

  else
  {
    if (a4)
    {
      uint64_t v14 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x1896075E0];
      uint64_t v22 = @"Unable to create pinned policy";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 errorWithDomain:@"OSASubmitter" code:2 userInfo:v15];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = @"Unable to create pinned policy";
      _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v13 = 0LL;
  }

  return v13;
}

- (void)updateTaskingLastSuccessfulRequest:(id)a3 at:(double)a4
{
  id v6 = a3;
  -[OSASubmitter taskingLastSuccessfulRequest](self, "taskingLastSuccessfulRequest");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  id v13 = v10;

  [MEMORY[0x189607968] numberWithDouble:a4];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 setObject:v11 forKeyedSubscript:v6];

  [MEMORY[0x189604038] standardUserDefaults];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v13 forKey:@"taskingLastSuccessfulRequest"];
}

- (id)taskingLastSuccessfulRequest
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"taskingLastSuccessfulRequest"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)allowUnsignedBlobs
{
  return self->_allowUnsignedBlobs;
}

- (void)setAllowUnsignedBlobs:(BOOL)a3
{
  self->_BOOL allowUnsignedBlobs = a3;
}

- (NSArray)internalWhitelist
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setInternalWhitelist:(id)a3
{
}

- (NSString)connectionType
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setConnectionType:(id)a3
{
}

- (NSDictionary)launchInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLaunchInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getAdditionalRequestHeaders
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_debug_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Submission jobs will include additional request headers %{public}@",  (uint8_t *)&v1,  0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)processJob:(uint64_t)a3 forRouting:(uint64_t)a4 including:(uint64_t)a5 usingConfig:(uint64_t)a6 taskings:(uint64_t)a7 summarize:(uint64_t)a8 additionalRequestHeaders:.cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)submitLogsUsingPolicy:(uint64_t)a3 resultsCallback:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)taskingNeedsRefreshForRouting:(uint64_t)a3 at:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)submissionPathsWithHomeDirectory:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end