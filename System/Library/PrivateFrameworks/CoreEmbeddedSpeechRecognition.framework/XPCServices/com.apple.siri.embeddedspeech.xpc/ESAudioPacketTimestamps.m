@interface ESAudioPacketTimestamps
- (ESAudioPacketTimestamps)initWithPacketRecordedTimeInTicks:(id)a3 packetReadyUpstreamTimeInTicks:(id)a4 packetReceivedTime:(double)a5 packetReceivedTimeInTicks:(id)a6;
- (NSNumber)packetReadyUpstreamTimeInTicks;
- (NSNumber)packetReceivedTimeInTicks;
- (NSNumber)packetRecordedTimeInTicks;
- (double)cumulativeAudioDuration;
- (double)packetReceivedTime;
- (id)description;
- (void)setCumulativeAudioDuration:(double)a3;
- (void)setPacketReadyUpstreamTimeInTicks:(id)a3;
- (void)setPacketReceivedTime:(double)a3;
- (void)setPacketReceivedTimeInTicks:(id)a3;
- (void)setPacketRecordedTimeInTicks:(id)a3;
@end

@implementation ESAudioPacketTimestamps

- (ESAudioPacketTimestamps)initWithPacketRecordedTimeInTicks:(id)a3 packetReadyUpstreamTimeInTicks:(id)a4 packetReceivedTime:(double)a5 packetReceivedTimeInTicks:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ESAudioPacketTimestamps;
  v14 = -[ESAudioPacketTimestamps init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_packetRecordedTimeInTicks, a3);
    objc_storeStrong((id *)&v15->_packetReadyUpstreamTimeInTicks, a4);
    v15->_packetReceivedTime = a5;
    objc_storeStrong((id *)&v15->_packetReceivedTimeInTicks, a6);
  }

  return v15;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self->_packetRecordedTimeInTicks, "stringValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self->_packetReadyUpstreamTimeInTicks, "stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self->_packetReceivedTimeInTicks, "stringValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Audio packet timestamps in ticks: recorded %@, ready upstream %@, received %@; cumulative duration (sec): %f",
                   v3,
                   v4,
                   v5,
                   *(void *)&self->_cumulativeAudioDuration));

  return v6;
}

- (NSNumber)packetRecordedTimeInTicks
{
  return self->_packetRecordedTimeInTicks;
}

- (void)setPacketRecordedTimeInTicks:(id)a3
{
}

- (NSNumber)packetReadyUpstreamTimeInTicks
{
  return self->_packetReadyUpstreamTimeInTicks;
}

- (void)setPacketReadyUpstreamTimeInTicks:(id)a3
{
}

- (double)packetReceivedTime
{
  return self->_packetReceivedTime;
}

- (void)setPacketReceivedTime:(double)a3
{
  self->_packetReceivedTime = a3;
}

- (NSNumber)packetReceivedTimeInTicks
{
  return self->_packetReceivedTimeInTicks;
}

- (void)setPacketReceivedTimeInTicks:(id)a3
{
}

- (double)cumulativeAudioDuration
{
  return self->_cumulativeAudioDuration;
}

- (void)setCumulativeAudioDuration:(double)a3
{
  self->_cumulativeAudioDuration = a3;
}

- (void).cxx_destruct
{
}

@end