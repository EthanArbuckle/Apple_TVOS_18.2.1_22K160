@interface MPCluster
- (BOOL)clusterContainsSlideAtPath:(id)a3;
- (MPCluster)init;
- (NSMutableArray)items;
- (NSMutableDictionary)usageCounterPerLayer;
- (NSString)name;
- (double)rating;
- (double)usageCountForLayer:(id)a3;
- (id)allSlides;
- (id)allSlidesSortedByUser;
- (id)allSlidesSortedChronologically;
- (id)description;
- (id)usageCountDescription;
- (int64_t)slideCount;
- (void)addSlide:(id)a3;
- (void)dealloc;
- (void)detailedDescription;
- (void)removeAllSlides;
- (void)resetAllUsageCounters;
- (void)setItems:(id)a3;
- (void)setName:(id)a3;
- (void)setRating:(double)a3;
- (void)setUsageCountForLayer:(id)a3 to:(double)a4;
- (void)setUsageCounterPerLayer:(id)a3;
@end

@implementation MPCluster

- (MPCluster)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPCluster;
  v2 = -[MPCluster init](&v4, "init");
  if (v2)
  {
    v2->mSlides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->mRating = 0.0;
    v2->mUsageCounterPerLayer = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  self->mSlides = 0LL;
  self->mUsageCounterPerLayer = 0LL;

  self->mName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPCluster;
  -[MPCluster dealloc](&v3, "dealloc");
}

- (void)addSlide:(id)a3
{
}

- (void)removeAllSlides
{
}

- (int64_t)slideCount
{
  return (int64_t)-[NSMutableArray count](self->mSlides, "count");
}

- (id)allSlides
{
  return self->mSlides;
}

- (id)allSlidesSortedByUser
{
  return -[NSMutableArray sortedArrayUsingFunction:context:]( self->mSlides,  "sortedArrayUsingFunction:context:",  sortSlidesByUserDefinedOrder1,  0LL);
}

- (BOOL)clusterContainsSlideAtPath:(id)a3
{
  return 0;
}

- (id)allSlidesSortedChronologically
{
  char v3 = 1;
  return objc_msgSend( -[MPCluster allSlides](self, "allSlides"),  "sortedArrayUsingFunction:context:",  sortSlidesByCaptureDate1,  &v3);
}

- (void)setUsageCountForLayer:(id)a3 to:(double)a4
{
  double v4 = a4;
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (mUsageCounterPerLayer)
  {
    if (a3)
    {
LABEL_3:
      *(float *)&a4 = v4;
      -[NSMutableDictionary setObject:forKey:]( mUsageCounterPerLayer,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", a4),  a3);
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
        -[MPCluster setUsageCountForLayer:to:]( self,  "setUsageCountForLayer:to:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  v4);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

- (double)usageCountForLayer:(id)a3
{
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (mUsageCounterPerLayer)
  {
    if (a3)
    {
LABEL_3:
      objc_msgSend(-[NSMutableDictionary valueForKey:](mUsageCounterPerLayer, "valueForKey:", a3), "floatValue");
      return v6;
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

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (!v8) {
    return 0.0;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v15;
  double v7 = 0.0;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(mUsageCounterPerLayer);
      }
      objc_msgSend( -[NSMutableDictionary valueForKey:]( self->mUsageCounterPerLayer,  "valueForKey:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)i)),  "floatValue");
      double v7 = v7 + v12;
    }

    id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  }

  while (v9);
  return v7;
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
        -[MPCluster setUsageCountForLayer:to:]( self,  "setUsageCountForLayer:to:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)i),  0.0);
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mUsageCounterPerLayer,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

- (id)usageCountDescription
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = -[NSMutableDictionary allValues](self->mUsageCounterPerLayer, "allValues");
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = (NSMutableString *)&stru_259C60;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) floatValue];
        uint64_t v6 = +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  -[NSMutableString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"%.2f:", v8));
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
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

- (void)detailedDescription
{
  NSLog( @"name: %@ usageCount = (%@), slide count = %d",  -[MPCluster name](self, "name"),  -[MPCluster usageCountDescription](self, "usageCountDescription"),  -[MPCluster slideCount](self, "slideCount"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = -[MPCluster allSlides](self, "allSlides");
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v10;
    do
    {
      float v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        NSLog( @"             slide[%d]:  usageCount = (%@), fileName: %@",  (char *)v8 + v6,  [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) usageCountDescription],  objc_msgSend(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "path"), "lastPathComponent"));
        float v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = (v6 + (_DWORD)v8);
    }

    while (v5);
  }

  NSLog(@"-------------------");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCCluster: %p name=%@, rating=%.1f, usageCount = (%@), #slides=%d",  self,  self->mName,  *(void *)&self->mRating,  -[MPCluster usageCountDescription](self, "usageCountDescription"),  -[MPCluster slideCount](self, "slideCount"));
}

- (NSMutableArray)items
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setItems:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

- (double)rating
{
  return self->mRating;
}

- (void)setRating:(double)a3
{
  self->mRating = a3;
}

- (NSMutableDictionary)usageCounterPerLayer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUsageCounterPerLayer:(id)a3
{
}

@end