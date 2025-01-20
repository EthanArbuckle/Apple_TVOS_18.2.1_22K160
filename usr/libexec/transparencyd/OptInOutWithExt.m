@interface OptInOutWithExt
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)extensions;
- (OptInOutWithExt)init;
- (OptInOutWithExt)initWithMutation:(id)a3;
- (id)data;
- (id)debugDescription;
- (id)description;
- (void)setExtensions:(id)a3;
@end

@implementation OptInOutWithExt

- (OptInOutWithExt)initWithMutation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OptInOutWithExt;
  v5 = -[OptInOut init](&v8, "init");
  if (v5)
  {
    -[OptInOut setOptIn:](v5, "setOptIn:", [v4 optIn]);
    -[OptInOut setTimestampMs:](v5, "setTimestampMs:", [v4 timestampMs]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 extensions]);
    -[OptInOutWithExt setExtensions:](v5, "setExtensions:", v6);
  }

  return v5;
}

- (OptInOutWithExt)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OptInOutWithExt;
  v2 = -[OptInOut init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[OptInOutWithExt setExtensions:](v2, "setExtensions:", v3);
  }

  return v2;
}

- (id)data
{
  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OptInOutWithExt;
  id v3 = -[OptInOut data](&v9, "data");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutWithExt extensions](v2, "extensions"));
  LODWORD(v2) = -[TLSMessageClass encodeExtensions:buffer:](v2, "encodeExtensions:buffer:", v6, v5);

  if ((_DWORD)v2) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___OptInOutWithExt;
  id v7 = objc_msgSendSuper2(&v24, "parseFromData:error:", v6, a4);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
LABEL_7:
    id v17 = 0LL;
    goto LABEL_8;
  }

  id v9 = v6;
  id v10 = [v9 bytes];
  v11 = (char *)[v8 parsedLength] + (void)v10;
  id v12 = v9;
  id v23 = 0LL;
  v13 = objc_msgSend( v8,  "parseExtensions:end:result:",  v11,  (char *)objc_msgSend(v12, "length") + (void)objc_msgSend(v12, "bytes"),  &v23);
  id v14 = v23;
  if (!v13)
  {
    uint64_t v18 = kTransparencyErrorDecode;
    v25 = @"data";
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
    v26 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  v18,  -248LL,  0LL,  v20,  @"failed to parse extensions from OptInOut"));

    if (a4) {
      *a4 = v21;
    }

    goto LABEL_7;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v14));
  [v8 setExtensions:v15];

  v16 = [v12 bytes];
  [v8 setParsedLength:v13 - v16];
  id v17 = v8;
LABEL_8:

  return v17;
}

- (id)debugDescription
{
  if (-[OptInOut optIn](self, "optIn")) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\t\toptIn:%@\n\t\ttimestampMs:%llu\n}",  v3,  -[OptInOut timestampMs](self, "timestampMs"));
}

- (id)description
{
  if (-[OptInOut optIn](self, "optIn")) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"optIn:%@; timestampMs:%llu",
           v3,
           -[OptInOut timestampMs](self, "timestampMs"));
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (OptInOutWithExt *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___OptInOutWithExt, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutWithExt data](self, "data"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutWithExt data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end