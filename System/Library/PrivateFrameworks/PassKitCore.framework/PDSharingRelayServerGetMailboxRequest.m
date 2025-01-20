@interface PDSharingRelayServerGetMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerGetMailboxRequest

- (id)_urlRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _murlMailboxRequestWithAdditionalEndpointComponents:]( self,  "_murlMailboxRequestWithAdditionalEndpointComponents:",  0LL));
  [v2 setHTTPMethod:@"POST"];
  return v2;
}

@end