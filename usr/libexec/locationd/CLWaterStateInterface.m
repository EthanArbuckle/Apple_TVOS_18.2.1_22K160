@interface CLWaterStateInterface
- (BOOL)isWaterStateON;
- (CLWaterStateInterface)init;
@end

@implementation CLWaterStateInterface

- (CLWaterStateInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWaterStateInterface;
  return -[CLWaterStateInterface init](&v3, "init");
}

- (BOOL)isWaterStateON
{
  return 0;
}

@end