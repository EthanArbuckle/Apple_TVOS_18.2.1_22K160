@interface ICSetContainerPropertiesResponse
- (BOOL)updateRequired;
- (NSString)globalPlaylistID;
- (NSString)subscribedContainerURL;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setSubscribedContainerURL:(id)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICSetContainerPropertiesResponse

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSString)subscribedContainerURL
{
  return self->_subscribedContainerURL;
}

- (void)setSubscribedContainerURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end