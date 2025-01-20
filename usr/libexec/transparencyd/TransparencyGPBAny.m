@interface TransparencyGPBAny
+ (TransparencyGPBAny)anyWithMessage:(id)a3 error:(id *)a4;
+ (TransparencyGPBAny)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
+ (id)descriptor;
- (BOOL)packWithMessage:(id)a3 error:(id *)a4;
- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
- (TransparencyGPBAny)initWithMessage:(id)a3 error:(id *)a4;
- (TransparencyGPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
- (id)unpackMessageClass:(Class)a3 error:(id *)a4;
@end

@implementation TransparencyGPBAny

+ (TransparencyGPBAny)anyWithMessage:(id)a3 error:(id *)a4
{
  return (TransparencyGPBAny *)_[a1 anyWithMessage:a3 typeURLPrefix:@"type.googleapis.com/" error:a4];
}

+ (TransparencyGPBAny)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  return (TransparencyGPBAny *)[objc_alloc((Class)a1) initWithMessage:a3 typeURLPrefix:a4 error:a5];
}

- (TransparencyGPBAny)initWithMessage:(id)a3 error:(id *)a4
{
  return -[TransparencyGPBAny initWithMessage:typeURLPrefix:error:]( self,  "initWithMessage:typeURLPrefix:error:",  a3,  @"type.googleapis.com/",  a4);
}

- (TransparencyGPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  v8 = -[TransparencyGPBMessage init](self, "init");
  v9 = v8;
  if (v8
    && !-[TransparencyGPBAny packWithMessage:typeURLPrefix:error:]( v8,  "packWithMessage:typeURLPrefix:error:",  a3,  a4,  a5))
  {

    return 0LL;
  }

  return v9;
}

- (BOOL)packWithMessage:(id)a3 error:(id *)a4
{
  return -[TransparencyGPBAny packWithMessage:typeURLPrefix:error:]( self,  "packWithMessage:typeURLPrefix:error:",  a3,  @"type.googleapis.com/",  a4);
}

- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  v9 = (NSString *)objc_msgSend(objc_msgSend(a3, "descriptor"), "fullName");
  NSUInteger v10 = -[NSString length](v9, "length");
  if (v10)
  {
    if (a5) {
      *a5 = 0LL;
    }
    if ([a4 length])
    {
      else {
        v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", a4, v9);
      }
      v9 = v11;
    }

    -[TransparencyGPBAny setTypeURL:](self, "setTypeURL:", v9);
    -[TransparencyGPBAny setValue:](self, "setValue:", [a3 data]);
  }

  else if (a5)
  {
    *a5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TransparencyGPBWellKnownTypesErrorDomain",  -100LL,  0LL);
  }

  return v10 != 0;
}

- (id)unpackMessageClass:(Class)a3 error:(id *)a4
{
  id v7 = objc_msgSend(-[objc_class descriptor](a3, "descriptor"), "fullName");
  if ([v7 length])
  {
    id v8 = -[TransparencyGPBAny typeURL](self, "typeURL");
    v9 = (char *)[v8 rangeOfString:@"/" options:4];
    if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v9;
      if (&v9[v10] != [v8 length])
      {
        id v12 = [v8 substringFromIndex:v11 + 1];
        if (v12)
        {
          if ([v12 isEqual:v7]) {
            return -[objc_class parseFromData:error:]( a3,  "parseFromData:error:",  -[TransparencyGPBAny value](self, "value"),  a4);
          }
        }
      }
    }

    if (a4)
    {
      uint64_t v14 = -101LL;
LABEL_11:
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TransparencyGPBWellKnownTypesErrorDomain",  v14,  0LL);
    }
  }

  else if (a4)
  {
    uint64_t v14 = -100LL;
    goto LABEL_11;
  }

  return 0LL;
}

+ (id)descriptor
{
  id v2 = (id)qword_1002EE7F0;
  if (!qword_1002EE7F0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBAny,  @"Any",  off_1002E3C40,  &off_1002E3C00,  2LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024BFD8];
    qword_1002EE7F0 = (uint64_t)v2;
  }

  return v2;
}

@end