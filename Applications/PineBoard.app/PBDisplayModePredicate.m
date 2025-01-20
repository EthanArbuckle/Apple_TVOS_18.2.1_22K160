@interface PBDisplayModePredicate
+ (id)predicatWithDynamicRange:(int64_t)a3 frameRate:(double)a4;
+ (id)predicatesWithPreferredSDRColorMapping:(int64_t)a3 frameRate:(double)a4;
- (BOOL)isEqual:(id)a3;
- (PBDisplayModePredicate)initWithDynamicRange:(int64_t)a3 SDRColorMapping:(int64_t)a4 frameRate:(double)a5;
- (double)frameRate;
- (double)roundedFrameRate;
- (id)description;
- (int64_t)SDRColorMapping;
- (int64_t)dynamicRange;
- (unint64_t)hash;
@end

@implementation PBDisplayModePredicate

+ (id)predicatWithDynamicRange:(int64_t)a3 frameRate:(double)a4
{
  if (a3 == 538423557) {
    uint64_t v4 = 538424066LL;
  }
  else {
    uint64_t v4 = 538424319LL;
  }
  return [objc_alloc((Class)a1) initWithDynamicRange:a3 SDRColorMapping:v4 frameRate:a4];
}

+ (id)predicatesWithPreferredSDRColorMapping:(int64_t)a3 frameRate:(double)a4
{
  if (a3 == 538424319)
  {
    uint64_t v4 = (NSMutableArray *)&__NSArray0__struct;
  }

  else
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = -[PBDisplayModePredicate initWithDynamicRange:SDRColorMapping:frameRate:]( objc_alloc(&OBJC_CLASS___PBDisplayModePredicate),  "initWithDynamicRange:SDRColorMapping:frameRate:",  538423557LL,  a3,  a4);
    -[NSMutableArray addObject:](v4, "addObject:", v7);

    if (a3 != 538424066
      && (v8 = -[PBDisplayModePredicate initWithDynamicRange:SDRColorMapping:frameRate:]( objc_alloc(&OBJC_CLASS___PBDisplayModePredicate),  "initWithDynamicRange:SDRColorMapping:frameRate:",  538423557LL,  538424066LL,  a4),  -[NSMutableArray addObject:](v4, "addObject:", v8),  v8,  a3 == 538424067)
      || (v9 = -[PBDisplayModePredicate initWithDynamicRange:SDRColorMapping:frameRate:]( objc_alloc(&OBJC_CLASS___PBDisplayModePredicate),  "initWithDynamicRange:SDRColorMapping:frameRate:",  538423557LL,  538424067LL,  a4),  -[NSMutableArray addObject:](v4, "addObject:", v9),  v9,  a3 != 538424068))
    {
      v10 = -[PBDisplayModePredicate initWithDynamicRange:SDRColorMapping:frameRate:]( objc_alloc(&OBJC_CLASS___PBDisplayModePredicate),  "initWithDynamicRange:SDRColorMapping:frameRate:",  538423557LL,  538424068LL,  a4);
      -[NSMutableArray addObject:](v4, "addObject:", v10);
    }
  }

  return v4;
}

- (PBDisplayModePredicate)initWithDynamicRange:(int64_t)a3 SDRColorMapping:(int64_t)a4 frameRate:(double)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBDisplayModePredicate;
  result = -[PBDisplayModePredicate init](&v11, "init");
  if (result)
  {
    result->_dynamicRange = a3;
    BOOL v9 = a5 == 0.0 || a5 == 1.0;
    double v10 = -1.0;
    if (!v9) {
      double v10 = a5;
    }
    result->_frameRate = v10;
    result->_SDRColorMapping = a4;
  }

  return result;
}

- (double)roundedFrameRate
{
  return round(v2);
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBDisplayModePredicate;
  id v3 = -[PBDisplayModePredicate description](&v13, "description");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int64_t v5 = -[PBDisplayModePredicate dynamicRange](self, "dynamicRange");
  else {
    v6 = off_1003D40B8[v5 - 538423554];
  }
  -[PBDisplayModePredicate frameRate](self, "frameRate");
  uint64_t v8 = v7;
  int64_t v9 = -[PBDisplayModePredicate SDRColorMapping](self, "SDRColorMapping");
  else {
    double v10 = off_1003D40D8[v9 - 538424066];
  }
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, dynamicRange: %@, frameRate: %0.2f, SDRColorMapping: %@",  v4,  v6,  v8,  v10));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v5 = (PBDisplayModePredicate *)a3;
  if (self == v5)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___PBDisplayModePredicate, v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v7);

    if ((isKindOfClass & 1) != 0
      && (int64_t v9 = -[PBDisplayModePredicate dynamicRange](self, "dynamicRange"),
          v9 == (void *)-[PBDisplayModePredicate dynamicRange](v5, "dynamicRange"))
      && (-[PBDisplayModePredicate frameRate](self, "frameRate"),
          double v11 = v10,
          -[PBDisplayModePredicate frameRate](v5, "frameRate"),
          v11 == v12))
    {
      id v13 = -[PBDisplayModePredicate SDRColorMapping](self, "SDRColorMapping");
      BOOL v14 = v13 == (id)-[PBDisplayModePredicate SDRColorMapping](v5, "SDRColorMapping");
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  int64_t v3 = -[PBDisplayModePredicate dynamicRange](self, "dynamicRange");
  -[PBDisplayModePredicate frameRate](self, "frameRate");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ v3 ^ -[PBDisplayModePredicate SDRColorMapping](self, "SDRColorMapping");

  return v6;
}

- (int64_t)dynamicRange
{
  return self->_dynamicRange;
}

- (double)frameRate
{
  return self->_frameRate;
}

- (int64_t)SDRColorMapping
{
  return self->_SDRColorMapping;
}

@end