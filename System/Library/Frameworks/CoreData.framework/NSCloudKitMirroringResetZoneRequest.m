@interface NSCloudKitMirroringResetZoneRequest
- (NSCloudKitMirroringResetZoneRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)setRecordZoneIDsToReset:(uint64_t)a1;
@end

@implementation NSCloudKitMirroringResetZoneRequest

- (NSCloudKitMirroringResetZoneRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringResetZoneRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v8, sel_initWithOptions_completionBlock_, a3, a4);
  if (v4)
  {
    id v5 = objc_alloc(getCloudKitCKRecordZoneIDClass());
    v6 = (void *)[v5 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName()];
    v4->_recordZoneIDsToReset = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v6, 0);
  }

  return v4;
}

- (void)dealloc
{
  self->_recordZoneIDsToReset = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringResetZoneRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (void)setRecordZoneIDsToReset:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    if (v4 != a2)
    {

      if (a2)
      {
        *(void *)(a1 + 80) = a2;
      }

      else
      {
        id v5 = objc_alloc(getCloudKitCKRecordZoneIDClass());
        id v6 = (id)[v5 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName()];
        *(void *)(a1 + 80) = objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v6, 0);
      }
    }
  }

@end