@interface DMDiphoneOSDeviceController
- (id)bluetoothAddress;
- (id)buildVersion;
- (id)deviceName;
- (id)deviceType;
- (id)iTunesStoreAccountHash;
- (id)iTunesStoreAccountIsActive;
- (id)isAppleInternal;
- (id)isAwaitingConfiguration;
- (id)isInSingleAppMode;
- (id)isSupervised;
- (id)lastCloudBackupDate;
- (id)marketingName;
- (id)model;
- (id)modelName;
- (id)osVersion;
- (id)productName;
- (id)serialNumber;
- (id)uniqueIdentifier;
- (id)wifiAddress;
@end

@implementation DMDiphoneOSDeviceController

- (id)bluetoothAddress
{
  return +[DMDMobileGestalt bluetoothAddress](&OBJC_CLASS___DMDMobileGestalt, "bluetoothAddress");
}

- (id)buildVersion
{
  return +[DMDMobileGestalt buildVersion](&OBJC_CLASS___DMDMobileGestalt, "buildVersion");
}

- (id)deviceName
{
  return +[DMDMobileGestalt userAssignedDeviceName](&OBJC_CLASS___DMDMobileGestalt, "userAssignedDeviceName");
}

- (id)deviceType
{
  return +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  +[DMDMobileGestalt deviceType](&OBJC_CLASS___DMDMobileGestalt, "deviceType"));
}

- (id)isAppleInternal
{
  return +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[DMDMobileGestalt hasAppleInternalInstallCapability]( &OBJC_CLASS___DMDMobileGestalt,  "hasAppleInternalInstallCapability"));
}

- (id)isAwaitingConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](&OBJC_CLASS___MCCloudConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v2 isAwaitingConfiguration]));

  return v3;
}

- (id)isInSingleAppMode
{
  return +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  MCIsEffectivelyInAppWhitelistMode(self, a2));
}

- (id)iTunesStoreAccountHash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DMDMDMUtilities iTunesAccountHashForUniqueIdentifier:]( &OBJC_CLASS___DMDMDMUtilities,  "iTunesAccountHashForUniqueIdentifier:",  v4));

  return v5;
}

- (id)iTunesStoreAccountIsActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);
  if (v3) {
    v4 = &__kCFBooleanTrue;
  }
  else {
    v4 = &__kCFBooleanFalse;
  }
  id v5 = v4;

  return v5;
}

- (id)marketingName
{
  return +[DMDMobileGestalt marketingName](&OBJC_CLASS___DMDMobileGestalt, "marketingName");
}

- (id)model
{
  return +[DMDMobileGestalt modelNumber](&OBJC_CLASS___DMDMobileGestalt, "modelNumber");
}

- (id)modelName
{
  return +[DMDMobileGestalt deviceClass](&OBJC_CLASS___DMDMobileGestalt, "deviceClass");
}

- (id)osVersion
{
  return +[DMDMobileGestalt productVersion](&OBJC_CLASS___DMDMobileGestalt, "productVersion");
}

- (id)productName
{
  return +[DMDMobileGestalt productType](&OBJC_CLASS___DMDMobileGestalt, "productType");
}

- (id)serialNumber
{
  return +[DMDMobileGestalt serialNumber](&OBJC_CLASS___DMDMobileGestalt, "serialNumber");
}

- (id)wifiAddress
{
  return +[DMDMobileGestalt wifiAddress](&OBJC_CLASS___DMDMobileGestalt, "wifiAddress");
}

- (id)isSupervised
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCCloudConfiguration sharedConfiguration](&OBJC_CLASS___MCCloudConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v2 isSupervised]));

  return v3;
}

- (id)lastCloudBackupDate
{
  return +[DMDLockdownUtilities deviceLastCloudBackupDate]( &OBJC_CLASS___DMDLockdownUtilities,  "deviceLastCloudBackupDate");
}

- (id)uniqueIdentifier
{
  return +[DMDMobileGestalt uniqueDeviceID](&OBJC_CLASS___DMDMobileGestalt, "uniqueDeviceID");
}

@end