@interface LSCopyGroupContainerIdentifiersFromEntitlements
@end

@implementation LSCopyGroupContainerIdentifiersFromEntitlements

uint64_t ___LSCopyGroupContainerIdentifiersFromEntitlements_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)[objc_alloc(NSString) initWithUTF8String:a2];
  if (v3)
  {
    [*(id *)(a1 + 32) objectForKey:v3 ofClass:objc_opt_class()];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      uint64_t v5 = _CFXPCCreateXPCObjectFromCFObject();
    }
    else {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

@end