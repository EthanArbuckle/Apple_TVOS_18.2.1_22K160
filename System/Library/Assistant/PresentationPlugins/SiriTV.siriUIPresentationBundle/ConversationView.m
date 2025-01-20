@interface ConversationView
- (CGSize)intrinsicContentSize;
- (void)updateSnippetContainerViewSize:(CGSize)a3;
@end

@implementation ConversationView

- (void)updateSnippetContainerViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_26EE0((uint64_t)v5, width, height);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_2713C();
  double v4 = v3;

  double v5 = 0.0;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

@end