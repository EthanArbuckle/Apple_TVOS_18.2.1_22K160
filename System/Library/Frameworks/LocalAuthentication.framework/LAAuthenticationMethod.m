@interface LAAuthenticationMethod
- (BOOL)start;
- (LAAuthenticationMethod)initWithConfiguration:(id)a3;
- (LAAuthenticationMethodConfiguration)configuration;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)forEachObserverWithInvoke:(id)a3;
- (void)forEachObserverWithProtocol:(id)a3 selector:(SEL)a4 invoke:(id)a5;
- (void)terminate;
@end

@implementation LAAuthenticationMethod

- (LAAuthenticationMethod)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LAAuthenticationMethod;
  v6 = -[LAAuthenticationMethod init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;
  }

  return v7;
}

- (void)addObserver:(id)a3
{
}

- (void)forEachObserverWithProtocol:(id)a3 selector:(SEL)a4 invoke:(id)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v9 = (void (**)(id, void))a5;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v10 = self->_observers;
  uint64_t v11 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
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
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
        if ((!v8
           || objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * v14),  "conformsToProtocol:",  v8,  (void)v16))
          && (!a4 || (objc_opt_respondsToSelector() & 1) != 0))
        {
          v9[2](v9, v15);
        }

        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v12);
  }
}

- (void)forEachObserverWithInvoke:(id)a3
{
}

- (BOOL)start
{
  self->_running = 1;
  return 1;
}

- (void)terminate
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35__LAAuthenticationMethod_terminate__block_invoke;
  v3[3] = &unk_189F996E0;
  v3[4] = self;
  -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:]( self,  "forEachObserverWithProtocol:selector:invoke:",  &unk_18C6B33C0,  sel_authenticationMethodWillTerminate_,  v3);
  self->_running = 0;
}

uint64_t __35__LAAuthenticationMethod_terminate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 authenticationMethodWillTerminate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  if (self->_running) {
    -[LAAuthenticationMethod terminate](self, "terminate");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LAAuthenticationMethod;
  -[LAAuthenticationMethod dealloc](&v3, sel_dealloc);
}

- (LAAuthenticationMethodConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end