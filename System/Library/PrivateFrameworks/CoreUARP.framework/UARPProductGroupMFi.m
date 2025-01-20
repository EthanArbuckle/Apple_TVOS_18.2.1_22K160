@interface UARPProductGroupMFi
- (UARPProductGroupMFi)initWithProductGroup:(id)a3;
@end

@implementation UARPProductGroupMFi

- (UARPProductGroupMFi)initWithProductGroup:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPProductGroupMFi;
  return -[UARPProductGroup initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

@end