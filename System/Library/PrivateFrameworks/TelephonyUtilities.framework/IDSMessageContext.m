@interface IDSMessageContext
- (NSString)csd_pseudonym;
@end

@implementation IDSMessageContext

- (NSString)csd_pseudonym
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMessageContext toID](self, "toID"));
  v3 = (void *)IDSCopyAddressDestinationForDestination(v2);

  v4 = (void *)IDSCopyRawAddressForDestination(v3);
  else {
    id v5 = 0LL;
  }

  return (NSString *)v5;
}

@end