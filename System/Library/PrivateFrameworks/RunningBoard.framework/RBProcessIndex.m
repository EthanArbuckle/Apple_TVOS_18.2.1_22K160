@interface RBProcessIndex
+ (RBProcessIndex)indexWithCapacity:(unint64_t)a3;
+ (id)index;
- (BOOL)addProcess:(id)a3;
- (BOOL)addProcess:(id)a3 existingProcess:(id *)a4;
- (BOOL)containsIdentifier:(id)a3;
- (BOOL)containsIdentity:(id)a3;
- (BOOL)containsInstance:(id)a3;
- (BOOL)containsProcess:(id)a3;
- (BOOL)removeProcess:(id)a3;
- (RBProcessIndex)init;
- (id)allProcesses;
- (id)processForIdentifier:(id)a3;
- (id)processForIdentity:(id)a3;
- (id)processForInstance:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_lock_removeProcess:(id *)a1;
- (void)initWithCapacity:(void *)a1;
- (void)removeAllObjects;
@end

@implementation RBProcessIndex

+ (id)index
{
  return objc_alloc_init((Class)a1);
}

+ (RBProcessIndex)indexWithCapacity:(unint64_t)a3
{
  return (RBProcessIndex *)-[RBProcessIndex initWithCapacity:](objc_alloc(&OBJC_CLASS___RBProcessIndex), a3);
}

- (void)initWithCapacity:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_CLASS___RBProcessIndex;
  v3 = objc_msgSendSuper2(&v14, sel_init);
  v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 2) = 0;
    v3[2] = a2;
    id v5 = objc_alloc_init(MEMORY[0x189603FD0]);
    v6 = (void *)v4[3];
    v4[3] = v5;

    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    v8 = (void *)v4[4];
    v4[4] = v7;

    id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
    v10 = (void *)v4[5];
    v4[5] = v9;

    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    v12 = (void *)v4[6];
    v4[6] = v11;
  }

  return v4;
}

- (RBProcessIndex)init
{
  return (RBProcessIndex *)-[RBProcessIndex initWithCapacity:](self, 0LL);
}

- (id)allProcesses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableOrderedSet objectEnumerator](self->_processes, "objectEnumerator");
  [v4 allObjects];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)addProcess:(id)a3
{
  return -[RBProcessIndex addProcess:existingProcess:](self, "addProcess:existingProcess:", a3, 0LL);
}

- (BOOL)addProcess:(id)a3 existingProcess:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  char v7 = -[NSMutableOrderedSet containsObject:](self->_processes, "containsObject:", v6);
  if ((v7 & 1) == 0)
  {
    [v6 identity];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 instance];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896122E0] identifierForIdentifier:v6];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = -[NSMutableDictionary objectForKey:](self->_processByIdentifier, "objectForKey:", v10);
    if (!v6) {
      -[RBProcessIndex addProcess:existingProcess:].cold.1();
    }
    if (!v8) {
      -[RBProcessIndex addProcess:existingProcess:].cold.2();
    }
    if (!v9) {
      -[RBProcessIndex addProcess:existingProcess:].cold.3();
    }
    if (!v10) {
      -[RBProcessIndex addProcess:existingProcess:].cold.4();
    }
    v12 = (void *)v11;
    rbs_ttl_log();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      v20 = v12;
      _os_log_impl( &dword_188634000,  v13,  OS_LOG_TYPE_DEFAULT,  "Existing process in RBProcessIndex is: %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    if (v12)
    {
      int v14 = [v12 pidversion];
      if (v14 == [v6 pidversion])
      {
        rbs_ttl_log();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          int v19 = 138543874;
          v20 = v12;
          __int16 v21 = 2114;
          id v22 = v6;
          __int16 v23 = 2114;
          v24 = v10;
          _os_log_fault_impl( &dword_188634000,  v15,  OS_LOG_TYPE_FAULT,  "cannot map existing process %{public}@ and new process %{public}@ which have the same identifier: %{public}@",  (uint8_t *)&v19,  0x20u);
        }
      }

      else
      {
        rbs_process_log();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543618;
          v20 = v12;
          __int16 v21 = 2114;
          id v22 = v6;
          _os_log_impl( &dword_188634000,  v16,  OS_LOG_TYPE_DEFAULT,  "replacing %{public}@ which appears to have been exec'd into %{public}@",  (uint8_t *)&v19,  0x16u);
        }

        if (a4) {
          *a4 = v12;
        }
      }
    }

    -[NSMutableOrderedSet insertObject:atIndex:](self->_processes, "insertObject:atIndex:", v6, 0LL);
    -[NSMutableDictionary setObject:forKey:](self->_processByIdentity, "setObject:forKey:", v6, v8);
    -[NSMutableDictionary setObject:forKey:](self->_processByInstance, "setObject:forKey:", v6, v9);
    -[NSMutableDictionary setObject:forKey:](self->_processByIdentifier, "setObject:forKey:", v6, v10);
    if (self->_capacity && -[NSMutableOrderedSet count](self->_processes, "count") > self->_capacity)
    {
      v17 = -[NSMutableOrderedSet lastObject](self->_processes, "lastObject");
      -[RBProcessIndex _lock_removeProcess:]((id *)&self->super.isa, v17);
    }
  }

  os_unfair_lock_unlock(&self->_lock);

  return v7 ^ 1;
}

- (void)_lock_removeProcess:(id *)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    id v10 = v3;
    [v3 instance];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identity];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896122E0] identifierForIdentifier:v10];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [a1[3] removeObject:v10];
    [a1[5] objectForKey:v4];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v10) {
      [a1[5] removeObjectForKey:v4];
    }
    [a1[6] objectForKey:v6];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v10) {
      [a1[6] removeObjectForKey:v6];
    }
    [a1[4] objectForKey:v5];
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v10) {
      [a1[4] removeObjectForKey:v5];
    }

    id v3 = v10;
  }
}

- (BOOL)removeProcess:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    int v5 = -[NSMutableOrderedSet containsObject:](self->_processes, "containsObject:", v4);
    if (v5) {
      -[RBProcessIndex _lock_removeProcess:]((id *)&self->super.isa, v4);
    }
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)containsProcess:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RBProcessIndex containsInstance:](self, "containsInstance:", v4);

  return (char)self;
}

- (BOOL)containsInstance:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)containsIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)containsIdentity:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)processForIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    processByIdentifier = self->_processByIdentifier;
    [MEMORY[0x1896122E0] identifierForIdentifier:v4];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](processByIdentifier, "objectForKey:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)processForInstance:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_processByInstance, "objectForKey:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)processForIdentity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_processByIdentity, "objectForKey:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableOrderedSet removeAllObjects](self->_processes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_processByIdentity, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_processByInstance, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_processByIdentifier, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)count
{
  return -[NSMutableOrderedSet count](self->_processes, "count");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void).cxx_destruct
{
}

- (void)addProcess:existingProcess:.cold.1()
{
}

- (void)addProcess:existingProcess:.cold.2()
{
}

- (void)addProcess:existingProcess:.cold.3()
{
}

- (void)addProcess:existingProcess:.cold.4()
{
}

@end