@interface PDSharingRelayServerPingMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerPingMailboxRequest

- (id)_urlRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _murlMailboxRequestWithAdditionalEndpointComponents:]( self,  "_murlMailboxRequestWithAdditionalEndpointComponents:",  0LL));
  [v2 setHTTPMethod:@"GET"];
  return v2;
}

@end