@interface NWURLSessionMultipartPartBoundarySuffixRecognizer
- (NWURLSessionMultipartPartBoundarySuffixRecognizer)init;
- (void)dealloc;
@end

@implementation NWURLSessionMultipartPartBoundarySuffixRecognizer

- (NWURLSessionMultipartPartBoundarySuffixRecognizer)init
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWURLSessionMultipartPartBoundarySuffixRecognizer;
  v2 = -[NWURLSessionMultipartPartBoundarySuffixRecognizer init](&v8, sel_init);
  v3 = v2;
  if (!v2) {
    return v3;
  }
  v2->_nextState = 4;
  v2->_bytesConsumed = 0LL;
  v4 = (char *)malloc(2uLL);
  if (v4)
  {
LABEL_3:
    v3->_buffer = v4;
    v3->_count = 0LL;
    return v3;
  }

  __nwlog_obj();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  int v9 = 136446466;
  v10 = "strict_malloc";
  __int16 v11 = 2048;
  uint64_t v12 = 2LL;
  v7 = (void *)_os_log_send_and_compose_impl();

  result = (NWURLSessionMultipartPartBoundarySuffixRecognizer *)__nwlog_abort((uint64_t)v7);
  if (!(_DWORD)result)
  {
    free(v7);
    goto LABEL_3;
  }

  __break(1u);
  return result;
}

- (void)dealloc
{
  if (self)
  {
    buffer = self->_buffer;
    if (buffer)
    {
      free(buffer);
      self->_buffer = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWURLSessionMultipartPartBoundarySuffixRecognizer;
  -[NWURLSessionMultipartPartBoundarySuffixRecognizer dealloc](&v4, sel_dealloc);
}

@end