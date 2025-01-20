@interface RMCommandPayloadState
- (void)markExecutedWithResult:(id)a3 reasons:(id)a4 unknownPayloadKeys:(id)a5;
- (void)markFailedWithError:(id)a3 reasons:(id)a4;
- (void)markPending;
- (void)markQueued;
@end

@implementation RMCommandPayloadState

- (void)markQueued
{
  v3 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[RMCommandPayloadState setModifiedDate:](self, "setModifiedDate:", v3);

  -[RMCommandPayloadState setResult:](self, "setResult:", 0LL);
}

- (void)markExecutedWithResult:(id)a3 reasons:(id)a4 unknownPayloadKeys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[RMCommandPayloadState setStatus:](self, "setStatus:", 1LL);
  v11 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[RMCommandPayloadState setModifiedDate:](self, "setModifiedDate:", v11);

  -[RMCommandPayloadState setResult:](self, "setResult:", v8);
  id v12 = v9;
  v13 = v12;
  if ([v10 count])
  {
    if (v12) {
      v14 = v12;
    }
    else {
      v14 = &__NSArray0__struct;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolCommandRequest_StatusReason failedWithUnknownPayloadKeys:]( &OBJC_CLASS___RMProtocolCommandRequest_StatusReason,  "failedWithUnknownPayloadKeys:",  v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v14 arrayByAddingObject:v15]);
  }

  if (v13)
  {
    id v25 = v8;
    id v16 = v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v16 count]));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        v22 = 0LL;
        do
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * (void)v22) serializeWithType:1]);
          [v17 addObject:v23];

          v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v20);
    }

    id v24 = [v17 copy];
    -[RMCommandPayloadState setReasons:](self, "setReasons:", v24);

    id v8 = v25;
  }
}

- (void)markFailedWithError:(id)a3 reasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[RMCommandPayloadState setStatus:](self, "setStatus:", 2LL);
  id v8 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[RMCommandPayloadState setModifiedDate:](self, "setModifiedDate:", v8);

  -[RMCommandPayloadState setResult:](self, "setResult:", 0LL);
  id v9 = v7;
  id v10 = v9;
  v11 = v9;
  if (v6)
  {
    if (v9) {
      id v12 = v9;
    }
    else {
      id v12 = &__NSArray0__struct;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolCommandRequest_StatusReason reasonWithError:]( &OBJC_CLASS___RMProtocolCommandRequest_StatusReason,  "reasonWithError:",  v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObject:v13]);
  }

  if (v11)
  {
    id v14 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v14 count]));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v16 = v14;
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * (void)i),  "serializeWithType:",  1,  (void)v23));
          [v15 addObject:v21];
        }

        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v18);
    }

    id v22 = [v15 copy];
    -[RMCommandPayloadState setReasons:](self, "setReasons:", v22);
  }
}

- (void)markPending
{
  v3 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[RMCommandPayloadState setModifiedDate:](self, "setModifiedDate:", v3);

  -[RMCommandPayloadState setResult:](self, "setResult:", 0LL);
}

@end