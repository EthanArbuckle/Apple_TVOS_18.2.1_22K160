@interface ADExternalRequestListener
- (ADExternalRequestListener)init;
- (ADExternalRequestListener)initWithInstanceContext:(id)a3;
- (void)listen;
@end

@implementation ADExternalRequestListener

- (ADExternalRequestListener)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  v4 = -[ADExternalRequestListener initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (ADExternalRequestListener)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADExternalRequestListener;
  v5 = -[ADExternalRequestListener init](&v9, "init");
  if (v5)
  {
    if (v4) {
      v6 = (AFInstanceContext *)v4;
    }
    else {
      v6 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v6;
  }

  return v5;
}

- (void)listen
{
  instanceContext = self->_instanceContext;
  uint64_t v4 = AFExternalRequestMachService;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v7 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerForMachService:targetQueue:flags:]( instanceContext,  "createXPCListenerForMachService:targetQueue:flags:",  v4,  v6,  1LL));
  externalRequestListener = self->_externalRequestListener;
  self->_externalRequestListener = v7;

  xpc_connection_set_event_handler(self->_externalRequestListener, &stru_1004F2178);
  xpc_connection_resume(self->_externalRequestListener);
}

- (void).cxx_destruct
{
}

@end