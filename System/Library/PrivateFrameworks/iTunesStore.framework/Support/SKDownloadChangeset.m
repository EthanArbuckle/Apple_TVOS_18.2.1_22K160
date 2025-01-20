@interface SKDownloadChangeset
+ (id)changesetWithDownloadID:(id)a3 state:(int64_t)a4;
- (NSError)error;
- (NSNumber)contentLength;
- (NSNumber)downloadID;
- (NSNumber)downloadState;
- (NSNumber)progress;
- (NSNumber)timeRemaining;
- (NSURL)contentURL;
- (SKDownloadChangeset)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setContentLength:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setDownloadState:(id)a3;
- (void)setError:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTimeRemaining:(id)a3;
@end

@implementation SKDownloadChangeset

+ (id)changesetWithDownloadID:(id)a3 state:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___SKDownloadChangeset);
  -[SKDownloadChangeset setDownloadID:](v6, "setDownloadID:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[SKDownloadChangeset setDownloadState:](v6, "setDownloadState:", v7);

  return v6;
}

- (SKDownloadChangeset)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v33.receiver = self;
    v33.super_class = (Class)&OBJC_CLASS___SKDownloadChangeset;
    v6 = -[SKDownloadChangeset init](&v33, "init");
    if (v6)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
      CFDictionaryRef v9 = sub_1000E358C(v5, "1", v8);
      if (v9)
      {
        v10 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v9);
        contentURL = v6->_contentURL;
        v6->_contentURL = v10;
      }

      else
      {
        contentURL = v6->_contentURL;
        v6->_contentURL = 0LL;
      }

      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSData);
      CFDictionaryRef v13 = sub_1000E358C(v5, "4", v12);
      CFDictionaryRef v14 = v13;
      if (v13)
      {
        id v15 = sub_1000E2D24((uint64_t)v13);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
        error = v6->_error;
        v6->_error = (NSError *)v16;
      }

      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
      CFDictionaryRef v19 = sub_1000E358C(v5, "0", v18);
      contentLength = v6->_contentLength;
      v6->_contentLength = (NSNumber *)v19;

      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
      CFDictionaryRef v22 = sub_1000E358C(v5, "2", v21);
      downloadID = v6->_downloadID;
      v6->_downloadID = (NSNumber *)v22;

      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
      CFDictionaryRef v25 = sub_1000E358C(v5, "3", v24);
      downloadState = v6->_downloadState;
      v6->_downloadState = (NSNumber *)v25;

      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber);
      CFDictionaryRef v28 = sub_1000E358C(v5, "5", v27);
      progress = v6->_progress;
      v6->_progress = (NSNumber *)v28;

      uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber);
      CFDictionaryRef v31 = sub_1000E358C(v5, "6", v30);
      timeRemaining = v6->_timeRemaining;
      v6->_timeRemaining = (NSNumber *)v31;
    }
  }

  else
  {

    v6 = 0LL;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  sub_1000E35D4(v3, "0", (__CFString *)self->_contentLength);
  sub_1000E35D4(v3, "1", (__CFString *)-[NSURL absoluteString](self->_contentURL, "absoluteString"));
  sub_1000E35D4(v3, "2", (__CFString *)self->_downloadID);
  sub_1000E35D4(v3, "3", (__CFString *)self->_downloadState);
  id v4 = (__CFString *)sub_1000E283C((uint64_t)self->_error);
  sub_1000E35D4(v3, "4", v4);
  sub_1000E35D4(v3, "5", (__CFString *)self->_progress);
  sub_1000E35D4(v3, "6", (__CFString *)self->_timeRemaining);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSNumber copyWithZone:](self->_contentLength, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSURL copyWithZone:](self->_contentURL, "copyWithZone:", a3);
  CFDictionaryRef v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[NSNumber copyWithZone:](self->_downloadID, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = -[NSNumber copyWithZone:](self->_downloadState, "copyWithZone:", a3);
  CFDictionaryRef v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
  id v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = -[NSNumber copyWithZone:](self->_progress, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  id v18 = -[NSNumber copyWithZone:](self->_timeRemaining, "copyWithZone:", a3);
  CFDictionaryRef v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSNumber)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(id)a3
{
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSNumber)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSNumber)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(id)a3
{
}

- (void).cxx_destruct
{
}

@end