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
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SKProgressObserver;
  v6 = -[SKProgressObserver init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    uint64_t v8 = objc_opt_new();
    messages = v7->_messages;
    v7->_messages = (NSMutableArray *)v8;

    NSStringFromSelector(sel_localizedAdditionalDescription);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 addObserver:v7 forKeyPath:v10 options:1 context:0];
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v23 = a4;
  id v8 = a3;
  NSStringFromSelector(sel_localizedAdditionalDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v8 isEqualToString:v9];

  v11 = v23;
  if (v10)
  {
    id v12 = v23;
    if (!v12) {
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    [v12 localizedAdditionalDescription];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13) {
      goto LABEL_10;
    }
    v14 = -[SKProgressObserver messages](self, "messages");
    uint64_t v15 = [v14 lastObject];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = -[SKProgressObserver messages](self, "messages");
      [v17 lastObject];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 localizedAdditionalDescription];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
    }
    v21 = -[SKProgressObserver messages](self, "messages");
    [v12 localizedAdditionalDescription];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 addObject:v22];

LABEL_10:
    v11 = v23;
  }
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedAdditionalDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SKProgressObserver;
  -[SKProgressObserver dealloc](&v5, sel_dealloc);
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