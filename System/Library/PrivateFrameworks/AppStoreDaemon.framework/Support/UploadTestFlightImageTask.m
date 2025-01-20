@interface UploadTestFlightImageTask
- (id)acceptHeaderValue;
- (id)contentTypeHeaderValue;
- (void)main;
@end

@implementation UploadTestFlightImageTask

- (void)main
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableURLRequest);
  error = self->super.super._error;
  if (error) {
    error = (NSError *)error->_domain;
  }
  v5 = error;
  v6 = -[NSMutableURLRequest initWithURL:](v3, "initWithURL:", v5);

  v7 = self->super.super._error;
  if (v7) {
    v7 = (NSError *)v7->_reserved;
  }
  v8 = v7;
  -[NSMutableURLRequest setHTTPBody:](v6, "setHTTPBody:", v8);

  -[NSMutableURLRequest setHTTPMethod:](v6, "setHTTPMethod:", @"PUT");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UploadTestFlightImageTask contentTypeHeaderValue](self, "contentTypeHeaderValue"));
  -[NSMutableURLRequest setHTTPContentType:](v6, "setHTTPContentType:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  objc_msgSend(v10, "set_sourceApplicationBundleIdentifier:", @"com.apple.TVAppStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v10));
  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  v58 = sub_1001E0EB0;
  v59 = sub_1001E0EC0;
  id v60 = 0LL;
  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  v52 = sub_1001E0EB0;
  v53 = sub_1001E0EC0;
  id v54 = 0LL;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1001E0EC8;
  v45[3] = &unk_1003EB098;
  v47 = &v49;
  v48 = &v55;
  v12 = dispatch_semaphore_create(0LL);
  v46 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 dataTaskWithRequest:v6 completionHandler:v45]);
  [v13 resume];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v15 = v56[5];
  if (v15) {
    goto LABEL_6;
  }
  uint64_t v18 = v50[5];
  if (v18)
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v14);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      id v17 = (id)v50[5];
      if ([v17 statusCode] == (id)200)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 allHeaderFields]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"x-icloud-versionid"]);

        if (v43)
        {
          v21 = objc_opt_new(&OBJC_CLASS___TFImageUpload);
          v22 = self->super.super._error;
          if (v22) {
            v22 = (NSError *)v22->_domain;
          }
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSError absoluteString](v23, "absoluteString"));
          sub_100191FF4((uint64_t)v21, v24);

          sub_10019200C((uint64_t)v21, v43);
          entity = self->super._entity;
          self->super._entity = (BetaAppFeedbackMemoryEntity *)v21;

          -[Task completeWithSuccess](self, "completeWithSuccess");
          goto LABEL_26;
        }

        v34 = self->super.super._error;
        if (v34) {
          v34 = (NSError *)v34->_domain;
        }
        v35 = v34;
        id v36 = *(id *)&self->super.super._success;
        v42 = v36;
        if (v36) {
          v37 = (void *)*((void *)v36 + 5);
        }
        else {
          v37 = 0LL;
        }
        v44 = v35;
        id v38 = v37;
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 appVersion]);
        v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Successfully uploaded image to %@ for %@ but failed to find the versionid header",  v44,  v39));

        uint64_t v40 = ASDErrorWithDescription(ASDErrorDomain, 1071LL, v33);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        -[Task completeWithError:](self, "completeWithError:", v41);

        v43 = 0LL;
      }

      else
      {
        id v26 = *(id *)&self->super.super._success;
        v27 = v26;
        if (v26) {
          v28 = (void *)*((void *)v26 + 5);
        }
        else {
          v28 = 0LL;
        }
        id v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 appVersion]);
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to upload the image for %@",  v30));

        id v31 = [v17 statusCode];
        uint64_t v32 = ASDErrorWithDescription(ASDErrorDomain, v31, v43);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        -[Task completeWithError:](self, "completeWithError:", v33);
      }

LABEL_26:
      goto LABEL_7;
    }

    uint64_t v15 = v56[5];
  }

  else
  {
    uint64_t v15 = 0LL;
  }

- (id)acceptHeaderValue
{
  return 0LL;
}

- (id)contentTypeHeaderValue
{
  return @"image/jpeg";
}

- (void).cxx_destruct
{
}

@end