@interface CLAvengerScannerClient
- (BOOL)getOptedIn;
- (BOOL)hasPowerAssertion;
- (BOOL)isScanning;
- (BOOL)performNotOptedInBOMScan;
- (BOOL)performTemporaryAggressiveScan;
- (BOOL)performTemporaryHawkeyeLowEnergyScan;
- (BOOL)performTemporaryLongAggressiveScan;
- (BOOL)poweredOn;
- (BOOL)startBTFindingScan;
- (BOOL)stopBTFindingScan;
- (BOOL)stopTemporaryLongAggressiveScan;
- (CBCentralManager)centralManager;
- (CLAvengerReconciler)reconciler;
- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4;
- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4 optedIn:(BOOL)a5;
- (CLAvengerScannerClientController)controller;
- (CLAvengerScannerClientDelegateProtocol)delegate;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)clientIdentifier;
- (id)getPowerAssertionIdentifier;
- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)onAdvertisementBufferEmptied;
- (void)onAggressiveScanEnded;
- (void)onAggressiveScanStarted;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)onNotOptedInBOMScanEnded;
- (void)onUpdatedPowerState;
- (void)releasePowerAssertion;
- (void)setCentralManager:(id)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReconciler:(id)a3;
- (void)takePowerAssertion;
@end

@implementation CLAvengerScannerClient

- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4
{
  return -[CLAvengerScannerClient initWithDelegate:queue:optedIn:](self, "initWithDelegate:queue:optedIn:", a3, a4, 0LL);
}

- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4 optedIn:(BOOL)a5
{
  BOOL v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CLAvengerScannerClient;
  v8 = -[CLAvengerScannerClient init](&v13, "init");
  result = 0LL;
  if (a3 && v8)
  {
    objc_storeWeak((id *)&v8->_delegate, a3);
    v8->_queue = (OS_dispatch_queue *)a4;
    v10 = objc_alloc(&OBJC_CLASS___CBCentralManager);
    queue = v8->_queue;
    uint64_t v14 = CBManagerNeedsRestrictedStateOperation;
    v15 = &__kCFBooleanTrue;
    v8->_centralManager = -[CBCentralManager initWithDelegate:queue:options:]( v10,  "initWithDelegate:queue:options:",  v8,  queue,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    v8->_reconciler = -[CLAvengerReconciler initWithQueue:]( objc_alloc(&OBJC_CLASS___CLAvengerReconciler),  "initWithQueue:",  v8->_queue);
    value = v8->_powerAssertion.__ptr_.__value_;
    v8->_powerAssertion.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
    }
    v8->_controller = -[CLAvengerScannerClientController initWithDelegate:centralManager:optedIn:reconciler:queue:powerAssertionDelegate:]( objc_alloc(&OBJC_CLASS___CLAvengerScannerClientController),  "initWithDelegate:centralManager:optedIn:reconciler:queue:powerAssertionDelegate:",  v8,  v8->_centralManager,  v5,  v8->_reconciler,  v8->_queue,  v8);
    return v8;
  }

  return result;
}

- (void)dealloc
{
  self->_centralManager = 0LL;
  self->_controller = 0LL;

  self->_reconciler = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvengerScannerClient;
  -[CLAvengerScannerClient dealloc](&v3, "dealloc");
}

- (BOOL)performTemporaryAggressiveScan
{
  return -[CLAvengerScannerClientController performTemporaryAggressiveScan]( -[CLAvengerScannerClient controller](self, "controller"),  "performTemporaryAggressiveScan");
}

- (BOOL)performTemporaryLongAggressiveScan
{
  return -[CLAvengerScannerClientController performTemporaryLongAggressiveScan]( -[CLAvengerScannerClient controller](self, "controller"),  "performTemporaryLongAggressiveScan");
}

- (BOOL)stopTemporaryLongAggressiveScan
{
  return -[CLAvengerScannerClientController stopTemporaryLongAggressiveScan]( -[CLAvengerScannerClient controller](self, "controller"),  "stopTemporaryLongAggressiveScan");
}

- (BOOL)performTemporaryHawkeyeLowEnergyScan
{
  return -[CLAvengerScannerClientController performTemporaryHawkeyeLowEnergyScan]( -[CLAvengerScannerClient controller](self, "controller"),  "performTemporaryHawkeyeLowEnergyScan");
}

- (BOOL)startBTFindingScan
{
  return -[CLAvengerScannerClientController startBTFindingScan]( -[CLAvengerScannerClient controller](self, "controller"),  "startBTFindingScan");
}

- (BOOL)stopBTFindingScan
{
  return -[CLAvengerScannerClientController stopBTFindingScan]( -[CLAvengerScannerClient controller](self, "controller"),  "stopBTFindingScan");
}

- (BOOL)isScanning
{
  return -[CLAvengerScannerClientController isScanning]( -[CLAvengerScannerClient controller](self, "controller"),  "isScanning");
}

- (BOOL)getOptedIn
{
  return -[CLAvengerScannerClientController getOptedIn]( -[CLAvengerScannerClient controller](self, "controller"),  "getOptedIn");
}

- (void)setOptedIn:(BOOL)a3
{
}

- (BOOL)poweredOn
{
  return -[CLAvengerScannerClientController poweredOn]( -[CLAvengerScannerClient controller](self, "controller"),  "poweredOn");
}

- (BOOL)performNotOptedInBOMScan
{
  return -[CLAvengerScannerClientController performNotOptedInBOMScan]( -[CLAvengerScannerClient controller](self, "controller"),  "performNotOptedInBOMScan");
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
}

- (void)centralManagerDidUpdateState:(id)a3
{
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
}

- (id)clientIdentifier
{
  return -[CLAvengerScannerClientDelegateProtocol clientIdentifier]( -[CLAvengerScannerClient delegate](self, "delegate"),  "clientIdentifier");
}

- (void)onAggressiveScanStarted
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onAggressiveScanStarted") & 1) != 0) {
    -[CLAvengerScannerClientDelegateProtocol onAggressiveScanStarted]( -[CLAvengerScannerClient delegate](self, "delegate"),  "onAggressiveScanStarted");
  }
}

- (void)onAggressiveScanEnded
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onAggressiveScanEnded") & 1) != 0) {
    -[CLAvengerScannerClientDelegateProtocol onAggressiveScanEnded]( -[CLAvengerScannerClient delegate](self, "delegate"),  "onAggressiveScanEnded");
  }
}

- (void)onAdvertisementBufferEmptied
{
  if ((objc_opt_respondsToSelector( -[CLAvengerScannerClient delegate](self, "delegate"),  "onAdvertisementBufferEmptied") & 1) != 0) {
    -[CLAvengerScannerClientDelegateProtocol onAdvertisementBufferEmptied]( -[CLAvengerScannerClient delegate](self, "delegate"),  "onAdvertisementBufferEmptied");
  }
}

- (void)onUpdatedPowerState
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onUpdatedPowerState") & 1) != 0) {
    -[CLAvengerScannerClientDelegateProtocol onUpdatedPowerState]( -[CLAvengerScannerClient delegate](self, "delegate"),  "onUpdatedPowerState");
  }
}

- (void)onNotOptedInBOMScanEnded
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onNotOptedInBOMScanEnded") & 1) != 0) {
    -[CLAvengerScannerClientDelegateProtocol onNotOptedInBOMScanEnded]( -[CLAvengerScannerClient delegate](self, "delegate"),  "onNotOptedInBOMScanEnded");
  }
}

- (id)getPowerAssertionIdentifier
{
  return objc_msgSend( @"CLAvengerScannerClient/",  "stringByAppendingString:",  -[CLAvengerScannerClientDelegateProtocol clientIdentifier]( -[CLAvengerScannerClient delegate](self, "delegate"),  "clientIdentifier"));
}

- (BOOL)hasPowerAssertion
{
  return self->_powerAssertion.__ptr_.__value_ != 0LL;
}

- (void)takePowerAssertion
{
  if (-[CLAvengerScannerClient hasPowerAssertion](self, "hasPowerAssertion")) {
    -[CLAvengerScannerClient releasePowerAssertion](self, "releasePowerAssertion");
  }
  id v3 = objc_msgSend( -[CLAvengerScannerClient getPowerAssertionIdentifier](self, "getPowerAssertionIdentifier"),  "UTF8String");
  v4 = (CLPowerAssertion *)operator new(0x30uLL);
  sub_100AD558C((uint64_t)v4, (uint64_t)v3, 123LL, 60.0);
  value = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = v4;
  if (value)
  {
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
    v4 = self->_powerAssertion.__ptr_.__value_;
  }

  sub_1010DDBC0(__p, "none");
  sub_100AD5668((uint64_t)v4, (uint64_t *)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

- (void)releasePowerAssertion
{
  if (-[CLAvengerScannerClient hasPowerAssertion](self, "hasPowerAssertion"))
  {
    value = self->_powerAssertion.__ptr_.__value_;
    self->_powerAssertion.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
    }
  }

- (CLAvengerScannerClientDelegateProtocol)delegate
{
  return (CLAvengerScannerClientDelegateProtocol *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  self->_centralManager = (CBCentralManager *)a3;
}

- (CLAvengerScannerClientController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  self->_controller = (CLAvengerScannerClientController *)a3;
}

- (CLAvengerReconciler)reconciler
{
  return self->_reconciler;
}

- (void)setReconciler:(id)a3
{
  self->_reconciler = (CLAvengerReconciler *)a3;
}

- (void).cxx_destruct
{
  value = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end