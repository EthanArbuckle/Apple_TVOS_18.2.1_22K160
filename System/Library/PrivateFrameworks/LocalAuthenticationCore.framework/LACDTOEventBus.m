@interface LACDTOEventBus
- (LACDTOEventBus)init;
- (void)addEventHandler:(id)a3;
- (void)dispatchEvent:(id)a3 sender:(id)a4;
- (void)removeEventHandler:(id)a3;
@end

@implementation LACDTOEventBus

- (LACDTOEventBus)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LACDTOEventBus;
  v2 = -[LACDTOEventBus init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    eventHandlers = v2->_eventHandlers;
    v2->_eventHandlers = (NSHashTable *)v3;
  }

  return v2;
}

- (void)addEventHandler:(id)a3
{
}

- (void)removeEventHandler:(id)a3
{
}

- (void)dispatchEvent:(id)a3 sender:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  LACLogDTOEvent();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LACDTOEventBus dispatchEvent:sender:].cold.1((uint64_t)v6, (uint64_t)v7, v8);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v9 = -[NSHashTable allObjects](self->_eventHandlers, "allObjects", 0LL);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v15 + 1) + 8 * v13);
        if (v14 != v7) {
          [v14 handleEvent:v6 sender:v7];
        }
        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }
}

- (void).cxx_destruct
{
}

- (void)dispatchEvent:(os_log_t)log sender:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( &dword_189219000,  log,  OS_LOG_TYPE_DEBUG,  "Will dispatch event: %@ from: %@",  (uint8_t *)&v3,  0x16u);
}

@end