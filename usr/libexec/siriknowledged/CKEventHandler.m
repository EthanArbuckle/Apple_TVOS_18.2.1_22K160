@interface CKEventHandler
- (CKEventHandler)init;
@end

@implementation CKEventHandler

- (CKEventHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CKEventHandler;
  v2 = -[CKEventHandler init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siriknowledged.xpc.event_stream.queue", v4);
    event_stream_queue = v2->_event_stream_queue;
    v2->_event_stream_queue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end