@interface OTDeviceInformation
+ (BOOL)isFullPeer:(id)a3;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)deviceName;
- (NSString)machineID;
- (NSString)modelID;
- (NSString)osVersion;
- (NSString)serialNumber;
- (id)initForContainerName:(id)a3 contextID:(id)a4 epoch:(unint64_t)a5 machineID:(id)a6 modelID:(id)a7 deviceName:(id)a8 serialNumber:(id)a9 osVersion:(id)a10;
- (unint64_t)epoch;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setMachineID:(id)a3;
- (void)setModelID:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation OTDeviceInformation

- (id)initForContainerName:(id)a3 contextID:(id)a4 epoch:(unint64_t)a5 machineID:(id)a6 modelID:(id)a7 deviceName:(id)a8 serialNumber:(id)a9 osVersion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___OTDeviceInformation;
  v23 = -[OTDeviceInformation init](&v26, "init");
  v24 = v23;
  if (v23)
  {
    -[OTDeviceInformation setContainerName:](v23, "setContainerName:", v16);
    -[OTDeviceInformation setContextID:](v24, "setContextID:", v17);
    -[OTDeviceInformation setEpoch:](v24, "setEpoch:", a5);
    -[OTDeviceInformation setMachineID:](v24, "setMachineID:", v18);
    -[OTDeviceInformation setModelID:](v24, "setModelID:", v19);
    -[OTDeviceInformation setDeviceName:](v24, "setDeviceName:", v20);
    -[OTDeviceInformation setSerialNumber:](v24, "setSerialNumber:", v21);
    -[OTDeviceInformation setOsVersion:](v24, "setOsVersion:", v22);
  }

  return v24;
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setContextID:(id)a3
{
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setMachineID:(id)a3
{
}

- (NSString)modelID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setModelID:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)isFullPeer:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [&off_1002AE760 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&off_1002AE760);
        }
        if ([v3 containsString:*(void *)(*((void *)&v10 + 1) + 8 * (void)i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }

      id v5 = [&off_1002AE760 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v8 = 0;
LABEL_11:

  return v8;
}

@end