@interface PVAppIdentityDigest
+ (BOOL)supportsSecureCoding;
+ (id)digestWithErrorCode:(int64_t)a3;
+ (id)digestWithTimeoutError;
- (PVAppIdentityDigest)initWithCoder:(id)a3;
- (PVAppIdentityDigest)initWithError:(id)a3 version:(id)a4;
- (PVAppIdentityDigest)initWithVersion:(id)a3 data0:(id)a4 data1:(id)a5 data2:(id)a6 data3:(id)a7 data4:(id)a8 data5:(id)a9;
- (id)asDictionary;
- (id)getError;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PVAppIdentityDigest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVAppIdentityDigest)initWithVersion:(id)a3 data0:(id)a4 data1:(id)a5 data2:(id)a6 data3:(id)a7 data4:(id)a8 data5:(id)a9
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PVAppIdentityDigest;
  v18 = -[PVAppIdentityDigest init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->version, a3);
    objc_storeStrong((id *)&v19->data0, a4);
    objc_storeStrong((id *)&v19->data1, a5);
    objc_storeStrong((id *)&v19->data2, a6);
    objc_storeStrong((id *)&v19->data3, a7);
    objc_storeStrong((id *)&v19->data4, a8);
    objc_storeStrong((id *)&v19->data5, a9);
    error = v19->error;
    v19->error = 0LL;
  }

  return v19;
}

- (PVAppIdentityDigest)initWithError:(id)a3 version:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PVAppIdentityDigest;
  v8 = -[PVAppIdentityDigest init](&v18, "init");
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSError pvai_wrappedError:error:](&OBJC_CLASS___NSError, "pvai_wrappedError:error:", -10000LL, v6));
    objc_storeStrong((id *)&v8->version, a4);
    data0 = v8->data0;
    v8->data0 = 0LL;

    data1 = v8->data1;
    v8->data1 = 0LL;

    data2 = v8->data2;
    v8->data2 = 0LL;

    data3 = v8->data3;
    v8->data3 = 0LL;

    data4 = v8->data4;
    v8->data4 = 0LL;

    data5 = v8->data5;
    v8->data5 = 0LL;

    error = v8->error;
    v8->error = (NSError *)v9;
  }

  return v8;
}

+ (id)digestWithErrorCode:(int64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___PVAppIdentityDigest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError pvai_errorWithCode:](&OBJC_CLASS___NSError, "pvai_errorWithCode:", a3));
  id v6 = -[PVAppIdentityDigest initWithError:version:](v4, "initWithError:version:", v5, &off_10001D5D8);

  return v6;
}

+ (id)digestWithTimeoutError
{
  return +[PVAppIdentityDigest digestWithErrorCode:]( &OBJC_CLASS___PVAppIdentityDigest,  "digestWithErrorCode:",  -10003LL);
}

- (void)encodeWithCoder:(id)a3
{
  version = self->version;
  id v5 = a3;
  [v5 encodeObject:version forKey:@"version"];
  [v5 encodeObject:self->data0 forKey:@"data0"];
  [v5 encodeObject:self->data1 forKey:@"data1"];
  [v5 encodeObject:self->data2 forKey:@"data2"];
  [v5 encodeObject:self->data3 forKey:@"data3"];
  [v5 encodeObject:self->data4 forKey:@"data4"];
  [v5 encodeObject:self->data5 forKey:@"data5"];
  [v5 encodeObject:self->error forKey:@"error"];
}

- (PVAppIdentityDigest)initWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PVAppIdentityDigest;
  id v3 = a3;
  v4 = -[PVAppIdentityDigest init](&v30, "init");
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, @"version", v30.receiver, v30.super_class));
  version = v4->version;
  v4->version = (NSNumber *)v6;

  id v8 = [v3 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data0"];
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  data0 = v4->data0;
  v4->data0 = (NSData *)v9;

  id v11 = [v3 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data1"];
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  data1 = v4->data1;
  v4->data1 = (NSData *)v12;

  id v14 = [v3 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data2"];
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  data2 = v4->data2;
  v4->data2 = (NSData *)v15;

  id v17 = [v3 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data3"];
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
  data3 = v4->data3;
  v4->data3 = (NSData *)v18;

  id v20 = [v3 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data4"];
  uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
  data4 = v4->data4;
  v4->data4 = (NSData *)v21;

  id v23 = [v3 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data5"];
  uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
  data5 = v4->data5;
  v4->data5 = (NSData *)v24;

  id v26 = [v3 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"error"];
  uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

  error = v4->error;
  v4->error = (NSError *)v27;

  return v4;
}

- (id)asDictionary
{
  error = self->error;
  if (error)
  {
    id v4 = -[NSError code](error, "code");
    version = self->version;
    v17[0] = @"version";
    v17[1] = @"error";
    v18[0] = version;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
    v18[1] = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  }

  else
  {
    data0 = self->data0;
    v16[0] = self->version;
    v15[0] = @"version";
    v15[1] = @"data0";
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](data0, "base64EncodedStringWithOptions:", 0LL));
    v16[1] = v6;
    v15[2] = @"data1";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->data1, "base64EncodedStringWithOptions:", 0LL));
    v16[2] = v9;
    v15[3] = @"data2";
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->data2, "base64EncodedStringWithOptions:", 0LL));
    v16[3] = v10;
    v15[4] = @"data3";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->data3, "base64EncodedStringWithOptions:", 0LL));
    v16[4] = v11;
    v15[5] = @"data4";
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->data4, "base64EncodedStringWithOptions:", 0LL));
    v16[5] = v12;
    v15[6] = @"data5";
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->data5, "base64EncodedStringWithOptions:", 0LL));
    v16[6] = v13;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  7LL));
  }

  return v7;
}

- (id)getError
{
  return self->error;
}

- (void).cxx_destruct
{
}

@end