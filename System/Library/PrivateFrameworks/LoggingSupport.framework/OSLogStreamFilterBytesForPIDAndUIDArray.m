@interface OSLogStreamFilterBytesForPIDAndUIDArray
@end

@implementation OSLogStreamFilterBytesForPIDAndUIDArray

uint64_t ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke(uint64_t a1, int a2, xpc_object_t xint)
{
  v3 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithLongLong:xpc_int64_get_value(xint)];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addProcessID:v4 flags:0 returningDict:0];

  return 1LL;
}

uint64_t ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke_2(uint64_t a1, int a2, xpc_object_t xint)
{
  v3 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithLongLong:xpc_int64_get_value(xint)];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addUserID:v4 flags:0 returningDict:0];

  return 1LL;
}

@end