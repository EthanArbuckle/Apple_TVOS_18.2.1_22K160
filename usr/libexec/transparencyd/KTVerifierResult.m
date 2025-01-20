@interface KTVerifierResult
+ (id)resultsForUris:(id)a3 application:(id)a4 failure:(id)a5;
- (BOOL)sentToIDS;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 transparentData:(id)a6 loggableDatas:(id)a7;
- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 transparentData:(id)a5;
- (unint64_t)optInTernaryState;
- (void)setOptInTernaryState:(unint64_t)a3;
- (void)setSentToIDS:(BOOL)a3;
@end

@implementation KTVerifierResult

- (unint64_t)optInTernaryState
{
  id AssociatedObject = objc_getAssociatedObject(self, @"optInKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (void)setOptInTernaryState:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  objc_setAssociatedObject(self, @"optInKey", v4, (void *)1);
}

- (BOOL)sentToIDS
{
  id AssociatedObject = objc_getAssociatedObject(self, @"sentToIdsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setSentToIDS:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, @"sentToIdsKey", v4, (void *)1);
}

+ (id)resultsForUris:(id)a3 application:(id)a4 failure:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v15);
        v17 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
        v18 = -[KTVerifierResult initWithUri:application:failure:]( v17,  "initWithUri:application:failure:",  v16,  v8,  v9,  (void)v20);
        [v10 addObject:v18];

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }

  return v10;
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 transparentData:(id)a5
{
  return -[KTVerifierResult initWithUri:application:ktResult:transparentData:loggableDatas:]( self,  "initWithUri:application:ktResult:transparentData:loggableDatas:",  a3,  a4,  2LL,  a5,  0LL);
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 transparentData:(id)a6 loggableDatas:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = -[KTVerifierResult initWithUri:application:ktResult:](self, "initWithUri:application:ktResult:", a3, a4, a5);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 currentPublicID]);
    -[KTVerifierResult setPublicID:](v14, "setPublicID:", v15);

    -[KTVerifierResult setStaticAccountKeyEnforced:]( v14,  "setStaticAccountKeyEnforced:",  [v12 staticKeyEnforced]);
    -[KTVerifierResult setStaticAccountKeyStatus:]( v14,  "setStaticAccountKeyStatus:",  [v12 staticKeyStatus]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 currentPublicID]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 publicKeyInfo]);

    -[KTVerifierResult setEverOptedIn:](v14, "setEverOptedIn:", [v12 accountEverOptedIn:v17] == (id)1);
    -[KTVerifierResult setRecentlyOptedIn:]( v14,  "setRecentlyOptedIn:",  [v12 accountRecentlyOptedIn:v17] == (id)1);
    -[KTVerifierResult setOptedIn:](v14, "setOptedIn:", [v12 currentAccountOptInState] == (id)1);
    -[KTVerifierResult setOptInTernaryState:]( v14,  "setOptInTernaryState:",  [v12 currentAccountOptInState]);
    -[KTVerifierResult setLoggableDatas:](v14, "setLoggableDatas:", v13);
  }

  return v14;
}

@end