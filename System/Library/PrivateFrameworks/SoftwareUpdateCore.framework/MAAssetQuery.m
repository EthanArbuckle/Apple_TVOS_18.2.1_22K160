@interface MAAssetQuery
@end

@implementation MAAssetQuery

void __78__MAAssetQuery_SUCoreBorderMAAssetQuery__SUCoreBorder_queryMetaDataWithError___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  v5 = (void *)MEMORY[0x1896127C8];
  id v6 = a3;
  [v5 sharedSimulator];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 end:@"ma" atFunction:@"queryMetaDataWithError"];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8) {
    objc_msgSend( MEMORY[0x1896110F0],  "_SUCoreBorder_MAQueryResultAtEnd:withResult:withError:withCompletion:",  v8,  a2,  v6,  *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

uint64_t __92__MAAssetQuery_SUCoreBorderMAAssetQuery___SUCoreBorder_MAQueryResultAtBegin_withCompletion___block_invoke( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16LL))(a1[5], a1[6], a1[4]);
}

@end