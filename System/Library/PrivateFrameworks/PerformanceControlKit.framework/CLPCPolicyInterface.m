@interface CLPCPolicyInterface
+ (id)createClient:(id *)a3;
@end

@implementation CLPCPolicyInterface

+ (id)createClient:(id *)a3
{
  return -[CLPCUserClient init:](objc_alloc(&OBJC_CLASS___CLPCPolicyClient), "init:", a3);
}

@end