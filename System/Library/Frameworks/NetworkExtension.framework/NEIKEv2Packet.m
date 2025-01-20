@interface NEIKEv2Packet
+ (BOOL)encryptPayloads;
+ (id)copyTypeDescription;
+ (uint64_t)createPacketFromReceivedData:(uint64_t)a1;
+ (unint64_t)exchangeType;
- (BOOL)addNotification:(void *)a3 data:;
- (BOOL)addNotifyPayload:(void *)a1;
- (id)copyPacketDatagramsForIKESA:(_BYTE *)a1;
- (id)copyShortDescription;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (os_log_s)initOutbound;
- (uint64_t)copyUnifiedData;
- (uint64_t)hasErrors;
- (uint64_t)hasNotification:(void *)a1;
- (uint64_t)initResponse:(uint64_t)a1;
- (uint64_t)processDecryptedPacketForIKESA:(_BYTE *)a1;
- (uint64_t)processReceivedPacketForIKESA:(_BYTE *)a1;
- (void)addNotification:(void *)a3 fromArray:(void *)a4 toPayloads:;
- (void)constructHeadersForNextPayloadType:(uint64_t)a3 payloadsLength:(unsigned int)a4 fragmentNumber:(unsigned int)a5 totalFragments:(void *)a6 securityContext:;
- (void)copyNotification:(void *)a1;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2Packet

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x189603FA8]);
  if (self)
  {
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v3, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 56, 1));
    objc_setProperty_atomic(self, v5, newValue, 80LL);
  }

  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  if (self) {
    self = (NEIKEv2Packet *)objc_getProperty(self, a2, 80LL, 1);
  }
  v3 = self;
  uint64_t v4 = -[NEIKEv2Packet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v24,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2 && objc_getProperty(v2, v9, 64LL, 1))
          {
            objc_msgSend(objc_getProperty(v2, v10, 64, 1), "arrayByAddingObject:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
            v15 = v2;
            v16 = v12;
            ptrdiff_t v17 = 64LL;
            goto LABEL_20;
          }

          uint64_t v23 = v8;
          objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v23, 1, (void)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2) {
            goto LABEL_17;
          }
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
          if (v2 && objc_getProperty(v2, v13, 56LL, 1))
          {
            objc_msgSend(objc_getProperty(v2, v14, 56, 1), "arrayByAddingObject:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
            v15 = v2;
            v16 = v12;
            ptrdiff_t v17 = 56LL;
LABEL_20:
            objc_setProperty_atomic(v15, v11, v16, v17);
            goto LABEL_21;
          }

          uint64_t v22 = v8;
          objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v22, 1, (void)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2) {
            goto LABEL_19;
          }
        }

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  uint64_t v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Exchange" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend( v7,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v9, 32, 1),  @"Initiator SPI",  v5,  a4);
    objc_msgSend( v7,  "appendPrettyObject:withName:andIndent:options:",  objc_getProperty(self, v10, 40, 1),  @"Responder SPI",  v5,  a4);
    [v7 appendPrettyBOOL:self->_isInitiator withName:@"Initiator" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:self->_isResponse withName:@"Response" andIndent:v5 options:a4];
    [v7 appendPrettyInt:self->_messageID withName:@"Message ID" andIndent:v5 options:a4];
    id Property = objc_getProperty(self, v11, 80LL, 1);
  }

  else
  {
    [v7 appendPrettyObject:0 withName:@"Initiator SPI" andIndent:v5 options:a4];
    [v7 appendPrettyObject:0 withName:@"Responder SPI" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:0 withName:@"Initiator" andIndent:v5 options:a4];
    [v7 appendPrettyBOOL:0 withName:@"Response" andIndent:v5 options:a4];
    [v7 appendPrettyInt:0 withName:@"Message ID" andIndent:v5 options:a4];
    id Property = 0LL;
  }

  [v7 appendPrettyObject:Property withName:@"Payloads" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2Packet descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (id)copyShortDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v5 = (void *)[(id)objc_opt_class() copyTypeDescription];
  uint64_t v6 = "R";
  uint64_t v7 = "req";
  if (self)
  {
    if (self->_isInitiator) {
      uint64_t v6 = "I";
    }
    if (self->_isResponse) {
      uint64_t v7 = "resp";
    }
    uint64_t messageID = self->_messageID;
    id v9 = objc_getProperty(self, v4, 32LL, 1);
    id Property = objc_getProperty(self, v10, 40LL, 1);
  }

  else
  {
    id v9 = 0LL;
    uint64_t messageID = 0LL;
    id Property = 0LL;
  }

  v12 = (void *)[v3 initWithFormat:@"[%@ %s %s%d %@-%@]", v5, v6, v7, messageID, v9, Property];

  return v12;
}

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

+ (BOOL)encryptPayloads
{
  return 1;
}

+ (unint64_t)exchangeType
{
  return 0LL;
}

- (void)addNotification:(void *)a3 fromArray:(void *)a4 toPayloads:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
          if (v14)
          {
            if (v14[3] == a2)
            {
              v16 = v14;

              objc_msgSend(v8, "addObject:", v16, (void)v17);
              [v9 removeObject:v16];
              id v9 = v16;
              goto LABEL_16;
            }
          }

          else if (!a2)
          {
            goto LABEL_16;
          }

          ++v13;
        }

        while (v11 != v13);
        uint64_t v15 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v11 = v15;
      }

      while (v15);
    }

- (os_log_s)initOutbound
{
  if (!a1) {
    return 0LL;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_CLASS___NEIKEv2Packet;
  v1 = (os_log_s *)objc_msgSendSuper2(&v6, sel_init);
  if (!v1)
  {
    ne_log_obj();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl(&dword_1876B1000, v2, OS_LOG_TYPE_FAULT, "[super init] failed", v5, 2u);
    }

    goto LABEL_7;
  }

  v2 = v1;
  if (-[os_log_s isMemberOfClass:](v1, "isMemberOfClass:", objc_opt_class()))
  {
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_FAULT,  "Must use a subclass of NEIKEv2Packet to create outbound packets",  v5,  2u);
    }

LABEL_7:
    return 0LL;
  }

  return v2;
}

- (uint64_t)initResponse:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3)
    {
      if ((v3[3] & 1) != 0)
      {
        v11.receiver = (id)a1;
        v11.super_class = (Class)&OBJC_CLASS___NEIKEv2Packet;
        id v5 = objc_msgSendSuper2(&v11, sel_init);
        if (!v5)
        {
          a1 = ne_log_obj();
          if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1876B1000, (os_log_t)a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
          }

          goto LABEL_8;
        }

        a1 = (uint64_t)v5;
        if (![v5 isMemberOfClass:objc_opt_class()])
        {
          *(_BYTE *)(a1 + 10) = 1;
          *(_DWORD *)(a1 + 24) = v4[6];
          goto LABEL_10;
        }

        ne_log_obj();
        objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
        {
LABEL_7:

LABEL_8:
          a1 = 0LL;
          goto LABEL_10;
        }

        *(_WORD *)buf = 0;
        id v8 = "Must use a subclass of NEIKEv2Packet to create outbound packets";
        id v9 = (os_log_s *)v6;
        uint32_t v10 = 2;
LABEL_12:
        _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, v8, buf, v10);
        goto LABEL_7;
      }

      ne_log_obj();
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[NEIKEv2Packet initResponse:]";
      id v8 = "%s called with null originalMessage.isInbound";
    }

    else
    {
      ne_log_obj();
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[NEIKEv2Packet initResponse:]";
      id v8 = "%s called with null originalMessage";
    }

    id v9 = (os_log_s *)v6;
    uint32_t v10 = 12;
    goto LABEL_12;
  }

- (void)constructHeadersForNextPayloadType:(uint64_t)a3 payloadsLength:(unsigned int)a4 fragmentNumber:(unsigned int)a5 totalFragments:(void *)a6 securityContext:
{
  BOOL v10 = a4 != 0;
  BOOL v11 = a5 != 0;
  id v12 = a6;
  int v13 = [v12 overheadForPlaintextLength:a3];
  id v14 = objc_alloc(MEMORY[0x189603FB8]);

  BOOL v15 = !v10 || !v11;
  BOOL v28 = v10 && v11;
  if (v10 && v11) {
    uint64_t v16 = 8LL;
  }
  else {
    uint64_t v16 = 4LL;
  }
  char v17 = 46;
  if (!v15) {
    char v17 = 53;
  }
  if (a6) {
    uint64_t v18 = v16 + 28;
  }
  else {
    uint64_t v18 = 28LL;
  }
  if (a6) {
    unsigned __int8 v19 = v17;
  }
  else {
    unsigned __int8 v19 = a2;
  }
  __int128 v20 = (void *)[v14 initWithCapacity:v18];
  char v21 = 32;
  v31[0] = objc_msgSend(objc_getProperty((id)a1, v22, 32, 1), "value");
  v31[1] = objc_msgSend(objc_getProperty((id)a1, v23, 40, 1), "value");
  uint64_t v32 = v19;
  BYTE1(v32) = 32;
  *(_DWORD *)((char *)&v32 + 2) = [(id)objc_opt_class() exchangeType];
  if ((*(_BYTE *)(a1 + 11) & 1) != 0)
  {
    BYTE3(v32) = 8;
    char v21 = 40;
  }

  int v24 = v13 + a3;
  if ((*(_BYTE *)(a1 + 10) & 1) != 0) {
    BYTE3(v32) = v21;
  }
  HIDWORD(v32) = bswap32(*(_DWORD *)(a1 + 24));
  unsigned int v33 = bswap32(v18 + (unsigned __int16)v24);
  [v20 appendBytes:v31 length:28];
  if (a6)
  {
    v30[0] = a2;
    v30[1] = bswap32(v24 + v16) >> 16;
    [v20 appendBytes:v30 length:4];
    if (v28)
    {
      v29[0] = __rev16(a4);
      v29[1] = __rev16(a5);
      [v20 appendBytes:v29 length:4];
    }
  }

  return v20;
}

- (uint64_t)copyUnifiedData
{
  if (objc_msgSend(objc_getProperty(a1, a2, 72, 1), "count") != 1) {
    return 0LL;
  }
  objc_msgSend(objc_getProperty(a1, v3, 72, 1), "firstObject");
  return objc_claimAutoreleasedReturnValue();
}

- (id)copyPacketDatagramsForIKESA:(_BYTE *)a1
{
  uint64_t v111 = *MEMORY[0x1895F89C0];
  uint64_t v4 = a2;
  if ((a1[12] & 1) == 0)
  {
    [a1 gatherPayloads];
    -[NEIKEv2IKESA initiatorSPI](v4, v5);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v7, v6, 32LL);

    -[NEIKEv2IKESA responderSPI](v4, v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v10, v9, 40LL);

    if (v4) {
      char v12 = v4[9] & 1;
    }
    else {
      char v12 = 0;
    }
    a1[11] = v12;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    objc_msgSend(objc_getProperty(a1, v11, 80, 1), "reverseObjectEnumerator");
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v102 objects:v110 count:16];
    if (v14)
    {
      unint64_t v15 = v14;
      v99 = a1;
      v91 = v4;
      uint64_t v16 = 0LL;
      char v17 = 0LL;
      uint64_t v18 = 0LL;
      uint64_t v19 = *(void *)v103;
      for (uint64_t i = *(void *)v103; ; uint64_t i = *(void *)v103)
      {
        if (i != v19) {
          objc_enumerationMutation(v13);
        }
        char v21 = *(void **)(*((void *)&v102 + 1) + 8 * v18);
        if ([v21 generatePayloadData])
        {
          *(_DWORD *)buf = 0;
          if (v21) {
            id Property = objc_getProperty(v21, v22, 16LL, 1);
          }
          else {
            id Property = 0LL;
          }
          unsigned int v24 = [Property length] + 4;
          buf[0] = v16;
          *(_WORD *)&buf[2] = bswap32(v24) >> 16;
          uint64_t v25 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FB8]),  "initWithCapacity:",  objc_msgSend(v17, "length") + (unsigned __int16)v24);
          [v25 appendBytes:buf length:4];
          if (v21) {
            id v27 = objc_getProperty(v21, v26, 16LL, 1);
          }
          else {
            id v27 = 0LL;
          }
          [v25 appendData:v27];
          if (v17) {
            [v25 appendData:v17];
          }

          uint64_t v16 = [v21 type];
          char v17 = v25;
        }

        else
        {
          ne_log_large_obj();
          BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v109 = v21;
            _os_log_error_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to generate payload data for %@",  buf,  0xCu);
          }
        }

        if (++v18 >= v15)
        {
          uint64_t v29 = [v13 countByEnumeratingWithState:&v102 objects:v110 count:16];
          if (!v29)
          {
            uint64_t v4 = v91;
            a1 = v99;
            goto LABEL_28;
          }

          unint64_t v15 = v29;
          uint64_t v18 = 0LL;
        }
      }
    }

    uint64_t v16 = 0LL;
    char v17 = 0LL;
LABEL_28:

    if (![(id)objc_opt_class() encryptPayloads])
    {
      v50 = (os_log_s *)-[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]( (uint64_t)a1,  v16,  (unsigned __int16)[v17 length],  0,  0,  0);
      if (!v50)
      {
LABEL_76:
        id v30 = 0LL;
        goto LABEL_70;
      }

      v51 = v50;
      v52 = (NEIKEv2EncryptedPayload *)objc_msgSend( objc_alloc(MEMORY[0x189603FB8]),  "initWithCapacity:",  objc_msgSend(v17, "length") + -[os_log_s length](v50, "length"));
      -[NEIKEv2EncryptedPayload appendData:](v52, "appendData:", v51);
      -[NEIKEv2EncryptedPayload appendData:](v52, "appendData:", v17);
      v106 = v52;
      [MEMORY[0x189603F18] arrayWithObjects:&v106 count:1];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v54, v53, 72LL);

      goto LABEL_68;
    }

    if (v4)
    {
      if ((v4[10] & 1) != 0)
      {
        unsigned int v31 = [v17 length];
        uint64_t v32 = v4;
        unsigned int v34 = -[NEIKEv2IKESA headerOverhead](v32, v33);
        uint64_t v36 = -[NEIKEv2IKESA maximumPacketSize]((uint64_t)v32, v35) - v34 - 32;
        id v38 = objc_getProperty(v32, v37, 208LL, 1);

        LODWORD(v36) = [v38 maximumPayloadSizeWithinLimit:v36];
        if (v36 < v31)
        {
          v39 = v32;
          unsigned int v41 = -[NEIKEv2IKESA headerOverhead](v39, v40);
          uint64_t v43 = -[NEIKEv2IKESA maximumPacketSize]((uint64_t)v39, v42) - v41 - 36;
          id v45 = objc_getProperty(v39, v44, 208LL, 1);
          self = v39;

          unsigned int v46 = [v45 maximumPayloadSizeWithinLimit:v43];
          v96 = v17;
          if (!v46)
          {
            ne_log_obj();
            v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1876B1000, v51, OS_LOG_TYPE_FAULT, "Fragment size of 0 is impossible!", buf, 2u);
            }

            goto LABEL_75;
          }

          unsigned int v47 = [v17 length];
          unsigned int v97 = v47;
          if (v47 / v46 * v46 == v47) {
            int v48 = v47 / v46;
          }
          else {
            LOWORD(v48) = v47 / v46 + 1;
          }
          ne_log_obj();
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v100 = a1;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v109 = (unsigned __int16)v48;
            *(_WORD *)&v109[4] = 1024;
            *(_DWORD *)&v109[6] = v46;
            _os_log_impl( &dword_1876B1000,  v49,  OS_LOG_TYPE_INFO,  "Splitting packet into %u fragments with max size %u each",  buf,  0xEu);
          }

          v92 = v4;

          id v60 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:(unsigned __int16)v48];
          if ((_WORD)v48)
          {
            unsigned int v94 = v46;
            unsigned __int16 v95 = v48;
            v98 = 0LL;
            unsigned __int16 v67 = 1;
            unsigned int v68 = v97;
            unsigned int v93 = (unsigned __int16)v48;
            while (1)
            {
              uint64_t v69 = v46 >= v68 ? v68 : v46;
              objc_msgSend(v17, "subdataWithRange:", v97 - v68, v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v70) {
                break;
              }
              v71 = v70;
              uint64_t v72 = v16;
              if (v67 == 1) {
                unsigned __int8 v73 = v16;
              }
              else {
                unsigned __int8 v73 = 0;
              }
              unsigned __int16 v74 = [v70 length];
              id v76 = objc_getProperty(self, v75, 208LL, 1);
              v77 = -[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]( (uint64_t)v100,  v73,  v74,  v67,  v95,  v76);

              if (!v77)
              {
                v51 = v98;
                char v17 = v96;
                goto LABEL_81;
              }

              if (v67 == 1)
              {
                v79 = v77;

                v98 = v79;
              }

              uint64_t v16 = v72;
              id v80 = objc_getProperty(self, v78, 208LL, 1);
              [v80 constructEncryptedPacketFromPayloadData:v71 authenticatedHeaders:v77];
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              char v17 = v96;
              if (!v81)
              {

                v51 = v98;
                goto LABEL_81;
              }

              [v60 addObject:v81];
              v68 -= v69;

              ++v67;
              unsigned int v46 = v94;
              if (v93 < v67) {
                goto LABEL_62;
              }
            }

            ne_log_obj();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v98;
            if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v71,  OS_LOG_TYPE_FAULT,  "[NSData subdataWithRange:] failed",  buf,  2u);
            }

+ (uint64_t)createPacketFromReceivedData:(uint64_t)a1
{
  *(void *)&v60[5] = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if (![v2 bytes])
  {
    uint64_t v5 = ne_log_obj();
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)id v60 = "+[NEIKEv2Packet createPacketFromReceivedData:]";
    v52 = "%s called with null data.bytes";
LABEL_82:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v5, OS_LOG_TYPE_FAULT, v52, buf, 0xCu);
    goto LABEL_10;
  }

  if ((unint64_t)[v2 length] <= 0x1B)
  {
    uint64_t v5 = ne_log_obj();
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)id v60 = "+[NEIKEv2Packet createPacketFromReceivedData:]";
    v52 = "%s called with null (data.length >= sizeof(ikev2_hdr_t))";
    goto LABEL_82;
  }

  uint64_t v3 = [v2 bytes];
  unint64_t v4 = bswap32(*(_DWORD *)(v3 + 24));
  if ([v2 length] < v4)
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v60[0] = v4;
      LOWORD(v60[1]) = 1024;
      *(_DWORD *)((char *)&v60[1] + 2) = [v2 length];
      objc_super v6 = "Cannot parse packet, header claims to be longer than data (%u > %u)";
      SEL v7 = (os_log_s *)v5;
      uint32_t v8 = 14;
LABEL_67:
      _os_log_error_impl(&dword_1876B1000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  if (*(_BYTE *)(v3 + 17) == 32)
  {
    int v55 = 1;
    id v9 = off_18A087AD0;
    switch(*(_BYTE *)(v3 + 18))
    {
      case '""':
        break;
      case '#':
        int v55 = 0;
        id v9 = off_18A087AB8;
        break;
      case '$':
        int v55 = 0;
        id v9 = off_18A087A10;
        break;
      case '%':
        int v55 = 0;
        id v9 = off_18A087B60;
        break;
      case '+':
        int v55 = 0;
        id v9 = off_18A087B88;
        break;
      case ',':
        int v55 = 0;
        id v9 = off_18A087A90;
        break;
      default:
        uint64_t v5 = ne_log_obj();
        if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        int v11 = *(unsigned __int8 *)(v3 + 18);
        *(_DWORD *)buf = 67109120;
        v60[0] = v11;
        objc_super v6 = "Unknown exchange type %u";
        goto LABEL_66;
    }

    char v12 = objc_alloc_init(*v9);
    uint64_t v5 = (uint64_t)v12;
    if (v12) {
      v12[12] = 1;
    }
    id v58 = v2;
    [MEMORY[0x189603F18] arrayWithObjects:&v58 count:1];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      objc_setProperty_atomic((id)v5, v13, v14, 72LL);
    }

    uint64_t v16 = -[NEIKEv2IKESPI initWithValue:](objc_alloc(&OBJC_CLASS___NEIKEv2IKESPI), "initWithValue:", *(void *)v3);
    if (v5) {
      objc_setProperty_atomic((id)v5, v15, v16, 32LL);
    }

    char v17 = -[NEIKEv2IKESPI initWithValue:]( objc_alloc(&OBJC_CLASS___NEIKEv2IKESPI),  "initWithValue:",  *(void *)(v3 + 8));
    uint64_t v19 = v17;
    if (v5)
    {
      objc_setProperty_atomic((id)v5, v18, v17, 40LL);

      *(_BYTE *)(v5 + 11) = (*(_BYTE *)(v3 + 19) & 8) != 0;
      *(_BYTE *)(v5 + 10) = (*(_BYTE *)(v3 + 19) & 0x20) != 0;
      *(_DWORD *)(v5 + 24) = bswap32(*(_DWORD *)(v3 + 20));
    }

    else
    {
    }

    unsigned int v20 = *(unsigned __int8 *)(v3 + 16);
    id v54 = v2;
    uint64_t v56 = [v2 bytes];
    if (v20 && v4 >= 0x20)
    {
      uint64_t v23 = 28LL;
      *(void *)&__int128 v22 = 67109376LL;
      __int128 v53 = v22;
      while (1)
      {
        unsigned int v24 = (unsigned __int8 *)(v56 + v23);
        uint64_t v25 = bswap32(*(unsigned __int16 *)(v56 + v23 + 2)) >> 16;
        if (v25 <= 3)
        {
          ne_log_obj();
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 67109120;
          v60[0] = v25;
          int v48 = "Bad payload length too short (%u)";
LABEL_77:
          v49 = v45;
          uint32_t v50 = 8;
          goto LABEL_72;
        }

        uint64_t v23 = (v23 + v25);
        if (v23 > v4)
        {
          ne_log_obj();
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 67109120;
          v60[0] = v25;
          int v48 = "Bad payload length too long (%u)";
          goto LABEL_77;
        }

        int v26 = (char)v24[1];
        id v27 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v24 + 4 length:v25 - 4];
        BOOL v28 = +[NEIKEv2Payload createPayloadWithType:fromData:]((uint64_t)&OBJC_CLASS___NEIKEv2Payload, v20, v27);
        if (v28) {
          break;
        }
        if (v26 < 0)
        {
          ne_log_obj();
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v60[0] = v20;
            _os_log_error_impl( &dword_1876B1000,  v32,  OS_LOG_TYPE_ERROR,  "Failed to parse critical payload type %u",  buf,  8u);
          }

          BOOL v28 = 0LL;
          goto LABEL_70;
        }

- (uint64_t)processDecryptedPacketForIKESA:(_BYTE *)a1
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (!a1)
  {
    uint64_t v36 = 0LL;
    goto LABEL_47;
  }

  if ((a1[8] & 1) == 0)
  {
    ne_log_obj();
    SEL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      goto LABEL_36;
    }
    LODWORD(v54.receiver) = 136315138;
    *(id *)((char *)&v54.receiver + 4) = "-[NEIKEv2Packet processDecryptedPacketForIKESA:]";
    id v45 = "%s called with null self.decrypted";
    goto LABEL_52;
  }

  id Property = objc_getProperty(a1, v3, 48LL, 1);
  if (Property && objc_getProperty(Property, v6, 16LL, 1))
  {
    if (v4)
    {
      id v8 = objc_getProperty(a1, v7, 48LL, 1);
      if (v8) {
        id v8 = objc_getProperty(v8, v9, 16LL, 1);
      }
      id v10 = v8;
      unsigned int v11 = [v10 length];
      int v47 = (os_log_s *)v10;
      uint64_t v50 = [v10 bytes];
      int v13 = objc_getProperty(a1, v12, 48LL, 1);
      if (v13)
      {
        unint64_t v14 = v13[4];
        if (v14)
        {
          unint64_t v49 = v11;
          if (v11 >= 4uLL)
          {
            uint64_t v15 = 0LL;
            int v16 = 0;
            id v46 = v4;
            unsigned int v48 = v11;
            while (1)
            {
              char v17 = (unsigned __int8 *)(v50 + v15);
              uint64_t v18 = bswap32(*(unsigned __int16 *)(v50 + v15 + 2)) >> 16;
              if (v18 <= 3)
              {
                ne_log_obj();
                id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_43;
                }
                LODWORD(v54.receiver) = 67109120;
                HIDWORD(v54.receiver) = v18;
                SEL v39 = "Bad payload length too short (%u)";
LABEL_41:
                SEL v40 = v38;
                uint32_t v41 = 8;
                goto LABEL_54;
              }

              uint64_t v15 = (v16 + v18);
              if (v15 > v11)
              {
                ne_log_obj();
                id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_43;
                }
                LODWORD(v54.receiver) = 67109120;
                HIDWORD(v54.receiver) = v18;
                SEL v39 = "Bad payload length too long (%u)";
                goto LABEL_41;
              }

              uint64_t v19 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v17 + 4 length:v18 - 4];
              if (v14 == 47 && (a1[10] & 1) != 0)
              {
                unsigned int v20 = objc_alloc(&OBJC_CLASS___NEIKEv2ResponseConfigPayload);
                id v22 = objc_getProperty(v4, v21, 88LL, 1);
                [v22 configurationRequest];
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                id v24 = v19;
                id v25 = v23;
                if (v20)
                {
                  v54.receiver = v20;
                  v54.super_class = (Class)&OBJC_CLASS___NEIKEv2ResponseConfigPayload;
                  int v26 = (NEIKEv2ResponseConfigPayload *)objc_msgSendSuper2(&v54, sel_init);
                  unsigned int v20 = v26;
                  if (v26)
                  {
                    objc_setProperty_atomic(v26, v27, v24, 16LL);
                    v20->super.super._isInbound = 1;
                    objc_setProperty_atomic(v20, v28, v25, 32LL);
                    if (!-[NEIKEv2ResponseConfigPayload parsePayloadData](v20, "parsePayloadData"))
                    {
                      ne_log_obj();
                      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        __int128 v53 = v20;
                        _os_log_error_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_ERROR,  "Failed to parse payload data for %@",  buf,  0xCu);
                      }

                      unsigned int v20 = 0LL;
                      id v4 = v46;
                    }
                  }
                }

                unsigned int v11 = v48;
                if (v20)
                {
LABEL_23:
                  if (objc_getProperty(a1, v30, 80LL, 1))
                  {
                    objc_msgSend(objc_getProperty(a1, v31, 80, 1), "arrayByAddingObject:", v20);
                  }

                  else
                  {
                    int v51 = v20;
                    [MEMORY[0x189603F18] arrayWithObjects:&v51 count:1];
                  }

                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_setProperty_atomic(a1, v33, v32, 80LL);

                  goto LABEL_30;
                }
              }

              else
              {
                unsigned int v20 = (NEIKEv2ResponseConfigPayload *)+[NEIKEv2Payload createPayloadWithType:fromData:]( (uint64_t)&OBJC_CLASS___NEIKEv2Payload,  v14,  v19);
                if (v20) {
                  goto LABEL_23;
                }
              }

              if ((char)v17[1] < 0)
              {
                ne_log_obj();
                id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v54.receiver) = 67109120;
                  HIDWORD(v54.receiver) = v14;
                  _os_log_error_impl( &dword_1876B1000,  v43,  OS_LOG_TYPE_ERROR,  "Failed to parse critical payload type %u",  (uint8_t *)&v54,  8u);
                }

                goto LABEL_44;
              }

- (uint64_t)processReceivedPacketForIKESA:(_BYTE *)a1
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = 1LL;
  id v6 = objc_getProperty(a1, v5, 48LL, 1);
  id v8 = v6;
  if ((a1[8] & 1) != 0 || !v6) {
    goto LABEL_19;
  }
  if (v3) {
    id Property = objc_getProperty(v3, v7, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v10 = Property;

  if (!v10)
  {
LABEL_18:
    uint64_t v4 = 0LL;
    goto LABEL_19;
  }

  if (v3) {
    id v12 = objc_getProperty(v3, v11, 208LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  id v14 = v12;
  if (!v14)
  {
    ne_log_obj();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      int v22 = 136315138;
      uint64_t v23 = "-[NEIKEv2EncryptedPayload decryptPayloadsUsingSecurityContext:]";
      _os_log_fault_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_FAULT,  "%s called with null securityContext",  (uint8_t *)&v22,  0xCu);
    }

    goto LABEL_17;
  }

  id v15 = objc_getProperty(v8, v13, 16LL, 1);
  objc_msgSend(v14, "decryptPayloadData:authenticatedHeaders:", v15, objc_getProperty(v8, v16, 24, 1));
  char v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    ne_log_obj();
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_1876B1000, v20, OS_LOG_TYPE_ERROR, "Failed to decrypt packet", (uint8_t *)&v22, 2u);
    }

    uint64_t v19 = 0LL;
LABEL_17:

    goto LABEL_18;
  }

  objc_setProperty_atomic(v8, v18, v17, 16LL);

  a1[8] = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v4 = -[NEIKEv2Packet processDecryptedPacketForIKESA:](a1, v3);
  }
LABEL_19:

  return v4;
}

- (void)copyNotification:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = objc_getProperty(a1, a2, 64LL, 1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        if (v8) {
          id v9 = (const char *)v8[3];
        }
        else {
          id v9 = 0LL;
        }
        if (v9 == a2)
        {
          unsigned int v11 = v8;
          goto LABEL_15;
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v10;
    }

    while (v10);
  }

  unsigned int v11 = 0LL;
LABEL_15:

  return v11;
}

- (uint64_t)hasNotification:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = objc_getProperty(a1, a2, 64LL, 1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (v8) {
          uint64_t v8 = *(void *)(v8 + 24);
        }
        if ((const char *)v8 == a2)
        {
          uint64_t v9 = 1LL;
          goto LABEL_14;
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 0LL;
LABEL_14:

  return v9;
}

- (uint64_t)hasErrors
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = objc_getProperty(a1, a2, 64LL, 1);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        if (v6 && (unint64_t)(*(void *)(v6 + 24) - 1LL) < 0x3FFF)
        {
          uint64_t v3 = 1LL;
          goto LABEL_12;
        }
      }

      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)addNotifyPayload:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    if (objc_getProperty(a1, v3, 64LL, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 64, 1), "arrayByAddingObject:", v4);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = v4;
      [MEMORY[0x189603F18] arrayWithObjects:&v11 count:1];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    __int128 v8 = v6;
    objc_setProperty_atomic(a1, v7, v6, 64LL);
  }

  else
  {
    ne_log_obj();
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[NEIKEv2Packet addNotifyPayload:]";
      _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "%s called with null notifyPayload", buf, 0xCu);
    }
  }

  return v4 != 0LL;
}

- (BOOL)addNotification:(void *)a3 data:
{
  id v4 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)&OBJC_CLASS___NEIKEv2NotifyPayload, a2, a3);
  BOOL v5 = -[NEIKEv2Packet addNotifyPayload:](a1, v4);

  return v5;
}

@end