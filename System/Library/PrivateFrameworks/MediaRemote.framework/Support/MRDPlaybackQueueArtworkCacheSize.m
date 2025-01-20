@interface MRDPlaybackQueueArtworkCacheSize
+ (MRDPlaybackQueueArtworkCacheSize)defaultSize;
- (BOOL)isEqual:(id)a3;
- (MRDPlaybackQueueArtworkCacheSize)initWithW:(double)a3 h:(double)a4;
- (double)h;
- (double)w;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation MRDPlaybackQueueArtworkCacheSize

- (MRDPlaybackQueueArtworkCacheSize)initWithW:(double)a3 h:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRDPlaybackQueueArtworkCacheSize;
  result = -[MRDPlaybackQueueArtworkCacheSize init](&v7, "init");
  if (result)
  {
    result->_w = a3;
    result->_h = a4;
  }

  return result;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lf x %lf",  *(void *)&self->_w,  *(void *)&self->_h);
}

- (BOOL)isEqual:(id)a3
{
  return vabdd_f64(self->_w, *((double *)a3 + 1)) < 0.1 && vabdd_f64(self->_h, *((double *)a3 + 2)) < 0.1;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_w * self->_h);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___MRDPlaybackQueueArtworkCacheSize);
  -[MRDPlaybackQueueArtworkCacheSize w](self, "w");
  double v6 = v5;
  -[MRDPlaybackQueueArtworkCacheSize h](self, "h");
  return -[MRDPlaybackQueueArtworkCacheSize initWithW:h:](v4, "initWithW:h:", v6, v7);
}

+ (MRDPlaybackQueueArtworkCacheSize)defaultSize
{
  if (qword_1003FE070 != -1) {
    dispatch_once(&qword_1003FE070, &stru_1003A1AA0);
  }
  return (MRDPlaybackQueueArtworkCacheSize *)(id)qword_1003FE068;
}

- (int64_t)compare:(id)a3
{
  else {
    return -1LL;
  }
}

- (double)w
{
  return self->_w;
}

- (double)h
{
  return self->_h;
}

@end