@interface AKProximityPiggybackRequestingEngine
- (BOOL)isActivated;
- (void)activate;
- (void)invalidate;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)prepareWithController:(id)a3 queue:(id)a4;
@end

@implementation AKProximityPiggybackRequestingEngine

- (void)prepareWithController:(id)a3 queue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackRequestingEngine;
  -[AKProximityPiggybackEngine prepareWithController:queue:](&v9, "prepareWithController:queue:", a3, a4);
  v5 = objc_alloc(&OBJC_CLASS___CBPeripheralManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine queue](self, "queue"));
  v7 = -[CBPeripheralManager initWithDelegate:queue:options:](v5, "initWithDelegate:queue:options:", self, v6, 0LL);
  peripheralManager = self->_peripheralManager;
  self->_peripheralManager = v7;
}

- (void)activate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine presenceSID](self, "presenceSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithNSUUID:](&OBJC_CLASS___CBUUID, "UUIDWithNSUUID:", v3));

  v5 = -[CBMutableService initWithType:primary:]( objc_alloc(&OBJC_CLASS___CBMutableService),  "initWithType:primary:",  v4,  1LL);
  -[CBPeripheralManager addService:](self->_peripheralManager, "addService:", v5);
  peripheralManager = self->_peripheralManager;
  v12 = CBAdvertisementDataServiceUUIDsKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBMutableService UUID](v5, "UUID"));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v13 = v8;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  -[CBPeripheralManager startAdvertising:](peripheralManager, "startAdvertising:", v9);

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackRequestingEngine;
  -[AKProximityPiggybackEngine activate](&v10, "activate");
}

- (void)invalidate
{
  peripheralManager = self->_peripheralManager;
  if (peripheralManager)
  {
    -[CBPeripheralManager stopAdvertising](peripheralManager, "stopAdvertising");
    v4 = self->_peripheralManager;
    self->_peripheralManager = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKProximityPiggybackRequestingEngine;
  -[AKProximityPiggybackEngine invalidate](&v5, "invalidate");
}

- (BOOL)isActivated
{
  return self->_peripheralManager != 0LL;
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AKProximityPiggybackEngine controller](self, "controller"));
  [v5 proximityEngine:self managerDidUpdateState:v4];
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  objc_super v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412802;
      v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@: Peripheral manager (%@) failed to start advertising with error (%@)",  (uint8_t *)&v11,  0x20u);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Peripheral manager (%@) started advertising",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  __int16 v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138413058;
      __int16 v15 = self;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@: Peripheral manager (%@) failed to add service (%@) with error (%@)",  (uint8_t *)&v14,  0x2Au);
    }
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    __int16 v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Peripheral manager (%@) added service (%@)",  (uint8_t *)&v14,  0x20u);
  }
}

- (void).cxx_destruct
{
}

@end