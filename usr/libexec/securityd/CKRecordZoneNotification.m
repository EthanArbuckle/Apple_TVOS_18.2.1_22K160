@interface CKRecordZoneNotification
- (BOOL)ckksPushTracingEnabled;
- (NSDate)ckksPushReceivedDate;
- (NSString)ckksPushTracingUUID;
- (void)setCkksPushReceivedDate:(id)a3;
- (void)setCkksPushTracingEnabled:(BOOL)a3;
- (void)setCkksPushTracingUUID:(id)a3;
@end

@implementation CKRecordZoneNotification

- (void)setCkksPushTracingEnabled:(BOOL)a3
{
  if (a3) {
    v3 = &__kCFBooleanTrue;
  }
  else {
    v3 = &__kCFBooleanFalse;
  }
  objc_setAssociatedObject(self, "ckksPushTracingEnabled", v3, (void *)0x301);
}

- (BOOL)ckksPushTracingEnabled
{
  id AssociatedObject = objc_getAssociatedObject(self, "ckksPushTracingEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setCkksPushTracingUUID:(id)a3
{
}

- (NSString)ckksPushTracingUUID
{
  return (NSString *)objc_getAssociatedObject(self, "ckksPushTracingUUID");
}

- (void)setCkksPushReceivedDate:(id)a3
{
}

- (NSDate)ckksPushReceivedDate
{
  return (NSDate *)objc_getAssociatedObject(self, "ckksPushReceivedDate");
}

@end