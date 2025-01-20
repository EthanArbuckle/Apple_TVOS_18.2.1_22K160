@interface TransparencyGPBRootObject
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (id)extensionRegistry;
+ (void)globallyRegisterExtension:(id)a3;
+ (void)initialize;
@end

@implementation TransparencyGPBRootObject

+ (void)initialize
{
  if (!qword_1002EE710)
  {
    CFDictionaryKeyCallBacks v5 = off_1002833D0;
    qword_1002EE710 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &v5,  &kCFTypeDictionaryValueCallBacks);
    qword_1002EE718 = objc_alloc_init(&OBJC_CLASS___TransparencyGPBExtensionRegistry);
  }

  id v3 = [a1 superclass];
  if (v3 == (id)objc_opt_class(&OBJC_CLASS___TransparencyGPBRootObject, v4)) {
    [a1 extensionRegistry];
  }
}

+ (id)extensionRegistry
{
  return (id)qword_1002EE718;
}

+ (void)globallyRegisterExtension:(id)a3
{
  id v4 = [a3 singletonNameC];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002EE720);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1002EE710, v4, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EE720);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if ((sub_1001350D0((objc_class *)a1, a3) & 1) != 0) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBRootObject;
  return objc_msgSendSuper2(&v6, "resolveClassMethod:", a3);
}

@end