@interface PlaceholderBuilder
- (PlaceholderBuilder)init;
@end

@implementation PlaceholderBuilder

- (PlaceholderBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PlaceholderBuilder;
  v2 = -[PlaceholderBuilder init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = ASDLogHandleForCategory(31LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    v2->_signpostID = os_signpost_id_make_with_pointer(v4, v2);
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end