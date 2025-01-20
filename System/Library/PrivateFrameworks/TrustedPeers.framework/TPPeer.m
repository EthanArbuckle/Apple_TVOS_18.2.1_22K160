@interface TPPeer
+ (BOOL)verifyHMACWithPermanentInfoData:(id)a3 permanentInfoSig:(id)a4 stableInfoData:(id)a5 stableInfoSig:(id)a6 dynamicInfoData:(id)a7 dynamicInfoSig:(id)a8 hmacKey:(id)a9 hmacSig:(id)a10;
+ (id)calculateHmacWithHmacKey:(id)a3 permanentInfoData:(id)a4 permanentInfoSig:(id)a5 stableInfoData:(id)a6 stableInfoSig:(id)a7 dynamicInfoData:(id)a8 dynamicInfoSig:(id)a9;
- (NSSet)trustedPeerIDs;
- (NSString)peerID;
- (TPPeer)initWithPermanentInfo:(id)a3;
- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5;
- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 checkSig:(BOOL)a6 error:(id *)a7;
- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 error:(id *)a6;
- (TPPeer)peerWithUpdatedDynamicInfo:(id)a3 error:(id *)a4;
- (TPPeer)peerWithUpdatedStableInfo:(id)a3 error:(id *)a4;
- (TPPeerDynamicInfo)dynamicInfo;
- (TPPeerPermanentInfo)permanentInfo;
- (TPPeerStableInfo)stableInfo;
- (id)calculateHmacWithHmacKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TPPeer

- (NSString)peerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 peerID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TPPeer)initWithPermanentInfo:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TPPeer;
  v6 = -[TPPeer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_permanentInfo, a3);
    stableInfo = v7->_stableInfo;
    v7->_stableInfo = 0LL;

    dynamicInfo = v7->_dynamicInfo;
    v7->_dynamicInfo = 0LL;
  }

  return v7;
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TPPeer;
  v12 = -[TPPeer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_permanentInfo, a3);
    objc_storeStrong((id *)&v13->_stableInfo, a4);
    objc_storeStrong((id *)&v13->_dynamicInfo, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___TPPeer);
  -[TPPeer permanentInfo](self, "permanentInfo");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TPPeer stableInfo](self, "stableInfo");
  v7 = -[TPPeer dynamicInfo](self, "dynamicInfo");
  v8 = -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:]( v4,  "initWithPermanentInfo:stableInfo:dynamicInfo:",  v5,  v6,  v7);

  return v8;
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 error:(id *)a6
{
  return -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:checkSig:error:]( self,  "initWithPermanentInfo:stableInfo:dynamicInfo:checkSig:error:",  a3,  a4,  a5,  1LL,  a6);
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 checkSig:(BOOL)a6 error:(id *)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  objc_super v15 = v14;
  if (!(_DWORD)v8) {
    goto LABEL_10;
  }
  if (v13)
  {
    uint64_t v8 = [v12 signingPubKey];
    if (([v13 checkSignatureWithKey:v8] & 1) == 0)
    {

      goto LABEL_13;
    }

    if (!v15)
    {

LABEL_10:
      self =  -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:]( self,  "initWithPermanentInfo:stableInfo:dynamicInfo:",  v12,  v13,  v15);
      v18 = self;
      goto LABEL_11;
    }
  }

  else if (!v14)
  {
    goto LABEL_10;
  }

  [v12 signingPubKey];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = [v15 checkSignatureWithKey:v16];

  if (v13) {
  if ((v17 & 1) != 0)
  }
    goto LABEL_10;
LABEL_13:
  if (a7)
  {
    [MEMORY[0x189607870] errorWithDomain:TPResultErrorDomain code:1 userInfo:0];
    v18 = 0LL;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v18 = 0LL;
  }

- (id)calculateHmacWithHmacKey:(id)a3
{
  id v4 = a3;
  v18 = -[TPPeer permanentInfo](self, "permanentInfo");
  [v18 data];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer permanentInfo](self, "permanentInfo");
  char v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 sig];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TPPeer stableInfo](self, "stableInfo");
  [v16 data];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer stableInfo](self, "stableInfo");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 sig];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 data];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 sig];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPeer calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:]( &OBJC_CLASS___TPPeer,  "calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:",  v4,  v5,  v6,  v7,  v9,  v11,  v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (TPPeer)peerWithUpdatedStableInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[TPPeer stableInfo](self, "stableInfo");
  int v8 = [v7 isEqualToPeerStableInfo:v6];

  if (!v8)
  {
    -[TPPeer permanentInfo](self, "permanentInfo");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 signingPubKey];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v6 checkSignatureWithKey:v11];

    if ((v12 & 1) != 0)
    {
      uint64_t v13 = -[TPPeer stableInfo](self, "stableInfo");
      if (!v13
        || (id v14 = (void *)v13,
            unint64_t v15 = [v6 clock],
            -[TPPeer stableInfo](self, "stableInfo"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            unint64_t v17 = [v16 clock],
            v16,
            v14,
            v15 > v17))
      {
        v18 = objc_alloc(&OBJC_CLASS___TPPeer);
        v19 = -[TPPeer permanentInfo](self, "permanentInfo");
        v20 = -[TPPeer dynamicInfo](self, "dynamicInfo");
        id v9 = -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:]( v18,  "initWithPermanentInfo:stableInfo:dynamicInfo:",  v19,  v6,  v20);

        goto LABEL_13;
      }

      if (a4)
      {
        v21 = (void *)MEMORY[0x189607870];
        uint64_t v22 = TPResultErrorDomain;
        uint64_t v23 = 2LL;
        goto LABEL_11;
      }
    }

    else if (a4)
    {
      v21 = (void *)MEMORY[0x189607870];
      uint64_t v22 = TPResultErrorDomain;
      uint64_t v23 = 1LL;
LABEL_11:
      [v21 errorWithDomain:v22 code:v23 userInfo:0];
      id v9 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }

    id v9 = 0LL;
    goto LABEL_13;
  }

  id v9 = (TPPeer *)-[TPPeer copy](self, "copy");
LABEL_13:

  return v9;
}

- (TPPeer)peerWithUpdatedDynamicInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[TPPeer dynamicInfo](self, "dynamicInfo");
  int v8 = [v7 isEqualToPeerDynamicInfo:v6];

  if (!v8)
  {
    -[TPPeer permanentInfo](self, "permanentInfo");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 signingPubKey];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    char v12 = [v6 checkSignatureWithKey:v11];

    if ((v12 & 1) != 0)
    {
      uint64_t v13 = -[TPPeer dynamicInfo](self, "dynamicInfo");
      if (!v13
        || (id v14 = (void *)v13,
            unint64_t v15 = [v6 clock],
            -[TPPeer dynamicInfo](self, "dynamicInfo"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            unint64_t v17 = [v16 clock],
            v16,
            v14,
            v15 > v17))
      {
        v18 = objc_alloc(&OBJC_CLASS___TPPeer);
        v19 = -[TPPeer permanentInfo](self, "permanentInfo");
        v20 = -[TPPeer stableInfo](self, "stableInfo");
        id v9 = -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:]( v18,  "initWithPermanentInfo:stableInfo:dynamicInfo:",  v19,  v20,  v6);

        goto LABEL_13;
      }

      if (a4)
      {
        v21 = (void *)MEMORY[0x189607870];
        uint64_t v22 = TPResultErrorDomain;
        uint64_t v23 = 2LL;
        goto LABEL_11;
      }
    }

    else if (a4)
    {
      v21 = (void *)MEMORY[0x189607870];
      uint64_t v22 = TPResultErrorDomain;
      uint64_t v23 = 1LL;
LABEL_11:
      [v21 errorWithDomain:v22 code:v23 userInfo:0];
      id v9 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }

    id v9 = 0LL;
    goto LABEL_13;
  }

  id v9 = (TPPeer *)-[TPPeer copy](self, "copy");
LABEL_13:

  return v9;
}

- (NSSet)trustedPeerIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPPeer dynamicInfo](self, "dynamicInfo");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 includedPeerIDs];
  }

  else
  {
    id v5 = (void *)MEMORY[0x189604010];
    -[TPPeer peerID](self, "peerID");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setWithObject:v4];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (id)description
{
  v14[3] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v13[0] = @"permanentInfo";
  -[TPPeer permanentInfo](self, "permanentInfo");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dictionaryRepresentation];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = @"stableInfo";
  -[TPPeer stableInfo](self, "stableInfo");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 dictionaryRepresentation];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = @"dynamicInfo";
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 dictionaryRepresentation];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 description];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (TPPeerPermanentInfo)permanentInfo
{
  return self->_permanentInfo;
}

- (TPPeerStableInfo)stableInfo
{
  return self->_stableInfo;
}

- (TPPeerDynamicInfo)dynamicInfo
{
  return self->_dynamicInfo;
}

- (void).cxx_destruct
{
}

+ (id)calculateHmacWithHmacKey:(id)a3 permanentInfoData:(id)a4 permanentInfoSig:(id)a5 stableInfoData:(id)a6 stableInfoSig:(id)a7 dynamicInfoData:(id)a8 dynamicInfoSig:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = (objc_class *)MEMORY[0x189603FB8];
  id v20 = a5;
  id v21 = a4;
  id v22 = objc_alloc_init(v19);
  [@"TPPeer" dataUsingEncoding:4];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 appendData:v23];

  [v22 appendData:v21];
  [v22 appendData:v20];

  if (v15 && v16)
  {
    [v22 appendData:v15];
    [v22 appendData:v16];
  }

  if (v17 && v18)
  {
    [v22 appendData:v17];
    [v22 appendData:v18];
  }
  v24 = +[TPHashBuilder keyedHashWithAlgo:key:data:]( &OBJC_CLASS___TPHashBuilder,  "keyedHashWithAlgo:key:data:",  4LL,  v14,  v22);
  return v24;
}

+ (BOOL)verifyHMACWithPermanentInfoData:(id)a3 permanentInfoSig:(id)a4 stableInfoData:(id)a5 stableInfoSig:(id)a6 dynamicInfoData:(id)a7 dynamicInfoSig:(id)a8 hmacKey:(id)a9 hmacSig:(id)a10
{
  id v16 = a10;
  +[TPPeer calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:]( &OBJC_CLASS___TPPeer,  "calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:",  a9,  a3,  a4,  a5,  a6,  a7,  a8);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = [v17 isEqualToData:v16];

  return (char)a7;
}

@end