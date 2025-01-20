@interface CMSProcessTransaction
+ (id)sharedTransaction;
- (BOOL)active;
- (void)setActive:(BOOL)a3;
@end

@implementation CMSProcessTransaction

+ (id)sharedTransaction
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D18C;
  block[3] = &unk_10001C540;
  block[4] = a1;
  if (qword_100024458 != -1) {
    dispatch_once(&qword_100024458, block);
  }
  return (id)qword_100024450;
}

- (void)setActive:(BOOL)a3
{
  if (a3)
  {
    if (!self->_transaction)
    {
      v6 = (OS_os_transaction *)os_transaction_create("com.apple.cloudmediaservices.play", a2);
      transaction = self->_transaction;
      self->_transaction = v6;
    }
  }

  else
  {
    v4 = objc_autoreleasePoolPush();
    v5 = self->_transaction;
    self->_transaction = 0LL;

    objc_autoreleasePoolPop(v4);
  }

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end