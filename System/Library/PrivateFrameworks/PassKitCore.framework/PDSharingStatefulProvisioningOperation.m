@interface PDSharingStatefulProvisioningOperation
- (BOOL)isForegroundOperation;
- (BOOL)isWaitingOnUserAction;
- (BOOL)requiresSenderActivationVerification;
- (NSString)shareIdentifier;
- (NSString)transportIdentifier;
- (id)completion;
- (id)copyWithoutCompletion;
- (id)description;
- (void)setCompletion:(id)a3;
- (void)setIsForegroundOperation:(BOOL)a3;
- (void)setIsWaitingOnUserAction:(BOOL)a3;
- (void)setRequiresSenderActivationVerification:(BOOL)a3;
- (void)setShareIdentifier:(id)a3;
- (void)setTransportIdentifier:(id)a3;
@end

@implementation PDSharingStatefulProvisioningOperation

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
                   v5,
                   self));

  [v6 appendFormat:@"shareIdentifier: '%@'; ", self->_shareIdentifier];
  uint64_t v7 = PKSharingLoggableMailboxAddress(self->_transportIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 appendFormat:@"transportIdentifier: '%@'; ", v8];

  if (self->_isForegroundOperation) {
    v9 = @"Yes";
  }
  else {
    v9 = @"No";
  }
  [v6 appendFormat:@"foreground: '%@'; ", v9];
  if (self->_isWaitingOnUserAction) {
    v10 = @"Yes";
  }
  else {
    v10 = @"No";
  }
  [v6 appendFormat:@"isWaitingOnUserAction: '%@'; ", v10];
  if (self->_requiresSenderActivationVerification) {
    v11 = @"Yes";
  }
  else {
    v11 = @"No";
  }
  [v6 appendFormat:@"requiresSenderActivationVerification: '%@'; ", v11];
  [v6 appendFormat:@">"];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v12;
}

- (id)copyWithoutCompletion
{
  v3 = objc_alloc_init(&OBJC_CLASS___PDSharingStatefulProvisioningOperation);
  v4 = (NSString *)-[NSString copy](self->_shareIdentifier, "copy");
  shareIdentifier = v3->_shareIdentifier;
  v3->_shareIdentifier = v4;

  v6 = (NSString *)-[NSString copy](self->_transportIdentifier, "copy");
  transportIdentifier = v3->_transportIdentifier;
  v3->_transportIdentifier = v6;

  v3->_isForegroundOperation = self->_isForegroundOperation;
  v3->_isWaitingOnUserAction = self->_isWaitingOnUserAction;
  v3->_requiresSenderActivationVerification = self->_requiresSenderActivationVerification;
  return v3;
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
}

- (BOOL)isForegroundOperation
{
  return self->_isForegroundOperation;
}

- (void)setIsForegroundOperation:(BOOL)a3
{
  self->_isForegroundOperation = a3;
}

- (BOOL)isWaitingOnUserAction
{
  return self->_isWaitingOnUserAction;
}

- (void)setIsWaitingOnUserAction:(BOOL)a3
{
  self->_isWaitingOnUserAction = a3;
}

- (BOOL)requiresSenderActivationVerification
{
  return self->_requiresSenderActivationVerification;
}

- (void)setRequiresSenderActivationVerification:(BOOL)a3
{
  self->_requiresSenderActivationVerification = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end