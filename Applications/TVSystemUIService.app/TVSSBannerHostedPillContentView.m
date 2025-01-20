@interface TVSSBannerHostedPillContentView
- (UILayoutGuide)transitionEdgeLayoutGuide;
- (unint64_t)contentLayoutMode;
- (void)setContentLayoutMode:(unint64_t)a3;
@end

@implementation TVSSBannerHostedPillContentView

- (UILayoutGuide)transitionEdgeLayoutGuide
{
  return self->_transitionEdgeLayoutGuide;
}

- (unint64_t)contentLayoutMode
{
  return self->_contentLayoutMode;
}

- (void)setContentLayoutMode:(unint64_t)a3
{
  self->_contentLayoutMode = a3;
}

- (void).cxx_destruct
{
}

@end