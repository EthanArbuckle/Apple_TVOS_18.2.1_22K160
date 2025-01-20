@interface IDSEncryptionQueueManager
- (IDSEncryptionQueue)defaultQueue;
- (IDSEncryptionQueue)syncQueue;
- (IDSEncryptionQueue)urgentQueue;
- (IDSEncryptionQueueManager)init;
- (id)_queueForPriority:(int64_t)a3;
- (id)asyncQueueForPriority:(int64_t)a3;
- (id)syncQueueForPriority:(int64_t)a3;
- (void)setDefaultQueue:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setUrgentQueue:(id)a3;
@end

@implementation IDSEncryptionQueueManager

- (IDSEncryptionQueueManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSEncryptionQueueManager;
  v2 = -[IDSEncryptionQueueManager init](&v10, "init");
  if (v2)
  {
    v3 = -[IDSEncryptionQueue initWithName:qosClass:specific:]( objc_alloc(&OBJC_CLASS___IDSEncryptionQueue),  "initWithName:qosClass:specific:",  "_IDSEncryptionQueueSync",  17LL,  "_MessageEncryptionContextSync");
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = v3;

    v5 = -[IDSEncryptionQueue initWithName:qosClass:specific:]( objc_alloc(&OBJC_CLASS___IDSEncryptionQueue),  "initWithName:qosClass:specific:",  "_IDSEncryptionQueueDefault",  21LL,  "_MessageEncryptionContextDefault");
    defaultQueue = v2->_defaultQueue;
    v2->_defaultQueue = v5;

    v7 = -[IDSEncryptionQueue initWithName:qosClass:specific:]( objc_alloc(&OBJC_CLASS___IDSEncryptionQueue),  "initWithName:qosClass:specific:",  "_IDSEncryptionQueueUrgent",  25LL,  "_MessageEncryptionContextUrgent");
    urgentQueue = v2->_urgentQueue;
    v2->_urgentQueue = v7;
  }

  return v2;
}

- (id)asyncQueueForPriority:(int64_t)a3
{
  return -[IDSEncryptionQueueManager _queueForPriority:](self, "_queueForPriority:", a3);
}

- (id)syncQueueForPriority:(int64_t)a3
{
  return -[IDSEncryptionQueueManager _queueForPriority:](self, "_queueForPriority:", a3);
}

- (id)_queueForPriority:(int64_t)a3
{
  uint64_t v3 = 2LL;
  if (a3 == 100) {
    uint64_t v3 = 1LL;
  }
  if (a3 == 300) {
    uint64_t v3 = 3LL;
  }
  return (&self->super.isa)[v3];
}

- (IDSEncryptionQueue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (IDSEncryptionQueue)defaultQueue
{
  return self->_defaultQueue;
}

- (void)setDefaultQueue:(id)a3
{
}

- (IDSEncryptionQueue)urgentQueue
{
  return self->_urgentQueue;
}

- (void)setUrgentQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end