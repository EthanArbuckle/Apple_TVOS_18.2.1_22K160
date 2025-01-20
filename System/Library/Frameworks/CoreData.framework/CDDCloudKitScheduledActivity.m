@interface CDDCloudKitScheduledActivity
+ (NSString)entityName;
- (id)xpcActivityCriteria;
- (unint64_t)activityType;
- (void)populateFromCriteria:(id)a3;
- (void)setActivityType:(unint64_t)a3;
@end

@implementation CDDCloudKitScheduledActivity

+ (NSString)entityName
{
  return (NSString *)@"CDDCloudKitScheduledActivity";
}

- (unint64_t)activityType
{
  return objc_msgSend( (id)-[CDDCloudKitScheduledActivity activityTypeNum](self, "activityTypeNum"),  "unsignedIntegerValue");
}

- (void)setActivityType:(unint64_t)a3
{
}

- (void)populateFromCriteria:(id)a3
{
  v4 = (void *)objc_msgSend( a3,  "objectForKey:",  objc_msgSend(NSString, "stringWithUTF8String:", *MEMORY[0x1895F8700]));
  if (v4 && (v5 = v4, xpc_BOOL_get_value(v4)))
  {
    if (!xpc_BOOL_get_value(v5)) {
      return;
    }
    uint64_t v6 = MEMORY[0x189604A88];
  }

  else
  {
    uint64_t v6 = MEMORY[0x189604A80];
  }

  -[CDDCloudKitScheduledActivity setIsUserRequestedBackupTask:](self, "setIsUserRequestedBackupTask:", v6);
}

- (id)xpcActivityCriteria
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  LODWORD(self) = objc_msgSend( (id)-[CDDCloudKitScheduledActivity isUserRequestedBackupTask](self, "isUserRequestedBackupTask"),  "BOOLValue");
  uint64_t v4 = [NSString stringWithUTF8String:*MEMORY[0x1895F8700]];
  if ((_DWORD)self) {
    uint64_t v5 = MEMORY[0x1895F9178];
  }
  else {
    uint64_t v5 = MEMORY[0x1895F9170];
  }
  [v3 setObject:v5 forKey:v4];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

@end