@interface MakeBytesBufferReplacementsForPipeline
@end

@implementation MakeBytesBufferReplacementsForPipeline

id ___MakeBytesBufferReplacementsForPipeline_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"type"]);
  if ([v4 unsignedIntValue])
  {
    id v5 = 0LL;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"index"]);
    id v5 = [v6 isEqualToNumber:*(void *)(a1 + 32)];
  }

  return v5;
}

@end