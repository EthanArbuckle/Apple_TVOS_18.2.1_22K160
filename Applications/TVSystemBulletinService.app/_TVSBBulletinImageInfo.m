@interface _TVSBBulletinImageInfo
+ (id)infoWithImageName:(id)a3;
+ (id)infoWithImageName:(id)a3 configuration:(id)a4;
+ (id)infoWithSymbolName:(id)a3 configuration:(id)a4;
- (NSString)imageName;
- (NSString)symbolName;
- (UIImageSymbolConfiguration)configuration;
@end

@implementation _TVSBBulletinImageInfo

+ (id)infoWithImageName:(id)a3
{
  Class v9 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v7 = objc_alloc_init(v9);
  id v3 = [location[0] copy];
  v4 = (void *)v7[1];
  v7[1] = v3;

  v6 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

+ (id)infoWithImageName:(id)a3 configuration:(id)a4
{
  Class v14 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  v11 = objc_alloc_init(v14);
  id v4 = [location[0] copy];
  v5 = (void *)v11[1];
  v11[1] = v4;

  id v6 = [v12 copy];
  v7 = (void *)v11[3];
  v11[3] = v6;

  v10 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

+ (id)infoWithSymbolName:(id)a3 configuration:(id)a4
{
  Class v14 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  v11 = objc_alloc_init(v14);
  id v4 = [location[0] copy];
  v5 = (void *)v11[2];
  v11[2] = v4;

  id v6 = [v12 copy];
  v7 = (void *)v11[3];
  v11[3] = v6;

  v10 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIImageSymbolConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end