@interface NSExtension
+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4;
+ (BOOL)_shouldLogExtensionDiscovery;
+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4;
+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4;
+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5;
+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4;
+ (id)globalStateQueueForExtension:(id)a3;
+ (id)predicateForActivationRule:(id)a3;
+ (void)endMatchingExtensions:(id)a3;
+ (void)extensionWithURL:(id)a3 completion:(id)a4;
+ (void)extensionWithUUID:(id)a3 completion:(id)a4;
+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4;
- (BOOL)_isPhotoServiceAccessGranted;
- (BOOL)attemptOptIn:(id *)a3;
- (BOOL)attemptOptOut:(id *)a3;
- (NSExtension)init;
- (id)_extensionContextForUUID:(id)a3;
- (id)_init;
- (id)_initWithPKPlugin:(id)a3;
- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4;
- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5;
- (id)objectForInfoDictionaryKey:(id)a3;
- (int)pidForRequestIdentifier:(id)a3;
- (void)_dropAssertion;
- (void)_hostDidBecomeActiveNote:(id)a3;
- (void)_hostDidEnterBackgroundNote:(id)a3;
- (void)_hostWillEnterForegroundNote:(id)a3;
- (void)_hostWillResignActiveNote:(id)a3;
- (void)_kill:(int)a3;
- (void)_safelyBeginUsing:(id)a3;
- (void)_safelyEndUsing:(id)a3;
- (void)_setAllowedErrorClasses:(id)a3;
- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4;
- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5;
- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5;
- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6;
- (void)cancelExtensionRequestWithIdentifier:(id)a3;
@end

@implementation NSExtension

+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  id result = (id)[(id)_MergedGlobals_119 extensionsWithMatchingAttributes:a3 error:a4];
  if (!result) {
    return (id)MEMORY[0x189604A58];
  }
  return result;
}

+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  [(id)_MergedGlobals_119 extensionsWithMatchingAttributes:a3 completion:a4];
}

+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  return (id)[(id)_MergedGlobals_119 beginMatchingExtensionsWithAttributes:a3 completion:a4];
}

+ (void)endMatchingExtensions:(id)a3
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  [(id)_MergedGlobals_119 endMatchingExtensions:a3];
}

+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  return (id)[(id)_MergedGlobals_119 extensionWithIdentifier:a3 error:a4];
}

+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  return (id)[(id)_MergedGlobals_119 extensionWithIdentifier:a3 excludingDisabledExtensions:v6 error:a5];
}

+ (void)extensionWithUUID:(id)a3 completion:(id)a4
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  if (_MergedGlobals_119) {
    [(id)_MergedGlobals_119 extensionWithUUID:a3 completion:a4];
  }
  else {
    (*((void (**)(id, void, NSError *))a4 + 2))( a4,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSOSStatusErrorDomain",  -4LL,  0LL));
  }
}

+ (void)extensionWithURL:(id)a3 completion:(id)a4
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  if (_MergedGlobals_119) {
    [(id)_MergedGlobals_119 extensionWithURL:a3 completion:a4];
  }
  else {
    (*((void (**)(id, void, NSError *))a4 + 2))( a4,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSOSStatusErrorDomain",  -4LL,  0LL));
  }
}

+ (BOOL)_shouldLogExtensionDiscovery
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  return [(id)_MergedGlobals_119 _shouldLogExtensionDiscovery];
}

+ (id)globalStateQueueForExtension:(id)a3
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  id result = (id)[(id)_MergedGlobals_119 globalStateQueueForExtension:a3];
  if (!result)
  {
    if (qword_18C496BC0 != -1) {
      dispatch_once(&qword_18C496BC0, &__block_literal_global_1_1);
    }
    return (id)qword_18C496BB8;
  }

  return result;
}

dispatch_queue_t __44__NSExtension_globalStateQueueForExtension___block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("NSExtension global state queue", 0LL);
  qword_18C496BB8 = (uint64_t)result;
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __29__NSExtension_allocWithZone___block_invoke;
    block[3] = &unk_189C9E2F8;
    block[4] = a1;
    block[5] = a3;
    if (qword_18C496BD0 != -1) {
      dispatch_once(&qword_18C496BD0, block);
    }
    return (id)qword_18C496BC8;
  }

  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NSExtension;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }

id __29__NSExtension_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___NSExtension;
  id result = objc_msgSendSuper2(&v3, sel_allocWithZone_, v1);
  qword_18C496BC8 = (uint64_t)result;
  return result;
}

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSExtension;
  return -[NSExtension init](&v3, sel_init);
}

- (NSExtension)init
{
  return (NSExtension *)-[NSExtension _initWithPKPlugin:](v2, v3, v4);
}

- (id)_initWithPKPlugin:(id)a3
{
  if (qword_18C496BB0 != -1) {
    dispatch_once(&qword_18C496BB0, &__block_literal_global_46);
  }
  return (id)[objc_alloc((Class)_MergedGlobals_119) _initWithPKPlugin:a3];
}

- (id)objectForInfoDictionaryKey:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5
{
  v7 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5
{
  v7 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5
{
  v7 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6
{
  v8 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v8);
}

- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4
{
  objc_super v6 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4
{
  objc_super v6 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)cancelExtensionRequestWithIdentifier:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)attemptOptIn:(id *)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)attemptOptOut:(id *)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_setAllowedErrorClasses:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (id)_extensionContextForUUID:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)pidForRequestIdentifier:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_safelyBeginUsing:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_safelyEndUsing:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)_isPhotoServiceAccessGranted
{
  id v4 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)_kill:(int)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostWillEnterForegroundNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostDidEnterBackgroundNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostWillResignActiveNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_hostDidBecomeActiveNote:(id)a3
{
  v5 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)_dropAssertion
{
  id v4 = NSClassFromString((NSString *)@"NSExtension");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  return [(id)_NSExtensionClass() evaluateActivationRule:a3 withExtensionItemsRepresentation:a4];
}

+ (id)predicateForActivationRule:(id)a3
{
  return (id)[(id)_NSExtensionClass() predicateForActivationRule:a3];
}

+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  return [(id)_NSExtensionClass() _evaluateActivationRuleWithoutWorkarounds:a3 withExtensionItemsRepresentation:a4];
}

@end