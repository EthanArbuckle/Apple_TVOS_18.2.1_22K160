@interface GKPreferences
- (BOOL)hasConsumedArcadeSubscription:(id)a3 arcadeFamilyId:(id)a4;
- (int64_t)arcadeSubscriptionState;
- (void)setArcadeSubscriptionState:(int64_t)a3;
- (void)updateArcadeSubscriptionState:(id)a3 completionHandler:(id)a4;
@end

@implementation GKPreferences

- (int64_t)arcadeSubscriptionState
{
  return (int64_t)-[GKPreferences integerValueForKey:defaultValue:]( self,  "integerValueForKey:defaultValue:",  @"GKArcadeSubscriptionState",  0LL);
}

- (void)setArcadeSubscriptionState:(int64_t)a3
{
}

- (BOOL)hasConsumedArcadeSubscription:(id)a3 arcadeFamilyId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "stringValue", (void)v14));
        unsigned __int8 v12 = [v11 isEqualToString:v6];

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)updateArcadeSubscriptionState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ASDSubscriptionEntitlements sharedInstance]( &OBJC_CLASS___ASDSubscriptionEntitlements,  "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000BAB14;
  v11[3] = &unk_100270E30;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:v11];
}

@end