@interface ACAccount
- (BOOL)isManageable;
- (NSString)accountDSID;
@end

@implementation ACAccount

- (NSString)accountDSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount ic_DSID](self, "ic_DSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringValue]);

  return (NSString *)v3;
}

- (BOOL)isManageable
{
  return -[ACAccount ic_isManageable](self, "ic_isManageable");
}

@end