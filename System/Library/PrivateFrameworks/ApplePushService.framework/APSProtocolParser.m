@interface APSProtocolParser
- (APNSPackDecoder)decoderWrapper;
- (APNSPackEncoder)encoderWrapper;
- (APSProtocolParser)init;
- (APSProtocolParserDelegate)delegate;
- (BOOL)_parseSerialMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6;
- (BOOL)isPackedFormat;
- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6;
- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 activeInterval:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 redirectCount:(unsigned __int8)a11 tcpHandshakeTimeMilliseconds:(double)a12 dnsResolveTimeMilliseconds:(double)a13 tlsHandshakeTimeMilliseconds:(double)a14 consecutiveConnectionFailureReason:(id)a15 lastConnected:(id)a16 disconnectReason:(unsigned int)a17;
- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 presenceFlags:(unsigned int)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12 redirectCount:(unsigned __int8)a13 tcpHandshakeTimeMilliseconds:(double)a14 dnsResolveTimeMilliseconds:(double)a15 tlsHandshakeTimeMilliseconds:(double)a16 consecutiveConnectionFailureReason:(id)a17 lastConnected:(id)a18 disconnectReason:(unsigned int)a19;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 hostCertificateInfo:(id)a13 redirectCount:(unsigned __int8)a14 tcpHandshakeTimeMilliseconds:(double)a15 dnsResolveTimeMilliseconds:(double)a16 tlsHandshakeTimeMilliseconds:(double)a17 consecutiveConnectionFailureReason:(id)a18 lastConnected:(id)a19 disconnectReason:(unsigned int)a20;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 redirectCount:(unsigned __int8)a13 lastConnected:(id)a14 disconnectReason:(unsigned int)a15;
- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 lastConnected:(id)a12 disconnectReason:(unsigned int)a13;
- (id)copyFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9;
- (id)copyFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4;
- (id)copyFlushResponseMessageWithPaddingLength:(unint64_t)a3;
- (id)copyKeepAliveMessageWithMetadata:(id)a3;
- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4;
- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5;
- (id)copyMessageTracingAckWithTopicHash:(id)a3 status:(int)a4 tracingUUID:(id)a5 token:(id)a6;
- (id)copyMessageTransportAcknowledgeMessage;
- (id)copyMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8;
- (id)copyPresenceTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7;
- (id)copyPubSubChannelListWithInput:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5;
- (id)copySetActiveIntervalMessageWithInterval:(unsigned int)a3;
- (id)copySetActiveState:(BOOL)a3 forInterval:(unsigned int)a4;
- (id)copyTaskControlMessageWithInput:(id)a3 messageId:(unint64_t)a4;
- (id)copyTaskNotificationMessageWithInput:(id)a3;
- (id)copyTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8;
- (unint64_t)identifier;
- (void)APNSPackDecoder:(id)a3 ReceivedError:(int)a4;
- (void)APNSPackEncoder:(id)a3 receivedError:(int)a4;
- (void)setDecoderWrapper:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncoderWrapper:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsPackedFormat:(BOOL)a3;
- (void)setIsPackedFormat:(BOOL)a3 maxEncoderTableSize:(unint64_t)a4 maxDecoderTableSize:(unint64_t)a5 interface:(int64_t)a6;
- (void)setSerialItemInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 itemData:(id)a6;
- (void)setSerialNumberInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 Integer:(int64_t)a6;
@end

@implementation APSProtocolParser

- (APSProtocolParser)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APSProtocolParser;
  result = -[APSProtocolParser init](&v4, "init");
  if (result)
  {
    do
      signed int v3 = __ldaxr((unsigned int *)&unk_10014D938);
    while (__stlxr(v3 + 1, (unsigned int *)&unk_10014D938));
    result->_identifier = v3;
  }

  return result;
}

- (BOOL)isPackedFormat
{
  return self->_isPackedFormat;
}

- (void)setIsPackedFormat:(BOOL)a3 maxEncoderTableSize:(unint64_t)a4 maxDecoderTableSize:(unint64_t)a5 interface:(int64_t)a6
{
  BOOL v9 = a3;
  if (!self->_isPackedFormat && a3)
  {
    v12 = -[APNSPackEncoder initWithMaxTableSize:]( objc_alloc(&OBJC_CLASS___APNSPackEncoder),  "initWithMaxTableSize:",  a4);
    encoderWrapper = self->_encoderWrapper;
    self->_encoderWrapper = v12;

    -[APNSPackEncoder setDelegate:](self->_encoderWrapper, "setDelegate:", self);
    v14 = -[APNSPackDecoder initWithMaxTableSize:]( objc_alloc(&OBJC_CLASS___APNSPackDecoder),  "initWithMaxTableSize:",  a5);
    decoderWrapper = self->_decoderWrapper;
    self->_decoderWrapper = v14;

    -[APNSPackDecoder setDelegate:](self->_decoderWrapper, "setDelegate:", self);
  }

  self->_isPackedFormat = v9;
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    id v18 = sub_10003CEE4(a6);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)v19;
    int v22 = 134219010;
    v21 = @"NO";
    unint64_t v23 = identifier;
    __int16 v24 = 2112;
    if (v9) {
      v21 = @"YES";
    }
    uint64_t v25 = v19;
    __int16 v26 = 2112;
    v27 = v21;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "P%04llu <config> interface: %@ isPacked: %@ maxEncoderTableSize: %llu maxDecoderTableSize: %llu",  (uint8_t *)&v22,  0x34u);
  }
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4
{
  LODWORD(v6) = 1010;
  LOBYTE(v5) = 0;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:lastConnected:disconnectReason:]( self,  "copyConnectMessageWithToken:state:presenceFlags:metadata:certificates:nonce:signature:hostCertificateInfo:red irectCount:lastConnected:disconnectReason:",  a3,  *(void *)&a4,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v5,  0LL,  v6);
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 lastConnected:(id)a12 disconnectReason:(unsigned int)a13
{
  LODWORD(v15) = a13;
  LOBYTE(v14) = a11;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:]( self,  "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certifi cates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMillisecon ds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:",  a3,  *(void *)&a4,  *(void *)&a5,  3LL,  0LL,  0LL,  -1.0,  -1.0,  -1.0,  a6,  a7,  a8,  a9,  a10,  v14,  0LL,  a12,  v15);
}

- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 activeInterval:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 redirectCount:(unsigned __int8)a11 tcpHandshakeTimeMilliseconds:(double)a12 dnsResolveTimeMilliseconds:(double)a13 tlsHandshakeTimeMilliseconds:(double)a14 consecutiveConnectionFailureReason:(id)a15 lastConnected:(id)a16 disconnectReason:(unsigned int)a17
{
  LODWORD(v19) = a17;
  LOBYTE(v18) = a11;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:]( self,  "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certifi cates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMillisecon ds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:",  a3,  1LL,  0LL,  a4,  a5,  *(void *)&a6,  a12,  a13,  a14,  a7,  a8,  a9,  a10,  0LL,  v18,  a15,  a16,  v19);
}

- (id)copyConnectMessageWithToken:(id)a3 interface:(int64_t)a4 interfaceConstraint:(int64_t)a5 presenceFlags:(unsigned int)a6 activeInterval:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 hostCertificateInfo:(id)a12 redirectCount:(unsigned __int8)a13 tcpHandshakeTimeMilliseconds:(double)a14 dnsResolveTimeMilliseconds:(double)a15 tlsHandshakeTimeMilliseconds:(double)a16 consecutiveConnectionFailureReason:(id)a17 lastConnected:(id)a18 disconnectReason:(unsigned int)a19
{
  LODWORD(v21) = a19;
  LOBYTE(v20) = a13;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:]( self,  "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certifi cates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMillisecon ds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:",  a3,  1LL,  *(void *)&a6,  a4,  a5,  *(void *)&a7,  a14,  a15,  a16,  a8,  a9,  a10,  a11,  a12,  v20,  a17,  a18,  v21);
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 redirectCount:(unsigned __int8)a13 lastConnected:(id)a14 disconnectReason:(unsigned int)a15
{
  LODWORD(v17) = a15;
  LOBYTE(v16) = a13;
  return -[APSProtocolParser copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:]( self,  "copyConnectMessageWithToken:state:presenceFlags:interface:interfaceConstraint:activeInterval:metadata:certifi cates:nonce:signature:hostCertificateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMillisecon ds:tlsHandshakeTimeMilliseconds:consecutiveConnectionFailureReason:lastConnected:disconnectReason:",  a3,  *(void *)&a4,  *(void *)&a5,  a6,  a7,  *(void *)&a8,  -1.0,  -1.0,  -1.0,  a9,  a10,  a11,  a12,  0LL,  v16,  0LL,  a14,  v17);
}

- (id)copyConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 interface:(int64_t)a6 interfaceConstraint:(int64_t)a7 activeInterval:(unsigned int)a8 metadata:(id)a9 certificates:(id)a10 nonce:(id)a11 signature:(id)a12 hostCertificateInfo:(id)a13 redirectCount:(unsigned __int8)a14 tcpHandshakeTimeMilliseconds:(double)a15 dnsResolveTimeMilliseconds:(double)a16 tlsHandshakeTimeMilliseconds:(double)a17 consecutiveConnectionFailureReason:(id)a18 lastConnected:(id)a19 disconnectReason:(unsigned int)a20
{
  uint64_t v20 = *(void *)&a8;
  id v98 = a3;
  id v26 = a9;
  id v99 = a10;
  id v102 = a11;
  id v101 = a12;
  id v100 = a13;
  id v105 = a18;
  id v27 = a19;
  if (self->_isPackedFormat) {
    __int16 v28 = 0LL;
  }
  else {
    __int16 v28 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 7LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 7LL);
  unint64_t v29 = v98;
  if (v98)
  {
    -[APSProtocolMessage appendItem:data:](v28, "appendItem:data:", 1LL, v98);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  1LL,  v98,  1LL);
  }

  -[APSProtocolMessage appendOneByteItem:byte:](v28, "appendOneByteItem:byte:", 2LL, a4);
  -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt8WithAttributeId:number:isIndexable:",  2LL,  a4,  0LL);
  if (a4 != 2)
  {
    v95 = v27;
    else {
      int v30 = 32832;
    }
    if (a6 == 1) {
      int v31 = 522;
    }
    else {
      int v31 = 514;
    }
    LODWORD(v32) = v31 | a5 | v30;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      LODWORD(v32) = v32 | 0x20;
    }
    if (+[APSSimulatorSupport isSimulator](&OBJC_CLASS___APSSimulatorSupport, "isSimulator")) {
      uint64_t v32 = v32 | 0x1000;
    }
    else {
      uint64_t v32 = v32;
    }
    -[APSProtocolMessage appendFourByteItem:bytes:](v28, "appendFourByteItem:bytes:", 5LL, v32);
    a5 = v32;
    -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  5LL,  v32,  0LL);
    if (a6 <= 1)
    {
      else {
        uint64_t v33 = a6 != 0;
      }
      -[APSProtocolMessage appendOneByteItem:byte:](v28, "appendOneByteItem:byte:", 6LL, v33);
      -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt8WithAttributeId:number:isIndexable:",  6LL,  v33,  0LL);
    }

    -[APSProtocolMessage appendFourByteItem:bytes:](v28, "appendFourByteItem:bytes:", 7LL, v20);
    -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  7LL,  v20,  0LL);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v26 carrier]);
    id v35 = [v34 length];

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v26 carrier]);
      -[APSProtocolMessage appendItem:string:](v28, "appendItem:string:", 8LL, v36);

      encoderWrapper = self->_encoderWrapper;
      v38 = (void *)objc_claimAutoreleasedReturnValue([v26 carrier]);
      -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( encoderWrapper,  "addStringWithAttributId:string:isIndexable:",  8LL,  v38,  0LL);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v26 softwareVersion]);
    id v40 = [v39 length];

    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue([v26 softwareVersion]);
      -[APSProtocolMessage appendItem:string:](v28, "appendItem:string:", 9LL, v41);

      v42 = self->_encoderWrapper;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v26 softwareVersion]);
      -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v42,  "addStringWithAttributId:string:isIndexable:",  9LL,  v43,  0LL);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue([v26 softwareBuild]);
    id v45 = [v44 length];

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v26 softwareBuild]);
      -[APSProtocolMessage appendItem:string:](v28, "appendItem:string:", 10LL, v46);

      v47 = self->_encoderWrapper;
      v48 = (void *)objc_claimAutoreleasedReturnValue([v26 softwareBuild]);
      -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v47,  "addStringWithAttributId:string:isIndexable:",  10LL,  v48,  0LL);
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue([v26 hardwareVersion]);
    id v50 = [v49 length];

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue([v26 hardwareVersion]);
      -[APSProtocolMessage appendItem:string:](v28, "appendItem:string:", 11LL, v51);

      v52 = self->_encoderWrapper;
      v53 = (void *)objc_claimAutoreleasedReturnValue([v26 hardwareVersion]);
      -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v52,  "addStringWithAttributId:string:isIndexable:",  11LL,  v53,  0LL);
    }

    if (v99 && v102 && v101)
    {
      id v54 = v26;
      __int128 v118 = 0u;
      __int128 v119 = 0u;
      __int128 v116 = 0u;
      __int128 v117 = 0u;
      id v55 = v99;
      id v56 = [v55 countByEnumeratingWithState:&v116 objects:v134 count:16];
      if (v56)
      {
        id v57 = v56;
        uint64_t v58 = *(void *)v117;
        do
        {
          for (i = 0LL; i != v57; i = (char *)i + 1)
          {
            if (*(void *)v117 != v58) {
              objc_enumerationMutation(v55);
            }
            -[APSProtocolMessage appendItem:data:]( v28,  "appendItem:data:",  12LL,  *(void *)(*((void *)&v116 + 1) + 8LL * (void)i));
          }

          id v57 = [v55 countByEnumeratingWithState:&v116 objects:v134 count:16];
        }

        while (v57);
      }

      -[APSProtocolMessage appendItem:data:](v28, "appendItem:data:", 13LL, v102);
      -[APSProtocolMessage appendItem:data:](v28, "appendItem:data:", 14LL, v101);
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      id v60 = v55;
      id v61 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
      if (v61)
      {
        id v62 = v61;
        uint64_t v63 = *(void *)v113;
        do
        {
          for (j = 0LL; j != v62; j = (char *)j + 1)
          {
            if (*(void *)v113 != v63) {
              objc_enumerationMutation(v60);
            }
            -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  12LL,  *(void *)(*((void *)&v112 + 1) + 8LL * (void)j),  0LL);
          }

          id v62 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
        }

        while (v62);
      }

      -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  13LL,  v102,  0LL);
      -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  14LL,  v101,  0LL);
      id v26 = v54;
    }

    if (v100)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Presence contains hostCertificateInfo!",  (uint8_t *)&buf,  2u);
      }

      v65 = (void *)objc_claimAutoreleasedReturnValue([v100 data]);
      -[APSProtocolMessage appendItem:data:](v28, "appendItem:data:", 29LL, v65);

      v66 = self->_encoderWrapper;
      v67 = (void *)objc_claimAutoreleasedReturnValue([v100 data]);
      -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( v66,  "addDataWithAttributeId:data:isIndexable:",  29LL,  v67,  0LL);
    }

    -[APSProtocolMessage appendTwoByteItem:bytes:](v28, "appendTwoByteItem:bytes:", 16LL, 12LL);
    -[APSProtocolMessage appendTwoByteItem:bytes:](v28, "appendTwoByteItem:bytes:", 17LL, a14);
    -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  16LL,  12LL,  0LL);
    -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  17LL,  a14,  0LL);
    if (a15 >= 0.0)
    {
      double v68 = 65000.0;
      if (a15 <= 65000.0) {
        double v68 = a15;
      }
      uint64_t v69 = (int)v68;
      -[APSProtocolMessage appendTwoByteItem:bytes:](v28, "appendTwoByteItem:bytes:", 25LL, v69);
      -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  25LL,  v69,  0LL);
    }

    if (a16 >= 0.0)
    {
      double v70 = 65000.0;
      if (a16 <= 65000.0) {
        double v70 = a16;
      }
      uint64_t v71 = (int)v70;
      -[APSProtocolMessage appendTwoByteItem:bytes:](v28, "appendTwoByteItem:bytes:", 19LL, v71);
      -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  19LL,  v71,  0LL);
    }

    if (a17 >= 0.0)
    {
      double v72 = 65000.0;
      if (a17 <= 65000.0) {
        double v72 = a17;
      }
      uint64_t v73 = (int)v72;
      -[APSProtocolMessage appendTwoByteItem:bytes:](v28, "appendTwoByteItem:bytes:", 20LL, v73);
      -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  20LL,  v73,  0LL);
    }

    if (v105)
    {
      id v94 = v26;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      id obja = (id)objc_claimAutoreleasedReturnValue([v105 allObjects]);
      id v74 = [obja countByEnumeratingWithState:&v108 objects:v132 count:16];
      if (v74)
      {
        id v75 = v74;
        uint64_t v76 = 0LL;
        uint64_t v77 = *(void *)v109;
        while (2)
        {
          for (k = 0LL; k != v75; k = (char *)k + 1)
          {
            if (*(void *)v109 != v77) {
              objc_enumerationMutation(obja);
            }
            v79 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)k);
            uint64_t v80 = (uint64_t)[v79 integerValue];
            if (v80 >= 0) {
              LODWORD(v81) = v80;
            }
            else {
              uint64_t v81 = -v80;
            }
            unsigned int v107 = bswap32(v81);
            __int16 v106 = bswap32([v105 countForObject:v79]) >> 16;
            v82 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
            -[NSMutableData appendBytes:length:](v82, "appendBytes:length:", &v107, 4LL);
            -[NSMutableData appendBytes:length:](v82, "appendBytes:length:", &v106, 2LL);
            -[APSProtocolMessage appendItem:data:](v28, "appendItem:data:", 21LL, v82);
            -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  21LL,  v82,  0LL);
            if ((char *)k + v76 == (void *)9)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v83 = (void *)objc_claimAutoreleasedReturnValue([v105 allObjects]);
                int buf = 138412546;
                v121 = self;
                __int16 v122 = 2112;
                v123 = v83;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ reached 10 different failure reasons, {all failure reasons: %@} ",  (uint8_t *)&buf,  0x16u);
              }

              goto LABEL_81;
            }
          }

          id v75 = [obja countByEnumeratingWithState:&v108 objects:v132 count:16];
          v76 += (uint64_t)k;
          if (v75) {
            continue;
          }
          break;
        }
      }

- (id)copyFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (self->_isPackedFormat) {
    uint64_t v21 = 0LL;
  }
  else {
    uint64_t v21 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 9LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 9LL);
  if (a9)
  {
    -[APSProtocolMessage appendEightByteItem:bytes:](v21, "appendEightByteItem:bytes:", 12LL, a9);
    -[APNSPackEncoder addInt64WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt64WithAttributeId:number:isIndexable:",  12LL,  a9,  0LL);
  }

  if (v20)
  {
    -[APSProtocolMessage appendItem:data:](v21, "appendItem:data:", 1LL, v20);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  1LL,  v20,  1LL);
  }

  v88 = self;
  unint64_t v22 = -[APNSPackEncoder maxTableSize](self->_encoderWrapper, "maxTableSize");
  v153[0] = 0LL;
  v153[1] = v153;
  v153[2] = 0x2020000000LL;
  v153[3] = 0LL;
  v151[0] = 0LL;
  v151[1] = v151;
  v151[2] = 0x2020000000LL;
  char v152 = 0;
  v142[0] = _NSConcreteStackBlock;
  v142[1] = 3221225472LL;
  v142[2] = sub_100049364;
  v142[3] = &unk_10011F078;
  unint64_t v150 = (unint64_t)((double)v22 * 0.5 / 53.0);
  v148 = v153;
  v149 = v151;
  id v85 = v20;
  id v143 = v85;
  id v23 = v15;
  id v144 = v23;
  id v24 = v16;
  id v145 = v24;
  id v25 = v17;
  id v146 = v25;
  id v26 = v19;
  id v147 = v26;
  id v27 = objc_retainBlock(v142);
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472LL;
  v138[2] = sub_1000494C4;
  v138[3] = &unk_10011F0A0;
  id v86 = v21;
  v139 = v86;
  v140 = v88;
  v82 = v27;
  id v141 = v82;
  __int16 v28 = objc_retainBlock(v138);
  unint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  id obj = v23;
  id v30 = [obj countByEnumeratingWithState:&v134 objects:v181 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v135;
    do
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v135 != v31) {
          objc_enumerationMutation(obj);
        }
        ((void (*)(void *, void, uint64_t, NSMutableArray *))v28[2])( v28,  *(void *)(*((void *)&v134 + 1) + 8LL * (void)i),  2LL,  v29);
      }

      id v30 = [obj countByEnumeratingWithState:&v134 objects:v181 count:16];
    }

    while (v30);
  }

  uint64_t v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  id v92 = v24;
  id v34 = [v92 countByEnumeratingWithState:&v130 objects:v180 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v131;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v131 != v35) {
          objc_enumerationMutation(v92);
        }
        ((void (*)(void *, void, uint64_t, NSMutableArray *))v28[2])( v28,  *(void *)(*((void *)&v130 + 1) + 8LL * (void)j),  3LL,  v33);
      }

      id v34 = [v92 countByEnumeratingWithState:&v130 objects:v180 count:16];
    }

    while (v34);
  }

  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  id v91 = v25;
  id v38 = [v91 countByEnumeratingWithState:&v126 objects:v179 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v127;
    do
    {
      for (k = 0LL; k != v38; k = (char *)k + 1)
      {
        if (*(void *)v127 != v39) {
          objc_enumerationMutation(v91);
        }
        ((void (*)(void *, void, uint64_t, NSMutableArray *))v28[2])( v28,  *(void *)(*((void *)&v126 + 1) + 8LL * (void)k),  4LL,  v37);
      }

      id v38 = [v91 countByEnumeratingWithState:&v126 objects:v179 count:16];
    }

    while (v38);
  }

  v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  id v90 = v18;
  id v42 = [v90 countByEnumeratingWithState:&v122 objects:v178 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v123;
    do
    {
      for (m = 0LL; m != v42; m = (char *)m + 1)
      {
        if (*(void *)v123 != v43) {
          objc_enumerationMutation(v90);
        }
        ((void (*)(void *, void, uint64_t, NSMutableArray *))v28[2])( v28,  *(void *)(*((void *)&v122 + 1) + 8LL * (void)m),  6LL,  v41);
      }

      id v42 = [v90 countByEnumeratingWithState:&v122 objects:v178 count:16];
    }

    while (v42);
  }

  id v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  id v46 = v26;
  id v47 = [v46 countByEnumeratingWithState:&v118 objects:v177 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v119;
    do
    {
      for (n = 0LL; n != v47; n = (char *)n + 1)
      {
        if (*(void *)v119 != v48) {
          objc_enumerationMutation(v46);
        }
        ((void (*)(void *, void, uint64_t, NSMutableArray *))v28[2])( v28,  *(void *)(*((void *)&v118 + 1) + 8LL * (void)n),  5LL,  v45);
      }

      id v47 = [v46 countByEnumeratingWithState:&v118 objects:v177 count:16];
    }

    while (v47);
  }

  double v84 = v46;

  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472LL;
  v114[2] = sub_100049568;
  v114[3] = &unk_10011F0C8;
  v87 = v86;
  __int128 v115 = v87;
  __int128 v116 = v88;
  v83 = v82;
  id v117 = v83;
  id v50 = objc_retainBlock(v114);
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  v51 = v29;
  id v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v110,  v176,  16LL);
  if (v52)
  {
    uint64_t v53 = *(void *)v111;
    do
    {
      for (ii = 0LL; ii != v52; ii = (char *)ii + 1)
      {
        if (*(void *)v111 != v53) {
          objc_enumerationMutation(v51);
        }
        ((void (*)(void *, void, uint64_t))v50[2])( v50,  *(void *)(*((void *)&v110 + 1) + 8LL * (void)ii),  7LL);
      }

      id v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v110,  v176,  16LL);
    }

    while (v52);
  }

  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  id v55 = v33;
  id v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v106,  v175,  16LL);
  if (v56)
  {
    uint64_t v57 = *(void *)v107;
    do
    {
      for (jj = 0LL; jj != v56; jj = (char *)jj + 1)
      {
        if (*(void *)v107 != v57) {
          objc_enumerationMutation(v55);
        }
        ((void (*)(void *, void, uint64_t))v50[2])( v50,  *(void *)(*((void *)&v106 + 1) + 8LL * (void)jj),  8LL);
      }

      id v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v106,  v175,  16LL);
    }

    while (v56);
  }

  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  v59 = v37;
  id v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v59,  "countByEnumeratingWithState:objects:count:",  &v102,  v174,  16LL);
  if (v60)
  {
    uint64_t v61 = *(void *)v103;
    do
    {
      for (kk = 0LL; kk != v60; kk = (char *)kk + 1)
      {
        if (*(void *)v103 != v61) {
          objc_enumerationMutation(v59);
        }
        ((void (*)(void *, void, uint64_t))v50[2])( v50,  *(void *)(*((void *)&v102 + 1) + 8LL * (void)kk),  9LL);
      }

      id v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v59,  "countByEnumeratingWithState:objects:count:",  &v102,  v174,  16LL);
    }

    while (v60);
  }

  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  uint64_t v63 = v41;
  id v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v63,  "countByEnumeratingWithState:objects:count:",  &v98,  v173,  16LL);
  if (v64)
  {
    uint64_t v65 = *(void *)v99;
    do
    {
      for (mm = 0LL; mm != v64; mm = (char *)mm + 1)
      {
        if (*(void *)v99 != v65) {
          objc_enumerationMutation(v63);
        }
        ((void (*)(void *, void, uint64_t))v50[2])( v50,  *(void *)(*((void *)&v98 + 1) + 8LL * (void)mm),  11LL);
      }

      id v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v63,  "countByEnumeratingWithState:objects:count:",  &v98,  v173,  16LL);
    }

    while (v64);
  }

  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  v67 = v45;
  id v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v67,  "countByEnumeratingWithState:objects:count:",  &v94,  v172,  16LL);
  if (v68)
  {
    uint64_t v69 = *(void *)v95;
    do
    {
      for (nn = 0LL; nn != v68; nn = (char *)nn + 1)
      {
        if (*(void *)v95 != v69) {
          objc_enumerationMutation(v67);
        }
        ((void (*)(void *, void, uint64_t))v50[2])( v50,  *(void *)(*((void *)&v94 + 1) + 8LL * (void)nn),  10LL);
      }

      id v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v67,  "countByEnumeratingWithState:objects:count:",  &v94,  v172,  16LL);
    }

    while (v68);
  }

  if (v88->_isPackedFormat) {
    id v71 = -[APNSPackEncoder copyMessage](v88->_encoderWrapper, "copyMessage");
  }
  else {
    id v71 = -[APSProtocolMessage copyMessageData](v87, "copyMessageData");
  }
  double v72 = v71;
  uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = v88->_identifier;
    id v81 = (id)objc_claimAutoreleasedReturnValue([v85 debugDescription]);
    id v80 = [obj count];
    id v79 = [v92 count];
    id v78 = [v91 count];
    id v77 = [v90 count];
    id v75 = [v84 count];
    id v76 = [v72 length];
    *(_DWORD *)int buf = 134220034;
    unint64_t v155 = identifier;
    __int16 v156 = 2112;
    id v157 = v81;
    __int16 v158 = 2048;
    unint64_t v159 = a9;
    __int16 v160 = 2048;
    id v161 = v80;
    __int16 v162 = 2048;
    id v163 = v79;
    __int16 v164 = 2048;
    id v165 = v78;
    __int16 v166 = 2048;
    id v167 = v77;
    __int16 v168 = 2048;
    id v169 = v75;
    __int16 v170 = 2048;
    id v171 = v76;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:filter> token: %@ version: %llu; enabled.len: %llu ignoredHashes.len: %llu opportunistic.len: %llu no"
      "nWaking.len: %llu paused.len: %llu  -- data.len: %llu",
      buf,
      0x5Cu);
  }

  _Block_object_dispose(v151, 8);
  _Block_object_dispose(v153, 8);

  return v72;
}

- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4
{
  return -[APSProtocolParser copyMessageAcknowledgeMessageWithResponse:messageId:token:]( self,  "copyMessageAcknowledgeMessageWithResponse:messageId:token:",  a3,  a4,  0LL);
}

- (id)copyMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_isPackedFormat) {
    v10 = 0LL;
  }
  else {
    v10 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 11LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 11LL);
  -[APSProtocolMessage appendOneByteItem:byte:](v10, "appendOneByteItem:byte:", 8LL, a3);
  -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt8WithAttributeId:number:isIndexable:",  8LL,  a3,  0LL);
  if (v8)
  {
    -[APSProtocolMessage appendItem:data:](v10, "appendItem:data:", 4LL, v8);
    -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper, "addInt32WithAttributeId:number:isIndexable:", 4, *(unsigned int *)[v8 bytes], 0);
  }

  if (v9)
  {
    -[APSProtocolMessage appendItem:data:](v10, "appendItem:data:", 1LL, v9);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  1LL,  v9,  1LL);
  }

  if (self->_isPackedFormat) {
    id v11 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v11 = -[APSProtocolMessage copyMessageData](v10, "copyMessageData");
  }
  v12 = v11;
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 debugDescription]);
    if (v8) {
      int v17 = *(_DWORD *)[v8 bytes];
    }
    else {
      int v17 = 0;
    }
    int v18 = 134219010;
    unint64_t v19 = identifier;
    __int16 v20 = 2112;
    uint64_t v21 = v16;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    __int16 v24 = 1024;
    int v25 = v17;
    __int16 v26 = 2048;
    id v27 = [v12 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:msgAck> token: %@ status: %lld messageID: %u  -- data.len: %llu",  (uint8_t *)&v18,  0x30u);
  }

  return v12;
}

- (id)copyMessageTracingAckWithTopicHash:(id)a3 status:(int)a4 tracingUUID:(id)a5 token:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self->_isPackedFormat) {
    v13 = 0LL;
  }
  else {
    v13 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 27LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 27LL);
  -[APSProtocolMessage appendItem:data:](v13, "appendItem:data:", 1LL, v10);
  -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  1LL,  v10,  1LL);
  -[APSProtocolMessage appendItem:data:](v13, "appendItem:data:", 2LL, v11);
  -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v11,  0LL);
  -[APSProtocolMessage appendOneByteItem:byte:](v13, "appendOneByteItem:byte:", 3LL, a4);
  -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt8WithAttributeId:number:isIndexable:",  3LL,  a4,  0LL);
  if (v12)
  {
    -[APSProtocolMessage appendItem:data:](v13, "appendItem:data:", 4LL, v12);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  4LL,  v12,  1LL);
  }

  if (self->_isPackedFormat) {
    id v14 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v14 = -[APSProtocolMessage copyMessageData](v13, "copyMessageData");
  }
  id v15 = v14;
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 debugDescription]);
    int v20 = 134219266;
    unint64_t v21 = identifier;
    __int16 v22 = 2112;
    int64_t v23 = v19;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = a4;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2048;
    id v31 = [v15 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:msgTraceAck> token: %@ topicHash: %@d status: %lld tracingUUID: %@  -- data.len: %llu",  (uint8_t *)&v20,  0x3Eu);
  }

  return v15;
}

- (id)copyMessageTransportAcknowledgeMessage
{
  if (self->_isPackedFormat) {
    signed int v3 = 0LL;
  }
  else {
    signed int v3 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 21LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 21LL);
  if (self->_isPackedFormat) {
    id v4 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v4 = -[APSProtocolMessage copyMessageData](v3, "copyMessageData");
  }
  uint64_t v5 = v4;
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000BDBF8((uint64_t)self, v5, v6);
  }

  return v5;
}

- (id)copyKeepAliveMessageWithMetadata:(id)a3
{
  id v4 = a3;
  if (self->_isPackedFormat) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 12LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 12LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 carrier]);
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 carrier]);
    -[APSProtocolMessage appendItem:string:](v5, "appendItem:string:", 1LL, v8);

    encoderWrapper = self->_encoderWrapper;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 carrier]);
    -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( encoderWrapper,  "addStringWithAttributId:string:isIndexable:",  1LL,  v10,  1LL);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 softwareVersion]);
  id v12 = [v11 length];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 softwareVersion]);
    -[APSProtocolMessage appendItem:string:](v5, "appendItem:string:", 2LL, v13);

    id v14 = self->_encoderWrapper;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 softwareVersion]);
    -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v14,  "addStringWithAttributId:string:isIndexable:",  2LL,  v15,  1LL);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 softwareBuild]);
  id v17 = [v16 length];

  if (v17)
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 softwareBuild]);
    -[APSProtocolMessage appendItem:string:](v5, "appendItem:string:", 3LL, v18);

    unint64_t v19 = self->_encoderWrapper;
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v4 softwareBuild]);
    -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v19,  "addStringWithAttributId:string:isIndexable:",  3LL,  v20,  1LL);
  }

  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareVersion]);
  id v22 = [v21 length];

  if (v22)
  {
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareVersion]);
    -[APSProtocolMessage appendItem:string:](v5, "appendItem:string:", 4LL, v23);

    __int16 v24 = self->_encoderWrapper;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareVersion]);
    -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v24,  "addStringWithAttributId:string:isIndexable:",  4LL,  v25,  1LL);
  }

  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 keepAliveInterval]));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 description]);
  -[APSProtocolMessage appendItem:string:](v5, "appendItem:string:", 5LL, v27);

  __int16 v28 = self->_encoderWrapper;
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 keepAliveInterval]));
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 description]);
  -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v28,  "addStringWithAttributId:string:isIndexable:",  5LL,  v30,  1LL);

  if ((int)[v4 delayedResponseInterval] >= 1)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 delayedResponseInterval]));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 description]);
    -[APSProtocolMessage appendItem:string:](v5, "appendItem:string:", 6LL, v32);

    uint64_t v33 = self->_encoderWrapper;
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 delayedResponseInterval]));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 description]);
    -[APNSPackEncoder addStringWithAttributId:string:isIndexable:]( v33,  "addStringWithAttributId:string:isIndexable:",  6LL,  v35,  1LL);
  }

  if ([v4 usingServerStats])
  {
    -[APSProtocolMessage appendTwoByteItem:bytes:](v5, "appendTwoByteItem:bytes:", 8LL, 1LL);
    -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  8LL,  1LL,  0LL);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 keepAliveState]);

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 keepAliveState]);
    -[APSProtocolMessage appendOneByteItem:byte:](v5, "appendOneByteItem:byte:", 9, [v37 state]);
    -[APSProtocolMessage appendOneByteItem:byte:](v5, "appendOneByteItem:byte:", 10, [v37 subState]);
    -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt8WithAttributeId:number:isIndexable:",  9,  [v37 state],  0);
    -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt8WithAttributeId:number:isIndexable:",  10,  [v37 subState],  0);
  }

  if (self->_isPackedFormat) {
    id v38 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v38 = -[APSProtocolMessage copyMessageData](v5, "copyMessageData");
  }
  uint64_t v39 = v38;
  id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v43 = 134218498;
    unint64_t v44 = identifier;
    __int16 v45 = 2112;
    id v46 = v4;
    __int16 v47 = 2048;
    id v48 = [v39 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:ka> metadata: %@ -- data.len: %llu",  (uint8_t *)&v43,  0x20u);
  }

  return v39;
}

- (id)copyMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (self->_isPackedFormat) {
    int v18 = 0LL;
  }
  else {
    int v18 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 10LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 10LL);
  -[APSProtocolMessage appendFourByteItem:bytes:](v18, "appendFourByteItem:bytes:", 4LL, a4);
  -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  4LL,  a4,  0LL);
  -[APSProtocolMessage appendItem:data:](v18, "appendItem:data:", 1LL, v14);
  -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  1LL,  v14,  1LL);
  if (v16)
  {
    -[APSProtocolMessage appendItem:data:](v18, "appendItem:data:", 2LL, v16);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v16,  1LL);
  }

  -[APSProtocolMessage appendItem:data:](v18, "appendItem:data:", 3LL, v15);
  encoderWrapper = self->_encoderWrapper;
  if (!v9)
  {
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  3LL,  v15,  0LL);
    if (!v17) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  -[APNSPackEncoder addBinaryPropertyListWithAttributeId:data:isIndexable:]( encoderWrapper,  "addBinaryPropertyListWithAttributeId:data:isIndexable:",  3LL,  v15,  0LL);
  if (v17)
  {
LABEL_10:
    -[APSProtocolMessage appendTwoByteItem:bytes:]( v18,  "appendTwoByteItem:bytes:",  25,  (unsigned __int16)[v17 unsignedIntegerValue]);
    -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  25,  (unsigned __int16)[v17 unsignedIntegerValue],  0);
  }

- (id)copyFlushMessageWithWantPaddingLength:(unint64_t)a3 paddingLength:(unint64_t)a4
{
  if (self->_isPackedFormat) {
    id v7 = 0LL;
  }
  else {
    id v7 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 15LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 15LL);
  if (a3)
  {
    -[APSProtocolMessage appendTwoByteItem:bytes:](v7, "appendTwoByteItem:bytes:", 1LL, (unsigned __int16)a3);
    -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  1LL,  (unsigned __int16)a3,  0LL);
  }

  if (a4)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[NSMutableData increaseLengthBy:](v8, "increaseLengthBy:", a4);
    -[APSProtocolMessage appendItem:data:](v7, "appendItem:data:", 2LL, v8);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v8,  0LL);
  }

  if (self->_isPackedFormat) {
    id v9 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v9 = -[APSProtocolMessage copyMessageData](v7, "copyMessageData");
  }
  id v10 = v9;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v14 = 134218752;
    unint64_t v15 = identifier;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2048;
    id v21 = [v10 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:flush> wantLength: %llu paddingLength: %llu  -- data.len: %llu",  (uint8_t *)&v14,  0x2Au);
  }

  return v10;
}

- (id)copyFlushResponseMessageWithPaddingLength:(unint64_t)a3
{
  if (self->_isPackedFormat) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 16LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 16LL);
  if (a3)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[NSMutableData increaseLengthBy:](v6, "increaseLengthBy:", a3);
    -[APSProtocolMessage appendItem:data:](v5, "appendItem:data:", 2LL, v6);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v6,  0LL);
  }

  if (self->_isPackedFormat) {
    id v7 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v7 = -[APSProtocolMessage copyMessageData](v5, "copyMessageData");
  }
  id v8 = v7;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v12 = 134218496;
    unint64_t v13 = identifier;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2048;
    id v17 = [v8 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:flushResp> paddingLength: %llu  -- data.len: %llu",  (uint8_t *)&v12,  0x20u);
  }

  return v8;
}

- (id)copyTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if (self->_isPackedFormat) {
    id v17 = 0LL;
  }
  else {
    id v17 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 17LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 17LL);
  if ((unint64_t)[v14 length] >= 0x14)
  {
    -[APSProtocolMessage appendItem:data:](v17, "appendItem:data:", 2LL, v14);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v14,  1LL);
    if (v15)
    {
      -[APSProtocolMessage appendItem:data:](v17, "appendItem:data:", 1LL, v15);
      -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  1LL,  v15,  1LL);
    }

    if ((_DWORD)v11)
    {
      -[APSProtocolMessage appendTwoByteItem:bytes:](v17, "appendTwoByteItem:bytes:", 3LL, v11);
      -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  3LL,  v11,  0LL);
    }

    if (a8)
    {
      -[APSProtocolMessage appendTwoByteItem:bytes:](v17, "appendTwoByteItem:bytes:", 4LL, (unsigned __int16)a8);
      -[APNSPackEncoder addInt16WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt16WithAttributeId:number:isIndexable:",  4LL,  (unsigned __int16)a8,  0LL);
    }

    if ((_DWORD)v10)
    {
      -[APSProtocolMessage appendFourByteItem:bytes:](v17, "appendFourByteItem:bytes:", 5LL, v10);
      -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  5LL,  v10,  0LL);
    }

    if (v16)
    {
      -[APSProtocolMessage appendItem:data:](v17, "appendItem:data:", 6LL, v16);
      -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  6LL,  v16,  0LL);
    }
  }

  if (self->_isPackedFormat) {
    id v18 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v18 = -[APSProtocolMessage copyMessageData](v17, "copyMessageData");
  }
  unint64_t v19 = v18;
  __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 debugDescription]);
    *(_DWORD *)int buf = 134219778;
    unint64_t v25 = identifier;
    __int16 v26 = 2112;
    id v27 = v22;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    uint64_t v31 = v11;
    __int16 v32 = 2048;
    uint64_t v33 = v10;
    __int16 v34 = 2048;
    id v35 = [v16 length];
    __int16 v36 = 2048;
    int64_t v37 = a8;
    __int16 v38 = 2048;
    id v39 = [v19 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:tokenGen> token: %@ topicHash: %@ appId: %llu expirationTTL: %llu vapidPublicKeyHash.len: %llu type: %lld  -- data.len: %llu",  buf,  0x52u);
  }

  return v19;
}

- (id)copyPresenceTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a4;
  if (self->_isPackedFormat) {
    unint64_t v13 = 0LL;
  }
  else {
    unint64_t v13 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 32LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 32LL);
  -[APSProtocolMessage appendFourByteItem:bytes:](v13, "appendFourByteItem:bytes:", 1LL, a3);
  -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  1LL,  a3,  0LL);
  if (v12)
  {
    -[APSProtocolMessage appendItem:data:](v13, "appendItem:data:", 2LL, v12);
    -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v12,  0LL);
  }

  if (a5)
  {
    -[APSProtocolMessage appendEightByteItem:bytes:](v13, "appendEightByteItem:bytes:", 3LL, a5);
    -[APNSPackEncoder addInt64WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt64WithAttributeId:number:isIndexable:",  3LL,  a5,  0LL);
  }

  -[APSProtocolMessage appendFourByteItem:bytes:](v13, "appendFourByteItem:bytes:", 4LL, v8);
  -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  4LL,  v8,  0LL);
  if (a7)
  {
    -[APSProtocolMessage appendEightByteItem:bytes:](v13, "appendEightByteItem:bytes:", 5LL, a7);
    -[APNSPackEncoder addInt64WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt64WithAttributeId:number:isIndexable:",  5LL,  a7,  0LL);
  }

  if (self->_isPackedFormat) {
    id v14 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v14 = -[APSProtocolMessage copyMessageData](v13, "copyMessageData");
  }
  id v15 = v14;
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 debugDescription]);
    int v20 = 134219522;
    unint64_t v21 = identifier;
    __int16 v22 = 2112;
    int64_t v23 = v19;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2048;
    uint64_t v29 = v8;
    __int16 v30 = 2048;
    unint64_t v31 = a7;
    __int16 v32 = 2048;
    id v33 = [v15 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:presenceTrackingReq> token: %@ messageId: %llu salt: %llu trackingFlag: %llu timestamp: %llu  -- data.len: %llu",  (uint8_t *)&v20,  0x48u);
  }

  return v15;
}

- (id)copySetActiveIntervalMessageWithInterval:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_isPackedFormat) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 19LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 19LL);
  -[APSProtocolMessage appendFourByteItem:bytes:](v5, "appendFourByteItem:bytes:", 1LL, v3);
  -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  1LL,  v3,  0LL);
  if (self->_isPackedFormat) {
    id v6 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v6 = -[APSProtocolMessage copyMessageData](v5, "copyMessageData");
  }
  id v7 = v6;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v11 = 134218496;
    unint64_t v12 = identifier;
    __int16 v13 = 2048;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    id v16 = [v7 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:activeInt> activeInterval: %llu  -- data.len: %llu",  (uint8_t *)&v11,  0x20u);
  }

  return v7;
}

- (id)copySetActiveState:(BOOL)a3 forInterval:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (self->_isPackedFormat) {
    id v7 = 0LL;
  }
  else {
    id v7 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 20LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 20LL);
  if (v5) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = 2LL;
  }
  -[APSProtocolMessage appendOneByteItem:byte:](v7, "appendOneByteItem:byte:", 1LL, v8);
  -[APNSPackEncoder addInt8WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt8WithAttributeId:number:isIndexable:",  1LL,  v8,  0LL);
  if (v5)
  {
    -[APSProtocolMessage appendFourByteItem:bytes:](v7, "appendFourByteItem:bytes:", 2LL, v4);
    -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  2LL,  v4,  0LL);
  }

  if (self->_isPackedFormat) {
    id v9 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v9 = -[APSProtocolMessage copyMessageData](v7, "copyMessageData");
  }
  uint64_t v10 = v9;
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    if (v5) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    int v15 = 134218754;
    unint64_t v16 = identifier;
    __int16 v17 = 2048;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    int v20 = v14;
    __int16 v21 = 2048;
    id v22 = [v10 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:activeState> interval: %llu isActive: %@  -- data.len: %llu",  (uint8_t *)&v15,  0x2Au);
  }

  return v10;
}

- (id)copyTaskControlMessageWithInput:(id)a3 messageId:(unint64_t)a4
{
  id v6 = a3;
  if (self->_isPackedFormat) {
    id v7 = 0LL;
  }
  else {
    id v7 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 24LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 24LL);
  -[APSProtocolMessage appendFourByteItem:bytes:](v7, "appendFourByteItem:bytes:", 1LL, a4);
  -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  1LL,  a4,  0LL);
  -[APSProtocolMessage appendItem:data:](v7, "appendItem:data:", 2LL, v6);
  -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v6,  0LL);
  if (self->_isPackedFormat) {
    id v8 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v8 = -[APSProtocolMessage copyMessageData](v7, "copyMessageData");
  }
  id v9 = v8;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v13 = 134218752;
    unint64_t v14 = identifier;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    __int16 v17 = 2048;
    id v18 = [v6 length];
    __int16 v19 = 2048;
    id v20 = [v9 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:taskControl> messageId: %llu messageInput.len: %llu  -- data.len: %llu",  (uint8_t *)&v13,  0x2Au);
  }

  return v9;
}

- (id)copyTaskNotificationMessageWithInput:(id)a3
{
  id v4 = a3;
  if (self->_isPackedFormat) {
    BOOL v5 = 0LL;
  }
  else {
    BOOL v5 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 25LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 25LL);
  -[APSProtocolMessage appendItem:data:](v5, "appendItem:data:", 2LL, v4);
  if (self->_isPackedFormat) {
    id v6 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v6 = -[APSProtocolMessage copyMessageData](v5, "copyMessageData");
  }
  id v7 = v6;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    int v11 = 134218496;
    unint64_t v12 = identifier;
    __int16 v13 = 2048;
    id v14 = [v4 length];
    __int16 v15 = 2048;
    id v16 = [v7 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:taskNote> messageInput.len: %llu  -- data.len: %llu",  (uint8_t *)&v11,  0x20u);
  }

  return v7;
}

- (id)copyPubSubChannelListWithInput:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if (self->_isPackedFormat) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = -[APSProtocolMessage initWithCommand:](objc_alloc(&OBJC_CLASS___APSProtocolMessage), "initWithCommand:", 29LL);
  }
  -[APNSPackEncoder setCommand:](self->_encoderWrapper, "setCommand:", 29LL);
  -[APSProtocolMessage appendFourByteItem:bytes:](v10, "appendFourByteItem:bytes:", 1LL, v5);
  -[APNSPackEncoder addInt32WithAttributeId:number:isIndexable:]( self->_encoderWrapper,  "addInt32WithAttributeId:number:isIndexable:",  1LL,  v5,  0LL);
  -[APSProtocolMessage appendItem:data:](v10, "appendItem:data:", 2LL, v8);
  -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  2LL,  v8,  0LL);
  -[APSProtocolMessage appendItem:data:](v10, "appendItem:data:", 3LL, v9);
  -[APNSPackEncoder addDataWithAttributeId:data:isIndexable:]( self->_encoderWrapper,  "addDataWithAttributeId:data:isIndexable:",  3LL,  v9,  0LL);
  if (self->_isPackedFormat) {
    id v11 = -[APNSPackEncoder copyMessage](self->_encoderWrapper, "copyMessage");
  }
  else {
    id v11 = -[APSProtocolMessage copyMessageData](v10, "copyMessageData");
  }
  unint64_t v12 = v11;
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unint64_t identifier = self->_identifier;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 debugDescription]);
    int v17 = 134219010;
    unint64_t v18 = identifier;
    __int16 v19 = 2112;
    id v20 = v16;
    __int16 v21 = 2048;
    uint64_t v22 = v5;
    __int16 v23 = 2048;
    id v24 = [v8 length];
    __int16 v25 = 2048;
    id v26 = [v12 length];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "P%04llu <out:psChannelList> token: %@ messageID: %llu messageInput.len: %llu  -- data.len: %llu",  (uint8_t *)&v17,  0x34u);
  }

  return v12;
}

- (void)APNSPackEncoder:(id)a3 receivedError:(int)a4
{
  if (self->_encoderWrapper == a3)
  {
    delegate = self->_delegate;
    id v6 = (id)objc_claimAutoreleasedReturnValue([a3 errorMessage]);
    -[APSProtocolParserDelegate protocolParser:receiveAPNSPackError:]( delegate,  "protocolParser:receiveAPNSPackError:",  self,  v6);
  }

- (void)APNSPackDecoder:(id)a3 ReceivedError:(int)a4
{
  if (self->_decoderWrapper == a3)
  {
    delegate = self->_delegate;
    id v6 = (id)objc_claimAutoreleasedReturnValue([a3 errorMessage]);
    -[APSProtocolParserDelegate protocolParser:receiveAPNSPackError:]( delegate,  "protocolParser:receiveAPNSPackError:",  self,  v6);
  }

- (BOOL)parseMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6
{
  id v10 = a3;
  *a4 = 0LL;
  *a5 = 0;
  *a6 = 0LL;
  if ([v10 length])
  {
    id v11 = v10;
    uint64_t v12 = *(unsigned __int8 *)[v11 bytes];
    if (v12 > 0x22 || ((1LL << v12) & 0x763C5EF80LL) == 0)
    {
      unsigned int v27 = 0;
      *a5 = 1;
    }

    else
    {
      if (self->_isPackedFormat) {
        unsigned int v14 = -[APNSPackDecoder decodeMessage:parser:parameters:isInvalid:lengthParsed:]( self->_decoderWrapper,  "decodeMessage:parser:parameters:isInvalid:lengthParsed:",  v11,  self,  a4,  a5,  a6);
      }
      else {
        unsigned int v14 = -[APSProtocolParser _parseSerialMessage:parameters:isInvalid:lengthParsed:]( self,  "_parseSerialMessage:parameters:isInvalid:lengthParsed:",  v11,  a4,  a5,  a6);
      }
      unsigned int v27 = v14;
    }

    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17)
    {
      else {
        unint64_t v18 = off_10011F0E8[(char)(v12 - 7)];
      }
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog protocolParser](&OBJC_CLASS___APSLog, "protocolParser"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        unint64_t identifier = self->_identifier;
        id v22 = [v11 length];
        unint64_t v23 = *a6;
        id v24 = @"YES";
        id v25 = *a4;
        if (*a5) {
          id v26 = @"YES";
        }
        else {
          id v26 = @"NO";
        }
        *(_DWORD *)int buf = 134219778;
        if (!v27) {
          id v24 = @"NO";
        }
        unint64_t v29 = identifier;
        __int16 v30 = 2112;
        unint64_t v31 = v18;
        __int16 v32 = 2048;
        uint64_t v33 = v12;
        __int16 v34 = 2048;
        id v35 = v22;
        __int16 v36 = 2048;
        unint64_t v37 = v23;
        __int16 v38 = 2112;
        id v39 = v26;
        __int16 v40 = 2112;
        v41 = v24;
        __int16 v42 = 2112;
        id v43 = v25;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "P%04llu <in:%@> command: %llu message.len: %llu lengthParsed: %llu isInvalid: %@ success: %@  -- parameters: %@",  buf,  0x52u);
      }
    }

    BOOL v15 = v27;
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_parseSerialMessage:(id)a3 parameters:(id *)a4 isInvalid:(BOOL *)a5 lengthParsed:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = [v10 length];
  id v12 = v10;
  __int16 v13 = (unsigned __int8 *)[v12 bytes];
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v15 = *v13;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
  [v14 setObject:v16 forKey:@"APSProtocolCommand"];

  unsigned int v27 = a5;
  unsigned int v17 = *(_DWORD *)(v13 + 1);
  unsigned int v18 = bswap32(v17);
  if ((v18 & 0x80000000) != 0)
  {
LABEL_10:
    BOOL v20 = 0;
    BOOL *v27 = 1;
    goto LABEL_13;
  }

  unint64_t v19 = v18 + 5;
  if ((unint64_t)v11 < v19)
  {
LABEL_4:
    BOOL v20 = 0;
    goto LABEL_13;
  }

  id v26 = a6;
  if (v17)
  {
    uint64_t v21 = 5LL;
    while (1)
    {
      unint64_t v22 = v21 + 3 + (bswap32(*(unsigned __int16 *)&v13[v21 + 1]) >> 16);
      if (v22 > v19) {
        goto LABEL_10;
      }
      uint64_t v23 = v13[v21];
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v13[v21 + 3]));
      -[APSProtocolParser setSerialItemInParameters:commandID:itemID:itemData:]( self,  "setSerialItemInParameters:commandID:itemID:itemData:",  v14,  v15,  v23,  v24);

      uint64_t v21 = v22;
      if (v22 >= v19) {
        goto LABEL_12;
      }
    }
  }

  unint64_t v22 = 5LL;
LABEL_12:
  *a4 = v14;
  *id v26 = v22;
  BOOL v20 = 1;
LABEL_13:

  return v20;
}

- (void)setSerialNumberInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 Integer:(int64_t)a6
{
  id v9 = a3;
  switch(a4)
  {
    case 7uLL:
      if (a5 == 2)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
        id v11 = @"APSProtocolPresenceStatus";
        goto LABEL_95;
      }

      goto LABEL_97;
    case 8uLL:
      switch(a5)
      {
        case 1uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
          id v11 = @"APSProtocolConnectedResponse";
          break;
        case 4uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unsigned __int16)a6));
          id v11 = @"APSProtocolMessageSize";
          break;
        case 6uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  a6));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a6 & 1));
          [v9 setObject:v12 forKey:@"APSProtocolDualChannelSupport"];
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  (a6 >> 1) & 1));
          [v9 setObject:v13 forKey:@"APSProtocolReportLastReversePushRTT"];
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  (a6 >> 2) & 1));
          [v9 setObject:v14 forKey:@"APSProtocolFilterOptimizationSupport"];

          id v11 = @"APSProtocolCapabilities";
          break;
        case 7uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
          id v11 = @"APSProtocolServerTimeForBadNonce";
          goto LABEL_95;
        case 8uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unsigned __int16)a6));
          id v11 = @"APSProtocolLargeMessageSize";
          break;
        case 0xAuLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
          id v11 = @"APSProtocolServerTime";
          goto LABEL_95;
        case 0x10uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
          id v11 = @"APSProtocolMinKeepAliveInterval";
          break;
        case 0x11uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
          id v11 = @"APSProtocolExpectedKeepAliveInterval";
          break;
        case 0x12uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
          id v11 = @"APSProtocolMaxKeepAliveInterval";
          break;
        case 0x14uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)a6));
          id v11 = @"APSProtocolExperimentIDKey";
          break;
        default:
          goto LABEL_97;
      }

      goto LABEL_95;
    case 9uLL:
      if (a5 == 3)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
        id v11 = @"APSProtocolFilterResponseStatusKey";
      }

      else
      {
        if (a5 != 2) {
          goto LABEL_97;
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
        id v11 = @"APSProtocolFilterResponseVersionKey";
      }

      goto LABEL_95;
    case 0xAuLL:
      switch(a5)
      {
        case 4uLL:
          int v15 = a6;
          id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v15, 4LL));
          id v11 = @"APSProtocolMessageID";
          goto LABEL_95;
        case 5uLL:
          if (HIDWORD(a6)) {
            goto LABEL_97;
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)a6));
          id v11 = @"APSProtocolMessageExpiry";
          goto LABEL_95;
        case 6uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
          id v11 = @"APSProtocolMessageTimestamp";
          goto LABEL_95;
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
          goto LABEL_97;
        case 9uLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
          id v11 = @"APSProtocolMessageStorageFlags";
          goto LABEL_95;
        case 0xDuLL:
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
          id v11 = @"APSProtocolMessagePriority";
          goto LABEL_95;
        default:
          if (a5 != 26)
          {
            if (a5 == 28 && a6 == (__int16)a6)
            {
              id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)a6));
              id v11 = @"APSProtocolMessagePushType";
              goto LABEL_95;
            }

            goto LABEL_97;
          }

          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  a6));
          id v11 = @"APSProtocolMessageAPNFlags";
          break;
      }

      goto LABEL_95;
    case 0xBuLL:
      if (a5 == 6)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
        id v11 = @"APSProtocolAckTimestampKey";
        goto LABEL_95;
      }

      if (a5 == 8 && a6 == (char)a6)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
        id v11 = @"APSProtocolDeliveryStatus";
        goto LABEL_95;
      }

      goto LABEL_97;
    case 0xDuLL:
      if (a5 != 2)
      {
        if (a5 == 1 && a6 == (char)a6)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
          id v11 = @"APSProtocolKeepAliveResponse";
          goto LABEL_95;
        }

        goto LABEL_97;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a6));
      id v11 = @"APSProtocolKeepAliveDelayKeepAliveDurationKey";
      goto LABEL_95;
    case 0xFuLL:
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unsigned __int16)a6));
      id v11 = @"APSProtocolFlushWantPadding";
      goto LABEL_95;
    case 0x12uLL:
      if (a5 != 4)
      {
        if (a5 == 1 && a6 == (char)a6)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  a6));
          id v11 = @"APSProtocolAppTokenGenerateResponse";
          goto LABEL_95;
        }

        goto LABEL_97;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (unsigned __int16)a6));
      id v11 = @"APSProtocolAppTokenGenerateResponseAppId";
      goto LABEL_95;
    case 0x18uLL:
    case 0x19uLL:
      if (a5 != 3)
      {
        if (a5 == 1 && a6 == (int)a6)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
          id v11 = @"APSProtocolTaskMessageId";
          goto LABEL_95;
        }

        goto LABEL_97;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
      id v11 = @"APSProtocolTaskStatus";
      goto LABEL_95;
    case 0x1DuLL:
      switch(a5)
      {
        case 5uLL:
          break;
        case 4uLL:
          if (a6 == (char)a6)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
            id v11 = @"APSProtocolPubSubStatus";
            goto LABEL_95;
          }

          break;
        case 1uLL:
          if (a6 == (int)a6)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
            id v11 = @"APSProtocolPubSubMessageID";
            goto LABEL_95;
          }

          break;
        default:
          goto LABEL_97;
      }

      if (HIDWORD(a6)) {
        goto LABEL_97;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (int)a6));
      id v11 = @"APSProtocolPubSubTimeout";
      goto LABEL_95;
    case 0x1EuLL:
      if (a5 == 4) {
        goto LABEL_50;
      }
      if (a5 != 1) {
        goto LABEL_97;
      }
      if (a6 == (int)a6)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
        id v11 = @"APSPtotocolPubsubUpdateMessageID";
      }

      else
      {
LABEL_50:
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
        id v11 = @"APSProtocolPubSubUpdateTimestamp";
      }

      goto LABEL_95;
    case 0x20uLL:
      if (a5 != 3)
      {
        if (a5 == 1 && a6 == (int)a6)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
          id v11 = @"APSProtocolPresenceActivityMessageIDKey";
          goto LABEL_95;
        }

        goto LABEL_97;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
      id v11 = @"APSProtocolPresenceActivityStatusKey";
      goto LABEL_95;
    case 0x21uLL:
      if (a5 == 3)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a6));
        id v11 = @"APSProtocolFilterUpdateStatusKey";
      }

      else
      {
        if (a5 != 2) {
          goto LABEL_97;
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a6));
        id v11 = @"APSProtocolFilterUpdateVersionKey";
      }

- (void)setSerialItemInParameters:(id)a3 commandID:(unint64_t)a4 itemID:(unint64_t)a5 itemData:(id)a6
{
  id v17 = a3;
  id v9 = a6;
  id v10 = v9;
  switch(a4)
  {
    case 7uLL:
      if (a5 == 1)
      {
LABEL_3:
        id v11 = (NSString *)v9;
        id v12 = @"APSProtocolToken";
        goto LABEL_102;
      }

      goto LABEL_104;
    case 8uLL:
      switch(a5)
      {
        case 1uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]));
          id v12 = @"APSProtocolConnectedResponse";
          break;
        case 2uLL:
          goto LABEL_35;
        case 3uLL:
          goto LABEL_3;
        case 4uLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16));
          id v12 = @"APSProtocolMessageSize";
          break;
        case 6uLL:
          if ([v9 length] != (id)4) {
            goto LABEL_104;
          }
          uint64_t v13 = bswap32(*(_DWORD *)[v10 bytes]);
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  v13));
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13 & 1));
          [v17 setObject:v14 forKey:@"APSProtocolDualChannelSupport"];
          int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  (v13 >> 1) & 1));
          [v17 setObject:v15 forKey:@"APSProtocolReportLastReversePushRTT"];
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  (v13 >> 2) & 1));
          [v17 setObject:v16 forKey:@"APSProtocolFilterOptimizationSupport"];

          id v12 = @"APSProtocolCapabilities";
          break;
        case 7uLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes])));
          id v12 = @"APSProtocolServerTimeForBadNonce";
          break;
        case 8uLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16));
          id v12 = @"APSProtocolLargeMessageSize";
          break;
        case 9uLL:
          goto LABEL_48;
        case 0xAuLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes])));
          id v12 = @"APSProtocolServerTime";
          break;
        case 0xBuLL:
          id v11 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v9,  4LL);
          id v12 = @"APSProtocolGeoRegion";
          goto LABEL_102;
        case 0x13uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolClientIPAddress";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }

      goto LABEL_102;
    case 9uLL:
      switch(a5)
      {
        case 3uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]));
          id v12 = @"APSProtocolFilterResponseStatusKey";
          break;
        case 2uLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes])));
          id v12 = @"APSProtocolFilterResponseVersionKey";
          break;
        case 1uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolFilterResponseTokenKey";
          break;
        default:
          goto LABEL_104;
      }

      goto LABEL_102;
    case 0xAuLL:
      switch(a5)
      {
        case 1uLL:
          goto LABEL_3;
        case 2uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolTopicHash";
          goto LABEL_102;
        case 3uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolPayload";
          goto LABEL_102;
        case 4uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolMessageID";
          goto LABEL_102;
        case 5uLL:
          if ([v9 length] != (id)4) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate, "dateWithTimeIntervalSince1970:", (double)bswap32(*(_DWORD *)[v10 bytes])));
          id v12 = @"APSProtocolMessageExpiry";
          break;
        case 6uLL:
          if ([v9 length] != (id)8) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes])));
          id v12 = @"APSProtocolMessageTimestamp";
          break;
        case 9uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]));
          id v12 = @"APSProtocolMessageStorageFlags";
          break;
        case 0xDuLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]));
          id v12 = @"APSProtocolMessagePriority";
          break;
        case 0xFuLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolBaseToken";
          goto LABEL_102;
        case 0x15uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolMessageTracingUUID";
          goto LABEL_102;
        case 0x18uLL:
          id v11 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v9,  4LL);
          id v12 = @"APSProtocolMessageCorrelationIdentifier";
          goto LABEL_102;
        case 0x1AuLL:
          if ([v9 length] != (id)4) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber, "numberWithUnsignedLong:", (int)bswap32(*(_DWORD *)[v10 bytes])));
          id v12 = @"APSProtocolMessageAPNFlags";
          break;
        case 0x1CuLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber, "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16));
          id v12 = @"APSProtocolMessagePushType";
          break;
        case 0x1DuLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolMessagePubSubInfo";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }

      goto LABEL_102;
    case 0xBuLL:
      if (a5 != 6)
      {
        if (a5 == 8 && [v9 length] == (id)1)
        {
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]));
          id v12 = @"APSProtocolDeliveryStatus";
          goto LABEL_102;
        }

        goto LABEL_104;
      }

      if ([v9 length] != (id)8) {
        goto LABEL_104;
      }
      id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v10 bytes])));
      id v12 = @"APSProtocolAckTimestampKey";
      goto LABEL_102;
    case 0xDuLL:
      if (a5 != 1 || [v9 length] != (id)1) {
        goto LABEL_104;
      }
      id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)[v10 bytes]));
      id v12 = @"APSProtocolKeepAliveResponse";
      goto LABEL_102;
    case 0xEuLL:
      if (a5 != 1 || ![v9 length]) {
        goto LABEL_104;
      }
      id v11 = v10;
      id v12 = @"APSProtocolDestination";
      goto LABEL_102;
    case 0xFuLL:
      if (a5 != 1 || [v9 length] != (id)2) {
        goto LABEL_104;
      }
      id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber, "numberWithUnsignedInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16));
      id v12 = @"APSProtocolFlushWantPadding";
      goto LABEL_102;
    case 0x12uLL:
      switch(a5)
      {
        case 1uLL:
          if ([v9 length] != (id)1) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v10 bytes]));
          id v12 = @"APSProtocolAppTokenGenerateResponse";
          break;
        case 2uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolAppTokenGenerateResponseToken";
          goto LABEL_102;
        case 3uLL:
          if ([v9 length] != (id)20 && objc_msgSend(v10, "length") != (id)32) {
            goto LABEL_104;
          }
          id v11 = v10;
          id v12 = @"APSProtocolAppTokenGenerateResponseTopicHash";
          break;
        case 4uLL:
          if ([v9 length] != (id)2) {
            goto LABEL_104;
          }
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", bswap32(*(unsigned __int16 *)[v10 bytes]) >> 16));
          id v12 = @"APSProtocolAppTokenGenerateResponseAppId";
          break;
        default:
          goto LABEL_104;
      }

      goto LABEL_102;
    case 0x17uLL:
      if (a5 == 9)
      {
LABEL_48:
        id v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
        id v12 = @"APSProtocolRedirectReason";
      }

      else
      {
        if (a5 != 2) {
          goto LABEL_104;
        }
LABEL_35:
        id v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
        id v12 = @"APSProtocolServerMetadata";
      }

      goto LABEL_102;
    case 0x18uLL:
      if (a5 != 2) {
        goto LABEL_104;
      }
      id v11 = (NSString *)v9;
      id v12 = @"APSProtocolTaskControlPayload";
      goto LABEL_102;
    case 0x19uLL:
      if (a5 != 2) {
        goto LABEL_104;
      }
      id v11 = (NSString *)v9;
      id v12 = @"APSProtocolTaskNotificationPayload";
      goto LABEL_102;
    case 0x1DuLL:
      switch(a5)
      {
        case 1uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes])));
          id v12 = @"APSProtocolPubSubMessageID";
          goto LABEL_102;
        case 2uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolPubSubPayload";
          goto LABEL_102;
        case 3uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolPubSubToken";
          goto LABEL_102;
        case 4uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v9 bytes]));
          id v12 = @"APSProtocolPubSubStatus";
          goto LABEL_102;
        case 5uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes])));
          id v12 = @"APSProtocolPubSubTimeout";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }

      goto LABEL_104;
    case 0x1EuLL:
      switch(a5)
      {
        case 1uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes])));
          id v12 = @"APSPtotocolPubsubUpdateMessageID";
          goto LABEL_102;
        case 2uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolPubSubUpdatePayload";
          goto LABEL_102;
        case 3uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolPubSubUpdateToken";
          goto LABEL_102;
        case 4uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v9 bytes])));
          id v12 = @"APSProtocolPubSubUpdateTimestamp";
          goto LABEL_102;
        default:
          goto LABEL_104;
      }

      goto LABEL_104;
    case 0x20uLL:
      switch(a5)
      {
        case 1uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", bswap32(*(_DWORD *)[v9 bytes])));
          id v12 = @"APSProtocolPresenceActivityMessageIDKey";
          break;
        case 3uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v9 bytes]));
          id v12 = @"APSProtocolPresenceActivityStatusKey";
          break;
        case 2uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolPresenceActivityPushTokenKey";
          break;
        default:
          goto LABEL_104;
      }

      goto LABEL_102;
    case 0x21uLL:
      switch(a5)
      {
        case 1uLL:
          id v11 = (NSString *)v9;
          id v12 = @"APSProtocolFilterUpdateTokenKey";
          break;
        case 3uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber, "numberWithInteger:", *(unsigned __int8 *)[v9 bytes]));
          id v12 = @"APSProtocolFilterUpdateStatusKey";
          break;
        case 2uLL:
          id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber, "numberWithUnsignedLongLong:", bswap64(*(void *)[v9 bytes])));
          id v12 = @"APSProtocolFilterUpdateVersionKey";
          break;
        default:
          goto LABEL_104;
      }

- (void)setIsPackedFormat:(BOOL)a3
{
  self->_isPackedFormat = a3;
}

- (APNSPackEncoder)encoderWrapper
{
  return self->_encoderWrapper;
}

- (void)setEncoderWrapper:(id)a3
{
}

- (APNSPackDecoder)decoderWrapper
{
  return self->_decoderWrapper;
}

- (void)setDecoderWrapper:(id)a3
{
}

- (APSProtocolParserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (void).cxx_destruct
{
}

@end