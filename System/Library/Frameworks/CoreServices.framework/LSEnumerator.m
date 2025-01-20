@interface LSEnumerator
+ (id)enumeratorForApplicationProxiesWithOptions:(unint64_t)a3;
+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4;
+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4 filter:(id)a5;
+ (id)new;
+ (void)initialize;
- (LSEnumerator)init;
- (NSPredicate)predicate;
- (id)_initWithContext:(LSContext *)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)errorHandler;
- (id)filter;
- (id)nextObject;
- (id)swift_firstWhere:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFilter:(id)a3;
- (void)setPredicate:(id)a3;
- (void)swift_forEach:(id)a3;
@end

@implementation LSEnumerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.launchservices", "enumeration");
    v3 = (void *)_LSEnumeratorLog;
    _LSEnumeratorLog = (uint64_t)v2;
  }

- (LSEnumerator)init
{
}

+ (id)new
{
}

+ (id)enumeratorForApplicationProxiesWithOptions:(unint64_t)a3
{
  return  -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]( objc_alloc(&OBJC_CLASS____LSApplicationProxyEnumerator),  "initWithContext:volumeURL:options:",  0LL,  0LL,  a3);
}

+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"LSEnumerator.mm", 65, @"Invalid parameter not satisfying: %@", @"extensionPointID != nil" object file lineNumber description];
  }

  return  -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:]( objc_alloc(&OBJC_CLASS____LSPlugInProxyEnumerator),  "initWithExtensionPointIdentifier:options:",  a3,  a4);
}

+ (id)enumeratorForPlugInKitProxiesWithExtensionPoint:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, a1, @"LSEnumerator.mm", 72, @"Invalid parameter not satisfying: %@", @"extensionPointID != nil" object file lineNumber description];

    if (a5) {
      return  -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:filter:]( objc_alloc(&OBJC_CLASS____LSPlugInProxyEnumerator),  "initWithExtensionPointIdentifier:options:filter:",  a3,  a4,  a5);
    }
LABEL_5:
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, a1, @"LSEnumerator.mm", 73, @"Invalid parameter not satisfying: %@", @"filterBlock != nil" object file lineNumber description];

    return  -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:filter:]( objc_alloc(&OBJC_CLASS____LSPlugInProxyEnumerator),  "initWithExtensionPointIdentifier:options:filter:",  a3,  a4,  a5);
  }

  if (!a5) {
    goto LABEL_5;
  }
  return  -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:filter:]( objc_alloc(&OBJC_CLASS____LSPlugInProxyEnumerator),  "initWithExtensionPointIdentifier:options:filter:",  a3,  a4,  a5);
}

- (NSPredicate)predicate
{
  os_log_t v2 = (void *)MEMORY[0x186E2A7B8](self->_filter, a2);
  v3 = v2;
  v4 = (void *)MEMORY[0x1896079C8];
  if (v2)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __25__LSEnumerator_predicate__block_invoke;
    v7[3] = &unk_189D76D80;
    id v8 = v2;
    [v4 predicateWithBlock:v7];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x1896079C8] predicateWithValue:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSPredicate *)v5;
}

uint64_t __25__LSEnumerator_predicate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)setPredicate:(id)a3
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __29__LSEnumerator_setPredicate___block_invoke;
  v6[3] = &unk_189D76DA8;
  v6[4] = a3;
  v4 = (void *)MEMORY[0x186E2A7B8](v6, a2);
  id filter = self->_filter;
  self->_id filter = v4;
}

uint64_t __29__LSEnumerator_setPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

- (id)filter
{
  if (self->_filter) {
    id filter = self->_filter;
  }
  else {
    id filter = &__block_literal_global_33;
  }
  return (id)MEMORY[0x186E2A7B8](filter, a2);
}

uint64_t __22__LSEnumerator_filter__block_invoke()
{
  return 1LL;
}

- (void)setFilter:(id)a3
{
  v4 = (void *)[a3 copy];
  id filter = self->_filter;
  self->_id filter = v4;
}

- (id)nextObject
{
}

- (void)swift_forEach:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v4 = self;
  uint64_t v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }

      while (v5 != v7);
      uint64_t v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (id)swift_firstWhere:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self;
  uint64_t v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        __int128 v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((*((unsigned int (**)(id, void *))a3 + 2))(a3, v8))
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }

      uint64_t v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v9 = 0LL;
LABEL_11:

  return v9;
}

- (id)copy
{
  return -[LSEnumerator copyWithZone:](self, "copyWithZone:", 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = -[objc_class _initWithContext:]( -[objc_class allocWithZone:](object_getClass(self), "allocWithZone:", a3),  "_initWithContext:",  0LL);
  if (v4)
  {
    uint64_t v5 = [self->_filter copy];
    uint64_t v6 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v5;

    uint64_t v7 = [self->_errorHandler copy];
    __int128 v8 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v7;

    unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_hasFiredErrorHandler);
    atomic_store(v9 & 1, (unsigned __int8 *)(v4 + 16));
  }

  return (id)v4;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)_initWithContext:(LSContext *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LSEnumerator;
  return -[LSEnumerator init](&v4, sel_init, a3);
}

@end