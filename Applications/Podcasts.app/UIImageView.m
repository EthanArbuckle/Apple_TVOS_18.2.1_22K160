@interface UIImageView
- (CGRect)im_focusedFrame;
@end

@implementation UIImageView

- (CGRect)im_focusedFrame
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (-[UIImageView adjustsImageWhenAncestorFocused](self, "adjustsImageWhenAncestorFocused"))
  {
    -[UIImageView frame](self, "frame");
    double v12 = v11;
    -[UIImageView frame](self, "frame");
    if (v12 == v13)
    {
      double v14 = v8 + 70.0;
      double v15 = v10 + 70.0;
      double v16 = -35.0;
      double v17 = v4 + -35.0;
    }

    else
    {
      -[UIImageView frame](self, "frame");
      double v19 = v18;
      -[UIImageView frame](self, "frame");
      double v21 = v20;
      -[UIImageView frame](self, "frame");
      if (v19 <= v21)
      {
        double v15 = v10 + 70.0;
        double Width = CGRectGetWidth(*(CGRect *)&v22);
        v47.origin.x = v4;
        v47.origin.y = v6;
        v47.size.width = v8;
        v47.size.height = v15;
        double Height = CGRectGetHeight(v47);
        -[UIImageView frame](self, "frame");
        double v14 = Width * (Height / CGRectGetHeight(v48));
        double v29 = v6 + -35.0;
        v49.origin.x = v4;
        v49.origin.y = v29;
        v49.size.width = v14;
        v49.size.height = v15;
        double v32 = CGRectGetWidth(v49);
        -[UIImageView frame](self, "frame");
        double v17 = v4 + (v32 - CGRectGetWidth(v50)) * -0.5;
        goto LABEL_8;
      }

      double v14 = v8 + 70.0;
      double v26 = CGRectGetHeight(*(CGRect *)&v22);
      v43.origin.x = v4;
      v43.origin.y = v6;
      v43.size.width = v14;
      v43.size.height = v10;
      double v27 = CGRectGetWidth(v43);
      -[UIImageView frame](self, "frame");
      double v15 = v26 * (v27 / CGRectGetWidth(v44));
      double v17 = v4 + -35.0;
      v45.origin.x = v17;
      v45.origin.y = v6;
      v45.size.width = v14;
      v45.size.height = v15;
      double v28 = CGRectGetHeight(v45);
      -[UIImageView frame](self, "frame");
      double v16 = (v28 - CGRectGetHeight(v46)) * -0.5;
    }

    double v29 = v6 + v16;
LABEL_8:
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v34 = [v33 scale];
    double v4 = UIRectIntegralWithScale(v34, v17, v29, v14, v15, v35);
    double v6 = v36;
    double v8 = v37;
    double v10 = v38;
  }

  double v39 = v4;
  double v40 = v6;
  double v41 = v8;
  double v42 = v10;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

@end