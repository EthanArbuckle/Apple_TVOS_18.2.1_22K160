@interface UIAction
- (BOOL)isFavorited;
- (BOOL)isInLibrary;
- (void)setFavorited:(BOOL)a3;
- (void)setInLibrary:(BOOL)a3;
@end

@implementation UIAction

- (BOOL)isInLibrary
{
  return -[UIAction state](self, "state") == (id)1;
}

- (void)setInLibrary:(BOOL)a3
{
  if (a3)
  {
    -[UIAction setState:](self, "setState:", 1LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"checkmark.circle"));
    -[UIAction setImage:](self, "setImage:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = @"MusicVideoDeleteFromLibrary";
  }

  else
  {
    -[UIAction setState:](self, "setState:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"plus.circle"));
    -[UIAction setImage:](self, "setImage:", v7);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = @"MusicVideoAddToLibrary";
  }

  id v9 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v6 value:&stru_100279068 table:0]);
  -[UIAction setTitle:](self, "setTitle:", v8);
}

- (BOOL)isFavorited
{
  return -[UIAction state](self, "state") == (id)1;
}

- (void)setFavorited:(BOOL)a3
{
  if (a3)
  {
    -[UIAction setState:](self, "setState:", 1LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"star.fill"));
    -[UIAction setImage:](self, "setImage:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = @"Undo Favorite";
  }

  else
  {
    -[UIAction setState:](self, "setState:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"star"));
    -[UIAction setImage:](self, "setImage:", v7);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = @"Favorite";
  }

  id v9 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v6 value:&stru_100279068 table:0]);
  -[UIAction setTitle:](self, "setTitle:", v8);
}

@end