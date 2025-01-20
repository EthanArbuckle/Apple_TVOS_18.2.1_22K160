@interface _LSSharedWebCredentialsAppLinkPlugIn
- (_LSSharedWebCredentialsAppLinkPlugIn)init;
- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4;
- (id)appLinksWithContext:(LSContext *)a3 forSWCResults:(id)a4;
- (id)callingBundleIdentifier;
- (optional<LSBinding>)bindingWithContext:(SEL)a3 forServiceDetails:(LSContext *)a4 callingBundleIdentifier:(id)a5;
- (void)enumerateBindingsWithContext:(LSContext *)a3 forSWCResults:(id)a4 block:(id)a5;
@end

@implementation _LSSharedWebCredentialsAppLinkPlugIn

- (_LSSharedWebCredentialsAppLinkPlugIn)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____LSSharedWebCredentialsAppLinkPlugIn;
  v2 = -[_LSSharedWebCredentialsAppLinkPlugIn init](&v4, sel_init);
  if (v2 && !_LSIsSWCAvailable())
  {

    return 0LL;
  }

  return v2;
}

- (optional<LSBinding>)bindingWithContext:(SEL)a3 forServiceDetails:(LSContext *)a4 callingBundleIdentifier:(id)a5
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v11 = a5;
  id v12 = a6;
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  if (a4)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 handleFailureInMethod:a3, self, @"LSAppLinkPlugIn.mm", 501, @"Invalid parameter not satisfying: %@", @"ctx != NULL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 handleFailureInMethod:a3, self, @"LSAppLinkPlugIn.mm", 502, @"Invalid parameter not satisfying: %@", @"serviceDetails != nil" object file lineNumber description];

LABEL_3:
  if ([v11 isApproved])
  {
    [v11 serviceSpecifier];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 applicationIdentifier];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 serviceSpecifier];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 applicationIdentifierPrefix];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 serviceSpecifier];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 bundleIdentifier];
    v18 = (LaunchServices::BindingEvaluator *)objc_claimAutoreleasedReturnValue();

    if (v18
      && (!v12 || -[LaunchServices::BindingEvaluator caseInsensitiveCompare:](v18, "caseInsensitiveCompare:", v12)))
    {
      memset(v27, 0, sizeof(v27));
      LaunchServices::BindingEvaluator::CreateWithBundleInfo(v18, 0LL, 0LL, (LSVersionNumber *)1, v27, (uint64_t)v28);
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __101___LSSharedWebCredentialsAppLinkPlugIn_bindingWithContext_forServiceDetails_callingBundleIdentifier___block_invoke;
      v24[3] = &unk_189D73F30;
      id v25 = v16;
      id v26 = v14;
      LaunchServices::BindingEvaluator::setFilter_NoIO((uint64_t)v28, @"universal links", v24);
      LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)v28, a4, 0LL, v22);
      std::__optional_storage_base<LSBinding,false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<LSBinding,false>>( (uint64_t)retstr,  (uint64_t)v22);
      if (v23)
      {
      }

      LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v28);
    }
  }

  return result;
}

- (void)enumerateBindingsWithContext:(LSContext *)a3 forSWCResults:(id)a4 block:(id)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  v22 = (void (**)(id, unsigned int *, void))a5;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 handleFailureInMethod:a2, self, @"LSAppLinkPlugIn.mm", 592, @"Invalid parameter not satisfying: %@", @"swcResults != nil" object file lineNumber description];
  }
  v10 = -[_LSAppLinkPlugIn state](self, "state");
  char v11 = [v10 includeLinksForCallingApplication];

  if ((v11 & 1) != 0)
  {
    id v12 = 0LL;
  }

  else
  {
    -[_LSSharedWebCredentialsAppLinkPlugIn callingBundleIdentifier](self, "callingBundleIdentifier");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  memset(v32, 0, sizeof(v32));
  int v33 = 1065353216;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v13)
  {
    unint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v29;
LABEL_8:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x186E2A59C]();
      -[_LSSharedWebCredentialsAppLinkPlugIn bindingWithContext:forServiceDetails:callingBundleIdentifier:]( self,  "bindingWithContext:forServiceDetails:callingBundleIdentifier:",  a3,  v17,  v12);
      if (v27)
      {
        v19 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>( v32,  v24);
        BOOL v20 = v19 == 0LL;
        if (!v19)
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>( (uint64_t)v32,  v24,  v24);
          if (!v27)
          {
            std::__throw_bad_optional_access[abi:nn180100]();
            __break(1u);
          }

          v22[2](v22, v24, v17);
          ++v14;
        }

        if (v27)
        {
        }
      }

      else
      {
        BOOL v20 = 1;
      }

      objc_autoreleasePoolPop(v18);
      if (!v20 || v14 >= -[_LSAppLinkPlugIn limit](self, "limit")) {
        break;
      }
      if (v13 == ++v16)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v13) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v32);
}

- (id)appLinksWithContext:(LSContext *)a3 forSWCResults:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  [MEMORY[0x189603FA8] array];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x4812000000LL;
  v29[3] = __Block_byref_object_copy__4;
  v29[4] = __Block_byref_object_dispose__4;
  v29[5] = "";
  memset(v30, 0, sizeof(v30));
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __74___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_forSWCResults___block_invoke;
  v25[3] = &unk_189D73F58;
  __int128 v28 = a3;
  v25[4] = self;
  id v8 = v7;
  id v26 = v8;
  char v27 = v29;
  -[_LSSharedWebCredentialsAppLinkPlugIn enumerateBindingsWithContext:forSWCResults:block:]( self,  "enumerateBindingsWithContext:forSWCResults:block:",  a3,  v6,  v25);
  if (-[_LSAppLinkPlugIn limit](self, "limit") != -1 && (unint64_t)[v8 count] >= 2)
  {
    [MEMORY[0x189603FA8] array];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FA8] array];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          else {
            uint64_t v16 = v10;
          }
          [v16 addObject:v15];
        }

        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v32 count:16];
      }

      while (v12);
    }

    [v11 setArray:v9];
    unint64_t v17 = [v9 count];
    if (v17 < -[_LSAppLinkPlugIn limit](self, "limit")) {
      [v11 addObjectsFromArray:v10];
    }
  }

  +[LSRecord resolveAllPropertiesOfRecords:count:andDetachOnQueue:]( &OBJC_CLASS___LSRecord,  "resolveAllPropertiesOfRecords:count:andDetachOnQueue:");
  v18 = v26;
  id v19 = v8;

  _Block_object_dispose(v29, 8);
  __int128 v31 = (void **)v30;
  std::vector<LSApplicationRecord * {__strong}>::__destroy_vector::operator()[abi:nn180100](&v31);

  return v19;
}

- (id)callingBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_LSCopyBundleIdentifierForAuditToken((_OWORD *)[v2 auditToken], 1);

  return v3;
}

- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4
{
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy__126;
  v45 = __Block_byref_object_dispose__127;
  id v46 = (id)MEMORY[0x189604A58];
  v7 = (void *)MEMORY[0x186E2A59C](self, a2);
  id v8 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
  _LSSWCServiceTypeAppLinks();
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_LSAppLinkPlugIn URLComponents](self, "URLComponents");
  [v10 host];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (void *)[v8 initWithServiceType:v9 applicationIdentifier:0 domain:v11];

  -[_LSAppLinkPlugIn state](self, "state");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v14 = (_OWORD *)[v13 auditToken];

  if (v14 && (_LSSWCServiceDetailsClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v15 = (void *)_LSSWCServiceDetailsClass();
    -[_LSAppLinkPlugIn URLComponents](self, "URLComponents");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v17 = -[_LSAppLinkPlugIn limit](self, "limit");
    __int128 v18 = v14[1];
    v40[0] = *v14;
    v40[1] = v18;
    uint64_t v39 = 0LL;
    id v19 = (id *)&v39;
    uint64_t v20 = [v15 serviceDetailsWithServiceSpecifier:v12 URLComponents:v16 limit:v17 auditToken:v40 error:&v39];
  }

  else
  {
    __int128 v21 = (void *)_LSSWCServiceDetailsClass();
    -[_LSAppLinkPlugIn URLComponents](self, "URLComponents");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = 0LL;
    id v19 = (id *)&v38;
    uint64_t v20 = objc_msgSend( v21,  "serviceDetailsWithServiceSpecifier:URLComponents:limit:error:",  v12,  v16,  -[_LSAppLinkPlugIn limit](self, "limit"),  &v38);
  }

  __int128 v22 = (void *)v20;
  id v23 = *v19;

  if ([v22 count])
  {
    uint64_t v24 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke;
    v34[3] = &unk_189D73F80;
    v36 = &v41;
    v37 = a3;
    v34[4] = self;
    id v35 = v22;
    id v25 = (void (**)(void))MEMORY[0x186E2A7B8](v34);
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      _LSServer_DatabaseExecutionContext();
      id v26 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      -[LSDBExecutionContext assertNotActiveForThisThread](v26);

      _LSServer_DatabaseExecutionContext();
      char v27 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v32[0] = v24;
      v32[1] = 3221225472LL;
      _OWORD v32[2] = __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke_2;
      v32[3] = &unk_189D73FA8;
      uint64_t v33 = v25;
      -[LSDBExecutionContext syncRead:](v27, v32);
    }

    else
    {
      v25[2](v25);
    }
  }

  else if (v22)
  {
    __int128 v28 = (void *)v42[5];
    v42[5] = MEMORY[0x189604A58];
  }

  objc_autoreleasePoolPop(v7);
  __int128 v29 = (void *)v42[5];
  if (a4 && !v29)
  {
    *a4 = v23;
    __int128 v29 = (void *)v42[5];
  }

  id v30 = v29;

  _Block_object_dispose(&v41, 8);
  return v30;
}

@end