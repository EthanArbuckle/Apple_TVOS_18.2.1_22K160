@interface TransparencyPublicKeyBag
- (BOOL)allowOldKeys;
- (BOOL)mapStillPopulating;
- (BOOL)processPatClosedProof:(id)a3 error:(id *)a4;
- (BOOL)processPatConfigProof:(id)a3 error:(id *)a4;
- (BOOL)processTltConfigProof:(id)a3 error:(id *)a4;
- (BOOL)unsupported;
- (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 application:(id)a5 error:(id *)a6;
- (BOOL)verifyConfigProof:(id)a3 error:(id *)a4;
- (NSArray)trustedAppLeafs;
- (NSArray)trustedIntermediates;
- (NSArray)trustedTltLeafs;
- (NSArray)verifiedLogHeads;
- (NSData)patClosedProof;
- (NSData)patConfigProof;
- (NSData)tltConfigProof;
- (NSDate)receiptTime;
- (NSDictionary)trustedAppSigningKeys;
- (NSDictionary)trustedTltSigningKeys;
- (NSMutableArray)__verifiedLogHeads;
- (NSString)application;
- (NSString)treeRollInfoURL;
- (SignedMapHead)verifiedSignedMapHead;
- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7;
- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6;
- (TransparencyPublicKeyBag)initWithKeyData:(id)a3 tltLeafs:(id)a4 intermediates:(id)a5 patConfigProof:(id)a6 tltConfigProof:(id)a7 patClosedProof:(id)a8 pamHeadInPatProof:(id)a9 application:(id)a10 allowOldKeys:(BOOL)a11 settings:(id)a12 error:(id *)a13;
- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 error:(id *)a5;
- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7;
- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6;
- (TransparencySettingsProtocol)settings;
- (TransparencyTrustedKeyStore)appSmtKeyStore;
- (TransparencyTrustedKeyStore)appSthKeyStore;
- (TransparencyTrustedKeyStore)tltKeyStore;
- (VRFPublicKey)vrfKey;
- (id)copyTltBag;
- (id)copyVRFKeyFromConfigProof:(id)a3 error:(id *)a4;
- (id)createTrustedSthKeyStoreFromProofSPKI:(id)a3 signingKeysMap:(id)a4 error:(id *)a5;
- (id)diskStoreDictionary;
- (id)processPamHeadInPatProof:(id)a3 tltEntry:(id)a4 error:(id *)a5;
- (int)patEarliestVersion;
- (int)tltEarliestVersion;
- (int)vrfType;
- (unint64_t)patLogBeginningMs;
- (unint64_t)shutDown;
- (unint64_t)tltLogBeginningMs;
- (void)setAllowOldKeys:(BOOL)a3;
- (void)setAppSmtKeyStore:(id)a3;
- (void)setAppSthKeyStore:(id)a3;
- (void)setApplication:(id)a3;
- (void)setMapStillPopulating:(BOOL)a3;
- (void)setPatClosedProof:(id)a3;
- (void)setPatConfigProof:(id)a3;
- (void)setPatEarliestVersion:(int)a3;
- (void)setPatLogBeginningMs:(unint64_t)a3;
- (void)setReceiptTime:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShutDown:(unint64_t)a3;
- (void)setTltConfigProof:(id)a3;
- (void)setTltEarliestVersion:(int)a3;
- (void)setTltKeyStore:(id)a3;
- (void)setTltLogBeginningMs:(unint64_t)a3;
- (void)setTreeRollInfoURL:(id)a3;
- (void)setTrustedAppLeafs:(id)a3;
- (void)setTrustedAppSigningKeys:(id)a3;
- (void)setTrustedIntermediates:(id)a3;
- (void)setTrustedTltLeafs:(id)a3;
- (void)setTrustedTltSigningKeys:(id)a3;
- (void)setUnsupported:(BOOL)a3;
- (void)setVerifiedSignedMapHead:(id)a3;
- (void)setVrfKey:(id)a3;
- (void)setVrfType:(int)a3;
- (void)set__verifiedLogHeads:(id)a3;
@end

@implementation TransparencyPublicKeyBag

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v80 = a4;
  id v79 = a5;
  v13 = qword_1002EC9F8 + 5640;
  v81 = self;
  if ([v12 status] == 1)
  {
    v14 = 0LL;
  }

  else
  {
    v15 = a7;
    uint64_t v16 = kTransparencyErrorServer;
    uint64_t v17 = (int)[v12 status];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
    id v19 = [v12 status];
    uint64_t v20 = v16;
    v13 = &qword_1002EC9F8[705];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v20,  v17,  @"PublicKeysResponse for %@ indicates server failure %d",  v18,  v19));

    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_100283FC8);
    }
    v21 = (void *)qword_1002EEA00;
    a7 = v15;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](v81, "application"));
      *(_DWORD *)buf = 138412546;
      v84 = v23;
      __int16 v85 = 1024;
      LODWORD(v86) = [v12 status];
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "PublicKeysResponse for %@ indicates server failure %d",  buf,  0x12u);

      v13 = &qword_1002EC9F8[705];
    }
  }

  if ([v12 hasPatConfigProof]
    && (v24 = (void *)objc_claimAutoreleasedReturnValue([v12 patConfigProof]), v24, v24))
  {
    if ([v12 hasTltConfigProof]
      && (v25 = (void *)objc_claimAutoreleasedReturnValue([v12 tltConfigProof]), v25, v25))
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v12 appLeafsArray]);
      if (v26 && (v27 = (void *)v26, id v28 = objc_msgSend(v12, "appLeafsArray_Count"), v27, v28))
      {
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v12 tltLeafsArray]);
        if (v29)
        {
          v30 = (void *)v29;
          id v31 = objc_msgSend(v12, "tltLeafsArray_Count");

          if (v31)
          {
            uint64_t v32 = 0LL;
            char v33 = 1;
            if (!v8) {
              goto LABEL_46;
            }
            goto LABEL_40;
          }
        }

        if (qword_1002EE9F8 != -1) {
          dispatch_once(&qword_1002EE9F8, &stru_100284048);
        }
        v37 = (os_log_s *)qword_1002EEA00;
        if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "PublicKeyResponse missing tlt leafs",  buf,  2u);
        }

        char v33 = 0;
        uint64_t v32 = -36LL;
        if (v8)
        {
LABEL_40:
          uint64_t v38 = objc_claimAutoreleasedReturnValue([v12 oldAppRootCertsArray]);
          if (v38)
          {
            v39 = (void *)v38;
            id v40 = objc_msgSend(v12, "oldAppRootCertsArray_Count");

            if (v40)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue([v12 appLeafsArray]);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v12 oldAppRootCertsArray]);
              [v41 addObjectsFromArray:v42];
            }
          }

          uint64_t v43 = objc_claimAutoreleasedReturnValue([v12 oldTltRootCertsArray]);
          if (v43)
          {
            v44 = (void *)v43;
            id v45 = objc_msgSend(v12, "oldTltRootCertsArray_Count");

            if (v45)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue([v12 tltLeafsArray]);
              v47 = (void *)objc_claimAutoreleasedReturnValue([v12 oldTltRootCertsArray]);
              [v46 addObjectsFromArray:v47];
            }
          }
        }
      }

      else
      {
        if (qword_1002EE9F8 != -1) {
          dispatch_once(&qword_1002EE9F8, &stru_100284028);
        }
        v36 = (os_log_s *)qword_1002EEA00;
        if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "PublicKeyResponse missing app leafs",  buf,  2u);
        }

        char v33 = 0;
        uint64_t v32 = -31LL;
        if (v8) {
          goto LABEL_40;
        }
      }
    }

    else
    {
      if (v13[319] != -1LL) {
        dispatch_once(&qword_1002EE9F8, &stru_100284008);
      }
      v35 = (os_log_s *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "PublicKeyResponse missing data required for TLT key verification",  buf,  2u);
      }

      char v33 = 0;
      uint64_t v32 = -223LL;
      if (v8) {
        goto LABEL_40;
      }
    }
  }

  else
  {
    if (v13[319] != -1LL) {
      dispatch_once(&qword_1002EE9F8, &stru_100283FE8);
    }
    v34 = (os_log_s *)qword_1002EEA00;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "PublicKeyResponse missing data required for PAT key verification",  buf,  2u);
    }

    char v33 = 0;
    uint64_t v32 = -32LL;
    if (v8) {
      goto LABEL_40;
    }
  }

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6
{
  return -[TransparencyPublicKeyBag initWithPublicKeysResponse:application:settings:allowOldKeys:error:]( self,  "initWithPublicKeysResponse:application:settings:allowOldKeys:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (TransparencyPublicKeyBag)initWithPublicKeysResponse:(id)a3 application:(id)a4 error:(id *)a5
{
  return -[TransparencyPublicKeyBag initWithPublicKeysResponse:application:settings:error:]( self,  "initWithPublicKeysResponse:application:settings:error:",  a3,  a4,  0LL,  a5);
}

- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 allowOldKeys:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"PatConfigProof"]);
  if (!v15) {
    goto LABEL_22;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TltConfigProof"]);
  if (!v17) {
    goto LABEL_21;
  }
  v18 = (void *)v17;
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Leafs"]);
  if (!v19)
  {
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }

  uint64_t v20 = (void *)v19;
  id v54 = v13;
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TltLeafs"]);
  if (!v21)
  {
LABEL_19:

    id v13 = v54;
    goto LABEL_20;
  }

  v22 = (void *)v21;
  id v53 = v14;
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Intermediates"]);
  if (!v23)
  {

    goto LABEL_19;
  }

  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"ReceiptTime"]);

  id v14 = v53;
  id v13 = v54;
  if (v25)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"PatConfigProof"]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PatInclusionProof,  "parseFromData:error:",  v26,  a7));

    if (!v27)
    {
      if (a7) {
        *a7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -35LL,  *a7));
      }
      id v14 = v53;
      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_1002840A8);
      }
      v39 = (os_log_s *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        if (a7) {
          id v40 = (NSString *)*a7;
        }
        else {
          id v40 = 0LL;
        }
        *(_DWORD *)buf = 138412290;
        unsigned int v57 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "PAT inclusion proof from disk failed to parse: %@",  buf,  0xCu);
      }

      v37 = 0LL;
      goto LABEL_59;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TltConfigProof"]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___LogEntry,  "parseFromData:error:",  v28,  a7));

    if (v29)
    {
      v52 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"PatClosedProof"]);

      if (v30)
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"PatClosedProof"]);
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PatInclusionProof,  "parseFromData:error:",  v31,  a7));

        if (!v32)
        {
          if (a7) {
            *a7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -35LL,  *a7));
          }
          uint64_t v29 = v52;
          id v14 = v53;
          if (qword_1002EE9F8 != -1) {
            dispatch_once(&qword_1002EE9F8, &stru_1002840E8);
          }
          char v33 = (os_log_s *)qword_1002EEA00;
          if (!os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR)) {
            goto LABEL_57;
          }
          if (a7) {
            v34 = (NSString *)*a7;
          }
          else {
            v34 = 0LL;
          }
          *(_DWORD *)buf = 138412290;
          unsigned int v57 = v34;
          v49 = "PAT closed inclusion proof from disk failed to parse: %@";
LABEL_56:
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);
LABEL_57:
          v37 = 0LL;
LABEL_58:

LABEL_59:
          goto LABEL_29;
        }
      }

      else
      {
        uint64_t v32 = 0LL;
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TreeRollInfoURL"]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Leafs"]);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TltLeafs"]);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Intermediates"]);
      id v55 = 0LL;
      LOBYTE(v50) = a6;
      id v45 = -[TransparencyPublicKeyBag initWithKeyData:tltLeafs:intermediates:patConfigProof:tltConfigProof:patClosedProof:pamHeadInPatProof:application:allowOldKeys:settings:error:]( self,  "initWithKeyData:tltLeafs:intermediates:patConfigProof:tltConfigProof:patClosedProof:pamHeadInPatProof:appl ication:allowOldKeys:settings:error:",  v42,  v43,  v44,  v27,  v52,  v32,  0LL,  v54,  v50,  v53,  &v55);
      id v46 = v55;
      v47 = v45;

      v48 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"ReceiptTime"]);
      -[TransparencyPublicKeyBag setReceiptTime:](v47, "setReceiptTime:", v48);

      -[TransparencyPublicKeyBag setTreeRollInfoURL:](v47, "setTreeRollInfoURL:", v51);
      if (a7 && v46) {
        *a7 = v46;
      }
      self = v47;

      v37 = self;
      id v14 = v53;
      id v13 = v54;
      uint64_t v29 = v52;
      goto LABEL_58;
    }

    if (a7) {
      *a7 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -218LL,  *a7));
    }
    id v14 = v53;
    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_1002840C8);
    }
    char v33 = (os_log_s *)qword_1002EEA00;
    if (!os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    if (a7) {
      v41 = (NSString *)*a7;
    }
    else {
      v41 = 0LL;
    }
    *(_DWORD *)buf = 138412290;
    unsigned int v57 = v41;
    v49 = "TLT inclusion proof from disk failed to parse: %@";
    goto LABEL_56;
  }

- (TransparencyPublicKeyBag)initWithDiskKeyStore:(id)a3 application:(id)a4 settings:(id)a5 error:(id *)a6
{
  return -[TransparencyPublicKeyBag initWithDiskKeyStore:application:settings:allowOldKeys:error:]( self,  "initWithDiskKeyStore:application:settings:allowOldKeys:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (TransparencyPublicKeyBag)initWithKeyData:(id)a3 tltLeafs:(id)a4 intermediates:(id)a5 patConfigProof:(id)a6 tltConfigProof:(id)a7 patClosedProof:(id)a8 pamHeadInPatProof:(id)a9 application:(id)a10 allowOldKeys:(BOOL)a11 settings:(id)a12 error:(id *)a13
{
  id v19 = a3;
  id v66 = a4;
  id v74 = a4;
  id v20 = a5;
  id v75 = a6;
  id v21 = a7;
  id v73 = a8;
  id v76 = a9;
  id v22 = a10;
  id v23 = a12;
  v77.receiver = self;
  v77.super_class = (Class)&OBJC_CLASS___TransparencyPublicKeyBag;
  v24 = -[TransparencyPublicKeyBag init](&v77, "init");
  if (v24)
  {
    id v72 = v21;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[TransparencyPublicKeyBag set__verifiedLogHeads:](v24, "set__verifiedLogHeads:", v25);

    -[TransparencyPublicKeyBag setApplication:](v24, "setApplication:", v22);
    -[TransparencyPublicKeyBag setAllowOldKeys:](v24, "setAllowOldKeys:", a11);
    -[TransparencyPublicKeyBag setSettings:](v24, "setSettings:", v23);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag settings](v24, "settings"));

    if (!v26)
    {
      id v27 = objc_alloc_init(&OBJC_CLASS___TransparencySettings);
      -[TransparencyPublicKeyBag setSettings:](v24, "setSettings:", v27);
    }

    id v28 = v19;
    if (-[TransparencyPublicKeyBag verifyCertificates:intermediates:application:error:]( v24,  "verifyCertificates:intermediates:application:error:",  v19,  v20,  v22,  a13))
    {
      uint64_t v29 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:error:]( &OBJC_CLASS___TransparencyCertificateHelper,  "copyTrustedKeysFromDataArray:error:",  v19,  a13);
      trustedAppSigningKeys = v24->_trustedAppSigningKeys;
      v24->_trustedAppSigningKeys = v29;

      id v31 = v74;
      if (v24->_trustedAppSigningKeys)
      {
        objc_storeStrong((id *)&v24->_trustedAppLeafs, a3);
        uint64_t v32 = objc_alloc(&OBJC_CLASS___TransparencyTrustedKeyStore);
        char v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedAppSigningKeys](v24, "trustedAppSigningKeys"));
        v34 = -[TransparencyTrustedKeyStore initWithTrustedKeys:](v32, "initWithTrustedKeys:", v33);
        -[TransparencyPublicKeyBag setAppSmtKeyStore:](v24, "setAppSmtKeyStore:", v34);

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag appSmtKeyStore](v24, "appSmtKeyStore"));
        -[TransparencyPublicKeyBag setAppSthKeyStore:](v24, "setAppSthKeyStore:", v35);

        if (-[TransparencyPublicKeyBag verifyCertificates:intermediates:application:error:]( v24,  "verifyCertificates:intermediates:application:error:",  v74,  v20,  kKTApplicationIdentifierTLT,  a13))
        {
          v36 = +[TransparencyCertificateHelper copyTrustedKeysFromDataArray:error:]( &OBJC_CLASS___TransparencyCertificateHelper,  "copyTrustedKeysFromDataArray:error:",  v74,  a13);
          trustedTltSigningKeys = v24->_trustedTltSigningKeys;
          v24->_trustedTltSigningKeys = v36;

          if (v24->_trustedTltSigningKeys)
          {
            objc_storeStrong((id *)&v24->_trustedTltLeafs, v66);
            uint64_t v38 = objc_alloc(&OBJC_CLASS___TransparencyTrustedKeyStore);
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](v24, "trustedTltSigningKeys"));
            id v40 = -[TransparencyTrustedKeyStore initWithTrustedKeys:](v38, "initWithTrustedKeys:", v39);
            tltKeyStore = v24->_tltKeyStore;
            v24->_tltKeyStore = v40;

            v42 = v75;
            if ([v20 count]) {
              uint64_t v43 = (NSArray *)v20;
            }
            else {
              uint64_t v43 = (NSArray *)&__NSArray0__struct;
            }
            trustedIntermediates = v24->_trustedIntermediates;
            v24->_trustedIntermediates = v43;

            id v45 = v73;
            if (!-[TransparencyPublicKeyBag processTltConfigProof:error:]( v24,  "processTltConfigProof:error:",  v21,  a13)) {
              goto LABEL_38;
            }
            if (!v76)
            {
LABEL_30:
              if (-[TransparencyPublicKeyBag processPatConfigProof:error:]( v24,  "processPatConfigProof:error:",  v42,  a13)
                && (!v45
                 || -[TransparencyPublicKeyBag processPatClosedProof:error:]( v24,  "processPatClosedProof:error:",  v45,  a13)))
              {
                v44 = v24;
                goto LABEL_15;
              }

- (id)createTrustedSthKeyStoreFromProofSPKI:(id)a3 signingKeysMap:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_sha256"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);

  if (v10)
  {
    v11 = objc_alloc(&OBJC_CLASS___TransparencyTrustedKeyStore);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_sha256"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v10,  v12));
    id v14 = -[TransparencyTrustedKeyStore initWithTrustedKeys:](v11, "initWithTrustedKeys:", v13);
  }

  else
  {
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -219LL,  @"Signing key in proof does not match any signing key in certs"));
    }
    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_100284188);
    }
    uint64_t v15 = (os_log_s *)qword_1002EEA00;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Signing key in proof does not match any signing key in certs",  v17,  2u);
    }

    id v14 = 0LL;
  }

  return v14;
}

- (id)diskStoreDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedAppLeafs](self, "trustedAppLeafs"));
  [v3 setObject:v4 forKeyedSubscript:@"Leafs"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltLeafs](self, "trustedTltLeafs"));
  [v3 setObject:v5 forKeyedSubscript:@"TltLeafs"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedIntermediates](self, "trustedIntermediates"));
  [v3 setObject:v6 forKeyedSubscript:@"Intermediates"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag patConfigProof](self, "patConfigProof"));
  [v3 setObject:v7 forKeyedSubscript:@"PatConfigProof"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltConfigProof](self, "tltConfigProof"));
  [v3 setObject:v8 forKeyedSubscript:@"TltConfigProof"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag receiptTime](self, "receiptTime"));
  [v3 setObject:v9 forKeyedSubscript:@"ReceiptTime"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag patClosedProof](self, "patClosedProof"));
  [v3 setObject:v10 forKeyedSubscript:@"PatClosedProof"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag treeRollInfoURL](self, "treeRollInfoURL"));
  [v3 setObject:v11 forKeyedSubscript:@"TreeRollInfoURL"];

  return v3;
}

- (id)copyTltBag
{
  v3 = objc_alloc_init(&OBJC_CLASS___TransparencyPublicKeyBag);
  -[TransparencyPublicKeyBag setApplication:](v3, "setApplication:", kKTApplicationIdentifierTLT);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
  -[TransparencyPublicKeyBag setAppSthKeyStore:](v3, "setAppSthKeyStore:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](self, "trustedTltSigningKeys"));
  -[TransparencyPublicKeyBag setTrustedAppSigningKeys:](v3, "setTrustedAppSigningKeys:", v5);

  -[TransparencyPublicKeyBag setPatLogBeginningMs:]( v3,  "setPatLogBeginningMs:",  -[TransparencyPublicKeyBag tltLogBeginningMs](self, "tltLogBeginningMs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
  -[TransparencyPublicKeyBag setTltKeyStore:](v3, "setTltKeyStore:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](self, "trustedTltSigningKeys"));
  -[TransparencyPublicKeyBag setTrustedTltSigningKeys:](v3, "setTrustedTltSigningKeys:", v7);

  -[TransparencyPublicKeyBag setTltLogBeginningMs:]( v3,  "setTltLogBeginningMs:",  -[TransparencyPublicKeyBag tltLogBeginningMs](self, "tltLogBeginningMs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag vrfKey](self, "vrfKey"));
  -[TransparencyPublicKeyBag setVrfKey:](v3, "setVrfKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag receiptTime](self, "receiptTime"));
  -[TransparencyPublicKeyBag setReceiptTime:](v3, "setReceiptTime:", v9);

  -[TransparencyPublicKeyBag setTltEarliestVersion:]( v3,  "setTltEarliestVersion:",  -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion"));
  -[TransparencyPublicKeyBag setShutDown:](v3, "setShutDown:", -[TransparencyPublicKeyBag shutDown](self, "shutDown"));
  return v3;
}

- (NSArray)verifiedLogHeads
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v2));

  return (NSArray *)v3;
}

- (BOOL)verifyCertificates:(id)a3 intermediates:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag settings](self, "settings"));
  if ([v13 allowsInternalSecurityPolicies])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag settings](self, "settings"));
    unsigned int v15 = [v14 getBool:kTransparencyFlagDisableVerifyKeyStoreCertificates];

    if (v15)
    {
      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_1002841A8);
      }
      uint64_t v16 = (os_log_s *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "certificate verification not enabled",  buf,  2u);
      }

      BOOL v17 = 1;
      goto LABEL_24;
    }
  }

  else
  {
  }

  uint64_t AppleKeyTransparency = SecPolicyCreateAppleKeyTransparency(v12);
  if (AppleKeyTransparency)
  {
    id v19 = (const void *)AppleKeyTransparency;
    unsigned __int8 v20 = +[TransparencyCertificateHelper verifyCertificates:intermediates:policy:error:]( &OBJC_CLASS___TransparencyCertificateHelper,  "verifyCertificates:intermediates:policy:error:",  v10,  v11,  AppleKeyTransparency,  a6);
    BOOL v17 = v20;
    if (a6 && (v20 & 1) == 0)
    {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -29LL,  v12,  *a6));
      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_1002841E8);
      }
      id v21 = (os_log_s *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        id v22 = *a6;
        *(_DWORD *)buf = 138412546;
        id v26 = v12;
        __int16 v27 = 2112;
        id v28 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "certificates for %@ failed trust evaluation: %@",  buf,  0x16u);
      }
    }

    CFRelease(v19);
  }

  else
  {
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorAlloc,  -53LL,  @"failed to create KT policy for %@",  v12));
    }
    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_1002841C8);
    }
    id v23 = (os_log_s *)qword_1002EEA00;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create KT policy for %@", buf, 0xCu);
    }

    BOOL v17 = 0;
  }

- (BOOL)processTltConfigProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
  v9 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v7, "initWithTrustedKeyStore:", v8);

  [v6 setVerifier:v9];
  if (![v6 verifyWithError:a4])
  {
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -224LL,  *a4,  @"TLT config proof failed to verify"));
    }
    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_100284208);
    }
    uint64_t v17 = qword_1002EEA00;
    if (!os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    if (a4) {
      id v18 = *a4;
    }
    else {
      id v18 = 0LL;
    }
    *(_DWORD *)buf = 138412290;
    v38[0] = v18;
    id v14 = "TLT config proof failed to verify: %@";
    unsigned int v15 = (os_log_s *)v17;
    uint32_t v16 = 12;
    goto LABEL_36;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 slh]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v11));
  [v10 addObject:v12];

  if (![v6 nodePosition])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 nodeBytes]);
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___TopLevelTreeConfigNode,  "parseFromData:error:",  v19,  a4));

    if (!v20)
    {
      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_100284248);
      }
      uint64_t v29 = (os_log_s *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          id v30 = *a4;
        }
        else {
          id v30 = 0LL;
        }
        *(_DWORD *)buf = 138412290;
        v38[0] = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "TLT config node failed to parse: %@",  buf,  0xCu);
      }

      BOOL v31 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -141LL,  *a4,  @"TLT config node failed to parse"));
      }
      goto LABEL_52;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 publicKeyBytes]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag trustedTltSigningKeys](self, "trustedTltSigningKeys"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyPublicKeyBag createTrustedSthKeyStoreFromProofSPKI:signingKeysMap:error:]( self,  "createTrustedSthKeyStoreFromProofSPKI:signingKeysMap:error:",  v21,  v22,  a4));

    if (v23)
    {
      if (!-[TransparencyPublicKeyBag allowOldKeys](self, "allowOldKeys")) {
        -[TransparencyPublicKeyBag setTltKeyStore:](self, "setTltKeyStore:", v23);
      }
      -[TransparencyPublicKeyBag setTltEarliestVersion:]( self,  "setTltEarliestVersion:",  TopLevelTreeConfigNode_EarliestVersion_RawValue((uint64_t)v20));
      if (!-[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion")) {
        -[TransparencyPublicKeyBag setTltEarliestVersion:](self, "setTltEarliestVersion:", 1LL);
      }
      signed int v24 = -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion");
      uint64_t v25 = kTransparencyProtocolVersion;
      if (v24 <= kTransparencyProtocolVersion)
      {
        char v33 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
        -[TransparencyPublicKeyBag setTltConfigProof:](self, "setTltConfigProof:", v33);

        BOOL v31 = 1;
        goto LABEL_47;
      }

      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_100284288);
      }
      id v26 = (void *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = v26;
        *(_DWORD *)buf = 67109376;
        LODWORD(v38[0]) = -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion");
        WORD2(v38[0]) = 1024;
        *(_DWORD *)((char *)v38 + 6) = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "TLT config proof earliest version later %d than our version %d",  buf,  0xEu);
      }

      if (a4)
      {
        id v28 = +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -235LL,  *a4,  @"TLT config proof earliest version later %d than our version %d",  -[TransparencyPublicKeyBag tltEarliestVersion](self, "tltEarliestVersion"),  v25);
LABEL_44:
        BOOL v31 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v28);
LABEL_47:

LABEL_52:
        goto LABEL_53;
      }
    }

    else
    {
      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_100284268);
      }
      uint64_t v32 = (os_log_s *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "TLT config proof signing key did not match any trusted cert",  buf,  2u);
      }

      if (a4)
      {
        id v28 = +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -222LL,  *a4,  @"TLT config proof signing key did not match any trusted cert",  v35,  v36);
        goto LABEL_44;
      }
    }

    BOOL v31 = 0;
    goto LABEL_47;
  }

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -220LL,  @"TLT config proof at wrong position"));
  }
  if (qword_1002EE9F8 != -1) {
    dispatch_once(&qword_1002EE9F8, &stru_100284228);
  }
  uint64_t v13 = qword_1002EEA00;
  if (!os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR)) {
    goto LABEL_37;
  }
  *(_WORD *)buf = 0;
  id v14 = "TLT config proof at wrong position";
  unsigned int v15 = (os_log_s *)v13;
  uint32_t v16 = 2;
LABEL_36:
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
LABEL_37:
  BOOL v31 = 0;
LABEL_53:

  return v31;
}

- (id)processPamHeadInPatProof:(id)a3 tltEntry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 nodeBytes]);
  id v40 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PerApplicationTreeNode,  "parseFromData:error:",  v10,  &v40));
  id v12 = v40;

  if (v11 && ([v11 hasObjectMapHead] ? (BOOL v13 = v12 == 0) : (BOOL v13 = 0), v13))
  {
    uint32_t v16 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag appSthKeyStore](self, "appSthKeyStore"));
    id v18 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v16, "initWithTrustedKeyStore:", v17);

    id v19 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag tltKeyStore](self, "tltKeyStore"));
    id v21 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v19, "initWithTrustedKeyStore:", v20);

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectMapHead]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:](&OBJC_CLASS___SignedMapHead, "signedTypeWithObject:", v22));

    signed int v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogEntryVerifier trustedKeyStore](v18, "trustedKeyStore"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 signatureVerifier]);
    [v23 setVerifier:v25];

    [v23 setOverrideBeginTimeFromLogEntry:v8];
    if (v23)
    {
      id v39 = 0LL;
      id v26 = [v23 verifyWithError:&v39];
      id v27 = v39;
      if (v26 == (id)1)
      {
        [v8 setVerifier:v18];
        uint64_t v36 = v21;
        [v9 setVerifier:v21];
        id v28 = objc_alloc(&OBJC_CLASS___TransparencyMapInclusionProofVerifier);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
        id v30 = -[TransparencyMapInclusionProofVerifier initWithKeyBag:application:]( v28,  "initWithKeyBag:application:",  self,  v29);

        v37 = v30;
        id v38 = v27;
        unint64_t v31 = -[TransparencyMapInclusionProofVerifier verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:]( v30,  "verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:",  v8,  v23,  v9,  &v38);
        id v12 = v38;

        if (v12)
        {
          if (qword_1002EE9F8 != -1) {
            dispatch_once(&qword_1002EE9F8, &stru_100284308);
          }
          id v21 = v36;
          uint64_t v32 = (os_log_s *)qword_1002EEA00;
          if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v42 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "verifyPerApplicationTreeEntry failed for pamInPatEntry: %@",  buf,  0xCu);
          }

          id v15 = 0LL;
          if (a5) {
            *a5 = v12;
          }
        }

        else
        {
          if (v31)
          {
            -[TransparencyPublicKeyBag setVerifiedSignedMapHead:](self, "setVerifiedSignedMapHead:", v23);
            id v15 = v23;
          }

          else
          {
            id v15 = 0LL;
          }

          id v21 = v36;
        }
      }

      else
      {
        if (qword_1002EE9F8 != -1) {
          dispatch_once(&qword_1002EE9F8, &stru_1002842E8);
        }
        v34 = (os_log_s *)qword_1002EEA00;
        if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Couldn't verify SMH from pamHeadInPatProof: signature was invalid with error %@",  buf,  0xCu);
        }

        id v15 = 0LL;
        if (a5 && v27)
        {
          id v12 = v27;
          id v15 = 0LL;
          *a5 = v12;
        }

        else
        {
          id v12 = v27;
        }
      }
    }

    else
    {
      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_1002842C8);
      }
      char v33 = (os_log_s *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Couldn't verify SMH from pamHeadInPatProof: object init failure",  buf,  2u);
      }

      id v12 = 0LL;
      id v15 = 0LL;
    }
  }

  else
  {
    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_1002842A8);
    }
    id v14 = (os_log_s *)qword_1002EEA00;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Couldn't parse SMH from pamHeadInPatProof: %@",  buf,  0xCu);
    }

    id v15 = 0LL;
    if (a5 && v12)
    {
      id v12 = v12;
      id v15 = 0LL;
      *a5 = v12;
    }
  }

  return v15;
}

- (BOOL)verifyConfigProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___TransparencyPatInclusionProofVerifier);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
  id v9 = -[TransparencyPatInclusionProofVerifier initWithKeyBag:application:](v7, "initWithKeyBag:application:", self, v8);

  [v6 setVerifier:v9];
  id v10 = [v6 verifyConfigProof:a4];
  if (v10 == (id)1)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 perApplicationTreeEntry]);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 slh]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v13));
    [v11 addObject:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag __verifiedLogHeads](self, "__verifiedLogHeads"));
    uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 topLevelTreeEntry]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 slh]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v17));
    [v15 addObject:v18];
  }

  return v10 == (id)1;
}

- (id)copyVRFKeyFromConfigProof:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 vrfPublicKeyWithError:a4]);
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyVRFVerifier verifierOfType:key:]( TransparencyVRFVerifier,  "verifierOfType:key:",  [v6 type],  v6));
    id v9 = v8;
    if (v8 && [v8 vrfType])
    {
      id v10 = v7;
    }

    else
    {
      if (a4)
      {
        uint64_t v11 = kTransparencyErrorDecode;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 vrfKey]);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  v11,  -143,  @"VRF public key [%@] of type %d is invalid",  v13,  [v7 type]));
      }

      if (qword_1002EE9F8 != -1) {
        dispatch_once(&qword_1002EE9F8, &stru_100284348);
      }
      id v14 = (void *)qword_1002EEA00;
      if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
      {
        id v15 = v14;
        uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 vrfKey]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_hexString"));
        *(_DWORD *)buf = 138412546;
        id v23 = v17;
        __int16 v24 = 1024;
        unsigned int v25 = [v7 type];
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "VRF public key [%@] of type %d is invalid",  buf,  0x12u);
      }

      id v10 = 0LL;
    }
  }

  else
  {
    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_100284328);
    }
    id v18 = (void *)qword_1002EEA00;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
      *(_DWORD *)buf = 138543362;
      id v23 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to get vrf public key from config proof for %{public}@",  buf,  0xCu);
    }

    id v10 = 0LL;
  }

  return v10;
}

- (BOOL)processPatConfigProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!-[TransparencyPublicKeyBag verifyConfigProof:error:](self, "verifyConfigProof:error:", v6, a4)) {
    goto LABEL_13;
  }
  if (qword_1002EE9F8 != -1) {
    dispatch_once(&qword_1002EE9F8, &stru_100284368);
  }
  id v7 = (void *)qword_1002EEA00;
  if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    *(_DWORD *)buf = 134218240;
    *(void *)uint64_t v32 = -[TransparencyPublicKeyBag patLogBeginningMs](self, "patLogBeginningMs");
    *(_WORD *)&v32[8] = 2048;
    id v33 = [v6 patLogBeginningMs];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Processing new PAT config. Current %llu, processing %llu",  buf,  0x16u);
  }

  -[TransparencyPublicKeyBag setPatEarliestVersion:]( self,  "setPatEarliestVersion:",  [v6 earliestCurrentTreeVersionWithError:a4]);
  signed int v9 = -[TransparencyPublicKeyBag patEarliestVersion](self, "patEarliestVersion");
  uint64_t v10 = kTransparencyProtocolVersion;
  if (v9 > kTransparencyProtocolVersion)
  {
    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_100284388);
    }
    uint64_t v11 = (void *)qword_1002EEA00;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      unsigned int v13 = -[TransparencyPublicKeyBag patEarliestVersion](self, "patEarliestVersion");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v32 = v13;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "PAT config proof earliest version later %d than our version %d",  buf,  0xEu);
    }

    if (a4)
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -236LL,  *a4,  @"PAT config proof earliest version later %d than our version %d",  -[TransparencyPublicKeyBag patEarliestVersion](self, "patEarliestVersion"),  v10));
      BOOL v15 = 0;
      *a4 = v14;
      goto LABEL_44;
    }

- (BOOL)processPatClosedProof:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___TransparencyPatInclusionProofVerifier);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPublicKeyBag application](self, "application"));
  signed int v9 = -[TransparencyPatInclusionProofVerifier initWithKeyBag:application:](v7, "initWithKeyBag:application:", self, v8);

  [v6 setVerifier:v9];
  if ([v6 verifyWithError:a4] != (id)1) {
    goto LABEL_11;
  }
  id v10 = [v6 earliestNextTreeVersionWithError:a4];
  BOOL v11 = (BOOL)v10;
  if ((_DWORD)v10)
  {
    uint64_t v12 = kTransparencyProtocolVersion;
    if (kTransparencyProtocolVersion < (int)v10)
    {
      LOBYTE(v11) = 1;
      -[TransparencyPublicKeyBag setUnsupported:](self, "setUnsupported:", 1LL);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
      -[TransparencyPublicKeyBag setPatClosedProof:](self, "setPatClosedProof:", v13);

      -[TransparencyPublicKeyBag setShutDown:](self, "setShutDown:", [v6 shutdownTimeStamp:a4]);
      goto LABEL_12;
    }

    if (qword_1002EE9F8 != -1) {
      dispatch_once(&qword_1002EE9F8, &stru_1002843E8);
    }
    id v14 = (os_log_s *)qword_1002EEA00;
    if (os_log_type_enabled((os_log_t)qword_1002EEA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v18 = v11;
      __int16 v19 = 1024;
      int v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "PAT Closed proof for %d but our version is supported %d",  buf,  0xEu);
    }

    if (a4)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  @"TransparencyErrorVerify",  -234LL,  *a4,  @"PAT Closed proof for %d but our version is supported %d",  v11,  v12));
      LOBYTE(v11) = 0;
      *a4 = v15;
      goto LABEL_12;
    }

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSDictionary)trustedAppSigningKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTrustedAppSigningKeys:(id)a3
{
}

- (NSDate)receiptTime
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setReceiptTime:(id)a3
{
}

- (VRFPublicKey)vrfKey
{
  return (VRFPublicKey *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setVrfKey:(id)a3
{
}

- (TransparencyTrustedKeyStore)appSmtKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAppSmtKeyStore:(id)a3
{
}

- (TransparencyTrustedKeyStore)appSthKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAppSthKeyStore:(id)a3
{
}

- (TransparencyTrustedKeyStore)tltKeyStore
{
  return (TransparencyTrustedKeyStore *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTltKeyStore:(id)a3
{
}

- (unint64_t)patLogBeginningMs
{
  return self->_patLogBeginningMs;
}

- (void)setPatLogBeginningMs:(unint64_t)a3
{
  self->_patLogBeginningMs = a3;
}

- (unint64_t)tltLogBeginningMs
{
  return self->_tltLogBeginningMs;
}

- (void)setTltLogBeginningMs:(unint64_t)a3
{
  self->_tltLogBeginningMs = a3;
}

- (int)tltEarliestVersion
{
  return self->_tltEarliestVersion;
}

- (void)setTltEarliestVersion:(int)a3
{
  self->_tltEarliestVersion = a3;
}

- (int)patEarliestVersion
{
  return self->_patEarliestVersion;
}

- (void)setPatEarliestVersion:(int)a3
{
  self->_patEarliestVersion = a3;
}

- (unint64_t)shutDown
{
  return self->_shutDown;
}

- (void)setShutDown:(unint64_t)a3
{
  self->_shutDown = a3;
}

- (BOOL)unsupported
{
  return self->_unsupported;
}

- (void)setUnsupported:(BOOL)a3
{
  self->_unsupported = a3;
}

- (NSString)treeRollInfoURL
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setTreeRollInfoURL:(id)a3
{
}

- (BOOL)mapStillPopulating
{
  return self->_mapStillPopulating;
}

- (void)setMapStillPopulating:(BOOL)a3
{
  self->_mapStillPopulating = a3;
}

- (SignedMapHead)verifiedSignedMapHead
{
  return (SignedMapHead *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setVerifiedSignedMapHead:(id)a3
{
}

- (NSData)patConfigProof
{
  return (NSData *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setPatConfigProof:(id)a3
{
}

- (NSData)tltConfigProof
{
  return (NSData *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setTltConfigProof:(id)a3
{
}

- (NSData)patClosedProof
{
  return (NSData *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setPatClosedProof:(id)a3
{
}

- (int)vrfType
{
  return self->_vrfType;
}

- (void)setVrfType:(int)a3
{
  self->_vrfType = a3;
}

- (NSArray)trustedAppLeafs
{
  return (NSArray *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setTrustedAppLeafs:(id)a3
{
}

- (NSDictionary)trustedTltSigningKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setTrustedTltSigningKeys:(id)a3
{
}

- (NSArray)trustedTltLeafs
{
  return (NSArray *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setTrustedTltLeafs:(id)a3
{
}

- (NSArray)trustedIntermediates
{
  return (NSArray *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setTrustedIntermediates:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (BOOL)allowOldKeys
{
  return self->_allowOldKeys;
}

- (void)setAllowOldKeys:(BOOL)a3
{
  self->_allowOldKeys = a3;
}

- (NSMutableArray)__verifiedLogHeads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)set__verifiedLogHeads:(id)a3
{
}

- (void).cxx_destruct
{
}

@end