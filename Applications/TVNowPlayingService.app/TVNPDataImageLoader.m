@interface TVNPDataImageLoader
+ (id)sharedInstance;
- (NSData)imageData;
- (NSString)imageIdentifier;
- (TVNPDataImageLoader)init;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
- (void)setImageData:(id)a3;
@end

@implementation TVNPDataImageLoader

+ (id)sharedInstance
{
  id v10 = a1;
  SEL v9 = a2;
  obj = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10001667C;
  v7 = &unk_100059108;
  id v8 = a1;
  v12 = (dispatch_once_t *)&unk_10006AFC8;
  id location = 0LL;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_10006AFC0;
}

- (TVNPDataImageLoader)init
{
  SEL v9 = a2;
  id v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVNPDataImageLoader;
  v7 = -[TVNPDataImageLoader init](&v8, "init");
  id v10 = v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    v6 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
    v2 = -[NSUUID UUIDString](v6, "UUIDString");
    imageIdentifier = v10->_imageIdentifier;
    v10->_imageIdentifier = v2;
  }

  int v5 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v5;
}

- (void)setImageData:(id)a3
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  obj = v8;
  objc_sync_enter(obj);
  if (([location[0] isEqual:v8->_imageData] & 1) == 0 && (location[0] || v8->_imageData))
  {
    int v5 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
    v3 = -[NSUUID UUIDString](v5, "UUIDString");
    imageIdentifier = v8->_imageIdentifier;
    v8->_imageIdentifier = v3;

    objc_storeStrong((id *)&v8->_imageData, location[0]);
    objc_storeStrong((id *)&v8->_decodedImage, 0LL);
  }

  objc_sync_exit(obj);

  objc_storeStrong(location, 0LL);
}

- (id)imageKeyForObject:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = location[0];
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  CGSize v35 = a4;
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v32 = a5;
  v31[1] = (id)a6;
  v31[0] = 0LL;
  objc_storeStrong(v31, a7);
  id v30 = 0LL;
  objc_storeStrong(&v30, a8);
  id v29 = 0LL;
  id v28 = 0LL;
  v20 = v34;
  objc_sync_enter(v20);
  if (!v34->_decodedImage)
  {
    imageIdentifier = v34->_imageIdentifier;
    id v13 = -[TVNPDataImageLoader imageKeyForObject:](v34, "imageKeyForObject:", location[0]);
    unsigned __int8 v14 = -[NSString isEqual:](imageIdentifier, "isEqual:");

    if ((v14 & 1) != 0)
    {
      objc_super v8 = +[TVImage imageWithData:](&OBJC_CLASS___TVImage, "imageWithData:", v34->_imageData);
      decodedImage = v34->_decodedImage;
      v34->_decodedImage = v8;
    }
  }

  objc_storeStrong(&v28, v34->_decodedImage);
  objc_storeStrong(&v29, v34->_imageIdentifier);
  objc_sync_exit(v20);

  queue = &_dispatch_main_q;
  v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_100016C38;
  v25 = &unk_100059130;
  id v26 = v28;
  id v27 = v30;
  dispatch_async(queue, &v21);

  id v12 = v29;
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(v31, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

- (void)cancelLoad:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
}

@end