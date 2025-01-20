@interface UIFont
- (id)tvsb_fontWithWeight:(double)a3;
@end

@implementation UIFont

- (id)tvsb_fontWithWeight:(double)a3
{
  v12 = self;
  SEL v11 = a2;
  double v10 = a3;
  v7 = -[UIFont fontDescriptor](self, "fontDescriptor");
  UIFontDescriptorAttributeName v15 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v13 = UIFontWeightTrait;
  v6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10);
  v14 = v6;
  v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13);
  v16 = v5;
  v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL);
  v9 = -[UIFontDescriptor fontDescriptorByAddingAttributes:](v7, "fontDescriptorByAddingAttributes:");

  v8 = +[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v9, 0.0);
  objc_storeStrong((id *)&v9, 0LL);
  return v8;
}

@end