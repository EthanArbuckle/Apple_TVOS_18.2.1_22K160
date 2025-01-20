@interface WorkflowRunnerFlow
- (_TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow)init;
@end

@implementation WorkflowRunnerFlow

- (_TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_workflowRunnerInput;
  outlined consume of SiriWorkflowRunnerInput( *(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_workflowRunnerInput),  *((void *)v3 + 1),  *((void *)v3 + 2),  *((void *)v3 + 3),  *((void **)v3 + 4),  *((void **)v3 + 5),  *((void **)v3 + 6),  *((void **)v3 + 7),  v3[64]);
  OUTLINED_FUNCTION_80_0(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_workflowRunner);
  OUTLINED_FUNCTION_80_0(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_deviceState);
  OUTLINED_FUNCTION_80_0(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_aceServiceInvoker);
  OUTLINED_FUNCTION_80_0(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_outputPublisher);
  OUTLINED_FUNCTION_152(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_dialogState);
  OUTLINED_FUNCTION_152(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_dialogTemplating);
  outlined destroy of AutoShortcutInvocation( (uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_state,  type metadata accessor for WorkflowRunnerFlow.State);
  OUTLINED_FUNCTION_80_0(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_locationProvider);
  OUTLINED_FUNCTION_80_0(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_dateTimeResolver);
  swift_release();
  OUTLINED_FUNCTION_152(OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_runVoiceCommandsCatWrapperSimple);
  swift_release();
}

@end