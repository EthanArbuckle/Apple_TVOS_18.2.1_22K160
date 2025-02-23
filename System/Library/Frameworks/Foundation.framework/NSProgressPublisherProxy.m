@interface NSProgressPublisherProxy
- (BOOL)isFromConnection:(id)a3;
- (NSFileAccessNode)itemLocation;
- (NSProgressPublisherProxy)initWithForwarder:(id)a3 onConnection:(id)a4 publisherID:(id)a5 values:(id)a6;
- (NSProgressValues)values;
- (NSString)category;
- (NSString)description;
- (id)descriptionWithIndenting:(id)a3;
- (id)publisherID;
- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4;
- (void)cancel;
- (void)dealloc;
- (void)observeUserInfoValue:(id)a3 forKey:(id)a4;
- (void)observeValues:(id)a3 forKeys:(id)a4;
- (void)pause;
- (void)prioritize;
- (void)resume;
- (void)setCategory:(id)a3;
- (void)setItemLocation:(id)a3;
@end

@implementation NSProgressPublisherProxy

- (NSProgressPublisherProxy)initWithForwarder:(id)a3 onConnection:(id)a4 publisherID:(id)a5 values:(id)a6
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSProgressPublisherProxy;
  v10 = -[NSProgressPublisherProxy init](&v12, sel_init);
  if (v10)
  {
    v10->_forwarder = (NSProgressPublisher *)a3;
    v10->_publisherID = a5;
    v10->_connection = (NSXPCConnection *)a4;
    v10->_values = (NSProgressValues *)[a6 copy];
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProgressPublisherProxy;
  -[NSProgressPublisherProxy dealloc](&v3, sel_dealloc);
}

- (id)publisherID
{
  return self->_publisherID;
}

- (void)setItemLocation:(id)a3
{
  v6[5] = *MEMORY[0x1895F89C0];
  itemLocation = self->_itemLocation;
  if (itemLocation != a3)
  {
    if (!a3)
    {
      v6[0] = MEMORY[0x1895F87A8];
      v6[1] = 3221225472LL;
      v6[2] = __44__NSProgressPublisherProxy_setItemLocation___block_invoke;
      v6[3] = &unk_189C99178;
      v6[4] = self;
      -[NSFileAccessNode forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:]( itemLocation,  "forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:",  v6);
      itemLocation = self->_itemLocation;
    }

    -[NSFileAccessNode removeProgressPublisher:](itemLocation, "removeProgressPublisher:", self);
    self->_itemLocation = (NSFileAccessNode *)a3;
    [a3 addProgressPublisher:self];
  }

uint64_t __44__NSProgressPublisherProxy_setItemLocation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removePublisherForID:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (BOOL)isFromConnection:(id)a3
{
  return self->_connection == a3;
}

- (NSFileAccessNode)itemLocation
{
  return self->_itemLocation;
}

- (void)cancel
{
}

- (void)pause
{
}

- (void)resume
{
}

- (void)prioritize
{
}

- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4
{
}

- (id)descriptionWithIndenting:(id)a3
{
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@<%@ %p> forwarder: %@, publisher ID: %@\n%@location: %p",  a3,  objc_opt_class(),  self,  self->_forwarder,  self->_publisherID,  [a3 stringByAppendingString:@"    "],  self->_itemLocation);
}

- (NSString)description
{
  return (NSString *)-[NSProgressPublisherProxy descriptionWithIndenting:]( self,  "descriptionWithIndenting:",  &stru_189CA6A28);
}

- (void)observeUserInfoValue:(id)a3 forKey:(id)a4
{
  userInfo = self->_values->_userInfo;
  if (!userInfo)
  {
    self->_values->_userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    userInfo = self->_values->_userInfo;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](userInfo, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)observeValues:(id)a3 forKeys:(id)a4
{
  uint64_t v7 = [a3 count];
  uint64_t v8 = [a4 count];
  if (v7 && v7 == v8)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
      -[NSProgressValues setValue:forKey:]( self->_values,  "setValue:forKey:",  [a3 objectAtIndexedSubscript:i],  objc_msgSend(a4, "objectAtIndexedSubscript:", i));
  }

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCategory:(id)a3
{
}

- (NSProgressValues)values
{
  return (NSProgressValues *)objc_getProperty(self, a2, 48LL, 1);
}

@end