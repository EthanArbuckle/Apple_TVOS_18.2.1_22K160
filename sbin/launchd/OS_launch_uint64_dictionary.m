@interface OS_launch_uint64_dictionary
- (void)dealloc;
@end

@implementation OS_launch_uint64_dictionary

- (void)dealloc
{
  uint64_t v3 = sub_100017110();
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___OS_launch_uint64_dictionary;
  sub_100017118(v3, "dealloc", v4, v5, v6, v7, v8, v9, v10);
  sub_100017104();
}

@end