@interface NSFileAccessProcessMonitor
+ (id)sharedInstance;
- (BOOL)processWithPIDIsSuspended:(int)a3;
- (id)_init;
- (void)addProcessManager:(id)a3 forPID:(int)a4;
- (void)dealloc;
- (void)process:(id)a3 receivedUpdate:(id)a4;
- (void)removeProcessManager:(id)a3 forPID:(int)a4;
- (void)updateMonitorPredicate;
@end

@implementation NSFileAccessProcessMonitor

- (id)_init
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (qword_18C497048 != -1) {
    dispatch_once(&qword_18C497048, &__block_literal_global_68);
  }
  if (_MergedGlobals_143)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSFileAccessProcessMonitor;
    v3 = -[NSFileAccessProcessMonitor init](&v9, sel_init);
    v4 = v3;
    if (v3)
    {
      v3->_lock._os_unfair_lock_opaque = 0;
      v5 = (RBSProcessMonitor *)objc_alloc_init(objc_lookUpClass("RBSProcessMonitor"));
      uint64_t v6 = MEMORY[0x1895F87A8];
      v4->_monitor = v5;
      v8[0] = v6;
      v8[1] = 3221225472LL;
      v8[2] = __35__NSFileAccessProcessMonitor__init__block_invoke_2;
      v8[3] = &unk_189CA28C8;
      v8[4] = v4;
      -[RBSProcessMonitor updateConfiguration:](v5, "updateConfiguration:", v8);
      v4->_pidToProcessManagers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    }
  }

  else
  {

    return 0LL;
  }

  return v4;
}

Class __35__NSFileAccessProcessMonitor__init__block_invoke()
{
  Class result = objc_lookUpClass("RBSProcessMonitor");
  _MergedGlobals_143 = result != 0LL;
  return result;
}

uint64_t __35__NSFileAccessProcessMonitor__init__block_invoke_2(uint64_t a1, void *a2)
{
  v4[5] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __35__NSFileAccessProcessMonitor__init__block_invoke_3;
  v4[3] = &unk_189CA28A0;
  v4[4] = *(void *)(a1 + 32);
  [a2 setUpdateHandler:v4];
  return objc_msgSend( a2,  "setStateDescriptor:",  -[objc_class descriptor](objc_lookUpClass("RBSProcessStateDescriptor"), "descriptor"));
}

uint64_t __35__NSFileAccessProcessMonitor__init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "process:receivedUpdate:");
}

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __44__NSFileAccessProcessMonitor_sharedInstance__block_invoke;
  v3[3] = &unk_189C9A030;
  v3[4] = a1;
  if (qword_18C497058 != -1) {
    dispatch_once(&qword_18C497058, v3);
  }
  return (id)qword_18C497050;
}

uint64_t __44__NSFileAccessProcessMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _init];
  qword_18C497050 = result;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileAccessProcessMonitor;
  -[NSFileAccessProcessMonitor dealloc](&v3, sel_dealloc);
}

- (void)addProcessManager:(id)a3 forPID:(int)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v7 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", *(void *)&a4);
  os_unfair_lock_lock(&self->_lock);
  v8 = (NSHashTable *)-[NSMutableDictionary objectForKey:](self->_pidToProcessManagers, "objectForKey:", v7);
  if (!v8)
  {
    v8 = +[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable");
    -[NSMutableDictionary setObject:forKey:](self->_pidToProcessManagers, "setObject:forKey:", v8, v7);
  }

  if (-[NSHashTable containsObject:](v8, "containsObject:", a3))
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    objc_super v9 = (os_log_s *)_NSFCProcessMonitorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10[0] = 67109120;
      v10[1] = a4;
      _os_log_debug_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEBUG,  "Creating process monitor for pid %d",  (uint8_t *)v10,  8u);
    }

    -[NSHashTable addObject:](v8, "addObject:", a3);
    os_unfair_lock_unlock(&self->_lock);
    -[NSFileAccessProcessMonitor updateMonitorPredicate](self, "updateMonitorPredicate");
  }

- (void)removeProcessManager:(id)a3 forPID:(int)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v7 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", *(void *)&a4);
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)-[NSMutableDictionary objectForKey:](self->_pidToProcessManagers, "objectForKey:", v7);
  if (v8)
  {
    objc_super v9 = v8;
    int v10 = [v8 containsObject:a3];
    if (v10)
    {
      uint64_t v11 = (os_log_s *)_NSFCProcessMonitorLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12[0] = 67109120;
        v12[1] = a4;
        _os_log_debug_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEBUG,  "Destroying process monitor for pid %d",  (uint8_t *)v12,  8u);
      }

      [v9 removeObject:a3];
    }

    if (![v9 count]) {
      -[NSMutableDictionary removeObjectForKey:](self->_pidToProcessManagers, "removeObjectForKey:", v7);
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v10) {
      -[NSFileAccessProcessMonitor updateMonitorPredicate](self, "updateMonitorPredicate");
    }
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

- (void)process:(id)a3 receivedUpdate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (objc_msgSend((id)objc_msgSend(a3, "currentState"), "taskState") == 3)
  {
    uint64_t v6 = -[objc_class identifierWithPid:]( objc_lookUpClass("RBSProcessIdentifier"),  "identifierWithPid:",  [a3 pid]);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)objc_msgSend( (id)-[NSMutableDictionary objectForKey:](self->_pidToProcessManagers, "objectForKey:", v6),  "allObjects");
    os_unfair_lock_unlock(p_lock);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v12++) processSuspended];
        }

        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }

      while (v10);
    }
  }

- (void)updateMonitorPredicate
{
  v6[5] = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = -[objc_class predicateMatchingIdentifiers:]( objc_lookUpClass("RBSProcessPredicate"),  "predicateMatchingIdentifiers:",  objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  -[NSMutableDictionary allKeys](self->_pidToProcessManagers, "allKeys")));
  monitor = self->_monitor;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __52__NSFileAccessProcessMonitor_updateMonitorPredicate__block_invoke;
  v6[3] = &unk_189CA28C8;
  v6[4] = v4;
  -[RBSProcessMonitor updateConfiguration:](monitor, "updateConfiguration:", v6);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __52__NSFileAccessProcessMonitor_updateMonitorPredicate__block_invoke(uint64_t a1, void *a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v3, 1));
}

- (BOOL)processWithPIDIsSuspended:(int)a3
{
  uint64_t v3 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", *(void *)&a3);
  uint64_t v4 = -[objc_class predicateMatchingIdentifier:]( objc_lookUpClass("RBSProcessPredicate"),  "predicateMatchingIdentifier:",  v3);
  return objc_msgSend( (id)objc_msgSend( (id)-[objc_class handleForPredicate:error:]( objc_lookUpClass("RBSProcessHandle"),  "handleForPredicate:error:",  v4,  0),  "currentState"),  "taskState") == 3;
}

@end