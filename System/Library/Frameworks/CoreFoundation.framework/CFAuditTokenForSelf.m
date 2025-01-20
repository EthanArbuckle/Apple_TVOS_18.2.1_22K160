@interface CFAuditTokenForSelf
@end

@implementation CFAuditTokenForSelf

uint64_t ___CFAuditTokenForSelf_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(*MEMORY[0x1895FBBE0], 0xFu, (task_info_t)&_CFAuditTokenForSelf_auditToken, &task_info_outCnt);
}

@end