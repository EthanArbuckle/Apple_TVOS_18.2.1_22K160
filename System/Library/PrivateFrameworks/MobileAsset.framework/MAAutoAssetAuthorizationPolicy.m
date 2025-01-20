@interface MAAutoAssetAuthorizationPolicy
+ (BOOL)consumeSandboxExtension:(id)a3 forPath:(id)a4;
+ (id)_existingSandboxExtensions;
@end

@implementation MAAutoAssetAuthorizationPolicy

+ (id)_existingSandboxExtensions
{
  if (_existingSandboxExtensions_existingSandboxExtensionsOnceToken != -1) {
    dispatch_once(&_existingSandboxExtensions_existingSandboxExtensionsOnceToken, &__block_literal_global_8);
  }
  return (id)_existingSandboxExtensions_activeExtensions;
}

void __60__MAAutoAssetAuthorizationPolicy__existingSandboxExtensions__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FA8]);
  v1 = (void *)_existingSandboxExtensions_activeExtensions;
  _existingSandboxExtensions_activeExtensions = (uint64_t)v0;
}

+ (BOOL)consumeSandboxExtension:(id)a3 forPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  uint64_t v6 = [a3 UTF8String];
  v7 = +[MAAutoAssetAuthorizationPolicy _existingSandboxExtensions]( &OBJC_CLASS___MAAutoAssetAuthorizationPolicy,  "_existingSandboxExtensions");
  v8 = v7;
  if (v5 && [v7 containsObject:v5])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v5;
      _os_log_impl( &dword_18718F000,  v10,  OS_LOG_TYPE_DEFAULT,  "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) found existing consumed sandbox extension f or path %{public}@",  (uint8_t *)&v15,  0xCu);
    }

+ (void)consumeSandboxExtension:(uint64_t)a1 forPath:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_18718F000,  a2,  OS_LOG_TYPE_ERROR,  "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) unable to consume sandbox extension as there is no extension available for path %{public}@",  (uint8_t *)&v2,  0xCu);
}

+ (void)consumeSandboxExtension:(uint64_t)a1 forPath:(os_log_s *)a2 .cold.2(uint64_t a1, os_log_s *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v4 = __error();
  id v5 = strerror(*v4);
  int v6 = *__error();
  int v7 = 136315650;
  v8 = v5;
  __int16 v9 = 1024;
  int v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a1;
  _os_log_error_impl( &dword_18718F000,  a2,  OS_LOG_TYPE_ERROR,  "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) unable to consume sandbox extension with errno %s (%d) for path %{public}@",  (uint8_t *)&v7,  0x1Cu);
}

@end