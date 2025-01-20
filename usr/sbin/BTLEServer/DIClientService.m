@interface DIClientService
+ (id)UUID;
- (BOOL)hasIDs;
- (CBCharacteristic)fwRevisionCharacteristic;
- (CBCharacteristic)hwRevisionCharacteristic;
- (CBCharacteristic)manufacturerNameCharacteristic;
- (CBCharacteristic)modelNumberCharacteristic;
- (CBCharacteristic)pnpIDCharacteristic;
- (CBCharacteristic)serialNumberCharacteristic;
- (CBCharacteristic)swRevisionCharacteristic;
- (CBCharacteristic)udiForMedicalDevicesCharacteristic;
- (DIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (NSString)firmwareRevision;
- (NSString)hardwareRevision;
- (NSString)manufacturerName;
- (NSString)modelNumber;
- (NSString)serialNumber;
- (NSString)softwareRevision;
- (NSString)udiForMedicalDevices;
- (id)vendorIDSourceString;
- (unsigned)productID;
- (unsigned)productVersion;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (void)extractIDs;
- (void)notifyListeners:(int)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setFwRevisionCharacteristic:(id)a3;
- (void)setHwRevisionCharacteristic:(id)a3;
- (void)setManufacturerNameCharacteristic:(id)a3;
- (void)setModelNumberCharacteristic:(id)a3;
- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4;
- (void)setPnpIDCharacteristic:(id)a3;
- (void)setSerialNumberCharacteristic:(id)a3;
- (void)setSwRevisionCharacteristic:(id)a3;
- (void)setUdiForMedicalDevicesCharacteristic:(id)a3;
- (void)start;
@end

@implementation DIClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString);
}

- (DIClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DIClientService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setPriority:](v5, "setPriority:", 1LL);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
  }

  return v6;
}

- (void)start
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DIClientService;
  -[ClientService start](&v14, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", CBUUIDPnPIDCharacteristicString));
  v15[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSoftwareRevisionStringCharacteristicString));
  v15[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDFirmwareRevisionStringCharacteristicString));
  v15[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDHardwareRevisionStringCharacteristicString));
  v15[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDSerialNumberStringCharacteristicString));
  v15[4] = v7;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDModelNumberStringCharacteristicString));
  v15[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDManufacturerNameStringCharacteristicString));
  v15[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  CBUUIDUDIForMedicalDevicesCharacteristicString));
  v15[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 8LL));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  [v12 discoverCharacteristics:v11 forService:v13];
}

- (BOOL)hasIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 value]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)extractIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DataInputStream inputStreamWithData:byteOrder:]( &OBJC_CLASS___DataInputStream,  "inputStreamWithData:byteOrder:",  v4,  1LL));

  if ([v5 readUint8:&self->_vendorIDSource])
  {
    if ([v5 readUint16:&self->_vendorID])
    {
      if ([v5 readUint16:&self->_productID])
      {
        if ([v5 readUint16:&self->_productVersion])
        {
          v6 = (void *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
          {
            v7 = v6;
            objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService vendorIDSourceString](self, "vendorIDSourceString"));
            int v11 = 138413314;
            v12 = v9;
            __int16 v13 = 2112;
            objc_super v14 = v10;
            __int16 v15 = 1024;
            unsigned int v16 = -[DIClientService vendorID](self, "vendorID");
            __int16 v17 = 1024;
            unsigned int v18 = -[DIClientService productID](self, "productID");
            __int16 v19 = 1024;
            unsigned int v20 = -[DIClientService productVersion](self, "productVersion");
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PnP ID for peripheral %@: %@ / 0x%04X / 0x%04X / 0x%04X",  (uint8_t *)&v11,  0x28u);
          }
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  if (!a5)
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([a4 characteristics]);
    id v9 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (!v9) {
      goto LABEL_42;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v56;
    uint64_t v53 = CBUUIDPnPIDCharacteristicString;
    uint64_t v51 = CBUUIDFirmwareRevisionStringCharacteristicString;
    uint64_t v52 = CBUUIDSoftwareRevisionStringCharacteristicString;
    uint64_t v49 = CBUUIDSerialNumberStringCharacteristicString;
    uint64_t v50 = CBUUIDHardwareRevisionStringCharacteristicString;
    uint64_t v47 = CBUUIDManufacturerNameStringCharacteristicString;
    uint64_t v48 = CBUUIDModelNumberStringCharacteristicString;
    uint64_t v46 = CBUUIDUDIForMedicalDevicesCharacteristicString;
    while (1)
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v12);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));
        if (v14)
        {
        }

        else
        {
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v53));
          unsigned int v17 = [v15 isEqual:v16];

          if (v17)
          {
            -[DIClientService setPnpIDCharacteristic:](self, "setPnpIDCharacteristic:", v13);
LABEL_39:
            [v8 readValueForCharacteristic:v13];
            goto LABEL_40;
          }
        }

        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService swRevisionCharacteristic](self, "swRevisionCharacteristic"));
        if (v18)
        {
        }

        else
        {
          __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v52));
          unsigned int v21 = [v19 isEqual:v20];

          if (v21)
          {
            -[DIClientService setSwRevisionCharacteristic:](self, "setSwRevisionCharacteristic:", v13);
            goto LABEL_39;
          }
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService fwRevisionCharacteristic](self, "fwRevisionCharacteristic"));
        if (v22)
        {
        }

        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v51));
          unsigned int v25 = [v23 isEqual:v24];

          if (v25)
          {
            -[DIClientService setFwRevisionCharacteristic:](self, "setFwRevisionCharacteristic:", v13);
            goto LABEL_39;
          }
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService hwRevisionCharacteristic](self, "hwRevisionCharacteristic"));
        if (v26)
        {
        }

        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v50));
          unsigned int v29 = [v27 isEqual:v28];

          if (v29)
          {
            -[DIClientService setHwRevisionCharacteristic:](self, "setHwRevisionCharacteristic:", v13);
            goto LABEL_39;
          }
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService serialNumberCharacteristic](self, "serialNumberCharacteristic"));
        if (v30)
        {
        }

        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v49));
          unsigned int v33 = [v31 isEqual:v32];

          if (v33)
          {
            -[DIClientService setSerialNumberCharacteristic:](self, "setSerialNumberCharacteristic:", v13);
            goto LABEL_39;
          }
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService modelNumberCharacteristic](self, "modelNumberCharacteristic"));
        if (v34)
        {
        }

        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v48));
          unsigned int v37 = [v35 isEqual:v36];

          if (v37)
          {
            -[DIClientService setModelNumberCharacteristic:](self, "setModelNumberCharacteristic:", v13);
            goto LABEL_39;
          }
        }

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[DIClientService manufacturerNameCharacteristic](self, "manufacturerNameCharacteristic"));
        if (v38)
        {
        }

        else
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v47));
          unsigned int v41 = [v39 isEqual:v40];

          if (v41)
          {
            -[DIClientService setManufacturerNameCharacteristic:](self, "setManufacturerNameCharacteristic:", v13);
            goto LABEL_39;
          }
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue( -[DIClientService udiForMedicalDevicesCharacteristic]( self,  "udiForMedicalDevicesCharacteristic"));
        if (v42)
        {

          goto LABEL_40;
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](&OBJC_CLASS___CBUUID, "UUIDWithString:", v46));
        unsigned int v45 = [v43 isEqual:v44];

        if (v45)
        {
          -[DIClientService setUdiForMedicalDevicesCharacteristic:](self, "setUdiForMedicalDevicesCharacteristic:", v13);
          -[DIClientService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", 1LL, v13);
          goto LABEL_39;
        }

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v45 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService pnpIDCharacteristic](self, "pnpIDCharacteristic"));

    if (v8 == v45)
    {
      -[DIClientService extractIDs](self, "extractIDs");
      uint64_t v20 = 0LL;
      goto LABEL_18;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService swRevisionCharacteristic](self, "swRevisionCharacteristic"));

    if (v9 == v45)
    {
      unsigned int v21 = objc_alloc(&OBJC_CLASS___NSString);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
      v23 = -[NSString initWithData:encoding:](v21, "initWithData:encoding:", v22, 4LL);
      softwareRevision = self->_softwareRevision;
      self->_softwareRevision = v23;

      uint64_t v20 = 1LL;
      goto LABEL_18;
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService fwRevisionCharacteristic](self, "fwRevisionCharacteristic"));

    if (v10 == v45)
    {
      unsigned int v25 = objc_alloc(&OBJC_CLASS___NSString);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
      v27 = -[NSString initWithData:encoding:](v25, "initWithData:encoding:", v26, 4LL);
      firmwareRevision = self->_firmwareRevision;
      self->_firmwareRevision = v27;

      uint64_t v20 = 2LL;
      goto LABEL_18;
    }

    id v11 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService hwRevisionCharacteristic](self, "hwRevisionCharacteristic"));

    if (v11 == v45)
    {
      unsigned int v29 = objc_alloc(&OBJC_CLASS___NSString);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
      v31 = -[NSString initWithData:encoding:](v29, "initWithData:encoding:", v30, 4LL);
      hardwareRevision = self->_hardwareRevision;
      self->_hardwareRevision = v31;

      uint64_t v20 = 3LL;
      goto LABEL_18;
    }

    id v12 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService serialNumberCharacteristic](self, "serialNumberCharacteristic"));

    if (v12 == v45)
    {
      unsigned int v33 = objc_alloc(&OBJC_CLASS___NSString);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
      uint64_t v20 = 4LL;
      v35 = -[NSString initWithData:encoding:](v33, "initWithData:encoding:", v34, 4LL);
      serialNumber = self->_serialNumber;
      self->_serialNumber = v35;

      goto LABEL_18;
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService modelNumberCharacteristic](self, "modelNumberCharacteristic"));

    if (v13 == v45)
    {
      unsigned int v37 = objc_alloc(&OBJC_CLASS___NSString);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
      v39 = -[NSString initWithData:encoding:](v37, "initWithData:encoding:", v38, 4LL);
      modelNumber = self->_modelNumber;
      self->_modelNumber = v39;

      uint64_t v20 = 5LL;
      goto LABEL_18;
    }

    id v14 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService manufacturerNameCharacteristic](self, "manufacturerNameCharacteristic"));

    if (v14 == v45)
    {
      unsigned int v41 = objc_alloc(&OBJC_CLASS___NSString);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
      v43 = -[NSString initWithData:encoding:](v41, "initWithData:encoding:", v42, 4LL);
      manufacturerName = self->_manufacturerName;
      self->_manufacturerName = v43;

      uint64_t v20 = 6LL;
      goto LABEL_18;
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue(-[DIClientService udiForMedicalDevicesCharacteristic](self, "udiForMedicalDevicesCharacteristic"));

    if (v15 == v45)
    {
      unsigned int v16 = objc_alloc(&OBJC_CLASS___NSString);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v45 value]);
      unsigned int v18 = -[NSString initWithData:encoding:](v16, "initWithData:encoding:", v17, 4LL);
      udiForMedicalDevices = self->_udiForMedicalDevices;
      self->_udiForMedicalDevices = v18;

      uint64_t v20 = 7LL;
LABEL_18:
      -[DIClientService notifyListeners:](self, "notifyListeners:", v20);
    }
  }
}

- (void)notifyListeners:(int)a3
{
  switch(a3)
  {
    case 0:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PID:0x%04X VID:0x%04X",  self->_productID,  self->_vendorID));
      v5 = @"PnP";
      if (v4) {
        goto LABEL_16;
      }
      goto LABEL_18;
    case 1:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService softwareRevision](self, "softwareRevision"));
      v5 = @"SoftwareRevision";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 2:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService firmwareRevision](self, "firmwareRevision"));
      v5 = @"FirmwareRevision";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 3:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService hardwareRevision](self, "hardwareRevision"));
      v5 = @"HardwareRevision";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 4:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService serialNumber](self, "serialNumber"));
      v5 = @"SerialNumber";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 5:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService modelNumber](self, "modelNumber"));
      v5 = @"ModelNumber";
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_16;
    case 6:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService manufacturerName](self, "manufacturerName"));
      v5 = @"ManufacturerName";
      if (v4) {
        goto LABEL_16;
      }
      goto LABEL_18;
    case 7:
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DIClientService udiForMedicalDevices](self, "udiForMedicalDevices"));
      v5 = @"UDIForMedicalDevices";
      if (v4) {
        goto LABEL_16;
      }
LABEL_18:
      id v14 = (id)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      NSLog(@"Error updating DeviceInformation for %@‘s %@ - %@", v13, v5, 0LL);

      break;
    default:
      v5 = @"Unknown";
      BOOL v4 = &stru_10005DB20;
LABEL_16:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      NSLog(@"Updated DeviceInformation for %@‘s %@ - %@", v7, v5, v4);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v15[0] = @"UUID";
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
      v15[1] = v5;
      v16[0] = v11;
      v16[1] = v4;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
      [v8 postNotificationName:@"DeviceInformationUpdate" object:self userInfo:v12];

      break;
  }

- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v10 = v6;
    unsigned __int8 v8 = [v6 properties];
    id v7 = v10;
    if ((v8 & 0x10) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      [v9 setNotifyValue:v4 forCharacteristic:v10];

      id v7 = v10;
    }
  }
}

- (id)vendorIDSourceString
{
  unsigned int v2 = -[DIClientService vendorIDSource](self, "vendorIDSource");
  v3 = @"Unknown";
  if (v2 == 2) {
    v3 = @"USB";
  }
  if (v2 == 1) {
    return @"BT";
  }
  else {
    return (id)v3;
  }
}

- (NSString)softwareRevision
{
  return self->_softwareRevision;
}

- (NSString)firmwareRevision
{
  return self->_firmwareRevision;
}

- (NSString)hardwareRevision
{
  return self->_hardwareRevision;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (NSString)udiForMedicalDevices
{
  return self->_udiForMedicalDevices;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)productVersion
{
  return self->_productVersion;
}

- (CBCharacteristic)pnpIDCharacteristic
{
  return self->_pnpIDCharacteristic;
}

- (void)setPnpIDCharacteristic:(id)a3
{
}

- (CBCharacteristic)swRevisionCharacteristic
{
  return self->_swRevisionCharacteristic;
}

- (void)setSwRevisionCharacteristic:(id)a3
{
}

- (CBCharacteristic)fwRevisionCharacteristic
{
  return self->_fwRevisionCharacteristic;
}

- (void)setFwRevisionCharacteristic:(id)a3
{
}

- (CBCharacteristic)hwRevisionCharacteristic
{
  return self->_hwRevisionCharacteristic;
}

- (void)setHwRevisionCharacteristic:(id)a3
{
}

- (CBCharacteristic)serialNumberCharacteristic
{
  return self->_serialNumberCharacteristic;
}

- (void)setSerialNumberCharacteristic:(id)a3
{
}

- (CBCharacteristic)modelNumberCharacteristic
{
  return self->_modelNumberCharacteristic;
}

- (void)setModelNumberCharacteristic:(id)a3
{
}

- (CBCharacteristic)manufacturerNameCharacteristic
{
  return self->_manufacturerNameCharacteristic;
}

- (void)setManufacturerNameCharacteristic:(id)a3
{
}

- (CBCharacteristic)udiForMedicalDevicesCharacteristic
{
  return self->_udiForMedicalDevicesCharacteristic;
}

- (void)setUdiForMedicalDevicesCharacteristic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end