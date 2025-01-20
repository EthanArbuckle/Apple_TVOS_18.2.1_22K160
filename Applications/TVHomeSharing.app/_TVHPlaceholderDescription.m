@interface _TVHPlaceholderDescription
- (NSString)symbolName;
- (UIColor)tintColor;
- (_TVHPlaceholderDescription)initWithSymbolName:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation _TVHPlaceholderDescription

- (_TVHPlaceholderDescription)initWithSymbolName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____TVHPlaceholderDescription;
  v6 = -[_TVHPlaceholderDescription init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_symbolName, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIColor tvh_placeholderDynamicColor](&OBJC_CLASS___UIColor, "tvh_placeholderDynamicColor"));
    tintColor = v7->_tintColor;
    v7->_tintColor = (UIColor *)v8;
  }

  return v7;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end