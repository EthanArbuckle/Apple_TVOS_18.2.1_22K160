@interface _DASPredictionAccuracy
+ (id)initFromDictionaryRepresentation:(id)a3;
- (_DASPredictionAccuracy)init;
- (id)accuracyRate;
- (id)addPredictionAccuracy:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)top10Hits;
- (int)top1Hits;
- (int)top3Hits;
- (int)top5Hits;
- (int)totalPredictionIntervals;
- (void)setTop10Hits:(int)a3;
- (void)setTop1Hits:(int)a3;
- (void)setTop3Hits:(int)a3;
- (void)setTop5Hits:(int)a3;
- (void)setTotalPredictionIntervals:(int)a3;
@end

@implementation _DASPredictionAccuracy

- (_DASPredictionAccuracy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____DASPredictionAccuracy;
  result = -[_DASPredictionAccuracy init](&v3, "init");
  if (result)
  {
    *(void *)&result->_top1Hits = 0LL;
    *(void *)&result->_top5Hits = 0LL;
    result->_totalPredictionIntervals = 0;
  }

  return result;
}

- (id)addPredictionAccuracy:(id)a3
{
  v5 = &OBJC_CLASS____DASPredictionAccuracy;
  id v6 = a3;
  v7 = -[__objc2_class init](v5, "init");
  -[__objc2_class setTop1Hits:]( v7,  "setTop1Hits:",  [v6 top1Hits] + -[_DASPredictionAccuracy top1Hits](self, "top1Hits"));
  -[__objc2_class setTop3Hits:]( v7,  "setTop3Hits:",  [v6 top3Hits] + -[_DASPredictionAccuracy top3Hits](self, "top3Hits"));
  -[__objc2_class setTop5Hits:]( v7,  "setTop5Hits:",  [v6 top5Hits] + -[_DASPredictionAccuracy top5Hits](self, "top5Hits"));
  -[__objc2_class setTop10Hits:]( v7,  "setTop10Hits:",  [v6 top10Hits] + -[_DASPredictionAccuracy top10Hits](self, "top10Hits"));
  LODWORD(self) = -[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals");
  LODWORD(v5) = [v6 totalPredictionIntervals];

  -[__objc2_class setTotalPredictionIntervals:]( v7,  "setTotalPredictionIntervals:",  ((_DWORD)v5 + (_DWORD)self));
  return v7;
}

+ (id)initFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____DASPredictionAccuracy);
  v5 = v4;
  if (v3 && v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"1"]);
    -[_DASPredictionAccuracy setTop1Hits:](v5, "setTop1Hits:", [v6 intValue]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"3"]);
    -[_DASPredictionAccuracy setTop3Hits:](v5, "setTop3Hits:", [v7 intValue]);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"5"]);
    -[_DASPredictionAccuracy setTop5Hits:](v5, "setTop5Hits:", [v8 intValue]);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"10"]);
    -[_DASPredictionAccuracy setTop10Hits:](v5, "setTop10Hits:", [v9 intValue]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"predictionIntervals"]);
    -[_DASPredictionAccuracy setTotalPredictionIntervals:]( v5,  "setTotalPredictionIntervals:",  [v10 intValue]);
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_top1Hits));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"1");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_top3Hits));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"3");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_top5Hits));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"5");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_top10Hits));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"10");

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_totalPredictionIntervals));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"predictionIntervals");

  return v3;
}

- (id)accuracyRate
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (-[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals") < 1)
  {
    v8 = 0LL;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)-[_DASPredictionAccuracy top1Hits](self, "top1Hits")
                   / (double)-[_DASPredictionAccuracy totalPredictionIntervals](self, "totalPredictionIntervals")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"top1");

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)-[_DASPredictionAccuracy top3Hits](self, "top3Hits")
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"top3");

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)-[_DASPredictionAccuracy top5Hits](self, "top5Hits")
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"top5");

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)-[_DASPredictionAccuracy top10Hits](self, "top10Hits")
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"top10");

    v8 = v3;
  }

  return v8;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPredictionAccuracy dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (int)top1Hits
{
  return self->_top1Hits;
}

- (void)setTop1Hits:(int)a3
{
  self->_top1Hits = a3;
}

- (int)top3Hits
{
  return self->_top3Hits;
}

- (void)setTop3Hits:(int)a3
{
  self->_top3Hits = a3;
}

- (int)top5Hits
{
  return self->_top5Hits;
}

- (void)setTop5Hits:(int)a3
{
  self->_top5Hits = a3;
}

- (int)top10Hits
{
  return self->_top10Hits;
}

- (void)setTop10Hits:(int)a3
{
  self->_top10Hits = a3;
}

- (int)totalPredictionIntervals
{
  return self->_totalPredictionIntervals;
}

- (void)setTotalPredictionIntervals:(int)a3
{
  self->_totalPredictionIntervals = a3;
}

@end