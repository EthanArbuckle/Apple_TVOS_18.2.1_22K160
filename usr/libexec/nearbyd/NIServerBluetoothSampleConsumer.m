@interface NIServerBluetoothSampleConsumer
- (NIServerBluetoothSampleConsumer)initWithConsumerBlock:(id)a3;
- (NIServerBluetoothSampleInternalObserver)internalObserver;
- (void)consumeBluetoothSample:(id)a3;
@end

@implementation NIServerBluetoothSampleConsumer

- (NIServerBluetoothSampleConsumer)initWithConsumerBlock:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIServerBluetoothSampleConsumer;
  v5 = -[NIServerBluetoothSampleConsumer init](&v11, "init");
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id consumerBlock = v5->_consumerBlock;
    v5->_id consumerBlock = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NIServerBluetoothSampleInternalObserver sharedObserver]( &OBJC_CLASS___NIServerBluetoothSampleInternalObserver,  "sharedObserver"));
    internalObserver = v5->_internalObserver;
    v5->_internalObserver = (NIServerBluetoothSampleInternalObserver *)v8;
  }

  return v5;
}

- (void)consumeBluetoothSample:(id)a3
{
  id v5 = a3;
  id consumerBlock = (void (**)(id, id))self->_consumerBlock;
  if (consumerBlock) {
    consumerBlock[2](consumerBlock, v5);
  }
}

- (NIServerBluetoothSampleInternalObserver)internalObserver
{
  return (NIServerBluetoothSampleInternalObserver *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end