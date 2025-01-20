@interface UMLProviderSideEffects
- (UMLProviderSideEffects)init;
@end

@implementation UMLProviderSideEffects

- (UMLProviderSideEffects)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UMLProviderSideEffects;
  v2 = -[UMLProviderSideEffects init](&v7, sel_init);
  if (!v2) {
    sub_188791F50();
  }
  v3 = v2;
  v4 = objc_alloc_init(&OBJC_CLASS___UMAppleKeyStoreProvider);
  sub_188787DC0((uint64_t)v3, v4);

  v5 = objc_alloc_init(&OBJC_CLASS___UMFilesystemProvider);
  sub_188787DDC((uint64_t)v3, v5);

  return v3;
}

@end