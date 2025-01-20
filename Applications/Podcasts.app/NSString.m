@interface NSString
- (id)im_attributedString;
- (id)im_attributedStringWithAttributes:(id)a3;
- (id)im_attributedStringWithFont:(id)a3;
- (id)im_attributedStringWithFont:(id)a3 textColor:(id)a4;
- (id)im_attributedStringWithTextColor:(id)a3;
@end

@implementation NSString

- (id)im_attributedString
{
  return -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", self);
}

- (id)im_attributedStringWithFont:(id)a3
{
  return -[NSString im_attributedStringWithFont:textColor:](self, "im_attributedStringWithFont:textColor:", a3, 0LL);
}

- (id)im_attributedStringWithTextColor:(id)a3
{
  return -[NSString im_attributedStringWithFont:textColor:](self, "im_attributedStringWithFont:textColor:", 0LL, a3);
}

- (id)im_attributedStringWithFont:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  v9 = v8;
  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v6, NSFontAttributeName);
  }
  if (v7) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v7,  NSForegroundColorAttributeName);
  }
  id v10 = -[NSMutableDictionary copy](v9, "copy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSString im_attributedStringWithAttributes:](self, "im_attributedStringWithAttributes:", v10));

  return v11;
}

- (id)im_attributedStringWithAttributes:(id)a3
{
  id v4 = a3;
  v5 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  self,  v4);

  return v5;
}

@end