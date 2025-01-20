@interface LACKeyBagObserverCollection
- (LACKeyBagObserverCollection)initWithState:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)publishKeybagStateUpdate:(id)a3 state:(int64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation LACKeyBagObserverCollection

- (LACKeyBagObserverCollection)initWithState:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACKeyBagObserverCollection;
  v4 = -[LACKeyBagObserverCollection init](&v8, sel_init);
  if (v4)
  {
    uint64_t v5 = +[LACThreadSafeCollection weakObjectsCollection](&OBJC_CLASS___LACThreadSafeCollection, "weakObjectsCollection");
    observers = v4->_observers;
    v4->_observers = (LACThreadSafeCollection *)v5;

    v4->_lastPublishedState = a3;
  }

  return v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)publishKeybagStateUpdate:(id)a3 state:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (self->_lastPublishedState != a4)
  {
    LACLogKeybag();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromLACKeyBagState(self->_lastPublishedState);
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromLACKeyBagState(a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_189219000, v7, OS_LOG_TYPE_DEFAULT, "Keybag state changed from %@ to %@", buf, 0x16u);
    }

    self->_lastPublishedState = a4;
    observers = self->_observers;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke;
    v11[3] = &unk_18A369008;
    id v12 = v6;
    -[LACThreadSafeCollection forEach:](observers, "forEach:", v11);
  }
}

void __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_18C795258] & 1) == 0) {
    __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke_cold_1();
  }
  [v3 keybagStateDidChange:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

void __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke_cold_1()
{
}

@end