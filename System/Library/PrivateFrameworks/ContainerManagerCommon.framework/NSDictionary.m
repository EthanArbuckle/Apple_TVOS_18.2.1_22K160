@interface NSDictionary
@end

@implementation NSDictionary

id __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke( uint64_t a1)
{
  v14[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) path];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)[v2 initWithFormat:@"Attempting to write a zero-length plist file at [%@]", v3];

  v13[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[NSDictionary(MobileContainerManagerAdditions) MCM_writeToURL:withOptions:fileManager:error:]_block_invoke"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = &unk_18A2BE0B0;
  uint64_t v6 = *MEMORY[0x1896075E0];
  v13[1] = @"SourceFileLine";
  v13[2] = v6;
  v14[2] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_error_impl(&dword_188846000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:34 userInfo:v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end