@interface MakeVisibleFunctionTablesForPipeline
@end

@implementation MakeVisibleFunctionTablesForPipeline

id ___MakeVisibleFunctionTablesForPipeline_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"type"]);
  if ([v4 unsignedIntValue] == 24)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"index"]);
    id v6 = [v5 isEqualToNumber:*(void *)(a1 + 32)];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

@end