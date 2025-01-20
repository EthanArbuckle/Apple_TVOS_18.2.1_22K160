@interface _NSHTTPConnectionInfo
- (BOOL)isValid;
- (id)initWithHTTPConnectionInfo:(void *)a3 queue:;
- (void)sendPingWithReceiveHandler:(id)a3;
@end

@implementation _NSHTTPConnectionInfo

- (void)sendPingWithReceiveHandler:(id)a3
{
  id v4 = a3;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke;
  v7[3] = &unk_189C1A2E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (BOOL)isValid
{
  return self->_httpConnectionInfo != 0LL;
}

- (void).cxx_destruct
{
}

- (id)initWithHTTPConnectionInfo:(void *)a3 queue:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS____NSHTTPConnectionInfo;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

@end