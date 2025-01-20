@interface CUOSStateHandler
- (CUOSStateHandler)initWithTitle:(id)a3 dispatchQueue:(id)a4 handler:(id)a5;
- (NSString)title;
- (id)handler;
- (id)simulate;
- (os_state_data_s)_generateState;
- (unint64_t)stateHandle;
- (void)dealloc;
- (void)remove;
- (void)setHandler:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation CUOSStateHandler

- (CUOSStateHandler)initWithTitle:(id)a3 dispatchQueue:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CUOSStateHandler;
  v12 = -[CUOSStateHandler init](&v19, sel_init);
  if (v12)
  {
    v13 = _Block_copy(v11);
    id handler = v12->_handler;
    v12->_id handler = v13;

    objc_storeStrong((id *)&v12->_title, a3);
    objc_initWeak(&location, v12);
    objc_copyWeak(&v17, &location);
    v12->_stateHandle = os_state_add_handler();
    v15 = v12;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CUOSStateHandler;
  -[CUOSStateHandler dealloc](&v3, sel_dealloc);
}

- (void)remove
{
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0LL;
  }

- (id)simulate
{
  return (id)(*((uint64_t (**)(void))self->_handler + 2))();
}

- (os_state_data_s)_generateState
{
  objc_super v3 = (void *)MEMORY[0x1896079E8];
  (*((void (**)(void))self->_handler + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 dataWithPropertyList:v4 format:100 options:0 error:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    size_t v6 = [v5 length];
    v7 = (os_state_data_s *)calloc(1uLL, v6 + 200);
    v8 = v7;
    if (v7)
    {
      v7->var0 = 1;
      v7->var1.var1 = v6;
      -[NSString UTF8String](self->_title, "UTF8String");
      __strlcpy_chk();
      memcpy(v8->var4, (const void *)[v5 bytes], v6);
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __56__CUOSStateHandler_initWithTitle_dispatchQueue_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _generateState];

  return v2;
}

@end