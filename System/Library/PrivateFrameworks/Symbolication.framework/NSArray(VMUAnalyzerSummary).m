@interface NSArray(VMUAnalyzerSummary)
- (unint64_t)longestKeyLength;
@end

@implementation NSArray(VMUAnalyzerSummary)

- (unint64_t)longestKeyLength
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v2 = a1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        [v8 key:v16];
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 == kVMUAnalysisSummaryKey[0])
        {
        }

        else
        {
          [v8 key];
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = kVMUAnalysisDataKey[0];

          if (v11 != v12)
          {
            [v8 key];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v14 = [v13 length];

            if (v14 > v5) {
              unint64_t v5 = v14;
            }
          }
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v4);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

@end