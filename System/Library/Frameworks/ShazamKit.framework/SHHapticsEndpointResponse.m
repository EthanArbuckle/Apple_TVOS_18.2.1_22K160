@interface SHHapticsEndpointResponse
- (NSArray)spatialOffsets;
- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 networkDownloadResponse:(id)a4;
- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 spatialOffsets:(id)a4 networkDownloadResponse:(id)a5;
- (SHMediaItem)mediaItem;
- (SHNetworkDownloadResponse)networkDownloadResponse;
@end

@implementation SHHapticsEndpointResponse

- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 spatialOffsets:(id)a4 networkDownloadResponse:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SHHapticsEndpointResponse;
  v12 = -[SHHapticsEndpointResponse init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaItem, a3);
    objc_storeStrong((id *)&v13->_spatialOffsets, a4);
    objc_storeStrong((id *)&v13->_networkDownloadResponse, a5);
  }

  return v13;
}

- (SHHapticsEndpointResponse)initWithRequestMediaItem:(id)a3 networkDownloadResponse:(id)a4
{
  return -[SHHapticsEndpointResponse initWithRequestMediaItem:spatialOffsets:networkDownloadResponse:]( self,  "initWithRequestMediaItem:spatialOffsets:networkDownloadResponse:",  a3,  &__NSArray0__struct,  a4);
}

- (SHMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (NSArray)spatialOffsets
{
  return self->_spatialOffsets;
}

- (SHNetworkDownloadResponse)networkDownloadResponse
{
  return self->_networkDownloadResponse;
}

- (void).cxx_destruct
{
}

@end