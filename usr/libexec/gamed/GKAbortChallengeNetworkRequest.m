@interface GKAbortChallengeNetworkRequest
+ (id)bagKey;
- (BOOL)isDuplicateRequest:(id)a3;
- (id)postBody;
- (void)mergeRequestData:(id)a3;
@end

@implementation GKAbortChallengeNetworkRequest

+ (id)bagKey
{
  return @"gk-abort-challenges";
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 challenges]);

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (void)mergeRequestData:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 challenges]);

  [v6 unionSet:v5];
}

- (id)postBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKChallengeNetworkRequest challenges](self, "challenges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"challenge-ids");

  return v3;
}

@end