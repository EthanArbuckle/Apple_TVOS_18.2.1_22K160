LABEL_9:
  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"dsym-path"]);
  if (v17)
  {
    self->_symbolicationConfig->var2 = 1;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"dsym-path"]);
    self->_symbolicationConfig->var1 = 1;
    v19 = (char *)[v18 length];
    if (v19) {
      v19 = (char *)[v18 UTF8String];
    }
    self->_symbolicationConfig->var3 = v19;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"method"]);

  v13 = 1;
  if (v20)
  {
    self->_symbolicationConfig->var2 = 1;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"method"]);
    v13 = [v21 isEqualToString:@"download"];
    if ((v13 & 1) != 0)
    {
      self->_symbolicationConfig->var1 = 2;
    }

    else if (a6)
    {
      v29 = sub_3544( @"Unrecognized symbolication method option: %@",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue(v29);
    }
  }

LABEL_19:
  return v13;
}

void sub_34EC(uint64_t a1)
{
  v1 = (void *)qword_8408;
  if (!qword_8408) {
    sub_3704();
  }
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  [v1 warnWithMessage:v2];
}

id sub_3544( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  v10 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v9, &a9);

  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SymbolicationProvider",  1LL,  v11));

  return v12;
}

void sub_3704()
{
}

id objc_msgSend_warnWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnWithMessage:");
}