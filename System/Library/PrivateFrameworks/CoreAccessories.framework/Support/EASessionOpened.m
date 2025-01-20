@interface EASessionOpened
@end

@implementation EASessionOpened

void ___platform_externalAccessory_EASessionOpened_block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v2 = (void *)gWiredEASessionUUIDs;
  gWiredEASessionUUIDs = (uint64_t)v1;
}

@end