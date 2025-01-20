@interface NSURLSessionTask
- (id)ITunesStoreCancelError;
- (id)ITunesStoreDataConsumer;
- (int64_t)ITunesStoreCancelReason;
- (void)cancelWithITunesStoreReason:(int64_t)a3 error:(id)a4;
- (void)setITunesStoreDataConsumer:(id)a3;
@end

@implementation NSURLSessionTask

- (void)cancelWithITunesStoreReason:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  value = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", a3);
  objc_setAssociatedObject(self, "com.apple.itunesstored.cancelError", v6, (void *)0x301);

  objc_setAssociatedObject(self, "com.apple.itunesstored.cancelReason", value, (void *)0x301);
  -[NSURLSessionTask cancel](self, "cancel");
}

- (id)ITunesStoreCancelError
{
  return objc_getAssociatedObject(self, "com.apple.itunesstored.cancelError");
}

- (int64_t)ITunesStoreCancelReason
{
  id AssociatedObject = objc_getAssociatedObject(self, "com.apple.itunesstored.cancelReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)ITunesStoreDataConsumer
{
  return objc_getAssociatedObject(self, "com.apple.itunesstored.dataConsumer");
}

- (void)setITunesStoreDataConsumer:(id)a3
{
}

@end