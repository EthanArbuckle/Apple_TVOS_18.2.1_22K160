@interface NSProgressSubscriberProxy
- (BOOL)isFromConnection:(id)a3;
- (NSFileAccessNode)itemLocation;
- (NSProgressSubscriberProxy)initWithForwarder:(id)a3 onConnection:(id)a4 subscriberID:(id)a5 appBundleID:(id)a6;
- (NSString)category;
- (NSString)description;
- (id)appBundleID;
- (id)descriptionWithIndenting:(id)a3;
- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6;
- (void)dealloc;
- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5;
- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5;
- (void)removePublisherForID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setItemLocation:(id)a3;
@end

@implementation NSProgressSubscriberProxy

- (NSProgressSubscriberProxy)initWithForwarder:(id)a3 onConnection:(id)a4 subscriberID:(id)a5 appBundleID:(id)a6
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSProgressSubscriberProxy;
  v10 = -[NSProgressSubscriberProxy init](&v12, sel_init);
  if (v10)
  {
    v10->_forwarder = (NSProgressSubscriber *)a3;
    v10->_subscriberID = (id)[a5 copy];
    v10->_bundleID = (NSString *)[a6 copy];
    v10->_connection = (NSXPCConnection *)a4;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProgressSubscriberProxy;
  -[NSProgressSubscriberProxy dealloc](&v3, sel_dealloc);
}

- (id)appBundleID
{
  return self->_bundleID;
}

- (void)setItemLocation:(id)a3
{
  itemLocation = self->_itemLocation;
  if (itemLocation != a3)
  {
    -[NSFileAccessNode removeProgressSubscriber:](itemLocation, "removeProgressSubscriber:", self);
    self->_itemLocation = (NSFileAccessNode *)a3;
    [a3 addProgressSubscriber:self];
  }

- (NSFileAccessNode)itemLocation
{
  return self->_itemLocation;
}

- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6
{
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
}

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
}

- (void)removePublisherForID:(id)a3
{
}

- (id)descriptionWithIndenting:(id)a3
{
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@<%@ %p> forwarder: %@, subscriber ID: %@\n%@location: %p",  a3,  objc_opt_class(),  self,  self->_forwarder,  self->_subscriberID,  [a3 stringByAppendingString:@"    "],  self->_itemLocation);
}

- (NSString)description
{
  return (NSString *)-[NSProgressSubscriberProxy descriptionWithIndenting:]( self,  "descriptionWithIndenting:",  &stru_189CA6A28);
}

- (BOOL)isFromConnection:(id)a3
{
  return self->_connection == a3;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCategory:(id)a3
{
}

@end