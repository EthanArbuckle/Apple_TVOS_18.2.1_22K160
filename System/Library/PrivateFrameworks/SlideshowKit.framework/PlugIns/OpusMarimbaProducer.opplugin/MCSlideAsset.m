@interface MCSlideAsset
- (MCAssetVideo)asset;
- (MCSlideAsset)init;
- (NSString)kenBurnsType;
- (id)description;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setKenBurnsType:(id)a3;
@end

@implementation MCSlideAsset

- (MCSlideAsset)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCSlideAsset;
  result = -[MCSlideAsset init](&v8, "init");
  if (result)
  {
    __asm { FMOV            V0.2D, #0.5 }

    result->center = _Q0;
    result->scale = 1.0;
  }

  return result;
}

- (void)dealloc
{
  self->_asset = 0LL;
  self->_kenBurnsType = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCSlideAsset;
  -[MCSlideAsset dealloc](&v3, "dealloc");
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCSlideAsset;
  return objc_msgSend( -[MCSlideAsset description](&v3, "description"),  "stringByAppendingFormat:",  @" path='%@', kenBurnsType='%@', center=(%f,%f), scale=%f, rotation=%f",  -[MCAsset path](self->_asset, "path"),  self->_kenBurnsType,  *(void *)&self->center.x,  *(void *)&self->center.y,  *(void *)&self->scale,  *(void *)&self->rotation);
}

- (MCAssetVideo)asset
{
  return (MCAssetVideo *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAsset:(id)a3
{
}

- (NSString)kenBurnsType
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setKenBurnsType:(id)a3
{
}

@end