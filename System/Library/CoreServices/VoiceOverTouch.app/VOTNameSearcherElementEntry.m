@interface VOTNameSearcherElementEntry
- (BOOL)isEqual:(id)a3;
- (NSString)itemChooserName;
- (VOTElement)element;
- (VOTNameSearcherElementEntry)initWithElement:(id)a3;
- (void)select;
- (void)setElement:(id)a3;
- (void)setItemChooserName:(id)a3;
@end

@implementation VOTNameSearcherElementEntry

- (VOTNameSearcherElementEntry)initWithElement:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VOTNameSearcherElementEntry;
  v5 = -[VOTNameSearcherElementEntry init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[VOTNameSearcherElementEntry setElement:](v5, "setElement:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 itemChooserName]);
    -[VOTNameSearcherElementEntry setItemChooserName:](v6, "setItemChooserName:", v7);

    v8 = v6;
  }

  return v6;
}

- (void)select
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherElementEntry element](self, "element"));
  [v3 handleNotification:1020 withData:v4 forElement:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  [v5 deactivateGesturedTextInputIfNeeded:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 element]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTNameSearcherElementEntry element](self, "element"));
    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (VOTElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (NSString)itemChooserName
{
  return self->_itemChooserName;
}

- (void)setItemChooserName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end