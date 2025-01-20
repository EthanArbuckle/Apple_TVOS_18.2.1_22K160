@interface CLPCReportingInterface
+ (id)createClient:(id *)a3;
@end

@implementation CLPCReportingInterface

+ (id)createClient:(id *)a3
{
  return -[CLPCReportingClient init:](objc_alloc(&OBJC_CLASS___CLPCReportingClient), "init:", a3);
}

@end