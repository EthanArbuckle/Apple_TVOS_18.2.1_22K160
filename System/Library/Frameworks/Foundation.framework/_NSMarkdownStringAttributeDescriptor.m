@interface _NSMarkdownStringAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSMarkdownStringAttributeDescriptor

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)attributeValueFromValue:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSAttributedStringMarkdownParsingOptions);
  -[NSAttributedStringMarkdownParsingOptions setInterpretedSyntax:](v4, "setInterpretedSyntax:", 2LL);
  v5 = -[NSAttributedString initWithMarkdownString:options:baseURL:error:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithMarkdownString:options:baseURL:error:",  a3,  v4,  0LL,  0LL);

  return v5;
}

@end