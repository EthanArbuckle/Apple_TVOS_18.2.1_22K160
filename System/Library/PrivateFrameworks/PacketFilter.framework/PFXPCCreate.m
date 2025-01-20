@interface PFXPCCreate
@end

@implementation PFXPCCreate

uint64_t ____PFXPCCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = MEMORY[0x1895CD824](a2);
  if (__pfconnection) {
    BOOL v4 = result == MEMORY[0x1895F9268];
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
    return PFManagerErrorLog();
  }

  else if (__pfconnection)
  {
    return PFManagerErrorLog();
  }

  return result;
}

@end