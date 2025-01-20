@interface TVSSBannerInternalPillContentView
- (UILayoutGuide)transitionEdgeLayoutGuide;
- (unint64_t)contentLayoutMode;
- (void)setContentLayoutMode:(unint64_t)a3;
@end

@implementation TVSSBannerInternalPillContentView

- (UILayoutGuide)transitionEdgeLayoutGuide
{
  return self->transitionEdgeLayoutGuide;
}

- (unint64_t)contentLayoutMode
{
  return self->contentLayoutMode;
}

- (void)setContentLayoutMode:(unint64_t)a3
{
  self->contentLayoutMode = a3;
}

- (void).cxx_destruct
{
}

@end