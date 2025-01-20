@interface NEIKEv2SecurityContextCBCPlusHMAC
+ (uint64_t)fixedOverheadForEncryptionProtocol:(void *)a3 integrityProtocol:;
+ (uint64_t)overheadForPlaintextLength:(void *)a3 encryptionProtocol:(void *)a4 integrityProtocol:;
+ (uint64_t)paddingLengthForPlaintextLength:(void *)a3 encryptionProtocol:;
- (__CFData)computeIncomingHMACUsingContext:(void *)a3 authenticatedHeaders:(void *)a4 payloadData:;
- (__CFData)computeOutgoingHMACUsingContext:(void *)a3 payloadData:;
- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (uint64_t)fixedOverheadLength;
- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3;
- (unsigned)overheadForPlaintextLength:(unsigned int)a3;
- (void)dealloc;
@end

@implementation NEIKEv2SecurityContextCBCPlusHMAC

- (void)dealloc
{
  if (self)
  {
    outgoingEncryptionContext = self->_outgoingEncryptionContext;
    if (outgoingEncryptionContext)
    {
      CCCryptorRelease(outgoingEncryptionContext);
      self->_outgoingEncryptionContext = 0LL;
    }

    incomingEncryptionContext = self->_incomingEncryptionContext;
    if (incomingEncryptionContext)
    {
      CCCryptorRelease(incomingEncryptionContext);
      self->_incomingEncryptionContext = 0LL;
    }

    if (self->_outgoingHMACBaseContext)
    {
      CCHmacDestroy();
      self->_outgoingHMACBaseContext = 0LL;
    }

    if (self->_incomingHMACBaseContext)
    {
      CCHmacDestroy();
      self->_incomingHMACBaseContext = 0LL;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEIKEv2SecurityContextCBCPlusHMAC;
  -[NEIKEv2SecurityContextCBCPlusHMAC dealloc](&v5, sel_dealloc);
}

- (unsigned)overheadForPlaintextLength:(unsigned int)a3
{
  if (self)
  {
    objc_super v5 = self->_encryptionProtocol;
    integrityProtocol = self->_integrityProtocol;
  }

  else
  {
    objc_super v5 = 0LL;
    integrityProtocol = 0LL;
  }

  unsigned int v7 = +[NEIKEv2SecurityContextCBCPlusHMAC overheadForPlaintextLength:encryptionProtocol:integrityProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2SecurityContextCBCPlusHMAC,  a3,  v5,  integrityProtocol);

  return v7;
}

- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3
{
  unsigned int v5 = -[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadLength]((uint64_t)self);
  BOOL v6 = a3 >= v5;
  unsigned int v7 = a3 - v5;
  if (v7 == 0 || !v6) {
    return 0;
  }
  if (self) {
    encryptionProtocol = self->_encryptionProtocol;
  }
  else {
    encryptionProtocol = 0LL;
  }
  unsigned int v9 = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)encryptionProtocol);
  if (v7 - 1 >= v7 % v9) {
    return v7 - 1 - v7 % v9;
  }
  else {
    return 0;
  }
}

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned int v8 = [v6 length];
    unsigned int v9 = [v7 length];
    if (self) {
      unsigned __int8 v10 = +[NEIKEv2SecurityContextCBCPlusHMAC paddingLengthForPlaintextLength:encryptionProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2SecurityContextCBCPlusHMAC,  v8,  self->_encryptionProtocol);
    }
    else {
      unsigned __int8 v10 = 0;
    }
    unsigned __int8 v36 = v10;
    size_t v11 = v8 + v10 + 1;
    v12 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FB8]),  "initWithCapacity:",  -[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadLength]((uint64_t)self)
                  + v9
                  + v11);
    [v12 appendData:v7];
    if (self) {
      encryptionProtocol = self->_encryptionProtocol;
    }
    else {
      encryptionProtocol = 0LL;
    }
    unsigned int v14 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)encryptionProtocol);
    v15 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v14);
    v34 = v15;
    if (!v15)
    {
      ne_log_obj();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v38 = v14;
        _os_log_fault_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_FAULT,  "[NEIKEv2Crypto createRandomWithSize:%u] failed",  buf,  8u);
      }

      id v19 = 0LL;
      goto LABEL_25;
    }

    id v33 = v7;
    [v12 appendData:v15];
    id v16 = v6;
    [v12 appendData:v6];
    if (v10)
    {
      int v17 = v10;
      v18 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v10);
      if (!v18)
      {
        ne_log_obj();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v38 = v17;
          _os_log_fault_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_FAULT,  "[NEIKEv2Crypto createRandomWithSize:%u] failed",  buf,  8u);
        }

        id v19 = 0LL;
        id v6 = v16;
        id v7 = v33;
        goto LABEL_25;
      }
    }

    else
    {
      v18 = 0LL;
    }

    [v12 appendData:v18];
    [v12 appendBytes:&v36 length:1];
    v20 = (char *)([v12 mutableBytes] + v9);
    if (self) {
      outgoingEncryptionContext = self->_outgoingEncryptionContext;
    }
    else {
      outgoingEncryptionContext = 0LL;
    }
    v22 = &v20[v14];
    CCCryptorStatus v23 = CCCryptorReset(outgoingEncryptionContext, v20);
    if (v23)
    {
      CCCryptorStatus v31 = v23;
      ne_log_obj();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v38 = v31;
        _os_log_fault_impl(&dword_1876B1000, v32, OS_LOG_TYPE_FAULT, "CCCryptorReset failed: %d)", buf, 8u);
      }
    }

    size_t dataOutMoved = 0LL;
    if (self) {
      v24 = self->_outgoingEncryptionContext;
    }
    else {
      v24 = 0LL;
    }
    id v6 = v16;
    CCCryptorStatus v25 = CCCryptorUpdate(v24, v22, v11, v22, v11, &dataOutMoved);
    id v7 = v33;
    if (v25 || dataOutMoved != v11)
    {
      ne_log_obj();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v38 = v25;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v11;
        __int16 v39 = 2048;
        size_t v40 = dataOutMoved;
        _os_log_fault_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_FAULT,  "CCCryptorUpdate failed: status %d, original %u, decrypted %zu)",  buf,  0x18u);
      }
    }

    else
    {
      if (self)
      {
        outgoingHMACBaseContext = self->_outgoingHMACBaseContext;
        v27 = self;
      }

      else
      {
        v27 = 0LL;
        outgoingHMACBaseContext = 0LL;
      }

      -[NEIKEv2SecurityContextCBCPlusHMAC computeOutgoingHMACUsingContext:payloadData:]( (uint64_t)v27,  (uint64_t)outgoingHMACBaseContext,  v12);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        [v12 appendData:v28];
        id v19 = v12;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }

    id v19 = 0LL;
    goto LABEL_24;
  }

  ne_log_obj();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v38 = "-[NEIKEv2SecurityContextCBCPlusHMAC constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
    _os_log_fault_impl(&dword_1876B1000, v30, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", buf, 0xCu);
  }

  id v19 = 0LL;
LABEL_26:

  return v19;
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = v7;
  if (!v6)
  {
    ne_log_obj();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v34 = "-[NEIKEv2SecurityContextCBCPlusHMAC decryptPayloadData:authenticatedHeaders:]";
    v28 = "%s called with null payloadData";
LABEL_35:
    _os_log_fault_impl(&dword_1876B1000, v16, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_38;
  }

  if (!v7)
  {
    ne_log_obj();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v34 = "-[NEIKEv2SecurityContextCBCPlusHMAC decryptPayloadData:authenticatedHeaders:]";
    v28 = "%s called with null authenticatedHeaders";
    goto LABEL_35;
  }

  if (self)
  {
    int v9 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)self->_encryptionProtocol);
    integrityProtocol = self->_integrityProtocol;
  }

  else
  {
    int v9 = -[NEIKEv2EncryptionProtocol ivLength](0LL);
    integrityProtocol = 0LL;
  }

  int v11 = -[NEIKEv2IntegrityProtocol digestLength]((uint64_t)integrityProtocol);
  unsigned int v12 = [v6 length];
  unsigned int v13 = v12;
  if (self)
  {
    if (self->super._minimumEncryptedPayloadSize > v12)
    {
      ne_log_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v34 = v13;
        _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "Cannot decrypt, encrypted data length %u too short",  buf,  8u);
      }

      goto LABEL_38;
    }

    incomingHMACBaseContext = self->_incomingHMACBaseContext;
    v15 = self;
  }

  else
  {
    v15 = 0LL;
    incomingHMACBaseContext = 0LL;
  }

  -[NEIKEv2SecurityContextCBCPlusHMAC computeIncomingHMACUsingContext:authenticatedHeaders:payloadData:]( (uint64_t)v15,  (uint64_t)incomingHMACBaseContext,  v8,  v6);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_38:
    v20 = 0LL;
    goto LABEL_27;
  }

  [v6 bytes];
  -[os_log_s bytes](v16, "bytes");
  if (cc_cmp_safe())
  {
    ne_log_obj();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v19, OS_LOG_TYPE_ERROR, "Integrity check failure", buf, 2u);
    }

    goto LABEL_15;
  }

  size_t v17 = v13 - v9 - v11;
  if (self) {
    encryptionProtocol = self->_encryptionProtocol;
  }
  else {
    encryptionProtocol = 0LL;
  }
  if (!(v17 % -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)encryptionProtocol)))
  {
    id v19 = (os_log_s *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:v17];
    v21 = (char *)[v6 bytes];
    if (self) {
      incomingEncryptionContext = self->_incomingEncryptionContext;
    }
    else {
      incomingEncryptionContext = 0LL;
    }
    CCCryptorStatus v23 = CCCryptorReset(incomingEncryptionContext, v21);
    if (v23)
    {
      CCCryptorStatus v29 = v23;
      ne_log_obj();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v34 = v29;
        _os_log_fault_impl(&dword_1876B1000, v30, OS_LOG_TYPE_FAULT, "CCCryptorReset failed: %d)", buf, 8u);
      }
    }

    v24 = &v21[v9];
    size_t dataOutMoved = 0LL;
    if (self) {
      self = (NEIKEv2SecurityContextCBCPlusHMAC *)self->_incomingEncryptionContext;
    }
    CCCryptorStatus v25 = CCCryptorUpdate( (CCCryptorRef)self,  v24,  v17,  (void *)-[os_log_s mutableBytes](v19, "mutableBytes"),  v17,  &dataOutMoved);
    if (v25 || dataOutMoved != v17)
    {
      ne_log_obj();
      CCCryptorStatus v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v34 = v25;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v17;
        __int16 v35 = 2048;
        size_t v36 = dataOutMoved;
        _os_log_fault_impl( &dword_1876B1000,  v31,  OS_LOG_TYPE_FAULT,  "CC decrypt failed: status %d, original %u, decrypted %zu)",  buf,  0x18u);
      }
    }

    else if (+[NEIKEv2SecurityContext removePaddingFromDecryptedPayload:]( (uint64_t)&OBJC_CLASS___NEIKEv2SecurityContext,  v19))
    {
      v20 = v19;
LABEL_25:
      id v16 = 0LL;
      goto LABEL_26;
    }

    v20 = 0LL;
    goto LABEL_25;
  }

  ne_log_obj();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    if (self) {
      v27 = self->_encryptionProtocol;
    }
    else {
      v27 = 0LL;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v34 = v17;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)v27);
    _os_log_error_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_ERROR,  "Ciphertext length %u is not a multiple of the cipher block length %u",  buf,  0xEu);
  }

  id v16 = 0LL;
LABEL_15:
  v20 = 0LL;
LABEL_26:

LABEL_27:
  return v20;
}

- (void).cxx_destruct
{
}

- (__CFData)computeIncomingHMACUsingContext:(void *)a3 authenticatedHeaders:(void *)a4 payloadData:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!a1)
  {
    unsigned int v14 = 0LL;
    goto LABEL_10;
  }

  CFIndex v9 = CCHmacOutputSizeFromRef();
  unsigned int v10 = -[NEIKEv2IntegrityProtocol digestLength](*(void *)(a1 + 40));
  int v11 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], v9);
  if (!v11)
  {
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v18 = 134217984;
      CFIndex v19 = v9;
      _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed",  (uint8_t *)&v18,  0xCu);
    }

    goto LABEL_8;
  }

  unsigned int v12 = (CCHmacContext *)CCHmacClone();
  if (!a2)
  {
    ne_log_obj();
    size_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v18) = 0;
      _os_log_fault_impl(&dword_1876B1000, v17, OS_LOG_TYPE_FAULT, "CCHmacClone failed", (uint8_t *)&v18, 2u);
    }

LABEL_8:
    unsigned int v14 = 0LL;
    goto LABEL_9;
  }

  unsigned int v13 = v12;
  CCHmacUpdate(v12, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  CCHmacUpdate(v13, (const void *)[v8 bytes], objc_msgSend(v8, "length") - v10);
  CCHmacFinal(v13, (void *)-[__CFData mutableBytes](v11, "mutableBytes"));
  -[__CFData setLength:](v11, "setLength:", v10);
  CCHmacDestroy();
  unsigned int v14 = v11;
LABEL_9:

LABEL_10:
  return v14;
}

- (uint64_t)fixedOverheadLength
{
  if (result)
  {
    v1 = *(void **)(result + 40);
    id v2 = *(id *)(result + 16);
    uint64_t v3 = +[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadForEncryptionProtocol:integrityProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2SecurityContextCBCPlusHMAC,  v2,  v1);

    return v3;
  }

  return result;
}

- (__CFData)computeOutgoingHMACUsingContext:(void *)a3 payloadData:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!a1)
  {
    int v11 = 0LL;
    goto LABEL_10;
  }

  CFIndex v6 = CCHmacOutputSizeFromRef();
  unsigned int v7 = -[NEIKEv2IntegrityProtocol digestLength](*(void *)(a1 + 40));
  id v8 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], v6);
  if (!v8)
  {
    ne_log_obj();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v15 = 134217984;
      CFIndex v16 = v6;
      _os_log_fault_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed",  (uint8_t *)&v15,  0xCu);
    }

    goto LABEL_8;
  }

  CFIndex v9 = (CCHmacContext *)CCHmacClone();
  if (!a2)
  {
    ne_log_obj();
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, "CCHmacClone failed", (uint8_t *)&v15, 2u);
    }

LABEL_8:
    int v11 = 0LL;
    goto LABEL_9;
  }

  unsigned int v10 = v9;
  CCHmacUpdate(v9, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  CCHmacFinal(v10, (void *)-[__CFData mutableBytes](v8, "mutableBytes"));
  -[__CFData setLength:](v8, "setLength:", v7);
  CCHmacDestroy();
  int v11 = v8;
LABEL_9:

LABEL_10:
  return v11;
}

+ (uint64_t)fixedOverheadForEncryptionProtocol:(void *)a3 integrityProtocol:
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_self();
  int v6 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)v5);

  LODWORD(v5) = -[NEIKEv2IntegrityProtocol digestLength]((uint64_t)v4);
  return ((_DWORD)v5 + v6);
}

+ (uint64_t)paddingLengthForPlaintextLength:(void *)a3 encryptionProtocol:
{
  id v4 = a3;
  objc_opt_self();
  unsigned int v5 = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)v4);

  int v6 = ((unint64_t)a2 + 1) % v5;
  if (v6) {
    return v5 - v6;
  }
  else {
    return 0LL;
  }
}

+ (uint64_t)overheadForPlaintextLength:(void *)a3 encryptionProtocol:(void *)a4 integrityProtocol:
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_self();
  int v8 = +[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadForEncryptionProtocol:integrityProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2SecurityContextCBCPlusHMAC,  v7,  v6);

  int v9 = +[NEIKEv2SecurityContextCBCPlusHMAC paddingLengthForPlaintextLength:encryptionProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2SecurityContextCBCPlusHMAC,  a2,  v7);
  return (v8 + v9 + 1);
}

@end