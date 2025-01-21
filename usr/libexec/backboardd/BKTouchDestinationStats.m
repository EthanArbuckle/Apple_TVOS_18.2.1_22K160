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
  v8.super_class = [BKTouchDestinationStats class];
  BKTouchDestinationStats *v2 = [[BKTouchDestinationStats alloc] init];
  if (v2)
  {
    NSMutableIndexSet *v3 = [[NSMutableIndexSet alloc] init];
    pathIndexes = v2->_pathIndexes;
    v2->_pathIndexes = v3;

    NSMutableIndexSet *v5 = [[NSMutableIndexSet alloc] init];
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