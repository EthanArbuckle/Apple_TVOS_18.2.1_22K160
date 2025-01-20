@interface NWConcrete_nw_storage_flush_item
- (void)dealloc;
@end

@implementation NWConcrete_nw_storage_flush_item

- (void)dealloc
{
  key = self->_key;
  if (key)
  {
    free(key);
    self->_key = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_storage_flush_item;
  -[NWConcrete_nw_storage_flush_item dealloc](&v4, sel_dealloc);
}

@end