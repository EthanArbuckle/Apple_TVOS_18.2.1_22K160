@interface PCSDevice
- (BOOL)_onQueue_isReachable;
- (BOOL)isActivePairedDevice;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (BOOL)isTombstone;
- (BOOL)supportsNewProtocol;
- (BOOL)supportsPCSKeySync;
- (BOOL)syncingIsRestricted;
- (NSHashTable)observers;
- (NSString)UUID;
- (NSString)buildVersion;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)osVersion;
- (NSString)serialNumber;
- (NSString)watchSize;
- (NSUUID)pairingID;
- (OS_dispatch_queue)internalQueue;
- (PCSDevice)init;
- (unint64_t)hash;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setIsActivePairedDevice:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsTombstone:(BOOL)a3;
- (void)setSyncingIsRestricted:(BOOL)a3;
@end

@implementation PCSDevice

- (PCSDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PCSDevice;
  v2 = -[PCSDevice init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ProtectedCloudStorage.device_internal_queue", 0LL);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSDevice internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005F84;
  block[3] = &unk_100024998;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSDevice internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000605C;
  block[3] = &unk_100024998;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (NSUUID)pairingID
{
  return 0LL;
}

- (BOOL)supportsPCSKeySync
{
  return 0;
}

- (BOOL)supportsNewProtocol
{
  return 0;
}

- (BOOL)_onQueue_isReachable
{
  BOOL v3 = -[PCSDevice isConnected](self, "isConnected");
  if (v3) {
    LOBYTE(v3) = -[PCSDevice isActivePairedDevice](self, "isActivePairedDevice");
  }
  return v3;
}

- (BOOL)isReachable
{
  v2 = self;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSDevice internalQueue](self, "internalQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000061A4;
  v5[3] = &unk_100024A10;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSString)model
{
  if ([0 length]) {
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  0LL,  &stru_100025318));
  }
  else {
    v2 = @"N/A";
  }
  return (NSString *)v2;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCSDevice idsDeviceIdentifier](self, "idsDeviceIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PCSDevice *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSDevice idsDeviceIdentifier](v4, "idsDeviceIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSDevice idsDeviceIdentifier](self, "idsDeviceIdentifier"));
      unsigned __int8 v8 = [v6 isEqualToString:v7];
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (NSString)idsDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)isActivePairedDevice
{
  return self->_isActivePairedDevice;
}

- (void)setIsActivePairedDevice:(BOOL)a3
{
  self->_isActivePairedDevice = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isTombstone
{
  return self->_isTombstone;
}

- (void)setIsTombstone:(BOOL)a3
{
  self->_isTombstone = a3;
}

- (NSString)watchSize
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (BOOL)syncingIsRestricted
{
  return self->_syncingIsRestricted;
}

- (void)setSyncingIsRestricted:(BOOL)a3
{
  self->_syncingIsRestricted = a3;
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 64LL, 1);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void).cxx_destruct
{
}

@end