@interface Packet
+ (id)PacketWithRawData:(id)a3;
- (BOOL)isPacketTypeiAPv1;
- (BOOL)isPacketTypeiAPv2;
- (BOOL)isValid;
- (NSData)rawData;
- (Packet)init;
- (Transport)transport;
- (unint64_t)rawLength;
- (void)setIsPacketTypeiAPv1:(BOOL)a3;
- (void)setIsPacketTypeiAPv2:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setRawData:(id)a3;
- (void)setRawLength:(unint64_t)a3;
- (void)setTransport:(id)a3;
@end

@implementation Packet

- (Packet)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___Packet;
  v2 = -[Packet init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[Packet setIsValid:](v2, "setIsValid:", 0LL);
    -[Packet setIsPacketTypeiAPv1:](v3, "setIsPacketTypeiAPv1:", 0LL);
    -[Packet setIsPacketTypeiAPv2:](v3, "setIsPacketTypeiAPv2:", 0LL);
  }

  return v3;
}

+ (id)PacketWithRawData:(id)a3
{
  id v4 = a3;
  objc_super v5 = (PacketIAP1 *)objc_alloc_init((Class)a1);
  -[Packet setRawData:](v5, "setRawData:", v4);
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = v4;
  v7 = (unsigned __int8 *)[v6 bytes];
  -[Packet setRawLength:](v5, "setRawLength:", [v6 length]);
  if (-[Packet rawLength](v5, "rawLength") < 2) {
    goto LABEL_14;
  }
  int v8 = *v7;
  if (v8 == 85) {
    goto LABEL_7;
  }
  if (v8 == 255)
  {
    int v9 = v7[1];
    if (v9 == 90)
    {
      -[Packet setIsPacketTypeiAPv2:](v5, "setIsPacketTypeiAPv2:", 1LL);
      goto LABEL_9;
    }

    if (v9 == 85) {
LABEL_7:
    }
      -[Packet setIsPacketTypeiAPv1:](v5, "setIsPacketTypeiAPv1:", 1LL);
  }

- (BOOL)isPacketTypeiAPv1
{
  return self->_isPacketTypeiAPv1;
}

- (void)setIsPacketTypeiAPv1:(BOOL)a3
{
  self->_isPacketTypeiAPv1 = a3;
}

- (BOOL)isPacketTypeiAPv2
{
  return self->_isPacketTypeiAPv2;
}

- (void)setIsPacketTypeiAPv2:(BOOL)a3
{
  self->_isPacketTypeiAPv2 = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSData)rawData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRawData:(id)a3
{
}

- (unint64_t)rawLength
{
  return self->_rawLength;
}

- (void)setRawLength:(unint64_t)a3
{
  self->_rawLength = a3;
}

- (Transport)transport
{
  return (Transport *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end