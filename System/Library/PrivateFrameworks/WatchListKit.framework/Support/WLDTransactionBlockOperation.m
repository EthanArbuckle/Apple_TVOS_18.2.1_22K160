@interface WLDTransactionBlockOperation
- (WLDTransactionBlockOperation)init;
- (void)dealloc;
@end

@implementation WLDTransactionBlockOperation

- (WLDTransactionBlockOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WLDTransactionBlockOperation;
  v2 = -[WLDTransactionBlockOperation init](&v6, "init");
  if (v2)
  {
    v3 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDTransactionBlockOperation.init");
    id v4 = v2->super.super._private;
    v2->super.super._private = v3;
  }

  return v2;
}

- (void)dealloc
{
  id v3 = self->super.super._private;
  self->super.super._private = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WLDTransactionBlockOperation;
  -[WLDTransactionBlockOperation dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end