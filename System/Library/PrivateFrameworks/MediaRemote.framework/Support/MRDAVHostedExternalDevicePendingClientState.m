@interface MRDAVHostedExternalDevicePendingClientState
- (MRAVDistantEndpoint)endpoint;
- (MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications)outputDeviceModifications;
- (MRDeviceInfo)deviceInfo;
- (MRGroupSessionToken)groupSessionToken;
- (NSError)connectionStateError;
- (NSMutableDictionary)discoverySessionConfigurationsResults;
- (NSMutableDictionary)outputDeviceMute;
- (NSMutableDictionary)outputDeviceVolume;
- (NSMutableDictionary)outputDeviceVolumeCapabilities;
- (NSNumber)isMuted;
- (NSNumber)volume;
- (NSNumber)volumeCapabilities;
- (id)description;
- (unsigned)connectionState;
- (void)setConnectionState:(unsigned int)a3;
- (void)setConnectionStateError:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoverySessionConfigurationsResults:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setGroupSessionToken:(id)a3;
- (void)setIsMuted:(id)a3;
- (void)setOutputDeviceModifications:(id)a3;
- (void)setOutputDeviceMute:(id)a3;
- (void)setOutputDeviceVolume:(id)a3;
- (void)setOutputDeviceVolumeCapabilities:(id)a3;
- (void)setVolume:(id)a3;
- (void)setVolumeCapabilities:(id)a3;
@end

@implementation MRDAVHostedExternalDevicePendingClientState

- (id)description
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@ %p{\n",  objc_opt_class(self),  self);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" hasConnected");
  uint64_t connectionState = self->_connectionState;
  if ((_DWORD)connectionState)
  {
    v5 = (void *)MRExternalDeviceConnectionStateCopyDescription(connectionState);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    connectionState=%@\n", v5);
  }

  if (self->_connectionStateError) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"    connectionStateError=%@\n",  self->_connectionStateError);
  }
  if (self->_deviceInfo) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    deviceInfo = %@\n", self->_deviceInfo);
  }
  volume = self->_volume;
  if (volume)
  {
    -[NSNumber floatValue](volume, "floatValue");
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    volume = %f\n", v7);
  }

  volumeCapabilities = self->_volumeCapabilities;
  if (volumeCapabilities)
  {
    v9 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(-[NSNumber unsignedIntValue](volumeCapabilities, "unsignedIntValue"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    volumeCapabilities = %@\n", v9);
  }

  if (-[NSMutableDictionary count](self->_outputDeviceVolume, "count"))
  {
    uint64_t v10 = MRCreateIndentedDebugDescriptionFromObject(self->_outputDeviceVolume);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    outputDeviceVolumes = %@\n", v11);
  }

  if (-[NSMutableDictionary count](self->_outputDeviceVolumeCapabilities, "count"))
  {
    v12 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](self->_outputDeviceVolumeCapabilities, "count"));
    outputDeviceVolumeCapabilities = self->_outputDeviceVolumeCapabilities;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100036EB4;
    v28[3] = &unk_10039AC50;
    v29 = v12;
    v14 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( outputDeviceVolumeCapabilities,  "enumerateKeysAndObjectsUsingBlock:",  v28);
    uint64_t v15 = MRCreateIndentedDebugDescriptionFromObject(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    outputDeviceVolumeCapabilities = %@\n", v16);
  }

  if (-[NSMutableDictionary count](self->_outputDeviceVolume, "count"))
  {
    uint64_t v17 = MRCreateIndentedDebugDescriptionFromObject(self->_outputDeviceMute);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    outputDeviceMutes = %@\n", v18);
  }

  outputDeviceModifications = self->_outputDeviceModifications;
  if (outputDeviceModifications)
  {
    uint64_t v20 = MRCreateIndentedDebugDescriptionFromObject(outputDeviceModifications);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    modifications = %@\n", v21);
  }

  if (-[NSMutableDictionary count](self->_discoverySessionConfigurationsResults, "count"))
  {
    uint64_t v22 = MRCreateIndentedDebugDescriptionFromObject(self->_discoverySessionConfigurationsResults);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    discoveryResults = %@\n", v23);
  }

  groupSessionToken = self->_groupSessionToken;
  if (groupSessionToken)
  {
    uint64_t v25 = MRCreateIndentedDebugDescriptionFromObject(groupSessionToken);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    groupSessionToken = %@\n", v26);
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}>\n");
  return v3;
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unsigned int)a3
{
  self->_uint64_t connectionState = a3;
}

- (NSError)connectionStateError
{
  return self->_connectionStateError;
}

- (void)setConnectionStateError:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (MRAVDistantEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSNumber)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (NSNumber)volumeCapabilities
{
  return self->_volumeCapabilities;
}

- (void)setVolumeCapabilities:(id)a3
{
}

- (NSNumber)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(id)a3
{
}

- (NSMutableDictionary)outputDeviceVolume
{
  return self->_outputDeviceVolume;
}

- (void)setOutputDeviceVolume:(id)a3
{
}

- (NSMutableDictionary)outputDeviceVolumeCapabilities
{
  return self->_outputDeviceVolumeCapabilities;
}

- (void)setOutputDeviceVolumeCapabilities:(id)a3
{
}

- (NSMutableDictionary)outputDeviceMute
{
  return self->_outputDeviceMute;
}

- (void)setOutputDeviceMute:(id)a3
{
}

- (MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications)outputDeviceModifications
{
  return self->_outputDeviceModifications;
}

- (void)setOutputDeviceModifications:(id)a3
{
}

- (NSMutableDictionary)discoverySessionConfigurationsResults
{
  return self->_discoverySessionConfigurationsResults;
}

- (void)setDiscoverySessionConfigurationsResults:(id)a3
{
}

- (MRGroupSessionToken)groupSessionToken
{
  return self->_groupSessionToken;
}

- (void)setGroupSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end