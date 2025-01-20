@interface BKTouchDestinationStats
- (BKTouchDestinationStats)init;
- (NSMutableIndexSet)pathIndexes;
- (NSMutableIndexSet)touchIdentifiers;
- (NSString)processDescription;
- (void)setPathIndexes:(id)a3;
- (void)setProcessDescription:(id)a3;
- (void)setTouchIdentifiers:(id)a3;
@end

@implementation BKTouchDestinationStats

- (BKTouchDestinationStats)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BKTouchDestinationStats;
  v2 = -[BKTouchDestinationStats init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    pathIndexes = v2->_pathIndexes;
    v2->_pathIndexes = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    touchIdentifiers = v2->_touchIdentifiers;
    v2->_touchIdentifiers = v5;
  }

  return v2;
}

- (NSMutableIndexSet)pathIndexes
{
  return self->_pathIndexes;
}

- (void)setPathIndexes:(id)a3
{
}

- (NSMutableIndexSet)touchIdentifiers
{
  return self->_touchIdentifiers;
}

- (void)setTouchIdentifiers:(id)a3
{
}

- (NSString)processDescription
{
  return self->_processDescription;
}

- (void)setProcessDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end