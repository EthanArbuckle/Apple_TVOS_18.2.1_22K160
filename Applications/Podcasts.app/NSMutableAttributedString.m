@interface NSMutableAttributedString
- (void)im_addAttribute:(id)a3 value:(id)a4;
- (void)im_appendImage:(id)a3;
- (void)im_appendString:(id)a3;
- (void)im_appendString:(id)a3 attributes:(id)a4;
- (void)im_setFont:(id)a3;
- (void)im_setTextColor:(id)a3;
@end

@implementation NSMutableAttributedString

- (void)im_appendString:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "im_attributedString"));
  -[NSMutableAttributedString appendAttributedString:](self, "appendAttributedString:", v4);
}

- (void)im_appendString:(id)a3 attributes:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "im_attributedStringWithAttributes:", a4));
  -[NSMutableAttributedString appendAttributedString:](self, "appendAttributedString:", v5);
}

- (void)im_appendImage:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "im_attributedString"));
  -[NSMutableAttributedString appendAttributedString:](self, "appendAttributedString:", v4);
}

- (void)im_setFont:(id)a3
{
}

- (void)im_setTextColor:(id)a3
{
}

- (void)im_addAttribute:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NSMutableAttributedString addAttribute:value:range:]( self,  "addAttribute:value:range:",  v7,  v6,  0LL,  -[NSMutableAttributedString length](self, "length"));
}

@end