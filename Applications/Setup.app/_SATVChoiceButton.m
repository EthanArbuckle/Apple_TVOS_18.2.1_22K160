@interface _SATVChoiceButton
- (CGSize)sizeThatFits:(CGSize)a3;
@end

@implementation _SATVChoiceButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = fmax(a3.width + -80.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVChoiceButton titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "sizeThatFits:", v5, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v10 + 28.0;
  double v12 = v8 + 80.0;
  if (width < v8 + 80.0) {
    double v12 = width;
  }
  result.double height = v11;
  result.double width = v12;
  return result;
}

@end