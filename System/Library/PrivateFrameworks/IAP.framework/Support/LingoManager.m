@interface LingoManager
+ (void)handlePacket:(id)a3;
@end

@implementation LingoManager

+ (void)handlePacket:(id)a3
{
  id v21 = a3;
  if ([v21 isValid])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
    NSLog(@"Received Packet: %@", v3);

    if ([v21 lingoID])
    {
      if ([v21 lingoID] == 6)
      {
        if ([v21 commandID] == 131)
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder iPodAckPacketResponseForPacket:status:]( &OBJC_CLASS___IAP1PacketBuilder,  "iPodAckPacketResponseForPacket:status:",  v21,  0LL));
          [v21 respondWithPacket:v5];

          v6 = (void *)objc_claimAutoreleasedReturnValue([v21 transport]);
          +[IAP1PacketBuilder notifyUSBModeDeviceForTransport:]( &OBJC_CLASS___IAP1PacketBuilder,  "notifyUSBModeDeviceForTransport:",  v6);

          v7 = (void *)objc_claimAutoreleasedReturnValue([v21 transport]);
          +[IAP1PacketBuilder enableUSBHostModeAndUHPMForTransport:]( &OBJC_CLASS___IAP1PacketBuilder,  "enableUSBHostModeAndUHPMForTransport:",  v7);

          v8 = (void *)objc_claimAutoreleasedReturnValue([v21 transport]);
          +[IAP1PacketBuilder notifyUSBModeHostForTransport:]( &OBJC_CLASS___IAP1PacketBuilder,  "notifyUSBModeHostForTransport:",  v8);
        }

        else if ([v21 commandID])
        {
          NSLog(@"Error: Unhandled USB Host Control Lingo Command... %@", v21);
        }
      }

      else
      {
        NSLog(@"Error: Unhandled Packet... %@", v21);
      }
    }

    else
    {
      if ([v21 commandID] == 56)
      {
LABEL_4:
        uint64_t v4 = objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder iPodAckPacketResponseForPacket:status:]( &OBJC_CLASS___IAP1PacketBuilder,  "iPodAckPacketResponseForPacket:status:",  v21,  0LL));
LABEL_17:
        v9 = (FIDTokens *)v4;
        [v21 respondWithPacket:v4];
LABEL_18:

        goto LABEL_19;
      }

      if ([v21 commandID] == 75)
      {
        uint64_t v4 = objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder retiPodOptionsForLingoPacketResponseForPacket:]( &OBJC_CLASS___IAP1PacketBuilder,  "retiPodOptionsForLingoPacketResponseForPacket:",  v21));
        goto LABEL_17;
      }

      if ([v21 commandID] == 17)
      {
        uint64_t v4 = objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder retTransportMaxPayloadSizeResponseForPacket:]( &OBJC_CLASS___IAP1PacketBuilder,  "retTransportMaxPayloadSizeResponseForPacket:",  v21));
        goto LABEL_17;
      }

      if ([v21 commandID] == 90)
      {
        uint64_t v4 = objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder retUHPMLimitCurrentLimitResponseForPacket:]( &OBJC_CLASS___IAP1PacketBuilder,  "retUHPMLimitCurrentLimitResponseForPacket:",  v21));
        goto LABEL_17;
      }

      if ([v21 commandID] == 57)
      {
        v10 = objc_alloc(&OBJC_CLASS___FIDTokens);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v21 commandPayload]);
        v9 = -[FIDTokens initWithData:](v10, "initWithData:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder ackFIDTokenValuesResponseForPacket:withFIDTokens:]( &OBJC_CLASS___IAP1PacketBuilder,  "ackFIDTokenValuesResponseForPacket:withFIDTokens:",  v21,  v9));
        [v21 respondWithPacket:v12];
        goto LABEL_24;
      }

      if ([v21 commandID] == 59)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder retIDPSStatusForPacket:]( &OBJC_CLASS___IAP1PacketBuilder,  "retIDPSStatusForPacket:",  v21));
        [v21 respondWithPacket:v13];

        v9 = (FIDTokens *)objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder getAccessoryAuthenticationInfoPacket]( &OBJC_CLASS___IAP1PacketBuilder,  "getAccessoryAuthenticationInfoPacket"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v21 transport]);
        -[FIDTokens sendOnTransport:](v9, "sendOnTransport:", v12);
        goto LABEL_24;
      }

      if ([v21 commandID] != 71 && objc_msgSend(v21, "commandID") != 72)
      {
        if ([v21 commandID] != 21)
        {
          NSLog(@"Error: Unhandled General Lingo Command... %@", v21);
          goto LABEL_19;
        }

        id v14 = objc_claimAutoreleasedReturnValue([v21 packetBuffer]);
        int v15 = *((unsigned __int8 *)[v14 bytes] + 9);
        id v16 = objc_claimAutoreleasedReturnValue([v21 packetBuffer]);
        int v17 = *((unsigned __int8 *)[v16 bytes] + 10);

        if (v15 != v17) {
          goto LABEL_4;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[IAP1PacketBuilder ackAccessoryAuthenticationInformationForPacket:status:]( &OBJC_CLASS___IAP1PacketBuilder,  "ackAccessoryAuthenticationInformationForPacket:status:",  v21,  0LL));
        [v21 respondWithPacket:v18];

        v9 = (FIDTokens *)xpc_dictionary_create(0LL, 0LL, 0LL);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v21 transport]);
        xpc_dictionary_set_uint64(v9, "portID", (uint64_t)[v19 portID]);

        xpc_dictionary_set_string(v9, "requestType", "handleAuthenticationPassed");
        v12 = (void *)objc_claimAutoreleasedReturnValue([v21 transport]);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "xpc_connection"));
        [v20 sendSynchronousMessage:v9 withReply:0];

LABEL_24:
        goto LABEL_18;
      }
    }
  }

@end