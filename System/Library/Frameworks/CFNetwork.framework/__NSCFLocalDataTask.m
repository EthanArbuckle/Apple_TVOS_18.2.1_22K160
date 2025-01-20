@interface __NSCFLocalDataTask
- (BOOL)isKindOfClass:(Class)a3;
- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4;
@end

@implementation __NSCFLocalDataTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFLocalDataTask;
  if (-[__NSCFLocalDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  if (self)
  {
    -[NSURLSessionTask setResponse:](self, "setResponse:", a3);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:]( self,  "setCountOfBytesExpectedToReceive:",  [a3 expectedContentLength]);
    if (-[NSURLSessionTask state](self, "state") >= NSURLSessionTaskStateCanceling)
    {
LABEL_3:
      memset(v15, 0, sizeof(v15));
      (*((void (**)(id, void *))a4 + 2))(a4, v15);
      return;
    }

    if (objc_getProperty(self, v7, 784LL, 1)) {
      goto LABEL_10;
    }
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
  }

  else
  {
    uint64_t v11 = [0 state];
    internalDelegateWrapper = 0LL;
    if (v11 > 1) {
      goto LABEL_3;
    }
  }

  if (-[__NSCFURLSessionDelegateWrapper didReceiveResponse]((uint64_t)internalDelegateWrapper, v8))
  {
    -[__NSCFLocalSessionTask cfConn](self, "cfConn");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__NSCFLocalSessionTask _onqueue_suspend](self, "_onqueue_suspend");
      self->super._suspendedForDisposition = 1;
    }

    else if (!self)
    {
      publicDelegateWrapper = 0LL;
LABEL_15:
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __62____NSCFLocalDataTask__onqueue_didReceiveResponse_completion___block_invoke;
      v14[3] = &unk_189C02498;
      v14[4] = self;
      v14[5] = a4;
      -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:]( (uint64_t)publicDelegateWrapper,  self,  a3,  v14);
      return;
    }

    self->super._pendingResponseDisposition = 1;
    publicDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!publicDelegateWrapper) {
      publicDelegateWrapper = self->super.super._publicDelegateWrapper;
    }
    goto LABEL_15;
  }

@end