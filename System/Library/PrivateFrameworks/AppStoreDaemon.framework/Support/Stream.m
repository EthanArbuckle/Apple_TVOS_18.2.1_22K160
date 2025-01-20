@interface Stream
- (NSError)streamError;
- (Stream)init;
- (StreamDelegate)delegate;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)setDelegate:(id)a3;
@end

@implementation Stream

- (Stream)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___Stream;
  id v2 = -[Stream init](&v16, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.Stream.DelegateQueue", v6);
    v8 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v7;

    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 1));
    v10 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v9;

    objc_initWeak(&location, v2);
    v11 = (dispatch_source_s *)*((void *)v2 + 2);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002377C8;
    v13[3] = &unk_1003ECBA0;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v11, v13);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return (Stream *)v2;
}

- (StreamDelegate)delegate
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_source_t v9 = sub_10023791C;
  v10 = sub_10023792C;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100237934;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (StreamDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002379E8;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1002C11C4(lock, v7);
}

- (NSError)streamError
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  dispatch_source_t v9 = sub_10023791C;
  v10 = sub_10023792C;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100237AC0;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (unint64_t)streamStatus
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100237C08;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)close
{
}

- (void)open
{
  if (self) {
    dispatch_source_merge_data((dispatch_source_t)self->_delegateSource, 1uLL);
  }
}

- (void).cxx_destruct
{
}

@end