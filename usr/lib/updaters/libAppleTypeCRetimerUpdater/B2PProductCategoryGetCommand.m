@interface B2PProductCategoryGetCommand
- (B2PProductCategoryGetCommand)init;
- (B2PProductCategoryGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
@end

@implementation B2PProductCategoryGetCommand

- (B2PProductCategoryGetCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PProductCategoryGetCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 312LL);
}

- (B2PProductCategoryGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

@end