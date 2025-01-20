@interface TKSharedResourceSlot
- (OS_dispatch_queue)idleQueue;
- (TKSharedResourceSlot)initWithName:(id)a3;
- (double)idleTimeout;
- (id)createObjectBlock;
- (id)description;
- (id)object;
- (id)objectDestroyedBlock;
- (id)resourceWithError:(id *)a3;
- (void)dealloc;
- (void)destroyObject;
- (void)releaseResourceImmediatelly:(BOOL)a3;
- (void)setCreateObjectBlock:(id)a3;
- (void)setIdleQueue:(id)a3;
- (void)setIdleTimeout:(double)a3;
- (void)setObjectDestroyedBlock:(id)a3;
@end

@implementation TKSharedResourceSlot

- (TKSharedResourceSlot)initWithName:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKSharedResourceSlot;
  v6 = -[TKSharedResourceSlot init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    id v8 = [NSString stringWithFormat:@"resourceslot:%@", v7->_name];
    v9 = (const char *)[v8 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    idleQueue = v7->_idleQueue;
    v7->_idleQueue = (OS_dispatch_queue *)v11;
  }

  return v7;
}

- (id)object
{
  return self->_object;
}

- (id)description
{
  if (self->_object)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_resource);
    v4 = @"ACTIVE";
    if (!WeakRetained) {
      v4 = @"IDLE";
    }
    id v5 = v4;
  }

  else
  {
    id v5 = @"EMPTY";
  }

  v6 = (void *)NSString;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"<%@ %@ %@ %p o=%@>", v8, self->_name, v5, self, self->_object];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)destroyObject
{
  objectDestroyedBlock = (void (**)(void))self->_objectDestroyedBlock;
  if (objectDestroyedBlock && self->_object) {
    objectDestroyedBlock[2]();
  }
  id object = self->_object;
  self->_id object = 0LL;
}

- (void)releaseResourceImmediatelly:(BOOL)a3
{
  v4 = self;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_resource, 0LL);
  if (a3 || (-[TKSharedResourceSlot idleTimeout](v4, "idleTimeout"), v5 == 0.0))
  {
    -[TKSharedResourceSlot destroyObject](v4, "destroyObject");
  }

  else
  {
    -[TKSharedResourceSlot idleQueue](v4, "idleQueue");
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v6);
    idleTimer = v4->_idleTimer;
    v4->_idleTimer = (OS_dispatch_source *)v7;

    -[TKSharedResourceSlot idleTimeout](v4, "idleTimeout");
    uint64_t v10 = (uint64_t)(v9 * 1000000000.0);
    dispatch_queue_t v11 = (dispatch_source_s *)v4->_idleTimer;
    dispatch_time_t v12 = dispatch_time(0LL, v10);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, v10);
    objc_initWeak(&location, v4);
    v13 = (dispatch_source_s *)v4->_idleTimer;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke;
    v14[3] = &unk_189F8A460;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)v4->_idleTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v4);
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    id v4 = objc_loadWeakRetained((id *)v3 + 2);

    if (v4)
    {
      TK_LOG_sharedrsc();
      double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_2( (uint64_t)v3,  v5,  v6,  v7,  v8,  v9,  v10,  v11);
      }
    }

    else
    {
      dispatch_time_t v12 = (dispatch_source_s *)*((void *)v3 + 4);
      if (v12)
      {
        dispatch_source_cancel(v12);
        v13 = (void *)*((void *)v3 + 4);
      }

      else
      {
        v13 = 0LL;
      }

      *((void *)v3 + 4) = 0LL;

      [v3 destroyObject];
    }

    objc_sync_exit(v3);
  }

  else
  {
    TK_LOG_sharedrsc();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEBUG)) {
      __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_1((os_log_t)v3);
    }
  }
}

- (id)resourceWithError:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id WeakRetained = (TKSharedResource *)objc_loadWeakRetained((id *)&v4->_resource);
  if (!WeakRetained)
  {
    if (v4->_object)
    {
      idleTimer = (dispatch_source_s *)v4->_idleTimer;
      if (!idleTimer)
      {
        TK_LOG_sharedrsc();
        dispatch_time_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[TKSharedResourceSlot resourceWithError:].cold.1((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
        }

        goto LABEL_13;
      }

      dispatch_source_cancel(idleTimer);
      id object = v4->_idleTimer;
      v4->_idleTimer = 0LL;
      goto LABEL_12;
    }

    -[TKSharedResourceSlot createObjectBlock](v4, "createObjectBlock");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      id object = v4->_object;
      v4->_id object = (id)MEMORY[0x189604A88];
LABEL_12:

      goto LABEL_13;
    }

    -[TKSharedResourceSlot createObjectBlock](v4, "createObjectBlock");
    uint64_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v10 = ((void (**)(void, id *))v9)[2](v9, a3);
    id v11 = v4->_object;
    v4->_id object = (id)v10;

    if (v4->_object)
    {
LABEL_13:
      id WeakRetained = -[TKSharedResource initWithSlot:](objc_alloc(&OBJC_CLASS___TKSharedResource), "initWithSlot:", v4);
      objc_storeWeak((id *)&v4->_resource, WeakRetained);
      goto LABEL_14;
    }

    id WeakRetained = 0LL;
  }

- (void)dealloc
{
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    dispatch_source_cancel((dispatch_source_t)idleTimer);
    id v4 = self->_idleTimer;
    self->_idleTimer = 0LL;
  }

  if (self->_object) {
    -[TKSharedResourceSlot destroyObject](self, "destroyObject");
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TKSharedResourceSlot;
  -[TKSharedResourceSlot dealloc](&v5, sel_dealloc);
}

- (id)createObjectBlock
{
  return self->_createObjectBlock;
}

- (void)setCreateObjectBlock:(id)a3
{
}

- (id)objectDestroyedBlock
{
  return self->_objectDestroyedBlock;
}

- (void)setObjectDestroyedBlock:(id)a3
{
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (void)setIdleTimeout:(double)a3
{
  self->_idleTimeout = a3;
}

- (OS_dispatch_queue)idleQueue
{
  return self->_idleQueue;
}

- (void)setIdleQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl( &dword_186E58000,  log,  OS_LOG_TYPE_DEBUG,  "Idle callback detected, but slot is already gone, ignoring it",  v1,  2u);
}

void __52__TKSharedResourceSlot_releaseResourceImmediatelly___block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)resourceWithError:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end