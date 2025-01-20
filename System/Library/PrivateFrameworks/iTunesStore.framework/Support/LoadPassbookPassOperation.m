@interface LoadPassbookPassOperation
- (LoadPassbookPassOperation)initWithAccountIdentifier:(id)a3;
- (NSNumber)accountIdentifier;
- (id)outputBlock;
- (void)dealloc;
- (void)setOutputBlock:(id)a3;
@end

@implementation LoadPassbookPassOperation

- (LoadPassbookPassOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LoadPassbookPassOperation;
  v4 = -[LoadPassbookPassOperation init](&v6, "init");
  if (v4) {
    v4->_accountID = (NSNumber *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LoadPassbookPassOperation;
  -[LoadPassbookPassOperation dealloc](&v3, "dealloc");
}

- (NSNumber)accountIdentifier
{
  return self->_accountID;
}

- (id)outputBlock
{
  id v3 = self->_outputBlock;
  -[LoadPassbookPassOperation unlock](self, "unlock");
  return v3;
}

- (void)setOutputBlock:(id)a3
{
  id outputBlock = self->_outputBlock;
  if (outputBlock != a3)
  {

    self->_id outputBlock = [a3 copy];
  }

  -[LoadPassbookPassOperation unlock](self, "unlock");
}

@end