@interface NSPersistentCloudKitContainerEventActivity
- (id)beginActivityForPhase:(unint64_t)a3;
- (id)createDictionaryRepresentation;
- (id)endActivityForPhase:(unint64_t)a3 withError:(id)a4;
- (void)dealloc;
- (void)initWithRequestIdentifier:(void *)a1 storeIdentifier:(uint64_t)a2 eventType:(uint64_t)a3;
@end

@implementation NSPersistentCloudKitContainerEventActivity

- (void)initWithRequestIdentifier:(void *)a1 storeIdentifier:(uint64_t)a2 eventType:(uint64_t)a3
{
  if (!a1) {
    return 0LL;
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerEventActivity;
  v3 = objc_msgSendSuper2(&v5, sel__initWithIdentifier_forStore_activityType_, a2, a3, 0);
  if (v3) {
    v3[8] = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerEventActivity;
  -[NSPersistentCloudKitContainerActivity dealloc](&v3, sel_dealloc);
}

- (id)beginActivityForPhase:(unint64_t)a3
{
  objc_super v5 = objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerSetupPhaseActivity);
  if (self)
  {
    v6 = -[NSPersistentCloudKitContainerSetupPhaseActivity initWithPhase:storeIdentifier:]( v5,  "initWithPhase:storeIdentifier:",  a3,  self->super._storeIdentifier);
    identifier = self->super._identifier;
    if (!v6) {
      goto LABEL_5;
    }
  }

  else
  {
    v6 = -[NSPersistentCloudKitContainerSetupPhaseActivity initWithPhase:storeIdentifier:]( v5,  "initWithPhase:storeIdentifier:",  a3,  0LL);
    identifier = 0LL;
    if (!v6) {
      goto LABEL_5;
    }
  }

  parentActivityIdentifier = v6->super._parentActivityIdentifier;
  if (parentActivityIdentifier != identifier)
  {

    v6->super._parentActivityIdentifier = identifier;
  }

- (id)endActivityForPhase:(unint64_t)a3 withError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = (id)-[NSMutableDictionary objectForKey:]( self->_activitiesByPhaseNum,  "objectForKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:"));
  if (!v6)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"No activity was found for phase '%@', this is a critical bug in activity tracking for %@. Please file a radar."];
    v8 = +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]( (uint64_t)&OBJC_CLASS___NSPersistentCloudKitContainerSetupPhaseActivity,  a3);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    _NSCoreDataLog(17LL, v7, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    v16 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v18 = +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]( (uint64_t)&OBJC_CLASS___NSPersistentCloudKitContainerSetupPhaseActivity,  a3);
      v19 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = NSStringFromClass(v19);
      _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: No activity was found for phase '%@', this is a critical bug in activity tracking for %@. Please file a radar.",  buf,  0x16u);
    }
  }

  [v6 finishWithError:a4];
  return v6;
}

- (id)createDictionaryRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSPersistentCloudKitContainerEventActivity;
  id v3 = -[NSPersistentCloudKitContainerActivity createDictionaryRepresentation](&v5, sel_createDictionaryRepresentation);
  objc_msgSend( v3,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", self->_eventType),  @"eventType");
  return v3;
}

@end