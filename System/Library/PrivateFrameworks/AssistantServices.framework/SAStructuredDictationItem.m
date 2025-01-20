@interface SAStructuredDictationItem
- (id)ad_transcriptionResults;
@end

@implementation SAStructuredDictationItem

- (id)ad_transcriptionResults
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationItem resultOptions](self, "resultOptions"));
  v5 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAStructuredDictationItem resultOptions](self, "resultOptions"));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v9 = v7;
    v10 = 0LL;
    uint64_t v11 = *(void *)v19;
    *(void *)&__int128 v8 = 136315394LL;
    __int128 v17 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (!v10)
        {
          if (objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)i),  "ad_transcriptionResultRequiresAddressBook")) {
            v10 = objc_alloc_init(&OBJC_CLASS___ADAddressBookManager);
          }
          else {
            v10 = 0LL;
          }
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ad_transcriptionResultWithAddressBookManager:", v10, v17));
        if (v14)
        {
          -[NSMutableArray addObject:](v5, "addObject:", v14);
        }

        else
        {
          v15 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = "-[SAStructuredDictationItem(StructuredDictation) ad_transcriptionResults]";
            __int16 v24 = 2112;
            v25 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Don't know how to create a transcription result for %@",  buf,  0x16u);
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v9);
  }

  else
  {
    v10 = 0LL;
  }

  return v5;
}

@end