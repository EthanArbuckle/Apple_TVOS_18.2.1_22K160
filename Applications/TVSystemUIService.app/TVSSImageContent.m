@interface TVSSImageContent
- (BOOL)allowsFilters;
- (BOOL)allowsSelectedBackground;
- (CGSize)size;
- (Class)preferredVisualizerViewClass;
- (NSString)description;
- (TVSSImageContent)initWithImage:(id)a3;
- (TVSSImageContent)initWithImage:(id)a3 allowFilters:(BOOL)a4;
- (TVSSImageContent)initWithImage:(id)a3 allowSelectedBackground:(BOOL)a4;
- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4;
- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4 allowFilters:(BOOL)a5;
- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4 allowFilters:(BOOL)a5 allowSelectedBackground:(BOOL)a6;
- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4 allowFilters:(BOOL)a5 allowSelectedBackground:(BOOL)a6 userInfo:(id)a7;
- (TVSSImageContent)initWithImage:(id)a3 userInfo:(id)a4;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userInfo;
@end

@implementation TVSSImageContent

- (TVSSImageContent)initWithImage:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0LL;
  v7 = -[TVSSImageContent initWithImage:userInfo:](v3, "initWithImage:userInfo:", location[0], 0LL);
  v5 = v7;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  return v5;
}

- (TVSSImageContent)initWithImage:(id)a3 allowFilters:(BOOL)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v9;
  v9 = 0LL;
  v9 = -[TVSSImageContent initWithImage:size:allowFilters:]( v4,  "initWithImage:size:allowFilters:",  location[0],  a4,  CGSizeZero.width,  CGSizeZero.height);
  v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4
{
  CGSize v9 = a4;
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v8;
  v8 = 0LL;
  v8 = -[TVSSImageContent initWithImage:size:allowFilters:allowSelectedBackground:userInfo:]( v4,  "initWithImage:size:allowFilters:allowSelectedBackground:userInfo:",  location[0],  1LL,  1LL,  0LL,  v9.width,  v9.height);
  v6 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v6;
}

- (TVSSImageContent)initWithImage:(id)a3 allowSelectedBackground:(BOOL)a4
{
  CGSize v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v9;
  CGSize v9 = 0LL;
  CGSize v9 = -[TVSSImageContent initWithImage:size:allowFilters:allowSelectedBackground:userInfo:]( v4,  "initWithImage:size:allowFilters:allowSelectedBackground:userInfo:",  location[0],  1LL,  a4,  0LL,  CGSizeZero.width,  CGSizeZero.height);
  v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4 allowFilters:(BOOL)a5
{
  CGSize v11 = a4;
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = v10;
  v10 = 0LL;
  v10 = -[TVSSImageContent initWithImage:size:allowFilters:allowSelectedBackground:userInfo:]( v5,  "initWithImage:size:allowFilters:allowSelectedBackground:userInfo:",  location[0],  a5,  1LL,  0LL,  v11.width,  v11.height);
  v8 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v8;
}

- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4 allowFilters:(BOOL)a5 allowSelectedBackground:(BOOL)a6
{
  CGSize v13 = a4;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v6 = v12;
  v12 = 0LL;
  v12 = -[TVSSImageContent initWithImage:size:allowFilters:allowSelectedBackground:userInfo:]( v6,  "initWithImage:size:allowFilters:allowSelectedBackground:userInfo:",  location[0],  a5,  a6,  0LL,  v13.width,  v13.height);
  v10 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v10;
}

- (TVSSImageContent)initWithImage:(id)a3 userInfo:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0LL;
  v10 = -[TVSSImageContent initWithImage:size:allowFilters:allowSelectedBackground:userInfo:]( v4,  "initWithImage:size:allowFilters:allowSelectedBackground:userInfo:",  location[0],  1LL,  1LL,  v8,  CGSizeZero.width,  CGSizeZero.height);
  v7 = v10;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (TVSSImageContent)initWithImage:(id)a3 size:(CGSize)a4 allowFilters:(BOOL)a5 allowSelectedBackground:(BOOL)a6 userInfo:(id)a7
{
  CGSize v19 = a4;
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v16 = a5;
  BOOL v15 = a6;
  id v14 = 0LL;
  objc_storeStrong(&v14, a7);
  v7 = v18;
  v18 = 0LL;
  v13.receiver = v7;
  v13.super_class = (Class)&OBJC_CLASS___TVSSImageContent;
  v18 = -[TVSSImageContent init](&v13, "init");
  objc_storeStrong((id *)&v18, v18);
  if (v18)
  {
    objc_storeStrong((id *)&v18->_image, location[0]);
    v18->_size = v19;
    v18->_allowsFilters = v16;
    v18->_allowsSelectedBackground = v15;
    objc_storeStrong(&v18->_userInfo, v14);
  }

  CGSize v9 = v18;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v9;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSImageContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v6[0] appendPointer:v7->_image withName:@"image"];
  id v3 = [v6[0] appendObject:v7->_userInfo withName:@"userInfo" skipIfNil:1];
  id v5 = [v6[0] build];
  objc_storeStrong(v6, 0LL);
  return (NSString *)v5;
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)size
{
  double height = self->_size.height;
  double width = self->_size.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)allowsFilters
{
  return self->_allowsFilters;
}

- (BOOL)allowsSelectedBackground
{
  return self->_allowsSelectedBackground;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end