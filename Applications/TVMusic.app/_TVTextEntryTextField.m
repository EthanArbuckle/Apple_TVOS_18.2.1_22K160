@interface _TVTextEntryTextField
- (BOOL)allowsFocus;
- (BOOL)canBecomeFocused;
- (_TVTextEntryTextField)initWithFrame:(CGRect)a3;
- (id)text;
- (void)setAllowsFocus:(BOOL)a3;
@end

@implementation _TVTextEntryTextField

- (_TVTextEntryTextField)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVTextEntryTextField;
  result = -[_TVTextEntryTextField initWithFrame:]( &v4,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (result) {
    result->_allowsFocus = 0;
  }
  return result;
}

- (BOOL)canBecomeFocused
{
  return self->_allowsFocus;
}

- (id)text
{
  if ((-[_TVTextEntryTextField isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS____TVTextEntryTextField;
    id v3 = -[_TVTextEntryTextField text](&v10, "text");
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    if (!qword_1002BEB70)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"\t"));
      v6 = (void *)qword_1002BEB70;
      qword_1002BEB70 = v5;
    }

    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS____TVTextEntryTextField;
    id v7 = -[_TVTextEntryTextField text](&v11, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByTrimmingCharactersInSet:qword_1002BEB70]);

    return v9;
  }

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

@end