@interface OSLogEventStreamBase
- (NSPredicate)filterPredicate;
- (OSLogEventStreamBase)init;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)target;
- (id)invalidationHandler;
- (id)streamHandler;
- (unint64_t)flags;
- (unsigned)invalidated;
- (void)invalidate;
- (void)setEventHandler:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setInvalidated:(unsigned int)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStreamHandler:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation OSLogEventStreamBase

- (OSLogEventStreamBase)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OSLogEventStreamBase;
  id v2 = -[OSLogEventStreamBase init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.loggingsupport.stream", 0LL);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = dispatch_get_global_queue(0LL, 0LL);
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
  }

  return (OSLogEventStreamBase *)v2;
}

- (void)setFilterPredicate:(id)a3
{
  id v15 = a3;
  if (!v15)
  {
    filterPredicate = (_OSLogPredicateMapper *)self->_filterPredicate;
    self->_filterPredicate = 0LL;
LABEL_8:

    return;
  }

  filterPredicate = -[_OSLogPredicateMapper initWithPredicate:]( objc_alloc(&OBJC_CLASS____OSLogPredicateMapper),  "initWithPredicate:",  v15);
  -[_OSLogPredicateMapper mappedPredicate](filterPredicate, "mappedPredicate");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_OSLogPredicateMapper mappedPredicate](filterPredicate, "mappedPredicate");
    v6 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_filterPredicate;
    self->_filterPredicate = v6;

    -[NSPredicate allowEvaluation](self->_filterPredicate, "allowEvaluation");
    if ((-[_OSLogPredicateMapper flags](filterPredicate, "flags") & 2) != 0) {
      self->_flags |= 1uLL;
    }
    if ((-[_OSLogPredicateMapper flags](filterPredicate, "flags") & 1) != 0) {
      self->_flags |= 2uLL;
    }
    goto LABEL_8;
  }

  objc_super v8 = (void *)MEMORY[0x189603F70];
  v9 = -[_OSLogPredicateMapper validationErrors](filterPredicate, "validationErrors");
  [v9 componentsJoinedByString:@"\n"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 exceptionWithName:@"OSLogInvalidPredicateException" reason:v10 userInfo:0];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
  -[OSLogEventStreamBase setEventHandler:](v12, v13, v14);
}

- (void)setEventHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__OSLogEventStreamBase_setEventHandler___block_invoke;
  v7[3] = &unk_189F0EFC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)invalidate
{
  p_invalidated = &self->_invalidated;
  do
    __ldxr(p_invalidated);
  while (__stxr(1u, p_invalidated));
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__OSLogEventStreamBase_setInvalidationHandler___block_invoke;
  v7[3] = &unk_189F0EFC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (id)streamHandler
{
  return self->_streamHandler;
}

- (void)setStreamHandler:(id)a3
{
}

- (unsigned)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(unsigned int)a3
{
  self->_invalidated = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
}

void __47__OSLogEventStreamBase_setInvalidationHandler___block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

uint64_t __40__OSLogEventStreamBase_setEventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStreamHandler:*(void *)(a1 + 40)];
}

@end