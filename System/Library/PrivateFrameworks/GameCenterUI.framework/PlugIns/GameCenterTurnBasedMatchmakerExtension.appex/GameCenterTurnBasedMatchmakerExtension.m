}

LABEL_17:
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___GKTurnBasedMatchmakerExtensionViewController;
    -[GKTurnBasedMatchmakerExtensionViewController messageFromClient:](&v16, "messageFromClient:", v4);
    goto LABEL_18;
  }

  if (v12 == 43)
  {
    -[GKTurnBasedMatchmakerExtensionViewController refreshMatches](self, "refreshMatches");
    goto LABEL_18;
  }

  if (v12 == 42)
  {
    -[GKTurnBasedMatchmakerExtensionViewController setShowExistingMatches:]( self,  "setShowExistingMatches:",  [v13 BOOLValue]);
    goto LABEL_18;
  }

  if (v12 != 28) {
    goto LABEL_17;
  }
  v15 = -[GKMatchRequest initWithInternalRepresentation:]( objc_alloc(&OBJC_CLASS___GKMatchRequest),  "initWithInternalRepresentation:",  v13);
  -[GKTurnBasedMatchmakerExtensionViewController setMatchRequest:](self, "setMatchRequest:", v15);

LABEL_18:
}

void sub_100002468(id a1, NSError *a2)
{
  v2 = a2;
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_100002A18(v4, v2);
  }
}

void sub_1000029A4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "error while decoding messageFromClient archive in GKTurnBasedMatchmakerExtensionViewController:%@",  (uint8_t *)&v2,  0xCu);
}

void sub_100002A18(void *a1, void *a2)
{
  uint64_t v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "error calling host - %@",  (uint8_t *)&v5,  0xCu);
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}