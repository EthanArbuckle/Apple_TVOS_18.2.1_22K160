@interface DebugHierarchyRequestExecutor
+ (id)executorWithRequest:(id)a3;
- (DebugHierarchyRequestActionExecutor)actionExecutor;
- (DebugHierarchyRequestExecutionContext)requestContext;
- (DebugHierarchyRequestExecutor)initWithRequest:(id)a3;
- (id)_performanceMetricsDictionaryRequestActionDuration:(double)a3;
- (id)_v1CompatibleRequestResponseFromResponse:(id)a3;
- (id)runWithError:(id *)a3;
- (void)_executeRequestActionsWithCrawler;
- (void)_executeRequestActionsWithKnownObjects;
- (void)_v1MakePropertyDescriptionCompatible:(id)a3 withRuntimeType:(id)a4;
- (void)_v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:(id)a3;
- (void)setActionExecutor:(id)a3;
- (void)setRequestContext:(id)a3;
@end

@implementation DebugHierarchyRequestExecutor

+ (id)executorWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithRequest:v4];

  return v5;
}

- (DebugHierarchyRequestExecutor)initWithRequest:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DebugHierarchyRequestExecutor;
  id v5 = -[DebugHierarchyRequestExecutor init](&v11, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequestExecutionContext contextWithRequest:]( &OBJC_CLASS___DebugHierarchyRequestExecutionContext,  "contextWithRequest:",  v4));
    requestContext = v5->_requestContext;
    v5->_requestContext = (DebugHierarchyRequestExecutionContext *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequestActionExecutor actionExecutorWithContext:]( &OBJC_CLASS___DebugHierarchyRequestActionExecutor,  "actionExecutorWithContext:",  v5->_requestContext));
    actionExecutor = v5->_actionExecutor;
    v5->_actionExecutor = (DebugHierarchyRequestActionExecutor *)v8;
  }

  return v5;
}

- (id)runWithError:(id *)a3
{
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", a3));
  id v4 = DebugHierarchyRequestsOSLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136446210;
    v93 = "Initial Standalone Actions";
    _os_signpost_emit_with_name_impl( &dword_0,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "Request Executor",  "Begin %{public}s",  buf,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor actionExecutor](self, "actionExecutor"));
  [v9 executeInitialStandaloneActions];

  id v10 = DebugHierarchyRequestsOSLog();
  objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v14,  OS_SIGNPOST_INTERVAL_END,  v12,  "Request Executor",  "Completed",  buf,  2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 request]);
  v17 = (char *)[v16 objectDiscovery];

  if (v17 == (_BYTE *)&dword_0 + 2)
  {
    id v28 = DebugHierarchyRequestsOSLog();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, self);
    v31 = v29;
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_DWORD *)buf = 136446210;
      v93 = "Actions With Known Objects";
      _os_signpost_emit_with_name_impl( &dword_0,  v32,  OS_SIGNPOST_INTERVAL_BEGIN,  v30,  "Request Executor",  "Begin %{public}s",  buf,  0xCu);
    }

    -[DebugHierarchyRequestExecutor _executeRequestActionsWithKnownObjects]( self,  "_executeRequestActionsWithKnownObjects");
    id v33 = DebugHierarchyRequestsOSLog();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v34, self);
    v35 = v34;
    v27 = v35;
    if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v35)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    goto LABEL_21;
  }

  if (v17 == (_BYTE *)&dword_0 + 1)
  {
    id v18 = DebugHierarchyRequestsOSLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);
    v21 = v19;
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 136446210;
      v93 = "Actions With Crawler";
      _os_signpost_emit_with_name_impl( &dword_0,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "Request Executor",  "Begin %{public}s",  buf,  0xCu);
    }

    -[DebugHierarchyRequestExecutor _executeRequestActionsWithCrawler](self, "_executeRequestActionsWithCrawler");
    id v23 = DebugHierarchyRequestsOSLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, self);
    v26 = v24;
    v27 = v26;
    if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v26)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
LABEL_21:
    _os_signpost_emit_with_name_impl( &dword_0,  v27,  OS_SIGNPOST_INTERVAL_END,  v25,  "Request Executor",  "Completed",  buf,  2u);
LABEL_22:
  }

  id v36 = DebugHierarchyRequestsOSLog();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  os_signpost_id_t v38 = os_signpost_id_make_with_pointer(v37, self);
  v39 = v37;
  v40 = v39;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_DWORD *)buf = 136446210;
    v93 = "Final Standalone Actions";
    _os_signpost_emit_with_name_impl( &dword_0,  v40,  OS_SIGNPOST_INTERVAL_BEGIN,  v38,  "Request Executor",  "Begin %{public}s",  buf,  0xCu);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor actionExecutor](self, "actionExecutor"));
  [v41 executeFinalStandaloneActions];

  id v42 = DebugHierarchyRequestsOSLog();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  os_signpost_id_t v44 = os_signpost_id_make_with_pointer(v43, self);
  v45 = v43;
  v46 = v45;
  if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v46,  OS_SIGNPOST_INTERVAL_END,  v44,  "Request Executor",  "Completed",  buf,  2u);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v47 timeIntervalSinceDate:v88];
  v87 = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutor _performanceMetricsDictionaryRequestActionDuration:]( self,  "_performanceMetricsDictionaryRequestActionDuration:"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 metaData]);
  [v50 setObject:v48 forKeyedSubscript:@"metaDataRequestPerformance"];

  id v51 = DebugHierarchyRequestsOSLog();
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  os_signpost_id_t v53 = os_signpost_id_make_with_pointer(v52, self);
  v54 = v52;
  v55 = v54;
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v55,  OS_SIGNPOST_INTERVAL_BEGIN,  v53,  "Request Executor",  "Begin Response Generation",  buf,  2u);
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 requestResponse]);

  id v58 = DebugHierarchyRequestsOSLog();
  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
  os_signpost_id_t v60 = os_signpost_id_make_with_pointer(v59, self);
  v61 = v59;
  v62 = v61;
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v62,  OS_SIGNPOST_INTERVAL_END,  v60,  "Request Executor",  "Completed",  buf,  2u);
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  v64 = (void *)objc_claimAutoreleasedReturnValue([v63 runtimeInfo]);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v65 contextRuntimeInfo]);
  [v64 mergeWith:v66];

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v67 request]);
  LODWORD(v66) = [v68 needsCompatibilityConversion];

  if ((_DWORD)v66)
  {
    uint64_t v69 = objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutor _v1CompatibleRequestResponseFromResponse:]( self,  "_v1CompatibleRequestResponseFromResponse:",  v57));

    v57 = (void *)v69;
  }

  id v89 = 0LL;
  v70 = (void *)objc_claimAutoreleasedReturnValue([v57 generateJSONDataWithError:&v89]);
  id v71 = v89;
  v72 = v71;
  if (v71)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue([v71 localizedDescription]);
    v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  "-[DebugHierarchyRequestExecutor runWithError:]",  4LL));
    v75 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyLogEntry errorLogEntryWithTitle:message:methodSignature:]( &OBJC_CLASS___DebugHierarchyLogEntry,  "errorLogEntryWithTitle:message:methodSignature:",  @"Error generating request response data.",  v73,  v74));

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 request]);
    [v77 addLogEntry:v75];

    v90 = @"request";
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 request]);
    v80 = (void *)objc_claimAutoreleasedReturnValue([v79 dictionaryRepresentation]);
    v91 = v80;
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));

    id v82 = (id)objc_claimAutoreleasedReturnValue([v81 generateJSONDataWithError:0]);
  }

  else
  {
    id v82 = v70;
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
  v84 = (void *)objc_claimAutoreleasedReturnValue([v83 request]);
  v85 = (void *)objc_claimAutoreleasedReturnValue([v84 formattedResponseDataForRawRequestResultData:v82]);

  return v85;
}

- (id)_v1CompatibleRequestResponseFromResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  os_signpost_id_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 knownObjectsMap]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 runtimeInfo]);

  id v9 = [v4 mutableCopy];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"topLevelGroups"]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke;
  v25[3] = &unk_206F0;
  v25[4] = self;
  id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v10 count]));
  id v11 = v26;
  [v10 enumerateKeysAndObjectsUsingBlock:v25];
  [v9 setObject:v11 forKeyedSubscript:@"topLevelGroups"];
  os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"topLevelPropertyDescriptions"]);

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke_2;
  os_signpost_id_t v20 = &unk_20718;
  id v21 = v6;
  id v22 = v8;
  id v23 = self;
  id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v12 count]));
  id v13 = v24;
  id v14 = v8;
  id v15 = v6;
  [v12 enumerateKeysAndObjectsUsingBlock:&v17];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, @"topLevelPropertyDescriptions", v17, v18, v19, v20);

  return v9;
}

void __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = [a3 mutableCopy];
  [*(id *)(a1 + 32) _v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:v6];
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
}

void __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke_2( id *a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "rangeOfString:", @".")));
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKey:v6]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] typeOfObject:v7]);
    if (v8)
    {
      id v9 = [v5 mutableCopy];
      [a1[6] _v1MakePropertyDescriptionCompatible:v9 withRuntimeType:v8];
      [a1[7] setObject:v9 forKeyedSubscript:v10];
    }
  }
}

- (void)_v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v5 knownObjectsMap]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue([v6 runtimeInfo]);

  id v33 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"debugHierarchyObjects"]);
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v39 = *(void *)v51;
    do
    {
      id v10 = 0LL;
      id v34 = v9;
      do
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v10);
        id v12 = [v11 mutableCopy];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"childGroup"]);
        id v14 = [v13 mutableCopy];

        id v15 = v14;
        -[DebugHierarchyRequestExecutor _v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:]( self,  "_v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:",  v14);
        if (v14) {
          [v12 setObject:v14 forKeyedSubscript:@"childGroup"];
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"properties"]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"objectID"]);
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v41 objectForKey:v17]);
        v19 = (void *)v18;
        if (v18)
        {
          id v42 = (void *)v18;
          v43 = v17;
          os_signpost_id_t v20 = (void *)objc_claimAutoreleasedReturnValue([v36 typeOfObject:v18]);
          if (v20)
          {
            os_signpost_id_t v38 = v15;
            id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v16 count]));
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            v37 = v16;
            id v22 = v16;
            id v23 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v47;
              do
              {
                for (i = 0LL; i != v24; i = (char *)i + 1)
                {
                  if (*(void *)v47 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  id v27 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)i) mutableCopy];
                  -[DebugHierarchyRequestExecutor _v1MakePropertyDescriptionCompatible:withRuntimeType:]( self,  "_v1MakePropertyDescriptionCompatible:withRuntimeType:",  v27,  v20);
                  [v21 addObject:v27];
                }

                id v24 = [v22 countByEnumeratingWithState:&v46 objects:v54 count:16];
              }

              while (v24);
            }

            id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            id v29 = v20;
            do
            {
              os_signpost_id_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 instanceProperties]);
              [v28 addEntriesFromDictionary:v30];

              uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 parentType]);
              id v29 = (id)v31;
            }

            while (v31);
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472LL;
            v44[2] = __90__DebugHierarchyRequestExecutor__v1RecursivelyMakePropertyDescriptionCompatibleWithGroup___block_invoke;
            v44[3] = &unk_20740;
            id v45 = v21;
            id v32 = v21;
            [v28 enumerateKeysAndObjectsUsingBlock:v44];

            [v12 setObject:v32 forKeyedSubscript:@"properties"];
            id v9 = v34;
            v16 = v37;
            id v15 = v38;
          }

          v19 = v42;
          v17 = v43;
        }

        [v40 addObject:v12];

        id v10 = (char *)v10 + 1;
      }

      while (v10 != v9);
      id v9 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }

    while (v9);
  }

  [v33 setObject:v40 forKeyedSubscript:@"debugHierarchyObjects"];
}

void __90__DebugHierarchyRequestExecutor__v1RecursivelyMakePropertyDescriptionCompatibleWithGroup___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  if (DebugHierarchyBitMaskComparison((uint64_t)[v4 options], 1, 1))
  {
    v17[0] = @"propertyName";
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    v18[0] = v5;
    v18[1] = &off_27620;
    v17[1] = @"propertyValueStatus";
    v17[2] = @"propertyRuntimeType";
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 runtimeTypeName]);
    v7 = (void *)v6;
    if (v6) {
      id v8 = (const __CFString *)v6;
    }
    else {
      id v8 = &stru_214E8;
    }
    v18[2] = v8;
    v17[3] = @"propertyOptions";
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 options]));
    v18[3] = v9;
    v17[4] = @"propertyLogicalType";
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 logicalType]);
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (const __CFString *)v10;
    }
    else {
      id v12 = &stru_214E8;
    }
    v18[4] = v12;
    v17[5] = @"propertyFormat";
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 format]);
    id v14 = (void *)v13;
    if (v13) {
      id v15 = (const __CFString *)v13;
    }
    else {
      id v15 = &stru_214E8;
    }
    v17[6] = @"visibility";
    v18[5] = v15;
    v18[6] = &off_27638;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  7LL));

    [*(id *)(a1 + 32) addObject:v16];
  }
}

- (void)_v1MakePropertyDescriptionCompatible:(id)a3 withRuntimeType:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"propertyName"]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 propertyWithName:v6]);
    id v8 = v7;
    if (!v7)
    {
LABEL_25:

      goto LABEL_26;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 format]);

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 format]);
      [v28 setObject:v10 forKeyedSubscript:@"propertyFormat"];
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 logicalType]);

    if (!v11)
    {
LABEL_12:
      v17 = (void *)objc_claimAutoreleasedReturnValue([v8 runtimeTypeName]);

      if (v17)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 runtimeTypeName]);
        [v28 setObject:v18 forKeyedSubscript:@"propertyRuntimeType"];
      }

      else {
        uint64_t v19 = 3LL;
      }
      os_signpost_id_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
      [v28 setObject:v20 forKeyedSubscript:@"visibility"];

      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v8 options]));
      [v28 setObject:v21 forKeyedSubscript:@"propertyOptions"];

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"fetchStatus"]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"propertyValue"]);

      if (v22)
      {
        id v24 = (int *)[v22 integerValue];
        uint64_t v25 = 2LL;
        if (v24 == &dword_4) {
          uint64_t v25 = v23 == 0LL;
        }
        if (v24 == &dword_8) {
          uint64_t v26 = 3LL;
        }
        else {
          uint64_t v26 = v25;
        }
      }

      else
      {
        uint64_t v26 = 2LL * (v23 == 0LL);
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v26));
      [v28 setObject:v27 forKeyedSubscript:@"propertyValueStatus"];

      goto LABEL_25;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 logicalType]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 logicalType]);
    if ([v13 isEqualToString:@"DebugHierarchyLogicalPropertyTypeEnum"])
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      unsigned int v15 = [v14 isEqualToString:@"orientation"];

      if (!v15)
      {
        v16 = @"DebugHierarchyLogicalPropertyTypeNumber";
LABEL_11:

        [v28 setObject:v16 forKeyedSubscript:@"propertyLogicalType"];
        goto LABEL_12;
      }
    }

    else
    {
    }

    v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 logicalType]);
    goto LABEL_11;
  }

- (void)_executeRequestActionsWithCrawler
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor requestContext](self, "requestContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 knownObjectsMap]);
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[DebugHierarchyCrawler crawlerWithRequestContext:knownObjectsMap:]( &OBJC_CLASS___DebugHierarchyCrawler,  "crawlerWithRequestContext:knownObjectsMap:",  v3,  v5));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor actionExecutor](self, "actionExecutor"));
  [v7 setActionExecutor:v6];

  [v7 run];
}

- (void)_executeRequestActionsWithKnownObjects
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor actionExecutor](self, "actionExecutor"));
  id v32 = 0LL;
  unsigned int v4 = [v3 allObjectActionsTargetIdentifiers:&v32];
  id v5 = v32;

  if (v4)
  {
    __int128 v30 = 0uLL;
    __int128 v31 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v29 = 0uLL;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 knownObjectsMap]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v11]);

          if (v14)
          {
            unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor actionExecutor](self, "actionExecutor"));
            [v15 executeActionsWithObject:v14];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }

      while (v8);
    }
  }

  else
  {
    __int128 v26 = 0uLL;
    __int128 v27 = 0uLL;
    *((void *)&v24 + 1) = 0LL;
    __int128 v25 = 0uLL;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub", 0LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 knownObjectsMap]);
    id v6 = (id)objc_claimAutoreleasedReturnValue([v17 objectEnumerator]);

    id v18 = [v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (j = 0LL; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v6);
          }
          uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)j);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutor actionExecutor](self, "actionExecutor"));
          [v23 executeActionsWithObject:v22];
        }

        id v19 = [v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }

      while (v19);
    }
  }
}

- (id)_performanceMetricsDictionaryRequestActionDuration:(double)a3
{
  id v6 = @"actionExecution";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  id v7 = v3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  return v4;
}

- (DebugHierarchyRequestActionExecutor)actionExecutor
{
  return self->_actionExecutor;
}

- (void)setActionExecutor:(id)a3
{
}

- (DebugHierarchyRequestExecutionContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end