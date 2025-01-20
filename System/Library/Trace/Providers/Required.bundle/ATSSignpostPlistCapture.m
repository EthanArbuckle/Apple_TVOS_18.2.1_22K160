@interface ATSSignpostPlistCapture
- (ATSSignpostPlistCapture)initWithLogger:(id)a3;
- (id)describeChunkWithTag:(unsigned int)a3;
- (void)addChunksToFile:(ktrace_file *)a3;
@end

@implementation ATSSignpostPlistCapture

- (ATSSignpostPlistCapture)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ATSSignpostPlistCapture;
  v6 = -[ATSSignpostPlistCapture init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)addChunksToFile:(ktrace_file *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/AppleInternal/Library/Ariadne/Plists/"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = _signpostSpecPathsForURL(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v14 = _deserializeSignpostSpecs(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        [v5 setObject:v15 forKeyedSubscript:v13];
      }

      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v10);
  }

  id v24 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  &v24));
  id v17 = v24;
  v18 = v17;
  if (!v16)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to serialize signposts to a plist. Error: %@",  v23));

    goto LABEL_12;
  }

  id v19 = v16;
  if (!ktrace_file_append_chunk(a3, 20986, 0, 0, [v19 bytes], objc_msgSend(v19, "length")))
  {
    v20 = __error();
    v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to append signpost plist chunk. Error: %s",  strerror(*v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
LABEL_12:
    -[KTProviderLogger failWithReason:](self->_logger, "failWithReason:", v22);
  }
}

- (id)describeChunkWithTag:(unsigned int)a3
{
  if (a3 == 20986) {
    return @"KDebug Signpost Plists";
  }
  else {
    return 0LL;
  }
}

- (void).cxx_destruct
{
}

@end