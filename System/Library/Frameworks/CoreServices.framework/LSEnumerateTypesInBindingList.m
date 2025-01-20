@interface LSEnumerateTypesInBindingList
@end

@implementation LSEnumerateTypesInBindingList

void ___LSEnumerateTypesInBindingList_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  id v2 = (id)_CSStringCopyCFString();
  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

@end