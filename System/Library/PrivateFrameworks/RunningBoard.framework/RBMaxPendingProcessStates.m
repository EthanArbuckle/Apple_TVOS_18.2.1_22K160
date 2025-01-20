@interface RBMaxPendingProcessStates
@end

@implementation RBMaxPendingProcessStates

void ___RBMaxPendingProcessStates_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v2 = 0;
  size_t v1 = 4LL;
  rbs_process_log();
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v4 = _RBMaxPendingProcessStates_maxPendingProcessStates;
    _os_log_impl(&dword_188634000, v0, OS_LOG_TYPE_DEFAULT, "RBMaxPendingProcessStates is %u", buf, 8u);
  }
}

@end