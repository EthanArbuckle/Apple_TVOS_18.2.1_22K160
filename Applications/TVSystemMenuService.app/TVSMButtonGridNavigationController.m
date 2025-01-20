@interface TVSMButtonGridNavigationController
- (PBSOverlayLayoutElementHandle)layoutElement;
- (id)tvsm_layoutElement;
- (void)setLayoutElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSMButtonGridNavigationController

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSMButtonGridNavigationController;
  -[TVSMButtonGridNavigationController viewDidLoad](&v3, "viewDidLoad");
  id v2 = -[TVSMButtonGridNavigationController view](v5, "view");
  [v2 setClipsToBounds:0];
}

- (id)tvsm_layoutElement
{
  return -[TVSMButtonGridNavigationController layoutElement](self, "layoutElement", a2, self);
}

- (PBSOverlayLayoutElementHandle)layoutElement
{
  return (PBSOverlayLayoutElementHandle *)objc_loadWeakRetained((id *)&self->_layoutElement);
}

- (void)setLayoutElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end