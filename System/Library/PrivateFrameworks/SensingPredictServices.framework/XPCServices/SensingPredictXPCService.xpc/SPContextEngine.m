@interface SPContextEngine
- (SPContextEngine)initWithQueue:(id)a3;
- (void)_activate;
- (void)_ensureLocationMonitoringStarted;
- (void)_ensureLocationMonitoringStopped;
- (void)_ensureSoundSensorModuleStarted;
- (void)_ensureSoundSensorModuleStopped;
- (void)_invalidate;
- (void)activate;
- (void)invalidate;
- (void)processContextChangeFlags:(unsigned int)a3;
@end

@implementation SPContextEngine

- (SPContextEngine)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SPContextEngine;
  v6 = -[SPContextEngine init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

- (void)processContextChangeFlags:(unsigned int)a3
{
  self->_runLocationMonitoring = a3 & 1;
  self->_runSoundSensorModule = (a3 & 2) != 0;
  -[SPContextEngine _activate](self, "_activate");
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000622C;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activate
{
  if (self->_runSoundSensorModule) {
    -[SPContextEngine _ensureSoundSensorModuleStarted](self, "_ensureSoundSensorModuleStarted");
  }
  else {
    -[SPContextEngine _ensureSoundSensorModuleStopped](self, "_ensureSoundSensorModuleStopped");
  }
}

- (void)_ensureLocationMonitoringStarted
{
  v3 = -[SPLocationManager initWithQueue:]( objc_alloc(&OBJC_CLASS___SPLocationManager),  "initWithQueue:",  self->_dispatchQueue);
  spLocationManager = self->_spLocationManager;
  self->_spLocationManager = v3;

  -[SPLocationManager setLocationCategoryChangedHandler:]( self->_spLocationManager,  "setLocationCategoryChangedHandler:",  &stru_10000C450);
  -[SPLocationManager start](self->_spLocationManager, "start");
}

- (void)_ensureLocationMonitoringStopped
{
  spLocationManager = self->_spLocationManager;
  if (spLocationManager) {
    -[SPLocationManager stop](spLocationManager, "stop");
  }
}

- (void)_ensureSoundSensorModuleStarted
{
  v3 = (SPSoundSensor *)objc_claimAutoreleasedReturnValue( +[SPSoundSensor sharedSoundSensorModule]( &OBJC_CLASS___SPSoundSensor,  "sharedSoundSensorModule"));
  spSoundSensor = self->_spSoundSensor;
  self->_spSoundSensor = v3;

  -[SPSoundSensor subscribeToNoiseLevelForClient:callback:]( self->_spSoundSensor,  "subscribeToNoiseLevelForClient:callback:",  self,  &stru_10000C490);
  -[SPSoundSensor activate](self->_spSoundSensor, "activate");
}

- (void)_ensureSoundSensorModuleStopped
{
  spSoundSensor = self->_spSoundSensor;
  if (spSoundSensor)
  {
    -[SPSoundSensor unsubscribeFromNoiseLevel:](spSoundSensor, "unsubscribeFromNoiseLevel:", self);
    -[SPSoundSensor invalidate](self->_spSoundSensor, "invalidate");
  }

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000647C;
  block[3] = &unk_10000C2E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidate
{
  spSoundSensor = self->_spSoundSensor;
  if (spSoundSensor)
  {
    -[SPSoundSensor unsubscribeFromNoiseLevel:](spSoundSensor, "unsubscribeFromNoiseLevel:", self);
    -[SPSoundSensor invalidate](self->_spSoundSensor, "invalidate");
  }

- (void).cxx_destruct
{
}

@end