@interface TVSSTextContent
- (Class)preferredVisualizerViewClass;
- (NSString)description;
- (NSString)string;
- (NSTextEncapsulation)textEncapsulation;
- (TVSSTextContent)initWithString:(id)a3 font:(id)a4 textEncapsulation:(id)a5;
- (TVSSTextContent)initWithString:(id)a3 font:(id)a4 textEncapsulation:(id)a5 userInfo:(id)a6;
- (UIFont)font;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userInfo;
@end

@implementation TVSSTextContent

- (TVSSTextContent)initWithString:(id)a3 font:(id)a4 textEncapsulation:(id)a5
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  v5 = v13;
  v13 = 0LL;
  v13 = -[TVSSTextContent initWithString:font:textEncapsulation:userInfo:]( v5,  "initWithString:font:textEncapsulation:userInfo:",  location[0],  v11,  v10,  0LL);
  v9 = v13;
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v9;
}

- (TVSSTextContent)initWithString:(id)a3 font:(id)a4 textEncapsulation:(id)a5 userInfo:(id)a6
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  id v13 = 0LL;
  objc_storeStrong(&v13, a6);
  v6 = v17;
  v17 = 0LL;
  v12.receiver = v6;
  v12.super_class = (Class)&OBJC_CLASS___TVSSTextContent;
  v17 = -[TVSSTextContent init](&v12, "init");
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    objc_storeStrong((id *)&v17->_string, location[0]);
    objc_storeStrong((id *)&v17->_font, v15);
    objc_storeStrong((id *)&v17->_textEncapsulation, v14);
    objc_storeStrong(&v17->_userInfo, v13);
  }

  v8 = v17;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  return v8;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSTextContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v8[0] appendPointer:v9->_string withName:@"string"];
  id v3 = [v8[0] appendPointer:v9->_font withName:@"font"];
  id v4 = [v8[0] appendPointer:v9->_textEncapsulation withName:@"textEncapsulation"];
  id v5 = [v8[0] appendObject:v9->_userInfo withName:@"userInfo" skipIfNil:1];
  id v7 = [v8[0] build];
  objc_storeStrong(v8, 0LL);
  return (NSString *)v7;
}

- (NSString)string
{
  return self->_string;
}

- (UIFont)font
{
  return self->_font;
}

- (NSTextEncapsulation)textEncapsulation
{
  return self->_textEncapsulation;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end