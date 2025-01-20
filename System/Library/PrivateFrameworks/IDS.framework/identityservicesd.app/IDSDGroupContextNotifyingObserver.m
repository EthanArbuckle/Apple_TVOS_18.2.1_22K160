@interface IDSDGroupContextNotifyingObserver
- (IDSDGroupContextNotifyingObserver)initWithDelegate:(id)a3;
- (IDSDGroupContextNotifyingObserverDelegate)delegate;
- (void)dealloc;
- (void)groupContext:(id)a3 didCacheGroup:(id)a4;
- (void)groupContext:(id)a3 didCreateGroup:(id)a4;
- (void)groupContext:(id)a3 didReceiveDecryptionFailureForGroup:(id)a4;
- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5;
- (void)groupContextDidReceiveRegistrationIdentityUpdate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IDSDGroupContextNotifyingObserver

- (IDSDGroupContextNotifyingObserver)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSDGroupContextNotifyingObserver;
  v6 = -[IDSDGroupContextNotifyingObserver init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSDGroupContextNotifyingObserver;
  -[IDSDGroupContextNotifyingObserver dealloc](&v4, "dealloc");
}

- (void)groupContext:(id)a3 didCreateGroup:(id)a4
{
}

- (void)groupContext:(id)a3 didCacheGroup:(id)a4
{
}

- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5
{
}

- (void)groupContext:(id)a3 didReceiveDecryptionFailureForGroup:(id)a4
{
}

- (void)groupContextDidReceiveRegistrationIdentityUpdate:(id)a3
{
}

- (IDSDGroupContextNotifyingObserverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end