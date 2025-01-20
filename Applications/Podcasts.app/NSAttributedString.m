@interface NSAttributedString
- (CGRect)boundingRectWithWidth:(double)a3 lines:(unint64_t)a4;
@end

@implementation NSAttributedString

- (CGRect)boundingRectWithWidth:(double)a3 lines:(unint64_t)a4
{
  v6 = -[NSTextStorage initWithAttributedString:]( objc_alloc(&OBJC_CLASS___NSTextStorage),  "initWithAttributedString:",  self);
  v7 = objc_alloc_init(&OBJC_CLASS___NSLayoutManager);
  -[NSTextStorage addLayoutManager:](v6, "addLayoutManager:", v7);
  v8 = -[NSTextContainer initWithSize:](objc_alloc(&OBJC_CLASS___NSTextContainer), "initWithSize:", a3, 1.79769313e308);
  -[NSLayoutManager addTextContainer:](v7, "addTextContainer:", v8);
  -[NSTextContainer setMaximumNumberOfLines:](v8, "setMaximumNumberOfLines:", a4);
  uint64_t v20 = 0LL;
  v21 = (double *)&v20;
  uint64_t v22 = 0x4010000000LL;
  v23 = &unk_100203BE9;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v25 = size;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  v19[3] = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10005311C;
  v18[3] = &unk_100241F20;
  v18[4] = v19;
  v18[5] = &v20;
  v18[6] = a4;
  -[NSLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:]( v7,  "enumerateLineFragmentsForGlyphRange:usingBlock:",  0LL,  -[NSLayoutManager numberOfGlyphs](v7, "numberOfGlyphs"),  v18);
  double v10 = v21[4];
  double v11 = v21[5];
  double v12 = v21[6];
  double v13 = v21[7];
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

@end