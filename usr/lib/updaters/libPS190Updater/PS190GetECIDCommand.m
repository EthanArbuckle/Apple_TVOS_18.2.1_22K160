@interface PS190GetECIDCommand
- (PS190GetECIDCommand)init;
- (unsigned)responseSize;
@end

@implementation PS190GetECIDCommand

- (PS190GetECIDCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PS190GetECIDCommand;
  return -[PS190Command initWithType:param0:param1:param2:count:data:]( &v3,  sel_initWithType_param0_param1_param2_count_data_,  27LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (unsigned)responseSize
{
  return 16;
}

@end