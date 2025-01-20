@interface DataArk
- (DataArk)init;
- (DataArk)initWithPath:(id)a3;
- (NSMutableDictionary)change_notifications;
- (NSMutableDictionary)remove_notifications;
- (NSMutableDictionary)set_notifications;
- (NSMutableDictionary)store;
- (NSString)path;
- (OS_dispatch_queue)queue;
- (void)postNotification:(id)a3;
- (void)setChange_notifications:(id)a3;
- (void)setPath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemove_notifications:(id)a3;
- (void)setSet_notifications:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation DataArk

- (DataArk)initWithPath:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___DataArk;
  v5 = -[DataArk init](&v29, "init");
  if (!v5) {
    goto LABEL_18;
  }
  if (!v4)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0LL, @"Invalid input.");
LABEL_23:
    v26 = 0LL;
    goto LABEL_24;
  }

  v6 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  NSFileAttributeKey v30 = NSFilePosixPermissions;
  v31 = &off_10026D440;
  v7 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
  id v28 = 0LL;
  unsigned __int8 v8 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v6,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v4,  1LL,  v7,  &v28);
  v9 = (NSMutableDictionary *)v28;

  if ((v8 & 1) == 0)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0LL, @"Could not create path %@: %@", v4, v9);
LABEL_10:
    v15 = v9;
LABEL_22:

    goto LABEL_23;
  }

  v10 = (NSString *)[v4 stringByAppendingPathComponent:@"data_ark.plist"];
  path = v5->_path;
  v5->_path = v10;

  v12 = (NSMutableDictionary *)v5->_path;
  if (!v12)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0LL, @"Failed to create string.");
    goto LABEL_10;
  }

  v13 = load_dict(v12);
  if (v13) {
    v14 =  +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13);
  }
  else {
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  store = v5->_store;
  v5->_store = v14;

  if (!v5->_store)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0LL, @"Failed to create dictionary.");
    goto LABEL_21;
  }

  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  set_notifications = v5->_set_notifications;
  v5->_set_notifications = v17;

  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  change_notifications = v5->_change_notifications;
  v5->_change_notifications = v19;

  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  remove_notifications = v5->_remove_notifications;
  v5->_remove_notifications = v21;

  if (!v5->_set_notifications || !v5->_change_notifications || !v5->_remove_notifications)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0LL, @"Failed to allocate dictionary.");
LABEL_21:

    v15 = v13;
    goto LABEL_22;
  }

  v23 =  dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v24 = dispatch_queue_create("com.apple.mobileactivationd.dark", v23);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v24;

  if (!v5->_queue)
  {
    maLog((uint64_t)"-[DataArk initWithPath:]", 0LL, @"Failed to create queue.");
    goto LABEL_21;
  }

LABEL_18:
  v26 = v5;
LABEL_24:

  return v26;
}

- (DataArk)init
{
  return 0LL;
}

- (void)postNotification:(id)a3
{
  v3 = (__CFString *)a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, v3, 0LL, 1u);
}

- (NSMutableDictionary)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSMutableDictionary)set_notifications
{
  return self->_set_notifications;
}

- (void)setSet_notifications:(id)a3
{
}

- (NSMutableDictionary)change_notifications
{
  return self->_change_notifications;
}

- (void)setChange_notifications:(id)a3
{
}

- (NSMutableDictionary)remove_notifications
{
  return self->_remove_notifications;
}

- (void)setRemove_notifications:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end