@interface PDPassDaemonData
- (PDPassDaemonData)init;
- (id)description;
@end

@implementation PDPassDaemonData

- (PDPassDaemonData)init
{
  return 0LL;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
                   v5,
                   self));

  [v6 appendFormat:@"shareBunde: '%@'; ", self->_shareBundle];
  objc_msgSend( v6,  "appendFormat:",  @"secureElementPassFieldCollection: '%@'; ",
    self->_secureElementPassFieldCollection);
  [v6 appendFormat:@"tileDescriptors: '%@'; ", self->_descriptors];
  [v6 appendFormat:@">"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6));

  return v7;
}

- (void).cxx_destruct
{
}

@end