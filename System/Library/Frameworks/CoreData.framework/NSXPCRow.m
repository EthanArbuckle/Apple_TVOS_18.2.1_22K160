@interface NSXPCRow
- (NSXPCRow)initWithNode:(id)a3;
- (id)objectID;
- (void)dealloc;
@end

@implementation NSXPCRow

- (NSXPCRow)initWithNode:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSXPCRow;
  v4 = -[NSPersistentCacheRow initWithOptions:andTimestamp:](&v6, sel_initWithOptions_andTimestamp_, 0LL, 0.0);
  if (v4) {
    v4->_node = a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_node = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCRow;
  -[NSPersistentCacheRow dealloc](&v3, sel_dealloc);
}

- (id)objectID
{
  return (id)[self->_node objectID];
}

@end