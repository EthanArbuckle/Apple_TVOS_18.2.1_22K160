@interface MTChapterResultsController
- (MTChapterResultsController)init;
- (MTPlayerItem)currentItem;
- (NSArray)chapters;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (unint64_t)numberOfObjectsInSection:(unint64_t)a3;
- (void)dealloc;
- (void)didLoadChapters;
- (void)reloadData;
- (void)setChapters:(id)a3;
- (void)setCurrentItem:(id)a3;
@end

@implementation MTChapterResultsController

- (MTChapterResultsController)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTChapterResultsController;
  v2 = -[MTChapterResultsController init](&v9, "init");
  v3 = v2;
  if (v2 && (os_feature_enabled_bluemoon(v2) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v5 = IMAVPlayerNotification_MediaItemDidChange;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 player]);
    [v4 addObserver:v3 selector:"reloadData" name:v5 object:v7];

    -[MTChapterResultsController reloadData](v3, "reloadData");
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTChapterResultsController;
  -[MTChapterResultsController dealloc](&v4, "dealloc");
}

- (void)reloadData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v3 player]);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v13 currentItem]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
  unsigned __int8 v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v9 = IMMediaItemDidLoadChaptersNotification;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
      [v8 removeObserver:self name:v9 object:v10];
    }

    else
    {
      uint64_t v9 = IMMediaItemDidLoadChaptersNotification;
    }

    -[MTChapterResultsController setCurrentItem:](self, "setCurrentItem:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
    [v11 addObserver:self selector:"didLoadChapters" name:v9 object:v12];

    -[MTChapterResultsController didLoadChapters](self, "didLoadChapters");
  }
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  id v6 = [v4 row];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v6]);
  return v7;
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  id v6 = [v5 indexOfObject:v4];

  return +[NSIndexPath indexPathForRow:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForRow:inSection:", v6, 0LL);
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters", a3));
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)didLoadChapters
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController currentItem](self, "currentItem"));
  id v24 = (id)objc_claimAutoreleasedReturnValue([v3 timeChapters]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
  [v4 controllerWillChangeContent:self];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0LL;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v7]);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v7,  0LL));
      [v10 controller:self didChangeObject:v9 atIndexPath:v11 forChangeType:2 newIndexPath:0];

      ++v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      id v13 = [v12 count];
    }

    while (v7 < (unint64_t)v13);
  }

  -[MTChapterResultsController setChapters:](self, "setChapters:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
  id v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0LL;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:v16]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v16,  0LL));
      [v19 controller:self didChangeObject:v18 atIndexPath:0 forChangeType:1 newIndexPath:v20];

      ++v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTChapterResultsController chapters](self, "chapters"));
      id v22 = [v21 count];
    }

    while (v16 < (unint64_t)v22);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController delegate](self, "delegate"));
  [v23 controllerDidChangeContent:self];
}

- (MTPlayerItem)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(id)a3
{
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (void)setChapters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end