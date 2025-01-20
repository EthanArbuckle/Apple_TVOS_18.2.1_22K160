@interface SKProgressObserver
- (NSMutableArray)messages;
- (NSProgress)progress;
- (SKProgressObserver)initWithProgress:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMessages:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation SKProgressObserver

- (SKProgressObserver)initWithProgress:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SKProgressObserver;
  v6 = -[SKProgressObserver init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
    messages = v7->_messages;
    v7->_messages = (NSMutableArray *)v9;

    v11 = NSStringFromSelector("localizedAdditionalDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v5 addObserver:v7 forKeyPath:v12 options:1 context:0];
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v25 = a4;
  id v8 = a3;
  uint64_t v9 = NSStringFromSelector("localizedAdditionalDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned int v11 = [v8 isEqualToString:v10];

  v12 = v25;
  if (v11)
  {
    id v13 = v25;
    if (!v13) {
      goto LABEL_10;
    }
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSProgress);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0) {
      goto LABEL_10;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedAdditionalDescription]);

    if (!v15) {
      goto LABEL_10;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver messages](self, "messages"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 lastObject]);
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver messages](self, "messages"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastObject]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedAdditionalDescription]);
      unsigned __int8 v22 = [v20 isEqualToString:v21];

      if ((v22 & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver messages](self, "messages"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedAdditionalDescription]);
    [v23 addObject:v24];

LABEL_10:
    v12 = v25;
  }
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgressObserver progress](self, "progress"));
  v4 = NSStringFromSelector("localizedAdditionalDescription");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 removeObserver:self forKeyPath:v5];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKProgressObserver;
  -[SKProgressObserver dealloc](&v6, "dealloc");
}

- (NSMutableArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end