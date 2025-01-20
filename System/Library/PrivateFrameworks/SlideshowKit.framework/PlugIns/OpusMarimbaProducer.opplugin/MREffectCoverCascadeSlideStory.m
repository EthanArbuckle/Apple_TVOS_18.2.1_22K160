@interface MREffectCoverCascadeSlideStory
- (MREffectCoverCascadeSlideStory)initWithSlideIndex:(unint64_t)a3 x:(unint64_t)a4 y:(unint64_t)a5 birthType:(unint64_t)a6 birthStart:(double)a7 birthDuration:(double)a8;
- (void)dealloc;
@end

@implementation MREffectCoverCascadeSlideStory

- (MREffectCoverCascadeSlideStory)initWithSlideIndex:(unint64_t)a3 x:(unint64_t)a4 y:(unint64_t)a5 birthType:(unint64_t)a6 birthStart:(double)a7 birthDuration:(double)a8
{
  unsigned __int8 v10 = a6;
  unsigned __int8 v11 = a5;
  unsigned __int8 v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MREffectCoverCascadeSlideStory;
  v14 = -[MREffectCoverCascadeSlideStory init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->slideIndex = a3;
    v14->slideID = (NSString *)-[NSString copy](ImageKey(a3), "copy");
    v15->x = v12;
    v15->y = v11;
    v15->birthType = v10;
    v15->birthStart = a7;
    v15->birthDuration = a8;
    *(_OWORD *)&v15->deathStart = xmmword_1FA310;
  }

  return v15;
}

- (void)dealloc
{
  self->slideID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectCoverCascadeSlideStory;
  -[MREffectCoverCascadeSlideStory dealloc](&v3, "dealloc");
}

@end