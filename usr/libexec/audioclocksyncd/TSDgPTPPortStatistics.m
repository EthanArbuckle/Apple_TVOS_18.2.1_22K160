@interface TSDgPTPPortStatistics
- (NSString)portIdentifier;
- (TSDgPTPPortStatistics)init;
- (TSDgPTPPortStatistics)initWithPort:(id)a3;
- (int)portRole;
- (int)portType;
- (unsigned)allowedLostResponsesExceededCounter;
- (unsigned)announceReceiptTimeoutCounter;
- (unsigned)attemptedAnnounceCounter;
- (unsigned)attemptedDelayRequestCounter;
- (unsigned)attemptedDelayResponseCounter;
- (unsigned)attemptedFollowUpCounter;
- (unsigned)attemptedPDelayRequestCounter;
- (unsigned)attemptedPDelayResponseCounter;
- (unsigned)attemptedPDelayResponseFollowUpCounter;
- (unsigned)attemptedSignalCounter;
- (unsigned)attemptedSyncCounter;
- (unsigned)rawDelayExceededCounter;
- (unsigned)rawDelayMeasurementCounter;
- (unsigned)receivedAnnounceCounter;
- (unsigned)receivedDelayRequestCounter;
- (unsigned)receivedDelayResponseCounter;
- (unsigned)receivedFollowUpCounter;
- (unsigned)receivedPDelayRequestCounter;
- (unsigned)receivedPDelayResponseCounter;
- (unsigned)receivedPDelayResponseFollowUpCounter;
- (unsigned)receivedPacketDiscardCounter;
- (unsigned)receivedSignalCounter;
- (unsigned)receivedSyncCounter;
- (unsigned)supersededDelayCounter;
- (unsigned)supersededSyncCounter;
- (unsigned)syncReceiptTimeoutCounter;
- (unsigned)transmittedAnnounceCounter;
- (unsigned)transmittedDelayRequestCounter;
- (unsigned)transmittedDelayResponseCounter;
- (unsigned)transmittedFollowUpCounter;
- (unsigned)transmittedPDelayRequestCounter;
- (unsigned)transmittedPDelayResponseCounter;
- (unsigned)transmittedPDelayResponseFollowUpCounter;
- (unsigned)transmittedPacketDiscardCounter;
- (unsigned)transmittedSignalCounter;
- (unsigned)transmittedSyncCounter;
@end

@implementation TSDgPTPPortStatistics

- (TSDgPTPPortStatistics)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[TSDgPTPPortStatistics init]"));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Do not call %@",  v3);

  return 0LL;
}

- (TSDgPTPPortStatistics)initWithPort:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS___TSDgPTPPortStatistics;
  v5 = -[TSDgPTPPortStatistics init](&v73, "init");
  if (v5)
  {
    v5->_portType = [v4 portType];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSDgPTPEthernetPort);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = objc_alloc(&OBJC_CLASS___NSString);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
      v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"Ethernet|%@", v8);
      portIdentifier = v5->_portIdentifier;
      v5->_portIdentifier = v9;
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___TSDgPTPUnicastLinkLayerPtPPort);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        v12 = objc_alloc(&OBJC_CLASS___NSString);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
        portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue([v4 destinationAddressString]);
        v13 = -[NSString initWithFormat:](v12, "initWithFormat:", @"LLPtP|%@|%@", v8, portIdentifier);
      }

      else
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___TSDgPTPUnicastUDPv4PtPPort);
        if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0)
        {
          v15 = objc_alloc(&OBJC_CLASS___NSString);
          v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
          portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue([v4 destinationAddressString]);
          v13 = -[NSString initWithFormat:](v15, "initWithFormat:", @"UDPv4PtP|%@|%@", v8, portIdentifier);
        }

        else
        {
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___TSDgPTPUnicastUDPv6PtPPort);
          if ((objc_opt_isKindOfClass(v4, v16) & 1) != 0)
          {
            v17 = objc_alloc(&OBJC_CLASS___NSString);
            v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
            portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue([v4 destinationAddressString]);
            v13 = -[NSString initWithFormat:](v17, "initWithFormat:", @"UDPv6PtP|%@|%@", v8, portIdentifier);
          }

          else
          {
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___TSDgPTPUnicastLinkLayerEtEPort);
            if ((objc_opt_isKindOfClass(v4, v18) & 1) != 0)
            {
              v19 = objc_alloc(&OBJC_CLASS___NSString);
              v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
              portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue([v4 destinationAddressString]);
              v13 = -[NSString initWithFormat:](v19, "initWithFormat:", @"LLEtE|%@|%@", v8, portIdentifier);
            }

            else
            {
              uint64_t v20 = objc_opt_class(&OBJC_CLASS___TSDgPTPUnicastUDPv4EtEPort);
              if ((objc_opt_isKindOfClass(v4, v20) & 1) != 0)
              {
                v21 = objc_alloc(&OBJC_CLASS___NSString);
                v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
                portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue([v4 destinationAddressString]);
                v13 = -[NSString initWithFormat:](v21, "initWithFormat:", @"UDPv4EtE|%@|%@", v8, portIdentifier);
              }

              else
              {
                uint64_t v22 = objc_opt_class(&OBJC_CLASS___TSDgPTPUnicastUDPv6EtEPort);
                if ((objc_opt_isKindOfClass(v4, v22) & 1) == 0) {
                  goto LABEL_18;
                }
                v23 = objc_alloc(&OBJC_CLASS___NSString);
                v8 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
                portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue([v4 destinationAddressString]);
                v13 = -[NSString initWithFormat:](v23, "initWithFormat:", @"UDPv6EtE|%@|%@", v8, portIdentifier);
              }
            }
          }
        }
      }

      v24 = v5->_portIdentifier;
      v5->_portIdentifier = v13;
    }

LABEL_18:
    v5->_portRole = [v4 portRole];
    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 iodProperties]);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ReceivedSyncCounter"]);
      v5->_receivedSyncCounter = [v27 unsignedIntValue];

      v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ReceivedFollowUpCounter"]);
      v5->_receivedFollowUpCounter = [v28 unsignedIntValue];

      v29 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ReceivedAnnounceCounter"]);
      v5->_receivedAnnounceCounter = [v29 unsignedIntValue];

      v30 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ReceivedSignalCounter"]);
      v5->_receivedSignalCounter = [v30 unsignedIntValue];

      v5->_receivedPacketDiscardCounter = 0;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"SyncReceiptTimeoutCounter"]);
      v5->_syncReceiptTimeoutCounter = [v31 unsignedIntValue];

      v32 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"AnnounceReceiptTimeoutCounter"]);
      v5->_announceReceiptTimeoutCounter = [v32 unsignedIntValue];

      v33 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"AllowedLostResponsesExceededCounter"]);
      v5->_allowedLostResponsesExceededCounter = [v33 unsignedIntValue];

      v34 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"TransmittedSyncCounter"]);
      v5->_transmittedSyncCounter = [v34 unsignedIntValue];

      v35 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"TransmittedFollowUpCounter"]);
      v5->_transmittedFollowUpCounter = [v35 unsignedIntValue];

      v36 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"TransmittedAnnounceCounter"]);
      v5->_transmittedAnnounceCounter = [v36 unsignedIntValue];

      v37 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"TransmittedSignalCounter"]);
      v5->_transmittedSignalCounter = [v37 unsignedIntValue];

      v38 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"TransmittedPacketDiscardCounter"]);
      v5->_transmittedPacketDiscardCounter = [v38 unsignedIntValue];

      v39 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"AttemptedSyncCounter"]);
      v5->_attemptedSyncCounter = [v39 unsignedIntValue];

      v40 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"AttemptedFollowUpCounter"]);
      v5->_attemptedFollowUpCounter = [v40 unsignedIntValue];

      v41 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"AttemptedAnnounceCounter"]);
      v5->_attemptedAnnounceCounter = [v41 unsignedIntValue];

      v42 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"AttemptedSignalCounter"]);
      v5->_attemptedSignalCounter = [v42 unsignedIntValue];

      v43 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"RawDelayExceededCounter"]);
      v5->_rawDelayExceededCounter = [v43 unsignedIntValue];

      v44 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"RawDelayMeasurementCounter"]);
      v5->_rawDelayMeasurementCounter = [v44 unsignedIntValue];

      uint64_t v45 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDPtPPort);
      if ((objc_opt_isKindOfClass(v4, v45) & 1) != 0)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"ReceivedPDelayRequestCounter"]);
        v5->_receivedPDelayRequestCounter = [v46 unsignedIntValue];

        v71 = @"ReceivedPDelayResponseCounter";
        v72 = @"ReceivedPDelayResponseFollowUpCounter";
        v47 = @"AttemptedPDelayResponseCounter";
        v48 = @"TransmittedPDelayResponseFollowUpCounter";
        v69 = @"AttemptedPDelayRequestCounter";
        uint64_t v70 = 124LL;
        v67 = @"TransmittedPDelayRequestCounter";
        uint64_t v68 = 15LL;
        v65 = @"AttemptedPDelayResponseFollowUpCounter";
        uint64_t v66 = 116LL;
        uint64_t v64 = 14LL;
        uint64_t v49 = 108LL;
        uint64_t v50 = 13LL;
        uint64_t v51 = 100LL;
        uint64_t v52 = 12LL;
        v53 = @"TransmittedPDelayResponseCounter";
LABEL_23:
        v55 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v53]);
        LODWORD((&v5->super.isa)[v52]) = [v55 unsignedIntValue];

        v56 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v48]);
        *(_DWORD *)((char *)&v5->super.isa + v51) = [v56 unsignedIntValue];

        v57 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v47]);
        LODWORD((&v5->super.isa)[v50]) = [v57 unsignedIntValue];

        v58 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v65]);
        *(_DWORD *)((char *)&v5->super.isa + v49) = [v58 unsignedIntValue];

        v59 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v67]);
        LODWORD((&v5->super.isa)[v64]) = [v59 unsignedIntValue];

        v60 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v69]);
        *(_DWORD *)((char *)&v5->super.isa + v66) = [v60 unsignedIntValue];

        v61 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v71]);
        LODWORD((&v5->super.isa)[v68]) = [v61 unsignedIntValue];

        v62 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v72]);
        *(_DWORD *)((char *)&v5->super.isa + v70) = [v62 unsignedIntValue];

        goto LABEL_24;
      }

      uint64_t v54 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDEtEPort);
      if ((objc_opt_isKindOfClass(v4, v54) & 1) != 0)
      {
        v71 = @"SupersededSyncCounter";
        v72 = @"SupersededDelayCounter";
        v47 = @"AttemptedDelayResponseCounter";
        v48 = @"TransmittedDelayResponseCounter";
        v69 = @"ReceivedDelayResponseCounter";
        uint64_t v70 = 156LL;
        v67 = @"AttemptedDelayRequestCounter";
        uint64_t v68 = 19LL;
        v65 = @"TransmittedDelayRequestCounter";
        uint64_t v66 = 148LL;
        uint64_t v64 = 18LL;
        uint64_t v49 = 140LL;
        uint64_t v50 = 17LL;
        uint64_t v51 = 132LL;
        uint64_t v52 = 16LL;
        v53 = @"ReceivedDelayRequestCounter";
        goto LABEL_23;
      }
    }

- (NSString)portIdentifier
{
  return self->_portIdentifier;
}

- (int)portType
{
  return self->_portType;
}

- (int)portRole
{
  return self->_portRole;
}

- (unsigned)receivedSyncCounter
{
  return self->_receivedSyncCounter;
}

- (unsigned)receivedFollowUpCounter
{
  return self->_receivedFollowUpCounter;
}

- (unsigned)receivedAnnounceCounter
{
  return self->_receivedAnnounceCounter;
}

- (unsigned)receivedSignalCounter
{
  return self->_receivedSignalCounter;
}

- (unsigned)receivedPacketDiscardCounter
{
  return self->_receivedPacketDiscardCounter;
}

- (unsigned)syncReceiptTimeoutCounter
{
  return self->_syncReceiptTimeoutCounter;
}

- (unsigned)announceReceiptTimeoutCounter
{
  return self->_announceReceiptTimeoutCounter;
}

- (unsigned)allowedLostResponsesExceededCounter
{
  return self->_allowedLostResponsesExceededCounter;
}

- (unsigned)transmittedSyncCounter
{
  return self->_transmittedSyncCounter;
}

- (unsigned)transmittedFollowUpCounter
{
  return self->_transmittedFollowUpCounter;
}

- (unsigned)transmittedAnnounceCounter
{
  return self->_transmittedAnnounceCounter;
}

- (unsigned)transmittedSignalCounter
{
  return self->_transmittedSignalCounter;
}

- (unsigned)transmittedPacketDiscardCounter
{
  return self->_transmittedPacketDiscardCounter;
}

- (unsigned)attemptedSyncCounter
{
  return self->_attemptedSyncCounter;
}

- (unsigned)attemptedFollowUpCounter
{
  return self->_attemptedFollowUpCounter;
}

- (unsigned)attemptedAnnounceCounter
{
  return self->_attemptedAnnounceCounter;
}

- (unsigned)attemptedSignalCounter
{
  return self->_attemptedSignalCounter;
}

- (unsigned)rawDelayExceededCounter
{
  return self->_rawDelayExceededCounter;
}

- (unsigned)rawDelayMeasurementCounter
{
  return self->_rawDelayMeasurementCounter;
}

- (unsigned)receivedPDelayRequestCounter
{
  return self->_receivedPDelayRequestCounter;
}

- (unsigned)transmittedPDelayResponseCounter
{
  return self->_transmittedPDelayResponseCounter;
}

- (unsigned)transmittedPDelayResponseFollowUpCounter
{
  return self->_transmittedPDelayResponseFollowUpCounter;
}

- (unsigned)attemptedPDelayResponseCounter
{
  return self->_attemptedPDelayResponseCounter;
}

- (unsigned)attemptedPDelayResponseFollowUpCounter
{
  return self->_attemptedPDelayResponseFollowUpCounter;
}

- (unsigned)transmittedPDelayRequestCounter
{
  return self->_transmittedPDelayRequestCounter;
}

- (unsigned)attemptedPDelayRequestCounter
{
  return self->_attemptedPDelayRequestCounter;
}

- (unsigned)receivedPDelayResponseCounter
{
  return self->_receivedPDelayResponseCounter;
}

- (unsigned)receivedPDelayResponseFollowUpCounter
{
  return self->_receivedPDelayResponseFollowUpCounter;
}

- (unsigned)receivedDelayRequestCounter
{
  return self->_receivedDelayRequestCounter;
}

- (unsigned)transmittedDelayResponseCounter
{
  return self->_transmittedDelayResponseCounter;
}

- (unsigned)attemptedDelayResponseCounter
{
  return self->_attemptedDelayResponseCounter;
}

- (unsigned)transmittedDelayRequestCounter
{
  return self->_transmittedDelayRequestCounter;
}

- (unsigned)attemptedDelayRequestCounter
{
  return self->_attemptedDelayRequestCounter;
}

- (unsigned)receivedDelayResponseCounter
{
  return self->_receivedDelayResponseCounter;
}

- (unsigned)supersededSyncCounter
{
  return self->_supersededSyncCounter;
}

- (unsigned)supersededDelayCounter
{
  return self->_supersededDelayCounter;
}

- (void).cxx_destruct
{
}

@end