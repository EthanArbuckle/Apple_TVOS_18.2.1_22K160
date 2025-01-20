@interface _PBUnavailableBundleListLoaderCancellableToken
- (AMSPromise)promise;
- (BOOL)isCancelled;
- (void)cancel;
- (void)setPromise:(id)a3;
@end

@implementation _PBUnavailableBundleListLoaderCancellableToken

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_BOOL cancelled = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_promise);
  [WeakRetained cancel];

  objc_sync_exit(v2);
}

- (AMSPromise)promise
{
  return (AMSPromise *)objc_loadWeakRetained((id *)&self->_promise);
}

- (void)setPromise:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end