@interface UAReplayAdvertisableItem
+ (id)replayableAdvertisableItemWithAdvertisableItem:(id)a3;
- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3;
- (OS_dispatch_semaphore)wasResumed;
- (UAReplayAdvertisableItem)initWithCoder:(id)a3;
- (UAReplayAdvertisableItem)initWithUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UAReplayAdvertisableItem

- (UAReplayAdvertisableItem)initWithUUID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UAReplayAdvertisableItem;
  v3 = -[UAReplayAdvertisableItem initWithUUID:type:options:](&v7, "initWithUUID:type:options:", a3, 1LL, 0LL);
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
    wasResumed = v3->_wasResumed;
    v3->_wasResumed = (OS_dispatch_semaphore *)v4;
  }

  return v3;
}

- (UAReplayAdvertisableItem)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UAReplayAdvertisableItem;
  v3 = -[UAReplayAdvertisableItem initWithCoder:](&v7, "initWithCoder:", a3);
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
    wasResumed = v3->_wasResumed;
    v3->_wasResumed = (OS_dispatch_semaphore *)v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UAReplayAdvertisableItem;
  -[UAReplayAdvertisableItem encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3
{
  dispatch_semaphore_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayAdvertisableItem wasResumed](self, "wasResumed", a3));

  if (v4)
  {
    v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[UAReplayAdvertisableItem wasResumed](self, "wasResumed"));
    dispatch_semaphore_signal(v5);
  }

  return 0;
}

+ (id)replayableAdvertisableItemWithAdvertisableItem:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = -[UAReplayAdvertisableItem initWithUserActivityInfo:]( objc_alloc(&OBJC_CLASS___UAReplayAdvertisableItem),  "initWithUserActivityInfo:",  v3);

  return v4;
}

- (OS_dispatch_semaphore)wasResumed
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end