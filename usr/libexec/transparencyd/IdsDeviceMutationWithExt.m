@interface IdsDeviceMutationWithExt
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceMutationWithExt)init;
- (NSMutableArray)extensions;
- (id)data;
- (void)setExtensions:(id)a3;
@end

@implementation IdsDeviceMutationWithExt

- (IdsDeviceMutationWithExt)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IdsDeviceMutationWithExt;
  v2 = -[IdsDeviceMutation init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[IdsDeviceMutationWithExt setExtensions:](v2, "setExtensions:", v3);
  }

  return v2;
}

- (id)data
{
  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IdsDeviceMutationWithExt;
  id v3 = -[IdsDeviceMutation data](&v9, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutationWithExt extensions](v2, "extensions"));
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
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS___IdsDeviceMutationWithExt;
  id v7 = objc_msgSendSuper2(&v19, "parseFromData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    id v9 = v6;
    id v10 = [v9 bytes];
    v11 = (char *)[v8 parsedLength] + (void)v10;
    id v12 = v9;
    id v18 = 0LL;
    v13 = objc_msgSend( v8,  "parseExtensions:end:result:",  v11,  (char *)objc_msgSend(v12, "length") + (void)objc_msgSend(v12, "bytes"),  &v18);
    id v14 = v18;
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v14));
      [v8 setExtensions:v15];

      objc_msgSend(v8, "setParsedLength:", v13 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v12), "bytes"));
      id v16 = v8;
    }

    else
    {
      id v16 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -248LL,  @"failed to parse extensions from Mutation"));
      }
    }
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (IdsDeviceMutationWithExt *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IdsDeviceMutationWithExt, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutationWithExt data](self, "data"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutationWithExt data](v7, "data"));

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
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end