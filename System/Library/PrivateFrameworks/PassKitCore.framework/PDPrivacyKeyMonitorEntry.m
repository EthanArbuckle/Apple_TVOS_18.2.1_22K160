@interface PDPrivacyKeyMonitorEntry
- (NSArray)existingKeys;
- (NSString)groupIdentifier;
- (NSString)publicKeyIdentifier;
- (double)timeout;
- (id)completion;
- (id)description;
- (void)setCompletion:(id)a3;
- (void)setExistingKeys:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setPublicKeyIdentifier:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation PDPrivacyKeyMonitorEntry

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: ",  v5));

  if (self->_groupIdentifier) {
    [v6 appendFormat:@"groupIdentifier: '%@'; ", self->_groupIdentifier];
  }
  if (self->_publicKeyIdentifier) {
    [v6 appendFormat:@"publicKeyIdentifier: '%@'; ", self->_publicKeyIdentifier];
  }
  objc_msgSend(v6, "appendFormat:", @"timeout: '%lu'; ", (unint64_t)self->_timeout);
  [v6 appendFormat:@">"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v7;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (void)setPublicKeyIdentifier:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)existingKeys
{
  return self->_existingKeys;
}

- (void)setExistingKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end