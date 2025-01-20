@interface RPNearFieldDataSource
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldDataSource)initWithDispatchQueue:(id)a3;
- (id)_AWDLBonjourTransportServiceMetadata;
- (id)_identityForNFCDeviceDiscovery;
- (id)_requestMessageMetadata;
- (id)_selfIdentity;
- (id)_transportServiceMetadataWithServiceType:(unint64_t)a3;
- (id)createAuthenticationPayloadWithPkData:(id)a3 bonjourListenerUUID:(id)a4;
- (id)createRequestMessageWithApplicationLabel:(id)a3 payload:(id)a4;
- (id)createResponseWithApplicationLabel:(id)a3 payload:(id)a4 forRequestMessage:(id)a5;
- (id)createTapEventWithApplicationLabel:(id)a3 singleBandAWDLModeRequested:(BOOL)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 identity:(id)a7 isUnsupportedApplicationLabel:(BOOL)a8 flags:(unsigned int)a9;
- (id)createValidationPayloadWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4;
@end

@implementation RPNearFieldDataSource

- (RPNearFieldDataSource)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPNearFieldDataSource;
  v6 = -[RPNearFieldDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    sub_10004894C();
  }

  return v7;
}

- (id)createAuthenticationPayloadWithPkData:(id)a3 bonjourListenerUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___RPNearFieldAuthenticationPayload);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _identityForNFCDeviceDiscovery](self, "_identityForNFCDeviceDiscovery"));
  v11 = -[RPNearFieldAuthenticationPayload initWithTimeStamp:pkData:bonjourListenerUUID:selfIdentity:]( v8,  "initWithTimeStamp:pkData:bonjourListenerUUID:selfIdentity:",  v9,  v7,  v6,  v10);

  return v11;
}

- (id)createValidationPayloadWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4
{
  return  -[RPNearFieldValidationPayload initWithKnownIdentity:supportsApplicationLabel:]( objc_alloc(&OBJC_CLASS___RPNearFieldValidationPayload),  "initWithKnownIdentity:supportsApplicationLabel:",  a3,  a4);
}

- (id)createRequestMessageWithApplicationLabel:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 type] == (id)1) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _requestMessageMetadata](self, "_requestMessageMetadata"));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  objc_super v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[RPTransportServiceHandoverMessage messageWithMetadata:applicationLabel:payload:version:]( &OBJC_CLASS___RPTransportServiceHandoverMessage,  "messageWithMetadata:applicationLabel:payload:version:",  v8,  v7,  v6,  @"1.1"));

  return v10;
}

- (id)createResponseWithApplicationLabel:(id)a3 payload:(id)a4 forRequestMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (sub_10004D898((unint64_t)[v9 type]))
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transportServicesMetadata", 0));
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v16) serviceType];
          if (sub_100068728((uint64_t)v17))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearFieldDataSource _transportServiceMetadataWithServiceType:]( self,  "_transportServiceMetadataWithServiceType:",  v17));
            if (v18) {
              -[NSMutableArray addObject:](v11, "addObject:", v18);
            }
          }

          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v14);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[RPTransportServiceHandoverMessage messageWithMetadata:applicationLabel:payload:version:]( &OBJC_CLASS___RPTransportServiceHandoverMessage,  "messageWithMetadata:applicationLabel:payload:version:",  v11,  v8,  v9,  @"1.1"));

  return v19;
}

- (id)createTapEventWithApplicationLabel:(id)a3 singleBandAWDLModeRequested:(BOOL)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 identity:(id)a7 isUnsupportedApplicationLabel:(BOOL)a8 flags:(unsigned int)a9
{
  id v14 = a7;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unsigned int v19 = [v14 type];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 contactID]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v14 accountID]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 idsDeviceID]);
  if (v21)
  {
    if (a4)
    {
LABEL_3:
      BOOL v22 = 1;
      goto LABEL_6;
    }
  }

  else
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);

    if (a4) {
      goto LABEL_3;
    }
  }

  BOOL v22 = sub_10004894C();
LABEL_6:
  HIDWORD(v28) = a9;
  BYTE2(v28) = a8;
  BYTE1(v28) = v14 != 0LL;
  LOBYTE(v28) = v22;
  __int128 v24 = -[RPNearFieldTapEvent initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBandAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:]( objc_alloc(&OBJC_CLASS___RPNearFieldTapEvent),  "initWithIdentifier:applicationLabel:pkData:bonjourListenerUUID:isSameAccount:contactID:accountID:forceSingleBa ndAWDLMode:knownIdentity:isUnsupportedApplicationLabel:flags:",  v21,  v18,  v17,  v16,  v19 == 2,  v20,  v30,  v28);

  if (v19 == 2)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
    -[RPNearFieldTapEvent setDeviceName:](v24, "setDeviceName:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v14 model]);
    -[RPNearFieldTapEvent setDeviceModel:](v24, "setDeviceModel:", v26);
  }

  return v24;
}

- (id)_selfIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identityOfSelfAndReturnError:0]);

  v4 = objc_opt_new(&OBJC_CLASS___RPIdentity);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 edPKData]);
  -[RPIdentity setEdPKData:](v4, "setEdPKData:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 edSKData]);
  -[RPIdentity setEdSKData:](v4, "setEdSKData:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIRKData]);
  -[RPIdentity setDeviceIRKData:](v4, "setDeviceIRKData:", v7);

  return v4;
}

- (id)_identityForNFCDeviceDiscovery
{
  v2 = (RPIdentity *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDataSource _selfIdentity](self, "_selfIdentity"));
  if (!v2)
  {
    if (dword_100131950 <= 60
      && (dword_100131950 != -1 || _LogCategory_Initialize(&dword_100131950, 60LL)))
    {
      LogPrintF( &dword_100131950,  "-[RPNearFieldDataSource _identityForNFCDeviceDiscovery]",  60LL,  "Missing SelfIdentity, creating a temporary one");
    }

    v2 = -[RPIdentity initWithType:](objc_alloc(&OBJC_CLASS___RPIdentity), "initWithType:", 14LL);
    uint64_t v3 = NSRandomData(16LL, 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[RPIdentity setDeviceIRKData:](v2, "setDeviceIRKData:", v4);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localDeviceInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 model]);
  -[RPIdentity setModel:](v2, "setModel:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionPairingIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  -[RPIdentity setIdentifier:](v2, "setIdentifier:", v10);

  return v2;
}

- (id)_transportServiceMetadataWithServiceType:(unint64_t)a3
{
  if (a3 == 1) {
    return (id)objc_claimAutoreleasedReturnValue( -[RPNearFieldDataSource _AWDLBonjourTransportServiceMetadata]( self,  "_AWDLBonjourTransportServiceMetadata",  v3,  v4));
  }
  else {
    return 0LL;
  }
}

- (id)_AWDLBonjourTransportServiceMetadata
{
  return  -[RPAWDLBonjourTransportServiceMetadata initWithSingleBandModeRequired:]( objc_alloc(&OBJC_CLASS___RPAWDLBonjourTransportServiceMetadata),  "initWithSingleBandModeRequired:",  sub_10004894C());
}

- (id)_requestMessageMetadata
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (sub_100068728(1LL))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearFieldDataSource _transportServiceMetadataWithServiceType:]( self,  "_transportServiceMetadataWithServiceType:",  1LL));
    if (v4) {
      -[NSMutableArray addObject:](v3, "addObject:", v4);
    }
  }

  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end