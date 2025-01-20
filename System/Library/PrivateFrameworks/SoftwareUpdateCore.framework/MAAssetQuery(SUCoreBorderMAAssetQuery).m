@interface MAAssetQuery(SUCoreBorderMAAssetQuery)
+ (__CFString)_translateBuildVersionToRestoreVersionTuple:()SUCoreBorderMAAssetQuery;
+ (id)_getFirstNSStringEntryFromArray:()SUCoreBorderMAAssetQuery;
+ (uint64_t)_arrayContainsNSNull:()SUCoreBorderMAAssetQuery;
+ (void)_SUCoreBorder_MAQueryResultAtBegin:()SUCoreBorderMAAssetQuery withCompletion:;
+ (void)_SUCoreBorder_MAQueryResultAtEnd:()SUCoreBorderMAAssetQuery withResult:withError:withCompletion:;
- (id)SUCoreBorder_results;
- (id)_SUCoreBorder_results:()SUCoreBorderMAAssetQuery;
- (id)_getQueryParamsForKey:()SUCoreBorderMAAssetQuery;
- (id)_getQueryResultsForEvent:()SUCoreBorderMAAssetQuery;
- (void)SUCoreBorder_queryMetaDataWithError:()SUCoreBorderMAAssetQuery;
@end

@implementation MAAssetQuery(SUCoreBorderMAAssetQuery)

- (void)SUCoreBorder_queryMetaDataWithError:()SUCoreBorderMAAssetQuery
{
  id v4 = a3;
  [MEMORY[0x1896127C8] sharedSimulator];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 begin:@"ma" atFunction:@"queryMetaDataWithError"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1896110F0], "_SUCoreBorder_MAQueryResultAtBegin:withCompletion:", v6, v4);
  }

  else
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __78__MAAssetQuery_SUCoreBorderMAAssetQuery__SUCoreBorder_queryMetaDataWithError___block_invoke;
    v7[3] = &unk_18A0EFA10;
    id v8 = v4;
    [a1 queryMetaDataWithError:v7];
  }
}

- (id)SUCoreBorder_results
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 begin:@"ma" atFunction:@"results"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "_SUCoreBorder_results:", v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x1896127C8] sharedSimulator];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 end:@"ma" atFunction:@"results"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6) {
      objc_msgSend(a1, "_SUCoreBorder_results:", v6);
    }
    else {
      [a1 results];
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (void)_SUCoreBorder_MAQueryResultAtBegin:()SUCoreBorderMAAssetQuery withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v9 = 0LL;
    v10 = 0LL;
  }

  else
  {
    if (v7 == 1)
    {
      [MEMORY[0x1896127C8] sharedSimulator];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = 3LL;
      [v8 generateError:@"_SUCoreBorder_MAQueryResultAtBegin" ofDomain:@"com.apple.MobileAssetError.Query" withCode:3];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v5];
      [v8 trackAnomaly:@"_SUCoreBorder_MAQueryResultAtBegin" forReason:v11 withResult:8113 withError:0];

      v10 = 0LL;
      uint64_t v9 = 12LL;
    }
  }

  [MEMORY[0x189612760] sharedCore];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 completionQueue];
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __92__MAAssetQuery_SUCoreBorderMAAssetQuery___SUCoreBorder_MAQueryResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_18A0EFA88;
  id v18 = v6;
  uint64_t v19 = v9;
  id v17 = v10;
  id v14 = v10;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_MAQueryResultAtEnd:()SUCoreBorderMAAssetQuery withResult:withError:withCompletion:
{
  id v15 = a3;
  id v9 = a5;
  v10 = a6;
  uint64_t v11 = [v15 simAction];
  if (v11 == 3)
  {
    a4 = 0LL;
    v13 = 0LL;
    v12 = v9;
  }

  else
  {
    if (v11 == 1)
    {
      [MEMORY[0x1896127C8] sharedSimulator];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = 3LL;
      [v12 generateError:@"_SUCoreBorder_MAQueryResultAtEnd" ofDomain:@"com.apple.MobileAssetError.Query" withCode:3];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = v9;
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v15];
      [v12 trackAnomaly:@"_SUCoreBorder_MAQueryResultAtEnd" forReason:v14 withResult:8113 withError:0];
      v13 = v9;
    }
  }

  v10[2](v10, a4, v13);
}

- (id)_SUCoreBorder_results:()SUCoreBorderMAAssetQuery
{
  id v4 = a3;
  uint64_t v5 = [v4 simAction];
  if (v5 == 1) {
    goto LABEL_5;
  }
  if (v5 != 3)
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = (void *)[objc_alloc(NSString) initWithFormat:@"unsupported simulated event action, event: %@", v4];
    [v7 trackAnomaly:@"_SUCoreBorder_results" forReason:v8 withResult:8113 withError:0];

LABEL_5:
    id v6 = 0LL;
    goto LABEL_6;
  }

  [a1 _getQueryResultsForEvent:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

- (id)_getQueryResultsForEvent:()SUCoreBorderMAAssetQuery
{
  id v4 = a3;
  [v4 assetBuildVersions];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];
  [v4 assetProductVersions];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];

  if (v6 == v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
    [a1 _getQueryParamsForKey:@"SUDocumentationID"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 _getQueryParamsForKey:@"PrerequisiteBuild"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 _getQueryParamsForKey:@"PrerequisiteOSVersion"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 _getQueryParamsForKey:@"ReleaseType"];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v11 count];
    v60 = v10;
    if (v13 != [v12 count])
    {
      [MEMORY[0x189612778] sharedDiag];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"prerequisite Build/ProductVersion counts do not match (found build:%lu and product:%lu)",  objc_msgSend(v11, "count"),  objc_msgSend(v12, "count"));
      [v16 trackAnomaly:@"_getQueryResultsForEvent" forReason:v17 withResult:8113 withError:0];
      id v15 = 0LL;
      id v18 = 0LL;
LABEL_46:

      goto LABEL_47;
    }

    v59 = v12;
    uint64_t v68 = [v10 count];
    id v14 = v11;
    if (v68)
    {
      [MEMORY[0x1896110F0] _getFirstNSStringEntryFromArray:v10];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v64 = 0LL;
    }

    [a1 assetType];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    int isUpdateBrainAssetType = _isUpdateBrainAssetType(v19);

    uint64_t v11 = v14;
    if ([v14 count] == 1)
    {
      if ([MEMORY[0x1896110F0] _arrayContainsNSNull:v14]
        && ([MEMORY[0x1896110F0] _arrayContainsNSNull:v12] & 1) != 0)
      {
        v62 = 0LL;
        v63 = 0LL;
        HIDWORD(v65) = 0;
LABEL_16:
        LODWORD(v65) = 1;
        goto LABEL_26;
      }

      uint64_t v22 = [MEMORY[0x1896110F0] _getFirstNSStringEntryFromArray:v14];
      uint64_t v23 = [MEMORY[0x1896110F0] _getFirstNSStringEntryFromArray:v12];
      v62 = (void *)v22;
      v63 = (void *)v23;
      if (v22 && v23)
      {
        uint64_t v65 = 0x100000000LL;
LABEL_26:
        v58 = v11;
        if (v61 && [v61 count])
        {
          [v61 objectAtIndexedSubscript:0];
          v66 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v66 = 0LL;
        }

        [v4 assetBuildVersions];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = [v26 count];

        if (v27)
        {
          unint64_t v28 = 0LL;
          id v18 = 0LL;
          v69 = v9;
          do
          {
            if ((_DWORD)v65)
            {
              [a1 assetType];
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 assetBuildVersions];
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              [v30 objectAtIndexedSubscript:v28];
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 assetProductVersions];
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              [v32 objectAtIndexedSubscript:v28];
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v34 = _getNewSoftwareUpdateMAAssetAttributesDictionary(v29, v31, v33, v66, 0LL, 0LL, 0LL);

              id v9 = v69;
              v35 = (void *)[objc_alloc(MEMORY[0x1896110E0]) initWithAttributes:v34];
              [v69 addObject:v35];

              id v18 = (void *)v34;
            }

            if (HIDWORD(v65))
            {
              [a1 assetType];
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 assetBuildVersions];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              [v37 objectAtIndexedSubscript:v28];
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 assetProductVersions];
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              [v39 objectAtIndexedSubscript:v28];
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v41 = _getNewSoftwareUpdateMAAssetAttributesDictionary(v36, v38, v40, v66, v62, v63, 0LL);

              id v9 = v69;
              v42 = (void *)[objc_alloc(MEMORY[0x1896110E0]) initWithAttributes:v41];
              [v69 addObject:v42];

              id v18 = (void *)v41;
            }

            if (v68)
            {
              [a1 assetType];
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 assetBuildVersions];
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              [v44 objectAtIndexedSubscript:v28];
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 assetProductVersions];
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              [v46 objectAtIndexedSubscript:v28];
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v48 = _getNewDocumentationMAAssetAttributesDictionary(v43, v45, v47, v64, 0LL);

              id v9 = v69;
              v49 = (void *)[objc_alloc(MEMORY[0x1896110E0]) initWithAttributes:v48];
              [v69 addObject:v49];

              id v18 = (void *)v48;
            }

            if (isUpdateBrainAssetType)
            {
              [a1 assetType];
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 assetBuildVersions];
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              [v51 objectAtIndexedSubscript:v28];
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v53 = _getNewUpdateBrainMAAssetAttributesDictionary(v50, v52, 0LL);

              v54 = (void *)[objc_alloc(MEMORY[0x1896110E0]) initWithAttributes:v53];
              [v9 addObject:v54];

              id v18 = (void *)v53;
            }

            ++v28;
            [v4 assetBuildVersions];
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v56 = [v55 count];
          }

          while (v28 < v56);
        }

        else
        {
          id v18 = 0LL;
        }

        id v15 = v9;

        uint64_t v11 = v58;
        goto LABEL_44;
      }
    }

    else
    {
      if ([v14 count] != 2)
      {
        if (v68) {
          char v25 = 1;
        }
        else {
          char v25 = isUpdateBrainAssetType;
        }
        if ((v25 & 1) == 0)
        {
          [MEMORY[0x189612778] sharedDiag];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)[objc_alloc(NSString) initWithFormat:@"No indication as to which simulated assets should be created"];
          objc_msgSend(v17, "trackAnomaly:forReason:withResult:withError:", @"_getQueryResultsForEvent");
          id v15 = 0LL;
          id v18 = 0LL;
          goto LABEL_45;
        }

        v62 = 0LL;
        v63 = 0LL;
        uint64_t v65 = 0LL;
        goto LABEL_26;
      }

      uint64_t v20 = [MEMORY[0x1896110F0] _getFirstNSStringEntryFromArray:v14];
      uint64_t v21 = [MEMORY[0x1896110F0] _getFirstNSStringEntryFromArray:v12];
      v62 = (void *)v20;
      v63 = (void *)v21;
      if (v20 && v21)
      {
        HIDWORD(v65) = 1;
        goto LABEL_16;
      }
    }

    [MEMORY[0x189612778] sharedDiag];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 trackAnomaly:@"_getQueryResultsForEvent" forReason:@"prerequisite build/product version array contains invalid values" withResult:8113 withError:0];

    id v15 = 0LL;
    id v18 = 0LL;
LABEL_44:
    id v17 = v62;
LABEL_45:

    v12 = v59;
    v16 = v64;
    goto LABEL_46;
  }

  [MEMORY[0x189612778] sharedDiag];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v9,  "trackAnomaly:forReason:withResult:withError:",  @"_getQueryResultsForEvent",  @"asset BuildVersions/ProductVersions must have the same count (please file a radar; the event should not have been created)",
    8113LL,
    0LL);
  id v15 = 0LL;
LABEL_47:

  return v15;
}

- (id)_getQueryParamsForKey:()SUCoreBorderMAAssetQuery
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_msgSend(a1, "queryParams", 0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4)
        {
          id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          [v9 safeStringForKey:@"queryKey"];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            [v9 safeObjectForKey:@"queryValue" ofClass:objc_opt_class()];
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
      }

      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

+ (uint64_t)_arrayContainsNSNull:()SUCoreBorderMAAssetQuery
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v4 = 1LL;
          goto LABEL_11;
        }
      }

      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

+ (id)_getFirstNSStringEntryFromArray:()SUCoreBorderMAAssetQuery
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

+ (__CFString)_translateBuildVersionToRestoreVersionTuple:()SUCoreBorderMAAssetQuery
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  uint64_t v27 = 0LL;
  [MEMORY[0x189607A00] regularExpressionWithPattern:@"([0-9]+)([A-Z]{1})([0-9]+)([a-z]?)" options:0 error:&v27];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v27;
  objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectAtIndex:0];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v9 = v8;
  __int128 v10 = &stru_18A0F22B0;
  if (!v6 && v8)
  {
    uint64_t v11 = [v8 rangeAtIndex:1];
    objc_msgSend(v3, "substringWithRange:", v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = (void *)NSString;
    uint64_t v15 = [v9 rangeAtIndex:2];
    objc_msgSend(v3, "substringWithRange:", v15, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", @"%i", objc_msgSend(v17, "characterAtIndex:", 0) - 64);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = [v9 rangeAtIndex:3];
    objc_msgSend(v3, "substringWithRange:", v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v9 rangeAtIndex:4];
    objc_msgSend(v3, "substringWithRange:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v24 isEqualToString:&stru_18A0F22B0])
    {
      char v25 = @"0";
    }

    else
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"%i",  objc_msgSend(v24, "characterAtIndex:", 0) - 96);
      char v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    [NSString stringWithFormat:@"%@.%@.%@.0.%@,0", v13, v18, v21, v25];
    __int128 v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end