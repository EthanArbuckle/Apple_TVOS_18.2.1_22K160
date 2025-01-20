@interface NEIKEv2IKESA
+ (os_log_s)createAuthenticationDataForSharedSecret:(void *)a3 octets:(void *)a4 prfProtocol:;
+ (void)copyPPKFromConfig:(uint64_t)a1;
+ (void)copySharedSecretFromConfig:(uint64_t)a1;
- (CFMutableDataRef)createIntAuthOctets;
- (CFTypeRef)copyCertSigningKey;
- (NEIKEv2AddressIdentifier)localIdentifier;
- (NEIKEv2AuthPayload)copyAuthenticationPayloadUsingPrimeKey:(id *)self;
- (SecKeyRef)checkValidityOfCertificates:(void *)a1;
- (_BYTE)copyInitiatorIdentifier;
- (_BYTE)copyResponderIdentifier;
- (_BYTE)hasTransport;
- (_BYTE)headerOverhead;
- (_BYTE)initiatorSPI;
- (_BYTE)responderSPI;
- (__CFData)deriveKeyFromPrimeKey:(void *)a1 hmacContext:(void *)a2;
- (id)authenticationProtocol;
- (id)copyForRekey;
- (id)copyRemoteCertificateAuthorityArray;
- (id)copyRemoteCertificateAuthorityHashData;
- (id)copyTransport;
- (id)description;
- (id)initIKESAWithConfiguration:(void *)a3 sessionConfiguration:(void *)a4 queue:(void *)a5 initialTransport:(void *)a6 transportDelegate:(void *)a7 socketGetBlock:(void *)a8 packetDelegate:(void *)a9 configurationDelegate:(uint64_t)a10 ikeSessionUniqueIndex:;
- (id)initiatorFirstMessage;
- (id)initiatorNonce;
- (id)ppk;
- (id)preferredKEMProtocol;
- (id)remoteAuthentication;
- (id)remoteIdentifier;
- (id)responderFirstMessage;
- (id)responderNonce;
- (id)sharedSecret;
- (os_log_s)copyLocalCertificateData;
- (os_log_s)createAuthenticationDataForSharedSecret:(void *)a3 octets:;
- (os_log_s)createInitiatorEAPAuthenticationDataUsingPrimeKey:(os_log_s *)self;
- (os_log_s)createInitiatorGSPMAuthenticationDataUsingPrimeKey:(os_log_s *)self;
- (os_log_s)createInitiatorSignedOctetsUsingPrimeKey:(uint64_t)a1;
- (os_log_s)createResponderGSPMAuthenticationDataUsingPrimeKey:(os_log_s *)self;
- (os_log_s)createResponderSignedOctetsUsingPrimeKey:(_BYTE *)a1;
- (uint64_t)checkSharedKeyAuthData:(const char *)a3 usingPrimeKey:;
- (uint64_t)copyLocalSecIdentity;
- (uint64_t)createRemoteSignedOctetsUsingPrimeKey:(uint64_t)a1;
- (uint64_t)generateAllValuesForSAInit;
- (uint64_t)generateAllValuesUsingSA:(_BYTE *)a1;
- (uint64_t)generateDerivativesFromPPK:(uint64_t)a1;
- (uint64_t)generateInitialValues;
- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1;
- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a3 peerPayload:;
- (uint64_t)maximumPacketSize;
- (uint64_t)processCurrentKeyExchange;
- (uint64_t)processPrimaryKeyExchange;
- (uint64_t)updateIntAuthWithPacket:(uint64_t)a1;
- (uint64_t)usesEAPOnlyAuthentication;
- (unint64_t)selectSecurePasswordMethod:(void *)a1;
- (void)assignRemoteSPI:(void *)a1;
- (void)clearAuthenticationSecrets;
- (void)createConcatedNoncesAndReturnError:(_BYTE *)a1;
- (void)createConcatenatedSPIsAndReturnError:(_BYTE *)a1;
- (void)dealloc;
- (void)detachTransportWithShouldInvalidate:(void *)a1;
- (void)restorePrimeKeys;
- (void)resyncAddress;
- (void)setAuthProtocolFromPacket:(uint64_t)a1;
- (void)setLocalAuthProtocolUsed:(uint64_t)a1;
- (void)setPpkIDFromPacket:(uint64_t)a1;
- (void)setPrimeAuthenticationDataFromPacket:(uint64_t)a1;
- (void)setRemoteAuthProtocolUsed:(uint64_t)a1;
- (void)setState:(void *)a3 error:;
- (void)switchToNATTraversalPorts;
@end

@implementation NEIKEv2IKESA

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty(a1, v3, 160LL, 1);

    if (v5)
    {
      ne_log_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315138;
        v14 = "-[NEIKEv2IKESA(Crypto) generateLocalValuesForKEMProtocol:]";
        _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "%s called with null !self.currentKEHandler",  (uint8_t *)&v13,  0xCu);
      }
    }

    else
    {
      v8 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:]( (uint64_t)NEIKEv2KeyExchangeHandler,  [v4 method]);
      objc_setProperty_atomic(a1, v9, v8, 160LL);

      uint64_t v7 = 1LL;
      id v11 = objc_getProperty(a1, v10, 160LL, 1);

      if (v11) {
        goto LABEL_8;
      }
      ne_log_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        v14 = (const char *)v4;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to get handler for KE method %@",  (uint8_t *)&v13,  0xCu);
      }
    }
  }

  uint64_t v7 = 0LL;
LABEL_8:

  return v7;
}

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a3 peerPayload:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v8 = objc_getProperty(a1, v6, 160LL, 1);

    if (v8)
    {
      ne_log_obj();
      SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315138;
        v17 = "-[NEIKEv2IKESA(Crypto) generateLocalValuesForKEMProtocol:peerPayload:]";
        _os_log_fault_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null !self.currentKEHandler",  (uint8_t *)&v16,  0xCu);
      }
    }

    else
    {
      id v11 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:peerPayload:]( (uint64_t)NEIKEv2KeyExchangeHandler,  [v5 method],  v7);
      objc_setProperty_atomic(a1, v12, v11, 160LL);

      uint64_t v10 = 1LL;
      id v14 = objc_getProperty(a1, v13, 160LL, 1);

      if (v14) {
        goto LABEL_8;
      }
      ne_log_obj();
      SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        v17 = (const char *)v5;
        _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to get handler for KE method %@",  (uint8_t *)&v16,  0xCu);
      }
    }
  }

  uint64_t v10 = 0LL;
LABEL_8:

  return v10;
}

- (uint64_t)generateInitialValues
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v2 = a1;
  v3 = -[NEIKEv2IKESA preferredKEMProtocol](a1, a2);
  id v4 = v3;
  if (!v3 || [v3 method] == 36 || objc_msgSend(v4, "method") == 37)
  {
    ne_log_obj();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v58 = v4;
      _os_log_fault_impl(&dword_1876B1000, v45, OS_LOG_TYPE_FAULT, "KE method %@ is not Diffie-Hellman", buf, 0xCu);
    }

    return 0LL;
  }

  uint64_t v5 = -[NEIKEv2IKESA generateLocalValuesForKEMProtocol:](v2, v4);

  if ((_DWORD)v5)
  {
    id v7 = objc_getProperty(v2, v6, 80LL, 1);
    unsigned int v8 = [v7 nonceSize];

    if (v8 - 257 <= 0xFFFFFF0E)
    {
      ne_log_obj();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v58 = v8;
      v42 = "Invalid nonce size %u";
      v43 = v32;
      uint32_t v44 = 8;
      goto LABEL_36;
    }

    id v10 = objc_getProperty(v2, v9, 80LL, 1);
    int v11 = [v10 strictNonceSizeChecks];

    if (v11)
    {
      id v13 = objc_getProperty(v2, v12, 96LL, 1);

      if (v13)
      {
        id v15 = objc_getProperty(v2, v14, 96LL, 1);
        v17 = -[NEIKEv2IKESAProposal prfProtocol](v15, v16);
        unsigned int v18 = [v17 nonceSize];
      }

      else
      {
        unsigned int v46 = v8;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        v47 = v2;
        id v19 = objc_getProperty(v2, v14, 80LL, 1);
        [v19 proposals];
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        unsigned int v18 = 16;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:buf count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v53;
          unsigned int v18 = 16;
          do
          {
            for (uint64_t i = 0LL; i != v22; ++i)
            {
              if (*(void *)v53 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              __int128 v48 = 0u;
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              __int128 v51 = 0u;
              [v25 prfProtocols];
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v49;
                do
                {
                  for (uint64_t j = 0LL; j != v28; ++j)
                  {
                    if (*(void *)v49 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    v31 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                  }

                  uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
                }

                while (v28);
              }
            }

            uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:buf count:16];
          }

          while (v22);
        }

        v2 = v47;
        unsigned int v8 = v46;
      }

      if (v8 < v18)
      {
        ne_log_obj();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
LABEL_29:

          return 0LL;
        }

        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v58 = v8;
        *(_WORD *)&v58[4] = 1024;
        *(_DWORD *)&v58[6] = v18;
        v42 = "Nonce size %u < minimum %u";
        v43 = v32;
        uint32_t v44 = 14;
LABEL_36:
        _os_log_fault_impl(&dword_1876B1000, v43, OS_LOG_TYPE_FAULT, v42, buf, v44);
        goto LABEL_29;
      }
    }

    id v33 = objc_getProperty(v2, v12, 280LL, 1);
    if (!v33
      || (v35 = v33,
          uint64_t v5 = 1LL,
          id v36 = objc_getProperty(v2, v34, 128LL, 1),
          v36,
          v35,
          !v36))
    {
      v37 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v8);
      objc_setProperty_atomic(v2, v38, v37, 128LL);

      id v40 = objc_getProperty(v2, v39, 128LL, 1);
      uint64_t v5 = v40 != 0LL;
    }
  }

  return v5;
}

- (uint64_t)processCurrentKeyExchange
{
  id v2 = self;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (self) {
    self = objc_getProperty(self, a2, 160LL, 1);
  }
  id v3 = self;

  if (!v3)
  {
    ne_log_obj();
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT))
    {
LABEL_11:

      return 0LL;
    }

    int v16 = 136315138;
    v17 = "-[NEIKEv2IKESA(Crypto) processCurrentKeyExchange]";
    id v15 = "%s called with null self.currentKEHandler";
LABEL_14:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }

  objc_getProperty(v2, v4, 152LL, 1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    ne_log_obj();
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    int v16 = 136315138;
    v17 = "-[NEIKEv2IKESA(Crypto) processCurrentKeyExchange]";
    id v15 = "%s called with null self.remoteKeyExchangeData";
    goto LABEL_14;
  }

  objc_getProperty(v2, v6, 152LL, 1);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_setProperty_atomic(v2, v7, 0LL, 152LL);
    id Property = objc_getProperty(v2, v9, 160LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  id v11 = Property;
  uint64_t v12 = [v11 processPeerPayload:v8];

  return v12;
}

- (uint64_t)processPrimaryKeyExchange
{
  if (result)
  {
    id v2 = (void *)result;
    result = -[NEIKEv2IKESA processCurrentKeyExchange]((id)result, a2);
    if ((_DWORD)result)
    {
      id v4 = objc_getProperty(v2, v3, 160LL, 1);
      v6 = v4;
      if (v4) {
        id v7 = (void *)*((void *)v4 + 3);
      }
      else {
        id v7 = 0LL;
      }
      objc_setProperty_atomic(v2, v5, v7, 168LL);

      objc_setProperty_atomic(v2, v8, 0LL, 160LL);
      return 1LL;
    }
  }

  return result;
}

- (uint64_t)generateAllValuesForSAInit
{
  if (a1)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, "Failed to process KE data", v5, 2u);
    }
  }

  return 0LL;
}

- (uint64_t)generateAllValuesUsingSA:(_BYTE *)a1
{
  uint64_t v246 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;

  if (!v6)
  {
    ne_log_obj();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.chosenProposal";
LABEL_109:
    _os_log_fault_impl(&dword_1876B1000, v29, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
    goto LABEL_110;
  }

  -[NEIKEv2IKESA initiatorNonce](a1, v7);
  SEL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.initiatorNonce";
    goto LABEL_109;
  }

  -[NEIKEv2IKESA responderNonce](a1, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.responderNonce";
    goto LABEL_109;
  }

  objc_getProperty(a1, v11, 168LL, 1);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    ne_log_obj();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.primarySharedSecret";
    goto LABEL_109;
  }

  BOOL v14 = v4 != a1;
  if (!v4) {
    BOOL v14 = 0;
  }
  BOOL v222 = v14;
  BOOL v15 = v4 == a1 || v4 != 0LL;
  v221 = v4;
  if (!v15)
  {
    objc_getProperty(a1, v13, 168LL, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1) {
      objc_setProperty_atomic(a1, v31, 0LL, 168LL);
    }
    v32 = -[NEIKEv2IKESA initiatorNonce](a1, v31);
    uint64_t v33 = [v32 length];
    v35 = -[NEIKEv2IKESA responderNonce](a1, v34);
    CFIndex v36 = [v35 length] + v33;

    CFMutableDataRef v37 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x189603FB8], v36);
    if (v37)
    {
      CFMutableDataRef v39 = v37;
      -[NEIKEv2IKESA initiatorNonce](a1, v38);
      id v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v39, "appendData:", v40);
      v42 = -[NEIKEv2IKESA responderNonce](a1, v41);
      -[__CFData appendData:](v39, "appendData:", v42);

      CFMutableDataRef v44 = v20;
      CFMutableDataRef v219 = v44;
      goto LABEL_38;
    }

    ne_log_obj();
    v198 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v241 = (const char *)v36;
      goto LABEL_234;
    }

- (__CFData)deriveKeyFromPrimeKey:(void *)a1 hmacContext:(void *)a2
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;
  -[NEIKEv2IKESAProposal prfProtocol](v6, v7);
  SEL v8 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = -[NEIKEv2PRFProtocol length]((uint64_t)v8);

  uint64_t v10 = CCHmacOutputSizeFromRef();
  if (v10 != v9)
  {
    uint64_t v15 = v10;
    ne_log_obj();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v18) = 67109376;
      HIDWORD(v18) = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v15;
      _os_log_fault_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_FAULT,  "PRF length %u != HMAC output size %zu",  (uint8_t *)&v18,  0x12u);
    }
  }

  id v11 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], v9);
  if (v11)
  {
    uint64_t v12 = (CCHmacContext *)CCHmacClone();
    LOBYTE(v18) = 1;
    CCHmacUpdate(v12, (const void *)objc_msgSend(v4, "bytes", v18), objc_msgSend(v4, "length"));
    CCHmacUpdate(v12, &v18, 1uLL);
    CCHmacFinal(v12, (void *)-[__CFData mutableBytes](v11, "mutableBytes"));
    CCHmacDestroy();
    id v13 = v11;
  }

  else
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v18) = 67109120;
      HIDWORD(v18) = v9;
      _os_log_fault_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed",  (uint8_t *)&v18,  8u);
    }

    id v13 = 0LL;
  }

  return v13;
}

- (uint64_t)generateDerivativesFromPPK:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v5 = v3;
  if (!a1) {
    goto LABEL_24;
  }
  if (!v3)
  {
    ne_log_obj();
    CFMutableDataRef v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v50 = 136315138;
    __int128 v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null ppk";
    goto LABEL_20;
  }

  id v6 = objc_getProperty((id)a1, v4, 216LL, 1);

  if (!v6)
  {
    ne_log_obj();
    CFMutableDataRef v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v50 = 136315138;
    __int128 v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null self.skD";
LABEL_20:
    v47 = v44;
    uint32_t v48 = 12;
LABEL_21:
    _os_log_fault_impl(&dword_1876B1000, v47, OS_LOG_TYPE_FAULT, v45, (uint8_t *)&v50, v48);
    goto LABEL_22;
  }

  objc_getProperty((id)a1, v7, 232LL, 1);
  SEL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    CFMutableDataRef v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v50 = 136315138;
    __int128 v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null self.skPi";
    goto LABEL_20;
  }

  objc_getProperty((id)a1, v9, 248LL, 1);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    CFMutableDataRef v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      int v50 = 136315138;
      __int128 v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
      v45 = "%s called with null self.skPr";
      goto LABEL_20;
    }

- (void)restorePrimeKeys
{
  if (a1)
  {
    objc_getProperty(a1, a2, 224LL, 1);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_getProperty(a1, v4, 224LL, 1);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v6, v5, 216LL);

      objc_setProperty_atomic(a1, v7, 0LL, 224LL);
    }

    objc_getProperty(a1, v4, 240LL, 1);
    SEL v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_getProperty(a1, v9, 240LL, 1);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v11, v10, 232LL);

      objc_setProperty_atomic(a1, v12, 0LL, 240LL);
    }

    objc_getProperty(a1, v9, 256LL, 1);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_getProperty(a1, v14, 256LL, 1);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v16, v15, 248LL);

      objc_setProperty_atomic(a1, v17, 0LL, 256LL);
    }

    ne_log_obj();
    SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)SEL v19 = 0;
      _os_log_debug_impl(&dword_1876B1000, v18, OS_LOG_TYPE_DEBUG, "Restored prime keys", v19, 2u);
    }
  }

- (id)copyRemoteCertificateAuthorityArray
{
  uint64_t v101 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v3)
  {
    ne_log_obj();
    SEL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "[[NSMutableArray alloc] init] failed",  (uint8_t *)&buf,  2u);
    }

    goto LABEL_55;
  }

  if (a1) {
    id Property = objc_getProperty(a1, v2, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 remoteCertificateAuthorityReferences];
  SEL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    SEL v8 = v6;
    uint64_t v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v75,  v84,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v76;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v76 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  *(void **)(*((void *)&v75 + 1) + 8 * i),  0);
          if (v13)
          {
            BOOL v14 = (const void *)v13;
            [v3 addObject:v13];
            CFRelease(v14);
          }
        }

        uint64_t v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v75,  v84,  16LL);
      }

      while (v10);
    }

    if (![v3 count] && -[os_log_s count](v8, "count"))
    {
      ne_log_obj();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "failed to retrieve remote CA cert data by references",  (uint8_t *)&buf,  2u);
      }

      goto LABEL_53;
    }

    goto LABEL_54;
  }

  if (a1) {
    id v16 = objc_getProperty(a1, v7, 88LL, 1);
  }
  else {
    id v16 = 0LL;
  }
  id v17 = v16;
  [v17 remoteCertificateAuthorityName];
  SEL v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1) {
    id v20 = objc_getProperty(a1, v19, 88LL, 1);
  }
  else {
    id v20 = 0LL;
  }
  id v21 = v20;
  [v21 remoteCertificateAuthorityHash];
  SEL v22 = (void *)objc_claimAutoreleasedReturnValue();

  id v23 = v18;
  id v24 = v22;
  uint64_t v25 = v23;
  id v26 = v24;
  objc_opt_self();
  id v74 = v23;
  if (!v23)
  {
    id v38 = 0LL;
    goto LABEL_38;
  }

  id v66 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v66)
  {
    ne_log_obj();
    SEL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl( &dword_1876B1000,  v37,  OS_LOG_TYPE_FAULT,  "[[NSMutableArray alloc] init] failed",  (uint8_t *)&buf,  2u);
    }

    goto LABEL_36;
  }

  objc_opt_self();
  uint64_t v27 = *MEMORY[0x18960BB40];
  uint64_t v28 = *MEMORY[0x18960BE30];
  uint64_t v72 = *MEMORY[0x18960BB38];
  *(void *)&__int128 v89 = *MEMORY[0x18960BB38];
  *((void *)&v89 + 1) = v28;
  uint64_t v29 = *MEMORY[0x189604DE8];
  uint64_t v71 = v27;
  *(void *)&__int128 buf = v27;
  *((void *)&buf + 1) = v29;
  uint64_t v30 = *MEMORY[0x18960BDA8];
  uint64_t v31 = *MEMORY[0x18960BE70];
  *(void *)&__int128 v90 = *MEMORY[0x18960BDA0];
  *((void *)&v90 + 1) = v31;
  uint64_t v69 = v31;
  uint64_t v70 = v29;
  uint64_t v87 = v30;
  uint64_t v88 = v29;
  [MEMORY[0x189603F68] dictionaryWithObjects:&buf forKeys:&v89 count:4];
  SEL v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  *(void *)&__int128 result = 0LL;
  OSStatus v33 = SecItemCopyMatching(v32, (CFTypeRef *)&result);
  v34 = (void *)result;
  id v73 = v26;
  if (v33 || ![(id)result count])
  {
    ne_log_obj();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v93 = 67109120;
      *(_DWORD *)&v93[4] = v33;
      _os_log_error_impl(&dword_1876B1000, v35, OS_LOG_TYPE_ERROR, "failed to retrieve all certificate (%d)", v93, 8u);
    }

    id v26 = v73;
    goto LABEL_30;
  }

  id v49 = v34;

  if (!v49)
  {
LABEL_30:
    ne_log_obj();
    SEL v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl( &dword_1876B1000,  v36,  OS_LOG_TYPE_ERROR,  "[NEIKEv2Crypto copyAllCertificates]",  (uint8_t *)&buf,  2u);
    }

    SEL v37 = 0LL;
LABEL_36:
    id v38 = 0LL;
    goto LABEL_37;
  }

  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  SEL v37 = (os_log_s *)v49;
  uint64_t v50 = -[os_log_s countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v89,  &buf,  16LL);
  if (!v50) {
    goto LABEL_84;
  }
  uint64_t v51 = v50;
  uint64_t v52 = *(void *)v90;
  uint64_t v68 = *MEMORY[0x18960BE28];
  uint64_t v67 = *MEMORY[0x18960BE88];
  do
  {
    uint64_t v53 = 0LL;
    do
    {
      if (*(void *)v90 != v52) {
        objc_enumerationMutation(v37);
      }
      uint64_t v54 = *(void *)(*((void *)&v89 + 1) + 8 * v53);
      __int128 v55 = (void *)SecCertificateCopyCommonNames();
      v56 = v55;
      if (v55 && [v55 containsObject:v25])
      {
        if (v73
          && (uint64_t v57 = (void *)SecCertificateCopySHA256Digest(),
              int v58 = [v57 isEqualToData:v73],
              v57,
              !v58))
        {
          ne_log_obj();
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_76;
          }
          LODWORD(result) = 138412290;
          uint64_t v25 = v74;
          *(void *)((char *)&result + 4) = v74;
          _os_log_impl( &dword_1876B1000,  v63,  OS_LOG_TYPE_DEFAULT,  "certificate hash did not match for CN (%@)",  (uint8_t *)&result,  0xCu);
        }

        else
        {
          objc_opt_self();
          if (v54)
          {
            *(void *)id v93 = v68;
            uint64_t v94 = v67;
            *(void *)&__int128 result = v70;
            *((void *)&result + 1) = v54;
            uint64_t v95 = v72;
            uint64_t v96 = v69;
            uint64_t v98 = v71;
            uint64_t v99 = v70;
            [MEMORY[0x189603F68] dictionaryWithObjects:&result forKeys:v93 count:4];
            uint64_t v59 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            *(void *)v100 = 0LL;
            OSStatus v60 = SecItemCopyMatching(v59, (CFTypeRef *)v100);
            v61 = *(void **)v100;
            if (v60)
            {
              ne_log_obj();
              v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)id v83 = 0;
                _os_log_fault_impl(&dword_1876B1000, v62, OS_LOG_TYPE_FAULT, "SecItemCopyMatching failed", v83, 2u);
              }

              v63 = 0LL;
            }

            else
            {
              v63 = (os_log_s *)*(id *)v100;

              if (v63) {
                [v66 addObject:v63];
              }
            }

- (id)copyRemoteCertificateAuthorityHashData
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FB8]);
  if (!v2)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v4, OS_LOG_TYPE_FAULT, "[[NSMutableData alloc] init] failed", buf, 2u);
    }

    goto LABEL_26;
  }

  id v3 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](a1);
  if (!v3)
  {
    ne_log_obj();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "[self copyRemoteCertificateAuthorityArray] failed",  buf,  2u);
    }

    id v4 = 0LL;
    goto LABEL_26;
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = (os_log_s *)v3;
  uint64_t v5 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (!v5) {
    goto LABEL_19;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v18;
  do
  {
    uint64_t v8 = 0LL;
    do
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
      objc_opt_self();
      if (v9)
      {
        uint64_t v10 = SecCertificateCopySubjectPublicKeyInfoSHA1Digest();
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          [v2 appendData:v10];
          goto LABEL_17;
        }
      }

      else
      {
        ne_log_obj();
        SEL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v23 = "+[NEIKEv2Crypto createCertificateAuthorityPublicKeyHash:]";
          _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "%s called with null certificate", buf, 0xCu);
        }
      }

      ne_log_obj();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_fault_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_FAULT,  "[NEIKEv2Crypto createCertificateAuthorityPublicKeyHash:] failed",  buf,  2u);
      }

      uint64_t v11 = 0LL;
LABEL_17:

      ++v8;
    }

    while (v6 != v8);
    uint64_t v6 = -[os_log_s countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  }

  while (v6);
LABEL_19:

  if (![v2 length])
  {
LABEL_26:
    id v14 = 0LL;
    goto LABEL_27;
  }

  id v14 = v2;
LABEL_27:

  return v14;
}

- (uint64_t)copyLocalSecIdentity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(a1, v4, 272LL, 1);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v6 = +[NEIKEv2Crypto copySecIdentity:keyData:isModernSystem:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v3,  v5,  a1[22] & 1);
  }

  else
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, "No configured local certificate identity", v9, 2u);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (os_log_s)copyLocalCertificateData
{
  id v2 = (__SecIdentity *)-[NEIKEv2IKESA copyLocalSecIdentity](a1, a2);
  if (v2)
  {
    id v3 = v2;
    SecCertificateRef certificateRef = 0LL;
    OSStatus v4 = SecIdentityCopyCertificate(v2, &certificateRef);
    CFRelease(v3);
    if (!certificateRef || v4)
    {
      if (certificateRef)
      {
        CFRelease(certificateRef);
        SecCertificateRef certificateRef = 0LL;
      }

      ne_log_obj();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "SecIdentityCopyCertificate failed", buf, 2u);
      }
    }

    else
    {
      CFDataRef v5 = SecCertificateCopyData(certificateRef);
      if (certificateRef)
      {
        CFRelease(certificateRef);
        SecCertificateRef certificateRef = 0LL;
      }

      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = v6;
LABEL_19:

        return v7;
      }

      ne_log_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v11[0] = 0;
        _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, "SecCertificateCopyData failed", (uint8_t *)v11, 2u);
      }

      uint64_t v6 = 0LL;
    }

    uint64_t v7 = 0LL;
    goto LABEL_19;
  }

  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v14 = 0;
    _os_log_error_impl(&dword_1876B1000, v8, OS_LOG_TYPE_ERROR, "[self copyLocalSecIdentity]", v14, 2u);
  }

  return 0LL;
}

- (CFTypeRef)copyCertSigningKey
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v2 = (__SecIdentity *)-[NEIKEv2IKESA copyLocalSecIdentity](a1, a2);
  if (!v2)
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(cf[0]) = 0;
      _os_log_error_impl(&dword_1876B1000, v7, OS_LOG_TYPE_ERROR, "[self copyLocalSecIdentity]", (uint8_t *)cf, 2u);
    }

    return 0LL;
  }

  id v3 = v2;
  cf[0] = 0LL;
  OSStatus v4 = SecIdentityCopyPrivateKey(v2, (SecKeyRef *)cf);
  CFRelease(v3);
  CFTypeRef result = cf[0];
  if (!cf[0] || v4)
  {
    if (cf[0])
    {
      CFRelease(cf[0]);
      cf[0] = 0LL;
    }

    ne_log_obj();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      OSStatus v10 = v4;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "SecIdentityCopyPrivateKey (%d) failed", buf, 8u);
    }

    return 0LL;
  }

  return result;
}

- (uint64_t)updateIntAuthWithPacket:(uint64_t)a1
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  OSStatus v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty((id)a1, v3, 96LL, 1);
    -[NEIKEv2IKESAProposal prfProtocol](v5, v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NEIKEv2IntermediatePacket authenticatedData](v4, v8);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NEIKEv2IntermediatePacket authenticatedData](v4, v10);
        SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4 && (objc_setProperty_atomic(v4, v11, 0LL, 96LL), (v4[11] & 1) != 0))
        {
          objc_getProperty((id)a1, v11, 232LL, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_getProperty((id)a1, v35, 192LL, 1);
            SEL v36 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v37 = [v36 length];
            CFIndex v38 = [v12 length] + v37;

            CFMutableDataRef v19 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x189603FB8], v38);
            if (v19)
            {
              objc_getProperty((id)a1, v39, 192LL, 1);
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFData appendData:](v19, "appendData:", v40);

              -[__CFData appendData:](v19, "appendData:", v12);
              objc_getProperty((id)a1, v41, 232LL, 1);
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
              id v44 = objc_getProperty((id)a1, v43, 96LL, 1);
              -[NEIKEv2IKESAProposal prfProtocol](v44, v45);
              uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
              id v47 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v19,  v42,  v46);
              objc_setProperty_atomic((id)a1, v48, v47, 192LL);

              objc_getProperty((id)a1, v49, 192LL, 1);
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v50)
              {
                ne_log_obj();
                uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v56) = 0;
                  SEL v32 = "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed";
                  goto LABEL_32;
                }

- (CFMutableDataRef)createIntAuthOctets
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id Property = objc_getProperty(self, a2, 96LL, 1);
    id v5 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v4, 120LL, 1);
    }
  }

  else
  {
    id v5 = 0LL;
    id Property = 0LL;
  }

  id v6 = Property;

  if (!v6) {
    return (CFMutableDataRef)objc_alloc_init(MEMORY[0x189603F48]);
  }
  objc_getProperty(self, v7, 192LL, 1);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)__int128 buf = 136315138;
    SEL v29 = "-[NEIKEv2IKESA(Crypto) createIntAuthOctets]";
    uint64_t v25 = "%s called with null self.intAuthI";
LABEL_17:
    _os_log_fault_impl(&dword_1876B1000, v24, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    goto LABEL_14;
  }

  objc_getProperty(self, v9, 200LL, 1);
  OSStatus v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    unsigned int v27 = bswap32(self[7]);
    objc_getProperty(self, v11, 192LL, 1);
    SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 length];
    objc_getProperty(self, v14, 200LL, 1);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFIndex v16 = v13 + [v15 length] + 4;

    CFMutableDataRef v18 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x189603FB8], v16);
    if (v18)
    {
      objc_getProperty(self, v17, 192LL, 1);
      CFMutableDataRef v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v18, "appendData:", v19);

      objc_getProperty(self, v20, 200LL, 1);
      SEL v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v18, "appendData:", v21);

      -[__CFData appendBytes:length:](v18, "appendBytes:length:", &v27, 4LL);
      SEL v22 = v18;
    }

    else
    {
      ne_log_obj();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        SEL v29 = (const char *)v16;
        _os_log_fault_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed",  buf,  0xCu);
      }
    }

    return v18;
  }

  ne_log_obj();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    SEL v29 = "-[NEIKEv2IKESA(Crypto) createIntAuthOctets]";
    uint64_t v25 = "%s called with null self.intAuthR";
    goto LABEL_17;
  }

- (os_log_s)createAuthenticationDataForSharedSecret:(void *)a3 octets:
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = a3;
  if (!v5)
  {
    ne_log_obj();
    SEL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    SEL v22 = "%s called with null sharedSecretData";
    goto LABEL_17;
  }

  if (a1) {
    id Property = objc_getProperty(a1, v6, 96LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v9 = Property;

  if (!v9)
  {
    ne_log_obj();
    SEL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
LABEL_14:

      SEL v20 = 0LL;
      goto LABEL_15;
    }

    int v24 = 136315138;
    uint64_t v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    SEL v22 = "%s called with null self.chosenProposal";
LABEL_17:
    _os_log_fault_impl(&dword_1876B1000, v21, OS_LOG_TYPE_FAULT, v22, (uint8_t *)&v24, 0xCu);
    goto LABEL_14;
  }

  if (a1) {
    id v11 = objc_getProperty(a1, v10, 96LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  id v12 = v11;
  -[NEIKEv2IKESAProposal prfProtocol](v12, v13);
  SEL v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    ne_log_obj();
    SEL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    int v24 = 136315138;
    uint64_t v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    SEL v22 = "%s called with null self.chosenProposal.prfProtocol";
    goto LABEL_17;
  }

  if (a1) {
    id v16 = objc_getProperty(a1, v15, 96LL, 1);
  }
  else {
    id v16 = 0LL;
  }
  id v17 = v16;
  -[NEIKEv2IKESAProposal prfProtocol](v17, v18);
  CFMutableDataRef v19 = (void *)objc_claimAutoreleasedReturnValue();
  SEL v20 = +[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:prfProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2IKESA,  v5,  v7,  v19);

LABEL_15:
  return v20;
}

+ (os_log_s)createAuthenticationDataForSharedSecret:(void *)a3 octets:(void *)a4 prfProtocol:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_self();
  if (!v6)
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_10:
      id v11 = 0LL;
      goto LABEL_6;
    }

    int v15 = 136315138;
    id v16 = "+[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:prfProtocol:]";
    uint64_t v13 = "%s called with null sharedSecretData";
LABEL_15:
    _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v15, 0xCu);
    goto LABEL_10;
  }

  if (!v8)
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v15 = 136315138;
    id v16 = "+[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:prfProtocol:]";
    uint64_t v13 = "%s called with null prfProtocol";
    goto LABEL_15;
  }

  id v9 = (os_log_s *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:"Key Pad for IKEv2" length:17 freeWhenDone:0];
  OSStatus v10 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v9, v6, v8);
  if (v10)
  {
    id v11 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v7, v10, v8);
  }

  else
  {
    ne_log_obj();
    SEL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_FAULT,  "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed",  (uint8_t *)&v15,  2u);
    }

    id v11 = 0LL;
  }

LABEL_6:
  return v11;
}

- (os_log_s)createInitiatorSignedOctetsUsingPrimeKey:(uint64_t)a1
{
  int v2 = (int)a2;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  -[NEIKEv2IKESA initiatorFirstMessage]((_BYTE *)a1, a2);
  OSStatus v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEIKEv2IKESA responderNonce]((_BYTE *)a1, v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      ne_log_obj();
      OSStatus v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
        id v11 = "%s called with null self.responderNonce";
        goto LABEL_26;
      }

      goto LABEL_27;
    }

    if (v2)
    {
      objc_getProperty((id)a1, v7, 240LL, 1);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        ne_log_obj();
        OSStatus v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          int v54 = 136315138;
          uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          id v11 = "%s called with null self.skPiPrime";
LABEL_26:
          _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v54, 0xCu);
          goto LABEL_27;
        }

        goto LABEL_27;
      }
    }

    else
    {
      objc_getProperty((id)a1, v7, 232LL, 1);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        ne_log_obj();
        OSStatus v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          int v54 = 136315138;
          uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          id v11 = "%s called with null self.skPi";
          goto LABEL_26;
        }

        goto LABEL_27;
      }
    }

    if (a1) {
      id Property = objc_getProperty((id)a1, v9, 96LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v14 = Property;

    if (!v14)
    {
      ne_log_obj();
      OSStatus v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v54 = 136315138;
        uint32_t v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
        id v11 = "%s called with null self.chosenProposal";
        goto LABEL_26;
      }

      goto LABEL_27;
    }

    if (a1 && (*(_BYTE *)(a1 + 9) & 1) != 0)
    {
      WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)(a1 + 328));
      if (WeakRetained)
      {
        CFMutableDataRef v18 = WeakRetained;
        goto LABEL_31;
      }
    }

    else
    {
      int v15 = (os_log_s *)*(id *)(a1 + 344);
      if (v15)
      {
        OSStatus v10 = v15;
        id v16 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IdentifierPayload);
        if (v16)
        {
          CFMutableDataRef v18 = (os_log_s *)v16;
          objc_setProperty_atomic(v16, v17, v10, 24LL);
          goto LABEL_32;
        }

- (os_log_s)createResponderSignedOctetsUsingPrimeKey:(_BYTE *)a1
{
  int v2 = (int)a2;
  uint64_t v51 = *MEMORY[0x1895F89C0];
  -[NEIKEv2IKESA responderFirstMessage](a1, a2);
  OSStatus v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    ne_log_obj();
    OSStatus v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v49 = 136315138;
      uint64_t v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
      id v11 = "%s called with null self.responderFirstMessage";
      goto LABEL_34;
    }

- (uint64_t)createRemoteSignedOctetsUsingPrimeKey:(uint64_t)a1
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 9) & 1) != 0) {
      return (uint64_t)-[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:]((_BYTE *)a1, a2);
    }
    else {
      return (uint64_t)-[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:](a1, a2);
    }
  }

  return a1;
}

- (SecKeyRef)checkValidityOfCertificates:(void *)a1
{
  trust[1] = *(SecTrustRef *)MEMORY[0x1895F89C0];
  id v3 = a2;
  OSStatus v4 = v3;
  if (!a1)
  {
    SecKeyRef v51 = 0LL;
    goto LABEL_53;
  }

  if (![v3 count])
  {
    ne_log_obj();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2IKESA(Crypto) checkValidityOfCertificates:]";
      _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "%s called with null certificateDataArray.count",  buf,  0xCu);
    }

    SecKeyRef v51 = 0LL;
    goto LABEL_52;
  }

  id v6 = objc_getProperty(a1, v5, 88LL, 1);
  [v6 remoteCertificateHostname];
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v7, "length"))
  {
    id v9 = objc_getProperty(a1, v8, 88LL, 1);
    [v9 remoteIdentifier];
    OSStatus v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stringValue];
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString length](v11, "length"))
    {
      id v7 = v11;
    }

    else
    {
      -[NEIKEv2IKESA remoteIdentifier](a1, v12);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stringValue];
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  if (!-[__CFString length](v7, "length"))
  {

    id v7 = 0LL;
  }

  ne_log_obj();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v54 = @"<not set>";
    if (v7) {
      int v54 = v7;
    }
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v54;
    _os_log_debug_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEBUG,  "Matching remote hostname %@ with remote certificate",  buf,  0xCu);
  }

  int v15 = v7;
  objc_opt_self();
  if (v15)
  {
    trust[0] = *(SecTrustRef *)MEMORY[0x18960BDE0];
    *(void *)__int128 buf = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:trust count:1];
    id v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v16 = 0LL;
  }

  SecPolicyRef v17 = SecPolicyCreateWithProperties((CFTypeRef)*MEMORY[0x18960BDD8], v16);
  if (v17)
  {
    SecPolicyRef v18 = v17;

    id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v19)
    {
      ptrdiff_t v20 = v19;
      v106 = v15;
      SecPolicyRef cf = v18;
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      unsigned int v109 = v4;
      id v21 = v4;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v110 objects:v115 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v111;
        uint64_t v25 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        while (2)
        {
          uint64_t v26 = 0LL;
          do
          {
            if (*(void *)v111 != v24) {
              objc_enumerationMutation(v21);
            }
            SecCertificateRef v27 = SecCertificateCreateWithData(v25, *(CFDataRef *)(*((void *)&v110 + 1) + 8 * v26));
            if (!v27)
            {
              ne_log_obj();
              uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_fault_impl( &dword_1876B1000,  v50,  OS_LOG_TYPE_FAULT,  "SecCertificateCreateWithData failed",  buf,  2u);
              }

              CFRelease(cf);
              goto LABEL_46;
            }

            SecCertificateRef v28 = v27;
            if (nelog_is_debug_logging_enabled())
            {
              CFAbsoluteTimeGetCurrent();
              SEL v29 = (const void *)SecCertificateCopySummaryProperties();
              ne_log_large_obj();
              SEL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)__int128 buf = 138412290;
                *(void *)&uint8_t buf[4] = v29;
                _os_log_debug_impl(&dword_1876B1000, v30, OS_LOG_TYPE_DEBUG, "Certificate Properties:\n%@", buf, 0xCu);
              }

              if (v29) {
                CFRelease(v29);
              }
            }

            NECertificateDateIsValid((uint64_t)v28);
            [v20 addObject:v28];
            CFRelease(v28);
            ++v26;
          }

          while (v23 != v26);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v110 objects:v115 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      if (![v20 count])
      {
        ne_log_obj();
        uint32_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl(&dword_1876B1000, v55, OS_LOG_TYPE_ERROR, "No valid remote certificate", buf, 2u);
        }

        CFRelease(cf);
LABEL_46:
        SecKeyRef v51 = 0LL;
        OSStatus v4 = v109;
        int v15 = v106;
        goto LABEL_51;
      }

      id v31 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](a1);
      if ([v31 count])
      {
LABEL_30:
        id v33 = objc_getProperty(a1, v32, 88LL, 1);
        int v34 = [v33 enableCertificateRevocationCheck];
        id v36 = objc_getProperty(a1, v35, 88LL, 1);
        int v37 = [v36 strictCertificateRevocationCheck];
        id v38 = v20;
        id v105 = v31;
        objc_opt_self();
        trust[0] = 0LL;
        certificates = v38;
        if (v34)
        {
          key = v31;
          id v39 = v36;
          id v40 = v33;
          ne_log_obj();
          SEL v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          int v15 = v106;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_debug_impl( &dword_1876B1000,  v41,  OS_LOG_TYPE_DEBUG,  "Request certificate revocation check",  buf,  2u);
          }

          if (v37) {
            CFOptionFlags v42 = 11LL;
          }
          else {
            CFOptionFlags v42 = 3LL;
          }
          SecPolicyRef Revocation = SecPolicyCreateRevocation(v42);
          CFIndex v44 = v105;
          if (Revocation)
          {
            SecPolicyRef v45 = Revocation;
            id v46 = objc_alloc_init(MEMORY[0x189603FA8]);
            if (v46)
            {
              CFMutableDataRef v47 = v46;
              [v46 addObject:cf];
              [v47 addObject:v45];
              CFRelease(v45);
              OSStatus v48 = SecTrustCreateWithCertificates(certificates, v47, trust);

              id v33 = v40;
              id v36 = v39;
              id v31 = key;
LABEL_63:
              if (v48 || !trust[0])
              {
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0LL;
                }

                ne_log_obj();
                v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_fault_impl( &dword_1876B1000,  v62,  OS_LOG_TYPE_FAULT,  "SecTrustCreateWithCertificates failed",  buf,  2u);
                }

                SecKeyRef v51 = 0LL;
                CFIndex v44 = v105;
                goto LABEL_94;
              }

              CFIndex v44 = v105;
              if ([v105 count] && (OSStatus v59 = SecTrustSetAnchorCertificates(trust[0], (CFArrayRef)v105)) != 0)
              {
                OSStatus v60 = v59;
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0LL;
                }

                ne_log_obj();
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)__int128 buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v60;
                  _os_log_fault_impl( &dword_1876B1000,  v61,  OS_LOG_TYPE_FAULT,  "Failed to set anchor CA certificates for remote certificate validation (%d)",  buf,  8u);
                }
              }

              else
              {
                *(_DWORD *)CFDataRef v114 = 0;
                int v63 = MEMORY[0x1895AC3C0](trust[0], v114);
                if (!v63)
                {
                  switch(*(_DWORD *)v114)
                  {
                    case 0:
                      ne_log_obj();
                      id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)__int128 buf = 0;
                      id v74 = "Certificate evaluation error = kSecTrustResultInvalid";
                      goto LABEL_122;
                    case 1:
                    case 4:
                      if ((v34 & v37) == 1)
                      {
                        ne_log_obj();
                        uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)__int128 buf = 0;
                          _os_log_impl( &dword_1876B1000,  v72,  OS_LOG_TYPE_INFO,  "Strict Certificate Revocation Check is not supported",  buf,  2u);
                        }
                      }

                      SecKeyRef v51 = SecTrustCopyKey(trust[0]);
                      if (!trust[0]) {
                        goto LABEL_94;
                      }
                      CFRelease(trust[0]);
                      goto LABEL_152;
                    case 3:
                      ne_log_obj();
                      id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)__int128 buf = 0;
                      id v74 = "Certificate evaluation error = kSecTrustResultDeny";
                      goto LABEL_122;
                    case 5:
                      ne_log_obj();
                      id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)__int128 buf = 0;
                      id v74 = "Certificate evaluation error = kSecTrustResultRecoverableTrustFailure";
                      goto LABEL_122;
                    case 6:
                      ne_log_obj();
                      id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)__int128 buf = 0;
                      id v74 = "Certificate evaluation error = kSecTrustResultFatalTrustFailure";
                      goto LABEL_122;
                    case 7:
                      ne_log_obj();
                      id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_WORD *)__int128 buf = 0;
                      id v74 = "Certificate evaluation error = kSecTrustResultOtherError";
LABEL_122:
                      __int128 v75 = v73;
                      uint32_t v76 = 2;
                      break;
                    default:
                      ne_log_obj();
                      id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_124;
                      }
                      *(_DWORD *)__int128 buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = *(_DWORD *)v114;
                      id v74 = "Certificate evaluation error = Unknown (%d)";
                      __int128 v75 = v73;
                      uint32_t v76 = 8;
                      break;
                  }

                  _os_log_error_impl(&dword_1876B1000, v75, OS_LOG_TYPE_ERROR, v74, buf, v76);
LABEL_124:

                  if (nelog_is_debug_logging_enabled())
                  {
                    CFArrayRef v77 = SecTrustCopyProperties(trust[0]);
                    if (v77)
                    {
                      id v99 = v36;
                      theArray = v77;
                      ne_log_obj();
                      __int128 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_debug_impl( &dword_1876B1000,  v78,  OS_LOG_TYPE_DEBUG,  "---------------Returned error strings: ---------------",  buf,  2u);
                      }

                      CFIndex Count = CFArrayGetCount(theArray);
                      if (Count >= 1)
                      {
                        CFIndex v79 = 0LL;
                        keya = (void *)*MEMORY[0x18960BDF8];
                        uint64_t v101 = (void *)*MEMORY[0x18960BE00];
                        do
                        {
                          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v79);
                          if (ValueAtIndex)
                          {
                            __int128 v81 = ValueAtIndex;
                            CFTypeID v82 = CFGetTypeID(ValueAtIndex);
                            if (v82 == CFDictionaryGetTypeID())
                            {
                              Value = (const __CFString *)CFDictionaryGetValue(v81, keya);
                              if (Value)
                              {
                                v84 = Value;
                                id v85 = v33;
                                CFTypeID v86 = CFGetTypeID(Value);
                                BOOL v87 = v86 == CFStringGetTypeID();
                                id v33 = v85;
                                if (v87)
                                {
                                  CStringPtr = CFStringGetCStringPtr(v84, 0);
                                  if (CStringPtr)
                                  {
                                    __int128 v89 = CStringPtr;
                                    ne_log_obj();
                                    __int128 v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)__int128 buf = 136315138;
                                      *(void *)&uint8_t buf[4] = v89;
                                      _os_log_debug_impl( &dword_1876B1000,  v90,  OS_LOG_TYPE_DEBUG,  "type = %s",  buf,  0xCu);
                                    }

                                    id v33 = v85;
                                  }
                                }
                              }

                              __int128 v91 = (const __CFString *)CFDictionaryGetValue(v81, v101);
                              if (v91)
                              {
                                __int128 v92 = v91;
                                id v93 = v33;
                                CFTypeID v94 = CFGetTypeID(v91);
                                BOOL v87 = v94 == CFStringGetTypeID();
                                id v33 = v93;
                                if (v87)
                                {
                                  uint64_t v95 = CFStringGetCStringPtr(v92, 0);
                                  if (v95)
                                  {
                                    uint64_t v96 = v95;
                                    ne_log_obj();
                                    v97 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)__int128 buf = 136315138;
                                      *(void *)&uint8_t buf[4] = v96;
                                      _os_log_debug_impl( &dword_1876B1000,  v97,  OS_LOG_TYPE_DEBUG,  "value = %s",  buf,  0xCu);
                                    }

                                    id v33 = v93;
                                  }
                                }
                              }
                            }
                          }

                          ++v79;
                        }

                        while (Count != v79);
                      }

                      ne_log_obj();
                      uint64_t v98 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)__int128 buf = 0;
                        _os_log_debug_impl( &dword_1876B1000,  v98,  OS_LOG_TYPE_DEBUG,  "-----------------------------------------------------",  buf,  2u);
                      }

                      CFRelease(theArray);
                      id v36 = v99;
                      CFIndex v44 = v105;
                    }
                  }

                  if (trust[0])
                  {
                    CFRelease(trust[0]);
                    SecKeyRef v51 = 0LL;
LABEL_152:
                    trust[0] = 0LL;
                    goto LABEL_94;
                  }

                  goto LABEL_82;
                }

                int v64 = v63;
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0LL;
                }

                ne_log_obj();
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__int128 buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v64;
                  _os_log_error_impl( &dword_1876B1000,  v61,  OS_LOG_TYPE_ERROR,  "Remote certificate evaluation error (%d)",  buf,  8u);
                }
              }

LABEL_82:
              SecKeyRef v51 = 0LL;
LABEL_94:

              CFRelease(cf);
              ne_log_obj();
              uint64_t v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              uint64_t v71 = v70;
              if (v51)
              {
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)__int128 buf = 138412290;
                  *(void *)&uint8_t buf[4] = v51;
                  _os_log_debug_impl(&dword_1876B1000, v71, OS_LOG_TYPE_DEBUG, "Certificate public key: %@", buf, 0xCu);
                }

                goto LABEL_102;
              }

              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_error_impl(&dword_1876B1000, v71, OS_LOG_TYPE_ERROR, "Certificate is not trusted", buf, 2u);
              }

LABEL_101:
              SecKeyRef v51 = 0LL;
LABEL_102:

              OSStatus v4 = v109;
              goto LABEL_51;
            }

            CFRelease(v45);
            ne_log_obj();
            uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_fault_impl( &dword_1876B1000,  v69,  OS_LOG_TYPE_FAULT,  "[[NSMutableArray alloc] init] failed",  buf,  2u);
            }

            SecKeyRef v51 = 0LL;
            id v33 = v40;
          }

          else
          {
            ne_log_obj();
            uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_fault_impl(&dword_1876B1000, v68, OS_LOG_TYPE_FAULT, "SecPolicyCreateRevocation failed", buf, 2u);
            }

            SecKeyRef v51 = 0LL;
          }

          id v36 = v39;
          id v31 = key;
          goto LABEL_94;
        }

        OSStatus v48 = SecTrustCreateWithCertificates(v38, cf, trust);
        int v15 = v106;
        goto LABEL_63;
      }

      id v56 = objc_getProperty(a1, v32, 88LL, 1);
      [v56 remoteCertificateAuthorityReferences];
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
      }

      else
      {
        id v65 = objc_getProperty(a1, v58, 88LL, 1);
        [v65 remoteCertificateAuthorityName];
        id v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v66) {
          goto LABEL_30;
        }
      }

      ne_log_obj();
      uint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      int v15 = v106;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v67,  OS_LOG_TYPE_ERROR,  "remoteCertAuthorityArray missing from config",  buf,  2u);
      }

      CFRelease(cf);
      goto LABEL_101;
    }

    CFRelease(v18);
    ne_log_obj();
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v52, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
    }

    ptrdiff_t v20 = 0LL;
  }

  else
  {
    ne_log_obj();
    int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)CFDataRef v114 = 0;
      _os_log_fault_impl(&dword_1876B1000, v49, OS_LOG_TYPE_FAULT, "SecPolicyCreateWithProperties failed", v114, 2u);
    }

    ne_log_obj();
    ptrdiff_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v20,  OS_LOG_TYPE_FAULT,  "Could not create secure policy with hostname %@",  buf,  0xCu);
    }
  }

  SecKeyRef v51 = 0LL;
LABEL_51:

LABEL_52:
LABEL_53:

  return v51;
}

- (NEIKEv2AuthPayload)copyAuthenticationPayloadUsingPrimeKey:(id *)self
{
  id v3 = self;
  uint64_t v116 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (id *)objc_getProperty(self, a2, 96LL, 1);
  }
  OSStatus v4 = self;

  if (v4)
  {
    if (v3 && (*((_BYTE *)v3 + 9) & 1) != 0) {
      id v5 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v3, a2);
    }
    else {
      id v5 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v3, a2);
    }
    id v7 = v5;
    if (!v5)
    {
      ne_log_obj();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_fault_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_FAULT,  "[self createLocalSignedOctetsUsingPrimeKey:] failed",  buf,  2u);
      }

      goto LABEL_66;
    }

    -[NEIKEv2IKESA authenticationProtocol](v3, v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (-[os_log_s method](v9, "method") == 2)
    {
      -[NEIKEv2IKESA sharedSecret](v3, v10);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v3, v11, v7);

      if (!v12)
      {
        ne_log_obj();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)__int128 buf = 0;
          id v14 = "createAuthenticationDataForSharedSecret: failed";
LABEL_16:
          int v15 = v13;
          uint32_t v16 = 2;
LABEL_31:
          _os_log_fault_impl(&dword_1876B1000, v15, OS_LOG_TYPE_FAULT, v14, buf, v16);
        }

- (uint64_t)checkSharedKeyAuthData:(const char *)a3 usingPrimeKey:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v7 = v5;
  if (a1)
  {
    if (v5)
    {
      id v8 = objc_getProperty((id)a1, v6, 96LL, 1);

      if (v8)
      {
        -[NEIKEv2IKESA remoteAuthentication]((id)a1, v9);
        OSStatus v10 = (void *)objc_claimAutoreleasedReturnValue();
        id v11 = v10;
        if (v10)
        {
          if (([v10 isSignature] & 1) == 0 && !objc_msgSend(v11, "isSecurePassword"))
          {
            uint64_t v16 = -[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](a1, a3);
            if (!v16)
            {
              ne_log_obj();
              uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                LOWORD(v29) = 0;
                _os_log_fault_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_FAULT,  "[self createRemoteSignedOctetsUsingPrimeKey:] failed",  (uint8_t *)&v29,  2u);
              }

              id v12 = 0LL;
              goto LABEL_39;
            }

            id v12 = (void *)v16;
            if ([v11 method] == 2)
            {
              -[NEIKEv2IKESA sharedSecret]((void *)a1, v17);
              BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              if ([v11 method] != 13)
              {
LABEL_36:
                ne_log_obj();
                SecCertificateRef v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                {
                  int v29 = 136315138;
                  SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
                  _os_log_fault_impl( &dword_1876B1000,  v27,  OS_LOG_TYPE_FAULT,  "%s called with null sharedSecret",  (uint8_t *)&v29,  0xCu);
                }

                goto LABEL_39;
              }

              if ((*(_BYTE *)(a1 + 9) & 1) != 0)
              {
                id v21 = (void *)a1;
                else {
                  ptrdiff_t v22 = 248LL;
                }
              }

              else
              {
                id v21 = (void *)a1;
                else {
                  ptrdiff_t v22 = 232LL;
                }
              }

              objc_getProperty(v21, v20, v22, 1);
              BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
            }

            uint64_t v24 = v18;
            if (v18)
            {
              uint64_t v25 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:]((void *)a1, v18, v12);
              if (v25)
              {
                a1 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v25,  v7);
              }

              else
              {
                ne_log_obj();
                ptrdiff_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v29) = 0;
                  _os_log_fault_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_FAULT,  "createAuthenticationDataForSharedSecret: failed",  (uint8_t *)&v29,  2u);
                }

                a1 = 0LL;
              }

              goto LABEL_40;
            }

            goto LABEL_36;
          }

          ne_log_obj();
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
          {
LABEL_39:
            a1 = 0LL;
LABEL_40:

            goto LABEL_41;
          }

          LOWORD(v29) = 0;
          uint64_t v13 = "Do not call checkSharedKeyAuthData with signature/GSPM auth";
          id v14 = (os_log_s *)v12;
          uint32_t v15 = 2;
        }

        else
        {
          ne_log_obj();
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_39;
          }
          int v29 = 136315138;
          SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
          uint64_t v13 = "%s called with null authentication";
          id v14 = (os_log_s *)v12;
          uint32_t v15 = 12;
        }

        _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v29, v15);
        goto LABEL_39;
      }

      ne_log_obj();
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        a1 = 0LL;
LABEL_41:

        goto LABEL_42;
      }

      int v29 = 136315138;
      SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
      uint64_t v23 = "%s called with null self.chosenProposal";
    }

    else
    {
      ne_log_obj();
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      int v29 = 136315138;
      SEL v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
      uint64_t v23 = "%s called with null authenticationData";
    }

    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v11, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&v29, 0xCu);
    goto LABEL_10;
  }

BOOL __45__NEIKEv2IKESA_Crypto__copyValidateAuthBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 remoteAuthentication];
  OSStatus v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = (uint64_t)WeakRetained;
    if (WeakRetained)
    {
      id v7 = (os_log_s *)WeakRetained[47];
      if (!v7)
      {
        ne_log_obj();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          uint64_t v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
          _os_log_fault_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_FAULT,  "%s called with null authenticationData",  buf,  0xCu);
        }

        BOOL v11 = 0LL;
        goto LABEL_63;
      }

      id v8 = v7;
      id v9 = *(id *)(v6 + 368);
      OSStatus v10 = v9;
      if (v9)
      {
        if ([v9 isSecurePassword])
        {
          BOOL v11 = 1LL;
LABEL_62:

LABEL_63:
          goto LABEL_64;
        }

        [v3 remoteAuthentication];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        char v13 = +[NEIKEv2Crypto isRemoteAuthenticationPacketProtocol:compatibleWithConfiguredProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v10,  v12);

        if ((v13 & 1) == 0)
        {
          ne_log_obj();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            [v3 remoteAuthentication];
            id v48 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__int128 buf = 138412546;
            uint64_t v58 = v48;
            __int16 v59 = 2112;
            uint64_t v60 = (uint64_t)v10;
            _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "Auth protocols are not compatible between config %@ and packet %@",  buf,  0x16u);
          }

          goto LABEL_23;
        }

        if ((*(_BYTE *)(v6 + 24) & 1) == 0)
        {
LABEL_12:
          int v14 = 0;
LABEL_13:
          uint64_t v15 = -[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](v6, 0LL);
          if (v15)
          {
            uint64_t v16 = (os_log_s *)v15;
            id v17 = v10;
            [v3 remoteAuthentication];
            BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
            int v19 = [v18 isNonStandard];

            if (v19)
            {
              uint64_t v20 = [v3 remoteAuthentication];

              id v17 = (id)v20;
            }

            if ([v17 isSignature])
            {
              ptrdiff_t v22 = (__SecKey *)-[NEIKEv2SessionConfiguration copyRemoteAuthKey](v3);
              if (v22)
              {
                uint64_t v23 = v22;
                int v24 = +[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v8,  v16,  v17,  v22);
                CFRelease(v23);
                if (v24)
                {
                  BOOL v11 = 1LL;
                  *(_BYTE *)(v6 + 18) = 1;
                  if (v14) {
                    *(_BYTE *)(v6 + 19) = 1;
                  }
                  goto LABEL_60;
                }

                if (!v14)
                {
LABEL_43:
                  BOOL v11 = 0LL;
LABEL_60:

                  goto LABEL_61;
                }
              }

              else
              {
                ne_log_obj();
                uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_fault_impl( &dword_1876B1000,  v53,  OS_LOG_TYPE_FAULT,  "Responder configuration is missing remote public key",  buf,  2u);
                }
              }

              -[NEIKEv2IKESA restorePrimeKeys]((void *)v6, v25);
              goto LABEL_43;
            }

            id v56 = v16;
            id v33 = objc_getProperty((id)v6, v21, 96LL, 1);
            -[NEIKEv2IKESAProposal prfProtocol](v33, v34);
            id v35 = (void *)objc_claimAutoreleasedReturnValue();

            int v36 = v14;
            if ([v17 method] == 2)
            {
              uint64_t v37 = (uint64_t)+[NEIKEv2IKESA copySharedSecretFromConfig:]((uint64_t)&OBJC_CLASS___NEIKEv2IKESA, v3);
            }

            else
            {
              if ([v17 method] != 13)
              {
                id v39 = 0LL;
                goto LABEL_54;
              }

              uint64_t v37 = objc_getProperty((id)v6, v38, 232LL, 1);
            }

            id v39 = (void *)v37;
LABEL_54:
            id v45 = +[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:prfProtocol:]( (uint64_t)&OBJC_CLASS___NEIKEv2IKESA,  v39,  v56,  v35);
            BOOL v11 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v45,  v8);
            if (v11)
            {
              *(_BYTE *)(v6 + 18) = 1;
              if (v36) {
                *(_BYTE *)(v6 + 19) = 1;
              }
            }

            else if (v36)
            {
              -[NEIKEv2IKESA restorePrimeKeys]((void *)v6, v46);
            }

            uint64_t v16 = v56;
            goto LABEL_60;
          }

          ne_log_obj();
          uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int128 buf = 136315138;
            uint64_t v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
            _os_log_fault_impl( &dword_1876B1000,  v51,  OS_LOG_TYPE_FAULT,  "%s called with null remoteSignedOctets",  buf,  0xCu);
          }

          -[NEIKEv2IKESA restorePrimeKeys]((void *)v6, v52);
          uint64_t v16 = 0LL;
LABEL_23:
          BOOL v11 = 0LL;
LABEL_61:

          goto LABEL_62;
        }

        if (!*(void *)(v6 + 416))
        {
          if ([v3 ppkMandatory])
          {
            ne_log_obj();
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "No PPK ID received with mandatory PPK auth",  buf,  2u);
            }

            goto LABEL_23;
          }

          goto LABEL_12;
        }

        if ([v3 ppkIDType] != 2
          || ([v3 ppkID], ptrdiff_t v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, v26))
        {
          uint64_t v27 = [v3 ppkIDType];
          [v3 ppkID];
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (*(void *)(v6 + 416) == v27)
          {
            id v28 = *(id *)(v6 + 424);
            if ([v28 length] || -[os_log_s length](v16, "length"))
            {
              id v29 = *(id *)(v6 + 424);
              char v30 = [v29 isEqualToData:v16];

              if ((v30 & 1) == 0)
              {
                ne_log_obj();
                uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  id v32 = (char *)*(id *)(v6 + 424);
                  *(_DWORD *)__int128 buf = 138412546;
                  uint64_t v58 = v32;
                  __int16 v59 = 2112;
                  uint64_t v60 = (uint64_t)v16;
                  _os_log_error_impl(&dword_1876B1000, v31, OS_LOG_TYPE_ERROR, "PPK ID %@ != Expected %@", buf, 0x16u);
                }

- (os_log_s)createInitiatorEAPAuthenticationDataUsingPrimeKey:(os_log_s *)self
{
  int v2 = self;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 448LL, 1);

    if (v4)
    {
      id v6 = objc_getProperty(v2, v5, 96LL, 1);

      if (v6)
      {
        id v8 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v2, a2);
        if (v8)
        {
          id v9 = objc_getProperty(v2, v7, 448LL, 1);
          -[NEIKEv2EAP sessionKey]((uint64_t)v9);
          OSStatus v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10
            || (!(_DWORD)a2 ? (ptrdiff_t v12 = 232LL) : (ptrdiff_t v12 = 240LL),
                objc_getProperty(v2, v11, v12, 1),
                (OSStatus v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
          {
            char v13 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v2, v10, v8);
            if (v13)
            {
              int v2 = v13;
LABEL_24:

              goto LABEL_25;
            }

            ne_log_obj();
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v18) = 0;
              _os_log_fault_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_FAULT,  "createAuthenticationDataForSharedSecret failed",  (uint8_t *)&v18,  2u);
            }

LABEL_23:
            int v2 = 0LL;
            goto LABEL_24;
          }

          ne_log_obj();
          OSStatus v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          LOWORD(v18) = 0;
          uint64_t v15 = "skPi failed";
        }

        else
        {
          ne_log_obj();
          OSStatus v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          LOWORD(v18) = 0;
          uint64_t v15 = "createInitiatorSignedOctetsUsingPrimeKey: failed";
        }

        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v10, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v18, 2u);
        goto LABEL_23;
      }

      ne_log_obj();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
      {
LABEL_15:
        int v2 = 0LL;
LABEL_25:

        return v2;
      }

      int v18 = 136315138;
      int v19 = "-[NEIKEv2IKESA(Crypto) createInitiatorEAPAuthenticationDataUsingPrimeKey:]";
      int v14 = "%s called with null self.chosenProposal";
    }

    else
    {
      ne_log_obj();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_15;
      }
      int v18 = 136315138;
      int v19 = "-[NEIKEv2IKESA(Crypto) createInitiatorEAPAuthenticationDataUsingPrimeKey:]";
      int v14 = "%s called with null self.eapClient";
    }

    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v8, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v18, 0xCu);
    goto LABEL_15;
  }

  return v2;
}

- (os_log_s)createInitiatorGSPMAuthenticationDataUsingPrimeKey:(os_log_s *)self
{
  int v2 = self;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 456LL, 1);

    if (v4)
    {
      id v6 = objc_getProperty(v2, v5, 96LL, 1);

      if (v6)
      {
        id v8 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v2, a2);
        if (!v8)
        {
          ne_log_obj();
          int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_FAULT,  "createInitiatorSignedOctets failed",  (uint8_t *)&v30,  2u);
          }

          int v2 = 0LL;
          goto LABEL_25;
        }

        char v9 = *((_BYTE *)v2 + 9);
        id v10 = objc_getProperty(v2, v7, 456LL, 1);
        BOOL v11 = v10;
        if ((v9 & 1) != 0) {
          ptrdiff_t v12 = (os_log_s *)-[NEIKEv2GSPM createLocalSignedOctets]((uint64_t)v10);
        }
        else {
          ptrdiff_t v12 = (os_log_s *)-[NEIKEv2GSPM createRemoteSignedOctets]((uint64_t)v10);
        }
        int v14 = v12;

        if (!v14)
        {
          ne_log_obj();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_FAULT,  "creatInitiatorSignedOctets(GSPM) failed",  (uint8_t *)&v30,  2u);
          }

          int v2 = 0LL;
          goto LABEL_24;
        }

        uint64_t v15 = [v8 length];
        uint64_t v16 = -[os_log_s length](v14, "length");
        id v17 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x189603FB8], v16 + v15);
        -[os_log_s appendData:](v17, "appendData:", v8);
        -[os_log_s appendData:](v17, "appendData:", v14);
        id v19 = objc_getProperty(v2, v18, 456LL, 1);
        uint64_t v20 = v19;
        if (v19) {
          id v21 = (void *)*((void *)v19 + 1);
        }
        else {
          id v21 = 0LL;
        }
        id v22 = v21;

        if (v22)
        {
          id v24 = objc_getProperty(v2, v23, 96LL, 1);
          -[NEIKEv2IKESAProposal prfProtocol](v24, v25);
          ptrdiff_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          int v2 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v17, v22, v26);

          if (v2)
          {
LABEL_20:

LABEL_24:
LABEL_25:

            goto LABEL_26;
          }

          ne_log_obj();
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_FAULT))
          {
LABEL_33:

            int v2 = 0LL;
            goto LABEL_20;
          }

          LOWORD(v30) = 0;
          id v29 = "createAuthenticationDataForSharedSecret failed";
        }

        else
        {
          ne_log_obj();
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          LOWORD(v30) = 0;
          id v29 = "GSPM.sessionKey failed";
        }

        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v28, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v30, 2u);
        goto LABEL_33;
      }

      ne_log_obj();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        int v2 = 0LL;
LABEL_26:

        return v2;
      }

      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createInitiatorGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.chosenProposal";
    }

    else
    {
      ne_log_obj();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createInitiatorGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.gspmHandler";
    }

    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v8, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v30, 0xCu);
    goto LABEL_10;
  }

  return v2;
}

- (os_log_s)createResponderGSPMAuthenticationDataUsingPrimeKey:(os_log_s *)self
{
  int v2 = self;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 456LL, 1);

    if (v4)
    {
      id v6 = objc_getProperty(v2, v5, 96LL, 1);

      if (v6)
      {
        id v8 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v2, a2);
        if (!v8)
        {
          ne_log_obj();
          int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_FAULT,  "createResponderSignedOctets failed",  (uint8_t *)&v30,  2u);
          }

          int v2 = 0LL;
          goto LABEL_25;
        }

        char v9 = *((_BYTE *)v2 + 9);
        id v10 = objc_getProperty(v2, v7, 456LL, 1);
        BOOL v11 = v10;
        if ((v9 & 1) != 0) {
          ptrdiff_t v12 = (os_log_s *)-[NEIKEv2GSPM createRemoteSignedOctets]((uint64_t)v10);
        }
        else {
          ptrdiff_t v12 = (os_log_s *)-[NEIKEv2GSPM createLocalSignedOctets]((uint64_t)v10);
        }
        int v14 = v12;

        if (!v14)
        {
          ne_log_obj();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_FAULT,  "createResponderSignedOctets(GSPM) failed",  (uint8_t *)&v30,  2u);
          }

          int v2 = 0LL;
          goto LABEL_24;
        }

        uint64_t v15 = [v8 length];
        uint64_t v16 = -[os_log_s length](v14, "length");
        id v17 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x189603FB8], v16 + v15);
        -[os_log_s appendData:](v17, "appendData:", v8);
        -[os_log_s appendData:](v17, "appendData:", v14);
        id v19 = objc_getProperty(v2, v18, 456LL, 1);
        uint64_t v20 = v19;
        if (v19) {
          id v21 = (void *)*((void *)v19 + 1);
        }
        else {
          id v21 = 0LL;
        }
        id v22 = v21;

        if (v22)
        {
          id v24 = objc_getProperty(v2, v23, 96LL, 1);
          -[NEIKEv2IKESAProposal prfProtocol](v24, v25);
          ptrdiff_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          int v2 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v17, v22, v26);

          if (v2)
          {
LABEL_20:

LABEL_24:
LABEL_25:

            goto LABEL_26;
          }

          ne_log_obj();
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_FAULT))
          {
LABEL_33:

            int v2 = 0LL;
            goto LABEL_20;
          }

          LOWORD(v30) = 0;
          id v29 = "createAuthenticationDataForSharedSecret failed";
        }

        else
        {
          ne_log_obj();
          id v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          LOWORD(v30) = 0;
          id v29 = "GSPM.sessionKey failed";
        }

        _os_log_fault_impl(&dword_1876B1000, (os_log_t)v28, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v30, 2u);
        goto LABEL_33;
      }

      ne_log_obj();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        int v2 = 0LL;
LABEL_26:

        return v2;
      }

      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createResponderGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.chosenProposal";
    }

    else
    {
      ne_log_obj();
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      int v30 = 136315138;
      uint64_t v31 = "-[NEIKEv2IKESA(Crypto) createResponderGSPMAuthenticationDataUsingPrimeKey:]";
      char v13 = "%s called with null self.gspmHandler";
    }

    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v8, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v30, 0xCu);
    goto LABEL_10;
  }

  return v2;
}

- (void)createConcatenatedSPIsAndReturnError:(_BYTE *)a1
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 value];

  uint64_t v22 = v5;
  -[NEIKEv2IKESA responderSPI](a1, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 value];

  uint64_t v21 = v8;
  if (!v5)
  {
    SEL v18 = @"Missing initiator SPI";
LABEL_7:
    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(v18, v9, v10, v11, v12, v13, v14, v15, v21);
    uint64_t v20 = *(void **)a2;
    *(void *)a2 = ErrorInternal;

    return 0LL;
  }

  if (!v8)
  {
    SEL v18 = @"Missing responder SPI";
    goto LABEL_7;
  }

  uint64_t v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithCapacity:", 16, v21, v22);
  [v16 appendBytes:&v22 length:8];
  [v16 appendBytes:&v21 length:8];
  return v16;
}

- (void)createConcatedNoncesAndReturnError:(_BYTE *)a1
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2IKESA responderNonce](a1, v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v4 length])
  {
    uint64_t v16 = @"Missing initiator nonce";
LABEL_7:
    uint64_t ErrorInternal = NEIKEv2CreateErrorInternal(v16, v7, v8, v9, v10, v11, v12, v13, v19);
    SEL v18 = *(void **)a2;
    *(void *)a2 = ErrorInternal;

    uint64_t v14 = 0LL;
    goto LABEL_4;
  }

  if (![v6 length])
  {
    uint64_t v16 = @"Missing responder nonce";
    goto LABEL_7;
  }

  uint64_t v14 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FB8]),  "initWithCapacity:",  objc_msgSend(v6, "length") + objc_msgSend(v4, "length"));
  [v14 appendData:v4];
  [v14 appendData:v6];
LABEL_4:

  return v14;
}

- (unint64_t)selectSecurePasswordMethod:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1) {
    id Property = objc_getProperty(a1, v3, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;
  [v6 supportedSecurePasswordMethods];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v7 count])
  {
    if (v4) {
      id v9 = objc_getProperty(v4, v8, 32LL, 1);
    }
    else {
      id v9 = 0LL;
    }
    id v10 = v9;
    uint64_t v11 = [v10 length];
    unint64_t v12 = v11;
    if (!v11) {
      goto LABEL_17;
    }
    if ((v11 & 1) != 0)
    {
      ne_log_obj();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = 134217984;
        unint64_t v20 = v12;
        _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "Secure password methods data length %zu is not divisible by sizeof(uint16_t)",  (uint8_t *)&v19,  0xCu);
      }

      unint64_t v12 = 0LL;
    }

    else
    {
      uint64_t v13 = [v10 bytes];
      if (v12 < 2)
      {
LABEL_12:
        unint64_t v12 = 0LL;
LABEL_17:

        goto LABEL_18;
      }

      uint64_t v14 = (unsigned __int16 *)v13;
      unint64_t v15 = v12 >> 1;
      while (1)
      {
        unsigned int v16 = *v14++;
        unint64_t v12 = -[NEIKEv2AuthenticationProtocol initWithSecurePassword:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithSecurePassword:",  bswap32(v16) >> 16);

        if (!--v15) {
          goto LABEL_12;
        }
      }

      ne_log_obj();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        unint64_t v20 = v12;
        _os_log_impl(&dword_1876B1000, v17, OS_LOG_TYPE_INFO, "Found supported %@ in notify", (uint8_t *)&v19, 0xCu);
      }
    }

    goto LABEL_17;
  }

  unint64_t v12 = 0LL;
LABEL_18:

  return v12;
}

- (id)description
{
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2IKESA responderSPI](self, v4);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc(NSString);
  if (self)
  {
    unint64_t ikeSAUniqueIndex = self->_ikeSAUniqueIndex;
    unint64_t ikeSessionUniqueIndex = self->_ikeSessionUniqueIndex;
  }

  else
  {
    unint64_t ikeSAUniqueIndex = 0LL;
    unint64_t ikeSessionUniqueIndex = 0LL;
  }

  id v9 = @"0000000000000000";
  if (v3) {
    id v10 = v3;
  }
  else {
    id v10 = @"0000000000000000";
  }
  if (v5) {
    id v9 = v5;
  }
  uint64_t v11 = (void *)[v6 initWithFormat:@"IKEv2IKESA[%llu.%llu, %@-%@]", ikeSAUniqueIndex, ikeSessionUniqueIndex, v10, v9];

  return v11;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_large_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (self) {
        id Property = objc_getProperty(self, v5, 32LL, 1);
      }
      else {
        id Property = 0LL;
      }
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = Property;
      _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "Deallocating ikeSA %@", buf, 0xCu);
    }
  }

  if (self)
  {
    id v6 = objc_getProperty(self, v3, 464LL, 1);
    id v8 = objc_getProperty(self, v7, 32LL, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v6, v8, 0);

    id v10 = objc_getProperty(self, v9, 472LL, 1);
    id v12 = objc_getProperty(self, v11, 32LL, 1);
  }

  else
  {
    -[NEIKEv2Transport cancelClient:shouldInvalidate:](0LL, 0LL, 0);
    id v10 = 0LL;
    id v12 = 0LL;
  }

  -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v10, v12, 0);

  if (self)
  {
    id v14 = objc_getProperty(self, v13, 480LL, 1);
    id v16 = objc_getProperty(self, v15, 32LL, 1);
  }

  else
  {
    id v14 = 0LL;
    id v16 = 0LL;
  }

  -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v14, v16, 0);

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEIKEv2IKESA;
  -[NEIKEv2IKESA dealloc](&v18, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (_BYTE)initiatorSPI
{
  if (a1)
  {
    if ((a1[9] & 1) != 0) {
      ptrdiff_t v2 = 32LL;
    }
    else {
      ptrdiff_t v2 = 40LL;
    }
    a1 = objc_getProperty(a1, a2, v2, 1);
  }

  return a1;
}

- (_BYTE)responderSPI
{
  if (a1)
  {
    if ((a1[9] & 1) != 0) {
      ptrdiff_t v2 = 40LL;
    }
    else {
      ptrdiff_t v2 = 32LL;
    }
    a1 = objc_getProperty(a1, a2, v2, 1);
  }

  return a1;
}

- (id)initIKESAWithConfiguration:(void *)a3 sessionConfiguration:(void *)a4 queue:(void *)a5 initialTransport:(void *)a6 transportDelegate:(void *)a7 socketGetBlock:(void *)a8 packetDelegate:(void *)a9 configurationDelegate:(uint64_t)a10 ikeSessionUniqueIndex:
{
  uint64_t v139 = *MEMORY[0x1895F89C0];
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  newValue = a5;
  obuint64_t j = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (!a1)
  {
    id v25 = 0LL;
    goto LABEL_90;
  }

  if (!v17)
  {
    id v118 = v21;
    ne_log_obj();
    v119 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:soc"
             "ketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
      _os_log_fault_impl(&dword_1876B1000, v119, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }

    id v25 = 0LL;
    id v21 = v118;
    goto LABEL_89;
  }

  v131.receiver = a1;
  v131.super_class = (Class)&OBJC_CLASS___NEIKEv2IKESA;
  id v23 = objc_msgSendSuper2(&v131, sel_init);
  if (!v23)
  {
    ne_log_obj();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

    id v25 = 0LL;
    goto LABEL_89;
  }

  id v25 = v23;
  objc_setProperty_atomic(v23, v24, v19, 536LL);
  do
    unint64_t v27 = __ldxr(&sNEIKEv2IKESAIndex);
  while (__stxr(v27 + 1, &sNEIKEv2IKESAIndex));
  *((void *)v25 + 73) = v27;
  *((void *)v25 + 72) = a10;
  objc_setProperty_atomic(v25, v26, v17, 80LL);
  objc_setProperty_atomic(v25, v28, v18, 88LL);
  id v124 = v22;
  if ([v17 randomizeLocalPort])
  {
    unsigned int v29 = 0;
    if (!v21) {
      goto LABEL_14;
    }
  }

  else
  {
    else {
      unsigned int v29 = 500;
    }
    if (!v21)
    {
LABEL_14:
      id v31 = v21;
      [v17 remoteEndpoint];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        ne_log_obj();
        CFArrayRef v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          _os_log_fault_impl( &dword_1876B1000,  v77,  OS_LOG_TYPE_FAULT,  "%s called with null configuration.remoteEndpoint",  buf,  0xCu);
        }

        goto LABEL_59;
      }

      [v17 remoteEndpoint];
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        [v17 remoteEndpoint];
        id v35 = (void *)objc_claimAutoreleasedReturnValue();
        int v36 = (unsigned __int8 *)[v35 address];

        if (!v36)
        {
          ne_log_obj();
          CFArrayRef v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
            goto LABEL_59;
          }
          *(_DWORD *)__int128 buf = 136315138;
          v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          uint64_t v78 = "%s called with null remoteAddress";
          goto LABEL_58;
        }

        if (*v36 <= 0xFu)
        {
          ne_log_obj();
          CFArrayRef v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
            goto LABEL_59;
          }
          *(_DWORD *)__int128 buf = 136315138;
          v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          uint64_t v78 = "%s called with null (remoteAddress->sa_len >= sizeof(struct sockaddr_in))";
          goto LABEL_58;
        }

        [v17 localEndpoint];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
LABEL_25:
          id v48 = (void *)MEMORY[0x189608DE8];
          [v17 remoteEndpoint];
          int v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "endpointWithAddress:", objc_msgSend(v49, "address"));
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(v25, v51, v50, 72LL);

          if (!*(_WORD *)(objc_msgSend(objc_getProperty(v25, v52, 72, 1), "address") + 2))
          {
            else {
              unsigned int v54 = 500;
            }
            *(_WORD *)(objc_msgSend(objc_getProperty(v25, v53, 72, 1), "address") + 2) = __rev16(v54);
          }

          id v21 = v31;
          goto LABEL_31;
        }

        [v17 localEndpoint];
        id v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char v39 = objc_opt_isKindOfClass();

        if ((v39 & 1) != 0)
        {
          [v17 localEndpoint];
          id v40 = (void *)objc_claimAutoreleasedReturnValue();
          SEL v41 = (unsigned __int8 *)[v40 address];

          if (!v41)
          {
            ne_log_obj();
            CFArrayRef v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
              goto LABEL_59;
            }
            *(_DWORD *)__int128 buf = 136315138;
            v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelega"
                   "te:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
            uint64_t v78 = "%s called with null localAddress";
            goto LABEL_58;
          }

          if (*v41 > 0xFu)
          {
            unsigned int v42 = __rev16(*((unsigned __int16 *)v41 + 1));
            if (*((_WORD *)v41 + 1)) {
              unsigned int v29 = v42;
            }
            uint64_t v43 = (void *)MEMORY[0x189608DE8];
            [v17 localEndpoint];
            CFIndex v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "endpointWithAddress:", objc_msgSend(v44, "address"));
            id v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_atomic(v25, v46, v45, 64LL);

            *(_WORD *)(objc_msgSend(objc_getProperty(v25, v47, 64, 1), "address") + 2) = __rev16(v29);
            goto LABEL_25;
          }

          ne_log_obj();
          CFArrayRef v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int128 buf = 136315138;
            v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelega"
                   "te:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
            uint64_t v78 = "%s called with null (localAddress->sa_len >= sizeof(struct sockaddr_in))";
            goto LABEL_58;
          }

- (id)preferredKEMProtocol
{
  if (objc_getProperty(a1, a2, 144LL, 1))
  {
    id v4 = objc_getProperty(a1, v3, 144LL, 1);
  }

  else
  {
    id v5 = objc_getProperty(a1, v3, 96LL, 1);
    if (!v5
      || (SEL v7 = v5,
          id Property = objc_getProperty(a1, v6, 96LL, 1),
          -[NEIKEv2IKESAProposal kemProtocol](Property, v9),
          id v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v7,
          !v10))
    {
      objc_msgSend(objc_getProperty(a1, v6, 80, 1), "proposals");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 firstObject];
      SEL v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESAProposal kemProtocol](v15, v16);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }

    id v11 = objc_getProperty(a1, v6, 96LL, 1);
    -[NEIKEv2IKESAProposal kemProtocol](v11, v12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v13 = v4;
  return v13;
}

- (id)copyForRekey
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
  id v3 = objc_loadWeakRetained((id *)(a1 + 544));
  id v4 = objc_alloc(&OBJC_CLASS___NEIKEv2IKESA);
  id v6 = objc_getProperty((id)a1, v5, 80LL, 1);
  id v8 = objc_getProperty((id)a1, v7, 88LL, 1);
  id v10 = objc_getProperty((id)a1, v9, 536LL, 1);
  id v12 = objc_getProperty((id)a1, v11, 552LL, 1);
  id v13 = objc_loadWeakRetained((id *)(a1 + 568));
  id v14 = (id *)-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]( v4,  v6,  v8,  v10,  0LL,  v3,  v12,  WeakRetained,  v13,  *(void *)(a1 + 576));

  if (v14)
  {
    id Property = objc_getProperty((id)a1, v15, 464LL, 1);
    objc_setProperty_atomic(v14, v17, Property, 464LL);
    id v19 = objc_getProperty((id)a1, v18, 472LL, 1);
    objc_setProperty_atomic(v14, v20, v19, 472LL);
    id v22 = objc_getProperty((id)a1, v21, 480LL, 1);
    objc_setProperty_atomic(v14, v23, v22, 480LL);
    id v25 = objc_getProperty(v14, v24, 464LL, 1);
    id v27 = objc_getProperty(v14, v26, 32LL, 1);
    -[NEIKEv2Transport addClient:delegate:](v25, v27, v3);

    id v29 = objc_getProperty(v14, v28, 472LL, 1);
    id v31 = objc_getProperty(v14, v30, 32LL, 1);
    -[NEIKEv2Transport addClient:delegate:](v29, v31, v3);

    id v33 = objc_getProperty(v14, v32, 480LL, 1);
    id v35 = objc_getProperty(v14, v34, 32LL, 1);
    -[NEIKEv2Transport addClient:delegate:](v33, v35, v3);

    id v37 = objc_getProperty((id)a1, v36, 304LL, 1);
    objc_setProperty_atomic(v14, v38, v37, 304LL);
    id v40 = objc_getProperty((id)a1, v39, 64LL, 1);
    objc_setProperty_atomic(v14, v41, v40, 64LL);
    id v43 = objc_getProperty((id)a1, v42, 72LL, 1);
    objc_setProperty_atomic(v14, v44, v43, 72LL);
    objc_storeWeak(v14 + 70, WeakRetained);
    *((_BYTE *)v14 + 25) = *(_BYTE *)(a1 + 25) & 1;
    *((_BYTE *)v14 + 12) = *(_BYTE *)(a1 + 12) & 1;
    *((_BYTE *)v14 + 15) = *(_BYTE *)(a1 + 15) & 1;
    *((_BYTE *)v14 + 14) = *(_BYTE *)(a1 + 14) & 1;
    id v46 = objc_getProperty((id)a1, v45, 488LL, 1);
    objc_setProperty_atomic(v14, v47, v46, 488LL);
    id v49 = objc_getProperty((id)a1, v48, 96LL, 1);
    objc_setProperty_atomic(v14, v50, v49, 96LL);
    *((_BYTE *)v14 + 11) = *(_BYTE *)(a1 + 11) & 1;
    id v52 = objc_getProperty((id)a1, v51, 144LL, 1);
    objc_setProperty_atomic(v14, v53, v52, 144LL);
    id v55 = objc_getProperty((id)a1, v54, 496LL, 1);
    objc_setProperty_atomic(v14, v56, v55, 496LL);
    ne_log_large_obj();
    SEL v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v62 = v14;
      __int16 v63 = 2112;
      uint64_t v64 = a1;
      _os_log_impl(&dword_1876B1000, v57, OS_LOG_TYPE_INFO, "Created %@ for rekey from %@", buf, 0x16u);
    }

    SEL v58 = v14;
  }

  else
  {
    ne_log_obj();
    __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v59,  OS_LOG_TYPE_ERROR,  "[[NEIKEv2IKESA alloc] initIKESAWithConfiguration]",  buf,  2u);
    }
  }

  return v14;
}

- (void)detachTransportWithShouldInvalidate:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = a1;
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating transports for %@", (uint8_t *)&v21, 0xCu);
    }

    id v6 = objc_getProperty(a1, v5, 464LL, 1);
    id Property = objc_getProperty(a1, v7, 32LL, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v6, Property, a2);

    id v10 = objc_getProperty(a1, v9, 472LL, 1);
    id v12 = objc_getProperty(a1, v11, 32LL, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v10, v12, a2);

    id v14 = objc_getProperty(a1, v13, 480LL, 1);
    id v16 = objc_getProperty(a1, v15, 32LL, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v14, v16, a2);

    objc_setProperty_atomic(a1, v17, 0LL, 464LL);
    objc_setProperty_atomic(a1, v18, 0LL, 472LL);
    objc_setProperty_atomic(a1, v19, 0LL, 480LL);
    objc_setProperty_atomic(a1, v20, 0LL, 64LL);
  }

- (void)clearAuthenticationSecrets
{
  if (a1)
  {
    objc_setProperty_atomic(a1, a2, 0LL, 192LL);
    objc_setProperty_atomic(a1, v3, 0LL, 200LL);
    objc_setProperty_atomic(a1, v4, 0LL, 232LL);
    objc_setProperty_atomic(a1, v5, 0LL, 248LL);
    objc_setProperty_atomic(a1, v6, 0LL, 224LL);
    objc_setProperty_atomic(a1, v7, 0LL, 240LL);
    objc_setProperty_atomic(a1, v8, 0LL, 256LL);
    objc_setProperty_atomic(a1, v9, 0LL, 264LL);
    objc_setProperty_atomic(a1, v10, 0LL, 512LL);
    objc_setProperty_atomic(a1, v11, 0LL, 520LL);
    objc_setProperty_atomic(a1, v12, 0LL, 528LL);
    objc_setProperty_atomic(a1, v13, 0LL, 448LL);
    objc_setProperty_atomic(a1, v14, 0LL, 456LL);
  }

- (void)setState:(void *)a3 error:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  unint64_t v6 = a3;
  if (!a1) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  unint64_t Property = (unint64_t)objc_getProperty((id)a1, v5, 56LL, 1);
  ne_log_obj();
  SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 != a2)
  {
    if (v6 | Property)
    {
      if (v10)
      {
        SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 48));
        SEL v14 = NEIKEv2CreateSessionStateString(a2);
        int v22 = 138413314;
        uint64_t v23 = a1;
        __int16 v24 = 2112;
        id v25 = SessionStateString;
        __int16 v26 = 2112;
        unint64_t v27 = (unint64_t)v14;
        __int16 v28 = 2112;
        unint64_t v29 = (unint64_t)objc_getProperty((id)a1, v15, 56LL, 1);
        __int16 v30 = 2112;
        unint64_t v31 = v6;
        id v16 = "%@ state %@ -> %@ error %@ -> %@";
        SEL v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_1876B1000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
      }
    }

    else if (v10)
    {
      SessionStateString = NEIKEv2CreateSessionStateString(*(void *)(a1 + 48));
      SEL v14 = NEIKEv2CreateSessionStateString(a2);
      int v22 = 138412802;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      id v25 = SessionStateString;
      __int16 v26 = 2112;
      unint64_t v27 = (unint64_t)v14;
      id v16 = "%@ state %@ -> %@";
      SEL v17 = v9;
      uint32_t v18 = 32;
      goto LABEL_16;
    }

    *(void *)(a1 + 48) = a2;
    objc_setProperty_atomic((id)a1, v21, (id)v6, 56LL);
    *(_BYTE *)(a1 + 8) = 1;
    goto LABEL_18;
  }

  if (!v6 || Property)
  {
    if (v10)
    {
      SEL v19 = NEIKEv2CreateSessionStateString(a2);
      int v22 = 138413058;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      id v25 = v19;
      __int16 v26 = 2112;
      unint64_t v27 = (unint64_t)objc_getProperty((id)a1, v20, 56LL, 1);
      __int16 v28 = 2112;
      unint64_t v29 = v6;
      _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ not changing state %@ nor error %@ -> %@",  (uint8_t *)&v22,  0x2Au);
    }
  }

  else
  {
    if (v10)
    {
      SEL v11 = NEIKEv2CreateSessionStateString(a2);
      int v22 = 138412802;
      uint64_t v23 = a1;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      unint64_t v27 = v6;
      _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ not changing state %@ but new error %@",  (uint8_t *)&v22,  0x20u);
    }

    objc_setProperty_atomic((id)a1, v12, (id)v6, 56LL);
  }

- (void)assignRemoteSPI:(void *)a1
{
  id v17 = a2;
  objc_setProperty_atomic(a1, v3, v17, 40LL);
  if (objc_getProperty(a1, v4, 464LL, 1))
  {
    id v6 = objc_getProperty(a1, v5, 464LL, 1);
    id Property = objc_getProperty(a1, v7, 32LL, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v6, v17, Property);
  }

  if (objc_getProperty(a1, v5, 472LL, 1))
  {
    id v10 = objc_getProperty(a1, v9, 472LL, 1);
    id v12 = objc_getProperty(a1, v11, 32LL, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v10, v17, v12);
  }

  if (objc_getProperty(a1, v9, 480LL, 1))
  {
    id v14 = objc_getProperty(a1, v13, 480LL, 1);
    id v16 = objc_getProperty(a1, v15, 32LL, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v14, v17, v16);
  }
}

- (void)switchToNATTraversalPorts
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)(a1 + 13) & 1) == 0)
  {
    *(_BYTE *)(a1 + 12) = 1;
    SEL v3 = (unsigned __int8 *)objc_msgSend(objc_getProperty((id)a1, a2, 72, 1), "address");
    if (v3)
    {
      SEL v5 = v3;
      if (*v3 <= 0xFu)
      {
        ne_log_obj();
        SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)__int128 buf = 136315138;
        id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
        uint64_t v32 = "%s called with null (remoteAddress->sa_len >= sizeof(struct sockaddr_in))";
      }

      else
      {
        else {
          unsigned int v7 = 4500;
        }
        SEL v8 = (unsigned __int8 *)objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "address");
        if (v8)
        {
          if (*v8 > 0xFu)
          {
            [MEMORY[0x189608DE8] endpointWithAddress:v8];
            SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189608DE8] endpointWithAddress:v5];
            id v10 = (void *)objc_claimAutoreleasedReturnValue();
            int v11 = *(__int16 *)(-[os_log_s address](v9, "address") + 2);
            uint64_t v12 = -[os_log_s address](v9, "address");
            if (v11 == -3071) {
              *(_WORD *)(v12 + 2) = -27631;
            }
            else {
              unsigned int v7 = bswap32(*(unsigned __int16 *)(v12 + 2)) >> 16;
            }
            if (!objc_getProperty((id)a1, v13, 472LL, 1))
            {
              id WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
              id v17 = objc_loadWeakRetained((id *)(a1 + 544));
              if ((*(_BYTE *)(a1 + 25) & 1) != 0 && !WeakRetained)
              {
                ne_log_obj();
                uint32_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "Cannot create transport for packet delegate, delegate no longer valid",  buf,  2u);
                }

                goto LABEL_22;
              }

              id v19 = objc_getProperty((id)a1, v16, 304LL, 1);
              id v21 = objc_getProperty((id)a1, v20, 536LL, 1);
              id Property = objc_getProperty((id)a1, v22, 552LL, 1);
              __int16 v24 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]( (uint64_t)&OBJC_CLASS___NEIKEv2Transport,  1uLL,  v10,  v9,  v7,  v19,  v21,  Property,  WeakRetained);

              objc_setProperty_atomic((id)a1, v25, v24, 472LL);
              id v27 = objc_getProperty((id)a1, v26, 472LL, 1);
              id v29 = objc_getProperty((id)a1, v28, 32LL, 1);
              -[NEIKEv2Transport addClient:delegate:](v27, v29, v17);

              id v31 = objc_getProperty((id)a1, v30, 472LL, 1);
              v33[0] = MEMORY[0x1895F87A8];
              v33[1] = 3221225472LL;
              v33[2] = __41__NEIKEv2IKESA_switchToNATTraversalPorts__block_invoke;
              v33[3] = &unk_18A090390;
              v33[4] = a1;
              -[NEIKEv2Transport waitForTransport:]((uint64_t)v31, v33);
            }

            objc_getProperty((id)a1, v14, 472LL, 1);
LABEL_22:

LABEL_23:
            return;
          }

          ne_log_obj();
          SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)__int128 buf = 136315138;
          id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
          uint64_t v32 = "%s called with null (localAddress->sa_len >= sizeof(struct sockaddr_in))";
        }

        else
        {
          ne_log_obj();
          SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)__int128 buf = 136315138;
          id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
          uint64_t v32 = "%s called with null localAddress";
        }
      }
    }

    else
    {
      ne_log_obj();
      SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)__int128 buf = 136315138;
      id v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
      uint64_t v32 = "%s called with null remoteAddress";
    }

    _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, v32, buf, 0xCu);
    goto LABEL_23;
  }

void __41__NEIKEv2IKESA_switchToNATTraversalPorts__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 472LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 24LL, 1);
    }
  }

  id v6 = Property;
  unsigned int v7 = *(void **)(a1 + 32);
  if (v7) {
    objc_setProperty_atomic(v7, v5, v6, 72LL);
  }

  id v9 = *(id *)(a1 + 32);
  if (v9)
  {
    id v9 = objc_getProperty(v9, v8, 472LL, 1);
    if (v9) {
      id v9 = objc_getProperty(v9, v10, 16LL, 1);
    }
  }

  int v11 = (char *)v9;
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    SEL v13 = v11;
    objc_setProperty_atomic(v12, v11, v11, 64LL);
    int v11 = v13;
  }
}

void __40__NEIKEv2IKESA_switchToTCPEncapsulation__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 480LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 24LL, 1);
    }
  }

  id v6 = Property;
  unsigned int v7 = *(void **)(a1 + 32);
  if (v7) {
    objc_setProperty_atomic(v7, v5, v6, 72LL);
  }

  id v9 = *(id *)(a1 + 32);
  if (v9)
  {
    id v9 = objc_getProperty(v9, v8, 480LL, 1);
    if (v9) {
      id v9 = objc_getProperty(v9, v10, 16LL, 1);
    }
  }

  int v11 = (char *)v9;
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    SEL v13 = v11;
    objc_setProperty_atomic(v12, v11, v11, 64LL);
    int v11 = v13;
  }
}

- (_BYTE)hasTransport
{
  if (result)
  {
    if ((result[13] & 1) != 0)
    {
      ptrdiff_t v2 = 480LL;
    }

    else if ((result[12] & 1) != 0)
    {
      ptrdiff_t v2 = 472LL;
    }

    else
    {
      ptrdiff_t v2 = 464LL;
    }

    return (_BYTE *)(objc_getProperty(result, a2, v2, 1) != 0LL);
  }

  return result;
}

- (void)resyncAddress
{
  if (a1)
  {
    self = -[NEIKEv2IKESA copyTransport](a1, a2);
    id WeakRetained = objc_loadWeakRetained(a1 + 70);

    SEL v5 = self;
    if (!WeakRetained)
    {
      if (self)
      {
        id v6 = objc_getProperty(self, v4, 16LL, 1);
        objc_setProperty_atomic(a1, v7, v6, 64LL);

        id Property = objc_getProperty(self, v8, 24LL, 1);
      }

      else
      {
        objc_setProperty_atomic(a1, v4, 0LL, 64LL);
        id Property = 0LL;
      }

      id v10 = Property;
      objc_setProperty_atomic(a1, v11, v10, 72LL);

      SEL v5 = self;
    }
  }

- (id)copyTransport
{
  if (!self) {
    return 0LL;
  }
  if ((*((_BYTE *)self + 13) & 1) != 0)
  {
    id Property = objc_getProperty(self, a2, 480LL, 1);
  }

  else if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    if (!objc_getProperty(self, a2, 472LL, 1))
    {
      id WeakRetained = objc_loadWeakRetained(self + 70);
      id v6 = objc_loadWeakRetained(self + 68);
      if ((*((_BYTE *)self + 25) & 1) != 0 && !WeakRetained)
      {
        ne_log_obj();
        SEL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          SEL v8 = buf;
          goto LABEL_28;
        }

- (id)initiatorFirstMessage
{
  if ((a1[9] & 1) != 0) {
    ptrdiff_t v2 = 312LL;
  }
  else {
    ptrdiff_t v2 = 320LL;
  }
  return objc_getProperty(a1, a2, v2, 1);
}

- (id)responderFirstMessage
{
  if ((a1[9] & 1) != 0) {
    ptrdiff_t v2 = 320LL;
  }
  else {
    ptrdiff_t v2 = 312LL;
  }
  return objc_getProperty(a1, a2, v2, 1);
}

- (id)sharedSecret
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (objc_getProperty(a1, a2, 88LL, 1))
  {
    if (!objc_getProperty(a1, v3, 520LL, 1))
    {
      id Property = objc_getProperty(a1, v4, 88LL, 1);
      id v6 = +[NEIKEv2IKESA copySharedSecretFromConfig:]((uint64_t)&OBJC_CLASS___NEIKEv2IKESA, Property);
      objc_setProperty_atomic(a1, v7, v6, 520LL);
    }

    id v8 = objc_getProperty(a1, v4, 520LL, 1);
  }

  else
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[NEIKEv2IKESA sharedSecret]";
      _os_log_fault_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_FAULT,  "%s called with null self.sessionConfiguration",  (uint8_t *)&v11,  0xCu);
    }

    id v8 = 0LL;
  }

  return v8;
}

+ (void)copySharedSecretFromConfig:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      int v14 = "+[NEIKEv2IKESA copySharedSecretFromConfig:]";
      _os_log_fault_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null sessionConfiguration",  (uint8_t *)&v13,  0xCu);
    }

    SEL v7 = 0LL;
LABEL_9:

    goto LABEL_11;
  }

  id v4 = (const char *)v3;
  [v2 sharedSecretReference];
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    [v2 sharedSecret];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      SEL v7 = 0LL;
      goto LABEL_11;
    }

    uint64_t v10 = MEMORY[0x189603F48];
    [v2 sharedSecret];
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    SEL v7 = +[NSData sensitiveDataWithData:](v10, v11);
    goto LABEL_9;
  }

  [v2 sharedSecretReference];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  SEL v7 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v6);

  if (!v7)
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      int v14 = v4;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%@ Failed to retrieve shared secret by reference",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_7;
  }

- (id)ppk
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v2 = a1;
    if (objc_getProperty(a1, a2, 88LL, 1))
    {
      if (!objc_getProperty(v2, v3, 528LL, 1))
      {
        id Property = objc_getProperty(v2, v4, 88LL, 1);
        id v6 = +[NEIKEv2IKESA copyPPKFromConfig:]((uint64_t)&OBJC_CLASS___NEIKEv2IKESA, Property);
        objc_setProperty_atomic(v2, v7, v6, 528LL);
      }

      a1 = objc_getProperty(v2, v4, 528LL, 1);
    }

    else
    {
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315138;
        int v11 = "-[NEIKEv2IKESA ppk]";
        _os_log_fault_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_FAULT,  "%s called with null self.sessionConfiguration",  (uint8_t *)&v10,  0xCu);
      }

      a1 = 0LL;
    }
  }

  return a1;
}

+ (void)copyPPKFromConfig:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      int v14 = "+[NEIKEv2IKESA copyPPKFromConfig:]";
      _os_log_fault_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_FAULT,  "%s called with null sessionConfiguration",  (uint8_t *)&v13,  0xCu);
    }

    SEL v7 = 0LL;
LABEL_9:

    goto LABEL_11;
  }

  id v4 = (const char *)v3;
  [v2 ppkReference];
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    [v2 ppk];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      SEL v7 = 0LL;
      goto LABEL_11;
    }

    uint64_t v10 = MEMORY[0x189603F48];
    [v2 ppk];
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    SEL v7 = +[NSData sensitiveDataWithData:](v10, v11);
    goto LABEL_9;
  }

  [v2 ppkReference];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  SEL v7 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v6);

  if (!v7)
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      int v14 = v4;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%@ Failed to retrieve PPK by reference",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_7;
  }

- (NEIKEv2AddressIdentifier)localIdentifier
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (objc_getProperty(a1, a2, 88LL, 1))
  {
    objc_msgSend(objc_getProperty(a1, v3, 88, 1), "localIdentifier");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(objc_getProperty(a1, v5, 88, 1), "localIdentifier");
      id v6 = (NEIKEv2AddressIdentifier *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v9 = objc_alloc(&OBJC_CLASS___NEIKEv2AddressIdentifier);
      id v6 = -[NEIKEv2AddressIdentifier initWithAddress:](v9, "initWithAddress:", objc_getProperty(a1, v10, 64LL, 1));
    }

    return v6;
  }

  else
  {
    ne_log_obj();
    SEL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[NEIKEv2IKESA localIdentifier]";
      _os_log_fault_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_FAULT,  "%s called with null self.sessionConfiguration",  (uint8_t *)&v11,  0xCu);
    }

    return (NEIKEv2AddressIdentifier *)0LL;
  }

- (id)remoteIdentifier
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!objc_getProperty(a1, a2, 88LL, 1))
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315138;
      SEL v10 = "-[NEIKEv2IKESA remoteIdentifier]";
      _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "%s called with null self.sessionConfiguration",  (uint8_t *)&v9,  0xCu);
    }

    return 0LL;
  }

  if (objc_getProperty(a1, v3, 504LL, 1)) {
    return objc_getProperty(a1, v4, 504LL, 1);
  }
  objc_msgSend(objc_getProperty(a1, v4, 88, 1), "remoteIdentifier");
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7) {
    return 0LL;
  }
  objc_msgSend(objc_getProperty(a1, v8, 88, 1), "remoteIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_BYTE)copyInitiatorIdentifier
{
  if (result)
  {
    if ((result[9] & 1) != 0) {
      -[NEIKEv2IKESA localIdentifier](result, a2);
    }
    else {
      -[NEIKEv2IKESA remoteIdentifier](result, a2);
    }
    return (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return result;
}

- (_BYTE)copyResponderIdentifier
{
  if (result)
  {
    if ((result[9] & 1) != 0) {
      -[NEIKEv2IKESA remoteIdentifier](result, a2);
    }
    else {
      -[NEIKEv2IKESA localIdentifier](result, a2);
    }
    return (_BYTE *)objc_claimAutoreleasedReturnValue();
  }

  return result;
}

- (id)initiatorNonce
{
  if ((a1[9] & 1) != 0) {
    ptrdiff_t v2 = 128LL;
  }
  else {
    ptrdiff_t v2 = 136LL;
  }
  return objc_getProperty(a1, a2, v2, 1);
}

- (id)responderNonce
{
  if ((a1[9] & 1) != 0) {
    ptrdiff_t v2 = 136LL;
  }
  else {
    ptrdiff_t v2 = 128LL;
  }
  return objc_getProperty(a1, a2, v2, 1);
}

- (uint64_t)maximumPacketSize
{
  if (result)
  {
    ptrdiff_t v2 = (void *)result;
    CFTypeRef result = objc_msgSend(objc_getProperty((id)result, a2, 80, 1), "maximumPacketSize");
    if (!(_DWORD)result)
    {
      if (objc_msgSend(objc_getProperty(v2, v3, 72, 1), "addressFamily") == 30) {
        return 1280LL;
      }
      else {
        return 576LL;
      }
    }
  }

  return result;
}

- (_BYTE)headerOverhead
{
  if (result)
  {
    ptrdiff_t v2 = result;
    CFTypeRef result = (_BYTE *)objc_msgSend(objc_getProperty(result, a2, 80, 1), "headerOverhead");
    if ((_DWORD)result == -1)
    {
      if ((v2[12] & 1) != 0) {
        int v4 = 12;
      }
      else {
        int v4 = 8;
      }
      if (objc_msgSend(objc_getProperty(v2, v3, 72, 1), "addressFamily") == 30) {
        int v5 = 40;
      }
      else {
        int v5 = 20;
      }
      return (_BYTE *)(v5 + v4);
    }
  }

  return result;
}

- (id)authenticationProtocol
{
  if (a1)
  {
    ptrdiff_t v2 = a1;
    objc_msgSend(objc_getProperty(a1, a2, 88, 1), "authenticationProtocol");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(objc_getProperty(v2, v4, 88, 1), "authenticationProtocol");
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id Property = objc_getProperty(v2, v4, 96LL, 1);
      if (Property) {
        id v6 = (void *)Property[16];
      }
      else {
        id v6 = 0LL;
      }
      a1 = v6;
    }
  }

  return a1;
}

- (id)remoteAuthentication
{
  if (a1)
  {
    ptrdiff_t v2 = a1;
    objc_msgSend(objc_getProperty(a1, a2, 88, 1), "remoteAuthentication");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(objc_getProperty(v2, v4, 88, 1), "remoteAuthentication");
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id Property = objc_getProperty(v2, v4, 96LL, 1);
      if (Property) {
        id v6 = (void *)Property[16];
      }
      else {
        id v6 = 0LL;
      }
      a1 = v6;
    }
  }

  return a1;
}

- (uint64_t)usesEAPOnlyAuthentication
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 method])
  {

    return 0LL;
  }

  uint64_t v5 = 1LL;
  id Property = objc_getProperty(a1, v4, 96LL, 1);
  char v7 = -[NEIKEv2IKESAProposal hasEAPMethods](Property);

  if ((v7 & 1) == 0) {
    return 0LL;
  }
  return v5;
}

- (void)setAuthProtocolFromPacket:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (void)setPrimeAuthenticationDataFromPacket:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 384), a2);
  }
}

- (void)setPpkIDFromPacket:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 424), a2);
  }
}

- (void)setLocalAuthProtocolUsed:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 432), a2);
  }
}

- (void)setRemoteAuthProtocolUsed:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 440), a2);
  }
}

@end