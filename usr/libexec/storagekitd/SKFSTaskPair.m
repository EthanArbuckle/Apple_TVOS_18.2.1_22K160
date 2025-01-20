@interface SKFSTaskPair
- (FSMessageReceiver)receiver;
- (SKFSTaskMessageHandler)msgHandler;
- (SKFSTaskPair)initWithMessageHandler:(id)a3;
- (void)setMsgHandler:(id)a3;
- (void)setReceiver:(id)a3;
@end

@implementation SKFSTaskPair

- (SKFSTaskPair)initWithMessageHandler:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SKFSTaskPair;
  v6 = -[SKFSTaskPair init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_msgHandler, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[FSMessageReceiver receiverWithDelegate:](&OBJC_CLASS___FSMessageReceiver, "receiverWithDelegate:", v5));
    receiver = v7->_receiver;
    v7->_receiver = (FSMessageReceiver *)v8;
  }

  return v7;
}

- (SKFSTaskMessageHandler)msgHandler
{
  return (SKFSTaskMessageHandler *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMsgHandler:(id)a3
{
}

- (FSMessageReceiver)receiver
{
  return (FSMessageReceiver *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setReceiver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end