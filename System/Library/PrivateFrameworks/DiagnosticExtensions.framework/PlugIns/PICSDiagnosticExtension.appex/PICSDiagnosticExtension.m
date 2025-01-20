id sub_100003B18()
{
  void *v0;
  objc_super v2;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticExtensionFileFinderWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DiagnosticExtensionFileFinderWrapper()
{
  return objc_opt_self(&OBJC_CLASS____TtC23PICSDiagnosticExtension36DiagnosticExtensionFileFinderWrapper);
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_attachmentWithPathURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPathURL:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_getFileList(void *a1, const char *a2, ...)
{
  return _[a1 getFileList];
}