@interface SKDownload
+ (NSURL)contentURLForProductID:(NSString *)productID;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSNumber)_downloadID;
- (NSString)contentIdentifier;
- (NSString)contentVersion;
- (NSTimeInterval)timeRemaining;
- (NSURL)contentURL;
- (SKDownload)init;
- (SKDownload)initWithXPCEncoding:(id)a3;
- (SKDownloadState)downloadState;
- (SKDownloadState)state;
- (SKPaymentTransaction)transaction;
- (float)progress;
- (id)copyXPCEncoding;
- (uint64_t)contentLength;
- (void)_applyChangeset:(id)a3;
- (void)_setContentIdentifier:(id)a3;
- (void)_setContentLength:(id)a3;
- (void)_setContentURL:(id)a3;
- (void)_setDownloadID:(id)a3;
- (void)_setDownloadState:(int64_t)a3;
- (void)_setError:(id)a3;
- (void)_setProgress:(float)a3;
- (void)_setTimeRemaining:(double)a3;
- (void)_setTransaction:(id)a3;
- (void)_setVersion:(id)a3;
@end

@implementation SKDownload

- (SKDownload)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKDownload;
  v2 = -[SKDownload init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SKDownloadInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;

    *((NSTimeInterval *)v2->_internal + 7) = SKDownloadTimeRemainingUnknown;
  }

  return v2;
}

- (NSNumber)_downloadID
{
  return (NSNumber *)*((id *)self->_internal + 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (SKDownloadState)state
{
  return *((void *)self->_internal + 3);
}

- (SKDownloadState)downloadState
{
  return *((void *)self->_internal + 3);
}

- (NSURL)contentURL
{
  return (NSURL *)*((id *)self->_internal + 6);
}

- (float)progress
{
  return *((float *)self->_internal + 8);
}

- (uint64_t)contentLength
{
  return (uint64_t)[*((id *)self->_internal + 8) longLongValue];
}

- (NSString)contentVersion
{
  return (NSString *)*((id *)self->_internal + 9);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 5);
}

- (NSTimeInterval)timeRemaining
{
  return *((double *)self->_internal + 7);
}

- (SKPaymentTransaction)transaction
{
  return (SKPaymentTransaction *)objc_loadWeakRetained((id *)self->_internal + 10);
}

- (void)_applyChangeset:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 contentLength]);
  if (v4) {
    -[SKDownload _setContentLength:](self, "_setContentLength:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 contentURL]);

  if (v5) {
    -[SKDownload _setContentURL:](self, "_setContentURL:", v5);
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadState]);

  if (v6) {
    -[SKDownload _setDownloadState:](self, "_setDownloadState:", [v6 integerValue]);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);

  if (v7) {
    -[SKDownload _setError:](self, "_setError:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v10 progress]);

  if (v8)
  {
    [v8 floatValue];
    -[SKDownload _setProgress:](self, "_setProgress:");
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v10 timeRemaining]);

  if (v9)
  {
    [v9 doubleValue];
    -[SKDownload _setTimeRemaining:](self, "_setTimeRemaining:");
  }
}

- (void)_setDownloadID:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  objc_super v6 = (void *)internal[1];
  internal[1] = v4;
}

- (void)_setContentIdentifier:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  objc_super v6 = (void *)internal[2];
  internal[2] = v4;
}

- (void)_setContentLength:(id)a3
{
}

- (void)_setContentURL:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  objc_super v6 = (void *)internal[6];
  internal[6] = v4;
}

- (void)_setDownloadState:(int64_t)a3
{
  *((void *)self->_internal + 3) = a3;
}

- (void)_setError:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  objc_super v6 = (void *)internal[5];
  internal[5] = v4;
}

- (void)_setProgress:(float)a3
{
  *((float *)self->_internal + 8) = a3;
}

- (void)_setTimeRemaining:(double)a3
{
  *((double *)self->_internal + 7) = a3;
}

- (void)_setTransaction:(id)a3
{
  id v4 = (id *)((char *)self->_internal + 80);
  id v5 = a3;
  objc_storeWeak(v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 payment]);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v7 productIdentifier]);
  -[SKDownload _setContentIdentifier:](self, "_setContentIdentifier:", v6);
}

- (void)_setVersion:(id)a3
{
  id v4 = [a3 copy];
  id internal = self->_internal;
  objc_super v6 = (void *)internal[9];
  internal[9] = v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SKDownload);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDownload _downloadID](self, "_downloadID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _downloadID]);
    if ([v7 isEqual:v8])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDownload contentIdentifier](self, "contentIdentifier"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 contentIdentifier]);
      unsigned __int8 v11 = [v9 isEqual:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (NSURL)contentURLForProductID:(NSString *)productID
{
  return 0LL;
}

- (SKDownload)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v6 = -[SKDownload init](self, "init");
    if (!v6) {
      goto LABEL_5;
    }
    v8 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  xpc_dictionary_get_int64(v5, "0"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    id internal = v6->_internal;
    unsigned __int8 v11 = (void *)internal[8];
    internal[8] = v9;

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    CFDictionaryRef v13 = sub_1000E358C(v5, "2", v12);
    v14 = v6->_internal;
    v15 = (void *)v14[1];
    v14[1] = v13;

    *((void *)v6->_internal + 3) = xpc_dictionary_get_int64(v5, "3");
    float v16 = xpc_dictionary_get_double(v5, "5");
    *((float *)v6->_internal + 8) = v16;
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v18 = sub_1000E358C(v5, "7", v17);
    v19 = v6->_internal;
    v20 = (void *)v19[9];
    v19[9] = v18;

    xpc_object_t value = xpc_dictionary_get_value(v5, "6");
    v22 = (SKDownload *)objc_claimAutoreleasedReturnValue(value);
    self = v22;
    else {
      double v23 = SKDownloadTimeRemainingUnknown;
    }
    *((double *)v6->_internal + 7) = v23;
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
    CFDictionaryRef v25 = sub_1000E358C(v5, "1", v24);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v25, v26);
    if ((isKindOfClass & 1) != 0) {
      v28 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v25);
    }
    else {
      v28 = 0LL;
    }
    objc_storeStrong((id *)v6->_internal + 6, v28);
    if ((isKindOfClass & 1) != 0) {

    }
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSData);
    CFDictionaryRef v30 = sub_1000E358C(v5, "4", v29);

    if (v30)
    {
      id v31 = sub_1000E2D24((uint64_t)v30);
      uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = v6->_internal;
      v34 = (void *)v33[5];
      v33[5] = v32;
    }
  }

  else
  {
    id v6 = 0LL;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v3, "0", (int64_t)[*((id *)self->_internal + 8) longLongValue]);
  sub_1000E35D4(v3, "1", (__CFString *)[*((id *)self->_internal + 6) absoluteString]);
  sub_1000E35D4(v3, "2", *((__CFString **)self->_internal + 1));
  xpc_dictionary_set_int64(v3, "3", *((void *)self->_internal + 3));
  id v4 = (__CFString *)sub_1000E283C(*((void *)self->_internal + 5));
  sub_1000E35D4(v3, "4", v4);
  xpc_dictionary_set_double(v3, "5", *((float *)self->_internal + 8));
  xpc_dictionary_set_double(v3, "6", *((double *)self->_internal + 7));
  sub_1000E35D4(v3, "7", *((__CFString **)self->_internal + 9));
  return v3;
}

- (void).cxx_destruct
{
}

@end