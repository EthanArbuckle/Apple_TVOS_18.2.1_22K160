@interface PBOverlayLayoutOffsetList
- (BOOL)getValues:(double *)a3 range:(_NSRange)a4;
- (NSString)description;
- (PBOverlayLayoutOffsetList)initWithCapacity:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)count;
- (unint64_t)hash;
- (void)_maintainSortFromIndex:(unint64_t)a3;
- (void)addValue:(double)a3;
- (void)dealloc;
- (void)enumerateValuesUsingBlock:(id)a3;
@end

@implementation PBOverlayLayoutOffsetList

- (PBOverlayLayoutOffsetList)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutOffsetList;
  v4 = -[PBOverlayLayoutOffsetList init](&v10, "init");
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  unint64_t v6 = 200LL;
  if (a3 < 0xC8) {
    unint64_t v6 = a3;
  }
  v4->_capacity = v6;
  v4->_count = 0LL;
  v7 = (double *)calloc(a3, 8uLL);
  v5->_storage = v7;
  if (!v7) {
    v8 = 0LL;
  }
  else {
LABEL_5:
  }
    v8 = v5;

  return v8;
}

- (void)dealloc
{
  storage = self->_storage;
  if (storage)
  {
    free(storage);
    self->_storage = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutOffsetList;
  -[PBOverlayLayoutOffsetList dealloc](&v4, "dealloc");
}

- (void)addValue:(double)a3
{
  unint64_t count = self->_count;
  if (count && (double v6 = *self->_storage, v6 <= a3))
  {
    unint64_t v7 = 1LL;
    while ((BSFloatEqualToFloat(a3, v6) & 1) == 0)
    {
      unint64_t count = self->_count;
      if (v7 < count)
      {
        double v6 = self->_storage[v7++];
        if (v6 <= a3) {
          continue;
        }
      }

      goto LABEL_7;
    }
  }

  else
  {
LABEL_7:
    if (count >= self->_capacity)
    {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"List is full");
    }

    else
    {
      self->_unint64_t count = count + 1;
      self->_storage[count] = a3;
      -[PBOverlayLayoutOffsetList _maintainSortFromIndex:](self, "_maintainSortFromIndex:");
    }
  }

- (void)enumerateValuesUsingBlock:(id)a3
{
  objc_super v4 = (void (**)(id, unint64_t, double))a3;
  if (v4)
  {
    v5 = objc_autoreleasePoolPush();
    if (self->_count)
    {
      unint64_t v6 = 0LL;
      do
      {
        v4[2](v4, v6, self->_storage[v6]);
        ++v6;
      }

      while (v6 < self->_count);
    }

    objc_autoreleasePoolPop(v5);
  }
}

- (BOOL)getValues:(double *)a3 range:(_NSRange)a4
{
  if (!a3) {
    return 0;
  }
  if (a4.location + a4.length > self->_count) {
    return 0;
  }
  memcpy(a3, &self->_storage[a4.location], 8 * a4.length);
  return 1;
}

- (void)_maintainSortFromIndex:(unint64_t)a3
{
  if (a3)
  {
    storage = self->_storage;
    double v4 = storage[a3];
    do
    {
      v5 = &storage[a3];
      double v6 = *(v5 - 1);
      if (v6 <= v4) {
        break;
      }
      *(v5 - 1) = v4;
      storage[a3--] = v6;
    }

    while (a3);
  }

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutOffsetList descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (unint64_t)hash
{
  return self->_count - self->_capacity + 32 * self->_capacity;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutOffsetList succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutOffsetList descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000904DC;
  v9[3] = &unk_1003CFEB8;
  v9[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PBOverlayLayoutOffsetList succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  id v10 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  double v6 = v10;
  id v7 = v5;

  return v7;
}

- (unint64_t)count
{
  return self->_count;
}

@end