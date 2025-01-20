@interface FetchImageUploadURLsTask
- (void)main;
@end

@implementation FetchImageUploadURLsTask

- (void)main
{
  if (self)
  {
    id v3 = *(id *)&self->super.super._success;
    v4 = v3;
    v5 = v3 ? (void *)*((void *)v3 + 5) : 0LL;
    id v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 imagesData]);
    unsigned int v8 = [v7 count];

    if (v8)
    {
      v9 = objc_opt_new(&OBJC_CLASS___TFGetImageUploadUrlsRequest);
      id v10 = *(id *)&self->super.super._success;
      id v11 = sub_1001B0354(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = [v12 unsignedLongLongValue];
      if (v9)
      {
        *(_BYTE *)&v9->_has |= 2u;
        v9->_dsid = (unint64_t)v13;

        *(_BYTE *)&v9->_has |= 4u;
        v9->_count = v8;
        sub_1001EC6C4((uint64_t)v9, @"image/jpeg");
        id v14 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        id v72 = 0LL;
        id v16 = sub_100255E30((uint64_t)v15, (uint64_t)@"testflight-visual-feedback/get-image-upload-urls-url", &v72);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        id v18 = v72;

        if (v18)
        {
          id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find URL to fetch image upload URLs: %@",  v18));
          uint64_t v20 = ASDErrorWithDescription(ASDErrorDomain, 850LL, v19);
          id v21 = (id)objc_claimAutoreleasedReturnValue(v20);
          -[Task completeWithError:](self, "completeWithError:", v21);
          v22 = v17;
        }

        else
        {
          v23 = sub_100260028((id *)&self->super.super.super.super.isa, v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[TFGetImageUploadUrlsRequest data](v9, "data"));
          id v71 = 0LL;
          id v25 = sub_10025FAEC((_TtC9appstored6LogKey **)self, 4LL, v22, v24, &v71);
          id v21 = (id)objc_claimAutoreleasedReturnValue(v25);
          id v19 = v71;

          if (v19)
          {
            -[Task completeWithError:](self, "completeWithError:", v19);
          }

          else
          {
            id v21 = v21;
            if ([v21 responseStatusCode] == (id)200)
            {
              v26 = objc_alloc(&OBJC_CLASS___TFGetImageUploadUrlsResponse);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v21 data]);
              v28 = -[TFGetImageUploadUrlsResponse initWithData:](v26, "initWithData:", v27);

              v67 = v28;
              if (v28) {
                uploadUrls = v28->_uploadUrls;
              }
              else {
                uploadUrls = 0LL;
              }
              v30 = uploadUrls;
              id v31 = -[NSMutableArray count](v30, "count");
              id v32 = *(id *)&self->super.super._success;
              v33 = v32;
              v69 = self;
              if (v32) {
                v34 = (void *)*((void *)v32 + 5);
              }
              else {
                v34 = 0LL;
              }
              id v35 = v34;
              v36 = (void *)objc_claimAutoreleasedReturnValue([v35 imagesData]);
              id v37 = [v36 count];

              if (v31 == v37)
              {
                v38 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
                __int128 v73 = 0u;
                __int128 v74 = 0u;
                __int128 v75 = 0u;
                __int128 v76 = 0u;
                v66 = v22;
                if (v67) {
                  v39 = v67->_uploadUrls;
                }
                else {
                  v39 = 0LL;
                }
                v40 = v39;
                id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v73,  v81,  16LL);
                if (v41)
                {
                  id v42 = v41;
                  uint64_t v43 = *(void *)v74;
                  id v68 = v21;
                  do
                  {
                    for (i = 0LL; i != v42; i = (char *)i + 1)
                    {
                      if (*(void *)v74 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      uint64_t v45 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)i);
                      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v45));
                      if (v46)
                      {
                        -[NSMutableArray addObject:](v38, "addObject:", v46);
                      }

                      else
                      {
                        uint64_t v47 = ASDLogHandleForCategory(38LL);
                        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                        {
                          v70 = (_TtC9appstored6LogKey *)*(id *)&v69->super.super._success;
                          v49 = sub_1001B03DC(v70);
                          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                          *(_DWORD *)buf = 138412546;
                          v78 = v50;
                          __int16 v79 = 2114;
                          uint64_t v80 = v45;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "[%@]: Unable to create a valid URL with the provided string %{public}@",  buf,  0x16u);

                          id v21 = v68;
                        }
                      }
                    }

                    id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v73,  v81,  16LL);
                  }

                  while (v42);
                }

                v51 = (NSError *)-[NSMutableArray copy](v38, "copy");
                error = v69->super.super._error;
                v69->super.super._error = v51;

                -[Task completeWithSuccess](v69, "completeWithSuccess");
                v22 = v66;
              }

              else
              {
                uint64_t v59 = ASDErrorWithDescription( ASDErrorDomain,  507LL,  @"The number of URLs received doesn't match the number we need");
                v38 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v59);
                -[Task completeWithError:](v69, "completeWithError:", v38);
              }

              id v18 = 0LL;
              v58 = v67;
            }

            else
            {
              v53 = v22;
              uint64_t v54 = ASDErrorDomain;
              id v55 = [v21 responseStatusCode];
              uint64_t v56 = v54;
              v22 = v53;
              uint64_t v57 = ASDErrorWithDescription(v56, v55, @"We received a non-200 response from the server");
              v58 = (TFGetImageUploadUrlsResponse *)objc_claimAutoreleasedReturnValue(v57);
              -[Task completeWithError:](self, "completeWithError:", v58);
            }

            id v19 = 0LL;
          }
        }

        goto LABEL_43;
      }

      sub_1001EC6C4(0LL, @"image/jpeg");
    }
  }

  uint64_t v60 = ASDLogHandleForCategory(38LL);
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      v62 = *(void **)&self->super.super._success;
    }
    else {
      v62 = 0LL;
    }
    v63 = v62;
    v64 = sub_1001B03DC(v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    *(_DWORD *)v81 = 138412290;
    v82 = v65;
    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "[%@]: No images to upload, skipping FetchImageUploadURLsTask",  v81,  0xCu);
  }

  -[Task completeWithSuccess](self, "completeWithSuccess");
  v9 = 0LL;
LABEL_43:
}

- (void).cxx_destruct
{
}

@end