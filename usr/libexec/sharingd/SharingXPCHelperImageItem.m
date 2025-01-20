@interface SharingXPCHelperImageItem
+ (BOOL)supportsSecureCoding;
- (CGImage)image;
- (NSArray)contactIDs;
- (NSData)imageData;
- (NSString)cacheLookupKey;
- (NSString)imageTitle;
- (SharingXPCHelperImageItem)initWithCoder:(id)a3;
- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3;
- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 image:(CGImage *)a4 cacheLookupKey:(id)a5;
- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 imageData:(id)a4 cacheLookupKey:(id)a5;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheLookupKey:(id)a3;
- (void)setContactIDs:(id)a3;
@end

@implementation SharingXPCHelperImageItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3
{
  return -[SharingXPCHelperImageItem initWithImageTitle:imageData:cacheLookupKey:]( self,  "initWithImageTitle:imageData:cacheLookupKey:",  a3,  0LL,  0LL);
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 imageData:(id)a4 cacheLookupKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SharingXPCHelperImageItem;
  v12 = -[SharingXPCHelperImageItem init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageTitle, a3);
    objc_storeStrong((id *)&v13->_imageData, a4);
    objc_storeStrong((id *)&v13->_cacheLookupKey, a5);
    contactIDs = v13->_contactIDs;
    v13->_contactIDs = (NSArray *)&__NSArray0__struct;
  }

  return v13;
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 image:(CGImage *)a4 cacheLookupKey:(id)a5
{
  v6 = -[SharingXPCHelperImageItem initWithImageTitle:imageData:cacheLookupKey:]( self,  "initWithImageTitle:imageData:cacheLookupKey:",  a3,  0LL,  a5);
  if (v6) {
    v6->_image = (CGImage *)CFRetain(a4);
  }
  return v6;
}

- (SharingXPCHelperImageItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SharingXPCHelperImageItem;
  v5 = -[SharingXPCHelperImageItem init](&v19, "init");
  if (v5)
  {
    id v6 = v4;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
    NSDecodeObjectIfPresent(v6, @"SharingXPCHelperImageItem-ImageTitle", v8, &v5->_imageTitle);

    id v9 = v6;
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData, v10);
    NSDecodeObjectIfPresent(v9, @"SharingXPCHelperImageItem-ImageData", v11, &v5->_imageData);

    id v12 = v9;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
    NSDecodeObjectIfPresent(v12, @"SharingXPCHelperImageItem-CacheLookupKey", v14, &v5->_cacheLookupKey);

    id v15 = v12;
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
    NSDecodeStandardContainerIfPresent(v15, @"SharingXPCHelperImageItem-ContactIDsKey", v17, &v5->_contactIDs);
  }

  return v5;
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    CFRelease(image);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SharingXPCHelperImageItem;
  -[SharingXPCHelperImageItem dealloc](&v4, "dealloc");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  imageTitle = self->_imageTitle;
  id v12 = v4;
  if (imageTitle)
  {
    [v4 encodeObject:imageTitle forKey:@"SharingXPCHelperImageItem-ImageTitle"];
    id v4 = v12;
  }

  imageData = self->_imageData;
  if (imageData)
  {
    [v4 encodeObject:imageData forKey:@"SharingXPCHelperImageItem-ImageData"];
  }

  else if (self->_image)
  {
    uint64_t v7 = SFDataFromCGImage();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v12 encodeObject:v8 forKey:@"SharingXPCHelperImageItem-ImageData"];
  }

  cacheLookupKey = self->_cacheLookupKey;
  if (cacheLookupKey) {
    [v12 encodeObject:cacheLookupKey forKey:@"SharingXPCHelperImageItem-CacheLookupKey"];
  }
  contactIDs = self->_contactIDs;
  uint64_t v11 = v12;
  if (contactIDs)
  {
    [v12 encodeObject:contactIDs forKey:@"SharingXPCHelperImageItem-ContactIDsKey"];
    uint64_t v11 = v12;
  }
}

- (id)description
{
  id v4 = 0LL;
  if (self->_imageData) {
    v2 = @"has";
  }
  else {
    v2 = @"does not have";
  }
  NSAppendPrintF(&v4, "SharingXPCHelperImageItem for %{private}@ %@ imageData", self->_imageTitle, v2);
  return v4;
}

- (NSString)imageTitle
{
  return self->_imageTitle;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGImage)image
{
  return self->_image;
}

- (NSString)cacheLookupKey
{
  return self->_cacheLookupKey;
}

- (void)setCacheLookupKey:(id)a3
{
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end