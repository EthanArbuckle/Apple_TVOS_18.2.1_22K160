@interface MXMTargetQueue
- (BOOL)add:(double)a3;
- (BOOL)checkQuiesced:(double)a3;
- (BOOL)full;
- (BOOL)majorityHalfTargetsHit;
- (BOOL)majorityTargetsHit;
- (MXMTargetQueue)init;
- (NSMutableArray)queue;
- (double)average;
- (double)target;
- (int64_t)halfTargetHits;
- (int64_t)size;
- (int64_t)targetHits;
- (int64_t)total;
- (void)setHalfTargetHits:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setTarget:(double)a3;
- (void)setTargetHits:(int64_t)a3;
- (void)setTotal:(int64_t)a3;
@end

@implementation MXMTargetQueue

- (MXMTargetQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MXMTargetQueue;
  v2 = -[MXMTargetQueue init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MXMTargetQueue setSize:](v2, "setSize:", 8LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[MXMTargetQueue size](v3, "size")));
    -[MXMTargetQueue setQueue:](v3, "setQueue:", v4);

    -[MXMTargetQueue setTotal:](v3, "setTotal:", 0LL);
    -[MXMTargetQueue setTarget:](v3, "setTarget:", 0.0);
    -[MXMTargetQueue setTargetHits:](v3, "setTargetHits:", 0LL);
    -[MXMTargetQueue setHalfTargetHits:](v3, "setHalfTargetHits:", 0LL);
  }

  return v3;
}

- (BOOL)add:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MXMTargetQueue queue](self, "queue"));
  id v6 = [v5 count];

  if ((double)-[MXMTargetQueue size](self, "size") * 0.5 <= (double)(uint64_t)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MXMTargetQueue queue](self, "queue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:(unint64_t)((double)(uint64_t)v6 * 0.5)]);
    [v8 doubleValue];
    double v10 = v9;

    -[MXMTargetQueue target](self, "target");
    if (v10 >= v11) {
      -[MXMTargetQueue setHalfTargetHits:]( self,  "setHalfTargetHits:",  (char *)-[MXMTargetQueue halfTargetHits](self, "halfTargetHits") - 1);
    }
  }

  if (-[MXMTargetQueue full](self, "full"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MXMTargetQueue queue](self, "queue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);
    [v13 doubleValue];
    double v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MXMTargetQueue queue](self, "queue"));
    [v16 removeObjectAtIndex:0];

    -[MXMTargetQueue setTotal:](self, "setTotal:", (uint64_t)((double)-[MXMTargetQueue total](self, "total") - v15));
    -[MXMTargetQueue target](self, "target");
    if (v15 >= v17) {
      -[MXMTargetQueue setTargetHits:]( self,  "setTargetHits:",  (char *)-[MXMTargetQueue targetHits](self, "targetHits") - 1);
    }
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MXMTargetQueue queue](self, "queue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  [v18 addObject:v19];

  -[MXMTargetQueue setTotal:](self, "setTotal:", (uint64_t)((double)-[MXMTargetQueue total](self, "total") + a3));
  -[MXMTargetQueue target](self, "target");
  double v21 = v20;
  if (v20 <= a3)
  {
    -[MXMTargetQueue setTargetHits:]( self,  "setTargetHits:",  (char *)-[MXMTargetQueue targetHits](self, "targetHits") + 1);
    -[MXMTargetQueue setHalfTargetHits:]( self,  "setHalfTargetHits:",  (char *)-[MXMTargetQueue halfTargetHits](self, "halfTargetHits") + 1);
  }

  return v21 <= a3;
}

- (BOOL)full
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MXMTargetQueue queue](self, "queue"));
  id v4 = [v3 count];
  LOBYTE(v2) = v4 == (id)-[MXMTargetQueue size](v2, "size");

  return (char)v2;
}

- (double)average
{
  double v3 = (double)-[MXMTargetQueue total](self, "total");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MXMTargetQueue queue](self, "queue"));
  double v5 = v3 / (double)(unint64_t)[v4 count];

  return v5;
}

- (BOOL)majorityTargetsHit
{
  double v3 = (double)-[MXMTargetQueue targetHits](self, "targetHits");
  return (double)-[MXMTargetQueue size](self, "size") * 0.5 <= v3;
}

- (BOOL)majorityHalfTargetsHit
{
  double v3 = (double)-[MXMTargetQueue halfTargetHits](self, "halfTargetHits");
  return (double)-[MXMTargetQueue size](self, "size") * 0.25 <= v3;
}

- (BOOL)checkQuiesced:(double)a3
{
  if (-[MXMTargetQueue majorityHalfTargetsHit](self, "majorityHalfTargetsHit"))
  {
    if (-[MXMTargetQueue majorityTargetsHit](self, "majorityTargetsHit"))
    {
      BOOL v5 = 1;
    }

    else
    {
      -[MXMTargetQueue average](self, "average");
      double v7 = v6;
      -[MXMTargetQueue target](self, "target");
      BOOL v5 = v7 <= v8;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  double v9 = (double)-[MXMTargetQueue size](self, "size");
  unsigned int v10 = -[MXMTargetQueue full](self, "full") && v5;
  if (v9 <= a3) {
    return v10;
  }
  else {
    return 0;
  }
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)total
{
  return self->_total;
}

- (void)setTotal:(int64_t)a3
{
  self->_total = a3;
}

- (double)target
{
  return self->_target;
}

- (void)setTarget:(double)a3
{
  self->_target = a3;
}

- (int64_t)targetHits
{
  return self->_targetHits;
}

- (void)setTargetHits:(int64_t)a3
{
  self->_targetHits = a3;
}

- (int64_t)halfTargetHits
{
  return self->_halfTargetHits;
}

- (void)setHalfTargetHits:(int64_t)a3
{
  self->_halfTargetHits = a3;
}

- (void).cxx_destruct
{
}

@end