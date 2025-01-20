@interface BaseResourceArbiterClient
- (BOOL)asynchRequestResourceAccess:(BOOL)a3;
- (BOOL)synchRequestResourceAccess;
- (ResourceArbiterClientDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation BaseResourceArbiterClient

- (BOOL)synchRequestResourceAccess
{
  return 1;
}

- (BOOL)asynchRequestResourceAccess:(BOOL)a3
{
  v4 = -[BaseResourceArbiterClient delegate](self, "delegate", a3);
  if (v4)
  {
    -[BaseResourceArbiterClient delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __57__BaseResourceArbiterClient_asynchRequestResourceAccess___block_invoke;
      block[3] = &unk_18A1670C8;
      block[4] = self;
      dispatch_async(MEMORY[0x1895F8AE0], block);
      LOBYTE(v4) = 1;
    }

    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

uint64_t __57__BaseResourceArbiterClient_asynchRequestResourceAccess___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "resourceAccessResult:", 1);
}

- (ResourceArbiterClientDelegate)delegate
{
  return (ResourceArbiterClientDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end