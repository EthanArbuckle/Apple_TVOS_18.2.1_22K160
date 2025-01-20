@interface InclusionProof
+ (id)descriptor;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapInclusionProofVerifier)verifier;
- (id)mapLeafWithError:(id *)a3;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation InclusionProof

+ (id)descriptor
{
  id v2 = (id)qword_1002EE978;
  if (!qword_1002EE978)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___InclusionProof,  @"InclusionProof",  &unk_1002E4B60,  &off_1002E4F98,  4LL,  40LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C487];
    qword_1002EE978 = (uint64_t)v2;
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

- (TransparencyMapInclusionProofVerifier)verifier
{
  return (TransparencyMapInclusionProofVerifier *)objc_getAssociatedObject(self, @"verifier");
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

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getAssociatedObject(self, @"optInServerKey");
}

- (void)setOptInServer:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"optInServerKey", a3, (void *)1);
  }
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getAssociatedObject(self, @"followUpKey");
}

- (void)setFollowUp:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"followUpKey", a3, (void *)1);
  }
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[InclusionProof setMetadata:](self, "setMetadata:", v8);
  }
}

- (id)mapLeafWithError:(id *)a3
{
  if (-[InclusionProof hasMapEntry](self, "hasMapEntry")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mapLeaf]),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mapLeaf]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IdsMapLeaf parseFromData:error:](&OBJC_CLASS___IdsMapLeaf, "parseFromData:error:", v8, a3));

    if (!v9)
    {
      if (a3) {
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -142LL,  *a3));
      }
      if (qword_1002EEB68 != -1) {
        dispatch_once(&qword_1002EEB68, &stru_100285F10);
      }
      v10 = (os_log_s *)qword_1002EEB70;
      if (os_log_type_enabled((os_log_t)qword_1002EEB70, OS_LOG_TYPE_ERROR))
      {
        if (a3) {
          id v11 = *a3;
        }
        else {
          id v11 = 0LL;
        }
        *(_DWORD *)buf = 138412290;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to decode map leaf: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -16LL,  @"KT Inclusion proof missing map leaf"));
    }
    if (qword_1002EEB68 != -1) {
      dispatch_once(&qword_1002EEB68, &stru_100285EF0);
    }
    v12 = (os_log_s *)qword_1002EEB70;
    if (os_log_type_enabled((os_log_t)qword_1002EEB70, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "KT Inclusion proof missing map leaf", buf, 2u);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (-[InclusionProof hasMapEntry](self, "hasMapEntry")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry")),
        v5,
        v5))
  {
    if (-[InclusionProof hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry")
      && !-[InclusionProof hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
    {
      uint64_t v49 = -11LL;
    }

    else
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[InclusionProof index](self, "index"));
      if (v6)
      {
        v7 = (void *)v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof index](self, "index"));
        id v9 = [v8 length];

        if (v9)
        {
          uint64_t v10 = objc_claimAutoreleasedReturnValue(-[InclusionProof index](self, "index"));
          id v11 = objc_alloc(&OBJC_CLASS___TransparencyMapEntryVerifier);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyBag]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appSthKeyStore]);
          v56 = (void *)v10;
          id v15 = -[TransparencyMapEntryVerifier initWithPositon:trustedKeyStore:]( v11,  "initWithPositon:trustedKeyStore:",  v10,  v14);

          v16 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 keyBag]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 appSthKeyStore]);
          v20 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v16, "initWithTrustedKeyStore:", v19);

          v21 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 keyBag]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 tltKeyStore]);
          v57 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v21, "initWithTrustedKeyStore:", v24);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof dataStore](self, "dataStore"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          v55 = v15;
          [v26 setVerifier:v15];

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          [v27 setDataStore:v25];

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
          uint64_t v30 = kTransparencyResponseMetadataKeyServerHint;
          v31 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);
          [v28 setMetadataValue:v31 key:v30];

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 keyBag]);
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v34 patLogBeginningMs]));
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 stringValue]);
          [v32 setMetadataValue:v36 key:@"overrideLogBeginTime"];

          if (-[InclusionProof hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry")
            && (v37 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry")),
                v37,
                v37))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof perApplicationTreeEntry](self, "perApplicationTreeEntry"));
            [v38 setVerifier:v20];
            [v38 setDataStore:v25];
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v30]);
            [v38 setMetadataValue:v40 key:v30];

            v41 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof optInServer](self, "optInServer"));
            [v38 setOptInServer:v41];

            v42 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof followUp](self, "followUp"));
            [v38 setFollowUp:v42];

            if (-[InclusionProof hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry"))
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));

              if (v43)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof topLevelTreeEntry](self, "topLevelTreeEntry"));
                [v44 setVerifier:v57];
                [v44 setDataStore:v25];
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof metadata](self, "metadata"));
                v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v30]);
                [v44 setMetadataValue:v46 key:v30];

                v47 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof optInServer](self, "optInServer"));
                [v44 setOptInServer:v47];

                v48 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof followUp](self, "followUp"));
                [v44 setFollowUp:v48];

LABEL_24:
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof verifier](self, "verifier"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(-[InclusionProof mapEntry](self, "mapEntry"));
                id v54 = [v52 verifyInclusionProofWithMapEntry:v53 perAppLogEntry:v38 topLevelTreeEntry:v44 error:a3];

                return (unint64_t)v54;
              }
            }
          }

          else
          {
            v38 = 0LL;
          }

          v44 = 0LL;
          goto LABEL_24;
        }
      }

      uint64_t v49 = -48LL;
    }
  }

  else
  {
    uint64_t v49 = -10LL;
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  v49,  @"KT Inclusion proof data required for verification"));
  }
  if (qword_1002EEB68 != -1) {
    dispatch_once(&qword_1002EEB68, &stru_100285F30);
  }
  v50 = (os_log_s *)qword_1002EEB70;
  if (os_log_type_enabled((os_log_t)qword_1002EEB70, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "KT Inclusion proof data required for verification",  buf,  2u);
  }

  return 0LL;
}

@end