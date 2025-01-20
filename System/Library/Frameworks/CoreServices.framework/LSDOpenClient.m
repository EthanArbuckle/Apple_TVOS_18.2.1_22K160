@interface LSDOpenClient
@end

@implementation LSDOpenClient

uint64_t __50___LSDOpenClient_invokeServiceInvocation_isReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void __58___LSDOpenClient_getiCloudHostNamesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _LSServer_GetiCloudHostNames();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __54___LSDOpenClient_openAppLink_state_completionHandler___block_invoke(void *a1)
{
  return +[LSAppLink _openWithAppLink:state:completionHandler:]( &OBJC_CLASS___LSAppLink,  "_openWithAppLink:state:completionHandler:",  a1[4],  a1[5],  a1[6]);
}

@end