@interface NSBundleODRDataForApplications
@end

@implementation NSBundleODRDataForApplications

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_ERROR,  "NSBundleResourceRequest could not connect to its helper daemon",  v3,  2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 64LL));
}

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_171( uint64_t a1,  void *a2,  NSError *a3)
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v5 = a3;
    if (!-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", @"NSCocoaErrorDomain"))
    {
      v10 = @"NSUnderlyingError";
      v11[0] = a3;
      v5 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4994,  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1]);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) lock];
    *(void *)(*(void *)(a1 + 32) + 56LL) = -[NSError copy](v5, "copy");
    [*(id *)(*(void *)(a1 + 32) + 16) unlock];
    v6 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      v9 = a3;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "NSBundleResourceRequest helper daemon reports an error in parsing the on demand resources information: %@",  (uint8_t *)&v8,  0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 64LL));
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) lock];
    *(void *)(*(void *)(a1 + 32) + 40LL) = a2;
    [*(id *)(*(void *)(a1 + 32) + 16) unlock];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 64LL));
  }

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_173(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_ERROR,  "NSBundleResourceRequest could not connect to its helper daemon",  v3,  2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 64LL));
}

void __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_174( uint64_t a1,  void *a2,  NSError *a3)
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v5 = a3;
    if (!-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", @"NSCocoaErrorDomain"))
    {
      v23 = @"NSUnderlyingError";
      v24[0] = a3;
      v5 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4994,  [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1]);
    }

    v6 = (uint64_t *)(a1 + 32);
    [*(id *)(*(void *)(a1 + 32) + 16) lock];
    *(void *)(*(void *)(a1 + 32) + 56LL) = -[NSError copy](v5, "copy");
    [*(id *)(*(void *)(a1 + 32) + 16) unlock];
    v7 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 40) bundleURL];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      v22 = a3;
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "NSBundleResourceRequest helper daemon reports an error beginning for bundle %@: %@",  buf,  0x16u);
    }
  }

  else
  {
    v10 = (void *)[a2 objectForKey:@"_NSODRSandboxExtensionKey"];
    if (v10)
    {
      [v10 UTF8String];
      *(void *)(*(void *)(a1 + 32) + 32LL) = sandbox_extension_consume();
      if ((*(void *)(*(void *)(a1 + 32) + 32LL) & 0x8000000000000000LL) != 0)
      {
        int v11 = *__error();
        v12 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v17;
          __int16 v21 = 1024;
          LODWORD(v22) = v11;
          _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "NSBundleResourceRequest encountered a sandboxing error for bundle %@: %d",  buf,  0x12u);
        }
      }
    }

    uint64_t v14 = *(void *)(a1 + 32);
    v13 = (uint64_t *)(a1 + 32);
    [*(id *)(v14 + 16) lock];
    *(void *)(*v13 + 72) = objc_msgSend( (id)objc_msgSend(a2, "objectForKey:", @"_NSODRSandboxRootPathKey"),  "copy");
    uint64_t v15 = *v13;
    v16 = *(void **)(*v13 + 48);
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_175;
    v18[3] = &unk_189CA0C68;
    v18[4] = v15;
    [v16 enumerateObjectsUsingBlock:v18];
    [*(id *)(*v13 + 16) unlock];
    v6 = v13;
  }

  dispatch_group_leave(*(dispatch_group_t *)(*v6 + 64));
}

uint64_t __50___NSBundleODRDataForApplications_initWithBundle___block_invoke_175(uint64_t a1, void *a2)
{
  return objc_msgSend( (id)objc_msgSend(a2, "remoteObjectProxy"),  "accessSandboxExtension:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  sandbox_extension_issue_file()));
}

uint64_t __42___NSBundleODRDataForApplications_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __67___NSBundleODRDataForApplications_assetPacksBecameAvailable_error___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend( (id)objc_msgSend(a2, "remoteObjectProxy"),  "hostApplicationAssetPacksBecameAvailable:",  *(void *)(a1 + 32));
}

uint64_t __69___NSBundleODRDataForApplications_assetPacksBecameUnavailable_error___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend( (id)objc_msgSend(a2, "remoteObjectProxy"),  "hostApplicationAssetPacksBecameUnavailable:",  *(void *)(a1 + 32));
}

uint64_t __56___NSBundleODRDataForApplications_addExtensionEndpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) unlock];
}

@end