@interface CSStore
@end

@implementation CSStore

uint64_t __47___CSStore_setUnitIdentifierExhaustionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __29___CSStore_setAccessContext___block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyValue( @"CSStoreAssertOnIncorrectQueue",  (CFStringRef)*MEMORY[0x189605170],  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605190]);
  v1 = (void *)v0;
  if (v0)
  {
    v4 = (void *)v0;
    char v2 = objc_opt_respondsToSelector();
    v1 = v4;
    if ((v2 & 1) != 0)
    {
      char v3 = [v4 BOOLValue];
      v1 = v4;
LABEL_7:
      performConstantAssertions = v3;
      goto LABEL_8;
    }
  }

  if (CSStore2::IsAppleInternal(void)::once != -1)
  {
    v5 = v1;
    dispatch_once(&CSStore2::IsAppleInternal(void)::once, &__block_literal_global_102);
    v1 = v5;
  }

  char v3 = 1;
LABEL_8:
  performMutatingAssertions = v3;
}

@end