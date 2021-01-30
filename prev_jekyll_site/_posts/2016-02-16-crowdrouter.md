---
layout: post
title: "CrowdRouter - A Developer framework for architecting tasks and workflows to the crowd"
description: ""
category: "Software Engineering"
tags: []
author: Sahar Jambi
published: true
excerpt: A new tool may help developers build crowdsourcing apps.

---

Mario Barrenechea, a PhD student studying under Ken Anderson, is investigating new techniques for designing and developing crowdwork systems during disaster response. As the focal point for his dissertation, Mario has constructed a new tool called the Crowdrouter that provides a familiar object-oriented abstraction for crowdsourcing. Using WorkFlows and Tasks as first-class entities, developers can design their crowd-based workflows at a versatile level of abstraction that can provide several benefits:

- WorkFlow Pipelining: Tasks can be strung together in a workflow to handle redirects, preventing in-the-middle requests so that order of task executions is preserved.

- User Authentication & Black/Whitelisting: Developer-defined functionality to authenticate users can be placed at the level of crowd-routing, workflow, or task.

- Crowd Statistics: The CrowdRouter instance you declare will be in charge of collecting task counts for GET and POST requests at the level of Task and WorkFlow.

More information can be found <a href="https://project-epic.github.io/crowdrouter"> here </a>.



