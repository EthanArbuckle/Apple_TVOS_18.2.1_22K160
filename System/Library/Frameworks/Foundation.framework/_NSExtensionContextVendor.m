@interface _NSExtensionContextVendor
+ (Class)_extensionContextClass;
+ (Class)_extensionPrincipalClass;
+ (id)_extensionDictionary;
+ (id)_extensionMainStoryboard;
+ (id)_sharedExtensionContextVendor;
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)_startListening;
+ (void)_startListening:(BOOL)a3;
- (_NSExtensionContextVendor)init;
- (id)_extensionContextForUUID:(id)a3;
- (id)_init;
- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4;
- (void)_tearDownContextWithUUID:(id)a3;
@end

@implementation _NSExtensionContextVendor

+ (void)_startListening
{
  if (qword_18C496788 != -1) {
    dispatch_once(&qword_18C496788, &__block_literal_global_22);
  }
  [(id)_MergedGlobals_105 _startListening];
}

+ (void)_startListening:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_18C496788 != -1) {
    dispatch_once(&qword_18C496788, &__block_literal_global_22);
  }
  [(id)_MergedGlobals_105 _startListening:v3];
}

+ (id)_sharedExtensionContextVendor
{
  if (qword_18C4967A8 != -1) {
    dispatch_once(&qword_18C4967A8, &__block_literal_global_2_1);
  }
  return (id)qword_18C4967A0;
}

+ (id)_extensionDictionary
{
  if (qword_18C496788 != -1) {
    dispatch_once(&qword_18C496788, &__block_literal_global_22);
  }
  return (id)[(id)_MergedGlobals_105 _extensionDictionary];
}

+ (Class)_extensionPrincipalClass
{
  if (qword_18C496788 != -1) {
    dispatch_once(&qword_18C496788, &__block_literal_global_22);
  }
  return (Class)[(id)_MergedGlobals_105 _extensionPrincipalClass];
}

+ (id)_extensionMainStoryboard
{
  if (qword_18C496788 != -1) {
    dispatch_once(&qword_18C496788, &__block_literal_global_22);
  }
  return (id)[(id)_MergedGlobals_105 _extensionMainStoryboard];
}

+ (Class)_extensionContextClass
{
  if (qword_18C496788 != -1) {
    dispatch_once(&qword_18C496788, &__block_literal_global_22);
  }
  return (Class)[(id)_MergedGlobals_105 _extensionContextClass];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS____NSExtensionContextVendor == a1)
  {
    v6 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");
    NSRequestConcreteImplementation((uint64_t)a1, a2, v6);
  }

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____NSExtensionContextVendor;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSExtensionContextVendor;
  return -[_NSExtensionContextVendor init](&v3, sel_init);
}

- (_NSExtensionContextVendor)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSExtensionContextVendor;
  return -[_NSExtensionContextVendor init](&v3, sel_init);
}

- (void)_tearDownContextWithUUID:(id)a3
{
  v5 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)_extensionContextForUUID:(id)a3
{
  v5 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_setPrincipalObject:(id)a3 forUUID:(id)a4
{
  v6 = NSClassFromString((NSString *)@"_NSExtensionContextVendor");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

@end