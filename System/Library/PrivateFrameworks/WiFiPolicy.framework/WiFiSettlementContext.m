@interface WiFiSettlementContext
+ (BOOL)networkQualifiesForSettlement:(id)a3;
- (BOOL)compareWithScanResults:(id)a3;
- (NSArray)strongestNetworks;
- (NSDate)creationDate;
- (NSSet)strongestBSSIDs;
- (WiFiSettlementContext)initWithNetworks:(id)a3 maxCount:(unint64_t)a4;
- (unint64_t)maxCount;
- (void)_updateStrongestNetworks:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setMaxCount:(unint64_t)a3;
- (void)setStrongestBSSIDs:(id)a3;
- (void)setStrongestNetworks:(id)a3;
@end

@implementation WiFiSettlementContext

- (WiFiSettlementContext)initWithNetworks:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiSettlementContext;
  v7 = -[WiFiSettlementContext init](&v11, sel_init);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x189603F50] date];
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v8;

    v7->_maxCount = a4;
    -[WiFiSettlementContext _updateStrongestNetworks:](v7, "_updateStrongestNetworks:", v6);
  }

  return v7;
}

- (BOOL)compareWithScanResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 count])
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (+[WiFiSettlementContext networkQualifiesForSettlement:]( &OBJC_CLASS___WiFiSettlementContext,  "networkQualifiesForSettlement:",  v10,  (void)v16))
          {
            -[WiFiSettlementContext strongestBSSIDs](self, "strongestBSSIDs");
            objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 BSSID];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            char v13 = [v11 containsObject:v12];

            if ((v13 & 1) != 0)
            {
              BOOL v14 = 1;
              goto LABEL_13;
            }
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v14 = 0;
LABEL_13:
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_updateStrongestNetworks:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 filteredArrayUsingPredicate:v5];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "networksSortedBySignalStrengthWithMaxCount:", -[WiFiSettlementContext maxCount](self, "maxCount"));
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  strongestNetworks = self->_strongestNetworks;
  self->_strongestNetworks = v6;

  uint64_t v8 = (void *)MEMORY[0x189604010];
  v9 = -[NSArray mapObjectsUsingBlock:](self->_strongestNetworks, "mapObjectsUsingBlock:", &__block_literal_global_5);
  [v8 setWithArray:v9];
  v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
  strongestBSSIDs = self->_strongestBSSIDs;
  self->_strongestBSSIDs = v10;
}

BOOL __50__WiFiSettlementContext__updateStrongestNetworks___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WiFiSettlementContext networkQualifiesForSettlement:]( &OBJC_CLASS___WiFiSettlementContext,  "networkQualifiesForSettlement:",  a2);
}

uint64_t __50__WiFiSettlementContext__updateStrongestNetworks___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 BSSID];
}

+ (BOOL)networkQualifiesForSettlement:(id)a3
{
  id v3 = a3;
  [v3 scanProperties];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:@"CARPLAY_NETWORK"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || ([v3 scanProperties],
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        [v6 objectForKey:@"APPLE_DEVICE_IE"],
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    BOOL v9 = 0;
  }

  else
  {
    [v3 BSSID];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v8 != 0LL;
  }

  return v9;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSArray)strongestNetworks
{
  return self->_strongestNetworks;
}

- (void)setStrongestNetworks:(id)a3
{
}

- (NSSet)strongestBSSIDs
{
  return self->_strongestBSSIDs;
}

- (void)setStrongestBSSIDs:(id)a3
{
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (void).cxx_destruct
{
}

@end