@interface FSMessageReceiver
+ (id)receiverWithDelegate:(id)a3;
@end

@implementation FSMessageReceiver

+ (id)receiverWithDelegate:(id)a3
{
  return (id)objc_opt_new(a1, a2, a3);
}

@end