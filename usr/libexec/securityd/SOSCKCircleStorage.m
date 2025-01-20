@interface SOSCKCircleStorage
- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4;
- (BOOL)flushChanges:(__CFError *)a3;
- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5;
- (SOSCKCircleStorage)init;
- (SOSCKCircleStorage)initWithAccount:(id)a3;
- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4;
- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4;
- (int64_t)getTransportType;
@end

@implementation SOSCKCircleStorage

- (SOSCKCircleStorage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SOSCKCircleStorage;
  v2 = -[SOSCircleStorageTransport init](&v5, "init");
  v3 = v2;
  if (v2) {
    sub_1001B4F9C(v2);
  }
  return v3;
}

- (SOSCKCircleStorage)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SOSCKCircleStorage;
  objc_super v5 = -[SOSCircleStorageTransport init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[SOSCircleStorageTransport setAccount:](v5, "setAccount:", v4);
  }

  return v6;
}

- (int64_t)getTransportType
{
  return 6LL;
}

- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 1;
}

- (BOOL)flushChanges:(__CFError *)a3
{
  return 1;
}

- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5
{
  return 1;
}

- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 0LL;
}

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  return 0LL;
}

@end