@interface XPCTransaction
- (NSString)identifier;
- (XPCTransaction)initWithIdentifier:(id)a3;
- (id)description;
- (void)close;
- (void)dealloc;
- (void)open;
@end

@implementation XPCTransaction

- (XPCTransaction)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___XPCTransaction;
  v6 = -[XPCTransaction init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___XPCTransaction;
  id v3 = -[XPCTransaction description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ identifier = %@ %@",  v4,  self->_identifier,  self->_transaction));

  return v5;
}

- (void)open
{
  if (!self->_transaction)
  {
    id v3 = (OS_os_transaction *)os_transaction_create(-[NSString UTF8String](self->_identifier, "UTF8String"));
    transaction = self->_transaction;
    self->_transaction = v3;
  }

- (void)close
{
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___XPCTransaction;
  -[XPCTransaction dealloc](&v3, "dealloc");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end