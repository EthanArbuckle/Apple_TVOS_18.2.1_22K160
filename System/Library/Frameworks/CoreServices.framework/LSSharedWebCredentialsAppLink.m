@interface LSSharedWebCredentialsAppLink
@end

@implementation LSSharedWebCredentialsAppLink

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke( uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  v25 = (void *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:*(void *)(a1 + 32) resolvingAgainstBaseURL:1];
  [v25 host];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v3 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
    _LSSWCServiceTypeAppLinks();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v3 initWithServiceType:v4 applicationIdentifier:0 domain:v2];

    v24 = (void *)v5;
    id v40 = 0LL;
    [(id)_LSSWCServiceDetailsClass() serviceDetailsWithServiceSpecifier:v5 error:&v40];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = v40;
    if (v6)
    {
      v22 = v6;
      uint64_t v7 = MEMORY[0x1895F87A8];
      v36[0] = MEMORY[0x1895F87A8];
      v36[1] = 3221225472LL;
      v36[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_2;
      v36[3] = &unk_189D73E00;
      id v8 = *(id *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v37 = v8;
      uint64_t v39 = v9;
      id v38 = v10;
      dispatch_block_t block = (dispatch_block_t)MEMORY[0x186E2A7B8](v36);
      if ([v22 count] == 1)
      {
        [v22 firstObject];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v7;
        v32[1] = 3221225472LL;
        v32[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_3;
        v32[3] = &unk_189D73EB8;
        uint64_t v35 = *(void *)(a1 + 56);
        v33 = block;
        id v34 = *(id *)(a1 + 40);
        [v11 waitForSiteApprovalWithCompletionHandler:v32];

        v12 = v33;
      }

      else
      {
        v12 = dispatch_group_create();
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v15 = v22;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v43 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t i = 0LL; i != v16; ++i)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v15);
              }
              v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              dispatch_group_enter(v12);
              v26[0] = v7;
              v26[1] = 3221225472LL;
              v26[2] = __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4;
              v26[3] = &unk_189D73EE0;
              v26[4] = v19;
              v27 = v12;
              [v19 waitForSiteApprovalWithCompletionHandler:v26];
            }

            uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v43 count:16];
          }

          while (v16);
        }

        [*(id *)(a1 + 56) _dispatchQueue];
        v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        dispatch_group_notify(v12, v20, block);
      }

      v6 = v22;
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    v14 = v23;
  }

  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v41 = *MEMORY[0x189607490];
    v42 = @"aURL";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[_LSSharedWebCredentialsAppLink afterAppLinksBecomeAvailableForURL:limit:performBlock:]_block_invoke",  315LL,  v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0LL, v14);
  }
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_2( void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  id v6 = 0LL;
  v4 = +[LSAppLink appLinksWithURL:limit:error:](&OBJC_CLASS___LSAppLink, "appLinksWithURL:limit:error:", v2, v3, &v6);
  id v5 = v6;
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v6 = a3;
  if (a2)
  {
    [*(id *)(a1 + 48) _dispatchQueue];
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 32));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _LSDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) serviceSpecifier];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4_cold_1( v8,  (uint64_t)v6,  v9,  v7);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __88___LSSharedWebCredentialsAppLink_afterAppLinksBecomeAvailableForURL_limit_performBlock___block_invoke_4_cold_1( void *a1,  uint64_t a2,  uint8_t *buf,  os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Error getting updated SWC service details for %@ (ignoring due to batch operation): %@",  buf,  0x16u);
}

@end