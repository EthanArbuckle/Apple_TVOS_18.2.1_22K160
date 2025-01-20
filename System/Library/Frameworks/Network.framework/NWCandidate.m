@interface NWCandidate
- (BOOL)isEligible;
- (id)description;
- (id)initCandidate:(id)a3 forManager:(id)a4 evaluator:(id)a5;
- (id)redactedDescription;
- (void)dealloc;
- (void)handleNewPath:(id)a3;
- (void)startEvaluator;
@end

@implementation NWCandidate

- (id)initCandidate:(id)a3 forManager:(id)a4 evaluator:(id)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v11 = (os_unfair_lock_s *)a5;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NWCandidate;
  v12 = -[NWCandidate init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->manager, v10);
    objc_storeStrong((id *)&v13->details, a3);
    objc_storeStrong((id *)&v13->evaluator, a5);
    if (v11)
    {
      v14 = v11;
      os_unfair_lock_lock(v11 + 24);
      v15 = (OS_nw_path *)v14[6];
      os_unfair_lock_unlock(v11 + 24);

      current_path = v13->current_path;
      v13->current_path = v15;
    }

    else
    {
      current_path = v13->current_path;
      v13->current_path = 0LL;
    }

    v17 = v13;
    goto LABEL_6;
  }

  __nwlog_obj();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v31 = "-[NWCandidate initCandidate:forManager:evaluator:]";
  v20 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (__nwlog_fault(v20, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWCandidate initCandidate:forManager:evaluator:]";
        _os_log_impl(&dword_181A5C000, v21, v22, "%{public}s [super init] failed", buf, 0xCu);
      }
    }

    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v24 = type;
      BOOL v25 = os_log_type_enabled(v21, type);
      if (backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446466;
          v31 = "-[NWCandidate initCandidate:forManager:evaluator:]";
          __int16 v32 = 2082;
          v33 = backtrace_string;
          _os_log_impl( &dword_181A5C000,  v21,  v24,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }

      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWCandidate initCandidate:forManager:evaluator:]";
        _os_log_impl(&dword_181A5C000, v21, v24, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }

    else
    {
      __nwlog_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v26 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[NWCandidate initCandidate:forManager:evaluator:]";
        _os_log_impl(&dword_181A5C000, v21, v26, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }

- (BOOL)isEligible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->manager);
  if (!WeakRetained || (*((_BYTE *)self + 40) & 1) != 0)
  {
    BOOL v7 = 0;
  }

  else
  {
    current_path = self->current_path;
    if (current_path)
    {
      v5 = current_path;
      int v6 = *((_DWORD *)v5 + 94);

      BOOL v7 = v6 != 2;
    }

    else
    {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)handleNewPath:(id)a3
{
  id v6 = a3;
  id WeakRetained = (NWConcrete_nw_candidate_manager *)objc_loadWeakRetained((id *)&self->manager);
  if (WeakRetained)
  {
    objc_storeStrong((id *)&self->current_path, a3);
    if (-[NWCandidate isEligible](self, "isEligible"))
    {
      if ((*((_BYTE *)self + 40) & 8) == 0) {
        nw_candidate_manager_inject(WeakRetained, self);
      }
    }

    else if ((*((_BYTE *)self + 40) & 8) != 0)
    {
      nw_candidate_manager_remove(WeakRetained, self);
    }
  }
}

- (void)startEvaluator
{
  if (self->evaluator)
  {
    if ((*((_BYTE *)self + 40) & 4) == 0)
    {
      *((_BYTE *)self + 40) |= 4u;
      objc_initWeak(&location, self);
      evaluator = self->evaluator;
      v4[0] = MEMORY[0x1895F87A8];
      v4[1] = 3221225472LL;
      v4[2] = __29__NWCandidate_startEvaluator__block_invoke;
      v4[3] = &unk_189BC8C90;
      objc_copyWeak(&v5, &location);
      nw_path_evaluator_set_update_handler(evaluator, 0LL, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }

- (id)description
{
  return (id)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"[CND %@ path:%@]",  self->details,  self->current_path);
}

- (id)redactedDescription
{
  if (nwlog_get_sensitive_redacted::onceToken != -1) {
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_59);
  }
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    v3 = -[OS_nw_interface_option_details redactedDescription](self->details, "redactedDescription");
    v4 = -[OS_nw_path redactedDescription](self->current_path, "redactedDescription");
    id v5 = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"[CND %@ path:%@]", v3, v4);
  }

  else
  {
    -[NWCandidate description](self, "description");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)dealloc
{
  evaluator = self->evaluator;
  if (evaluator) {
    nw_path_evaluator_cancel(evaluator);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWCandidate;
  -[NWCandidate dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

void __29__NWCandidate_startEvaluator__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNewPath:v5];
  }
}

@end