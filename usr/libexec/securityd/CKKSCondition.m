@interface CKKSCondition
- (CKKSCondition)chain;
- (CKKSCondition)init;
- (OS_dispatch_semaphore)semaphore;
- (id)initToChain:(id)a3;
- (int64_t)wait:(unint64_t)a3;
- (void)fulfill;
- (void)setChain:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation CKKSCondition

- (CKKSCondition)init
{
  return (CKKSCondition *)-[CKKSCondition initToChain:](self, "initToChain:", 0LL);
}

- (id)initToChain:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CKKSCondition;
  v6 = -[CKKSCondition init](&v10, "init");
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    semaphore = v6->_semaphore;
    v6->_semaphore = (OS_dispatch_semaphore *)v7;

    objc_storeStrong((id *)&v6->_chain, a3);
  }

  return v6;
}

- (void)fulfill
{
  v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[CKKSCondition semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCondition chain](self, "chain"));
  [v4 fulfill];

  -[CKKSCondition setChain:](self, "setChain:", 0LL);
}

- (int64_t)wait:(unint64_t)a3
{
  id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[CKKSCondition semaphore](self, "semaphore"));
  dispatch_time_t v6 = dispatch_time(0LL, a3);
  int64_t v7 = dispatch_semaphore_wait(v5, v6);

  if (!v7)
  {
    v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[CKKSCondition semaphore](self, "semaphore"));
    dispatch_semaphore_signal(v8);
  }

  return v7;
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSemaphore:(id)a3
{
}

- (CKKSCondition)chain
{
  return (CKKSCondition *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setChain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end