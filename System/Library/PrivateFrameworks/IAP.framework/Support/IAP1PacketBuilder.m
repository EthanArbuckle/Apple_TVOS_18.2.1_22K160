@interface IAP1PacketBuilder
+ (id)ackAccessoryAuthenticationInformationForPacket:(id)a3 status:(unsigned __int8)a4;
+ (id)ackFIDTokenValuesResponseForPacket:(id)a3 withFIDTokens:(id)a4;
+ (id)checksumForRawData:(id)a3;
+ (id)getAccessoryAuthenticationInfoPacket;
+ (id)headerWithLength:(unsigned __int8)a3 lingoID:(unsigned __int8)a4 commandID:(unsigned __int8)a5 transactionID:(unsigned __int16)a6;
+ (id)iPodAckPacketResponseForPacket:(id)a3 status:(unsigned __int8)a4;
+ (id)retIDPSStatusForPacket:(id)a3;
+ (id)retTransportMaxPayloadSizeResponseForPacket:(id)a3;
+ (id)retUHPMLimitCurrentLimitResponseForPacket:(id)a3;
+ (id)retiPodOptionsForLingoPacketResponseForPacket:(id)a3;
+ (unsigned)generateTransactionID;
+ (void)enableUSBHostModeAndUHPMForTransport:(id)a3;
+ (void)notifyUSBModeDeviceForTransport:(id)a3;
+ (void)notifyUSBModeHostForTransport:(id)a3;
@end

@implementation IAP1PacketBuilder

+ (id)iPodAckPacketResponseForPacket:(id)a3 status:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  6,  0,  2,  objc_msgSend(v6, "transactionID")));
  v12[0] = a4;
  unsigned __int8 v8 = [v6 commandID];

  v12[1] = v8;
  [v7 appendBytes:v12 length:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v7]);
  [v7 appendData:v9];

  v10 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v7);
  return v10;
}

+ (id)retiPodOptionsForLingoPacketResponseForPacket:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  13,  0,  76,  objc_msgSend(v4, "transactionID")));
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 commandPayload]);

  id v7 = v6;
  int v8 = *(unsigned __int8 *)[v7 bytes];

  char v12 = v8;
  if (v8)
  {
    if (v8 == 6)
    {
      *(_DWORD *)((char *)&v13 + 3) = 0;
      LODWORD(v13) = 0;
      HIBYTE(v13) = 3;
    }

    else
    {
      unint64_t v13 = 0LL;
    }
  }

  else
  {
    unint64_t v13 = 0xFFF3EF3D02000000LL;
  }

  [v5 appendBytes:&v12 length:9];
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v5]);
  [v5 appendData:v9];

  v10 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v5);
  return v10;
}

+ (id)retTransportMaxPayloadSizeResponseForPacket:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  6,  0,  18,  objc_msgSend(a3, "transactionID")));
  __int16 v8 = bswap32(0x1FAu) >> 16;
  [v4 appendBytes:&v8 length:2];
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v4]);
  [v4 appendData:v5];

  id v6 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v4);
  return v6;
}

+ (id)retUHPMLimitCurrentLimitResponseForPacket:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  6,  0,  91,  objc_msgSend(v4, "transactionID")));
  io_iterator_t existing = -1431655766;
  id v6 = IOServiceMatching("IOAccessoryManager");
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing);
  if ((_DWORD)MatchingServices)
  {
    NSLog( @"ERROR - %s:%s - %d IOServiceGetMatchingServices failed 0x%x",  "/Library/Caches/com.apple.xbs/Sources/iapmd/iapmd/IAP1PacketBuilder.m",  "+[IAP1PacketBuilder retUHPMLimitCurrentLimitResponseForPacket:]",  189LL,  MatchingServices);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v9 = IOIteratorNext(existing);
    if ((_DWORD)v9)
    {
      uint64_t v10 = v9;
      uint64_t v8 = 0LL;
      do
      {
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort(v10);
        char v12 = (void *)objc_claimAutoreleasedReturnValue([v4 transport]);
        id v13 = [v12 portNumber];

        IOObjectRelease(v10);
        uint64_t v10 = IOIteratorNext(existing);
      }

      while ((_DWORD)v10);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    IOObjectRelease(existing);
  }

  if (v8) {
    char v14 = 8;
  }
  else {
    char v14 = 1;
  }
  if (v8) {
    char v15 = 52;
  }
  else {
    char v15 = -12;
  }
  v19[0] = v14;
  v19[1] = v15;
  [v5 appendBytes:v19 length:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v5]);
  [v5 appendData:v16];

  v17 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v5);
  return v17;
}

+ (id)ackFIDTokenValuesResponseForPacket:(id)a3 withFIDTokens:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 responsePayload]);
  unsigned __int8 v8 = [v7 length] + 4;
  id v9 = [v6 transactionID];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 headerWithLength:v8 lingoID:0 commandID:58 transactionID:v9]);
  [v10 appendData:v7];
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v10]);
  [v10 appendData:v11];

  char v12 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v10);
  return v12;
}

+ (id)retIDPSStatusForPacket:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  5,  0,  60,  objc_msgSend(a3, "transactionID")));
  char v8 = 0;
  [v4 appendBytes:&v8 length:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v4]);
  [v4 appendData:v5];

  id v6 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v4);
  return v6;
}

+ (id)getAccessoryAuthenticationInfoPacket
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  4,  0,  20,  objc_msgSend(a1, "generateTransactionID")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v3]);
  [v3 appendData:v4];

  v5 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v3);
  return v5;
}

+ (id)ackAccessoryAuthenticationInformationForPacket:(id)a3 status:(unsigned __int8)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  5,  0,  22,  objc_msgSend(a3, "transactionID")));
  unsigned __int8 v10 = a4;
  [v6 appendBytes:&v10 length:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v6]);
  [v6 appendData:v7];

  char v8 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v6);
  return v8;
}

+ (void)notifyUSBModeDeviceForTransport:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  5,  6,  4,  objc_msgSend(a1, "generateTransactionID")));
  char v8 = 1;
  [v5 appendBytes:&v8 length:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v5]);
  [v5 appendData:v6];

  id v7 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v5);
  -[PacketIAP1 sendOnTransport:](v7, "sendOnTransport:", v4);
}

+ (void)notifyUSBModeHostForTransport:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "headerWithLength:lingoID:commandID:transactionID:",  5,  6,  4,  objc_msgSend(a1, "generateTransactionID")));
  char v8 = 2;
  [v5 appendBytes:&v8 length:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 checksumForRawData:v5]);
  [v5 appendData:v6];

  id v7 = -[PacketIAP1 initWithRawData:](objc_alloc(&OBJC_CLASS___PacketIAP1), "initWithRawData:", v5);
  -[PacketIAP1 sendOnTransport:](v7, "sendOnTransport:", v4);
}

+ (unsigned)generateTransactionID
{
  unsigned __int16 v2 = word_100022260++;
  pthread_mutex_unlock(&stru_100022220);
  return v2;
}

+ (id)headerWithLength:(unsigned __int8)a3 lingoID:(unsigned __int8)a4 commandID:(unsigned __int8)a5 transactionID:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  unsigned __int8 v12 = a3;
  unsigned __int8 v11 = a4;
  unsigned __int8 v10 = a5;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", "\xFFU", 2LL);
  -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", &v12, 1LL);
  -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", &v11, 1LL);
  -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", &v10, 1LL);
  __int16 v9 = __rev16(v6);
  -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", &v9, 1LL);
  -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", (char *)&v9 + 1, 1LL);
  return v7;
}

+ (id)checksumForRawData:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bytes];
  if ((unint64_t)[v3 length] < 3)
  {
    char v5 = 0;
  }

  else
  {
    char v5 = 0;
    unint64_t v6 = 2LL;
    do
      v5 += v4[v6++];
    while (v6 < (unint64_t)[v3 length]);
  }

  char v9 = -v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v9, 1LL));

  return v7;
}

+ (void)enableUSBHostModeAndUHPMForTransport:(id)a3
{
  id v3 = a3;
  ServiceWithint PrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort([v3 portNumber]);
  if (!ServiceWithPrimaryPort) {
    fprintf(__stderrp, "could not find IOAccessoryManager service for port %llu\n", [v3 portNumber]);
  }
  io_connect_t connect = -1431655766;
  mach_error_t v5 = IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect);
  if (v5)
  {
    unsigned __int8 v12 = __stderrp;
    id v13 = mach_error_string(v5);
    fprintf(v12, "could not open IOAccessoryManager service: %s\n", v13);
    exit(1);
  }

  mach_error_t v6 = IOAccessoryManagerConfigureUSBMode(connect, 2LL);
  if (v6)
  {
    id v7 = __stderrp;
    char v8 = mach_error_string(v6);
    fprintf(v7, "could not configure USB mode: %s\n", v8);
  }

  else
  {
    NSLog(@"Operating in USB Host Mode");
  }

  mach_error_t v9 = IOAccessoryManagerConfigurePower(connect, 4LL);
  if (v9)
  {
    unsigned __int8 v10 = __stderrp;
    unsigned __int8 v11 = mach_error_string(v9);
    fprintf(v10, "could not configure high current mode: %s\n", v11);
  }

  else
  {
    NSLog(@"Enabled High Current Mode");
  }

  IOServiceClose(connect);
  IOObjectRelease(ServiceWithPrimaryPort);
}

@end