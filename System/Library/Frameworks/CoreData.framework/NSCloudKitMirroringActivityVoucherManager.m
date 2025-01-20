@interface NSCloudKitMirroringActivityVoucherManager
- (BOOL)hasVoucherMatching:(id)a3;
- (NSCloudKitMirroringActivityVoucherManager)init;
- (id)_vouchersForEventType:(uint64_t)a1;
- (id)usableVoucherForEventType:(int64_t)a3;
- (unint64_t)countVouchers;
- (void)addVoucher:(id)a3;
- (void)dealloc;
- (void)expireVoucher:(id)a3;
- (void)expireVouchersForEventType:(int64_t)a3;
@end

@implementation NSCloudKitMirroringActivityVoucherManager

- (NSCloudKitMirroringActivityVoucherManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringActivityVoucherManager;
  v2 = -[NSCloudKitMirroringActivityVoucherManager init](&v4, sel_init);
  if (v2) {
    v2->_vouchersByEventType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  return v2;
}

- (void)dealloc
{
  self->_vouchersByEventType = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringActivityVoucherManager;
  -[NSCloudKitMirroringActivityVoucherManager dealloc](&v3, sel_dealloc);
}

- (unint64_t)countVouchers
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  vouchersByEventType = self->_vouchersByEventType;
  uint64_t v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( vouchersByEventType,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0LL;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(vouchersByEventType);
      }
      v6 += objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_vouchersByEventType,  "objectForKey:",  *(void *)(*((void *)&v10 + 1) + 8 * i)),  "count");
    }

    uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( vouchersByEventType,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  }

  while (v5);
  return v6;
}

- (BOOL)hasVoucherMatching:(id)a3
{
  return 0;
}

- (void)addVoucher:(id)a3
{
  id v4 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, [a3 eventType]);
  [v4 addObject:a3];
}

- (id)_vouchersForEventType:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  id v4 = (id)objc_msgSend( *(id *)(a1 + 8),  "objectForKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", a2));
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v4, objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", a2));
  }

  return v4;
}

- (void)expireVoucher:(id)a3
{
  id v4 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, [a3 eventType]);
  [v4 removeObject:a3];
}

- (void)expireVouchersForEventType:(int64_t)a3
{
  id v3 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, a3);
  [v3 removeAllObjects];
}

- (id)usableVoucherForEventType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ((unint64_t)(a3 - 1) < 2) {
    return (id)objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_vouchersByEventType,  "objectForKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", a3)),  "lastObject");
  }
  if (a3)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Is there a new event type: %@"];
    id v7 = +[NSPersistentCloudKitContainerEvent eventTypeString:]( &OBJC_CLASS___NSPersistentCloudKitContainerEvent,  "eventTypeString:",  a3);
    _NSCoreDataLog(17LL, v6, v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    v14 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = +[NSPersistentCloudKitContainerEvent eventTypeString:]( &OBJC_CLASS___NSPersistentCloudKitContainerEvent,  "eventTypeString:",  a3);
      _os_log_fault_impl(&dword_186681000, v14, OS_LOG_TYPE_FAULT, "CoreData: Is there a new event type: %@", buf, 0xCu);
    }

    return 0LL;
  }

  else
  {
    id result = (id)objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_vouchersByEventType,  "objectForKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", 0)),  "lastObject");
    if (!result)
    {
      id result = -[NSCloudKitMirroringActivityVoucherManager usableVoucherForEventType:]( self,  "usableVoucherForEventType:",  2LL);
      if (!result) {
        return -[NSCloudKitMirroringActivityVoucherManager usableVoucherForEventType:]( self,  "usableVoucherForEventType:",  1LL);
      }
    }
  }

  return result;
}

@end