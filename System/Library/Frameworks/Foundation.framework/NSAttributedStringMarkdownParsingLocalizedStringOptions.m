@interface NSAttributedStringMarkdownParsingLocalizedStringOptions
@end

@implementation NSAttributedStringMarkdownParsingLocalizedStringOptions

uint64_t ___NSAttributedStringMarkdownParsingLocalizedStringOptions_block_invoke()
{
  qword_18C496570 = objc_alloc_init(&OBJC_CLASS___NSAttributedStringMarkdownParsingOptions);
  [(id)qword_18C496570 setAllowsExtendedAttributes:1];
  [(id)qword_18C496570 setInterpretedSyntax:2];
  [(id)qword_18C496570 setFailurePolicy:1];
  id v0 = -[NSArray firstObject]( -[NSBundle preferredLocalizations]( +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"),  "preferredLocalizations"),  "firstObject");
  return [(id)qword_18C496570 setLanguageCode:v0];
}

@end