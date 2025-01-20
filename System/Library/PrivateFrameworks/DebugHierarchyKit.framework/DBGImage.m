@interface DBGImage
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5;
- (DBGImage)initWithImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5;
- (NSData)imageData;
- (NSDictionary)metadata;
- (NSString)debugDescription;
- (NSString)description;
- (__CFString)imageType;
- (id)JSONCompatibleRepresentation;
@end

@implementation DBGImage

+ (id)withImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithImageData:v9 type:a4 metadata:v8];

  return v10;
}

- (DBGImage)initWithImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DBGImage;
  v11 = -[DBGImage init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_imageData, a3);
    v12->_imageType = a4;
    objc_storeStrong((id *)&v12->_metadata, a5);
  }

  return v12;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGImage objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGImage description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (__CFString)imageType
{
  return self->_imageType;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([UTTypePNG identifier]);
    if ([v9 isEqualToString:v13])
    {
LABEL_5:

LABEL_6:
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 dbgDataValue]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([a1 withImageData:v15 type:v9 metadata:0]);

      goto LABEL_18;
    }

    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([UTTypeTIFF identifier]);
    if ([v9 isEqualToString:v14])
    {

      goto LABEL_5;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([UTTypeJPEG identifier]);
    unsigned __int8 v18 = [v9 isEqualToString:v17];

    if ((v18 & 1) != 0) {
      goto LABEL_6;
    }
  }

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
  if ((objc_opt_isKindOfClass(v8, v19) & 1) != 0 && [v9 isEqualToString:@"image"])
  {
    id v28 = 0LL;
    uint64_t v20 = DBGDecodeValueFromJSONCompatibleValue(v8, v9, &v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = v28;
    v23 = v22;
    if (v22)
    {
      v16 = 0LL;
      if (a5) {
        *a5 = v22;
      }
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"imageData"]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"metadata"]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([UTTypePNG identifier]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([a1 withImageData:v24 type:v26 metadata:v25]);
    }
  }

  else
  {
    v16 = 0LL;
    if (!v8 && a5)
    {
      v16 = 0LL;
      *a5 = 0LL;
    }
  }

- (id)JSONCompatibleRepresentation
{
  return 0LL;
}

@end