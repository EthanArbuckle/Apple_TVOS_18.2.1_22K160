@interface PacketIAP1
- (NSMutableData)packetBuffer;
- (PacketIAP1)initWithPacket:(id)a3;
- (PacketIAP1)initWithRawData:(id)a3;
- (id)commandPayload;
- (id)description;
- (unsigned)checksum;
- (unsigned)commandID;
- (unsigned)length;
- (unsigned)lingoID;
- (unsigned)transactionID;
- (void)respondWithPacket:(id)a3;
- (void)sendOnTransport:(id)a3;
- (void)setPacketBuffer:(id)a3;
- (void)validatePacket;
@end

@implementation PacketIAP1

- (PacketIAP1)initWithPacket:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PacketIAP1;
  v5 = -[Packet init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[Packet setIsPacketTypeiAPv1:](v5, "setIsPacketTypeiAPv1:", 1LL);
    v7 = objc_alloc(&OBJC_CLASS___NSMutableData);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 rawData]);
    v9 = -[NSMutableData initWithData:](v7, "initWithData:", v8);
    packetBuffer = v6->_packetBuffer;
    v6->_packetBuffer = v9;

    -[Packet setIsValid:](v6, "setIsValid:", 0LL);
    -[PacketIAP1 validatePacket](v6, "validatePacket");
  }

  return v6;
}

- (PacketIAP1)initWithRawData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PacketIAP1;
  v5 = -[Packet init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[Packet setIsPacketTypeiAPv1:](v5, "setIsPacketTypeiAPv1:", 1LL);
    v7 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v4);
    packetBuffer = v6->_packetBuffer;
    v6->_packetBuffer = v7;

    -[Packet setIsValid:](v6, "setIsValid:", 0LL);
    -[PacketIAP1 validatePacket](v6, "validatePacket");
  }

  return v6;
}

- (void)validatePacket
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  id v4 = [v3 length];

  if ((unint64_t)v4 >= 7)
  {
    id v5 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
    v6 = (unsigned __int8 *)[v5 bytes];

    int v7 = *v6;
    if (v7 == 85)
    {
      unint64_t v9 = 1LL;
      int v8 = 1;
    }

    else
    {
      if (v7 != 255 || v6[1] != 85) {
        return;
      }
      int v8 = 0;
      unint64_t v9 = 2LL;
    }

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
    id v11 = [v10 length];

    if ((unint64_t)v11 > v9)
    {
      uint64_t v12 = v6[v9];
      if ((v12 - 253) >= 3 && v12 >= 2)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
        id v15 = [v14 length];

        if ((unint64_t)v15 > v9)
        {
          unint64_t v16 = v9 + 2;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
          id v18 = [v17 length];

          if ((unint64_t)v18 >= v9 + 2)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
            id v20 = [v19 length];

            if ((unint64_t)v20 >= (v9 | 4))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
              id v22 = [v21 length];

              if ((unint64_t)v22 > v9 + 1 + v12)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                v24 = (char *)[v23 length] - 2;

                if ((char *)(v9 + v12) == v24)
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                  id v26 = [v25 length];

                  char v27 = 0;
                  do
                  {
                    v27 += v6[v9++];
                    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                    id v29 = [v28 length];
                  }

                  while (v9 < (unint64_t)v29);
                  if (!v27)
                  {
LABEL_22:
                    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                    id v31 = [v30 length];

                    if ((id)(v16 + v12) == v31)
                    {
                      if (v8)
                      {
                        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                        v33 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                        id v34 = [v33 length];
                        id v35 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                        objc_msgSend(v32, "replaceBytesInRange:withBytes:", 1, v34, objc_msgSend(v35, "bytes"));

                        v36 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
                        objc_msgSend(v36, "replaceBytesInRange:withBytes:", 0, 1, "\xFF");
                      }

                      -[Packet setIsValid:](self, "setIsValid:", 1LL);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

- (id)description
{
  unsigned int v3 = -[PacketIAP1 lingoID](self, "lingoID");
  unsigned int v4 = -[PacketIAP1 commandID](self, "commandID");
  unsigned int v5 = -[PacketIAP1 transactionID](self, "transactionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 commandPayload](self, "commandPayload"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iAPv1 Packet { LingoID: %hhx, CommandID: %hhx, TransactionID: %hx, Payload: %@}",  v3,  v4,  v5,  v6));

  return v7;
}

- (void)sendOnTransport:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  [v4 _sendData:v5];
}

- (void)respondWithPacket:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[Packet transport](self, "transport"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 packetBuffer]);

  [v6 _sendData:v5];
}

- (unsigned)length
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  id v4 = [v3 length];

  id v6 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  unsigned __int8 v5 = *((_BYTE *)[v6 bytes] + 2);

  return v5;
}

- (unsigned)lingoID
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  id v4 = [v3 length];

  id v6 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  unsigned __int8 v5 = *((_BYTE *)[v6 bytes] + 3);

  return v5;
}

- (unsigned)commandID
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  id v4 = [v3 length];

  id v6 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  unsigned __int8 v5 = *((_BYTE *)[v6 bytes] + 4);

  return v5;
}

- (unsigned)transactionID
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  id v4 = [v3 length];

  id v6 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  __int16 v7 = *((unsigned __int8 *)[v6 bytes] + 5);

  id v8 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  unsigned __int16 v5 = *((unsigned __int8 *)[v8 bytes] + 6) | (unsigned __int16)(v7 << 8);

  return v5;
}

- (unsigned)checksum
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  id v4 = [v3 length];
  uint64_t v5 = -[PacketIAP1 length](self, "length") + 4LL;

  if (v4 != (id)v5) {
    return 0;
  }
  id v6 = objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  __int16 v7 = [v6 bytes];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  unsigned __int8 v9 = v7[(void)[v8 length] - 1];

  return v9;
}

- (id)commandPayload
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
  id v4 = [v3 length];
  uint64_t v5 = -[PacketIAP1 length](self, "length") + 4LL;

  if (v4 == (id)v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(-[PacketIAP1 packetBuffer](self, "packetBuffer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 7, (char *)objc_msgSend(v7, "length") - 8));
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (NSMutableData)packetBuffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPacketBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end