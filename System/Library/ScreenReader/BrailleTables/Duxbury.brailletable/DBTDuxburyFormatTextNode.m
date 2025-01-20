@interface DBTDuxburyFormatTextNode
+ (id)LaTeXCommandForString:(id)a3;
- (DBTDuxburyFormatTextNode)initWithText:(id)a3;
- (NSString)text;
- (id)LaTeXRepresentation;
- (id)description;
@end

@implementation DBTDuxburyFormatTextNode

+ (id)LaTeXCommandForString:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __50__DBTDuxburyFormatTextNode_LaTeXCommandForString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = LaTeXCommandForString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&LaTeXCommandForString__onceToken, block);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)LaTeXCommandForString__Commands objectForKeyedSubscript:v4]);

  return v5;
}

void __50__DBTDuxburyFormatTextNode_LaTeXCommandForString___block_invoke(uint64_t a1)
{
  v1 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
  id v5 = (id)objc_claimAutoreleasedReturnValue(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v5 pathForResource:@"LaTeX" ofType:@"plist"]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](&OBJC_CLASS___NSDictionary, "dictionaryWithContentsOfFile:", v2));
  id v4 = (void *)LaTeXCommandForString__Commands;
  LaTeXCommandForString__Commands = v3;
}

- (DBTDuxburyFormatTextNode)initWithText:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DBTDuxburyFormatTextNode;
  id v3 = a3;
  id v4 = -[DBTDuxburyFormatNode init](&v8, "init");
  id v5 = (NSString *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  text = v4->_text;
  v4->_text = v5;

  return v4;
}

- (id)LaTeXRepresentation
{
  id v3 = [(id)objc_opt_class(self) LaTeXCommandForString:self->_text];
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue(v3);
  text = v4;
  if (!v4) {
    text = self->_text;
  }
  v6 = text;

  return v6;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DBTDuxburyFormatTextNode;
  id v3 = -[DBTDuxburyFormatTextNode description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ text:\"%@\"",  v4,  self->_text));

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end