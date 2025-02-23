@interface PAMediaConversionServiceSetCreationDateImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithCreationDate:(id)a3 inTimeZone:(id)a4;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSDate)creationDate;
- (NSTimeZone)timeZone;
- (PAMediaConversionServiceSetCreationDateImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation PAMediaConversionServiceSetCreationDateImageMetadataPolicy

+ (id)policyWithCreationDate:(id)a3 inTimeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_opt_new(a1);
  [v8 setCreationDate:v7];

  if (v6)
  {
    [v8 setTimeZone:v6];
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
    [v8 setTimeZone:v9];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAMediaConversionServiceSetCreationDateImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"creationDate"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"creationDate"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSTimeZone) forKey:@"creationDateTimeZone"];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy setCreationDate:](self, "setCreationDate:", v6);
    -[PAMediaConversionServiceSetCreationDateImageMetadataPolicy setTimeZone:](self, "setTimeZone:", v8);
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate"));
  [v4 encodeObject:v5 forKey:@"creationDate"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy timeZone](self, "timeZone"));
  [v4 encodeObject:v6 forKey:@"creationDateTimeZone"];
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCGImagePropertyExifDictionary]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCGImagePropertyTIFFDictionary]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCGImagePropertyIPTCDictionary]);
    id v8 = objc_alloc_init(&OBJC_CLASS___PFImageMetadataBuilder);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy timeZone](self, "timeZone"));
    [v8 setCreationDate:v9 timeZone:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 exifDictionary]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 tiffDictionary]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 iptcDictionary]);
    v28[0] = kCGImagePropertyExifDateTimeOriginal;
    v28[1] = kCGImagePropertyExifSubsecTimeOriginal;
    v28[2] = kCGImagePropertyExifOffsetTimeOriginal;
    v28[3] = kCGImagePropertyExifDateTimeDigitized;
    v28[4] = kCGImagePropertyExifSubsecTimeDigitized;
    v28[5] = kCGImagePropertyExifOffsetTimeDigitized;
    v28[6] = kCGImagePropertyExifSubsecTime;
    v28[7] = kCGImagePropertyExifOffsetTime;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 8LL));
    v25 = v6;
    int v15 = sub_1000090D8(v6, v11, v14);

    if (v15)
    {
      CFStringRef v27 = kCGImagePropertyTIFFDateTime;
      char v16 = 1;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
      v18 = v7;
      int v19 = sub_1000090D8(v7, v12, v17);

      v20 = v24;
      if (v19)
      {
        v26[0] = kCGImagePropertyIPTCDateCreated;
        v26[1] = kCGImagePropertyIPTCTimeCreated;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
        char v22 = sub_1000090D8(v24, v13, v21);

        char v16 = v22 ^ 1;
      }
    }

    else
    {
      v18 = v7;
      char v16 = 1;
      v20 = v24;
    }
  }

  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v7 = v6;
    if (v4) {
      [v6 addEntriesFromDictionary:v4];
    }
    id v8 = objc_alloc_init(&OBJC_CLASS___PFImageMetadataBuilder);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy creationDate](self, "creationDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceSetCreationDateImageMetadataPolicy timeZone](self, "timeZone"));
    [v8 setCreationDate:v9 timeZone:v10];

    v19[0] = kCGImagePropertyExifDictionary;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 exifDictionary]);
    v20[0] = v11;
    v19[1] = kCGImagePropertyTIFFDictionary;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 tiffDictionary]);
    v20[1] = v12;
    v19[2] = kCGImagePropertyIPTCDictionary;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 iptcDictionary]);
    v20[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000901C;
    v17[3] = &unk_1000289E8;
    id v15 = v7;
    id v18 = v15;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];
  }

  else
  {
    id v15 = v4;
  }

  return v15;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
}

@end