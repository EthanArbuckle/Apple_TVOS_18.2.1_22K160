@interface MSDTransactionTask
+ (id)createTransactionWithIdentifier:(id)a3;
- (MSDTransactionTask)initWithIdentifier:(id)a3;
- (NSString)transactionID;
- (id)description;
- (void)dealloc;
- (void)releaseTransaction;
- (void)setTransactionID:(id)a3;
@end

@implementation MSDTransactionTask

- (MSDTransactionTask)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MSDTransactionTask;
  v6 = -[MSDTransactionTask init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transactionID, a3);
    uint64_t v8 = os_transaction_create([v5 UTF8String]);
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;
  }

  return v7;
}

+ (id)createTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4];
  }

  else
  {
    id v6 = sub_10003E9DC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100031434(v7);
    }

    id v5 = 0LL;
  }

  return v5;
}

- (void)dealloc
{
  v3 = objc_autoreleasePoolPush();
  transaction = self->_transaction;
  self->_transaction = 0LL;

  objc_autoreleasePoolPop(v3);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDTransactionTask;
  -[MSDTransactionTask dealloc](&v5, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MSDTransactionTask: TaskID: %@ Transaction: %@>",  self->_transactionID,  self->_transaction);
}

- (void)releaseTransaction
{
  v3 = objc_autoreleasePoolPush();
  transaction = self->_transaction;
  self->_transaction = 0LL;

  objc_autoreleasePoolPop(v3);
}

- (NSString)transactionID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTransactionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end