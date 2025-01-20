@interface boringssl_concrete_nw_protocol_boringssl
- (void)dealloc;
@end

@implementation boringssl_concrete_nw_protocol_boringssl

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___boringssl_concrete_nw_protocol_boringssl;
  -[boringssl_concrete_nw_protocol_boringssl dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end