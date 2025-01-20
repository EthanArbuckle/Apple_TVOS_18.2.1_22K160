@interface RBSAssertion
- (BOOL)_clientInvalidateWithError:(uint64_t)a1;
- (BOOL)acquireWithError:(id *)a3;
- (BOOL)invalidateSyncWithError:(id *)a3;
- (BOOL)invalidateWithError:(id *)a3;
- (BOOL)isValid;
- (NSArray)attributes;
- (NSString)explanation;
- (RBSAssertion)init;
- (RBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5;
- (RBSAssertionDescriptor)descriptor;
- (RBSAssertionIdentifier)identifier;
- (RBSTarget)target;
- (id)_initWithDescriptor:(id)a3 service:(id)a4;
- (id)_initWithServerValidatedDescriptor:(id)a3;
- (id)_initWithServerValidatedDescriptor:(id)a3 service:(id)a4;
- (id)debugDescription;
- (id)description;
- (unint64_t)state;
- (void)_serverDidChangeIdentifier:(uint64_t)a1;
- (void)_serverInvalidateWithError:(id)a3;
- (void)_serverWillInvalidate;
- (void)acquireWithInvalidationHandler:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setExpirationWarningHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation RBSAssertion

- (RBSAssertion)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:56 description:@"-init is not allowed on RBSAssertion"];

  return 0LL;
}

- (RBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"RBSAssertion.m", 63, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    [MEMORY[0x1896077D8] currentHandler];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"RBSAssertion.m", 64, @"Invalid parameter not satisfying: %@", @"explanation" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:]( &OBJC_CLASS___RBSAssertionDescriptor,  "descriptorWithIdentifier:target:explanation:attributes:",  0LL,  v10,  v9,  v11);
  v13 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  v14 = -[RBSAssertion _initWithDescriptor:service:](self, "_initWithDescriptor:service:", v12, v13);

  return v14;
}

- (BOOL)acquireWithError:(id *)a3
{
  v32[1] = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  if (state == 2)
  {
    v16 = (void *)MEMORY[0x189607870];
    uint64_t v27 = *MEMORY[0x1896075F0];
    v28 = @"Assertion has already been invalidated";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    observers = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:@"RBSAssertionErrorDomain" code:1 userInfo:observers];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;

    id warningHandler = self->_warningHandler;
    self->_id warningHandler = 0LL;

    BOOL v13 = 0;
    observers = self->_observers;
    self->_observers = 0LL;
    goto LABEL_15;
  }

  id v7 = 0LL;
  if (state == 1)
  {
    BOOL v13 = 1;
    goto LABEL_16;
  }

  if (state) {
    goto LABEL_14;
  }
  observers = -[RBSAssertion descriptor](self, "descriptor");
  [observers target];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    self->_unint64_t state = 2LL;
    v17 = (void *)MEMORY[0x189607870];
    uint64_t v31 = *MEMORY[0x1896075F0];
    v32[0] = @"Missing assertion target";
    v18 = (void *)MEMORY[0x189603F68];
    v19 = (const __CFString **)v32;
    v20 = &v31;
LABEL_12:
    [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 errorWithDomain:@"RBSAssertionErrorDomain" code:2 userInfo:v21];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }

  [observers explanation];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    self->_unint64_t state = 2LL;
    v17 = (void *)MEMORY[0x189607870];
    uint64_t v29 = *MEMORY[0x1896075F0];
    v30 = @"Missing assertion explanation";
    v18 = (void *)MEMORY[0x189603F68];
    v19 = &v30;
    v20 = &v29;
    goto LABEL_12;
  }

  service = self->_service;
  id v26 = 0LL;
  v12 = -[RBSServiceLocalProtocol acquireAssertion:error:](service, "acquireAssertion:error:", self, &v26);
  id v7 = v26;
  if (!v12)
  {
    rbs_assertion_log();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[RBSAssertion acquireWithError:].cold.1((uint64_t)v7, v25);
    }

    self->_unint64_t state = 2LL;
    goto LABEL_13;
  }

  BOOL v13 = 1;
  self->_unint64_t state = 1LL;
  os_unfair_lock_lock(&self->_dataLock);
  v14 = (RBSAssertionDescriptor *)[observers copyWithIdentifier:v12];
  descriptor = self->_descriptor;
  self->_descriptor = v14;

  os_unfair_lock_unlock(&self->_dataLock);
LABEL_15:

LABEL_16:
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v7;
  }

  return v13;
}

- (void)acquireWithInvalidationHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke;
  v6[3] = &unk_189DE0C18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[RBSWorkloop performBackgroundWork:](&OBJC_CLASS___RBSWorkloop, "performBackgroundWork:", v6);
}

void __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56LL));
  id v5 = *(void **)(a1 + 32);
  id v14 = 0LL;
  char v6 = [v5 acquireWithError:&v14];
  id v7 = v14;
  if ((v6 & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke_2;
      v11[3] = &unk_189DE0BF0;
      id v9 = v8;
      uint64_t v10 = *(void *)(a1 + 32);
      id v13 = v9;
      v11[4] = v10;
      id v12 = v7;
      +[RBSWorkloop performCallout:]((uint64_t)&OBJC_CLASS___RBSWorkloop, v11);
    }
  }
}

uint64_t __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (BOOL)invalidateWithError:(id *)a3
{
  return 1;
}

- (BOOL)invalidateSyncWithError:(id *)a3
{
  id v6 = 0LL;
  -[RBSAssertion _clientInvalidateWithError:]((uint64_t)self, (uint64_t)&v6);
  id v4 = v6;
  if (a3) {
    *a3 = v6;
  }
  return v4 == 0LL;
}

- (BOOL)_clientInvalidateWithError:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = 2LL;
    id v5 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0LL;

    id v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0LL;

    id v7 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0LL;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    if (v4 == 1) {
      [*(id *)(a1 + 40) invalidateAssertion:a1 error:a2];
    }
  }

  return a1 != 0;
}

- (void)invalidate
{
}

- (BOOL)isValid
{
  return -[RBSAssertion state](self, "state") == 1;
}

- (NSString)explanation
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 explanation];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (RBSTarget)target
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 target];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBSTarget *)v3;
}

- (NSArray)attributes
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 attributes];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2, self, @"RBSAssertion.m", 182, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }

  os_unfair_lock_lock_with_options();
  if (self->_state == 2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __28__RBSAssertion_addObserver___block_invoke;
      v7[3] = &unk_189DE0C40;
      id v8 = v5;
      id v9 = self;
      +[RBSWorkloop performCallout:]((uint64_t)&OBJC_CLASS___RBSWorkloop, v7);
    }
  }

  else
  {
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  }

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __28__RBSAssertion_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) assertion:*(void *)(a1 + 40) didInvalidateWithError:0];
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInMethod:a2, self, @"RBSAssertion.m", 198, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];
  }

  os_unfair_lock_lock_with_options();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setInvalidationHandler:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_state)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2 object:self file:@"RBSAssertion.m" lineNumber:208 description:@"can only call before acquisition"];
  }

  id v5 = (void *)[v8 copy];
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  if (self->_state == 1)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSAssertion debugDescription](self, "debugDescription");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a2, self, @"RBSAssertion.m", 218, @"BUG IN CLIENT OF RUNNINGBOARD: Dealloc called before invalidate for assertion %@", v5 object file lineNumber description];
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RBSAssertion;
  -[RBSAssertion dealloc](&v6, sel_dealloc);
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (RBSAssertionIdentifier)identifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBSAssertionIdentifier *)v3;
}

- (RBSAssertionDescriptor)descriptor
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  uint64_t v4 = (void *)-[RBSAssertionDescriptor copy](self->_descriptor, "copy");
  os_unfair_lock_unlock(p_dataLock);
  return (RBSAssertionDescriptor *)v4;
}

- (void)setExpirationWarningHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[RBSAssertion attributes](self, "attributes", 0LL);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [v10 warningDuration];
          if (v11 > 0.0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)description
{
  id v2 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t state = self->_state;
  if (state > 2) {
    objc_super v6 = @"(invalid assertion state)";
  }
  else {
    objc_super v6 = off_189DE0C88[state];
  }
  -[RBSAssertion descriptor](self, "descriptor");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v3 initWithFormat:@"<%@:%p| state:%@ descriptor:<%@>", v4, self, v6, v7];

  return v8;
}

- (id)_initWithServerValidatedDescriptor:(id)a3 service:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v7 identifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"RBSAssertion.m", 283, @"Invalid parameter not satisfying: %@", @"[descriptor identifier] != nil" object file lineNumber description];
  }

  uint64_t v10 = -[RBSAssertion _initWithDescriptor:service:](self, "_initWithDescriptor:service:", v7, v8);
  double v11 = v10;
  if (v10) {
    v10[6] = 1LL;
  }

  return v11;
}

- (id)_initWithServerValidatedDescriptor:(id)a3
{
  id v4 = a3;
  +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = -[RBSAssertion _initWithServerValidatedDescriptor:service:]( self,  "_initWithServerValidatedDescriptor:service:",  v4,  v5);

  return v6;
}

- (id)_initWithDescriptor:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RBSAssertion;
  id v8 = -[RBSAssertion init](&v14, sel_init);
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    uint64_t v11 = [v6 copy];
    descriptor = v8->_descriptor;
    v8->_descriptor = (RBSAssertionDescriptor *)v11;

    v8->_unint64_t state = 0LL;
    objc_storeStrong((id *)&v8->_service, a4);
    *(void *)&v8->_lock._os_unfair_lock_opaque = 0LL;
  }

  return v8;
}

- (void)_serverInvalidateWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  self->_unint64_t state = 2LL;
  os_unfair_lock_unlock(&self->_lock);
  if (state != 2)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __43__RBSAssertion__serverInvalidateWithError___block_invoke;
    v6[3] = &unk_189DE0C40;
    v6[4] = self;
    id v7 = v4;
    +[RBSWorkloop performCallout:]((uint64_t)&OBJC_CLASS___RBSWorkloop, v6);
  }
}

void __43__RBSAssertion__serverInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock_with_options();
  id v2 = (void (**)(void, void, void))MEMORY[0x186E3067C](*(void *)(*(void *)(a1 + 32) + 16LL));
  [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0LL;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0LL;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56LL));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend( v15,  "assertion:didInvalidateWithError:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  (void)v16);
        }
        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }

  if (v2) {
    v2[2](v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)_serverWillInvalidate
{
  if (a1)
  {
    v1[0] = MEMORY[0x1895F87A8];
    v1[1] = 3221225472LL;
    v1[2] = __37__RBSAssertion__serverWillInvalidate__block_invoke;
    v1[3] = &unk_189DE0C68;
    v1[4] = a1;
    +[RBSWorkloop performCallout:]((uint64_t)&OBJC_CLASS___RBSWorkloop, v1);
  }

void __37__RBSAssertion__serverWillInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock_with_options();
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48) == 1LL)
  {
    [*(id *)(v2 + 8) allObjects];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = (void (**)(void, void))MEMORY[0x186E3067C](*(void *)(*(void *)(a1 + 32) + 24LL));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0LL;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  else
  {
    id v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 56));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v12, "assertionWillInvalidate:", *(void *)(a1 + 32), (void)v13);
        }
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }

  if (v4) {
    v4[2](v4, *(void *)(a1 + 32));
  }
}

- (void)_serverDidChangeIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    if (!v3)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 handleFailureInMethod:sel__serverDidChangeIdentifier_, a1, @"RBSAssertion.m", 381, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
    }

    os_unfair_lock_lock_with_options();
    if (*(void *)(a1 + 48) == 1LL)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
      uint64_t v4 = [*(id *)(a1 + 32) copyWithIdentifier:v7];
      uint64_t v5 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v4;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
      [*(id *)(a1 + 40) invalidateAssertionWithIdentifier:v7 error:0];
    }

    id v3 = v7;
  }
}

- (void).cxx_destruct
{
}

- (void)acquireWithError:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_ERROR,  "Error acquiring assertion: <%{public}@>",  (uint8_t *)&v2,  0xCu);
}

@end