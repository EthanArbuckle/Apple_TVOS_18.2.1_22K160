@interface PSDESPlugin
+ (void)initialize;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (_DKKnowledgeQuerying)knowledgeStore;
- (void)setKnowledgeStore:(id)a3;
@end

@implementation PSDESPlugin

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___PSDESPlugin, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.PeopleSuggester.dodML", "Plugin");
    v3 = (void *)qword_19CD0;
    qword_19CD0 = (uint64_t)v2;
  }

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end