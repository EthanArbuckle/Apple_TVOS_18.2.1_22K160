@interface VOTTVSpeechRequestManager
- (BOOL)updateHeadersAndElementsWithTarget:(id)a3 ignoreLastUpdate:(BOOL)a4;
- (NSArray)requestElements;
- (NSArray)requestHeaders;
- (id)description;
- (id)generateOutputRequest:(BOOL *)a3;
- (void)reset;
- (void)resetElements;
- (void)resetHeaders;
- (void)setRequestElements:(id)a3;
- (void)setRequestHeaders:(id)a3;
- (void)transferAllFrom:(id)a3;
- (void)transferElementsFrom:(id)a3;
- (void)transferHeadersFrom:(id)a3;
@end

@implementation VOTTVSpeechRequestManager

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"VOTTVSpeechRequestManager<%p>. Headers:",  self));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestHeaders](self, "requestHeaders"));
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v19 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v6);
  }

  [v3 appendString:@"Elements:\n"];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestElements](self, "requestElements"));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v15 + 1) + 8 * (void)v13)];
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v11);
  }

  return v3;
}

- (BOOL)updateHeadersAndElementsWithTarget:(id)a3 ignoreLastUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  if (([v6 isAccessibleElement] & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accessibleDescendants]);
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v86 objects:v94 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v87;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v87 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
          [v69 addTVElement:v13];
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 headerElements]);
          [v7 addTVElements:v14];

          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 touchContainer]);
          [v7 addTVElement:v15];
        }

        id v10 = [v8 countByEnumeratingWithState:&v86 objects:v94 count:16];
      }

      while (v10);
    }
  }

  if (![v69 count])
  {
    [v69 addTVElement:v6];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 headerElements]);
    [v7 addTVElements:v16];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 touchContainer]);
    [v7 addTVElement:v17];
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if (v18 - self->_lastFocusRequestTime < 1.0)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v69 array]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestElements](self, "requestElements"));
    if ([v19 isEqualToArray:v20])
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 array]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestHeaders](self, "requestHeaders"));
      unsigned __int8 v23 = [v21 isEqualToArray:v22];

      if ((v23 & 1) != 0)
      {
        BOOL v24 = 0;
        goto LABEL_62;
      }
    }

    else
    {
    }
  }

  if (v4)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v69 array]);
    -[VOTTVSpeechRequestManager setRequestElements:](self, "setRequestElements:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v7 array]);
    -[VOTTVSpeechRequestManager setRequestHeaders:](self, "setRequestHeaders:", v26);
  }

  else
  {
    id v64 = v6;
    v65 = v7;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id v28 = v69;
    id v29 = [v28 countByEnumeratingWithState:&v82 objects:v93 count:16];
    v68 = v27;
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v83;
      do
      {
        for (j = 0LL; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v83 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)j);
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestElements](self, "requestElements"));
          unsigned int v35 = [v34 containsObject:v33];

          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestElements](self, "requestElements"));
            v37 = (void *)objc_claimAutoreleasedReturnValue([v36 originalElementforElement:v33]);

            v38 = (void *)objc_claimAutoreleasedReturnValue([v37 snapshot]);
            [v37 updateCache];
            objc_msgSend(v37, "setAspectMask:", objc_msgSend(v37, "differenceAspectMask:", v38));
            [v27 addObject:v37];
          }

          else
          {
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestElements](self, "requestElements"));
            id v40 = [v39 countByEnumeratingWithState:&v78 objects:v92 count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v79;
              while (2)
              {
                for (k = 0LL; k != v41; k = (char *)k + 1)
                {
                  if (*(void *)v79 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  if (![*(id *)(*((void *)&v78 + 1) + 8 * (void)k) differenceAspectMask:v33])
                  {
                    [v33 setAspectMask:0];
                    goto LABEL_36;
                  }
                }

                id v41 = [v39 countByEnumeratingWithState:&v78 objects:v92 count:16];
                if (v41) {
                  continue;
                }
                break;
              }
            }

- (id)generateOutputRequest:(BOOL *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___VOTOutputRequest);
  -[VOTOutputRequest setGeneratesBraille:](v5, "setGeneratesBraille:", 1LL);
  -[VOTOutputRequest setBrailleType:](v5, "setBrailleType:", 1LL);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestHeaders](self, "requestHeaders"));
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        -[VOTOutputRequest addTVElement:servesAsHeader:filterWithAspectMask:]( v5,  "addTVElement:servesAsHeader:filterWithAspectMask:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v10),  1LL,  1LL);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v8);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](v5, "outputActions"));
  id v12 = [v11 count];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestElements](self, "requestElements", 0LL));
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      __int128 v17 = 0LL;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        -[VOTOutputRequest addTVElement:servesAsHeader:filterWithAspectMask:]( v5,  "addTVElement:servesAsHeader:filterWithAspectMask:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v17),  0LL,  1LL);
        __int128 v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v15);
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](v5, "outputActions"));
  id v19 = [v18 count];

  if (a3) {
    *a3 = v19 != v12;
  }
  return v5;
}

- (void)reset
{
}

- (void)resetElements
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestElements](self, "requestElements", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resetAspectMask];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[VOTTVSpeechRequestManager setRequestElements:](self, "setRequestElements:", 0LL);
}

- (void)resetHeaders
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTVSpeechRequestManager requestHeaders](self, "requestHeaders", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resetAspectMask];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[VOTTVSpeechRequestManager setRequestHeaders:](self, "setRequestHeaders:", 0LL);
}

- (void)transferHeadersFrom:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 requestHeaders]);
  -[VOTTVSpeechRequestManager setRequestHeaders:](self, "setRequestHeaders:", v4);
}

- (void)transferElementsFrom:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 requestElements]);
  -[VOTTVSpeechRequestManager setRequestElements:](self, "setRequestElements:", v4);
}

- (void)transferAllFrom:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestHeaders]);
  -[VOTTVSpeechRequestManager setRequestHeaders:](self, "setRequestHeaders:", v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 requestElements]);
  -[VOTTVSpeechRequestManager setRequestElements:](self, "setRequestElements:", v6);
}

- (NSArray)requestElements
{
  return self->_requestElements;
}

- (void)setRequestElements:(id)a3
{
}

- (NSArray)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end