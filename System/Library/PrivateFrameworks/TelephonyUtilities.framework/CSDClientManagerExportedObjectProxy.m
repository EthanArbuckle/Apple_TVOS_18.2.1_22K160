@interface CSDClientManagerExportedObjectProxy
- (BOOL)isSynchronous;
- (BOOL)respondsToSelector:(SEL)a3;
- (CSDClientManager)clientManager;
- (CSDClientManagerExportedObjectProxy)initWithExportedObject:(id)a3;
- (id)exportedObject;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setClientManager:(id)a3;
- (void)setSynchronous:(BOOL)a3;
@end

@implementation CSDClientManagerExportedObjectProxy

- (CSDClientManagerExportedObjectProxy)initWithExportedObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDClientManagerExportedObjectProxy;
  v6 = -[CSDClientManagerExportedObjectProxy init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_exportedObject, a3);
  }

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManagerExportedObjectProxy exportedObject](self, "exportedObject"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 methodSignatureForSelector:a3]);

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDClientManagerExportedObjectProxy exportedObject](self, "exportedObject"));
  LOBYTE(a3) = objc_opt_respondsToSelector(v4, a3);

  return a3 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDClientManagerExportedObjectProxy clientManager](self, "clientManager"));
  objc_msgSend( v5,  "handleInvocation:synchronously:",  v4,  -[CSDClientManagerExportedObjectProxy isSynchronous](self, "isSynchronous"));
}

- (CSDClientManager)clientManager
{
  return (CSDClientManager *)objc_loadWeakRetained((id *)&self->_clientManager);
}

- (void)setClientManager:(id)a3
{
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void).cxx_destruct
{
}

@end