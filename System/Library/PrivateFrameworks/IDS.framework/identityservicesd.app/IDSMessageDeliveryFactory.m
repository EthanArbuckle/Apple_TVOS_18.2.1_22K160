@interface IDSMessageDeliveryFactory
+ (id)sharedFactory;
- (id)createAPNSMessageDelivery;
- (id)createHTTPMessageDelivery;
@end

@implementation IDSMessageDeliveryFactory

+ (id)sharedFactory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10020BC10;
  block[3] = &unk_1008F6558;
  block[4] = a1;
  if (qword_1009C0630 != -1) {
    dispatch_once(&qword_1009C0630, block);
  }
  return (id)qword_1009C0628;
}

- (id)createHTTPMessageDelivery
{
  return objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]( &OBJC_CLASS___FTMessageDelivery,  "HTTPMessageDeliveryClass"));
}

- (id)createAPNSMessageDelivery
{
  return objc_alloc_init((Class)+[FTMessageDelivery APNSMessageDeliveryClass]( &OBJC_CLASS___FTMessageDelivery,  "APNSMessageDeliveryClass"));
}

@end