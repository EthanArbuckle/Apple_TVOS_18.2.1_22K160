@interface CSDPauseDigitsQueue
- (BOOL)hasQueuedHardPauseDigits;
- (CSDPauseDigits)nextPauseDigits;
- (CSDPauseDigitsQueue)init;
- (CSDPauseDigitsQueue)initWithDestinationID:(id)a3;
- (CSDPauseDigitsQueueDelegate)delegate;
- (NSMutableArray)pauseDigits;
- (NSString)baseDestinationID;
- (NSString)originalPauseDigitsString;
- (id)dequeueAllPauseDigits;
- (id)dequeueNextPauseDigits;
- (id)description;
- (void)_parsePauseDigitsFromDestinationID:(id)a3;
- (void)setBaseDestinationID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOriginalPauseDigitsString:(id)a3;
- (void)setPauseDigits:(id)a3;
@end

@implementation CSDPauseDigitsQueue

- (CSDPauseDigitsQueue)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDPauseDigitsQueue.m",  23,  @"%s is not available. Use a designated initializer instead.",  "-[CSDPauseDigitsQueue init]");

  return 0LL;
}

- (CSDPauseDigitsQueue)initWithDestinationID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDPauseDigitsQueue;
  v5 = -[CSDPauseDigitsQueue init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pauseDigits = v5->_pauseDigits;
    v5->_pauseDigits = (NSMutableArray *)v6;

    -[CSDPauseDigitsQueue _parsePauseDigitsFromDestinationID:](v5, "_parsePauseDigitsFromDestinationID:", v4);
  }

  return v5;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue baseDestinationID](self, "baseDestinationID"));
  [v4 appendFormat:@" baseDestinationID=%@", v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue originalPauseDigitsString](self, "originalPauseDigitsString"));
  [v4 appendFormat:@" originalPauseDigitsString=%@", v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
  id v8 = [v7 count];

  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
    [v4 appendFormat:@" pauseDigits=%@", v9];
  }

  [v4 appendString:@">"];
  return v4;
}

- (CSDPauseDigits)nextPauseDigits
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return (CSDPauseDigits *)v3;
}

- (BOOL)hasQueuedHardPauseDigits
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) isHardPause])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (id)dequeueNextPauseDigits
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue nextPauseDigits](self, "nextPauseDigits"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
    [v4 removeObjectAtIndex:0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue delegate](self, "delegate"));
    [v5 pauseDigitsQueueChanged:self];
  }

  return v3;
}

- (id)dequeueAllPauseDigits
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
    id v6 = [v5 copy];

    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
    [v7 removeAllObjects];

    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue delegate](self, "delegate"));
    [v8 pauseDigitsQueueChanged:self];
  }

  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (void)_parsePauseDigitsFromDestinationID:(id)a3
{
  id v20 = a3;
  if (qword_10044CF40 != -1) {
    dispatch_once(&qword_10044CF40, &stru_1003D8FB8);
  }
  id v4 = (char *)[v20 length];
  v5 = (char *)objc_msgSend(v20, "rangeOfCharacterFromSet:options:range:", qword_10044CF38, 4, 0, v4);
  if (v6) {
    BOOL v7 = v5 == (char *)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    __int128 v8 = v5;
    uint64_t v9 = v6;
    do
    {
      __int128 v10 = v8 + 1;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", v8, v9));
      id v12 = [v11 characterAtIndex:0];

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", v10, v4 - v10));
      id v14 = [(id)qword_10044CF30 characterIsMember:v12];
      if ([v13 length] || (v14 & 1) == 0)
      {
        v15 = -[CSDPauseDigits initWithDigits:isHardPause:]( objc_alloc(&OBJC_CLASS___CSDPauseDigits),  "initWithDigits:isHardPause:",  v13,  v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDPauseDigitsQueue pauseDigits](self, "pauseDigits"));
        [v16 insertObject:v15 atIndex:0];
      }

      v4 += ~(unint64_t)[v13 length];
      __int128 v8 = (char *)objc_msgSend(v20, "rangeOfCharacterFromSet:options:range:", qword_10044CF38, 4, 0, v4);
      uint64_t v9 = v17;
    }

    while (v9 && v8 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", 0, v4));
  -[CSDPauseDigitsQueue setBaseDestinationID:](self, "setBaseDestinationID:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v20 substringFromIndex:v4]);
  -[CSDPauseDigitsQueue setOriginalPauseDigitsString:](self, "setOriginalPauseDigitsString:", v19);
}

- (CSDPauseDigitsQueueDelegate)delegate
{
  return (CSDPauseDigitsQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)baseDestinationID
{
  return self->_baseDestinationID;
}

- (void)setBaseDestinationID:(id)a3
{
}

- (NSString)originalPauseDigitsString
{
  return self->_originalPauseDigitsString;
}

- (void)setOriginalPauseDigitsString:(id)a3
{
}

- (NSMutableArray)pauseDigits
{
  return self->_pauseDigits;
}

- (void)setPauseDigits:(id)a3
{
}

- (void).cxx_destruct
{
}

@end