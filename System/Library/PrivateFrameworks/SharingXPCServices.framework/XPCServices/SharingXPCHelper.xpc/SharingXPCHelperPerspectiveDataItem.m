@interface SharingXPCHelperPerspectiveDataItem
+ (BOOL)supportsSecureCoding;
- (CGSize)perspectiveDataSize;
- (NSData)CGImageData;
- (NSData)perspectiveData;
- (SharingXPCHelperPerspectiveDataItem)init;
- (SharingXPCHelperPerspectiveDataItem)initWithCoder:(id)a3;
- (SharingXPCHelperPerspectiveDataItem)initWithPerspectiveData:(id)a3 perspectiveDataSize:(CGSize)a4 CGImageData:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharingXPCHelperPerspectiveDataItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperPerspectiveDataItem)init
{
  v3 = objc_opt_new(&OBJC_CLASS___NSData);
  v4 = objc_opt_new(&OBJC_CLASS___NSData);
  v5 = -[SharingXPCHelperPerspectiveDataItem initWithPerspectiveData:perspectiveDataSize:CGImageData:]( self,  "initWithPerspectiveData:perspectiveDataSize:CGImageData:",  v3,  v4,  0.0,  0.0);

  return v5;
}

- (SharingXPCHelperPerspectiveDataItem)initWithPerspectiveData:(id)a3 perspectiveDataSize:(CGSize)a4 CGImageData:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SharingXPCHelperPerspectiveDataItem;
  v12 = -[SharingXPCHelperPerspectiveDataItem init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_perspectiveData, a3);
    v13->_perspectiveDataSize.CGFloat width = width;
    v13->_perspectiveDataSize.CGFloat height = height;
    objc_storeStrong((id *)&v13->_CGImageData, a5);
  }

  return v13;
}

- (id)description
{
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  perspectiveData = self->_perspectiveData;
  if (perspectiveData) {
    [v9 encodeObject:perspectiveData forKey:@"SharingXPCHelperPerspectiveDataItem-PerspectiveData"];
  }
  -[SharingXPCHelperPerspectiveDataItem perspectiveDataSize](self, "perspectiveDataSize");
  *(float *)&double v5 = v5;
  [v9 encodeFloat:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataWidth" forKey:v5];
  -[SharingXPCHelperPerspectiveDataItem perspectiveDataSize](self, "perspectiveDataSize");
  *(float *)&double v7 = v6;
  [v9 encodeFloat:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataHeight" forKey:v7];
  CGImageData = self->_CGImageData;
  if (CGImageData) {
    [v9 encodeObject:CGImageData forKey:@"SharingXPCHelperPerspectiveDataItem-CGImageData"];
  }
}

- (SharingXPCHelperPerspectiveDataItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SharingXPCHelperPerspectiveDataItem;
  double v5 = -[SharingXPCHelperPerspectiveDataItem init](&v14, "init");
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
    NSDecodeObjectIfPresent(v6, @"SharingXPCHelperPerspectiveDataItem-PerspectiveData", v7, &v5->_perspectiveData);

    [v6 decodeFloatForKey:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataWidth"];
    CGFloat v9 = v8;
    [v6 decodeFloatForKey:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataHeight"];
    v5->_perspectiveDataSize.CGFloat width = v9;
    v5->_perspectiveDataSize.CGFloat height = v10;
    id v11 = v6;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSData);
    NSDecodeObjectIfPresent(v11, @"SharingXPCHelperPerspectiveDataItem-CGImageData", v12, &v5->_CGImageData);
  }

  return v5;
}

- (NSData)perspectiveData
{
  return self->_perspectiveData;
}

- (CGSize)perspectiveDataSize
{
  double width = self->_perspectiveDataSize.width;
  double height = self->_perspectiveDataSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSData)CGImageData
{
  return self->_CGImageData;
}

- (void).cxx_destruct
{
}

@end