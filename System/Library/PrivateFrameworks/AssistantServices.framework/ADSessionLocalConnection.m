@interface ADSessionLocalConnection
- (ADSessionLocalConnectionDelegate)delegate;
- (id)initOnQueue:(id)a3;
- (void)cancelWithCompletion:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation ADSessionLocalConnection

- (id)initOnQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADSessionLocalConnection;
  v6 = -[ADSessionLocalConnection init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ADSessionLocalConnection;
  -[ADSessionLocalConnection dealloc](&v2, "dealloc");
}

- (void)start
{
  id v5 = -[SiriCoreConnectionType initWithTechnology:]( objc_alloc(&OBJC_CLASS___SiriCoreConnectionType),  "initWithTechnology:",  3005LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriConnection:self willStartWithConnectionType:v5];

  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  [v4 siriConnection:self didOpenWithConnectionType:v5 delay:0.0];
}

- (void)cancelWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (ADSessionLocalConnectionDelegate)delegate
{
  return (ADSessionLocalConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end