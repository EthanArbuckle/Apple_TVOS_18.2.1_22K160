@interface UINavigationController
- (PBSOverlayLayoutElementHandle)tvsm_layoutElement;
@end

@implementation UINavigationController

- (PBSOverlayLayoutElementHandle)tvsm_layoutElement
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSMButtonGridNavigationController);
  if ((objc_opt_isKindOfClass(self, v2) & 1) != 0) {
    return (PBSOverlayLayoutElementHandle *)-[UINavigationController layoutElement](self, "layoutElement");
  }
  else {
    return (PBSOverlayLayoutElementHandle *)0LL;
  }
}

@end