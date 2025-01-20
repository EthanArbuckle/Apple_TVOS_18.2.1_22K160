@interface _NSAttributedStringAgent
- (void)readFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 extensionTokens:(id)a6 withReply:(id)a7;
- (void)renderHTML:(id)a3 options:(id)a4 extensionTokens:(id)a5 withReply:(id)a6;
- (void)startWithReply:(id)a3;
@end

@implementation _NSAttributedStringAgent

- (void)startWithReply:(id)a3
{
}

- (void)renderHTML:(id)a3 options:(id)a4 extensionTokens:(id)a5 withReply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!sub_10000270C()) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Failed to load WebKit.");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  sandbox_extension_consume(objc_msgSend(objc_retainAutorelease(*(id *)(*((void *)&v38 + 1)
                                                                                    + 8LL * (void)v18)), "bytes")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        [v13 addObject:v20];

        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v16);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000027C0;
  v35[3] = &unk_100004208;
  id v21 = v13;
  id v36 = v21;
  id v22 = v12;
  id v37 = v22;
  v23 = objc_retainBlock(v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"DocumentType"]);
  unsigned int v25 = [v24 isEqualToString:@"NSWebArchive"];

  if (v25)
  {
    v26 = (NSURL *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"BaseURL"]);
    if (!v26) {
      v26 = objc_alloc_init(&OBJC_CLASS___NSURL);
    }
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"TextEncodingName"]);
    if (v27) {
      v28 = (__CFString *)v27;
    }
    else {
      v28 = &stru_100004388;
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100002904;
    v31[3] = &unk_100004230;
    id v32 = v9;
    v33 = v28;
    v34 = v26;
    v29 = v26;
    v30 = v28;
    +[NSAttributedString _loadFromHTMLWithOptions:contentLoader:completionHandler:]( &OBJC_CLASS___NSAttributedString,  "_loadFromHTMLWithOptions:contentLoader:completionHandler:",  v10,  v31,  v23);
  }

  else
  {
    +[NSAttributedString loadFromHTMLWithData:options:completionHandler:]( &OBJC_CLASS___NSAttributedString,  "loadFromHTMLWithData:options:completionHandler:",  v9,  v10,  v23);
  }
}

- (void)readFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 extensionTokens:(id)a6 withReply:(id)a7
{
  id v29 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!sub_10000270C()) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Failed to load WebKit.");
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v16 = v13;
  id v17 = [v16 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  sandbox_extension_consume(objc_msgSend(objc_retainAutorelease(*(id *)(*((void *)&v33 + 1)
                                                                                    + 8LL * (void)i)), "bytes")));
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        [v15 addObject:v21];
      }

      id v17 = [v16 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }

    while (v17);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100002C00;
  v30[3] = &unk_100004258;
  id v22 = v15;
  id v31 = v22;
  id v23 = v14;
  id v32 = v23;
  id v24 = v11;
  id v25 = v29;
  id v26 = v12;
  uint64_t v27 = v30;
  uint64_t v38 = 0LL;
  __int128 v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  v28 = (void (*)(id, id, id, void *))off_100008880;
  __int128 v41 = off_100008880;
  if (!off_100008880)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100002E38;
    v37[3] = &unk_1000041C8;
    v37[4] = &v38;
    sub_100002E38((uint64_t)v37);
    v28 = (void (*)(id, id, id, void *))v39[3];
  }

  _Block_object_dispose(&v38, 8);
  if (!v28) {
    sub_100002F28();
  }
  v28(v24, v25, v26, v27);
}

@end