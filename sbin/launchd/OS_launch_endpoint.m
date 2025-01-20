@interface OS_launch_endpoint
- (void)dealloc;
@end

@implementation OS_launch_endpoint

- (void)dealloc
{
  uint64_t v9 = sub_100017110();
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___OS_launch_endpoint;
  sub_100017118(v9, "dealloc", v10, v11, v12, v13, v14, v15, v16);
  sub_100017104();
}

@end