@interface JaliscoLoadBooksOperation
- (BOOL)parserSuccess;
- (NSArray)books;
- (NSArray)queryStoreIDs;
- (id)_queryFilterEncodedStringForDAAPNameString:(id)a3;
- (id)metadataFilter;
- (id)queryFilter;
- (void)main;
- (void)setBooks:(id)a3;
- (void)setParserSuccess:(BOOL)a3;
- (void)setQueryStoreIDs:(id)a3;
@end

@implementation JaliscoLoadBooksOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoLoadBooksOperation queryStoreIDs](self, "queryStoreIDs"));
  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoLoadBooksOperation queryStoreIDs](self, "queryStoreIDs")),
        id v5 = [v4 count],
        v4,
        v3,
        !v5))
  {
    -[JaliscoLoadBooksOperation setBooks:](self, "setBooks:", &__NSArray0__struct);
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
  }

  else
  {
    id v6 = [[MSVXPCTransaction alloc] initWithName:@"JaliscoLoadBooksOperation"];
    [v6 beginTransaction];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    v8 = NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v44[0] = v9;
    v44[1] = @"com.apple.MediaServices";
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    v44[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 3LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v12));

    v43[0] = v13;
    v43[1] = @"books.daap";
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v14));

    id v16 = [v7 databaseID];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoLoadBooksOperation metadataFilter](self, "metadataFilter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoLoadBooksOperation queryFilter](self, "queryFilter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[ICItemsRequest requestWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:]( &OBJC_CLASS___ICItemsRequest,  "requestWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:",  v16,  v17,  v18,  0LL,  0LL));

    [v19 setResponseDataDestinationFileURL:v15];
    [v19 setVerificationInteractionLevel:2];
    v20 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class(v19, v21);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if ([v19 method]) {
        v25 = @"POST";
      }
      else {
        v25 = @"GET";
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue([v19 action]);
      *(_DWORD *)buf = 138544386;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2114;
      v41 = (uint64_t (*)(uint64_t, uint64_t))v25;
      *(_WORD *)v42 = 2114;
      *(void *)&v42[2] = v26;
      *(_WORD *)&v42[10] = 2048;
      *(void *)&v42[12] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Sending Books ItemsRequest [<%{public}@: %p method=%{public}@ action=%{public}@>] on Connection: [%p]",  buf,  0x34u);
    }

    dispatch_semaphore_t v27 = dispatch_semaphore_create(0LL);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v41 = sub_1000BD168;
    *(void *)v42 = sub_1000BD178;
    *(void *)&v42[8] = 0LL;
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472LL;
    v36 = sub_1000BD180;
    v37 = &unk_1001A6EA0;
    v39 = buf;
    v28 = v27;
    v38 = v28;
    [v7 sendRequest:v19 withResponseHandler:&v34];
    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    if (objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "responseCode", v34, v35, v36, v37) == (id)200)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) responseDataFileURL]);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", v29));

      id v31 = [[DKDAAPParser alloc] initWithStream:v30];
      v32 = -[BooksParserDelegate initWithOperation:]( objc_alloc(&OBJC_CLASS___BooksParserDelegate),  "initWithOperation:",  self);
      [v31 setDelegate:v32];
      [v31 parse];
    }

    if (LOBYTE(self->super._status)) {
      uint64_t v33 = 1LL;
    }
    else {
      uint64_t v33 = 2LL;
    }
    -[CloudLibraryOperation setStatus:](self, "setStatus:", v33);
    [v6 endTransaction];

    _Block_object_dispose(buf, 8);
  }

- (id)_queryFilterEncodedStringForDAAPNameString:(id)a3
{
  return [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"];
}

- (id)queryFilter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[JaliscoLoadBooksOperation _queryFilterEncodedStringForDAAPNameString:]( self,  "_queryFilterEncodedStringForDAAPNameString:",  @"com.apple.itunes.extended-media-kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"('%@:%d')",  v2,  0x400000LL));

  return v3;
}

- (id)metadataFilter
{
  return [&off_1001B4BC0 componentsJoinedByString:@","];
}

- (NSArray)queryStoreIDs
{
  return (NSArray *)self->super._error;
}

- (void)setQueryStoreIDs:(id)a3
{
}

- (NSArray)books
{
  return *(NSArray **)&self->_parserSuccess;
}

- (void)setBooks:(id)a3
{
}

- (BOOL)parserSuccess
{
  return self->super._status;
}

- (void)setParserSuccess:(BOOL)a3
{
  LOBYTE(self->super._status) = a3;
}

- (void).cxx_destruct
{
}

@end