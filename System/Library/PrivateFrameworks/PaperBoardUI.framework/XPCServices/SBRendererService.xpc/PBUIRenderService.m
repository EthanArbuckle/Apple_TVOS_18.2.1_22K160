@interface PBUIRenderService
- (PBUIRenderService)init;
- (PBUIRenderer)renderer;
- (void)checkinWithReply:(id)a3;
- (void)fetchColorSpaceNameWithReply:(id)a3;
- (void)renderRequest:(id)a3 reply:(id)a4;
- (void)service_warmup:(id)a3;
- (void)setRenderer:(id)a3;
@end

@implementation PBUIRenderService

- (PBUIRenderService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBUIRenderService;
  v2 = -[PBUIRenderService init](&v10, "init");
  if (v2)
  {
    int v3 = MGGetBoolAnswer(@"Aixt/MEN2O2B7f+8m4TxUA");
    v4 = &kCGColorSpaceExtendedSRGB;
    if (!v3) {
      v4 = &kCGColorSpaceSRGB;
    }
    v5 = (__CFString *)*v4;
    v6 = CGColorSpaceCreateWithName(*v4);
    objc_storeStrong((id *)&v2->_colorSpaceName, v5);
    id v7 = [[PBUICALocalRenderer alloc] initWithColorSpace:v6];
    [v7 setIdentifier:@"PBUIRenderService"];
    renderer = v2->_renderer;
    v2->_renderer = (PBUIRenderer *)v7;

    CGColorSpaceRelease(v6);
  }

  return v2;
}

- (void)fetchColorSpaceNameWithReply:(id)a3
{
}

- (void)renderRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBUIRenderService renderer](self, "renderer"));
  id v12 = 0LL;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 renderRequest:v6 error:&v12]);
  id v11 = v12;

  CABackingStoreCollectBlocking();
  CARenderCollect(1LL);
  v7[2](v7, v10, v11);

  objc_autoreleasePoolPop(v8);
}

- (void)checkinWithReply:(id)a3
{
}

- (void)service_warmup:(id)a3
{
}

- (PBUIRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end