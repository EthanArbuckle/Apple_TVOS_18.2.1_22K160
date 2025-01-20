@interface BatchQueryResponse
+ (id)descriptor;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (SignedMapHead)verifiableSmh;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapInclusionProofVerifier)verifier;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setVerifiableSmh:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation BatchQueryResponse

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

- (SignedMapHead)verifiableSmh
{
  return (SignedMapHead *)objc_getAssociatedObject(self, @"smh");
}

- (void)setVerifiableSmh:(id)a3
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

- (id)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[BatchQueryResponse status](self, "status")));
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse queryInfoArray](self, "queryInfoArray", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) diagnosticsJsonDictionary]);
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  if ([v5 count]) {
    [v3 setObject:v5 forKeyedSubscript:@"queryInfos"];
  }
  if (-[BatchQueryResponse hasSmh](self, "hasSmh"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse smh](self, "smh"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:](&OBJC_CLASS___SignedMapHead, "signedTypeWithObject:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 diagnosticsJsonDictionary]);
    [v3 setObject:v14 forKeyedSubscript:@"smh"];
  }

  if (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 diagnosticsJsonDictionary]);
    [v3 setObject:v16 forKeyedSubscript:@"patEntry"];
  }

  if (-[BatchQueryResponse hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse topLevelTreeEntry](self, "topLevelTreeEntry"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 diagnosticsJsonDictionary]);
    [v3 setObject:v18 forKeyedSubscript:@"tltEntry"];
  }

  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (!-[BatchQueryResponse hasSmh](self, "hasSmh")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse smh](self, "smh")), v5, !v5))
  {
    uint64_t v23 = -12LL;
    if (!a3) {
      goto LABEL_9;
    }
LABEL_8:
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  v23,  @"KT Inclusion proof data required for verification"));
    goto LABEL_9;
  }

  if (!-[BatchQueryResponse hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry")
    || (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry") & 1) != 0)
  {
    v6 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyBag]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 appSthKeyStore]);
    v10 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v6, "initWithTrustedKeyStore:", v9);

    v11 = objc_alloc(&OBJC_CLASS___TransparencyLogEntryVerifier);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyBag]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 tltKeyStore]);
    v15 = -[TransparencyLogEntryVerifier initWithTrustedKeyStore:](v11, "initWithTrustedKeyStore:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse dataStore](self, "dataStore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse smh](self, "smh"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogEntryVerifier trustedKeyStore](v10, "trustedKeyStore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 signatureVerifier]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse dataStore](self, "dataStore"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMapHead signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedMapHead,  "signedTypeWithObject:verifier:dataStore:",  v17,  v19,  v20));

    if (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
    {
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));
      [v21 setOverrideBeginTimeFromLogEntry:v22];
    }

    else
    {
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v22 keyBag]);
      objc_msgSend(v21, "setOverrideBeginTime:", objc_msgSend(v26, "patLogBeginningMs"));
    }

    -[BatchQueryResponse setVerifiableSmh:](self, "setVerifiableSmh:", v21);
    id v41 = 0LL;
    id v25 = [v21 verifyWithError:&v41];
    id v27 = v41;
    +[TransparencyMapEntryVerifier storeSMHSignatureResult:smh:error:]( &OBJC_CLASS___TransparencyMapEntryVerifier,  "storeSMHSignatureResult:smh:error:",  v25,  v21,  v27);
    if (v25 != (id)1)
    {
      if (a3 && v27) {
        *a3 = v27;
      }
      goto LABEL_31;
    }

    if (-[BatchQueryResponse hasPerApplicationTreeEntry](self, "hasPerApplicationTreeEntry"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));

      if (v28)
      {
        v40 = v15;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse perApplicationTreeEntry](self, "perApplicationTreeEntry"));
        [v28 setVerifier:v10];
        [v28 setDataStore:v16];
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse metadata](self, "metadata"));
        uint64_t v30 = kTransparencyResponseMetadataKeyServerHint;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint]);
        [v28 setMetadataValue:v31 key:v30];

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse optInServer](self, "optInServer"));
        [v28 setOptInServer:v32];

        if (-[BatchQueryResponse hasTopLevelTreeEntry](self, "hasTopLevelTreeEntry")
          && (v33 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse topLevelTreeEntry](self, "topLevelTreeEntry")),
              v33,
              v33))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse topLevelTreeEntry](self, "topLevelTreeEntry"));
          [v34 setVerifier:v40];
          [v34 setDataStore:v16];
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse metadata](self, "metadata"));
          v35 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v30]);
          [v34 setMetadataValue:v35 key:v30];

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse optInServer](self, "optInServer"));
          [v34 setOptInServer:v36];
        }

        else
        {
          v34 = 0LL;
        }

        v15 = v40;
        goto LABEL_30;
      }
    }

    else
    {
      v28 = 0LL;
    }

    v34 = 0LL;
LABEL_30:
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse verifier](self, "verifier"));
    id v25 = [v37 verifyPerApplicationTreeEntry:v28 mapHead:v21 topLevelTreeEntry:v34 error:a3];

LABEL_31:
    return (unint64_t)v25;
  }

  uint64_t v23 = -11LL;
  if (a3) {
    goto LABEL_8;
  }
LABEL_9:
  if (qword_1002EE9C8 != -1) {
    dispatch_once(&qword_1002EE9C8, &stru_100283E08);
  }
  v24 = (os_log_s *)qword_1002EE9D0;
  if (os_log_type_enabled((os_log_t)qword_1002EE9D0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "KT Inclusion proof data required for verification",  buf,  2u);
  }

  return 0LL;
}

+ (id)descriptor
{
  id v2 = (id)qword_1002EEA60;
  if (!qword_1002EEA60)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchQueryResponse,  @"BatchQueryResponse",  &unk_1002E54D0,  &off_1002E55C8,  5LL,  40LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C4E3];
    qword_1002EEA60 = (uint64_t)v2;
  }

  return v2;
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
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchQueryResponse metadata](self, "metadata"));
    id v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[BatchQueryResponse setMetadata:](self, "setMetadata:", v8);
  }
}

@end