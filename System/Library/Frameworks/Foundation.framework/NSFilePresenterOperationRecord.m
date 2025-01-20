@interface NSFilePresenterOperationRecord
+ (id)operationRecordWithDescription:(id)a3 reactor:(id)a4;
- (NSString)operationDescription;
- (id)_reactorQueue;
- (id)description;
- (id)reactor;
- (int64_t)state;
- (void)dealloc;
- (void)didBegin;
- (void)didEnd;
- (void)willEnd;
@end

@implementation NSFilePresenterOperationRecord

+ (id)operationRecordWithDescription:(id)a3 reactor:(id)a4
{
  id v6 = objc_alloc_init((Class)objc_opt_class());
  *((void *)v6 + 1) = [a3 copy];
  objc_storeWeak((id *)v6 + 3, a4);
  *((void *)v6 + 4) = objc_msgSend( +[NSFileAccessArbiterProxy _idForReactor:]( NSFileAccessArbiterProxy,  "_idForReactor:",  a4),  "copy");
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFilePresenterOperationRecord;
  -[NSFilePresenterOperationRecord dealloc](&v3, sel_dealloc);
}

- (void)didBegin
{
  self->state = 1LL;
}

- (void)willEnd
{
  self->state = 2LL;
}

- (void)didEnd
{
  v2[5] = *MEMORY[0x1895F89C0];
  self->state = 3LL;
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __40__NSFilePresenterOperationRecord_didEnd__block_invoke;
  v2[3] = &unk_189CA48E8;
  v2[4] = self;
  +[NSFileAccessArbiterProxy _accessPresenterOperationRecordsUsingBlock:]( &OBJC_CLASS___NSFileAccessArbiterProxy,  "_accessPresenterOperationRecordsUsingBlock:",  v2);
}

uint64_t __40__NSFilePresenterOperationRecord_didEnd__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (id)_reactorQueue
{
  char v3 = objc_opt_respondsToSelector();
  id v4 = -[NSFilePresenterOperationRecord reactor](self, "reactor");
  if ((v3 & 1) != 0) {
    return (id)[v4 presentedItemOperationQueue];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (id)objc_msgSend(-[NSFilePresenterOperationRecord reactor](self, "reactor"), "_providedItemsOperationQueue");
  }
  return 0LL;
}

- (id)description
{
  unint64_t v3 = -[NSFilePresenterOperationRecord state](self, "state");
  if (v3 > 3) {
    id v4 = 0LL;
  }
  else {
    id v4 = off_189CA4D80[v3];
  }
  id v5 = -[NSFilePresenterOperationRecord reactor](self, "reactor");
  reactorID = self->reactorID;
  v7 = -[NSFilePresenterOperationRecord operationDescription](self, "operationDescription");
  if (!v5) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Reactor with ID %@ deallocated in state: %@ %@",  reactorID,  v4,  v7);
  }
  v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Reactor %@ with ID %@ %@ %@",  v5,  reactorID,  v4,  v7);
  id v9 = -[NSFilePresenterOperationRecord _reactorQueue](self, "_reactorQueue");
  else {
    return v8;
  }
}

- (NSString)operationDescription
{
  return self->operationDescription;
}

- (int64_t)state
{
  return self->state;
}

- (id)reactor
{
  return objc_loadWeak(&self->reactor);
}

- (void).cxx_destruct
{
}

@end