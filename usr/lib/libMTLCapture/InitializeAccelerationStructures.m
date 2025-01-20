@interface InitializeAccelerationStructures
@end

@implementation InitializeAccelerationStructures

void __InitializeAccelerationStructures_block_invoke(id a1)
{
  v1 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  2LL,  5LL,  1024LL);
  v2 = (void *)s_accelerationStructuresByStreamRef;
  s_accelerationStructuresByStreamRef = (uint64_t)v1;

  v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1024LL);
  v4 = (void *)s_accelerationStructureGPUResourceIDToStreamRef;
  s_accelerationStructureGPUResourceIDToStreamRef = (uint64_t)v3;

  s_accelerationStructuresLock = 0;
}

@end