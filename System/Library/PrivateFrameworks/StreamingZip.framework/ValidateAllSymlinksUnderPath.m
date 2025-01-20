@interface ValidateAllSymlinksUnderPath
@end

@implementation ValidateAllSymlinksUnderPath

uint64_t ___ValidateAllSymlinksUnderPath_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return 1LL;
  }
  if ((*(_WORD *)(*(void *)(a2 + 96) + 4LL) & 0xF000) != 0xA000) {
    return 1LL;
  }
  [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:*(void *)(a2 + 48) isDirectory:0 relativeToURL:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) path];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = _CheckRealpathHasBasePrefix(v6, v7, a3);

  uint64_t result = 0LL;
  if ((_DWORD)a3) {
    return 1LL;
  }
  return result;
}

@end