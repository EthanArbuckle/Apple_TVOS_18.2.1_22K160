@interface LSSharedWebCredentialsAppLinkPlugIn
@end

@implementation LSSharedWebCredentialsAppLinkPlugIn

uint64_t __101___LSSharedWebCredentialsAppLinkPlugIn_bindingWithContext_forServiceDetails_callingBundleIdentifier___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v6 = (void *)_CSStringCopyCFString();
  v7 = v6;
  if (v6 && ([v6 isEqual:*(void *)(a1 + 32)] & 1) != 0)
  {
    uint64_t v8 = 1LL;
  }

  else
  {
    v9 = +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a2,  *(unsigned int *)(*(void *)(a3 + 8) + 132LL));
    [v9 _applicationIdentifier];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v10 isEqual:*(void *)(a1 + 40)];
  }

  return v8;
}

void __74___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_forSWCResults___block_invoke( uint64_t a1,  unsigned int *a2,  void *a3)
{
  id v5 = a3;
  id v6 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:bundleID:bundleData:error:",  *(void *)(a1 + 56),  *a2,  *((void *)a2 + 1),  0LL);
  id v11 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) URLComponents];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 URL];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = +[LSAppLink _appLinkWithURL:applicationRecord:plugInClass:]( &OBJC_CLASS____LSSharedWebCredentialsAppLink,  "_appLinkWithURL:applicationRecord:plugInClass:",  v8,  v6,  objc_opt_class());

    if (v9)
    {
      __int128 v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)(v9 + 32) = *(_OWORD *)a2;
      *(_OWORD *)(v9 + 48) = v10;
      objc_storeStrong((id *)(v9 + 64), *((id *)a2 + 4));
      objc_storeStrong((id *)(v9 + 72), *((id *)a2 + 5));
      [(id)v9 setServiceDetails:v5];
      [*(id *)(a1 + 40) addObject:v9];
      std::vector<LSApplicationRecord * {__strong}>::emplace_back<LSApplicationRecord * {__strong}&>( (char **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL),  &v11);
    }
  }
}

void __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *(void ***)(a1 + 56);
  id v10 = 0LL;
  char v11 = 0;
  id v12 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v9, v2, 0LL);

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) appLinksWithContext:v3 forSWCResults:*(void *)(a1 + 40)];
    id v5 = (void *)v4;
    if (v4) {
      id v6 = (void *)v4;
    }
    else {
      id v6 = (void *)MEMORY[0x189604A58];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v6);
  }

  if (v9 && v11) {
    _LSContextDestroy(v9);
  }
  id v7 = v10;
  uint64_t v9 = 0LL;
  id v10 = 0LL;

  char v11 = 0;
  id v8 = v12;
  id v12 = 0LL;
}

uint64_t __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end