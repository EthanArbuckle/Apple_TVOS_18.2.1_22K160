@interface LSGetAuditTokenForSelf
@end

@implementation LSGetAuditTokenForSelf

void ___LSGetAuditTokenForSelf_block_invoke()
{
  kern_return_t v0;
  int v1;
  os_log_s *v2;
  mach_msg_type_number_t task_info_outCnt;
  task_info_outCnt = 8;
  v0 = task_info(*MEMORY[0x1895FBBE0], 0xFu, _LSGetAuditTokenForSelf::sOurAuditToken, &task_info_outCnt);
  if (v0)
  {
    v1 = v0;
    _LSDefaultLog();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ___LSGetAuditTokenForSelf_block_invoke_cold_1(v1, v2);
    }
  }

  else
  {
    _LSGetAuditTokenForSelf::result = (uint64_t)_LSGetAuditTokenForSelf::sOurAuditToken;
  }

void ___LSGetAuditTokenForSelf_block_invoke_cold_1(int a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "failed to get audit token for current process: %llx",  (uint8_t *)&v2,  0xCu);
}

@end