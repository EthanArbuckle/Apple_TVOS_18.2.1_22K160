@interface NEIKEv2NotifyPayload
+ (NEIKEv2NotifyPayload)createNotifyPayloadType:;
+ (NEIKEv2NotifyPayload)createNotifyPayloadType:(void *)a3 data:;
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (const)copyError;
- (const)copyTypeDescription;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)copyPPKID;
- (uint64_t)getPPKIDType;
- (unint64_t)type;
- (void)copyServerRedirectNonce;
@end

@implementation NEIKEv2NotifyPayload

- (unint64_t)type
{
  return 41LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  v9 = (__CFString *)-[NEIKEv2NotifyPayload copyTypeDescription]((const __CFString *)self);
  [v7 appendPrettyObject:v9 withName:@"Notify Type" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v7,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v10, 32, 1),  @"Notify Data",  v5,  a4);
    id Property = objc_getProperty(self, v11, 40LL, 1);
  }

  else
  {
    [v7 appendPrettyObject:0 withName:@"Notify Data" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v7 appendPrettyObject:Property withName:@"SPI" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2NotifyPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    LOBYTE(self) = self->_notifyType != 0;
  }
  return (char)self;
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16LL, 1)) {
      goto LABEL_23;
    }
    if (-[NEIKEv2NotifyPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      unint64_t notifyType = self->_notifyType;
      LOWORD(v31) = 0;
      HIWORD(v31) = bswap32(notifyType) >> 16;
      id Property = objc_getProperty(self, v4, 32LL, 1);
      uint64_t v7 = (unsigned __int16)notifyType;
LABEL_5:
      uint64_t v9 = [Property length];
      if (self) {
        id v10 = objc_getProperty(self, v8, 40LL, 1);
      }
      else {
        id v10 = 0LL;
      }
      id v11 = v10;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        if (self) {
          id v14 = objc_getProperty(self, v13, 40LL, 1);
        }
        else {
          id v14 = 0LL;
        }
        uint64_t v30 = [v14 value];
        LOWORD(v31) = 2049;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithCapacity:", v9 + 12, v30);
        [v15 appendBytes:&v31 length:4];
        v16 = &v30;
        v17 = v15;
        uint64_t v18 = 8LL;
      }

      else
      {
        if (self) {
          id v19 = objc_getProperty(self, v13, 40LL, 1);
        }
        else {
          id v19 = 0LL;
        }
        id v20 = v19;
        objc_opt_class();
        char v21 = objc_opt_isKindOfClass();

        if ((v21 & 1) != 0)
        {
          if (self) {
            id v23 = objc_getProperty(self, v22, 40LL, 1);
          }
          else {
            id v23 = 0LL;
          }
          LODWORD(v30) = [v23 value];
          LOWORD(v31) = 1027;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithCapacity:", v9 + 8, v30);
          [v15 appendBytes:&v31 length:4];
          v16 = &v30;
          v17 = v15;
        }

        else
        {
          uint64_t v24 = v9 + 4;
          if (v7 == 16418) {
            LOBYTE(v31) = 1;
          }
          v17 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v24];
          v15 = v17;
          v16 = (uint64_t *)&v31;
        }

        uint64_t v18 = 4LL;
      }

      [v17 appendBytes:v16 length:v18];
      if (!self)
      {
        [v15 appendData:0];

        id v27 = 0LL;
        return v27 != 0LL;
      }

      objc_msgSend(v15, "appendData:", objc_getProperty(self, v25, 32, 1));
      objc_setProperty_atomic(self, v26, v15, 16LL);

LABEL_23:
      id v27 = objc_getProperty(self, v3, 16LL, 1);
      return v27 != 0LL;
    }
  }

  else if ([0 hasRequiredFields])
  {
    uint64_t v7 = 0LL;
    id Property = 0LL;
    int v31 = 0;
    goto LABEL_5;
  }

  ne_log_obj();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v30) = 0;
    _os_log_error_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_ERROR,  "Notify payload missing required fields",  (uint8_t *)&v30,  2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      buf[0] = 136315138;
      *(void *)&buf[1] = "-[NEIKEv2NotifyPayload parsePayloadData]";
      _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "%s called with null self.payloadData",  (uint8_t *)buf,  0xCu);
    }

    goto LABEL_8;
  }

  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      buf[0] = 136315138;
      *(void *)&buf[1] = "-[NEIKEv2NotifyPayload parsePayloadData]";
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "BACKTRACE %s called with null (self.payloadData.length >= sizeof(ikev2_payload_notify_hdr_t))",  (uint8_t *)buf,  0xCu);
    }

- (void).cxx_destruct
{
}

- (const)copyTypeDescription
{
  if (result)
  {
    v1 = result;
    uint64_t length = result->length;
    if (length <= 41040)
    {
      switch(length)
      {
        case 16384LL:
          result = @"InitialContact";
          break;
        case 16385LL:
          result = @"SetWindowSize";
          break;
        case 16386LL:
          result = @"AdditionalTSPossible";
          break;
        case 16387LL:
          result = @"IPCOMPSupported";
          break;
        case 16388LL:
          result = @"NATDetectionSourceIP";
          break;
        case 16389LL:
          result = @"NATDetectionDestinationIP";
          break;
        case 16390LL:
          result = @"Cookie";
          break;
        case 16391LL:
          result = @"UseTransportMode";
          break;
        case 16392LL:
          result = @"HTTPCertLookupSupported";
          break;
        case 16393LL:
          result = @"RekeySA";
          break;
        case 16394LL:
          result = @"ESPTFCPaddingNotSupported";
          break;
        case 16395LL:
          result = @"NonFirstFragmentsAlso";
          break;
        case 16396LL:
          result = @"MOBIKESupported";
          break;
        case 16397LL:
          result = @"AdditionalIP4Address";
          break;
        case 16398LL:
          result = @"AdditionalIP6Address";
          break;
        case 16399LL:
          result = @"NoAdditionalAddresses";
          break;
        case 16400LL:
          result = @"UpdateSAAddresses";
          break;
        case 16401LL:
          result = @"Cookie2";
          break;
        case 16402LL:
          result = @"NoNATSAllowed";
          break;
        case 16403LL:
          result = @"AuthLifetime";
          break;
        case 16404LL:
          result = @"MultipleAuthSupported";
          break;
        case 16405LL:
          result = @"AnotherAuthFollows";
          break;
        case 16406LL:
          result = @"RedirectSupported";
          break;
        case 16407LL:
          result = @"ServerRedirect";
          break;
        case 16408LL:
          result = @"RedirectedFrom";
          break;
        case 16409LL:
        case 16410LL:
        case 16411LL:
        case 16412LL:
        case 16413LL:
        case 16414LL:
        case 16415LL:
        case 16416LL:
        case 16419LL:
        case 16420LL:
        case 16421LL:
        case 16422LL:
        case 16423LL:
        case 16425LL:
        case 16426LL:
        case 16427LL:
        case 16428LL:
        case 16429LL:
        case 16432LL:
        case 16433LL:
        case 16434LL:
        case 16439LL:
        case 16440LL:
          return (const __CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%u",  v1->length);
        case 16417LL:
          result = @"EAPOnlyAuthentication";
          break;
        case 16418LL:
          result = @"ChildlessIKEv2Supported";
          break;
        case 16424LL:
          result = @"SecurePasswordMethods";
          break;
        case 16430LL:
          result = @"IKEv2FragmentationSupported";
          break;
        case 16431LL:
          result = @"SignatureHashAlgorithms";
          break;
        case 16435LL:
          result = @"UsePPK";
          break;
        case 16436LL:
          result = @"PPKIdentity";
          break;
        case 16437LL:
          result = @"NoPPKAuth";
          break;
        case 16438LL:
          result = @"IntermediateExchangeSupported";
          break;
        case 16441LL:
          result = @"AdditionalKeyExchange";
          break;
        default:
          result = @"None";
          switch(length)
          {
            case 0LL:
              return result;
            case 1LL:
              result = @"UnsupportedCriticalPayload";
              break;
            case 2LL:
            case 3LL:
            case 6LL:
            case 8LL:
            case 10LL:
            case 12LL:
            case 13LL:
            case 15LL:
            case 16LL:
            case 18LL:
            case 19LL:
            case 20LL:
            case 21LL:
            case 22LL:
            case 23LL:
            case 25LL:
            case 26LL:
            case 27LL:
            case 28LL:
            case 29LL:
            case 30LL:
            case 31LL:
            case 32LL:
            case 33LL:
            case 42LL:
            case 45LL:
            case 46LL:
              return (const __CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%u",  v1->length);
            case 4LL:
              result = @"InvalidIKESPI";
              break;
            case 5LL:
              result = @"InvalidMajorVersion";
              break;
            case 7LL:
              result = @"InvalidSyntax";
              break;
            case 9LL:
              result = @"InvalidMessageID";
              break;
            case 11LL:
              result = @"InvalidSPI";
              break;
            case 14LL:
              result = @"NoProposalChosen";
              break;
            case 17LL:
              result = @"InvalidKEPayload";
              break;
            case 24LL:
              result = @"AuthenticationFailed";
              break;
            case 34LL:
              result = @"SinglePairRequired";
              break;
            case 35LL:
              result = @"NoAdditionalSAs";
              break;
            case 36LL:
              result = @"InternalAddressFailure";
              break;
            case 37LL:
              result = @"FailedCPRequired";
              break;
            case 38LL:
              result = @"TSUnacceptable";
              break;
            case 39LL:
              result = @"InvalidSelectors";
              break;
            case 40LL:
              result = @"UnacceptableAddresses";
              break;
            case 41LL:
              result = @"UnexpectedNATDetected";
              break;
            case 43LL:
              result = @"TemporaryFailure";
              break;
            case 44LL:
              result = @"ChildSANotFound";
              break;
            case 47LL:
              result = @"StateNotFound";
              break;
            default:
              if (length != 10500) {
                return (const __CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%u",  v1->length);
              }
              result = @"NetworkFailure";
              break;
          }

          break;
      }
    }

    else
    {
      if (length <= 49999)
      {
        if (length == 41041) {
          return @"BackoffTimer";
        }
        if (length == 41101) {
          return @"DeviceIdentity";
        }
      }

      else
      {
        switch(length)
        {
          case 50000LL:
            return @"SequencePerTrafficClass";
          case 51015LL:
            return @"N1ModeCapability";
          case 51115LL:
            return @"N1ModeInformation";
        }
      }

      return (const __CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%u",  v1->length);
    }
  }

  return result;
}

+ (id)copyTypeDescription
{
  return @"Notify";
}

+ (NEIKEv2NotifyPayload)createNotifyPayloadType:
{
  result = objc_alloc_init(&OBJC_CLASS___NEIKEv2NotifyPayload);
  if (result) {
    result->_unint64_t notifyType = 50000LL;
  }
  return result;
}

+ (NEIKEv2NotifyPayload)createNotifyPayloadType:(void *)a3 data:
{
  id v4 = a3;
  objc_opt_self();
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NotifyPayload);
  uint64_t v7 = v5;
  if (v5)
  {
    v5->_unint64_t notifyType = a2;
    objc_setProperty_atomic(v5, v6, v4, 32LL);
  }

  return v7;
}

- (const)copyError
{
  v1 = a1;
  v8[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((unint64_t)(a1->length - 1) > 0x3FFE)
    {
      return 0LL;
    }

    else
    {
      id v2 = objc_alloc(MEMORY[0x189607870]);
      uint64_t length = v1->length;
      uint64_t v7 = *MEMORY[0x189607490];
      id v4 = (__CFString *)-[NEIKEv2NotifyPayload copyTypeDescription](v1);
      v8[0] = v4;
      [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = (const __CFString *)[v2 initWithDomain:@"NEIKEv2ProtocolErrorDomain" code:length userInfo:v5];
    }
  }

  return v1;
}

- (void)copyServerRedirectNonce
{
  id v2 = self;
  *(void *)&v14[5] = *MEMORY[0x1895F89C0];
  if (self)
  {
    if (self[3] != 16407LL)
    {
      ne_log_obj();
      v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        *(void *)unint64_t v14 = v2;
        _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "BACKTRACE Cannot copy server redirect nonce from notification %@",  (uint8_t *)&v13,  0xCu);
      }

      goto LABEL_16;
    }

    v3 = (os_log_s *)objc_getProperty(self, a2, 32LL, 1);
    if ((unint64_t)-[os_log_s length](v3, "length") > 1)
    {
      uint64_t v8 = -[os_log_s bytes](v3, "bytes");
      if (-[os_log_s length](v3, "length") - 2 < (unint64_t)*(unsigned __int8 *)(v8 + 1))
      {
        ne_log_obj();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v11 = -[os_log_s length](v3, "length");
          int v12 = *(unsigned __int8 *)(v8 + 1);
          int v13 = 67109376;
          v14[0] = v11;
          LOWORD(v14[1]) = 1024;
          *(_DWORD *)((char *)&v14[1] + 2) = v12;
          _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Server redirect has invalid length %u (gateway length %u)",  (uint8_t *)&v13,  0xEu);
        }

        goto LABEL_16;
      }

      if (-[os_log_s length](v3, "length") != *(unsigned __int8 *)(v8 + 1) + 2LL)
      {
        id v2 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F48]),  "initWithBytes:length:",  v8 + *(unsigned __int8 *)(v8 + 1) + 2,  -[os_log_s length](v3, "length") - *(unsigned __int8 *)(v8 + 1) - 2);
        goto LABEL_17;
      }

      ne_log_obj();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        uint64_t v5 = "Server redirect has no nonce";
        v6 = v4;
        uint32_t v7 = 2;
        goto LABEL_6;
      }
    }

    else
    {
      ne_log_obj();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134217984;
        *(void *)unint64_t v14 = -[os_log_s length](v3, "length");
        uint64_t v5 = "Server redirect has invalid length %llu";
        v6 = v4;
        uint32_t v7 = 12;
LABEL_6:
        _os_log_error_impl(&dword_1876B1000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v13, v7);
      }
    }

LABEL_16:
    id v2 = 0LL;
LABEL_17:
  }

  return v2;
}

- (uint64_t)getPPKIDType
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*((void *)self + 3) == 16436LL)
  {
    if (objc_msgSend(objc_getProperty(self, a2, 32, 1), "length"))
    {
      LOBYTE(v6) = 0;
      objc_msgSend(objc_getProperty(self, v3, 32, 1), "getBytes:length:", &v6, 1);
      return v6;
    }

    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "Cannot get PPK ID type from too short notification %@",  (uint8_t *)&v6,  0xCu);
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "Cannot get PPK ID type from notification %@",  (uint8_t *)&v6,  0xCu);
    }
  }

  return 0LL;
}

- (uint64_t)copyPPKID
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (self[3] != 16436LL)
  {
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_fault_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_FAULT,  "Cannot copy PPK ID from notification %@",  (uint8_t *)&v9,  0xCu);
    }

    goto LABEL_8;
  }

  if (!objc_msgSend(objc_getProperty(self, a2, 32, 1), "length"))
  {
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Cannot copy PPK ID from too short notification %@",  (uint8_t *)&v9,  0xCu);
    }

@end