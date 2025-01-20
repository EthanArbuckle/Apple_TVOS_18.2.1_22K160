@interface NIServerFindingPeerTracking
+ (NIServerFindingPeerTracking)peerTrackingWithDiscoveryState:(int)a3 advertisingState:(int)a4 rangingState:(int)a5 algorithmOutputFlags:(unsigned __int8)a6 receivedSignalFlags:(unsigned __int8)a7 tellClientAboutPeer:(BOOL)a8 clientWantsUpdates:(BOOL)a9 nbUwbAcquisitionChannelIdx:(id)a10;
+ (id)peerTrackingInitialState;
+ (id)peerTrackingTerminalState;
- (BOOL)clientWantsUpdates;
- (BOOL)hasReceivedRangingData;
- (BOOL)isAttemptingToRange;
- (BOOL)isDoingAnything;
- (BOOL)isEqual:(id)a3;
- (BOOL)tellClientAboutPeer;
- (NSNumber)nbUwbAcquisitionChannelIdx;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)advertisingState;
- (int)discoveryState;
- (int)rangingState;
- (unsigned)algorithmOutputFlags;
- (unsigned)receivedSignalFlags;
- (void)setAdvertisingState:(int)a3;
- (void)setAlgorithmOutputFlags:(unsigned __int8)a3;
- (void)setClientWantsUpdates:(BOOL)a3;
- (void)setDiscoveryState:(int)a3;
- (void)setNbUwbAcquisitionChannelIdx:(id)a3;
- (void)setRangingState:(int)a3;
- (void)setReceivedSignalFlags:(unsigned __int8)a3;
- (void)setTellClientAboutPeer:(BOOL)a3;
@end

@implementation NIServerFindingPeerTracking

+ (NIServerFindingPeerTracking)peerTrackingWithDiscoveryState:(int)a3 advertisingState:(int)a4 rangingState:(int)a5 algorithmOutputFlags:(unsigned __int8)a6 receivedSignalFlags:(unsigned __int8)a7 tellClientAboutPeer:(BOOL)a8 clientWantsUpdates:(BOOL)a9 nbUwbAcquisitionChannelIdx:(id)a10
{
  BOOL v10 = a8;
  uint64_t v11 = a7;
  uint64_t v12 = a6;
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  uint64_t v15 = *(void *)&a3;
  id v16 = a10;
  v17 = objc_alloc_init(&OBJC_CLASS___NIServerFindingPeerTracking);
  -[NIServerFindingPeerTracking setDiscoveryState:](v17, "setDiscoveryState:", v15);
  -[NIServerFindingPeerTracking setAdvertisingState:](v17, "setAdvertisingState:", v14);
  -[NIServerFindingPeerTracking setRangingState:](v17, "setRangingState:", v13);
  -[NIServerFindingPeerTracking setAlgorithmOutputFlags:](v17, "setAlgorithmOutputFlags:", v12);
  -[NIServerFindingPeerTracking setReceivedSignalFlags:](v17, "setReceivedSignalFlags:", v11);
  -[NIServerFindingPeerTracking setTellClientAboutPeer:](v17, "setTellClientAboutPeer:", v10);
  -[NIServerFindingPeerTracking setClientWantsUpdates:](v17, "setClientWantsUpdates:", a9);
  -[NIServerFindingPeerTracking setNbUwbAcquisitionChannelIdx:](v17, "setNbUwbAcquisitionChannelIdx:", v16);

  return v17;
}

+ (id)peerTrackingInitialState
{
  LOBYTE(v3) = 0;
  return +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellCli entAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v3,  0LL);
}

+ (id)peerTrackingTerminalState
{
  LOBYTE(v3) = 0;
  return +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellCli entAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:",  4LL,  2LL,  4LL,  0LL,  0LL,  0LL,  v3,  0LL);
}

- (BOOL)isDoingAnything
{
  return (self->_discoveryState - 1) < 3
      || self->_advertisingState == 1
      || (self->_rangingState - 1) < 3;
}

- (BOOL)isAttemptingToRange
{
  return (self->_rangingState - 1) < 3;
}

- (BOOL)hasReceivedRangingData
{
  return (self->_rangingState & 0xFFFFFFFE) == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LOBYTE(v4) = self->_clientWantsUpdates;
  return (id)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:t ellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:",  self->_discoveryState,  self->_advertisingState,  self->_rangingState,  self->_algorithmOutputFlags,  self->_receivedSignalFlags,  self->_tellClientAboutPeer,  v4,  self->_nbUwbAcquisitionChannelIdx));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIServerFindingPeerTracking *)v4;
    v8 = v7;
    if (v7 == self)
    {
      char v10 = 1;
LABEL_22:

      goto LABEL_23;
    }

    if (self->_nbUwbAcquisitionChannelIdx)
    {
      BOOL v9 = 0;
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingPeerTracking nbUwbAcquisitionChannelIdx](v7, "nbUwbAcquisitionChannelIdx"));
      BOOL v9 = v11 == 0LL;

      if (!self->_nbUwbAcquisitionChannelIdx)
      {
        unsigned __int8 v15 = 0;
LABEL_12:
        int discoveryState = self->_discoveryState;
        if (discoveryState == -[NIServerFindingPeerTracking discoveryState](v8, "discoveryState")
          && (int advertisingState = self->_advertisingState,
              advertisingState == -[NIServerFindingPeerTracking advertisingState](v8, "advertisingState"))
          && (int rangingState = self->_rangingState,
              rangingState == -[NIServerFindingPeerTracking rangingState](v8, "rangingState"))
          && (int algorithmOutputFlags = self->_algorithmOutputFlags,
              algorithmOutputFlags == -[NIServerFindingPeerTracking algorithmOutputFlags](v8, "algorithmOutputFlags"))
          && (int receivedSignalFlags = self->_receivedSignalFlags,
              receivedSignalFlags == -[NIServerFindingPeerTracking receivedSignalFlags](v8, "receivedSignalFlags"))
          && (BOOL tellClientAboutPeer = self->_tellClientAboutPeer,
              tellClientAboutPeer == -[NIServerFindingPeerTracking tellClientAboutPeer](v8, "tellClientAboutPeer")))
        {
          BOOL clientWantsUpdates = self->_clientWantsUpdates;
          if (clientWantsUpdates == -[NIServerFindingPeerTracking clientWantsUpdates](v8, "clientWantsUpdates")) {
            char v10 = v9 | v15;
          }
          else {
            char v10 = 0;
          }
        }

        else
        {
          char v10 = 0;
        }

        goto LABEL_22;
      }
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingPeerTracking nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
    if (v12)
    {
      nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingPeerTracking nbUwbAcquisitionChannelIdx](v8, "nbUwbAcquisitionChannelIdx"));
      unsigned __int8 v15 = -[NSNumber isEqualToNumber:](nbUwbAcquisitionChannelIdx, "isEqualToNumber:", v14);
    }

    else
    {
      unsigned __int8 v15 = 0;
    }

    goto LABEL_12;
  }

  char v10 = 0;
LABEL_23:

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t discoveryState = self->_discoveryState;
  else {
    uint64_t v5 = off_1007B9CA8[discoveryState];
  }
  uint64_t advertisingState = self->_advertisingState;
  else {
    v7 = off_1007B9CD0[advertisingState];
  }
  uint64_t rangingState = self->_rangingState;
  else {
    BOOL v9 = off_1007B9CE8[rangingState];
  }
  uint64_t algorithmOutputFlags = self->_algorithmOutputFlags;
  uint64_t receivedSignalFlags = self->_receivedSignalFlags;
  BOOL tellClientAboutPeer = self->_tellClientAboutPeer;
  BOOL clientWantsUpdates = self->_clientWantsUpdates;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  if (nbUwbAcquisitionChannelIdx)
  {
    std::to_string(&v18, -[NSNumber intValue](nbUwbAcquisitionChannelIdx, "intValue"));
    if ((v18.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      unsigned __int8 v15 = &v18;
    }
    else {
      unsigned __int8 v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    }
  }

  else
  {
    unsigned __int8 v15 = (std::string *)"---";
  }

  id v16 = -[NSMutableString initWithFormat:]( v3,  "initWithFormat:",  @"[ D:%s | A:%s | R:%s | G:%02X | S:%02X | N:%d | U:%d | C:%-3s ]",  v5,  v7,  v9,  algorithmOutputFlags,  receivedSignalFlags,  tellClientAboutPeer,  clientWantsUpdates,  v15);
  return v16;
}

- (int)discoveryState
{
  return self->_discoveryState;
}

- (void)setDiscoveryState:(int)a3
{
  self->_uint64_t discoveryState = a3;
}

- (int)advertisingState
{
  return self->_advertisingState;
}

- (void)setAdvertisingState:(int)a3
{
  self->_uint64_t advertisingState = a3;
}

- (int)rangingState
{
  return self->_rangingState;
}

- (void)setRangingState:(int)a3
{
  self->_uint64_t rangingState = a3;
}

- (unsigned)algorithmOutputFlags
{
  return self->_algorithmOutputFlags;
}

- (void)setAlgorithmOutputFlags:(unsigned __int8)a3
{
  self->_uint64_t algorithmOutputFlags = a3;
}

- (unsigned)receivedSignalFlags
{
  return self->_receivedSignalFlags;
}

- (void)setReceivedSignalFlags:(unsigned __int8)a3
{
  self->_uint64_t receivedSignalFlags = a3;
}

- (BOOL)tellClientAboutPeer
{
  return self->_tellClientAboutPeer;
}

- (void)setTellClientAboutPeer:(BOOL)a3
{
  self->_BOOL tellClientAboutPeer = a3;
}

- (BOOL)clientWantsUpdates
{
  return self->_clientWantsUpdates;
}

- (void)setClientWantsUpdates:(BOOL)a3
{
  self->_BOOL clientWantsUpdates = a3;
}

- (NSNumber)nbUwbAcquisitionChannelIdx
{
  return self->_nbUwbAcquisitionChannelIdx;
}

- (void)setNbUwbAcquisitionChannelIdx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end