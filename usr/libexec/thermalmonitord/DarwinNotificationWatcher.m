@interface DarwinNotificationWatcher
+ (id)monitorNotificationKey:(id)a3 forReason:(id)a4 queue:(id)a5 handler:(id)a6;
@end

@implementation DarwinNotificationWatcher

+ (id)monitorNotificationKey:(id)a3 forReason:(id)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v15 = 0LL;
  v16 = (int *)&v15;
  uint64_t v17 = 0x2020000000LL;
  v10 = (char *)[a3 UTF8String];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000406C;
  v14[3] = &unk_100060B48;
  v14[4] = a6;
  sub_100022F34(v10, v16 + 6, (dispatch_queue_s *)a5, v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000040B8;
  v13[3] = &unk_100060B70;
  v13[4] = &v15;
  v11 = -[TMSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]( objc_alloc(&OBJC_CLASS___TMSimpleAssertion),  "initWithIdentifier:forReason:invalidationBlock:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DarwinNotification (%@)",  a3),  a4,  v13);
  _Block_object_dispose(&v15, 8);
  return v11;
}

@end