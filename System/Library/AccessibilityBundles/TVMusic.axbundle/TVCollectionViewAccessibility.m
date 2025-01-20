@interface TVCollectionViewAccessibility
@end

@implementation TVCollectionViewAccessibility

BOOL __83__TVCollectionViewAccessibility__TVMusic__TVKit__accessibilityScannerGroupElements__block_invoke( id a1,  id a2,  BOOL *a3)
{
  id v3 = a2;
  uint64_t v4 = AXSafeClassFromString(@"TVMusicLibraryActionButton");
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

@end