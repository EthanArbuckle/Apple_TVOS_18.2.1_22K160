@interface UAReplayClientController
- (UAReplayClientController)initWithManager:(id)a3;
- (UAUserActivityInfo)item;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)statusString;
- (id)userActivityInfoForUUID:(id)a3;
- (void)addItem:(id)a3;
- (void)dealloc;
- (void)removeItem:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation UAReplayClientController

- (UAReplayClientController)initWithManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UAReplayClientController;
  return -[UAClientController initWithManager:name:](&v4, "initWithManager:name:", a3, @"ReplayCreator");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v3 scheduleUpdatingAdvertisableItems:0.0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UAReplayClientController;
  -[UAReplayClientController dealloc](&v4, "dealloc");
}

- (void)addItem:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
  [v4 scheduleUpdatingAdvertisableItems];
}

- (void)removeItem:(id)a3
{
  id v10 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  v5 = v10;
  if (v4 == v10) {
    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  unsigned __int8 v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    -[UAReplayClientController setItem:](self, "setItem:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
    [v5 scheduleUpdatingAdvertisableItems:0.0];
LABEL_4:
  }
}

- (id)items
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  unsigned int v9 = [v4 isEqual:v8];

  if (v9) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  }
  else {
LABEL_5:
  }
    id v10 = 0LL;

  return v10;
}

- (id)statusString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAReplayClientController item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ReplayController: ITEM=%@\n",  v2));

  return v3;
}

- (UAUserActivityInfo)item
{
  return (UAUserActivityInfo *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end