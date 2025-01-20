@interface LSQueryResultWithPropertyList
@end

@implementation LSQueryResultWithPropertyList

void __70___LSQueryResultWithPropertyList_propertyListWithClass_valuesOfClass___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v10 = a2;
  id v7 = a3;
  if (!_NSIsNSString() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0LL;

    *a4 = 1;
  }
}

@end