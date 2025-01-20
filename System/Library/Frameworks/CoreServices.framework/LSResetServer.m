@interface LSResetServer
@end

@implementation LSResetServer

void ___LSResetServer_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _LSDatabaseGetLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ___LSResetServer_block_invoke_cold_1();
  }
}

void ___LSResetServer_block_invoke_95(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _LSDatabaseGetLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ___LSResetServer_block_invoke_95_cold_1();
    }
  }
}

void ___LSResetServer_block_invoke_cold_1()
{
}

void ___LSResetServer_block_invoke_95_cold_1()
{
}

@end