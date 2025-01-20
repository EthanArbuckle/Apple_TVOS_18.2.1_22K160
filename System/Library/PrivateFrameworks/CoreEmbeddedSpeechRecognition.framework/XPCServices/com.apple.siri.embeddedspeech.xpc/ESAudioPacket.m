@interface ESAudioPacket
- (ESAudioPacket)initWithData:(id)a3 packetTimestamps:(id)a4;
- (ESAudioPacketTimestamps)packetTimestamps;
- (NSData)data;
- (void)setData:(id)a3;
- (void)setPacketTimestamps:(id)a3;
@end

@implementation ESAudioPacket

- (ESAudioPacket)initWithData:(id)a3 packetTimestamps:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ESAudioPacket;
  v9 = -[ESAudioPacket init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_packetTimestamps, a4);
  }

  return v10;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (ESAudioPacketTimestamps)packetTimestamps
{
  return self->_packetTimestamps;
}

- (void)setPacketTimestamps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end