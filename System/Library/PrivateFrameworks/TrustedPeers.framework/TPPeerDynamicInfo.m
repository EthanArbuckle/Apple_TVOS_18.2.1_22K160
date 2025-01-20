@interface TPPeerDynamicInfo
+ (id)dynamicInfoPBWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7;
+ (id)dynamicInfoWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7 signingKeyPair:(id)a8 error:(id *)a9;
+ (id)dynamicInfoWithData:(id)a3 sig:(id)a4;
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerDynamicInfo:(id)a3;
- (NSData)data;
- (NSData)sig;
- (NSDictionary)dispositions;
- (NSSet)excludedPeerIDs;
- (NSSet)includedPeerIDs;
- (NSSet)preapprovals;
- (TPPeerDynamicInfo)initWithObj:(id)a3 tsd:(id)a4;
- (TPTypedSignedData)tsd;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pb;
- (unint64_t)clock;
- (void)setTsd:(id)a3;
@end

@implementation TPPeerDynamicInfo

- (TPPeerDynamicInfo)initWithObj:(id)a3 tsd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[TPStringTable defaultTable](&OBJC_CLASS___TPStringTable, "defaultTable");
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TPPeerDynamicInfo;
  v9 = -[TPPeerDynamicInfo init](&v20, sel_init);
  if (v9)
  {
    v9->_clock = [v6 clock];
    [v6 includeds];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v8 setWithArray:v10];
    includedPeerIDs = v9->_includedPeerIDs;
    v9->_includedPeerIDs = (NSSet *)v11;

    [v6 excludeds];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v8 setWithArray:v13];
    excludedPeerIDs = v9->_excludedPeerIDs;
    v9->_excludedPeerIDs = (NSSet *)v14;

    [v6 preapprovals];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v8 setWithArray:v16];
    preapprovals = v9->_preapprovals;
    v9->_preapprovals = (NSSet *)v17;

    objc_storeStrong((id *)&v9->_tsd, a4);
  }

  return v9;
}

- (id)pb
{
  v3 = objc_alloc(&OBJC_CLASS___TPPBPeerDynamicInfo);
  v4 = -[TPPeerDynamicInfo data](self, "data");
  v5 = -[PBCodable initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (NSDictionary)dispositions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  v5 = (void *)MEMORY[0x1895C3FC8]();
  -[TPPeerDynamicInfo pb](self, "pb");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 dispositions];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __33__TPPeerDynamicInfo_dispositions__block_invoke;
  v11[3] = &unk_18A22BA48;
  id v8 = v4;
  id v12 = v8;
  id v9 = v3;
  id v13 = v9;
  [v7 enumerateObjectsUsingBlock:v11];

  objc_autoreleasePoolPop(v5);
  return (NSDictionary *)v8;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  v5 = -[TPPeerDynamicInfo tsd](self, "tsd");
  char v6 = [v5 checkSignatureWithKey:v4];

  return v6;
}

- (NSData)data
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 data];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)sig
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 sig];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)isEqualToPeerDynamicInfo:(id)a3
{
  id v4 = (TPPeerDynamicInfo *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }

  else
  {
    v5 = -[TPPeerDynamicInfo data](self, "data");
    -[TPPeerDynamicInfo data](v4, "data");
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqualToData:v6])
    {
      -[TPPeerDynamicInfo sig](self, "sig");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPPeerDynamicInfo sig](v4, "sig");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v7 isEqualToData:v8];
    }

    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  -[TPPeerDynamicInfo pb](self, "pb");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dictionaryRepresentation];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  -[TPPeerDynamicInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 description];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPPeerDynamicInfo *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPPeerDynamicInfo isEqualToPeerDynamicInfo:](self, "isEqualToPeerDynamicInfo:", v4);
  }

  return v5;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (NSSet)includedPeerIDs
{
  return self->_includedPeerIDs;
}

- (NSSet)excludedPeerIDs
{
  return self->_excludedPeerIDs;
}

- (NSSet)preapprovals
{
  return self->_preapprovals;
}

- (TPTypedSignedData)tsd
{
  return self->_tsd;
}

- (void)setTsd:(id)a3
{
}

- (void).cxx_destruct
{
}

void __33__TPPeerDynamicInfo_dispositions__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 peerID];
  if (v3)
  {
    id v4 = (void *)v3;
    [v11 disposition];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v11 disposition];
      char v6 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = *(void **)(a1 + 32);
      id v7 = *(void **)(a1 + 40);
      [v11 peerID];
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 stringWithString:v9];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v6 forKeyedSubscript:v10];
    }
  }
}

+ (id)dynamicInfoPBWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = objc_alloc_init(&OBJC_CLASS___TPPBPeerDynamicInfo);
  -[TPPBPeerDynamicInfo setClock:](v15, "setClock:", a3);
  [v14 allObjects];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = (void *)[v16 mutableCopy];
  -[TPPBPeerDynamicInfo setIncludeds:](v15, "setIncludeds:", v17);

  [v13 allObjects];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)[v18 mutableCopy];
  -[TPPBPeerDynamicInfo setExcludeds:](v15, "setExcludeds:", v19);

  [v11 allObjects];
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)[v20 mutableCopy];
  -[TPPBPeerDynamicInfo setPreapprovals:](v15, "setPreapprovals:", v21);

  id v22 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[TPPBPeerDynamicInfo setDispositions:](v15, "setDispositions:", v22);

  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __102__TPPeerDynamicInfo_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals___block_invoke;
  v25[3] = &unk_18A22BA20;
  v23 = v15;
  v26 = v23;
  [v12 enumerateKeysAndObjectsUsingBlock:v25];

  return v23;
}

+ (id)dynamicInfoWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7 signingKeyPair:(id)a8 error:(id *)a9
{
  v15 = (TPPeerDynamicInfo *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_super v20 = (void *)MEMORY[0x1895C3FC8]();
  v26 = v15;
  [a1 dynamicInfoPBWithClock:a3 includedPeerIDs:v15 excludedPeerIDs:v16 dispositions:v17 preapprovals:v18];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 data];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = 0LL;
  v23 = -[TPTypedSignedData initWithData:key:signatureTypeName:error:]( objc_alloc(&OBJC_CLASS___TPTypedSignedData),  "initWithData:key:signatureTypeName:error:",  v22,  v19,  @"TPPB.PeerDynamicInfo",  &v27);
  id v24 = v27;
  if (v23) {
    v15 = -[TPPeerDynamicInfo initWithObj:tsd:]( objc_alloc(&OBJC_CLASS___TPPeerDynamicInfo),  "initWithObj:tsd:",  v21,  v23);
  }

  objc_autoreleasePoolPop(v20);
  if (!v23)
  {
    v15 = 0LL;
    if (a9)
    {
      if (v24)
      {
        v15 = 0LL;
        *a9 = v24;
      }
    }
  }

  return v15;
}

+ (id)dynamicInfoWithData:(id)a3 sig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1895C3FC8]();
  id v8 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___TPPBPeerDynamicInfo), "initWithData:", v5);
  if (v8)
  {
    char v9 = objc_alloc(&OBJC_CLASS___TPPeerDynamicInfo);
    v10 = -[TPTypedSignedData initWithData:sig:signatureTypeName:]( objc_alloc(&OBJC_CLASS___TPTypedSignedData),  "initWithData:sig:signatureTypeName:",  v5,  v6,  @"TPPB.PeerDynamicInfo");
    id v11 = -[TPPeerDynamicInfo initWithObj:tsd:](v9, "initWithObj:tsd:", v8, v10);
  }

  else
  {
    id v11 = 0LL;
  }

  objc_autoreleasePoolPop(v7);
  return v11;
}

void __102__TPPeerDynamicInfo_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init(&OBJC_CLASS___TPPBDispositionEntry);
  -[TPPBDispositionEntry setPeerID:](v8, "setPeerID:", v6);

  -[TPPBDispositionEntry setDisposition:](v8, "setDisposition:", v5);
  [*(id *)(a1 + 32) dispositions];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addObject:v8];
}

@end