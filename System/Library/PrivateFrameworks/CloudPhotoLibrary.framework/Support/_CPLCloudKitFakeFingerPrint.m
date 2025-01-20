@interface _CPLCloudKitFakeFingerPrint
- (CGSize)dimensions;
- (CPLResourceIdentity)fakeIdentity;
- (NSString)fingerPrint;
- (NSString)outputType;
- (NSString)realFingerPrint;
- (_CPLCloudKitFakeFingerPrint)initWithFakeFingerPrint:(id)a3;
- (_CPLCloudKitFakeFingerPrint)initWithFakeIdentity:(id)a3;
- (_CPLCloudKitFakeFingerPrint)initWithRealResourceType:(unint64_t)a3 realFingerPrint:(id)a4 outputType:(id)a5 dimensions:(CGSize)a6;
- (unint64_t)realResourceType;
@end

@implementation _CPLCloudKitFakeFingerPrint

- (_CPLCloudKitFakeFingerPrint)initWithFakeIdentity:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 fingerPrint]);
  v5 = -[_CPLCloudKitFakeFingerPrint initWithFakeFingerPrint:](self, "initWithFakeFingerPrint:", v4);

  return v5;
}

- (_CPLCloudKitFakeFingerPrint)initWithFakeFingerPrint:(id)a3
{
  v3 = (_CPLCloudKitFakeFingerPrint *)a3;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"^"]);
  if ([v6 count] != (id)5) {
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:2]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:3]);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:4]);
  NSSize v11 = NSSizeFromString(v10);
  if (qword_1002960F0 != -1) {
    dispatch_once(&qword_1002960F0, &stru_10023FDC8);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002960E8 objectForKeyedSubscript:v7]);
  v13 = v12;
  if (v12)
  {
    v14 = -[_CPLCloudKitFakeFingerPrint initWithRealResourceType:realFingerPrint:outputType:dimensions:]( self,  "initWithRealResourceType:realFingerPrint:outputType:dimensions:",  [v12 integerValue],  v8,  v9,  v11.width,  v11.height);
    v15 = v14;
    if (v14) {
      objc_storeStrong((id *)&v14->_fingerPrint, v3);
    }
    self = v15;
    v3 = self;
  }

  if (!v13) {
LABEL_9:
  }
    v3 = 0LL;

  return v3;
}

- (_CPLCloudKitFakeFingerPrint)initWithRealResourceType:(unint64_t)a3 realFingerPrint:(id)a4 outputType:(id)a5 dimensions:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____CPLCloudKitFakeFingerPrint;
  v14 = -[_CPLCloudKitFakeFingerPrint init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_realResourceType = a3;
    objc_storeStrong((id *)&v14->_realFingerPrint, a4);
    objc_storeStrong((id *)&v15->_outputType, a5);
    v15->_dimensions.CGFloat width = width;
    v15->_dimensions.CGFloat height = height;
  }

  return v15;
}

- (NSString)fingerPrint
{
  fingerPrint = self->_fingerPrint;
  if (!fingerPrint)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSString);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  self->_realResourceType));
    realFingerPrint = self->_realFingerPrint;
    outputType = self->_outputType;
    v8 = NSStringFromSize(self->_dimensions);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[NSString initWithFormat:](v4, "initWithFormat:", @"^%@^%@^%@^%@", v5, realFingerPrint, outputType, v9);
    NSSize v11 = self->_fingerPrint;
    self->_fingerPrint = v10;

    fingerPrint = self->_fingerPrint;
  }

  return fingerPrint;
}

- (CPLResourceIdentity)fakeIdentity
{
  v3 = objc_alloc_init(&OBJC_CLASS___CPLResourceIdentity);
  -[CPLResourceIdentity setFileUTI:](v3, "setFileUTI:", self->_outputType);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitFakeFingerPrint fingerPrint](self, "fingerPrint"));
  -[CPLResourceIdentity setFingerPrint:](v3, "setFingerPrint:", v4);

  -[CPLResourceIdentity setImageDimensions:]( v3,  "setImageDimensions:",  self->_dimensions.width,  self->_dimensions.height);
  -[CPLResourceIdentity setAvailable:](v3, "setAvailable:", 1LL);
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  v7 = self->_outputType;
  if (qword_100296110 != -1) {
    dispatch_once(&qword_100296110, &stru_10023FE10);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100296108 objectForKeyedSubscript:v7]);
  v9 = v8;
  if (v8) {
    [v8 doubleValue];
  }
  else {
    double v10 = 4.19265652;
  }
  double v11 = height * (width * v10);
  if (v11 < 10240.0) {
    double v11 = 10240.0;
  }
  unint64_t v12 = (unint64_t)v11;

  -[CPLResourceIdentity setFileSize:](v3, "setFileSize:", v12);
  return v3;
}

- (unint64_t)realResourceType
{
  return self->_realResourceType;
}

- (NSString)realFingerPrint
{
  return self->_realFingerPrint;
}

- (NSString)outputType
{
  return self->_outputType;
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end