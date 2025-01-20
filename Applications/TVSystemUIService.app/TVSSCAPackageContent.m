@interface TVSSCAPackageContent
- (CGPoint)contentOffset;
- (CGSize)size;
- (Class)preferredVisualizerViewClass;
- (NSString)darkPackageName;
- (NSString)description;
- (NSString)lightPackageName;
- (TVSSCAPackageContent)initWithLightModePackageName:(id)a3 darkModePackageName:(id)a4 size:(CGSize)a5 repeatInterval:(double)a6;
- (TVSSCAPackageContent)initWithLightModePackageName:(id)a3 darkModePackageName:(id)a4 size:(CGSize)a5 repeatInterval:(double)a6 contentOffset:(CGPoint)a7;
- (TVSSCAPackageContent)initWithLightModePackageName:(id)a3 darkModePackageName:(id)a4 size:(CGSize)a5 repeatInterval:(double)a6 contentOffset:(CGPoint)a7 userInfo:(id)a8;
- (double)repeatInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userInfo;
@end

@implementation TVSSCAPackageContent

- (TVSSCAPackageContent)initWithLightModePackageName:(id)a3 darkModePackageName:(id)a4 size:(CGSize)a5 repeatInterval:(double)a6
{
  CGSize v14 = a5;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v6 = v13;
  v13 = 0LL;
  v13 = -[TVSSCAPackageContent initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:]( v6,  "initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:",  location[0],  v11,  v14.width,  v14.height,  a6,  CGPointZero.x,  CGPointZero.y);
  v10 = v13;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v10;
}

- (TVSSCAPackageContent)initWithLightModePackageName:(id)a3 darkModePackageName:(id)a4 size:(CGSize)a5 repeatInterval:(double)a6 contentOffset:(CGPoint)a7
{
  CGSize v16 = a5;
  CGPoint v15 = a7;
  CGSize v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  v7 = v14;
  CGSize v14 = 0LL;
  CGSize v14 = -[TVSSCAPackageContent initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:userInfo:]( v7,  "initWithLightModePackageName:darkModePackageName:size:repeatInterval:contentOffset:userInfo:",  location[0],  v12,  0LL,  v16.width,  v16.height,  a6,  v15.x,  v15.y);
  id v11 = v14;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v11;
}

- (TVSSCAPackageContent)initWithLightModePackageName:(id)a3 darkModePackageName:(id)a4 size:(CGSize)a5 repeatInterval:(double)a6 contentOffset:(CGPoint)a7 userInfo:(id)a8
{
  CGSize v28 = a5;
  CGPoint v27 = a7;
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  double v23 = a6;
  id v22 = 0LL;
  objc_storeStrong(&v22, a8);
  v8 = v26;
  v26 = 0LL;
  v21.receiver = v8;
  v21.super_class = (Class)&OBJC_CLASS___TVSSCAPackageContent;
  CGSize v16 = -[TVSSCAPackageContent init](&v21, "init");
  v26 = v16;
  objc_storeStrong((id *)&v26, v16);
  if (v16)
  {
    v9 = (NSString *)[location[0] copy];
    lightPackageName = v26->_lightPackageName;
    v26->_lightPackageName = v9;

    char v19 = 0;
    char v17 = 0;
    if (v24)
    {
      id v20 = [v24 copy];
      char v19 = 1;
      objc_storeStrong((id *)&v26->_darkPackageName, v20);
    }

    else
    {
      id v18 = [location[0] copy];
      char v17 = 1;
      objc_storeStrong((id *)&v26->_darkPackageName, v18);
    }

    if ((v17 & 1) != 0) {

    }
    if ((v19 & 1) != 0) {
    v26->_size = v28;
    }
    v26->_repeatInterval = v23;
    v26->_contentOffset = v27;
    objc_storeStrong(&v26->_userInfo, v22);
  }

  id v12 = v26;
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  return v12;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSCAPackageContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v9[0] appendPointer:v10->_lightPackageName withName:@"lightPackageName"];
  id v3 = [v9[0] appendPointer:v10->_darkPackageName withName:@"darkPackageName"];
  id v4 = objc_msgSend(v9[0], "appendSize:withName:", @"size", v10->_size.width, v10->_size.height);
  id v5 =  objc_msgSend( v9[0],  "appendPoint:withName:",  @"contentOffset",  v10->_contentOffset.x,  v10->_contentOffset.y);
  id v6 = [v9[0] appendObject:v10->_userInfo withName:@"userInfo" skipIfNil:1];
  id v8 = [v9[0] build];
  objc_storeStrong(v9, 0LL);
  return (NSString *)v8;
}

- (NSString)lightPackageName
{
  return self->_lightPackageName;
}

- (NSString)darkPackageName
{
  return self->_darkPackageName;
}

- (CGSize)size
{
  double height = self->_size.height;
  double width = self->_size.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)repeatInterval
{
  return self->_repeatInterval;
}

- (CGPoint)contentOffset
{
  double y = self->_contentOffset.y;
  double x = self->_contentOffset.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
}

@end