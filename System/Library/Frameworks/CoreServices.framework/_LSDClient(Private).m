@interface _LSDClient(Private)
@end

@implementation _LSDClient(Private)

- (void)handleXPCInvocation:()Private isReply:.cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  os_log_s *a4)
{
  *(_DWORD *)a2 = 136446466;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2082;
  *(void *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_2_3( &dword_183E58000,  a4,  a3,  "Failed to create dispatch_block_t for XPC message -[%{public}s %{public}s], aborting.",  (uint8_t *)a2);
}

@end