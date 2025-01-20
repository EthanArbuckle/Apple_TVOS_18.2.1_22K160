@interface PDRemoteInterfacePresenter
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDRemoteInterfacePresenter)init;
- (id)createCurrentNotificationRegistrationState;
- (void)dealloc;
- (void)receivedSecureContactlessPresentationEvent:(id)a3;
@end

@implementation PDRemoteInterfacePresenter

- (PDRemoteInterfacePresenter)init
{
  return 0LL;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  sub_10015B9AC((uint64_t)self->_fieldDetectorManager, self);
  -[PDAssertionManager unregisterObserver:](self->_assertionManager, "unregisterObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDRemoteInterfacePresenter;
  -[PDRemoteInterfacePresenter dealloc](&v4, "dealloc");
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v3, "addObject:", PKDarwinNotificationEventLostModeStateChanged);
  -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v2,  "setNotificationNames:forStream:",  v3,  0LL);

  return v2;
}

- (void)receivedSecureContactlessPresentationEvent:(id)a3
{
  if (!sub_100016B5C((uint64_t)a3))
  {
    uint64_t v3 = PDDefaultPaymentPassUniqueIdentifier();
  }

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return !a3 || a3 == 5;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end