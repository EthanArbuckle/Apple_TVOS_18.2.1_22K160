@interface CULiveAction
- (BOOL)direct;
- (CULiveAction)init;
- (CULiveAction)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)destinationIDs;
- (NSString)originatingHomeKitAccessoryID;
- (NSString)speakText;
- (NSURL)soundFileURL;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (int)alertType;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setAlertType:(int)a3;
- (void)setDestinationIDs:(id)a3;
- (void)setDirect:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setOriginatingHomeKitAccessoryID:(id)a3;
- (void)setSoundFileURL:(id)a3;
- (void)setSpeakText:(id)a3;
@end

@implementation CULiveAction

- (CULiveAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CULiveAction;
  v2 = -[CULiveAction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (CULiveAction)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[CULiveAction init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      v10 = (void *)*MEMORY[0x189607670];
LABEL_9:
      NSErrorF_safe(v10, (const char *)0xFFFFE59CLL);
      v8 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__CULiveAction_activateWithCompletion___block_invoke;
  block[3] = &unk_189F34300;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CULiveAction_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (int)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(int)a3
{
  self->_alertType = a3;
}

- (NSArray)destinationIDs
{
  return self->_destinationIDs;
}

- (void)setDestinationIDs:(id)a3
{
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (NSString)originatingHomeKitAccessoryID
{
  return self->_originatingHomeKitAccessoryID;
}

- (void)setOriginatingHomeKitAccessoryID:(id)a3
{
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (void)setSoundFileURL:(id)a3
{
}

- (NSString)speakText
{
  return self->_speakText;
}

- (void)setSpeakText:(id)a3
{
}

- (void).cxx_destruct
{
}

void __26__CULiveAction_invalidate__block_invoke(uint64_t a1)
{
  v11 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 24LL));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  id v8 = v11;
  if (v11)
  {
    (*((void (**)(void *))v11 + 2))(v11);
    id v8 = v11;
  }

  if (gLogCategory_CULiveAction <= 30)
  {
    if (gLogCategory_CULiveAction != -1
      || (v9 = _LogCategory_Initialize((uint64_t)&gLogCategory_CULiveAction, 0x1Eu), id v8 = v11, v9))
    {
      LogPrintF( (uint64_t)&gLogCategory_CULiveAction,  (uint64_t)"-[CULiveAction invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidated",  v4,  v5,  v6,  v7,  v10);
      id v8 = v11;
    }
  }
}

void __39__CULiveAction_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5B1LL);
  id v8 = (id)v2;
  if (gLogCategory_CULiveAction <= 90)
  {
    if (gLogCategory_CULiveAction != -1
      || (BOOL v7 = _LogCategory_Initialize((uint64_t)&gLogCategory_CULiveAction, 0x5Au), LOBYTE(v2) = (_BYTE)v8, v7))
    {
      LogPrintF( (uint64_t)&gLogCategory_CULiveAction,  (uint64_t)"-[CULiveAction activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %{error}",  v3,  v4,  v5,  v6,  v2);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end