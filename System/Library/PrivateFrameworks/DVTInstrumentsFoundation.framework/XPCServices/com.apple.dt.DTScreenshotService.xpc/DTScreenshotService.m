@interface DTScreenshotService
- (id)_UIKitScreenshotMainscreenWithError:(id *)Mutable;
- (id)_screenshotMainscreenWithError:(id *)a3;
- (void)takeScreenshotWithReply:(id)a3;
@end

@implementation DTScreenshotService

- (void)takeScreenshotWithReply:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  id v7 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DTScreenshotService _screenshotMainscreenWithError:](self, "_screenshotMainscreenWithError:", &v7));
  id v6 = v7;
  if (v5)
  {
    notify_post("ScreenshotCaptured");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Screen capture failed with error: %@",  buf,  0xCu);
  }

  if (v4) {
    v4[2](v4, v5, v6);
  }
}

- (id)_screenshotMainscreenWithError:(id *)a3
{
  return -[DTScreenshotService _UIKitScreenshotMainscreenWithError:](self, "_UIKitScreenshotMainscreenWithError:", a3);
}

- (id)_UIKitScreenshotMainscreenWithError:(id *)Mutable
{
  id v4 = (id) _UICreateScreenUIImageWithRotation(1LL, a2);
  v5 = (CGImage *)[v4 CGImage];
  if (v5)
  {
    id v6 = v5;
    Mutable = (id *)CFDataCreateMutable(0LL, 0LL);
    id v7 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, @"public.png", 1uLL, 0LL);
    if (qword_100008700 != -1) {
      dispatch_once(&qword_100008700, &stru_100004158);
    }
    CGImageDestinationSetProperties(v7, (CFDictionaryRef)qword_100008708);
    CGImageDestinationAddImage(v7, v6, 0LL);
    CGImageDestinationFinalize(v7);
    if (v7) {
      CFRelease(v7);
    }
  }

  else if (Mutable)
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    v11 = @"Screen capture failed.";
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    *Mutable = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTScreenshotService",  1002LL,  v8));

    Mutable = 0LL;
  }

  return Mutable;
}

@end