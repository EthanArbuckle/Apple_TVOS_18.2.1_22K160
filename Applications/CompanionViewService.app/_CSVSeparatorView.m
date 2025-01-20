@interface _CSVSeparatorView
- (_CSVSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation _CSVSeparatorView

- (_CSVSeparatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____CSVSeparatorView;
  v3 = -[_CSVSeparatorView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](&OBJC_CLASS___UIColor, "separatorColor"));
    -[_CSVSeparatorView setBackgroundColor:](v3, "setBackgroundColor:", v4);
  }

  return v3;
}

@end