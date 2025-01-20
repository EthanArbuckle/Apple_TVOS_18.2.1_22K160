@interface RestoreBootstrapInfo
- (id)description;
@end

@implementation RestoreBootstrapInfo

- (id)description
{
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 16LL, 1);
    BOOL preflightOnly = self->_preflightOnly;
  }

  else
  {
    id v3 = 0LL;
    BOOL preflightOnly = 0LL;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ reason: %@ preflightOnly: %d }",  v3,  preflightOnly));

  return v5;
}

- (void).cxx_destruct
{
}

@end