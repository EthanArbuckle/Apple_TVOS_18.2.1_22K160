@interface ADSynchronizedIds
- (ADSynchronizedIdItemPair)aggregationIds;
- (ADSynchronizedIdItemPair)ephemeralSeeds;
- (ADSynchronizedIds)initWithEphemeralSeeds:(id)a3 andAggregationIds:(id)a4;
- (BOOL)setCurrentEphemeralSeedIfNil:(id)a3 andCreationTime:(id)a4;
- (NSUUID)currentAggregationId;
- (NSUUID)currentEphemeralSeed;
- (NSUUID)nextAggregationId;
- (NSUUID)nextEphemeralSeed;
- (unint64_t)_populateNullAggregationIdsWithCreationTime:(id)a3 today:(id)a4;
- (unint64_t)_populateNullEphemeralSeedsWithCreationTime:(id)a3 today:(id)a4;
- (unint64_t)populateNullsWithCreationTime:(id)a3;
@end

@implementation ADSynchronizedIds

- (ADSynchronizedIds)initWithEphemeralSeeds:(id)a3 andAggregationIds:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADSynchronizedIds;
  v9 = -[ADSynchronizedIds init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ephemeralSeeds, a3);
    objc_storeStrong((id *)&v10->_aggregationIds, a4);
  }

  return v10;
}

- (NSUUID)currentEphemeralSeed
{
  ephemeralSeeds = self->_ephemeralSeeds;
  if (ephemeralSeeds
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair current](ephemeralSeeds, "current"))) != 0LL)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  }

  else
  {
    v5 = 0LL;
  }

  return (NSUUID *)v5;
}

- (NSUUID)nextEphemeralSeed
{
  ephemeralSeeds = self->_ephemeralSeeds;
  if (ephemeralSeeds
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair next](ephemeralSeeds, "next"))) != 0LL)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  }

  else
  {
    v5 = 0LL;
  }

  return (NSUUID *)v5;
}

- (NSUUID)currentAggregationId
{
  aggregationIds = self->_aggregationIds;
  if (aggregationIds
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair current](aggregationIds, "current"))) != 0LL)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  }

  else
  {
    v5 = 0LL;
  }

  return (NSUUID *)v5;
}

- (NSUUID)nextAggregationId
{
  aggregationIds = self->_aggregationIds;
  if (aggregationIds
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItemPair next](aggregationIds, "next"))) != 0LL)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  }

  else
  {
    v5 = 0LL;
  }

  return (NSUUID *)v5;
}

- (unint64_t)populateNullsWithCreationTime:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem alignToMidnight:](&OBJC_CLASS___ADSynchronizedIdItem, "alignToMidnight:", v4));
  unint64_t v6 = -[ADSynchronizedIds _populateNullEphemeralSeedsWithCreationTime:today:]( self,  "_populateNullEphemeralSeedsWithCreationTime:today:",  v4,  v5);
  unint64_t v7 = -[ADSynchronizedIds _populateNullAggregationIdsWithCreationTime:today:]( self,  "_populateNullAggregationIdsWithCreationTime:today:",  v4,  v5);

  return v7 | v6;
}

- (unint64_t)_populateNullEphemeralSeedsWithCreationTime:(id)a3 today:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ephemeralSeeds = self->_ephemeralSeeds;
  if (!ephemeralSeeds)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___ADSynchronizedIdItemPair);
    v10 = self->_ephemeralSeeds;
    self->_ephemeralSeeds = v9;

    ephemeralSeeds = self->_ephemeralSeeds;
  }

  unint64_t v11 = -[ADSynchronizedIdItemPair _populateNullsWithCreationTime:today:minValidityDays:maxValidityDays:currentOption:nextOption:]( ephemeralSeeds,  "_populateNullsWithCreationTime:today:minValidityDays:maxValidityDays:currentOption:nextOption:",  v6,  v7,  14LL,  14LL,  1LL,  2LL);

  return v11;
}

- (unint64_t)_populateNullAggregationIdsWithCreationTime:(id)a3 today:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aggregationIds = self->_aggregationIds;
  if (!aggregationIds)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___ADSynchronizedIdItemPair);
    v10 = self->_aggregationIds;
    self->_aggregationIds = v9;

    aggregationIds = self->_aggregationIds;
  }

  unint64_t v11 = -[ADSynchronizedIdItemPair _populateNullsWithCreationTime:today:minValidityDays:maxValidityDays:currentOption:nextOption:]( aggregationIds,  "_populateNullsWithCreationTime:today:minValidityDays:maxValidityDays:currentOption:nextOption:",  v6,  v7,  30LL,  548LL,  4LL,  8LL);

  return v11;
}

- (BOOL)setCurrentEphemeralSeedIfNil:(id)a3 andCreationTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ephemeralSeeds = self->_ephemeralSeeds;
  if (!ephemeralSeeds)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___ADSynchronizedIdItemPair);
    v10 = self->_ephemeralSeeds;
    self->_ephemeralSeeds = v9;

    ephemeralSeeds = self->_ephemeralSeeds;
  }

  unsigned __int8 v11 = -[ADSynchronizedIdItemPair setCurrentIfNil:andCreationTime:andValidityDays:]( ephemeralSeeds,  "setCurrentIfNil:andCreationTime:andValidityDays:",  v6,  v7,  14LL);

  return v11;
}

- (ADSynchronizedIdItemPair)ephemeralSeeds
{
  return (ADSynchronizedIdItemPair *)objc_getProperty(self, a2, 8LL, 1);
}

- (ADSynchronizedIdItemPair)aggregationIds
{
  return (ADSynchronizedIdItemPair *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end