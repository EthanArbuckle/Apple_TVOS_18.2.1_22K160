@interface BufferedStream
- (void)dealloc;
@end

@implementation BufferedStream

- (void)dealloc
{
  if (self->_fd)
  {
    uint64_t v3 = ASDLogHandleForCategory(7LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "(BufferedStream) Cleaning up mapped file",  buf,  2u);
    }

    munmap(self->_buffer, self->_bufferLength);
    self->_buffer = 0LL;
    ftruncate(self->_fd, 0LL);
    close(self->_fd);
    if (unlink(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation")))
    {
      uint64_t v5 = ASDLogHandleForCategory(7LL);
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v9 = *__error();
        *(_DWORD *)buf = 67109120;
        int v12 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "(BufferedStream) Unable to unlink buffer file: %{darwin.errno}d",  buf,  8u);
      }
    }
  }

  if (self->_buffer)
  {
    uint64_t v7 = ASDLogHandleForCategory(7LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "(BufferedStream) Freeing memory buffer",  buf,  2u);
    }

    free(self->_buffer);
    self->_buffer = 0LL;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BufferedStream;
  -[BufferedStream dealloc](&v10, "dealloc");
}

- (void).cxx_destruct
{
}

@end