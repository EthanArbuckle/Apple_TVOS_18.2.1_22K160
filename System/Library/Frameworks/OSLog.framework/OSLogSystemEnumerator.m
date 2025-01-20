@interface OSLogSystemEnumerator
- (OSLogSystemEnumerator)initWithEventStream:(id)a3 options:(unint64_t)a4 position:(id)a5;
- (id)nextObject;
- (void)_handleEventProxy:(id)a3;
- (void)_handleInvalidation;
- (void)dealloc;
@end

@implementation OSLogSystemEnumerator

- (OSLogSystemEnumerator)initWithEventStream:(id)a3 options:(unint64_t)a4 position:(id)a5
{
  char v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___OSLogSystemEnumerator;
  v11 = -[OSLogSystemEnumerator init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    p_stream = (id *)&v11->_stream;
    objc_storeStrong((id *)&v11->_stream, a3);
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
    pushDone = v12->_pushDone;
    v12->_pushDone = (OS_dispatch_semaphore *)v14;

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
    handlerDone = v12->_handlerDone;
    v12->_handlerDone = (OS_dispatch_semaphore *)v16;

    objc_initWeak(&location, v12);
    id v18 = *p_stream;
    uint64_t v19 = MEMORY[0x1895F87A8];
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke;
    v29[3] = &unk_189F1E008;
    objc_copyWeak(&v30, &location);
    [v18 setEventHandler:v29];
    id v20 = *p_stream;
    v27[0] = v19;
    v27[1] = 3221225472LL;
    v27[2] = __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke_2;
    v27[3] = &unk_189F1E030;
    objc_copyWeak(&v28, &location);
    [v20 setInvalidationHandler:v27];
    [*p_stream setFlags:39];
    if ((v6 & 1) != 0) {
      objc_msgSend(*p_stream, "setFlags:", objc_msgSend(*p_stream, "flags") | 8);
    }
    if (v10)
    {
      if ([v10 precision] == 1)
      {
        id v21 = *p_stream;
        [v10 date];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 activateStreamFromDate:v22];
LABEL_10:

        goto LABEL_11;
      }

      if ([v10 precision] == 2)
      {
        id v23 = *p_stream;
        [v10 offset];
        objc_msgSend(v23, "_activateStreamFromTimeIntervalSinceLastBoot:");
LABEL_11:
        v25 = v12;
        objc_destroyWeak(&v28);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
    }

    id v24 = *p_stream;
    [MEMORY[0x189603F50] distantPast];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 activateStreamFromDate:v22];
    goto LABEL_10;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogSystemEnumerator;
  -[OSLogSystemEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  if (self->_done
    || (dispatch_semaphore_signal((dispatch_semaphore_t)self->_pushDone),
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_handlerDone, 0xFFFFFFFFFFFFFFFFLL),
        self->_done))
  {
    objc_super v3 = 0LL;
  }

  else
  {
    objc_super v3 = self->_next;
  }

  return v3;
}

- (void)_handleEventProxy:(id)a3
{
  v4 = (OSLogEntry *)objc_claimAutoreleasedReturnValue();
  next = self->_next;
  self->_next = v4;
}

- (void)_handleInvalidation
{
  self->_done = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_pushDone);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_handlerDone);
}

- (void).cxx_destruct
{
}

void __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_super v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = WeakRetained[4];
    v7 = (dispatch_semaphore_s *)WeakRetained[5];
    v8 = (dispatch_semaphore_s *)v6;

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    id v9 = objc_loadWeakRetained(v3);
    [v9 _handleEventProxy:v10];

    dispatch_semaphore_signal(v7);
  }
}

void __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

@end