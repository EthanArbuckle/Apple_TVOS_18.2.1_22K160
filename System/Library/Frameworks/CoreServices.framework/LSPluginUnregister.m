@interface LSPluginUnregister
@end

@implementation LSPluginUnregister

uint64_t ___LSPluginUnregister_block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  if (*(_DWORD *)(result + 40) == a3)
  {
    _CSArrayRemoveValueAtIndex();
    result = _CSArrayGetCount();
    if (!(_DWORD)result)
    {
      _CSArrayDispose();
      result = _CSStoreWriteToUnit();
    }

    *a4 = 1;
  }

  return result;
}

@end