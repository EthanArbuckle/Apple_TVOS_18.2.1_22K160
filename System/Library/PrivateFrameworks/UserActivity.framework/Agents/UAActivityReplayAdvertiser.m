@interface UAActivityReplayAdvertiser
- (BOOL)advertising;
- (UAUserActivityInfo)advertisedItem;
- (id)advertisableItems;
- (void)setAdvertisableItems:(id)a3;
- (void)setAdvertisedItem:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation UAActivityReplayAdvertiser

- (id)advertisableItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplayAdvertiser advertisedItem](self, "advertisedItem"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplayAdvertiser advertisedItem](self, "advertisedItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)advertising
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplayAdvertiser advertisedItem](self, "advertisedItem"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)setAdvertisableItems:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v6) {
    id v5 = [v6 copy];
  }
  else {
    id v5 = 0LL;
  }
  objc_storeStrong((id *)(&v4->super._shouldAdvertiseAutoPullActivityList + 1), v5);
  if (v6) {

  }
  objc_sync_exit(v4);
}

- (void)setItem:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v4 scheduleUpdatingAdvertisableItems];
}

- (UAUserActivityInfo)advertisedItem
{
  return (UAUserActivityInfo *)objc_getProperty(self, a2, 57LL, 1);
}

- (void)setAdvertisedItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end