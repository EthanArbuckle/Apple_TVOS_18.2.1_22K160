@interface CWFXPCProxyConnection
- (CWFXPCProxyConnection)initWithForwardingTarget:(id)a3;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CWFXPCProxyConnection

- (CWFXPCProxyConnection)initWithForwardingTarget:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CWFXPCProxyConnection;
  v5 = -[CWFXPCProxyConnection init](&v22, sel_init);
  if (!v5) {
    goto LABEL_6;
  }
  v6 = objc_alloc_init(&OBJC_CLASS___CWFXPCProxy);
  XPCProxy = v5->_XPCProxy;
  v5->_XPCProxy = v6;

  v11 = v5->_XPCProxy;
  if (!v11) {
    goto LABEL_6;
  }
  objc_msgSend_setTarget_(v11, v8, (uint64_t)v4, v9, v10);
  v12 = objc_alloc_init(&OBJC_CLASS___CWFXPCProxy);
  synchronousXPCProxy = v5->_synchronousXPCProxy;
  v5->_synchronousXPCProxy = v12;

  v17 = v5->_synchronousXPCProxy;
  if (v17)
  {
    objc_msgSend_setSynchronous_(v17, v14, 1, v15, v16);
    objc_msgSend_setTarget_(v5->_synchronousXPCProxy, v18, (uint64_t)v4, v19, v20);
  }

  else
  {
LABEL_6:

    v5 = 0LL;
  }

  return v5;
}

- (void)invalidate
{
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_invalidationHandler(self, v13, v14, v15, v16);
    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v17[2]();
  }

  objc_msgSend_setInvalidationHandler_(self, v13, 0, v15, v16);
}

- (id)remoteObjectProxy
{
  return self->_XPCProxy;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return self->_XPCProxy;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return self->_synchronousXPCProxy;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end