@interface LogKCData
@end

@implementation LogKCData

const char *___LogKCData_block_invoke()
{
  result = getenv("SA_PRINT_STACKSHOTS");
  if (result || (result = getenv("SA_DEBUG_KCDATA_STACKSHOT_PRINT_ALL")) != 0LL)
  {
    result = (const char *)strcmp(result, "0");
    if ((_DWORD)result) {
      byte_18C4B1301 = 1;
    }
  }

  return result;
}

@end