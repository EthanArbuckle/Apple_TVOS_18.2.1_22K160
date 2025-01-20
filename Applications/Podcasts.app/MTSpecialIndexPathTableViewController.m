@interface MTSpecialIndexPathTableViewController
- (BOOL)main_tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (NSFetchedResultsController)frc;
- (NSIndexPath)specialPath;
- (double)heightForSpecialPath;
- (double)main_tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)cellFor_specialPathBlock;
- (id)didSelect_specialPathBlock;
- (id)main_tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)offsetIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)translateIndexPath:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCellFor_specialPathBlock:(id)a3;
- (void)setDidSelect_specialPathBlock:(id)a3;
- (void)setFrc:(id)a3;
- (void)setHeightForSpecialPath:(double)a3;
- (void)setSpecialPath:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation MTSpecialIndexPathTableViewController

- (id)translateIndexPath:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 row] + 1;
  id v5 = [v3 section];

  return +[NSIndexPath indexPathForRow:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForRow:inSection:", v4, v5);
}

- (id)offsetIndexPath:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 row] - 1;
  id v5 = [v3 section];

  return +[NSIndexPath indexPathForRow:inSection:](&OBJC_CLASS___NSIndexPath, "indexPathForRow:inSection:", v4, v5);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController frc](self, "frc", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sections]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:a4]);
  v8 = (char *)[v7 numberOfObjects] + 1;

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController specialPath](self, "specialPath"));
  unsigned int v9 = [v6 isEqual:v8];

  if (v9)
  {
    v10 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[MTSpecialIndexPathTableViewController cellFor_specialPathBlock]( self,  "cellFor_specialPathBlock"));
    uint64_t v11 = ((uint64_t (**)(void, id))v10)[2](v10, v7);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    v10 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[MTSpecialIndexPathTableViewController offsetIndexPath:]( self,  "offsetIndexPath:",  v6));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[MTSpecialIndexPathTableViewController main_tableView:cellForRowAtIndexPath:]( self,  "main_tableView:cellForRowAtIndexPath:",  v7,  v10));
  }

  v13 = (void *)v12;

  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController specialPath](self, "specialPath"));
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    -[MTSpecialIndexPathTableViewController heightForSpecialPath](self, "heightForSpecialPath");
    double v11 = v10;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController offsetIndexPath:](self, "offsetIndexPath:", v7));
    -[MTSpecialIndexPathTableViewController main_tableView:heightForRowAtIndexPath:]( self,  "main_tableView:heightForRowAtIndexPath:",  v6,  v12);
    double v11 = v13;
  }

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", a3, a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"Choose Podcasts" value:&stru_100248948 table:0]);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController specialPath](self, "specialPath"));
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    unsigned int v9 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[MTSpecialIndexPathTableViewController didSelect_specialPathBlock]( self,  "didSelect_specialPathBlock"));
    v9[2]();
  }

  else
  {
    unsigned int v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController offsetIndexPath:](self, "offsetIndexPath:", v6));
    -[MTSpecialIndexPathTableViewController main_tableView:didSelectRowAtIndexPath:]( self,  "main_tableView:didSelectRowAtIndexPath:",  v10,  v9);
  }
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController specialPath](self, "specialPath"));
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) != 0)
  {
    BOOL v10 = 1;
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController offsetIndexPath:](self, "offsetIndexPath:", v7));
    BOOL v10 = -[MTSpecialIndexPathTableViewController main_tableView:canFocusRowAtIndexPath:]( self,  "main_tableView:canFocusRowAtIndexPath:",  v6,  v11);
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController specialPath](self, "specialPath"));
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController offsetIndexPath:](self, "offsetIndexPath:", v7));
    -[MTSpecialIndexPathTableViewController main_configureCell:forRowAtIndexPath:]( self,  "main_configureCell:forRowAtIndexPath:",  v11,  v10);
  }
}

- (id)main_tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0LL;
}

- (double)main_tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 0.0;
}

- (BOOL)main_tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (NSIndexPath)specialPath
{
  return self->_specialPath;
}

- (void)setSpecialPath:(id)a3
{
}

- (id)cellFor_specialPathBlock
{
  return self->_cellFor_specialPathBlock;
}

- (void)setCellFor_specialPathBlock:(id)a3
{
}

- (id)didSelect_specialPathBlock
{
  return self->_didSelect_specialPathBlock;
}

- (void)setDidSelect_specialPathBlock:(id)a3
{
}

- (double)heightForSpecialPath
{
  return self->_heightForSpecialPath;
}

- (void)setHeightForSpecialPath:(double)a3
{
  self->_heightForSpecialPath = a3;
}

- (void).cxx_destruct
{
}

@end