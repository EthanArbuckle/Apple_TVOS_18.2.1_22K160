@interface BatchedMapEntry
+ (id)descriptor;
- (NSDictionary)metadata;
- (SignedMapHead)smh;
- (TransparencyManagedDataStore)dataStore;
- (TransparencyMapEntryVerifier)verifier;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setDataStore:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setSmh:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation BatchedMapEntry

+ (id)descriptor
{
  id v2 = (id)qword_1002EEA70;
  if (!qword_1002EEA70)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___BatchedMapEntry,  @"BatchedMapEntry",  &unk_1002E54D0,  &off_1002E56E8,  3LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C50D];
    qword_1002EEA70 = (uint64_t)v2;
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

- (SignedMapHead)smh
{
  return (SignedMapHead *)objc_getAssociatedObject(self, @"smh");
}

- (void)setSmh:(id)a3
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[BatchedMapEntry setMetadata:](self, "setMetadata:", v8);
  }
}

- (id)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry index](self, "index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  [v3 setObject:v5 forKeyedSubscript:@"index"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry mapLeaf](self, "mapLeaf"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
  [v3 setObject:v7 forKeyedSubscript:@"mapLeaf"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry hashesOfPeersInPathToRootArray](self, "hashesOfPeersInPathToRootArray", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "kt_hexString"));
        [v8 addObject:v14];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  [v3 setObject:v8 forKeyedSubscript:@"hashesOfPeersInPathToRoot"];
  return v3;
}

- (unint64_t)verifyWithError:(id *)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[BatchedMapEntry mapLeaf](self, "mapLeaf"));
  if (!v5
    || (id v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatchedMapEntry mapLeaf](self, "mapLeaf")),
        id v8 = [v7 length],
        v7,
        v6,
        !v8))
  {
    uint64_t v22 = -16LL;
    if (!a3)
    {
LABEL_9:
      if (qword_1002EEB78 != -1) {
        dispatch_once(&qword_1002EEB78, &stru_100285F50);
      }
      uint64_t v23 = qword_1002EEB80;
      if (!os_log_type_enabled((os_log_t)qword_1002EEB80, OS_LOG_TYPE_ERROR)) {
        return 0LL;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v22;
      v24 = "map entry data required for verification: %ld";
      v25 = (os_log_s *)v23;
      uint32_t v26 = 12;
      goto LABEL_13;
    }

@end