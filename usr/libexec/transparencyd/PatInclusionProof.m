@interface PatInclusionProof
+ (id)descriptor;
- (NSDictionary)metadata;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyPatInclusionProofVerifier)verifier;
- (id)patSigningKeyWithError:(id *)a3;
- (id)vrfPublicKeyWithError:(id *)a3;
- (int)earliestCurrentTreeVersionWithError:(id *)a3;
- (int)earliestNextTreeVersionWithError:(id *)a3;
- (unint64_t)patLogBeginningMs;
- (unint64_t)shutdownTimeStamp:(id *)a3;
- (unint64_t)tltLogBeginningMs;
- (unint64_t)verifyConfigProof:(id *)a3;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setVerifier:(id)a3;
@end

@implementation PatInclusionProof

+ (id)descriptor
{
  id v2 = (id)qword_1002EE980;
  if (!qword_1002EE980)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___PatInclusionProof,  @"PatInclusionProof",  &unk_1002E4B60,  &off_1002E5018,  2LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C4A8];
    qword_1002EE980 = (uint64_t)v2;
  }

  return v2;
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStore");
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyPatInclusionProofVerifier)verifier
{
  return (TransparencyPatInclusionProofVerifier *)objc_getAssociatedObject(self, @"verifier");
}

- (void)setVerifier:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[PatInclusionProof setMetadata:](self, "setMetadata:", v8);
  }
}

- (id)patSigningKeyWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 nodeBytes]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nodeBytes]);
    id v10 = [v9 length];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodeBytes]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PerApplicationTreeConfigNode,  "parseFromData:error:",  v12,  a3));

      if (v13)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 publicKeyBytes]);
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v13 publicKeyBytes]);
          id v17 = [v16 length];

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v13 publicKeyBytes]);
LABEL_32:

            return v18;
          }
        }

        if (a3) {
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -216LL,  @"Signing Public key missing from per-app tree config node"));
        }
        if (qword_1002EEBB8 != -1) {
          dispatch_once(&qword_1002EEBB8, &stru_100286110);
        }
        uint64_t v21 = qword_1002EEBC0;
        if (!os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          v18 = 0LL;
          goto LABEL_32;
        }

        *(_WORD *)buf = 0;
        v22 = "Signing Public key missing from per-app tree config node";
        v23 = (os_log_s *)v21;
        uint32_t v24 = 2;
      }

      else
      {
        if (a3) {
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -165LL,  *a3));
        }
        if (qword_1002EEBB8 != -1) {
          dispatch_once(&qword_1002EEBB8, &stru_1002860F0);
        }
        uint64_t v25 = qword_1002EEBC0;
        if (!os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        if (a3) {
          id v26 = *a3;
        }
        else {
          id v26 = 0LL;
        }
        *(_DWORD *)buf = 138412290;
        id v28 = v26;
        v22 = "failed to decode Per Application Tree config node: %@";
        v23 = (os_log_s *)v25;
        uint32_t v24 = 12;
      }

      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      goto LABEL_31;
    }
  }

  else
  {
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -164LL,  @"KT PAT Config proof missing signing key"));
  }
  if (qword_1002EEBB8 != -1) {
    dispatch_once(&qword_1002EEBB8, &stru_1002860D0);
  }
  v19 = (os_log_s *)qword_1002EEBC0;
  if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "KT PAT Config proof missing signing key",  buf,  2u);
  }

  return 0LL;
}

- (id)vrfPublicKeyWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 nodeBytes]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nodeBytes]);
    id v10 = [v9 length];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodeBytes]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PerApplicationTreeConfigNode,  "parseFromData:error:",  v12,  a3));

      if (v13)
      {
        if ([v13 hasVrfPublicKey])
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 vrfPublicKey]);

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([v13 vrfPublicKey]);
LABEL_27:

            return v15;
          }
        }

        if (a3)
        {
          v15 = 0LL;
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -166LL,  @"VRF Public key missing from per-app tree config node"));
          goto LABEL_27;
        }
      }

      else
      {
        if (a3) {
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -165LL,  *a3));
        }
        if (qword_1002EEBB8 != -1) {
          dispatch_once(&qword_1002EEBB8, &stru_100286150);
        }
        v18 = (os_log_s *)qword_1002EEBC0;
        if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v19 = *a3;
          }
          else {
            id v19 = 0LL;
          }
          *(_DWORD *)buf = 138412290;
          id v21 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "failed to decode Per Application Tree config node: %@",  buf,  0xCu);
        }
      }

      v15 = 0LL;
      goto LABEL_27;
    }
  }

  else
  {
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -164LL,  @"KT PAT Config proof missing VRFPublicKey"));
  }
  if (qword_1002EEBB8 != -1) {
    dispatch_once(&qword_1002EEBB8, &stru_100286130);
  }
  v16 = (os_log_s *)qword_1002EEBC0;
  if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "KT PAT Config proof missing VRFPublicKey",  buf,  2u);
  }

  return 0LL;
}

- (int)earliestNextTreeVersionWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 nodeBytes]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nodeBytes]);
    id v10 = [v9 length];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodeBytes]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___LogClosedNode,  "parseFromData:error:",  v12,  a3));

      if (v13)
      {
        int Tree_RawValue = LogClosedNode_EarliestVersionForNextTree_RawValue((uint64_t)v13);
      }

      else
      {
        if (a3) {
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -233LL,  *a3));
        }
        if (qword_1002EEBB8 != -1) {
          dispatch_once(&qword_1002EEBB8, &stru_100286190);
        }
        v16 = (os_log_s *)qword_1002EEBC0;
        if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v17 = *a3;
          }
          else {
            id v17 = 0LL;
          }
          *(_DWORD *)buf = 138412290;
          id v20 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "failed to decode PAT closed node: %@",  buf,  0xCu);
        }

        int Tree_RawValue = 0;
      }

      return Tree_RawValue;
    }
  }

  else
  {
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -232LL,  @"KT PAT closed proof missing node bytes"));
  }
  if (qword_1002EEBB8 != -1) {
    dispatch_once(&qword_1002EEBB8, &stru_100286170);
  }
  v15 = (os_log_s *)qword_1002EEBC0;
  if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KT PAT closed proof missing node bytes", buf, 2u);
  }

  return 0;
}

- (unint64_t)shutdownTimeStamp:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 nodeBytes]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nodeBytes]);
    id v10 = [v9 length];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodeBytes]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___LogClosedNode,  "parseFromData:error:",  v12,  a3));

      if (v13)
      {
        id v14 = [v13 timestampMs];
      }

      else
      {
        if (a3) {
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -233LL,  *a3));
        }
        if (qword_1002EEBB8 != -1) {
          dispatch_once(&qword_1002EEBB8, &stru_1002861D0);
        }
        v16 = (os_log_s *)qword_1002EEBC0;
        if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v17 = *a3;
          }
          else {
            id v17 = 0LL;
          }
          *(_DWORD *)buf = 138412290;
          id v20 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "failed to decode PAT closed node: %@",  buf,  0xCu);
        }

        id v14 = 0LL;
      }

      return (unint64_t)v14;
    }
  }

  else
  {
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -232LL,  @"KT PAT closed proof missing node bytes"));
  }
  if (qword_1002EEBB8 != -1) {
    dispatch_once(&qword_1002EEBB8, &stru_1002861B0);
  }
  v15 = (os_log_s *)qword_1002EEBC0;
  if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KT PAT closed proof missing node bytes", buf, 2u);
  }

  return 0LL;
}

- (int)earliestCurrentTreeVersionWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 nodeBytes]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nodeBytes]);
    id v10 = [v9 length];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodeBytes]);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___PerApplicationTreeConfigNode,  "parseFromData:error:",  v12,  a3));

      if (v13)
      {
        unsigned int v14 = PerApplicationTreeConfigNode_EarliestVersion_RawValue((uint64_t)v13);
        if (v14 <= 1) {
          int v15 = 1;
        }
        else {
          int v15 = v14;
        }
      }

      else
      {
        if (a3) {
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -165LL,  *a3));
        }
        if (qword_1002EEBB8 != -1) {
          dispatch_once(&qword_1002EEBB8, &stru_100286210);
        }
        int v15 = 999999999;
        id v17 = (os_log_s *)qword_1002EEBC0;
        if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
        {
          if (a3) {
            id v18 = *a3;
          }
          else {
            id v18 = 0LL;
          }
          *(_DWORD *)buf = 138412290;
          id v21 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "failed to decode Per Application Tree config node: %@",  buf,  0xCu);
        }
      }

      return v15;
    }
  }

  else
  {
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -164LL,  @"KT PAT Config proof missing node bytes"));
  }
  if (qword_1002EEBB8 != -1) {
    dispatch_once(&qword_1002EEBB8, &stru_1002861F0);
  }
  int v15 = 999999999;
  v16 = (os_log_s *)qword_1002EEBC0;
  if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "KT PAT Config proof missing node bytes", buf, 2u);
  }

  return v15;
}

- (unint64_t)patLogBeginningMs
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 slh]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 parsedLogHead]);
  id v6 = [v5 logBeginningMs];

  return (unint64_t)v6;
}

- (unint64_t)tltLogBeginningMs
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 slh]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 parsedLogHead]);
  id v6 = [v5 logBeginningMs];

  return (unint64_t)v6;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (!-[PatInclusionProof hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry")),
        v5,
        !v5))
  {
    uint64_t v34 = -33LL;
    if (!a3) {
      goto LABEL_8;
    }
LABEL_7:
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  v34,  @"PAT inclusion proof missing required field"));
    goto LABEL_8;
  }

  if (-[PatInclusionProof hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));

    if (v6)
    {
      v7 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyBag]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appSthKeyStore]);
      v11 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v7, "initWithTrustedKeyStore:", v10);

      v12 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 keyBag]);
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tltKeyStore]);
      v16 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v12, "initWithTrustedKeyStore:", v15);

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof dataStore](self, "dataStore"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      [v18 setVerifier:v11];

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      [v19 setDataStore:v17];

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
      uint64_t v22 = kTransparencyResponseMetadataKeyServerHint;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);
      [v20 setMetadataValue:v23 key:v22];

      uint32_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      [v24 setVerifier:v16];

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      [v25 setDataStore:v17];

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v22]);
      [v26 setMetadataValue:v28 key:v22];

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
      id v32 = [v29 verifyPatInclusionProofWithPerAppLogEntry:v30 topLevelTreeEntry:v31 error:a3];

      return (unint64_t)v32;
    }
  }

  uint64_t v34 = -34LL;
  if (a3) {
    goto LABEL_7;
  }
LABEL_8:
  if (qword_1002EEBB8 != -1) {
    dispatch_once(&qword_1002EEBB8, &stru_100286230);
  }
  v35 = (os_log_s *)qword_1002EEBC0;
  if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v36 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "PAT inclusion proof missing required field",  v36,  2u);
  }

  return 0LL;
}

- (unint64_t)verifyConfigProof:(id *)a3
{
  unint64_t result = -[PatInclusionProof verifyWithError:](self, "verifyWithError:");
  if (result == 1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    id v7 = [v6 nodePosition];

    if (v7)
    {
      if (a3)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
        *a3 = objc_autorelease((id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -163LL,  @"per-app tree (config) inclusion proof not position 0; instead position %llu",
                                       [v8 nodePosition])));

        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        if (+[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics"))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
          uint64_t v11 = kTransparencyResponseMetadataKeyServerHint;
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof metadata](self, "metadata"));
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);
            [v9 setObject:v14 forKeyedSubscript:v11];
          }
        }

        int v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof verifier](self, "verifier"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 application]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifyPATInclusionProofEvent",  v17));
        [v15 logResultForEvent:v18 hardFailure:1 result:*a3 withAttributes:v9];
      }

      if (qword_1002EEBB8 != -1) {
        dispatch_once(&qword_1002EEBB8, &stru_100286250);
      }
      id v19 = (void *)qword_1002EEBC0;
      if (os_log_type_enabled((os_log_t)qword_1002EEBC0, OS_LOG_TYPE_ERROR))
      {
        id v20 = v19;
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[PatInclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
        *(_DWORD *)buf = 134217984;
        id v23 = [v21 nodePosition];
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "per-app tree (config) inclusion proof not position 0; instead position %llu",
          buf,
          0xCu);
      }

      return 0LL;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

@end