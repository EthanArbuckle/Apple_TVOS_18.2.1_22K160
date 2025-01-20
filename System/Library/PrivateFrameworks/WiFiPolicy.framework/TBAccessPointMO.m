@interface TBAccessPointMO
+ (BOOL)supportsSecureCoding;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateNewAccessPointObjectFromMOC:(id)a3;
+ (void)removeAllAccessPointsInMOC:(id)a3;
- (TBAccessPointMO)initWithCoder:(id)a3;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TBAccessPointMO

- (TBScore)qualityScore
{
  return (TBScore *)+[TBQualityScore qualityScoreWithValue:]( &OBJC_CLASS___TBQualityScore,  "qualityScoreWithValue:",  (int)-[TBAccessPointMO qualityScoreValue](self, "qualityScoreValue"));
}

- (TBScore)popularityScore
{
  return (TBScore *)+[TBPopularityScore popularityScoreWithValue:]( &OBJC_CLASS___TBPopularityScore,  "popularityScoreWithValue:",  (int)-[TBAccessPointMO popularityScoreValue](self, "popularityScoreValue"));
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[TBAccessPointMO edge](self, "edge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"edge"];
  v5 = -[TBAccessPointMO BSSID](self, "BSSID");
  if (v5)
  {
    v6 = -[TBAccessPointMO BSSID](self, "BSSID");
    [v3 setObject:v6 forKey:@"bssid"];
  }

  v7 = (void *)MEMORY[0x189607968];
  -[TBAccessPointMO latitude](self, "latitude");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKey:@"latitude"];

  v9 = (void *)MEMORY[0x189607968];
  -[TBAccessPointMO longitude](self, "longitude");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKey:@"longitude"];
  v11 = -[TBAccessPointMO popularityScore](self, "popularityScore");
  if (v11)
  {
    v12 = (void *)MEMORY[0x189607968];
    v13 = -[TBAccessPointMO popularityScore](self, "popularityScore");
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "score"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v14 forKey:@"popularityScoreValue"];
  }
  v15 = -[TBAccessPointMO qualityScore](self, "qualityScore");
  if (v15)
  {
    v16 = (void *)MEMORY[0x189607968];
    v17 = -[TBAccessPointMO qualityScore](self, "qualityScore");
    objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "score"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v18 forKey:@"qualityScoreValue"];
  }

  return v3;
}

- (TBAccessPointMO)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TBAccessPointMO;
  return -[NSManagedObject init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[TBAccessPointMO edge](self, "edge"), @"edge");
  objc_msgSend(v5, "encodeBool:forKey:", -[TBAccessPointMO tcpGood](self, "tcpGood"), @"tcpGood");
  -[TBAccessPointMO bssid](self, "bssid");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"bssid"];

  -[TBAccessPointMO latitude](self, "latitude");
  objc_msgSend(v5, "encodeDouble:forKey:", @"latitude");
  -[TBAccessPointMO longitude](self, "longitude");
  objc_msgSend(v5, "encodeDouble:forKey:", @"longitude");
  objc_msgSend( v5,  "encodeInt32:forKey:",  -[TBAccessPointMO popularityScoreValue](self, "popularityScoreValue"),  @"popularityScoreValue");
  objc_msgSend( v5,  "encodeInt32:forKey:",  -[TBAccessPointMO qualityScoreValue](self, "qualityScoreValue"),  @"qualityScoreValue");
}

+ (id)entityName
{
  return @"AccessPoint";
}

+ (id)generateNewAccessPointObjectFromMOC:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  id v15 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __55__TBAccessPointMO_generateNewAccessPointObjectFromMOC___block_invoke;
  v7[3] = &unk_18A16D900;
  v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [v4 performBlockAndWait:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __55__TBAccessPointMO_generateNewAccessPointObjectFromMOC___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1896024D0];
  +[TBAccessPointMO entityName](&OBJC_CLASS___TBAccessPointMO, "entityName");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 insertNewObjectForEntityForName:v6 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)removeAllAccessPointsInMOC:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  +[TBAccessPointMO fetchRequest](&OBJC_CLASS___TBAccessPointMO, "fetchRequest");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 executeFetchRequest:v4 error:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v3, "deleteObject:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1896024E8] fetchRequestWithEntityName:@"AccessPoint"];
}

@end