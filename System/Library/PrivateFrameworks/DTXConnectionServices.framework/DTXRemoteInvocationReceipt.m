@interface DTXRemoteInvocationReceipt
- (DTXRemoteInvocationReceipt)init;
- (void)_checkedAssign:(id)a3;
- (void)handleCompletion:(id)a3;
- (void)invokeCompletionWithReturnValue:(id)a3 error:(id)a4;
- (void)waitForFulfillment;
@end

@implementation DTXRemoteInvocationReceipt

- (DTXRemoteInvocationReceipt)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DTXRemoteInvocationReceipt;
  result = -[DTXRemoteInvocationReceipt init](&v3, sel_init);
  if (result) {
    result->_guard._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)_checkedAssign:(id)a3
{
  id returnValue;
  id v5;
  id v6;
  void (**v7)(void, void, void);
  id v8;
  id v9;
  id completionHandler;
  char v11;
  void *v12;
  void (**v13)(void);
  id waiterChain;
  void (**v15)(void);
  v15 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_guard);
  v15[2]();
  if (self->_completionHandler && (*((_BYTE *)self + 36) & 3) != 0)
  {
    if ((*((_BYTE *)self + 36) & 3) == 1) {
      returnValue = self->_returnValue;
    }
    else {
      returnValue = 0LL;
    }
    v6 = returnValue;
    if ((*((_BYTE *)self + 36) & 3) == 2) {
      v8 = self->_returnValue;
    }
    else {
      v8 = 0LL;
    }
    v5 = v8;
    v7 = (void (**)(void, void, void))MEMORY[0x1895D398C](self->_completionHandler);
    v9 = self->_returnValue;
    self->_returnValue = 0LL;

    completionHandler = self->_completionHandler;
    self->_completionHandler = 0LL;

    if (v7) {
      v11 = 4;
    }
    else {
      v11 = 8;
    }
    *((_BYTE *)self + 36) = *((_BYTE *)self + 36) & 0xF3 | v11;
    os_unfair_lock_unlock(&self->_guard);
    if (v7)
    {
      v12 = (void *)MEMORY[0x1895D37B8]();
      ((void (**)(void, id, id))v7)[2](v7, v6, v5);
      objc_autoreleasePoolPop(v12);
      os_unfair_lock_lock(&self->_guard);
      *((_BYTE *)self + 36) = *((_BYTE *)self + 36) & 0xF3 | 8;
      v13 = (void (**)(void))MEMORY[0x1895D398C](self->_waiterChain);
      waiterChain = self->_waiterChain;
      self->_waiterChain = 0LL;

      os_unfair_lock_unlock(&self->_guard);
      if (v13) {
        v13[2](v13);
      }
    }
  }

  else
  {
    os_unfair_lock_unlock(&self->_guard);
    v5 = 0LL;
    v6 = 0LL;
    v7 = 0LL;
  }
}

- (void)handleCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_188BC1580;
  v7[3] = &unk_18A2ED500;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend__checkedAssign_(self, v6, (uint64_t)v7);
}

- (void)invokeCompletionWithReturnValue:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_188BC1674;
  v11[3] = &unk_18A2ED528;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend__checkedAssign_(self, v10, (uint64_t)v11);
}

- (void)waitForFulfillment
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000LL;
  id v7 = sub_188BC17A8;
  id v8 = sub_188BC17B8;
  id v9 = 0LL;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = sub_188BC17C0;
  v3[3] = &unk_18A2ED578;
  v3[4] = self;
  v3[5] = &v4;
  objc_msgSend__checkedAssign_(self, a2, (uint64_t)v3);
  v2 = (dispatch_semaphore_s *)v5[5];
  if (v2) {
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  }
  _Block_object_dispose(&v4, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_returnValue, 0LL);
}

@end