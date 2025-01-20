@interface RBClientInheritanceManager
- (RBClientInheritanceManager)init;
- (RBClientInheritanceManager)initWithInheritances:(id)a3 delegate:(id)a4;
- (RBClientInheritanceManagerDelegate)delegate;
- (id)description;
- (void)_lock_sendQueuedInheritancesAndUnlock;
- (void)setInheritances:(id)a3;
@end

@implementation RBClientInheritanceManager

- (RBClientInheritanceManager)initWithInheritances:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RBClientInheritanceManager;
  v8 = -[RBClientInheritanceManager init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_awaitingAck = 0;
    uint64_t v10 = [MEMORY[0x189603FE0] set];
    inheritances = v9->_inheritances;
    v9->_inheritances = (NSMutableSet *)v10;

    if (v6) {
      -[RBClientInheritanceManager setInheritances:](v9, "setInheritances:", v6);
    }
  }

  return v9;
}

- (RBClientInheritanceManager)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBClientInheritanceManager.m" lineNumber:46 description:@"wrong initializer"];

  return 0LL;
}

- (void)setInheritances:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (NSMutableSet *)[v5 mutableCopy];
  queuedGainedInheritances = self->_queuedGainedInheritances;
  self->_queuedGainedInheritances = v6;

  v8 = (NSMutableSet *)-[NSMutableSet mutableCopy](self->_inheritances, "mutableCopy");
  queuedLostInheritances = self->_queuedLostInheritances;
  self->_queuedLostInheritances = v8;

  -[NSMutableSet minusSet:](self->_queuedGainedInheritances, "minusSet:", self->_inheritances);
  -[NSMutableSet minusSet:](self->_queuedLostInheritances, "minusSet:", v5);

  -[RBClientInheritanceManager _lock_sendQueuedInheritancesAndUnlock]((uint64_t)self);
}

- (void)_lock_sendQueuedInheritancesAndUnlock
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 36));
    if (*(_BYTE *)(a1 + 32))
    {
LABEL_3:
      os_unfair_lock_unlock(v2);
      return;
    }

    [*(id *)(a1 + 16) minusSet:*(void *)(a1 + 8)];
    [*(id *)(a1 + 24) intersectSet:*(void *)(a1 + 8)];
    if (![*(id *)(a1 + 16) count] && !objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      v9 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0LL;

      uint64_t v10 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0LL;

      goto LABEL_3;
    }

    *(_BYTE *)(a1 + 32) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = (void *)[objc_alloc(MEMORY[0x189612228]) initWithGainedInheritances:*(void *)(a1 + 16) lostInheritances:*(void *)(a1 + 24)];
    if (v4)
    {
      rbs_connection_log();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        _os_log_impl(&dword_188634000, v5, OS_LOG_TYPE_DEFAULT, "Inheritance changeset: %{public}@", buf, 0xCu);
      }
    }

    id v6 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0LL;

    id v7 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0LL;

    os_unfair_lock_unlock(v2);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __67__RBClientInheritanceManager__lock_sendQueuedInheritancesAndUnlock__block_invoke;
    v11[3] = &unk_18A255B00;
    v11[4] = a1;
    id v12 = v4;
    id v8 = v4;
    [WeakRetained inheritanceManager:a1 didChangeInheritances:v8 completion:v11];
  }

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = -[NSMutableSet allObjects](self->_inheritances, "allObjects");
  uint64_t v4 = [v3 count];

  -[NSMutableSet allObjects](self->_queuedGainedInheritances, "allObjects");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  -[NSMutableSet allObjects](self->_queuedLostInheritances, "allObjects");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 count];

  id v23 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = @" inheritances:[\n\t";
  if (!v4) {
    uint64_t v10 = &stru_18A257E48;
  }
  v22 = v10;
  uint64_t v24 = v4;
  if (v4)
  {
    v21 = -[NSMutableSet allObjects](self->_inheritances, "allObjects");
    [v21 componentsJoinedByString:@",\n\t"];
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v12 = @"\n\t]";
  }

  else
  {
    id v12 = &stru_18A257E48;
    v11 = &stru_18A257E48;
  }

  if (v6) {
    objc_super v13 = @" queuedGainedInheritances:[\n\t";
  }
  else {
    objc_super v13 = &stru_18A257E48;
  }
  if (v6)
  {
    v20 = -[NSMutableSet allObjects](self->_queuedGainedInheritances, "allObjects");
    [v20 componentsJoinedByString:@",\n\t"];
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = @"\n\t]";
    if (v8) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v15 = &stru_18A257E48;
    v14 = &stru_18A257E48;
    if (v8)
    {
LABEL_11:
      v16 = -[NSMutableSet allObjects](self->_queuedLostInheritances, "allObjects");
      [v16 componentsJoinedByString:@",\n\t"];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)[v23 initWithFormat:@"<%@| %@%@%@%@%@%@%@%@%@>", v9, v22, v11, v12, v13, v14, v15, @" queuedLostInheritances:[\n\t", v17, @"\n\t]"];

      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  v18 = (void *)[v23 initWithFormat:@"<%@| %@%@%@%@%@%@%@%@%@>", v9, v22, v11, v12, v13, v14, v15, &stru_18A257E48, &stru_18A257E48, &stru_18A257E48];
  if (v6)
  {
LABEL_12:
  }

uint64_t __67__RBClientInheritanceManager__lock_sendQueuedInheritancesAndUnlock__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) gainedInheritances];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 unionSet:v3];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [*(id *)(a1 + 40) lostInheritances];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 minusSet:v5];

  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 0;
  return -[RBClientInheritanceManager _lock_sendQueuedInheritancesAndUnlock](*(void *)(a1 + 32));
}

- (RBClientInheritanceManagerDelegate)delegate
{
  return (RBClientInheritanceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end