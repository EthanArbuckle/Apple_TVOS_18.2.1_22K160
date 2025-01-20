@interface FKAControlsViewController
- (BOOL)_canShowWhileLocked;
- (FKAActionManager)actionManager;
- (FKAControlsViewController)init;
- (id)_addButtonWithTitle:(id)a3 action:(SEL)a4 toView:(id)a5;
- (void)loadView;
- (void)setActionManager:(id)a3;
@end

@implementation FKAControlsViewController

- (FKAControlsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FKAControlsViewController;
  v2 = -[FKAControlsViewController init](&v5, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___FKAActionManager);
    -[FKAControlsViewController setActionManager:](v2, "setActionManager:", v3);
  }

  return v2;
}

- (void)loadView
{
  v67 = objc_opt_new(&OBJC_CLASS___UIView);
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[FKAControlsViewController _addButtonWithTitle:action:toView:]( self,  "_addButtonWithTitle:action:toView:",  @"Prev",  "moveToPreviousElement",  v67));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[FKAControlsViewController _addButtonWithTitle:action:toView:]( self,  "_addButtonWithTitle:action:toView:",  @"Next",  "moveToNextElement",  v67));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[FKAControlsViewController _addButtonWithTitle:action:toView:]( self,  "_addButtonWithTitle:action:toView:",  @"Tap",  "performDefaultAction",  v67));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[FKAControlsViewController _addButtonWithTitle:action:toView:]( self,  "_addButtonWithTitle:action:toView:",  @"Drill In",  "enterContainer",  v67));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[FKAControlsViewController _addButtonWithTitle:action:toView:]( self,  "_addButtonWithTitle:action:toView:",  @"Drill Out",  "exitContainer",  v67));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](v67, "safeAreaLayoutGuide"));
  v60 = v3;
  v66 = (void *)objc_claimAutoreleasedReturnValue([v3 heightAnchor]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToConstant:50.0]);
  v69[0] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue([v4 heightAnchor]);
  v63 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToConstant:50.0]);
  v69[1] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue([v5 heightAnchor]);
  v61 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToConstant:50.0]);
  v69[2] = v61;
  v59 = (void *)objc_claimAutoreleasedReturnValue([v6 heightAnchor]);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToConstant:50.0]);
  v69[3] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue([v7 heightAnchor]);
  v56 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToConstant:50.0]);
  v69[4] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v8 leadingAnchor]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
  v69[5] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v3 widthAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToConstant:50.0]);
  v69[6] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v8 bottomAnchor]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v48]);
  v69[7] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v8 trailingAnchor]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintEqualToAnchor:v45]);
  v69[8] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue([v4 widthAnchor]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToConstant:50.0]);
  v69[9] = v41;
  v49 = v4;
  v40 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v8 bottomAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v38]);
  v69[10] = v37;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v5 trailingAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v8 trailingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
  v69[11] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v5 widthAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToConstant:50.0]);
  v69[12] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 bottomAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v28]);
  v69[13] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v7 leadingAnchor]);
  v39 = v8;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v8 leadingAnchor]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v25]);
  v69[14] = v24;
  v42 = v7;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 widthAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToConstant:75.0]);
  v69[15] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v7 bottomAnchor]);
  v35 = v5;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 topAnchor]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v20]);
  v69[16] = v9;
  v10 = v6;
  v36 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 trailingAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 trailingAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v69[17] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 widthAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToConstant:75.0]);
  v69[18] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 bottomAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 topAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17]);
  v69[19] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 20LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v19);

  -[FKAControlsViewController setView:](self, "setView:", v67);
}

- (id)_addButtonWithTitle:(id)a3 action:(SEL)a4 toView:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  [v10 setBackgroundColor:v11];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setTitle:v8 forState:0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FKAControlsViewController actionManager](self, "actionManager"));
  [v10 addTarget:v12 action:a4 forControlEvents:64];

  [v9 addSubview:v10];
  return v10;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (FKAActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end