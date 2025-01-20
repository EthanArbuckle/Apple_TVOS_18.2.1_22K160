@interface NWStatisticsDelegateBlockWrapper
- (id)addedBlock;
- (id)countsBlock;
- (id)descriptionBlock;
- (id)eventsBlock;
- (id)removedBlock;
- (void)setAddedBlock:(id)a3;
- (void)setCountsBlock:(id)a3;
- (void)setDescriptionBlock:(id)a3;
- (void)setEventsBlock:(id)a3;
- (void)setRemovedBlock:(id)a3;
- (void)sourceDidReceiveCounts:(id)a3;
- (void)sourceDidReceiveDescription:(id)a3;
- (void)statisticsManager:(id)a3 didAddSource:(id)a4;
- (void)statisticsManager:(id)a3 didRemoveSource:(id)a4;
@end

@implementation NWStatisticsDelegateBlockWrapper

- (void)statisticsManager:(id)a3 didAddSource:(id)a4
{
  id v7 = a4;
  v5 = -[NWStatisticsDelegateBlockWrapper addedBlock](self, "addedBlock");
  if (v5)
  {
    -[NWStatisticsDelegateBlockWrapper addedBlock](self, "addedBlock");
    v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)statisticsManager:(id)a3 didRemoveSource:(id)a4
{
  id v11 = a4;
  [v11 delegate];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    [v11 delegate];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 eventsBlock];
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v11, 2LL);
    }

    else
    {
      uint64_t v9 = [v6 removedBlock];
      v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t))(v9 + 16))(v9);
      }
    }

    [v11 setDelegate:0];
  }
}

- (void)sourceDidReceiveCounts:(id)a3
{
  id v10 = a3;
  v4 = -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
  if (v4)
  {
    -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
    v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v5)[2](v5, v10, 0LL);
LABEL_5:

    uint64_t v7 = v10;
    goto LABEL_6;
  }
  v6 = -[NWStatisticsDelegateBlockWrapper countsBlock](self, "countsBlock");
  uint64_t v7 = v10;
  if (v6)
  {
    [v10 currentSnapshot];
    v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    [v5 traditionalDictionary];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsDelegateBlockWrapper countsBlock](self, "countsBlock");
    uint64_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v9)[2](v9, v8);

    goto LABEL_5;
  }

- (void)sourceDidReceiveDescription:(id)a3
{
  id v10 = a3;
  v4 = -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
  if (v4)
  {
    -[NWStatisticsDelegateBlockWrapper eventsBlock](self, "eventsBlock");
    v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, uint64_t))v5)[2](v5, v10, 1LL);
LABEL_5:

    uint64_t v7 = v10;
    goto LABEL_6;
  }
  v6 = -[NWStatisticsDelegateBlockWrapper descriptionBlock](self, "descriptionBlock");
  uint64_t v7 = v10;
  if (v6)
  {
    [v10 currentSnapshot];
    v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    [v5 traditionalDictionary];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsDelegateBlockWrapper descriptionBlock](self, "descriptionBlock");
    uint64_t v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *))v9)[2](v9, v8);

    goto LABEL_5;
  }

- (id)addedBlock
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAddedBlock:(id)a3
{
}

- (id)countsBlock
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCountsBlock:(id)a3
{
}

- (id)descriptionBlock
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDescriptionBlock:(id)a3
{
}

- (id)removedBlock
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRemovedBlock:(id)a3
{
}

- (id)eventsBlock
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEventsBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end