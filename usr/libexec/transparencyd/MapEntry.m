@interface MapEntry
+ (id)descriptor;
- (NSDictionary)metadata;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapEntryVerifier)verifier;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setVerifier:(id)a3;
@end

@implementation MapEntry

+ (id)descriptor
{
  id v2 = (id)qword_1002EE970;
  if (!qword_1002EE970)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___MapEntry,  @"MapEntry",  &unk_1002E4B60,  &off_1002E4F38,  3LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C466];
    qword_1002EE970 = (uint64_t)v2;
  }

  return v2;
}

- (TransparencyMapEntryVerifier)verifier
{
  return (TransparencyMapEntryVerifier *)objc_getAssociatedObject(self, @"verifierKey");
}

- (void)setVerifier:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStoreKey");
}

- (void)setDataStore:(id)a3
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[MapEntry setMetadata:](self, "setMetadata:", v8);
  }
}

- (unint64_t)verifyWithError:(id *)a3
{
  if (!-[MapEntry hasSmh](self, "hasSmh")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry smh](self, "smh")), v5, !v5))
  {
    uint64_t v26 = -15LL;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MapEntry mapLeaf](self, "mapLeaf"));
  if (!v6
    || (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry mapLeaf](self, "mapLeaf")),
        id v9 = [v8 length],
        v8,
        v7,
        !v9))
  {
    uint64_t v26 = -16LL;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  v26,  @"map entry data required for verification"));
    goto LABEL_12;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = -[MapEntry hashesOfPeersInPathToRootArray_Count](self, "hashesOfPeersInPathToRootArray_Count");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry smh](self, "smh"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry verifier](self, "verifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 trustedKeyStore]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 signatureVerifier]);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry dataStore](self, "dataStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[SignedMapHead signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedMapHead,  "signedTypeWithObject:verifier:dataStore:",  v13,  v16,  v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry metadata](self, "metadata"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"overrideLogBeginTime"]);
      objc_msgSend(v18, "setOverrideBeginTime:", objc_msgSend(v20, "longLongValue"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry verifier](self, "verifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry mapLeaf](self, "mapLeaf"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray"));
      id v24 = [v21 verifyMapEntryWithMapLeaf:v22 hashesToRoot:v23 signedMapHead:v18 error:a3];

      return (unint64_t)v24;
    }
  }

  uint64_t v26 = -17LL;
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:
  if (qword_1002EEE80 != -1) {
    dispatch_once(&qword_1002EEE80, &stru_100289770);
  }
  v27 = (os_log_s *)qword_1002EEE88;
  if (os_log_type_enabled((os_log_t)qword_1002EEE88, OS_LOG_TYPE_ERROR))
  {
    int v28 = 134217984;
    uint64_t v29 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "map entry data required for verification: %ld",  (uint8_t *)&v28,  0xCu);
  }

  return 0LL;
}

@end