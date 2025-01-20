@interface VMUOSTransactionsAnalyzer
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMUOSTransactionsAnalyzer

- (const)analyzerName
{
  return "LONG-LIVED XPC TRANSACTIONS";
}

- (id)analysisSummaryWithError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = __Block_byref_object_copy__5;
  v55 = __Block_byref_object_dispose__5;
  id v56 = 0LL;
  v4 = -[VMUProcessObjectGraph realizedClasses](self->super._graph, "realizedClasses");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v50[0] = MEMORY[0x1895F87A8];
  v50[1] = 3221225472LL;
  v50[2] = __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke;
  v50[3] = &unk_189DFE5F0;
  v50[4] = &v51;
  [v4 enumerateInfosWithBlock:v50];
  if (v52[5])
  {
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x2020000000LL;
    uint64_t v49 = 0LL;
    uint64_t v42 = 0LL;
    v43 = &v42;
    uint64_t v44 = 0x2020000000LL;
    int v45 = 0;
    uint64_t v38 = 0LL;
    v39 = &v38;
    uint64_t v40 = 0x2020000000LL;
    int v41 = 0;
    v6 = (void *)objc_opt_new();
    [MEMORY[0x189607810] whitespaceCharacterSet];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 invertedSet];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    graph = self->super._graph;
    v31[0] = v5;
    v31[1] = 3221225472LL;
    v31[2] = __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_2;
    v31[3] = &unk_189DFE618;
    v34 = &v51;
    v35 = &v42;
    v31[4] = self;
    v36 = &v46;
    id v10 = v6;
    id v32 = v10;
    id v11 = v8;
    id v33 = v11;
    v37 = &v38;
    -[VMUObjectGraph enumerateObjectsWithBlock:](graph, "enumerateObjectsWithBlock:", v31);
    v12 = (void *)objc_opt_new();
    if ([v10 count])
    {
      if (*((_DWORD *)v39 + 6)
        && -[VMUProcessObjectGraph objectContentLevelForNodeLabels]( self->super._graph,  "objectContentLevelForNodeLabels") != 3)
      {
        [MEMORY[0x189607A28] stringWithFormat:@"Memory graph was not recorded with -fullContent so no transaction descriptions are available"];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
        uint64_t v13 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v21,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisDataKey[0],  0LL,  v20,  0LL);
        [v12 addObject:v13];
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      [v10 sortUsingComparator:&__block_literal_global_7];
      v29 = (void *)v13;
      v30 = v12;
      v17 = (void *)objc_opt_new();
      unsigned int v22 = 0;
      uint64_t v23 = 0LL;
      while ([v10 count] > (unint64_t)v22)
      {
        if (v22 >= 5 && [v10 count] - 5 >= (unint64_t)v22)
        {
          if (v22 == 6) {
            [v17 appendFormat:@"%.*s...\n", v23];
          }
        }

        else
        {
          [v10 objectAtIndexedSubscript:v22];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = [v24 rangeOfString:@"]"];
          else {
            uint64_t v23 = v47[3] - v25;
          }
          [v17 appendFormat:@"%.*s%@\n", v23, "                ", v24, v29];
        }

        ++v22;
      }

      v12 = v30;
      v26 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( [VMUAnalyzerSummaryField alloc],  "initWithKey:numericalValue:objectValue:fieldType:",  @"Count",  [v10 count],  0,  1);

      [v30 addObject:v26];
      v27 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
      v19 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v27,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisDataKey[0],  0LL,  v17,  0LL);

      [v30 addObject:v19];
    }

    else
    {
      int v15 = *((_DWORD *)v43 + 6);
      if (!v15)
      {
        id v14 = 0LL;
        goto LABEL_27;
      }

      v16 = "transactions exist";
      if (v15 == 1) {
        v16 = "transaction exists";
      }
      [MEMORY[0x189607A28] stringWithFormat:@"%u %s but no object content labels are available to determine the duration or description.",  *((unsigned int *)v43 + 6),  v16];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
      v19 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v18,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisDataKey[0],  0LL,  v17,  0LL);
      [v12 addObject:v19];
    }

    id v14 = v12;

LABEL_27:
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    goto LABEL_28;
  }

  id v14 = 0LL;
LABEL_28:

  _Block_object_dispose(&v51, 8);
  return v14;
}

void __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  uint64_t a4,  _BYTE *a5)
{
  id v11 = a3;
  if ([v11 infoType] == 1)
  {
    [v11 className];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 isEqualToString:@"OS_os_transaction"])
    {
      [v11 binaryName];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = [v9 isEqualToString:@"libxpc.dylib"];

      if (v10)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
        *a5 = 1;
      }
    }

    else
    {
    }
  }
}

void __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  if (a3[1] >> 60 == 1LL && a3[2] == *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    uint64_t v5 = (void *)MEMORY[0x189607A28];
    [*(id *)(*(void *)(a1 + 32) + 8) labelForNode:a2];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringWithFormat:@"%@  %#llx", v6, *a3];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v7 = [v18 rangeOfString:@"]"];
    v8 = v18;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v18 substringFromIndex:1];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 floatValue];
      float v11 = v10;

      if (v11 < 10.0)
      {
        v16 = (_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
        int v17 = -1;
        v8 = v18;
      }

      else
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8LL);
        unint64_t v13 = *(void *)(v12 + 24);
        if (v7 > v13) {
          unint64_t v13 = v7;
        }
        *(void *)(v12 + 24) = v13;
        [*(id *)(a1 + 40) addObject:v18];
        [v18 substringFromIndex:v7 + 1];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 rangeOfCharacterFromSet:*(void *)(a1 + 48)];

        v8 = v18;
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_12;
        }
        v16 = (_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        int v17 = 1;
      }

      *v16 += v17;
    }

uint64_t __54__VMUOSTransactionsAnalyzer_analysisSummaryWithError___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 substringFromIndex:1];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 floatValue];
  float v7 = v6;

  [v4 substringFromIndex:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 floatValue];
  float v10 = v9;

  if (v7 > v10) {
    return -1LL;
  }
  else {
    return v7 < v10;
  }
}

@end