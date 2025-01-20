@interface GEOAPQueueElem
- (GEOAPQueueElem)init;
- (NSDate)createTime;
- (void)dealloc;
@end

@implementation GEOAPQueueElem

- (GEOAPQueueElem)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GEOAPQueueElem;
  v2 = -[GEOAPQueueElem init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = _GEOCreateTransaction("com.apple.geo.InMemoryQueueElem");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    id dirty = v2->_dirty;
    v2->_id dirty = (id)v4;
  }

  return v2;
}

- (void)dealloc
{
  id dirty = self->_dirty;
  self->_id dirty = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEOAPQueueElem;
  -[GEOAPQueueElem dealloc](&v4, "dealloc");
}

- (NSDate)createTime
{
  return self->_createTime;
}

- (void).cxx_destruct
{
}

@end