@interface MTTVLibraryNoStationsViewController
- (MTTVLibraryNoStationsViewController)init;
- (id)buttonCallback;
- (void)buttonPressed:(id)a3;
- (void)setButtonCallback:(id)a3;
@end

@implementation MTTVLibraryNoStationsViewController

- (MTTVLibraryNoStationsViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTTVLibraryNoStationsViewController;
  v2 = -[MTTVLibraryNoStationsViewController init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"MY_STATIONS_NO_STATIONS_TITLE" value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setPrimaryText:](v2, "setPrimaryText:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"MY_STATIONS_NO_STATIONS_MESSAGE" value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setSecondaryText:](v2, "setSecondaryText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"MY_STATIONS_NO_STATIONS_BUTTON" value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setButtonTitle:](v2, "setButtonTitle:", v8);
  }

  return v2;
}

- (void)buttonPressed:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVLibraryNoStationsViewController buttonCallback](self, "buttonCallback", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTTVLibraryNoStationsViewController buttonCallback](self, "buttonCallback"));
    v5[2]();
  }

- (id)buttonCallback
{
  return self->_buttonCallback;
}

- (void)setButtonCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end