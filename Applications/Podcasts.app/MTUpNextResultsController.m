@interface MTUpNextResultsController
+ (id)numberFormatter;
- (MTPlayerController)playerController;
- (MTUpNextResultsController)initWithPlayerController:(id)a3;
- (id)title;
- (unint64_t)startingIndexForDisplay;
- (void)setPlayerController:(id)a3;
@end

@implementation MTUpNextResultsController

- (MTUpNextResultsController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTUpNextResultsController;
  v5 = -[MTManifestResultsController initWithPlayerController:](&v8, "initWithPlayerController:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 upNextManifest]);
    -[MTManifestResultsController setManifest:](v5, "setManifest:", v6);

    -[MTUpNextResultsController setPlayerController:](v5, "setPlayerController:", v4);
  }

  return v5;
}

- (id)title
{
  unint64_t v3 = -[MTResultsController numberOfObjects](self, "numberOfObjects");
  id v4 = [(id)objc_opt_class(self) numberFormatter];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringFromNumber:v6]);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = v8;
  if (v3 == 1) {
    v10 = @"QUEUE_SONGS_SINGULAR";
  }
  else {
    v10 = @"QUEUE_SONGS_PLURAL";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100248948 table:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v7));

  return v12;
}

+ (id)numberFormatter
{
  v2 = (void *)qword_1002B6A68;
  if (!qword_1002B6A68)
  {
    unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    id v4 = (void *)qword_1002B6A68;
    qword_1002B6A68 = (uint64_t)v3;

    [(id)qword_1002B6A68 setNumberStyle:1];
    v5 = (void *)qword_1002B6A68;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    [v5 setLocale:v6];

    [(id)qword_1002B6A68 setMaximumFractionDigits:0];
    v2 = (void *)qword_1002B6A68;
  }

  return v2;
}

- (unint64_t)startingIndexForDisplay
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTUpNextResultsController;
  id v3 = -[MTManifestResultsController startingIndexForDisplay](&v8, "startingIndexForDisplay");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextResultsController playerController](self, "playerController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 compositeManifest]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
  LODWORD(v4) = [v5 isPlayingFromManifest:v6];

  return (unint64_t)v3 + v4;
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end