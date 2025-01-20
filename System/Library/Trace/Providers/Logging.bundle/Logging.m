LABEL_16:
      v30 = 0;
      goto LABEL_17;
    }

    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v13;
  }

  v22 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"archive"]);
  archivePath = self->_archivePath;
  self->_archivePath = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"redact-content"]);
  self->_shouldRedactLogContent = v24 != 0LL;

  if (self->_shouldRedactLogContent && !&_SignpostSupportAllowlistedStringSetForCurrentDevice)
  {
    if (a6)
    {
      v25 = @"Cannot redact the content, allow-list is not available; logging will be disabled";
LABEL_15:
      v31 = sub_23E4(v25, v14, v15, v16, v17, v18, v19, v20, v33);
      v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(v31);
      goto LABEL_17;
    }

    goto LABEL_16;
  }

  endDate = self->_endDate;
  self->_endDate = 0LL;

  startDate = self->_startDate;
  self->_startDate = 0LL;

  v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"enable-logs"]);
  if (v28) {
    self->_streamingFlags &= ~0x200uLL;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"disable-signposts"]);

  if (v29)
  {
    self->_streamingFlags &= ~0x20uLL;
    if (!v28) {
      goto LABEL_16;
    }
  }

  v30 = 1;
LABEL_17:

  return v30;
}

id sub_23E4( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  v10 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v9, &a9);

  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"LoggingProvider",  1LL,  v11));

  return v12;
}

LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }

  if ((objc_msgSend(v6, "fileExistsAtPath:") & 1) == 0)
  {
    if (a4)
    {
      v18 = @"Passed logarchive path doesn't exist";
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  v15 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", self->_archivePath));
  archiveURL = self->_archiveURL;
  self->_archiveURL = v15;

  v17 = 1;
LABEL_10:

  return v17;
}

void sub_2910(_Unwind_Exception *a1)
{
}

uint64_t sub_2934(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_2944(uint64_t a1)
{
}

void sub_294C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to prepare log source: %@",  v9,  v11));

      [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:v10];
    }

    else
    {
      [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:@"Failed to prepare log source for unknown reason"];
    }
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
}

id sub_2A30(uint64_t a1, id a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = OSLogEventSerializerVersion;
  id v5 = a2;
  id v6 = [v5 bytes];
  id v7 = [v5 length];

  id result = (id)ktrace_file_append_chunk(v3, 32785LL, v4, 0LL, v6, v7);
  if (!result) {
    return [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:@"failed to append log data"];
  }
  return result;
}

void sub_2ADC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = a3 - 1;
  id v10 = v5;
  if ((unint64_t)(a3 - 1) <= 8 && ((0x1EFu >> v6) & 1) != 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:*(&off_4278 + v6)];
    id v5 = v10;
  }

  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = OSLogEventSerializerVersion;
    id v9 = v10;
    if (!ktrace_file_append_chunk(v7, 32786, v8, 0, [v9 bytes], objc_msgSend(v9, "length"))) {
      [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:@"failed to append log metadata"];
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_2BC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 decomposedMessage]);
  id v5 = 0LL;
  if ([v4 placeholderCount])
  {
    unint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 argumentAtIndex:v6]);
      if ([v7 category] == (char *)&dword_0 + 3
        || [v7 category] == (char *)&dword_0 + 2
        && (uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectRepresentation])) != 0
        && (id v9 = (void *)v8,
            unsigned __int8 v10 = [*(id *)(a1 + 32) containsObject:v8],
            v9,
            (v10 & 1) == 0))
      {
        if (v5) {
          [v5 addIndex:v6];
        }
        else {
          id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableIndexSet indexSetWithIndex:]( &OBJC_CLASS___NSMutableIndexSet,  "indexSetWithIndex:",  v6));
        }
      }

      ++v6;
    }

    while (v6 < (unint64_t)[v4 placeholderCount]);
  }

  return v5;
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}