@interface TIAutocorrectionTesterDESPlugin
- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
@end

@implementation TIAutocorrectionTesterDESPlugin

- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKey:@"localeIdentifier"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"localeIdentifier"]);
  if (v9)
  {
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v8));
      v11 = v10;
      if (!v10)
      {
        BOOL v15 = 0;
LABEL_43:

        goto LABEL_44;
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 languageCode]);
      v13 = v12;
      if (!v12
        || ([v12 isEqualToString:@"zh"] & 1) != 0
        || [v13 isEqualToString:@"ja"])
      {
        if (a5)
        {
          v14 = &off_90610;
LABEL_9:
          BOOL v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.TIDESPlugin",  2LL,  v14));
LABEL_42:

          goto LABEL_43;
        }

        goto LABEL_41;
      }

      id v17 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v8));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 languageCode]);
      v36 = v18;
      v39 = (void *)objc_claimAutoreleasedReturnValue([v18 countryCode]);
      v37 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 languageCode]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v20 countryCode]);
      v42 = v19;
      if ([v19 isEqualToString:v21])
      {
        v35 = v21;
        v34 = v20;
        v23 = v39;
        if (!v39)
        {

LABEL_38:
          BOOL v15 = 1;
          goto LABEL_42;
        }

        v25 = v22;
        v24 = v35;
        if (v22)
        {
          unsigned __int8 v26 = [v39 isEqualToString:v22];
        }

        else
        {
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
          id v41 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v41)
          {
            v33 = v13;
            int v27 = 0;
            uint64_t v40 = *(void *)v44;
            while (2)
            {
              for (i = 0LL; i != v41; i = (char *)i + 1)
              {
                if (*(void *)v44 != v40) {
                  objc_enumerationMutation(obj);
                }
                v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  *(void *)(*((void *)&v43 + 1) + 8LL * (void)i)));
                v30 = (void *)objc_claimAutoreleasedReturnValue([v29 languageCode]);
                v31 = (void *)objc_claimAutoreleasedReturnValue([v29 countryCode]);
                v27 |= [v42 isEqualToString:v30];
                if (v27 & 1) != 0 && ([v39 isEqualToString:v31])
                {

                  unsigned __int8 v26 = 1;
                  goto LABEL_34;
                }
              }

              id v41 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
              if (v41) {
                continue;
              }
              break;
            }

            unsigned __int8 v26 = v27 ^ 1;
LABEL_34:
            v13 = v33;
            v25 = 0LL;
            v24 = v35;
          }

          else
          {
            unsigned __int8 v26 = 1;
          }

          v23 = v39;
        }

        if ((v26 & 1) != 0) {
          goto LABEL_38;
        }
      }

      else
      {
      }

      if (a5)
      {
        v14 = &off_90638;
        goto LABEL_9;
      }

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v58 = a3;
  id v51 = a4;
  id v52 = a5;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id obj = a6;
  id v55 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v55)
  {
    id v59 = 0LL;
    v57 = 0LL;
    uint64_t v54 = *(void *)v78;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v78 != v54) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathExtension", v51));
        if ([v13 isEqualToString:@"txt"])
        {
          id v14 = v12;

          v57 = v14;
        }

        else
        {
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByDeletingLastPathComponent]);

          id v16 = v12;
          id v59 = v15;
          uint64_t v17 = archive_read_new();
          archive_read_support_filter_all();
          uint64_t support_format_all = archive_read_support_format_all(v17);
          uint64_t v19 = archive_write_disk_new(support_format_all);
          archive_write_disk_set_standard_lookup();
          id v20 = v16;
          unsigned int open_filename = archive_read_open_filename(v17, [v20 fileSystemRepresentation], 10240);
          if (!open_filename)
          {
            uint64_t v71 = 0LL;
            for (unsigned int i = archive_read_next_header(v17, &v71); ; unsigned int i = archive_read_next_header(v17, &v71))
            {
              unsigned int open_filename = i;
              if (i) {
                break;
              }
              v24 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  archive_entry_pathname(v71));
              v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
              unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v59 URLByAppendingPathComponent:v25]);

              uint64_t v27 = v71;
              id v28 = v26;
              archive_entry_set_pathname(v27, [v28 fileSystemRepresentation]);
              if (!archive_write_header(v19, v71))
              {
                while (1)
                {
                  unsigned int v29 = archive_read_data_block(v17, &v83, &v82, &v81);
                  unsigned int open_filename = v29;
                  if (v29) {
                    break;
                  }
                  if (archive_write_data_block(v19, v83, v82, v81)) {
                    goto LABEL_25;
                  }
                }

                if (v29 != 1 || archive_write_finish_entry(v19))
                {
LABEL_25:

                  break;
                }
              }
            }
          }

          archive_read_close(v17);
          archive_read_free(v17);
          archive_write_close(v19);
          archive_write_free(v19);
          if (open_filename >= 2 && a7 != 0LL)
          {
            *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.TIDESPlugin",  (int)open_filename,  &off_90660));

LABEL_46:
            id v48 = 0LL;
            v49 = (NSString *)obj;
            goto LABEL_47;
          }

          if (open_filename >= 2) {
            goto LABEL_46;
          }
        }

        v11 = (char *)v11 + 1;
      }

      while (v11 != v55);
      id v30 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
      id v55 = v30;
    }

    while (v30);
  }

  else
  {
    id v59 = 0LL;
    v57 = 0LL;
  }

  v56 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v52, 4LL);
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x3032000000LL;
  v74 = sub_3DDCC;
  v75 = sub_3DDDC;
  id v76 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v31 = (id)objc_claimAutoreleasedReturnValue([v58 objectForKey:@"configurations"]);
  id v32 = [v31 countByEnumeratingWithState:&v67 objects:v84 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v68;
    do
    {
      for (j = 0LL; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v68 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = *(void *)(*((void *)&v67 + 1) + 8LL * (void)j);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v35, v51));
        id v37 = [v36 mutableCopy];

        v38 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKey:@"localeIdentifier"]);
        [v37 setObject:v38 forKey:@"KEYBOARD_LANGUAGE"];

        if (v57)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v57 path]);
          [v37 setObject:v39 forKey:@"TEXT"];
        }

        else
        {
          [v37 setObject:v56 forKey:@"SENTENCE"];
        }

        [v37 setValue:@"0" forKey:@"WORD_LEARNING_ENABLED"];
        uint64_t v40 = -[AutocorrectionTesterAppDelegate initWithOptions:]( objc_alloc(&OBJC_CLASS___AutocorrectionTesterAppDelegate),  "initWithOptions:",  v37);
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472LL;
        v63[2] = sub_3DDE4;
        v63[3] = &unk_89798;
        id v41 = v58;
        uint64_t v65 = v35;
        v66 = &v71;
        id v64 = v41;
        -[AutocorrectionTesterAppDelegate runWithObserver:](v40, "runWithObserver:", v63);
        if (v59)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([v59 path]);
          [v37 setObject:v42 forKey:@"CUSTOM_STATIC_DICTIONARY_PATH"];

          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v59 path]);
          [v37 setObject:v43 forKey:@"CUSTOM_LANGUAGE_MODEL_PATH"];

          -[AutocorrectionTesterAppDelegate resetOptions:](v40, "resetOptions:", v37);
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472LL;
          v60[2] = sub_3E244;
          v60[3] = &unk_897C0;
          v60[4] = v35;
          id v61 = v41;
          v62 = &v71;
          -[AutocorrectionTesterAppDelegate runWithObserver:](v40, "runWithObserver:", v60);
        }
      }

      id v32 = [v31 countByEnumeratingWithState:&v67 objects:v84 count:16];
    }

    while (v32);
  }

  __int128 v44 = (void *)v72[5];
  uint64_t v45 = objc_claimAutoreleasedReturnValue([v58 objectForKey:@"typewheel_job_id"]);
  __int128 v46 = (void *)v45;
  if (v45) {
    v47 = (const __CFString *)v45;
  }
  else {
    v47 = &stru_89E80;
  }
  objc_msgSend(v44, "setValue:forKey:", v47, @"job_id", v51);

  id v48 = (id)v72[5];
  _Block_object_dispose(&v71, 8);

  v49 = v56;
LABEL_47:

  return v48;
}

@end