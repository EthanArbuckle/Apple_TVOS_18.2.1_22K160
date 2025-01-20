@interface LACOwnerInfo
- (LACOwnerInfo)initWithProcessId:(int)a3 proxy:(id)a4 invalidationBlock:(id)a5;
- (id)invalidationBlock;
- (id)proxy;
- (int)pid;
@end

@implementation LACOwnerInfo

- (LACOwnerInfo)initWithProcessId:(int)a3 proxy:(id)a4 invalidationBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACOwnerInfo;
  v10 = -[LACOwnerInfo init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_pid = a3;
    objc_storeWeak(&v10->_proxy, v8);
    v12 = _Block_copy(v9);
    id invalidationBlock = v11->_invalidationBlock;
    v11->_id invalidationBlock = v12;
  }

  return v11;
}

- (int)pid
{
  return self->_pid;
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (id)proxy
{
  return objc_loadWeakRetained(&self->_proxy);
}

- (void).cxx_destruct
{
}

@end