@interface PFCloudKitBaseMetric
- (NSDictionary)payload;
- (NSString)name;
- (PFCloudKitBaseMetric)initWithContainerIdentifier:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation PFCloudKitBaseMetric

- (PFCloudKitBaseMetric)initWithContainerIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFCloudKitBaseMetric;
  v4 = -[PFCloudKitBaseMetric init](&v6, sel_init);
  if (v4)
  {
    v4->_containerIdentifier = (NSString *)a3;
    v4->_processName = (NSString *)(id)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"),  "processName");
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitBaseMetric;
  -[PFCloudKitBaseMetric dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  uint64_t v2 = objc_msgSend( NSString,  "stringWithUTF8String:",  "Attempt to log metric with PFCloudKitBaseMetric, but each subclass must provide it's own name.");
  _NSCoreDataLog(17LL, v2, v3, v4, v5, v6, v7, v8, v11);
  v9 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl( &dword_186681000,  v9,  OS_LOG_TYPE_FAULT,  "CoreData: Attempt to log metric with PFCloudKitBaseMetric, but each subclass must provide it's own name.",  (uint8_t *)&v11,  2u);
  }

  return (NSString *)@"com.apple.coredata.cloudkit.base";
}

- (NSDictionary)payload
{
  v7[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"processName";
  processName = self->_processName;
  if (!processName) {
    processName = (NSString *)[MEMORY[0x189603FE8] null];
  }
  v6[1] = @"containerIdentifier";
  v7[0] = processName;
  containerIdentifier = self->_containerIdentifier;
  if (!containerIdentifier) {
    containerIdentifier = (NSString *)[MEMORY[0x189603FE8] null];
  }
  v7[1] = containerIdentifier;
  return (NSDictionary *)[MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:2];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitBaseMetric;
  return (id)[NSString stringWithFormat:@"%@ %@\n%@", -[PFCloudKitBaseMetric description](&v3, sel_description), -[PFCloudKitBaseMetric name](self, "name"), -[PFCloudKitBaseMetric payload](self, "payload")];
}

@end