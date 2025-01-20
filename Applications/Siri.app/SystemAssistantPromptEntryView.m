@interface SystemAssistantPromptEntryView
- (_TtC4Siri30SystemAssistantPromptEntryView)initWithCoder:(id)a3;
- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3;
@end

@implementation SystemAssistantPromptEntryView

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SystemAssistantPromptEntryView();
  return -[SystemAssistantPromptEntryView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC4Siri30SystemAssistantPromptEntryView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SystemAssistantPromptEntryView();
  return -[SystemAssistantPromptEntryView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end