@interface LZMADecoder
- (LZMADecoder)init;
- (void)dealloc;
@end

@implementation LZMADecoder

- (LZMADecoder)init
{
  return (LZMADecoder *)sub_1001B5878((char *)self, 0LL);
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0LL;

  uint64_t v5 = ASDLogHandleForCategory(7LL, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "(LZMADecoder) Decoder deallocated: %@",  buf,  0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___LZMADecoder;
  -[LZMADecoder dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
}

@end