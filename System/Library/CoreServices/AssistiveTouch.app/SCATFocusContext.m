@interface SCATFocusContext
+ (SCATFocusContext)focusContextWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5 options:(int)a6;
+ (id)adHocFocusContext:(id)a3;
+ (id)focusContextAutomatic;
+ (id)focusContextSelf;
+ (id)menuOnlyFocusContext:(id)a3;
+ (int)_behaviorForElement:(id)a3 manager:(id)a4;
- (AXElementGroup)parentGroup;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isFirstInSequence;
- (BOOL)isGroup;
- (BOOL)shouldBeTrackedByZoom;
- (BOOL)shouldDeferFocusToNativeFocusElement;
- (BOOL)shouldPlayMenuSoundOnFocus;
- (BOOL)shouldResumeFromMenuDismissal;
- (BOOL)shouldSuppressAudioOutput;
- (BOOL)waitsForSelectAction;
- (SCATElement)element;
- (SCATElement)menuElement;
- (SCATElementManager)elementManager;
- (SCATFocusContext)initWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5;
- (id)_descriptionForSelectBehavior:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)elemLog;
- (int)selectBehavior;
- (unsigned)displayID;
- (void)setElement:(id)a3;
- (void)setElementManager:(id)a3;
- (void)setFirstInSequence:(BOOL)a3;
- (void)setMenuElement:(id)a3;
- (void)setSelectBehavior:(int)a3;
- (void)setShouldBeTrackedByZoom:(BOOL)a3;
- (void)setShouldDeferFocusToNativeFocusElement:(BOOL)a3;
- (void)setShouldPlayMenuSoundOnFocus:(BOOL)a3;
- (void)setShouldResumeFromMenuDismissal:(BOOL)a3;
- (void)suppressAudioOutput;
@end

@implementation SCATFocusContext

- (id)elemLog
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  char v4 = objc_opt_respondsToSelector(v3, "elemLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  v6 = v5;
  if ((v4 & 1) != 0) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 elemLog]);
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 description]);
  }
  v8 = (void *)v7;
  v9 = sub_100099394(-[SCATFocusContext selectBehavior](self, "selectBehavior"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ [%@]", v8, v10));

  return v11;
}

+ (id)focusContextSelf
{
  if (qword_1001577A8 != -1) {
    dispatch_once(&qword_1001577A8, &stru_100124A70);
  }
  return (id)qword_1001577A0;
}

+ (id)focusContextAutomatic
{
  if (qword_1001577B8 != -1) {
    dispatch_once(&qword_1001577B8, &stru_100124A90);
  }
  return (id)qword_1001577B0;
}

+ (SCATFocusContext)focusContextWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5 options:(int)a6
{
  char v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initWithElement:v11 elementManager:v10 selectBehavior:v7];

  if ((v6 & 4) != 0) {
    [v12 setShouldResumeFromMenuDismissal:1];
  }
  if ((v6 & 1) != 0) {
    [v12 setSelectBehavior:1];
  }
  return (SCATFocusContext *)v12;
}

+ (int)_behaviorForElement:(id)a3 manager:(id)a4
{
  id v4 = a3;
  if ([v4 isGroup])
  {
    int v5 = 3;
  }

  else
  {
    int v5 = 1;
    if (([v4 scatShouldActivateDirectly] & 1) == 0)
    {
      char v6 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      unsigned int v7 = [v6 shouldBypassShowingMenuForElement:v4];

      if (v7) {
        int v5 = 1;
      }
      else {
        int v5 = 2;
      }
    }
  }

  return v5;
}

+ (id)menuOnlyFocusContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SCATFocusContext);
  -[SCATFocusContext setMenuElement:](v4, "setMenuElement:", v3);

  return v4;
}

+ (id)adHocFocusContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SCATFocusContext);
  -[SCATFocusContext setElement:](v4, "setElement:", v3);

  -[SCATFocusContext setShouldBeTrackedByZoom:](v4, "setShouldBeTrackedByZoom:", 0LL);
  -[SCATFocusContext setSelectBehavior:](v4, "setSelectBehavior:", 2LL);
  return v4;
}

- (SCATFocusContext)initWithElement:(id)a3 elementManager:(id)a4 selectBehavior:(int)a5
{
  id v9 = a3;
  id v10 = (SCATElementManager *)a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SCATFocusContext;
  id v11 = -[SCATFocusContext init](&v19, "init");
  id v12 = v11;
  if (v11)
  {
    if (v9 && v10)
    {
      v11->_shouldBeTrackedByZoom = 1;
      objc_storeStrong((id *)&v11->_element, a3);
      if (!a5)
      {
        *(void *)&double v14 = objc_opt_class(v12, v13).n128_u64[0];
        a5 = objc_msgSend(v15, "_behaviorForElement:manager:", v12->_element, v12->_elementManager, v14);
      }

      v12->_selectBehavior = a5;
      v12->_elementManager = v10;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      char v17 = 1;
      _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v17,  @"unable to make focusContext, element:(%@) or manager:(%@) was nil. %@");

      id v12 = 0LL;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SCATFocusContext);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  -[SCATFocusContext setElement:](v4, "setElement:", v5);

  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext menuElement](self, "menuElement"));
  -[SCATFocusContext setMenuElement:](v4, "setMenuElement:", v6);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](self, "elementManager"));
  -[SCATFocusContext setElementManager:](v4, "setElementManager:", v7);

  -[SCATFocusContext setSelectBehavior:]( v4,  "setSelectBehavior:",  -[SCATFocusContext selectBehavior](self, "selectBehavior"));
  -[SCATFocusContext setFirstInSequence:]( v4,  "setFirstInSequence:",  -[SCATFocusContext isFirstInSequence](self, "isFirstInSequence"));
  -[SCATFocusContext setShouldResumeFromMenuDismissal:]( v4,  "setShouldResumeFromMenuDismissal:",  -[SCATFocusContext shouldResumeFromMenuDismissal](self, "shouldResumeFromMenuDismissal"));
  -[SCATFocusContext setShouldBeTrackedByZoom:]( v4,  "setShouldBeTrackedByZoom:",  -[SCATFocusContext shouldBeTrackedByZoom](self, "shouldBeTrackedByZoom"));
  return v4;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATFocusContext focusContextSelf](&OBJC_CLASS___SCATFocusContext, "focusContextSelf"));
  unsigned int v4 = -[SCATFocusContext isEqual:](self, "isEqual:", v3);

  if (v4)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](self, "elementManager"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATFocusContext _descriptionForSelectBehavior:]( self,  "_descriptionForSelectBehavior:",  -[SCATFocusContext selectBehavior](self, "selectBehavior")));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATFocusContext isFirstInSequence](self, "isFirstInSequence")));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext menuElement](self, "menuElement"));
    id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATFocusContext<%p>. SELF-SENTINAL. element:%@ manager:%@ selectBehavior:%@ isFirstInSequence:%@ menuElement:%@",  self,  v5,  v6,  v7,  v8,  v9);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SCATFocusContext focusContextAutomatic](&OBJC_CLASS___SCATFocusContext, "focusContextAutomatic"));
    unsigned int v12 = -[SCATFocusContext isEqual:](self, "isEqual:", v11);

    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](self, "elementManager"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATFocusContext _descriptionForSelectBehavior:]( self,  "_descriptionForSelectBehavior:",  -[SCATFocusContext selectBehavior](self, "selectBehavior")));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATFocusContext isFirstInSequence](self, "isFirstInSequence")));
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SCATFocusContext menuElement](self, "menuElement"));
    id v9 = (void *)v13;
    if (!v12)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATFocusContext shouldResumeFromMenuDismissal](self, "shouldResumeFromMenuDismissal")));
      double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATFocusContext<%p>. element:%@ manager:%@ selectBehavior:%@ isFirstInSequence:%@ menuElement:%@ resumesFromMenu:%@",  self,  v5,  v6,  v7,  v8,  v9,  v15));

      goto LABEL_7;
    }

    id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATFocusContext<%p>. AUTOMATIC-SENTINAL. element:%@ manager:%@ selectBehavior:%@ isFirstInSequence:%@ menuElement:%@",  self,  v5,  v6,  v7,  v8,  v13);
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_7:

  return v14;
}

- (id)_descriptionForSelectBehavior:(int)a3
{
  else {
    return *(&off_100124AB0 + a3 - 1);
  }
}

- (BOOL)waitsForSelectAction
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  unsigned __int8 v4 = [v3 scatShouldActivateDirectly];

  if ((v4 & 1) != 0) {
    return 0;
  }
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldSuppressAudioOutput
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  unsigned __int8 v4 = [v3 scatShouldSuppressAudioOutput];

  return (v4 & 1) != 0 || self->_shouldSuppressAudioOutput;
}

- (void)suppressAudioOutput
{
  self->_shouldSuppressAudioOutput = 1;
}

- (AXElementGroup)parentGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 parentGroup]);

  return (AXElementGroup *)v3;
}

- (BOOL)isGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  unsigned __int8 v3 = [v2 isGroup];

  return v3;
}

- (unsigned)displayID
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext menuElement](self, "menuElement"));

  if (v3) {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext menuElement](self, "menuElement"));
  }
  else {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  }
  BOOL v5 = v4;
  unsigned int v6 = [v4 scatDisplayId];

  return v6;
}

- (BOOL)shouldDeferFocusToNativeFocusElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  unsigned __int8 v3 = [v2 scatShouldAllowDeferFocusToNativeFocusedElement];

  return v3;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](self, "element"));
  [v5 scatFrame];
  v8.CGFloat x = x;
  v8.CGFloat y = y;
  BOOL v6 = CGRectContainsPoint(v9, v8);

  return v6;
}

- (BOOL)isFirstInSequence
{
  return self->_firstInSequence;
}

- (void)setFirstInSequence:(BOOL)a3
{
  self->_firstInSequence = a3;
}

- (SCATElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (int)selectBehavior
{
  return self->_selectBehavior;
}

- (void)setSelectBehavior:(int)a3
{
  self->_selectBehavior = a3;
}

- (SCATElementManager)elementManager
{
  return self->_elementManager;
}

- (void)setElementManager:(id)a3
{
  self->_elementManager = (SCATElementManager *)a3;
}

- (BOOL)shouldResumeFromMenuDismissal
{
  return self->_shouldResumeFromMenuDismissal;
}

- (void)setShouldResumeFromMenuDismissal:(BOOL)a3
{
  self->_shouldResumeFromMenuDismissal = a3;
}

- (SCATElement)menuElement
{
  return self->_menuElement;
}

- (void)setMenuElement:(id)a3
{
}

- (BOOL)shouldBeTrackedByZoom
{
  return self->_shouldBeTrackedByZoom;
}

- (void)setShouldBeTrackedByZoom:(BOOL)a3
{
  self->_shouldBeTrackedByZoom = a3;
}

- (void)setShouldDeferFocusToNativeFocusElement:(BOOL)a3
{
  self->_shouldDeferFocusToNativeFocusElement = a3;
}

- (BOOL)shouldPlayMenuSoundOnFocus
{
  return self->_shouldPlayMenuSoundOnFocus;
}

- (void)setShouldPlayMenuSoundOnFocus:(BOOL)a3
{
  self->_shouldPlayMenuSoundOnFocus = a3;
}

- (void).cxx_destruct
{
}

@end