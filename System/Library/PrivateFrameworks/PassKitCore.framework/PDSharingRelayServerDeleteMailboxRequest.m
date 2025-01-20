@interface PDSharingRelayServerDeleteMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerDeleteMailboxRequest

- (id)_urlRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingRelayServerRequest _murlMailboxRequestWithAdditionalEndpointComponents:]( self,  "_murlMailboxRequestWithAdditionalEndpointComponents:",  0LL));
  [v2 setHTTPMethod:@"DELETE"];
  return v2;
}

@end