@interface BatteryClientService
+ (id)UUID;
- (BOOL)isAccessoryCategoryPencil:(id)a3;
- (BatteryClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (CBCharacteristic)batteryLevelCharacteristic;
- (CBCharacteristic)batteryPowerStateCharacteristic;
- (NSMutableDictionary)powerSourceDetails;
- (OpaqueIOPSPowerSourceID)powerSourceID;
- (id)batteryPowerStateString:(unsigned __int8)a3;
- (void)extractBatteryLevel;
- (void)extractBatteryPowerState;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setBatteryLevelCharacteristic:(id)a3;
- (void)setBatteryPowerStateCharacteristic:(id)a3;
- (void)setPowerSourceDetails:(id)a3;
- (void)setPowerSourceID:(OpaqueIOPSPowerSourceID *)a3;
- (void)start;
- (void)stop;
- (void)updatePowerSource:(id)a3;
@end

@implementation BatteryClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDBatteryServiceString);
}

- (BatteryClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BatteryClientService;
  return -[ClientService initWithManager:peripheral:service:](&v6, "initWithManager:peripheral:service:", a3, a4, a5);
}

- (void)start
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BatteryClientService;
  -[ClientService start](&v8, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDBatteryLevelCharacteristicString));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDBatteryPowerStateCharacteristicString));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  [v6 discoverCharacteristics:v5 forService:v7];
}

- (void)stop
{
  if (-[BatteryClientService powerSourceID](self, "powerSourceID")) {
    IOPSReleasePowerSource(-[BatteryClientService powerSourceID](self, "powerSourceID"));
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BatteryClientService;
  -[ClientService stop](&v3, "stop");
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  if (a5) {
    goto LABEL_23;
  }
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a4 characteristics]);
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v28;
  uint64_t v26 = CBUUIDBatteryLevelCharacteristicString;
  uint64_t v25 = CBUUIDBatteryPowerStateCharacteristicString;
  do
  {
    v13 = 0LL;
    do
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryLevelCharacteristic](self, "batteryLevelCharacteristic", v25));
      if (v15)
      {
      }

      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v26));
        unsigned int v18 = [v16 isEqual:v17];

        if (v18)
        {
          -[BatteryClientService setBatteryLevelCharacteristic:](self, "setBatteryLevelCharacteristic:", v14);
LABEL_15:
          [v8 readValueForCharacteristic:v14];
          goto LABEL_18;
        }
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateCharacteristic](self, "batteryPowerStateCharacteristic"));
      if (v19)
      {

        goto LABEL_18;
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v25));
      unsigned int v22 = [v20 isEqual:v21];

      if (v22)
      {
        -[BatteryClientService setBatteryPowerStateCharacteristic:](self, "setBatteryPowerStateCharacteristic:", v14);
        goto LABEL_15;
      }

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v10 = v7;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));

    if (v8 == v10)
    {
      -[BatteryClientService extractBatteryLevel](self, "extractBatteryLevel");
      goto LABEL_6;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateCharacteristic](self, "batteryPowerStateCharacteristic"));

    id v7 = v10;
    if (v9 == v10)
    {
      -[BatteryClientService extractBatteryPowerState](self, "extractBatteryPowerState");
LABEL_6:
      id v7 = v10;
    }
  }
}

- (void)extractBatteryLevel
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](&OBJC_CLASS___DataInputStream, "inputStreamWithData:", v4));

  unsigned __int8 v12 = 0;
  if ([v5 readUint8:&v12])
  {
    objc_super v6 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Battery level for peripheral %@: %u%%",  buf,  0x12u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100034DDC;
    v10[3] = &unk_10005D740;
    v10[4] = self;
    unsigned __int8 v11 = v12;
    -[BatteryClientService updatePowerSource:](self, "updatePowerSource:", v10);
  }
}

- (void)extractBatteryPowerState
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateCharacteristic](self, "batteryPowerStateCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](&OBJC_CLASS___DataInputStream, "inputStreamWithData:", v4));

  unsigned __int8 v13 = 0;
  if ([v5 readUint8:&v13])
  {
    objc_super v6 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService batteryPowerStateString:](self, "batteryPowerStateString:", v13));
      *(_DWORD *)buf = 138412546;
      __int16 v15 = v9;
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Battery power state for peripheral %@: %{public}@",  buf,  0x16u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100034FDC;
    v11[3] = &unk_10005D740;
    unsigned __int8 v12 = v13;
    v11[4] = self;
    -[BatteryClientService updatePowerSource:](self, "updatePowerSource:", v11);
  }
}

- (void)updatePowerSource:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));

  if (!v5)
  {
    objc_super v6 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    v34[0] = @"Type";
    v34[1] = @"Transport Type";
    v35[0] = @"Accessory Source";
    v35[1] = @"Bluetooth LE";
    v35[2] = @"Battery Power";
    v34[2] = @"Power Source State";
    v34[3] = @"Accessory Identifier";
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    v35[3] = v9;
    v35[4] = &off_10005FF40;
    v34[4] = @"Max Capacity";
    v34[5] = @"Low Warn Level";
    v35[5] = &off_10005FF58;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  6LL));
    unsigned __int8 v11 = -[NSMutableDictionary initWithDictionary:](v6, "initWithDictionary:", v10);
    -[BatteryClientService setPowerSourceDetails:](self, "setPowerSourceDetails:", v11);

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      [v16 setObject:v15 forKeyedSubscript:@"Name"];
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDDeviceInformationServiceString));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 clientServiceForUUID:v18]);

    if ([v19 hasIDs])
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v19 vendorIDSource]));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      [v21 setObject:v20 forKeyedSubscript:@"Vendor ID Source"];

      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v19 vendorID]));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      [v23 setObject:v22 forKeyedSubscript:@"Vendor ID"];

      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v19 productID]));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
      [v25 setObject:v24 forKeyedSubscript:@"Product ID"];

      if (-[BatteryClientService isAccessoryCategoryPencil:](self, "isAccessoryCategoryPencil:", v19))
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
        [v26 setObject:@"Pencil" forKeyedSubscript:@"Accessory Category"];
      }
    }
  }

  v4[2](v4);
  if (!-[BatteryClientService powerSourceID](self, "powerSourceID"))
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](&OBJC_CLASS___ConnectionManager, "instance"));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    unsigned int v29 = [v27 isAlwaysConnecting:v28];

    if (v29) {
      IOPSCreatePowerSource(&self->_powerSourceID);
    }
  }

  if (-[BatteryClientService powerSourceID](self, "powerSourceID"))
  {
    __int128 v30 = -[BatteryClientService powerSourceID](self, "powerSourceID");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryClientService powerSourceDetails](self, "powerSourceDetails"));
    int v32 = IOPSSetPowerSourceDetails(v30, v31);

    if (v32)
    {
      v33 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003D954(v33, self, v32);
      }
    }
  }
}

- (id)batteryPowerStateString:(unsigned __int8)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ / %@ / %@ / %@",  *(&off_10005D760 + (a3 & 3)),  *(&off_10005D7A0 + ((a3 >> 2) & 3)),  *(&off_10005D780 + ((a3 >> 4) & 3)),  *(&off_10005D7C0 + (a3 >> 6)));
}

- (BOOL)isAccessoryCategoryPencil:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 productID] == 546
    || [v3 productID] == 332
    || [v3 productID] == 482
    || [v3 productID] == 1106;
  if ([v3 vendorIDSource] == 1)
  {
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (CBCharacteristic)batteryLevelCharacteristic
{
  return self->_batteryLevelCharacteristic;
}

- (void)setBatteryLevelCharacteristic:(id)a3
{
}

- (CBCharacteristic)batteryPowerStateCharacteristic
{
  return self->_batteryPowerStateCharacteristic;
}

- (void)setBatteryPowerStateCharacteristic:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceID
{
  return self->_powerSourceID;
}

- (void)setPowerSourceID:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceID = a3;
}

- (NSMutableDictionary)powerSourceDetails
{
  return self->_powerSourceDetails;
}

- (void)setPowerSourceDetails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end