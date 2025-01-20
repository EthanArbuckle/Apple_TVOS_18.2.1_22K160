@interface MRReflectionsRenderable
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
- (MRReflectionsRenderable)initWithSlide:(id)a3 sprite:(id)a4 modelViewMatrix:(const float *)a5 position:(CGPoint)a6 size:(CGSize)a7 flipped:(BOOL)a8 isShadow:(BOOL)a9 isBreak:(BOOL)a10;
- (void)dealloc;
- (void)purge;
@end

@implementation MRReflectionsRenderable

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return ($C3997F145DA9CFB88D7C332041F986CA *)&unk_2B0680;
}

- (MRReflectionsRenderable)initWithSlide:(id)a3 sprite:(id)a4 modelViewMatrix:(const float *)a5 position:(CGPoint)a6 size:(CGSize)a7 flipped:(BOOL)a8 isShadow:(BOOL)a9 isBreak:(BOOL)a10
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MRReflectionsRenderable;
  v20 = -[MRReflectionsRenderable init](&v25, "init");
  if (v20)
  {
    v20->_slide = (MRImage *)[a3 retainByUser];
    v20->_sprite = (MRCroppingSprite *)a4;
    __int128 v21 = *((_OWORD *)a5 + 3);
    __int128 v23 = *(_OWORD *)a5;
    __int128 v22 = *((_OWORD *)a5 + 1);
    *(_OWORD *)&v20->_modelViewMatrix[8] = *((_OWORD *)a5 + 2);
    *(_OWORD *)&v20->_modelViewMatrix[12] = v21;
    *(_OWORD *)v20->_modelViewMatriCGFloat x = v23;
    *(_OWORD *)&v20->_modelViewMatrix[4] = v22;
    v20->position.CGFloat x = x;
    v20->position.CGFloat y = y;
    v20->size.CGFloat width = width;
    v20->size.CGFloat height = height;
    v20->isShadow = a9;
    v20->needsFlipped = a8;
    v20->isBreak = a10;
  }

  return v20;
}

- (void)purge
{
  self->next = 0LL;
  -[MRImage releaseByUser](self->_slide, "releaseByUser");
  self->_slide = 0LL;

  self->_sprite = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRReflectionsRenderable;
  -[MRReflectionsRenderable dealloc](&v3, "dealloc");
}

@end