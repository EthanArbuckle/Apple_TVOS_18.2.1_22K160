@interface HIDService
+ (id)UUID;
- (BOOL)allInputReportsReady;
- (BOOL)isPowerManagementBasedOnDisplayState;
- (BOOL)pmIsSuspended;
- (CBCharacteristic)accessoryCategoryCharacteristic;
- (CBCharacteristic)hidControlPointCharacteristic;
- (CBCharacteristic)hidInformationCharacteristic;
- (CBCharacteristic)reportMapCharacteristic;
- (HIDBluetoothDevice)hidDevice;
- (HIDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (IONotificationPort)pmNotificationPort;
- (NSMapTable)reportInfoMap;
- (id)characteristicForReportID:(unsigned int)a3 reportType:(int)a4;
- (id)hidDeviceProperties;
- (id)reportTypeToString:(int)a3;
- (int)readReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6;
- (int)writeReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 withResponse:(BOOL)a6 error:(id *)a7;
- (unint64_t)numReports;
- (unsigned)pmNotifier;
- (unsigned)pmService;
- (void)authDidSucceedNotification:(id)a3;
- (void)createHIDDeviceIfEverythingReady;
- (void)createReportInfo:(id)a3;
- (void)dealloc;
- (void)deregisterForPowerManagementEvents;
- (void)destroyHIDDevice;
- (void)enterSuspendModeIfNeeded:(int64_t)a3;
- (void)exitSuspendModeIfNeeded;
- (void)handlePowerManagementNotification:(unsigned int)a3 notificationID:(int64_t)a4;
- (void)hidDeviceDesiredConnectionParametersDidChange;
- (void)hidDeviceDidStop;
- (void)notifyDidStartIfEverythingReady;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)registerForPowerManagementEvents;
- (void)screenStateChanged:(BOOL)a3;
- (void)setAccessoryCategoryCharacteristic:(id)a3;
- (void)setHidControlPointCharacteristic:(id)a3;
- (void)setHidDevice:(id)a3;
- (void)setHidInformationCharacteristic:(id)a3;
- (void)setNumReports:(unint64_t)a3;
- (void)setPmIsSuspended:(BOOL)a3;
- (void)setPmNotificationPort:(IONotificationPort *)a3;
- (void)setPmNotifier:(unsigned int)a3;
- (void)setPmService:(unsigned int)a3;
- (void)setReportInfoMap:(id)a3;
- (void)setReportMapCharacteristic:(id)a3;
- (void)signalCommandCondition:(id)a3 error:(id)a4;
- (void)start;
- (void)stop;
- (void)writeControlPointCommand:(unsigned __int8)a3;
@end

@implementation HIDService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDHumanInterfaceDeviceServiceString);
}

- (HIDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HIDService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v10, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1LL);
    -[ClientService setPriority:](v6, "setPriority:", 2LL);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    reportInfoMap = v6->_reportInfoMap;
    v6->_reportInfoMap = (NSMapTable *)v7;

    -[HIDService setPmService:](v6, "setPmService:", 0LL);
    -[HIDService setPmNotifier:](v6, "setPmNotifier:", 0LL);
  }

  return v6;
}

- (void)start
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HIDService;
  -[ClientService start](&v13, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDReportMapCharacteristicString));
  v14[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDReportCharacteristicString));
  v14[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDHIDControlPointCharacteristicString));
  v14[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDHIDInformationCharacteristicString));
  v14[3] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"D31D8DEA-47DB-4796-A6B9-E38909CB34FF"));
  v14[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDBootKeyboardInputReportCharacteristicString));
  v14[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDBootMouseInputReportCharacteristicString));
  v14[6] = v9;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 7LL));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  [v11 discoverCharacteristics:v10 forService:v12];
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDService;
  -[ClientService stop](&v3, "stop");
}

- (void)dealloc
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HIDService;
  -[HIDService dealloc](&v4, "dealloc");
}

- (void)createReportInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](&OBJC_CLASS___DataInputStream, "inputStreamWithData:", v5));

  __int16 v17 = 0;
  if ([v6 readUint8:(char *)&v17 + 1]
    && [v6 readUint8:&v17])
  {
    LOBYTE(v17) = v17 - 1;
    uint64_t v7 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v17;
      v15 = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v14));
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      __int16 v20 = 1024;
      int v21 = HIBYTE(v17);
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Found %@ report for ID #%u", buf, 0x12u);
    }

    v8 = objc_alloc(&OBJC_CLASS___HIDReportInfo);
    v9 = -[HIDReportInfo initWithID:type:](v8, "initWithID:type:", HIBYTE(v17), v17);
    reportInfoMap = self->_reportInfoMap;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 characteristic]);
    -[NSMapTable setObject:forKey:](reportInfoMap, "setObject:forKey:", v9, v11);

    if (!(_BYTE)v17)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v4 characteristic]);
      [v12 setNotifyValue:1 forCharacteristic:v13];
    }

    -[HIDService createHIDDeviceIfEverythingReady](self, "createHIDDeviceIfEverythingReady");
  }
}

- (id)hidDeviceProperties
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDDeviceInformationServiceString));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientServiceForUUID:v5]);

  if (v6)
  {
    if ([v6 hasIDs])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v6 vendorIDSource]));
      [v3 setObject:v7 forKeyedSubscript:@"VendorIDSource"];

      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v6 vendorID]));
      [v3 setObject:v8 forKeyedSubscript:@"VendorID"];

      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v6 productID]));
      [v3 setObject:v9 forKeyedSubscript:@"ProductID"];

      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v6 productVersion]));
      [v3 setObject:v10 forKeyedSubscript:@"VersionNumber"];
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 firmwareRevision]);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 firmwareRevision]);
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 stringByReplacingOccurrencesOfString:&stru_10005EB60 withString:&stru_10005DB20]);
      [v3 setObject:v13 forKeyedSubscript:@"kBTFirmwareRevisionKey"];
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 hardwareRevision]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 hardwareRevision]);
      v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 stringByReplacingOccurrencesOfString:&stru_10005EB60 withString:&stru_10005DB20]);
      [v3 setObject:v16 forKeyedSubscript:@"kBTHardwareRevisionKey"];
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
      v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 stringByReplacingOccurrencesOfString:&stru_10005EB60 withString:&stru_10005DB20]);
      [v3 setObject:v19 forKeyedSubscript:@"SerialNumber"];
    }

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 modelNumber]);

    if (v20)
    {
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 modelNumber]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 stringByReplacingOccurrencesOfString:&stru_10005EB60 withString:&stru_10005DB20]);
      [v3 setObject:v22 forKeyedSubscript:@"ModelNumber"];
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 manufacturerName]);

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v6 manufacturerName]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 stringByReplacingOccurrencesOfString:&stru_10005EB60 withString:&stru_10005DB20]);
      [v3 setObject:v25 forKeyedSubscript:@"Manufacturer"];
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 value]);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[DataInputStream inputStreamWithData:byteOrder:]( &OBJC_CLASS___DataInputStream,  "inputStreamWithData:byteOrder:",  v27,  1LL));

  LOWORD(v56[0]) = 0;
  unsigned __int8 v55 = 0;
  [v28 readUint16:v56];
  if ([v28 readUint8:&v55])
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v55));
    [v3 setObject:v29 forKeyedSubscript:@"CountryCode"];
  }

  v56[0] = 0LL;
  v56[1] = 0LL;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
  [v31 getUUIDBytes:v56];

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", LODWORD(v56[0])));
  [v3 setObject:v32 forKeyedSubscript:@"LocationID"];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 identifier]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 UUIDString]);
  [v3 setObject:v35 forKeyedSubscript:@"PhysicalDeviceUniqueID"];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 name]);

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 name]);
    [v3 setObject:v39 forKeyedSubscript:@"Product"];
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 value]);
  [v3 setObject:v41 forKeyedSubscript:@"ReportDescriptor"];

  [v3 setObject:@"BluetoothLowEnergy" forKeyedSubscript:@"Transport"];
  [v3 setObject:&off_100060198 forKeyedSubscript:@"RequestTimeout"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"HIDVirtualDevice"];
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"8341F2B4-C013-4F04-8197-C4CDB42E26DC"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v42 clientServiceForUUID:v43]);

  if (v44)
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Authenticated"];
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    [v45 addObserver:self selector:"authDidSucceedNotification:" name:@"AuthenticationServiceAuthDidSucceedNotification" object:v46];
  }

  else
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    unsigned int v48 = [v47 hasTag:@"needsMFiAuthentication4.0"];

    if (v48) {
      [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Authenticated"];
    }
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 value]);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:](&OBJC_CLASS___DataInputStream, "inputStreamWithData:", v51));

    LOBYTE(v56[0]) = 0;
    if ([v52 readUint8:v56])
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  LOBYTE(v56[0])));
      [v3 setObject:v53 forKeyedSubscript:@"IAPHIDAccessoryCategory"];
    }
  }

  return v3;
}

- (void)createHIDDeviceIfEverythingReady
{
  id v39 = (id)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v39 value]);
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
  if (!v6 || -[NSMapTable count](self->_reportInfoMap, "count") != self->_numReports)
  {

LABEL_8:
    return;
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
  if (!v7)
  {

LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDeviceProperties](self, "hidDeviceProperties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    if ([v12 isLinkEncrypted])
    {
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));

      if (!v13)
      {
        uint64_t v14 = (os_log_s *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
          sub_10003B048((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);
        }
        int v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_reportInfoMap, "objectEnumerator"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allObjects]);
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[HIDBluetoothDevice hidDeviceWithProperties:reports:]( &OBJC_CLASS___HIDBluetoothDevice,  "hidDeviceWithProperties:reports:",  v11,  v22));
        -[HIDService setHidDevice:](self, "setHidDevice:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          [v25 setService:self];

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          [v27 setPeripheral:v26];

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 desiredConnectionParameters]);

          v30 = (os_log_s *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
            sub_10003AFE4((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
          [v37 clientService:self desiresConnectionParameters:v29];

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
          [v38 start];
        }

        else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
        {
          sub_10003AFB8();
        }

- (void)destroyHIDDevice
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));

  if (v3)
  {
    reportInfoMap = self->_reportInfoMap;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100023A58;
    v6[3] = &unk_10005D3A8;
    v6[4] = self;
    -[NSMapTable enumerateKeysAndObjectsUsingBlock:](reportInfoMap, "enumerateKeysAndObjectsUsingBlock:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
    [v5 stop];
  }

- (void)signalCommandCondition:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 commandCondition]);
  [v7 lock];

  [v6 setCommandPending:0];
  [v6 setCommandError:v5];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 commandCondition]);
  [v8 signal];

  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 commandCondition]);
  [v9 unlock];
}

- (BOOL)isPowerManagementBasedOnDisplayState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  unsigned __int8 v3 = [v2 hasTag:@"A2538"];

  return v3;
}

- (void)registerForPowerManagementEvents
{
}

- (void)deregisterForPowerManagementEvents
{
  if (-[HIDService pmService](self, "pmService"))
  {
    IODeregisterForSystemPower(&self->_pmNotifier);
    IONotificationPortDestroy(-[HIDService pmNotificationPort](self, "pmNotificationPort"));
    IOServiceClose(-[HIDService pmService](self, "pmService"));
  }

- (void)notifyDidStartIfEverythingReady
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
  if ([v6 state] == 2)
  {
    unsigned int v3 = -[HIDService allInputReportsReady](self, "allInputReportsReady");

    if (v3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      [v4 postNotificationName:@"PeerIsUsingBuiltinServiceNotification" object:v5];

      -[ClientService notifyDidStart](self, "notifyDidStart");
    }
  }

  else
  {
  }

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v53 = a3;
  if (!a5)
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([a4 characteristics]);
    id v8 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v56;
      uint64_t v51 = CBUUIDReportMapCharacteristicString;
      uint64_t v11 = CBUUIDReportCharacteristicString;
      uint64_t v49 = CBUUIDHIDControlPointCharacteristicString;
      uint64_t v48 = CBUUIDHIDInformationCharacteristicString;
      uint64_t v50 = CBUUIDBootKeyboardInputReportCharacteristicString;
      uint64_t v47 = CBUUIDBootMouseInputReportCharacteristicString;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v13 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v12);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
          if (v14)
          {
          }

          else
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v51));
            unsigned int v17 = [v15 isEqual:v16];

            if (v17)
            {
              -[HIDService setReportMapCharacteristic:](self, "setReportMapCharacteristic:", v13);
              [v53 discoverDescriptorsForCharacteristic:v13];
LABEL_25:
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
              if ([v33 isLinkEncrypted])
              {
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);

                if (v34) {
                  goto LABEL_39;
                }
              }

              else
              {
              }

              [v53 readValueForCharacteristic:v13];
              goto LABEL_39;
            }
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v11));
          unsigned int v20 = [v18 isEqual:v19];

          if (v20)
          {
            ++self->_numReports;
            [v53 discoverDescriptorsForCharacteristic:v13];
            goto LABEL_39;
          }

          int v21 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidControlPointCharacteristic](self, "hidControlPointCharacteristic"));
          if (v21)
          {
          }

          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v49));
            unsigned int v24 = [v22 isEqual:v23];

            if (v24)
            {
              -[HIDService setHidControlPointCharacteristic:](self, "setHidControlPointCharacteristic:", v13);
              -[HIDService registerForPowerManagementEvents](self, "registerForPowerManagementEvents");
              goto LABEL_39;
            }
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
          if (v25)
          {
          }

          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v48));
            unsigned int v28 = [v26 isEqual:v27];

            if (v28)
            {
              -[HIDService setHidInformationCharacteristic:](self, "setHidInformationCharacteristic:", v13);
              goto LABEL_25;
            }
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
          if (v29)
          {
          }

          else
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"D31D8DEA-47DB-4796-A6B9-E38909CB34FF"));
            unsigned int v32 = [v30 isEqual:v31];

            if (v32)
            {
              -[HIDService setAccessoryCategoryCharacteristic:](self, "setAccessoryCategoryCharacteristic:", v13);
              goto LABEL_25;
            }
          }

          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v50));
          unsigned int v37 = [v35 isEqual:v36];

          if (v37)
          {
            v38 = (os_log_s *)qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Detected keyboard LE HID", buf, 2u);
            }

            id v39 = v53;
            v40 = @"IsLEKeyboard";
          }

          else
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v47));
            unsigned int v43 = [v41 isEqual:v42];

            if (!v43) {
              goto LABEL_39;
            }
            v44 = (os_log_s *)qword_100070CC8;
            if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Detected mouse LE HID", buf, 2u);
            }

            id v39 = v53;
            v40 = @"IsLEMouse";
          }

          [v39 tag:v40];
LABEL_39:
          v12 = (char *)v12 + 1;
        }

        while (v9 != v12);
        id v9 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      }

      while (v9);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
    if (!v45 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003B130();
    }
    if (!self->_numReports && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003B104();
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));

    if (!v46 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003B0D8();
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", v7));
  uint64_t v10 = v9;
  if (v9)
  {
    if ([v9 commandPending] == (id)1)
    {
      uint64_t v11 = (void *)qword_100070CC8;
      if (v8)
      {
        if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
        {
LABEL_17:
          -[HIDService signalCommandCondition:error:](self, "signalCommandCondition:error:", v10, v8);
          goto LABEL_30;
        }

        v12 = v11;
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]));
        int v33 = 138412802;
        uint64_t v34 = v13;
        __int16 v35 = 1024;
        unsigned int v36 = [v10 ID];
        __int16 v37 = 2112;
        id v38 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Error getting %@ report for ID #%u: %@",  (uint8_t *)&v33,  0x1Cu);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
        {
          v25 = v11;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]));
          unsigned int v27 = [v10 ID];
          unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
          int v33 = 138412802;
          uint64_t v34 = v26;
          __int16 v35 = 1024;
          unsigned int v36 = v27;
          __int16 v37 = 2112;
          id v38 = v28;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Did get %@ report for ID #%u: %@",  (uint8_t *)&v33,  0x1Cu);
        }

        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 value]);
        [v10 setCommandValue:v12];
      }

      goto LABEL_17;
    }

    if (v8)
    {
      uint64_t v18 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = v18;
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]));
        int v33 = 138412802;
        uint64_t v34 = v20;
        __int16 v35 = 1024;
        unsigned int v36 = [v10 ID];
        __int16 v37 = 2112;
        id v38 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Error updating %@ report for ID #%u: %@",  (uint8_t *)&v33,  0x1Cu);
      }
    }

    else
    {
      id v21 = [v7 valueTimestamp];
      if (!v21) {
        id v21 = (id)mach_absolute_time();
      }
      v22 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
      {
        v29 = v22;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", [v10 type]));
        unsigned int v31 = [v10 ID];
        unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
        int v33 = 138412802;
        uint64_t v34 = v30;
        __int16 v35 = 1024;
        unsigned int v36 = v31;
        __int16 v37 = 2112;
        id v38 = v32;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Updated %@ report for ID #%u: %@",  (uint8_t *)&v33,  0x1Cu);
      }

      if (byte_100070CC0) {
        kdebug_trace(730005908LL, v21, 0LL, 0LL, 0LL);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
      [v23 handleInputReportData:v24 reportID:[v10 ID] timestamp:v21];
    }
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[HIDService reportMapCharacteristic](self, "reportMapCharacteristic"));
    if (v14 == v7)
    {
      BOOL v17 = 0;
    }

    else
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[HIDService hidInformationCharacteristic](self, "hidInformationCharacteristic"));
      if (v15 == v7)
      {
        BOOL v17 = 0;
      }

      else
      {
        id v16 = (id)objc_claimAutoreleasedReturnValue(-[HIDService accessoryCategoryCharacteristic](self, "accessoryCategoryCharacteristic"));
        BOOL v17 = v16 != v7;
      }
    }

    if (!v8 && !v17) {
      -[HIDService createHIDDeviceIfEverythingReady](self, "createHIDDeviceIfEverythingReady");
    }
  }

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", a4));
  id v9 = v8;
  if (v8 && [v8 commandPending] == (id)2)
  {
    uint64_t v10 = (void *)qword_100070CC8;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", [v9 type]));
        int v13 = 138412802;
        id v14 = v12;
        __int16 v15 = 1024;
        unsigned int v16 = [v9 ID];
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Error setting %@ report for ID #%u: %@",  (uint8_t *)&v13,  0x1Cu);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
    {
      sub_10003B15C(v10, (uint64_t)v9, self);
    }

    -[HIDService signalCommandCondition:error:](self, "signalCommandCondition:error:", v9, v7);
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", a4));
  if (v8)
  {
    id v9 = (void *)qword_100070CC8;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", [v8 type]));
        int v13 = 138412802;
        id v14 = v11;
        __int16 v15 = 1024;
        unsigned int v16 = [v8 ID];
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Error starting notifications on %@ report for ID #%u: %@",  (uint8_t *)&v13,  0x1Cu);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
        sub_10003B1F0(v9, (uint64_t)v8, self);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));

      if (!v12) {
        -[HIDService createHIDDeviceIfEverythingReady](self, "createHIDDeviceIfEverythingReady");
      }
      -[HIDService notifyDidStartIfEverythingReady](self, "notifyDidStartIfEverythingReady");
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v26 = a3;
  id v7 = a4;
  id v8 = v7;
  if (a5) {
    goto LABEL_22;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDReportCharacteristicString));
  unsigned int v11 = [v9 isEqual:v10];

  if (!v11) {
    goto LABEL_22;
  }
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptors]);
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v13)
  {

    goto LABEL_20;
  }

  id v14 = v13;
  v25 = v8;
  char v15 = 0;
  uint64_t v16 = *(void *)v29;
  uint64_t v17 = CBUUIDReportReferenceDescriptorString;
  do
  {
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUID]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v17));
      unsigned int v22 = [v20 isEqual:v21];

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        if ([v23 isLinkEncrypted])
        {
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);

          if (v24)
          {
            -[HIDService createReportInfo:](self, "createReportInfo:", v19);
LABEL_14:
            char v15 = 1;
            continue;
          }
        }

        else
        {
        }

        [v26 readValueForDescriptor:v19];
        goto LABEL_14;
      }
    }

    id v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }

  while (v14);

  id v8 = v25;
  if ((v15 & 1) != 0) {
    goto LABEL_22;
  }
LABEL_20:
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003B284();
  }
LABEL_22:
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v11 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDReportReferenceDescriptorString));
    unsigned int v10 = [v8 isEqual:v9];

    id v7 = v11;
    if (v10)
    {
      -[HIDService createReportInfo:](self, "createReportInfo:", v11);
      id v7 = v11;
    }
  }
}

- (void)hidDeviceDidStop
{
}

- (void)hidDeviceDesiredConnectionParametersDidChange
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidDevice](self, "hidDevice"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 desiredConnectionParameters]);

  id v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003B2B0((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  [v12 clientService:self desiresConnectionParameters:v4];
}

- (int)readReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  int v8 = a4;
  int v11 = -536870212;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[HIDService characteristicForReportID:reportType:]( self,  "characteristicForReportID:reportType:",  a4,  *(void *)&a5));
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", v12));
    id v14 = v13;
    if (v13)
    {
      char v15 = (void *)objc_claimAutoreleasedReturnValue([v13 commandCondition]);
      [v15 lock];

      if ([v14 isValid])
      {
        uint64_t v16 = (void *)qword_100070CC8;
        if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v24 = v16;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v7));
          int v26 = 138412546;
          unsigned int v27 = v25;
          __int16 v28 = 1024;
          int v29 = v8;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Getting %@ report for ID #%u",  (uint8_t *)&v26,  0x12u);
        }

        [v14 setCommandPending:1];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        [v17 readValueForCharacteristic:v12];

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 commandCondition]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  30.0));
        unsigned int v20 = [v18 waitUntilDate:v19];

        if (v20)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 commandError]);

          if (v21)
          {
            if (a6) {
              *a6 = (id)objc_claimAutoreleasedReturnValue([v14 commandError]);
            }
          }

          else
          {
            int v11 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue([v14 commandValue]);
          }
        }

        else
        {
          [v14 setCommandPending:0];
          int v11 = -536870186;
        }
      }

      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v14 commandCondition]);
      [v22 unlock];
    }

    else
    {
      int v11 = -536870160;
    }
  }

  else
  {
    int v11 = -536870160;
  }

  return v11;
}

- (int)writeReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 withResponse:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = a4;
  int v12 = -536870212;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[HIDService characteristicForReportID:reportType:]( self,  "characteristicForReportID:reportType:",  v10,  v9));
  if (v14)
  {
    char v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_reportInfoMap, "objectForKey:", v14));
    uint64_t v16 = v15;
    if (!v15)
    {
      int v12 = -536870160;
LABEL_17:

      goto LABEL_18;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 commandCondition]);
    [v17 lock];

    id v18 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v24 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v9));
      int v29 = 138412802;
      __int128 v30 = v25;
      __int16 v31 = 1024;
      int v32 = v10;
      __int16 v33 = 2112;
      id v34 = v13;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Setting %@ report for ID #%u: %@",  (uint8_t *)&v29,  0x1Cu);

      if (v8) {
        goto LABEL_6;
      }
    }

    else if (v8)
    {
LABEL_6:
      [v16 setCommandPending:2];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      [v19 writeValue:v13 forCharacteristic:v14 type:0];

      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v16 commandCondition]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  30.0));
      unsigned int v22 = [v20 waitUntilDate:v21];

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v16 commandError]);

        if (v23)
        {
          if (a7) {
            *a7 = (id)objc_claimAutoreleasedReturnValue([v16 commandError]);
          }
          goto LABEL_16;
        }

        goto LABEL_15;
      }

      [v16 setCommandPending:0];
      int v12 = -536870186;
LABEL_16:
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v16 commandCondition]);
      [v27 unlock];

      goto LABEL_17;
    }

    int v26 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    [v26 writeValue:v13 forCharacteristic:v14 type:1];

LABEL_15:
    int v12 = 0;
    goto LABEL_16;
  }

  int v12 = -536870160;
LABEL_18:

  return v12;
}

- (void)handlePowerManagementNotification:(unsigned int)a3 notificationID:(int64_t)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
    case 1u:
      -[HIDService enterSuspendModeIfNeeded:](self, "enterSuspendModeIfNeeded:", a4);
      break;
    case 2u:
    case 9u:
      -[HIDService exitSuspendModeIfNeeded](self, "exitSuspendModeIfNeeded", *(void *)&a3);
      break;
    default:
      return;
  }

- (void)enterSuspendModeIfNeeded:(int64_t)a3
{
  if (-[HIDService pmIsSuspended](self, "pmIsSuspended"))
  {
    IOAllowPowerChange(-[HIDService pmService](self, "pmService"), a3);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
      sub_10003B314();
    }
    -[HIDService setPmIsSuspended:](self, "setPmIsSuspended:", 1LL);
    -[HIDService writeControlPointCommand:](self, "writeControlPointCommand:", 0LL);
    dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100025438;
    v6[3] = &unk_10005D3D0;
    v6[4] = self;
    void v6[5] = a3;
    dispatch_after(v5, &_dispatch_main_q, v6);
  }

- (void)exitSuspendModeIfNeeded
{
  if (-[HIDService pmIsSuspended](self, "pmIsSuspended"))
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
      sub_10003B340();
    }
    -[HIDService setPmIsSuspended:](self, "setPmIsSuspended:", 0LL);
    -[HIDService writeControlPointCommand:](self, "writeControlPointCommand:", 1LL);
  }

- (void)writeControlPointCommand:(unsigned __int8)a3
{
  unsigned __int8 v7 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v7, 1LL));
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService hidControlPointCharacteristic](self, "hidControlPointCharacteristic"));
  [v5 writeValue:v4 forCharacteristic:v6 type:1];
}

- (void)screenStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_time_t v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "suspend (screen off)";
    if (v3) {
      uint64_t v6 = "exit suspend (screen on)";
    }
    int v7 = 136446210;
    BOOL v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Screen state changed, sending HID control point command %{public}s",  (uint8_t *)&v7,  0xCu);
  }

  -[HIDService writeControlPointCommand:](self, "writeControlPointCommand:", v3);
}

- (void)authDidSucceedNotification:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AuthenticationServiceCertClassUserInfoKey"]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthenticationServiceAuthVersionKey"]);

  if ((int)[v7 intValue] <= 2 && (!v10 || objc_msgSend(v10, "unsignedIntValue")))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    [v8 postNotificationName:@"AuthenticationServiceAuthDidFailNotification" object:v9];
  }
}

- (BOOL)allInputReportsReady
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  reportInfoMap = self->_reportInfoMap;
  char v9 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000257D4;
  v5[3] = &unk_10005D3F8;
  v5[4] = &v6;
  -[NSMapTable enumerateKeysAndObjectsUsingBlock:](reportInfoMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)characteristicForReportID:(unsigned int)a3 reportType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_1000259B0;
  unsigned int v20 = sub_1000259C0;
  id v21 = 0LL;
  reportInfoMap = self->_reportInfoMap;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000259C8;
  v13[3] = &unk_10005D420;
  unsigned int v14 = a3;
  int v15 = a4;
  v13[4] = &v16;
  -[NSMapTable enumerateKeysAndObjectsUsingBlock:](reportInfoMap, "enumerateKeysAndObjectsUsingBlock:", v13);
  uint64_t v8 = (void *)v17[5];
  if (!v8)
  {
    char v9 = (os_log_s *)(id)qword_100070CC8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDService reportTypeToString:](self, "reportTypeToString:", v4));
      sub_10003B36C(v10, buf, a3, v9);
    }

    uint64_t v8 = (void *)v17[5];
  }

  id v11 = v8;
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)reportTypeToString:(int)a3
{
  else {
    return *(&off_10005D440 + a3);
  }
}

- (CBCharacteristic)reportMapCharacteristic
{
  return self->_reportMapCharacteristic;
}

- (void)setReportMapCharacteristic:(id)a3
{
}

- (CBCharacteristic)hidControlPointCharacteristic
{
  return self->_hidControlPointCharacteristic;
}

- (void)setHidControlPointCharacteristic:(id)a3
{
}

- (CBCharacteristic)hidInformationCharacteristic
{
  return self->_hidInformationCharacteristic;
}

- (void)setHidInformationCharacteristic:(id)a3
{
}

- (CBCharacteristic)accessoryCategoryCharacteristic
{
  return self->_accessoryCategoryCharacteristic;
}

- (void)setAccessoryCategoryCharacteristic:(id)a3
{
}

- (NSMapTable)reportInfoMap
{
  return self->_reportInfoMap;
}

- (void)setReportInfoMap:(id)a3
{
}

- (unint64_t)numReports
{
  return self->_numReports;
}

- (void)setNumReports:(unint64_t)a3
{
  self->_numReports = a3;
}

- (HIDBluetoothDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
}

- (unsigned)pmService
{
  return self->_pmService;
}

- (void)setPmService:(unsigned int)a3
{
  self->_pmService = a3;
}

- (IONotificationPort)pmNotificationPort
{
  return self->_pmNotificationPort;
}

- (void)setPmNotificationPort:(IONotificationPort *)a3
{
  self->_pmNotificationPort = a3;
}

- (unsigned)pmNotifier
{
  return self->_pmNotifier;
}

- (void)setPmNotifier:(unsigned int)a3
{
  self->_pmNotifier = a3;
}

- (BOOL)pmIsSuspended
{
  return self->_pmIsSuspended;
}

- (void)setPmIsSuspended:(BOOL)a3
{
  self->_pmIsSuspended = a3;
}

- (void).cxx_destruct
{
}

@end