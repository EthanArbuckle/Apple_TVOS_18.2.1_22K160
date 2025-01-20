@interface BKTouchDestination
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)appendSuccinctDescriptionToFormatter:(id)a3;
@end

@implementation BKTouchDestination

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BKTouchDestination;
  id v4 = -[BKCAContextDestination copyWithZone:](&v7, "copyWithZone:", a3);
  *((void *)v4 + 4) = self->_predicate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchStream);
  objc_storeWeak((id *)v4 + 5, WeakRetained);

  return v4;
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  self);
}

- (void)appendSuccinctDescriptionToFormatter:(id)a3
{
  unint64_t predicate = self->_predicate;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v7 = v6;
  if ((predicate & 1) == 0)
  {
    if ((predicate & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    -[NSMutableArray addObject:](v7, "addObject:", @"touchStream");
    if ((predicate & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  -[NSMutableArray addObject:](v6, "addObject:", @"hitTest");
  if ((predicate & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((predicate & 4) != 0) {
LABEL_4:
  }
    -[NSMutableArray addObject:](v7, "addObject:", @"filterDetachedTouches");
LABEL_5:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v7, "componentsJoinedByString:", @"|"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v8));

  [a3 appendString:v9 withName:0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BKTouchDestination;
  -[BKCAContextDestination appendSuccinctDescriptionToFormatter:](&v10, "appendSuccinctDescriptionToFormatter:", a3);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10006AF2C;
  v3[3] = &unk_1000B8030;
  v3[4] = self;
  v3[5] = a3;
  [a3 appendProem:self block:v3];
}

- (void).cxx_destruct
{
}

@end