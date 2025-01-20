@interface APSConnection
- (id)description;
@end

@implementation APSConnection

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection valueForKey:](self, "valueForKey:", @"environmentName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection valueForKey:](self, "valueForKey:", @"connectionPortName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p %@ %@>",  v3,  self,  v4,  v5));

  return v6;
}

@end