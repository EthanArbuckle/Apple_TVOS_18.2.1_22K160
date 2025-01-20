@interface _TVSSPrivacyPlatterControllerItem
- (TVSPRenderer)renderer;
- (TVSPRow)row;
- (_TVSSPrivacyPlatterControllerItem)initWithRow:(id)a3 renderer:(id)a4;
@end

@implementation _TVSSPrivacyPlatterControllerItem

- (_TVSSPrivacyPlatterControllerItem)initWithRow:(id)a3 renderer:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0LL;
  v8.receiver = v4;
  v8.super_class = (Class)&OBJC_CLASS____TVSSPrivacyPlatterControllerItem;
  v11 = -[_TVSSPrivacyPlatterControllerItem init](&v8, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_row, location[0]);
    objc_storeStrong((id *)&v11->_renderer, v9);
  }

  v6 = v11;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v6;
}

- (TVSPRow)row
{
  return self->_row;
}

- (TVSPRenderer)renderer
{
  return self->_renderer;
}

- (void).cxx_destruct
{
}

@end