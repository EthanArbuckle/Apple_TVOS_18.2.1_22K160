@interface MTResultsController
- (BOOL)hasObjects;
- (MTResultsControllerDelegate)delegate;
- (NSString)title;
- (id)allObjects;
- (id)description;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexPath:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)numberOfObjects;
- (unint64_t)numberOfObjectsInSection:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTResultsController

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController allObjects](self, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Section: %@ (%lu)",  v3,  [v4 count]));

  return v5;
}

- (id)objectAtIndexPath:(id)a3
{
  return 0LL;
}

- (id)indexPathForObject:(id)a3
{
  return 0LL;
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  return 0LL;
}

- (id)allObjects
{
  return 0LL;
}

- (unint64_t)indexOfObject:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController indexPathForObject:](self, "indexPathForObject:", a3));
  v4 = v3;
  if (v3) {
    unint64_t v5 = (unint64_t)[v3 row];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  a3,  0LL));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController objectAtIndexPath:](self, "objectAtIndexPath:", v4));

  return v5;
}

- (unint64_t)numberOfObjects
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController allObjects](self, "allObjects"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (BOOL)hasObjects
{
  return -[MTResultsController numberOfObjects](self, "numberOfObjects") != 0;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (MTResultsControllerDelegate)delegate
{
  return (MTResultsControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end