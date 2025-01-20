@interface PDSharingRelayServerRelinquishMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerRelinquishMailboxRequest

- (id)_urlRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _murlMailboxRequestWithAdditionalEndpointComponents:]( self,  "_murlMailboxRequestWithAdditionalEndpointComponents:",  0LL));
  [v2 setHTTPMethod:@"PATCH"];
  return v2;
}

@end