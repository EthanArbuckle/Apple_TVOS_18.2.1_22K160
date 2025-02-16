@interface TTKKey
- (CGPoint)center;
- (CGRect)frame;
- (NSString)string;
- (TTKKey)initWithUIKBTree:(id)a3 layoutUtils:(id)a4;
- (id)description;
- (signed)keyCode;
@end

@implementation TTKKey

- (TTKKey)initWithUIKBTree:(id)a3 layoutUtils:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TTKKey;
  v7 = -[TTKKey init](&v10, "init");
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_key, a3);
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TTKKey string](self, "string"));
  -[UIKBTree frame](self->_key, "frame");
  uint64_t v6 = v5;
  -[UIKBTree frame](self->_key, "frame");
  uint64_t v8 = v7;
  -[UIKBTree frame](self->_key, "frame");
  uint64_t v10 = v9;
  -[UIKBTree frame](self->_key, "frame");
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p '%@' @ {{%g, %g}, {%g, %g}}>",  v3,  self,  v4,  v6,  v8,  v10,  v11));

  return v12;
}

- (NSString)string
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIKBTree representedString](self->_key, "representedString"));
  layoutUtils = self->_layoutUtils;
  if (layoutUtils) {
    id v5 = (id)objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils representedStringForKey:shifted:]( layoutUtils,  "representedStringForKey:shifted:",  self->_key,  0LL));
  }
  else {
    id v5 = v3;
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (CGRect)frame
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)center
{
  double v4 = v3;
  -[UIKBTree frame](self->_key, "frame");
  double v6 = v4 + v5 * 0.5;
  -[UIKBTree frame](self->_key, "frame");
  double v8 = v7;
  -[UIKBTree frame](self->_key, "frame");
  double v10 = v8 + v9 * 0.5;
  double v11 = v6;
  result.y = v10;
  result.x = v11;
  return result;
}

- (signed)keyCode
{
  return self->_keyCode;
}

- (void).cxx_destruct
{
}

@end