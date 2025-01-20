@interface NSPersistentCloudKitContainerActivityVoucher
+ (BOOL)supportsSecureCoding;
+ (id)describeConfiguration:(id)a3;
+ (id)describeConfigurationWithoutPointer:(id)a3;
+ (id)stringForQoS:(int64_t)a3;
- (CKOperationConfiguration)operationConfiguration;
- (NSFetchRequest)fetchRequest;
- (NSPersistentCloudKitContainerActivityVoucher)initWithCoder:(id)a3;
- (NSPersistentCloudKitContainerActivityVoucher)initWithLabel:(id)a3 forEventsOfType:(int64_t)a4 withConfiguration:(id)a5 affectingObjectsMatching:(id)a6;
- (NSString)bundleIdentifier;
- (NSString)label;
- (NSString)processName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eventType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPersistentCloudKitContainerActivityVoucher

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersistentCloudKitContainerActivityVoucher)initWithLabel:(id)a3 forEventsOfType:(int64_t)a4 withConfiguration:(id)a5 affectingObjectsMatching:(id)a6
{
  v43[1] = *MEMORY[0x1895F89C0];
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerActivityVoucher;
  v10 = -[NSPersistentCloudKitContainerActivityVoucher init](&v41, sel_init);
  if (!v10) {
    return v10;
  }
  if (!a4)
  {
    v12 = (void *)MEMORY[0x189603F70];
    uint64_t v13 = *MEMORY[0x189603A60];
    v14 = (void *)NSString;
    v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = [v14 stringWithFormat:@"%@ does not support the escalation of events of type %@. %@ events will be escalated in association with a voucher that is applied to %@ / %@ events as needed.", NSStringFromClass(v15), +[NSPersistentCloudKitContainerEvent eventTypeString:]( NSPersistentCloudKitContainerEvent, "eventTypeString:", 0), +[NSPersistentCloudKitContainerEvent eventTypeString:]( NSPersistentCloudKitContainerEvent, "eventTypeString:", 0), +[NSPersistentCloudKitContainerEvent eventTypeString:]( NSPersistentCloudKitContainerEvent, "eventTypeString:", 2), +[NSPersistentCloudKitContainerEvent eventTypeString:]( NSPersistentCloudKitContainerEvent, "eventTypeString:", 1)];
    v17 = v12;
    uint64_t v18 = v13;
LABEL_15:
    uint64_t v33 = 0LL;
    goto LABEL_16;
  }

  if (!a5)
  {
    v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    v21 = (void *)NSString;
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    getCloudKitCKOperationConfigurationClass();
    v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = [v21 stringWithFormat:@"%@ requires that clients pass in an instance of %@ that describes how they would like to prioritize work on behalf of the voucher.", v23, NSStringFromClass(v24)];
LABEL_14:
    uint64_t v16 = v25;
    v17 = v19;
    uint64_t v18 = v20;
    goto LABEL_15;
  }

  if (![a5 isLongLived])
  {
    if ([a5 allowsCellularAccess])
    {
      if ([a5 allowsExpensiveNetworkAccess])
      {
        v10->_eventType = a4;
        v10->_bundleIdentifier = (NSString *)(id)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"),  "bundleIdentifier");
        v10->_processName = (NSString *)(id)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"),  "processName");
        v10->_label = (NSString *)[a3 copy];
        v10->_fetchRequest = (NSFetchRequest *)[a6 copy];
        v10->_operationConfiguration = (CKOperationConfiguration *)[a5 copy];
        return v10;
      }

      v19 = (void *)MEMORY[0x189603F70];
      uint64_t v20 = *MEMORY[0x189603A60];
      v36 = (void *)NSString;
      v37 = (objc_class *)objc_opt_class();
      uint64_t v25 = [v36 stringWithFormat:@"%@ does not support network customizations yet (allowsExpensiveNetworkAccess = NO). If you require this functionality please file a radar to CoreData | New Bugs.", NSStringFromClass(v37), v40];
    }

    else
    {
      v19 = (void *)MEMORY[0x189603F70];
      uint64_t v20 = *MEMORY[0x189603A60];
      v34 = (void *)NSString;
      v35 = (objc_class *)objc_opt_class();
      uint64_t v25 = [v34 stringWithFormat:@"%@ does not support network customizations yet (allowsCellularAccess = NO). If you require this functionality please file a radar to CoreData | New Bugs.", NSStringFromClass(v35), v40];
    }

    goto LABEL_14;
  }

  v26 = (void *)MEMORY[0x189603F70];
  uint64_t v27 = *MEMORY[0x189603A60];
  v28 = (void *)NSString;
  v29 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v29);
  v31 = (objc_class *)objc_opt_class();
  uint64_t v32 = [v28 stringWithFormat:@"%@ does not allow clients to specify if operations are longlived or not. Clients should leave longLived unmodified and allow %@ to choose to mark operations long lived or not.", v30, NSStringFromClass(v31)];
  v42 = @"offendingConfiguration";
  v43[0] = a5;
  uint64_t v33 = [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:&v42 count:1];
  v17 = v26;
  uint64_t v18 = v27;
  uint64_t v16 = v32;
LABEL_16:
  objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v16 userInfo:v33]);
  -[NSPersistentCloudKitContainerActivityVoucher dealloc](v38, v39);
  return result;
}

- (void)dealloc
{
  self->_bundleIdentifier = 0LL;
  self->_fetchRequest = 0LL;

  self->_fetchRequest = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerActivityVoucher;
  -[NSPersistentCloudKitContainerActivityVoucher dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[NSPersistentCloudKitContainerActivityVoucher initWithLabel:forEventsOfType:withConfiguration:affectingObjectsMatching:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerActivityVoucher),  "initWithLabel:forEventsOfType:withConfiguration:affectingObjectsMatching:",  self->_label,  self->_eventType,  self->_operationConfiguration,  self->_fetchRequest);

  v4->_bundleIdentifier = self->_bundleIdentifier;
  return v4;
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@:%p %@>\n\t%@\n\t%@:%@\n\t%@\n\t%@", NSStringFromClass(v4), self, self->_label, +[NSPersistentCloudKitContainerEvent eventTypeString:]( NSPersistentCloudKitContainerEvent, "eventTypeString:", self->_eventType), self->_processName, self->_bundleIdentifier, +[NSPersistentCloudKitContainerActivityVoucher describeConfiguration:]( NSPersistentCloudKitContainerActivityVoucher, "describeConfiguration:", self->_operationConfiguration), self->_fetchRequest];
}

- (NSPersistentCloudKitContainerActivityVoucher)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerActivityVoucher;
  v4 = -[NSPersistentCloudKitContainerActivityVoucher init](&v6, sel_init);
  if (v4)
  {
    v4->_label = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    v4->_bundleIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    v4->_eventType = objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"eventTypeNum"),  "unsignedIntegerValue");
    v4->_fetchRequest = (NSFetchRequest *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"fetchRequest"];
    getCloudKitCKOperationConfigurationClass();
    v4->_operationConfiguration = (CKOperationConfiguration *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"operationConfiguration"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (id)describeConfiguration:(id)a3
{
  if (!a3) {
    return @"nil";
  }
  v4 = (void *)NSString;
  v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  id v7 = +[NSPersistentCloudKitContainerActivityVoucher stringForQoS:]( NSPersistentCloudKitContainerActivityVoucher,  "stringForQoS:",  [a3 qualityOfService]);
  else {
    v8 = @"wifi-only";
  }
  unsigned int v9 = [a3 isLongLived];
  [a3 timeoutIntervalForRequest];
  uint64_t v11 = v10;
  [a3 timeoutIntervalForResource];
  return (id)[v4 stringWithFormat:@"<%@:%p %@:%@:%d:%f:%f>", v6, a3, v7, v8, v9, v11, v12];
}

+ (id)describeConfigurationWithoutPointer:(id)a3
{
  if (!a3) {
    return @"nil";
  }
  v4 = (void *)NSString;
  id v5 = +[NSPersistentCloudKitContainerActivityVoucher stringForQoS:]( NSPersistentCloudKitContainerActivityVoucher,  "stringForQoS:",  [a3 qualityOfService]);
  else {
    objc_super v6 = @"wifi-only";
  }
  unsigned int v7 = [a3 isLongLived];
  [a3 timeoutIntervalForRequest];
  uint64_t v9 = v8;
  [a3 timeoutIntervalForResource];
  return (id)[v4 stringWithFormat:@"%@:%@:%d:%f:%f", v5, v6, v7, v9, v10];
}

+ (id)stringForQoS:(int64_t)a3
{
  if (a3 <= 16)
  {
    if (a3 == -1) {
      return @"Default";
    }
    if (a3 == 9) {
      return @"Background";
    }
  }

  else
  {
    switch(a3)
    {
      case 17LL:
        return @"Utility";
      case 33LL:
        return @"UserInteractive";
      case 25LL:
        return @"UserInitiated";
    }
  }

  v14[4] = v3;
  v14[5] = v4;
  uint64_t v6 = [NSString stringWithUTF8String:"Did someone add a new QoS class? This method should probably be updated."];
  _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, v14[0]);
  uint64_t v13 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Did someone add a new QoS class? This method should probably be updated.",  (uint8_t *)v14,  2u);
  }

  return @"unknown";
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (CKOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

@end