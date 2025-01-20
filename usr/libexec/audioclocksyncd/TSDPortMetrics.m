@interface TSDPortMetrics
- (TSDPortMetrics)initWithPort:(id)a3;
- (id)getDelta:(id)a3;
- (unint64_t)discardedDelayLimitExceededMeasurements;
- (unint64_t)discardedDelayLimitExceededPercentage;
- (unint64_t)discardedOutOfBoundsMeasurements;
- (unint64_t)discardedOutOfBoundsPercentage;
- (unint64_t)discardedPpmLimitMeasurements;
- (unint64_t)discardedPpmLimitPercentage;
- (unint64_t)discardedTimestampsOutOfOrderMeasurements;
- (unint64_t)discardedTimestampsOutOfOrderPercentage;
- (unint64_t)droppedMeasurements;
- (unint64_t)droppedPercentage;
- (unint64_t)filterResetsDroppedLimit;
- (unint64_t)filterResetsOutOfBounds;
- (unint64_t)meanDelayTime;
- (unint64_t)successfulMeasurements;
- (unint64_t)successfulPercentage;
- (unint64_t)syncTimeouts;
- (unint64_t)totalMeasurements;
- (unsigned)portNumber;
- (void)calculatePercentages;
- (void)setDiscardedDelayLimitExceededMeasurements:(unint64_t)a3;
- (void)setDiscardedDelayLimitExceededPercentage:(unint64_t)a3;
- (void)setDiscardedOutOfBoundsMeasurements:(unint64_t)a3;
- (void)setDiscardedOutOfBoundsPercentage:(unint64_t)a3;
- (void)setDiscardedPpmLimitMeasurements:(unint64_t)a3;
- (void)setDiscardedPpmLimitPercentage:(unint64_t)a3;
- (void)setDiscardedTimestampsOutOfOrderMeasurements:(unint64_t)a3;
- (void)setDiscardedTimestampsOutOfOrderPercentage:(unint64_t)a3;
- (void)setDroppedMeasurements:(unint64_t)a3;
- (void)setDroppedPercentage:(unint64_t)a3;
- (void)setFilterResetsDroppedLimit:(unint64_t)a3;
- (void)setFilterResetsOutOfBounds:(unint64_t)a3;
- (void)setMeanDelayTime:(unint64_t)a3;
- (void)setPortNumber:(unsigned __int16)a3;
- (void)setSuccessfulMeasurements:(unint64_t)a3;
- (void)setSuccessfulPercentage:(unint64_t)a3;
- (void)setSyncTimeouts:(unint64_t)a3;
- (void)setTotalMeasurements:(unint64_t)a3;
@end

@implementation TSDPortMetrics

- (void)calculatePercentages
{
  unint64_t totalMeasurements = self->_totalMeasurements;
  if (totalMeasurements)
  {
    unint64_t v3 = 100 * self->_droppedMeasurements / totalMeasurements;
    unint64_t v4 = 100 * self->_discardedPpmLimitMeasurements / totalMeasurements;
    unint64_t v5 = 100 * self->_discardedDelayLimitExceededMeasurements / totalMeasurements;
    unint64_t v6 = 100 * self->_discardedOutOfBoundsMeasurements / totalMeasurements;
    unint64_t v7 = 100 * self->_discardedTimestampsOutOfOrderMeasurements / totalMeasurements;
    unint64_t totalMeasurements = 100 * self->_successfulMeasurements / totalMeasurements;
  }

  else
  {
    unint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
  }

  self->_droppedPercentage = v3;
  self->_discardedPpmLimitPercentage = v4;
  self->_discardedDelayLimitExceededPercentage = v5;
  self->_discardedOutOfBoundsPercentage = v6;
  self->_discardedTimestampsOutOfOrderPercentage = v7;
  self->_successfulPercentage = totalMeasurements;
}

- (TSDPortMetrics)initWithPort:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_port, a3);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self->_port, "service"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iodProperties]);

  self->_portNumber = (unsigned __int16)[v5 portNumber];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncReceiptTimeoutCounter"]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncReceiptTimeoutCounter"]);
    self->_syncTimeouts = [v9 unsignedIntValue];
  }

  else
  {
    self->_syncTimeouts = 0LL;
  }

  port = self->_port;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDEtEPort);
  if ((objc_opt_isKindOfClass(port, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetDroppedLimitCounter"]);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetDroppedLimitCounter"]);
      self->_filterResetsDroppedLimit = [v13 unsignedIntValue];
    }

    else
    {
      self->_filterResetsDroppedLimit = 0LL;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetOutOfBoundsCounter"]);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetOutOfBoundsCounter"]);
      self->_filterResetsOutOfBounds = [v15 unsignedIntValue];
    }

    else
    {
      self->_filterResetsOutOfBounds = 0LL;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"LinkPropagationMeanDelay"]);
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"LinkPropagationMeanDelay"]);
      self->_meanDelayTime = [v17 unsignedIntValue];
    }

    else
    {
      self->_meanDelayTime = 0LL;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementDroppedCounter"]);
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementDroppedCounter"]);
      self->_droppedMeasurements = [v19 unsignedIntValue];
    }

    else
    {
      self->_droppedMeasurements = 0LL;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"RawDelayMeasurementCounter"]);
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"RawDelayMeasurementCounter"]);
      uint64_t v22 = [v21 unsignedIntValue];
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    self->_unint64_t totalMeasurements = self->_droppedMeasurements + v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementDiscardPPMLimitCounter"]);
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementDiscardPPMLimitCounter"]);
      self->_discardedPpmLimitMeasurements = [v24 unsignedIntValue];
    }

    else
    {
      self->_discardedPpmLimitMeasurements = 0LL;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardDelayLimitExceededCounter"]);
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardDelayLimitExceededCounter"]);
      self->_discardedDelayLimitExceededMeasurements = [v26 unsignedIntValue];
    }

    else
    {
      self->_discardedDelayLimitExceededMeasurements = 0LL;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementDiscardOutOfBoundsCounter"]);
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementDiscardOutOfBoundsCounter"]);
      self->_discardedOutOfBoundsMeasurements = [v28 unsignedIntValue];
    }

    else
    {
      self->_discardedOutOfBoundsMeasurements = 0LL;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardTimestampsOutOfOrderCounter"]);
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardTimestampsOutOfOrderCounter"]);
      self->_discardedTimestampsOutOfOrderMeasurements = [v30 unsignedIntValue];
    }

    else
    {
      self->_discardedTimestampsOutOfOrderMeasurements = 0LL;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementSuccessCounter"]);
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"SyncMeasurementSuccessCounter"]);
      self->_successfulMeasurements = [v32 unsignedIntValue];
    }

    else
    {
      self->_successfulMeasurements = 0LL;
    }

    -[TSDPortMetrics calculatePercentages](self, "calculatePercentages");
  }

  return self;
}

- (id)getDelta:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TSDPortMetrics);
  -[TSDPortMetrics setPortNumber:](v5, "setPortNumber:", self->_portNumber);
  -[TSDPortMetrics setSyncTimeouts:]( v5,  "setSyncTimeouts:",  self->_syncTimeouts - (void)[v4 syncTimeouts]);
  port = self->_port;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDEtEPort);
  if ((objc_opt_isKindOfClass(port, v7) & 1) != 0)
  {
    -[TSDPortMetrics setFilterResetsDroppedLimit:]( v5,  "setFilterResetsDroppedLimit:",  self->_filterResetsDroppedLimit - (void)[v4 filterResetsDroppedLimit]);
    -[TSDPortMetrics setFilterResetsOutOfBounds:]( v5,  "setFilterResetsOutOfBounds:",  self->_filterResetsOutOfBounds - (void)[v4 filterResetsOutOfBounds]);
    -[TSDPortMetrics setDroppedMeasurements:]( v5,  "setDroppedMeasurements:",  self->_droppedMeasurements - (void)[v4 droppedMeasurements]);
    -[TSDPortMetrics setDiscardedPpmLimitMeasurements:]( v5,  "setDiscardedPpmLimitMeasurements:",  self->_discardedPpmLimitMeasurements - (void)[v4 discardedPpmLimitMeasurements]);
    -[TSDPortMetrics setDiscardedDelayLimitExceededMeasurements:]( v5,  "setDiscardedDelayLimitExceededMeasurements:",  self->_discardedDelayLimitExceededMeasurements - (void)[v4 discardedDelayLimitExceededMeasurements]);
    -[TSDPortMetrics setDiscardedOutOfBoundsMeasurements:]( v5,  "setDiscardedOutOfBoundsMeasurements:",  self->_discardedOutOfBoundsMeasurements - (void)[v4 discardedOutOfBoundsMeasurements]);
    -[TSDPortMetrics setDiscardedTimestampsOutOfOrderMeasurements:]( v5,  "setDiscardedTimestampsOutOfOrderMeasurements:",  self->_discardedTimestampsOutOfOrderMeasurements - (void)[v4 discardedTimestampsOutOfOrderMeasurements]);
    -[TSDPortMetrics setSuccessfulMeasurements:]( v5,  "setSuccessfulMeasurements:",  self->_successfulMeasurements - (void)[v4 successfulMeasurements]);
    -[TSDPortMetrics setTotalMeasurements:]( v5,  "setTotalMeasurements:",  self->_totalMeasurements - (void)[v4 totalMeasurements]);
    -[TSDPortMetrics calculatePercentages](v5, "calculatePercentages");
  }

  return v5;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned __int16)a3
{
  self->_portNumber = a3;
}

- (unint64_t)syncTimeouts
{
  return self->_syncTimeouts;
}

- (void)setSyncTimeouts:(unint64_t)a3
{
  self->_syncTimeouts = a3;
}

- (unint64_t)filterResetsDroppedLimit
{
  return self->_filterResetsDroppedLimit;
}

- (void)setFilterResetsDroppedLimit:(unint64_t)a3
{
  self->_filterResetsDroppedLimit = a3;
}

- (unint64_t)filterResetsOutOfBounds
{
  return self->_filterResetsOutOfBounds;
}

- (void)setFilterResetsOutOfBounds:(unint64_t)a3
{
  self->_filterResetsOutOfBounds = a3;
}

- (unint64_t)meanDelayTime
{
  return self->_meanDelayTime;
}

- (void)setMeanDelayTime:(unint64_t)a3
{
  self->_meanDelayTime = a3;
}

- (unint64_t)droppedMeasurements
{
  return self->_droppedMeasurements;
}

- (void)setDroppedMeasurements:(unint64_t)a3
{
  self->_droppedMeasurements = a3;
}

- (unint64_t)discardedPpmLimitMeasurements
{
  return self->_discardedPpmLimitMeasurements;
}

- (void)setDiscardedPpmLimitMeasurements:(unint64_t)a3
{
  self->_discardedPpmLimitMeasurements = a3;
}

- (unint64_t)discardedDelayLimitExceededMeasurements
{
  return self->_discardedDelayLimitExceededMeasurements;
}

- (void)setDiscardedDelayLimitExceededMeasurements:(unint64_t)a3
{
  self->_discardedDelayLimitExceededMeasurements = a3;
}

- (unint64_t)discardedOutOfBoundsMeasurements
{
  return self->_discardedOutOfBoundsMeasurements;
}

- (void)setDiscardedOutOfBoundsMeasurements:(unint64_t)a3
{
  self->_discardedOutOfBoundsMeasurements = a3;
}

- (unint64_t)discardedTimestampsOutOfOrderMeasurements
{
  return self->_discardedTimestampsOutOfOrderMeasurements;
}

- (void)setDiscardedTimestampsOutOfOrderMeasurements:(unint64_t)a3
{
  self->_discardedTimestampsOutOfOrderMeasurements = a3;
}

- (unint64_t)successfulMeasurements
{
  return self->_successfulMeasurements;
}

- (void)setSuccessfulMeasurements:(unint64_t)a3
{
  self->_successfulMeasurements = a3;
}

- (unint64_t)totalMeasurements
{
  return self->_totalMeasurements;
}

- (void)setTotalMeasurements:(unint64_t)a3
{
  self->_unint64_t totalMeasurements = a3;
}

- (unint64_t)droppedPercentage
{
  return self->_droppedPercentage;
}

- (void)setDroppedPercentage:(unint64_t)a3
{
  self->_droppedPercentage = a3;
}

- (unint64_t)discardedPpmLimitPercentage
{
  return self->_discardedPpmLimitPercentage;
}

- (void)setDiscardedPpmLimitPercentage:(unint64_t)a3
{
  self->_discardedPpmLimitPercentage = a3;
}

- (unint64_t)discardedDelayLimitExceededPercentage
{
  return self->_discardedDelayLimitExceededPercentage;
}

- (void)setDiscardedDelayLimitExceededPercentage:(unint64_t)a3
{
  self->_discardedDelayLimitExceededPercentage = a3;
}

- (unint64_t)discardedOutOfBoundsPercentage
{
  return self->_discardedOutOfBoundsPercentage;
}

- (void)setDiscardedOutOfBoundsPercentage:(unint64_t)a3
{
  self->_discardedOutOfBoundsPercentage = a3;
}

- (unint64_t)discardedTimestampsOutOfOrderPercentage
{
  return self->_discardedTimestampsOutOfOrderPercentage;
}

- (void)setDiscardedTimestampsOutOfOrderPercentage:(unint64_t)a3
{
  self->_discardedTimestampsOutOfOrderPercentage = a3;
}

- (unint64_t)successfulPercentage
{
  return self->_successfulPercentage;
}

- (void)setSuccessfulPercentage:(unint64_t)a3
{
  self->_successfulPercentage = a3;
}

- (void).cxx_destruct
{
}

@end