@interface NSExtensionContextVendor
@end

@implementation NSExtensionContextVendor

id __58___NSExtensionContextVendor__sharedExtensionContextVendor__block_invoke()
{
  if (qword_18C496788 != -1) {
    dispatch_once(&qword_18C496788, &__block_literal_global_22);
  }
  id result = objc_alloc_init((Class)_MergedGlobals_105);
  qword_18C4967A0 = (uint64_t)result;
  return result;
}

@end