@interface TBNetworkMO
+ (BOOL)supportsSecureCoding;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateNewNetworkObjectFromMOC:(id)a3;
+ (void)removeAllNetworksInMOC:(id)a3;
+ (void)removeNetworksUsingPredicate:(id)a3 moc:(id)a4;
- (NSString)attributesDescription;
- (NSString)authDescription;
- (TBNetworkMO)initWithCoder:(id)a3;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TBNetworkMO

- (NSString)authDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[TBNetworkMO authMask](self, "authMask") & 1) != 0) {
    [v3 appendString:@"OPEN "];
  }
  if ((-[TBNetworkMO authMask](self, "authMask") & 2) != 0) {
    [v3 appendString:@"WEP "];
  }
  if ((-[TBNetworkMO authMask](self, "authMask") & 4) != 0) {
    [v3 appendString:@"WPA "];
  }
  if ((-[TBNetworkMO authMask](self, "authMask") & 8) != 0) {
    [v3 appendString:@"EAP "];
  }
  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0LL;
  }
  v5 = v4;

  return v5;
}

- (NSString)attributesDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TBNetworkMO isPublic](self, "isPublic")) {
    [v3 appendString:@"isPublic "];
  }
  if (-[TBNetworkMO isMoving](self, "isMoving")) {
    [v3 appendString:@"isMoving "];
  }
  if (-[TBNetworkMO isSuspicious](self, "isSuspicious")) {
    [v3 appendString:@"isSuspicious "];
  }
  if (-[TBNetworkMO isCaptive](self, "isCaptive")) {
    [v3 appendString:@"isCaptive "];
  }
  if (-[TBNetworkMO isLowQuality](self, "isLowQuality")) {
    [v3 appendString:@"isLowQuality "];
  }
  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0LL;
  }
  v5 = v4;

  return v5;
}

- (TBScore)qualityScore
{
  return (TBScore *)+[TBQualityScore qualityScoreWithValue:]( &OBJC_CLASS___TBQualityScore,  "qualityScoreWithValue:",  (int)-[TBNetworkMO qualityScoreValue](self, "qualityScoreValue"));
}

- (TBScore)popularityScore
{
  return (TBScore *)+[TBPopularityScore popularityScoreWithValue:]( &OBJC_CLASS___TBPopularityScore,  "popularityScoreWithValue:",  (int)-[TBNetworkMO popularityScoreValue](self, "popularityScoreValue"));
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TBNetworkMO moving](self, "moving"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"moving"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TBNetworkMO suspicious](self, "suspicious"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKey:@"suspicious"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TBNetworkMO captive](self, "captive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKey:@"captive"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TBNetworkMO public](self, "public"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKey:@"public"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TBNetworkMO lowQuality](self, "lowQuality"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKey:@"lowQuality"];
  v9 = -[TBNetworkMO name](self, "name");
  if (v9)
  {
    v10 = -[TBNetworkMO name](self, "name");
    [v3 setObject:v10 forKey:@"name"];
  }
  v11 = -[TBNetworkMO identifier](self, "identifier");
  if (v11)
  {
    v12 = -[TBNetworkMO identifier](self, "identifier");
    [v3 setObject:v12 forKey:@"identifier"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", -[TBNetworkMO authMask](self, "authMask"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v13 forKey:@"authMask"];

  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", -[TBNetworkMO tileKey](self, "tileKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v14 forKey:@"tileKey"];

  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", -[TBNetworkMO timestamp](self, "timestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v15 forKey:@"timestamp"];
  v16 = -[TBNetworkMO popularityScore](self, "popularityScore");
  if (v16)
  {
    v17 = (void *)MEMORY[0x189607968];
    v18 = -[TBNetworkMO popularityScore](self, "popularityScore");
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "score"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v19 forKey:@"popularityScoreValue"];
  }
  v20 = -[TBNetworkMO qualityScore](self, "qualityScore");
  if (v20)
  {
    v21 = (void *)MEMORY[0x189607968];
    v22 = -[TBNetworkMO qualityScore](self, "qualityScore");
    objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "score"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v23 forKey:@"qualityScoreValue"];
  }
  v24 = -[TBNetworkMO accessPoints](self, "accessPoints");
  if (v24)
  {
    [MEMORY[0x189603FA8] array];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    v26 = -[TBNetworkMO accessPoints](self, "accessPoints", 0LL);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        uint64_t v30 = 0LL;
        do
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v30) dictionaryRepresentation];
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 addObject:v31];

          ++v30;
        }

        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v28);
    }

    [v3 setObject:v25 forKey:@"accessPoints"];
  }
  v32 = -[TBNetworkMO ownerIdentifiers](self, "ownerIdentifiers");
  if (v32)
  {
    v33 = -[TBNetworkMO ownerIdentifiers](self, "ownerIdentifiers");
    [v3 setObject:v33 forKey:@"ownerIdentifiers"];
  }

  return v3;
}

- (TBNetworkMO)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TBNetworkMO;
  return -[NSManagedObject init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO moving](self, "moving"), @"moving");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO captive](self, "captive"), @"captive");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO suspicious](self, "suspicious"), @"suspicious");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO public](self, "public"), @"public");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO lowQuality](self, "lowQuality"), @"lowQuality");
  -[TBNetworkMO name](self, "name");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v4 forKey:@"name"];
  v5 = -[TBNetworkMO identifier](self, "identifier");
  [v8 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO authMask](self, "authMask"), @"authMask");
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO tileKey](self, "tileKey"), @"tileKey");
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO timestamp](self, "timestamp"), @"timestamp");
  objc_msgSend( v8,  "encodeInt32:forKey:",  -[TBNetworkMO popularityScoreValue](self, "popularityScoreValue"),  @"popularityScoreValue");
  objc_msgSend( v8,  "encodeInt32:forKey:",  -[TBNetworkMO qualityScoreValue](self, "qualityScoreValue"),  @"qualityScoreValue");
  v6 = -[TBNetworkMO accessPoints](self, "accessPoints");
  [v8 encodeObject:v6 forKey:@"accessPoints"];
  v7 = -[TBNetworkMO ownerIdentifiers](self, "ownerIdentifiers");
  [v8 encodeObject:v7 forKey:@"ownerIdentifiers"];

  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO type](self, "type"), @"type");
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO venueGroup](self, "venueGroup"), @"venueGroup");
  objc_msgSend(v8, "encodeInt64:forKey:", (int)-[TBNetworkMO venueType](self, "venueType"), @"venueType");
}

+ (id)entityName
{
  return @"Network";
}

+ (id)generateNewNetworkObjectFromMOC:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1895BA820]();
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __47__TBNetworkMO_generateNewNetworkObjectFromMOC___block_invoke;
  v8[3] = &unk_18A16D900;
  v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  objc_autoreleasePoolPop(v4);

  return v6;
}

void __47__TBNetworkMO_generateNewNetworkObjectFromMOC___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1896024D0];
  +[TBNetworkMO entityName](&OBJC_CLASS___TBNetworkMO, "entityName");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 insertNewObjectForEntityForName:v6 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)removeNetworksUsingPredicate:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1895BA820]();
  [MEMORY[0x1896024E8] fetchRequestWithEntityName:@"Network"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setPredicate:v5];
  id v9 = (void *)[objc_alloc(MEMORY[0x1896024B0]) initWithFetchRequest:v8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __48__TBNetworkMO_removeNetworksUsingPredicate_moc___block_invoke;
  v13[3] = &unk_18A16D218;
  id v10 = v6;
  id v14 = v10;
  id v15 = v9;
  id v12 = v5;
  id v16 = v12;
  id v11 = v9;
  [v10 performBlockAndWait:v13];

  objc_autoreleasePoolPop(v7);
}

void __48__TBNetworkMO_removeNetworksUsingPredicate_moc___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x1895BA820]();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v8 = 0LL;
  id v5 = (id)[v3 executeRequest:v4 error:&v8];
  id v6 = v8;
  v7 = v6;
  if (v6) {
    NSLog(@"%s: error %@", "+[TBNetworkMO removeNetworksUsingPredicate:moc:]_block_invoke", v6);
  }
  else {
    NSLog( @"%s: Removed networks that match supplied predicate <%@>",  "+[TBNetworkMO removeNetworksUsingPredicate:moc:]_block_invoke",  a1[6]);
  }

  objc_autoreleasePoolPop(v2);
}

+ (void)removeAllNetworksInMOC:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1895BA820]();
  id v5 = objc_alloc(MEMORY[0x1896024B0]);
  +[TBNetworkMO fetchRequest](&OBJC_CLASS___TBNetworkMO, "fetchRequest");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v5 initWithFetchRequest:v6];

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __38__TBNetworkMO_removeAllNetworksInMOC___block_invoke;
  v10[3] = &unk_18A16C748;
  id v9 = v3;
  id v11 = v9;
  id v12 = v7;
  id v8 = v7;
  [v9 performBlockAndWait:v10];

  objc_autoreleasePoolPop(v4);
}

void __38__TBNetworkMO_removeAllNetworksInMOC___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1895BA820]();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = 0LL;
  id v5 = (id)[v3 executeRequest:v4 error:&v8];
  id v6 = v8;
  v7 = v6;
  if (v6) {
    NSLog(@"%s: error %@", "+[TBNetworkMO removeAllNetworksInMOC:]_block_invoke", v6);
  }
  else {
    NSLog(@"%s: Removed all networks", "+[TBNetworkMO removeAllNetworksInMOC:]_block_invoke");
  }

  objc_autoreleasePoolPop(v2);
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1896024E8] fetchRequestWithEntityName:@"Network"];
}

@end