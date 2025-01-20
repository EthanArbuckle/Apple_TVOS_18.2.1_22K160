@interface GetCurrentEncoderBoundResources
@end

@implementation GetCurrentEncoderBoundResources

id ___GetCurrentEncoderBoundResources_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"type"]);
  if ([v4 isEqualToNumber:*(void *)(a1 + 32)])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"index"]);
    id v6 = [v5 isEqualToNumber:*(void *)(a1 + 40)];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

id ___GetCurrentEncoderBoundResources_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"type"]);
  if ([v4 unsignedIntValue])
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"index"]);
    id v5 = [v6 isEqualToNumber:*(void *)(a1 + 32)];
  }

  return v5;
}

@end