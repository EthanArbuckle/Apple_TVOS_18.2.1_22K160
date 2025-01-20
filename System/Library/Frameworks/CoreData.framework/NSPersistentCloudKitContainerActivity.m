@interface NSPersistentCloudKitContainerActivity
- (id)_initWithIdentifier:(id)a3 forStore:(id)a4 activityType:(unint64_t)a5;
- (id)createDictionaryRepresentation;
- (void)dealloc;
- (void)finishWithError:(id)a3;
@end

@implementation NSPersistentCloudKitContainerActivity

- (id)_initWithIdentifier:(id)a3 forStore:(id)a4 activityType:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerActivity;
  v8 = -[NSPersistentCloudKitContainerActivity init](&v11, sel_init);
  if (v8)
  {
    v8->_identifier = (NSUUID *)a3;
    v8->_storeIdentifier = (NSString *)a4;
    v9 = (NSDate *)objc_alloc_init(MEMORY[0x189603F50]);
    v8->_activityType = a5;
    v8->_startDate = v9;
  }

  return v8;
}

- (void)dealloc
{
  self->_error = 0LL;
  self->_parentActivityIdentifier = 0LL;

  self->_endDate = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerActivity;
  -[NSPersistentCloudKitContainerActivity dealloc](&v3, sel_dealloc);
}

- (id)createDictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:self->_identifier forKey:@"identifier"];
  [v3 setObject:self->_storeIdentifier forKey:@"storeIdentifier"];
  parentActivityIdentifier = self->_parentActivityIdentifier;
  if (parentActivityIdentifier) {
    [v3 setObject:parentActivityIdentifier forKey:@"parentActivityIdentifier"];
  }
  unint64_t activityType = self->_activityType;
  objc_opt_self();
  if (activityType >= 5)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"I don't know how to create a string for activity type '%lu'"];
    _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, activityType);
    v14 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v20 = activityType;
      _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: I don't know how to create a string for activity type '%lu'",  buf,  0xCu);
    }

    v6 = &stru_189EAC2E8;
  }

  else
  {
    v6 = off_189EAB9C8[activityType];
  }

  [v3 setObject:v6 forKey:@"activityType"];
  [v3 setObject:self->_startDate forKey:@"startDate"];
  endDate = self->_endDate;
  if (endDate) {
    [v3 setObject:endDate forKey:@"endDate"];
  }
  error = self->_error;
  if (error) {
    [v3 setObject:error forKey:@"error"];
  }
  if (self->_endDate) {
    BOOL v17 = self->_error == 0LL;
  }
  else {
    BOOL v17 = 0LL;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x189607968], "numberWithBool:", v17), @"succeeded");
  objc_msgSend( v3,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", self->_endDate != 0),  @"finished");
  return v3;
}

- (void)finishWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (self->_endDate)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"Illegal attempt to finish an activity multiple times: %@"];
    _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, (uint64_t)self);
    uint64_t v11 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to finish an activity multiple times: %@",  buf,  0xCu);
    }
  }

  else
  {
    self->_endDate = (NSDate *)objc_alloc_init(MEMORY[0x189603F50]);
    self->_error = (NSError *)a3;
  }

@end