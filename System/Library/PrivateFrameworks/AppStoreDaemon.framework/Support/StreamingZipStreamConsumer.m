@interface StreamingZipStreamConsumer
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation StreamingZipStreamConsumer

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v6 = ASDLogHandleForCategory(7LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v10) = 134217984;
    *(void *)((char *)&v10 + 4) = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "(SZStreamConsumer) Upstream event code %lu",  (uint8_t *)&v10,  0xCu);
  }

  if ((a4 & 3) != 0 && self)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    *(void *)&__int128 v10 = _NSConcreteStackBlock;
    *((void *)&v10 + 1) = 3221225472LL;
    v11 = sub_100252FF4;
    v12 = &unk_1003E9880;
    v13 = self;
    dispatch_sync(dispatchQueue, &v10);
  }

  if ((a4 & 0x10) != 0)
  {
    if (self)
    {
      v9 = (dispatch_queue_s *)self->_dispatchQueue;
      *(void *)&__int128 v10 = _NSConcreteStackBlock;
      *((void *)&v10 + 1) = 3221225472LL;
      v11 = sub_100252E6C;
      v12 = &unk_1003E9880;
      v13 = self;
      dispatch_sync(v9, &v10);
    }
  }

- (void).cxx_destruct
{
}

@end