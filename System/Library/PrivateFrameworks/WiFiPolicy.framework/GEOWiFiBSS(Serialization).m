@interface GEOWiFiBSS(Serialization)
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasAttribute:()Serialization;
- (BOOL)isEdge;
- (BOOL)isTCPGood;
- (double)latitude;
- (double)longitude;
- (id)BSSID;
- (id)dictionaryRepresentation;
- (id)popularityScore;
- (id)qualityScore;
- (void)encodeWithCoder:()Serialization;
@end

@implementation GEOWiFiBSS(Serialization)

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()Serialization
{
  id v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", objc_msgSend(a1, "isEdge"), @"edge");
  [a1 BSSID];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v4 forKey:@"bssid"];

  [a1 latitude];
  objc_msgSend(v9, "encodeDouble:forKey:", @"latitude");
  [a1 longitude];
  objc_msgSend(v9, "encodeDouble:forKey:", @"longitude");
  [a1 popularityScore];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [a1 popularityScore];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeInt64:forKey:", objc_msgSend(v6, "score"), @"popularityScoreValue");
  }

  else
  {
    [v9 encodeInt64:0 forKey:@"popularityScoreValue"];
  }

  [a1 qualityScore];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [a1 qualityScore];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeInt64:forKey:", objc_msgSend(v8, "score"), @"qualityScoreValue");
  }

  else
  {
    [v9 encodeInt64:0 forKey:@"qualityScoreValue"];
  }
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a1, "isEdge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"edge"];

  [a1 BSSID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [a1 BSSID];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKey:@"bssid"];
  }

  v7 = (void *)MEMORY[0x189607968];
  [a1 latitude];
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v8 forKey:@"latitude"];

  id v9 = (void *)MEMORY[0x189607968];
  [a1 longitude];
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v10 forKey:@"longitude"];

  [a1 popularityScore];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x189607968];
    [a1 popularityScore];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "score"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v14 forKey:@"popularityScoreValue"];
  }

  [a1 qualityScore];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x189607968];
    [a1 qualityScore];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "score"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v18 forKey:@"qualityScoreValue"];
  }

  return v3;
}

- (double)latitude
{
  if ([a1 hasLatLngE7])
  {
    [a1 latLngE7];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    double v4 = (double)(int)[v3 latE7] / 10000000.0;
  }

  else
  {
    [a1 location];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 lat];
    double v4 = v5;
  }

  return v4;
}

- (double)longitude
{
  if ([a1 hasLatLngE7])
  {
    [a1 latLngE7];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    double v4 = (double)(int)[v3 lngE7] / 10000000.0;
  }

  else
  {
    [a1 location];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 lng];
    double v4 = v5;
  }

  return v4;
}

- (id)BSSID
{
  if ([a1 hasUniqueIdentifier])
  {
    TBMacAdressFromLong([a1 uniqueIdentifier]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [a1 identifier];
    double v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 lowercaseString];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)popularityScore
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  [a1 qualities];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    goto LABEL_17;
  }
  [a1 qualities];
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 firstObject];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 qualities];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 count];

  if (v6 >= 2) {
    NSLog( @"%s: mulitple qualities returned, only handling first",  "-[GEOWiFiBSS(Serialization) popularityScore]");
  }
  if ([v3 qualitiesCount])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    [v3 qualities];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ([v11 type] == 1)
          {
            v8 = +[TBPopularityScore popularityScoreWithValue:]( TBPopularityScore,  "popularityScoreWithValue:",  [v11 score]);
            goto LABEL_15;
          }
        }

        v8 = (void *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (id)qualityScore
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  [a1 qualities];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    goto LABEL_17;
  }
  [a1 qualities];
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 firstObject];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 qualities];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 count];

  if (v6 >= 2) {
    NSLog( @"%s: mulitple qualities returned, only handling first",  "-[GEOWiFiBSS(Serialization) qualityScore]");
  }
  if ([v3 qualitiesCount])
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    [v3 qualities];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ([v11 type] == 2)
          {
            v8 = +[TBQualityScore qualityScoreWithValue:]( TBQualityScore,  "qualityScoreWithValue:",  [v11 score]);
            goto LABEL_15;
          }
        }

        v8 = (void *)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (BOOL)isEdge
{
  return [a1 _hasAttribute:1];
}

- (BOOL)isTCPGood
{
  return 0;
}

- (BOOL)_hasAttribute:()Serialization
{
  if (![a1 attributes] || !objc_msgSend(a1, "attributesCount")) {
    return 0;
  }
  unint64_t v5 = 0LL;
  do
  {
    int v6 = [a1 attributesAtIndex:v5];
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    ++v5;
  }

  while ([a1 attributesCount] > v5);
  return v7;
}

@end