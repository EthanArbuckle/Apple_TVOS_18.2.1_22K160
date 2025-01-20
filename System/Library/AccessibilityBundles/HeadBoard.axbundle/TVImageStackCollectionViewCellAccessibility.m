@interface TVImageStackCollectionViewCellAccessibility
@end

@implementation TVImageStackCollectionViewCellAccessibility

void __104__TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit__atvaccessibilityAppCellSemanticContext__block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _appGridViewItemAtIndexPath:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end