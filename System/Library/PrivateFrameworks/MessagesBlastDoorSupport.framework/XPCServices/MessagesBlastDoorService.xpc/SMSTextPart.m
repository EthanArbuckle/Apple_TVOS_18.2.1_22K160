@interface SMSTextPart
- (NSString)contentLocation;
- (NSString)text;
- (SMSTextPart)initWithContentLocation:(id)a3;
- (void)appendText:(id)a3;
@end

@implementation SMSTextPart

- (SMSTextPart)initWithContentLocation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SMSTextPart;
  v5 = -[SMSTextPart init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    contentLocation = v5->_contentLocation;
    v5->_contentLocation = v6;
  }

  return v5;
}

- (void)appendText:(id)a3
{
  text = self->_text;
  if (text)
  {
    -[NSMutableString appendString:](text, "appendString:", a3);
  }

  else
  {
    v5 = (NSMutableString *)[a3 mutableCopy];
    v6 = self->_text;
    self->_text = v5;
  }

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (NSString)text
{
  return &self->_text->super;
}

- (void).cxx_destruct
{
}

@end