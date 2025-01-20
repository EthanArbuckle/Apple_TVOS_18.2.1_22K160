@interface AKProximityPiggybackEngine
- (AKProximityEngineController)controller;
- (AKProximityPiggybackEngine)initWithPresenceSID:(id)a3;
- (BOOL)isActivated;
- (NSUUID)presenceSID;
- (OS_dispatch_queue)queue;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)prepareWithController:(id)a3 queue:(id)a4;
@end

@implementation AKProximityPiggybackEngine

- (AKProximityPiggybackEngine)initWithPresenceSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackEngine;
  v6 = -[AKProximityPiggybackEngine init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presenceSID, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100136F40(v4);
  }

  -[AKProximityPiggybackEngine invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackEngine;
  -[AKProximityPiggybackEngine dealloc](&v5, "dealloc");
}

- (void)prepareWithController:(id)a3 queue:(id)a4
{
  v6 = (OS_dispatch_queue *)a4;
  objc_storeWeak((id *)&self->_controller, a3);
  queue = self->_queue;
  self->_queue = v6;
}

- (void)activate
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine controller](self, "controller"));
  [v3 proximityEngineDidActivate:self];
}

- (void)invalidate
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine controller](self, "controller"));
  [v3 proximityEngineDidInvalidate:self];
}

- (BOOL)isActivated
{
  return 0;
}

- (AKProximityEngineController)controller
{
  return (AKProximityEngineController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)presenceSID
{
  return self->_presenceSID;
}

- (void).cxx_destruct
{
}

@end