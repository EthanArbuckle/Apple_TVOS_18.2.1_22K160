@interface SFDevice
- (NSUUID)deviceIdentifier;
- (char)channel;
- (int)rssi;
@end

@implementation SFDevice

- (NSUUID)deviceIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self, "bleDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 advertisementFields]);

  int Int64Ranged = CFDictionaryGetInt64Ranged(v4, @"hsStatus", 0LL, 0xFFFFFFFFLL, 0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SFDevice model](self, "model"));
  if (([v6 isEqual:@"AirPods1,1"] & 1) != 0
    || ([v6 isEqual:@"AirPods1,3"] & 1) != 0
    || [v6 isEqual:@"AirPodsPro1,1"])
  {

LABEL_5:
    v7 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](self, "identifier"));
    goto LABEL_6;
  }

  id v9 = [[SFHeadphoneProduct alloc] initWithBluetoothModel:v6];
  unsigned __int8 v10 = [v9 isAirPods];

  if ((v10 & 1) != 0 || !Int64Ranged) {
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice identifier](self, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

  v13 = (char *)[v12 length] - 4;
  if ((Int64Ranged & 0x80) != 0) {
    v14 = @"1EF7";
  }
  else {
    v14 = @"0010";
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", v13, 4, v14));
  v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v15);

LABEL_6:
  return v7;
}

- (int)rssi
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self, "bleDevice"));
  int v3 = [v2 rssi];

  return v3;
}

- (char)channel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice bleDevice](self, "bleDevice"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 advertisementFields]);
  char Int64Ranged = CFDictionaryGetInt64Ranged(v3, @"ch", 0LL, 255LL, 0LL);

  return Int64Ranged;
}

@end