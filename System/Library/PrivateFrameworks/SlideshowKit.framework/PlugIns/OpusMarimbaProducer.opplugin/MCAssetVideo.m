@interface MCAssetVideo
- (BOOL)isInUse;
- (NSSet)slides;
- (void)addSlide:(id)a3;
- (void)demolish;
- (void)removeSlide:(id)a3;
@end

@implementation MCAssetVideo

- (void)demolish
{
  mSlides = self->mSlides;
  if (mSlides)
  {
    -[NSMutableArray removeAllObjects](mSlides, "removeAllObjects");
  }

  self->mSlides = 0LL;
  objc_sync_exit(self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCAssetVideo;
  -[MCAsset demolish](&v4, "demolish");
}

- (BOOL)isInUse
{
  return self->mSlides != 0LL;
}

- (NSSet)slides
{
  if (self->mSlides) {
    v3 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:");
  }
  else {
    v3 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(self);
  return v3;
}

- (void)addSlide:(id)a3
{
  mSlides = self->mSlides;
  if (!mSlides)
  {
    mSlides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->mSlides = mSlides;
  }

  -[NSMutableArray addObject:](mSlides, "addObject:", a3);
  objc_sync_exit(self);
}

- (void)removeSlide:(id)a3
{
  if (!-[NSMutableArray count](self->mSlides, "count"))
  {

    self->mSlides = 0LL;
  }

  objc_sync_exit(self);
}

@end