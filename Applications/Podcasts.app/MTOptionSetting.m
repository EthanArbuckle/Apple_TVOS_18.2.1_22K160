@interface MTOptionSetting
- (MTOptionsDescription)options;
- (NSAttributedString)footerText;
- (NSString)headerTitle;
- (id)currentShortTitle;
- (id)menuForOptions;
- (id)reloadHandler;
- (void)setFooterText:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setOptions:(id)a3;
- (void)setReloadHandler:(id)a3;
@end

@implementation MTOptionSetting

- (id)currentShortTitle
{
  options = self->_options;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSetting value](self, "value"));
  id v5 = -[MTOptionsDescription indexForValue:](options, "indexForValue:", [v4 unsignedIntegerValue]);

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsDescription shortTitles](self->_options, "shortTitles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v5]);

  return v7;
}

- (id)menuForOptions
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 valueSet]);

  id v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
        id v9 = objc_msgSend(v8, "indexForValue:", objc_msgSend(v7, "integerValue"));

        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueSet]);
          BOOL v12 = v9 < [v11 count];

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionSetting options](self, "options"));
            v14 = (void *)objc_claimAutoreleasedReturnValue([v13 longTitles]);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v9]);

            objc_initWeak(&location, self);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            v22[2] = sub_1000CA2D0;
            v22[3] = &unk_100243E30;
            objc_copyWeak(&v23, &location);
            v22[4] = v7;
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAction actionWithTitle:image:identifier:handler:]( &OBJC_CLASS___UIAction,  "actionWithTitle:image:identifier:handler:",  v15,  0LL,  0LL,  v22));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSetting value](self, "value"));
            objc_msgSend(v16, "setState:", objc_msgSend(v7, "isEqualToNumber:", v17));

            [v20 addObject:v16];
            objc_destroyWeak(&v23);
            objc_destroyWeak(&location);
          }
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v4);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIMenu menuWithTitle:children:]( &OBJC_CLASS___UIMenu,  "menuWithTitle:children:",  &stru_100248948,  v20));
  return v18;
}

- (MTOptionsDescription)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSAttributedString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (void)setReloadHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end