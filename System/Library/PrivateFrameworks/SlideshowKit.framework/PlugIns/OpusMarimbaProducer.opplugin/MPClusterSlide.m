@interface MPClusterSlide
- (MPClusterSlide)init;
- (NSDate)captureDate;
- (NSMutableArray)usableSlideClusters;
- (NSMutableDictionary)usageCounterPerLayer;
- (NSString)path;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)usageCountDescription;
- (int64_t)index;
- (int64_t)overallUsageCounter;
- (int64_t)referenceCounter;
- (int64_t)usageCounterForLayer:(id)a3;
- (void)dealloc;
- (void)increaseUsageCounterForLayer:(id)a3;
- (void)resetAllUsageCounters;
- (void)setCaptureDate:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setPath:(id)a3;
- (void)setReferenceCounter:(int64_t)a3;
- (void)setUsableSlideClusters:(id)a3;
- (void)setUsageCounterForLayer:(id)a3 to:(int64_t)a4;
- (void)setUsageCounterPerLayer:(id)a3;
@end

@implementation MPClusterSlide

- (MPClusterSlide)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPClusterSlide;
  v2 = -[MPClusterSlide init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->mIndex = 0LL;
    v2->mReferenceCounter = 0LL;
    v2->mUsageCounterPerLayer = 0LL;
    v2->mUsableSlideClusters = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v3;
}

- (void)dealloc
{
  self->mUsableSlideClusters = 0LL;
  self->mUsageCounterPerLayer = 0LL;

  self->mCaptureDate = 0LL;
  self->mPath = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPClusterSlide;
  -[MPClusterSlide dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  [v4 setUsableSlideClusters:self->mUsableSlideClusters];
  [v4 setCaptureDate:self->mCaptureDate];
  [v4 setReferenceCounter:self->mReferenceCounter];
  [v4 setUsageCounterPerLayer:self->mUsageCounterPerLayer];
  return v4;
}

- (void)increaseUsageCounterForLayer:(id)a3
{
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (!mUsageCounterPerLayer)
  {
    mUsageCounterPerLayer = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->mUsageCounterPerLayer = mUsageCounterPerLayer;
  }

  id v6 = -[NSMutableDictionary objectForKey:](mUsageCounterPerLayer, "objectForKey:", a3);
  if (v6)
  {
    signed int v7 = [v6 intValue];
    v8 = self->mUsageCounterPerLayer;
    v9 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7 + 1LL);
  }

  else
  {
    v8 = self->mUsageCounterPerLayer;
    v9 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
  }

  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, a3);
}

- (int64_t)usageCounterForLayer:(id)a3
{
  return (int)objc_msgSend( -[NSMutableDictionary objectForKey:](self->mUsageCounterPerLayer, "objectForKey:", a3),  "intValue");
}

- (void)setUsageCounterForLayer:(id)a3 to:(int64_t)a4
{
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (mUsageCounterPerLayer)
  {
    if (a3)
    {
LABEL_3:
      -[NSMutableDictionary setObject:forKey:]( mUsageCounterPerLayer,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4),  a3);
      return;
    }
  }

  else
  {
    mUsageCounterPerLayer = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->mUsageCounterPerLayer = mUsageCounterPerLayer;
    if (a3) {
      goto LABEL_3;
    }
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(mUsageCounterPerLayer);
        }
        -[MPClusterSlide setUsageCounterForLayer:to:]( self,  "setUsageCounterForLayer:to:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  a4);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

- (int64_t)overallUsageCounter
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = -[NSMutableDictionary allValues](self->mUsageCounterPerLayer, "allValues", 0LL);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  int64_t v5 = 0LL;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += (int)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) intValue];
    }

    id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }

  while (v4);
  return v5;
}

- (void)resetAllUsageCounters
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mUsageCounterPerLayer);
        }
        -[MPClusterSlide setUsageCounterForLayer:to:]( self,  "setUsageCounterForLayer:to:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)i),  0LL);
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

- (id)usageCountDescription
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = -[NSMutableDictionary allValues](self->mUsageCounterPerLayer, "allValues");
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = (NSMutableString *)&stru_259C60;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = +[NSMutableString stringWithString:]( NSMutableString,  "stringWithString:",  -[NSMutableString stringByAppendingFormat:]( v6,  "stringByAppendingFormat:",  @"%d:",  [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) intValue]));
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    uint64_t v6 = (NSMutableString *)&stru_259C60;
  }

  if (-[NSMutableString length](v6, "length")) {
    -[NSMutableString deleteCharactersInRange:]( v6,  "deleteCharactersInRange:",  (char *)-[NSMutableString length](v6, "length") - 1,  1LL);
  }
  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCSlide: %p fileName=%@, captureDate=%@",  self,  -[NSString lastPathComponent](self->mPath, "lastPathComponent"),  self->mCaptureDate);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPath:(id)a3
{
}

- (NSDate)captureDate
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCaptureDate:(id)a3
{
}

- (int64_t)referenceCounter
{
  return self->mReferenceCounter;
}

- (void)setReferenceCounter:(int64_t)a3
{
  self->mReferenceCounter = a3;
}

- (int64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(int64_t)a3
{
  self->mIndex = a3;
}

- (NSMutableDictionary)usageCounterPerLayer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setUsageCounterPerLayer:(id)a3
{
}

- (NSMutableArray)usableSlideClusters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUsableSlideClusters:(id)a3
{
}

@end