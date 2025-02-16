@interface IDSIPCBroadcastProxy
- (IDSIPCBroadcastProxy)initWithProtocol:(id)a3 xpcProxy:(id)a4 nwProxy:(id)a5;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)nwBroadcastProxy;
- (id)xpcBroadcastProxy;
- (void)forwardInvocation:(id)a3;
- (void)sendXPCObject:(id)a3;
- (void)setNwBroadcastProxy:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setXpcBroadcastProxy:(id)a3;
@end

@implementation IDSIPCBroadcastProxy

- (IDSIPCBroadcastProxy)initWithProtocol:(id)a3 xpcProxy:(id)a4 nwProxy:(id)a5
{
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  v12 = (void *)v11;
  if (v9 && v10 | v11)
  {
    objc_storeStrong((id *)&self->_protocol, a3);
    objc_storeStrong(&self->_xpcBroadcastProxy, a4);
    objc_storeStrong(&self->_nwBroadcastProxy, a5);
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = self->_protocol;
  objc_method_description MethodDescription = protocol_getMethodDescription(v4, a3, 1, 1);
  types = MethodDescription.types;
  if (!MethodDescription.name)
  {
    types = protocol_getMethodDescription(v4, a3, 0, 1).types;
    if (types) {
      goto LABEL_3;
    }
LABEL_5:
    v7 = 0LL;
    goto LABEL_6;
  }

  if (!MethodDescription.types) {
    goto LABEL_5;
  }
LABEL_3:
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  types));
LABEL_6:

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIPCBroadcastProxy xpcBroadcastProxy](self, "xpcBroadcastProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIPCBroadcastProxy xpcBroadcastProxy](self, "xpcBroadcastProxy"));
    [v9 invokeWithTarget:v5];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIPCBroadcastProxy nwBroadcastProxy](self, "nwBroadcastProxy"));
  char v7 = objc_opt_respondsToSelector(v6, [v9 selector]);

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIPCBroadcastProxy nwBroadcastProxy](self, "nwBroadcastProxy"));
    [v9 invokeWithTarget:v8];
  }
}

- (void)sendXPCObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSIPCBroadcastProxy xpcBroadcastProxy](self, "xpcBroadcastProxy"));
    [v5 sendXPCObject:v4];
  }

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (id)xpcBroadcastProxy
{
  return self->_xpcBroadcastProxy;
}

- (void)setXpcBroadcastProxy:(id)a3
{
}

- (id)nwBroadcastProxy
{
  return self->_nwBroadcastProxy;
}

- (void)setNwBroadcastProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end