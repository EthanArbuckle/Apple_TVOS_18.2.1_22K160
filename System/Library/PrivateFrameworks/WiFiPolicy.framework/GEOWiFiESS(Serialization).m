@interface GEOWiFiESS(Serialization)
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasAttribute:()Serialization;
- (BOOL)isCaptive;
- (BOOL)isLowQuality;
- (BOOL)isMoving;
- (BOOL)isPublic;
- (BOOL)isSuspicious;
- (id)accessPoints;
- (id)attributesDescription;
- (id)authDescription;
- (id)dictionaryRepresentation;
- (id)popularityScore;
- (id)qualityScore;
- (id)remoteIdentifier;
- (unint64_t)accessPointCount;
- (unint64_t)authMask;
- (unint64_t)type;
- (void)encodeWithCoder:()Serialization;
@end

@implementation GEOWiFiESS(Serialization)

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()Serialization
{
  id v13 = a3;
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isMoving"), @"moving");
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isCaptive"), @"captive");
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isSuspicious"), @"suspicious");
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isPublic"), @"public");
  [a1 name];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v4 forKey:@"name"];

  [a1 identifier];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(a1, "authMask"), @"authMask");
  objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(a1, "tileKey"), @"tileKey");
  [a1 popularityScore];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [a1 popularityScore];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(v7, "score"), @"popularityScoreValue");
  }

  else
  {
    [v13 encodeInt64:0 forKey:@"popularityScoreValue"];
  }

  [a1 qualityScore];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [a1 qualityScore];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(v9, "score"), @"qualityScoreValue");
  }

  else
  {
    [v13 encodeInt64:0 forKey:@"qualityScoreValue"];
  }

  [a1 accessPoints];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v10 forKey:@"accessPoints"];

  [a1 ownerIdentifiers];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [a1 ownerIdentifiers];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 encodeObject:v12 forKey:@"ownerIdentifiers"];
  }

  objc_msgSend(v13, "encodeInt32:forKey:", objc_msgSend(a1, "venueType"), @"venueType");
  objc_msgSend(v13, "encodeInteger:forKey:", (int)objc_msgSend(a1, "venueGroup"), @"venueGroup");
  objc_msgSend(v13, "encodeInteger:forKey:", objc_msgSend(a1, "type"), @"type");
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a1, "isMoving"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"moving"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a1, "isCaptive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKey:@"captive"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a1, "isSuspicious"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v6 forKey:@"suspicious"];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(a1, "isPublic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v7 forKey:@"public"];

  [a1 name];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [a1 name];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v9 forKey:@"name"];
  }

  [a1 identifier];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [a1 identifier];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v11 forKey:@"identifier"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(a1, "authMask"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v12 forKey:@"authMask"];

  [a1 popularityScore];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x189607968];
    [a1 popularityScore];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v16 forKey:@"popularityScoreValue"];
  }

  [a1 qualityScore];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x189607968];
    [a1 qualityScore];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "score"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v20 forKey:@"qualityScoreValue"];
  }

  [a1 accessPoints];
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [MEMORY[0x189603FA8] array];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    objc_msgSend(a1, "accessPoints", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        uint64_t v27 = 0LL;
        do
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v27) dictionaryRepresentation];
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 addObject:v28];

          ++v27;
        }

        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v25);
    }

    [v3 setObject:v22 forKey:@"accessPoints"];
  }

  [a1 ownerIdentifiers];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    [a1 ownerIdentifiers];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v30 forKey:@"ownerIdentifiers"];
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(a1, "venueType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v31 forKey:@"venueType"];

  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(a1, "venueGroup"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v32 forKey:@"venueGroup"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(a1, "type"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v33 forKey:@"type"];

  return v3;
}

- (unint64_t)authMask
{
  if (![a1 authTraitsCount] || !objc_msgSend(a1, "authTraitsCount")) {
    return 0LL;
  }
  unint64_t v3 = 0LL;
  unint64_t v4 = 0LL;
  do
  {
    switch([a1 authTraitsAtIndex:v4])
    {
      case 1u:
        v3 |= 1uLL;
        break;
      case 2u:
        v3 |= 2uLL;
        break;
      case 3u:
        v3 |= 4uLL;
        break;
      case 4u:
        v3 |= 8uLL;
        break;
      default:
        break;
    }

    ++v4;
  }

  while (v4 < [a1 authTraitsCount]);
  return v3;
}

- (id)authDescription
{
  if ([a1 authTraitsCount])
  {
    [MEMORY[0x189607940] string];
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ([a1 authTraitsCount])
    {
      unint64_t v4 = 0LL;
      do
      {
        v5 = (void *)NSString;
        objc_msgSend(a1, "authTraitsAsString:", objc_msgSend(a1, "authTraitsAtIndex:", v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 stringWithFormat:@"%@", v6];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 appendString:v7];

        if (v4 < [a1 authTraitsCount] - 1) {
          objc_msgSend(v3, "appendString:", @", ");
        }
        ++v4;
      }

      while (v4 < [a1 authTraitsCount]);
    }
  }

  else
  {
    unint64_t v3 = 0LL;
  }

  return v3;
}

- (id)attributesDescription
{
  if ([a1 attributesCount])
  {
    [MEMORY[0x189607940] string];
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ([a1 attributesCount])
    {
      unint64_t v4 = 0LL;
      do
      {
        v5 = (void *)NSString;
        objc_msgSend(a1, "attributesAsString:", objc_msgSend(a1, "attributesAtIndex:", v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 stringWithFormat:@"%@", v6];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 appendString:v7];

        if (v4 < [a1 attributesCount] - 1) {
          objc_msgSend(v3, "appendString:", @", ");
        }
        ++v4;
      }

      while (v4 < [a1 attributesCount]);
    }
  }

  else
  {
    unint64_t v3 = 0LL;
  }

  return v3;
}

- (id)remoteIdentifier
{
  else {
    [a1 identifier];
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessPoints
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    unint64_t v4 = (void *)MEMORY[0x189604010];
    [a1 bss];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setWithArray:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)popularityScore
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  [a1 qualities];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    goto LABEL_17;
  }
  [a1 qualities];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 firstObject];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 qualities];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 count];

  if (v6 >= 2) {
    NSLog( @"%s: mulitple qualities returned, only handling first",  "-[GEOWiFiESS(Serialization) popularityScore]");
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
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3) {
    goto LABEL_17;
  }
  [a1 qualities];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 firstObject];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 qualities];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 count];

  if (v6 >= 2) {
    NSLog( @"%s: mulitple qualities returned, only handling first",  "-[GEOWiFiESS(Serialization) qualityScore]");
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

- (BOOL)isCaptive
{
  return [a1 _hasAttribute:1];
}

- (BOOL)isMoving
{
  return [a1 _hasAttribute:2];
}

- (BOOL)isSuspicious
{
  return [a1 _hasAttribute:4];
}

- (BOOL)isPublic
{
  return [a1 _hasAttribute:3];
}

- (BOOL)isLowQuality
{
  return [a1 _hasAttribute:5];
}

- (unint64_t)type
{
  return (int)[a1 networkType];
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

- (unint64_t)accessPointCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 count];

  return v3;
}

@end