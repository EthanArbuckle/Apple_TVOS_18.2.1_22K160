@interface _CPLFakeDerivativeMapper
+ (unint64_t)destinationresourceTypeFromShortDescription:(id)a3;
+ (void)initialize;
- (CGSize)_dimensionsFromBaseResource:(id)a3;
- (NSString)outputType;
- (_CPLFakeDerivativeMapper)initWithRule:(id)a3;
- (double)maxPixelCount;
- (id)_bestSourceResourceFromResources:(id)a3;
- (id)description;
- (unint64_t)resourceType;
- (void)updateResources:(id)a3;
@end

@implementation _CPLFakeDerivativeMapper

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS____CPLFakeDerivativeMapper) == a1)
  {
    CFArrayRef v2 = CGImageDestinationCopyTypeIdentifiers();
    v3 = (void *)qword_1002960F8;
    qword_1002960F8 = (uint64_t)v2;

    CFArrayRef v4 = CGImageDestinationCopyTypeIdentifiers();
    v5 = (void *)qword_100296100;
    qword_100296100 = (uint64_t)v4;
  }

+ (unint64_t)destinationresourceTypeFromShortDescription:(id)a3
{
  unint64_t result = (unint64_t)+[CPLResource resourceTypeFromShortDescription:]( &OBJC_CLASS___CPLResource,  "resourceTypeFromShortDescription:",  a3);
  if (result - 2 >= 4) {
    return 0LL;
  }
  return result;
}

- (_CPLFakeDerivativeMapper)initWithRule:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____CPLFakeDerivativeMapper;
  v5 = -[_CPLFakeDerivativeMapper init](&v24, "init");
  if (!v5) {
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"/"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
  if ((unint64_t)[v6 count] < 2)
  {
    outputType = v5->_outputType;
    v5->_outputType = (NSString *)@"public.jpeg";
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
    id v9 = [(id)qword_1002960F8 containsObject:v8];
    if ((v9 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v17 = __CPLGenericOSLogDomain(v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        {
LABEL_22:

          goto LABEL_23;
        }

        *(_DWORD *)buf = 138412290;
        v26 = v8;
        v19 = "%@ is unsupported";
        v20 = (os_log_s *)v18;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
        goto LABEL_22;
      }

- (id)_bestSourceResourceFromResources:(id)a3
{
  id v4 = a3;
  if (self->_maxPixelCount != 0.0)
  {
    uint64_t v10 = 0LL;
    unint64_t resourceType = self->_resourceType;
    __int128 v18 = xmmword_100212260;
    __int128 v19 = xmmword_100212270;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(unint64_t *)((char *)&resourceType + v10),  resourceType,  v18,  v19));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v11]);

      if (v9
        && !+[CPLCloudKitFakeDynamicDerivatives isFakeDerivative:]( &OBJC_CLASS___CPLCloudKitFakeDynamicDerivatives,  "isFakeDerivative:",  v9))
      {
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);
        if ([v12 isAvailable])
        {
          [v12 imageDimensions];
          if (v13 * v14 >= self->_maxPixelCount)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 fileUTI]);
            if (v15 && ([(id)qword_100296100 containsObject:v15] & 1) != 0)
            {

              goto LABEL_18;
            }
          }
        }
      }

      v10 += 8LL;

      if (v10 == 48)
      {
        id v9 = 0LL;
        goto LABEL_18;
      }
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_resourceType));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]),
        unsigned int v8 = [v7 isAvailable],
        v7,
        v8))
  {
    id v9 = v6;
  }

  else
  {
    id v9 = 0LL;
  }

LABEL_18:
  return v9;
}

- (CGSize)_dimensionsFromBaseResource:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
  [v5 imageDimensions];
  double v8 = v7;
  double v9 = v6;
  double maxPixelCount = self->_maxPixelCount;
  if (maxPixelCount != 0.0)
  {
    double v11 = v8 * v6;
    if (v8 * v9 <= 0.0) {
      sub_100191768();
    }
    double v12 = maxPixelCount / v11;
    if (v12 > 1.0) {
      sub_100191790();
    }
    double v13 = floor(v8 * v12);
    if (v13 >= 1.0) {
      double v8 = v13;
    }
    else {
      double v8 = 1.0;
    }
    double v14 = floor(v9 * v12);
    if (v14 >= 1.0) {
      double v9 = v14;
    }
    else {
      double v9 = 1.0;
    }
  }

  double v15 = v8;
  double v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateResources:(id)a3
{
  id v20 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_CPLFakeDerivativeMapper _bestSourceResourceFromResources:]( self,  "_bestSourceResourceFromResources:"));
  v5 = v4;
  if (v4)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
    -[_CPLFakeDerivativeMapper _dimensionsFromBaseResource:](self, "_dimensionsFromBaseResource:", v5);
    double v8 = v7;
    double v10 = v9;
    double v11 = objc_alloc(&OBJC_CLASS____CPLCloudKitFakeFingerPrint);
    id v12 = [v5 resourceType];
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerPrint]);
    double v14 = -[_CPLCloudKitFakeFingerPrint initWithRealResourceType:realFingerPrint:outputType:dimensions:]( v11,  "initWithRealResourceType:realFingerPrint:outputType:dimensions:",  v12,  v13,  self->_outputType,  v8,  v10);

    double v15 = objc_alloc(&OBJC_CLASS___CPLResource);
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitFakeFingerPrint fakeIdentity](v14, "fakeIdentity"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 itemScopedIdentifier]);
    __int128 v18 = -[CPLResource initWithResourceIdentity:itemScopedIdentifier:resourceType:]( v15,  "initWithResourceIdentity:itemScopedIdentifier:resourceType:",  v16,  v17,  self->_resourceType);

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_resourceType));
    [v20 setObject:v18 forKeyedSubscript:v19];
  }
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  self->_resourceType));
  v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@/%@", v4, self->_outputType);

  return v5;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (NSString)outputType
{
  return self->_outputType;
}

- (double)maxPixelCount
{
  return self->_maxPixelCount;
}

- (void).cxx_destruct
{
}

@end